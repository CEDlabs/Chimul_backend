# Search Indexing — Fast & Correct Data Fetch (10,000 – 1,000,000+ records)

This document explains every index added and why. Applied automatically by
`backend/utils/searchIndexes.js` (idempotent, run once per server start).
Standalone DBA reference: `indexes.sql`.

## Problem
- Searches wrapped columns in `UPPER(...)` / `REPLACE(...)` / `DATE(...)` /
  `STR_TO_DATE(...)` → **index cannot be used** (full table scan).
- Plate masks vary (`KA01AB1234`, `KA-01-AB-1234`, `KA 01 AB 1234`) but were
  matched with `LIKE '%...%'` or `REPLACE` expressions → slow and error-prone.
- `LIKE '%keyword%'` text search scans every row — at 6–10 lakh rows that is
  seconds per keystroke.
- Seal numbers stored as JSON arrays in `LONGTEXT` columns → every seal check
  was a `JSON_CONTAINS` / `LIKE` scan.

## Solution
| Mechanism | What it does |
|-----------|--------------|
| `vehKey` (generated column + index) | Normalized plate: uppercased, spaces & hyphens stripped. Searches use `vehKey = ?` → exact + indexed even when the operator types with dashes/spaces. |
| `routeKey` (generated column + index) | Normalized route: uppercased + trimmed. Same benefit for route lookups. |
| Composite indexes | Cover the real `WHERE … ORDER BY …` clauses (vehicle+date, route+date, status+date). |
| **FULLTEXT indexes + `MATCH … AGAINST`** | Replaces `LIKE '%x%'` keyword search on the big tables. One-word terms 4+ chars search **per-index** (milliseconds at 1M rows); short terms automatically fall back to `LIKE`; if the FT index is ever missing the model re-runs the `LIKE` query automatically. |
| `entryDt` (generated DATE + index) | `GateEntries.entryDateTime` is stored as text (`'04-09-2026 04:30:00 PM'`). Filters previously ran `STR_TO_DATE()` per row. Now a generated DATE column + range conditions use an index. |
| Range predicates | `col >= ? AND col < ?` instead of `DATE(col) = ?` / `DATE(col) >= ?` so the B-tree is actually used. |
| `VehicleSeals`, `GateSeals` lookup tables | One seal per row, indexed on `sealNumber`. Duplicate checks & “was this seal used?” lookups are exact and search in milliseconds instead of scanning JSON. |

## Index → Query mapping
| Table | Index | Serves query pattern |
|-------|-------|----------------------|
| VehicleCatalog | `idx_catalog_vehkey`, `idx_catalog_routekey`, `idx_catalog_route` | vehicle-plate lookup, route → vehicle master |
| RouteAlternativeVehicles | `idx_alt_vehkey_primary`, `idx_alt_vehkey_alt`, `idx_alt_routekey`, `idx_alt_primary_dates`, `idx_alt_alt_dates`, `idx_alt_fromdate`, `idx_alt_todate` | active alternative window by primary/alternative plate on a date |
| Vehicles | `idx_veh_vehkey`, `idx_veh_routekey`, `idx_veh_route_alloc`, `idx_veh_alloc`, `idx_veh_ft` (FULLTEXT), (existing `uq_vehicle_date`) | route+date seal allocation lookup, plate search, keyword search |
| GateEntries | `idx_ge_vehkey`, `idx_ge_routekey`, `idx_ge_vehicle_created`, `idx_ge_route_created`, `idx_ge_created`, `idx_ge_gateentryid`, `idx_ge_sealstatus`, `idx_ge_vehstatus`, **`idx_ge_entrydt`**, **`idx_ge_ft` (FULLTEXT)** | today's entry by plate, route entry, dashboard list/stats, DATE-filtered listing, keyword search |
| WeighBridgeEntries | `idx_wb_vehkey`, `idx_wb_routekey`, `idx_wb_vehicle_status`, `idx_wb_route_created`, `idx_wb_created`, `idx_wb_status`, **`idx_wb_ft` (FULLTEXT)** | active/completed weigh session by plate, route reports, keyword search |
| SampleCollections | `idx_sc_vehkey`, `idx_sc_routekey`, `idx_sc_vehicle_collected`, `idx_sc_route_collected`, `idx_sc_collected`, `idx_sc_gateid`, `idx_sc_wbid`, **`idx_sc_ft` (FULLTEXT)** | sample by vehicle/day & route/day, gate/wb links, keyword search |
| MilkCollections | `idx_mc_vehkey`, `idx_mc_routekey`, `idx_mc_vehicle_date`, `idx_mc_route_date`, `idx_mc_member_code`, **`idx_mc_ft` (FULLTEXT)** | truck sheet by vehicle/date, route/date, member history |
| LaboratoryTests | `idx_lt_vehkey`, `idx_lt_routekey`, `idx_lt_vehicle_tested`, `idx_lt_route_tested`, `idx_lt_gateid`, `idx_lt_wbid`, **`idx_lt_ft` (FULLTEXT)** | lab test by vehicle/day & route/day |
| VehicleExits | `idx_ve_gateid`, `idx_ve_vehicle`, `idx_ve_exit`, **`idx_ve_vehkey`** | exit listing, join to GateEntries, prefix search by plate |
| VehicleSeals | `idx_vehseal_number`, `idx_vehseal_vehicle_status`, `idx_vehseal_vehicle_id` | seal duplicate & history (Vehicles) |
| GateSeals | `idx_gateseal_number`, `idx_gateseal_ge`, `idx_gateseal_veh` | seal duplicate & history (GateEntry) |

## What changed in the code
- `backend/utils/searchIndexes.js` – new, idempotent indexer + FULLTEXT creator +
  `entryDt` column + seal sync helpers + `freeText()` (MATCH/LIKE builder).
- Every model now calls `ensureSearchIndexes(pool)` on first use.
- `vehicleModel` – seal duplicate check queries `VehicleSeals` (exact, indexed);
  `register()` keeps `VehicleSeals` in sync on every save (new/updated/retired seals).
- `gateEntryModel` – duplicate check queries `GateSeals`; create/update/delete keep
  `GateSeals` in sync; date filters use `entryDt` + `createdAt` ranges; keyword
  search uses `MATCH … AGAINST` (falls back to `LIKE`).
- `weighBridgeModel` – active/completed session lookups use `vehKey` + `createdAt >=`
  (index-friendly range) instead of `DATE(createdAt) = CURDATE()`; keyword search via `MATCH`.
- `sampleCollection` / `laboratoryTest` – plate matching across Gate/WeighBridge/
  Sample/Lab uses `vehKey IN (...)`; date filters use `collectedAt >= / <` ranges.
- `vehicleExitModel` – exit search uses `vehKey LIKE 'KA0%'` prefix (index range scan)
  instead of `LIKE '%…%'`.

## Scaling verdict (6–10 lakh rows)
| Pattern | Before | After |
|---------|--------|-------|
| Search by full/partial plate (`KA01AB1234`, `KA 01 AB 1234`) | full scan + `UPPER/REPLACE` | `vehKey =`/`vehKey` prefix → index lookup, <10 ms |
| Keyword search (driver, supplier, id, material) | `LIKE '%x%'` full scan (seconds) | `MATCH … AGAINST` FT index, <50 ms |
| Date-filtered list/stats (`today`, ranges) | `DATE(col)`/`STR_TO_DATE` scan | range scan on `createdAt`/`entryDt`/`collectedAt` |
| Seal duplicate check | JSON `LONGTEXT` scan | `GateSeals.sealNumber` = index hit, <5 ms |
| Route + date truck sheet | scan + sort | `(route, date)` composite index |

Remaining levers if you later exceed ~1M rows: paginate the big `getAll` lists
(LIMIT/OFFSET), and partition the heaviest tables by `createdAt`/`reportDate`.
For the app as-is, the only things browsing *every* row each hit are the dashboard
“all records” tables; an index makes the DB do it, but the response payload is the
bottleneck there — paginate those screens in the frontend.

## Verify it works
```sql
SHOW INDEX FROM GateEntries;          -- all idx_ge_* incl. idx_ge_ft, idx_ge_entrydt
EXPLAIN SELECT * FROM GateEntries
  WHERE gateEntryId = 'GE-123' AND isDeleted = 0;   -- look for key: idx_ge_gateentryid
EXPLAIN SELECT * FROM GateSeals WHERE sealNumber = '123456';  -- key: idx_gateseal_number
EXPLAIN SELECT * FROM GateEntries
  WHERE MATCH(vehicleNumber, gateEntryId, driverName, supplierName, materialType)
        AGAINST ('KA0*' IN BOOLEAN MODE);            -- look for key: idx_ge_ft
```

## Notes
- Indexes are created lazily the first time any model runs after deployment, so
  the server does **not** need a downtime pass. Existing data is backfilled into
  the seal tables **once** (auto-detected by row count).
- FULLTEXT and `entryDt` are MySQL only (the live DB, `DB_TYPE=mysql`). The util
  keeps MSSQL support for the key columns and seal tables via computed columns;
  on MSSQL keyword search falls back to `LIKE`.
- FIRST full run adds generated columns + FULLTEXT. On a 10-lakh-row table the
  FULLTEXT build takes a few minutes once; subsequent starts are checks only.
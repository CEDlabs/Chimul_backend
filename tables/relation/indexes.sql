-- =====================================================================
--  CHIMUL MILK PLANT – SEARCH INDEX MIGRATION (MySQL 8)
--  =====================================================================
--  Purpose : make searches on 1,000 – 1,000,000+ records fast by covering
--            every lookup pattern with an index, and correct by matching
--            on normalized keys instead of fuzzy LIKE / JSON scans.
--
--  Applied automatically by backend/utils/searchIndexes.js on server
--  start (idempotent). This file is the standalone DBA reference.
-- =====================================================================

-- =====================================================================
-- 1) NORMALIZED SEARCH KEY COLUMNS (generated columns + indexes)
--    vehKey   = plate with spaces/hyphens removed, uppercased
--               e.g. "KA 01 AB 1234" / "KA-01-AB-1234"  →  "KA01AB1234"
--    routeKey = route name uppercased + trimmed
--    Searches compare vehKey = ? / routeKey = ? so the index is used.
-- =====================================================================

ALTER TABLE VehicleCatalog
  ADD COLUMN vehKey VARCHAR(60) GENERATED ALWAYS AS (UPPER(REPLACE(REPLACE(vehicleNumber,' ',''),'-',''))) VIRTUAL,
  ADD COLUMN routeKey VARCHAR(100) GENERATED ALWAYS AS (UPPER(TRIM(routeName))) VIRTUAL;
ALTER TABLE VehicleCatalog ADD KEY idx_catalog_vehkey (vehKey);
ALTER TABLE VehicleCatalog ADD KEY idx_catalog_routekey (routeKey);

ALTER TABLE Vehicles
  ADD COLUMN vehKey VARCHAR(60) GENERATED ALWAYS AS (UPPER(REPLACE(REPLACE(vehicleNumber,' ',''),'-',''))) VIRTUAL,
  ADD COLUMN routeKey VARCHAR(100) GENERATED ALWAYS AS (UPPER(TRIM(routeName))) VIRTUAL;
ALTER TABLE Vehicles ADD KEY idx_veh_vehkey (vehKey);
ALTER TABLE Vehicles ADD KEY idx_veh_routekey (routeKey);

ALTER TABLE RouteAlternativeVehicles
  ADD COLUMN vehKeyPrimary VARCHAR(60) GENERATED ALWAYS AS (UPPER(REPLACE(REPLACE(primaryVehicleNumber,' ',''),'-',''))) VIRTUAL,
  ADD COLUMN vehKeyAlt VARCHAR(60) GENERATED ALWAYS AS (UPPER(REPLACE(REPLACE(alternativeVehicleNumber,' ',''),'-',''))) VIRTUAL,
  ADD COLUMN routeKey VARCHAR(100) GENERATED ALWAYS AS (UPPER(TRIM(routeName))) VIRTUAL;
ALTER TABLE RouteAlternativeVehicles ADD KEY idx_alt_vehkey_primary (vehKeyPrimary);
ALTER TABLE RouteAlternativeVehicles ADD KEY idx_alt_vehkey_alt (vehKeyAlt);
ALTER TABLE RouteAlternativeVehicles ADD KEY idx_alt_routekey (routeKey);

ALTER TABLE GateEntries
  ADD COLUMN vehKey VARCHAR(60) GENERATED ALWAYS AS (UPPER(REPLACE(REPLACE(vehicleNumber,' ',''),'-',''))) VIRTUAL,
  ADD COLUMN routeKey VARCHAR(100) GENERATED ALWAYS AS (UPPER(TRIM(routeName))) VIRTUAL;
ALTER TABLE GateEntries ADD KEY idx_ge_vehkey (vehKey);
ALTER TABLE GateEntries ADD KEY idx_ge_routekey (routeKey);

ALTER TABLE WeighBridgeEntries
  ADD COLUMN vehKey VARCHAR(60) GENERATED ALWAYS AS (UPPER(REPLACE(REPLACE(vehicleNumber,' ',''),'-',''))) VIRTUAL,
  ADD COLUMN routeKey VARCHAR(100) GENERATED ALWAYS AS (UPPER(TRIM(routeName))) VIRTUAL;
ALTER TABLE WeighBridgeEntries ADD KEY idx_wb_vehkey (vehKey);
ALTER TABLE WeighBridgeEntries ADD KEY idx_wb_routekey (routeKey);

ALTER TABLE SampleCollections
  ADD COLUMN vehKey VARCHAR(60) GENERATED ALWAYS AS (UPPER(REPLACE(REPLACE(vehicleNumber,' ',''),'-',''))) VIRTUAL,
  ADD COLUMN routeKey VARCHAR(100) GENERATED ALWAYS AS (UPPER(TRIM(routeNo))) VIRTUAL;
ALTER TABLE SampleCollections ADD KEY idx_sc_vehkey (vehKey);
ALTER TABLE SampleCollections ADD KEY idx_sc_routekey (routeKey);

ALTER TABLE MilkCollections
  ADD COLUMN vehKey VARCHAR(60) GENERATED ALWAYS AS (UPPER(REPLACE(REPLACE(vehicleNumber,' ',''),'-',''))) VIRTUAL,
  ADD COLUMN routeKey VARCHAR(100) GENERATED ALWAYS AS (UPPER(TRIM(routeNo))) VIRTUAL;
ALTER TABLE MilkCollections ADD KEY idx_mc_vehkey (vehKey);
ALTER TABLE MilkCollections ADD KEY idx_mc_routekey (routeKey);

ALTER TABLE LaboratoryTests
  ADD COLUMN vehKey VARCHAR(60) GENERATED ALWAYS AS (UPPER(REPLACE(REPLACE(vehicleNumber,' ',''),'-',''))) VIRTUAL,
  ADD COLUMN routeKey VARCHAR(100) GENERATED ALWAYS AS (UPPER(TRIM(routeNo))) VIRTUAL;
ALTER TABLE LaboratoryTests ADD KEY idx_lt_vehkey (vehKey);
ALTER TABLE LaboratoryTests ADD KEY idx_lt_routekey (routeKey);

-- =====================================================================
-- 2) COMPOSITE B-TREE INDEXES (match real WHERE + ORDER BY clauses)
-- =====================================================================

-- VehicleCatalog : route dropdown / route allocation
--   (idx_catalog_route already exists in model)

-- RouteAlternativeVehicles : active-window lookup by primary / alternative plate
ALTER TABLE RouteAlternativeVehicles ADD KEY idx_alt_primary_dates (primaryVehicleNumber, fromDate, toDate);
ALTER TABLE RouteAlternativeVehicles ADD KEY idx_alt_alt_dates (alternativeVehicleNumber, fromDate, toDate);
ALTER TABLE RouteAlternativeVehicles ADD KEY idx_alt_fromdate (fromDate);
ALTER TABLE RouteAlternativeVehicles ADD KEY idx_alt_todate (toDate);

-- Vehicles : route + date allocation lookups
ALTER TABLE Vehicles ADD KEY idx_veh_route_alloc (routeName, allocationDate);
ALTER TABLE Vehicles ADD KEY idx_veh_alloc (allocationDate);

-- GateEntries : vehicle/day, route/day, dashboard order, seal status list
ALTER TABLE GateEntries ADD KEY idx_ge_vehicle_created (vehicleNumber, createdAt);
ALTER TABLE GateEntries ADD KEY idx_ge_route_created (routeName, createdAt);
ALTER TABLE GateEntries ADD KEY idx_ge_created (createdAt, id);
ALTER TABLE GateEntries ADD KEY idx_ge_gateentryid (gateEntryId);
ALTER TABLE GateEntries ADD KEY idx_ge_sealstatus (sealStatus);
ALTER TABLE GateEntries ADD KEY idx_ge_vehstatus (vehicleStatus);

-- WeighBridgeEntries : active / completed session per vehicle, route reports
ALTER TABLE WeighBridgeEntries ADD KEY idx_wb_vehicle_status (vehicleNumber, status, createdAt);
ALTER TABLE WeighBridgeEntries ADD KEY idx_wb_route_created (routeName, createdAt);
ALTER TABLE WeighBridgeEntries ADD KEY idx_wb_created (createdAt, id);
ALTER TABLE WeighBridgeEntries ADD KEY idx_wb_status (status);

-- SampleCollections : vehicle/day, route/day, gate/wb links
ALTER TABLE SampleCollections ADD KEY idx_sc_vehicle_collected (vehicleNumber, collectedAt);
ALTER TABLE SampleCollections ADD KEY idx_sc_route_collected (routeNo, collectedAt);
ALTER TABLE SampleCollections ADD KEY idx_sc_collected (collectedAt, id);
ALTER TABLE SampleCollections ADD KEY idx_sc_gateid (gateEntryId);
ALTER TABLE SampleCollections ADD KEY idx_sc_wbid (wbEntryId);

-- MilkCollections (Truck Sheet) : report/vehicle/route/member queries
ALTER TABLE MilkCollections ADD KEY idx_mc_vehicle_date (vehicleNumber, reportDate);
ALTER TABLE MilkCollections ADD KEY idx_mc_route_date (routeNo, reportDate);
ALTER TABLE MilkCollections ADD KEY idx_mc_member_code (memberCode, reportDate);

-- LaboratoryTests : vehicle/day, route/day, gate/wb links
ALTER TABLE LaboratoryTests ADD KEY idx_lt_vehicle_tested (vehicleNumber, testedAt);
ALTER TABLE LaboratoryTests ADD KEY idx_lt_route_tested (routeNo, testedAt);
ALTER TABLE LaboratoryTests ADD KEY idx_lt_gateid (gateEntryId);
ALTER TABLE LaboratoryTests ADD KEY idx_lt_wbid (wbEntryId);

-- VehicleExits : vehKey for prefix search + join + exit listing
ALTER TABLE VehicleExits
  ADD COLUMN vehKey VARCHAR(60) GENERATED ALWAYS AS (UPPER(REPLACE(REPLACE(vehicleNumber,' ',''),'-',''))) VIRTUAL;
ALTER TABLE VehicleExits ADD KEY idx_ve_vehkey (vehKey);
ALTER TABLE VehicleExits ADD KEY idx_ve_gateid (gateEntryId);
ALTER TABLE VehicleExits ADD KEY idx_ve_vehicle (vehicleNumber);
ALTER TABLE VehicleExits ADD KEY idx_ve_exit (exitDateTime, id);

-- =====================================================================
-- 2b) GENERATED DATE COLUMN FOR GateEntries (date-range filters)
--     entryDateTime is DATETIME, so use DATE() directly.
--     entryDt is a generated DATE column with its own index → date filters are range scans.
-- =====================================================================
ALTER TABLE GateEntries
  ADD COLUMN entryDt DATE GENERATED ALWAYS AS (DATE(entryDateTime)) VIRTUAL;
ALTER TABLE GateEntries ADD KEY idx_ge_entrydt (entryDt);

-- =====================================================================
-- 2c) FULLTEXT INDEXES – replace LIKE '%x%' keyword search.
--     MATCH ... AGAINST ('term*' IN BOOLEAN MODE) uses these instead of
--     scanning the whole table at 6–10 lakh rows. InnoDB, MySQL only.
-- =====================================================================
ALTER TABLE GateEntries         ADD FULLTEXT idx_ge_ft (vehicleNumber, gateEntryId, driverName, supplierName, materialType);
ALTER TABLE WeighBridgeEntries  ADD FULLTEXT idx_wb_ft (vehicleNumber, wbEntryId, driverName, supplierCode, materialType, routeName);
ALTER TABLE Vehicles            ADD FULLTEXT idx_veh_ft (vehicleNumber, ownerName, phoneNumber, driverName);
ALTER TABLE SampleCollections   ADD FULLTEXT idx_sc_ft (vehicleNumber, sampleId, sampleCollectedBy, materialType, vehicleRoute);
ALTER TABLE MilkCollections     ADD FULLTEXT idx_mc_ft (vehicleNumber, reportId, memberCode, memberName, routeNo);
ALTER TABLE LaboratoryTests     ADD FULLTEXT idx_lt_ft (vehicleNumber, labTestId, routeNo, testedByName, milkType);

-- =====================================================================
-- 3) SEAL LOOKUP TABLES
--    Seal numbers are JSON arrays in the main tables → slow to search.
--    These tables store ONE SEAL PER ROW, fully indexed, so duplicate
--    checks and history searches are EXACT + FAST.
-- =====================================================================

-- Vehicles.sealNumbers → ACTIVE rows, retiredSerials → RETIRED rows
CREATE TABLE IF NOT EXISTS VehicleSeals (
    id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    vehicleId INT NOT NULL,
    vehicleNumber VARCHAR(20) NOT NULL,
    sealNumber VARCHAR(30) NOT NULL,
    sealStatus VARCHAR(20) NOT NULL DEFAULT 'ACTIVE',   -- ACTIVE | RETIRED
    allocationDate DATE NULL,
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    KEY idx_vehseal_number (sealNumber),
    KEY idx_vehseal_vehicle_status (vehicleNumber, sealStatus, allocationDate),
    KEY idx_vehseal_vehicle_id (vehicleId)
);

-- GateEntries.sealNumbers → one row per seal
CREATE TABLE IF NOT EXISTS GateSeals (
    id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    gateEntryId VARCHAR(50) NOT NULL,
    vehicleNumber VARCHAR(20) NOT NULL,
    sealNumber VARCHAR(30) NOT NULL,
    entryDateTime DATETIME NULL,
    isDeleted TINYINT(1) NOT NULL DEFAULT 0,
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    KEY idx_gateseal_number (sealNumber),
    KEY idx_gateseal_ge (gateEntryId),
    KEY idx_gateseal_veh (vehicleNumber, gateEntryId)
);

-- =====================================================================
-- 4) ONE-TIME BACKFILL FROM EXISTING JSON DATA (MySQL JSON_TABLE)
-- =====================================================================
INSERT INTO VehicleSeals (vehicleId, vehicleNumber, sealNumber, sealStatus, allocationDate)
SELECT v.id, v.vehicleNumber, jt.seal, 'ACTIVE', v.allocationDate
FROM Vehicles v
JOIN JSON_TABLE(IFNULL(v.serialNumbers, '[]'), '$[*]' COLUMNS (seal VARCHAR(30) PATH '$')) jt
WHERE (v.isDeleted IS NULL OR v.isDeleted = 0)
  AND jt.seal IS NOT NULL AND jt.seal <> '';

INSERT INTO VehicleSeals (vehicleId, vehicleNumber, sealNumber, sealStatus, allocationDate)
SELECT v.id, v.vehicleNumber, jt.seal, 'RETIRED', v.allocationDate
FROM Vehicles v
JOIN JSON_TABLE(IFNULL(v.retiredSerials, '[]'), '$[*]' COLUMNS (seal VARCHAR(30) PATH '$')) jt
WHERE (v.isDeleted IS NULL OR v.isDeleted = 0)
  AND jt.seal IS NOT NULL AND jt.seal <> '';

INSERT INTO GateSeals (gateEntryId, vehicleNumber, sealNumber, entryDateTime)
SELECT ge.gateEntryId, ge.vehicleNumber, jt.seal, ge.entryDateTime
FROM GateEntries ge
JOIN JSON_TABLE(IFNULL(ge.sealNumbers, '[]'), '$[*]' COLUMNS (seal VARCHAR(30) PATH '$')) jt
WHERE (ge.isDeleted IS NULL OR ge.isDeleted = 0)
  AND jt.seal IS NOT NULL AND jt.seal <> '';

-- =====================================================================
-- VERIFICATION (should all return the index name, not NULL)
--   SHOW INDEX FROM GateEntries;         -- idx_ge_ft, idx_ge_entrydt present
--   EXPLAIN SELECT ... WHERE gateEntryId = 'GE-123' AND isDeleted = 0;
--     → key: idx_ge_gateentryid
--   EXPLAIN SELECT * FROM GateSeals WHERE sealNumber = '123456';
--     → key: idx_gateseal_number
--   EXPLAIN SELECT * FROM GateEntries
--     WHERE MATCH(vehicleNumber, gateEntryId, driverName, supplierName,
--                 materialType) AGAINST ('KA0*' IN BOOLEAN MODE);
--     → key: idx_ge_ft   (FULLTEXT index used)
--   EXPLAIN SELECT * FROM GateEntries
--     WHERE createdAt >= '2026-09-01T00:00:00' AND createdAt < '2026-09-02T00:00:00'
--     → key: idx_ge_created
-- =====================================================================
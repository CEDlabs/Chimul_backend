# CHIMUL MILK PLANT - ER DIAGRAM (Graphical Representation)

> This Mermaid diagram renders graphically in GitHub, GitLab, VS Code (with Mermaid
> extension), Typora, and most Markdown viewers. It shows every table across the
> 4 stages and the **Primary Key (PK) <-> Foreign Key (FK)** relationships.

```mermaid
erDiagram
    %% =====================================================================
    %% STAGE 1 : LAB VEHICLE MASTER (Master - Reference data)
    %% =====================================================================
    VehicleCatalog ||--o{ RouteAlternativeVehicles : "primaryVehicleNumber"
    VehicleCatalog ||--o{ RouteAlternativeVehicles : "alternativeVehicleNumber"
    VehicleCatalog ||--o{ Vehicles : "vehicleNumber"
    VehicleCatalog ||--o{ GateEntries : "vehicleNumber"
    Routes ||--o{ VehicleCatalog : "routeName"

    %% =====================================================================
    %% STAGE 2 : GATE ENTRY (Uses Stage 1 master)
    %% =====================================================================
    GateEntries ||--o{ WeighBridgeEntries : "vehicleNumber, routeName"
    %% GateEntries data feeds Weightment via shared vehicleNumber / routeName

    %% =====================================================================
    %% STAGE 3 : WEIGHMENT (Uses Gate + Master)
    %% =====================================================================
    WeighBridgeEntries ||--o{ SampleCollections : "wbEntryId"
    WeighBridgeEntries ||--o{ LaboratoryTests : "wbEntryId"

    %% =====================================================================
    %% STAGE 4 : DOWNSTREAM (Uses Weighment + Master + Gate)
    %% =====================================================================
    GateEntries ||--o{ SampleCollections : "gateEntryId"
    GateEntries ||--o{ LaboratoryTests : "gateEntryId"
    SampleCollections ||--o{ SampleCompartmentTests : "sampleId"
    LaboratoryTests ||--o{ LaboratoryCompartmentTests : "labTestId"

    %% =====================================================================
    %% ENTITY / TABLE DEFINITIONS
    %% =====================================================================
    Routes {
        INT id PK
        VARCHAR routeName UK "natural key, referenced everywhere"
        VARCHAR taluk
    }

    VehicleCatalog {
        INT id PK
        VARCHAR vehicleNumber UK "LAB VEHICLE MASTER"
        VARCHAR routeName FK
        VARCHAR vehicleType
    }

    RouteAlternativeVehicles {
        INT id PK
        VARCHAR routeName FK
        VARCHAR primaryVehicleNumber FK
        VARCHAR alternativeVehicleNumber FK
        DATE fromDate
        DATE toDate
    }

    Vehicles {
        INT id PK
        VARCHAR vehicleNumber FK
        VARCHAR routeName FK
        DATE allocationDate
        JSON serialNumbers "allocated seals"
        JSON retiredSerials "replaced seals"
    }

    GateEntries {
        INT id PK
        VARCHAR gateEntryId UK
        VARCHAR vehicleNumber FK
        VARCHAR routeName FK
        VARCHAR sealStatus
        JSON sealNumbers
        DATETIME entryDateTime
    }

    WeighBridgeEntries {
        INT id PK
        VARCHAR wbEntryId UK
        VARCHAR vehicleNumber FK
        VARCHAR routeName FK
        DECIMAL grossWeight
        DECIMAL tareWeight
        DECIMAL netWeight
    }

    SampleCollections {
        INT id PK
        VARCHAR sampleId UK
        VARCHAR vehicleNumber FK
        VARCHAR gateEntryId FK
        VARCHAR wbEntryId FK
        VARCHAR routeNo FK
        VARCHAR temperature
        VARCHAR quantity
    }

    SampleCompartmentTests {
        INT id PK
        VARCHAR sampleId FK
        VARCHAR compartment
        VARCHAR foreignMatter
        VARCHAR flavour
        VARCHAR cob
    }

    MilkCollections {
        INT id PK
        VARCHAR reportId UK "MC-date-vehno"
        VARCHAR vehicleNumber FK
        VARCHAR routeNo FK
        DECIMAL eveningKg
        DECIMAL morningKg
        DECIMAL eveningFat
        DECIMAL eveningSNF
        DECIMAL morningFat
        DECIMAL morningSNF
    }

    LaboratoryTests {
        INT id PK
        VARCHAR labTestId UK
        VARCHAR vehicleNumber FK
        VARCHAR routeNo FK
        VARCHAR gateEntryId FK
        VARCHAR wbEntryId FK
        VARCHAR snf
        VARCHAR kgFat
        VARCHAR kgSnf
    }

    LaboratoryCompartmentTests {
        INT id PK
        VARCHAR labTestId FK
        VARCHAR compartment
        VARCHAR temperature
        VARCHAR fat
        VARCHAR snf
    }
```

---

## Flow Legend
| Stage | Module | Source of truth / common key |
|------|--------|------------------------------|
| 1 | Lab Vehicle Master → Route Alternative → Vehicles | `vehicleNumber` + `routeName` |
| 2 | Gate Entry | Uses Stage 1: `vehicleNumber` + `routeName` |
| 3 | Weighment (WeighBridge) | Uses Gate: `vehicleNumber` + `routeName` |
| 4 | Sample Collection / Truck Sheet / Lab Calculation | Uses Weighment + Master + Gate: `wbEntryId` / `gateEntryId` / `vehicleNumber` |

## Key Facts
- **`Routes.routeName`** = the shared route key across all 8 modules.
- **`VehicleCatalog.vehicleNumber`** = the master vehicle key (lab vehicle master data).
- **`GateEntries.gateEntryId`** & **`WeighBridgeEntries.wbEntryId`** = business keys that
  stitch the transactional chain: Gate → Weighment → Sample / Truck / Lab.
- Alternative vehicles (`RouteAlternativeVehicles`) are expanded into every search so both
  the primary and alternative plate resolve correctly in Gate, Weighment, Sample, Truck Sheet
  and Lab.

# Relational Table Mapping — Chimul Milk Plant

This folder documents how every module's tables map to each other through
**Primary Keys (PK)** and **Foreign Keys (FK)**, following the 4-stage data flow.

## Data Flow (Common Data Mapping)

```
[1] Lab Vehicle Master  (VehicleCatalog)
      ├───> Route Alternative Vehicles  (RouteAlternativeVehicles)   key: vehicleNumber + routeName
      └───> Vehicles                    (daily seals)                key: vehicleNumber + routeName
                │
[2] Gate Entry  (GateEntries)
      │   uses STAGE 1 master data          key: vehicleNumber + routeName
      ▼
[3] Weightment / WeighBridge  (WeighBridgeEntries)
      │   uses STAGE 2 gate data            key: vehicleNumber + routeName
      ▼
[4] Sample Collection (SampleCollections + SampleCompartmentTests)
    │  Truck Sheet     (MilkCollections)
    │  Lab Calculation (LaboratoryTests + LaboratoryCompartmentTests)
        uses STAGE 3 weighment + STAGE 1 master   key: wbEntryId / gateEntryId / vehicleNumber + routeName
```

## Files
| File | Description |
|------|-------------|
| `relations.sql` | Full relational table DDL with PK / FK / unique keys & relationship summary |
| `er_diagram.md` | Graphical ER diagram (Mermaid) — renders in GitHub / VS Code / Typora |
| `er_diagram.html` | Graphical ER diagram — **open in a browser**, self-contained |
| `relation_map.json` | Machine-readable table ↔ key mapping (JSON) |

## Key Mapping Summary
| Referenced PK / Natural Key | Referencing FK columns |
|---|---|
| `Routes.routeName` | VehicleCatalog.routeName, RouteAlternativeVehicles.routeName, Vehicles.routeName, GateEntries.routeName, WeighBridgeEntries.routeName, SampleCollections.routeNo, MilkCollections.routeNo, LaboratoryTests.routeNo |
| `VehicleCatalog.vehicleNumber` | RouteAlternativeVehicles.primaryVehicleNumber, RouteAlternativeVehicles.alternativeVehicleNumber, Vehicles.vehicleNumber, GateEntries.vehicleNumber, WeighBridgeEntries.vehicleNumber, SampleCollections.vehicleNumber, MilkCollections.vehicleNumber, LaboratoryTests.vehicleNumber |
| `GateEntries.gateEntryId` | SampleCollections.gateEntryId, LaboratoryTests.gateEntryId |
| `WeighBridgeEntries.wbEntryId` | SampleCollections.wbEntryId, LaboratoryTests.wbEntryId |
| `SampleCollections.sampleId` | SampleCompartmentTests.sampleId |
| `LaboratoryTests.labTestId` | LaboratoryCompartmentTests.labTestId |

## To View the Graphical Diagram
- **Open `er_diagram.html` in a web browser** — the ER diagram renders immediately (Mermaid loads from CDN).
- Or open `er_diagram.md` on GitHub / GitLab / VS Code with a Mermaid extension.
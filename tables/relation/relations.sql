-- =====================================================================
--  CHIMUL MILK PLANT - RELATIONAL TABLE & KEY MAPPING
--  =====================================================================
--  STAGE FLOW (Common Data Mapping)
--  ---------------------------------------------------------------------
--  STAGE 1 : Lab Vehicle Master  -->  Route Alternative Vehicles  -->  Vehicles (master + seals)
--            common key : vehicleNumber  +  routeName
--  STAGE 2 : Gate Entry  (Gateway.  Uses STAGE 1 master data)
--            common key : vehicleNumber  +  routeName
--  STAGE 3 : Weighment / WeighBridge (Uses STAGE 2 gate data)
--            common key : vehicleNumber  +  routeName
--  STAGE 4 : Sample Collection  |  Trucksheet (MilkCollection)  |  Lab Calculation (Lab Test)
--            (Uses STAGE 3 weighment + STAGE 1 master data)
--            common key : vehicleNumber  +  routeName  (+ gateEntryId / wbEntryId / sampleId)
--
--  Every stage is joined by the SHARED BUSINESS KEYS:
--      vehicleNumber  (VARCHAR, uppercased registration no.)
--      routeName      (VARCHAR, route code e.g. "7B")
--  Primary physical keys (id) kept on each master table for referential
--  integrity; the natural/foreign keys shown below link the tables.
-- =====================================================================

-- =====================================================================
-- STAGE 1 - MASTER / REFERENCE TABLES
-- =====================================================================

-- 1.1) ROUTES (Master route list)
CREATE TABLE Routes (
    id INT AUTO_INCREMENT PRIMARY KEY,        -- PK
    routeName VARCHAR(50) NOT NULL UNIQUE,    -- NATURAL KEY
    taluk VARCHAR(100) NULL,
    description VARCHAR(255) NULL,
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    isDeleted TINYINT(1) DEFAULT 0,
    deletedAt DATETIME NULL,
    deletedBy VARCHAR(100) NULL,
    deletedById VARCHAR(50) NULL
);
-- Routes.routeName  <-- referenced by VehicleCatalog.routeName, RouteAlternativeVehicles.routeName,
--                       Vehicles.routeName, GateEntries.routeName, WeighBridgeEntries.routeName,
--                       SampleCollections.routeNo, MilkCollections.routeNo, LaboratoryTests.routeNo


-- 1.2) VehicleCatalog (LAB VEHICLE MASTER - single source of truth for fleet + route)
CREATE TABLE VehicleCatalog (
    id INT AUTO_INCREMENT PRIMARY KEY,                -- PK
    vehicleNumber VARCHAR(20) NOT NULL UNIQUE,        -- NATURAL KEY (used as FK everywhere)
    vehicleType VARCHAR(50) NULL,
    routeName VARCHAR(100) NULL,                      -- FK -> Routes.routeName
    remarks VARCHAR(255) NULL,
    createdByName VARCHAR(100) NULL,
    createdByEmpId VARCHAR(50) NULL,
    createdByEmail VARCHAR(150) NULL,
    createdByDept VARCHAR(100) NULL,
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    isDeleted TINYINT(1) DEFAULT 0,
    deletedAt DATETIME NULL,
    deletedBy VARCHAR(100) NULL,
    deletedById VARCHAR(50) NULL
);
-- VehicleCatalog.vehicleNumber  <-- referenced by RouteAlternativeVehicles,
--                                     Vehicles, GateEntries, WeighBridgeEntries,
--                                     SampleCollections, MilkCollections, LaboratoryTests
-- VehicleCatalog.routeName       <-- FK -> Routes.routeName


-- 1.3) RouteAlternativeVehicles (ALTERNATIVE VEHICLE allocation window)
CREATE TABLE RouteAlternativeVehicles (
    id INT AUTO_INCREMENT PRIMARY KEY,                  -- PK
    routeName VARCHAR(50) NOT NULL,                     -- FK -> Routes.routeName
    primaryVehicleNumber VARCHAR(20) NOT NULL,          -- FK -> VehicleCatalog.vehicleNumber
    alternativeVehicleNumber VARCHAR(20) NOT NULL,      -- FK -> VehicleCatalog.vehicleNumber
    fromDate DATE NOT NULL,
    toDate DATE NOT NULL,
    remarks VARCHAR(255) NULL,
    approvalCopy LONGTEXT NULL,
    createdByName VARCHAR(100) NULL,
    createdByEmpId VARCHAR(50) NULL,
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    isDeleted TINYINT(1) DEFAULT 0,
    CONSTRAINT fk_alt_route FOREIGN KEY (routeName) REFERENCES Routes(routeName),
    CONSTRAINT fk_alt_primary FOREIGN KEY (primaryVehicleNumber) REFERENCES VehicleCatalog(vehicleNumber),
    CONSTRAINT fk_alt_alternative FOREIGN KEY (alternativeVehicleNumber) REFERENCES VehicleCatalog(vehicleNumber)
);
-- When a vehicle is searched in ANY department, both primaryVehicleNumber and
-- alternativeVehicleNumber are expanded for lookup, and both are surfaced.


-- 1.4) Vehicles (DAILY SEAL ALLOCATION for route vehicle)
CREATE TABLE Vehicles (
    id INT AUTO_INCREMENT PRIMARY KEY,                  -- PK
    vehicleNumber VARCHAR(20) NOT NULL,                 -- FK -> VehicleCatalog.vehicleNumber
    vehicleType VARCHAR(50) NULL,
    routeName VARCHAR(50) NULL,                         -- FK -> Routes.routeName
    conductorName VARCHAR(100) NULL,
    driverName VARCHAR(100) NULL,
    driverMobile VARCHAR(20) NULL,
    supplierCode VARCHAR(50) NULL,
    contractorCode VARCHAR(50) NULL,
    productGroup VARCHAR(100) NULL,
    productName VARCHAR(100) NULL,
    compartments INT DEFAULT 1,
    destination VARCHAR(100) NULL,
    purpose VARCHAR(50) DEFAULT 'Unloading',
    weighBridgeNo INT DEFAULT 1,
    serialNumbers LONGTEXT NULL,                        -- JSON array of allocated seal numbers
    allocationDate DATE NOT NULL,
    retiredSerials LONGTEXT NULL,                       -- replaced seals kept on record
    sealChangeHistory LONGTEXT NULL,
    approvalCopy LONGTEXT NULL,
    createdByName VARCHAR(100) NULL,
    createdByEmpId VARCHAR(50) NULL,
    createdByEmail VARCHAR(150) NULL,
    createdByDept VARCHAR(100) NULL,
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    isDeleted TINYINT(1) DEFAULT 0,
    deletedAt DATETIME NULL,
    deletedBy VARCHAR(100) NULL,
    deletedById VARCHAR(50) NULL,
    CONSTRAINT fk_veh_catalog FOREIGN KEY (vehicleNumber) REFERENCES VehicleCatalog(vehicleNumber),
    CONSTRAINT fk_veh_route FOREIGN KEY (routeName) REFERENCES Routes(routeName),
    UNIQUE KEY uq_vehicle_date (vehicleNumber, allocationDate)
);
-- Vehicles.serialNumbers  <-- used by GateEntries.sealNumbers / SampleCollections.sealNumbers /
--                             LaboratoryTests.sealNumbers for seal validation & display.


-- =====================================================================
-- STAGE 2 - GATE ENTRY (Uses STAGE 1 master data)
-- =====================================================================
CREATE TABLE GateEntries (
    id INT AUTO_INCREMENT PRIMARY KEY,               -- PK
    gateEntryId VARCHAR(50) NOT NULL UNIQUE,         -- BUSINESS KEY (referenced downstream)
    entryDateTime DATETIME NULL,
    vehicleStatus VARCHAR(30) NULL,
    vehicleNumber VARCHAR(20) NOT NULL,              -- FK -> VehicleCatalog.vehicleNumber / Vehicles.vehicleNumber
    vehicleType VARCHAR(50) NULL,                    -- from master (VehicleCatalog.vehicleType)
    driverName VARCHAR(100) NULL,
    driverMobile VARCHAR(20) NULL,
    supplierName VARCHAR(100) NULL,
    materialType VARCHAR(100) NULL,
    routeName VARCHAR(50) NULL,                      -- FK -> Routes.routeName / VehicleCatalog.routeName
    sealNumbers LONGTEXT NULL,                       -- JSON; validated against Vehicles.serialNumbers
    sealStatus VARCHAR(50) NULL,
    spinnerSet VARCHAR(50) NULL,
    tyre INT DEFAULT 0,
    jack INT DEFAULT 0,
    otherItems VARCHAR(255) NULL,
    exitDateTime DATETIME NULL,
    exitStatus VARCHAR(30) NULL,
    exitCheckedBy VARCHAR(100) NULL,
    exitCheckedById VARCHAR(50) NULL,
    exitCheckedByEmail VARCHAR(150) NULL,
    createdBy INT NULL,
    createdByName VARCHAR(150) NULL,
    createdByEmpId VARCHAR(50) NULL,
    createdByEmail VARCHAR(150) NULL,
    createdByDept VARCHAR(100) NULL,
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    isDeleted TINYINT(1) DEFAULT 0,
    deletedAt DATETIME NULL,
    deletedBy VARCHAR(150) NULL,
    deletedById VARCHAR(50) NULL,
    CONSTRAINT fk_gate_vehicle FOREIGN KEY (vehicleNumber) REFERENCES VehicleCatalog(vehicleNumber),
    CONSTRAINT fk_gate_route FOREIGN KEY (routeName) REFERENCES Routes(routeName)
);
-- GateEntries.gateEntryId  <-- referenced by SampleCollections.gateEntryId,
--                                 LaboratoryTests.gateEntryId
-- GateEntries.vehicleNumber / routeName  <-- shared keys fed into WeighBridgeEntries (STAGE 3)


-- =====================================================================
-- STAGE 3 - WEIGHMENT / WEIGHBRIDGE (Uses STAGE 2 gate data + STAGE 1 master)
-- =====================================================================
CREATE TABLE WeighBridgeEntries (
    id INT AUTO_INCREMENT PRIMARY KEY,               -- PK
    wbEntryId VARCHAR(50) NOT NULL UNIQUE,           -- BUSINESS KEY (referenced downstream)
    vehicleNumber VARCHAR(20) NOT NULL,              -- FK -> VehicleCatalog.vehicleNumber / Vehicles.vehicleNumber
    routeName VARCHAR(50) NULL,                      -- FK -> Routes.routeName
    conductorName VARCHAR(100) NULL,
    driverName VARCHAR(100) NULL,
    supplierCode VARCHAR(50) NULL,
    contractorCode VARCHAR(50) NULL,
    purpose VARCHAR(50) DEFAULT 'Unloading',
    destination VARCHAR(100) NULL,
    productGroup VARCHAR(100) NULL,
    productName VARCHAR(100) NULL,
    compartments INT DEFAULT 1,
    weighBridgeNo INT DEFAULT 1,
    grossWeight DECIMAL(10,2) NULL,
    intermediateWeight1 DECIMAL(10,2) NULL,  dumpPosition1 VARCHAR(20) NULL,
    intermediateWeight2 DECIMAL(10,2) NULL,  dumpPosition2 VARCHAR(20) NULL,
    intermediateWeight3 DECIMAL(10,2) NULL,  dumpPosition3 VARCHAR(20) NULL,
    tareWeight DECIMAL(10,2) NULL,
    netWeight DECIMAL(10,2) NULL,
    status VARCHAR(30) DEFAULT 'GrossPending',
    intermediateCount INT DEFAULT 0,
    initialWeightAt DATETIME NULL,
    intermediateWeight1At DATETIME NULL, intermediateWeight2At DATETIME NULL, intermediateWeight3At DATETIME NULL,
    tareWeightAt DATETIME NULL,
    initialWeightMode VARCHAR(20) NULL,
    intermediateWeight1Mode VARCHAR(20) NULL, intermediateWeight2Mode VARCHAR(20) NULL, intermediateWeight3Mode VARCHAR(20) NULL,
    tareWeightMode VARCHAR(20) NULL,
    createdByName VARCHAR(150) NULL,
    createdByEmpId VARCHAR(50) NULL,
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    isDeleted TINYINT(1) DEFAULT 0,
    deletedAt DATETIME NULL,
    deletedBy VARCHAR(150) NULL,
    deletedById VARCHAR(50) NULL,
    CONSTRAINT fk_wb_vehicle FOREIGN KEY (vehicleNumber) REFERENCES VehicleCatalog(vehicleNumber),
    CONSTRAINT fk_wb_route FOREIGN KEY (routeName) REFERENCES Routes(routeName)
);
-- WeighBridgeEntries.wbEntryId  <-- referenced by SampleCollections.wbEntryId,
--                                      LaboratoryTests.wbEntryId
-- WeighBridgeEntries.netWeight  <-- used in Lab Calculation report (tanker quantity)


-- =====================================================================
-- STAGE 4 - DOWNSTREAM MODULES (Uses STAGE 3 weighment + STAGE 1 master)
-- =====================================================================

-- 4.1) SAMPLE COLLECTION  (with compartment tests sub-table)
CREATE TABLE SampleCollections (
    id INT AUTO_INCREMENT PRIMARY KEY,               -- PK
    sampleId VARCHAR(50) NOT NULL UNIQUE,            -- BUSINESS KEY
    vehicleNumber VARCHAR(20) NOT NULL,              -- FK -> VehicleCatalog.vehicleNumber / Vehicles.vehicleNumber
    gateEntryId VARCHAR(50) NULL,                    -- FK -> GateEntries.gateEntryId   (STAGE 2)
    wbEntryId VARCHAR(50) NULL,                      -- FK -> WeighBridgeEntries.wbEntryId (STAGE 3)
    routeNo VARCHAR(50) NULL,                        -- FK -> Routes.routeName
    taluk VARCHAR(100) NULL,
    materialType VARCHAR(100) NULL,
    sealNumbers LONGTEXT NULL,                       -- JSON; validated vs GateEntries.sealNumbers / Vehicles.serialNumbers
    sealStatus VARCHAR(50) NULL,
    sealDiscrepancyReason LONGTEXT NULL,
    quantity VARCHAR(50) NOT NULL,
    temperature VARCHAR(50) NOT NULL,
    remarks LONGTEXT NULL,
    sampleCollectedBy VARCHAR(150) NULL,
    sampleCollectedByEmpId VARCHAR(50) NULL,
    collectedAt DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    createdAt DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    isDeleted TINYINT(1) DEFAULT 0,
    deletedAt DATETIME NULL,
    deletedBy VARCHAR(150) NULL,
    deletedById VARCHAR(50) NULL,
    CONSTRAINT fk_sc_gate FOREIGN KEY (gateEntryId) REFERENCES GateEntries(gateEntryId),
    CONSTRAINT fk_sc_wb FOREIGN KEY (wbEntryId) REFERENCES WeighBridgeEntries(wbEntryId),
    CONSTRAINT fk_sc_route FOREIGN KEY (routeNo) REFERENCES Routes(routeName)
);

-- SampleCompartmentTests (1-to-many child of SampleCollections)
CREATE TABLE SampleCompartmentTests (
    id INT AUTO_INCREMENT PRIMARY KEY,               -- PK
    sampleId VARCHAR(50) NOT NULL,                   -- FK -> SampleCollections.sampleId
    vehicleNumber VARCHAR(20) NOT NULL,
    compartment VARCHAR(20) NOT NULL,                -- front / middle / back
    foreignMatter VARCHAR(20) NULL,
    flavour VARCHAR(20) NULL,
    temperature VARCHAR(20) NULL,
    cob VARCHAR(20) NULL,
    skipped TINYINT(1) DEFAULT 0,
    testedBy VARCHAR(150) NULL,
    testedById VARCHAR(50) NULL,
    testedAt DATETIME NULL,
    createdAt DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_sct_sample FOREIGN KEY (sampleId) REFERENCES SampleCollections(sampleId),
    UNIQUE KEY uq_sample_comp (sampleId, compartment)
);


-- 4.2) TRUCK SHEET (MilkCollection) - member-wise milk intake per vehicle per date
CREATE TABLE MilkCollections (
    id INT AUTO_INCREMENT PRIMARY KEY,               -- PK
    reportId VARCHAR(50) NOT NULL,                   -- BUSINESS KEY: MC-<date>-<vehno>
    reportDate DATE NOT NULL,
    vehicleNumber VARCHAR(20) NOT NULL,              -- FK -> VehicleCatalog.vehicleNumber / Vehicles.vehicleNumber
    routeNo VARCHAR(50) NULL,                        -- FK -> Routes.routeName   (STAGE 1)
    serialNo INT NULL,
    memberCode VARCHAR(50) NULL,
    memberName VARCHAR(150) NULL,
    eveningDate DATE NULL, eveningKg DECIMAL(10,2) NULL, eveningCLR DECIMAL(10,2) NULL,
    eveningFat DECIMAL(10,2) NULL, eveningSNF DECIMAL(10,2) NULL,
    morningDate DATE NULL, morningKg DECIMAL(10,2) NULL, morningCLR DECIMAL(10,2) NULL,
    morningFat DECIMAL(10,2) NULL, morningSNF DECIMAL(10,2) NULL,
    enteredBy VARCHAR(150) NULL,
    enteredByEmpId VARCHAR(50) NULL,
    createdAt DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    isDeleted TINYINT(1) DEFAULT 0,
    deletedAt DATETIME NULL,
    deletedBy VARCHAR(150) NULL,
    deletedById VARCHAR(50) NULL,
    CONSTRAINT fk_mc_vehicle FOREIGN KEY (vehicleNumber) REFERENCES VehicleCatalog(vehicleNumber),
    CONSTRAINT fk_mc_route FOREIGN KEY (routeNo) REFERENCES Routes(routeName)
);
-- MilkCollections.eveningKg+morningKg  <-- used in Lab Calculation report (truck sheet quantity)


-- 4.3) LAB CALCULATION (LaboratoryTest) - with compartment tests sub-table
CREATE TABLE LaboratoryTests (
    id INT AUTO_INCREMENT PRIMARY KEY,               -- PK
    labTestId VARCHAR(50) NOT NULL UNIQUE,           -- BUSINESS KEY
    vehicleNumber VARCHAR(20) NOT NULL,              -- FK -> VehicleCatalog.vehicleNumber / Vehicles.vehicleNumber
    routeNo VARCHAR(50) NULL,                        -- FK -> Routes.routeName (STAGE 1)
    taluk VARCHAR(100) NULL,
    gateEntryId VARCHAR(50) NULL,                    -- FK -> GateEntries.gateEntryId (STAGE 2)
    wbEntryId VARCHAR(50) NULL,                      -- FK -> WeighBridgeEntries.wbEntryId (STAGE 3)
    driverName VARCHAR(100) NULL,
    supplierName VARCHAR(100) NULL,
    materialType VARCHAR(100) NULL,
    productName VARCHAR(100) NULL,
    sealNumbers LONGTEXT NULL,                       -- JSON; validated vs GateEntries.sealNumbers
    temperature VARCHAR(50) NULL,
    cob VARCHAR(20) NULL,
    acidity VARCHAR(50) NULL,
    appearance VARCHAR(100) NULL,
    clr VARCHAR(50) NULL,
    fat VARCHAR(50) NULL,
    alcohol VARCHAR(50) NULL,
    snf VARCHAR(50) NULL,
    kgFat VARCHAR(50) NULL,                          -- (CLR*Fat)/100
    kgSnf VARCHAR(50) NULL,                          -- (CLR*SNF)/100
    totalKgFat VARCHAR(50) NULL,
    totalKgSNF VARCHAR(50) NULL,
    flavors LONGTEXT NULL,
    remarks LONGTEXT NULL,
    testedByName VARCHAR(150) NULL,
    testedByEmpId VARCHAR(50) NULL,
    testedAt DATETIME NULL,
    createdAt DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updatedAt DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    isDeleted TINYINT(1) DEFAULT 0,
    deletedAt DATETIME NULL,
    deletedBy VARCHAR(150) NULL,
    deletedById VARCHAR(50) NULL,
    CONSTRAINT fk_lt_gate FOREIGN KEY (gateEntryId) REFERENCES GateEntries(gateEntryId),
    CONSTRAINT fk_lt_wb FOREIGN KEY (wbEntryId) REFERENCES WeighBridgeEntries(wbEntryId),
    CONSTRAINT fk_lt_route FOREIGN KEY (routeNo) REFERENCES Routes(routeName)
);

-- LaboratoryCompartmentTests (1-to-many child of LaboratoryTests)
CREATE TABLE LaboratoryCompartmentTests (
    id INT AUTO_INCREMENT PRIMARY KEY,               -- PK
    labTestId VARCHAR(50) NOT NULL,                  -- FK -> LaboratoryTests.labTestId
    vehicleNumber VARCHAR(20) NOT NULL,
    compartment VARCHAR(20) NOT NULL,                -- front / middle / back
    temperature VARCHAR(20) NULL,
    cob VARCHAR(20) NULL,
    appearance VARCHAR(50) NULL,
    flavour VARCHAR(50) NULL,
    acidity VARCHAR(20) NULL,
    clr VARCHAR(20) NULL,
    fat VARCHAR(20) NULL,
    alcohol VARCHAR(20) NULL,
    snf VARCHAR(20) NULL,
    kgFat VARCHAR(20) NULL,
    kgSnf VARCHAR(20) NULL,
    skipped TINYINT(1) DEFAULT 0,
    createdAt DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_lct_lab FOREIGN KEY (labTestId) REFERENCES LaboratoryTests(labTestId)
);


-- =====================================================================
-- RELATIONSHIP SUMMARY (PK <-> FK)
-- =====================================================================
--  Routes.routeName
--    ^-- VehicleCatalog.routeName
--    ^-- RouteAlternativeVehicles.routeName
--    ^-- Vehicles.routeName
--    ^-- GateEntries.routeName
--    ^-- WeighBridgeEntries.routeName
--    ^-- SampleCollections.routeNo
--    ^-- MilkCollections.routeNo
--    ^-- LaboratoryTests.routeNo
--
--  VehicleCatalog.vehicleNumber
--    ^-- RouteAlternativeVehicles.primaryVehicleNumber
--    ^-- RouteAlternativeVehicles.alternativeVehicleNumber
--    ^-- Vehicles.vehicleNumber
--    ^-- GateEntries.vehicleNumber
--    ^-- WeighBridgeEntries.vehicleNumber
--    ^-- SampleCollections.vehicleNumber
--    ^-- MilkCollections.vehicleNumber
--    ^-- LaboratoryTests.vehicleNumber
--
--  GateEntries.gateEntryId
--    ^-- SampleCollections.gateEntryId
--    ^-- LaboratoryTests.gateEntryId
--
--  WeighBridgeEntries.wbEntryId
--    ^-- SampleCollections.wbEntryId
--    ^-- LaboratoryTests.wbEntryId
--
--  SampleCollections.sampleId
--    ^-- SampleCompartmentTests.sampleId
--
--  LaboratoryTests.labTestId
--    ^-- LaboratoryCompartmentTests.labTestId
--
-- =====================================================================
-- END OF RELATIONAL TABLE & KEY MAPPING
-- =====================================================================

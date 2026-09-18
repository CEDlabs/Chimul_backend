-- Routes Master Seed Data
-- Run: node datainsert/routes/seedRoutes.js

INSERT IGNORE INTO Taluks (name, shortForm, description)
VALUES
  ('Sidlaghatta',    'SDL', 'Sidlaghatta taluk'),
  ('Bagepalli',      'BPL', 'Bagepalli taluk'),
  ('Chikkaballapura','CBP', 'Chikkaballapura taluk'),
  ('Chintamani',     'CNT', 'Chintamani taluk'),
  ('Gauribidanur',   'GBN', 'Gauribidanur taluk'),
  ('Gudibande',      'GBD', 'Gudibande taluk');

INSERT IGNORE INTO Routes (routeName, taluk, description, createdAt, updatedAt)
VALUES
  ('7B',  'Sidlaghatta', NULL, NOW(), NOW()),
  ('8B',  'Sidlaghatta', NULL, NOW(), NOW()),
  ('9B',  'Sidlaghatta', NULL, NOW(), NOW()),
  ('10B', 'Sidlaghatta', NULL, NOW(), NOW()),
  ('11B', 'Sidlaghatta', NULL, NOW(), NOW()),
  ('30B', 'Sidlaghatta', NULL, NOW(), NOW()),
  ('40B', 'Sidlaghatta', NULL, NOW(), NOW()),
  ('62B', 'Sidlaghatta', NULL, NOW(), NOW()),
  ('38B', 'Sidlaghatta', NULL, NOW(), NOW()),
  ('49B', 'Bagepalli', NULL, NOW(), NOW()),
  ('22B', 'Bagepalli', NULL, NOW(), NOW()),
  ('35B', 'Chikkaballapura', NULL, NOW(), NOW()),
  ('37B', 'Chikkaballapura', NULL, NOW(), NOW()),
  ('47B', 'Chikkaballapura', NULL, NOW(), NOW()),
  ('72B', 'Chikkaballapura', NULL, NOW(), NOW()),
  ('46B', 'Chikkaballapura', NULL, NOW(), NOW()),
  ('14B', 'Chintamani', NULL, NOW(), NOW()),
  ('20B', 'Chintamani', NULL, NOW(), NOW()),
  ('25B', 'Chintamani', NULL, NOW(), NOW()),
  ('23B', 'Chintamani', NULL, NOW(), NOW()),
  ('12B', 'Chintamani', NULL, NOW(), NOW()),
  ('17B', 'Chintamani', NULL, NOW(), NOW()),
  ('43B', 'Chintamani', NULL, NOW(), NOW()),
  ('41B', 'Chintamani', NULL, NOW(), NOW()),
  ('50B', 'Gudibande', NULL, NOW(), NOW()),
  ('57B', 'Gudibande', NULL, NOW(), NOW()),
  ('58B', 'Gudibande', NULL, NOW(), NOW()),
  ('63B', 'Gudibande', NULL, NOW(), NOW()),
  ('67B', 'Gudibande', NULL, NOW(), NOW()),
  ('18B', 'Gudibande', NULL, NOW(), NOW()),
  ('68B', 'Gudibande', NULL, NOW(), NOW()),
  ('86B', 'Gudibande', NULL, NOW(), NOW()),
  ('93B', 'Gudibande', NULL, NOW(), NOW()),
  ('55B', 'Gauribidanur', NULL, NOW(), NOW()),
  ('95B', 'Gauribidanur', NULL, NOW(), NOW());

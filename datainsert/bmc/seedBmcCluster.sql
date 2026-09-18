-- BMC and Cluster Seed Data
-- Run: node datainsert/bmc/seedBmcCluster.js

-- ============================================================
-- BMCs (BM type rows)
-- ============================================================
INSERT IGNORE INTO BMCs (routeName, taluk, bmcCode, bmcName, rtCd, bmcType, capacity, createdAt, updatedAt)
SELECT r.routeName, 'Bagepalli', '239', 'BURAGAMADAGU', NULL, 'BM', '3000', NOW(), NOW() FROM Routes r WHERE UPPER(r.taluk) = 'BAGEPALLI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;
INSERT IGNORE INTO BMCs (routeName, taluk, bmcCode, bmcName, rtCd, bmcType, capacity, createdAt, updatedAt)
SELECT r.routeName, 'Bagepalli', '2089', 'GUNDLAPALLI MPCS', NULL, 'BM', '3000', NOW(), NOW() FROM Routes r WHERE UPPER(r.taluk) = 'BAGEPALLI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;
INSERT IGNORE INTO BMCs (routeName, taluk, bmcCode, bmcName, rtCd, bmcType, capacity, createdAt, updatedAt)
SELECT r.routeName, 'Bagepalli', '2103', 'BILLUR MPCS', NULL, 'BM', '3000', NOW(), NOW() FROM Routes r WHERE UPPER(r.taluk) = 'BAGEPALLI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;
INSERT IGNORE INTO BMCs (routeName, taluk, bmcCode, bmcName, rtCd, bmcType, capacity, createdAt, updatedAt)
SELECT r.routeName, 'Bagepalli', '3398', 'NANJA REDDY PALLI MPCS', NULL, 'BM', '3000', NOW(), NOW() FROM Routes r WHERE UPPER(r.taluk) = 'BAGEPALLI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;
INSERT IGNORE INTO BMCs (routeName, taluk, bmcCode, bmcName, rtCd, bmcType, capacity, createdAt, updatedAt)
SELECT r.routeName, 'Bagepalli', '5509', 'PARAGODU MPCS', NULL, 'BM', '3000', NOW(), NOW() FROM Routes r WHERE UPPER(r.taluk) = 'BAGEPALLI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;
INSERT IGNORE INTO BMCs (routeName, taluk, bmcCode, bmcName, rtCd, bmcType, capacity, createdAt, updatedAt)
SELECT r.routeName, 'Bagepalli', '5600', 'GOOLURU MPCS', NULL, 'BM', '3000', NOW(), NOW() FROM Routes r WHERE UPPER(r.taluk) = 'BAGEPALLI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;
INSERT IGNORE INTO BMCs (routeName, taluk, bmcCode, bmcName, rtCd, bmcType, capacity, createdAt, updatedAt)
SELECT r.routeName, 'Bagepalli', '6625', 'POLANAYAKANAHALLI MPCS', NULL, 'BM', '3000', NOW(), NOW() FROM Routes r WHERE UPPER(r.taluk) = 'BAGEPALLI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;
INSERT IGNORE INTO BMCs (routeName, taluk, bmcCode, bmcName, rtCd, bmcType, capacity, createdAt, updatedAt)
SELECT r.routeName, 'Bagepalli', '9667', 'CHELURU MPCS', NULL, 'BM', '3000', NOW(), NOW() FROM Routes r WHERE UPPER(r.taluk) = 'BAGEPALLI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;
INSERT IGNORE INTO BMCs (routeName, taluk, bmcCode, bmcName, rtCd, bmcType, capacity, createdAt, updatedAt)
SELECT r.routeName, 'Bagepalli', '9714', 'RASCHERAVU MPCS', NULL, 'BM', '2000', NOW(), NOW() FROM Routes r WHERE UPPER(r.taluk) = 'BAGEPALLI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;
INSERT IGNORE INTO BMCs (routeName, taluk, bmcCode, bmcName, rtCd, bmcType, capacity, createdAt, updatedAt)
SELECT r.routeName, 'Bagepalli', '9860', 'MALLASANDRA MPCS', NULL, 'BM', '3000', NOW(), NOW() FROM Routes r WHERE UPPER(r.taluk) = 'BAGEPALLI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;
INSERT IGNORE INTO BMCs (routeName, taluk, bmcCode, bmcName, rtCd, bmcType, capacity, createdAt, updatedAt)
SELECT r.routeName, 'Bagepalli', '9871', 'SOMANATHAPURA MPCS', NULL, 'BM', '3000', NOW(), NOW() FROM Routes r WHERE UPPER(r.taluk) = 'BAGEPALLI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;
INSERT IGNORE INTO BMCs (routeName, taluk, bmcCode, bmcName, rtCd, bmcType, capacity, createdAt, updatedAt)
SELECT r.routeName, 'Bagepalli', '9995', 'CHAKAVELU MPCS', NULL, 'BM', '3000', NOW(), NOW() FROM Routes r WHERE UPPER(r.taluk) = 'BAGEPALLI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;
INSERT IGNORE INTO BMCs (routeName, taluk, bmcCode, bmcName, rtCd, bmcType, capacity, createdAt, updatedAt)
SELECT r.routeName, 'Chikkaballapura', '11', 'GOWCHENAHALLI', NULL, 'BM', '3000', NOW(), NOW() FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;
INSERT IGNORE INTO BMCs (routeName, taluk, bmcCode, bmcName, rtCd, bmcType, capacity, createdAt, updatedAt)
SELECT r.routeName, 'Chikkaballapura', '72', 'RENAMAKALAHALLI', NULL, 'BM', '3000', NOW(), NOW() FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;
INSERT IGNORE INTO BMCs (routeName, taluk, bmcCode, bmcName, rtCd, bmcType, capacity, createdAt, updatedAt)
SELECT r.routeName, 'Chikkaballapura', '281', 'D.HOSUR MPCS', NULL, 'BM', '3000', NOW(), NOW() FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;
INSERT IGNORE INTO BMCs (routeName, taluk, bmcCode, bmcName, rtCd, bmcType, capacity, createdAt, updatedAt)
SELECT r.routeName, 'Chikkaballapura', '502', 'NALLAKADIRENAHALLY', NULL, 'BM', '5000', NOW(), NOW() FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;
INSERT IGNORE INTO BMCs (routeName, taluk, bmcCode, bmcName, rtCd, bmcType, capacity, createdAt, updatedAt)
SELECT r.routeName, 'Chikkaballapura', '849', 'KANITHAHALLI MPCS', NULL, 'BM', '3000', NOW(), NOW() FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;
INSERT IGNORE INTO BMCs (routeName, taluk, bmcCode, bmcName, rtCd, bmcType, capacity, createdAt, updatedAt)
SELECT r.routeName, 'Chikkaballapura', '2329', 'ANGAREKHANAHALLY MPCS', NULL, 'BM', '3000', NOW(), NOW() FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;
INSERT IGNORE INTO BMCs (routeName, taluk, bmcCode, bmcName, rtCd, bmcType, capacity, createdAt, updatedAt)
SELECT r.routeName, 'Chikkaballapura', '2533', 'PERESANDRA MPCS', NULL, 'BM', '3000', NOW(), NOW() FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;
INSERT IGNORE INTO BMCs (routeName, taluk, bmcCode, bmcName, rtCd, bmcType, capacity, createdAt, updatedAt)
SELECT r.routeName, 'Chikkaballapura', '2555', 'CHIKKAPAYALAGURKI MPCS', NULL, 'BM', '3000', NOW(), NOW() FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;
INSERT IGNORE INTO BMCs (routeName, taluk, bmcCode, bmcName, rtCd, bmcType, capacity, createdAt, updatedAt)
SELECT r.routeName, 'Chikkaballapura', '2635', 'DIBBUR MPCS', NULL, 'BM', '3000', NOW(), NOW() FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;
INSERT IGNORE INTO BMCs (routeName, taluk, bmcCode, bmcName, rtCd, bmcType, capacity, createdAt, updatedAt)
SELECT r.routeName, 'Chikkaballapura', '2657', 'MARALAKUNTE MPCS', NULL, 'BM', '3000', NOW(), NOW() FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;
INSERT IGNORE INTO BMCs (routeName, taluk, bmcCode, bmcName, rtCd, bmcType, capacity, createdAt, updatedAt)
SELECT r.routeName, 'Chikkaballapura', '2688', 'GOLLU MPCS', NULL, 'BM', '3000', NOW(), NOW() FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;
INSERT IGNORE INTO BMCs (routeName, taluk, bmcCode, bmcName, rtCd, bmcType, capacity, createdAt, updatedAt)
SELECT r.routeName, 'Chikkaballapura', '2817', 'SOPPAHALLI', NULL, 'BM', '3000', NOW(), NOW() FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;
INSERT IGNORE INTO BMCs (routeName, taluk, bmcCode, bmcName, rtCd, bmcType, capacity, createdAt, updatedAt)
SELECT r.routeName, 'Chikkaballapura', '3897', 'ADAVIGOLLAVARAHALLY MPCS', NULL, 'BM', '3000', NOW(), NOW() FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;
INSERT IGNORE INTO BMCs (routeName, taluk, bmcCode, bmcName, rtCd, bmcType, capacity, createdAt, updatedAt)
SELECT r.routeName, 'Chikkaballapura', '3927', 'NANDI MPCS', NULL, 'BM', '3000', NOW(), NOW() FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;
INSERT IGNORE INTO BMCs (routeName, taluk, bmcCode, bmcName, rtCd, bmcType, capacity, createdAt, updatedAt)
SELECT r.routeName, 'Chikkaballapura', '3971', 'NAYANAHALLY MPCS', NULL, 'BM', '3000', NOW(), NOW() FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;
INSERT IGNORE INTO BMCs (routeName, taluk, bmcCode, bmcName, rtCd, bmcType, capacity, createdAt, updatedAt)
SELECT r.routeName, 'Chikkaballapura', '4001', 'GIDNAHALLI MPCS', NULL, 'BM', '3000', NOW(), NOW() FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;
INSERT IGNORE INTO BMCs (routeName, taluk, bmcCode, bmcName, rtCd, bmcType, capacity, createdAt, updatedAt)
SELECT r.routeName, 'Chikkaballapura', '4056', 'KONDENAHALLY MPCS', NULL, 'BM', '3000', NOW(), NOW() FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;
INSERT IGNORE INTO BMCs (routeName, taluk, bmcCode, bmcName, rtCd, bmcType, capacity, createdAt, updatedAt)
SELECT r.routeName, 'Chikkaballapura', '4089', 'AJJAWARA MPCS', NULL, 'BM', '3000', NOW(), NOW() FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;
INSERT IGNORE INTO BMCs (routeName, taluk, bmcCode, bmcName, rtCd, bmcType, capacity, createdAt, updatedAt)
SELECT r.routeName, 'Chikkaballapura', '4432', 'RAMACHANDRAHOSUR MPCS', NULL, 'BM', '3000', NOW(), NOW() FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;
INSERT IGNORE INTO BMCs (routeName, taluk, bmcCode, bmcName, rtCd, bmcType, capacity, createdAt, updatedAt)
SELECT r.routeName, 'Chikkaballapura', '4951', 'INUMINCHENAHALLY', NULL, 'BM', '3000', NOW(), NOW() FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;
INSERT IGNORE INTO BMCs (routeName, taluk, bmcCode, bmcName, rtCd, bmcType, capacity, createdAt, updatedAt)
SELECT r.routeName, 'Chikkaballapura', '5520', 'MANDIKALLU MPCS', NULL, 'BM', '3000', NOW(), NOW() FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;
INSERT IGNORE INTO BMCs (routeName, taluk, bmcCode, bmcName, rtCd, bmcType, capacity, createdAt, updatedAt)
SELECT r.routeName, 'Chikkaballapura', '7305', 'KANAJENAHALLY MPCS', NULL, 'BM', '3000', NOW(), NOW() FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;
INSERT IGNORE INTO BMCs (routeName, taluk, bmcCode, bmcName, rtCd, bmcType, capacity, createdAt, updatedAt)
SELECT r.routeName, 'Chikkaballapura', '7327', 'AVALAGURKI', NULL, 'BM', '3000', NOW(), NOW() FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;
INSERT IGNORE INTO BMCs (routeName, taluk, bmcCode, bmcName, rtCd, bmcType, capacity, createdAt, updatedAt)
SELECT r.routeName, 'Chikkaballapura', '7338', 'S.GOLLAHALLY MPCS', NULL, 'BM', '3000', NOW(), NOW() FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;
INSERT IGNORE INTO BMCs (routeName, taluk, bmcCode, bmcName, rtCd, bmcType, capacity, createdAt, updatedAt)
SELECT r.routeName, 'Chikkaballapura', '8165', 'HIRENAGAVALLI MPCS', NULL, 'BM', '3000', NOW(), NOW() FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;
INSERT IGNORE INTO BMCs (routeName, taluk, bmcCode, bmcName, rtCd, bmcType, capacity, createdAt, updatedAt)
SELECT r.routeName, 'Chikkaballapura', '9220', 'KUPPAHALLYMPCS', NULL, 'BM', '3000', NOW(), NOW() FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;
INSERT IGNORE INTO BMCs (routeName, taluk, bmcCode, bmcName, rtCd, bmcType, capacity, createdAt, updatedAt)
SELECT r.routeName, 'Chikkaballapura', '9634', 'RAMAPATNA MPCS', NULL, 'BM', '3000', NOW(), NOW() FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;
INSERT IGNORE INTO BMCs (routeName, taluk, bmcCode, bmcName, rtCd, bmcType, capacity, createdAt, updatedAt)
SELECT r.routeName, 'Chintamani', '32', 'JAGATHANAHALLY', NULL, 'BM', '3000', NOW(), NOW() FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;
INSERT IGNORE INTO BMCs (routeName, taluk, bmcCode, bmcName, rtCd, bmcType, capacity, createdAt, updatedAt)
SELECT r.routeName, 'Chintamani', '56', 'HIREPALYA', NULL, 'BM', '3000', NOW(), NOW() FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;
INSERT IGNORE INTO BMCs (routeName, taluk, bmcCode, bmcName, rtCd, bmcType, capacity, createdAt, updatedAt)
SELECT r.routeName, 'Chintamani', '78', 'NIDAGURKI', NULL, 'BM', '3000', NOW(), NOW() FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;
INSERT IGNORE INTO BMCs (routeName, taluk, bmcCode, bmcName, rtCd, bmcType, capacity, createdAt, updatedAt)
SELECT r.routeName, 'Chintamani', '205', 'BOMMEPALLY MPCS', NULL, 'BM', '3000', NOW(), NOW() FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;
INSERT IGNORE INTO BMCs (routeName, taluk, bmcCode, bmcName, rtCd, bmcType, capacity, createdAt, updatedAt)
SELECT r.routeName, 'Chintamani', '271', 'MASTHENAHALLY MPCS', NULL, 'BM', '3000', NOW(), NOW() FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;
INSERT IGNORE INTO BMCs (routeName, taluk, bmcCode, bmcName, rtCd, bmcType, capacity, createdAt, updatedAt)
SELECT r.routeName, 'Chintamani', '475', 'LAKSHMIDEVIKOTE MPCS', NULL, 'BM', '3000', NOW(), NOW() FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;
INSERT IGNORE INTO BMCs (routeName, taluk, bmcCode, bmcName, rtCd, bmcType, capacity, createdAt, updatedAt)
SELECT r.routeName, 'Chintamani', '522', 'SANTHEKALLAHALLY MPCS', NULL, 'BM', '3000', NOW(), NOW() FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;
INSERT IGNORE INTO BMCs (routeName, taluk, bmcCode, bmcName, rtCd, bmcType, capacity, createdAt, updatedAt)
SELECT r.routeName, 'Chintamani', '555', 'TALAGAVARA MPCS', NULL, 'BM', '3000', NOW(), NOW() FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;
INSERT IGNORE INTO BMCs (routeName, taluk, bmcCode, bmcName, rtCd, bmcType, capacity, createdAt, updatedAt)
SELECT r.routeName, 'Chintamani', '566', 'KAIWARA MPCS', NULL, 'BM', '3000', NOW(), NOW() FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;
INSERT IGNORE INTO BMCs (routeName, taluk, bmcCode, bmcName, rtCd, bmcType, capacity, createdAt, updatedAt)
SELECT r.routeName, 'Chintamani', '668', 'VAIJAKKUR MPCS', NULL, 'BM', '3000', NOW(), NOW() FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;
INSERT IGNORE INTO BMCs (routeName, taluk, bmcCode, bmcName, rtCd, bmcType, capacity, createdAt, updatedAt)
SELECT r.routeName, 'Chintamani', '679', 'KALLAHALLI', NULL, 'BM', '3000', NOW(), NOW() FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;
INSERT IGNORE INTO BMCs (routeName, taluk, bmcCode, bmcName, rtCd, bmcType, capacity, createdAt, updatedAt)
SELECT r.routeName, 'Chintamani', '941', 'MUNAGANA HALLY MPCS', NULL, 'BM', '3000', NOW(), NOW() FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;
INSERT IGNORE INTO BMCs (routeName, taluk, bmcCode, bmcName, rtCd, bmcType, capacity, createdAt, updatedAt)
SELECT r.routeName, 'Chintamani', '1110', 'K.DEVAGANAHALLY', NULL, 'BM', '3000', NOW(), NOW() FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;
INSERT IGNORE INTO BMCs (routeName, taluk, bmcCode, bmcName, rtCd, bmcType, capacity, createdAt, updatedAt)
SELECT r.routeName, 'Chintamani', '2040', 'HANUMYGARAPALLI MPCS', NULL, 'BM', '3000', NOW(), NOW() FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;
INSERT IGNORE INTO BMCs (routeName, taluk, bmcCode, bmcName, rtCd, bmcType, capacity, createdAt, updatedAt)
SELECT r.routeName, 'Chintamani', '2051', 'GUDARLAHALLI MPCS', NULL, 'BM', '3000', NOW(), NOW() FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;
INSERT IGNORE INTO BMCs (routeName, taluk, bmcCode, bmcName, rtCd, bmcType, capacity, createdAt, updatedAt)
SELECT r.routeName, 'Chintamani', '2100', 'BUKKANAHALLY', NULL, 'BM', '2000', NOW(), NOW() FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;
INSERT IGNORE INTO BMCs (routeName, taluk, bmcCode, bmcName, rtCd, bmcType, capacity, createdAt, updatedAt)
SELECT r.routeName, 'Chintamani', '2379', 'BOMMEKALLU MPCS', NULL, 'BM', '3000', NOW(), NOW() FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;
INSERT IGNORE INTO BMCs (routeName, taluk, bmcCode, bmcName, rtCd, bmcType, capacity, createdAt, updatedAt)
SELECT r.routeName, 'Chintamani', '3134', 'NALLARALA PALLI MPCS', NULL, 'BM', '3000', NOW(), NOW() FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;
INSERT IGNORE INTO BMCs (routeName, taluk, bmcCode, bmcName, rtCd, bmcType, capacity, createdAt, updatedAt)
SELECT r.routeName, 'Chintamani', '5005', 'DODDABOMMANAHALLY MPCS', NULL, 'BM', '3000', NOW(), NOW() FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;
INSERT IGNORE INTO BMCs (routeName, taluk, bmcCode, bmcName, rtCd, bmcType, capacity, createdAt, updatedAt)
SELECT r.routeName, 'Chintamani', '5016', 'KURBUR MPCS', NULL, 'BM', '3000', NOW(), NOW() FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;
INSERT IGNORE INTO BMCs (routeName, taluk, bmcCode, bmcName, rtCd, bmcType, capacity, createdAt, updatedAt)
SELECT r.routeName, 'Chintamani', '5038', 'MURAGAMALLA MPCS', NULL, 'BM', '3000', NOW(), NOW() FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;
INSERT IGNORE INTO BMCs (routeName, taluk, bmcCode, bmcName, rtCd, bmcType, capacity, createdAt, updatedAt)
SELECT r.routeName, 'Chintamani', '5071', 'KODIHALLI MPCS', NULL, 'BM', '5000', NOW(), NOW() FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;
INSERT IGNORE INTO BMCs (routeName, taluk, bmcCode, bmcName, rtCd, bmcType, capacity, createdAt, updatedAt)
SELECT r.routeName, 'Chintamani', '5082', 'MADIKERE MPCS', NULL, 'BM', '3000', NOW(), NOW() FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;
INSERT IGNORE INTO BMCs (routeName, taluk, bmcCode, bmcName, rtCd, bmcType, capacity, createdAt, updatedAt)
SELECT r.routeName, 'Chintamani', '5093', 'ULAVADI MPCS', NULL, 'BM', '3000', NOW(), NOW() FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;
INSERT IGNORE INTO BMCs (routeName, taluk, bmcCode, bmcName, rtCd, bmcType, capacity, createdAt, updatedAt)
SELECT r.routeName, 'Chintamani', '5140', 'TINAKALLU MPCS', NULL, 'BM', '3000', NOW(), NOW() FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;
INSERT IGNORE INTO BMCs (routeName, taluk, bmcCode, bmcName, rtCd, bmcType, capacity, createdAt, updatedAt)
SELECT r.routeName, 'Chintamani', '6540', 'KENCHARLA HALLY MPCS', NULL, 'BM', '3000', NOW(), NOW() FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;
INSERT IGNORE INTO BMCs (routeName, taluk, bmcCode, bmcName, rtCd, bmcType, capacity, createdAt, updatedAt)
SELECT r.routeName, 'Chintamani', '6584', 'CHILAKALANERPU MPCS', NULL, 'BM', '3000', NOW(), NOW() FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;
INSERT IGNORE INTO BMCs (routeName, taluk, bmcCode, bmcName, rtCd, bmcType, capacity, createdAt, updatedAt)
SELECT r.routeName, 'Chintamani', '6595', 'IRAGAMPALLY MPCS', NULL, 'BM', '3000', NOW(), NOW() FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;
INSERT IGNORE INTO BMCs (routeName, taluk, bmcCode, bmcName, rtCd, bmcType, capacity, createdAt, updatedAt)
SELECT r.routeName, 'Chintamani', '6620', 'M.GOLLA HALLY MPCS', NULL, 'BM', '3000', NOW(), NOW() FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;
INSERT IGNORE INTO BMCs (routeName, taluk, bmcCode, bmcName, rtCd, bmcType, capacity, createdAt, updatedAt)
SELECT r.routeName, 'Chintamani', '6653', 'KOTAGAL MPCS', NULL, 'BM', '3000', NOW(), NOW() FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;
INSERT IGNORE INTO BMCs (routeName, taluk, bmcCode, bmcName, rtCd, bmcType, capacity, createdAt, updatedAt)
SELECT r.routeName, 'Chintamani', '6700', 'PALENAHALLI MPCS', NULL, 'BM', '3000', NOW(), NOW() FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;
INSERT IGNORE INTO BMCs (routeName, taluk, bmcCode, bmcName, rtCd, bmcType, capacity, createdAt, updatedAt)
SELECT r.routeName, 'Chintamani', '7077', 'PERAMACHANA HALLY MPCS', NULL, 'BM', '3000', NOW(), NOW() FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;
INSERT IGNORE INTO BMCs (routeName, taluk, bmcCode, bmcName, rtCd, bmcType, capacity, createdAt, updatedAt)
SELECT r.routeName, 'Chintamani', '7157', 'HIREKATTIGENAHALLY MPCS', NULL, 'BM', '3000', NOW(), NOW() FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;
INSERT IGNORE INTO BMCs (routeName, taluk, bmcCode, bmcName, rtCd, bmcType, capacity, createdAt, updatedAt)
SELECT r.routeName, 'Chintamani', '7317', 'ALAMBAGIRI MPCS', NULL, 'BM', '3000', NOW(), NOW() FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;
INSERT IGNORE INTO BMCs (routeName, taluk, bmcCode, bmcName, rtCd, bmcType, capacity, createdAt, updatedAt)
SELECT r.routeName, 'Chintamani', '7344', 'KATHARIGUPPA MPCS', NULL, 'BM', '2000', NOW(), NOW() FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;
INSERT IGNORE INTO BMCs (routeName, taluk, bmcCode, bmcName, rtCd, bmcType, capacity, createdAt, updatedAt)
SELECT r.routeName, 'Chintamani', '7394', 'NAYINDRAHALLI MPCS', NULL, 'BM', '2000', NOW(), NOW() FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;
INSERT IGNORE INTO BMCs (routeName, taluk, bmcCode, bmcName, rtCd, bmcType, capacity, createdAt, updatedAt)
SELECT r.routeName, 'Chintamani', '7422', 'JANGAMASHIGE HALLI MPCS', NULL, 'BM', '2000', NOW(), NOW() FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;
INSERT IGNORE INTO BMCs (routeName, taluk, bmcCode, bmcName, rtCd, bmcType, capacity, createdAt, updatedAt)
SELECT r.routeName, 'Chintamani', '7805', 'CHANDRAHALLI MPCS', NULL, 'BM', '3000', NOW(), NOW() FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;
INSERT IGNORE INTO BMCs (routeName, taluk, bmcCode, bmcName, rtCd, bmcType, capacity, createdAt, updatedAt)
SELECT r.routeName, 'Chintamani', '7816', 'KAPPALI MPCS', NULL, 'BM', '3000', NOW(), NOW() FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;
INSERT IGNORE INTO BMCs (routeName, taluk, bmcCode, bmcName, rtCd, bmcType, capacity, createdAt, updatedAt)
SELECT r.routeName, 'Chintamani', '8207', 'SHETTIHALLI MPCS', NULL, 'BM', '2000', NOW(), NOW() FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;
INSERT IGNORE INTO BMCs (routeName, taluk, bmcCode, bmcName, rtCd, bmcType, capacity, createdAt, updatedAt)
SELECT r.routeName, 'Chintamani', '8386', 'PEDDUR MPCS', NULL, 'BM', '3000', NOW(), NOW() FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;
INSERT IGNORE INTO BMCs (routeName, taluk, bmcCode, bmcName, rtCd, bmcType, capacity, createdAt, updatedAt)
SELECT r.routeName, 'Chintamani', '8397', 'MUNGANAHALLI MPCS', NULL, 'BM', '3000', NOW(), NOW() FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;
INSERT IGNORE INTO BMCs (routeName, taluk, bmcCode, bmcName, rtCd, bmcType, capacity, createdAt, updatedAt)
SELECT r.routeName, 'Chintamani', '8477', 'MUTHAKADA HALLY MPCS', NULL, 'BM', '3000', NOW(), NOW() FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;
INSERT IGNORE INTO BMCs (routeName, taluk, bmcCode, bmcName, rtCd, bmcType, capacity, createdAt, updatedAt)
SELECT r.routeName, 'Chintamani', '9990', 'HOSAHUDYA MPCS', NULL, 'BM', '3000', NOW(), NOW() FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;
INSERT IGNORE INTO BMCs (routeName, taluk, bmcCode, bmcName, rtCd, bmcType, capacity, createdAt, updatedAt)
SELECT r.routeName, 'Gudibande', '2781', 'GUDIBANDE MPCS', NULL, 'BM', '3000', NOW(), NOW() FROM Routes r WHERE UPPER(r.taluk) = 'GUDIBANDE' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;
INSERT IGNORE INTO BMCs (routeName, taluk, bmcCode, bmcName, rtCd, bmcType, capacity, createdAt, updatedAt)
SELECT r.routeName, 'Gudibande', '3332', 'BATHALA HALLI(26rt)', NULL, 'BM', '3000', NOW(), NOW() FROM Routes r WHERE UPPER(r.taluk) = 'GUDIBANDE' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;
INSERT IGNORE INTO BMCs (routeName, taluk, bmcCode, bmcName, rtCd, bmcType, capacity, createdAt, updatedAt)
SELECT r.routeName, 'Gudibande', '5511', 'BEECHAGANAHALLY MPCS', NULL, 'BM', '3000', NOW(), NOW() FROM Routes r WHERE UPPER(r.taluk) = 'GUDIBANDE' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;
INSERT IGNORE INTO BMCs (routeName, taluk, bmcCode, bmcName, rtCd, bmcType, capacity, createdAt, updatedAt)
SELECT r.routeName, 'Gudibande', '5644', 'BOGENAHALLI MPCS', NULL, 'BM', '3000', NOW(), NOW() FROM Routes r WHERE UPPER(r.taluk) = 'GUDIBANDE' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;
INSERT IGNORE INTO BMCs (routeName, taluk, bmcCode, bmcName, rtCd, bmcType, capacity, createdAt, updatedAt)
SELECT r.routeName, 'Gudibande', '5881', 'SOMENAHALLI MPCS', NULL, 'BM', '3000', NOW(), NOW() FROM Routes r WHERE UPPER(r.taluk) = 'GUDIBANDE' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;
INSERT IGNORE INTO BMCs (routeName, taluk, bmcCode, bmcName, rtCd, bmcType, capacity, createdAt, updatedAt)
SELECT r.routeName, 'Gudibande', '8154', 'VARALAKONDA MPCS', NULL, 'BM', '3000', NOW(), NOW() FROM Routes r WHERE UPPER(r.taluk) = 'GUDIBANDE' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;
INSERT IGNORE INTO BMCs (routeName, taluk, bmcCode, bmcName, rtCd, bmcType, capacity, createdAt, updatedAt)
SELECT r.routeName, 'Gudibande', '8336', 'HAMPASANDRA MPCS', NULL, 'BM', '3000', NOW(), NOW() FROM Routes r WHERE UPPER(r.taluk) = 'GUDIBANDE' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;
INSERT IGNORE INTO BMCs (routeName, taluk, bmcCode, bmcName, rtCd, bmcType, capacity, createdAt, updatedAt)
SELECT r.routeName, 'Gudibande', '9623', 'IDRAHALLI MPCS', NULL, 'BM', '2000', NOW(), NOW() FROM Routes r WHERE UPPER(r.taluk) = 'GUDIBANDE' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;
INSERT IGNORE INTO BMCs (routeName, taluk, bmcCode, bmcName, rtCd, bmcType, capacity, createdAt, updatedAt)
SELECT r.routeName, 'Gauribidanur', '360', 'DYAVARAHALLY', NULL, 'BM', '3000', NOW(), NOW() FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;
INSERT IGNORE INTO BMCs (routeName, taluk, bmcCode, bmcName, rtCd, bmcType, capacity, createdAt, updatedAt)
SELECT r.routeName, 'Gauribidanur', '3339', 'M.NAGENAHALLI', NULL, 'BM', '3000', NOW(), NOW() FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;
INSERT IGNORE INTO BMCs (routeName, taluk, bmcCode, bmcName, rtCd, bmcType, capacity, createdAt, updatedAt)
SELECT r.routeName, 'Gauribidanur', '4136', 'KALINAYAKANA HALLY MPCS', NULL, 'BM', '3000', NOW(), NOW() FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;
INSERT IGNORE INTO BMCs (routeName, taluk, bmcCode, bmcName, rtCd, bmcType, capacity, createdAt, updatedAt)
SELECT r.routeName, 'Gauribidanur', '4158', 'ALKAPURA MPCS', NULL, 'BM', '3000', NOW(), NOW() FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;
INSERT IGNORE INTO BMCs (routeName, taluk, bmcCode, bmcName, rtCd, bmcType, capacity, createdAt, updatedAt)
SELECT r.routeName, 'Gauribidanur', '4191', 'DARINAYAKANAPALAYA MPCS', NULL, 'BM', '3000', NOW(), NOW() FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;
INSERT IGNORE INTO BMCs (routeName, taluk, bmcCode, bmcName, rtCd, bmcType, capacity, createdAt, updatedAt)
SELECT r.routeName, 'Gauribidanur', '4249', 'HAMPASANDRA MPCS', NULL, 'BM', '3000', NOW(), NOW() FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;
INSERT IGNORE INTO BMCs (routeName, taluk, bmcCode, bmcName, rtCd, bmcType, capacity, createdAt, updatedAt)
SELECT r.routeName, 'Gauribidanur', '4260', 'HALEUPPARAHALLY MPCS', NULL, 'BM', '3000', NOW(), NOW() FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;
INSERT IGNORE INTO BMCs (routeName, taluk, bmcCode, bmcName, rtCd, bmcType, capacity, createdAt, updatedAt)
SELECT r.routeName, 'Gauribidanur', '4271', 'GEDARE MPCS', NULL, 'BM', '3000', NOW(), NOW() FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;
INSERT IGNORE INTO BMCs (routeName, taluk, bmcCode, bmcName, rtCd, bmcType, capacity, createdAt, updatedAt)
SELECT r.routeName, 'Gauribidanur', '4307', 'KUROODI MPCS', NULL, 'BM', '3000', NOW(), NOW() FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;
INSERT IGNORE INTO BMCs (routeName, taluk, bmcCode, bmcName, rtCd, bmcType, capacity, createdAt, updatedAt)
SELECT r.routeName, 'Gauribidanur', '4544', 'UPPARAHALLY MPCS', NULL, 'BM', '3000', NOW(), NOW() FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;
INSERT IGNORE INTO BMCs (routeName, taluk, bmcCode, bmcName, rtCd, bmcType, capacity, createdAt, updatedAt)
SELECT r.routeName, 'Gauribidanur', '4624', 'NAMAGONDLU MPCS', NULL, 'BM', '3000', NOW(), NOW() FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;
INSERT IGNORE INTO BMCs (routeName, taluk, bmcCode, bmcName, rtCd, bmcType, capacity, createdAt, updatedAt)
SELECT r.routeName, 'Gauribidanur', '4635', 'HUDUGUR MPCS', NULL, 'BM', '3000', NOW(), NOW() FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;
INSERT IGNORE INTO BMCs (routeName, taluk, bmcCode, bmcName, rtCd, bmcType, capacity, createdAt, updatedAt)
SELECT r.routeName, 'Gauribidanur', '4646', 'DODDAMALLAKERE MPCS', NULL, 'BM', '3000', NOW(), NOW() FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;
INSERT IGNORE INTO BMCs (routeName, taluk, bmcCode, bmcName, rtCd, bmcType, capacity, createdAt, updatedAt)
SELECT r.routeName, 'Gauribidanur', '4679', 'MELYA MPCS', NULL, 'BM', '3000', NOW(), NOW() FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;
INSERT IGNORE INTO BMCs (routeName, taluk, bmcCode, bmcName, rtCd, bmcType, capacity, createdAt, updatedAt)
SELECT r.routeName, 'Gauribidanur', '4737', 'TARIDALU MPCS', NULL, 'BM', '3000', NOW(), NOW() FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;
INSERT IGNORE INTO BMCs (routeName, taluk, bmcCode, bmcName, rtCd, bmcType, capacity, createdAt, updatedAt)
SELECT r.routeName, 'Gauribidanur', '4759', 'GUNDLAKOTHUR MPCS', NULL, 'BM', '3000', NOW(), NOW() FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;
INSERT IGNORE INTO BMCs (routeName, taluk, bmcCode, bmcName, rtCd, bmcType, capacity, createdAt, updatedAt)
SELECT r.routeName, 'Gauribidanur', '5635', 'KAMAREDDY HALLI', NULL, 'BM', '3000', NOW(), NOW() FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;
INSERT IGNORE INTO BMCs (routeName, taluk, bmcCode, bmcName, rtCd, bmcType, capacity, createdAt, updatedAt)
SELECT r.routeName, 'Gauribidanur', '5922', 'THONDEBAVI MPCS', NULL, 'BM', '3000', NOW(), NOW() FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;
INSERT IGNORE INTO BMCs (routeName, taluk, bmcCode, bmcName, rtCd, bmcType, capacity, createdAt, updatedAt)
SELECT r.routeName, 'Gauribidanur', '5955', 'SADENAHALLY MPCS', NULL, 'BM', '3000', NOW(), NOW() FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;
INSERT IGNORE INTO BMCs (routeName, taluk, bmcCode, bmcName, rtCd, bmcType, capacity, createdAt, updatedAt)
SELECT r.routeName, 'Gauribidanur', '5977', 'MINAKANAGURKI MPCS', NULL, 'BM', '3000', NOW(), NOW() FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;
INSERT IGNORE INTO BMCs (routeName, taluk, bmcCode, bmcName, rtCd, bmcType, capacity, createdAt, updatedAt)
SELECT r.routeName, 'Gauribidanur', '5988', 'HANUMANTHAPURA MPCS', NULL, 'BM', '3000', NOW(), NOW() FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;
INSERT IGNORE INTO BMCs (routeName, taluk, bmcCode, bmcName, rtCd, bmcType, capacity, createdAt, updatedAt)
SELECT r.routeName, 'Gauribidanur', '6007', 'BISALAHALLI MPCS', NULL, 'BM', '3000', NOW(), NOW() FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;
INSERT IGNORE INTO BMCs (routeName, taluk, bmcCode, bmcName, rtCd, bmcType, capacity, createdAt, updatedAt)
SELECT r.routeName, 'Gauribidanur', '6109', 'NAGARAGERE MPCS', NULL, 'BM', '3000', NOW(), NOW() FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;
INSERT IGNORE INTO BMCs (routeName, taluk, bmcCode, bmcName, rtCd, bmcType, capacity, createdAt, updatedAt)
SELECT r.routeName, 'Gauribidanur', '6550', 'SARAGONDLU MPCS', NULL, 'BM', '3000', NOW(), NOW() FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;
INSERT IGNORE INTO BMCs (routeName, taluk, bmcCode, bmcName, rtCd, bmcType, capacity, createdAt, updatedAt)
SELECT r.routeName, 'Gauribidanur', '8217', 'HALEHALLY MPCS', NULL, 'BM', '3000', NOW(), NOW() FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;
INSERT IGNORE INTO BMCs (routeName, taluk, bmcCode, bmcName, rtCd, bmcType, capacity, createdAt, updatedAt)
SELECT r.routeName, 'Gauribidanur', '8294', 'H.NAGASANDRA MPCS', NULL, 'BM', '3000', NOW(), NOW() FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;
INSERT IGNORE INTO BMCs (routeName, taluk, bmcCode, bmcName, rtCd, bmcType, capacity, createdAt, updatedAt)
SELECT r.routeName, 'Gauribidanur', '8319', 'IDAGURU MPCS', NULL, 'BM', '3000', NOW(), NOW() FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;
INSERT IGNORE INTO BMCs (routeName, taluk, bmcCode, bmcName, rtCd, bmcType, capacity, createdAt, updatedAt)
SELECT r.routeName, 'Siddlaghatta', '373', 'KALANAYAKANAHALLY MPCS', NULL, 'BM', '3000', NOW(), NOW() FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;
INSERT IGNORE INTO BMCs (routeName, taluk, bmcCode, bmcName, rtCd, bmcType, capacity, createdAt, updatedAt)
SELECT r.routeName, 'Siddlaghatta', '384', 'CHEEMANGALA MPCS', NULL, 'BM', '3000', NOW(), NOW() FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;
INSERT IGNORE INTO BMCs (routeName, taluk, bmcCode, bmcName, rtCd, bmcType, capacity, createdAt, updatedAt)
SELECT r.routeName, 'Siddlaghatta', '409', 'ANOORU MPCS', NULL, 'BM', '2000', NOW(), NOW() FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;
INSERT IGNORE INTO BMCs (routeName, taluk, bmcCode, bmcName, rtCd, bmcType, capacity, createdAt, updatedAt)
SELECT r.routeName, 'Siddlaghatta', '411', 'THIPPENAHALLY MPCS', NULL, 'BM', '2000', NOW(), NOW() FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;
INSERT IGNORE INTO BMCs (routeName, taluk, bmcCode, bmcName, rtCd, bmcType, capacity, createdAt, updatedAt)
SELECT r.routeName, 'Siddlaghatta', '420', 'BELUTI MPCS', NULL, 'BM', '3000', NOW(), NOW() FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;
INSERT IGNORE INTO BMCs (routeName, taluk, bmcCode, bmcName, rtCd, bmcType, capacity, createdAt, updatedAt)
SELECT r.routeName, 'Siddlaghatta', '442', 'HEMARLAHALLY MPCS', NULL, 'BM', '3000', NOW(), NOW() FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;
INSERT IGNORE INTO BMCs (routeName, taluk, bmcCode, bmcName, rtCd, bmcType, capacity, createdAt, updatedAt)
SELECT r.routeName, 'Siddlaghatta', '453', 'HITTALAHALLY MPCS', NULL, 'BM', '2000', NOW(), NOW() FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;
INSERT IGNORE INTO BMCs (routeName, taluk, bmcCode, bmcName, rtCd, bmcType, capacity, createdAt, updatedAt)
SELECT r.routeName, 'Siddlaghatta', '569', 'HANDIGANALA', NULL, 'BM', '2000', NOW(), NOW() FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;
INSERT IGNORE INTO BMCs (routeName, taluk, bmcCode, bmcName, rtCd, bmcType, capacity, createdAt, updatedAt)
SELECT r.routeName, 'Siddlaghatta', '770', 'BALUVANAHALLI MPCS', NULL, 'BM', '3000', NOW(), NOW() FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;
INSERT IGNORE INTO BMCs (routeName, taluk, bmcCode, bmcName, rtCd, bmcType, capacity, createdAt, updatedAt)
SELECT r.routeName, 'Siddlaghatta', '805', 'MELUR MPCS', NULL, 'BM', '2000', NOW(), NOW() FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;
INSERT IGNORE INTO BMCs (routeName, taluk, bmcCode, bmcName, rtCd, bmcType, capacity, createdAt, updatedAt)
SELECT r.routeName, 'Siddlaghatta', '816', 'BHAKATHARAHALLI MPCS', NULL, 'BM', '3000', NOW(), NOW() FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;
INSERT IGNORE INTO BMCs (routeName, taluk, bmcCode, bmcName, rtCd, bmcType, capacity, createdAt, updatedAt)
SELECT r.routeName, 'Siddlaghatta', '838', 'MUTHUR MPCS', NULL, 'BM', '2000', NOW(), NOW() FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;
INSERT IGNORE INTO BMCs (routeName, taluk, bmcCode, bmcName, rtCd, bmcType, capacity, createdAt, updatedAt)
SELECT r.routeName, 'Siddlaghatta', '1222', 'HIREBALLA MPCS', NULL, 'BM', '3000', NOW(), NOW() FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;
INSERT IGNORE INTO BMCs (routeName, taluk, bmcCode, bmcName, rtCd, bmcType, capacity, createdAt, updatedAt)
SELECT r.routeName, 'Siddlaghatta', '1514', 'BYRASANDRA MPCS', NULL, 'BM', '2000', NOW(), NOW() FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;
INSERT IGNORE INTO BMCs (routeName, taluk, bmcCode, bmcName, rtCd, bmcType, capacity, createdAt, updatedAt)
SELECT r.routeName, 'Siddlaghatta', '1536', 'HOSPETE MPCS', NULL, 'BM', '3000', NOW(), NOW() FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;
INSERT IGNORE INTO BMCs (routeName, taluk, bmcCode, bmcName, rtCd, bmcType, capacity, createdAt, updatedAt)
SELECT r.routeName, 'Siddlaghatta', '1547', 'NADAPINAYANAHALLI MPCS', NULL, 'BM', '3000', NOW(), NOW() FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;
INSERT IGNORE INTO BMCs (routeName, taluk, bmcCode, bmcName, rtCd, bmcType, capacity, createdAt, updatedAt)
SELECT r.routeName, 'Siddlaghatta', '1558', 'NAGAMANGALA MPCS', NULL, 'BM', '3000', NOW(), NOW() FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;
INSERT IGNORE INTO BMCs (routeName, taluk, bmcCode, bmcName, rtCd, bmcType, capacity, createdAt, updatedAt)
SELECT r.routeName, 'Siddlaghatta', '1577', 'THOUDUR MPCS', NULL, 'BM', '2000', NOW(), NOW() FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;
INSERT IGNORE INTO BMCs (routeName, taluk, bmcCode, bmcName, rtCd, bmcType, capacity, createdAt, updatedAt)
SELECT r.routeName, 'Siddlaghatta', '1580', 'MALAMACHANAHALLY MPCS', NULL, 'BM', '5000', NOW(), NOW() FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;
INSERT IGNORE INTO BMCs (routeName, taluk, bmcCode, bmcName, rtCd, bmcType, capacity, createdAt, updatedAt)
SELECT r.routeName, 'Siddlaghatta', '1638', 'CHEEMANAHALLI MPCS', NULL, 'BM', '3000', NOW(), NOW() FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;
INSERT IGNORE INTO BMCs (routeName, taluk, bmcCode, bmcName, rtCd, bmcType, capacity, createdAt, updatedAt)
SELECT r.routeName, 'Siddlaghatta', '1794', 'MALLUR MPCS', NULL, 'BM', '2000', NOW(), NOW() FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;
INSERT IGNORE INTO BMCs (routeName, taluk, bmcCode, bmcName, rtCd, bmcType, capacity, createdAt, updatedAt)
SELECT r.routeName, 'Siddlaghatta', '2109', 'THUMMANAHALLI MPCS', NULL, 'BM', '3000', NOW(), NOW() FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;
INSERT IGNORE INTO BMCs (routeName, taluk, bmcCode, bmcName, rtCd, bmcType, capacity, createdAt, updatedAt)
SELECT r.routeName, 'Siddlaghatta', '2164', 'A.HUNASENAHALLY MPCS', NULL, 'BM', '3000', NOW(), NOW() FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;
INSERT IGNORE INTO BMCs (routeName, taluk, bmcCode, bmcName, rtCd, bmcType, capacity, createdAt, updatedAt)
SELECT r.routeName, 'Siddlaghatta', '2205', 'GOWDANAHALLY', NULL, 'BM', '3000', NOW(), NOW() FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;
INSERT IGNORE INTO BMCs (routeName, taluk, bmcCode, bmcName, rtCd, bmcType, capacity, createdAt, updatedAt)
SELECT r.routeName, 'Siddlaghatta', '2216', 'VANTUR MPCS', NULL, 'BM', '3000', NOW(), NOW() FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;
INSERT IGNORE INTO BMCs (routeName, taluk, bmcCode, bmcName, rtCd, bmcType, capacity, createdAt, updatedAt)
SELECT r.routeName, 'Siddlaghatta', '2238', 'BASHETTIHALLY MPCS', NULL, 'BM', '3000', NOW(), NOW() FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;
INSERT IGNORE INTO BMCs (routeName, taluk, bmcCode, bmcName, rtCd, bmcType, capacity, createdAt, updatedAt)
SELECT r.routeName, 'Siddlaghatta', '2249', 'ANEMADAGU MPCS', NULL, 'BM', '3000', NOW(), NOW() FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;
INSERT IGNORE INTO BMCs (routeName, taluk, bmcCode, bmcName, rtCd, bmcType, capacity, createdAt, updatedAt)
SELECT r.routeName, 'Siddlaghatta', '2255', 'DODDATHEKALAHALLY MPCS', NULL, 'BM', '3000', NOW(), NOW() FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;
INSERT IGNORE INTO BMCs (routeName, taluk, bmcCode, bmcName, rtCd, bmcType, capacity, createdAt, updatedAt)
SELECT r.routeName, 'Siddlaghatta', '2282', 'SHETTIHALLI MPCS', NULL, 'BM', '3000', NOW(), NOW() FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;
INSERT IGNORE INTO BMCs (routeName, taluk, bmcCode, bmcName, rtCd, bmcType, capacity, createdAt, updatedAt)
SELECT r.routeName, 'Siddlaghatta', '2293', 'ABLOODU MPCS', NULL, 'BM', '3000', NOW(), NOW() FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;
INSERT IGNORE INTO BMCs (routeName, taluk, bmcCode, bmcName, rtCd, bmcType, capacity, createdAt, updatedAt)
SELECT r.routeName, 'Siddlaghatta', '2373', 'GANJIGUNTE MPCS', NULL, 'BM', '3000', NOW(), NOW() FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;
INSERT IGNORE INTO BMCs (routeName, taluk, bmcCode, bmcName, rtCd, bmcType, capacity, createdAt, updatedAt)
SELECT r.routeName, 'Siddlaghatta', '2486', 'E.THIMMASANDRA MPCS', NULL, 'BM', '3000', NOW(), NOW() FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;
INSERT IGNORE INTO BMCs (routeName, taluk, bmcCode, bmcName, rtCd, bmcType, capacity, createdAt, updatedAt)
SELECT r.routeName, 'Siddlaghatta', '4045', 'CHOWDASANDRA MPCS', NULL, 'BM', '2000', NOW(), NOW() FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;
INSERT IGNORE INTO BMCs (routeName, taluk, bmcCode, bmcName, rtCd, bmcType, capacity, createdAt, updatedAt)
SELECT r.routeName, 'Siddlaghatta', '4443', 'GHATTAMARANA HALLI', NULL, 'BM', '2000', NOW(), NOW() FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;
INSERT IGNORE INTO BMCs (routeName, taluk, bmcCode, bmcName, rtCd, bmcType, capacity, createdAt, updatedAt)
SELECT r.routeName, 'Siddlaghatta', '4920', 'DEVARAMALLUR MPCS', NULL, 'BM', '3000', NOW(), NOW() FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;
INSERT IGNORE INTO BMCs (routeName, taluk, bmcCode, bmcName, rtCd, bmcType, capacity, createdAt, updatedAt)
SELECT r.routeName, 'Siddlaghatta', '4931', 'KOTHANUR MPCS', NULL, 'BM', '3000', NOW(), NOW() FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;
INSERT IGNORE INTO BMCs (routeName, taluk, bmcCode, bmcName, rtCd, bmcType, capacity, createdAt, updatedAt)
SELECT r.routeName, 'Siddlaghatta', '5161', 'L.MUTHAKADAHALLY MPCS', NULL, 'BM', '3000', NOW(), NOW() FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;
INSERT IGNORE INTO BMCs (routeName, taluk, bmcCode, bmcName, rtCd, bmcType, capacity, createdAt, updatedAt)
SELECT r.routeName, 'Siddlaghatta', '5209', 'KUNDALAGURUKI MPCS', NULL, 'BM', '3000', NOW(), NOW() FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;
INSERT IGNORE INTO BMCs (routeName, taluk, bmcCode, bmcName, rtCd, bmcType, capacity, createdAt, updatedAt)
SELECT r.routeName, 'Siddlaghatta', '5214', 'PALLICHERLU MPCS', NULL, 'BM', '3000', NOW(), NOW() FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;
INSERT IGNORE INTO BMCs (routeName, taluk, bmcCode, bmcName, rtCd, bmcType, capacity, createdAt, updatedAt)
SELECT r.routeName, 'Siddlaghatta', '5225', 'LAGINAYAKANAHALLY MPCS', NULL, 'BM', '3000', NOW(), NOW() FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;
INSERT IGNORE INTO BMCs (routeName, taluk, bmcCode, bmcName, rtCd, bmcType, capacity, createdAt, updatedAt)
SELECT r.routeName, 'Siddlaghatta', '5253', 'DOGARANAYAKANAHALLY MPCS', NULL, 'BM', '3000', NOW(), NOW() FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;
INSERT IGNORE INTO BMCs (routeName, taluk, bmcCode, bmcName, rtCd, bmcType, capacity, createdAt, updatedAt)
SELECT r.routeName, 'Siddlaghatta', '5366', 'SEEGEHALLY MPCS', NULL, 'BM', '3000', NOW(), NOW() FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;
INSERT IGNORE INTO BMCs (routeName, taluk, bmcCode, bmcName, rtCd, bmcType, capacity, createdAt, updatedAt)
SELECT r.routeName, 'Siddlaghatta', '5553', 'SADALI MPCS', NULL, 'BM', '3000', NOW(), NOW() FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;
INSERT IGNORE INTO BMCs (routeName, taluk, bmcCode, bmcName, rtCd, bmcType, capacity, createdAt, updatedAt)
SELECT r.routeName, 'Siddlaghatta', '5564', 'IRAGAPPANAHALLI MPCS', NULL, 'BM', '3000', NOW(), NOW() FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;
INSERT IGNORE INTO BMCs (routeName, taluk, bmcCode, bmcName, rtCd, bmcType, capacity, createdAt, updatedAt)
SELECT r.routeName, 'Siddlaghatta', '5832', 'K.MUTHUKADAHALLI MPCS', NULL, 'BM', '3000', NOW(), NOW() FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;
INSERT IGNORE INTO BMCs (routeName, taluk, bmcCode, bmcName, rtCd, bmcType, capacity, createdAt, updatedAt)
SELECT r.routeName, 'Siddlaghatta', '6528', 'APPEGOWDANAHALLI MPCS', NULL, 'BM', '2000', NOW(), NOW() FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;
INSERT IGNORE INTO BMCs (routeName, taluk, bmcCode, bmcName, rtCd, bmcType, capacity, createdAt, updatedAt)
SELECT r.routeName, 'Siddlaghatta', '6539', 'SEETHAHALLI MPCS', NULL, 'BM', '2000', NOW(), NOW() FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;
INSERT IGNORE INTO BMCs (routeName, taluk, bmcCode, bmcName, rtCd, bmcType, capacity, createdAt, updatedAt)
SELECT r.routeName, 'Siddlaghatta', '7339', 'DODDADASENAHALLI MPCS', NULL, 'BM', '3000', NOW(), NOW() FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;
INSERT IGNORE INTO BMCs (routeName, taluk, bmcCode, bmcName, rtCd, bmcType, capacity, createdAt, updatedAt)
SELECT r.routeName, 'Siddlaghatta', '8171', 'YENNANGUR MPCS', NULL, 'BM', '3000', NOW(), NOW() FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;
INSERT IGNORE INTO BMCs (routeName, taluk, bmcCode, bmcName, rtCd, bmcType, capacity, createdAt, updatedAt)
SELECT r.routeName, 'Siddlaghatta', '8400', 'GAMBHIRANAHALLI MPCS', NULL, 'BM', '3000', NOW(), NOW() FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;
INSERT IGNORE INTO BMCs (routeName, taluk, bmcCode, bmcName, rtCd, bmcType, capacity, createdAt, updatedAt)
SELECT r.routeName, 'Siddlaghatta', '8830', 'DODDADASARAHALLI MPCS', NULL, 'BM', '3000', NOW(), NOW() FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;
INSERT IGNORE INTO BMCs (routeName, taluk, bmcCode, bmcName, rtCd, bmcType, capacity, createdAt, updatedAt)
SELECT r.routeName, 'Siddlaghatta', '9549', 'VARADAHUNASENAHALLY MPCS', NULL, 'BM', '3000', NOW(), NOW() FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;
INSERT IGNORE INTO BMCs (routeName, taluk, bmcCode, bmcName, rtCd, bmcType, capacity, createdAt, updatedAt)
SELECT r.routeName, 'Siddlaghatta', '9560', 'THALADUMMANAHALLY MPCS', NULL, 'BM', '3000', NOW(), NOW() FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

-- ============================================================
-- Clusters (all rows)
-- ============================================================
INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '239' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '239', r.routeName, 'Bagepalli', NULL, 'BM', '3000', '239', 'BURAGAMADAGU', '239', 'BURAGAMADAGU', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'BAGEPALLI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '239' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '239', r.routeName, 'Bagepalli', NULL, 'CL', NULL, '8369', 'ACHEPALLY MPCS', '8369', 'ACHEPALLY MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'BAGEPALLI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '239' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '239', r.routeName, 'Bagepalli', NULL, 'CL', NULL, '7253', 'MALLIGURKI MPCS', '7253', 'MALLIGURKI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'BAGEPALLI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '239' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '239', r.routeName, 'Bagepalli', NULL, 'CL', NULL, '2225', 'MERUVAPALLI', '2225', 'MERUVAPALLI', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'BAGEPALLI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '239' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '239', r.routeName, 'Bagepalli', NULL, 'CL', NULL, '2070', 'CHOKKAMPALLI', '2070', 'CHOKKAMPALLI', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'BAGEPALLI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '239' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '239', r.routeName, 'Bagepalli', NULL, 'CL', NULL, '1606', 'POTLAVARIPALLI', '1606', 'POTLAVARIPALLI', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'BAGEPALLI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '239' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '239', r.routeName, 'Bagepalli', NULL, 'CL', NULL, '380', 'NEERAGANTAPALLI', '380', 'NEERAGANTAPALLI', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'BAGEPALLI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '239' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '239', r.routeName, 'Bagepalli', NULL, 'CL', NULL, '1895', 'PILLAGUTTA', '1895', 'PILLAGUTTA', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'BAGEPALLI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '239' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '239', r.routeName, 'Bagepalli', NULL, 'CL', NULL, '209', 'GURRALADINNE', '209', 'GURRALADINNE', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'BAGEPALLI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2089' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2089', r.routeName, 'Bagepalli', NULL, 'BM', '3000', '2089', 'GUNDLAPALLI MPCS', '2089', 'GUNDLAPALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'BAGEPALLI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2089' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2089', r.routeName, 'Bagepalli', NULL, 'CL', NULL, '5597', 'DEVARAGUDIPALLY MPCS', '5597', 'DEVARAGUDIPALLY MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'BAGEPALLI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2089' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2089', r.routeName, 'Bagepalli', NULL, 'CL', NULL, '5826', 'GUNTIGANAHALLI MPCS', '5826', 'GUNTIGANAHALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'BAGEPALLI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2089' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2089', r.routeName, 'Bagepalli', NULL, 'CL', NULL, '1074', 'JILAKARAPALLI MPCS', '1074', 'JILAKARAPALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'BAGEPALLI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2089' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2089', r.routeName, 'Bagepalli', NULL, 'CL', NULL, '7796', 'KANAGAMAKALAPALLI MPCS', '7796', 'KANAGAMAKALAPALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'BAGEPALLI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2089' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2089', r.routeName, 'Bagepalli', NULL, 'CL', NULL, '5622', 'KARAKURU MPCS', '5622', 'KARAKURU MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'BAGEPALLI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2089' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2089', r.routeName, 'Bagepalli', NULL, 'CL', NULL, '3245', 'MUDDALAKHANE', '3245', 'MUDDALAKHANE', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'BAGEPALLI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2089' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2089', r.routeName, 'Bagepalli', NULL, 'CL', NULL, '393', 'SHANKAMVARAPALLI', '393', 'SHANKAMVARAPALLI', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'BAGEPALLI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2089' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2089', r.routeName, 'Bagepalli', NULL, 'CL', NULL, '4946', 'THEEMAKALAPALLI MPCS', '4946', 'THEEMAKALAPALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'BAGEPALLI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2089' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2089', r.routeName, 'Bagepalli', NULL, 'CL', NULL, '1602', 'YALLAMPALLY', '1602', 'YALLAMPALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'BAGEPALLI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2089' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2089', r.routeName, 'Bagepalli', NULL, 'CL', NULL, '4010', 'GUNTIGANAHALLY(C)', '4010', 'GUNTIGANAHALLY(C)', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'BAGEPALLI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2103' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2103', r.routeName, 'Bagepalli', NULL, 'BM', '3000', '2103', 'BILLUR MPCS', '2103', 'BILLUR MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'BAGEPALLI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2103' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2103', r.routeName, 'Bagepalli', NULL, 'CL', NULL, '94', 'DEVARAJAPALLI', '94', 'DEVARAJAPALLI', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'BAGEPALLI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2103' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2103', r.routeName, 'Bagepalli', NULL, 'CL', NULL, '9882', 'KALLIPALLY MPCS', '9882', 'KALLIPALLY MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'BAGEPALLI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2103' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2103', r.routeName, 'Bagepalli', NULL, 'CL', NULL, '2322', 'AGATAMADAKA(A)', '2322', 'AGATAMADAKA(A)', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'BAGEPALLI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2103' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2103', r.routeName, 'Bagepalli', NULL, 'CL', NULL, '9612', 'NARAMUDDENAHALLI MPCS', '9612', 'NARAMUDDENAHALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'BAGEPALLI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2103' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2103', r.routeName, 'Bagepalli', NULL, 'CL', NULL, '5291', 'AGATIMADAKA', '5291', 'AGATIMADAKA', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'BAGEPALLI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2103' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2103', r.routeName, 'Bagepalli', NULL, 'CL', NULL, '9827', 'PEDDAREDDYPALLI MPCS', '9827', 'PEDDAREDDYPALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'BAGEPALLI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2103' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2103', r.routeName, 'Bagepalli', NULL, 'CL', NULL, '9703', 'GUTTAMINDAPALLY MPCS', '9703', 'GUTTAMINDAPALLY MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'BAGEPALLI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2103' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2103', r.routeName, 'Bagepalli', NULL, 'CL', NULL, '2178', 'BILLUR(A)', '2178', 'BILLUR(A)', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'BAGEPALLI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '3398' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '3398', r.routeName, 'Bagepalli', NULL, 'BM', '3000', '3398', 'NANJA REDDY PALLI MPCS', '3398', 'NANJA REDDY PALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'BAGEPALLI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '3398' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '3398', r.routeName, 'Bagepalli', NULL, 'CL', NULL, '2023', 'DORANALAPALLI MPCS', '2023', 'DORANALAPALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'BAGEPALLI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '3398' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '3398', r.routeName, 'Bagepalli', NULL, 'CL', NULL, '4038', 'NANJAREDDYPALLI(B)', '4038', 'NANJAREDDYPALLI(B)', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'BAGEPALLI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '3398' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '3398', r.routeName, 'Bagepalli', NULL, 'CL', NULL, '9736', 'THIMAMPALLY MPCS', '9736', 'THIMAMPALLY MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'BAGEPALLI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5509' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5509', r.routeName, 'Bagepalli', NULL, 'BM', '3000', '5509', 'PARAGODU MPCS', '5509', 'PARAGODU MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'BAGEPALLI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5509' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5509', r.routeName, 'Bagepalli', NULL, 'CL', NULL, '4029', 'DEVAREDDYPALLY MPCS', '4029', 'DEVAREDDYPALLY MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'BAGEPALLI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5509' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5509', r.routeName, 'Bagepalli', NULL, 'CL', NULL, '5633', 'HOSAKOTE MPCS', '5633', 'HOSAKOTE MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'BAGEPALLI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5509' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5509', r.routeName, 'Bagepalli', NULL, 'CL', NULL, '1608', 'K.HOSAHUDYA', '1608', 'K.HOSAHUDYA', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'BAGEPALLI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5509' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5509', r.routeName, 'Bagepalli', NULL, 'CL', NULL, '8824', 'POOLAVARI PALLI MPCS', '8824', 'POOLAVARI PALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'BAGEPALLI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5509' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5509', r.routeName, 'Bagepalli', NULL, 'CL', NULL, '5688', 'PUTTAPARTHI', '5688', 'PUTTAPARTHI', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'BAGEPALLI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5509' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5509', r.routeName, 'Bagepalli', NULL, 'CL', NULL, '1370', 'SRINIVASAPURA MPCS', '1370', 'SRINIVASAPURA MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'BAGEPALLI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5509' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5509', r.routeName, 'Bagepalli', NULL, 'CL', NULL, '7016', 'VADDRA PALYA', '7016', 'VADDRA PALYA', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'BAGEPALLI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5509' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5509', r.routeName, 'Bagepalli', NULL, 'CL', NULL, '2114', 'YETAGADDAPALLI MPCS', '2114', 'YETAGADDAPALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'BAGEPALLI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5509' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5509', r.routeName, 'Bagepalli', NULL, 'CL', NULL, '4006', 'PUTTAPARTHY(B)', '4006', 'PUTTAPARTHY(B)', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'BAGEPALLI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5600' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5600', r.routeName, 'Bagepalli', NULL, 'BM', '3000', '5600', 'GOOLURU MPCS', '5600', 'GOOLURU MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'BAGEPALLI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5600' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5600', r.routeName, 'Bagepalli', NULL, 'CL', NULL, '716', 'BRAHMANARAHALLY', '716', 'BRAHMANARAHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'BAGEPALLI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5600' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5600', r.routeName, 'Bagepalli', NULL, 'CL', NULL, '1443', 'DIGUVA MADDALAKHANE', '1443', 'DIGUVA MADDALAKHANE', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'BAGEPALLI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5600' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5600', r.routeName, 'Bagepalli', NULL, 'CL', NULL, '6319', 'MARGANAKUNTE MPCS', '6319', 'MARGANAKUNTE MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'BAGEPALLI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5600' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5600', r.routeName, 'Bagepalli', NULL, 'CL', NULL, '757', 'KOTHAKOTE', '757', 'KOTHAKOTE', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'BAGEPALLI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '6625' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '6625', r.routeName, 'Bagepalli', NULL, 'BM', '3000', '6625', 'POLANAYAKANAHALLI MPCS', '6625', 'POLANAYAKANAHALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'BAGEPALLI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '6625' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '6625', r.routeName, 'Bagepalli', NULL, 'CL', NULL, '6647', 'VASAPPARALLAPALLI MPCS', '6647', 'VASAPPARALLAPALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'BAGEPALLI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '6625' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '6625', r.routeName, 'Bagepalli', NULL, 'CL', NULL, '2078', 'PAIPALYA MPCS', '2078', 'PAIPALYA MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'BAGEPALLI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '6625' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '6625', r.routeName, 'Bagepalli', NULL, 'CL', NULL, '1974', 'SRIDHARAVARAPALLI', '1974', 'SRIDHARAVARAPALLI', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'BAGEPALLI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '6625' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '6625', r.routeName, 'Bagepalli', NULL, 'CL', NULL, '69', 'KANAMPALLI', '69', 'KANAMPALLI', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'BAGEPALLI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '6625' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '6625', r.routeName, 'Bagepalli', NULL, 'CL', NULL, '4650', 'PEDDA NAGARLU', '4650', 'PEDDA NAGARLU', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'BAGEPALLI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '6625' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '6625', r.routeName, 'Bagepalli', NULL, 'CL', NULL, '2097', 'BATHALAPALLI', '2097', 'BATHALAPALLI', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'BAGEPALLI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '6625' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '6625', r.routeName, 'Bagepalli', NULL, 'CL', NULL, '6636', 'ACHAGANAHALLI MPCS', '6636', 'ACHAGANAHALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'BAGEPALLI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '6625' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '6625', r.routeName, 'Bagepalli', NULL, 'CL', NULL, '6669', 'KALAPPARALLAPALLI MPCS', '6669', 'KALAPPARALLAPALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'BAGEPALLI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '6625' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '6625', r.routeName, 'Bagepalli', NULL, 'CL', NULL, '6677', 'JOOLAPALYA MPCS', '6677', 'JOOLAPALYA MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'BAGEPALLI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '6625' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '6625', r.routeName, 'Bagepalli', NULL, 'CL', NULL, '5199', 'BALE HOSHAHALLI MPCS', '5199', 'BALE HOSHAHALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'BAGEPALLI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '6625' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '6625', r.routeName, 'Bagepalli', NULL, 'CL', NULL, '9699', 'GUJJEPALLY MPCS', '9699', 'GUJJEPALLY MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'BAGEPALLI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '6625' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '6625', r.routeName, 'Bagepalli', NULL, 'CL', NULL, '9188', 'GUDIPALLI MPCS', '9188', 'GUDIPALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'BAGEPALLI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '9667' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '9667', r.routeName, 'Bagepalli', NULL, 'BM', '3000', '9667', 'CHELURU MPCS', '9667', 'CHELURU MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'BAGEPALLI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '9667' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '9667', r.routeName, 'Bagepalli', NULL, 'CL', NULL, '9016', 'M.NALLAGUTTAHALLI', '9016', 'M.NALLAGUTTAHALLI', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'BAGEPALLI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '9667' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '9667', r.routeName, 'Bagepalli', NULL, 'CL', NULL, '9678', 'VENKATAPURA MPCS', '9678', 'VENKATAPURA MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'BAGEPALLI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '9667' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '9667', r.routeName, 'Bagepalli', NULL, 'CL', NULL, '7876', 'PALYAKERE MPCS', '7876', 'PALYAKERE MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'BAGEPALLI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '9667' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '9667', r.routeName, 'Bagepalli', NULL, 'CL', NULL, '1248', 'HOSAHUDYA(CHELUR)', '1248', 'HOSAHUDYA(CHELUR)', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'BAGEPALLI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '9667' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '9667', r.routeName, 'Bagepalli', NULL, 'CL', NULL, '3247', 'C-GUTTA', '3247', 'C-GUTTA', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'BAGEPALLI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '9714' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '9714', r.routeName, 'Bagepalli', NULL, 'BM', '2000', '9714', 'RASCHERAVU MPCS', '9714', 'RASCHERAVU MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'BAGEPALLI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '9714' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '9714', r.routeName, 'Bagepalli', NULL, 'CL', NULL, '2001', 'DIGUVA GOLLAHALLI MPCS', '2001', 'DIGUVA GOLLAHALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'BAGEPALLI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '9714' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '9714', r.routeName, 'Bagepalli', NULL, 'CL', NULL, '1440', 'SOMAKALAPALLI', '1440', 'SOMAKALAPALLI', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'BAGEPALLI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '9860' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '9860', r.routeName, 'Bagepalli', NULL, 'BM', '3000', '9860', 'MALLASANDRA MPCS', '9860', 'MALLASANDRA MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'BAGEPALLI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '9860' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '9860', r.routeName, 'Bagepalli', NULL, 'CL', NULL, '2039', 'KADIRANNAGARAPALLI', '2039', 'KADIRANNAGARAPALLI', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'BAGEPALLI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '9860' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '9860', r.routeName, 'Bagepalli', NULL, 'CL', NULL, '1561', 'MOTAKAPALLI MPCS', '1561', 'MOTAKAPALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'BAGEPALLI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '9860' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '9860', r.routeName, 'Bagepalli', NULL, 'CL', NULL, '3268', 'MALLAKACHERUVAPALLI', '3268', 'MALLAKACHERUVAPALLI', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'BAGEPALLI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '9860' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '9860', r.routeName, 'Bagepalli', NULL, 'CL', NULL, '142', 'SADLAWARAPALLI', '142', 'SADLAWARAPALLI', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'BAGEPALLI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '9860' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '9860', r.routeName, 'Bagepalli', NULL, 'CL', NULL, '5611', 'NALLAPPAREDDYPALLY MPCS', '5611', 'NALLAPPAREDDYPALLY MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'BAGEPALLI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '9860' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '9860', r.routeName, 'Bagepalli', NULL, 'CL', NULL, '9361', 'POTHE PALLI MPCS', '9361', 'POTHE PALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'BAGEPALLI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '9860' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '9860', r.routeName, 'Bagepalli', NULL, 'CL', NULL, '2125', 'PENUMALE MPCS', '2125', 'PENUMALE MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'BAGEPALLI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '9860' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '9860', r.routeName, 'Bagepalli', NULL, 'CL', NULL, '4952', 'M.CHERUVALAPALLI MPCS', '4952', 'M.CHERUVALAPALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'BAGEPALLI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '9860' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '9860', r.routeName, 'Bagepalli', NULL, 'CL', NULL, '202', 'GOWNIPALLY', '202', 'GOWNIPALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'BAGEPALLI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '9860' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '9860', r.routeName, 'Bagepalli', NULL, 'CL', NULL, '4064', 'NALLAPAREDDYPALLI(A)', '4064', 'NALLAPAREDDYPALLI(A)', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'BAGEPALLI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '9860' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '9860', r.routeName, 'Bagepalli', NULL, 'CL', NULL, '44', 'BALAREDDYPALLI', '44', 'BALAREDDYPALLI', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'BAGEPALLI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '9871' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '9871', r.routeName, 'Bagepalli', NULL, 'BM', '3000', '9871', 'SOMANATHAPURA MPCS', '9871', 'SOMANATHAPURA MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'BAGEPALLI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '9871' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '9871', r.routeName, 'Bagepalli', NULL, 'CL', NULL, '7377', 'NAKKALA PALLI MPCS', '7377', 'NAKKALA PALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'BAGEPALLI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '9871' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '9871', r.routeName, 'Bagepalli', NULL, 'CL', NULL, '54', 'MOOGIREDDYPALLI', '54', 'MOOGIREDDYPALLI', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'BAGEPALLI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '9871' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '9871', r.routeName, 'Bagepalli', NULL, 'CL', NULL, '61', 'MARIMAKALAPALLI', '61', 'MARIMAKALAPALLI', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'BAGEPALLI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '9871' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '9871', r.routeName, 'Bagepalli', NULL, 'CL', NULL, '1011', 'DEVARALA HALLI', '1011', 'DEVARALA HALLI', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'BAGEPALLI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '9871' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '9871', r.routeName, 'Bagepalli', NULL, 'CL', NULL, '3222', 'MUDDALAPALLI MPCS', '3222', 'MUDDALAPALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'BAGEPALLI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '9871' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '9871', r.routeName, 'Bagepalli', NULL, 'CL', NULL, '8915', 'GOLLAPALLI MPCS', '8915', 'GOLLAPALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'BAGEPALLI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '9871' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '9871', r.routeName, 'Bagepalli', NULL, 'CL', NULL, '2861', 'KAMASANAPALLI', '2861', 'KAMASANAPALLI', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'BAGEPALLI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '9871' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '9871', r.routeName, 'Bagepalli', NULL, 'CL', NULL, '4049', 'GOLLAPALLI(B)', '4049', 'GOLLAPALLI(B)', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'BAGEPALLI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '9871' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '9871', r.routeName, 'Bagepalli', NULL, 'CL', NULL, '747', 'YALAGALAPALLI', '747', 'YALAGALAPALLI', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'BAGEPALLI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '9871' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '9871', r.routeName, 'Bagepalli', NULL, 'CL', NULL, '9689', 'JELIPIGARAPALLY MPCS', '9689', 'JELIPIGARAPALLY MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'BAGEPALLI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '9995' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '9995', r.routeName, 'Bagepalli', NULL, 'BM', '3000', '9995', 'CHAKAVELU MPCS', '9995', 'CHAKAVELU MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'BAGEPALLI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '9995' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '9995', r.routeName, 'Bagepalli', NULL, 'CL', NULL, '86', 'KALLAROLLA PALLI', '86', 'KALLAROLLA PALLI', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'BAGEPALLI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '9995' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '9995', r.routeName, 'Bagepalli', NULL, 'CL', NULL, '96', 'BESTHALAPALLI', '96', 'BESTHALAPALLI', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'BAGEPALLI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '9995' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '9995', r.routeName, 'Bagepalli', NULL, 'CL', NULL, '1029', 'OODUVARAPALLI MPCS', '1029', 'OODUVARAPALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'BAGEPALLI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '9995' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '9995', r.routeName, 'Bagepalli', NULL, 'CL', NULL, '2974', 'R.NALLAGUTLA HALLI MPCS', '2974', 'R.NALLAGUTLA HALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'BAGEPALLI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '9995' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '9995', r.routeName, 'Bagepalli', NULL, 'CL', NULL, '1548', 'C.DORANALAPALLI', '1548', 'C.DORANALAPALLI', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'BAGEPALLI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '9995' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '9995', r.routeName, 'Bagepalli', NULL, 'CL', NULL, '9601', 'SHIVAPURA MPCS', '9601', 'SHIVAPURA MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'BAGEPALLI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '11' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '11', r.routeName, 'Chikkaballapura', NULL, 'BM', '3000', '11', 'GOWCHENAHALLI', '11', 'GOWCHENAHALLI', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '11' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '11', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '1082', 'GANTIGANAHALLI MPCS', '1082', 'GANTIGANAHALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '11' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '11', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '749', 'KANGANAHALLY', '749', 'KANGANAHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '11' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '11', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '113', 'KANIVEA NARAYANAPURA MPCS', '113', 'KANIVEA NARAYANAPURA MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '11' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '11', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '41', 'KORLAHALLY', '41', 'KORLAHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '11' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '11', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '7280', 'MUDDENAHALLI MPCS', '7280', 'MUDDENAHALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '11' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '11', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '7277', 'NASKUNTEHOSURU MPCS', '7277', 'NASKUNTEHOSURU MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '11' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '11', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '2217', 'GOWCHENAHALLI(A)', '2217', 'GOWCHENAHALLI(A)', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '72' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '72', r.routeName, 'Chikkaballapura', NULL, 'BM', '3000', '72', 'RENAMAKALAHALLI', '72', 'RENAMAKALAHALLI', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '72' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '72', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '9349', 'ADDAGALLU', '9349', 'ADDAGALLU', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '72' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '72', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '1554', 'BISEGARAHALLY', '1554', 'BISEGARAHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '72' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '72', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '1040', 'BOGAPARTHI MPCS', '1040', 'BOGAPARTHI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '72' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '72', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '2726', 'DODDAPAYALAGURKI MPCS', '2726', 'DODDAPAYALAGURKI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '72' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '72', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '4429', 'KACHAKADATHA', '4429', 'KACHAKADATHA', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '72' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '72', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '4947', 'N.BANDAHALLY', '4947', 'N.BANDAHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '72' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '72', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '4945', 'NALLAPPANAHALLY', '4945', 'NALLAPPANAHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '72' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '72', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '3966', 'PATHURU MPCS', '3966', 'PATHURU MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '72' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '72', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '2566', 'SHETTYKERE MPCS', '2566', 'SHETTYKERE MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '72' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '72', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '1541', 'SHETTYKERE(C)', '1541', 'SHETTYKERE(C)', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '281' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '281', r.routeName, 'Chikkaballapura', NULL, 'BM', '3000', '281', 'D.HOSUR MPCS', '281', 'D.HOSUR MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '281' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '281', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '7010', 'BEEDIGANAHALLY MPCS', '7010', 'BEEDIGANAHALLY MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '281' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '281', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '3938', 'DEVASHETTIHALLY MPCS', '3938', 'DEVASHETTIHALLY MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '281' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '281', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '8192', 'DODDAMARALI MPCS', '8192', 'DODDAMARALI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '281' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '281', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '3905', 'YALUVAHALLI MPCS', '3905', 'YALUVAHALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '502' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '502', r.routeName, 'Chikkaballapura', NULL, 'BM', '5000', '502', 'NALLAKADIRENAHALLY', '502', 'NALLAKADIRENAHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '502' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '502', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '3323', 'BALAKUNTAHALLI MPCS', '3323', 'BALAKUNTAHALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '502' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '502', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '3348', 'BANDAMANNA HALLI MPCS', '3348', 'BANDAMANNA HALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '502' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '502', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '7269', 'CHIKKANAHALLY MPCS', '7269', 'CHIKKANAHALLY MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '502' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '502', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '275', 'GOLLAHALLY', '275', 'GOLLAHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '502' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '502', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '641', 'KELAGINA THOTAGALU(HSGAR)', '641', 'KELAGINA THOTAGALU(HSGAR)', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '502' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '502', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '515', 'KOLIMENAHALLY', '515', 'KOLIMENAHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '502' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '502', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '7291', 'NIMMAKALAKUNTE MPCS', '7291', 'NIMMAKALAKUNTE MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '502' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '502', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '4555', 'POSHETTIHALLY MPCS', '4555', 'POSHETTIHALLY MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '502' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '502', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '2704', 'VAPASANDRA MPCS', '2704', 'VAPASANDRA MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '502' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '502', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '2002', 'GUNGEERLAHALLY', '2002', 'GUNGEERLAHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '502' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '502', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '2022', 'GURUKULA NAGENAHALLY', '2022', 'GURUKULA NAGENAHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '502' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '502', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '4037', 'BOMMENAHALLY', '4037', 'BOMMENAHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '849' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '849', r.routeName, 'Chikkaballapura', NULL, 'BM', '3000', '849', 'KANITHAHALLI MPCS', '849', 'KANITHAHALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '849' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '849', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '7531', 'ARASANAHALLI MPCS', '7531', 'ARASANAHALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '849' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '849', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '5194', 'CHADALUPURA MPCS', '5194', 'CHADALUPURA MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '849' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '849', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '4099', 'KOLAVANAHALLY MPCS', '4099', 'KOLAVANAHALLY MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '849' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '849', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '4103', 'KOTHANUR MPCS', '4103', 'KOTHANUR MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '849' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '849', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '484', 'NAKKANAHALLY', '484', 'NAKKANAHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2329' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2329', r.routeName, 'Chikkaballapura', NULL, 'BM', '3000', '2329', 'ANGAREKHANAHALLY MPCS', '2329', 'ANGAREKHANAHALLY MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2329' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2329', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '74', 'AVALA HALLY', '74', 'AVALA HALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2329' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2329', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '3240', 'BADANIGANAHALLY', '3240', 'BADANIGANAHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2329' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2329', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '2679', 'HIRIYANNAHALLI MPCS', '2679', 'HIRIYANNAHALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2533' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2533', r.routeName, 'Chikkaballapura', NULL, 'BM', '3000', '2533', 'PERESANDRA MPCS', '2533', 'PERESANDRA MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2533' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2533', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '379', 'BOYANAHALLY', '379', 'BOYANAHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2533' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2533', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '1127', 'BUSHETTIHALLY', '1127', 'BUSHETTIHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2533' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2533', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '5531', 'HALEPERESANDRA MPCS', '5531', 'HALEPERESANDRA MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2533' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2533', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '6013', 'HUVIANARAHALLI MPCS', '6013', 'HUVIANARAHALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2533' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2533', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '8966', 'KADIRIDYAVARAHALLI MPCS', '8966', 'KADIRIDYAVARAHALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2533' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2533', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '331', 'KASAVAGUTTAHALLY', '331', 'KASAVAGUTTAHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2533' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2533', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '1039', 'SHETTIVARAPALLI MPCS', '1039', 'SHETTIVARAPALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2533' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2533', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '1632', 'YALAGALA HALLI MPCS', '1632', 'YALAGALA HALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2533' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2533', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '2241', 'KORENAHALLI', '2241', 'KORENAHALLI', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2555' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2555', r.routeName, 'Chikkaballapura', NULL, 'BM', '3000', '2555', 'CHIKKAPAYALAGURKI MPCS', '2555', 'CHIKKAPAYALAGURKI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2555' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2555', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '2715', 'HARISTHALA MPCS', '2715', 'HARISTHALA MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2555' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2555', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '2191', 'KAMMATANAHALLY MPCS', '2191', 'KAMMATANAHALLY MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2555' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2555', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '198', 'KODUR', '198', 'KODUR', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2555' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2555', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '6895', 'MARUVENAHALLI', '6895', 'MARUVENAHALLI', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2555' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2555', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '1708', 'NALLARALLAHALLY', '1708', 'NALLARALLAHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2555' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2555', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '4426', 'TERIGAENA HALLI MPCS', '4426', 'TERIGAENA HALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2555' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2555', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '443', 'TERIGAENA HALLI(A)', '443', 'TERIGAENA HALLI(A)', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2555' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2555', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '1938', 'BOMMEHALLY', '1938', 'BOMMEHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2555' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2555', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '2024', 'DASARENAHALLY', '2024', 'DASARENAHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2635' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2635', r.routeName, 'Chikkaballapura', NULL, 'BM', '3000', '2635', 'DIBBUR MPCS', '2635', 'DIBBUR MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2635' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2635', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '9816', 'GOLLUCHINNAPPANA HALLI MP', '9816', 'GOLLUCHINNAPPANA HALLI MP', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2635' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2635', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '2624', 'GUNDLUGURKI MPCS', '2624', 'GUNDLUGURKI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2635' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2635', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '2602', 'MANCHANBELE MPCS', '2602', 'MANCHANBELE MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2635' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2635', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '2759', 'PURADAGADDE MPCS', '2759', 'PURADAGADDE MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2635' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2635', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '2613', 'PUTTATHIMMANAHALLI MPCS', '2613', 'PUTTATHIMMANAHALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2635' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2635', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '1067', 'SABBENAHALLI MPCS', '1067', 'SABBENAHALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2635' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2635', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '2016', 'LAKKANAYAKANAHALLY', '2016', 'LAKKANAYAKANAHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2635' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2635', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '4036', 'KAMASHETTYHALLY', '4036', 'KAMASHETTYHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2657' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2657', r.routeName, 'Chikkaballapura', NULL, 'BM', '3000', '2657', 'MARALAKUNTE MPCS', '2657', 'MARALAKUNTE MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2657' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2657', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '1111', 'CHEEMANAHALLI MPCS', '1111', 'CHEEMANAHALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2657' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2657', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '296', 'HONNAPPANAHALLY', '296', 'HONNAPPANAHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2657' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2657', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '3239', 'KADADIBURU MPCS', '3239', 'KADADIBURU MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2657' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2657', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '2646', 'KATHARIGUPPA MPCS', '2646', 'KATHARIGUPPA MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2657' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2657', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '6250', 'PATHURU (M)', '6250', 'PATHURU (M)', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2688' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2688', r.routeName, 'Chikkaballapura', NULL, 'BM', '3000', '2688', 'GOLLU MPCS', '2688', 'GOLLU MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2688' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2688', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '6181', 'CHALAKAYALAPARTHI (M)', '6181', 'CHALAKAYALAPARTHI (M)', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2688' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2688', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '6347', 'DODDA THAMANAHALLI (M)', '6347', 'DODDA THAMANAHALLI (M)', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2688' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2688', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '7639', 'NALLI MARADA HALLI MPCS', '7639', 'NALLI MARADA HALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2817' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2817', r.routeName, 'Chikkaballapura', NULL, 'BM', '3000', '2817', 'SOPPAHALLI', '2817', 'SOPPAHALLI', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2817' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2817', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '1778', 'AKALATHIMMANAHALLY', '1778', 'AKALATHIMMANAHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2817' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2817', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '2844', 'DEVASTHANADA HOSAHALLI', '2844', 'DEVASTHANADA HOSAHALLI', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2817' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2817', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '2127', 'GANDLAHALLI MPCS', '2127', 'GANDLAHALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2817' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2817', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '2690', 'GANGAREKALUVE MPCS', '2690', 'GANGAREKALUVE MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2817' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2817', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '2599', 'HAROBANDE MPCS', '2599', 'HAROBANDE MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2817' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2817', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '2588', 'HUNEGALLU MPCS', '2588', 'HUNEGALLU MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2817' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2817', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '1925', 'JADENAHALLY', '1925', 'JADENAHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2817' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2817', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '3977', 'KACHURU MPCS', '3977', 'KACHURU MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2817' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2817', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '83', 'MARASANAHALLI MPCS', '83', 'MARASANAHALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2817' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2817', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '1530', 'RAYAPPANAHALLY', '1530', 'RAYAPPANAHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '3897' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '3897', r.routeName, 'Chikkaballapura', NULL, 'BM', '3000', '3897', 'ADAVIGOLLAVARAHALLY MPCS', '3897', 'ADAVIGOLLAVARAHALLY MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '3897' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '3897', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '5106', 'ANAKANOORU MPCS', '5106', 'ANAKANOORU MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '3897' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '3897', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '3864', 'ANDARLA HALLY MPCS', '3864', 'ANDARLA HALLY MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '3897' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '3897', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '3960', 'PATRENAHALLY MPCS', '3960', 'PATRENAHALLY MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '3897' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '3897', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '130', 'THANDRAMARADA HALLI', '130', 'THANDRAMARADA HALLI', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '3897' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '3897', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '1954', 'MUTTUKADANAHALLY', '1954', 'MUTTUKADANAHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '3927' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '3927', r.routeName, 'Chikkaballapura', NULL, 'BM', '3000', '3927', 'NANDI MPCS', '3927', 'NANDI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '3927' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '3927', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '3916', 'ANGATTI MPCS', '3916', 'ANGATTI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '3927' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '3927', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '22', 'BYRANAYAKANAHALLI', '22', 'BYRANAYAKANAHALLI', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '3927' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '3927', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '259', 'HIRENA HALLY', '259', 'HIRENA HALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '3927' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '3927', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '3392', 'JADALA THIMMANAHALLI', '3392', 'JADALA THIMMANAHALLI', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '3927' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '3927', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '4464', 'KUDUVATHY MPCS', '4464', 'KUDUVATHY MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '3927' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '3927', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '7134', 'SULTHANAPETE MPCS', '7134', 'SULTHANAPETE MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '3927' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '3927', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '1951', 'CHIKKASAGARAHALLY', '1951', 'CHIKKASAGARAHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '3971' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '3971', r.routeName, 'Chikkaballapura', NULL, 'BM', '3000', '3971', 'NAYANAHALLY MPCS', '3971', 'NAYANAHALLY MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '3971' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '3971', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '8636', 'JATHAWARA MPCS', '8636', 'JATHAWARA MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '3971' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '3971', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '3982', 'JATHAWARAHOSAHALLI MPCS', '3982', 'JATHAWARAHOSAHALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '3971' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '3971', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '4333', 'THAMMANAYAKANAHALLY MPCS', '4333', 'THAMMANAYAKANAHALLY MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '3971' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '3971', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '1083', 'VARADAHALLI MPCS', '1083', 'VARADAHALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '4001' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '4001', r.routeName, 'Chikkaballapura', NULL, 'BM', '3000', '4001', 'GIDNAHALLI MPCS', '4001', 'GIDNAHALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '4001' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '4001', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '4340', 'HOSAHUDYA MPCS', '4340', 'HOSAHUDYA MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '4001' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '4001', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '4329', 'KESHAWARA MPCS', '4329', 'KESHAWARA MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '4001' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '4001', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '3767', 'NELAMAKALAHALLI', '3767', 'NELAMAKALAHALLI', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '4001' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '4001', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '8717', 'YENNURKADIRENAHALLY MPCS', '8717', 'YENNURKADIRENAHALLY MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '4056' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '4056', r.routeName, 'Chikkaballapura', NULL, 'BM', '3000', '4056', 'KONDENAHALLY MPCS', '4056', 'KONDENAHALLY MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '4056' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '4056', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '860', 'BOMMANAHALLY MPCS', '860', 'BOMMANAHALLY MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '4056' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '4056', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '5631', 'CHEEDACHIKKANAHALLY', '5631', 'CHEEDACHIKKANAHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '4056' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '4056', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '7509', 'CHIKKAKADIGENAHALLY MPCS', '7509', 'CHIKKAKADIGENAHALLY MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '4056' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '4056', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '4078', 'KADASEEGENAHALLI MPCS', '4078', 'KADASEEGENAHALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '4056' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '4056', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '7495', 'SREERAMAPURA MPCS', '7495', 'SREERAMAPURA MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '4056' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '4056', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '882', 'THADANAHALLI MPCS', '882', 'THADANAHALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '4056' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '4056', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '855', 'THALAHALLI MPCS', '855', 'THALAHALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '4056' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '4056', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '5556', 'THIMMANAHALLY', '5556', 'THIMMANAHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '4089' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '4089', r.routeName, 'Chikkaballapura', NULL, 'BM', '3000', '4089', 'AJJAWARA MPCS', '4089', 'AJJAWARA MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '4089' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '4089', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '3949', 'AGALAGURKI MPCS', '3949', 'AGALAGURKI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '4089' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '4089', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '1625', 'BANNIKUPPE', '1625', 'BANNIKUPPE', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '4089' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '4089', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '203', 'CHALUMENAHALLY', '203', 'CHALUMENAHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '4089' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '4089', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '3009', 'CHOKKA HALLI MPCS', '3009', 'CHOKKA HALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '4089' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '4089', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '2280', 'DODDAKIRUGAMBI', '2280', 'DODDAKIRUGAMBI', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '4089' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '4089', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '5321', 'ELEA HALLI MPCS', '5321', 'ELEA HALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '4089' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '4089', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '3993', 'MANNARAPURA MPCS', '3993', 'MANNARAPURA MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '4089' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '4089', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '235', 'THIPPANAHALLI MPCS', '235', 'THIPPANAHALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '4089' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '4089', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '2309', 'NUGITHAHALLI', '2309', 'NUGITHAHALLI', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '4432' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '4432', r.routeName, 'Chikkaballapura', NULL, 'BM', '3000', '4432', 'RAMACHANDRAHOSUR MPCS', '4432', 'RAMACHANDRAHOSUR MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '4432' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '4432', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '1020', 'GANDLA HOSAHALLI MPCS', '1020', 'GANDLA HOSAHALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '4432' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '4432', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '2318', 'KANDAKANAHALLY MPCS', '2318', 'KANDAKANAHALLY MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '4432' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '4432', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '2668', 'MAREGANAHALLY MPCS', '2668', 'MAREGANAHALLY MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '4951' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '4951', r.routeName, 'Chikkaballapura', NULL, 'BM', '3000', '4951', 'INUMINCHENAHALLY', '4951', 'INUMINCHENAHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '4951' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '4951', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '7242', 'ADEGARAHALLI MPCS', '7242', 'ADEGARAHALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '4951' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '4951', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '9929', 'ADENAGARA HALLI MPCS', '9929', 'ADENAGARA HALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '4951' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '4951', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '7566', 'ARUR MPCS', '7566', 'ARUR MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '4951' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '4951', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '2', 'AVALANAGENAHALLY', '2', 'AVALANAGENAHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '4951' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '4951', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '744', 'BEERAGANAHALLI', '744', 'BEERAGANAHALLI', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '4951' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '4951', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '3244', 'HANUMANTHAPURA', '3244', 'HANUMANTHAPURA', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '4951' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '4951', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '77', 'KAKALACHINTHE', '77', 'KAKALACHINTHE', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '4951' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '4951', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '1627', 'KAMMAGANAHALLY', '1627', 'KAMMAGANAHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '4951' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '4951', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '2356', 'KARIGANA PALYA MPCS', '2356', 'KARIGANA PALYA MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '4951' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '4951', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '1048', 'RAMAGANAPARTHI MPCS', '1048', 'RAMAGANAPARTHI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '4951' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '4951', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '1712', 'REDDYGOLLAVARAHALLI MPCS', '1712', 'REDDYGOLLAVARAHALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '4951' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '4951', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '39', 'THUMMAKALAHALLY', '39', 'THUMMAKALAHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5520' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5520', r.routeName, 'Chikkaballapura', NULL, 'BM', '3000', '5520', 'MANDIKALLU MPCS', '5520', 'MANDIKALLU MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5520' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5520', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '2511', 'DARBUR MPCS', '2511', 'DARBUR MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5520' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5520', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '4040', 'PAIYURU', '4040', 'PAIYURU', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5520' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5520', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '4041', 'KATAARIKADHIRENAHALLY', '4041', 'KATAARIKADHIRENAHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '7305' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '7305', r.routeName, 'Chikkaballapura', NULL, 'BM', '3000', '7305', 'KANAJENAHALLY MPCS', '7305', 'KANAJENAHALLY MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '7305' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '7305', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '1053', 'ANKANNAGONDHI MPCS', '1053', 'ANKANNAGONDHI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '7305' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '7305', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '742', 'ARIKERE', '742', 'ARIKERE', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '7305' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '7305', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '1187', 'BODAGANAHALLY', '1187', 'BODAGANAHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '7305' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '7305', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '7316', 'DINNEHOSAHALLI MPCS', '7316', 'DINNEHOSAHALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '7305' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '7305', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '1719', 'GONDIHALLI', '1719', 'GONDIHALLI', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '7305' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '7305', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '7429', 'MUSHTUR MPCS', '7429', 'MUSHTUR MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '7305' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '7305', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '1030', 'THIPPENAHALLI MPCS', '1030', 'THIPPENAHALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '7327' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '7327', r.routeName, 'Chikkaballapura', NULL, 'BM', '3000', '7327', 'AVALAGURKI', '7327', 'AVALAGURKI', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '7327' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '7327', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '3242', 'CHAMBAHALLY', '3242', 'CHAMBAHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '7327' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '7327', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '914', 'GERAHALLI MPCS', '914', 'GERAHALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '7327' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '7327', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '295', 'GUNTHAPPANAHALLY', '295', 'GUNTHAPPANAHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '7327' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '7327', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '708', 'HARIHARAPURA', '708', 'HARIHARAPURA', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '7327' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '7327', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '617', 'HONNENAHALLY', '617', 'HONNENAHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '7327' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '7327', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '7349', 'ITTAPPANAHALLY MPCS', '7349', 'ITTAPPANAHALLY MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '7327' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '7327', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '143', 'KAVARNAHALLY', '143', 'KAVARNAHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '7327' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '7327', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '1461', 'MAGALAKUPPE', '1461', 'MAGALAKUPPE', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '7327' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '7327', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '7473', 'SULAKUNTE MPCS', '7473', 'SULAKUNTE MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '7327' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '7327', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '2770', 'YALAGERE MPCS', '2770', 'YALAGERE MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '7327' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '7327', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '1946', 'GONGADIPURA', '1946', 'GONGADIPURA', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '7327' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '7327', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '1956', 'KALLUKUNTE', '1956', 'KALLUKUNTE', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '7338' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '7338', r.routeName, 'Chikkaballapura', NULL, 'BM', '3000', '7338', 'S.GOLLAHALLY MPCS', '7338', 'S.GOLLAHALLY MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '7338' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '7338', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '1800', 'A.KOTHUR', '1800', 'A.KOTHUR', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '7338' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '7338', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '1186', 'JANGAMARAPPANAHALLY', '1186', 'JANGAMARAPPANAHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '7338' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '7338', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '7355', 'KETHENAHALLY MPCS', '7355', 'KETHENAHALLY MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '7338' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '7338', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '8240', 'MARAPPANAHALLY MPCS', '8240', 'MARAPPANAHALLY MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '7338' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '7338', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '1636', 'NALLAGUTTAPALYA', '1636', 'NALLAGUTTAPALYA', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '7338' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '7338', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '7360', 'NASTHIMMANAHALLI MPCS', '7360', 'NASTHIMMANAHALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '7338' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '7338', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '2218', 'YARRANAGENAHALLI', '2218', 'YARRANAGENAHALLI', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '8165' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '8165', r.routeName, 'Chikkaballapura', NULL, 'BM', '3000', '8165', 'HIRENAGAVALLI MPCS', '8165', 'HIRENAGAVALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '8165' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '8165', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '1628', 'GUNDLA MANDIKALLU', '1628', 'GUNDLA MANDIKALLU', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '8165' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '8165', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '1694', 'HOSAHALLI', '1694', 'HOSAHALLI', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '8165' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '8165', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '7999', 'MUDDALA HALLY MPCS', '7999', 'MUDDALA HALLY MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '8165' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '8165', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '1582', 'MUDDALA HALLY(A)', '1582', 'MUDDALA HALLY(A)', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '8165' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '8165', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '245', 'P.CHOKKANAHALLI', '245', 'P.CHOKKANAHALLI', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '9220' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '9220', r.routeName, 'Chikkaballapura', NULL, 'BM', '3000', '9220', 'KUPPAHALLYMPCS', '9220', 'KUPPAHALLYMPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '9220' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '9220', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '4475', 'BANDAHALLY MPCS', '4475', 'BANDAHALLY MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '9220' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '9220', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '337', 'K.G.BACHAHALLY', '337', 'K.G.BACHAHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '9220' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '9220', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '7087', 'KALAVARA MPCS', '7087', 'KALAVARA MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '9220' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '9220', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '1594', 'KANDAWARA', '1594', 'KANDAWARA', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '9220' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '9220', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '3955', 'MYLAPPANAHALLY MPCS', '3955', 'MYLAPPANAHALLY MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '9220' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '9220', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '951', 'SUDDAHALLY MPCS', '951', 'SUDDAHALLY MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '9634' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '9634', r.routeName, 'Chikkaballapura', NULL, 'BM', '3000', '9634', 'RAMAPATNA MPCS', '9634', 'RAMAPATNA MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '9634' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '9634', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '228', 'BACHENAHALLI MPCS', '228', 'BACHENAHALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '9634' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '9634', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '9747', 'BOMMAGANAHALLI MPCS', '9747', 'BOMMAGANAHALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '9634' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '9634', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '1703', 'JEEGANAHALLY', '1703', 'JEEGANAHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '9634' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '9634', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '8198', 'NAMILUGURKI', '8198', 'NAMILUGURKI', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '9634' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '9634', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '2049', 'KAMMAGUTTAHALLY', '2049', 'KAMMAGUTTAHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '9634' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '9634', r.routeName, 'Chikkaballapura', NULL, 'CL', NULL, '2121', 'NAGASANAHALLI', '2121', 'NAGASANAHALLI', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHIKKABALLAPURA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '32' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '32', r.routeName, 'Chintamani', NULL, 'BM', '3000', '32', 'JAGATHANAHALLY', '32', 'JAGATHANAHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '32' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '32', r.routeName, 'Chintamani', NULL, 'CL', NULL, '8182', 'CHOWDIDENAHALLI MPCS', '8182', 'CHOWDIDENAHALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '32' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '32', r.routeName, 'Chintamani', NULL, 'CL', NULL, '1567', 'GOPALAPURA', '1567', 'GOPALAPURA', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '32' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '32', r.routeName, 'Chintamani', NULL, 'CL', NULL, '602', 'K.RAGUTTAHALLY MPCS', '602', 'K.RAGUTTAHALLY MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '32' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '32', r.routeName, 'Chintamani', NULL, 'CL', NULL, '8014', 'N.KOTHUR MPCS', '8014', 'N.KOTHUR MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '32' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '32', r.routeName, 'Chintamani', NULL, 'CL', NULL, '234', 'VEERAPALLI MPCS', '234', 'VEERAPALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '32' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '32', r.routeName, 'Chintamani', NULL, 'CL', NULL, '2290', 'ADEPALLI', '2290', 'ADEPALLI', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '32' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '32', r.routeName, 'Chintamani', NULL, 'CL', NULL, '4034', 'BYRASANDRA(C)', '4034', 'BYRASANDRA(C)', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '56' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '56', r.routeName, 'Chintamani', NULL, 'BM', '3000', '56', 'HIREPALYA', '56', 'HIREPALYA', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '56' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '56', r.routeName, 'Chintamani', NULL, 'CL', NULL, '7292', 'AKKIMANGALA MPCS', '7292', 'AKKIMANGALA MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '56' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '56', r.routeName, 'Chintamani', NULL, 'CL', NULL, '8116', 'ATTUR MPCS', '8116', 'ATTUR MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '56' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '56', r.routeName, 'Chintamani', NULL, 'CL', NULL, '637', 'BEERJENAHALLI MPCS', '637', 'BEERJENAHALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '56' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '56', r.routeName, 'Chintamani', NULL, 'CL', NULL, '1025', 'KADIRAPURA', '1025', 'KADIRAPURA', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '56' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '56', r.routeName, 'Chintamani', NULL, 'CL', NULL, '1061', 'SUBBARAYANA PETE MPCS', '1061', 'SUBBARAYANA PETE MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '56' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '56', r.routeName, 'Chintamani', NULL, 'CL', NULL, '5362', 'VIRUPAKSHIPURA', '5362', 'VIRUPAKSHIPURA', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '78' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '78', r.routeName, 'Chintamani', NULL, 'BM', '3000', '78', 'NIDAGURKI', '78', 'NIDAGURKI', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '78' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '78', r.routeName, 'Chintamani', NULL, 'CL', NULL, '727', 'BANDARLAHALLY', '727', 'BANDARLAHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '78' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '78', r.routeName, 'Chintamani', NULL, 'CL', NULL, '2226', 'C.DODDAHALLI', '2226', 'C.DODDAHALLI', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '78' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '78', r.routeName, 'Chintamani', NULL, 'CL', NULL, '8105', 'CHANNAKESHAVAPURA MPCS', '8105', 'CHANNAKESHAVAPURA MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '78' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '78', r.routeName, 'Chintamani', NULL, 'CL', NULL, '588', 'NAGADENAHALLI MPCS', '588', 'NAGADENAHALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '205' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '205', r.routeName, 'Chintamani', NULL, 'BM', '3000', '205', 'BOMMEPALLY MPCS', '205', 'BOMMEPALLY MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '205' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '205', r.routeName, 'Chintamani', NULL, 'CL', NULL, '9232', 'BALAREDDY PALLI MPCS', '9232', 'BALAREDDY PALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '205' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '205', r.routeName, 'Chintamani', NULL, 'CL', NULL, '9458', 'ETIGADDAGOLLAHALLI MPCS', '9458', 'ETIGADDAGOLLAHALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '205' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '205', r.routeName, 'Chintamani', NULL, 'CL', NULL, '8277', 'KARIYAPPAPALLI', '8277', 'KARIYAPPAPALLI', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '205' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '205', r.routeName, 'Chintamani', NULL, 'CL', NULL, '1535', 'KENCHEPALLI', '1535', 'KENCHEPALLI', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '205' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '205', r.routeName, 'Chintamani', NULL, 'CL', NULL, '9811', 'KODIGAL MPCS', '9811', 'KODIGAL MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '205' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '205', r.routeName, 'Chintamani', NULL, 'CL', NULL, '2421', 'MADAMANGALA MPCS', '2421', 'MADAMANGALA MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '205' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '205', r.routeName, 'Chintamani', NULL, 'CL', NULL, '5127', 'SUNNAPPAGUTTA MPCS', '5127', 'SUNNAPPAGUTTA MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '205' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '205', r.routeName, 'Chintamani', NULL, 'CL', NULL, '690', 'VANGIMALLU', '690', 'VANGIMALLU', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '205' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '205', r.routeName, 'Chintamani', NULL, 'CL', NULL, '1070', 'Y.GUNDLAHALLY MPCS', '1070', 'Y.GUNDLAHALLY MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '205' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '205', r.routeName, 'Chintamani', NULL, 'CL', NULL, '4319', 'YASAGALA HALLI MPCS', '4319', 'YASAGALA HALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '205' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '205', r.routeName, 'Chintamani', NULL, 'CL', NULL, '4022', 'RAGUTTAHALLY(B)', '4022', 'RAGUTTAHALLY(B)', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '271' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '271', r.routeName, 'Chintamani', NULL, 'BM', '3000', '271', 'MASTHENAHALLY MPCS', '271', 'MASTHENAHALLY MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '271' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '271', r.routeName, 'Chintamani', NULL, 'CL', NULL, '7855', 'GUTTAHALLI MPCS', '7855', 'GUTTAHALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '271' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '271', r.routeName, 'Chintamani', NULL, 'CL', NULL, '8874', 'HULUGUMMANAHALLI MPCS', '8874', 'HULUGUMMANAHALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '271' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '271', r.routeName, 'Chintamani', NULL, 'CL', NULL, '6052', 'KEMPADENAHALLI MPCS', '6052', 'KEMPADENAHALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '475' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '475', r.routeName, 'Chintamani', NULL, 'BM', '3000', '475', 'LAKSHMIDEVIKOTE MPCS', '475', 'LAKSHMIDEVIKOTE MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '475' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '475', r.routeName, 'Chintamani', NULL, 'CL', NULL, '250', 'CHOKKAHALLI', '250', 'CHOKKAHALLI', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '475' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '475', r.routeName, 'Chintamani', NULL, 'CL', NULL, '2556', 'KORLAHALLY', '2556', 'KORLAHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '475' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '475', r.routeName, 'Chintamani', NULL, 'CL', NULL, '2459', 'MAHAMADPURA MPCS', '2459', 'MAHAMADPURA MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '475' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '475', r.routeName, 'Chintamani', NULL, 'CL', NULL, '89', 'NAYANAHALLY MPCS', '89', 'NAYANAHALLY MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '522' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '522', r.routeName, 'Chintamani', NULL, 'BM', '3000', '522', 'SANTHEKALLAHALLY MPCS', '522', 'SANTHEKALLAHALLY MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '555' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '555', r.routeName, 'Chintamani', NULL, 'BM', '3000', '555', 'TALAGAVARA MPCS', '555', 'TALAGAVARA MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '555' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '555', r.routeName, 'Chintamani', NULL, 'CL', NULL, '8499', 'HOSAHALLY MPCS', '8499', 'HOSAHALLY MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '555' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '555', r.routeName, 'Chintamani', NULL, 'CL', NULL, '1098', 'MALLIKAPURA MPCS', '1098', 'MALLIKAPURA MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '555' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '555', r.routeName, 'Chintamani', NULL, 'CL', NULL, '169', 'VADDAHALLY.T', '169', 'VADDAHALLY.T', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '566' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '566', r.routeName, 'Chintamani', NULL, 'BM', '3000', '566', 'KAIWARA MPCS', '566', 'KAIWARA MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '566' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '566', r.routeName, 'Chintamani', NULL, 'CL', NULL, '9800', 'MYLAPURA MPCS', '9800', 'MYLAPURA MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '566' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '566', r.routeName, 'Chintamani', NULL, 'CL', NULL, '1453', 'SHYAMARAO HOSAPETE', '1453', 'SHYAMARAO HOSAPETE', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '668' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '668', r.routeName, 'Chintamani', NULL, 'BM', '3000', '668', 'VAIJAKKUR MPCS', '668', 'VAIJAKKUR MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '668' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '668', r.routeName, 'Chintamani', NULL, 'CL', NULL, '2018', 'KONGANAHALLI MPCS', '2018', 'KONGANAHALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '668' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '668', r.routeName, 'Chintamani', NULL, 'CL', NULL, '260', 'MARAPPANAHALLI MPCS', '260', 'MARAPPANAHALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '668' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '668', r.routeName, 'Chintamani', NULL, 'CL', NULL, '2118', 'HOSUR', '2118', 'HOSUR', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '679' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '679', r.routeName, 'Chintamani', NULL, 'BM', '3000', '679', 'KALLAHALLI', '679', 'KALLAHALLI', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '679' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '679', r.routeName, 'Chintamani', NULL, 'CL', NULL, '2226', 'C.DODDAHALLI', '2226', 'C.DODDAHALLI', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '679' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '679', r.routeName, 'Chintamani', NULL, 'CL', NULL, '305', 'C.DODDAHALLI(B)', '305', 'C.DODDAHALLI(B)', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '679' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '679', r.routeName, 'Chintamani', NULL, 'CL', NULL, '5107', 'CHINTAMANI MPCS', '5107', 'CHINTAMANI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '679' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '679', r.routeName, 'Chintamani', NULL, 'CL', NULL, '1979', 'KATAMAKALAHALLY', '1979', 'KATAMAKALAHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '679' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '679', r.routeName, 'Chintamani', NULL, 'CL', NULL, '4004', 'KANAMPALLY', '4004', 'KANAMPALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '941' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '941', r.routeName, 'Chintamani', NULL, 'BM', '3000', '941', 'MUNAGANA HALLY MPCS', '941', 'MUNAGANA HALLY MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '941' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '941', r.routeName, 'Chintamani', NULL, 'CL', NULL, '9786', 'KURATAHALLY MPCS', '9786', 'KURATAHALLY MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '1110' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '1110', r.routeName, 'Chintamani', NULL, 'BM', '3000', '1110', 'K.DEVAGANAHALLY', '1110', 'K.DEVAGANAHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '1110' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '1110', r.routeName, 'Chintamani', NULL, 'CL', NULL, '246', 'ANNAPALLI MPCS', '246', 'ANNAPALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '1110' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '1110', r.routeName, 'Chintamani', NULL, 'CL', NULL, '2442', 'BURUDUGUNTE MPCS', '2442', 'BURUDUGUNTE MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '1110' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '1110', r.routeName, 'Chintamani', NULL, 'CL', NULL, '1713', 'JANGALAHALLY', '1713', 'JANGALAHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '1110' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '1110', r.routeName, 'Chintamani', NULL, 'CL', NULL, '9152', 'KONEPALLI MPCS', '9152', 'KONEPALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '1110' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '1110', r.routeName, 'Chintamani', NULL, 'CL', NULL, '251', 'M.MUDALAHALLI MPCS', '251', 'M.MUDALAHALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '1110' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '1110', r.routeName, 'Chintamani', NULL, 'CL', NULL, '6551', 'MITTA HALLY MPCS', '6551', 'MITTA HALLY MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '1110' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '1110', r.routeName, 'Chintamani', NULL, 'CL', NULL, '7907', 'MOTAMAKALAPALLI', '7907', 'MOTAMAKALAPALLI', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '1110' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '1110', r.routeName, 'Chintamani', NULL, 'CL', NULL, '2550', 'NANDANAVANA MPCS', '2550', 'NANDANAVANA MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '1110' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '1110', r.routeName, 'Chintamani', NULL, 'CL', NULL, '2411', 'PAPATHIMMANAHALLI MPCS', '2411', 'PAPATHIMMANAHALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '1110' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '1110', r.routeName, 'Chintamani', NULL, 'CL', NULL, '485', 'PAPATHIMMANAHALLI(E)', '485', 'PAPATHIMMANAHALLI(E)', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '1110' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '1110', r.routeName, 'Chintamani', NULL, 'CL', NULL, '2314', 'ULIBELE', '2314', 'ULIBELE', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2040' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2040', r.routeName, 'Chintamani', NULL, 'BM', '3000', '2040', 'HANUMYGARAPALLI MPCS', '2040', 'HANUMYGARAPALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2040' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2040', r.routeName, 'Chintamani', NULL, 'CL', NULL, '6533', 'ANKALAMADAGU MPCS', '6533', 'ANKALAMADAGU MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2040' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2040', r.routeName, 'Chintamani', NULL, 'CL', NULL, '6611', 'BATLAHALLY MPCS', '6611', 'BATLAHALLY MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2040' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2040', r.routeName, 'Chintamani', NULL, 'CL', NULL, '6722', 'BILLANDLAHALLI', '6722', 'BILLANDLAHALLI', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2040' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2040', r.routeName, 'Chintamani', NULL, 'CL', NULL, '318', 'KADADALAMARI MPCS', '318', 'KADADALAMARI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2040' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2040', r.routeName, 'Chintamani', NULL, 'CL', NULL, '7264', 'N.HOSAHALLI MPCS', '7264', 'N.HOSAHALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2040' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2040', r.routeName, 'Chintamani', NULL, 'CL', NULL, '6657', 'OBALAPURA MPCS', '6657', 'OBALAPURA MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2040' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2040', r.routeName, 'Chintamani', NULL, 'CL', NULL, '664', 'PONGAPALLI', '664', 'PONGAPALLI', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2040' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2040', r.routeName, 'Chintamani', NULL, 'CL', NULL, '4319', 'YASAGALA HALLI MPCS', '4319', 'YASAGALA HALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2051' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2051', r.routeName, 'Chintamani', NULL, 'BM', '3000', '2051', 'GUDARLAHALLI MPCS', '2051', 'GUDARLAHALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2051' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2051', r.routeName, 'Chintamani', NULL, 'CL', NULL, '1021', 'AGRAHARA MPCS', '1021', 'AGRAHARA MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2051' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2051', r.routeName, 'Chintamani', NULL, 'CL', NULL, '52', 'DIGAVAKOTE', '52', 'DIGAVAKOTE', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2051' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2051', r.routeName, 'Chintamani', NULL, 'CL', NULL, '7838', 'DINNAMINDAPALLI MPCS', '7838', 'DINNAMINDAPALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2051' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2051', r.routeName, 'Chintamani', NULL, 'CL', NULL, '2084', 'MANIGANAHALLI MPCS', '2084', 'MANIGANAHALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2051' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2051', r.routeName, 'Chintamani', NULL, 'CL', NULL, '8233', 'NEELAPALLI MPCS', '8233', 'NEELAPALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2051' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2051', r.routeName, 'Chintamani', NULL, 'CL', NULL, '2466', 'PATHAKOTE MPCS', '2466', 'PATHAKOTE MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2051' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2051', r.routeName, 'Chintamani', NULL, 'CL', NULL, '6697', 'VEMPALLI MPCS', '6697', 'VEMPALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2051' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2051', r.routeName, 'Chintamani', NULL, 'CL', NULL, '6642', 'YAGAVAKOTE MPCS', '6642', 'YAGAVAKOTE MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2051' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2051', r.routeName, 'Chintamani', NULL, 'CL', NULL, '4043', 'GUDARLAHALLI(A)', '4043', 'GUDARLAHALLI(A)', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2100' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2100', r.routeName, 'Chintamani', NULL, 'BM', '2000', '2100', 'BUKKANAHALLY', '2100', 'BUKKANAHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2100' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2100', r.routeName, 'Chintamani', NULL, 'CL', NULL, '6658', 'BURGAMAKALAHALLI MPCS', '6658', 'BURGAMAKALAHALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2100' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2100', r.routeName, 'Chintamani', NULL, 'CL', NULL, '338', 'GOPASANDRA', '338', 'GOPASANDRA', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2100' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2100', r.routeName, 'Chintamani', NULL, 'CL', NULL, '447', 'NAKKUNDI AGRAHARA', '447', 'NAKKUNDI AGRAHARA', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2100' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2100', r.routeName, 'Chintamani', NULL, 'CL', NULL, '392', 'SINGASANDRA', '392', 'SINGASANDRA', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2100' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2100', r.routeName, 'Chintamani', NULL, 'CL', NULL, '2119', 'GOWNIGADDE', '2119', 'GOWNIGADDE', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2379' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2379', r.routeName, 'Chintamani', NULL, 'BM', '3000', '2379', 'BOMMEKALLU MPCS', '2379', 'BOMMEKALLU MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2379' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2379', r.routeName, 'Chintamani', NULL, 'CL', NULL, '225', 'CHIKKAKONDRAHALLY', '225', 'CHIKKAKONDRAHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2379' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2379', r.routeName, 'Chintamani', NULL, 'CL', NULL, '3010', 'DODDAKONDRA HALLI MPCS', '3010', 'DODDAKONDRA HALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2379' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2379', r.routeName, 'Chintamani', NULL, 'CL', NULL, '140', 'K.BOORAGAMAKALAHALLY', '140', 'K.BOORAGAMAKALAHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2379' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2379', r.routeName, 'Chintamani', NULL, 'CL', NULL, '2313', 'VADDAHALLI.B.', '2313', 'VADDAHALLI.B.', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2379' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2379', r.routeName, 'Chintamani', NULL, 'CL', NULL, '695', 'VADDAHALLY.B(A)', '695', 'VADDAHALLY.B(A)', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2379' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2379', r.routeName, 'Chintamani', NULL, 'CL', NULL, '2058', 'NARAYANA HALLI', '2058', 'NARAYANA HALLI', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '3134' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '3134', r.routeName, 'Chintamani', NULL, 'BM', '3000', '3134', 'NALLARALA PALLI MPCS', '3134', 'NALLARALA PALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '3134' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '3134', r.routeName, 'Chintamani', NULL, 'CL', NULL, '116', 'GUDISALAHALLY', '116', 'GUDISALAHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '3134' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '3134', r.routeName, 'Chintamani', NULL, 'CL', NULL, '7237', 'GUTTUR MPCS', '7237', 'GUTTUR MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '3134' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '3134', r.routeName, 'Chintamani', NULL, 'CL', NULL, '634', 'KOMMEPALLI', '634', 'KOMMEPALLI', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '3134' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '3134', r.routeName, 'Chintamani', NULL, 'CL', NULL, '6664', 'MINDIGALLU MPCS', '6664', 'MINDIGALLU MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '3134' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '3134', r.routeName, 'Chintamani', NULL, 'CL', NULL, '1172', 'TUVVAKALAHALLY MPCS', '1172', 'TUVVAKALAHALLY MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '3134' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '3134', r.routeName, 'Chintamani', NULL, 'CL', NULL, '376', 'YAGAVA MINDAGAL', '376', 'YAGAVA MINDAGAL', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '3134' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '3134', r.routeName, 'Chintamani', NULL, 'CL', NULL, '699', 'YAGAVA MINDAGAL(A)', '699', 'YAGAVA MINDAGAL(A)', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '3134' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '3134', r.routeName, 'Chintamani', NULL, 'CL', NULL, '4048', 'KODEGANDLUWDCS', '4048', 'KODEGANDLUWDCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5005' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5005', r.routeName, 'Chintamani', NULL, 'BM', '3000', '5005', 'DODDABOMMANAHALLY MPCS', '5005', 'DODDABOMMANAHALLY MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5005' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5005', r.routeName, 'Chintamani', NULL, 'CL', NULL, '576', 'CHIKKA BOMMANAHALLY', '576', 'CHIKKA BOMMANAHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5005' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5005', r.routeName, 'Chintamani', NULL, 'CL', NULL, '8568', 'CHIKKAPURA MPCS', '8568', 'CHIKKAPURA MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5005' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5005', r.routeName, 'Chintamani', NULL, 'CL', NULL, '5126', 'DODDAPURA', '5126', 'DODDAPURA', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5005' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5005', r.routeName, 'Chintamani', NULL, 'CL', NULL, '974', 'K.HOSAHALLI MPCS', '974', 'K.HOSAHALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5005' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5005', r.routeName, 'Chintamani', NULL, 'CL', NULL, '7306', 'PANSACHOWDANAHALLI MPCS', '7306', 'PANSACHOWDANAHALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5016' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5016', r.routeName, 'Chintamani', NULL, 'BM', '3000', '5016', 'KURBUR MPCS', '5016', 'KURBUR MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5016' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5016', r.routeName, 'Chintamani', NULL, 'CL', NULL, '147', 'KUTHARAJANAHALLI MPCS', '147', 'KUTHARAJANAHALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5016' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5016', r.routeName, 'Chintamani', NULL, 'CL', NULL, '2448', 'MYLANDAHALLI', '2448', 'MYLANDAHALLI', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5016' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5016', r.routeName, 'Chintamani', NULL, 'CL', NULL, '667', 'RAMENAHALLY', '667', 'RAMENAHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5016' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5016', r.routeName, 'Chintamani', NULL, 'CL', NULL, '8127', 'SEEKAL MPCS', '8127', 'SEEKAL MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5016' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5016', r.routeName, 'Chintamani', NULL, 'CL', NULL, '4061', 'SEEKAL(A)', '4061', 'SEEKAL(A)', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5038' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5038', r.routeName, 'Chintamani', NULL, 'BM', '3000', '5038', 'MURAGAMALLA MPCS', '5038', 'MURAGAMALLA MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5038' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5038', r.routeName, 'Chintamani', NULL, 'CL', NULL, '745', 'AGRAHARA(A)', '745', 'AGRAHARA(A)', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5038' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5038', r.routeName, 'Chintamani', NULL, 'CL', NULL, '2025', 'ALAPALLI', '2025', 'ALAPALLI', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5038' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5038', r.routeName, 'Chintamani', NULL, 'CL', NULL, '268', 'BARLAHALLI', '268', 'BARLAHALLI', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5038' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5038', r.routeName, 'Chintamani', NULL, 'CL', NULL, '8822', 'BYNAHALLI MPCS', '8822', 'BYNAHALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5038' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5038', r.routeName, 'Chintamani', NULL, 'CL', NULL, '382', 'BYRABANDA(A)', '382', 'BYRABANDA(A)', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5038' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5038', r.routeName, 'Chintamani', NULL, 'CL', NULL, '5311', 'G.BATHALAHALLI MPCS', '5311', 'G.BATHALAHALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5038' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5038', r.routeName, 'Chintamani', NULL, 'CL', NULL, '2095', 'GUDAMARLAHALLI MPCS', '2095', 'GUDAMARLAHALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5038' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5038', r.routeName, 'Chintamani', NULL, 'CL', NULL, '5526', 'GUNDLA HALLI MPCS', '5526', 'GUNDLA HALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5038' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5038', r.routeName, 'Chintamani', NULL, 'CL', NULL, '2222', 'JUNJANA HALLI MPCS', '2222', 'JUNJANA HALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5038' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5038', r.routeName, 'Chintamani', NULL, 'CL', NULL, '9061', 'NANDIGANAHALLI MPCS', '9061', 'NANDIGANAHALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5038' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5038', r.routeName, 'Chintamani', NULL, 'CL', NULL, '1546', 'NARAMAKALAHALLI', '1546', 'NARAMAKALAHALLI', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5038' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5038', r.routeName, 'Chintamani', NULL, 'CL', NULL, '2075', 'CHIKKAKARKAMAKALAHALLI', '2075', 'CHIKKAKARKAMAKALAHALLI', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5071' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5071', r.routeName, 'Chintamani', NULL, 'BM', '5000', '5071', 'KODIHALLI MPCS', '5071', 'KODIHALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5071' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5071', r.routeName, 'Chintamani', NULL, 'CL', NULL, '8794', 'CHEEMANAHALLI MPCS', '8794', 'CHEEMANAHALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5071' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5071', r.routeName, 'Chintamani', NULL, 'CL', NULL, '6267', 'DODDA NETHA MPCS', '6267', 'DODDA NETHA MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5071' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5071', r.routeName, 'Chintamani', NULL, 'CL', NULL, '5184', 'DODDAGANJUR MPCS', '5184', 'DODDAGANJUR MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5071' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5071', r.routeName, 'Chintamani', NULL, 'CL', NULL, '8266', 'IMAREDDY HALLI', '8266', 'IMAREDDY HALLI', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5071' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5071', r.routeName, 'Chintamani', NULL, 'CL', NULL, '636', 'K.HOSURU (47TH RT)', '636', 'K.HOSURU (47TH RT)', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5071' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5071', r.routeName, 'Chintamani', NULL, 'CL', NULL, '67', 'KODADHAVADI MPCS', '67', 'KODADHAVADI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5071' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5071', r.routeName, 'Chintamani', NULL, 'CL', NULL, '762', 'MURAGAMALLA(B)', '762', 'MURAGAMALLA(B)', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5071' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5071', r.routeName, 'Chintamani', NULL, 'CL', NULL, '114', 'SINGANAHALLI MPCS', '114', 'SINGANAHALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5071' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5071', r.routeName, 'Chintamani', NULL, 'CL', NULL, '2009', 'NANDIGANAHALLI(B)', '2009', 'NANDIGANAHALLI(B)', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5082' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5082', r.routeName, 'Chintamani', NULL, 'BM', '3000', '5082', 'MADIKERE MPCS', '5082', 'MADIKERE MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5082' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5082', r.routeName, 'Chintamani', NULL, 'CL', NULL, '8557', 'ANOORU MPCS', '8557', 'ANOORU MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5082' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5082', r.routeName, 'Chintamani', NULL, 'CL', NULL, '1088', 'H.KACHAHALLI MPCS', '1088', 'H.KACHAHALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5082' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5082', r.routeName, 'Chintamani', NULL, 'CL', NULL, '7973', 'HADIGERE MPCS', '7973', 'HADIGERE MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5082' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5082', r.routeName, 'Chintamani', NULL, 'CL', NULL, '4651', 'K.GOLLAHALLY', '4651', 'K.GOLLAHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5082' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5082', r.routeName, 'Chintamani', NULL, 'CL', NULL, '3237', 'MUDALACHINTAHALLI MPCS', '3237', 'MUDALACHINTAHALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5093' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5093', r.routeName, 'Chintamani', NULL, 'BM', '3000', '5093', 'ULAVADI MPCS', '5093', 'ULAVADI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5093' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5093', r.routeName, 'Chintamani', NULL, 'CL', NULL, '665', 'BACHAVARAHALLY', '665', 'BACHAVARAHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5093' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5093', r.routeName, 'Chintamani', NULL, 'CL', NULL, '760', 'DIGURU', '760', 'DIGURU', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5093' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5093', r.routeName, 'Chintamani', NULL, 'CL', NULL, '8433', 'HEBBARY MPCS', '8433', 'HEBBARY MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5093' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5093', r.routeName, 'Chintamani', NULL, 'CL', NULL, '5129', 'KAGATHI MPCS', '5129', 'KAGATHI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5140' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5140', r.routeName, 'Chintamani', NULL, 'BM', '3000', '5140', 'TINAKALLU MPCS', '5140', 'TINAKALLU MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5140' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5140', r.routeName, 'Chintamani', NULL, 'CL', NULL, '761', 'A.GUTTAHALLI', '761', 'A.GUTTAHALLI', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5140' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5140', r.routeName, 'Chintamani', NULL, 'CL', NULL, '7022', 'AMITIGANAHALLI MPCS', '7022', 'AMITIGANAHALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5140' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5140', r.routeName, 'Chintamani', NULL, 'CL', NULL, '496', 'BINGYANAHALLY(A)', '496', 'BINGYANAHALLY(A)', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5140' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5140', r.routeName, 'Chintamani', NULL, 'CL', NULL, '253', 'BHAKTHARAHALLY', '253', 'BHAKTHARAHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5140' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5140', r.routeName, 'Chintamani', NULL, 'CL', NULL, '7168', 'KADASANAHALLY MPCS', '7168', 'KADASANAHALLY MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5140' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5140', r.routeName, 'Chintamani', NULL, 'CL', NULL, '5581', 'MALLIKARJUNA PURA', '5581', 'MALLIKARJUNA PURA', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '6540' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '6540', r.routeName, 'Chintamani', NULL, 'BM', '3000', '6540', 'KENCHARLA HALLY MPCS', '6540', 'KENCHARLA HALLY MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '6540' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '6540', r.routeName, 'Chintamani', NULL, 'CL', NULL, '20', 'GOLLAHALLY', '20', 'GOLLAHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '6540' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '6540', r.routeName, 'Chintamani', NULL, 'CL', NULL, '1713', 'JANGALAHALLY', '1713', 'JANGALAHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '6540' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '6540', r.routeName, 'Chintamani', NULL, 'CL', NULL, '634', 'KOMMEPALLI', '634', 'KOMMEPALLI', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '6540' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '6540', r.routeName, 'Chintamani', NULL, 'CL', NULL, '6551', 'MITTA HALLY MPCS', '6551', 'MITTA HALLY MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '6540' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '6540', r.routeName, 'Chintamani', NULL, 'CL', NULL, '2415', 'NANDANAHOSAHALLI MPCS', '2415', 'NANDANAHOSAHALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '6540' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '6540', r.routeName, 'Chintamani', NULL, 'CL', NULL, '2550', 'NANDANAVANA MPCS', '2550', 'NANDANAVANA MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '6540' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '6540', r.routeName, 'Chintamani', NULL, 'CL', NULL, '1172', 'TUVVAKALAHALLY MPCS', '1172', 'TUVVAKALAHALLY MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '6540' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '6540', r.routeName, 'Chintamani', NULL, 'CL', NULL, '4048', 'KODEGANDLUWDCS', '4048', 'KODEGANDLUWDCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '6584' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '6584', r.routeName, 'Chintamani', NULL, 'BM', '3000', '6584', 'CHILAKALANERPU MPCS', '6584', 'CHILAKALANERPU MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '6584' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '6584', r.routeName, 'Chintamani', NULL, 'CL', NULL, '24', 'CHILAKALANERPU(B)', '24', 'CHILAKALANERPU(B)', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '6584' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '6584', r.routeName, 'Chintamani', NULL, 'CL', NULL, '5865', 'GADIGAVARA PALLI MPCS', '5865', 'GADIGAVARA PALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '6584' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '6584', r.routeName, 'Chintamani', NULL, 'CL', NULL, '5821', 'SALAMAKALA HALLI MPCS', '5821', 'SALAMAKALA HALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '6584' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '6584', r.routeName, 'Chintamani', NULL, 'CL', NULL, '6529', 'THULUVANURU MPCS', '6529', 'THULUVANURU MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '6595' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '6595', r.routeName, 'Chintamani', NULL, 'BM', '3000', '6595', 'IRAGAMPALLY MPCS', '6595', 'IRAGAMPALLY MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '6595' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '6595', r.routeName, 'Chintamani', NULL, 'CL', NULL, '5529', 'BYRABANDA MPCS', '5529', 'BYRABANDA MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '6595' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '6595', r.routeName, 'Chintamani', NULL, 'CL', NULL, '9458', 'ETIGADDAGOLLAHALLI MPCS', '9458', 'ETIGADDAGOLLAHALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '6595' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '6595', r.routeName, 'Chintamani', NULL, 'CL', NULL, '2421', 'MADAMANGALA MPCS', '2421', 'MADAMANGALA MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '6595' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '6595', r.routeName, 'Chintamani', NULL, 'CL', NULL, '7264', 'N.HOSAHALLI MPCS', '7264', 'N.HOSAHALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '6595' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '6595', r.routeName, 'Chintamani', NULL, 'CL', NULL, '192', 'NALLAGUTLAHALLY', '192', 'NALLAGUTLAHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '6595' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '6595', r.routeName, 'Chintamani', NULL, 'CL', NULL, '6609', 'RAGUTTAHALLY MPCS', '6609', 'RAGUTTAHALLY MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '6595' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '6595', r.routeName, 'Chintamani', NULL, 'CL', NULL, '4319', 'YASAGALA HALLI MPCS', '4319', 'YASAGALA HALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '6595' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '6595', r.routeName, 'Chintamani', NULL, 'CL', NULL, '4022', 'RAGUTTAHALLY(B)', '4022', 'RAGUTTAHALLY(B)', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '6620' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '6620', r.routeName, 'Chintamani', NULL, 'BM', '3000', '6620', 'M.GOLLA HALLY MPCS', '6620', 'M.GOLLA HALLY MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '6620' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '6620', r.routeName, 'Chintamani', NULL, 'CL', NULL, '5592', 'LAKKE PALLI MPCS', '5592', 'LAKKE PALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '6620' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '6620', r.routeName, 'Chintamani', NULL, 'CL', NULL, '688', 'VENKATARAYANAKOTE', '688', 'VENKATARAYANAKOTE', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '6653' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '6653', r.routeName, 'Chintamani', NULL, 'BM', '3000', '6653', 'KOTAGAL MPCS', '6653', 'KOTAGAL MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '6653' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '6653', r.routeName, 'Chintamani', NULL, 'CL', NULL, '7328', 'BYRASANDRA MPCS', '7328', 'BYRASANDRA MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '6653' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '6653', r.routeName, 'Chintamani', NULL, 'CL', NULL, '7929', 'DODDAHALLI MPCS', '7929', 'DODDAHALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '6653' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '6653', r.routeName, 'Chintamani', NULL, 'CL', NULL, '20', 'GOLLAHALLY', '20', 'GOLLAHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '6653' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '6653', r.routeName, 'Chintamani', NULL, 'CL', NULL, '34', 'GURAMPALLI', '34', 'GURAMPALLI', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '6653' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '6653', r.routeName, 'Chintamani', NULL, 'CL', NULL, '6540', 'KENCHARLA HALLY MPCS', '6540', 'KENCHARLA HALLY MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '6653' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '6653', r.routeName, 'Chintamani', NULL, 'CL', NULL, '386', 'KURUMARLAHALLI', '386', 'KURUMARLAHALLI', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '6653' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '6653', r.routeName, 'Chintamani', NULL, 'CL', NULL, '55', 'N.CHIKKAKATTIGENAHALLY', '55', 'N.CHIKKAKATTIGENAHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '6653' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '6653', r.routeName, 'Chintamani', NULL, 'CL', NULL, '2415', 'NANDANAHOSAHALLI MPCS', '2415', 'NANDANAHOSAHALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '6653' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '6653', r.routeName, 'Chintamani', NULL, 'CL', NULL, '6686', 'SUJJANAHALLI MPCS', '6686', 'SUJJANAHALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '6653' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '6653', r.routeName, 'Chintamani', NULL, 'CL', NULL, '4003', 'UPPARLAHALLY', '4003', 'UPPARLAHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '6700' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '6700', r.routeName, 'Chintamani', NULL, 'BM', '3000', '6700', 'PALENAHALLI MPCS', '6700', 'PALENAHALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '6700' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '6700', r.routeName, 'Chintamani', NULL, 'CL', NULL, '1630', 'CHANGAVARA HALLY', '1630', 'CHANGAVARA HALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '6700' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '6700', r.routeName, 'Chintamani', NULL, 'CL', NULL, '704', 'CHIKKAMUNIMANGALA', '704', 'CHIKKAMUNIMANGALA', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '6700' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '6700', r.routeName, 'Chintamani', NULL, 'CL', NULL, '2335', 'KETHANAYAKANAHALLI MPCS', '2335', 'KETHANAYAKANAHALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '6700' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '6700', r.routeName, 'Chintamani', NULL, 'CL', NULL, '5195', 'NELAMACHANAHALLY MPCS', '5195', 'NELAMACHANAHALLY MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '6700' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '6700', r.routeName, 'Chintamani', NULL, 'CL', NULL, '694', 'PALENAHALLY(C)', '694', 'PALENAHALLY(C)', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '6700' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '6700', r.routeName, 'Chintamani', NULL, 'CL', NULL, '6317', 'SRINIVASAPURA MPCS', '6317', 'SRINIVASAPURA MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '6700' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '6700', r.routeName, 'Chintamani', NULL, 'CL', NULL, '8264', 'YARAMAREDDY HALLI MPCS', '8264', 'YARAMAREDDY HALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '6700' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '6700', r.routeName, 'Chintamani', NULL, 'CL', NULL, '756', 'YARAMAREDDY HALLI(C)', '756', 'YARAMAREDDY HALLI(C)', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '6700' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '6700', r.routeName, 'Chintamani', NULL, 'CL', NULL, '1721', 'YESHAVANTHAPURA', '1721', 'YESHAVANTHAPURA', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '6700' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '6700', r.routeName, 'Chintamani', NULL, 'CL', NULL, '2003', 'N.VENKATAPURA', '2003', 'N.VENKATAPURA', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '7077' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '7077', r.routeName, 'Chintamani', NULL, 'BM', '3000', '7077', 'PERAMACHANA HALLY MPCS', '7077', 'PERAMACHANA HALLY MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '7077' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '7077', r.routeName, 'Chintamani', NULL, 'CL', NULL, '751', 'CHAPURA', '751', 'CHAPURA', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '7077' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '7077', r.routeName, 'Chintamani', NULL, 'CL', NULL, '1999', 'KENDANAHALLI MPCS', '1999', 'KENDANAHALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '7077' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '7077', r.routeName, 'Chintamani', NULL, 'CL', NULL, '588', 'NAGADENAHALLI MPCS', '588', 'NAGADENAHALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '7077' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '7077', r.routeName, 'Chintamani', NULL, 'CL', NULL, '752', 'PERAMACHANA HALLY(B)', '752', 'PERAMACHANA HALLY(B)', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '7077' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '7077', r.routeName, 'Chintamani', NULL, 'CL', NULL, '766', 'VENKATAPURA', '766', 'VENKATAPURA', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '7157' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '7157', r.routeName, 'Chintamani', NULL, 'BM', '3000', '7157', 'HIREKATTIGENAHALLY MPCS', '7157', 'HIREKATTIGENAHALLY MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '7157' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '7157', r.routeName, 'Chintamani', NULL, 'CL', NULL, '624', 'C.KATTIGENAHALLI', '624', 'C.KATTIGENAHALLI', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '7157' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '7157', r.routeName, 'Chintamani', NULL, 'CL', NULL, '6303', 'JEEDRAHALLI MPCS', '6303', 'JEEDRAHALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '7157' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '7157', r.routeName, 'Chintamani', NULL, 'CL', NULL, '136', 'RACHAPURA MPCS', '136', 'RACHAPURA MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '7317' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '7317', r.routeName, 'Chintamani', NULL, 'BM', '3000', '7317', 'ALAMBAGIRI MPCS', '7317', 'ALAMBAGIRI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '7317' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '7317', r.routeName, 'Chintamani', NULL, 'CL', NULL, '305', 'C.DODDAHALLI(B)', '305', 'C.DODDAHALLI(B)', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '7317' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '7317', r.routeName, 'Chintamani', NULL, 'CL', NULL, '1449', 'SULADENAHALLY', '1449', 'SULADENAHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '7317' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '7317', r.routeName, 'Chintamani', NULL, 'CL', NULL, '2093', 'A.HOSAHALLI', '2093', 'A.HOSAHALLI', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '7344' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '7344', r.routeName, 'Chintamani', NULL, 'BM', '2000', '7344', 'KATHARIGUPPA MPCS', '7344', 'KATHARIGUPPA MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '7344' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '7344', r.routeName, 'Chintamani', NULL, 'CL', NULL, '345', 'HUSENAPURA', '345', 'HUSENAPURA', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '7344' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '7344', r.routeName, 'Chintamani', NULL, 'CL', NULL, '2451', 'KANGANAHALLI MPCS', '2451', 'KANGANAHALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '7344' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '7344', r.routeName, 'Chintamani', NULL, 'CL', NULL, '859', 'ULLAPPANAHALLY', '859', 'ULLAPPANAHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '7394' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '7394', r.routeName, 'Chintamani', NULL, 'BM', '2000', '7394', 'NAYINDRAHALLI MPCS', '7394', 'NAYINDRAHALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '7422' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '7422', r.routeName, 'Chintamani', NULL, 'BM', '2000', '7422', 'JANGAMASHIGE HALLI MPCS', '7422', 'JANGAMASHIGE HALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '7805' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '7805', r.routeName, 'Chintamani', NULL, 'BM', '3000', '7805', 'CHANDRAHALLI MPCS', '7805', 'CHANDRAHALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '7805' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '7805', r.routeName, 'Chintamani', NULL, 'CL', NULL, '2277', 'KONAPALLI MPCS', '2277', 'KONAPALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '7805' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '7805', r.routeName, 'Chintamani', NULL, 'CL', NULL, '19', 'RAYAPPALLI', '19', 'RAYAPPALLI', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '7805' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '7805', r.routeName, 'Chintamani', NULL, 'CL', NULL, '2437', 'SORAPALLI MPCS', '2437', 'SORAPALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '7805' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '7805', r.routeName, 'Chintamani', NULL, 'CL', NULL, '5118', 'THIMMASANDRA MPCS', '5118', 'THIMMASANDRA MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '7805' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '7805', r.routeName, 'Chintamani', NULL, 'CL', NULL, '1955', 'BINGYANAHALLY', '1955', 'BINGYANAHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '7816' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '7816', r.routeName, 'Chintamani', NULL, 'BM', '3000', '7816', 'KAPPALI MPCS', '7816', 'KAPPALI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '7816' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '7816', r.routeName, 'Chintamani', NULL, 'CL', NULL, '2426', 'KONDLIGANAHALLI MPCS', '2426', 'KONDLIGANAHALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '7816' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '7816', r.routeName, 'Chintamani', NULL, 'CL', NULL, '7827', 'PALLIGADDA MPCS', '7827', 'PALLIGADDA MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '7816' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '7816', r.routeName, 'Chintamani', NULL, 'CL', NULL, '6631', 'YARAYYAGARA HALLY MPCS', '6631', 'YARAYYAGARA HALLY MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '8207' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '8207', r.routeName, 'Chintamani', NULL, 'BM', '2000', '8207', 'SHETTIHALLI MPCS', '8207', 'SHETTIHALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '8207' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '8207', r.routeName, 'Chintamani', NULL, 'CL', NULL, '47', 'ANAKALLU', '47', 'ANAKALLU', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '8207' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '8207', r.routeName, 'Chintamani', NULL, 'CL', NULL, '455', 'SHETTIHALLI(A)', '455', 'SHETTIHALLI(A)', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '8207' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '8207', r.routeName, 'Chintamani', NULL, 'CL', NULL, '697', 'NELAMACHANAHALLY(A)', '697', 'NELAMACHANAHALLY(A)', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '8207' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '8207', r.routeName, 'Chintamani', NULL, 'CL', NULL, '476', 'MASILAHALLY', '476', 'MASILAHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '8207' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '8207', r.routeName, 'Chintamani', NULL, 'CL', NULL, '1064', 'NARASAPURA MPCS', '1064', 'NARASAPURA MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '8207' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '8207', r.routeName, 'Chintamani', NULL, 'CL', NULL, '2031', 'CHOKKAHALLI(A)', '2031', 'CHOKKAHALLI(A)', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '8207' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '8207', r.routeName, 'Chintamani', NULL, 'CL', NULL, '2124', 'GOWNAHALLI', '2124', 'GOWNAHALLI', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '8386' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '8386', r.routeName, 'Chintamani', NULL, 'BM', '3000', '8386', 'PEDDUR MPCS', '8386', 'PEDDUR MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '8386' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '8386', r.routeName, 'Chintamani', NULL, 'CL', NULL, '5389', 'DIGAVAPALLI', '5389', 'DIGAVAPALLI', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '8386' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '8386', r.routeName, 'Chintamani', NULL, 'CL', NULL, '4294', 'GOPALLI MPCS', '4294', 'GOPALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '8386' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '8386', r.routeName, 'Chintamani', NULL, 'CL', NULL, '500', 'GOWNACHARUVUPALLI MPCS', '500', 'GOWNACHARUVUPALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '8386' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '8386', r.routeName, 'Chintamani', NULL, 'CL', NULL, '7146', 'JOGYANAHALLY MPCS', '7146', 'JOGYANAHALLY MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '8386' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '8386', r.routeName, 'Chintamani', NULL, 'CL', NULL, '1087', 'KORAKONAPALLI MPCS', '1087', 'KORAKONAPALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '8386' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '8386', r.routeName, 'Chintamani', NULL, 'CL', NULL, '8262', 'KOTTHAPALLI MPCS', '8262', 'KOTTHAPALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '8386' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '8386', r.routeName, 'Chintamani', NULL, 'CL', NULL, '333', 'MUDDALAHALLY MPCS', '333', 'MUDDALAHALLY MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '8397' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '8397', r.routeName, 'Chintamani', NULL, 'BM', '3000', '8397', 'MUNGANAHALLI MPCS', '8397', 'MUNGANAHALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '8397' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '8397', r.routeName, 'Chintamani', NULL, 'CL', NULL, '1093', 'DIGUVA DEVAPALLI', '1093', 'DIGUVA DEVAPALLI', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '8397' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '8397', r.routeName, 'Chintamani', NULL, 'CL', NULL, '753', 'MUNGANAHALLI(C)', '753', 'MUNGANAHALLI(C)', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '8397' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '8397', r.routeName, 'Chintamani', NULL, 'CL', NULL, '1980', 'MUNGANAHALLY(E)', '1980', 'MUNGANAHALLY(E)', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '8397' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '8397', r.routeName, 'Chintamani', NULL, 'CL', NULL, '2204', 'MUNGANAHALLI(F)', '2204', 'MUNGANAHALLI(F)', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '8477' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '8477', r.routeName, 'Chintamani', NULL, 'BM', '3000', '8477', 'MUTHAKADA HALLY MPCS', '8477', 'MUTHAKADA HALLY MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '8477' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '8477', r.routeName, 'Chintamani', NULL, 'CL', NULL, '613', 'GUNNAHALLI MPCS', '613', 'GUNNAHALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '8477' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '8477', r.routeName, 'Chintamani', NULL, 'CL', NULL, '8230', 'MADABAHALLI MPCS', '8230', 'MADABAHALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '8477' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '8477', r.routeName, 'Chintamani', NULL, 'CL', NULL, '125', 'MADARAKALLU MPCS', '125', 'MADARAKALLU MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '8477' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '8477', r.routeName, 'Chintamani', NULL, 'CL', NULL, '46', 'NAYINDRAHALLI COLONY', '46', 'NAYINDRAHALLI COLONY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '8477' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '8477', r.routeName, 'Chintamani', NULL, 'CL', NULL, '1445', 'NERANAKALLU MPCS', '1445', 'NERANAKALLU MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '8477' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '8477', r.routeName, 'Chintamani', NULL, 'CL', NULL, '2254', 'MUTHAKADAHALLY(A)', '2254', 'MUTHAKADAHALLY(A)', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '8477' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '8477', r.routeName, 'Chintamani', NULL, 'CL', NULL, '4002', 'BYALAHALLY', '4002', 'BYALAHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '9990' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '9990', r.routeName, 'Chintamani', NULL, 'BM', '3000', '9990', 'HOSAHUDYA MPCS', '9990', 'HOSAHUDYA MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '9990' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '9990', r.routeName, 'Chintamani', NULL, 'CL', NULL, '639', 'CHINNAPALLI', '639', 'CHINNAPALLI', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '9990' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '9990', r.routeName, 'Chintamani', NULL, 'CL', NULL, '248', 'CHINTHAMAKALA PALLI', '248', 'CHINTHAMAKALA PALLI', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '9990' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '9990', r.routeName, 'Chintamani', NULL, 'CL', NULL, '6236', 'CHOKKANA HALLI MPCS(CNT)', '6236', 'CHOKKANA HALLI MPCS(CNT)', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '9990' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '9990', r.routeName, 'Chintamani', NULL, 'CL', NULL, '9130', 'DHARAMAVARA HALLI MPCS', '9130', 'DHARAMAVARA HALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '9990' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '9990', r.routeName, 'Chintamani', NULL, 'CL', NULL, '6966', 'ENIGADELE MPCS', '6966', 'ENIGADELE MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '9990' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '9990', r.routeName, 'Chintamani', NULL, 'CL', NULL, '705', 'HOSAHUDYA(A)', '705', 'HOSAHUDYA(A)', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '9990' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '9990', r.routeName, 'Chintamani', NULL, 'CL', NULL, '1535', 'KENCHEPALLI', '1535', 'KENCHEPALLI', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '9990' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '9990', r.routeName, 'Chintamani', NULL, 'CL', NULL, '7907', 'MOTAMAKALAPALLI MPCS', '7907', 'MOTAMAKALAPALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '9990' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '9990', r.routeName, 'Chintamani', NULL, 'CL', NULL, '8885', 'T.DEVAPALLI MPCS', '8885', 'T.DEVAPALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '9990' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '9990', r.routeName, 'Chintamani', NULL, 'CL', NULL, '690', 'VANGIMALLU', '690', 'VANGIMALLU', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '9990' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '9990', r.routeName, 'Chintamani', NULL, 'CL', NULL, '1070', 'Y.GUNDLAHALLY MPCS', '1070', 'Y.GUNDLAHALLY MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '9990' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '9990', r.routeName, 'Chintamani', NULL, 'CL', NULL, '2148', 'N.CHIKKAKATTIGENAHALLY(A)', '2148', 'N.CHIKKAKATTIGENAHALLY(A)', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'CHINTAMANI' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2781' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2781', r.routeName, 'Gudibande', NULL, 'BM', '3000', '2781', 'GUDIBANDE MPCS', '2781', 'GUDIBANDE MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GUDIBANDE' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2781' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2781', r.routeName, 'Gudibande', NULL, 'CL', NULL, '1573', 'ELLODU', '1573', 'ELLODU', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GUDIBANDE' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2781' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2781', r.routeName, 'Gudibande', NULL, 'CL', NULL, '1521', 'KONDAREDDY HALLY', '1521', 'KONDAREDDY HALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GUDIBANDE' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2781' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2781', r.routeName, 'Gudibande', NULL, 'CL', NULL, '5866', 'KONDAVALAHALLY MPCS', '5866', 'KONDAVALAHALLY MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GUDIBANDE' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2781' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2781', r.routeName, 'Gudibande', NULL, 'CL', NULL, '2012', 'PASUPALODU MPCS', '2012', 'PASUPALODU MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GUDIBANDE' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2781' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2781', r.routeName, 'Gudibande', NULL, 'CL', NULL, '4012', 'GUNDLAHALLY', '4012', 'GUNDLAHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GUDIBANDE' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '3332' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '3332', r.routeName, 'Gudibande', NULL, 'BM', '3000', '3332', 'BATHALA HALLI(26rt)', '3332', 'BATHALA HALLI(26rt)', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GUDIBANDE' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '3332' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '3332', r.routeName, 'Gudibande', NULL, 'CL', NULL, '1899', 'BATHALA HALLI(A)', '1899', 'BATHALA HALLI(A)', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GUDIBANDE' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '3332' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '3332', r.routeName, 'Gudibande', NULL, 'CL', NULL, '8755', 'CHIKKA THIMMANAHALLI', '8755', 'CHIKKA THIMMANAHALLI', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GUDIBANDE' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '3332' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '3332', r.routeName, 'Gudibande', NULL, 'CL', NULL, '9758', 'DAPPARTHI MPCS', '9758', 'DAPPARTHI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GUDIBANDE' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '3332' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '3332', r.routeName, 'Gudibande', NULL, 'CL', NULL, '58', 'GAVIKUNTA HALLY', '58', 'GAVIKUNTA HALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GUDIBANDE' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '3332' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '3332', r.routeName, 'Gudibande', NULL, 'CL', NULL, '9984', 'HALEGUDIBANDE MPCS', '9984', 'HALEGUDIBANDE MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GUDIBANDE' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '3332' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '3332', r.routeName, 'Gudibande', NULL, 'CL', NULL, '9135', 'IRAGAREDDY PALLI MPCS', '9135', 'IRAGAREDDY PALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GUDIBANDE' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '3332' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '3332', r.routeName, 'Gudibande', NULL, 'CL', NULL, '28', 'NADUVANAHALLI', '28', 'NADUVANAHALLI', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GUDIBANDE' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '3332' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '3332', r.routeName, 'Gudibande', NULL, 'CL', NULL, '1486', 'NICHANA BANDA HALLY', '1486', 'NICHANA BANDA HALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GUDIBANDE' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '3332' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '3332', r.routeName, 'Gudibande', NULL, 'CL', NULL, '4448', 'YALAKALARALLAHALLI MPCS', '4448', 'YALAKALARALLAHALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GUDIBANDE' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5511' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5511', r.routeName, 'Gudibande', NULL, 'BM', '3000', '5511', 'BEECHAGANAHALLY MPCS', '5511', 'BEECHAGANAHALLY MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GUDIBANDE' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5511' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5511', r.routeName, 'Gudibande', NULL, 'CL', NULL, '609', 'DUMAKUNTAHALLI', '609', 'DUMAKUNTAHALLI', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GUDIBANDE' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5511' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5511', r.routeName, 'Gudibande', NULL, 'CL', NULL, '9317', 'PEMANA HALLI MPCS', '9317', 'PEMANA HALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GUDIBANDE' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5511' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5511', r.routeName, 'Gudibande', NULL, 'CL', NULL, '3456', 'THATTAHALLI', '3456', 'THATTAHALLI', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GUDIBANDE' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5511' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5511', r.routeName, 'Gudibande', NULL, 'CL', NULL, '1964', 'KORENAHALLY', '1964', 'KORENAHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GUDIBANDE' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5511' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5511', r.routeName, 'Gudibande', NULL, 'CL', NULL, '1971', 'CHENDURU', '1971', 'CHENDURU', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GUDIBANDE' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5511' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5511', r.routeName, 'Gudibande', NULL, 'CL', NULL, '2055', 'RAMAGANAHALLY', '2055', 'RAMAGANAHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GUDIBANDE' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5511' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5511', r.routeName, 'Gudibande', NULL, 'CL', NULL, '2068', 'NEELAGUMBA', '2068', 'NEELAGUMBA', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GUDIBANDE' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5511' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5511', r.routeName, 'Gudibande', NULL, 'CL', NULL, '2247', 'CHENDURU(A)', '2247', 'CHENDURU(A)', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GUDIBANDE' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5511' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5511', r.routeName, 'Gudibande', NULL, 'CL', NULL, '4031', 'YARRAHALLY', '4031', 'YARRAHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GUDIBANDE' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5644' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5644', r.routeName, 'Gudibande', NULL, 'BM', '3000', '5644', 'BOGENAHALLI MPCS', '5644', 'BOGENAHALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GUDIBANDE' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5644' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5644', r.routeName, 'Gudibande', NULL, 'CL', NULL, '440', 'CHINNAPPANAHALLY', '440', 'CHINNAPPANAHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GUDIBANDE' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5644' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5644', r.routeName, 'Gudibande', NULL, 'CL', NULL, '5655', 'DINNENAHALLI MPCS', '5655', 'DINNENAHALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GUDIBANDE' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5644' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5644', r.routeName, 'Gudibande', NULL, 'CL', NULL, '735', 'KAMBALAHALLY', '735', 'KAMBALAHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GUDIBANDE' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5644' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5644', r.routeName, 'Gudibande', NULL, 'CL', NULL, '240', 'MINCHANAHALLI', '240', 'MINCHANAHALLI', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GUDIBANDE' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5644' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5644', r.routeName, 'Gudibande', NULL, 'CL', NULL, '8143', 'THIRUMANI MPCS', '8143', 'THIRUMANI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GUDIBANDE' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5644' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5644', r.routeName, 'Gudibande', NULL, 'CL', NULL, '2056', 'YARRALAKKENAHALLI MPCS', '2056', 'YARRALAKKENAHALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GUDIBANDE' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5881' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5881', r.routeName, 'Gudibande', NULL, 'BM', '3000', '5881', 'SOMENAHALLI MPCS', '5881', 'SOMENAHALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GUDIBANDE' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5881' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5881', r.routeName, 'Gudibande', NULL, 'CL', NULL, '1290', 'CHENNENAHALLY MPCS', '1290', 'CHENNENAHALLY MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GUDIBANDE' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5881' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5881', r.routeName, 'Gudibande', NULL, 'CL', NULL, '1753', 'VARALAKONDA(A)', '1753', 'VARALAKONDA(A)', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GUDIBANDE' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5881' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5881', r.routeName, 'Gudibande', NULL, 'CL', NULL, '8888', 'CHIKKA NANCHERLU MPCS', '8888', 'CHIKKA NANCHERLU MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GUDIBANDE' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5881' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5881', r.routeName, 'Gudibande', NULL, 'CL', NULL, '9951', 'GEGGILARALLA HALLI', '9951', 'GEGGILARALLA HALLI', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GUDIBANDE' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5881' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5881', r.routeName, 'Gudibande', NULL, 'CL', NULL, '606', 'GUMMAREDDYHALLY', '606', 'GUMMAREDDYHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GUDIBANDE' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5881' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5881', r.routeName, 'Gudibande', NULL, 'CL', NULL, '31', 'JAMBIGEMARADAHALLY', '31', 'JAMBIGEMARADAHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GUDIBANDE' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5881' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5881', r.routeName, 'Gudibande', NULL, 'CL', NULL, '7774', 'KAMMMADIKE MPCS', '7774', 'KAMMMADIKE MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GUDIBANDE' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5881' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5881', r.routeName, 'Gudibande', NULL, 'CL', NULL, '1528', 'KATENAHALLY', '1528', 'KATENAHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GUDIBANDE' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5881' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5881', r.routeName, 'Gudibande', NULL, 'CL', NULL, '9962', 'MALLENA HALLI MPCS', '9962', 'MALLENA HALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GUDIBANDE' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5881' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5881', r.routeName, 'Gudibande', NULL, 'CL', NULL, '1544', 'PURADAHALLY', '1544', 'PURADAHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GUDIBANDE' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5881' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5881', r.routeName, 'Gudibande', NULL, 'CL', NULL, '2045', 'SOMESHWARA MPCS', '2045', 'SOMESHWARA MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GUDIBANDE' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5881' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5881', r.routeName, 'Gudibande', NULL, 'CL', NULL, '1044', 'KOTAGAL MPCS', '1044', 'KOTAGAL MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GUDIBANDE' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5881' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5881', r.routeName, 'Gudibande', NULL, 'CL', NULL, '2206', 'GANGANAHALLI', '2206', 'GANGANAHALLI', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GUDIBANDE' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '8154' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '8154', r.routeName, 'Gudibande', NULL, 'BM', '3000', '8154', 'VARALAKONDA MPCS', '8154', 'VARALAKONDA MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GUDIBANDE' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '8154' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '8154', r.routeName, 'Gudibande', NULL, 'CL', NULL, '8460', 'APPA REDDY HALLI', '8460', 'APPA REDDY HALLI', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GUDIBANDE' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '8154' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '8154', r.routeName, 'Gudibande', NULL, 'CL', NULL, '1366', 'JANGALA HALLI MPCS', '1366', 'JANGALA HALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GUDIBANDE' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '8154' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '8154', r.routeName, 'Gudibande', NULL, 'CL', NULL, '374', 'LAKSHMISAGARA', '374', 'LAKSHMISAGARA', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GUDIBANDE' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '8154' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '8154', r.routeName, 'Gudibande', NULL, 'CL', NULL, '743', 'MEDIMAKALAHALLI', '743', 'MEDIMAKALAHALLI', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GUDIBANDE' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '8154' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '8154', r.routeName, 'Gudibande', NULL, 'CL', NULL, '723', 'MUDDAREDDYHALLY', '723', 'MUDDAREDDYHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GUDIBANDE' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '8154' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '8154', r.routeName, 'Gudibande', NULL, 'CL', NULL, '9973', 'POLAMPALLI MPCS', '9973', 'POLAMPALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GUDIBANDE' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '8154' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '8154', r.routeName, 'Gudibande', NULL, 'CL', NULL, '8890', 'THEELA KUNTAHALLI MPCS', '8890', 'THEELA KUNTAHALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GUDIBANDE' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '8154' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '8154', r.routeName, 'Gudibande', NULL, 'CL', NULL, '1529', 'V.BATHALAHALLI', '1529', 'V.BATHALAHALLI', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GUDIBANDE' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '8154' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '8154', r.routeName, 'Gudibande', NULL, 'CL', NULL, '1959', 'KERENAHALLY', '1959', 'KERENAHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GUDIBANDE' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '8336' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '8336', r.routeName, 'Gudibande', NULL, 'BM', '3000', '8336', 'HAMPASANDRA MPCS', '8336', 'HAMPASANDRA MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GUDIBANDE' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '8336' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '8336', r.routeName, 'Gudibande', NULL, 'CL', NULL, '1916', 'BULLASANDRA', '1916', 'BULLASANDRA', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GUDIBANDE' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '8336' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '8336', r.routeName, 'Gudibande', NULL, 'CL', NULL, '8385', 'CHOWTAKUNTAHALLI', '8385', 'CHOWTAKUNTAHALLI', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GUDIBANDE' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '8336' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '8336', r.routeName, 'Gudibande', NULL, 'CL', NULL, '8347', 'KADEHALLY MPCS', '8347', 'KADEHALLY MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GUDIBANDE' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '9623' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '9623', r.routeName, 'Gudibande', NULL, 'BM', '2000', '9623', 'IDRAHALLI MPCS', '9623', 'IDRAHALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GUDIBANDE' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '9623' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '9623', r.routeName, 'Gudibande', NULL, 'CL', NULL, '1126', 'BRAHMANARAHALLI MPCS', '1126', 'BRAHMANARAHALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GUDIBANDE' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '9623' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '9623', r.routeName, 'Gudibande', NULL, 'CL', NULL, '117', 'CHOWTATHIMMANA HALLY', '117', 'CHOWTATHIMMANA HALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GUDIBANDE' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '9623' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '9623', r.routeName, 'Gudibande', NULL, 'CL', NULL, '17', 'KARIGANATHAMMANAHALLI', '17', 'KARIGANATHAMMANAHALLI', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GUDIBANDE' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '9623' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '9623', r.routeName, 'Gudibande', NULL, 'CL', NULL, '2737', 'ULLODU MPCS', '2737', 'ULLODU MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GUDIBANDE' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '360' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '360', r.routeName, 'Gauribidanur', NULL, 'BM', '3000', '360', 'DYAVARAHALLY', '360', 'DYAVARAHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '360' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '360', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '2143', 'BANDARLAHALLY', '2143', 'BANDARLAHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '360' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '360', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '3122', 'BASAVAPURA MPCS', '3122', 'BASAVAPURA MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '360' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '360', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '5645', 'CHIKKA HOSAHALLI', '5645', 'CHIKKA HOSAHALLI', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '360' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '360', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '700', 'POOJARLAHALLY', '700', 'POOJARLAHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '360' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '360', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '1063', 'THIPPEGANAHALLI MPCS', '1063', 'THIPPEGANAHALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '360' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '360', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '1966', 'BALLERLAHALLY', '1966', 'BALLERLAHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '3339' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '3339', r.routeName, 'Gauribidanur', NULL, 'BM', '3000', '3339', 'M.NAGENAHALLI', '3339', 'M.NAGENAHALLI', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '3339' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '3339', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '7112', 'GIDAGANAHALLI MPCS', '7112', 'GIDAGANAHALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '3339' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '3339', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '353', 'HEGGENAHALLY', '353', 'HEGGENAHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '3339' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '3339', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '139', 'M.GUNDLAHALLI', '139', 'M.GUNDLAHALLI', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '3339' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '3339', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '7101', 'PURA MPCS', '7101', 'PURA MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '4136' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '4136', r.routeName, 'Gauribidanur', NULL, 'BM', '3000', '4136', 'KALINAYAKANA HALLY MPCS', '4136', 'KALINAYAKANA HALLY MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '4136' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '4136', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '224', 'G.BOMMASANDRA', '224', 'G.BOMMASANDRA', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '4136' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '4136', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '461', 'K.DINAMGHATTANAHALLY', '461', 'K.DINAMGHATTANAHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '4136' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '4136', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '6033', 'KENKERE MPCS', '6033', 'KENKERE MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '4136' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '4136', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '6029', 'KUNTACHIKKANAHALLY MPCS', '6029', 'KUNTACHIKKANAHALLY MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '4136' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '4136', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '520', 'REDDYDYAVARA HALLY', '520', 'REDDYDYAVARA HALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '4136' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '4136', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '5558', 'VEDALAVENI MPCS', '5558', 'VEDALAVENI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '4136' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '4136', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '2032', 'MALLASANDRA', '2032', 'MALLASANDRA', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '4136' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '4136', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '2123', 'INDIRANAGARA', '2123', 'INDIRANAGARA', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '4158' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '4158', r.routeName, 'Gauribidanur', NULL, 'BM', '3000', '4158', 'ALKAPURA MPCS', '4158', 'ALKAPURA MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '4158' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '4158', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '1936', 'CHIKKAHANUMENAHALLY', '1936', 'CHIKKAHANUMENAHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '4158' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '4158', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '1735', 'DODDAHANUMENAHALLY', '1735', 'DODDAHANUMENAHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '4158' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '4158', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '134', 'DODDAHUSSAINPURA', '134', 'DODDAHUSSAINPURA', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '4158' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '4158', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '450', 'NANDIGANA HALLY MPCS', '450', 'NANDIGANA HALLY MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '4158' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '4158', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '3822', 'RAYA REKHALA HALLI MPCS', '3822', 'RAYA REKHALA HALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '4158' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '4158', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '4053', 'POTHENAHALLI', '4053', 'POTHENAHALLI', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '4191' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '4191', r.routeName, 'Gauribidanur', NULL, 'BM', '3000', '4191', 'DARINAYAKANAPALAYA MPCS', '4191', 'DARINAYAKANAPALAYA MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '4191' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '4191', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '2364', 'BACHAREDDY HALLY', '2364', 'BACHAREDDY HALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '4191' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '4191', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '8159', 'CHILAMANAHALLI', '8159', 'CHILAMANAHALLI', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '4191' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '4191', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '4715', 'G.M.VADDENAHALLI', '4715', 'G.M.VADDENAHALLI', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '4191' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '4191', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '1932', 'MIDDILU', '1932', 'MIDDILU', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '4191' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '4191', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '2059', 'GOLLARACOLONY', '2059', 'GOLLARACOLONY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '4191' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '4191', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '2186', 'BACHAREDDYHALLY(B)', '2186', 'BACHAREDDYHALLY(B)', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '4191' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '4191', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '2270', 'GOLLARACOLONY(A)', '2270', 'GOLLARACOLONY(A)', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '4191' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '4191', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '4023', 'MIDDILU(A)', '4023', 'MIDDILU(A)', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '4191' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '4191', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '4026', 'NARASAPURA(GBN)', '4026', 'NARASAPURA(GBN)', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '4191' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '4191', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '4042', 'DARINAYAKANAPALAYA(A)', '4042', 'DARINAYAKANAPALAYA(A)', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '4191' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '4191', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '4050', 'DINNEMELINAHALLY', '4050', 'DINNEMELINAHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '4191' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '4191', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '4059', 'ANAGATTANAHALLY', '4059', 'ANAGATTANAHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '4249' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '4249', r.routeName, 'Gauribidanur', NULL, 'BM', '3000', '4249', 'HAMPASANDRA MPCS', '4249', 'HAMPASANDRA MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '4249' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '4249', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '8308', 'CHANDANADUR MPCS', '8308', 'CHANDANADUR MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '4249' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '4249', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '4216', 'JODIBISALAHALLI MPCS', '4216', 'JODIBISALAHALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '4249' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '4249', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '2113', 'KUNDIHALLI', '2113', 'KUNDIHALLI', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '4249' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '4249', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '4025', 'HOSAUPPARAHALLI', '4025', 'HOSAUPPARAHALLI', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '4260' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '4260', r.routeName, 'Gauribidanur', NULL, 'BM', '3000', '4260', 'HALEUPPARAHALLY MPCS', '4260', 'HALEUPPARAHALLY MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '4260' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '4260', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '1913', 'CHENNENAHALLY', '1913', 'CHENNENAHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '4260' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '4260', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '4255', 'HOSUR MPCS', '4255', 'HOSUR MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '4260' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '4260', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '4227', 'KADALAVENI MPCS', '4227', 'KADALAVENI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '4260' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '4260', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '2278', 'KURUGODUTHAMMANAHALLY', '2278', 'KURUGODUTHAMMANAHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '4260' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '4260', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '4205', 'YERRAPOTHENAHALLI MPCS', '4205', 'YERRAPOTHENAHALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '4260' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '4260', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '4016', 'HALEUPPARAHALLY(C)', '4016', 'HALEUPPARAHALLY(C)', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '4271' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '4271', r.routeName, 'Gauribidanur', NULL, 'BM', '3000', '4271', 'GEDARE MPCS', '4271', 'GEDARE MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '4271' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '4271', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '1935', 'KACHAMACHENAHALLY', '1935', 'KACHAMACHENAHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '4271' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '4271', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '4522', 'KAMAGANAHALLY', '4522', 'KAMAGANAHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '4271' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '4271', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '5642', 'KONDAPURA', '5642', 'KONDAPURA', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '4271' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '4271', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '75', 'SHEEGALA HALLY', '75', 'SHEEGALA HALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '4271' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '4271', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '614', 'VEERLAGOLLAHALLY', '614', 'VEERLAGOLLAHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '4271' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '4271', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '4017', 'KENKERE(B)', '4017', 'KENKERE(B)', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '4271' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '4271', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '4051', 'BANDARAHALLI', '4051', 'BANDARAHALLI', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '4271' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '4271', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '4052', 'HANUMANTHANAGARA', '4052', 'HANUMANTHANAGARA', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '4307' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '4307', r.routeName, 'Gauribidanur', NULL, 'BM', '3000', '4307', 'KUROODI MPCS', '4307', 'KUROODI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '4307' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '4307', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '1726', 'ANUDI', '1726', 'ANUDI', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '4307' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '4307', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '1620', 'BOMMASHETTIHALLY', '1620', 'BOMMASHETTIHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '4307' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '4307', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '4318', 'GUNDAPURA MPCS', '4318', 'GUNDAPURA MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '4307' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '4307', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '1133', 'KADARANAHALLY', '1133', 'KADARANAHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '4307' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '4307', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '4511', 'KUDUREBYALYA MPCS', '4511', 'KUDUREBYALYA MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '4307' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '4307', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '4293', 'MUDUGERE MPCS', '4293', 'MUDUGERE MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '4307' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '4307', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '1926', 'RANGANAHALLY', '1926', 'RANGANAHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '4307' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '4307', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '4014', 'BOMMASHETTIHALLY(A)', '4014', 'BOMMASHETTIHALLY(A)', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '4307' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '4307', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '4060', 'BHAKTARAHALLI', '4060', 'BHAKTARAHALLI', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '4544' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '4544', r.routeName, 'Gauribidanur', NULL, 'BM', '3000', '4544', 'UPPARAHALLY MPCS', '4544', 'UPPARAHALLY MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '4544' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '4544', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '3694', 'ARUKUNDHA', '3694', 'ARUKUNDHA', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '4544' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '4544', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '88', 'KATANAGENAHALLY', '88', 'KATANAGENAHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '4544' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '4544', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '217', 'KONDENAHALLY', '217', 'KONDENAHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '4544' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '4544', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '4533', 'MAVINAKAYINAHALLI MPCS', '4533', 'MAVINAKAYINAHALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '4544' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '4544', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '57', 'VARAVANI', '57', 'VARAVANI', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '4544' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '4544', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '4005', 'DVARAGANAHALLY', '4005', 'DVARAGANAHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '4624' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '4624', r.routeName, 'Gauribidanur', NULL, 'BM', '3000', '4624', 'NAMAGONDLU MPCS', '4624', 'NAMAGONDLU MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '4624' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '4624', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '7026', 'CHEEGATAGERE MPCS', '7026', 'CHEEGATAGERE MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '4624' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '4624', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '394', 'GANGABHAGIRATHI EXTN', '394', 'GANGABHAGIRATHI EXTN', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '4624' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '4624', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '9901', 'GUNDLAHALLY MPCS', '9901', 'GUNDLAHALLY MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '4624' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '4624', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '4169', 'KURBARAHALLI MPCS(DBPUR)', '4169', 'KURBARAHALLI MPCS(DBPUR)', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '4624' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '4624', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '3833', 'MELINA KURABARAHALLI MPCS', '3833', 'MELINA KURABARAHALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '4624' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '4624', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '2185', 'SIDDENAHALLI', '2185', 'SIDDENAHALLI', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '4624' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '4624', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '2090', 'SAGANAHALLI', '2090', 'SAGANAHALLI', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '4624' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '4624', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '4028', 'JAKKENAHALLY(B)', '4028', 'JAKKENAHALLY(B)', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '4635' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '4635', r.routeName, 'Gauribidanur', NULL, 'BM', '3000', '4635', 'HUDUGUR MPCS', '4635', 'HUDUGUR MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '4635' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '4635', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '777', 'BADI MARALURU MPCS', '777', 'BADI MARALURU MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '4635' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '4635', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '2899', 'HIREBIDANURU', '2899', 'HIREBIDANURU', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '4635' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '4635', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '1871', 'HUDUTHI', '1871', 'HUDUTHI', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '4635' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '4635', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '4577', 'KALLUDI MPCS', '4577', 'KALLUDI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '4635' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '4635', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '1716', 'KAREKALLA HALLY', '1716', 'KAREKALLA HALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '4635' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '4635', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '4613', 'NAKKALAHALLY MPCS', '4613', 'NAKKALAHALLY MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '4635' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '4635', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '1639', 'PUTTAPURLAHALLY', '1639', 'PUTTAPURLAHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '4635' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '4635', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '4704', 'VIRUPASANDRA MPCS', '4704', 'VIRUPASANDRA MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '4635' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '4635', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '4063', 'BADIMARALURU(A)', '4063', 'BADIMARALURU(A)', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '4646' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '4646', r.routeName, 'Gauribidanur', NULL, 'BM', '3000', '4646', 'DODDAMALLAKERE MPCS', '4646', 'DODDAMALLAKERE MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '4646' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '4646', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '4770', 'ALIPURA MPCS', '4770', 'ALIPURA MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '4646' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '4646', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '2221', 'KAMBALA HALLI MPCS', '2221', 'KAMBALA HALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '4646' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '4646', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '1128', 'PULAGANAHALLY', '1128', 'PULAGANAHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '4646' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '4646', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '223', 'VEERAMMANA HALLY', '223', 'VEERAMMANA HALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '4646' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '4646', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '1992', 'BEVINAHALLY', '1992', 'BEVINAHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '4646' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '4646', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '2026', 'BASAVANAHALLY', '2026', 'BASAVANAHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '4679' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '4679', r.routeName, 'Gauribidanur', NULL, 'BM', '3000', '4679', 'MELYA MPCS', '4679', 'MELYA MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '4679' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '4679', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '1884', 'BYCHAPURA', '1884', 'BYCHAPURA', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '4679' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '4679', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '102', 'CHITTAWALA HALLI MPCS', '102', 'CHITTAWALA HALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '4679' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '4679', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '7564', 'HUNASENAHALLI MPCS', '7564', 'HUNASENAHALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '4679' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '4679', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '267', 'RAMACHANDRAPURA', '267', 'RAMACHANDRAPURA', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '4679' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '4679', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '7393', 'VALLAPPI MPCS', '7393', 'VALLAPPI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '4679' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '4679', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '4007', 'KONAPURA', '4007', 'KONAPURA', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '4679' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '4679', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '4030', 'JAGAREDDYHALLY', '4030', 'JAGAREDDYHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '4679' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '4679', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '4054', 'GOWDASANDRA', '4054', 'GOWDASANDRA', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '4679' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '4679', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '4055', 'UCHODANAHALLY', '4055', 'UCHODANAHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '4737' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '4737', r.routeName, 'Gauribidanur', NULL, 'BM', '3000', '4737', 'TARIDALU MPCS', '4737', 'TARIDALU MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '4737' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '4737', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '218', 'DYAVASANDRA MYLAGANAHALLI', '218', 'DYAVASANDRA MYLAGANAHALLI', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '4737' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '4737', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '5890', 'MACHENAHALLY', '5890', 'MACHENAHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '4737' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '4737', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '1623', 'NACHAKUNTE', '1623', 'NACHAKUNTE', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '4737' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '4737', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '1621', 'NAGTHENAHALLY', '1621', 'NAGTHENAHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '4737' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '4737', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '4726', 'SOMASHETTIHALLY MPCS', '4726', 'SOMASHETTIHALLY MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '4737' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '4737', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '6335', 'SONAGANAHALLY (M)', '6335', 'SONAGANAHALLY (M)', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '4737' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '4737', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '1973', 'GODDAVALAHALLY', '1973', 'GODDAVALAHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '4759' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '4759', r.routeName, 'Gauribidanur', NULL, 'BM', '3000', '4759', 'GUNDLAKOTHUR MPCS', '4759', 'GUNDLAKOTHUR MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '4759' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '4759', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '1723', 'CHOLA SHETTIHALLI MPCS', '1723', 'CHOLA SHETTIHALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '4759' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '4759', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '9821', 'KRISHNARAJAPURACHIMAKAL', '9821', 'KRISHNARAJAPURACHIMAKAL', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '4759' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '4759', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '3326', 'THOKALA HALLI MPCS', '3326', 'THOKALA HALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '4759' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '4759', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '2017', 'M.GOLLAHALLY(A)', '2017', 'M.GOLLAHALLY(A)', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '4759' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '4759', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '2287', 'HALEHOORU', '2287', 'HALEHOORU', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '4759' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '4759', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '4020', 'HALEHOORU(A)', '4020', 'HALEHOORU(A)', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '4759' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '4759', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '4024', 'HALEHOORU(B)', '4024', 'HALEHOORU(B)', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '4759' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '4759', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '4058', 'THOKALA HALLY(C)', '4058', 'THOKALA HALLY(C)', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5635' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5635', r.routeName, 'Gauribidanur', NULL, 'BM', '3000', '5635', 'KAMAREDDY HALLI', '5635', 'KAMAREDDY HALLI', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5635' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5635', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '256', 'BIKKALA HALLY', '256', 'BIKKALA HALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5635' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5635', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '984', 'KAMAGANAHALLY(WDCS)', '984', 'KAMAGANAHALLY(WDCS)', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5635' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5635', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '112', 'MARIMAKALAHALLY', '112', 'MARIMAKALAHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5922' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5922', r.routeName, 'Gauribidanur', NULL, 'BM', '3000', '5922', 'THONDEBAVI MPCS', '5922', 'THONDEBAVI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5922' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5922', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '5629', 'BELATHURU MPCS', '5629', 'BELATHURU MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5922' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5922', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '4147', 'BILICHIKKANAHALLY MPCS', '4147', 'BILICHIKKANAHALLY MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5922' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5922', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '6', 'CHARAKAMATNAHALLY', '6', 'CHARAKAMATNAHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5922' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5922', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '304', 'KADIRADEVARAHALLY', '304', 'KADIRADEVARAHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5922' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5922', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '1066', 'MINDENAHALLI MPCS', '1066', 'MINDENAHALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5922' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5922', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '279', 'THAPASAMAKALAHALLY', '279', 'THAPASAMAKALAHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5922' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5922', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '1972', 'PINJARLAHALLY', '1972', 'PINJARLAHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5922' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5922', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '4046', 'THONDEBAVI(C)', '4046', 'THONDEBAVI(C)', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5955' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5955', r.routeName, 'Gauribidanur', NULL, 'BM', '3000', '5955', 'SADENAHALLY MPCS', '5955', 'SADENAHALLY MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5955' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5955', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '70', 'ADDEKOPPA', '70', 'ADDEKOPPA', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5955' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5955', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '488', 'ALASTHIMMANAHALLY', '488', 'ALASTHIMMANAHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5955' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5955', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '5966', 'GOWDAGERE MPCS', '5966', 'GOWDAGERE MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5955' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5955', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '118', 'GUNIBEELU', '118', 'GUNIBEELU', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5955' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5955', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '8487', 'GUYYALA HALLY MPCS', '8487', 'GUYYALA HALLY MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5955' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5955', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '141', 'KANGANA KOPPA', '141', 'KANGANA KOPPA', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5977' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5977', r.routeName, 'Gauribidanur', NULL, 'BM', '3000', '5977', 'MINAKANAGURKI MPCS', '5977', 'MINAKANAGURKI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5977' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5977', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '4566', 'BANDIRAMANAHALLY MPCS', '4566', 'BANDIRAMANAHALLY MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5977' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5977', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '5641', 'DANDIGANAHALLY', '5641', 'DANDIGANAHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5977' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5977', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '741', 'JARABANDA HALLY', '741', 'JARABANDA HALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5977' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5977', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '457', 'KAMBATHANAHALLY', '457', 'KAMBATHANAHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5977' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5977', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '397', 'M.BHOOMENAHALLY', '397', 'M.BHOOMENAHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5977' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5977', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '2210', 'MANCHENAHALLY MPCS', '2210', 'MANCHENAHALLY MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5977' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5977', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '5900', 'MYLAGANAHALLI MPCS', '5900', 'MYLAGANAHALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5977' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5977', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '1890', 'NULUGUMMANAHALLY', '1890', 'NULUGUMMANAHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5977' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5977', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '7520', 'RAYANAKALLU MPCS', '7520', 'RAYANAKALLU MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5977' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5977', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '1961', 'DINNENAHALLY', '1961', 'DINNENAHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5977' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5977', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '2064', 'THEKALAHALLI', '2064', 'THEKALAHALLI', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5988' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5988', r.routeName, 'Gauribidanur', NULL, 'BM', '3000', '5988', 'HANUMANTHAPURA MPCS', '5988', 'HANUMANTHAPURA MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5988' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5988', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '199', 'BALAREDDYHALLY', '199', 'BALAREDDYHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5988' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5988', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '3232', 'KAMBALAHALLY', '3232', 'KAMBALAHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5988' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5988', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '229', 'PIDACHALAHALLY', '229', 'PIDACHALAHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5988' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5988', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '2101', 'GUTTENAHALLI', '2101', 'GUTTENAHALLI', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '6007' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '6007', r.routeName, 'Gauribidanur', NULL, 'BM', '3000', '6007', 'BISALAHALLI MPCS', '6007', 'BISALAHALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '6007' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '6007', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '352', 'GUVVALAHALLY', '352', 'GUVVALAHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '6007' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '6007', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '79', 'JAKKENAHALLY', '79', 'JAKKENAHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '6007' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '6007', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '1958', 'P.NAGENAHALLY', '1958', 'P.NAGENAHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '6007' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '6007', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '2030', 'BEERAMANGALA', '2030', 'BEERAMANGALA', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '6007' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '6007', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '4027', 'JAKKENAHALLY(A)', '4027', 'JAKKENAHALLY(A)', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '6007' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '6007', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '4062', 'KENGENAHALLI', '4062', 'KENGENAHALLI', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '6109' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '6109', r.routeName, 'Gauribidanur', NULL, 'BM', '3000', '6109', 'NAGARAGERE MPCS', '6109', 'NAGARAGERE MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '6109' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '6109', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '1791', 'M.GOLLAHALLY', '1791', 'M.GOLLAHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '6109' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '6109', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '7021', 'NANJAIYAGARAPALLI MPCS', '7021', 'NANJAIYAGARAPALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '6109' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '6109', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '2017', 'M.GOLLAHALLY(A)', '2017', 'M.GOLLAHALLY(A)', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '6109' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '6109', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '2112', 'MUDALODU', '2112', 'MUDALODU', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '6109' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '6109', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '2188', 'M.GOLLAHALLY(C)', '2188', 'M.GOLLAHALLY(C)', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '6550' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '6550', r.routeName, 'Gauribidanur', NULL, 'BM', '3000', '6550', 'SARAGONDLU MPCS', '6550', 'SARAGONDLU MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '6550' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '6550', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '4781', 'B.BOMMASANDRA MPCS', '4781', 'B.BOMMASANDRA MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '6550' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '6550', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '4177', 'GANGASANDRA MPCS', '4177', 'GANGASANDRA MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '6550' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '6550', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '4180', 'KADABOOR MPCS', '4180', 'KADABOOR MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '6550' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '6550', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '7407', 'VENKATAPURA MPCS', '7407', 'VENKATAPURA MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '6550' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '6550', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '4028', 'JAKKENAHALLY(B)', '4028', 'JAKKENAHALLY(B)', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '8217' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '8217', r.routeName, 'Gauribidanur', NULL, 'BM', '3000', '8217', 'HALEHALLY MPCS', '8217', 'HALEHALLY MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '8217' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '8217', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '1052', 'CHEELENAHALLI MPCS', '1052', 'CHEELENAHALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '8217' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '8217', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '1575', 'DEVARAKONDAHALLY', '1575', 'DEVARAKONDAHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '8217' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '8217', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '1233', 'HONNAPPANA HALLI MPCS', '1233', 'HONNAPPANA HALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '8217' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '8217', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '1738', 'KADACHIKKANAHALLY', '1738', 'KADACHIKKANAHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '8217' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '8217', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '462', 'NAGARABAVI', '462', 'NAGARABAVI', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '8294' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '8294', r.routeName, 'Gauribidanur', NULL, 'BM', '3000', '8294', 'H.NAGASANDRA MPCS', '8294', 'H.NAGASANDRA MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '8294' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '8294', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '4588', 'CHIKKAKURUGODU MPCS', '4588', 'CHIKKAKURUGODU MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '8294' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '8294', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '5911', 'DODDAKURUGODU MPCS', '5911', 'DODDAKURUGODU MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '8294' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '8294', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '8829', 'HALAGANAHALLI MPCS', '8829', 'HALAGANAHALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '8294' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '8294', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '1716', 'KAREKALLA HALLY', '1716', 'KAREKALLA HALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '8294' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '8294', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '4599', 'KUDUMALAKUNTE MPCS', '4599', 'KUDUMALAKUNTE MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '8319' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '8319', r.routeName, 'Gauribidanur', NULL, 'BM', '3000', '8319', 'IDAGURU MPCS', '8319', 'IDAGURU MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '8319' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '8319', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '1693', 'BHEEMANAHALLY', '1693', 'BHEEMANAHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '8319' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '8319', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '8322', 'MARALUR MPCS', '8322', 'MARALUR MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '8319' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '8319', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '8283', 'RAMAPURA MPCS', '8283', 'RAMAPURA MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '8319' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '8319', r.routeName, 'Gauribidanur', NULL, 'CL', NULL, '4009', 'BELEGERE', '4009', 'BELEGERE', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'GAURIBIDANUR' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '373' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '373', r.routeName, 'Siddlaghatta', NULL, 'BM', '3000', '373', 'KALANAYAKANAHALLY MPCS', '373', 'KALANAYAKANAHALLY MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '373' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '373', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '158', 'AMARAVATHI MPCS', '158', 'AMARAVATHI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '373' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '373', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '7940', 'HARADI MPCS', '7940', 'HARADI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '373' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '373', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '646', 'K.HOSUR', '646', 'K.HOSUR', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '373' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '373', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '9119', 'T.BUSANA HALLI MPCS', '9119', 'T.BUSANA HALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '384' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '384', r.routeName, 'Siddlaghatta', NULL, 'BM', '3000', '384', 'CHEEMANGALA MPCS', '384', 'CHEEMANGALA MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '384' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '384', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '2583', 'ARIKERE MPCS', '2583', 'ARIKERE MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '384' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '384', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '7383', 'NARAYANADASARAHALII MPCS', '7383', 'NARAYANADASARAHALII MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '409' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '409', r.routeName, 'Siddlaghatta', NULL, 'BM', '2000', '409', 'ANOORU MPCS', '409', 'ANOORU MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '409' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '409', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '1756', 'LAKKAHALLY', '1756', 'LAKKAHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '411' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '411', r.routeName, 'Siddlaghatta', NULL, 'BM', '2000', '411', 'THIPPENAHALLY MPCS', '411', 'THIPPENAHALLY MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '420' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '420', r.routeName, 'Siddlaghatta', NULL, 'BM', '3000', '420', 'BELUTI MPCS', '420', 'BELUTI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '420' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '420', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '431', 'BODAGUR MPCS', '431', 'BODAGUR MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '420' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '420', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '1246', 'JEPTHI HOSAHALLI MPCS', '1246', 'JEPTHI HOSAHALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '442' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '442', r.routeName, 'Siddlaghatta', NULL, 'BM', '3000', '442', 'HEMARLAHALLY MPCS', '442', 'HEMARLAHALLY MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '442' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '442', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '2368', 'K.G.PURA MPCS', '2368', 'K.G.PURA MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '442' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '442', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '1285', 'THATAPARTHI MPCS', '1285', 'THATAPARTHI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '442' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '442', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '1122', 'VALLAPPANAHALLY', '1122', 'VALLAPPANAHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '442' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '442', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '2357', 'YENNUR MPCS', '2357', 'YENNUR MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '453' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '453', r.routeName, 'Siddlaghatta', NULL, 'BM', '2000', '453', 'HITTALAHALLY MPCS', '453', 'HITTALAHALLY MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '453' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '453', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '2281', 'GANDINAGARA', '2281', 'GANDINAGARA', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '453' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '453', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '2301', 'ULLURPETE', '2301', 'ULLURPETE', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '569' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '569', r.routeName, 'Siddlaghatta', NULL, 'BM', '2000', '569', 'HANDIGANALA', '569', 'HANDIGANALA', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '770' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '770', r.routeName, 'Siddlaghatta', NULL, 'BM', '3000', '770', 'BALUVANAHALLI MPCS', '770', 'BALUVANAHALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '770' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '770', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '7000', 'J.VENKATAPURA MPCS', '7000', 'J.VENKATAPURA MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '770' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '770', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '781', 'MITHANAHALLY MPCS', '781', 'MITHANAHALLY MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '805' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '805', r.routeName, 'Siddlaghatta', NULL, 'BM', '2000', '805', 'MELUR MPCS', '805', 'MELUR MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '805' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '805', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '1761', 'KAMBADAHALLY MPCS', '1761', 'KAMBADAHALLY MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '805' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '805', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '1695', 'KESHAVAPURA', '1695', 'KESHAVAPURA', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '816' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '816', r.routeName, 'Siddlaghatta', NULL, 'BM', '3000', '816', 'BHAKATHARAHALLI MPCS', '816', 'BHAKATHARAHALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '838' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '838', r.routeName, 'Siddlaghatta', NULL, 'BM', '2000', '838', 'MUTHUR MPCS', '838', 'MUTHUR MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '1222' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '1222', r.routeName, 'Siddlaghatta', NULL, 'BM', '3000', '1222', 'HIREBALLA MPCS', '1222', 'HIREBALLA MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '1222' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '1222', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '395', 'ATTHIGANAHALLY MPCS', '395', 'ATTHIGANAHALLY MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '1514' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '1514', r.routeName, 'Siddlaghatta', NULL, 'BM', '2000', '1514', 'BYRASANDRA MPCS', '1514', 'BYRASANDRA MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '1536' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '1536', r.routeName, 'Siddlaghatta', NULL, 'BM', '3000', '1536', 'HOSPETE MPCS', '1536', 'HOSPETE MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '1536' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '1536', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '1733', 'CHOKKANDHALLI MPCS', '1733', 'CHOKKANDHALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '1536' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '1536', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '6318', 'JANGAMAKOTE MPCS', '6318', 'JANGAMAKOTE MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '1547' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '1547', r.routeName, 'Siddlaghatta', NULL, 'BM', '3000', '1547', 'NADAPINAYANAHALLI MPCS', '1547', 'NADAPINAYANAHALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '1547' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '1547', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '98', 'BASAVAPATTANA MPCS', '98', 'BASAVAPATTANA MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '1558' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '1558', r.routeName, 'Siddlaghatta', NULL, 'BM', '3000', '1558', 'NAGAMANGALA MPCS', '1558', 'NAGAMANGALA MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '1558' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '1558', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '9581', 'ANKATATTI MPCS', '9581', 'ANKATATTI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '1558' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '1558', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '827', 'KAKACHOKKONDAHALLY MPCS', '827', 'KAKACHOKKONDAHALLY MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '1577' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '1577', r.routeName, 'Siddlaghatta', NULL, 'BM', '2000', '1577', 'THOUDUR MPCS', '1577', 'THOUDUR MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '1577' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '1577', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '1569', 'THOTLIGANAHALLY MPCS', '1569', 'THOTLIGANAHALLY MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '1580' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '1580', r.routeName, 'Siddlaghatta', NULL, 'BM', '5000', '1580', 'MALAMACHANAHALLY MPCS', '1580', 'MALAMACHANAHALLY MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '1638' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '1638', r.routeName, 'Siddlaghatta', NULL, 'BM', '3000', '1638', 'CHEEMANAHALLI MPCS', '1638', 'CHEEMANAHALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '1638' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '1638', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '3376', 'CHAGAE MPCS', '3376', 'CHAGAE MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '1638' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '1638', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '2307', 'GUDIHALLI MPCS', '2307', 'GUDIHALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '1638' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '1638', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '8841', 'THATHAHALLI MPCS', '8841', 'THATHAHALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '1638' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '1638', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '4410', 'VARADANAYAKANAHALLY MPCS', '4410', 'VARADANAYAKANAHALLY MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '1794' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '1794', r.routeName, 'Siddlaghatta', NULL, 'BM', '2000', '1794', 'MALLUR MPCS', '1794', 'MALLUR MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '1794' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '1794', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '791', 'M.KACHAHALLY MPCS', '791', 'M.KACHAHALLY MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2109' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2109', r.routeName, 'Siddlaghatta', NULL, 'BM', '3000', '2109', 'THUMMANAHALLI MPCS', '2109', 'THUMMANAHALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2109' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2109', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '8036', 'GEJJAGANAHALLI MPCS', '8036', 'GEJJAGANAHALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2109' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2109', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '7984', 'GORAMADAGU MPCS', '7984', 'GORAMADAGU MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2109' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2109', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '1557', 'KUPPENAHALLY', '1557', 'KUPPENAHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2109' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2109', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '5434', 'MALLISHETTIPURA', '5434', 'MALLISHETTIPURA', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2109' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2109', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '3225', 'UJAGOORU MPCS', '3225', 'UJAGOORU MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2164' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2164', r.routeName, 'Siddlaghatta', NULL, 'BM', '3000', '2164', 'A.HUNASENAHALLY MPCS', '2164', 'A.HUNASENAHALLY MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2164' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2164', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '4487', 'HANUMANTHAPURA MPCS', '4487', 'HANUMANTHAPURA MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2164' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2164', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '1689', 'KANAKANAGARA', '1689', 'KANAKANAGARA', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2164' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2164', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '301', 'NALLI MARADA HALLY', '301', 'NALLI MARADA HALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2205' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2205', r.routeName, 'Siddlaghatta', NULL, 'BM', '3000', '2205', 'GOWDANAHALLY', '2205', 'GOWDANAHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2205' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2205', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '21', 'AJJIKADIRENAHALLY', '21', 'AJJIKADIRENAHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2205' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2205', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '470', 'BYAPPANAHALLY', '470', 'BYAPPANAHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2205' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2205', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '1796', 'CHANDAGANAHALLY', '1796', 'CHANDAGANAHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2205' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2205', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '243', 'D.BACHANAHALLI MPCS', '243', 'D.BACHANAHALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2205' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2205', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '336', 'D.SADHAHALLY', '336', 'D.SADHAHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2205' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2205', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '2332', 'DHANAMITNAHALLY', '2332', 'DHANAMITNAHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2205' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2205', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '427', 'GORAMILLAHALLY', '427', 'GORAMILLAHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2216' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2216', r.routeName, 'Siddlaghatta', NULL, 'BM', '3000', '2216', 'VANTUR MPCS', '2216', 'VANTUR MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2216' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2216', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '26', 'A.THIMMANAHALLY', '26', 'A.THIMMANAHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2216' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2216', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '2177', 'AMMAGARAHALLI MPCS', '2177', 'AMMAGARAHALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2216' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2216', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '2180', 'DYAVARAHALLI MPCS', '2180', 'DYAVARAHALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2216' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2216', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '8431', 'KAMBALAHALLI MPCS', '8431', 'KAMBALAHALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2216' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2216', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '2227', 'KUMBARAHALLY MPCS', '2227', 'KUMBARAHALLY MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2216' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2216', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '1051', 'VALASENAHALLI MPCS', '1051', 'VALASENAHALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2216' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2216', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '1981', 'PENDLAVARAPALLI', '1981', 'PENDLAVARAPALLI', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2216' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2216', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '2006', 'MARGANAPARTHI', '2006', 'MARGANAPARTHI', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2216' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2216', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '4047', 'DODDATHEKALAHALLY(C)', '4047', 'DODDATHEKALAHALLY(C)', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2238' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2238', r.routeName, 'Siddlaghatta', NULL, 'BM', '3000', '2238', 'BASHETTIHALLY MPCS', '2238', 'BASHETTIHALLY MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2238' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2238', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '1568', 'BACHAGANAHALLY', '1568', 'BACHAGANAHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2238' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2238', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '3733', 'KUDUPAKUNTE MPCS', '3733', 'KUDUPAKUNTE MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2238' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2238', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '2227', 'KUMBARAHALLY MPCS', '2227', 'KUMBARAHALLY MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2238' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2238', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '1743', 'T.VENKATAPURA', '1743', 'T.VENKATAPURA', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2238' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2238', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '1734', 'TALAKAYALABETTA', '1734', 'TALAKAYALABETTA', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2238' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2238', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '1051', 'VALASENAHALLI MPCS', '1051', 'VALASENAHALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2238' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2238', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '3', 'YARRAHALLI', '3', 'YARRAHALLI', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2238' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2238', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '4057', 'GAJALAVARAHALLY', '4057', 'GAJALAVARAHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2249' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2249', r.routeName, 'Siddlaghatta', NULL, 'BM', '3000', '2249', 'ANEMADAGU MPCS', '2249', 'ANEMADAGU MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2249' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2249', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '2158', 'ALAGURKI MPCS', '2158', 'ALAGURKI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2249' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2249', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '2147', 'BUDAGUVARAPALLI MPCS', '2147', 'BUDAGUVARAPALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2249' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2249', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '2351', 'CHOKKANAHALLY CROSS MPCS', '2351', 'CHOKKANAHALLY CROSS MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2249' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2249', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '343', 'DIMBARLAHALLY', '343', 'DIMBARLAHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2249' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2249', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '733', 'GONIMARADAHALLY', '733', 'GONIMARADAHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2249' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2249', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '1894', 'MARALAPPANAHALLY', '1894', 'MARALAPPANAHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2249' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2249', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '341', 'NALLOJANAHALLY', '341', 'NALLOJANAHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2249' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2249', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '2136', 'RAYAPPANAHALLI MPCS', '2136', 'RAYAPPANAHALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2249' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2249', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '1933', 'THIMMANAYAKANA HALLY', '1933', 'THIMMANAYAKANA HALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2249' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2249', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '2035', 'PILLAGUNDLAHALLI', '2035', 'PILLAGUNDLAHALLI', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2255' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2255', r.routeName, 'Siddlaghatta', NULL, 'BM', '3000', '2255', 'DODDATHEKALAHALLY MPCS', '2255', 'DODDATHEKALAHALLY MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2255' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2255', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '8019', 'CHIKKA THEKANA HALLI', '8019', 'CHIKKA THEKANA HALLI', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2255' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2255', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '2850', 'KOTAHALLI', '2850', 'KOTAHALLI', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2255' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2255', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '1633', 'T.PEDDANAHALLY', '1633', 'T.PEDDANAHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2282' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2282', r.routeName, 'Siddlaghatta', NULL, 'BM', '3000', '2282', 'SHETTIHALLI MPCS', '2282', 'SHETTIHALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2282' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2282', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '2500', 'BYRAGANAHALLI MPCS', '2500', 'BYRAGANAHALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2282' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2282', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '2260', 'DYAVAPPANAGUDI MPCS', '2260', 'DYAVAPPANAGUDI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2282' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2282', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '1047', 'K.SADDAHALLI MPCS', '1047', 'K.SADDAHALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2282' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2282', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '7912', 'KANNAPPANAHALLI MPCS', '7912', 'KANNAPPANAHALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2293' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2293', r.routeName, 'Siddlaghatta', NULL, 'BM', '3000', '2293', 'ABLOODU MPCS', '2293', 'ABLOODU MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2293' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2293', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '746', 'KADADHANAKUNTE', '746', 'KADADHANAKUNTE', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2293' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2293', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '5677', 'KEMPANAHALLI MPCS', '5677', 'KEMPANAHALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2293' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2293', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '2271', 'MALLAHALLI MPCS', '2271', 'MALLAHALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2373' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2373', r.routeName, 'Siddlaghatta', NULL, 'BM', '3000', '2373', 'GANJIGUNTE MPCS', '2373', 'GANJIGUNTE MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2373' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2373', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '1213', 'CHIKKABANDARAGATTA MPCS', '1213', 'CHIKKABANDARAGATTA MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2373' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2373', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '1931', 'DODDA BANDARAGHATTA', '1931', 'DODDA BANDARAGHATTA', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2373' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2373', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '1741', 'HALEGANJIGUNTE', '1741', 'HALEGANJIGUNTE', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2373' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2373', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '1720', 'KONDARAJANAHALLY', '1720', 'KONDARAJANAHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2373' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2373', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '2384', 'KYASAGERE MPCS', '2384', 'KYASAGERE MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2373' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2373', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '9731', 'LAKKENA HALLI MPCS', '9731', 'LAKKENA HALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2373' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2373', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '6856', 'VEMGAL', '6856', 'VEMGAL', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2486' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2486', r.routeName, 'Siddlaghatta', NULL, 'BM', '3000', '2486', 'E.THIMMASANDRA MPCS', '2486', 'E.THIMMASANDRA MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2486' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2486', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '2497', 'GANDLACHINTHE MPCS', '2497', 'GANDLACHINTHE MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2486' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2486', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '1584', 'KARIYAPPANAHALLI', '1584', 'KARIYAPPANAHALLI', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2486' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2486', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '2475', 'MALLASHETTIHALLI MPCS', '2475', 'MALLASHETTIHALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2486' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2486', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '2464', 'SHETTYKERE MPCS', '2464', 'SHETTYKERE MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2486' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2486', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '4689', 'T.BYRAGANAHALLY', '4689', 'T.BYRAGANAHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2486' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2486', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '1949', 'BANDAHALLY', '1949', 'BANDAHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2486' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2486', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '1965', 'EGALETAHALLY', '1965', 'EGALETAHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2486' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2486', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '2304', 'KARIYAPPANALLI(B)', '2304', 'KARIYAPPANALLI(B)', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '2486' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '2486', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '2325', 'SHETTYKERE(A)', '2325', 'SHETTYKERE(A)', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '4045' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '4045', r.routeName, 'Siddlaghatta', NULL, 'BM', '2000', '4045', 'CHOWDASANDRA MPCS', '4045', 'CHOWDASANDRA MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '4443' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '4443', r.routeName, 'Siddlaghatta', NULL, 'BM', '2000', '4443', 'GHATTAMARANA HALLI', '4443', 'GHATTAMARANA HALLI', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '4443' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '4443', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '1523', 'DEVAGANAHALLY', '1523', 'DEVAGANAHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '4443' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '4443', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '1729', 'SUGATUR MPCS', '1729', 'SUGATUR MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '4920' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '4920', r.routeName, 'Siddlaghatta', NULL, 'BM', '3000', '4920', 'DEVARAMALLUR MPCS', '4920', 'DEVARAMALLUR MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '4920' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '4920', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '729', 'BOMMANAHALLI', '729', 'BOMMANAHALLI', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '4920' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '4920', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '7951', 'IDDALOODU MPCS', '7951', 'IDDALOODU MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '4931' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '4931', r.routeName, 'Siddlaghatta', NULL, 'BM', '3000', '4931', 'KOTHANUR MPCS', '4931', 'KOTHANUR MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '4931' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '4931', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '4760', 'K.BACHAHALLI MPCS', '4760', 'K.BACHAHALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '4931' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '4931', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '2175', 'PINDIPAPANAHALLI', '2175', 'PINDIPAPANAHALLI', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5161' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5161', r.routeName, 'Siddlaghatta', NULL, 'BM', '3000', '5161', 'L.MUTHAKADAHALLY MPCS', '5161', 'L.MUTHAKADAHALLY MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5161' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5161', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '4421', 'HARALAHALLY MPCS', '4421', 'HARALAHALLY MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5161' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5161', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '4410', 'VARADANAYAKANAHALLY MPCS', '4410', 'VARADANAYAKANAHALLY MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5161' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5161', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '284', 'YEDDALAPADE', '284', 'YEDDALAPADE', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5209' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5209', r.routeName, 'Siddlaghatta', NULL, 'BM', '3000', '5209', 'KUNDALAGURUKI MPCS', '5209', 'KUNDALAGURUKI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5209' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5209', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '2362', 'J.KACHAHALLY MPCS', '2362', 'J.KACHAHALLY MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5209' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5209', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '9226', 'RAPPARALA PALLI MPCS', '9226', 'RAPPARALA PALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5214' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5214', r.routeName, 'Siddlaghatta', NULL, 'BM', '3000', '5214', 'PALLICHERLU MPCS', '5214', 'PALLICHERLU MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5214' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5214', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '1097', 'CHOWDAREDDYHALLY MPCS', '1097', 'CHOWDAREDDYHALLY MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5214' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5214', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '8595', 'DADAMGHATTA MPCS', '8595', 'DADAMGHATTA MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5214' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5214', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '1898', 'GORLAGUMMANAHALLY', '1898', 'GORLAGUMMANAHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5214' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5214', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '1616', 'MARIHALLY', '1616', 'MARIHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5214' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5214', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '8041', 'MUMMANAHALLI MPCS', '8041', 'MUMMANAHALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5214' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5214', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '30', 'SOMANAHALLY', '30', 'SOMANAHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5225' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5225', r.routeName, 'Siddlaghatta', NULL, 'BM', '3000', '5225', 'LAGINAYAKANAHALLY MPCS', '5225', 'LAGINAYAKANAHALLY MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5225' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5225', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '3489', 'G.KURABARA HALLI MPCS', '3489', 'G.KURABARA HALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5225' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5225', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '1797', 'GANGAHALLY', '1797', 'GANGAHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5225' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5225', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '344', 'MADENAHALLY', '344', 'MADENAHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5225' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5225', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '2395', 'POOLKUNTLAHALLI MPCS', '2395', 'POOLKUNTLAHALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5225' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5225', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '2298', 'VEMGAL(C)', '2298', 'VEMGAL(C)', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5225' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5225', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '4032', 'LAGINAYAKANAHALLY(A)', '4032', 'LAGINAYAKANAHALLY(A)', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5253' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5253', r.routeName, 'Siddlaghatta', NULL, 'BM', '3000', '5253', 'DOGARANAYAKANAHALLY MPCS', '5253', 'DOGARANAYAKANAHALLY MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5253' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5253', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '7995', 'KUTHANDLAHALLI MPCS', '7995', 'KUTHANDLAHALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5253' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5253', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '4021', 'GANGAPURA', '4021', 'GANGAPURA', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5366' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5366', r.routeName, 'Siddlaghatta', NULL, 'BM', '3000', '5366', 'SEEGEHALLY MPCS', '5366', 'SEEGEHALLY MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5366' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5366', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '1446', 'CHANNAHALLY', '1446', 'CHANNAHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5366' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5366', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '8036', 'GEJJAGANAHALLI MPCS', '8036', 'GEJJAGANAHALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5366' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5366', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '4454', 'KADARINAYAKANAHALLI MPCS', '4454', 'KADARINAYAKANAHALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5366' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5366', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '5133', 'Y.HUNASENAHALLI MPCS', '5133', 'Y.HUNASENAHALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5553' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5553', r.routeName, 'Siddlaghatta', NULL, 'BM', '3000', '5553', 'SADALI MPCS', '5553', 'SADALI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5553' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5553', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '1618', 'NALLAPPANAHALLY', '1618', 'NALLAPPANAHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5553' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5553', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '5542', 'S.DEVAGANAHALLI MPCS', '5542', 'S.DEVAGANAHALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5553' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5553', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '507', 'S.KURUBARAHALLY', '507', 'S.KURUBARAHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5553' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5553', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '92', 'UPPAKUNTLA HALLI', '92', 'UPPAKUNTLA HALLI', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5553' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5553', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '66', 'YERRANAGENAHALLY', '66', 'YERRANAGENAHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5564' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5564', r.routeName, 'Siddlaghatta', NULL, 'BM', '3000', '5564', 'IRAGAPPANAHALLI MPCS', '5564', 'IRAGAPPANAHALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5564' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5564', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '3656', 'CHAKAPPANAHALLI', '3656', 'CHAKAPPANAHALLI', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5564' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5564', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '2748', 'GADIMINCHENAHALLI MPCS', '2748', 'GADIMINCHENAHALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5564' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5564', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '1885', 'JARUGAHALLY', '1885', 'JARUGAHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5564' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5564', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '119', 'KONDAPPAGARAHALLI MPCS', '119', 'KONDAPPAGARAHALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5564' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5564', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '616', 'NERALEMARADAHALLY', '616', 'NERALEMARADAHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5564' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5564', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '4018', 'POSAGANADODDI MPCS', '4018', 'POSAGANADODDI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5564' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5564', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '615', 'S.GOLLAHALLY', '615', 'S.GOLLAHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5564' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5564', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '1912', 'S.VENKATAPURA', '1912', 'S.VENKATAPURA', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5564' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5564', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '8744', 'SONAGANAHALLI MPCS', '8744', 'SONAGANAHALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5832' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5832', r.routeName, 'Siddlaghatta', NULL, 'BM', '3000', '5832', 'K.MUTHUKADAHALLI MPCS', '5832', 'K.MUTHUKADAHALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5832' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5832', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '8422', 'CHINTHADAPI MPCS', '8422', 'CHINTHADAPI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5832' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5832', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '511', 'GUNDLANARASIMHANAHALLI', '511', 'GUNDLANARASIMHANAHALLI', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5832' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5832', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '1183', 'GUTTUR', '1183', 'GUTTUR', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '5832' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '5832', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '2390', 'KANNAMANGALA MPCS', '2390', 'KANNAMANGALA MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '6528' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '6528', r.routeName, 'Siddlaghatta', NULL, 'BM', '2000', '6528', 'APPEGOWDANAHALLI MPCS', '6528', 'APPEGOWDANAHALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '6528' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '6528', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '4067', 'GANGANAHALLI MPCS', '4067', 'GANGANAHALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '6539' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '6539', r.routeName, 'Siddlaghatta', NULL, 'BM', '2000', '6539', 'SEETHAHALLI MPCS', '6539', 'SEETHAHALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '6539' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '6539', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '1042', 'CHIKKA DIBBURAHALLI MPCS', '1042', 'CHIKKA DIBBURAHALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '6539' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '6539', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '2333', 'DIBBURAHALLY MPCS', '2333', 'DIBBURAHALLY MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '6539' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '6539', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '2497', 'GANDLACHINTHE MPCS', '2497', 'GANDLACHINTHE MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '6539' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '6539', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '1930', 'HIRIYALACHENAHALLY', '1930', 'HIRIYALACHENAHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '6539' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '6539', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '1949', 'BANDAHALLY', '1949', 'BANDAHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '7339' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '7339', r.routeName, 'Siddlaghatta', NULL, 'BM', '3000', '7339', 'DODDADASENAHALLI MPCS', '7339', 'DODDADASENAHALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '7339' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '7339', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '1078', 'BIRAPPANAHALLI MPCS', '1078', 'BIRAPPANAHALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '7339' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '7339', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '1765', 'BRAHMANARAHALLY', '1765', 'BRAHMANARAHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '7339' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '7339', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '9538', 'CHIKKADASENAHALLI MPCS', '9538', 'CHIKKADASENAHALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '7339' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '7339', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '586', 'DEVAGUTTAHALLY', '586', 'DEVAGUTTAHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '7339' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '7339', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '132', 'MARAPPANAHALLY', '132', 'MARAPPANAHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '7339' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '7339', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '2234', 'KADARINAYAKANAHALLI(A)', '2234', 'KADARINAYAKANAHALLI(A)', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '8171' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '8171', r.routeName, 'Siddlaghatta', NULL, 'BM', '3000', '8171', 'YENNANGUR MPCS', '8171', 'YENNANGUR MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '8171' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '8171', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '3234', 'N.HOSAHALLI MPCS', '3234', 'N.HOSAHALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '8400' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '8400', r.routeName, 'Siddlaghatta', NULL, 'BM', '3000', '8400', 'GAMBHIRANAHALLI MPCS', '8400', 'GAMBHIRANAHALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '8400' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '8400', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '5063', 'AMBIGANA HALLY', '5063', 'AMBIGANA HALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '8400' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '8400', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '362', 'DEVENAHALLY MPCS', '362', 'DEVENAHALLY MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '8400' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '8400', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '1605', 'J.KURUBARA HALLI MPCS', '1605', 'J.KURUBARA HALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '8400' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '8400', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '1041', 'KALLYA PURA MPCS', '1041', 'KALLYA PURA MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '8400' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '8400', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '1315', 'MALLENA HALLY', '1315', 'MALLENA HALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '8400' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '8400', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '3276', 'SUNDRAHALLI', '3276', 'SUNDRAHALLI', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '8830' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '8830', r.routeName, 'Siddlaghatta', NULL, 'BM', '3000', '8830', 'DODDADASARAHALLI MPCS', '8830', 'DODDADASARAHALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '8830' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '8830', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '335', 'BYRANAYAKANAHALLY', '335', 'BYRANAYAKANAHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '8830' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '8830', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '7408', 'CHIKKADASARAHALLI MPCS', '7408', 'CHIKKADASARAHALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '8830' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '8830', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '1777', 'DABARAGANAHALLY', '1777', 'DABARAGANAHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '8830' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '8830', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '7587', 'MUNGADAPI MPCS', '7587', 'MUNGADAPI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '8830' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '8830', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '1161', 'SORAKAYIPALLI MPCS', '1161', 'SORAKAYIPALLI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '9549' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '9549', r.routeName, 'Siddlaghatta', NULL, 'BM', '3000', '9549', 'VARADAHUNASENAHALLY MPCS', '9549', 'VARADAHUNASENAHALLY MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '9549' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '9549', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '387', 'BASAVANAPARTHI', '387', 'BASAVANAPARTHI', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '9549' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '9549', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '8353', 'CHIKKA PAPANAHALLI', '8353', 'CHIKKA PAPANAHALLI', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '9549' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '9549', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '216', 'DONAHALLY MPCS', '216', 'DONAHALLY MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '9549' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '9549', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '1897', 'GOLLA HALLY', '1897', 'GOLLA HALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '9549' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '9549', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '111', 'RACHANAHALLY', '111', 'RACHANAHALLY', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '9549' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '9549', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '8229', 'SIDDAPURA MPCS', '8229', 'SIDDAPURA MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '9560' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '9560', r.routeName, 'Siddlaghatta', NULL, 'BM', '3000', '9560', 'THALADUMMANAHALLY MPCS', '9560', 'THALADUMMANAHALLY MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '9560' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '9560', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '7951', 'IDDALOODU MPCS', '7951', 'IDDALOODU MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '9560' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '9560', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '9555', 'SONNENAHALI MPCS', '9555', 'SONNENAHALI MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;

INSERT IGNORE INTO Clusters (bmcId, bmcCode, routeName, taluk, rtCd, bmcType, capacity, clusterCode, clusterName, memberCode, memberName, createdAt, updatedAt)
SELECT (SELECT id FROM BMCs WHERE bmcCode = '9560' AND (isDeleted IS NULL OR isDeleted = 0) LIMIT 1), '9560', r.routeName, 'Siddlaghatta', NULL, 'CL', NULL, '4942', 'VEERAPURA MPCS', '4942', 'VEERAPURA MPCS', NOW(), NOW()
FROM Routes r WHERE UPPER(r.taluk) = 'SIDDLAGHATTA' AND (r.isDeleted IS NULL OR r.isDeleted = 0) LIMIT 1;


CREATE TABLE `tbl_banks` (
  `bank_id` int(11) NOT NULL AUTO_INCREMENT,
  `bank_name` varchar(50) DEFAULT NULL,
  `bank_branch` varchar(150) DEFAULT NULL,
  `bank_account_name` varchar(50) DEFAULT NULL,
  `bank_account_number` varchar(50) DEFAULT NULL,
  `date_added` datetime DEFAULT CURRENT_TIMESTAMP,
  `date_last_modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`bank_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
INSERT INTO `tbl_banks` VALUES ('1', 'LANDBANK', 'WAO', 'CHRISTINE JANE QUIAMCO', '2182-1089-63', '2022-11-16 07:36:15', '2022-11-16 07:36:15');
INSERT INTO `tbl_banks` VALUES ('2', 'RCBC', 'VELEZ', 'QL POULTRY AND AGRICULTURAL SUPPLY', '7-591-02797-6', '2022-11-16 07:37:09', '2022-11-16 07:37:09');
INSERT INTO `tbl_banks` VALUES ('3', 'BPI', 'CDO-MAIN', 'CHRISTINE JANE QUIAMCO', '2040-0154-02', '2022-11-16 07:37:49', '2022-11-16 07:37:49');
INSERT INTO `tbl_banks` VALUES ('4', 'METROBANK', 'VELEZ', 'CHRISTINE JANE QUIAMCO', '007-037-52355-7', '2022-11-19 14:10:02', '2022-11-19 14:10:02');
INSERT INTO `tbl_banks` VALUES ('5', 'ChinaBank', 'CDO-Gaisano', 'Christine Jane Quiamco', '1379-00-01424-8', '2023-01-04 06:41:13', '2023-01-04 06:41:13');
INSERT INTO `tbl_banks` VALUES ('6', 'EastWest', 'Davao', 'John John Francisco', '200051005828', '2023-02-07 11:04:58', '2023-02-07 11:04:58');

CREATE TABLE `tbl_beginning_balance` (
  `bb_id` int(11) NOT NULL AUTO_INCREMENT,
  `bb_module` varchar(3) NOT NULL COMMENT 'AP ; AR : INV',
  `reference_number` varchar(30) NOT NULL,
  `bb_ref_id` int(11) NOT NULL,
  `bb_qty` decimal(12,2) NOT NULL DEFAULT '1.00',
  `bb_amount` decimal(12,2) NOT NULL,
  `bb_date` date NOT NULL,
  `bb_remarks` varchar(255) NOT NULL,
  `bb_paid_status` int(1) NOT NULL DEFAULT '0' COMMENT '1 = Paid : 0 = Unpaid',
  `encoded_by` int(11) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_last_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`bb_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `tbl_claim_slips` (
  `claim_slip_id` int(11) NOT NULL AUTO_INCREMENT,
  `reference_number` varchar(50) NOT NULL,
  `sales_id` int(11) NOT NULL,
  `total_amount` decimal(12,2) NOT NULL,
  `status` varchar(1) NOT NULL,
  `withdrawal_id` int(11) NOT NULL DEFAULT '0',
  `checked_by` int(11) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_last_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`claim_slip_id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4;
INSERT INTO `tbl_claim_slips` VALUES ('1', '000001', '4', '6460.00', 'F', '1', '7', '2024-02-03 07:18:22', '2024-02-05 14:20:51');
INSERT INTO `tbl_claim_slips` VALUES ('2', '000002', '4', '6460.00', 'F', '2', '7', '2024-02-03 07:18:36', '2024-02-03 14:28:01');
INSERT INTO `tbl_claim_slips` VALUES ('3', '000003', '30', '11160.00', 'F', '3', '7', '2024-02-03 12:18:02', '2024-02-05 14:21:07');
INSERT INTO `tbl_claim_slips` VALUES ('4', '000004', '30', '11160.00', 'F', '4', '7', '2024-02-03 12:18:32', '2024-02-03 14:27:49');
INSERT INTO `tbl_claim_slips` VALUES ('5', '000005', '32', '10250.00', 'F', '5', '7', '2024-02-03 13:08:20', '2024-02-05 14:19:44');
INSERT INTO `tbl_claim_slips` VALUES ('6', '000006', '32', '10250.00', 'F', '6', '7', '2024-02-03 13:08:34', '2024-02-05 14:21:58');
INSERT INTO `tbl_claim_slips` VALUES ('7', '000007', '34', '12880.00', 'F', '7', '7', '2024-02-03 14:24:25', '2024-02-05 14:20:19');
INSERT INTO `tbl_claim_slips` VALUES ('8', '000008', '34', '12880.00', 'F', '8', '7', '2024-02-03 14:25:36', '2024-02-03 14:27:31');
INSERT INTO `tbl_claim_slips` VALUES ('9', '000009', '35', '10800.00', 'F', '12', '7', '2024-02-03 14:37:53', '2024-02-05 14:20:04');
INSERT INTO `tbl_claim_slips` VALUES ('10', '000010', '39', '2700.00', 'F', '13', '7', '2024-02-03 14:58:24', '2024-02-05 16:54:27');
INSERT INTO `tbl_claim_slips` VALUES ('11', '000011', '64', '9950.00', 'F', '14', '7', '2024-02-04 09:12:18', '2024-02-05 14:16:58');
INSERT INTO `tbl_claim_slips` VALUES ('13', '000013', '69', '12100.00', 'F', '15', '0', '2024-02-04 10:54:44', '2024-02-04 10:55:12');
INSERT INTO `tbl_claim_slips` VALUES ('14', '000014', '71', '4600.00', 'F', '16', '7', '2024-02-04 11:51:24', '2024-02-05 14:16:21');
INSERT INTO `tbl_claim_slips` VALUES ('15', '000015', '84', '27000.00', 'F', '17', '7', '2024-02-04 18:10:12', '2024-02-05 14:15:21');
INSERT INTO `tbl_claim_slips` VALUES ('16', '000016', '92', '21600.00', 'F', '18', '7', '2024-02-04 18:14:28', '2024-02-05 14:09:44');
INSERT INTO `tbl_claim_slips` VALUES ('17', '000017', '105', '2020.00', 'F', '19', '7', '2024-02-05 08:32:13', '2024-02-05 14:24:08');
INSERT INTO `tbl_claim_slips` VALUES ('18', '000018', '85', '54000.00', 'F', '20', '7', '2024-02-05 09:17:57', '2024-02-05 14:09:14');
INSERT INTO `tbl_claim_slips` VALUES ('19', '000019', '106', '9400.00', 'F', '21', '7', '2024-02-05 10:42:04', '2024-02-05 14:08:34');
INSERT INTO `tbl_claim_slips` VALUES ('20', '000020', '84', '27000.00', 'F', '25', '7', '2024-02-05 14:15:21', '2024-02-05 14:22:14');
INSERT INTO `tbl_claim_slips` VALUES ('21', '000021', '64', '9950.00', 'F', '27', '7', '2024-02-05 14:16:58', '2024-02-05 14:22:07');
INSERT INTO `tbl_claim_slips` VALUES ('22', '000022', '113', '2350.00', 'F', '37', '7', '2024-02-05 14:39:33', '2024-02-05 14:40:39');
INSERT INTO `tbl_claim_slips` VALUES ('23', '000023', '114', '2900.00', 'F', '39', '7', '2024-02-05 14:47:27', '2024-02-05 14:53:33');
INSERT INTO `tbl_claim_slips` VALUES ('24', '000024', '117', '5500.00', 'F', '41', '7', '2024-02-05 15:53:25', '2024-02-05 15:54:54');
INSERT INTO `tbl_claim_slips` VALUES ('25', '000025', '124', '52000.00', 'F', '44', '7', '2024-02-05 17:22:34', '2024-02-05 17:25:34');
INSERT INTO `tbl_claim_slips` VALUES ('26', '000026', '121', '8790.00', 'F', '46', '0', '2024-02-06 11:38:07', '2024-02-06 11:38:28');
INSERT INTO `tbl_claim_slips` VALUES ('27', '000027', '121', '8790.00', 'F', '47', '0', '2024-02-06 11:38:28', '2024-02-06 11:38:35');
INSERT INTO `tbl_claim_slips` VALUES ('28', '000028', '134', '12740.00', 'F', '48', '0', '2024-02-06 11:43:46', '2024-02-06 11:43:51');
INSERT INTO `tbl_claim_slips` VALUES ('29', '000029', '136', '16200.00', 'F', '49', '0', '2024-02-06 12:09:25', '2024-02-06 12:09:29');
INSERT INTO `tbl_claim_slips` VALUES ('30', '000030', '135', '6320.00', 'F', '50', '0', '2024-02-06 12:12:53', '2024-02-06 12:12:57');
INSERT INTO `tbl_claim_slips` VALUES ('31', '000031', '141', '8350.00', 'F', '51', '0', '2024-02-06 13:47:34', '2024-02-06 13:49:22');
INSERT INTO `tbl_claim_slips` VALUES ('32', '000032', '141', '8350.00', 'F', '52', '7', '2024-02-06 13:49:22', '2024-02-06 13:52:01');

CREATE TABLE `tbl_credit_memo` (
  `cm_id` int(11) NOT NULL AUTO_INCREMENT,
  `reference_number` varchar(75) NOT NULL,
  `memo_date` date NOT NULL,
  `memo_type` varchar(3) NOT NULL,
  `account_id` int(11) NOT NULL,
  `remarks` varchar(250) NOT NULL,
  `status` varchar(1) NOT NULL DEFAULT 'S' COMMENT 'S = Saved; F = Finish',
  `encoded_by` int(11) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_last_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`cm_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `tbl_credit_memo_details` (
  `cmd_id` int(11) NOT NULL AUTO_INCREMENT,
  `cm_id` int(11) NOT NULL,
  `reference_id` int(11) NOT NULL,
  `ref_type` varchar(3) NOT NULL,
  `amount` decimal(12,3) NOT NULL,
  `description` varchar(250) NOT NULL,
  PRIMARY KEY (`cmd_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `tbl_customer_payment` (
  `cp_id` int(11) NOT NULL AUTO_INCREMENT,
  `reference_number` varchar(50) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `payment_type` varchar(1) NOT NULL,
  `payment_option_id` int(11) NOT NULL,
  `payment_date` date NOT NULL,
  `remarks` varchar(255) NOT NULL,
  `status` varchar(1) NOT NULL,
  `deposit_status` int(1) NOT NULL DEFAULT '0' COMMENT '1 = Deposited',
  `check_number` varchar(30) NOT NULL,
  `check_bank` varchar(30) NOT NULL,
  `check_date` date NOT NULL,
  `encoded_by` int(11) NOT NULL,
  `sales_summary_id` int(11) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_last_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`cp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `tbl_customer_payment_details` (
  `cpd_id` int(11) NOT NULL AUTO_INCREMENT,
  `cp_id` int(11) NOT NULL,
  `ref_id` int(11) NOT NULL,
  `amount` decimal(12,2) NOT NULL,
  `type` varchar(2) NOT NULL COMMENT 'DR = sales ; BB = beginning balance',
  PRIMARY KEY (`cpd_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `tbl_customers` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_name` varchar(100) NOT NULL,
  `customer_address` varchar(255) NOT NULL,
  `customer_tin` varchar(30) NOT NULL,
  `customer_terms` int(6) NOT NULL DEFAULT '0',
  `customer_contact_number` varchar(15) NOT NULL,
  `remarks` varchar(255) NOT NULL,
  `suki_card_number` varchar(15) DEFAULT NULL,
  `date_added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_last_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1662 DEFAULT CHARSET=latin1;
INSERT INTO `tbl_customers` VALUES ('0', 'Walk-in', '', '', '0', '', '', '', '2022-11-16 19:02:44', '2022-11-16 19:02:44');
INSERT INTO `tbl_customers` VALUES ('1', 'Parcon Trading', 'Banisilan, Cotabato', ' ', '0', '09753029173', '', '0', '2022-11-15 09:35:28', '2023-07-14 19:15:19');
INSERT INTO `tbl_customers` VALUES ('2', 'Lumawag, Arlie', 'Banisilan Cotabato', '.', '0', '1', '', '202301580001', '2022-11-15 14:26:31', '2023-07-16 11:54:26');
INSERT INTO `tbl_customers` VALUES ('3', 'Badong Pasaporte', 'Banisilan, Cotabato', '', '0', '.', '', '', '2022-11-15 14:49:55', '2022-11-16 10:34:40');
INSERT INTO `tbl_customers` VALUES ('4', 'Hambala, Alberto', 'Pinamulaan', '', '0', '.', '', '', '2022-11-16 07:38:34', '2022-11-17 17:13:55');
INSERT INTO `tbl_customers` VALUES ('5', 'Thor Solis', 'Pinamulaan', '.', '0', '.', '', '202300830001', '2022-11-16 07:38:51', '2023-07-27 11:00:11');
INSERT INTO `tbl_customers` VALUES ('6', 'Juban', 'Banisilan', '', '0', '.', '', '', '2022-11-16 07:39:38', '2022-11-16 07:39:38');
INSERT INTO `tbl_customers` VALUES ('8', 'Pamplona', 'Banisilan', '', '0', '.', '', '', '2022-11-16 07:40:10', '2022-11-16 07:40:10');
INSERT INTO `tbl_customers` VALUES ('9', 'Habitacion', 'Banisilan', '', '0', '.', '', '', '2022-11-16 07:40:23', '2022-11-16 07:40:23');
INSERT INTO `tbl_customers` VALUES ('10', 'Capt. Soberano, Ronald', 'Banisilan', '.', '0', '09361799734', '', '202301150001', '2022-11-16 07:41:52', '2023-07-16 11:51:08');
INSERT INTO `tbl_customers` VALUES ('11', 'Bangud', 'Banisilan', '', '0', '.', 'encoded through cashier', '', '2022-11-16 09:03:13', '2022-11-16 09:03:13');
INSERT INTO `tbl_customers` VALUES ('12', 'Cabilla, Jay R', 'Bao', '', '0', '09094536130', '', '', '2022-11-16 10:29:39', '2022-11-16 10:35:06');
INSERT INTO `tbl_customers` VALUES ('13', 'Dela Tore, Cirilo', 'Tabunan', '', '0', '.', '', '', '2022-11-16 10:35:22', '2022-11-16 10:35:22');
INSERT INTO `tbl_customers` VALUES ('15', 'Palmes', 'Banisilan', '', '0', '.', 'encoded through cashier', '', '2022-11-17 06:50:05', '2022-11-17 06:50:05');
INSERT INTO `tbl_customers` VALUES ('16', 'Bermejo, N', 'Banislan', '', '0', '.', 'encoded through cashier', '', '2022-11-17 07:09:25', '2022-11-17 07:09:25');
INSERT INTO `tbl_customers` VALUES ('17', 'Cabila, Pabling', 'Banisilan', '', '0', '1', 'encoded through cashier', '', '2022-11-17 11:24:36', '2022-11-17 17:10:47');
INSERT INTO `tbl_customers` VALUES ('18', 'Brillo, Jocelyn', 'Banisilan', '', '0', '09851473473', 'encoded through cashier', '', '2022-11-17 15:20:08', '2022-11-17 15:20:08');
INSERT INTO `tbl_customers` VALUES ('19', 'Bayantol, Saidamen', 'Valencia', '', '0', '09368295390', 'encoded through cashier', '', '2022-11-17 15:43:57', '2022-11-17 15:43:57');
INSERT INTO `tbl_customers` VALUES ('20', 'Lumawag, Reymundo', 'Banisilan', '', '0', '.', 'encoded through cashier', '', '2022-11-17 15:45:58', '2022-11-17 15:45:58');
INSERT INTO `tbl_customers` VALUES ('21', 'Pacunla, Neneng', 'Banisilan', '', '0', '.', 'encoded through cashier', '', '2022-11-17 16:11:09', '2022-11-17 16:11:09');
INSERT INTO `tbl_customers` VALUES ('22', 'Macasarte, Arnulfo', 'Banisilan', '.', '0', '09974308757', 'encoded through cashier', '202301640001', '2022-11-17 16:25:17', '2023-07-19 08:51:12');
INSERT INTO `tbl_customers` VALUES ('23', 'Japhet Bioseed', 'c/o Bioseed', '', '0', '.', '.', '', '2022-11-17 17:08:13', '2022-11-17 17:08:13');
INSERT INTO `tbl_customers` VALUES ('24', 'Baldevieso', 'Banisilan', '', '0', '.', '.
', '', '2022-11-17 17:09:38', '2022-11-17 17:09:38');
INSERT INTO `tbl_customers` VALUES ('25', 'Cabilla, Margelyn', 'Banisilan', '', '0', '0', '0', '', '2022-11-17 17:11:06', '2022-11-17 17:11:06');
INSERT INTO `tbl_customers` VALUES ('26', 'Balleras, Edwin', 'Banisilan', '', '0', '0', '0', '', '2022-11-17 17:12:10', '2022-11-17 17:12:10');
INSERT INTO `tbl_customers` VALUES ('27', 'Chavez, Vicente', 'Banisilan ', '', '0', '0', '0

', '', '2022-11-17 17:16:06', '2022-11-17 17:16:06');
INSERT INTO `tbl_customers` VALUES ('28', 'Aligasin, Gege', 'Banisilan', '', '0', '.', '.', '', '2022-11-17 17:18:03', '2022-11-17 17:18:03');
INSERT INTO `tbl_customers` VALUES ('29', 'Diamond, Animbang', '.', '', '0', '09075565844', 'Balance as of 11/12/22', '', '2022-11-17 17:21:00', '2022-11-17 17:21:00');
INSERT INTO `tbl_customers` VALUES ('30', 'Bamo, Bebe', 'Banisilan', '', '0', '0', '0', '', '2022-11-17 17:22:11', '2022-11-17 17:22:11');
INSERT INTO `tbl_customers` VALUES ('31', 'Joebert Eulatriz', 'Banisilan', '.', '0', '.', '.', '202300810001', '2022-11-17 17:24:40', '2023-07-16 09:19:14');
INSERT INTO `tbl_customers` VALUES ('32', 'Felix Penuliar', '.', '', '0', '.', '.', '', '2022-11-17 17:24:57', '2022-11-17 17:24:57');
INSERT INTO `tbl_customers` VALUES ('33', 'Pabian, Rhea', 'Banisilan', '', '0', '.', 'encoded through cashier', '', '2022-11-18 13:14:28', '2022-11-18 13:14:28');
INSERT INTO `tbl_customers` VALUES ('34', 'Jonas, Romnick', '.', '.', '0', '.', '.', '202301140001', '2022-11-18 13:59:17', '2023-07-16 11:10:20');
INSERT INTO `tbl_customers` VALUES ('35', 'Traya', '1', '', '0', '1', 'encoded through cashier', '', '2022-11-18 14:56:58', '2022-11-18 14:56:58');
INSERT INTO `tbl_customers` VALUES ('36', 'Vellano, Nely', 'Banisilan', '', '0', '.', 'encoded through cashier', '', '2022-11-18 16:38:12', '2022-11-18 16:38:12');
INSERT INTO `tbl_customers` VALUES ('37', 'Penaso, Angelica', 'Malatigi', '', '0', '.', 'encoded through cashier', '', '2022-11-19 08:16:56', '2022-11-19 08:16:56');
INSERT INTO `tbl_customers` VALUES ('38', 'Orin', 'c/o sara', '', '0', '1', 'encoded through cashier', '', '2022-11-19 14:22:09', '2022-11-19 14:22:09');
INSERT INTO `tbl_customers` VALUES ('39', 'Ceralbo', 'Banisilan', '', '0', '1', 'encoded through cashier', '', '2022-11-20 08:07:53', '2022-11-20 08:07:53');
INSERT INTO `tbl_customers` VALUES ('40', 'Pabilona, Teddy', 'Banisilan', '', '0', '1', 'encoded through cashier', '', '2022-11-20 08:19:55', '2022-11-20 08:19:55');
INSERT INTO `tbl_customers` VALUES ('41', 'Ali', 'banisilan', '', '0', '1', 'encoded through cashier', '', '2022-11-20 11:21:35', '2022-11-20 11:21:35');
INSERT INTO `tbl_customers` VALUES ('42', 'Mayor Alisasis', 'Banisilan Cotabato', '', '0', '.', '.', '', '2022-11-21 15:31:24', '2022-11-21 15:31:24');
INSERT INTO `tbl_customers` VALUES ('43', 'Vice Caranay', 'Banisilan', '', '0', '.', '.', '', '2022-11-21 15:33:28', '2022-11-21 15:33:28');
INSERT INTO `tbl_customers` VALUES ('44', 'Dekalb- Jeriel', '.', '', '0', '.', '.', '', '2022-11-22 14:32:17', '2022-11-22 14:32:17');
INSERT INTO `tbl_customers` VALUES ('45', 'Aljay', '.', '', '0', '.', '.', '', '2022-11-22 14:32:37', '2022-11-22 14:32:37');
INSERT INTO `tbl_customers` VALUES ('46', 'Basultan, Rosalia', 'Banisilan', '', '0', '.', 'encoded through cashier', '', '2022-11-22 16:45:08', '2022-11-22 16:45:08');
INSERT INTO `tbl_customers` VALUES ('47', 'Portoza', 'Banisilan', '', '0', '1', 'encoded through cashier', '', '2022-11-23 08:59:24', '2022-11-23 08:59:24');
INSERT INTO `tbl_customers` VALUES ('48', 'Serue, Leizel', 'Banisilan', '', '0', '.', 'encoded through cashier', '', '2022-11-23 16:24:01', '2022-11-23 16:24:01');
INSERT INTO `tbl_customers` VALUES ('49', 'Penaso , Edie', '.', '', '0', '.', 'encoded through cashier', '', '2022-11-25 07:55:11', '2022-11-25 07:55:57');
INSERT INTO `tbl_customers` VALUES ('50', 'Aviles, Homerchan', 'Brgy Rancho', '', '0', '.', 'encoded through cashier', '', '2022-11-26 11:20:57', '2022-11-26 11:20:57');
INSERT INTO `tbl_customers` VALUES ('51', 'Adapan, Samera', '.', '', '0', '.', 'encoded through cashier', '', '2022-11-26 12:30:30', '2022-11-26 12:30:30');
INSERT INTO `tbl_customers` VALUES ('52', 'Oling, Norhata', 'Guiling', '', '0', '09107585733', 'encoded through cashier', '', '2022-11-27 10:55:30', '2022-11-27 10:55:30');
INSERT INTO `tbl_customers` VALUES ('53', 'Pamunag, Lorito', '.', '', '0', '.', 'encoded through cashier', '', '2022-11-28 06:37:17', '2023-02-15 10:12:59');
INSERT INTO `tbl_customers` VALUES ('54', 'Barrion, Gina', '.', '', '0', '.', 'encoded through cashier', '', '2022-11-29 09:44:21', '2022-11-29 09:44:21');
INSERT INTO `tbl_customers` VALUES ('55', 'Makalalim, Mandig', 'Guiling', '', '0', '1', 'encoded through cashier', '', '2022-12-01 06:26:11', '2022-12-01 06:26:11');
INSERT INTO `tbl_customers` VALUES ('56', 'Arido, Nik2x', '.', '', '0', '.', 'encoded through cashier', '', '2022-12-02 17:11:15', '2022-12-02 17:11:15');
INSERT INTO `tbl_customers` VALUES ('57', 'Palmes, Shen2x', '1', '', '0', '1', 'encoded through cashier', '', '2022-12-02 17:14:37', '2022-12-02 17:14:37');
INSERT INTO `tbl_customers` VALUES ('58', 'Dusaran, Almark', '.', '', '0', '.', 'encoded through cashier', '', '2022-12-04 10:30:05', '2022-12-04 10:30:05');
INSERT INTO `tbl_customers` VALUES ('59', 'Hermoso, B', '.', '', '0', '.', 'encoded through cashier', '', '2022-12-05 12:19:55', '2022-12-05 12:19:55');
INSERT INTO `tbl_customers` VALUES ('60', 'Muslima', '.', '', '0', '.', 'encoded through cashier', '', '2022-12-06 06:06:53', '2022-12-06 06:06:53');
INSERT INTO `tbl_customers` VALUES ('61', 'Molina, Ren2x', '.', '', '0', '.', 'encoded through cashier', '', '2022-12-06 17:36:52', '2022-12-06 17:36:52');
INSERT INTO `tbl_customers` VALUES ('62', 'Binayao, Jovy', '.', '', '0', '.', 'encoded through cashier', '', '2022-12-08 08:02:30', '2022-12-08 08:02:30');
INSERT INTO `tbl_customers` VALUES ('63', 'Adapan, Muslima', '.', '', '0', '09754429080', 'encoded through cashier', '', '2022-12-10 16:57:01', '2022-12-10 16:57:01');
INSERT INTO `tbl_customers` VALUES ('64', 'Benidicto, Domeng', '.', '', '0', '.', 'encoded through cashier', '', '2022-12-11 06:45:32', '2022-12-11 06:45:32');
INSERT INTO `tbl_customers` VALUES ('65', 'Samillano', '.', '.', '0', '.', 'encoded through cashier', '202301010001', '2022-12-12 11:37:01', '2023-07-22 16:16:07');
INSERT INTO `tbl_customers` VALUES ('66', 'Barrion, Edith', 'Banisilan', '', '0', '.', '.
', '', '2022-12-16 17:05:36', '2022-12-16 17:05:36');
INSERT INTO `tbl_customers` VALUES ('67', 'Suyom, Edilyn', '.', '', '0', '09066728825', '.
', '', '2022-12-16 17:07:47', '2022-12-16 17:07:47');
INSERT INTO `tbl_customers` VALUES ('68', 'Oandasan, Edna', '.', '', '0', '.', 'encoded through cashier', '', '2022-12-17 09:53:47', '2022-12-17 09:53:47');
INSERT INTO `tbl_customers` VALUES ('69', 'Ligaya', '.', '', '0', '.', 'encoded through cashier', '', '2022-12-18 12:31:16', '2022-12-18 12:31:16');
INSERT INTO `tbl_customers` VALUES ('70', 'Barcenas, Diony', '.', '', '0', '.', 'encoded through cashier', '', '2022-12-19 10:18:03', '2022-12-19 10:18:03');
INSERT INTO `tbl_customers` VALUES ('71', 'Managit', 'Banisilan', '', '0', '.', 'encoded through cashier', '', '2022-12-20 13:03:45', '2022-12-20 13:03:45');
INSERT INTO `tbl_customers` VALUES ('72', 'Barrion, Evelyn', '.', '', '0', '.', 'encoded through cashier', '', '2022-12-21 07:10:12', '2022-12-21 07:10:12');
INSERT INTO `tbl_customers` VALUES ('73', 'Calonge, Jonar', 'Banisilan', '', '0', '1', 'encoded through cashier', '', '2022-12-23 06:58:15', '2022-12-23 06:58:15');
INSERT INTO `tbl_customers` VALUES ('74', 'Tambog, Jamail', '.', '', '0', '.', 'encoded through cashier', '', '2022-12-25 11:17:13', '2022-12-25 11:17:13');
INSERT INTO `tbl_customers` VALUES ('75', 'Calambro, Rebecca', '09559520118', '', '0', '.', 'encoded through cashier', '', '2023-01-03 15:13:37', '2023-01-03 15:13:37');
INSERT INTO `tbl_customers` VALUES ('76', 'Lago, Che Che', 'Banisilan', '', '0', '.', '.', '', '2023-01-04 07:25:17', '2023-01-04 07:25:17');
INSERT INTO `tbl_customers` VALUES ('77', 'Castillo', '.', '', '0', '.', 'encoded through cashier', '', '2023-01-07 16:47:51', '2023-01-07 16:47:51');
INSERT INTO `tbl_customers` VALUES ('78', 'Catikista, M', '.', '', '0', '.', 'encoded through cashier', '', '2023-01-08 09:56:33', '2023-01-08 09:56:33');
INSERT INTO `tbl_customers` VALUES ('79', 'Valdez, Julius', 'Banisilan, Cotabato', '', '0', '.', 'encoded through cashier', '', '2023-01-08 10:00:41', '2023-01-08 10:00:41');
INSERT INTO `tbl_customers` VALUES ('80', 'Celeste, Jonard', 'Banislan', '', '0', '.', 'encoded through cashier', '', '2023-01-10 09:02:41', '2023-01-10 09:02:41');
INSERT INTO `tbl_customers` VALUES ('81', 'Babunas', 'Malinao', '', '0', '.', 'encoded through cashier', '', '2023-01-10 13:42:34', '2023-01-10 13:42:34');
INSERT INTO `tbl_customers` VALUES ('82', 'Abdul', 'Sabang', '', '0', '.', 'encoded through cashier', '', '2023-01-11 10:16:43', '2023-01-11 10:16:43');
INSERT INTO `tbl_customers` VALUES ('83', 'Horado, Andiolina', 'Kapayangan', '', '0', '.', 'encoded through cashier', '', '2023-01-12 06:02:13', '2023-01-12 06:02:13');
INSERT INTO `tbl_customers` VALUES ('84', 'Garbino, May', 'Miguel', '', '0', '09383145969', 'encoded through cashier', '', '2023-01-12 15:24:48', '2023-01-12 15:24:48');
INSERT INTO `tbl_customers` VALUES ('85', 'Palancia, Ben', 'Banisilan', '', '0', '.', 'encoded through cashier', '', '2023-01-16 12:25:54', '2023-01-16 12:25:54');
INSERT INTO `tbl_customers` VALUES ('86', 'Pioneer-Taw2x', 'Banisilan', '', '0', '.', 'encoded through cashier', '', '2023-01-17 15:44:44', '2023-01-17 15:44:44');
INSERT INTO `tbl_customers` VALUES ('87', 'Dekalb, Pomarin', '.', '', '0', '.', 'encoded through cashier', '', '2023-01-17 15:50:48', '2023-01-17 15:50:48');
INSERT INTO `tbl_customers` VALUES ('88', 'Blase, G', 'Banisilan', '', '0', '09675268624', 'encoded through cashier', '', '2023-01-18 06:31:33', '2023-01-18 06:31:33');
INSERT INTO `tbl_customers` VALUES ('89', 'Borja, Rex', '.', '', '0', '.', 'encoded through cashier', '', '2023-01-18 16:30:58', '2023-02-17 14:54:45');
INSERT INTO `tbl_customers` VALUES ('90', 'Cartagina, N', '.', '', '0', '.', 'encoded through cashier', '', '2023-01-19 11:40:16', '2023-01-19 11:40:16');
INSERT INTO `tbl_customers` VALUES ('91', 'Dajay, Rosalie', 'Banisilan', '', '0', '.', 'encoded through cashier', '', '2023-01-19 17:07:40', '2023-01-19 17:07:40');
INSERT INTO `tbl_customers` VALUES ('92', 'Tambog', 'Sabang', '', '0', '.', 'encoded through cashier', '', '2023-01-20 14:15:39', '2023-01-20 14:15:39');
INSERT INTO `tbl_customers` VALUES ('93', 'Dominguez, Roselyn', 'Banisilan', '', '0', '.', 'encoded through cashier', '', '2023-01-21 10:24:50', '2023-01-21 10:24:50');
INSERT INTO `tbl_customers` VALUES ('94', 'Agutaya, Alvin', '.', '', '0', '.', 'encoded through cashier', '', '2023-01-21 15:31:50', '2023-01-21 15:31:50');
INSERT INTO `tbl_customers` VALUES ('95', 'Cap Makalalim', '.', '', '0', '.', 'encoded through cashier', '', '2023-01-21 15:49:24', '2023-01-21 15:49:24');
INSERT INTO `tbl_customers` VALUES ('96', 'Isla, Rex', 'Pinamulaan', '', '0', '.', 'encoded through cashier', '', '2023-01-22 07:48:29', '2023-01-22 07:48:29');
INSERT INTO `tbl_customers` VALUES ('97', 'Jalandoni, G', '.', '', '0', '.', 'encoded through cashier', '', '2023-01-22 11:54:28', '2023-01-22 11:54:28');
INSERT INTO `tbl_customers` VALUES ('98', 'Campono, M', 'Banisilan', '', '0', '.', 'encoded through cashier', '', '2023-01-22 12:13:56', '2023-01-22 12:13:56');
INSERT INTO `tbl_customers` VALUES ('99', 'Bangud, C.', 'Banisilan', '', '0', '.', 'encoded through cashier', '', '2023-01-22 16:59:32', '2023-01-22 16:59:32');
INSERT INTO `tbl_customers` VALUES ('100', 'Binobo, Lito', 'Banisilan', '', '0', '.', 'encoded through cashier', '', '2023-01-22 17:31:42', '2023-01-22 17:31:42');
INSERT INTO `tbl_customers` VALUES ('101', 'Luces, Dennis', 'Malinao, Banisilan', '', '0', '.', 'encoded through cashier', '', '2023-01-23 10:27:56', '2023-01-23 10:27:56');
INSERT INTO `tbl_customers` VALUES ('102', 'Matulac', 'Malinao', '', '0', '09519600993', 'encoded through cashier', '', '2023-01-23 10:32:16', '2023-01-23 10:32:16');
INSERT INTO `tbl_customers` VALUES ('103', 'BasbaÃ±o, Judith', 'Miguel', '', '0', '.', 'encoded through cashier', '', '2023-01-23 11:11:43', '2023-01-23 11:11:43');
INSERT INTO `tbl_customers` VALUES ('104', 'Entera, Micheal', 'Banisilan', '', '0', '.', 'encoded through cashier', '', '2023-01-23 12:05:37', '2023-01-23 12:06:13');
INSERT INTO `tbl_customers` VALUES ('105', 'Principe, Raymond', 'Wadya', '', '0', '.', 'encoded through cashier', '', '2023-01-23 12:13:41', '2023-01-23 12:13:41');
INSERT INTO `tbl_customers` VALUES ('106', 'Tami', 'Banisilan', '', '0', '.', 'encoded through cashier', '', '2023-01-23 12:24:50', '2023-01-23 12:24:50');
INSERT INTO `tbl_customers` VALUES ('107', 'CaraÃ±agan', 'Banisilan', '', '0', '.', 'encoded through cashier', '', '2023-01-23 13:25:58', '2023-01-23 13:25:58');
INSERT INTO `tbl_customers` VALUES ('108', 'Liano', 'Banisilan', '', '0', '.', 'encoded through cashier', '', '2023-01-23 14:05:44', '2023-01-23 14:05:44');
INSERT INTO `tbl_customers` VALUES ('109', 'Baldelovar, Bobong', 'Banisilan', '', '0', '.', 'encoded through cashier', '', '2023-01-24 07:52:46', '2023-01-24 07:52:46');
INSERT INTO `tbl_customers` VALUES ('110', 'Basio, A', 'Pinamulaan', '', '0', '.', 'encoded through cashier', '', '2023-01-24 09:31:55', '2023-01-24 09:31:55');
INSERT INTO `tbl_customers` VALUES ('111', 'Mt Apo', 'Banisilan', '', '0', '.', 'encoded through cashier', '', '2023-01-24 11:26:20', '2023-01-24 11:26:20');
INSERT INTO `tbl_customers` VALUES ('112', 'Dodo', 'Tabunan', '', '0', '.', 'encoded through cashier', '', '2023-01-24 12:50:39', '2023-01-24 12:50:39');
INSERT INTO `tbl_customers` VALUES ('113', 'Binolawan  Pagumpatin', '.', '', '0', '.', 'encoded through cashier', '', '2023-01-24 13:15:33', '2023-01-24 13:15:33');
INSERT INTO `tbl_customers` VALUES ('114', 'Lumingkit, Lorna', 'Banisilan', '.', '0', '.', 'encoded through cashier', '202301130001', '2023-01-25 06:47:37', '2023-07-16 11:48:16');
INSERT INTO `tbl_customers` VALUES ('115', 'Panggo menar Sumbal', 'Guiling', '', '0', '09091037732', 'encoded through cashier', '', '2023-01-25 11:06:37', '2023-01-25 11:06:37');
INSERT INTO `tbl_customers` VALUES ('116', 'Amir Sango', 'Guiling', '', '0', '.', 'encoded through cashier', '', '2023-01-25 11:58:16', '2023-01-25 11:58:16');
INSERT INTO `tbl_customers` VALUES ('117', 'Lumampao, Rowena', 'Pinamulaan, Banisilan Cotabato', '.', '0', '.', 'encoded through cashier', '202301190001', '2023-01-25 13:04:29', '2023-07-16 16:47:07');
INSERT INTO `tbl_customers` VALUES ('118', 'Ruben', '.', '', '0', '.', 'encoded through cashier', '', '2023-01-25 13:47:49', '2023-01-25 13:47:49');
INSERT INTO `tbl_customers` VALUES ('119', 'Abiden', '.', '', '0', '.', 'encoded through cashier', '', '2023-01-25 13:55:03', '2023-01-25 13:55:03');
INSERT INTO `tbl_customers` VALUES ('120', 'Pablico, Julie', 'Banisilan', '', '0', '.', 'encoded through cashier', '', '2023-01-26 08:32:14', '2023-01-26 08:32:14');
INSERT INTO `tbl_customers` VALUES ('121', 'Lidasan, Ebrahim', 'Banisilan', '.', '0', '.', 'encoded through cashier', '.', '2023-01-26 09:32:39', '2023-07-17 11:10:56');
INSERT INTO `tbl_customers` VALUES ('122', 'Opong Dela Rita', 'Tabunan', '', '0', '0', 'encoded through cashier', '', '2023-01-26 10:37:06', '2023-01-26 10:37:06');
INSERT INTO `tbl_customers` VALUES ('123', 'Cota', '.', '', '0', '.', 'encoded through cashier', '', '2023-01-26 15:19:35', '2023-01-26 15:19:35');
INSERT INTO `tbl_customers` VALUES ('124', 'Tambog, Omar', 'Sabang', '', '0', '.', 'encoded through cashier', '', '2023-01-26 16:55:53', '2023-01-26 16:56:27');
INSERT INTO `tbl_customers` VALUES ('125', 'Russid', 'Sabang', '.', '0', '.', 'encoded through cashier', '202301630001', '2023-01-26 17:15:53', '2023-07-18 08:46:21');
INSERT INTO `tbl_customers` VALUES ('126', 'Penaso, Noe', 'Paradise', '', '0', '09070835408', 'encoded through cashier', '', '2023-01-26 17:33:45', '2023-01-26 17:33:45');
INSERT INTO `tbl_customers` VALUES ('127', 'Muelo, Judith', 'Miguel', '.', '0', '09194375144', 'encoded through cashier', '202300910001', '2023-01-27 15:39:00', '2023-07-23 12:45:56');
INSERT INTO `tbl_customers` VALUES ('128', 'Kota', 'Sabang', '', '0', '.', 'encoded through cashier', '', '2023-01-27 15:53:29', '2023-01-27 15:53:29');
INSERT INTO `tbl_customers` VALUES ('129', 'Calledo, Marilyn', 'Banisilan', '', '0', '.', 'encoded through cashier', '', '2023-01-27 16:47:01', '2023-01-27 16:47:01');
INSERT INTO `tbl_customers` VALUES ('130', 'Lumawag, Benjie Val', 'Banisilan, Cotabato', '', '0', '0', 'encoded through cashier', '', '2023-01-28 09:26:35', '2023-01-28 09:26:35');
INSERT INTO `tbl_customers` VALUES ('131', 'Balosada, Arthur', 'Banisilan Cotabato', '', '0', '.', 'encoded through cashier', '', '2023-01-28 09:28:49', '2023-01-28 09:28:49');
INSERT INTO `tbl_customers` VALUES ('132', 'Bacan', 'Banisilan', '', '0', '.', 'encoded through cashier', '', '2023-01-28 09:31:01', '2023-01-28 09:31:01');
INSERT INTO `tbl_customers` VALUES ('133', 'Aldamar', 'Tabunan', '', '0', '.', 'encoded through cashier', '', '2023-01-28 10:11:56', '2023-01-28 10:11:56');
INSERT INTO `tbl_customers` VALUES ('134', 'Maya, Aleodin Sanguines', 'Guiling', '.', '0', '09676715860', 'encoded through cashier', '202300840001', '2023-01-28 10:35:54', '2023-07-27 11:01:34');
INSERT INTO `tbl_customers` VALUES ('135', 'Mike Sanguines', 'Banisilan', '', '0', '.', 'encoded through cashier', '', '2023-01-28 10:43:31', '2023-01-28 10:43:31');
INSERT INTO `tbl_customers` VALUES ('136', 'Mobile', 'Sabang', '', '0', '.', 'encoded through cashier', '', '2023-01-28 12:01:48', '2023-01-28 12:01:48');
INSERT INTO `tbl_customers` VALUES ('137', 'Naga Sundad', 'Rancho', '', '0', '.', 'encoded through cashier', '', '2023-01-28 13:11:13', '2023-01-28 13:11:13');
INSERT INTO `tbl_customers` VALUES ('138', 'Carta, Ricky', 'Banisilan', '', '0', '0', 'encoded through cashier', '', '2023-01-28 13:23:33', '2023-01-28 13:23:33');
INSERT INTO `tbl_customers` VALUES ('139', 'Giner Napoleon', 'Karugmanan', '', '0', '09361405417', 'encoded through cashier', '', '2023-01-28 13:47:22', '2023-01-28 13:47:22');
INSERT INTO `tbl_customers` VALUES ('140', 'Matala', '.', '', '0', '.', 'encoded through cashier', '', '2023-01-28 13:58:08', '2023-01-28 13:58:08');
INSERT INTO `tbl_customers` VALUES ('141', 'Silingon, Abasir', 'Marabuhay', '', '0', '.', 'encoded through cashier', '', '2023-01-28 14:08:49', '2023-01-28 14:08:49');
INSERT INTO `tbl_customers` VALUES ('142', 'Alex', 'Guiling', '', '0', '.', 'encoded through cashier', '', '2023-01-28 14:54:10', '2023-01-28 14:54:10');
INSERT INTO `tbl_customers` VALUES ('143', 'Llurico, Joven', 'Banisilan', '', '0', '.', 'encoded through cashier', '', '2023-01-28 15:20:34', '2023-01-28 15:20:34');
INSERT INTO `tbl_customers` VALUES ('144', 'Brillo, Bano', 'Banisilan', '', '0', '.', 'encoded through cashier', '', '2023-01-29 07:03:33', '2023-01-29 07:03:33');
INSERT INTO `tbl_customers` VALUES ('145', 'Macadato, Jack', 'Guiling', '', '0', '09265070680', 'encoded through cashier', '', '2023-01-29 09:20:45', '2023-01-29 09:22:15');
INSERT INTO `tbl_customers` VALUES ('146', 'Tamay, Arbaya.', 'Guiling', '', '0', '.', 'encoded through cashier', '', '2023-01-29 09:27:59', '2023-01-29 09:27:59');
INSERT INTO `tbl_customers` VALUES ('147', 'Cabilla, Carlos', 'Banisilan', '', '0', '.', 'encoded through cashier', '', '2023-01-29 09:35:34', '2023-01-29 09:35:34');
INSERT INTO `tbl_customers` VALUES ('148', 'Divinagracia', 'Banisilan', '', '0', '.', 'encoded through cashier', '', '2023-01-29 09:41:09', '2023-01-29 09:41:09');
INSERT INTO `tbl_customers` VALUES ('149', 'Kamsa, Alvin', 'Pantar', '', '0', '.', 'encoded through cashier', '', '2023-01-29 10:32:42', '2023-01-29 10:32:42');
INSERT INTO `tbl_customers` VALUES ('150', 'Dandan', '.', '', '0', '.', 'encoded through cashier', '', '2023-01-29 10:40:03', '2023-01-29 10:40:03');
INSERT INTO `tbl_customers` VALUES ('151', 'Madriaga, Gloria', 'Banisilan', '', '0', '.', 'encoded through cashier', '', '2023-01-29 10:47:14', '2023-01-29 10:47:14');
INSERT INTO `tbl_customers` VALUES ('152', 'Glenogo, Michelle', 'Banisilan', '', '0', '.', 'encoded through cashier', '', '2023-01-29 12:29:39', '2023-01-29 12:29:39');
INSERT INTO `tbl_customers` VALUES ('153', 'Calogne, Ariel', 'Banisilan', '', '0', '.', 'encoded through cashier', '', '2023-01-29 14:40:06', '2023-01-29 14:40:06');
INSERT INTO `tbl_customers` VALUES ('154', 'Guiamano, N', 'Pantar', '', '0', '.', 'encoded through cashier', '', '2023-01-29 16:27:06', '2023-01-29 16:27:06');
INSERT INTO `tbl_customers` VALUES ('155', 'Baldelovar, Tayler', 'Banisilan', '', '0', '.', 'encoded through cashier', '', '2023-01-29 16:34:11', '2023-01-29 16:34:11');
INSERT INTO `tbl_customers` VALUES ('156', 'Saic, A', 'Sabang', '', '0', '.', 'encoded through cashier', '', '2023-01-29 16:36:21', '2023-01-29 16:36:21');
INSERT INTO `tbl_customers` VALUES ('157', 'Barotas, Donard', 'Banisilan', '', '0', '09510887277', 'encoded through cashier', '', '2023-01-30 06:30:44', '2023-03-18 05:42:55');
INSERT INTO `tbl_customers` VALUES ('158', 'Wang, Earl', 'Banisilan', '', '0', '.', 'encoded through cashier', '', '2023-01-30 06:49:14', '2023-01-30 06:49:14');
INSERT INTO `tbl_customers` VALUES ('159', 'Diamante, Mylyn Joy', 'Banisilan', '', '0', '09675081397', 'encoded through cashier', '', '2023-01-30 11:25:38', '2023-01-30 11:25:38');
INSERT INTO `tbl_customers` VALUES ('160', 'Castor,Gilbert', 'Pob 2', '', '0', '09756041690', 'encoded through cashier', '', '2023-01-30 11:34:14', '2023-01-30 11:34:14');
INSERT INTO `tbl_customers` VALUES ('161', 'Soberano, Ragel', 'Banisilan', '', '0', '.', 'encoded through cashier', '', '2023-01-30 11:44:29', '2023-01-30 11:44:29');
INSERT INTO `tbl_customers` VALUES ('162', 'Saic, Norden', 'Sabang', '', '0', '.', 'encoded through cashier', '', '2023-01-30 11:58:04', '2023-01-30 11:58:04');
INSERT INTO `tbl_customers` VALUES ('163', 'Samson, J', 'Banisilan', '', '0', '.', 'encoded through cashier', '', '2023-01-30 11:59:17', '2023-01-30 11:59:17');
INSERT INTO `tbl_customers` VALUES ('164', 'Ponadatu, Samim', '.', '', '0', '.', 'encoded through cashier', '', '2023-01-30 12:05:45', '2023-01-30 12:05:45');
INSERT INTO `tbl_customers` VALUES ('165', 'Espacio, Lina', '.', '', '0', '.', 'encoded through cashier', '', '2023-01-30 12:29:02', '2023-01-30 12:29:02');
INSERT INTO `tbl_customers` VALUES ('166', 'Puno, Jomar', 'Bao', '', '0', '.', 'encoded through cashier', '', '2023-01-30 12:38:48', '2023-01-30 12:38:48');
INSERT INTO `tbl_customers` VALUES ('167', 'Mananga, J', '.', '', '0', '.', 'encoded through cashier', '', '2023-01-30 13:11:29', '2023-01-30 13:11:29');
INSERT INTO `tbl_customers` VALUES ('168', 'Cadali, Permida', 'Marabuhay', '', '0', '.', 'encoded through cashier', '', '2023-01-30 13:19:59', '2023-01-30 13:19:59');
INSERT INTO `tbl_customers` VALUES ('169', 'Shaic, M', 'Sabang', '', '0', '.', 'encoded through cashier', '', '2023-01-30 14:13:01', '2023-01-30 14:13:01');
INSERT INTO `tbl_customers` VALUES ('170', 'Lumambas, Nasip', 'Guiling', '', '0', '.', 'encoded through cashier', '', '2023-01-30 14:37:53', '2023-01-30 14:37:53');
INSERT INTO `tbl_customers` VALUES ('171', 'Tambog, Esmael', 'Sabang', '.', '0', '093514522079', 'encoded through cashier', '202301070001', '2023-01-30 15:04:28', '2023-07-20 18:15:57');
INSERT INTO `tbl_customers` VALUES ('172', 'Tilagen, Samson', 'Pinamulaan', '', '0', '.', 'encoded through cashier', '', '2023-01-30 15:06:58', '2023-01-30 15:08:08');
INSERT INTO `tbl_customers` VALUES ('173', 'Milloga, Dante', 'Banisilan', '', '0', '.', 'encoded through cashier', '', '2023-01-30 15:09:23', '2023-01-30 15:09:23');
INSERT INTO `tbl_customers` VALUES ('174', 'Agutaya, J', 'Guiling', '', '0', '09753031670', 'encoded through cashier', '', '2023-01-30 15:24:43', '2023-01-30 15:24:43');
INSERT INTO `tbl_customers` VALUES ('175', 'Layador, Florentino', 'Paradise', '', '0', '.', 'encoded through cashier', '', '2023-01-30 15:36:27', '2023-01-30 15:36:27');
INSERT INTO `tbl_customers` VALUES ('176', 'Ganzon, Nelson', '.', '', '0', '.', 'encoded through cashier', '', '2023-01-30 15:50:33', '2023-01-30 15:50:33');
INSERT INTO `tbl_customers` VALUES ('177', 'Alisasis, Bryan', 'Banisilan', '', '0', '.', 'encoded through cashier', '', '2023-01-30 16:50:04', '2023-01-30 16:50:04');
INSERT INTO `tbl_customers` VALUES ('178', 'Salangan, S', 'Maracabac', '', '0', '.', 'encoded through cashier', '', '2023-01-30 16:55:32', '2023-01-30 16:55:32');
INSERT INTO `tbl_customers` VALUES ('179', 'Gelilang, G', '.', '', '0', '.0', 'encoded through cashier', '', '2023-01-30 16:56:28', '2023-01-30 16:56:28');
INSERT INTO `tbl_customers` VALUES ('180', 'Estrera, leo', 'Alamada', '', '0', '.', 'encoded through cashier', '', '2023-01-31 07:18:56', '2023-01-31 07:18:56');
INSERT INTO `tbl_customers` VALUES ('181', 'Albarado, J', 'Paradise', '', '0', '.', 'encoded through cashier', '', '2023-01-31 07:20:31', '2023-01-31 07:20:31');
INSERT INTO `tbl_customers` VALUES ('182', 'Santotome, Jessie', '.', '.', '0', '.', 'encoded through cashier', '202300970001', '2023-01-31 10:55:32', '2023-07-16 16:40:12');
INSERT INTO `tbl_customers` VALUES ('183', 'Calantina, Lemuel', 'Banisilan', '', '0', '.', 'encoded through cashier', '', '2023-01-31 10:59:12', '2023-01-31 10:59:12');
INSERT INTO `tbl_customers` VALUES ('184', 'Rajamuda, M', '.', '', '0', '.', 'encoded through cashier', '', '2023-01-31 11:16:42', '2023-01-31 11:16:42');
INSERT INTO `tbl_customers` VALUES ('185', 'Taghap, Mary Jane', '.', '', '0', '.', 'encoded through cashier', '', '2023-01-31 11:18:43', '2023-03-09 16:50:00');
INSERT INTO `tbl_customers` VALUES ('186', 'Malang, Alimodin', 'Maracabac', '', '0', '.', 'encoded through cashier', '', '2023-01-31 12:28:00', '2023-01-31 12:28:00');
INSERT INTO `tbl_customers` VALUES ('187', 'Gayo, M', '.', '', '0', '.', 'encoded through cashier', '', '2023-01-31 13:05:47', '2023-01-31 13:05:47');
INSERT INTO `tbl_customers` VALUES ('188', 'Navajo', '.', '', '0', '.', 'encoded through cashier', '', '2023-01-31 13:31:19', '2023-01-31 13:31:19');
INSERT INTO `tbl_customers` VALUES ('189', 'Herrada, Mylene', 'Banisilan', '', '0', '.', 'encoded through cashier', '', '2023-01-31 13:53:56', '2023-03-11 09:40:56');
INSERT INTO `tbl_customers` VALUES ('190', 'Adis', 'Banisilan', '', '0', '.', 'encoded through cashier', '', '2023-01-31 14:02:32', '2023-01-31 14:02:32');
INSERT INTO `tbl_customers` VALUES ('191', 'Cabarubias', '.', '', '0', '.', 'encoded through cashier', '', '2023-01-31 14:27:57', '2023-01-31 14:27:57');
INSERT INTO `tbl_customers` VALUES ('192', 'Saripada', '.', '', '0', '.', 'encoded through cashier', '', '2023-01-31 14:38:08', '2023-01-31 14:38:08');
INSERT INTO `tbl_customers` VALUES ('193', 'Juan, Samy', '.', '', '0', '.', 'encoded through cashier', '', '2023-01-31 14:53:02', '2023-01-31 14:53:02');
INSERT INTO `tbl_customers` VALUES ('194', 'Indiape, R', 'Gastav', '', '0', '.', 'encoded through cashier', '', '2023-01-31 15:37:55', '2023-01-31 15:37:55');
INSERT INTO `tbl_customers` VALUES ('195', 'Nueva EspaÃ±a', '.', '.', '0', '.', 'encoded through cashier', '202301710001', '2023-01-31 15:49:57', '2023-07-31 12:03:21');
INSERT INTO `tbl_customers` VALUES ('196', 'Quintero, Jorge', '.', '', '0', '.', 'encoded through cashier', '', '2023-01-31 15:52:14', '2023-01-31 15:52:14');
INSERT INTO `tbl_customers` VALUES ('197', 'Lachica', 'Banisilan', '', '0', '.', 'encoded through cashier', '', '2023-01-31 16:32:22', '2023-01-31 16:32:22');
INSERT INTO `tbl_customers` VALUES ('198', 'Saic, Mekael', 'Sabang', '', '0', '.', 'encoded through cashier', '', '2023-01-31 16:40:34', '2023-01-31 16:40:34');
INSERT INTO `tbl_customers` VALUES ('199', 'Ongao, Usop', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-01 14:38:07', '2023-02-01 14:38:07');
INSERT INTO `tbl_customers` VALUES ('200', 'Mago, Mona', 'Tinimbacan', '', '0', '09773594421', 'encoded through cashier', '', '2023-02-01 15:10:04', '2023-02-01 15:10:04');
INSERT INTO `tbl_customers` VALUES ('201', 'Horado, Botsoy', 'Kapayangan', '', '0', '.', 'encoded through cashier', '', '2023-02-01 15:35:54', '2023-02-01 15:35:54');
INSERT INTO `tbl_customers` VALUES ('202', 'Fernandez, Merlita', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-01 15:42:12', '2023-02-01 15:42:12');
INSERT INTO `tbl_customers` VALUES ('203', 'Apelando', 'Banisilan', '', '0', '09977955063', 'encoded through cashier', '', '2023-02-01 16:35:50', '2023-02-01 16:35:50');
INSERT INTO `tbl_customers` VALUES ('204', 'Subaldo', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-01 16:40:43', '2023-02-01 16:40:43');
INSERT INTO `tbl_customers` VALUES ('205', 'Navaro, J', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-01 16:42:48', '2023-02-01 16:42:48');
INSERT INTO `tbl_customers` VALUES ('206', 'Talib, Amir', 'Busaon', '.', '0', '09090314477', 'encoded through cashier', '202301080001', '2023-02-01 17:41:41', '2023-07-20 18:15:37');
INSERT INTO `tbl_customers` VALUES ('207', 'Cabangon', 'Banisilan', '', '0', '.', 'encoded through cashier', '', '2023-02-01 17:48:09', '2023-02-01 17:48:09');
INSERT INTO `tbl_customers` VALUES ('208', 'Dagsan', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-01 17:52:08', '2023-02-01 17:52:08');
INSERT INTO `tbl_customers` VALUES ('209', 'Alontok', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-02 08:56:33', '2023-02-02 08:56:33');
INSERT INTO `tbl_customers` VALUES ('210', 'songcuya', '993', '', '0', '.', 'encoded through cashier', '', '2023-02-02 09:39:04', '2023-02-02 09:39:04');
INSERT INTO `tbl_customers` VALUES ('211', 'Macasling, Allen', '993', '', '0', '.', 'encoded through cashier', '', '2023-02-02 09:49:15', '2023-02-02 09:49:15');
INSERT INTO `tbl_customers` VALUES ('212', 'Soltis, Joy', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-02 09:59:24', '2023-02-02 09:59:24');
INSERT INTO `tbl_customers` VALUES ('213', 'Kayamba', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-02 10:38:09', '2023-02-02 10:38:09');
INSERT INTO `tbl_customers` VALUES ('214', 'Celis', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-02 11:33:07', '2023-02-02 11:33:07');
INSERT INTO `tbl_customers` VALUES ('215', 'Tolentino, Vincenth', 'Banislan', '.', '0', '.', 'encoded through cashier', '202300960001', '2023-02-02 14:30:22', '2023-07-16 16:38:28');
INSERT INTO `tbl_customers` VALUES ('216', 'Sarcong', 'Pidatan', '', '0', '09126104670', 'encoded through cashier', '', '2023-02-02 15:04:48', '2023-02-02 15:04:48');
INSERT INTO `tbl_customers` VALUES ('217', 'Jestoni', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-02 15:19:03', '2023-02-02 15:19:03');
INSERT INTO `tbl_customers` VALUES ('218', 'Baimona, P.', 'Marabuhay', '', '0', '09638308278', 'encoded through cashier', '', '2023-02-02 15:20:34', '2023-02-02 15:20:34');
INSERT INTO `tbl_customers` VALUES ('219', 'Aluyudan', 'Maracabac', '', '0', '.', 'encoded through cashier', '', '2023-02-02 15:39:41', '2023-02-02 15:39:41');
INSERT INTO `tbl_customers` VALUES ('220', 'Siranilla, Rene', 'Wadya', '', '0', '.', 'encoded through cashier', '', '2023-02-02 16:18:59', '2023-02-02 16:18:59');
INSERT INTO `tbl_customers` VALUES ('221', 'Tapeseria', 'Wadya', '', '0', '.', 'encoded through cashier', '', '2023-02-03 06:46:45', '2023-02-03 06:46:45');
INSERT INTO `tbl_customers` VALUES ('222', 'Kg SupeÃ±a', 'Malinao', '', '0', '.', 'encoded through cashier', '', '2023-02-03 10:52:12', '2023-02-03 10:52:12');
INSERT INTO `tbl_customers` VALUES ('223', 'Palomar', 'Kapayangan', '', '0', '.', 'encoded through cashier', '', '2023-02-03 11:05:53', '2023-02-03 11:05:53');
INSERT INTO `tbl_customers` VALUES ('224', 'Estrelloso, Jayson', 'Sitio Ulo, Kalawaig', '', '0', '.', 'encoded through cashier', '', '2023-02-03 11:14:55', '2023-02-03 11:14:55');
INSERT INTO `tbl_customers` VALUES ('225', 'Gankalao, J', 'Guiling', '', '0', '.', 'encoded through cashier', '', '2023-02-03 11:54:48', '2023-02-03 11:54:48');
INSERT INTO `tbl_customers` VALUES ('226', 'Rizardo, Peter', 'Guiling', '', '0', '.', 'encoded through cashier', '', '2023-02-03 13:44:40', '2023-02-03 13:44:40');
INSERT INTO `tbl_customers` VALUES ('227', 'an', 'Esmael', '', '0', '.', 'encoded through cashier', '', '2023-02-03 14:22:18', '2023-02-03 14:22:18');
INSERT INTO `tbl_customers` VALUES ('228', 'Esmael', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-03 14:22:45', '2023-02-03 14:22:45');
INSERT INTO `tbl_customers` VALUES ('229', 'Perez, Arnold', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-03 14:24:32', '2023-02-03 14:24:32');
INSERT INTO `tbl_customers` VALUES ('230', 'Sadam', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-03 15:04:04', '2023-02-03 15:04:04');
INSERT INTO `tbl_customers` VALUES ('231', 'Jimmy C', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-03 15:11:57', '2023-02-03 15:11:57');
INSERT INTO `tbl_customers` VALUES ('232', 'Libana, A', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-03 15:12:44', '2023-02-03 15:12:44');
INSERT INTO `tbl_customers` VALUES ('233', 'Lustan', 'Tagumpay', '', '0', '09057466724', 'encoded through cashier', '', '2023-02-03 15:20:35', '2023-02-03 15:20:35');
INSERT INTO `tbl_customers` VALUES ('234', 'Ramos, June', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-03 15:42:27', '2023-02-03 15:42:27');
INSERT INTO `tbl_customers` VALUES ('235', 'Silongan, A', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-03 16:00:31', '2023-02-03 16:00:31');
INSERT INTO `tbl_customers` VALUES ('236', 'Datu Manong', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-03 16:01:46', '2023-02-03 16:01:46');
INSERT INTO `tbl_customers` VALUES ('237', 'Fernando', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-03 16:09:43', '2023-02-03 16:09:43');
INSERT INTO `tbl_customers` VALUES ('238', 'Castor, Rey', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-03 16:21:03', '2023-02-03 16:21:03');
INSERT INTO `tbl_customers` VALUES ('239', 'Gio, Hayde', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-03 16:29:23', '2023-02-03 16:29:23');
INSERT INTO `tbl_customers` VALUES ('240', 'Cuares, L', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-03 16:44:16', '2023-02-03 16:44:16');
INSERT INTO `tbl_customers` VALUES ('241', 'Caro', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-03 17:34:19', '2023-02-03 17:34:19');
INSERT INTO `tbl_customers` VALUES ('242', 'Catamin, A', 'Wadyan', '', '0', '.', 'encoded through cashier', '', '2023-02-04 14:50:47', '2023-02-04 14:50:47');
INSERT INTO `tbl_customers` VALUES ('243', 'Marcon', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-04 16:34:15', '2023-02-04 16:34:15');
INSERT INTO `tbl_customers` VALUES ('244', 'Barotas, J', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-04 17:33:39', '2023-02-04 17:33:39');
INSERT INTO `tbl_customers` VALUES ('245', 'PateÃ±o', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-05 10:15:10', '2023-02-05 10:15:10');
INSERT INTO `tbl_customers` VALUES ('246', 'Cali, Reygan', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-05 10:21:05', '2023-02-05 10:21:05');
INSERT INTO `tbl_customers` VALUES ('247', 'Agramon, L', '1', '', '0', '1', 'encoded through cashier', '', '2023-02-05 10:44:29', '2023-02-05 10:44:29');
INSERT INTO `tbl_customers` VALUES ('248', 'Adapan, Guielala', 'Maracabav', '', '0', '.', 'encoded through cashier', '', '2023-02-05 11:08:06', '2023-02-05 11:08:06');
INSERT INTO `tbl_customers` VALUES ('249', 'Mucoy', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-05 11:28:37', '2023-02-05 11:28:37');
INSERT INTO `tbl_customers` VALUES ('250', 'PeÃ±as, F', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-05 11:34:22', '2023-02-05 11:34:22');
INSERT INTO `tbl_customers` VALUES ('251', 'Catiquesta, M', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-05 13:45:21', '2023-02-05 13:45:21');
INSERT INTO `tbl_customers` VALUES ('252', 'Cordero, A', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-05 13:49:33', '2023-02-05 13:49:33');
INSERT INTO `tbl_customers` VALUES ('253', 'Pelahiyao, D', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-05 14:19:38', '2023-02-05 14:19:38');
INSERT INTO `tbl_customers` VALUES ('254', 'Salangan, C', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-05 14:30:48', '2023-02-05 14:30:48');
INSERT INTO `tbl_customers` VALUES ('255', 'Naldoza, Totong', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-05 14:59:00', '2023-02-05 14:59:00');
INSERT INTO `tbl_customers` VALUES ('256', 'Banaban, M', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-05 15:03:58', '2023-02-05 15:03:58');
INSERT INTO `tbl_customers` VALUES ('257', 'Belbar, R', 'Banisilan', '', '0', '.', 'encoded through cashier', '', '2023-02-05 16:18:41', '2023-02-05 16:18:41');
INSERT INTO `tbl_customers` VALUES ('258', 'Salvo', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-05 16:32:24', '2023-02-05 16:32:24');
INSERT INTO `tbl_customers` VALUES ('259', 'Maca-ampang, L', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-05 17:33:55', '2023-02-05 17:33:55');
INSERT INTO `tbl_customers` VALUES ('260', 'Banaban, A', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-06 10:15:42', '2023-02-06 10:15:42');
INSERT INTO `tbl_customers` VALUES ('261', 'Malijan, Boyet', 'Rancho', '', '0', '.', 'encoded through cashier', '', '2023-02-06 10:32:18', '2023-02-06 10:32:18');
INSERT INTO `tbl_customers` VALUES ('262', 'Aldamar, D', 'Guiling', '', '0', '.', 'encoded through cashier', '', '2023-02-06 10:36:18', '2023-02-06 10:36:18');
INSERT INTO `tbl_customers` VALUES ('263', 'Sultan, J', 'Guiling', '', '0', '.', 'encoded through cashier', '', '2023-02-06 12:34:21', '2023-02-06 12:34:21');
INSERT INTO `tbl_customers` VALUES ('264', 'Jungco, M', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-06 13:53:00', '2023-02-06 13:53:00');
INSERT INTO `tbl_customers` VALUES ('265', 'Tapa', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-06 14:15:00', '2023-02-06 14:15:00');
INSERT INTO `tbl_customers` VALUES ('266', 'Bumacas', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-06 14:45:22', '2023-02-06 14:45:22');
INSERT INTO `tbl_customers` VALUES ('267', 'Maamor, A', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-06 16:03:10', '2023-02-06 16:03:10');
INSERT INTO `tbl_customers` VALUES ('268', 'Salangan, B', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-06 16:06:04', '2023-02-06 16:06:04');
INSERT INTO `tbl_customers` VALUES ('269', 'Valencia, Amado', 'Kapayangan', '', '0', '.', 'encoded through cashier', '', '2023-02-07 06:51:09', '2023-02-07 06:51:09');
INSERT INTO `tbl_customers` VALUES ('270', 'Macasadi', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-07 07:29:27', '2023-02-07 07:29:27');
INSERT INTO `tbl_customers` VALUES ('271', 'Pangandaman', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-07 07:52:36', '2023-02-07 07:52:36');
INSERT INTO `tbl_customers` VALUES ('272', 'Miran', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-07 08:09:53', '2023-02-07 08:09:53');
INSERT INTO `tbl_customers` VALUES ('273', 'Ermina, Miraflor', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-07 09:49:27', '2023-02-07 09:49:27');
INSERT INTO `tbl_customers` VALUES ('274', 'Pagado', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-07 10:03:36', '2023-02-07 10:03:36');
INSERT INTO `tbl_customers` VALUES ('275', 'Bayo', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-07 10:14:50', '2023-02-07 10:14:50');
INSERT INTO `tbl_customers` VALUES ('276', 'BasbaÃ±o', 'Hillside', '', '0', '.', 'encoded through cashier', '', '2023-02-07 10:19:33', '2023-02-07 10:19:33');
INSERT INTO `tbl_customers` VALUES ('277', 'LicaÃ±a', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-07 11:13:50', '2023-02-07 11:13:50');
INSERT INTO `tbl_customers` VALUES ('278', 'Bagnes, Marlon', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-07 11:32:58', '2023-02-07 11:32:58');
INSERT INTO `tbl_customers` VALUES ('279', 'Macasulay', 'guiling', '', '0', '.', 'encoded through cashier', '', '2023-02-07 11:41:55', '2023-02-07 11:41:55');
INSERT INTO `tbl_customers` VALUES ('280', 'Salangan, Jalil', 'Guiling', '.', '0', '.', 'encoded through cashier', '202300860001', '2023-02-07 11:51:18', '2023-07-22 14:54:33');
INSERT INTO `tbl_customers` VALUES ('281', 'Sandahan', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-07 12:58:23', '2023-02-07 12:58:23');
INSERT INTO `tbl_customers` VALUES ('282', 'Manuel, J', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-07 13:05:47', '2023-02-07 13:05:47');
INSERT INTO `tbl_customers` VALUES ('283', 'Hallado, I', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-07 15:40:05', '2023-02-07 15:40:05');
INSERT INTO `tbl_customers` VALUES ('284', 'Manungkara', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-07 15:45:26', '2023-02-07 15:45:26');
INSERT INTO `tbl_customers` VALUES ('285', 'Salinao, Annabel', 'Sabang', '', '0', '09975617454', 'encoded through cashier', '', '2023-02-07 16:14:17', '2023-03-29 15:09:54');
INSERT INTO `tbl_customers` VALUES ('286', 'Bayangan, Mike', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-08 07:07:45', '2023-02-08 07:07:45');
INSERT INTO `tbl_customers` VALUES ('287', 'Batukan, J', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-08 10:10:47', '2023-02-08 10:10:47');
INSERT INTO `tbl_customers` VALUES ('288', 'Ebrona, Inday', '1', '', '0', '1', 'encoded through cashier', '', '2023-02-08 10:43:16', '2023-02-08 10:43:16');
INSERT INTO `tbl_customers` VALUES ('289', 'Alao', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-08 12:37:48', '2023-02-08 12:37:48');
INSERT INTO `tbl_customers` VALUES ('290', 'Pedro', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-08 12:47:34', '2023-02-08 12:47:34');
INSERT INTO `tbl_customers` VALUES ('291', 'Lomahan, Charlene', 'Wadya', '', '0', '.', 'encoded through cashier', '', '2023-02-08 15:38:15', '2023-02-08 15:38:15');
INSERT INTO `tbl_customers` VALUES ('292', 'Lariga', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-09 07:14:49', '2023-02-09 07:14:49');
INSERT INTO `tbl_customers` VALUES ('293', 'Depositario', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-09 07:47:18', '2023-02-09 07:47:18');
INSERT INTO `tbl_customers` VALUES ('294', 'Agtarap', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-09 09:05:51', '2023-02-09 09:05:51');
INSERT INTO `tbl_customers` VALUES ('295', 'Talib, Micheal', 'Busaon', '', '0', '09206363705', 'encoded through cashier', '', '2023-02-09 09:17:05', '2023-02-11 11:34:07');
INSERT INTO `tbl_customers` VALUES ('296', 'Yambing, B', '.', '', '0', '1', 'encoded through cashier', '', '2023-02-09 09:27:39', '2023-02-09 09:27:39');
INSERT INTO `tbl_customers` VALUES ('297', 'Bago', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-09 09:56:34', '2023-02-09 09:56:34');
INSERT INTO `tbl_customers` VALUES ('298', 'Monegro', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-09 10:06:46', '2023-02-09 10:06:46');
INSERT INTO `tbl_customers` VALUES ('299', 'Tedios', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-09 11:13:23', '2023-02-09 11:13:23');
INSERT INTO `tbl_customers` VALUES ('300', 'Diego', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-09 12:25:09', '2023-02-09 12:25:09');
INSERT INTO `tbl_customers` VALUES ('301', 'Sumagina, Rosbil', 'Guiling', '', '0', '.', 'encoded through cashier', '', '2023-02-09 14:20:16', '2023-02-09 14:20:16');
INSERT INTO `tbl_customers` VALUES ('302', 'wali', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-09 14:25:34', '2023-02-09 14:25:34');
INSERT INTO `tbl_customers` VALUES ('303', 'Buenaflor', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-09 15:29:28', '2023-02-09 15:29:28');
INSERT INTO `tbl_customers` VALUES ('304', 'Sandigan, B', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-09 15:58:27', '2023-02-09 15:58:27');
INSERT INTO `tbl_customers` VALUES ('305', 'Ripag, Bryan', 'Pidatan', '', '0', '.', 'encoded through cashier', '', '2023-02-09 16:08:07', '2023-02-09 16:08:07');
INSERT INTO `tbl_customers` VALUES ('306', 'Villote', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-09 16:09:15', '2023-02-09 16:09:15');
INSERT INTO `tbl_customers` VALUES ('307', 'Bofitiado', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-09 16:11:18', '2023-02-09 16:11:18');
INSERT INTO `tbl_customers` VALUES ('308', 'Namoc', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-09 16:32:00', '2023-02-09 16:32:00');
INSERT INTO `tbl_customers` VALUES ('309', 'Maamor', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-09 16:35:07', '2023-02-09 16:35:07');
INSERT INTO `tbl_customers` VALUES ('310', 'Borro', 'Rancho', '', '0', '.', 'encoded through cashier', '', '2023-02-09 16:37:53', '2023-02-09 16:37:53');
INSERT INTO `tbl_customers` VALUES ('311', 'Aluyodan', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-09 16:52:44', '2023-02-09 16:52:44');
INSERT INTO `tbl_customers` VALUES ('312', 'Mamao, A', 'Guiling', '', '0', '.', 'encoded through cashier', '', '2023-02-09 16:58:54', '2023-02-09 16:58:54');
INSERT INTO `tbl_customers` VALUES ('313', 'Quizon, Theresa', 'Banisilan', '', '0', '.', 'encoded through cashier', '', '2023-02-10 07:02:36', '2023-02-10 07:07:11');
INSERT INTO `tbl_customers` VALUES ('314', 'Albay, J', 'Banisilan', '', '0', '.', 'encoded through cashier', '', '2023-02-10 07:25:03', '2023-02-10 07:25:03');
INSERT INTO `tbl_customers` VALUES ('315', 'Oding, Abdul', 'Marabuhay', '', '0', '.', 'encoded through cashier', '', '2023-02-10 07:41:41', '2023-02-10 07:41:41');
INSERT INTO `tbl_customers` VALUES ('316', 'Kawaling, L', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-10 07:47:01', '2023-02-10 07:47:01');
INSERT INTO `tbl_customers` VALUES ('317', 'Gantalao, Love2x', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-10 09:43:22', '2023-02-10 09:43:22');
INSERT INTO `tbl_customers` VALUES ('318', 'Padernal, Henry', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-10 10:47:29', '2023-02-10 10:47:29');
INSERT INTO `tbl_customers` VALUES ('319', 'Sumbal, K', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-10 10:58:40', '2023-02-10 10:58:40');
INSERT INTO `tbl_customers` VALUES ('320', 'Narag', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-10 11:02:16', '2023-02-10 11:02:16');
INSERT INTO `tbl_customers` VALUES ('321', 'PeÃ±as, Roger', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-10 11:22:00', '2023-02-10 11:22:00');
INSERT INTO `tbl_customers` VALUES ('322', 'Manglicmot, T', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-10 13:06:12', '2023-02-10 13:06:12');
INSERT INTO `tbl_customers` VALUES ('323', 'Barsenas', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-10 13:38:50', '2023-02-10 13:38:50');
INSERT INTO `tbl_customers` VALUES ('324', 'Acuzar, Bernadette', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-10 14:31:40', '2023-02-10 14:31:40');
INSERT INTO `tbl_customers` VALUES ('325', 'Batiller, Roseman', 'Matin aw', '', '0', '.', 'encoded through cashier', '', '2023-02-10 14:52:27', '2023-02-10 14:52:27');
INSERT INTO `tbl_customers` VALUES ('326', 'Pacardo, Wilson', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-10 17:08:03', '2023-02-10 17:08:03');
INSERT INTO `tbl_customers` VALUES ('327', 'Panggaga, Danding', 'Guiling', '', '0', '.', 'encoded through cashier', '', '2023-02-11 09:44:17', '2023-02-11 09:44:17');
INSERT INTO `tbl_customers` VALUES ('328', 'Calambro', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-11 10:03:13', '2023-02-11 10:03:13');
INSERT INTO `tbl_customers` VALUES ('329', 'Suyo', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-11 10:09:47', '2023-02-11 10:09:47');
INSERT INTO `tbl_customers` VALUES ('330', 'Gumban', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-11 11:04:49', '2023-02-11 11:04:49');
INSERT INTO `tbl_customers` VALUES ('331', 'Ellorin, J', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-11 11:30:59', '2023-02-11 11:30:59');
INSERT INTO `tbl_customers` VALUES ('332', 'Bainor', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-11 14:13:24', '2023-02-11 14:13:24');
INSERT INTO `tbl_customers` VALUES ('333', 'Ignacio, J', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-11 14:27:01', '2023-02-11 14:27:01');
INSERT INTO `tbl_customers` VALUES ('334', 'Barcas, Gemma', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-11 15:09:25', '2023-02-11 15:09:25');
INSERT INTO `tbl_customers` VALUES ('335', 'Muslimin', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-11 15:23:13', '2023-02-11 15:23:13');
INSERT INTO `tbl_customers` VALUES ('336', 'Cayetano, Mark', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-12 07:29:41', '2023-02-12 07:29:41');
INSERT INTO `tbl_customers` VALUES ('337', 'Celeste, J', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-12 09:53:38', '2023-02-12 09:53:38');
INSERT INTO `tbl_customers` VALUES ('338', 'Balila, Dante', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-12 10:43:29', '2023-02-12 10:43:29');
INSERT INTO `tbl_customers` VALUES ('339', 'Azagra, Renante', 'Tabunan', '', '0', '.', 'encoded through cashier', '', '2023-02-12 11:01:49', '2023-02-12 11:01:49');
INSERT INTO `tbl_customers` VALUES ('340', 'Delos Santos', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-12 11:20:58', '2023-02-12 11:20:58');
INSERT INTO `tbl_customers` VALUES ('341', 'Balolong', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-12 14:49:31', '2023-02-12 14:49:31');
INSERT INTO `tbl_customers` VALUES ('342', 'Catamin, Helen', 'Wadya', '', '0', '.', 'encoded through cashier', '', '2023-02-13 07:11:22', '2023-02-13 07:11:22');
INSERT INTO `tbl_customers` VALUES ('343', 'Barrion, Jimmy', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-13 08:15:44', '2023-02-13 08:15:44');
INSERT INTO `tbl_customers` VALUES ('344', 'Osman, Abdullah', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-13 10:29:36', '2023-02-13 10:29:36');
INSERT INTO `tbl_customers` VALUES ('345', 'SoqueÃ±a, J', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-13 11:22:45', '2023-02-13 11:22:45');
INSERT INTO `tbl_customers` VALUES ('346', 'Montales', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-13 11:41:14', '2023-02-13 11:41:14');
INSERT INTO `tbl_customers` VALUES ('347', 'Balmores, N', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-13 14:49:32', '2023-02-13 14:49:32');
INSERT INTO `tbl_customers` VALUES ('348', 'Alimodin', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-13 15:08:14', '2023-02-13 15:08:14');
INSERT INTO `tbl_customers` VALUES ('349', 'Callao', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-13 15:26:03', '2023-02-13 15:26:03');
INSERT INTO `tbl_customers` VALUES ('350', 'Angatong', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-13 16:12:51', '2023-02-13 16:12:51');
INSERT INTO `tbl_customers` VALUES ('351', 'Alsoza', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-14 08:44:01', '2023-02-14 08:44:01');
INSERT INTO `tbl_customers` VALUES ('352', 'Calantina, Merlie', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-14 09:48:11', '2023-02-14 09:48:11');
INSERT INTO `tbl_customers` VALUES ('353', 'Mating', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-14 10:11:32', '2023-02-14 10:11:32');
INSERT INTO `tbl_customers` VALUES ('354', 'Calantina', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-14 10:51:06', '2023-02-14 10:51:06');
INSERT INTO `tbl_customers` VALUES ('355', 'Naki, Salaman', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-14 11:14:07', '2023-02-14 11:14:07');
INSERT INTO `tbl_customers` VALUES ('356', 'Matala, Ostad', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-14 12:04:29', '2023-02-14 12:04:29');
INSERT INTO `tbl_customers` VALUES ('357', 'Panduma, Marissa', '.', '.', '0', '.', 'encoded through cashier', '202301090001', '2023-02-14 12:38:46', '2023-07-20 18:15:16');
INSERT INTO `tbl_customers` VALUES ('358', 'Manditayan', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-14 12:42:14', '2023-02-14 12:42:14');
INSERT INTO `tbl_customers` VALUES ('359', 'Paisal', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-14 12:48:46', '2023-02-14 12:48:46');
INSERT INTO `tbl_customers` VALUES ('360', 'Cader', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-14 16:20:20', '2023-02-14 16:20:20');
INSERT INTO `tbl_customers` VALUES ('361', 'Sultan, Saipoden', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-14 16:29:25', '2023-02-14 16:29:25');
INSERT INTO `tbl_customers` VALUES ('362', 'Barrion, B', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-15 06:22:41', '2023-02-15 06:22:41');
INSERT INTO `tbl_customers` VALUES ('363', 'Benbadz', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-15 07:18:58', '2023-02-15 07:18:58');
INSERT INTO `tbl_customers` VALUES ('364', 'Matala, Thoma', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-15 08:34:17', '2023-02-15 08:34:17');
INSERT INTO `tbl_customers` VALUES ('365', 'Alsosa, Allonie', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-15 08:42:21', '2023-02-15 08:42:21');
INSERT INTO `tbl_customers` VALUES ('366', 'Panes', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-15 08:45:28', '2023-02-15 08:45:28');
INSERT INTO `tbl_customers` VALUES ('367', 'Bacus', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-15 10:16:52', '2023-02-15 10:16:52');
INSERT INTO `tbl_customers` VALUES ('368', 'Pacardo, J', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-15 12:05:47', '2023-02-15 12:05:47');
INSERT INTO `tbl_customers` VALUES ('369', 'Cayetano', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-15 12:19:16', '2023-02-15 12:19:16');
INSERT INTO `tbl_customers` VALUES ('370', 'Asong, Jimmy', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-15 13:27:26', '2023-02-15 13:27:26');
INSERT INTO `tbl_customers` VALUES ('371', 'Hermoso, Evelyn', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-15 13:28:20', '2023-02-15 13:28:20');
INSERT INTO `tbl_customers` VALUES ('372', 'Sandaja', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-15 13:41:26', '2023-02-15 13:41:26');
INSERT INTO `tbl_customers` VALUES ('373', 'Pagumpatin, N', 'Marabuhay', '', '0', '.', 'encoded through cashier', '', '2023-02-15 15:06:30', '2023-02-15 15:06:30');
INSERT INTO `tbl_customers` VALUES ('374', 'Maygay, Gerry', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-16 07:53:55', '2023-02-16 07:53:55');
INSERT INTO `tbl_customers` VALUES ('375', 'Salangan, Basari', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-16 08:46:03', '2023-02-16 08:46:03');
INSERT INTO `tbl_customers` VALUES ('376', 'Toma', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-16 13:45:35', '2023-02-16 13:45:35');
INSERT INTO `tbl_customers` VALUES ('377', 'Sahagon, Zonia', 'Kapayangan', '.', '0', '09091047311', 'encoded through cashier', '202301170001', '2023-02-16 14:56:06', '2023-07-16 11:53:26');
INSERT INTO `tbl_customers` VALUES ('378', 'Castor, Tanlok', 'Purok 4, Kapayangan', '', '0', '.', 'encoded through cashier', '', '2023-02-16 15:01:26', '2023-02-16 15:01:26');
INSERT INTO `tbl_customers` VALUES ('379', 'Sanguines, Norania', 'Sabang', '.', '0', '.', 'encoded through cashier', '202301110001', '2023-02-16 16:48:23', '2023-07-16 17:32:17');
INSERT INTO `tbl_customers` VALUES ('380', 'Calogne, Evelyn', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-16 16:54:37', '2023-02-16 16:54:37');
INSERT INTO `tbl_customers` VALUES ('381', 'Tambog, Kader', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-16 16:55:41', '2023-02-16 16:55:41');
INSERT INTO `tbl_customers` VALUES ('382', 'Castor, Elsa', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-16 17:19:25', '2023-02-16 17:19:25');
INSERT INTO `tbl_customers` VALUES ('383', 'Fernandez, J', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-17 06:26:49', '2023-02-17 06:26:49');
INSERT INTO `tbl_customers` VALUES ('384', 'Lumambas, B', 'Pindatan', '', '0', '.', 'encoded through cashier', '', '2023-02-17 09:49:24', '2023-02-17 09:49:24');
INSERT INTO `tbl_customers` VALUES ('385', 'Cerbo, Rolando', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-17 10:05:16', '2023-02-17 10:05:16');
INSERT INTO `tbl_customers` VALUES ('386', 'Molina', 'Karugmanan', '', '0', '.', 'encoded through cashier', '', '2023-02-17 11:01:04', '2023-02-17 11:01:04');
INSERT INTO `tbl_customers` VALUES ('387', 'Yolanda, Munda', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-17 12:03:42', '2023-02-17 12:03:42');
INSERT INTO `tbl_customers` VALUES ('388', 'Balacasi, N', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-17 12:58:59', '2023-02-17 12:58:59');
INSERT INTO `tbl_customers` VALUES ('389', 'Vallespin, Gilbert', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-17 13:38:18', '2023-02-17 13:38:18');
INSERT INTO `tbl_customers` VALUES ('390', 'Teko', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-17 14:40:14', '2023-02-17 14:40:14');
INSERT INTO `tbl_customers` VALUES ('391', 'Mantitayan', 'Busaon', '', '0', '.', 'encoded through cashier', '', '2023-02-17 15:20:39', '2023-02-17 15:20:39');
INSERT INTO `tbl_customers` VALUES ('392', 'Garbino, Mary', 'Pob 1', '.', '0', '09066728797', 'encoded through cashier', '202301590001', '2023-02-17 16:47:19', '2023-07-16 11:55:15');
INSERT INTO `tbl_customers` VALUES ('393', 'Diocares', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-17 17:16:23', '2023-02-17 17:16:23');
INSERT INTO `tbl_customers` VALUES ('394', 'Aposaga, John', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-18 10:11:00', '2023-02-18 10:11:00');
INSERT INTO `tbl_customers` VALUES ('395', 'Llorici, Joven', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-18 10:14:06', '2023-02-18 10:14:06');
INSERT INTO `tbl_customers` VALUES ('396', 'Ventura, Sally', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-18 10:29:39', '2023-02-18 10:29:39');
INSERT INTO `tbl_customers` VALUES ('397', 'Caturay, L', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-18 10:44:20', '2023-02-18 10:44:20');
INSERT INTO `tbl_customers` VALUES ('398', 'Onie, R', 'Busaon', '', '0', '.', 'encoded through cashier', '', '2023-02-18 14:17:40', '2023-02-18 14:17:40');
INSERT INTO `tbl_customers` VALUES ('399', 'Lacaran', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-18 15:55:41', '2023-02-18 15:55:41');
INSERT INTO `tbl_customers` VALUES ('400', 'Macasarte', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-18 16:42:41', '2023-02-18 16:42:41');
INSERT INTO `tbl_customers` VALUES ('401', 'Lumabao', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-18 17:08:44', '2023-02-18 17:08:44');
INSERT INTO `tbl_customers` VALUES ('402', 'Molina, R', 'Banisilan', '', '0', '.', 'encoded through cashier', '', '2023-02-19 06:36:21', '2023-02-19 06:36:21');
INSERT INTO `tbl_customers` VALUES ('403', 'Barong, Jomar', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-19 08:13:31', '2023-02-19 08:13:31');
INSERT INTO `tbl_customers` VALUES ('404', 'Tatsado, Jake', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-19 08:46:37', '2023-02-19 08:46:37');
INSERT INTO `tbl_customers` VALUES ('405', 'Mucalam, Backs', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-19 09:11:56', '2023-02-19 09:11:56');
INSERT INTO `tbl_customers` VALUES ('407', 'Ferolino, J', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-19 09:56:31', '2023-02-19 09:56:31');
INSERT INTO `tbl_customers` VALUES ('408', 'Capanang', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-19 10:08:20', '2023-02-19 10:08:20');
INSERT INTO `tbl_customers` VALUES ('409', 'Pagmanua', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-19 10:37:32', '2023-02-19 10:37:32');
INSERT INTO `tbl_customers` VALUES ('410', 'Ruyana, Richard', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-19 11:02:41', '2023-02-19 11:02:41');
INSERT INTO `tbl_customers` VALUES ('411', 'Delaraga, Roy', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-19 11:08:41', '2023-02-19 11:08:41');
INSERT INTO `tbl_customers` VALUES ('412', 'Caranay', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-19 11:51:15', '2023-02-19 11:51:15');
INSERT INTO `tbl_customers` VALUES ('413', 'Penaso, Nerio', 'Kalawaig', '', '0', '.', 'encoded through cashier', '', '2023-02-19 12:23:37', '2023-02-19 12:23:37');
INSERT INTO `tbl_customers` VALUES ('414', 'Silva, Silver', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-19 12:43:22', '2023-02-19 12:43:22');
INSERT INTO `tbl_customers` VALUES ('415', 'Lucero, Jose', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-19 14:44:21', '2023-02-19 14:44:21');
INSERT INTO `tbl_customers` VALUES ('416', 'Deslate', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-19 15:16:14', '2023-02-19 15:16:14');
INSERT INTO `tbl_customers` VALUES ('417', 'Bofitiado, Dandy', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-19 15:36:59', '2023-02-19 15:36:59');
INSERT INTO `tbl_customers` VALUES ('418', 'Pagurayan, Meriza', 'Brgy Rancho', '.', '0', '.', 'encoded through cashier', '', '2023-02-19 15:40:02', '2023-07-14 08:55:17');
INSERT INTO `tbl_customers` VALUES ('419', 'Belonio, Pascasia', '.', '.', '0', '.', 'encoded through cashier', '1236', '2023-02-19 15:55:15', '2023-07-18 10:09:24');
INSERT INTO `tbl_customers` VALUES ('420', 'Pinamulaan High School', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-19 15:58:42', '2023-02-19 15:58:42');
INSERT INTO `tbl_customers` VALUES ('421', 'Buado', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-19 17:28:01', '2023-02-19 17:28:01');
INSERT INTO `tbl_customers` VALUES ('422', 'Jempoy, B', 'BUAY BUAY', '', '0', '.', 'encoded through cashier', '', '2023-02-20 10:18:31', '2023-02-20 10:18:31');
INSERT INTO `tbl_customers` VALUES ('423', 'Amiler, Evelyn', '.', '', '0', '1', 'encoded through cashier', '', '2023-02-20 12:33:02', '2023-02-20 12:33:02');
INSERT INTO `tbl_customers` VALUES ('424', 'Lantib, Macoy', '.', '.', '0', '.', 'encoded through cashier', '202300930001', '2023-02-20 15:16:34', '2023-08-25 12:50:44');
INSERT INTO `tbl_customers` VALUES ('425', 'Vertillo', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-20 15:34:10', '2023-02-20 15:34:10');
INSERT INTO `tbl_customers` VALUES ('426', 'Makasulay', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-20 16:21:48', '2023-02-20 16:21:48');
INSERT INTO `tbl_customers` VALUES ('427', 'Colonghe, Jonar', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-21 06:09:34', '2023-02-21 06:09:34');
INSERT INTO `tbl_customers` VALUES ('428', 'Ponsalan, Arnel', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-21 07:18:44', '2023-02-21 07:18:44');
INSERT INTO `tbl_customers` VALUES ('429', 'Espirito, Maricel', '.', '.', '0', '.', 'encoded through cashier', '202301180001', '2023-02-21 08:55:26', '2023-07-16 09:31:35');
INSERT INTO `tbl_customers` VALUES ('430', 'Bertillo, M', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-21 10:08:39', '2023-02-21 10:08:39');
INSERT INTO `tbl_customers` VALUES ('431', 'Tangunan', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-21 10:25:38', '2023-02-21 10:25:38');
INSERT INTO `tbl_customers` VALUES ('432', 'Jeongco', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-21 10:30:26', '2023-02-21 10:30:26');
INSERT INTO `tbl_customers` VALUES ('433', 'Dela Cruz, Ernesto', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-21 11:20:34', '2023-02-21 11:20:34');
INSERT INTO `tbl_customers` VALUES ('434', 'Abuan, M', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-21 11:26:14', '2023-02-21 11:26:14');
INSERT INTO `tbl_customers` VALUES ('435', 'Hornada, L', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-21 13:44:08', '2023-02-21 13:44:08');
INSERT INTO `tbl_customers` VALUES ('436', 'Jordan', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-21 16:48:03', '2023-02-21 16:48:03');
INSERT INTO `tbl_customers` VALUES ('437', 'Paclibar, Remrem', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-22 08:34:24', '2023-02-22 08:34:24');
INSERT INTO `tbl_customers` VALUES ('438', 'Gumban, Joel', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-22 09:02:49', '2023-02-22 09:02:49');
INSERT INTO `tbl_customers` VALUES ('439', 'Panggaga', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-22 09:32:27', '2023-02-22 09:32:27');
INSERT INTO `tbl_customers` VALUES ('440', 'Balacanta, Ruben', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-22 10:01:41', '2023-02-22 10:01:41');
INSERT INTO `tbl_customers` VALUES ('441', 'Robles, Jomar', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-22 13:05:34', '2023-02-22 13:05:34');
INSERT INTO `tbl_customers` VALUES ('442', 'Recado', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-22 13:44:27', '2023-02-22 13:44:27');
INSERT INTO `tbl_customers` VALUES ('443', 'Aramba, Aba', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-22 15:25:25', '2023-02-22 15:25:25');
INSERT INTO `tbl_customers` VALUES ('444', 'Alen, C', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-22 17:38:43', '2023-02-22 17:38:43');
INSERT INTO `tbl_customers` VALUES ('445', 'Calonghe', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-22 17:51:20', '2023-02-22 17:51:20');
INSERT INTO `tbl_customers` VALUES ('446', 'Dindo', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-23 06:03:11', '2023-02-23 06:03:11');
INSERT INTO `tbl_customers` VALUES ('447', 'Caparan', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-23 06:45:51', '2023-02-23 06:45:51');
INSERT INTO `tbl_customers` VALUES ('448', 'Cepida', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-23 07:55:17', '2023-02-23 07:55:17');
INSERT INTO `tbl_customers` VALUES ('449', 'Poras, Romeo', 'Pidatan', '', '0', '.', 'encoded through cashier', '', '2023-02-23 08:14:49', '2023-02-23 08:14:49');
INSERT INTO `tbl_customers` VALUES ('450', 'Cerbo, Norlan', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-23 08:23:01', '2023-02-23 08:23:01');
INSERT INTO `tbl_customers` VALUES ('451', 'Sindingan, Paul', '1', '', '0', '.', 'encoded through cashier', '', '2023-02-23 09:15:06', '2023-02-23 09:15:06');
INSERT INTO `tbl_customers` VALUES ('452', 'Casimero', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-23 09:19:43', '2023-02-23 09:19:43');
INSERT INTO `tbl_customers` VALUES ('453', 'Ambida', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-23 09:52:35', '2023-02-23 09:52:35');
INSERT INTO `tbl_customers` VALUES ('454', 'Subayda', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-23 10:57:04', '2023-02-23 10:57:04');
INSERT INTO `tbl_customers` VALUES ('455', 'Publico, Jerry', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-23 11:09:56', '2023-02-23 11:09:56');
INSERT INTO `tbl_customers` VALUES ('456', 'Apinat', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-23 11:58:46', '2023-02-23 11:58:46');
INSERT INTO `tbl_customers` VALUES ('457', 'Parcon, Ariel', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-23 13:29:12', '2023-02-23 13:29:12');
INSERT INTO `tbl_customers` VALUES ('458', 'Adapan, Loverny', 'Pidatan', '.', '0', '09361451737', 'encoded through cashier', '202300600001', '2023-02-23 13:42:39', '2023-10-25 09:35:13');
INSERT INTO `tbl_customers` VALUES ('459', 'BaÃ±as', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-23 15:42:04', '2023-02-23 15:42:04');
INSERT INTO `tbl_customers` VALUES ('460', 'Opiana', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-23 17:19:56', '2023-02-23 17:19:56');
INSERT INTO `tbl_customers` VALUES ('461', 'Peralde', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-24 06:04:32', '2023-02-24 06:04:32');
INSERT INTO `tbl_customers` VALUES ('462', 'CardiÃ±o, Z', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-24 06:10:29', '2023-02-24 06:10:29');
INSERT INTO `tbl_customers` VALUES ('463', 'Miralyn', 'Sabang', '', '0', '.', 'encoded through cashier', '', '2023-02-24 06:51:01', '2023-02-24 06:51:01');
INSERT INTO `tbl_customers` VALUES ('464', 'Barreto', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-24 06:59:27', '2023-02-24 06:59:27');
INSERT INTO `tbl_customers` VALUES ('465', 'Leona, Jerome', 'Malinao', '', '0', '.', 'encoded through cashier', '', '2023-02-24 09:17:04', '2023-02-24 09:17:04');
INSERT INTO `tbl_customers` VALUES ('466', 'Ilisan', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-24 10:37:28', '2023-02-24 10:37:28');
INSERT INTO `tbl_customers` VALUES ('467', 'Lumawag, Rodolfo', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-24 11:14:13', '2023-02-24 11:14:13');
INSERT INTO `tbl_customers` VALUES ('468', 'Cabardo', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-24 11:17:58', '2023-02-24 11:17:58');
INSERT INTO `tbl_customers` VALUES ('469', 'Diane, Sally', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-24 11:39:26', '2023-02-24 11:39:26');
INSERT INTO `tbl_customers` VALUES ('470', 'Cabilla, N', '.', '', '0', 'Cabilla, N', 'encoded through cashier', '', '2023-02-24 12:21:04', '2023-02-24 12:21:04');
INSERT INTO `tbl_customers` VALUES ('471', 'Embudo', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-24 14:50:23', '2023-02-24 14:50:23');
INSERT INTO `tbl_customers` VALUES ('472', 'Lingo, Amy', '.', '.', '0', '.', 'encoded through cashier', '20230177001', '2023-02-24 15:25:42', '2023-11-30 08:12:12');
INSERT INTO `tbl_customers` VALUES ('473', 'Lumawag, Meldie', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-24 16:12:12', '2023-02-24 16:12:12');
INSERT INTO `tbl_customers` VALUES ('474', 'Paragas, Teody', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-25 08:48:49', '2023-02-25 08:48:49');
INSERT INTO `tbl_customers` VALUES ('475', 'Dador', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-25 09:50:20', '2023-02-25 09:50:20');
INSERT INTO `tbl_customers` VALUES ('476', 'Caballo', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-25 10:02:30', '2023-02-25 10:02:30');
INSERT INTO `tbl_customers` VALUES ('477', 'Soltis, J', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-25 10:07:21', '2023-02-25 10:07:21');
INSERT INTO `tbl_customers` VALUES ('478', 'Carredo, R', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-25 10:45:58', '2023-02-25 10:45:58');
INSERT INTO `tbl_customers` VALUES ('479', 'Tamayo, G', '.', '', '0', '1', 'encoded through cashier', '', '2023-02-25 11:03:57', '2023-02-25 11:03:57');
INSERT INTO `tbl_customers` VALUES ('480', 'Daliva', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-25 12:00:50', '2023-02-25 12:00:50');
INSERT INTO `tbl_customers` VALUES ('481', 'Ramba, G', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-25 12:27:42', '2023-02-25 12:27:42');
INSERT INTO `tbl_customers` VALUES ('482', 'Comendador', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-25 13:34:23', '2023-02-25 13:34:23');
INSERT INTO `tbl_customers` VALUES ('483', 'Sanguines, Miram', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-25 13:49:34', '2023-02-25 13:49:34');
INSERT INTO `tbl_customers` VALUES ('484', 'Mortes', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-25 14:50:28', '2023-02-25 14:50:28');
INSERT INTO `tbl_customers` VALUES ('485', 'Llano', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-25 15:07:44', '2023-02-25 15:07:44');
INSERT INTO `tbl_customers` VALUES ('486', 'Palomar, Teodoro', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-26 09:10:02', '2023-02-26 09:10:02');
INSERT INTO `tbl_customers` VALUES ('487', 'Soriano', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-26 09:32:20', '2023-02-26 09:32:20');
INSERT INTO `tbl_customers` VALUES ('488', 'Palomado', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-26 09:34:24', '2023-02-26 09:34:24');
INSERT INTO `tbl_customers` VALUES ('489', 'Mosakato, Jomas', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-26 09:46:52', '2023-02-26 09:46:52');
INSERT INTO `tbl_customers` VALUES ('490', 'Angumbaw, Esmael', '.', '', '0', '..', 'encoded through cashier', '', '2023-02-26 09:53:48', '2023-02-26 09:53:48');
INSERT INTO `tbl_customers` VALUES ('491', 'Espacio, Renante', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-26 11:32:07', '2023-02-26 11:32:07');
INSERT INTO `tbl_customers` VALUES ('492', 'Azagra ', '1', '', '0', '1', 'encoded through cashier', '', '2023-02-26 12:04:23', '2023-02-26 12:04:23');
INSERT INTO `tbl_customers` VALUES ('493', 'Panesarez, Adonis', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-26 13:18:57', '2023-02-26 13:18:57');
INSERT INTO `tbl_customers` VALUES ('494', 'Hernandez', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-26 13:26:54', '2023-02-26 13:26:54');
INSERT INTO `tbl_customers` VALUES ('495', 'Balmores, Rose', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-26 14:13:47', '2023-02-26 14:13:47');
INSERT INTO `tbl_customers` VALUES ('496', 'Maningga', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-27 08:38:21', '2023-02-27 08:38:21');
INSERT INTO `tbl_customers` VALUES ('497', 'Salvacion, Nelida', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-27 08:41:55', '2023-03-14 11:55:08');
INSERT INTO `tbl_customers` VALUES ('498', 'Queda', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-27 09:10:39', '2023-02-27 09:10:39');
INSERT INTO `tbl_customers` VALUES ('499', 'Aguirre', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-27 14:19:18', '2023-02-27 14:19:18');
INSERT INTO `tbl_customers` VALUES ('500', 'Demonteverde, Jonilito', 'Thailand, Banisilan', '.', '0', '09056185519', 'encoded through cashier', '202301000001', '2023-02-27 15:24:18', '2023-07-16 16:44:12');
INSERT INTO `tbl_customers` VALUES ('501', 'Tilagen', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-27 17:13:18', '2023-02-27 17:13:18');
INSERT INTO `tbl_customers` VALUES ('502', 'Laraga', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-28 10:21:41', '2023-02-28 10:21:41');
INSERT INTO `tbl_customers` VALUES ('503', 'Espinosa, John', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-28 10:28:49', '2023-02-28 10:28:49');
INSERT INTO `tbl_customers` VALUES ('504', 'Sobredo', '.', '', '0', '.', 'encoded through cashier', '', '2023-02-28 14:09:53', '2023-02-28 14:09:53');
INSERT INTO `tbl_customers` VALUES ('505', 'Ulama', '.', '', '0', '.', 'encoded through cashier', '', '2023-03-01 15:35:43', '2023-03-01 15:35:43');
INSERT INTO `tbl_customers` VALUES ('506', 'Berbano', '.', '', '0', '.', 'encoded through cashier', '', '2023-03-01 16:05:19', '2023-03-01 16:05:19');
INSERT INTO `tbl_customers` VALUES ('507', 'Pagtulon an, Vilma', '.', '', '0', '.', 'encoded through cashier', '', '2023-03-01 16:58:54', '2023-03-01 16:58:54');
INSERT INTO `tbl_customers` VALUES ('508', 'Halong', '.', '', '0', '.', 'encoded through cashier', '', '2023-03-02 08:16:48', '2023-03-02 08:16:48');
INSERT INTO `tbl_customers` VALUES ('509', 'Sarmiento, Jerome', '.', '', '0', '.', 'encoded through cashier', '', '2023-03-02 10:13:31', '2023-03-02 10:13:31');
INSERT INTO `tbl_customers` VALUES ('510', 'Padernal', '.', '', '0', '.', 'encoded through cashier', '', '2023-03-02 10:40:41', '2023-03-02 10:40:41');
INSERT INTO `tbl_customers` VALUES ('511', 'Paitan, T', '.', '', '0', '.', 'encoded through cashier', '', '2023-03-02 12:25:19', '2023-03-02 12:25:19');
INSERT INTO `tbl_customers` VALUES ('512', 'Amirol, Nora', '.', '', '0', '.', 'encoded through cashier', '', '2023-03-02 15:52:43', '2023-03-02 15:52:43');
INSERT INTO `tbl_customers` VALUES ('513', 'Benidecto ', '.', '', '0', '.', 'encoded through cashier', '', '2023-03-03 11:11:20', '2023-03-03 11:11:20');
INSERT INTO `tbl_customers` VALUES ('514', 'Dalios', '.', '', '0', '.', 'encoded through cashier', '', '2023-03-03 14:55:08', '2023-03-03 14:55:08');
INSERT INTO `tbl_customers` VALUES ('515', 'Rajahmuda, Hassir', 'busaon', '', '0', '.', 'encoded through cashier', '', '2023-03-03 15:39:47', '2023-03-03 15:39:47');
INSERT INTO `tbl_customers` VALUES ('516', 'Balasabas', 'tumbao', '', '0', '.', 'encoded through cashier', '', '2023-03-03 16:29:25', '2023-03-03 16:29:25');
INSERT INTO `tbl_customers` VALUES ('517', 'Gumban, Rhoda', '.', '', '0', '.', 'encoded through cashier', '', '2023-03-04 06:20:52', '2023-03-04 06:20:52');
INSERT INTO `tbl_customers` VALUES ('518', 'Eulogio, Jen', '.', '', '0', '.', 'encoded through cashier', '', '2023-03-04 08:08:47', '2023-03-04 08:08:47');
INSERT INTO `tbl_customers` VALUES ('519', 'Nasher', '.', '', '0', '.', 'encoded through cashier', '', '2023-03-04 11:49:23', '2023-03-04 11:49:23');
INSERT INTO `tbl_customers` VALUES ('520', 'tico', '.', '', '0', '.', 'encoded through cashier', '', '2023-03-04 12:18:04', '2023-03-04 12:18:04');
INSERT INTO `tbl_customers` VALUES ('521', 'Orendo', '.', '', '0', '.', 'encoded through cashier', '', '2023-03-04 12:59:03', '2023-03-04 12:59:03');
INSERT INTO `tbl_customers` VALUES ('522', 'Esporma, Samuel', '.', '', '0', '.', 'encoded through cashier', '', '2023-03-04 15:26:20', '2023-03-04 15:26:20');
INSERT INTO `tbl_customers` VALUES ('523', 'Amihan, Isidro', '.', '', '0', '.', 'encoded through cashier', '', '2023-03-04 16:40:03', '2023-03-04 16:40:03');
INSERT INTO `tbl_customers` VALUES ('524', 'Sobredilla', '.', '', '0', '.', 'encoded through cashier', '', '2023-03-05 10:28:01', '2023-03-05 10:28:01');
INSERT INTO `tbl_customers` VALUES ('525', 'Barcinal, Benjie', '.', '', '0', '.', 'encoded through cashier', '', '2023-03-05 11:09:38', '2023-03-05 11:09:38');
INSERT INTO `tbl_customers` VALUES ('526', 'Domagpi, Roger', '.', '', '0', '.', 'encoded through cashier', '', '2023-03-05 11:45:17', '2023-03-05 11:45:17');
INSERT INTO `tbl_customers` VALUES ('527', 'Lanestosa, Dolores', '.', '', '0', '.', 'encoded through cashier', '', '2023-03-05 16:28:46', '2023-03-05 16:28:46');
INSERT INTO `tbl_customers` VALUES ('528', 'Sandolog, R', '.', '', '0', '.', 'encoded through cashier', '', '2023-03-05 17:02:33', '2023-03-05 17:02:33');
INSERT INTO `tbl_customers` VALUES ('529', 'Madrio', '.', '', '0', '.', 'encoded through cashier', '', '2023-03-06 07:14:14', '2023-03-06 07:14:14');
INSERT INTO `tbl_customers` VALUES ('530', 'Bagnes, Botyog', '.', '', '0', '.', 'encoded through cashier', '', '2023-03-06 10:11:11', '2023-03-06 10:11:11');
INSERT INTO `tbl_customers` VALUES ('531', 'Tadio', '.', '', '0', '...', 'encoded through cashier', '', '2023-03-06 14:01:59', '2023-03-06 14:01:59');
INSERT INTO `tbl_customers` VALUES ('532', 'Banaban, Nestor', '.', '', '0', '.', 'encoded through cashier', '', '2023-03-06 15:09:10', '2023-03-06 15:09:10');
INSERT INTO `tbl_customers` VALUES ('533', 'Balibadlan, ', '.', '', '0', '.', 'encoded through cashier', '', '2023-03-06 15:29:39', '2023-03-06 15:29:39');
INSERT INTO `tbl_customers` VALUES ('534', 'Apura, Romeo', '.', '', '0', '.', 'encoded through cashier', '', '2023-03-06 17:32:11', '2023-03-06 17:32:11');
INSERT INTO `tbl_customers` VALUES ('535', 'Parcon', '.', '', '0', '.', 'encoded through cashier', '', '2023-03-07 09:54:51', '2023-03-07 09:54:51');
INSERT INTO `tbl_customers` VALUES ('536', 'Cerbo, Benjie', '.', '', '0', '.', 'encoded through cashier', '', '2023-03-07 12:22:39', '2023-03-07 12:22:39');
INSERT INTO `tbl_customers` VALUES ('537', 'Tambog, Zaidamen', 'sabang', '', '0', '.', 'encoded through cashier', '', '2023-03-07 12:44:58', '2023-03-07 12:44:58');
INSERT INTO `tbl_customers` VALUES ('538', 'Balabagno, Regina', '.', '', '0', '.', 'encoded through cashier', '', '2023-03-08 09:16:20', '2023-03-08 09:16:20');
INSERT INTO `tbl_customers` VALUES ('539', 'Sarigidan', '.', '', '0', '.', 'encoded through cashier', '', '2023-03-08 10:22:50', '2023-03-08 10:22:50');
INSERT INTO `tbl_customers` VALUES ('540', 'Bago, Sulaiman', '.', '', '0', '.', 'encoded through cashier', '', '2023-03-08 14:02:32', '2023-03-08 14:02:32');
INSERT INTO `tbl_customers` VALUES ('541', 'Paclibar, Ricado', '.', '', '0', '.', 'encoded through cashier', '', '2023-03-09 05:49:24', '2023-03-09 05:49:24');
INSERT INTO `tbl_customers` VALUES ('542', 'Moctar', '.', '', '0', '.', 'encoded through cashier', '', '2023-03-09 11:09:53', '2023-03-09 11:09:53');
INSERT INTO `tbl_customers` VALUES ('543', 'Salinas', '.', '', '0', '.', 'encoded through cashier', '', '2023-03-09 11:42:16', '2023-03-09 11:42:16');
INSERT INTO `tbl_customers` VALUES ('544', 'Avelles', '.', '', '0', '.', 'encoded through cashier', '', '2023-03-09 14:34:31', '2023-03-09 14:34:31');
INSERT INTO `tbl_customers` VALUES ('545', 'Darrel-c/o Aljay', '.', '', '0', '.', 'encoded through cashier', '', '2023-03-09 16:26:35', '2023-03-09 16:26:35');
INSERT INTO `tbl_customers` VALUES ('546', 'Eulogio, ', '.', '', '0', '.', 'encoded through cashier', '', '2023-03-10 06:14:33', '2023-03-10 06:14:33');
INSERT INTO `tbl_customers` VALUES ('547', 'Guitierrez', '.', '', '0', '.', 'encoded through cashier', '', '2023-03-10 10:36:28', '2023-03-10 10:36:28');
INSERT INTO `tbl_customers` VALUES ('548', 'Entera, Aik', '.', '', '0', '.', 'encoded through cashier', '', '2023-03-10 11:41:12', '2023-03-10 11:41:12');
INSERT INTO `tbl_customers` VALUES ('549', 'Dusaran, Darwin', '.', '', '0', '.', 'encoded through cashier', '', '2023-03-10 13:56:55', '2023-03-10 13:56:55');
INSERT INTO `tbl_customers` VALUES ('550', 'Bioseed-Lando', '.', '', '0', '.', 'encoded through cashier', '', '2023-03-10 14:03:16', '2023-03-10 14:03:16');
INSERT INTO `tbl_customers` VALUES ('551', 'Dagin', '.', '', '0', '.', 'encoded through cashier', '', '2023-03-10 14:16:44', '2023-03-10 14:16:44');
INSERT INTO `tbl_customers` VALUES ('552', 'Dagpin', '.', '', '0', '.', 'encoded through cashier', '', '2023-03-10 14:17:12', '2023-03-10 14:17:12');
INSERT INTO `tbl_customers` VALUES ('553', 'Sialana, N', '.', '', '0', '.', 'encoded through cashier', '', '2023-03-11 07:32:20', '2023-03-11 07:32:20');
INSERT INTO `tbl_customers` VALUES ('554', 'Matala, Lailany', '.', '', '0', '.', 'encoded through cashier', '', '2023-03-11 09:58:42', '2023-03-11 09:58:42');
INSERT INTO `tbl_customers` VALUES ('555', 'EreÃ±o', '.', '', '0', '.', 'encoded through cashier', '', '2023-03-11 12:28:36', '2023-03-11 12:28:36');
INSERT INTO `tbl_customers` VALUES ('556', 'Eulatriz', '.', '', '0', '.', 'encoded through cashier', '', '2023-03-11 13:23:11', '2023-03-11 13:23:11');
INSERT INTO `tbl_customers` VALUES ('557', 'Horadoi', '.', '', '0', '.', 'encoded through cashier', '', '2023-03-11 15:59:07', '2023-03-11 15:59:07');
INSERT INTO `tbl_customers` VALUES ('558', 'Montoya', '.', '', '0', '.', 'encoded through cashier', '', '2023-03-12 06:30:20', '2023-03-12 06:30:20');
INSERT INTO `tbl_customers` VALUES ('559', 'Alisasis', '.', '', '0', '.', 'encoded through cashier', '', '2023-03-12 07:00:08', '2023-03-12 07:00:08');
INSERT INTO `tbl_customers` VALUES ('560', 'Soliva', '.', '', '0', '.', 'encoded through cashier', '', '2023-03-12 09:43:05', '2023-03-12 09:43:05');
INSERT INTO `tbl_customers` VALUES ('561', 'Marco', '.', '', '0', '.', 'encoded through cashier', '', '2023-03-12 11:18:27', '2023-03-12 11:18:27');
INSERT INTO `tbl_customers` VALUES ('562', 'Abuan, J', '.', '', '0', '.', 'encoded through cashier', '', '2023-03-12 11:33:02', '2023-03-12 11:33:02');
INSERT INTO `tbl_customers` VALUES ('563', 'Barsanas', '.', '', '0', '.', 'encoded through cashier', '', '2023-03-12 13:47:27', '2023-03-12 13:47:27');
INSERT INTO `tbl_customers` VALUES ('564', 'Caraca', '.', '', '0', '.', 'encoded through cashier', '', '2023-03-12 13:50:31', '2023-03-12 13:50:31');
INSERT INTO `tbl_customers` VALUES ('565', 'Afable, Helen', '.', '', '0', '.', 'encoded through cashier', '', '2023-03-12 14:17:54', '2023-03-12 14:17:54');
INSERT INTO `tbl_customers` VALUES ('566', 'Balmores, Dennis', '.', '', '0', '.', 'encoded through cashier', '', '2023-03-13 09:27:09', '2023-03-13 09:27:09');
INSERT INTO `tbl_customers` VALUES ('567', 'Reyna, Rony', '.', '', '0', '.', 'encoded through cashier', '', '2023-03-13 09:30:28', '2023-03-13 09:30:28');
INSERT INTO `tbl_customers` VALUES ('568', 'Caballero', '.', '', '0', '.', 'encoded through cashier', '', '2023-03-13 14:17:21', '2023-03-13 14:17:21');
INSERT INTO `tbl_customers` VALUES ('569', 'Altea', '.', '', '0', '.', 'encoded through cashier', '', '2023-03-14 08:37:53', '2023-03-14 08:37:53');
INSERT INTO `tbl_customers` VALUES ('570', 'Caro, Benie', '.', '', '0', '.', 'encoded through cashier', '', '2023-03-14 08:46:31', '2023-03-14 08:46:31');
INSERT INTO `tbl_customers` VALUES ('571', 'Caduyac', '.', '', '0', '.', 'encoded through cashier', '', '2023-03-14 09:29:14', '2023-03-14 09:29:14');
INSERT INTO `tbl_customers` VALUES ('572', 'Masabpi', '.', '', '0', '.', 'encoded through cashier', '', '2023-03-14 11:20:54', '2023-03-14 11:20:54');
INSERT INTO `tbl_customers` VALUES ('573', 'Portillo', '.', '', '0', '.', 'encoded through cashier', '', '2023-03-14 11:25:22', '2023-03-14 11:25:55');
INSERT INTO `tbl_customers` VALUES ('574', 'Roquillo', '.', '', '0', '.', 'encoded through cashier', '', '2023-03-14 11:49:20', '2023-03-14 11:49:20');
INSERT INTO `tbl_customers` VALUES ('575', 'Ronquillo', '.', '', '0', '.', 'encoded through cashier', '', '2023-03-14 11:50:30', '2023-03-14 11:50:30');
INSERT INTO `tbl_customers` VALUES ('576', 'Vilbar', '.', '', '0', '.', 'encoded through cashier', '', '2023-03-14 16:08:51', '2023-03-14 16:08:51');
INSERT INTO `tbl_customers` VALUES ('577', 'De Ala', '.', '', '0', '.', 'encoded through cashier', '', '2023-03-15 10:40:26', '2023-03-15 10:40:26');
INSERT INTO `tbl_customers` VALUES ('578', 'Tagakay', '.', '', '0', '.', 'encoded through cashier', '', '2023-03-15 13:35:30', '2023-03-15 13:35:30');
INSERT INTO `tbl_customers` VALUES ('579', 'Catang2x', '1', '', '0', '11', 'encoded through cashier', '', '2023-03-16 12:54:50', '2023-03-16 12:54:50');
INSERT INTO `tbl_customers` VALUES ('580', 'Pelaez', '.', '', '0', '.', 'encoded through cashier', '', '2023-03-17 08:52:52', '2023-03-17 08:52:52');
INSERT INTO `tbl_customers` VALUES ('581', 'Disumnong', '.', '', '0', '.', 'encoded through cashier', '', '2023-03-17 09:15:05', '2023-03-17 09:15:05');
INSERT INTO `tbl_customers` VALUES ('582', 'Tabuga', '.', '', '0', '.', 'encoded through cashier', '', '2023-03-17 12:37:21', '2023-03-17 12:37:21');
INSERT INTO `tbl_customers` VALUES ('583', 'Eskil', '.', '', '0', '.', 'encoded through cashier', '', '2023-03-17 16:56:43', '2023-03-17 16:56:43');
INSERT INTO `tbl_customers` VALUES ('584', 'Lawan, Sultan', '.', '', '0', '.', 'encoded through cashier', '', '2023-03-18 10:06:12', '2023-03-18 10:06:12');
INSERT INTO `tbl_customers` VALUES ('585', 'Bagay, Susan', '.', '', '0', '.', 'encoded through cashier', '', '2023-03-18 14:35:01', '2023-03-18 14:35:01');
INSERT INTO `tbl_customers` VALUES ('586', 'Manongkarang, Jennfer- Nasher', '1', '', '0', '1', 'encoded through cashier', '', '2023-03-18 16:46:04', '2023-03-18 16:46:04');
INSERT INTO `tbl_customers` VALUES ('587', 'isla, Herman', '.', '', '0', '.', 'encoded through cashier', '', '2023-03-19 08:51:24', '2023-03-19 08:51:24');
INSERT INTO `tbl_customers` VALUES ('588', 'Rutor', '.', '', '0', '.', 'encoded through cashier', '', '2023-03-19 09:44:56', '2023-03-19 09:44:56');
INSERT INTO `tbl_customers` VALUES ('589', 'Solera', '.', '', '0', '.', 'encoded through cashier', '', '2023-03-19 11:41:37', '2023-03-19 11:41:37');
INSERT INTO `tbl_customers` VALUES ('590', 'Isugon', '.', '', '0', '.', 'encoded through cashier', '', '2023-03-19 13:16:54', '2023-03-19 13:16:54');
INSERT INTO `tbl_customers` VALUES ('591', 'Maygay, Boy', '.', '', '0', '.', 'encoded through cashier', '', '2023-03-19 16:18:15', '2023-03-19 16:18:15');
INSERT INTO `tbl_customers` VALUES ('592', 'Capanang, Nonong', 'Banisilan', '', '0', '.', '.', '', '2023-03-20 06:11:33', '2023-03-20 06:11:33');
INSERT INTO `tbl_customers` VALUES ('593', 'albasite', '.', '', '0', '.', 'encoded through cashier', '', '2023-03-21 07:03:34', '2023-03-21 07:03:34');
INSERT INTO `tbl_customers` VALUES ('594', 'Ebrono, Enol', '.', '', '0', '1', 'encoded through cashier', '', '2023-03-21 08:52:08', '2023-03-21 08:52:08');
INSERT INTO `tbl_customers` VALUES ('595', 'Lamigan', '.', '', '0', '.', 'encoded through cashier', '', '2023-03-21 09:07:01', '2023-03-21 09:07:01');
INSERT INTO `tbl_customers` VALUES ('596', 'Liza A', '.', '', '0', '.', 'encoded through cashier', '', '2023-03-21 09:35:13', '2023-03-21 09:35:13');
INSERT INTO `tbl_customers` VALUES ('597', 'Ricopuerto', '.', '', '0', '.', 'encoded through cashier', '', '2023-03-21 09:59:27', '2023-03-21 09:59:27');
INSERT INTO `tbl_customers` VALUES ('598', 'Cadali', '.', '', '0', '.', 'encoded through cashier', '', '2023-03-21 15:13:20', '2023-03-21 15:13:20');
INSERT INTO `tbl_customers` VALUES ('599', 'Cadali, Badmudin', '.', '', '0', '.', 'encoded through cashier', '', '2023-03-21 15:14:10', '2023-03-21 15:14:10');
INSERT INTO `tbl_customers` VALUES ('600', 'Usman', '.', '', '0', '.', 'encoded through cashier', '', '2023-03-21 15:59:04', '2023-03-21 15:59:04');
INSERT INTO `tbl_customers` VALUES ('601', 'Allado, John Raymund', '.', '.', '0', '.', 'encoded through cashier', '202300950001', '2023-03-21 16:05:58', '2023-07-16 16:39:17');
INSERT INTO `tbl_customers` VALUES ('602', 'Barrion, Necano', '.', '', '0', '.', 'encoded through cashier', '', '2023-03-22 08:48:05', '2023-03-22 08:48:05');
INSERT INTO `tbl_customers` VALUES ('603', 'Barreto, Jhonny', '.', '', '0', '.', 'encoded through cashier', '', '2023-03-22 09:48:09', '2023-03-22 09:48:09');
INSERT INTO `tbl_customers` VALUES ('604', 'Ricaza', '.', '', '0', '.', 'encoded through cashier', '', '2023-03-22 13:23:06', '2023-03-22 13:23:06');
INSERT INTO `tbl_customers` VALUES ('605', 'Laungayan, Jerome', '.', '', '0', '.', 'encoded through cashier', '', '2023-03-22 14:06:49', '2023-03-22 14:06:49');
INSERT INTO `tbl_customers` VALUES ('606', 'Nabor', '.', '', '0', '.', 'encoded through cashier', '', '2023-03-22 14:38:58', '2023-03-22 14:38:58');
INSERT INTO `tbl_customers` VALUES ('607', 'Bravo', '.', '', '0', '.', 'encoded through cashier', '', '2023-03-22 14:44:25', '2023-03-22 14:44:25');
INSERT INTO `tbl_customers` VALUES ('608', 'Tejero', '.', '', '0', '.', 'encoded through cashier', '', '2023-03-22 14:50:47', '2023-03-22 14:50:47');
INSERT INTO `tbl_customers` VALUES ('609', 'Monje', '.', '', '0', '.', 'encoded through cashier', '', '2023-03-24 10:11:29', '2023-03-24 10:11:29');
INSERT INTO `tbl_customers` VALUES ('610', 'Malinao', '.', '', '0', '.', 'encoded through cashier', '', '2023-03-26 07:17:59', '2023-03-26 07:17:59');
INSERT INTO `tbl_customers` VALUES ('611', 'Diane, Banie', '.', '', '0', '.', 'encoded through cashier', '', '2023-03-26 07:57:27', '2023-03-26 07:57:27');
INSERT INTO `tbl_customers` VALUES ('612', 'Barrion, Evangeline', '.', '', '0', '.', 'encoded through cashier', '', '2023-03-26 07:58:45', '2023-03-26 07:58:45');
INSERT INTO `tbl_customers` VALUES ('613', 'Soberano, Gege', '.', '', '0', '.', 'encoded through cashier', '', '2023-03-26 10:26:50', '2023-03-26 10:26:50');
INSERT INTO `tbl_customers` VALUES ('614', 'Aramba, Abdullah', '.', '', '0', '.', 'encoded through cashier', '', '2023-03-26 11:54:47', '2023-03-26 11:54:47');
INSERT INTO `tbl_customers` VALUES ('615', 'Mama Ging', '.', '', '0', '.', 'encoded through cashier', '', '2023-03-26 13:36:16', '2023-03-26 13:36:16');
INSERT INTO `tbl_customers` VALUES ('616', 'Ondoy', '.', '', '0', '.', 'encoded through cashier', '', '2023-03-26 17:59:51', '2023-03-26 17:59:51');
INSERT INTO `tbl_customers` VALUES ('617', 'Barotas, Long2x', '.', '', '0', '.', 'encoded through cashier', '', '2023-03-27 05:40:16', '2023-03-27 05:40:16');
INSERT INTO `tbl_customers` VALUES ('618', 'San Nicolas', '.', '', '0', '.', 'encoded through cashier', '', '2023-03-27 09:59:20', '2023-03-27 09:59:20');
INSERT INTO `tbl_customers` VALUES ('619', 'Sagala', '.', '', '0', '.', 'encoded through cashier', '', '2023-03-27 11:00:31', '2023-03-27 11:00:31');
INSERT INTO `tbl_customers` VALUES ('620', 'Cabilla, Monica', '.', '', '0', '.', 'encoded through cashier', '', '2023-03-27 11:47:46', '2023-03-27 11:47:46');
INSERT INTO `tbl_customers` VALUES ('621', 'Alarilya', '.', '', '0', '.', 'encoded through cashier', '', '2023-03-27 12:30:09', '2023-03-27 12:30:09');
INSERT INTO `tbl_customers` VALUES ('622', 'Siodena, Arnel', '.', '', '0', '.', 'encoded through cashier', '', '2023-03-27 16:23:57', '2023-03-27 16:23:57');
INSERT INTO `tbl_customers` VALUES ('623', 'Parcon, Lorna', '.', '', '0', '.', 'encoded through cashier', '', '2023-03-28 09:57:01', '2023-03-28 09:57:01');
INSERT INTO `tbl_customers` VALUES ('624', 'Mamacan', '.', '', '0', '.', 'encoded through cashier', '', '2023-03-28 13:42:17', '2023-03-28 13:42:17');
INSERT INTO `tbl_customers` VALUES ('625', 'Bendoval', 'Carugmanan', '', '0', '.', 'encoded through cashier', '', '2023-03-29 11:52:35', '2023-03-29 11:52:35');
INSERT INTO `tbl_customers` VALUES ('626', 'Samilo, Rammel', '.', '', '0', '.', 'encoded through cashier', '', '2023-03-29 12:36:44', '2023-03-29 12:36:44');
INSERT INTO `tbl_customers` VALUES ('627', 'Dulatre', '.', '', '0', '.', 'encoded through cashier', '', '2023-03-29 13:22:23', '2023-03-29 13:22:23');
INSERT INTO `tbl_customers` VALUES ('628', 'Golilao, Joesy', '.', '', '0', '09981989492', 'encoded through cashier', '', '2023-03-31 09:26:29', '2023-03-31 09:26:29');
INSERT INTO `tbl_customers` VALUES ('629', 'Custodio', '.', '', '0', '.', 'encoded through cashier', '', '2023-03-31 11:16:37', '2023-03-31 11:16:37');
INSERT INTO `tbl_customers` VALUES ('630', 'Domado', '.', '', '0', '.', 'encoded through cashier', '', '2023-03-31 14:04:26', '2023-03-31 14:04:26');
INSERT INTO `tbl_customers` VALUES ('631', 'Parcon, Felix', '.', '', '0', '.', 'encoded through cashier', '', '2023-04-01 06:01:19', '2023-04-01 06:01:19');
INSERT INTO `tbl_customers` VALUES ('632', 'Basaltan', '.', '', '0', '.', 'encoded through cashier', '', '2023-04-01 06:15:41', '2023-04-01 06:15:41');
INSERT INTO `tbl_customers` VALUES ('633', 'Galdo', '.', '', '0', '.', 'encoded through cashier', '', '2023-04-01 17:10:07', '2023-04-01 17:10:07');
INSERT INTO `tbl_customers` VALUES ('634', 'Gigan, Rex', '.', '', '0', '.', 'encoded through cashier', '', '2023-04-02 06:33:42', '2023-04-02 06:33:42');
INSERT INTO `tbl_customers` VALUES ('635', 'midag', '.', '', '0', '.', 'encoded through cashier', '', '2023-04-02 10:01:08', '2023-04-02 10:01:08');
INSERT INTO `tbl_customers` VALUES ('636', 'Galecto', '.', '', '0', '.', 'encoded through cashier', '', '2023-04-02 11:52:05', '2023-04-02 11:52:05');
INSERT INTO `tbl_customers` VALUES ('637', 'Tarutawan', '.', '', '0', '.', 'encoded through cashier', '', '2023-04-03 11:14:24', '2023-04-03 11:14:24');
INSERT INTO `tbl_customers` VALUES ('638', 'Ampatua, Cairodin', '.', '', '0', '.', 'encoded through cashier', '', '2023-04-03 14:47:05', '2023-04-03 14:47:05');
INSERT INTO `tbl_customers` VALUES ('639', 'Gicole, Elgin', '.', '', '0', '.', 'encoded through cashier', '', '2023-04-03 15:36:25', '2023-04-03 15:36:25');
INSERT INTO `tbl_customers` VALUES ('640', 'polinas', '.', '', '0', '.', 'encoded through cashier', '', '2023-04-04 10:00:57', '2023-04-04 10:00:57');
INSERT INTO `tbl_customers` VALUES ('641', 'Almenares', '.', '', '0', '.', 'encoded through cashier', '', '2023-04-04 12:30:21', '2023-04-04 12:30:21');
INSERT INTO `tbl_customers` VALUES ('642', 'Eclipse', '.', '', '0', '.', 'encoded through cashier', '', '2023-04-05 07:59:43', '2023-04-05 07:59:43');
INSERT INTO `tbl_customers` VALUES ('643', 'Salangan, Rasmiyah', '.', '', '0', '.', 'encoded through cashier', '', '2023-04-05 08:52:05', '2023-04-05 08:52:05');
INSERT INTO `tbl_customers` VALUES ('644', 'Salveron', '.', '', '0', '.', 'encoded through cashier', '', '2023-04-05 13:29:42', '2023-04-05 13:29:42');
INSERT INTO `tbl_customers` VALUES ('645', 'Rapista', '.', '', '0', '.', 'encoded through cashier', '', '2023-04-08 06:05:46', '2023-04-08 06:05:46');
INSERT INTO `tbl_customers` VALUES ('646', 'Balacasi, Alex', '.', '', '0', '.', 'encoded through cashier', '', '2023-04-08 09:16:53', '2023-04-08 09:16:53');
INSERT INTO `tbl_customers` VALUES ('647', 'Espinosa, Lily', '.', '', '0', '.', 'encoded through cashier', '', '2023-04-08 10:22:21', '2023-04-08 10:22:21');
INSERT INTO `tbl_customers` VALUES ('648', 'Villarmosa', '.', '', '0', '.', 'encoded through cashier', '', '2023-04-08 12:08:58', '2023-04-08 12:08:58');
INSERT INTO `tbl_customers` VALUES ('649', 'Palmaira', '.', '', '0', '.', 'encoded through cashier', '', '2023-04-08 14:51:42', '2023-04-08 14:51:42');
INSERT INTO `tbl_customers` VALUES ('650', 'Gregorio', '.', '', '0', '.', 'encoded through cashier', '', '2023-04-09 07:25:50', '2023-04-09 07:25:50');
INSERT INTO `tbl_customers` VALUES ('651', 'Saricaya', '.', '', '0', '.', 'encoded through cashier', '', '2023-04-09 09:21:47', '2023-04-09 09:21:47');
INSERT INTO `tbl_customers` VALUES ('652', 'Monigro', '.', '', '0', '..', 'encoded through cashier', '', '2023-04-09 10:19:17', '2023-04-09 10:19:17');
INSERT INTO `tbl_customers` VALUES ('653', 'Gicole', '.', '', '0', '.', 'encoded through cashier', '', '2023-04-09 10:29:29', '2023-04-09 10:29:29');
INSERT INTO `tbl_customers` VALUES ('654', 'Pagador', '.', '', '0', '.', 'encoded through cashier', '', '2023-04-09 11:41:55', '2023-04-09 11:41:55');
INSERT INTO `tbl_customers` VALUES ('655', 'Calonge', '.', '', '0', '.', 'encoded through cashier', '', '2023-04-10 08:20:28', '2023-04-10 08:20:28');
INSERT INTO `tbl_customers` VALUES ('656', 'Java, Jorelyn', '.', '', '0', '.', 'encoded through cashier', '', '2023-04-10 17:36:14', '2023-04-10 17:36:14');
INSERT INTO `tbl_customers` VALUES ('657', 'Cosain', '.', '', '0', '.', 'encoded through cashier', '', '2023-04-11 15:46:32', '2023-04-11 15:46:32');
INSERT INTO `tbl_customers` VALUES ('658', 'dabalus', '.', '', '0', '.', 'encoded through cashier', '', '2023-04-12 12:22:59', '2023-04-12 12:22:59');
INSERT INTO `tbl_customers` VALUES ('659', 'Tags Tapa', '.', '', '0', '.', 'encoded through cashier', '', '2023-04-12 13:09:34', '2023-04-12 13:09:34');
INSERT INTO `tbl_customers` VALUES ('660', 'Paredes', '.', '', '0', '.', 'encoded through cashier', '', '2023-04-13 08:58:00', '2023-04-13 08:58:00');
INSERT INTO `tbl_customers` VALUES ('661', 'Patano', '.', '', '0', '.', 'encoded through cashier', '', '2023-04-13 15:49:46', '2023-04-13 15:49:46');
INSERT INTO `tbl_customers` VALUES ('662', 'Majan', '.', '', '0', '.', 'encoded through cashier', '', '2023-04-15 06:04:43', '2023-04-15 06:04:43');
INSERT INTO `tbl_customers` VALUES ('663', 'Miranda', '.', '', '0', '.', 'encoded through cashier', '', '2023-04-16 10:41:31', '2023-04-16 10:41:31');
INSERT INTO `tbl_customers` VALUES ('664', 'Gutsirez', '.', '', '0', '.', 'encoded through cashier', '', '2023-04-16 14:50:16', '2023-04-16 14:50:16');
INSERT INTO `tbl_customers` VALUES ('665', 'Caro, Diday', '.', '', '0', '.', 'encoded through cashier', '', '2023-04-17 14:42:33', '2023-04-17 14:42:33');
INSERT INTO `tbl_customers` VALUES ('666', 'Garcia', 'Pinamulaan', '', '0', '.', 'encoded through cashier', '', '2023-04-18 12:03:29', '2023-04-18 12:03:29');
INSERT INTO `tbl_customers` VALUES ('667', 'Tiko', '.', '', '0', '.', 'encoded through cashier', '', '2023-04-18 12:09:32', '2023-04-18 12:09:32');
INSERT INTO `tbl_customers` VALUES ('668', 'Engr', '.', '', '0', '.', 'encoded through cashier', '', '2023-04-18 15:58:29', '2023-04-18 15:58:29');
INSERT INTO `tbl_customers` VALUES ('669', 'Dulangon', '.', '', '0', '.', 'encoded through cashier', '', '2023-04-18 16:18:11', '2023-04-18 16:18:11');
INSERT INTO `tbl_customers` VALUES ('670', 'Palmes, T', '.', '', '0', '.', 'encoded through cashier', '', '2023-04-19 10:19:14', '2023-04-19 10:19:14');
INSERT INTO `tbl_customers` VALUES ('671', 'Salahudin', '.', '', '0', '1', 'encoded through cashier', '', '2023-04-19 16:22:12', '2023-04-19 16:22:12');
INSERT INTO `tbl_customers` VALUES ('672', 'Belonio, Ronald', 'Banisilan', '', '0', '.', '.', '', '2023-04-20 07:19:21', '2023-04-20 07:19:21');
INSERT INTO `tbl_customers` VALUES ('673', 'Salangan, A', '.', '', '0', '.', 'encoded through cashier', '', '2023-04-20 11:26:54', '2023-04-20 11:26:54');
INSERT INTO `tbl_customers` VALUES ('674', 'Palma', '.', '', '0', '.', 'encoded through cashier', '', '2023-04-20 13:43:11', '2023-04-20 13:43:11');
INSERT INTO `tbl_customers` VALUES ('675', 'Yudo', '.', '', '0', '.', 'encoded through cashier', '', '2023-04-20 15:48:22', '2023-04-20 15:48:22');
INSERT INTO `tbl_customers` VALUES ('676', 'Jebulan', '.', '', '0', '.', 'encoded through cashier', '', '2023-04-21 09:30:11', '2023-04-21 09:30:11');
INSERT INTO `tbl_customers` VALUES ('677', 'Butig', '.', '', '0', '.', 'encoded through cashier', '', '2023-04-21 10:02:19', '2023-04-21 10:02:19');
INSERT INTO `tbl_customers` VALUES ('678', 'Gonzales', '.', '', '0', '.', 'encoded through cashier', '', '2023-04-22 05:40:40', '2023-04-22 05:40:40');
INSERT INTO `tbl_customers` VALUES ('679', 'Capuyan, Leo', '.', '', '0', '.', 'encoded through cashier', '', '2023-04-22 05:57:40', '2023-04-22 05:57:40');
INSERT INTO `tbl_customers` VALUES ('680', 'Paquingan, L', '.', '', '0', '.', 'encoded through cashier', '', '2023-04-22 09:22:51', '2023-04-22 09:22:51');
INSERT INTO `tbl_customers` VALUES ('681', 'Altimo, Joseph', '.', '', '0', '.', 'encoded through cashier', '', '2023-04-22 09:36:47', '2023-04-22 09:36:47');
INSERT INTO `tbl_customers` VALUES ('682', 'Guilaran,Edie', '.', '', '0', '.', 'encoded through cashier', '', '2023-04-22 10:05:36', '2023-04-22 10:05:36');
INSERT INTO `tbl_customers` VALUES ('683', 'Pomado, A', '.', '', '0', '.', 'encoded through cashier', '', '2023-04-22 11:42:23', '2023-04-22 11:42:23');
INSERT INTO `tbl_customers` VALUES ('684', 'Villareal, Richard', '.', '', '0', '.', 'encoded through cashier', '', '2023-04-22 11:44:10', '2023-04-22 11:44:10');
INSERT INTO `tbl_customers` VALUES ('685', 'Aguilar, Roy', '.', '', '0', '.', 'encoded through cashier', '', '2023-04-22 17:26:11', '2023-04-22 17:26:11');
INSERT INTO `tbl_customers` VALUES ('686', 'Pedredo', '.', '', '0', '.', 'encoded through cashier', '', '2023-04-23 08:13:16', '2023-04-23 08:13:16');
INSERT INTO `tbl_customers` VALUES ('687', 'Sobretodo', '.', '', '0', '.', 'encoded through cashier', '', '2023-04-23 08:54:45', '2023-04-23 08:54:45');
INSERT INTO `tbl_customers` VALUES ('688', 'Hongko, J', '.', '', '0', '.', 'encoded through cashier', '', '2023-04-24 12:11:55', '2023-04-24 12:11:55');
INSERT INTO `tbl_customers` VALUES ('689', 'Tucod', '.', '', '0', '.', 'encoded through cashier', '', '2023-04-24 12:43:39', '2023-04-24 12:43:39');
INSERT INTO `tbl_customers` VALUES ('690', 'Lumambas, Norma', '.', '', '0', '.', 'encoded through cashier', '', '2023-04-25 08:07:42', '2023-04-25 08:07:42');
INSERT INTO `tbl_customers` VALUES ('691', 'Berna', '.', '', '0', '.', 'encoded through cashier', '', '2023-04-25 11:34:12', '2023-04-25 11:34:12');
INSERT INTO `tbl_customers` VALUES ('692', 'Beladas', '.', '', '0', '.', 'encoded through cashier', '', '2023-04-25 12:13:04', '2023-04-25 12:13:04');
INSERT INTO `tbl_customers` VALUES ('693', 'Garcia, Ivy', '.', '', '0', '.', 'encoded through cashier', '', '2023-04-25 13:54:53', '2023-04-25 13:54:53');
INSERT INTO `tbl_customers` VALUES ('694', 'Milan, Altimo', '.', '', '0', '.', 'encoded through cashier', '', '2023-04-25 14:00:46', '2023-04-25 14:00:46');
INSERT INTO `tbl_customers` VALUES ('695', 'Maamor, R', '.', '', '0', '.', 'encoded through cashier', '', '2023-04-25 14:18:42', '2023-04-25 14:18:42');
INSERT INTO `tbl_customers` VALUES ('696', 'Maamor, Fatima', '.', '', '0', '.', 'encoded through cashier', '', '2023-04-25 14:51:28', '2023-04-25 14:51:28');
INSERT INTO `tbl_customers` VALUES ('697', 'Camarista, Marisa', '.', '', '0', '.', 'encoded through cashier', '', '2023-04-25 15:05:06', '2023-04-25 15:05:06');
INSERT INTO `tbl_customers` VALUES ('698', 'Gregorio, Armando', '.', '', '0', '.', 'encoded through cashier', '', '2023-04-25 16:13:08', '2023-04-25 16:13:08');
INSERT INTO `tbl_customers` VALUES ('699', 'Kalik', '.', '', '0', '.', 'encoded through cashier', '', '2023-04-27 10:43:14', '2023-04-27 10:43:14');
INSERT INTO `tbl_customers` VALUES ('700', 'Saic, K', '.', '', '0', '.', 'encoded through cashier', '', '2023-04-27 15:02:55', '2023-04-27 15:02:55');
INSERT INTO `tbl_customers` VALUES ('701', 'Bayarin', '.', '', '0', '.', 'encoded through cashier', '', '2023-04-28 08:57:44', '2023-04-28 08:57:44');
INSERT INTO `tbl_customers` VALUES ('702', 'Cabilo', '.', '', '0', '.', 'encoded through cashier', '', '2023-04-28 09:57:16', '2023-04-28 09:57:16');
INSERT INTO `tbl_customers` VALUES ('703', 'Ganuhay', '.', '', '0', '.', 'encoded through cashier', '', '2023-05-01 11:20:18', '2023-05-01 11:20:18');
INSERT INTO `tbl_customers` VALUES ('704', 'Bioseed- Kim', '.', '', '0', '.', 'encoded through cashier', '', '2023-05-02 09:42:40', '2023-05-02 09:42:40');
INSERT INTO `tbl_customers` VALUES ('705', 'Tamayo, Ronald', '.', '', '0', '.', 'encoded through cashier', '', '2023-05-02 11:51:45', '2023-05-02 11:51:45');
INSERT INTO `tbl_customers` VALUES ('706', 'Guimba', '.', '', '0', '.', 'encoded through cashier', '', '2023-05-03 12:42:17', '2023-05-03 12:42:17');
INSERT INTO `tbl_customers` VALUES ('707', 'Sarita', '.', '', '0', '.', 'encoded through cashier', '', '2023-05-05 10:16:21', '2023-05-05 10:16:21');
INSERT INTO `tbl_customers` VALUES ('708', 'Dinampo', '1', '', '0', '1', 'encoded through cashier', '', '2023-05-06 14:26:06', '2023-05-06 14:26:06');
INSERT INTO `tbl_customers` VALUES ('709', 'Jude-Syngenta', '.', '', '0', '.', 'encoded through cashier', '', '2023-05-10 06:53:36', '2023-05-10 06:53:36');
INSERT INTO `tbl_customers` VALUES ('710', 'Jordan, Salvador', '.', '', '0', '.', 'encoded through cashier', '', '2023-05-10 16:46:43', '2023-05-10 16:46:43');
INSERT INTO `tbl_customers` VALUES ('711', 'Aluyodan, Kalil', 'Sitio Guiling, Pedatan', '.', '0', '09129224025', 'encoded through cashier', '202300990001', '2023-05-14 14:09:00', '2023-07-16 16:42:46');
INSERT INTO `tbl_customers` VALUES ('712', 'Serue, Boy', '.', '', '0', '.', 'encoded through cashier', '', '2023-05-14 16:52:33', '2023-05-14 16:52:33');
INSERT INTO `tbl_customers` VALUES ('713', 'Balacase, Irene', '.', '.', '0', '.', 'encoded through cashier', '202301060001', '2023-05-15 07:31:53', '2023-07-20 18:14:02');
INSERT INTO `tbl_customers` VALUES ('714', 'Gantalao, Arlene', '.', '', '0', '.', 'encoded through cashier', '', '2023-05-15 15:45:36', '2023-05-15 15:45:36');
INSERT INTO `tbl_customers` VALUES ('715', 'Cepeda', '.', '', '0', '.', 'encoded through cashier', '', '2023-05-16 11:28:02', '2023-05-16 11:28:02');
INSERT INTO `tbl_customers` VALUES ('716', 'Estigoy, June', '.', '', '0', '.', 'encoded through cashier', '', '2023-05-16 13:01:10', '2023-05-16 13:01:10');
INSERT INTO `tbl_customers` VALUES ('717', 'Cailing', '.', '', '0', '.', 'encoded through cashier', '', '2023-05-18 12:40:17', '2023-05-18 12:40:17');
INSERT INTO `tbl_customers` VALUES ('718', 'Saldo', '.', '', '0', '.', 'encoded through cashier', '', '2023-05-19 13:10:42', '2023-05-19 13:10:42');
INSERT INTO `tbl_customers` VALUES ('719', 'Jardinico, Luz', '.', '', '0', '.', 'encoded through cashier', '', '2023-05-20 09:17:57', '2023-05-20 09:17:57');
INSERT INTO `tbl_customers` VALUES ('720', 'Barcenas, Victorino', '.', '', '0', '.', 'encoded through cashier', '', '2023-05-20 09:22:23', '2023-05-20 09:22:23');
INSERT INTO `tbl_customers` VALUES ('721', 'Calledo, Ruben', '.', '', '0', '.', 'encoded through cashier', '', '2023-05-20 15:24:42', '2023-05-20 15:24:42');
INSERT INTO `tbl_customers` VALUES ('722', 'Sanyagan', '.', '', '0', '.', 'encoded through cashier', '', '2023-05-21 08:56:37', '2023-05-21 08:56:37');
INSERT INTO `tbl_customers` VALUES ('723', 'Tamay, Norodin', '.', '', '0', '.', 'encoded through cashier', '', '2023-05-22 08:49:15', '2023-05-22 08:49:15');
INSERT INTO `tbl_customers` VALUES ('724', 'AbaÃ±el', '.', '', '0', '.', 'encoded through cashier', '', '2023-05-22 08:53:18', '2023-05-22 08:53:18');
INSERT INTO `tbl_customers` VALUES ('725', 'Tabisa', '.', '', '0', '.', 'encoded through cashier', '', '2023-05-22 14:45:13', '2023-05-22 14:45:13');
INSERT INTO `tbl_customers` VALUES ('726', 'SopeÃ±a', '.', '', '0', '.', 'encoded through cashier', '', '2023-05-23 11:39:10', '2023-05-23 11:39:10');
INSERT INTO `tbl_customers` VALUES ('727', 'Ballesta', '.', '', '0', '.', 'encoded through cashier', '', '2023-05-23 16:19:12', '2023-05-23 16:19:12');
INSERT INTO `tbl_customers` VALUES ('728', 'Ampuan', '.', '', '0', '.', 'encoded through cashier', '', '2023-05-24 11:37:56', '2023-05-24 11:37:56');
INSERT INTO `tbl_customers` VALUES ('729', 'Omar, S', '.', '', '0', '.', 'encoded through cashier', '', '2023-05-25 10:46:31', '2023-05-25 10:46:31');
INSERT INTO `tbl_customers` VALUES ('730', 'Frogellia, Jun2x', '1', '', '0', '.', 'encoded through cashier', '', '2023-05-27 17:15:33', '2023-05-27 17:15:33');
INSERT INTO `tbl_customers` VALUES ('731', 'Delco', '.', '', '0', '.', 'encoded through cashier', '', '2023-05-28 16:01:56', '2023-05-28 16:01:56');
INSERT INTO `tbl_customers` VALUES ('732', 'Punsalan', '.', '', '0', '1', 'encoded through cashier', '', '2023-05-29 07:43:43', '2023-05-29 07:43:43');
INSERT INTO `tbl_customers` VALUES ('733', 'Lopez, A', '.', '', '0', '.', 'encoded through cashier', '', '2023-05-29 08:23:22', '2023-05-29 08:23:22');
INSERT INTO `tbl_customers` VALUES ('734', 'Oni', '.', '', '0', '.', 'encoded through cashier', '', '2023-05-29 09:11:31', '2023-05-29 09:11:31');
INSERT INTO `tbl_customers` VALUES ('735', 'Celestra, Laila', 'Pantar', '', '0', '.', 'encoded through cashier', '', '2023-05-30 06:01:26', '2023-05-30 06:01:26');
INSERT INTO `tbl_customers` VALUES ('736', 'Sakilan', '.', '', '0', '.', 'encoded through cashier', '', '2023-05-30 13:45:07', '2023-05-30 13:45:07');
INSERT INTO `tbl_customers` VALUES ('737', 'Valeroso', '.', '', '0', '.', 'encoded through cashier', '', '2023-05-31 06:58:23', '2023-05-31 06:58:23');
INSERT INTO `tbl_customers` VALUES ('738', 'Judicpa', '.', '', '0', '.', 'encoded through cashier', '', '2023-05-31 09:08:41', '2023-05-31 09:08:41');
INSERT INTO `tbl_customers` VALUES ('739', 'Montalba', '.', '', '0', '.', 'encoded through cashier', '', '2023-05-31 17:45:39', '2023-05-31 17:45:39');
INSERT INTO `tbl_customers` VALUES ('740', 'Sarkong', '.', '', '0', '.', 'encoded through cashier', '', '2023-06-01 12:48:10', '2023-06-01 12:48:10');
INSERT INTO `tbl_customers` VALUES ('741', 'Aguilar', '.', '', '0', '.', 'encoded through cashier', '', '2023-06-03 12:00:59', '2023-06-03 12:00:59');
INSERT INTO `tbl_customers` VALUES ('742', 'Labarite, R', '.', '', '0', '.', 'encoded through cashier', '', '2023-06-03 13:54:02', '2023-06-03 13:54:02');
INSERT INTO `tbl_customers` VALUES ('743', 'Liko Perto', '.', '', '0', '.', 'encoded through cashier', '', '2023-06-03 14:08:13', '2023-06-03 14:08:13');
INSERT INTO `tbl_customers` VALUES ('744', 'Perolino', '.', '', '0', '.', 'encoded through cashier', '', '2023-06-03 15:19:43', '2023-06-03 15:19:43');
INSERT INTO `tbl_customers` VALUES ('745', 'Artual, N.', '.', '', '0', '.', 'encoded through cashier', '', '2023-06-05 11:34:28', '2023-06-05 11:34:28');
INSERT INTO `tbl_customers` VALUES ('746', 'Macabago', '.', '', '0', '.', 'encoded through cashier', '', '2023-06-05 14:42:27', '2023-06-05 14:42:27');
INSERT INTO `tbl_customers` VALUES ('747', 'Muyco', '0', '', '0', '0', 'encoded through cashier', '', '2023-06-06 08:18:47', '2023-06-06 08:18:47');
INSERT INTO `tbl_customers` VALUES ('748', 'Ducot', '1', '', '0', '1', 'encoded through cashier', '', '2023-06-06 08:21:16', '2023-06-06 08:21:16');
INSERT INTO `tbl_customers` VALUES ('749', 'Sison, Toto', '.', '', '0', '.', 'encoded through cashier', '', '2023-06-06 09:13:50', '2023-06-06 09:13:50');
INSERT INTO `tbl_customers` VALUES ('750', 'Diane, Bano', '.', '', '0', '2', 'encoded through cashier', '', '2023-06-06 09:57:40', '2023-06-06 09:57:40');
INSERT INTO `tbl_customers` VALUES ('751', 'Hera, George', '.', '', '0', '.', 'encoded through cashier', '', '2023-06-07 05:44:35', '2023-06-07 05:44:35');
INSERT INTO `tbl_customers` VALUES ('752', 'Aspera', '.', '', '0', '.', 'encoded through cashier', '', '2023-06-07 06:13:16', '2023-06-07 06:13:16');
INSERT INTO `tbl_customers` VALUES ('753', 'Morino', '0', '', '0', '0', 'encoded through cashier', '', '2023-06-07 14:33:01', '2023-06-07 14:33:01');
INSERT INTO `tbl_customers` VALUES ('754', 'Mimbalawag, Meriam', 'Maracabac, Guiling', '.', '0', '09554410179', 'encoded through cashier', '202301600001', '2023-06-08 10:14:35', '2023-07-16 16:48:14');
INSERT INTO `tbl_customers` VALUES ('755', 'ricasa', '1', '', '0', '09363391927', 'encoded through cashier', '', '2023-06-08 10:44:34', '2023-06-08 10:44:34');
INSERT INTO `tbl_customers` VALUES ('756', 'Anggay', 'q', '', '0', 'q', 'encoded through cashier', '', '2023-06-08 10:51:00', '2023-06-08 10:51:00');
INSERT INTO `tbl_customers` VALUES ('757', 'Osman, Ontong', '0', '', '0', '..', 'encoded through cashier', '', '2023-06-08 11:18:12', '2023-06-08 11:18:12');
INSERT INTO `tbl_customers` VALUES ('758', 'Obeso, N', 'Q', '', '0', 'Q', 'encoded through cashier', '', '2023-06-08 13:14:33', '2023-06-08 13:14:33');
INSERT INTO `tbl_customers` VALUES ('759', 'Mapandi', '0', '', '0', '11', 'encoded through cashier', '', '2023-06-08 14:36:21', '2023-06-08 14:36:21');
INSERT INTO `tbl_customers` VALUES ('760', 'Paclibar, JImmy', '.', '', '0', '.', 'encoded through cashier', '', '2023-06-09 08:36:20', '2023-06-09 08:36:20');
INSERT INTO `tbl_customers` VALUES ('761', 'Paspi', '.', '', '0', '.', 'encoded through cashier', '', '2023-06-09 09:25:04', '2023-06-09 09:25:04');
INSERT INTO `tbl_customers` VALUES ('762', 'Eulatrez, Divina', '1', '', '0', '1', 'encoded through cashier', '', '2023-06-09 10:50:12', '2023-06-09 10:50:12');
INSERT INTO `tbl_customers` VALUES ('763', 'aneco', 'b', '', '0', 'm', 'encoded through cashier', '', '2023-06-09 12:24:37', '2023-06-09 12:24:37');
INSERT INTO `tbl_customers` VALUES ('764', 'Mangogawan', '.', '', '0', '.', 'encoded through cashier', '', '2023-06-09 13:39:51', '2023-06-09 13:39:51');
INSERT INTO `tbl_customers` VALUES ('765', 'Fuentes', '.', '', '0', '.', 'encoded through cashier', '', '2023-06-10 09:38:10', '2023-06-10 09:38:10');
INSERT INTO `tbl_customers` VALUES ('766', 'Esman', '00', '', '0', '.', 'encoded through cashier', '', '2023-06-10 10:04:54', '2023-06-10 10:04:54');
INSERT INTO `tbl_customers` VALUES ('767', 'Bernabe', '.', '', '0', '.', 'encoded through cashier', '', '2023-06-10 12:01:59', '2023-06-10 12:01:59');
INSERT INTO `tbl_customers` VALUES ('768', 'Allado, Rex', '.', '', '0', '.', 'encoded through cashier', '', '2023-06-11 06:57:09', '2023-06-11 06:57:09');
INSERT INTO `tbl_customers` VALUES ('769', 'Alimanya', '1', '', '0', '1', 'encoded through cashier', '', '2023-06-11 11:17:01', '2023-06-11 11:17:01');
INSERT INTO `tbl_customers` VALUES ('770', 'Palincia', '0', '', '0', '1', 'encoded through cashier', '', '2023-06-11 11:53:05', '2023-06-11 11:53:05');
INSERT INTO `tbl_customers` VALUES ('771', 'Tediong', '.', '', '0', '.', 'encoded through cashier', '', '2023-06-11 12:11:48', '2023-06-11 12:11:48');
INSERT INTO `tbl_customers` VALUES ('772', 'Paje', '.', '', '0', '.', 'encoded through cashier', '', '2023-06-11 13:02:29', '2023-06-11 13:02:29');
INSERT INTO `tbl_customers` VALUES ('773', 'Calyura, J', '.', '', '0', '.', 'encoded through cashier', '', '2023-06-12 10:24:21', '2023-06-12 10:24:21');
INSERT INTO `tbl_customers` VALUES ('774', 'Santander', '.', '', '0', '.', 'encoded through cashier', '', '2023-06-12 10:27:23', '2023-06-12 10:27:23');
INSERT INTO `tbl_customers` VALUES ('775', 'Barotas, Joie', '1', '', '0', '0', 'encoded through cashier', '', '2023-06-12 10:33:35', '2023-06-12 10:33:35');
INSERT INTO `tbl_customers` VALUES ('776', 'Roda', '.', '', '0', '.', 'encoded through cashier', '', '2023-06-12 16:31:49', '2023-06-12 16:31:49');
INSERT INTO `tbl_customers` VALUES ('777', 'Dana', '.', '', '0', '.', 'encoded through cashier', '', '2023-06-13 13:50:21', '2023-06-13 13:50:21');
INSERT INTO `tbl_customers` VALUES ('778', 'Berja', '.', '', '0', '.', 'encoded through cashier', '', '2023-06-15 08:51:42', '2023-06-15 08:51:42');
INSERT INTO `tbl_customers` VALUES ('779', 'tomawan', 'j', '', '0', '4', 'encoded through cashier', '', '2023-06-15 17:21:32', '2023-06-15 17:21:32');
INSERT INTO `tbl_customers` VALUES ('780', 'Ebal', '.', '', '0', '.', 'encoded through cashier', '', '2023-06-16 14:12:59', '2023-06-16 14:12:59');
INSERT INTO `tbl_customers` VALUES ('781', 'Sindingan, A', '0', '', '0', '0', 'encoded through cashier', '', '2023-06-17 06:51:21', '2023-06-17 06:51:21');
INSERT INTO `tbl_customers` VALUES ('782', 'Ontong', '0', '', '0', '1', 'encoded through cashier', '', '2023-06-17 11:48:19', '2023-06-17 11:48:19');
INSERT INTO `tbl_customers` VALUES ('783', 'Mayasa', '.', '', '0', '.1', 'encoded through cashier', '', '2023-06-17 12:17:17', '2023-06-17 12:17:17');
INSERT INTO `tbl_customers` VALUES ('784', 'Coca', '.', '', '0', '1', 'encoded through cashier', '', '2023-06-17 12:51:08', '2023-06-17 12:51:08');
INSERT INTO `tbl_customers` VALUES ('785', 'Fat', '.', '', '0', '.', 'encoded through cashier', '', '2023-06-17 14:34:25', '2023-06-17 14:34:25');
INSERT INTO `tbl_customers` VALUES ('786', 'Canto Mayor', '.', '', '0', '1', 'encoded through cashier', '', '2023-06-18 13:43:01', '2023-06-18 13:43:01');
INSERT INTO `tbl_customers` VALUES ('787', 'Espenida', '.', '', '0', '1', 'encoded through cashier', '', '2023-06-19 10:57:17', '2023-06-19 10:57:17');
INSERT INTO `tbl_customers` VALUES ('788', 'Pama', '.', '', '0', '.', 'encoded through cashier', '', '2023-06-19 11:24:50', '2023-06-19 11:24:50');
INSERT INTO `tbl_customers` VALUES ('789', 'Kalon', '.', '', '0', '.', 'encoded through cashier', '', '2023-06-20 13:54:36', '2023-06-20 13:54:36');
INSERT INTO `tbl_customers` VALUES ('790', 'Honofre', '.', '', '0', '.', 'encoded through cashier', '', '2023-06-20 15:08:48', '2023-06-20 15:08:48');
INSERT INTO `tbl_customers` VALUES ('791', 'Matala, Sone', '.', '', '0', '.', 'encoded through cashier', '', '2023-06-20 15:55:30', '2023-06-20 15:55:30');
INSERT INTO `tbl_customers` VALUES ('792', 'BaÃ±as, Arjie', '.', '', '0', '.', 'encoded through cashier', '', '2023-06-21 06:49:57', '2023-06-21 06:49:57');
INSERT INTO `tbl_customers` VALUES ('793', 'Nonoy', '.', '', '0', '.', 'encoded through cashier', '', '2023-06-21 07:23:47', '2023-06-21 07:23:47');
INSERT INTO `tbl_customers` VALUES ('794', 'Gulmatico', '.', '', '0', '.', 'encoded through cashier', '', '2023-06-21 11:39:17', '2023-06-21 11:39:17');
INSERT INTO `tbl_customers` VALUES ('795', 'Butalit, Arlene', '.', '', '0', '.', 'encoded through cashier', '', '2023-06-21 13:16:58', '2023-06-21 13:16:58');
INSERT INTO `tbl_customers` VALUES ('796', 'mayojo', 'a', '', '0', 'a', 'encoded through cashier', '', '2023-06-21 15:02:14', '2023-06-21 15:02:14');
INSERT INTO `tbl_customers` VALUES ('797', 'Soberano', '.', '', '0', '.', 'encoded through cashier', '', '2023-06-22 07:03:46', '2023-06-22 07:03:46');
INSERT INTO `tbl_customers` VALUES ('798', 'Lopez, C', '.', '', '0', '.', 'encoded through cashier', '', '2023-06-22 07:23:48', '2023-06-22 07:23:48');
INSERT INTO `tbl_customers` VALUES ('799', 'Silverio, Ephrem', '.', '', '0', '.', 'encoded through cashier', '', '2023-06-22 08:10:56', '2023-06-22 08:10:56');
INSERT INTO `tbl_customers` VALUES ('800', 'Aloyodan', '.', '', '0', '..', 'encoded through cashier', '', '2023-06-22 08:21:59', '2023-06-22 08:21:59');
INSERT INTO `tbl_customers` VALUES ('801', 'baraocor', 'l', '', '0', 'l', 'encoded through cashier', '', '2023-06-22 10:24:06', '2023-06-22 10:24:06');
INSERT INTO `tbl_customers` VALUES ('802', 'aglosolos', 'j', '', '0', 'l', 'encoded through cashier', '', '2023-06-22 12:42:13', '2023-06-22 12:42:13');
INSERT INTO `tbl_customers` VALUES ('803', 'CaÃ±ete', '.', '', '0', '.', 'encoded through cashier', '', '2023-06-22 14:10:58', '2023-06-22 14:10:58');
INSERT INTO `tbl_customers` VALUES ('804', 'Baraga, Charito', '.', '', '0', '.', 'encoded through cashier', '', '2023-06-22 15:13:08', '2023-06-22 15:13:08');
INSERT INTO `tbl_customers` VALUES ('805', 'Dellosa', '.', '', '0', '.', 'encoded through cashier', '', '2023-06-23 08:15:03', '2023-06-23 08:15:03');
INSERT INTO `tbl_customers` VALUES ('806', 'Labiste, G', '.', '', '0', '.', 'encoded through cashier', '', '2023-06-23 10:39:12', '2023-06-23 10:39:12');
INSERT INTO `tbl_customers` VALUES ('807', 'Tibo B.', '.', '', '0', '.', 'encoded through cashier', '', '2023-06-23 13:16:22', '2023-06-23 13:16:22');
INSERT INTO `tbl_customers` VALUES ('808', 'Kamsa, Bandato', '.', '', '0', '.', 'encoded through cashier', '', '2023-06-23 15:50:55', '2023-06-23 15:50:55');
INSERT INTO `tbl_customers` VALUES ('809', 'Deocares', '.', '', '0', '.', 'encoded through cashier', '', '2023-06-23 15:59:01', '2023-06-23 15:59:01');
INSERT INTO `tbl_customers` VALUES ('810', 'Comilang', '.', '', '0', '.', 'encoded through cashier', '', '2023-06-23 16:00:30', '2023-06-23 16:00:30');
INSERT INTO `tbl_customers` VALUES ('811', 'Mohammad', '.', '', '0', '1', 'encoded through cashier', '', '2023-06-24 08:40:47', '2023-06-24 08:40:47');
INSERT INTO `tbl_customers` VALUES ('812', 'Sultan Muncaw', '.', '', '0', '1', 'encoded through cashier', '', '2023-06-24 11:46:55', '2023-06-24 11:46:55');
INSERT INTO `tbl_customers` VALUES ('813', 'Bambaki', '.', '', '0', '.', 'encoded through cashier', '', '2023-06-24 12:21:27', '2023-06-24 12:21:27');
INSERT INTO `tbl_customers` VALUES ('814', 'Victoriano', '.', '', '0', '.', 'encoded through cashier', '', '2023-06-24 12:56:20', '2023-06-24 12:56:20');
INSERT INTO `tbl_customers` VALUES ('815', 'Mamisil', '.', '', '0', '.', 'encoded through cashier', '', '2023-06-24 13:18:44', '2023-06-24 13:18:44');
INSERT INTO `tbl_customers` VALUES ('816', 'Marbibe', '.', '', '0', '1', 'encoded through cashier', '', '2023-06-24 13:27:56', '2023-06-24 13:27:56');
INSERT INTO `tbl_customers` VALUES ('817', 'Callora', '.', '', '0', '.', 'encoded through cashier', '', '2023-06-24 14:03:01', '2023-06-24 14:03:01');
INSERT INTO `tbl_customers` VALUES ('818', 'Hadje Daud', '.', '', '0', '.', 'encoded through cashier', '', '2023-06-24 14:47:20', '2023-06-24 14:47:20');
INSERT INTO `tbl_customers` VALUES ('819', 'Ampiliti', '.', '', '0', '.', 'encoded through cashier', '', '2023-06-25 06:13:58', '2023-06-25 06:13:58');
INSERT INTO `tbl_customers` VALUES ('820', 'Andulana', '.', '', '0', '.', 'encoded through cashier', '', '2023-06-25 06:27:06', '2023-06-25 06:27:06');
INSERT INTO `tbl_customers` VALUES ('821', 'Odaga', '.', '', '0', '.', 'encoded through cashier', '', '2023-06-25 07:35:53', '2023-06-25 07:35:53');
INSERT INTO `tbl_customers` VALUES ('822', 'Carta', '1', '', '0', '1', 'encoded through cashier', '', '2023-06-25 07:37:50', '2023-06-25 07:37:50');
INSERT INTO `tbl_customers` VALUES ('823', 'Guenita', '.', '', '0', '.', 'encoded through cashier', '', '2023-06-25 08:29:51', '2023-06-25 08:29:51');
INSERT INTO `tbl_customers` VALUES ('824', 'Balinton', '.', '', '0', '.', 'encoded through cashier', '', '2023-06-25 09:06:07', '2023-06-25 09:06:07');
INSERT INTO `tbl_customers` VALUES ('825', 'Arenal', '.', '', '0', '.', 'encoded through cashier', '', '2023-06-25 09:50:44', '2023-06-25 09:50:44');
INSERT INTO `tbl_customers` VALUES ('826', 'Viloria', '.', '', '0', '.', 'encoded through cashier', '', '2023-06-25 09:56:03', '2023-06-25 09:56:03');
INSERT INTO `tbl_customers` VALUES ('827', 'Tidon', '.', '', '0', '.', 'encoded through cashier', '', '2023-06-25 10:07:26', '2023-06-25 10:07:26');
INSERT INTO `tbl_customers` VALUES ('828', 'Dominis', '.', '', '0', '.', 'encoded through cashier', '', '2023-06-25 10:29:51', '2023-06-25 10:29:51');
INSERT INTO `tbl_customers` VALUES ('829', 'Laguerta', '.', '', '0', '.', 'encoded through cashier', '', '2023-06-25 11:46:19', '2023-06-25 11:46:19');
INSERT INTO `tbl_customers` VALUES ('830', 'Tambalo', '.0', '', '0', '.', 'encoded through cashier', '', '2023-06-25 12:58:51', '2023-06-25 12:58:51');
INSERT INTO `tbl_customers` VALUES ('831', 'Sayson, Maria Mae', '.', '', '0', '.', 'encoded through cashier', '', '2023-06-25 13:25:46', '2023-06-25 13:25:46');
INSERT INTO `tbl_customers` VALUES ('832', 'Gerona, R', '.', '', '0', '1', 'encoded through cashier', '', '2023-06-26 07:38:49', '2023-06-26 07:38:49');
INSERT INTO `tbl_customers` VALUES ('833', 'Tahuson', '.', '', '0', '.', 'encoded through cashier', '', '2023-06-26 09:40:22', '2023-06-26 09:40:22');
INSERT INTO `tbl_customers` VALUES ('834', 'muelo', 'l', '', '0', 'h', 'encoded through cashier', '', '2023-06-26 10:31:59', '2023-06-26 10:31:59');
INSERT INTO `tbl_customers` VALUES ('835', 'Asong, R', '.', '', '0', '1', 'encoded through cashier', '', '2023-06-26 10:53:26', '2023-06-26 10:53:26');
INSERT INTO `tbl_customers` VALUES ('836', 'Barrion J', '1', '', '0', '1', 'encoded through cashier', '', '2023-06-26 11:20:45', '2023-06-26 11:20:45');
INSERT INTO `tbl_customers` VALUES ('837', 'saracan', 'k', '', '0', 'k', 'encoded through cashier', '', '2023-06-26 12:06:39', '2023-06-26 12:06:39');
INSERT INTO `tbl_customers` VALUES ('838', 'caayupan', 's', '', '0', 's', 'encoded through cashier', '', '2023-06-26 15:56:15', '2023-06-26 15:56:15');
INSERT INTO `tbl_customers` VALUES ('839', 'Calonding', '.', '', '0', '.', 'encoded through cashier', '', '2023-06-27 10:52:31', '2023-06-27 10:52:31');
INSERT INTO `tbl_customers` VALUES ('840', 'Tinoy', '.', '', '0', '.', 'encoded through cashier', '', '2023-06-27 15:16:01', '2023-06-27 15:16:01');
INSERT INTO `tbl_customers` VALUES ('841', 'Barredo', '.', '', '0', '.', 'encoded through cashier', '', '2023-06-27 17:20:02', '2023-06-27 17:20:02');
INSERT INTO `tbl_customers` VALUES ('842', 'Abiado', '.', '', '0', '.', 'encoded through cashier', '', '2023-06-27 17:45:43', '2023-06-27 17:45:43');
INSERT INTO `tbl_customers` VALUES ('843', 'Entera, J', '.', '', '0', '.', 'encoded via pos', '', '2023-06-28 09:03:21', '2023-06-28 09:03:21');
INSERT INTO `tbl_customers` VALUES ('844', 'Mamocao', '.', '', '0', '.', 'encoded via pos', '', '2023-06-28 09:56:31', '2023-06-28 09:56:31');
INSERT INTO `tbl_customers` VALUES ('845', 'Mosquito', '.', '', '0', '.', 'encoded via pos', '', '2023-06-28 13:31:22', '2023-06-28 13:31:22');
INSERT INTO `tbl_customers` VALUES ('846', 'Bacalso', '.', '', '0', '.', 'encoded via pos', '', '2023-06-28 13:47:20', '2023-06-28 13:47:20');
INSERT INTO `tbl_customers` VALUES ('847', 'Abalorio', '.', '', '0', '.', 'encoded via pos', '', '2023-06-28 13:50:30', '2023-06-28 13:50:30');
INSERT INTO `tbl_customers` VALUES ('848', 'Perarin', '.', '', '0', '.', 'encoded via pos', '', '2023-06-28 15:12:06', '2023-06-28 15:12:06');
INSERT INTO `tbl_customers` VALUES ('849', 'Dikasaran', '.', '', '0', '.', 'encoded via pos', '', '2023-06-28 17:06:36', '2023-06-28 17:06:36');
INSERT INTO `tbl_customers` VALUES ('850', 'Gerosalim', '.', '', '0', '.', 'encoded via pos', '', '2023-06-29 08:28:23', '2023-06-29 08:28:23');
INSERT INTO `tbl_customers` VALUES ('851', 'Cantalaw', '.', '', '0', '.', 'encoded via pos', '', '2023-06-29 09:12:34', '2023-06-29 09:12:34');
INSERT INTO `tbl_customers` VALUES ('852', 'Casumpang', '.', '', '0', '0', 'encoded via pos', '', '2023-06-29 09:42:43', '2023-06-29 09:42:43');
INSERT INTO `tbl_customers` VALUES ('853', 'Agustin, Larry', '..', '', '0', '.', 'encoded via pos', '', '2023-06-29 10:33:59', '2023-06-29 10:33:59');
INSERT INTO `tbl_customers` VALUES ('854', 'Animbang, Marugom', '.', '', '0', '.', 'encoded via pos', '', '2023-06-29 10:37:58', '2023-06-29 10:37:58');
INSERT INTO `tbl_customers` VALUES ('855', 'nitod', ';', '', '0', 'k', 'encoded via pos', '', '2023-06-29 11:37:45', '2023-06-29 11:37:45');
INSERT INTO `tbl_customers` VALUES ('856', 'edincho', 'k', '', '0', 'kj', 'encoded via pos', '', '2023-06-29 11:50:18', '2023-06-29 11:50:18');
INSERT INTO `tbl_customers` VALUES ('857', 'cagod', 'h', '', '0', 'j', 'encoded via pos', '', '2023-06-29 12:12:49', '2023-06-29 12:12:49');
INSERT INTO `tbl_customers` VALUES ('858', 'Mayor', '.', '', '0', '.', 'encoded via pos', '', '2023-06-30 07:30:25', '2023-06-30 07:30:25');
INSERT INTO `tbl_customers` VALUES ('859', 'Baling', '.', '', '0', '.', 'encoded via pos', '', '2023-06-30 08:04:08', '2023-06-30 08:04:08');
INSERT INTO `tbl_customers` VALUES ('860', 'olama', 'f', '', '0', 'df', 'encoded via pos', '', '2023-06-30 10:13:52', '2023-06-30 10:13:52');
INSERT INTO `tbl_customers` VALUES ('861', 'dimacota', 'l', '', '0', 'l;', 'encoded via pos', '', '2023-06-30 11:45:13', '2023-06-30 11:45:13');
INSERT INTO `tbl_customers` VALUES ('862', 'Banggay', '1', '', '0', '.', 'encoded via pos', '', '2023-06-30 11:56:33', '2023-06-30 11:56:33');
INSERT INTO `tbl_customers` VALUES ('863', 'Cabarubias, R', '.', '', '0', '.', 'encoded via pos', '', '2023-06-30 12:55:48', '2023-06-30 12:55:48');
INSERT INTO `tbl_customers` VALUES ('864', 'gawad', 'g', '', '0', 'f', 'encoded via pos', '', '2023-06-30 13:13:05', '2023-06-30 13:13:05');
INSERT INTO `tbl_customers` VALUES ('865', 'macanas', 'j', '', '0', 'k', 'encoded via pos', '', '2023-06-30 16:03:23', '2023-06-30 16:03:23');
INSERT INTO `tbl_customers` VALUES ('866', 'Stefanio,Jocelyn ', '.', '', '0', '.', 'encoded via pos', '', '2023-07-01 08:45:51', '2023-07-01 08:45:51');
INSERT INTO `tbl_customers` VALUES ('867', 'Macasling, Rolly', '.', '', '0', '.', 'encoded via pos', '', '2023-07-01 09:30:12', '2023-07-01 09:30:12');
INSERT INTO `tbl_customers` VALUES ('868', 'macaalang', 's', '', '0', 'df', 'encoded via pos', '', '2023-07-01 11:14:33', '2023-07-01 11:14:33');
INSERT INTO `tbl_customers` VALUES ('869', 'Tumawan, Kent', 'Tabunan', '', '0', '.', 'encoded via pos', '', '2023-07-01 12:30:10', '2023-07-01 12:30:10');
INSERT INTO `tbl_customers` VALUES ('870', 'Chavez, Reynald Jr', 'Pob 1', '.', '0', '09754747588', 'encoded via pos', '202300980001', '2023-07-01 12:33:47', '2023-07-16 16:41:26');
INSERT INTO `tbl_customers` VALUES ('871', 'magbanwa', 'g', '', '0', 'g', 'encoded via pos', '', '2023-07-01 12:45:35', '2023-07-01 12:45:35');
INSERT INTO `tbl_customers` VALUES ('872', 'Rivera', '.', '', '0', '.', 'encoded via pos', '', '2023-07-01 14:40:35', '2023-07-01 14:40:35');
INSERT INTO `tbl_customers` VALUES ('873', 'Estiva', '.', '', '0', '.', 'encoded via pos', '', '2023-07-01 16:35:36', '2023-07-01 16:35:36');
INSERT INTO `tbl_customers` VALUES ('874', 'salbo', 'l', '', '0', 'l', 'encoded via pos', '', '2023-07-02 07:34:02', '2023-07-02 07:34:02');
INSERT INTO `tbl_customers` VALUES ('875', 'Sagan', '.', '', '0', '.', 'encoded via pos', '', '2023-07-02 07:52:15', '2023-07-02 07:52:15');
INSERT INTO `tbl_customers` VALUES ('876', 'pojas', 'l', '', '0', 'k', 'encoded via pos', '', '2023-07-02 08:53:14', '2023-07-02 08:53:14');
INSERT INTO `tbl_customers` VALUES ('877', 'Panang Gulong', '.', '', '0', '.', 'encoded via pos', '', '2023-07-02 09:11:03', '2023-07-02 09:11:03');
INSERT INTO `tbl_customers` VALUES ('878', 'Dagandal', '.', '', '0', '.', 'encoded via pos', '', '2023-07-02 09:30:52', '2023-07-02 09:30:52');
INSERT INTO `tbl_customers` VALUES ('879', 'nabajo', 'w', '', '0', 'f', 'encoded via pos', '', '2023-07-02 10:14:23', '2023-07-02 10:14:23');
INSERT INTO `tbl_customers` VALUES ('880', 'Flores', '.', '', '0', '1', 'encoded via pos', '', '2023-07-02 10:49:48', '2023-07-02 10:49:48');
INSERT INTO `tbl_customers` VALUES ('881', 'Libonan', '1', '', '0', '1', 'encoded via pos', '', '2023-07-02 11:40:17', '2023-07-02 11:40:17');
INSERT INTO `tbl_customers` VALUES ('882', 'Alpuerto', '.', '', '0', '.', 'encoded via pos', '', '2023-07-02 11:46:18', '2023-07-02 11:46:18');
INSERT INTO `tbl_customers` VALUES ('883', 'Galaw, Marites', '.', '', '0', '.', 'encoded via pos', '', '2023-07-02 12:37:33', '2023-07-02 12:37:33');
INSERT INTO `tbl_customers` VALUES ('884', 'Salama', '.', '', '0', '.', 'encoded via pos', '', '2023-07-02 12:56:22', '2023-07-02 12:56:22');
INSERT INTO `tbl_customers` VALUES ('885', 'cadioberan', 'q', '', '0', 'e', 'encoded via pos', '', '2023-07-02 13:13:54', '2023-07-02 13:13:54');
INSERT INTO `tbl_customers` VALUES ('886', 'saiden, Labuan', '.', '', '0', '.', 'encoded via pos', '', '2023-07-02 14:35:31', '2023-07-02 14:35:31');
INSERT INTO `tbl_customers` VALUES ('887', 'Enting', '.', '', '0', '.', 'encoded via pos', '', '2023-07-02 14:56:38', '2023-07-02 14:56:38');
INSERT INTO `tbl_customers` VALUES ('888', 'Lasic', '.', '', '0', '1', 'encoded via pos', '', '2023-07-02 15:17:49', '2023-07-02 15:17:49');
INSERT INTO `tbl_customers` VALUES ('889', 'De  Ototy', '2', '', '0', '0', 'encoded via pos', '', '2023-07-02 15:55:33', '2023-07-02 15:55:33');
INSERT INTO `tbl_customers` VALUES ('890', 'De otoy', '.', '', '0', '.', 'encoded via pos', '', '2023-07-02 15:55:57', '2023-07-02 15:55:57');
INSERT INTO `tbl_customers` VALUES ('891', 'Bansalo', '.', '', '0', '.', 'encoded via pos', '', '2023-07-02 16:51:52', '2023-07-02 16:51:52');
INSERT INTO `tbl_customers` VALUES ('892', 'Legaray', '.', '', '0', '.', 'encoded via pos', '', '2023-07-02 17:44:47', '2023-07-02 17:44:47');
INSERT INTO `tbl_customers` VALUES ('893', 'Umbar', '.', '', '0', '.', 'encoded via pos', '', '2023-07-03 15:15:21', '2023-07-03 15:15:21');
INSERT INTO `tbl_customers` VALUES ('894', 'Jose, E', '1', '', '0', '1', 'encoded via pos', '', '2023-07-04 08:36:06', '2023-07-04 08:36:06');
INSERT INTO `tbl_customers` VALUES ('895', 'pamunag', 'h', '', '0', 'h', 'encoded via pos', '', '2023-07-04 10:09:25', '2023-07-04 10:09:25');
INSERT INTO `tbl_customers` VALUES ('896', 'dal', 'v', '', '0', 'b', 'encoded via pos', '', '2023-07-04 16:49:26', '2023-07-04 16:49:26');
INSERT INTO `tbl_customers` VALUES ('897', 'Laos', '.', '', '0', '.', 'encoded via pos', '', '2023-07-05 06:23:46', '2023-07-05 06:23:46');
INSERT INTO `tbl_customers` VALUES ('898', 'Tatao', '.', '', '0', '.', 'encoded via pos', '', '2023-07-05 10:28:17', '2023-07-05 10:28:17');
INSERT INTO `tbl_customers` VALUES ('899', 'Degrasya', '.', '', '0', '1', 'encoded via pos', '', '2023-07-05 11:10:34', '2023-07-05 11:10:34');
INSERT INTO `tbl_customers` VALUES ('900', 'Dimakuta', '.', '', '0', '.', 'encoded via pos', '', '2023-07-05 13:15:18', '2023-07-05 13:15:18');
INSERT INTO `tbl_customers` VALUES ('901', 'Tungkago', '.', '', '0', '.', 'encoded via pos', '', '2023-07-05 13:22:11', '2023-07-05 13:22:11');
INSERT INTO `tbl_customers` VALUES ('902', 'Punzalan', '.', '', '0', '1', 'encoded via pos', '', '2023-07-05 13:28:19', '2023-07-05 13:28:19');
INSERT INTO `tbl_customers` VALUES ('903', 'makasling', 'l', '', '0', 'l', 'encoded via pos', '', '2023-07-05 15:18:05', '2023-07-05 15:18:05');
INSERT INTO `tbl_customers` VALUES ('904', 'Donque', '.', '', '0', '.', 'encoded via pos', '', '2023-07-05 15:30:12', '2023-07-05 15:30:12');
INSERT INTO `tbl_customers` VALUES ('905', 'Allosa', '.', '', '0', '.', 'encoded via pos', '', '2023-07-05 15:45:46', '2023-07-05 15:45:46');
INSERT INTO `tbl_customers` VALUES ('906', 'Guindulungan', '.', '', '0', '.', 'encoded via pos', '', '2023-07-05 17:25:39', '2023-07-05 17:25:39');
INSERT INTO `tbl_customers` VALUES ('907', 'Enoc', '.', '', '0', '.', 'encoded via pos', '', '2023-07-06 06:01:37', '2023-07-06 06:01:37');
INSERT INTO `tbl_customers` VALUES ('908', 'Suataron', '.', '', '0', '.', 'encoded via pos', '', '2023-07-06 06:18:39', '2023-07-06 06:18:39');
INSERT INTO `tbl_customers` VALUES ('909', 'Caparas', '.', '', '0', '.', 'encoded via pos', '', '2023-07-06 09:21:06', '2023-07-06 09:21:06');
INSERT INTO `tbl_customers` VALUES ('910', 'Manuel, glenard', '.', '', '0', '.', 'encoded via pos', '', '2023-07-06 09:31:17', '2023-07-06 09:31:17');
INSERT INTO `tbl_customers` VALUES ('911', 'Berdadero', '.', '', '0', '.', 'encoded via pos', '', '2023-07-06 10:09:06', '2023-07-06 10:09:06');
INSERT INTO `tbl_customers` VALUES ('912', 'Baldevia', '.', '', '0', '.', 'encoded via pos', '', '2023-07-06 10:58:06', '2023-07-06 10:58:06');
INSERT INTO `tbl_customers` VALUES ('913', 'Tamay, Allan', '.', '', '0', '.', 'encoded via pos', '', '2023-07-06 11:14:45', '2023-07-06 11:14:45');
INSERT INTO `tbl_customers` VALUES ('914', 'plabiner', '.', '', '0', '.', 'encoded via pos', '', '2023-07-06 11:18:51', '2023-07-06 11:18:51');
INSERT INTO `tbl_customers` VALUES ('915', 'Parcon, Gorio', '.', '', '0', '.', 'encoded via pos', '', '2023-07-06 11:35:16', '2023-07-06 11:35:16');
INSERT INTO `tbl_customers` VALUES ('916', 'Pinuella', '1', '', '0', '1', 'encoded via pos', '', '2023-07-06 12:12:09', '2023-07-06 12:12:09');
INSERT INTO `tbl_customers` VALUES ('917', 'Moreno, Analyn', 'Tabunan', '.', '0', '09488920210', 'encoded via pos', '202301200001', '2023-07-06 12:18:38', '2023-07-17 09:50:17');
INSERT INTO `tbl_customers` VALUES ('918', 'Camino', '.', '', '0', '.', 'encoded via pos', '', '2023-07-06 13:08:09', '2023-07-06 13:08:09');
INSERT INTO `tbl_customers` VALUES ('919', 'Arcite', '.', '', '0', '.', 'encoded via pos', '', '2023-07-06 13:14:48', '2023-07-06 13:14:48');
INSERT INTO `tbl_customers` VALUES ('920', 'Disomimba', '1', '', '0', '1', 'encoded via pos', '', '2023-07-06 16:26:20', '2023-07-06 16:26:20');
INSERT INTO `tbl_customers` VALUES ('921', 'Luro', '.', '', '0', '.', 'encoded via pos', '', '2023-07-07 07:37:50', '2023-07-07 07:37:50');
INSERT INTO `tbl_customers` VALUES ('922', 'Mercado', '.', '', '0', '.', 'encoded via pos', '', '2023-07-07 07:41:25', '2023-07-07 07:41:25');
INSERT INTO `tbl_customers` VALUES ('923', 'Tidong', '.', '', '0', '.', 'encoded via pos', '', '2023-07-07 07:46:19', '2023-07-07 07:46:19');
INSERT INTO `tbl_customers` VALUES ('924', 'Laungayan, Aristotle', '.', '', '0', '.', 'encoded via pos', '', '2023-07-07 10:21:56', '2023-07-07 10:21:56');
INSERT INTO `tbl_customers` VALUES ('925', 'Varcas', '.', '', '0', '.', 'encoded via pos', '', '2023-07-08 06:34:29', '2023-07-08 06:34:29');
INSERT INTO `tbl_customers` VALUES ('926', 'Andang', '.', '', '0', '.', 'encoded via pos', '', '2023-07-08 08:49:22', '2023-07-08 08:49:22');
INSERT INTO `tbl_customers` VALUES ('927', 'Ventura, Claudine', 'Thailand, Banisilan Cotabato', '.', '0', '09757064352', 'encoded via pos', '202301560001', '2023-07-08 12:12:35', '2023-07-16 16:45:21');
INSERT INTO `tbl_customers` VALUES ('928', 'Asagra', '.', '', '0', '1', 'encoded via pos', '', '2023-07-08 13:49:04', '2023-07-08 13:49:04');
INSERT INTO `tbl_customers` VALUES ('929', 'Salik', '.', '', '0', '.', 'encoded via pos', '', '2023-07-08 14:11:36', '2023-07-08 14:11:36');
INSERT INTO `tbl_customers` VALUES ('930', 'kadtogan', 'd', '', '0', 'g', 'encoded via pos', '', '2023-07-08 15:55:13', '2023-07-08 15:55:13');
INSERT INTO `tbl_customers` VALUES ('931', 'Calva', '.', '', '0', '.', 'encoded via pos', '', '2023-07-09 08:05:04', '2023-07-09 08:05:04');
INSERT INTO `tbl_customers` VALUES ('932', 'Pamabusao', '.', '', '0', '1', 'encoded via pos', '', '2023-07-09 08:26:21', '2023-07-09 08:26:21');
INSERT INTO `tbl_customers` VALUES ('933', 'Inega', '.', '', '0', '.', 'encoded via pos', '', '2023-07-09 10:23:39', '2023-07-09 10:23:39');
INSERT INTO `tbl_customers` VALUES ('934', 'Estefanio', '.', '', '0', '.', 'encoded via pos', '', '2023-07-09 11:21:43', '2023-07-09 11:21:43');
INSERT INTO `tbl_customers` VALUES ('935', 'Ofiana', '.', '', '0', '.', 'encoded via pos', '', '2023-07-09 12:11:48', '2023-07-09 12:11:48');
INSERT INTO `tbl_customers` VALUES ('936', 'Maygay', '.', '', '0', '.', 'encoded via pos', '', '2023-07-09 17:20:23', '2023-07-09 17:20:23');
INSERT INTO `tbl_customers` VALUES ('937', 'Gumaga', '.', '', '0', '.', 'encoded via pos', '', '2023-07-09 17:28:13', '2023-07-09 17:28:13');
INSERT INTO `tbl_customers` VALUES ('938', 'Jumao-as', '.3', '', '0', '.', 'encoded via pos', '', '2023-07-10 08:39:34', '2023-07-10 08:39:34');
INSERT INTO `tbl_customers` VALUES ('939', 'Quiapo, Erasto', '.', '', '0', '.', 'encoded via pos', '', '2023-07-10 08:51:09', '2023-07-10 08:51:09');
INSERT INTO `tbl_customers` VALUES ('940', 'Angala', '.', '', '0', '.', 'encoded via pos', '', '2023-07-10 09:05:48', '2023-07-10 09:05:48');
INSERT INTO `tbl_customers` VALUES ('941', 'Santiago', '..', '', '0', '1', 'encoded via pos', '', '2023-07-10 10:55:31', '2023-07-10 10:55:31');
INSERT INTO `tbl_customers` VALUES ('942', 'Alfaras', '.', '', '0', '.', 'encoded via pos', '', '2023-07-10 11:24:18', '2023-07-10 11:24:18');
INSERT INTO `tbl_customers` VALUES ('943', 'Apolinario', '.', '', '0', '.', 'encoded via pos', '', '2023-07-10 11:47:23', '2023-07-10 11:47:23');
INSERT INTO `tbl_customers` VALUES ('944', 'Torregoza', '.', '', '0', '.', 'encoded via pos', '', '2023-07-10 12:33:14', '2023-07-10 12:33:14');
INSERT INTO `tbl_customers` VALUES ('945', 'Daradza', '.', '', '0', '.', 'encoded via pos', '', '2023-07-10 17:38:57', '2023-07-10 17:38:57');
INSERT INTO `tbl_customers` VALUES ('946', 'paldon', '1', '', '0', '1', 'encoded via pos', '', '2023-07-11 06:24:42', '2023-07-11 06:24:42');
INSERT INTO `tbl_customers` VALUES ('947', 'Ballen', '.', '', '0', '.', 'encoded via pos', '', '2023-07-11 07:07:19', '2023-07-11 07:07:19');
INSERT INTO `tbl_customers` VALUES ('948', 'Jonas, Clemente', '.', '', '0', '.', 'encoded via pos', '', '2023-07-11 07:12:58', '2023-07-11 07:12:58');
INSERT INTO `tbl_customers` VALUES ('949', 'Magbanua', '.', '', '0', '.', 'encoded via pos', '', '2023-07-11 08:05:47', '2023-07-11 08:05:47');
INSERT INTO `tbl_customers` VALUES ('950', 'Mucoy, Jolito', '.', '', '0', '.', 'encoded via pos', '', '2023-07-11 09:28:32', '2023-07-11 09:28:32');
INSERT INTO `tbl_customers` VALUES ('951', 'Peneda', '.', '', '0', '.', 'encoded via pos', '', '2023-07-11 09:56:42', '2023-07-11 09:56:42');
INSERT INTO `tbl_customers` VALUES ('952', 'entatano', 'g', '', '0', 'g', 'encoded via pos', '', '2023-07-11 12:07:59', '2023-07-11 12:07:59');
INSERT INTO `tbl_customers` VALUES ('953', 'Bureongan, Sainor', '.', '', '0', '.', 'encoded via pos', '', '2023-07-11 14:55:44', '2023-07-11 14:55:44');
INSERT INTO `tbl_customers` VALUES ('954', 'Pido', '.', '', '0', '.', 'encoded via pos', '', '2023-07-11 16:06:04', '2023-07-11 16:06:04');
INSERT INTO `tbl_customers` VALUES ('955', 'Egal', '.', '', '0', '1', 'encoded via pos', '', '2023-07-11 17:05:56', '2023-07-11 17:05:56');
INSERT INTO `tbl_customers` VALUES ('956', 'Dejaro', '.', '', '0', '.', 'encoded via pos', '', '2023-07-11 20:01:39', '2023-07-11 20:01:39');
INSERT INTO `tbl_customers` VALUES ('957', 'Maravillosa', 'Paqradise', '', '0', '.', 'encoded via pos', '', '2023-07-12 10:38:13', '2023-07-12 10:38:13');
INSERT INTO `tbl_customers` VALUES ('958', 'Gatsalian', '.', '', '0', '.', 'encoded via pos', '', '2023-07-12 13:51:29', '2023-07-12 13:51:29');
INSERT INTO `tbl_customers` VALUES ('959', 'Kevin-c/o Aljay', '.', '', '0', '.', 'encoded via pos', '', '2023-07-12 13:56:42', '2023-07-12 13:56:42');
INSERT INTO `tbl_customers` VALUES ('960', 'Samoy', '1', '', '0', '1', 'encoded via pos', '', '2023-07-13 11:02:34', '2023-07-13 11:02:34');
INSERT INTO `tbl_customers` VALUES ('961', 'Tabares', '.', '', '0', '.', 'encoded via pos', '', '2023-07-13 11:55:45', '2023-07-13 11:55:45');
INSERT INTO `tbl_customers` VALUES ('962', 'Uyanggorine', '.', '', '0', '1', 'encoded via pos', '', '2023-07-13 12:09:41', '2023-07-13 12:09:41');
INSERT INTO `tbl_customers` VALUES ('963', 'Emmanuel Lacuesta', '.', '', '0', '.', 'encoded via pos', '', '2023-07-13 12:29:35', '2023-07-13 12:29:35');
INSERT INTO `tbl_customers` VALUES ('964', 'binasing', '1', '', '0', '1', 'encoded via pos', '', '2023-07-13 13:22:52', '2023-07-13 13:22:52');
INSERT INTO `tbl_customers` VALUES ('965', 'Villaran', '.', '', '0', '.', 'encoded via pos', '', '2023-07-13 14:08:20', '2023-07-13 14:08:20');
INSERT INTO `tbl_customers` VALUES ('966', 'Palatulon, Jear', 'Kapayangan', '', '0', '.', 'encoded via pos', '', '2023-07-14 09:13:54', '2023-07-14 09:13:54');
INSERT INTO `tbl_customers` VALUES ('967', 'Ice Latris', '.', '', '0', '.', 'encoded via pos', '', '2023-07-14 09:30:17', '2023-07-14 09:30:17');
INSERT INTO `tbl_customers` VALUES ('968', 'Pagurayan', '.', '', '0', '.', 'encoded via pos', '', '2023-07-14 10:26:01', '2023-07-14 10:26:01');
INSERT INTO `tbl_customers` VALUES ('969', 'muylo', 'd', '', '0', 'd', 'encoded via pos', '', '2023-07-14 14:34:50', '2023-07-14 14:34:50');
INSERT INTO `tbl_customers` VALUES ('970', 'Erocido', '.', '', '0', '.', 'encoded via pos', '', '2023-07-14 15:03:17', '2023-07-14 15:03:17');
INSERT INTO `tbl_customers` VALUES ('971', 'gonina', 'a', '', '0', 'd', 'encoded via pos', '', '2023-07-14 15:37:21', '2023-07-14 15:37:21');
INSERT INTO `tbl_customers` VALUES ('972', 'Serano, Angel', 'Brgy, Thailand', '', '0', '.', 'encoded via pos', '', '2023-07-14 15:37:42', '2023-07-14 15:37:42');
INSERT INTO `tbl_customers` VALUES ('973', 'Quintua, Allan', 'Paradise', '', '0', '.', 'encoded via pos', '', '2023-07-14 16:42:00', '2023-07-14 16:42:00');
INSERT INTO `tbl_customers` VALUES ('974', 'Neates', '.', '', '0', '.', 'encoded via pos', '', '2023-07-14 17:24:47', '2023-07-14 17:24:47');
INSERT INTO `tbl_customers` VALUES ('975', 'Delcastillo', '.', '', '0', '.', 'encoded via pos', '', '2023-07-15 05:58:58', '2023-07-15 05:58:58');
INSERT INTO `tbl_customers` VALUES ('976', 'Omac', '.', '', '0', '.', 'encoded via pos', '', '2023-07-15 07:32:13', '2023-07-15 07:32:13');
INSERT INTO `tbl_customers` VALUES ('977', 'Macaumbos', 'Guiling', '', '0', '.', 'encoded via pos', '', '2023-07-15 07:42:28', '2023-07-15 07:42:28');
INSERT INTO `tbl_customers` VALUES ('978', 'Salamat', '.', '', '0', '1', 'encoded via pos', '', '2023-07-15 07:50:20', '2023-07-15 07:50:20');
INSERT INTO `tbl_customers` VALUES ('979', 'Mutalib', '.', '', '0', '.', 'encoded via pos', '', '2023-07-15 07:52:20', '2023-07-15 07:52:20');
INSERT INTO `tbl_customers` VALUES ('980', 'laonyo', 'g', '', '0', 'n', 'encoded via pos', '', '2023-07-15 08:03:17', '2023-07-15 08:03:17');
INSERT INTO `tbl_customers` VALUES ('981', 'Fabian ,Rhea', '.', '', '0', '.', 'encoded via pos', '', '2023-07-15 08:11:59', '2023-07-15 08:11:59');
INSERT INTO `tbl_customers` VALUES ('982', 'Domenes', '.', '', '0', '.', 'encoded via pos', '', '2023-07-15 08:44:57', '2023-07-15 08:44:57');
INSERT INTO `tbl_customers` VALUES ('983', 'Amerol', '.', '', '0', '.', 'encoded via pos', '', '2023-07-15 10:23:29', '2023-07-15 10:23:29');
INSERT INTO `tbl_customers` VALUES ('984', 'Dalid', '.', '', '0', '.', 'encoded via pos', '', '2023-07-15 11:03:17', '2023-07-15 11:03:17');
INSERT INTO `tbl_customers` VALUES ('985', 'Almeron', '.', '', '0', '.', 'encoded via pos', '', '2023-07-15 11:09:35', '2023-07-15 11:09:35');
INSERT INTO `tbl_customers` VALUES ('986', 'Capocao', '.', '', '0', '.', 'encoded via pos', '', '2023-07-15 12:45:40', '2023-07-15 12:45:40');
INSERT INTO `tbl_customers` VALUES ('987', 'Barcelona', '.', '', '0', '1', 'encoded via pos', '', '2023-07-15 13:02:29', '2023-07-15 13:02:29');
INSERT INTO `tbl_customers` VALUES ('988', 'Tedong', '.', '', '0', '.', 'encoded via pos', '', '2023-07-15 14:15:49', '2023-07-15 14:15:49');
INSERT INTO `tbl_customers` VALUES ('989', 'Jalong', '.', '', '0', '.', 'encoded via pos', '', '2023-07-15 15:20:01', '2023-07-15 15:20:01');
INSERT INTO `tbl_customers` VALUES ('990', 'Palencia', '.', '', '0', '.', 'encoded via pos', '', '2023-07-16 08:53:37', '2023-07-16 08:53:37');
INSERT INTO `tbl_customers` VALUES ('991', 'ElicaÃ±o, Pedro', 'Pob 2', '.', '0', '09750651964', 'encoded via pos', '202301160001', '2023-07-16 10:41:27', '2023-07-16 11:52:25');
INSERT INTO `tbl_customers` VALUES ('992', 'Egamino, Richie', 'Pob II', '.', '0', '09126308965', '', '', '2023-07-16 11:49:20', '2023-07-16 11:49:20');
INSERT INTO `tbl_customers` VALUES ('993', 'Mak2x', '.', '', '0', '.', 'encoded via pos', '', '2023-07-16 11:59:45', '2023-07-16 11:59:45');
INSERT INTO `tbl_customers` VALUES ('994', 'Arisgado', 'Pinamulaan', '', '0', '.', 'encoded via pos', '', '2023-07-16 12:07:17', '2023-07-16 12:07:17');
INSERT INTO `tbl_customers` VALUES ('995', 'Bacatan', '.', '', '0', '.', 'encoded via pos', '', '2023-07-16 12:44:14', '2023-07-16 12:44:14');
INSERT INTO `tbl_customers` VALUES ('996', 'Celeste, Mary Grace', '.', '', '0', '1', 'encoded via pos', '', '2023-07-16 12:57:13', '2023-07-16 12:57:13');
INSERT INTO `tbl_customers` VALUES ('997', 'Gablines, Aldrin', '.', '', '0', '.', 'encoded via pos', '', '2023-07-16 13:29:19', '2023-07-16 13:29:19');
INSERT INTO `tbl_customers` VALUES ('998', 'bahonsua', 'r', '', '0', 'r', 'encoded via pos', '', '2023-07-16 14:08:33', '2023-07-16 14:08:33');
INSERT INTO `tbl_customers` VALUES ('999', 'Lojario, Rodelo', 'Pob 2', '', '0', '.', 'encoded via pos', '', '2023-07-16 15:21:41', '2023-07-16 15:21:41');
INSERT INTO `tbl_customers` VALUES ('1000', 'Barcenas, Judy Rose', 'Tabunan, guiling', '.', '0', '.', '', '', '2023-07-16 16:46:21', '2023-07-16 16:46:21');
INSERT INTO `tbl_customers` VALUES ('1001', 'kuranding', 'y', '', '0', 'y', 'encoded via pos', '', '2023-07-17 10:48:41', '2023-07-17 10:48:41');
INSERT INTO `tbl_customers` VALUES ('1002', 'Advanta- arnel', '.', '', '0', '.', 'encoded via pos', '', '2023-07-17 10:54:36', '2023-07-17 10:54:36');
INSERT INTO `tbl_customers` VALUES ('1003', 'Lumampao, Rose Marie', '.', '', '0', '.', 'encoded via pos', '', '2023-07-17 14:59:20', '2023-07-17 14:59:20');
INSERT INTO `tbl_customers` VALUES ('1004', 'alde', 'r', '', '0', 'g', 'encoded via pos', '', '2023-07-17 15:54:28', '2023-07-17 15:54:28');
INSERT INTO `tbl_customers` VALUES ('1005', 'Catacio', '.', '', '0', '.', 'encoded via pos', '', '2023-07-17 17:55:35', '2023-07-17 17:55:35');
INSERT INTO `tbl_customers` VALUES ('1006', 'Sabala', '.', '', '0', '.', 'encoded via pos', '', '2023-07-18 09:41:42', '2023-07-18 09:41:42');
INSERT INTO `tbl_customers` VALUES ('1007', 'Sualog, Evangeline', '993-Guiling', '.', '0', '09678822216', 'encoded via pos', '202301100001', '2023-07-18 09:50:16', '2023-07-18 16:09:19');
INSERT INTO `tbl_customers` VALUES ('1008', 'Misamen', '.', '', '0', '1', 'encoded via pos', '', '2023-07-18 09:55:58', '2023-07-18 09:55:58');
INSERT INTO `tbl_customers` VALUES ('1009', 'Sabobo', '.', '', '0', '.', 'encoded via pos', '', '2023-07-18 11:04:25', '2023-07-18 11:04:25');
INSERT INTO `tbl_customers` VALUES ('1010', 'Elagan', '.', '', '0', '.', 'encoded via pos', '', '2023-07-18 13:18:53', '2023-07-18 13:18:53');
INSERT INTO `tbl_customers` VALUES ('1011', 'Longanilla', '.', '', '0', '0', 'encoded via pos', '', '2023-07-18 17:38:01', '2023-07-18 17:38:01');
INSERT INTO `tbl_customers` VALUES ('1012', 'Tuanda', '.', '', '0', '.', 'encoded via pos', '', '2023-07-19 09:59:39', '2023-07-19 09:59:39');
INSERT INTO `tbl_customers` VALUES ('1013', 'TIDIOS', 'K', '', '0', 'K', 'encoded via pos', '', '2023-07-19 10:01:20', '2023-07-19 10:01:20');
INSERT INTO `tbl_customers` VALUES ('1014', 'vergara', 'i', '', '0', 'u', 'encoded via pos', '', '2023-07-19 10:30:04', '2023-07-19 10:30:04');
INSERT INTO `tbl_customers` VALUES ('1015', 'Asher', '.', '', '0', '1', 'encoded via pos', '', '2023-07-19 13:30:11', '2023-07-19 13:30:11');
INSERT INTO `tbl_customers` VALUES ('1016', 'Belonio, Kem', '.', '', '0', '.', 'encoded via pos', '', '2023-07-19 13:50:48', '2023-07-19 13:50:48');
INSERT INTO `tbl_customers` VALUES ('1017', 'Bantilan', '.', '', '0', '.', 'encoded via pos', '', '2023-07-19 15:53:07', '2023-07-19 15:53:07');
INSERT INTO `tbl_customers` VALUES ('1018', 'Arkilita', '.', '', '0', '.', 'encoded via pos', '', '2023-07-20 06:57:38', '2023-07-20 06:57:38');
INSERT INTO `tbl_customers` VALUES ('1019', 'Saik', '.', '', '0', '.', 'encoded via pos', '', '2023-07-20 08:08:04', '2023-07-20 08:08:04');
INSERT INTO `tbl_customers` VALUES ('1020', 'Mala ', 'q', '', '0', '1', 'encoded via pos', '', '2023-07-20 08:25:24', '2023-07-20 08:25:24');
INSERT INTO `tbl_customers` VALUES ('1021', 'Cainoy', '.', '', '0', '.', 'encoded via pos', '', '2023-07-20 09:58:36', '2023-07-20 09:58:36');
INSERT INTO `tbl_customers` VALUES ('1022', 'Junjun', '.', '', '0', '.', 'encoded via pos', '', '2023-07-20 11:16:54', '2023-07-20 11:16:54');
INSERT INTO `tbl_customers` VALUES ('1023', 'Tanggor', '.', '', '0', '.', 'encoded via pos', '', '2023-07-20 11:55:15', '2023-07-20 11:55:15');
INSERT INTO `tbl_customers` VALUES ('1024', 'epomuceno', 'l', '', '0', 'n', 'encoded via pos', '', '2023-07-20 12:10:37', '2023-07-20 12:10:37');
INSERT INTO `tbl_customers` VALUES ('1025', 'Villaral, Ronald', '.', '', '0', '.', 'encoded via pos', '', '2023-07-20 12:44:31', '2023-07-20 12:44:31');
INSERT INTO `tbl_customers` VALUES ('1026', 'Onsil', '.', '', '0', '.', 'encoded via pos', '', '2023-07-20 13:23:48', '2023-07-20 13:23:48');
INSERT INTO `tbl_customers` VALUES ('1027', 'Mocoy, Jomarie', '.', '.', '0', '09105599664', 'encoded via pos', '202301050001', '2023-07-20 15:49:12', '2023-07-20 18:14:32');
INSERT INTO `tbl_customers` VALUES ('1028', 'Oding, Said', '.', '', '0', '.', 'encoded via pos', '', '2023-07-21 08:54:18', '2023-07-21 08:54:18');
INSERT INTO `tbl_customers` VALUES ('1029', 'Gayo, R', '.', '', '0', '.', 'encoded via pos', '', '2023-07-21 09:19:59', '2023-07-21 09:19:59');
INSERT INTO `tbl_customers` VALUES ('1030', 'Kare, J', '.', '', '0', '.', 'encoded via pos', '', '2023-07-21 09:27:04', '2023-07-21 09:27:04');
INSERT INTO `tbl_customers` VALUES ('1031', 'cuarteros mae', 'f', '', '0', 'f', 'encoded via pos', '', '2023-07-21 10:01:24', '2023-07-21 10:01:24');
INSERT INTO `tbl_customers` VALUES ('1032', 'panara', 's', '', '0', 's', 'encoded via pos', '', '2023-07-21 11:15:48', '2023-07-21 11:15:48');
INSERT INTO `tbl_customers` VALUES ('1033', 'Sumlay', '.', '', '0', '1', 'encoded via pos', '', '2023-07-21 11:30:18', '2023-07-21 11:30:18');
INSERT INTO `tbl_customers` VALUES ('1034', 'osman mike', 'h', '', '0', 'h', 'encoded via pos', '', '2023-07-21 11:53:57', '2023-07-21 11:53:57');
INSERT INTO `tbl_customers` VALUES ('1035', 'doletin', '.', '', '0', '.', 'encoded via pos', '', '2023-07-21 13:34:15', '2023-07-21 13:34:15');
INSERT INTO `tbl_customers` VALUES ('1036', 'Melchor', '.', '', '0', '.', 'encoded via pos', '', '2023-07-21 14:31:09', '2023-07-21 14:31:09');
INSERT INTO `tbl_customers` VALUES ('1037', 'Ibarra, Jocris', '.', '.', '0', '09267834257', 'encoded via pos', '202300920001', '2023-07-21 14:53:10', '2023-07-27 11:00:58');
INSERT INTO `tbl_customers` VALUES ('1038', 'mameskal', 'j', '', '0', 'j', 'encoded via pos', '', '2023-07-21 16:49:54', '2023-07-21 16:49:54');
INSERT INTO `tbl_customers` VALUES ('1039', 'lara', 'k', '', '0', 'k', 'encoded via pos', '', '2023-07-22 13:17:53', '2023-07-22 13:17:53');
INSERT INTO `tbl_customers` VALUES ('1040', 'Dusaran, Odin', '.', '', '0', '.', 'encoded via pos', '', '2023-07-22 13:47:14', '2023-07-22 13:47:14');
INSERT INTO `tbl_customers` VALUES ('1041', 'casan', 'h', '', '0', 'h', 'encoded via pos', '', '2023-07-22 16:01:49', '2023-07-22 16:01:49');
INSERT INTO `tbl_customers` VALUES ('1042', 'Badaran', '.', '', '0', '.', 'encoded via pos', '', '2023-07-22 16:30:24', '2023-07-22 16:30:24');
INSERT INTO `tbl_customers` VALUES ('1043', 'epanto', 't', '', '0', 't', 'encoded via pos', '', '2023-07-23 08:36:41', '2023-07-23 08:36:41');
INSERT INTO `tbl_customers` VALUES ('1044', 'saguines bobong', 'g', '', '0', 'g', 'encoded via pos', '', '2023-07-23 11:10:04', '2023-07-23 11:10:04');
INSERT INTO `tbl_customers` VALUES ('1045', 'Chavez Renante', 'g', '', '0', 'g', 'encoded via pos', '', '2023-07-23 14:18:43', '2023-07-23 14:18:43');
INSERT INTO `tbl_customers` VALUES ('1046', 'sortida', 'f', '', '0', 'f', 'encoded via pos', '', '2023-07-23 14:27:59', '2023-07-23 14:27:59');
INSERT INTO `tbl_customers` VALUES ('1047', 'utod', 'g', '', '0', 'g', 'encoded via pos', '', '2023-07-23 15:37:07', '2023-07-23 15:37:07');
INSERT INTO `tbl_customers` VALUES ('1048', 'Miwak', '1', '', '0', '1', 'encoded via pos', '', '2023-07-24 10:06:50', '2023-07-24 10:06:50');
INSERT INTO `tbl_customers` VALUES ('1049', 'Peleo', '.', '', '0', '.', 'encoded via pos', '', '2023-07-24 12:15:32', '2023-07-24 12:15:32');
INSERT INTO `tbl_customers` VALUES ('1050', 'Lagat', '.', '', '0', '.', 'encoded via pos', '', '2023-07-24 14:07:42', '2023-07-24 14:07:42');
INSERT INTO `tbl_customers` VALUES ('1051', 'Lumahan, Charlen', '.', '', '0', '.', 'encoded via pos', '', '2023-07-24 14:28:57', '2023-07-24 14:28:57');
INSERT INTO `tbl_customers` VALUES ('1052', 'Cornipillo', '.', '', '0', '.', 'encoded via pos', '', '2023-07-25 06:40:20', '2023-07-25 06:40:20');
INSERT INTO `tbl_customers` VALUES ('1053', 'Glenogo', '0', '', '0', '0', 'encoded via pos', '', '2023-07-25 13:02:56', '2023-07-25 13:02:56');
INSERT INTO `tbl_customers` VALUES ('1054', 'Mangon', '.', '', '0', '.', 'encoded via pos', '', '2023-07-25 16:40:46', '2023-07-25 16:40:46');
INSERT INTO `tbl_customers` VALUES ('1055', 'Naranja, Rhea', '.', '', '0', '.', 'encoded via pos', '', '2023-07-26 06:35:41', '2023-07-26 06:35:41');
INSERT INTO `tbl_customers` VALUES ('1056', 'Macasling, Romil', '.', '', '0', '.', 'encoded via pos', '', '2023-07-26 08:39:01', '2023-07-26 08:39:01');
INSERT INTO `tbl_customers` VALUES ('1057', 'Lagura', '0', '', '0', '1', 'encoded via pos', '', '2023-07-26 11:43:30', '2023-07-26 11:43:30');
INSERT INTO `tbl_customers` VALUES ('1058', 'Darapiza', '.', '', '0', '.', 'encoded via pos', '', '2023-07-26 11:46:40', '2023-07-26 11:46:40');
INSERT INTO `tbl_customers` VALUES ('1059', 'Villarosa', '.', '', '0', '.', 'encoded via pos', '', '2023-07-26 11:46:42', '2023-07-26 11:46:42');
INSERT INTO `tbl_customers` VALUES ('1060', 'Pacardo, Merlyn', '.', '', '0', '.', 'encoded via pos', '', '2023-07-26 16:43:13', '2023-07-26 16:43:13');
INSERT INTO `tbl_customers` VALUES ('1061', 'Pamonag', '.', '', '0', '.', 'encoded via pos', '', '2023-07-27 06:55:52', '2023-07-27 06:55:52');
INSERT INTO `tbl_customers` VALUES ('1062', 'Demonteverde, Ryan', '.', '', '0', '1', 'encoded via pos', '', '2023-07-27 07:57:45', '2023-07-27 07:57:45');
INSERT INTO `tbl_customers` VALUES ('1063', 'Santotome, Pedro', '1', '', '0', '1', 'encoded via pos', '', '2023-07-27 08:55:08', '2023-07-27 08:55:08');
INSERT INTO `tbl_customers` VALUES ('1064', 'Balmores', '.', '', '0', '.', 'encoded via pos', '', '2023-07-27 09:42:08', '2023-07-27 09:42:08');
INSERT INTO `tbl_customers` VALUES ('1065', 'Ponte', '.', '', '0', '.', 'encoded via pos', '', '2023-07-27 10:14:08', '2023-07-27 10:14:08');
INSERT INTO `tbl_customers` VALUES ('1066', 'Gayo, Rubelyn', '.', '.', '0', '09162695107', '', '', '2023-07-27 11:02:13', '2023-07-27 11:02:13');
INSERT INTO `tbl_customers` VALUES ('1067', 'Favillar', '.', '', '0', '1', 'encoded via pos', '', '2023-07-27 13:07:11', '2023-07-27 13:07:11');
INSERT INTO `tbl_customers` VALUES ('1068', 'Salangan Osman', '.', '.', '0', '1', 'encoded via pos', '202300940001', '2023-07-27 14:24:05', '2023-08-25 15:26:11');
INSERT INTO `tbl_customers` VALUES ('1069', 'Sarmiento, Rolex', '.', '', '0', '1', 'encoded via pos', '', '2023-07-27 15:38:18', '2023-07-27 15:38:18');
INSERT INTO `tbl_customers` VALUES ('1070', 'Lidasan', '.', '', '0', '.', 'encoded via pos', '', '2023-07-27 17:11:27', '2023-07-27 17:11:27');
INSERT INTO `tbl_customers` VALUES ('1071', 'Calvo', '.', '', '0', '.', 'encoded via pos', '', '2023-07-28 07:25:15', '2023-07-28 07:25:15');
INSERT INTO `tbl_customers` VALUES ('1072', 'Perasol', '.', '', '0', '.', 'encoded via pos', '', '2023-07-28 10:19:17', '2023-07-28 10:19:17');
INSERT INTO `tbl_customers` VALUES ('1073', 'Animbang', '1', '', '0', '1', 'encoded via pos', '', '2023-07-28 15:02:33', '2023-07-28 15:02:33');
INSERT INTO `tbl_customers` VALUES ('1074', 'Reyno', '1', '', '0', '1', 'encoded via pos', '', '2023-07-28 15:08:59', '2023-07-28 15:08:59');
INSERT INTO `tbl_customers` VALUES ('1075', 'Jamerlan', '1', '', '0', '1', 'encoded via pos', '', '2023-07-28 15:12:43', '2023-07-28 15:12:43');
INSERT INTO `tbl_customers` VALUES ('1076', 'Baral', '1', '', '0', '1', 'encoded via pos', '', '2023-07-28 15:18:30', '2023-07-28 15:18:30');
INSERT INTO `tbl_customers` VALUES ('1077', 'Mendoza, Romy', '1', '', '0', '1', 'encoded via pos', '', '2023-07-28 15:25:11', '2023-07-28 15:25:11');
INSERT INTO `tbl_customers` VALUES ('1078', 'Belonio, Dolfe', '.', '', '0', '1', 'encoded via pos', '', '2023-07-28 15:37:32', '2023-07-28 15:37:32');
INSERT INTO `tbl_customers` VALUES ('1079', 'Barcenal', '..', '', '0', '1', 'encoded via pos', '', '2023-07-29 10:28:28', '2023-07-29 10:28:28');
INSERT INTO `tbl_customers` VALUES ('1080', 'Capatoy, N', '.', '', '0', '.', 'encoded via pos', '', '2023-07-29 10:59:39', '2023-07-29 10:59:39');
INSERT INTO `tbl_customers` VALUES ('1081', 'Capatoy', '.', '', '0', '.', 'encoded via pos', '', '2023-07-29 10:59:46', '2023-07-29 10:59:46');
INSERT INTO `tbl_customers` VALUES ('1082', 'Agramonte, Ramon', '1', '', '0', '1', 'encoded via pos', '', '2023-07-29 11:32:33', '2023-07-29 11:32:33');
INSERT INTO `tbl_customers` VALUES ('1083', 'catarinen', 'h', '', '0', 'c', 'encoded via pos', '', '2023-07-29 13:12:56', '2023-07-29 13:12:56');
INSERT INTO `tbl_customers` VALUES ('1084', 'Matanog', '.', '', '0', '1', 'encoded via pos', '', '2023-07-29 13:58:57', '2023-07-29 13:58:57');
INSERT INTO `tbl_customers` VALUES ('1085', 'JEHAD', 'K', '', '0', 'K', 'encoded via pos', '', '2023-07-29 15:53:23', '2023-07-29 15:53:23');
INSERT INTO `tbl_customers` VALUES ('1086', 'Macapantar', '.', '', '0', '.', 'encoded via pos', '', '2023-07-29 16:14:53', '2023-07-29 16:14:53');
INSERT INTO `tbl_customers` VALUES ('1087', 'Casemiro', '1', '', '0', '1', 'encoded via pos', '', '2023-07-30 07:51:45', '2023-07-30 07:51:45');
INSERT INTO `tbl_customers` VALUES ('1088', 'Diesto Allan Carl', '1', '', '0', '1', 'encoded via pos', '', '2023-07-30 08:41:42', '2023-07-30 08:41:42');
INSERT INTO `tbl_customers` VALUES ('1089', 'Pacardo Lano', '1', '', '0', '1', 'encoded via pos', '', '2023-07-30 11:47:13', '2023-07-30 11:47:13');
INSERT INTO `tbl_customers` VALUES ('1090', 'Purega', '1', '', '0', '1', 'encoded via pos', '', '2023-07-30 12:33:34', '2023-07-30 12:33:34');
INSERT INTO `tbl_customers` VALUES ('1091', 'Serie Blie', '1', '', '0', '11', 'encoded via pos', '', '2023-07-30 12:50:15', '2023-07-30 12:50:15');
INSERT INTO `tbl_customers` VALUES ('1092', 'Dejaro, Warren Jr', '1', '', '0', '11', 'encoded via pos', '', '2023-07-30 13:37:56', '2023-07-30 13:37:56');
INSERT INTO `tbl_customers` VALUES ('1093', 'ASUMBRA', 'J', '', '0', 'J', 'encoded via pos', '', '2023-07-30 16:39:11', '2023-07-30 16:39:11');
INSERT INTO `tbl_customers` VALUES ('1094', 'Villaruel', '1', '', '0', '1', 'encoded via pos', '', '2023-07-31 05:53:00', '2023-07-31 05:53:00');
INSERT INTO `tbl_customers` VALUES ('1095', 'Rafols', '1', '', '0', '1', 'encoded via pos', '', '2023-07-31 09:56:15', '2023-07-31 09:56:15');
INSERT INTO `tbl_customers` VALUES ('1096', 'Lingcob', '0', '', '0', '0', 'encoded via pos', '', '2023-07-31 10:46:35', '2023-07-31 10:46:35');
INSERT INTO `tbl_customers` VALUES ('1097', 'Hermoso, Joylyn', '.', '', '0', '.', 'encoded via pos', '', '2023-07-31 11:52:24', '2023-07-31 11:52:24');
INSERT INTO `tbl_customers` VALUES ('1098', 'Latoha Rosue', '1', '', '0', '1', 'encoded via pos', '', '2023-07-31 12:02:38', '2023-07-31 12:02:38');
INSERT INTO `tbl_customers` VALUES ('1099', 'undaya', 'h', '', '0', 'h', 'encoded via pos', '', '2023-07-31 12:24:43', '2023-07-31 12:24:43');
INSERT INTO `tbl_customers` VALUES ('1100', 'capa blangka', 'f', '', '0', 'f', 'encoded via pos', '', '2023-07-31 13:27:16', '2023-07-31 13:27:16');
INSERT INTO `tbl_customers` VALUES ('1101', 'Mechail Amrani', '1', '', '0', '1', 'encoded via pos', '', '2023-07-31 13:30:01', '2023-07-31 13:30:01');
INSERT INTO `tbl_customers` VALUES ('1102', 'Dalgan', 'h', '', '0', 'h', 'encoded via pos', '', '2023-07-31 14:30:52', '2023-07-31 14:30:52');
INSERT INTO `tbl_customers` VALUES ('1103', 'Nacario Bernard', '1', '', '0', '1', 'encoded via pos', '', '2023-07-31 17:50:24', '2023-07-31 17:50:24');
INSERT INTO `tbl_customers` VALUES ('1104', 'Benola Balong', '1', '', '0', '1', 'encoded via pos', '', '2023-08-01 06:14:13', '2023-08-01 06:14:13');
INSERT INTO `tbl_customers` VALUES ('1105', 'cabusas', 'g', '', '0', 'g', 'encoded via pos', '', '2023-08-01 08:53:33', '2023-08-01 08:53:33');
INSERT INTO `tbl_customers` VALUES ('1106', 'Briones', 'g', '', '0', 'g', 'encoded via pos', '', '2023-08-01 13:52:39', '2023-08-01 13:52:39');
INSERT INTO `tbl_customers` VALUES ('1107', 'Oyangorin', 'j', '', '0', 'j', 'encoded via pos', '', '2023-08-02 08:46:10', '2023-08-02 08:46:10');
INSERT INTO `tbl_customers` VALUES ('1108', 'Santotome Betty', '1', '', '0', '1', 'encoded via pos', '', '2023-08-02 09:28:32', '2023-08-02 09:28:32');
INSERT INTO `tbl_customers` VALUES ('1109', 'Bastonero', '1', '', '0', '1', 'encoded via pos', '', '2023-08-02 10:38:17', '2023-08-02 10:38:17');
INSERT INTO `tbl_customers` VALUES ('1110', 'Estil', 'j', '', '0', 'j', 'encoded via pos', '', '2023-08-02 11:32:38', '2023-08-02 11:32:38');
INSERT INTO `tbl_customers` VALUES ('1111', 'Buscato Jomar', '1', '', '0', '1', 'encoded via pos', '', '2023-08-02 12:26:01', '2023-08-02 12:26:01');
INSERT INTO `tbl_customers` VALUES ('1112', 'Ligania Artemio', '1', '', '0', '1', 'encoded via pos', '', '2023-08-02 14:15:58', '2023-08-02 14:15:58');
INSERT INTO `tbl_customers` VALUES ('1113', 'Silongan, Alima', '.', '', '0', '.', 'encoded via pos', '', '2023-08-02 14:49:48', '2023-08-02 14:49:48');
INSERT INTO `tbl_customers` VALUES ('1114', 'Balogo', 'g', '', '0', 'g', 'encoded via pos', '', '2023-08-03 09:22:48', '2023-08-03 09:22:48');
INSERT INTO `tbl_customers` VALUES ('1115', 'Acan', 'a', '', '0', 'g', 'encoded via pos', '', '2023-08-03 09:38:49', '2023-08-03 09:38:49');
INSERT INTO `tbl_customers` VALUES ('1116', 'lucino', 'g', '', '0', 'g', 'encoded via pos', '', '2023-08-03 10:37:50', '2023-08-03 10:37:50');
INSERT INTO `tbl_customers` VALUES ('1117', 'LUMAMBAS,PATAMAMA', 'A', '', '0', 'A', 'encoded via pos', '', '2023-08-03 11:33:27', '2023-08-03 11:33:27');
INSERT INTO `tbl_customers` VALUES ('1118', 'DIMANDANTI', 'G', '', '0', 's', 'encoded via pos', '', '2023-08-03 15:16:18', '2023-08-03 15:16:18');
INSERT INTO `tbl_customers` VALUES ('1119', 'Salangan Khalid', '1', '', '0', '11', 'encoded via pos', '', '2023-08-03 16:26:09', '2023-08-03 16:26:09');
INSERT INTO `tbl_customers` VALUES ('1120', 'Habitacion, April', '.', '', '0', '.', 'encoded via pos', '', '2023-08-03 16:44:21', '2023-08-03 16:44:21');
INSERT INTO `tbl_customers` VALUES ('1121', 'Mapalo Jerry', '1', '', '0', '1', 'encoded via pos', '', '2023-08-03 16:55:52', '2023-08-03 16:55:52');
INSERT INTO `tbl_customers` VALUES ('1122', 'Amora', 'f', '', '0', 'f', 'encoded via pos', '', '2023-08-04 08:45:52', '2023-08-04 08:45:52');
INSERT INTO `tbl_customers` VALUES ('1123', 'Aduyodan, Tunda', '1', '', '0', '11', 'encoded via pos', '', '2023-08-04 09:54:15', '2023-08-04 09:54:15');
INSERT INTO `tbl_customers` VALUES ('1124', 'Pila Muslimen', '1', '', '0', '1', 'encoded via pos', '', '2023-08-04 11:24:49', '2023-08-04 11:24:49');
INSERT INTO `tbl_customers` VALUES ('1125', 'Abao', '1', '', '0', '1', 'encoded via pos', '', '2023-08-04 13:53:50', '2023-08-04 13:53:50');
INSERT INTO `tbl_customers` VALUES ('1126', 'Sobremisana', '1', '', '0', '1', 'encoded via pos', '', '2023-08-05 07:59:29', '2023-08-05 07:59:29');
INSERT INTO `tbl_customers` VALUES ('1127', 'Ganduali', '.', '', '0', '1', 'encoded via pos', '', '2023-08-05 09:33:55', '2023-08-05 09:33:55');
INSERT INTO `tbl_customers` VALUES ('1128', 'Dizon', '.', '', '0', '.', 'encoded via pos', '', '2023-08-05 11:43:47', '2023-08-05 11:43:47');
INSERT INTO `tbl_customers` VALUES ('1129', 'Funa', '1', '', '0', '1', 'encoded via pos', '', '2023-08-05 12:42:39', '2023-08-05 12:42:39');
INSERT INTO `tbl_customers` VALUES ('1130', 'Villalobos, Daphny', '.', '', '0', '.', 'encoded via pos', '', '2023-08-05 15:01:01', '2023-08-05 15:01:01');
INSERT INTO `tbl_customers` VALUES ('1131', 'Aglosolos Jason', '1', '', '0', '1', 'encoded via pos', '', '2023-08-05 16:36:30', '2023-08-05 16:36:30');
INSERT INTO `tbl_customers` VALUES ('1132', 'Giaplos', '.', '', '0', '1', 'encoded via pos', '', '2023-08-05 16:46:48', '2023-08-05 16:46:48');
INSERT INTO `tbl_customers` VALUES ('1133', 'Castor,diding', 'g', '', '0', 'g', 'encoded via pos', '', '2023-08-06 06:16:20', '2023-08-06 06:16:20');
INSERT INTO `tbl_customers` VALUES ('1134', 'Agrigado', 'h', '', '0', 'h', 'encoded via pos', '', '2023-08-06 09:00:10', '2023-08-06 09:00:10');
INSERT INTO `tbl_customers` VALUES ('1135', 'Bagindali Langkoy', '1', '', '0', '1', 'encoded via pos', '', '2023-08-06 10:17:20', '2023-08-06 10:17:20');
INSERT INTO `tbl_customers` VALUES ('1136', 'Deala', '.', '', '0', '.', 'encoded via pos', '', '2023-08-06 13:16:06', '2023-08-06 13:16:06');
INSERT INTO `tbl_customers` VALUES ('1137', 'valderrama', 'd', '', '0', 'd', 'encoded via pos', '', '2023-08-06 14:04:51', '2023-08-06 14:04:51');
INSERT INTO `tbl_customers` VALUES ('1138', 'Arandoque', '1', '', '0', '1', 'encoded via pos', '', '2023-08-06 16:10:22', '2023-08-06 16:10:22');
INSERT INTO `tbl_customers` VALUES ('1139', 'Pagiya', 'h', '', '0', 'h', 'encoded via pos', '', '2023-08-07 07:06:35', '2023-08-07 07:06:35');
INSERT INTO `tbl_customers` VALUES ('1140', 'Adiong', 's', '', '0', 'd', 'encoded via pos', '', '2023-08-07 08:13:36', '2023-08-07 08:13:36');
INSERT INTO `tbl_customers` VALUES ('1141', 'Aresgado', '1', '', '0', '1', 'encoded via pos', '', '2023-08-07 13:40:26', '2023-08-07 13:40:26');
INSERT INTO `tbl_customers` VALUES ('1142', 'Celestial Joselito', '1', '', '0', '1', 'encoded via pos', '', '2023-08-07 15:00:24', '2023-08-07 15:00:24');
INSERT INTO `tbl_customers` VALUES ('1143', 'jamo', 'f', '', '0', 'f', 'encoded via pos', '', '2023-08-07 15:03:11', '2023-08-07 15:03:11');
INSERT INTO `tbl_customers` VALUES ('1144', 'Alzosa', '0', '', '0', '0', 'encoded via pos', '', '2023-08-07 15:19:26', '2023-08-07 15:19:26');
INSERT INTO `tbl_customers` VALUES ('1145', 'Dela Torre, Tessie', '.', '', '0', '.', 'encoded via pos', '', '2023-08-07 16:26:45', '2023-08-07 16:26:45');
INSERT INTO `tbl_customers` VALUES ('1146', 'Progellia', '1', '', '0', '11', 'encoded via pos', '', '2023-08-08 10:06:38', '2023-08-08 10:06:38');
INSERT INTO `tbl_customers` VALUES ('1147', 'MACADATAR', '1', '', '0', '1', 'encoded via pos', '', '2023-08-08 11:29:17', '2023-08-08 11:29:17');
INSERT INTO `tbl_customers` VALUES ('1148', 'Anok', 'j', '', '0', 'j', 'encoded via pos', '', '2023-08-08 12:40:30', '2023-08-08 12:40:30');
INSERT INTO `tbl_customers` VALUES ('1149', 'Endiape', 'j', '', '0', 'j', 'encoded via pos', '', '2023-08-08 15:09:31', '2023-08-08 15:09:31');
INSERT INTO `tbl_customers` VALUES ('1150', 'balangitao', 'f', '', '0', 'f', 'encoded via pos', '', '2023-08-08 15:39:41', '2023-08-08 15:39:41');
INSERT INTO `tbl_customers` VALUES ('1151', 'Estomagolang', '1', '', '0', '1', 'encoded via pos', '', '2023-08-09 09:26:17', '2023-08-09 09:26:17');
INSERT INTO `tbl_customers` VALUES ('1152', 'Patenio', '.', '', '0', '1', 'encoded via pos', '', '2023-08-09 09:46:27', '2023-08-09 09:46:27');
INSERT INTO `tbl_customers` VALUES ('1153', 'Demonteverde Joselito', '1', '', '0', '1', 'encoded via pos', '', '2023-08-09 15:49:46', '2023-08-09 15:49:46');
INSERT INTO `tbl_customers` VALUES ('1154', 'Mamon ', '1', '', '0', '1', 'encoded via pos', '', '2023-08-10 13:48:40', '2023-08-10 13:48:40');
INSERT INTO `tbl_customers` VALUES ('1155', 'Beladas, Renato', '.', '', '0', '.', 'encoded via pos', '', '2023-08-11 10:11:38', '2023-08-11 10:11:38');
INSERT INTO `tbl_customers` VALUES ('1156', 'Costales', '1', '', '0', '1', 'encoded via pos', '', '2023-08-11 12:48:27', '2023-08-11 12:48:27');
INSERT INTO `tbl_customers` VALUES ('1157', 'Mojal', '1', '', '0', '1', 'encoded via pos', '', '2023-08-12 11:13:43', '2023-08-12 11:13:43');
INSERT INTO `tbl_customers` VALUES ('1158', 'Quidilig', '.', '', '0', '.', 'encoded via pos', '', '2023-08-13 09:50:16', '2023-08-13 09:50:16');
INSERT INTO `tbl_customers` VALUES ('1159', 'Dominguez Jojo', '1', '', '0', '1', 'encoded via pos', '', '2023-08-13 10:56:23', '2023-08-13 10:56:23');
INSERT INTO `tbl_customers` VALUES ('1160', 'argellis', '1', '', '0', '1', 'encoded via pos', '', '2023-08-14 08:09:42', '2023-08-14 08:09:42');
INSERT INTO `tbl_customers` VALUES ('1161', 'Arvie Libanan', '1', '', '0', '1', 'encoded via pos', '', '2023-08-14 14:38:02', '2023-08-14 14:38:02');
INSERT INTO `tbl_customers` VALUES ('1162', 'Samontina', '.', '', '0', '.', 'encoded via pos', '', '2023-08-15 09:28:10', '2023-08-15 09:28:10');
INSERT INTO `tbl_customers` VALUES ('1163', 'Beirneza', '.', '', '0', '.', 'encoded via pos', '', '2023-08-15 10:25:26', '2023-08-15 10:25:26');
INSERT INTO `tbl_customers` VALUES ('1164', 'Entera', '1', '', '0', '1', 'encoded via pos', '', '2023-08-16 05:55:18', '2023-08-16 05:55:18');
INSERT INTO `tbl_customers` VALUES ('1165', 'Catamin Micheal', '1', '', '0', '1', 'encoded via pos', '', '2023-08-16 07:12:24', '2023-08-16 07:12:24');
INSERT INTO `tbl_customers` VALUES ('1166', 'Cornepillo Dodoy', '1', '', '0', '11', 'encoded via pos', '', '2023-08-16 08:37:04', '2023-08-16 08:37:04');
INSERT INTO `tbl_customers` VALUES ('1167', 'Poblacion 2', '1', '', '0', '11', 'encoded via pos', '', '2023-08-16 09:09:12', '2023-08-16 09:09:12');
INSERT INTO `tbl_customers` VALUES ('1168', 'Jusain', '1', '', '0', '1', 'encoded via pos', '', '2023-08-16 12:02:19', '2023-08-16 12:02:19');
INSERT INTO `tbl_customers` VALUES ('1169', 'Devilos', '1', '', '0', '1', 'encoded via pos', '', '2023-08-16 12:37:54', '2023-08-16 12:37:54');
INSERT INTO `tbl_customers` VALUES ('1170', 'Guadez, A', '.', '', '0', '.', 'encoded via pos', '', '2023-08-17 08:17:44', '2023-08-17 08:17:44');
INSERT INTO `tbl_customers` VALUES ('1171', 'DiquiÃ±a', '.', '', '0', '.', 'encoded via pos', '', '2023-08-17 09:35:33', '2023-08-17 09:35:33');
INSERT INTO `tbl_customers` VALUES ('1172', 'Cartagina, D', '.', '', '0', '.', 'encoded via pos', '', '2023-08-17 14:20:39', '2023-08-17 14:20:39');
INSERT INTO `tbl_customers` VALUES ('1173', 'Conde Robert', '1', '', '0', '11', 'encoded via pos', '', '2023-08-17 14:33:52', '2023-08-17 14:33:52');
INSERT INTO `tbl_customers` VALUES ('1174', 'Salik Benidecto', '1', '', '0', '1', 'encoded via pos', '', '2023-08-18 13:50:50', '2023-08-18 13:50:50');
INSERT INTO `tbl_customers` VALUES ('1175', 'Saad', '.', '', '0', '1', 'encoded via pos', '', '2023-08-18 13:55:52', '2023-08-18 13:55:52');
INSERT INTO `tbl_customers` VALUES ('1176', 'Soquina Efren', '1', '', '0', '1', 'encoded via pos', '', '2023-08-19 12:58:07', '2023-08-19 12:58:07');
INSERT INTO `tbl_customers` VALUES ('1177', 'Sapuay ', '1', '', '0', '1', 'encoded via pos', '', '2023-08-19 13:48:05', '2023-08-19 13:48:05');
INSERT INTO `tbl_customers` VALUES ('1178', 'Banggay Channy', '1', '', '0', '1', 'encoded via pos', '', '2023-08-20 07:28:04', '2023-08-20 07:28:04');
INSERT INTO `tbl_customers` VALUES ('1179', 'Peleyo', '1', '', '0', '11', 'encoded via pos', '', '2023-08-20 08:57:17', '2023-08-20 08:57:17');
INSERT INTO `tbl_customers` VALUES ('1180', 'Hallado Jennifer', '1', '', '0', '1', 'encoded via pos', '', '2023-08-20 10:13:40', '2023-08-20 10:13:40');
INSERT INTO `tbl_customers` VALUES ('1181', 'HKP', '1', '', '0', '1', 'encoded via pos', '', '2023-08-20 11:08:42', '2023-08-20 11:08:42');
INSERT INTO `tbl_customers` VALUES ('1182', 'Eulogio,  Jasmine.', '.', '', '0', '1', 'encoded via pos', '', '2023-08-20 11:24:24', '2023-08-20 11:24:24');
INSERT INTO `tbl_customers` VALUES ('1183', 'Landesa', '1', '', '0', '1', 'encoded via pos', '', '2023-08-20 13:28:18', '2023-08-20 13:28:18');
INSERT INTO `tbl_customers` VALUES ('1184', 'Canto', '1', '', '0', '1', 'encoded via pos', '', '2023-08-20 14:28:17', '2023-08-20 14:28:17');
INSERT INTO `tbl_customers` VALUES ('1185', 'Jonas, Wennie', '..', '', '0', '.', 'encoded via pos', '', '2023-08-20 15:17:29', '2023-08-20 15:17:29');
INSERT INTO `tbl_customers` VALUES ('1186', 'Manuel', '.', '', '0', '.', 'encoded via pos', '', '2023-08-21 08:16:28', '2023-08-21 08:16:28');
INSERT INTO `tbl_customers` VALUES ('1187', 'Lechugas', '1', '', '0', '1', 'encoded via pos', '', '2023-08-21 08:47:26', '2023-08-21 08:47:26');
INSERT INTO `tbl_customers` VALUES ('1188', 'Murao', '1', '', '0', '11', 'encoded via pos', '', '2023-08-21 10:21:41', '2023-08-21 10:21:41');
INSERT INTO `tbl_customers` VALUES ('1189', 'Abuan neng', '1', '', '0', '1', 'encoded via pos', '', '2023-08-21 12:01:53', '2023-08-21 12:01:53');
INSERT INTO `tbl_customers` VALUES ('1190', 'Parenas', '1', '', '0', '1', 'encoded via pos', '', '2023-08-21 15:45:48', '2023-08-21 15:45:48');
INSERT INTO `tbl_customers` VALUES ('1191', 'Ambane', '1', '', '0', '1', 'encoded via pos', '', '2023-08-22 10:00:38', '2023-08-22 10:00:38');
INSERT INTO `tbl_customers` VALUES ('1192', 'Dumagpe Rodeito', '1', '', '0', '1', 'encoded via pos', '', '2023-08-22 11:02:12', '2023-08-22 11:02:12');
INSERT INTO `tbl_customers` VALUES ('1193', 'Adapan Micheal', '1', '', '0', '1', 'encoded via pos', '', '2023-08-22 13:18:51', '2023-08-22 13:18:51');
INSERT INTO `tbl_customers` VALUES ('1194', 'Obing', '.', '', '0', '3', 'encoded via pos', '', '2023-08-22 13:59:43', '2023-08-22 13:59:43');
INSERT INTO `tbl_customers` VALUES ('1195', 'Poblico', '1', '', '0', '1', 'encoded via pos', '', '2023-08-22 14:24:40', '2023-08-22 14:24:40');
INSERT INTO `tbl_customers` VALUES ('1196', 'Pabaquil', '1', '', '0', '1', 'encoded via pos', '', '2023-08-22 14:28:58', '2023-08-22 14:28:58');
INSERT INTO `tbl_customers` VALUES ('1197', 'Cabatuan', '.', '', '0', '.', 'encoded via pos', '', '2023-08-22 14:29:05', '2023-08-22 14:29:05');
INSERT INTO `tbl_customers` VALUES ('1198', 'Amico', '1', '', '0', '1', 'encoded via pos', '', '2023-08-22 15:26:19', '2023-08-22 15:26:19');
INSERT INTO `tbl_customers` VALUES ('1199', 'Lechugas,  Arnold', '1', '', '0', '1', 'encoded via pos', '', '2023-08-23 07:33:46', '2023-08-23 07:33:46');
INSERT INTO `tbl_customers` VALUES ('1200', 'Aljano', '1', '', '0', '1', 'encoded via pos', '', '2023-08-23 09:55:14', '2023-08-23 09:55:14');
INSERT INTO `tbl_customers` VALUES ('1201', 'Nantes', '1', '', '0', '11', 'encoded via pos', '', '2023-08-23 13:07:44', '2023-08-23 13:07:44');
INSERT INTO `tbl_customers` VALUES ('1202', 'Tambog Gapor', '1', '', '0', '1', 'encoded via pos', '', '2023-08-23 13:31:22', '2023-08-23 13:31:22');
INSERT INTO `tbl_customers` VALUES ('1203', 'Almerol', '1', '', '0', '1', 'encoded via pos', '', '2023-08-23 15:20:31', '2023-08-23 15:20:31');
INSERT INTO `tbl_customers` VALUES ('1204', 'Bitogon Dione', '1', '', '0', '1', 'encoded via pos', '', '2023-08-24 08:02:24', '2023-08-24 08:02:24');
INSERT INTO `tbl_customers` VALUES ('1205', 'Emhaddah', '1', '', '0', '1', 'encoded via pos', '', '2023-08-24 08:51:31', '2023-08-24 08:51:31');
INSERT INTO `tbl_customers` VALUES ('1206', 'AMPC', '.', '', '0', '.', 'encoded via pos', '', '2023-08-24 12:00:34', '2023-08-24 12:00:34');
INSERT INTO `tbl_customers` VALUES ('1207', 'Rosal', '1', '', '0', '1', 'encoded via pos', '', '2023-08-24 12:32:54', '2023-08-24 12:32:54');
INSERT INTO `tbl_customers` VALUES ('1208', 'Naranja', '.', '', '0', '.', 'encoded via pos', '', '2023-08-24 15:44:40', '2023-08-24 15:44:40');
INSERT INTO `tbl_customers` VALUES ('1209', 'Albaciete', '..', '', '0', '1', 'encoded via pos', '', '2023-08-25 06:47:11', '2023-08-25 06:47:11');
INSERT INTO `tbl_customers` VALUES ('1210', 'Gundran', '..', '', '0', '1', 'encoded via pos', '', '2023-08-25 09:07:46', '2023-08-25 09:07:46');
INSERT INTO `tbl_customers` VALUES ('1211', 'Balindong', '.', '', '0', '.', 'encoded via pos', '', '2023-08-25 13:15:14', '2023-08-25 13:15:14');
INSERT INTO `tbl_customers` VALUES ('1212', 'Alse', '1', '', '0', '1', 'encoded via pos', '', '2023-08-25 13:29:20', '2023-08-25 13:29:20');
INSERT INTO `tbl_customers` VALUES ('1213', 'Shaik', '1', '', '0', '1', 'encoded via pos', '', '2023-08-25 14:41:08', '2023-08-25 14:41:08');
INSERT INTO `tbl_customers` VALUES ('1214', 'Calon', '1', '', '0', '1', 'encoded via pos', '', '2023-08-25 14:47:35', '2023-08-25 14:47:35');
INSERT INTO `tbl_customers` VALUES ('1215', 'Penat', '.', '', '0', '.', 'encoded via pos', '', '2023-08-26 14:50:12', '2023-08-26 14:50:12');
INSERT INTO `tbl_customers` VALUES ('1216', 'Tamayo, Richard', '1', '', '0', '1', 'encoded via pos', '', '2023-08-26 16:29:46', '2023-08-26 16:29:46');
INSERT INTO `tbl_customers` VALUES ('1217', 'Dana ALEX', '1', '', '0', '1', 'encoded via pos', '', '2023-08-26 16:48:29', '2023-08-26 16:48:29');
INSERT INTO `tbl_customers` VALUES ('1218', 'Belonio, Marecil', '..', '', '0', '2', 'encoded via pos', '', '2023-08-27 07:17:49', '2023-08-27 07:17:49');
INSERT INTO `tbl_customers` VALUES ('1219', 'Orindo', '1', '', '0', '1', 'encoded via pos', '', '2023-08-27 14:03:33', '2023-08-27 14:03:33');
INSERT INTO `tbl_customers` VALUES ('1220', 'Otao', '0', '', '0', '1', 'encoded via pos', '', '2023-08-27 15:04:52', '2023-08-27 15:04:52');
INSERT INTO `tbl_customers` VALUES ('1221', 'Tambog Khalid', '1', '', '0', '1', 'encoded via pos', '', '2023-08-27 15:06:50', '2023-08-27 15:06:50');
INSERT INTO `tbl_customers` VALUES ('1222', 'AcuÃ±a', '.', '', '0', '.', 'encoded via pos', '', '2023-08-27 16:22:28', '2023-08-27 16:22:28');
INSERT INTO `tbl_customers` VALUES ('1223', 'James, Agape', '..', '', '0', '1', 'encoded via pos', '', '2023-08-28 11:51:44', '2023-08-28 11:51:44');
INSERT INTO `tbl_customers` VALUES ('1224', 'Demavivas', '1', '', '0', '1', 'encoded via pos', '', '2023-08-28 12:16:19', '2023-08-28 12:16:19');
INSERT INTO `tbl_customers` VALUES ('1225', 'Parido', '1', '', '0', '1', 'encoded via pos', '', '2023-08-28 12:21:10', '2023-08-28 12:21:10');
INSERT INTO `tbl_customers` VALUES ('1226', 'Balintongog', '1', '', '0', '1', 'encoded via pos', '', '2023-08-29 07:31:52', '2023-08-29 07:31:52');
INSERT INTO `tbl_customers` VALUES ('1227', 'Camino Datu Ali', '1', '', '0', '1', 'encoded via pos', '', '2023-08-29 08:33:02', '2023-08-29 08:33:02');
INSERT INTO `tbl_customers` VALUES ('1228', 'Aramba Gapor', '1', '', '0', '1', 'encoded via pos', '', '2023-08-29 13:29:25', '2023-08-29 13:29:25');
INSERT INTO `tbl_customers` VALUES ('1229', 'Carob', '1', '', '0', '1', 'encoded via pos', '', '2023-08-30 06:25:09', '2023-08-30 06:25:09');
INSERT INTO `tbl_customers` VALUES ('1230', 'Ballentes', '1', '', '0', '1', 'encoded via pos', '', '2023-08-31 17:22:33', '2023-08-31 17:22:33');
INSERT INTO `tbl_customers` VALUES ('1231', 'Morales', '1', '', '0', '11', 'encoded via pos', '', '2023-09-01 09:41:13', '2023-09-01 09:41:13');
INSERT INTO `tbl_customers` VALUES ('1232', 'Pofitiado', '1', '', '0', '1', 'encoded via pos', '', '2023-09-02 07:34:09', '2023-09-02 07:34:09');
INSERT INTO `tbl_customers` VALUES ('1233', 'Pagulong', '1', '', '0', '1', 'encoded via pos', '', '2023-09-02 09:22:33', '2023-09-02 09:22:33');
INSERT INTO `tbl_customers` VALUES ('1234', 'Batua', '1', '', '0', '11', 'encoded via pos', '', '2023-09-02 16:11:50', '2023-09-02 16:11:50');
INSERT INTO `tbl_customers` VALUES ('1235', 'Langcuas', '1', '', '0', '1', 'encoded via pos', '', '2023-09-05 07:01:43', '2023-09-05 07:01:43');
INSERT INTO `tbl_customers` VALUES ('1236', 'Pagayon', '1', '', '0', '11', 'encoded via pos', '', '2023-09-05 12:56:52', '2023-09-05 12:56:52');
INSERT INTO `tbl_customers` VALUES ('1237', 'Porras', '1', '', '0', '1', 'encoded via pos', '', '2023-09-06 05:52:27', '2023-09-06 05:52:27');
INSERT INTO `tbl_customers` VALUES ('1238', 'Belonio', '1', '', '0', '1', 'encoded via pos', '', '2023-09-06 09:37:42', '2023-09-06 09:37:42');
INSERT INTO `tbl_customers` VALUES ('1239', 'Ventura, Rudy', '.', '', '0', '.', 'encoded via pos', '', '2023-09-06 12:58:32', '2023-09-06 12:58:32');
INSERT INTO `tbl_customers` VALUES ('1240', 'De Pedro', '.2', '', '0', '2', 'encoded via pos', '', '2023-09-06 15:23:04', '2023-09-06 15:23:04');
INSERT INTO `tbl_customers` VALUES ('1241', 'Romeo', '1', '', '0', '1', 'encoded via pos', '', '2023-09-06 15:25:57', '2023-09-06 15:25:57');
INSERT INTO `tbl_customers` VALUES ('1242', 'Latriz Jeje', '1', '', '0', '1', 'encoded via pos', '', '2023-09-07 06:41:07', '2023-09-07 06:41:07');
INSERT INTO `tbl_customers` VALUES ('1243', 'Loquiro', '1', '', '0', '1', 'encoded via pos', '', '2023-09-07 06:59:50', '2023-09-07 06:59:50');
INSERT INTO `tbl_customers` VALUES ('1244', 'Coronel', '.', '', '0', '.', 'encoded via pos', '', '2023-09-07 09:14:37', '2023-09-07 09:14:37');
INSERT INTO `tbl_customers` VALUES ('1245', 'Bautista', '1', '', '0', '1', 'encoded via pos', '', '2023-09-07 12:25:24', '2023-09-07 12:25:24');
INSERT INTO `tbl_customers` VALUES ('1246', 'Rosaldo', '0', '', '0', '0', 'encoded via pos', '', '2023-09-07 12:55:12', '2023-09-07 12:55:12');
INSERT INTO `tbl_customers` VALUES ('1247', 'Cristy Barrion', '1', '', '0', '1', 'encoded via pos', '', '2023-09-07 13:24:08', '2023-09-07 13:24:08');
INSERT INTO `tbl_customers` VALUES ('1248', 'Bacus Rebicca', '1', '', '0', '1', 'encoded via pos', '', '2023-09-07 15:01:45', '2023-09-07 15:01:45');
INSERT INTO `tbl_customers` VALUES ('1249', 'Cayanan', '1', '', '0', '1', 'encoded via pos', '', '2023-09-08 06:48:31', '2023-09-08 06:48:31');
INSERT INTO `tbl_customers` VALUES ('1250', 'Gayo lyn', '1', '', '0', '1', 'encoded via pos', '', '2023-09-08 11:55:03', '2023-09-08 11:55:03');
INSERT INTO `tbl_customers` VALUES ('1251', 'Marquez', '0', '', '0', '1', 'encoded via pos', '', '2023-09-08 13:27:55', '2023-09-08 13:27:55');
INSERT INTO `tbl_customers` VALUES ('1252', 'Macararap', '1', '', '0', '1', 'encoded via pos', '', '2023-09-08 13:44:05', '2023-09-08 13:44:05');
INSERT INTO `tbl_customers` VALUES ('1253', 'Carrido', '1', '', '0', '1', 'encoded via pos', '', '2023-09-08 15:45:44', '2023-09-08 15:45:44');
INSERT INTO `tbl_customers` VALUES ('1254', 'Loyola', '1', '', '0', '1', 'encoded via pos', '', '2023-09-08 16:01:42', '2023-09-08 16:01:42');
INSERT INTO `tbl_customers` VALUES ('1255', 'Kadil', '1', '', '0', '1', 'encoded via pos', '', '2023-09-09 10:47:47', '2023-09-09 10:47:47');
INSERT INTO `tbl_customers` VALUES ('1256', ' Artazona', '1', '', '0', '1', 'encoded via pos', '', '2023-09-09 10:59:17', '2023-09-09 10:59:17');
INSERT INTO `tbl_customers` VALUES ('1257', 'Tahunyo', '1', '', '0', '1', 'encoded via pos', '', '2023-09-09 15:18:35', '2023-09-09 15:18:35');
INSERT INTO `tbl_customers` VALUES ('1258', 'Macalanggan', '1', '', '0', '1', 'encoded via pos', '', '2023-09-09 15:24:37', '2023-09-09 15:24:37');
INSERT INTO `tbl_customers` VALUES ('1259', 'DequiÃ±a', '1', '', '0', '1', 'encoded via pos', '', '2023-09-09 16:28:00', '2023-09-09 16:28:00');
INSERT INTO `tbl_customers` VALUES ('1260', 'Agustin', '1', '', '0', '1', 'encoded via pos', '', '2023-09-10 06:04:09', '2023-09-10 06:04:09');
INSERT INTO `tbl_customers` VALUES ('1261', 'Ilagan', '1', '', '0', '1', 'encoded via pos', '', '2023-09-10 11:09:32', '2023-09-10 11:09:32');
INSERT INTO `tbl_customers` VALUES ('1262', 'Lanestosa', '1', '', '0', '11', 'encoded via pos', '', '2023-09-10 13:18:14', '2023-09-10 13:18:14');
INSERT INTO `tbl_customers` VALUES ('1263', 'Tobalado', '1', '', '0', '11', 'encoded via pos', '', '2023-09-10 15:07:46', '2023-09-10 15:07:46');
INSERT INTO `tbl_customers` VALUES ('1264', 'Ballentes Darwin', '1', '', '0', '1', 'encoded via pos', '', '2023-09-10 15:36:24', '2023-09-10 15:36:24');
INSERT INTO `tbl_customers` VALUES ('1265', 'Balabagan', '1', '', '0', '1', 'encoded via pos', '', '2023-09-11 08:47:47', '2023-09-11 08:47:47');
INSERT INTO `tbl_customers` VALUES ('1266', 'Pabilona, Jhon2', '1', '', '0', '11', 'encoded via pos', '', '2023-09-11 13:20:28', '2023-09-11 13:20:28');
INSERT INTO `tbl_customers` VALUES ('1267', 'Elhig, Miller', '..', '', '0', '1', 'encoded via pos', '', '2023-09-11 17:37:20', '2023-09-11 17:37:20');
INSERT INTO `tbl_customers` VALUES ('1268', 'Balairos', '1', '', '0', '1', 'encoded via pos', '', '2023-09-12 12:59:03', '2023-09-12 12:59:03');
INSERT INTO `tbl_customers` VALUES ('1269', 'Genodia', '1', '', '0', '1', 'encoded via pos', '', '2023-09-12 13:22:43', '2023-09-12 13:22:43');
INSERT INTO `tbl_customers` VALUES ('1270', 'Costodio', '1', '', '0', '1', 'encoded via pos', '', '2023-09-13 13:31:03', '2023-09-13 13:31:03');
INSERT INTO `tbl_customers` VALUES ('1271', 'DueÃ±as', '1', '', '0', '1', 'encoded via pos', '', '2023-09-13 14:12:52', '2023-09-13 14:12:52');
INSERT INTO `tbl_customers` VALUES ('1272', 'Vedra', '1', '', '0', '1', 'encoded via pos', '', '2023-09-13 16:10:35', '2023-09-13 16:10:35');
INSERT INTO `tbl_customers` VALUES ('1273', 'Macasaet', '1', '', '0', '1', 'encoded via pos', '', '2023-09-14 06:16:20', '2023-09-14 06:16:20');
INSERT INTO `tbl_customers` VALUES ('1274', 'Catasio', '1', '', '0', '1', 'encoded via pos', '', '2023-09-14 09:04:07', '2023-09-14 09:04:07');
INSERT INTO `tbl_customers` VALUES ('1275', 'Yudela', '1', '', '0', '1', 'encoded via pos', '', '2023-09-14 09:33:02', '2023-09-14 09:33:02');
INSERT INTO `tbl_customers` VALUES ('1276', 'Cabillo', '1', '', '0', '1', 'encoded via pos', '', '2023-09-14 13:57:38', '2023-09-14 13:57:38');
INSERT INTO `tbl_customers` VALUES ('1277', 'Balacase Carla', '1', '', '0', '1', 'encoded via pos', '', '2023-09-15 09:22:50', '2023-09-15 09:22:50');
INSERT INTO `tbl_customers` VALUES ('1278', 'Esperito', '1', '', '0', '1', 'encoded via pos', '', '2023-09-15 09:43:19', '2023-09-15 09:43:19');
INSERT INTO `tbl_customers` VALUES ('1279', 'Arong Jerald', '1', '', '0', '1', 'encoded via pos', '', '2023-09-15 12:58:39', '2023-09-15 12:58:39');
INSERT INTO `tbl_customers` VALUES ('1280', 'Salolong', '1', '', '0', '1', 'encoded via pos', '', '2023-09-16 14:58:17', '2023-09-16 14:58:17');
INSERT INTO `tbl_customers` VALUES ('1281', 'Guila Mangkong', '1', '', '0', '1', 'encoded via pos', '', '2023-09-17 11:12:31', '2023-09-17 11:12:31');
INSERT INTO `tbl_customers` VALUES ('1282', 'Lopez Jean', '1', '', '0', '1', 'encoded via pos', '', '2023-09-17 12:11:47', '2023-09-17 12:11:47');
INSERT INTO `tbl_customers` VALUES ('1283', 'Abel', '1', '', '0', '1', 'encoded via pos', '', '2023-09-18 08:43:10', '2023-09-18 08:43:10');
INSERT INTO `tbl_customers` VALUES ('1284', 'Barreto Erna', '1', '', '0', '1', 'encoded via pos', '', '2023-09-18 09:47:04', '2023-09-18 09:47:04');
INSERT INTO `tbl_customers` VALUES ('1285', 'Lantib Amaluden', '1', '', '0', '1', 'encoded via pos', '', '2023-09-18 10:40:11', '2023-09-18 10:40:11');
INSERT INTO `tbl_customers` VALUES ('1286', 'Batucan', '1', '', '0', '1', 'encoded via pos', '', '2023-09-19 14:20:41', '2023-09-19 14:20:41');
INSERT INTO `tbl_customers` VALUES ('1287', 'Songcuya Bato', '1', '', '0', '1', 'encoded via pos', '', '2023-09-19 14:48:02', '2023-09-19 14:48:02');
INSERT INTO `tbl_customers` VALUES ('1288', 'Lapos Geralde', '1', '', '0', '1', 'encoded via pos', '', '2023-09-19 15:26:26', '2023-09-19 15:26:26');
INSERT INTO `tbl_customers` VALUES ('1289', 'Pano Cartagena', '1', '', '0', '1', 'encoded via pos', '', '2023-09-19 15:41:52', '2023-09-19 15:41:52');
INSERT INTO `tbl_customers` VALUES ('1290', 'Anton Raisa', '1', '', '0', '1', 'encoded via pos', '', '2023-09-19 15:55:18', '2023-09-19 15:55:18');
INSERT INTO `tbl_customers` VALUES ('1291', 'Darangka', '1', '', '0', '1', 'encoded via pos', '', '2023-09-19 17:01:07', '2023-09-19 17:01:07');
INSERT INTO `tbl_customers` VALUES ('1292', 'Barber', '1', '', '0', '1', 'encoded via pos', '', '2023-09-20 13:40:46', '2023-09-20 13:40:46');
INSERT INTO `tbl_customers` VALUES ('1293', 'Igar Jessie', '1', '', '0', '1', 'encoded via pos', '', '2023-09-20 15:32:48', '2023-09-20 15:32:48');
INSERT INTO `tbl_customers` VALUES ('1294', 'Comindador', '1', '', '0', '1', 'encoded via pos', '', '2023-09-21 07:42:06', '2023-09-21 07:42:06');
INSERT INTO `tbl_customers` VALUES ('1295', 'Butalid Ranel', '1', '', '0', '1', 'encoded via pos', '', '2023-09-21 08:51:24', '2023-09-21 08:51:24');
INSERT INTO `tbl_customers` VALUES ('1296', 'Makabago', '1', '', '0', '1', 'encoded via pos', '', '2023-09-21 13:19:58', '2023-09-21 13:19:58');
INSERT INTO `tbl_customers` VALUES ('1297', 'Galyo', '1', '', '0', '11', 'encoded via pos', '', '2023-09-26 12:23:24', '2023-09-26 12:23:24');
INSERT INTO `tbl_customers` VALUES ('1298', 'Balboa', '.', '', '0', '1', 'encoded via pos', '', '2023-09-27 07:27:43', '2023-09-27 07:27:43');
INSERT INTO `tbl_customers` VALUES ('1299', 'Bierneza', '1', '', '0', '1', 'encoded via pos', '', '2023-09-27 08:10:35', '2023-09-27 08:10:35');
INSERT INTO `tbl_customers` VALUES ('1300', 'Catiil', '1', '', '0', '11', 'encoded via pos', '', '2023-09-29 10:00:21', '2023-09-29 10:00:21');
INSERT INTO `tbl_customers` VALUES ('1301', 'Santotome, Ging2x', '1', '', '0', '1', 'encoded via pos', '', '2023-09-29 10:13:15', '2023-09-29 10:13:15');
INSERT INTO `tbl_customers` VALUES ('1302', 'Silvano', '1', '', '0', '1', 'encoded via pos', '', '2023-09-29 13:43:44', '2023-09-29 13:43:44');
INSERT INTO `tbl_customers` VALUES ('1303', 'Aramba Rhael', '1', '', '0', '1', 'encoded via pos', '', '2023-09-29 15:11:58', '2023-09-29 15:11:58');
INSERT INTO `tbl_customers` VALUES ('1304', 'Parhael', '1', '', '0', '1', 'encoded via pos', '', '2023-09-30 12:09:44', '2023-09-30 12:09:44');
INSERT INTO `tbl_customers` VALUES ('1305', 'Parcon, Lemuel', '.', '', '0', '1', 'encoded via pos', '', '2023-10-01 14:23:58', '2023-10-01 14:23:58');
INSERT INTO `tbl_customers` VALUES ('1306', 'Ugali', '1', '', '0', '1', 'encoded via pos', '', '2023-10-02 06:51:42', '2023-10-02 06:51:42');
INSERT INTO `tbl_customers` VALUES ('1307', 'Tayros', '1', '', '0', '1', 'encoded via pos', '', '2023-10-02 11:23:09', '2023-10-02 11:23:09');
INSERT INTO `tbl_customers` VALUES ('1308', 'Singbano', '1', '', '0', '1', 'encoded via pos', '', '2023-10-04 10:34:05', '2023-10-04 10:34:05');
INSERT INTO `tbl_customers` VALUES ('1309', 'Abatayo', '1', '', '0', '11', 'encoded via pos', '', '2023-10-05 08:10:23', '2023-10-05 08:10:23');
INSERT INTO `tbl_customers` VALUES ('1310', 'Jerry Lechugas', 'Paradise', '....', '0', '09635541529', '.', '', '2023-10-07 11:52:48', '2023-10-07 11:52:48');
INSERT INTO `tbl_customers` VALUES ('1311', 'Magarso', '1', '', '0', '1', 'encoded via pos', '', '2023-10-10 14:54:13', '2023-10-10 14:54:13');
INSERT INTO `tbl_customers` VALUES ('1312', 'Pacheco', '1', '', '0', '1', 'encoded via pos', '', '2023-10-10 16:55:46', '2023-10-10 16:55:46');
INSERT INTO `tbl_customers` VALUES ('1313', 'Charina Adame', 'Kibawe', '.', '0', '.', '.', '', '2023-10-11 09:55:56', '2023-10-11 09:55:56');
INSERT INTO `tbl_customers` VALUES ('1314', 'Laungayan, Apulo', '1', '', '0', '1', 'encoded via pos', '', '2023-10-14 16:33:21', '2023-10-14 16:33:21');
INSERT INTO `tbl_customers` VALUES ('1315', 'Lambayang ', '1', '', '0', '1', 'encoded via pos', '', '2023-10-16 08:17:21', '2023-10-16 08:17:21');
INSERT INTO `tbl_customers` VALUES ('1316', 'Toto Agway', '1', '', '0', '1', 'encoded via pos', '', '2023-10-17 05:58:44', '2023-10-17 05:58:44');
INSERT INTO `tbl_customers` VALUES ('1317', 'Ling2x', '1', '', '0', '1', 'encoded via pos', '', '2023-10-17 15:04:06', '2023-10-17 15:04:06');
INSERT INTO `tbl_customers` VALUES ('1318', 'Ambral', '1', '', '0', '1', 'encoded via pos', '', '2023-10-18 07:16:54', '2023-10-18 07:16:54');
INSERT INTO `tbl_customers` VALUES ('1319', 'Pavillar', '.', '', '0', '.', 'encoded via pos', '', '2023-10-18 10:07:41', '2023-10-18 10:07:41');
INSERT INTO `tbl_customers` VALUES ('1320', 'Gio Mildren', '1', '', '0', '11', 'encoded via pos', '', '2023-10-19 09:58:23', '2023-10-19 09:58:23');
INSERT INTO `tbl_customers` VALUES ('1321', 'ric-ric molina', '1', '', '0', '1', 'encoded via pos', '', '2023-10-19 14:59:08', '2023-10-19 14:59:08');
INSERT INTO `tbl_customers` VALUES ('1322', 'Cabilla Mylene', '1', '', '0', '1', 'encoded via pos', '', '2023-10-19 16:01:11', '2023-10-19 16:01:11');
INSERT INTO `tbl_customers` VALUES ('1323', 'Madriaga N', '1', '', '0', '1', 'encoded via pos', '', '2023-10-20 11:34:08', '2023-10-20 11:34:08');
INSERT INTO `tbl_customers` VALUES ('1324', 'Puassa', '1', '', '0', '1', 'encoded via pos', '', '2023-10-21 08:03:07', '2023-10-21 08:03:07');
INSERT INTO `tbl_customers` VALUES ('1325', 'Christine Jane Caro', '1', '', '0', '1', 'encoded via pos', '', '2023-10-21 12:33:46', '2023-10-21 12:33:46');
INSERT INTO `tbl_customers` VALUES ('1326', 'bilbar', '1', '', '0', '1', 'encoded via pos', '', '2023-10-22 16:20:33', '2023-10-22 16:20:33');
INSERT INTO `tbl_customers` VALUES ('1327', 'Palconite Grezilda', '1', '', '0', '1', 'encoded via pos', '', '2023-10-23 12:23:23', '2023-10-23 12:23:23');
INSERT INTO `tbl_customers` VALUES ('1328', 'Cadil', '.', '', '0', '1', 'encoded via pos', '', '2023-10-23 13:07:36', '2023-10-23 13:07:36');
INSERT INTO `tbl_customers` VALUES ('1329', 'Laungayan, J', '.', '', '0', '3', 'encoded via pos', '', '2023-10-23 13:36:53', '2023-10-23 13:36:53');
INSERT INTO `tbl_customers` VALUES ('1330', 'Gayak', '.', '', '0', '.', 'encoded via pos', '', '2023-10-23 15:32:44', '2023-10-23 15:32:44');
INSERT INTO `tbl_customers` VALUES ('1331', 'J and C AGRIVET', '1', '', '0', '1', 'encoded via pos', '', '2023-10-24 08:03:32', '2023-10-24 08:03:32');
INSERT INTO `tbl_customers` VALUES ('1332', 'Lantib', '1', '', '0', '1', 'encoded via pos', '', '2023-10-24 16:16:54', '2023-10-24 16:16:54');
INSERT INTO `tbl_customers` VALUES ('1333', 'jerusalem', '1', '', '0', '1', 'encoded via pos', '', '2023-10-25 09:37:04', '2023-10-25 09:37:04');
INSERT INTO `tbl_customers` VALUES ('1334', 'Anecito-Evo Gene', '1', '', '0', '11', 'encoded via pos', '', '2023-10-26 11:51:26', '2023-10-26 11:51:26');
INSERT INTO `tbl_customers` VALUES ('1335', 'Li-os', '1', '', '0', '1', 'encoded via pos', '', '2023-10-27 09:34:46', '2023-10-27 09:34:46');
INSERT INTO `tbl_customers` VALUES ('1336', 'Mondejar', '.', '', '0', '.', 'encoded via pos', '', '2023-10-27 15:47:15', '2023-10-27 15:47:15');
INSERT INTO `tbl_customers` VALUES ('1337', 'Amita', '1', '', '0', '11', 'encoded via pos', '', '2023-10-29 15:25:13', '2023-10-29 15:25:13');
INSERT INTO `tbl_customers` VALUES ('1338', 'Camral', '1', '', '0', '1', 'encoded via pos', '', '2023-10-30 10:48:37', '2023-10-30 10:48:37');
INSERT INTO `tbl_customers` VALUES ('1339', 'Dela Cruz Nelson', '1', '', '0', '1', 'encoded via pos', '', '2023-10-30 14:50:26', '2023-10-30 14:50:26');
INSERT INTO `tbl_customers` VALUES ('1340', 'Edris', '21', '', '0', '1', 'encoded via pos', '', '2023-10-31 09:05:41', '2023-10-31 09:05:41');
INSERT INTO `tbl_customers` VALUES ('1341', 'Sinyagan', '1', '', '0', '1', 'encoded via pos', '', '2023-10-31 09:33:47', '2023-10-31 09:33:47');
INSERT INTO `tbl_customers` VALUES ('1342', 'QL-Panday', '....', '..', '0', '.', '', '', '2023-11-01 06:40:44', '2023-11-01 06:40:44');
INSERT INTO `tbl_customers` VALUES ('1343', 'QL-Feeds', '.', '.', '0', '.', '', '', '2023-11-01 06:40:59', '2023-11-01 06:40:59');
INSERT INTO `tbl_customers` VALUES ('1344', 'QL-Bugas', '.', '.', '0', '.', '', '', '2023-11-01 06:41:12', '2023-11-01 06:41:12');
INSERT INTO `tbl_customers` VALUES ('1345', 'ymana', 'g', '', '0', 'f', 'encoded via pos', '', '2023-11-01 09:20:35', '2023-11-01 09:20:35');
INSERT INTO `tbl_customers` VALUES ('1346', 'Evangelista', '1', '', '0', '1', 'encoded via pos', '', '2023-11-03 11:24:52', '2023-11-03 11:24:52');
INSERT INTO `tbl_customers` VALUES ('1347', 'enfilipe', '1', '', '0', '1', 'encoded via pos', '', '2023-11-03 14:17:09', '2023-11-03 14:17:09');
INSERT INTO `tbl_customers` VALUES ('1348', 'ruta', 'a', '', '0', 'a', 'encoded via pos', '', '2023-11-04 12:38:50', '2023-11-04 12:38:50');
INSERT INTO `tbl_customers` VALUES ('1349', 'sherwen', 'd', '', '0', 'd', 'encoded via pos', '', '2023-11-04 14:05:14', '2023-11-04 14:05:14');
INSERT INTO `tbl_customers` VALUES ('1350', 'muhal', 'h', '', '0', 'j', 'encoded via pos', '', '2023-11-05 09:00:42', '2023-11-05 09:00:42');
INSERT INTO `tbl_customers` VALUES ('1351', 'Roy Cabacuy', '.', '', '0', '.', 'encoded via pos', '', '2023-11-05 17:11:54', '2023-11-05 17:11:54');
INSERT INTO `tbl_customers` VALUES ('1352', 'Cavalpin', '1', '', '0', '1', 'encoded via pos', '', '2023-11-06 10:10:40', '2023-11-06 10:10:40');
INSERT INTO `tbl_customers` VALUES ('1353', 'Amansi', '1', '', '0', '1', 'encoded via pos', '', '2023-11-07 13:55:02', '2023-11-07 13:55:02');
INSERT INTO `tbl_customers` VALUES ('1354', 'Camero', '1', '', '0', '1', 'encoded via pos', '', '2023-11-07 15:17:23', '2023-11-07 15:17:23');
INSERT INTO `tbl_customers` VALUES ('1355', 'Jomar', '.', '', '0', '.', 'encoded via pos', '', '2023-11-10 09:50:56', '2023-11-10 09:50:56');
INSERT INTO `tbl_customers` VALUES ('1356', 'Membalawag', '.', '', '0', '.', 'encoded via pos', '', '2023-11-10 17:05:40', '2023-11-10 17:05:40');
INSERT INTO `tbl_customers` VALUES ('1357', 'Madki', '.', '', '0', '.', 'encoded via pos', '', '2023-11-11 11:36:45', '2023-11-11 11:36:45');
INSERT INTO `tbl_customers` VALUES ('1358', 'Angumbaw Saidali', '1', '', '0', '1', 'encoded via pos', '', '2023-11-11 11:45:56', '2023-11-11 11:45:56');
INSERT INTO `tbl_customers` VALUES ('1359', 'Somolostro', '1', '', '0', '1', 'encoded via pos', '', '2023-11-12 10:23:18', '2023-11-12 10:23:18');
INSERT INTO `tbl_customers` VALUES ('1360', 'Ambot', '1', '', '0', '1', 'encoded via pos', '', '2023-11-12 11:12:30', '2023-11-12 11:12:30');
INSERT INTO `tbl_customers` VALUES ('1361', 'Tagchem Berto', '1', '', '0', '1', 'encoded via pos', '', '2023-11-12 12:49:46', '2023-11-12 12:49:46');
INSERT INTO `tbl_customers` VALUES ('1362', 'Mamaylao', '1', '', '0', '1', 'encoded via pos', '', '2023-11-12 17:09:50', '2023-11-12 17:09:50');
INSERT INTO `tbl_customers` VALUES ('1363', 'Mamandiya Norodin', '1', '', '0', '1', 'encoded via pos', '', '2023-11-13 09:05:02', '2023-11-13 09:05:02');
INSERT INTO `tbl_customers` VALUES ('1364', 'alim', 'k', '', '0', 'k', 'encoded via pos', '', '2023-11-13 13:05:57', '2023-11-13 13:05:57');
INSERT INTO `tbl_customers` VALUES ('1365', 'Alarilla', '1', '', '0', '1', 'encoded via pos', '', '2023-11-13 13:07:18', '2023-11-13 13:07:18');
INSERT INTO `tbl_customers` VALUES ('1366', 'Nacion', '.', '', '0', '.', 'encoded via pos', '', '2023-11-14 05:34:41', '2023-11-14 05:34:41');
INSERT INTO `tbl_customers` VALUES ('1367', 'Arqiullas', '1', '', '0', '1', 'encoded via pos', '', '2023-11-14 05:42:19', '2023-11-14 05:42:19');
INSERT INTO `tbl_customers` VALUES ('1368', 'Labor- JR', '1', '', '0', '1', 'encoded via pos', '', '2023-11-14 07:15:20', '2023-11-14 07:15:20');
INSERT INTO `tbl_customers` VALUES ('1369', 'Antao', '1', '', '0', '1', 'encoded via pos', '', '2023-11-14 08:00:31', '2023-11-14 08:00:31');
INSERT INTO `tbl_customers` VALUES ('1370', 'devinagrasia', '1', '', '0', '1', 'encoded via pos', '', '2023-11-14 08:43:11', '2023-11-14 08:43:11');
INSERT INTO `tbl_customers` VALUES ('1371', 'Lamada', '1', '', '0', '1', 'encoded via pos', '', '2023-11-14 10:49:53', '2023-11-14 10:49:53');
INSERT INTO `tbl_customers` VALUES ('1372', 'Panes Orlic', '1', '', '0', '1', 'encoded via pos', '', '2023-11-14 12:19:59', '2023-11-14 12:19:59');
INSERT INTO `tbl_customers` VALUES ('1373', 'Bartolo', '1', '', '0', '1', 'encoded via pos', '', '2023-11-14 13:11:05', '2023-11-14 13:11:05');
INSERT INTO `tbl_customers` VALUES ('1374', 'Bayoneta', '1', '', '0', '1', 'encoded via pos', '', '2023-11-14 13:32:05', '2023-11-14 13:32:05');
INSERT INTO `tbl_customers` VALUES ('1375', 'Pobleti', '1', '', '0', 'Poblite', 'encoded via pos', '', '2023-11-14 14:38:28', '2023-11-14 14:38:28');
INSERT INTO `tbl_customers` VALUES ('1376', 'Dakiling', '1', '', '0', '1', 'encoded via pos', '', '2023-11-14 16:15:26', '2023-11-14 16:15:26');
INSERT INTO `tbl_customers` VALUES ('1377', 'Baldelovar', '1', '', '0', '1', 'encoded via pos', '', '2023-11-15 07:30:51', '2023-11-15 07:30:51');
INSERT INTO `tbl_customers` VALUES ('1378', 'Guiamlod', '1', '', '0', '1', 'encoded via pos', '', '2023-11-15 15:30:21', '2023-11-15 15:30:21');
INSERT INTO `tbl_customers` VALUES ('1379', 'Oransang', '1', '', '0', '1', 'encoded via pos', '', '2023-11-15 15:39:01', '2023-11-15 15:39:01');
INSERT INTO `tbl_customers` VALUES ('1380', 'Demandante', '1', '', '0', '1', 'encoded via pos', '', '2023-11-16 09:00:23', '2023-11-16 09:00:23');
INSERT INTO `tbl_customers` VALUES ('1381', 'Oding', '1', '', '0', '1', 'encoded via pos', '', '2023-11-16 10:02:59', '2023-11-16 10:02:59');
INSERT INTO `tbl_customers` VALUES ('1382', 'Madjie', '1', '', '0', '11', 'encoded via pos', '', '2023-11-16 10:59:55', '2023-11-16 10:59:55');
INSERT INTO `tbl_customers` VALUES ('1383', 'Butalid', '1', '', '0', '1', 'encoded via pos', '', '2023-11-16 11:24:33', '2023-11-16 11:24:33');
INSERT INTO `tbl_customers` VALUES ('1384', 'fabrineca', '1', '', '0', ';', 'encoded via pos', '', '2023-11-16 12:06:37', '2023-11-16 12:06:37');
INSERT INTO `tbl_customers` VALUES ('1385', '1', '1', '', '0', '1', 'encoded via pos', '', '2023-11-16 12:23:48', '2023-11-16 12:23:48');
INSERT INTO `tbl_customers` VALUES ('1386', 'matio', 'o', '', '0', 'o', 'encoded via pos', '', '2023-11-17 11:17:42', '2023-11-17 11:17:42');
INSERT INTO `tbl_customers` VALUES ('1387', 'Malawi', '11', '', '0', '1', 'encoded via pos', '', '2023-11-17 14:57:40', '2023-11-17 14:57:40');
INSERT INTO `tbl_customers` VALUES ('1388', 'Adaro', '.', '', '0', '.', 'encoded via pos', '', '2023-11-17 15:41:11', '2023-11-17 15:41:11');
INSERT INTO `tbl_customers` VALUES ('1389', 'Makalalim Mylene', '1', '', '0', '1', 'encoded via pos', '', '2023-11-17 15:46:05', '2023-11-17 15:46:05');
INSERT INTO `tbl_customers` VALUES ('1390', 'Gensan Planters Supply', '1', '', '0', '1', 'encoded via pos', '', '2023-11-18 10:17:25', '2023-11-18 10:17:25');
INSERT INTO `tbl_customers` VALUES ('1391', 'Nepo N.', '1', '', '0', '14', 'encoded via pos', '', '2023-11-18 14:44:17', '2023-11-18 14:44:17');
INSERT INTO `tbl_customers` VALUES ('1392', 'Esperito Rolando', '1', '', '0', '1', 'encoded via pos', '', '2023-11-19 08:40:02', '2023-11-19 08:40:02');
INSERT INTO `tbl_customers` VALUES ('1393', 'Cabasara', '0', '', '0', '0', 'encoded via pos', '', '2023-11-19 09:21:47', '2023-11-19 09:21:47');
INSERT INTO `tbl_customers` VALUES ('1394', 'Gantalao Junjie', '1', '', '0', '1', 'encoded via pos', '', '2023-11-19 10:16:27', '2023-11-19 10:16:27');
INSERT INTO `tbl_customers` VALUES ('1395', 'Bulig', '1', '', '0', '1', 'encoded via pos', '', '2023-11-19 14:41:07', '2023-11-19 14:41:07');
INSERT INTO `tbl_customers` VALUES ('1396', 'Geslati', '1', '', '0', '1', 'encoded via pos', '', '2023-11-19 16:10:56', '2023-11-19 16:10:56');
INSERT INTO `tbl_customers` VALUES ('1397', 'Lawa', '1', '', '0', '1', 'encoded via pos', '', '2023-11-20 09:24:15', '2023-11-20 09:24:15');
INSERT INTO `tbl_customers` VALUES ('1398', 'Palita', '1', '', '0', '1', 'encoded via pos', '', '2023-11-20 11:09:38', '2023-11-20 11:09:38');
INSERT INTO `tbl_customers` VALUES ('1399', 'Dima-uddang', '1', '', '0', '1', 'encoded via pos', '', '2023-11-21 12:38:32', '2023-11-21 12:38:32');
INSERT INTO `tbl_customers` VALUES ('1400', 'Osman', '1', '', '0', '1', 'encoded via pos', '', '2023-11-22 07:39:59', '2023-11-22 07:39:59');
INSERT INTO `tbl_customers` VALUES ('1401', 'harlata', '1', '', '0', '1', 'encoded via pos', '', '2023-11-22 08:51:30', '2023-11-22 08:51:30');
INSERT INTO `tbl_customers` VALUES ('1402', 'francesco', '1', '', '0', '1', 'encoded via pos', '', '2023-11-22 09:03:33', '2023-11-22 09:03:33');
INSERT INTO `tbl_customers` VALUES ('1403', 'Lacman', '1', '', '0', '1', 'encoded via pos', '', '2023-11-22 09:43:40', '2023-11-22 09:43:40');
INSERT INTO `tbl_customers` VALUES ('1404', 'Jomao-as', '1', '', '0', '1', 'encoded via pos', '', '2023-11-22 11:18:17', '2023-11-22 11:18:17');
INSERT INTO `tbl_customers` VALUES ('1405', 'Robles Joel', '1', '', '0', '11', 'encoded via pos', '', '2023-11-22 11:34:39', '2023-11-22 11:34:39');
INSERT INTO `tbl_customers` VALUES ('1406', 'amad', '1', '', '0', '1', 'encoded via pos', '', '2023-11-22 13:05:48', '2023-11-22 13:05:48');
INSERT INTO `tbl_customers` VALUES ('1407', 'Legarde', '1', '', '0', '1', 'encoded via pos', '', '2023-11-23 09:28:17', '2023-11-23 09:28:17');
INSERT INTO `tbl_customers` VALUES ('1408', 'Elicana', '1', '', '0', '1', 'encoded via pos', '', '2023-11-24 07:19:25', '2023-11-24 07:19:25');
INSERT INTO `tbl_customers` VALUES ('1409', 'Balsado', '1', '', '0', '1', 'encoded via pos', '', '2023-11-24 08:36:05', '2023-11-24 08:36:05');
INSERT INTO `tbl_customers` VALUES ('1410', 'Galabasa', '1', '', '0', '1', 'encoded via pos', '', '2023-11-24 11:32:54', '2023-11-24 11:32:54');
INSERT INTO `tbl_customers` VALUES ('1411', 'Pabiona', '1', '', '0', '1', 'encoded via pos', '', '2023-11-24 12:10:03', '2023-11-24 12:10:03');
INSERT INTO `tbl_customers` VALUES ('1412', 'pumado', 'q', '', '0', 's', 'encoded via pos', '', '2023-11-24 16:08:55', '2023-11-24 16:08:55');
INSERT INTO `tbl_customers` VALUES ('1413', 'Bajao', '1', '', '0', '1', 'encoded via pos', '', '2023-11-24 16:34:09', '2023-11-24 16:34:09');
INSERT INTO `tbl_customers` VALUES ('1414', 'Moreno salvi', '1', '', '0', '1', 'encoded via pos', '', '2023-11-25 06:41:25', '2023-11-25 06:41:25');
INSERT INTO `tbl_customers` VALUES ('1415', 'Franco', '1', '', '0', '1', 'encoded via pos', '', '2023-11-25 10:06:33', '2023-11-25 10:06:33');
INSERT INTO `tbl_customers` VALUES ('1416', 'Hortillosa', '1', '', '0', '1', 'encoded via pos', '', '2023-11-26 08:31:29', '2023-11-26 08:31:29');
INSERT INTO `tbl_customers` VALUES ('1417', 'Malagya', '1', '', '0', '1', 'encoded via pos', '', '2023-11-26 09:41:09', '2023-11-26 09:41:09');
INSERT INTO `tbl_customers` VALUES ('1418', 'Bai Nora Sultan', '1', '', '0', '1', 'encoded via pos', '', '2023-11-26 10:49:06', '2023-11-26 10:49:06');
INSERT INTO `tbl_customers` VALUES ('1419', 'oyong', '1', '', '0', '1', 'encoded via pos', '', '2023-11-26 15:40:03', '2023-11-26 15:40:03');
INSERT INTO `tbl_customers` VALUES ('1420', 'Suarnaba', '11', '', '0', '1]', 'encoded via pos', '', '2023-11-26 15:45:01', '2023-11-26 15:45:01');
INSERT INTO `tbl_customers` VALUES ('1421', 'hamid', 'y', '', '0', 'y', 'encoded via pos', '', '2023-11-27 10:26:34', '2023-11-27 10:26:34');
INSERT INTO `tbl_customers` VALUES ('1422', 'Pepito', '1', '', '0', '1', 'encoded via pos', '', '2023-11-28 06:29:57', '2023-11-28 06:29:57');
INSERT INTO `tbl_customers` VALUES ('1423', 'Balabaran', '1', '', '0', '1', 'encoded via pos', '', '2023-11-28 08:11:33', '2023-11-28 08:11:33');
INSERT INTO `tbl_customers` VALUES ('1424', 'Solidad', '1', '', '0', '1', 'encoded via pos', '', '2023-11-28 08:50:07', '2023-11-28 08:50:07');
INSERT INTO `tbl_customers` VALUES ('1425', 'Valencia', '1', '', '0', '1', 'encoded via pos', '', '2023-11-28 15:20:47', '2023-11-28 15:20:47');
INSERT INTO `tbl_customers` VALUES ('1426', 'Bontilaw', '1', '', '0', '1', 'encoded via pos', '', '2023-11-29 09:20:24', '2023-11-29 09:20:24');
INSERT INTO `tbl_customers` VALUES ('1427', 'Pascugin M.', '1', '', '0', '11', 'encoded via pos', '', '2023-11-29 10:26:20', '2023-11-29 10:26:20');
INSERT INTO `tbl_customers` VALUES ('1428', 'Mai Mona Matala', '1', '', '0', '1', 'encoded via pos', '', '2023-11-29 11:10:49', '2023-11-29 11:10:49');
INSERT INTO `tbl_customers` VALUES ('1429', 'Coronado C.', '1', '', '0', '1', 'encoded via pos', '', '2023-11-29 11:50:36', '2023-11-29 11:50:36');
INSERT INTO `tbl_customers` VALUES ('1430', 'tarotawan', '1', '', '0', '1', 'encoded via pos', '', '2023-11-29 13:39:43', '2023-11-29 13:39:43');
INSERT INTO `tbl_customers` VALUES ('1431', 'canapya', 'f', '', '0', 'f', 'encoded via pos', '', '2023-11-29 14:56:28', '2023-11-29 14:56:28');
INSERT INTO `tbl_customers` VALUES ('1432', 'Eugenry Tinoy', '1', '', '0', '1', 'encoded via pos', '', '2023-11-29 16:20:12', '2023-11-29 16:20:12');
INSERT INTO `tbl_customers` VALUES ('1433', 'berang', 'r', '', '0', 'r', 'encoded via pos', '', '2023-11-30 07:40:02', '2023-11-30 07:40:02');
INSERT INTO `tbl_customers` VALUES ('1434', 'casimelio', 'g', '', '0', 'g', 'encoded via pos', '', '2023-11-30 08:15:47', '2023-11-30 08:15:47');
INSERT INTO `tbl_customers` VALUES ('1435', 'carido', 't', '', '0', 't', 'encoded via pos', '', '2023-11-30 10:46:21', '2023-11-30 10:46:21');
INSERT INTO `tbl_customers` VALUES ('1436', 'Carias', '1', '', '0', '1', 'encoded via pos', '', '2023-11-30 13:27:59', '2023-11-30 13:27:59');
INSERT INTO `tbl_customers` VALUES ('1437', 'villalobos', 'r', '', '0', 'r', 'encoded via pos', '', '2023-11-30 14:33:37', '2023-11-30 14:33:37');
INSERT INTO `tbl_customers` VALUES ('1438', 'Pagaran', '1', '', '0', '1', 'encoded via pos', '', '2023-12-01 11:14:41', '2023-12-01 11:14:41');
INSERT INTO `tbl_customers` VALUES ('1439', 'Cabilla Fely', '1', '', '0', '1', 'encoded via pos', '', '2023-12-01 11:36:28', '2023-12-01 11:36:28');
INSERT INTO `tbl_customers` VALUES ('1440', 'Cabilla Rayben', '1', '', '0', '1', 'encoded via pos', '', '2023-12-01 11:39:53', '2023-12-01 11:39:53');
INSERT INTO `tbl_customers` VALUES ('1441', 'montibon', 'f', '', '0', 'f', 'encoded via pos', '', '2023-12-01 11:42:16', '2023-12-01 11:42:16');
INSERT INTO `tbl_customers` VALUES ('1442', 'Gumban,Merry Joy', '.', '', '0', '.', 'encoded via pos', '', '2023-12-02 09:58:40', '2023-12-02 09:58:40');
INSERT INTO `tbl_customers` VALUES ('1443', 'Hanny Jean', '.', '', '0', '.', 'encoded via pos', '', '2023-12-02 10:18:42', '2023-12-02 10:18:42');
INSERT INTO `tbl_customers` VALUES ('1444', 'Silongan B.', '1', '', '0', '1', 'encoded via pos', '', '2023-12-02 10:48:59', '2023-12-02 10:48:59');
INSERT INTO `tbl_customers` VALUES ('1445', 'puras', 'j', '', '0', 'j', 'encoded via pos', '', '2023-12-02 13:47:29', '2023-12-02 13:47:29');
INSERT INTO `tbl_customers` VALUES ('1446', 'takda', 'u', '', '0', 'u', 'encoded via pos', '', '2023-12-03 11:30:15', '2023-12-03 11:30:15');
INSERT INTO `tbl_customers` VALUES ('1447', 'Baldebarona', 'j', '', '0', 'j', 'encoded via pos', '', '2023-12-04 06:37:09', '2023-12-04 06:37:09');
INSERT INTO `tbl_customers` VALUES ('1448', 'lianto', 'f', '', '0', 'f', 'encoded via pos', '', '2023-12-04 07:04:50', '2023-12-04 07:04:50');
INSERT INTO `tbl_customers` VALUES ('1449', 'Nogia', 'h', '', '0', 'h', 'encoded via pos', '', '2023-12-04 08:37:07', '2023-12-04 08:37:07');
INSERT INTO `tbl_customers` VALUES ('1450', 'kuransang', 'h', '', '0', 'h', 'encoded via pos', '', '2023-12-04 12:37:52', '2023-12-04 12:37:52');
INSERT INTO `tbl_customers` VALUES ('1451', 'Eudela', 'f', '', '0', 'l', 'encoded via pos', '', '2023-12-04 13:02:29', '2023-12-04 13:02:29');
INSERT INTO `tbl_customers` VALUES ('1452', 'Herenio', '.', '', '0', '.', 'encoded via pos', '', '2023-12-05 09:00:01', '2023-12-05 09:00:01');
INSERT INTO `tbl_customers` VALUES ('1453', 'salolog', 'k', '', '0', 'k', 'encoded via pos', '', '2023-12-05 12:58:07', '2023-12-05 12:58:07');
INSERT INTO `tbl_customers` VALUES ('1454', 'Agod', '.', '', '0', '.', 'encoded via pos', '', '2023-12-05 13:48:40', '2023-12-05 13:48:40');
INSERT INTO `tbl_customers` VALUES ('1455', 'augilar', '.', '', '0', '.', 'encoded via pos', '', '2023-12-05 14:43:00', '2023-12-05 14:43:00');
INSERT INTO `tbl_customers` VALUES ('1456', 'arcillas', '.', '', '0', '.', 'encoded via pos', '', '2023-12-06 06:02:22', '2023-12-06 06:02:22');
INSERT INTO `tbl_customers` VALUES ('1457', 'liza', '.', '', '0', '.', 'encoded via pos', '', '2023-12-06 07:52:22', '2023-12-06 07:52:22');
INSERT INTO `tbl_customers` VALUES ('1458', 'Tambog Jamalia', '1', '', '0', '1', 'encoded via pos', '', '2023-12-07 08:13:51', '2023-12-07 08:13:51');
INSERT INTO `tbl_customers` VALUES ('1459', 'Ollero', '1', '', '0', '1', 'encoded via pos', '', '2023-12-07 15:11:41', '2023-12-07 15:11:41');
INSERT INTO `tbl_customers` VALUES ('1460', 'Talusob', '1', '', '0', '1', 'encoded via pos', '', '2023-12-07 16:31:40', '2023-12-07 16:31:40');
INSERT INTO `tbl_customers` VALUES ('1461', 'Delona', '1', '', '0', '1', 'encoded via pos', '', '2023-12-08 07:03:27', '2023-12-08 07:03:27');
INSERT INTO `tbl_customers` VALUES ('1462', 'gubael', 'k', '', '0', 'k', 'encoded via pos', '', '2023-12-08 09:57:54', '2023-12-08 09:57:54');
INSERT INTO `tbl_customers` VALUES ('1463', 'Belando', '1', '', '0', '1', 'encoded via pos', '', '2023-12-08 13:05:23', '2023-12-08 13:05:23');
INSERT INTO `tbl_customers` VALUES ('1464', 'Abubakar', 'h', '', '0', 'h', 'encoded via pos', '', '2023-12-08 14:24:27', '2023-12-08 14:24:27');
INSERT INTO `tbl_customers` VALUES ('1465', 'Lactason', '1', '', '0', '1', 'encoded via pos', '', '2023-12-08 14:58:57', '2023-12-08 14:58:57');
INSERT INTO `tbl_customers` VALUES ('1466', 'Macararam', '1', '', '0', '1', 'encoded via pos', '', '2023-12-08 16:49:32', '2023-12-08 16:49:32');
INSERT INTO `tbl_customers` VALUES ('1467', 'Macapintal', '1', '', '0', '1', 'encoded via pos', '', '2023-12-09 12:41:20', '2023-12-09 12:41:20');
INSERT INTO `tbl_customers` VALUES ('1468', 'Caspe', '.', '', '0', '.', 'encoded via pos', '', '2023-12-10 05:39:25', '2023-12-10 05:39:25');
INSERT INTO `tbl_customers` VALUES ('1469', 'amino', '.', '', '0', '.', 'encoded via pos', '', '2023-12-10 05:44:49', '2023-12-10 05:44:49');
INSERT INTO `tbl_customers` VALUES ('1470', 'Adjuberan', '1', '', '0', '1', 'encoded via pos', '', '2023-12-10 08:57:44', '2023-12-10 08:57:44');
INSERT INTO `tbl_customers` VALUES ('1471', 'Mamareta', '1', '', '0', '1', 'encoded via pos', '', '2023-12-10 12:27:36', '2023-12-10 12:27:36');
INSERT INTO `tbl_customers` VALUES ('1472', 'Encas', '1', '', '0', '1', 'encoded via pos', '', '2023-12-11 11:53:51', '2023-12-11 11:53:51');
INSERT INTO `tbl_customers` VALUES ('1473', 'Talusan', '1', '', '0', '1', 'encoded via pos', '', '2023-12-11 14:29:24', '2023-12-11 14:29:24');
INSERT INTO `tbl_customers` VALUES ('1474', 'Balbalosa', '.', '', '0', '.', 'encoded via pos', '', '2023-12-12 08:55:36', '2023-12-12 08:55:36');
INSERT INTO `tbl_customers` VALUES ('1475', 'Radjamudah', '1', '', '0', '1', 'encoded via pos', '', '2023-12-12 10:39:48', '2023-12-12 10:39:48');
INSERT INTO `tbl_customers` VALUES ('1476', 'bonsog', '.', '', '0', '.', 'encoded via pos', '', '2023-12-13 12:37:41', '2023-12-13 12:37:41');
INSERT INTO `tbl_customers` VALUES ('1477', 'Pandi', '1', '', '0', '1', 'encoded via pos', '', '2023-12-14 11:18:15', '2023-12-14 11:18:15');
INSERT INTO `tbl_customers` VALUES ('1478', 'Ganzon', '1', '', '0', '11', 'encoded via pos', '', '2023-12-14 12:51:10', '2023-12-14 12:51:10');
INSERT INTO `tbl_customers` VALUES ('1479', 'jio', '.', '', '0', '.', 'encoded via pos', '', '2023-12-15 06:57:02', '2023-12-15 06:57:02');
INSERT INTO `tbl_customers` VALUES ('1480', 'Kulidtod', '1', '', '0', '1', 'encoded via pos', '', '2023-12-15 07:56:25', '2023-12-15 07:56:25');
INSERT INTO `tbl_customers` VALUES ('1481', 'guiamarudin sakilan', '.', '', '0', '.', 'encoded via pos', '', '2023-12-15 09:35:04', '2023-12-15 09:35:04');
INSERT INTO `tbl_customers` VALUES ('1482', 'Sakilan G.', '1', '', '0', '1', 'encoded via pos', '', '2023-12-15 09:36:32', '2023-12-15 09:36:32');
INSERT INTO `tbl_customers` VALUES ('1483', 'Panundi', '1', '', '0', '1', 'encoded via pos', '', '2023-12-15 16:30:54', '2023-12-15 16:30:54');
INSERT INTO `tbl_customers` VALUES ('1484', 'Demasiado', '1', '', '0', '1', 'encoded via pos', '', '2023-12-16 06:51:14', '2023-12-16 06:51:14');
INSERT INTO `tbl_customers` VALUES ('1485', 'Castor Aldren', '1', '', '0', '1', 'encoded via pos', '', '2023-12-16 09:03:47', '2023-12-16 09:03:47');
INSERT INTO `tbl_customers` VALUES ('1486', 'peres', '.', '', '0', '.', 'encoded via pos', '', '2023-12-17 06:49:07', '2023-12-17 06:49:07');
INSERT INTO `tbl_customers` VALUES ('1487', 'Andolana ', '1', '', '0', '1', 'encoded via pos', '', '2023-12-17 08:44:36', '2023-12-17 08:44:36');
INSERT INTO `tbl_customers` VALUES ('1488', 'Mapanda A.', '1', '', '0', '1', 'encoded via pos', '', '2023-12-17 14:24:52', '2023-12-17 14:24:52');
INSERT INTO `tbl_customers` VALUES ('1489', 'Alipoyo', '1', '', '0', '1', 'encoded via pos', '', '2023-12-17 15:27:01', '2023-12-17 15:27:01');
INSERT INTO `tbl_customers` VALUES ('1490', 'Caro Rico', '1', '', '0', '1', 'encoded via pos', '', '2023-12-18 10:34:20', '2023-12-18 10:34:20');
INSERT INTO `tbl_customers` VALUES ('1491', 'Padila', '1', '', '0', '1', 'encoded via pos', '', '2023-12-18 13:04:50', '2023-12-18 13:04:50');
INSERT INTO `tbl_customers` VALUES ('1492', 'abrineca', '.', '', '0', '.', 'encoded via pos', '', '2023-12-18 15:31:19', '2023-12-18 15:31:19');
INSERT INTO `tbl_customers` VALUES ('1493', 'Palmes Tessie', '1', '', '0', '1', 'encoded via pos', '', '2023-12-18 15:39:26', '2023-12-18 15:39:26');
INSERT INTO `tbl_customers` VALUES ('1494', 'Talib Loida', '1', '', '0', '1', 'encoded via pos', '', '2023-12-18 15:54:34', '2023-12-18 15:54:34');
INSERT INTO `tbl_customers` VALUES ('1495', 'Tamay s', '.', '', '0', '.', 'encoded via pos', '', '2023-12-20 12:40:01', '2023-12-20 12:40:01');
INSERT INTO `tbl_customers` VALUES ('1496', 'sunban', '.', '', '0', '.', 'encoded via pos', '', '2023-12-20 15:12:27', '2023-12-20 15:12:27');
INSERT INTO `tbl_customers` VALUES ('1497', 'Binola', '.', '', '0', '.', 'encoded via pos', '', '2023-12-20 15:26:39', '2023-12-20 15:26:39');
INSERT INTO `tbl_customers` VALUES ('1498', 'Barotas b', '.', '', '0', '.', 'encoded via pos', '', '2023-12-20 15:50:53', '2023-12-20 15:50:53');
INSERT INTO `tbl_customers` VALUES ('1499', 'Ped', '1', '', '0', '1', 'encoded via pos', '', '2023-12-21 13:22:29', '2023-12-21 13:22:29');
INSERT INTO `tbl_customers` VALUES ('1500', 'Saripada Abdal', '1', '', '0', '1', 'encoded via pos', '', '2023-12-21 15:46:16', '2023-12-21 15:46:16');
INSERT INTO `tbl_customers` VALUES ('1501', 'Talib', '1', '', '0', '1', 'encoded via pos', '', '2023-12-21 17:14:46', '2023-12-21 17:14:46');
INSERT INTO `tbl_customers` VALUES ('1502', 'Adapan s', '.', '', '0', '.', 'encoded via pos', '', '2023-12-22 08:44:34', '2023-12-22 08:44:34');
INSERT INTO `tbl_customers` VALUES ('1503', 'Galeno Adelina', '.', '', '0', '.', 'encoded via pos', '', '2023-12-22 11:19:31', '2023-12-22 11:19:31');
INSERT INTO `tbl_customers` VALUES ('1504', 'Kabaya ', '.', '', '0', '.', 'encoded via pos', '', '2023-12-23 13:58:06', '2023-12-23 13:58:06');
INSERT INTO `tbl_customers` VALUES ('1505', 'Emam', 'i', '', '0', 'i', 'encoded via pos', '', '2023-12-23 16:48:53', '2023-12-23 16:48:53');
INSERT INTO `tbl_customers` VALUES ('1506', 'Deniega', '1', '', '0', '1', 'encoded via pos', '', '2023-12-24 09:38:32', '2023-12-24 09:38:32');
INSERT INTO `tbl_customers` VALUES ('1507', 'Amparo', '.', '', '0', '.', 'encoded via pos', '', '2023-12-24 09:52:01', '2023-12-24 09:52:01');
INSERT INTO `tbl_customers` VALUES ('1508', 'Lontik', '1', '', '0', '1', 'encoded via pos', '', '2023-12-24 10:51:16', '2023-12-24 10:51:16');
INSERT INTO `tbl_customers` VALUES ('1509', 'Calalagan', '1', '', '0', '1', 'encoded via pos', '', '2023-12-24 12:45:46', '2023-12-24 12:45:46');
INSERT INTO `tbl_customers` VALUES ('1510', 'Alyano', '.', '', '0', '.', 'encoded via pos', '', '2023-12-24 14:33:13', '2023-12-24 14:33:13');
INSERT INTO `tbl_customers` VALUES ('1511', 'Matala Jamail', '1', '', '0', '1', 'encoded via pos', '', '2023-12-24 15:08:10', '2023-12-24 15:08:10');
INSERT INTO `tbl_customers` VALUES ('1512', 'Isomnong', '1', '', '0', '1', 'encoded via pos', '', '2023-12-25 10:57:09', '2023-12-25 10:57:09');
INSERT INTO `tbl_customers` VALUES ('1513', 'macaya', 'f', '', '0', 'f', 'encoded via pos', '', '2023-12-26 06:36:11', '2023-12-26 06:36:11');
INSERT INTO `tbl_customers` VALUES ('1514', 'BARNISZO', 'K', '', '0', 'K', 'encoded via pos', '', '2023-12-26 08:28:38', '2023-12-26 08:28:38');
INSERT INTO `tbl_customers` VALUES ('1515', 'Adapan Alimuden', '1', '', '0', '1', 'encoded via pos', '', '2023-12-26 14:55:32', '2023-12-26 14:55:32');
INSERT INTO `tbl_customers` VALUES ('1516', 'Erocido Terrasa', '1', '', '0', '1', 'encoded via pos', '', '2023-12-27 09:13:53', '2023-12-27 09:13:53');
INSERT INTO `tbl_customers` VALUES ('1517', 'Belonio Nina', '1', '', '0', '1', 'encoded via pos', '', '2023-12-27 11:40:41', '2023-12-27 11:40:41');
INSERT INTO `tbl_customers` VALUES ('1518', 'Kusa-in', '1', '', '0', '1', 'encoded via pos', '', '2023-12-27 14:14:42', '2023-12-27 14:14:42');
INSERT INTO `tbl_customers` VALUES ('1519', 'Mucari Kasan', '11', '', '0', '1', 'encoded via pos', '', '2023-12-27 14:35:01', '2023-12-27 14:35:01');
INSERT INTO `tbl_customers` VALUES ('1520', 'Bulad mais labor', '1', '', '0', '1', 'encoded via pos', '', '2023-12-27 16:26:37', '2023-12-27 16:26:37');
INSERT INTO `tbl_customers` VALUES ('1521', 'Tambog N.', '1', '', '0', '1', 'encoded via pos', '', '2023-12-28 09:44:16', '2023-12-28 09:44:16');
INSERT INTO `tbl_customers` VALUES ('1522', 'Aldamar Molly', '1', '', '0', '1', 'encoded via pos', '', '2023-12-28 09:48:35', '2023-12-28 09:48:35');
INSERT INTO `tbl_customers` VALUES ('1523', 'Diez Joven', '1', '', '0', '1', 'encoded via pos', '', '2023-12-28 10:22:23', '2023-12-28 10:22:23');
INSERT INTO `tbl_customers` VALUES ('1524', 'Puriga Lukman', '1', '', '0', '1', 'encoded via pos', '', '2023-12-28 13:42:04', '2023-12-28 13:42:04');
INSERT INTO `tbl_customers` VALUES ('1525', 'Tamay  Bai No', '1', '', '0', '1', 'encoded via pos', '', '2023-12-28 14:10:33', '2023-12-28 14:10:33');
INSERT INTO `tbl_customers` VALUES ('1526', 'Mangsunger', '1', '', '0', '0', 'encoded via pos', '', '2023-12-28 14:19:03', '2023-12-28 14:19:03');
INSERT INTO `tbl_customers` VALUES ('1527', 'Cabilla Rebbica', '1', '', '0', '1', 'encoded via pos', '', '2023-12-28 14:28:42', '2023-12-28 14:28:42');
INSERT INTO `tbl_customers` VALUES ('1528', 'Ascales Juvelyn', '1', '', '0', '1', 'encoded via pos', '', '2023-12-29 10:27:12', '2023-12-29 10:27:12');
INSERT INTO `tbl_customers` VALUES ('1529', 'Badayos', '1', '', '0', '1', 'encoded via pos', '', '2023-12-29 13:55:53', '2023-12-29 13:55:53');
INSERT INTO `tbl_customers` VALUES ('1530', 'kapinde', '.', '', '0', '.', 'encoded via pos', '', '2023-12-29 14:18:34', '2023-12-29 14:18:34');
INSERT INTO `tbl_customers` VALUES ('1531', 'Capindig', '01', '', '0', '1', 'encoded via pos', '', '2023-12-29 14:18:47', '2023-12-29 14:18:47');
INSERT INTO `tbl_customers` VALUES ('1532', 'Salangan Rassid', '1', '', '0', '1', 'encoded via pos', '', '2023-12-30 10:26:38', '2023-12-30 10:26:38');
INSERT INTO `tbl_customers` VALUES ('1533', 'Abaya R.', 'q', '', '0', 'q', 'encoded via pos', '', '2023-12-30 10:32:35', '2023-12-30 10:32:35');
INSERT INTO `tbl_customers` VALUES ('1534', 'Pagumpatin Issa', '1', '', '0', '1', 'encoded via pos', '', '2023-12-30 11:06:17', '2023-12-30 11:06:17');
INSERT INTO `tbl_customers` VALUES ('1535', 'Caro Lowela', '1', '', '0', '1', 'encoded via pos', '', '2023-12-30 15:55:29', '2023-12-30 15:55:29');
INSERT INTO `tbl_customers` VALUES ('1536', 'Hera', '1', '', '0', '1', 'encoded via pos', '', '2023-12-31 09:01:38', '2023-12-31 09:01:38');
INSERT INTO `tbl_customers` VALUES ('1537', 'Espineda J.', '0', '', '0', '0', 'encoded via pos', '', '2023-12-31 13:57:28', '2023-12-31 13:57:28');
INSERT INTO `tbl_customers` VALUES ('1538', 'Hallado J.', 'Q', '', '0', 'Q', 'encoded via pos', '', '2024-01-02 10:49:55', '2024-01-02 10:49:55');
INSERT INTO `tbl_customers` VALUES ('1539', 'dunke', '.', '', '0', '.', 'encoded via pos', '', '2024-01-02 12:02:04', '2024-01-02 12:02:04');
INSERT INTO `tbl_customers` VALUES ('1540', 'Ondaya', '12', '', '0', '1', 'encoded via pos', '', '2024-01-02 12:14:11', '2024-01-02 12:14:11');
INSERT INTO `tbl_customers` VALUES ('1541', 'diniga', '.', '', '0', '.', 'encoded via pos', '', '2024-01-02 14:02:31', '2024-01-02 14:02:31');
INSERT INTO `tbl_customers` VALUES ('1542', 'Paspe', '1', '', '0', '1', 'encoded via pos', '', '2024-01-02 15:55:19', '2024-01-02 15:55:19');
INSERT INTO `tbl_customers` VALUES ('1543', 'Medil', 'i', '', '0', 'i', 'encoded via pos', '', '2024-01-03 07:46:27', '2024-01-03 07:46:27');
INSERT INTO `tbl_customers` VALUES ('1544', 'dapugo', '.', '', '0', '.', 'encoded via pos', '', '2024-01-03 14:55:08', '2024-01-03 14:55:08');
INSERT INTO `tbl_customers` VALUES ('1545', 'Bajan', 'u', '', '0', 'u', 'encoded via pos', '', '2024-01-03 16:44:17', '2024-01-03 16:44:17');
INSERT INTO `tbl_customers` VALUES ('1546', 'BiÃ±as Benceslao Jr.', '2', '', '0', '2', 'encoded via pos', '', '2024-01-04 13:43:29', '2024-01-04 13:43:29');
INSERT INTO `tbl_customers` VALUES ('1547', 'Matas', '.', '', '0', '.', 'encoded via pos', '', '2024-01-05 06:10:21', '2024-01-05 06:10:21');
INSERT INTO `tbl_customers` VALUES ('1548', 'felomino', '.', '', '0', '.', 'encoded via pos', '', '2024-01-05 13:22:39', '2024-01-05 13:22:39');
INSERT INTO `tbl_customers` VALUES ('1549', 'Mimbalawag A.', '1', '', '0', '1', 'encoded via pos', '', '2024-01-05 14:25:45', '2024-01-05 14:25:45');
INSERT INTO `tbl_customers` VALUES ('1550', 'Santiago E.', '1', '', '0', '1', 'encoded via pos', '', '2024-01-05 14:30:43', '2024-01-05 14:30:43');
INSERT INTO `tbl_customers` VALUES ('1551', 'mayada', '.', '', '0', '.', 'encoded via pos', '', '2024-01-06 07:54:31', '2024-01-06 07:54:31');
INSERT INTO `tbl_customers` VALUES ('1552', 'Isla ', '.', '', '0', '.', 'encoded via pos', '', '2024-01-06 09:38:08', '2024-01-06 09:38:08');
INSERT INTO `tbl_customers` VALUES ('1553', 'tali', '.', '', '0', '.', 'encoded via pos', '', '2024-01-06 11:57:15', '2024-01-06 11:57:15');
INSERT INTO `tbl_customers` VALUES ('1554', 'Dela Rita Rogelio', '1', '', '0', '1', 'encoded via pos', '', '2024-01-06 13:22:56', '2024-01-06 13:22:56');
INSERT INTO `tbl_customers` VALUES ('1555', 'Ermena', '.', '', '0', '.', 'encoded via pos', '', '2024-01-06 13:23:53', '2024-01-06 13:23:53');
INSERT INTO `tbl_customers` VALUES ('1556', 'nuvesipanai', '.', '', '0', '.', 'encoded via pos', '', '2024-01-07 08:37:04', '2024-01-07 08:37:04');
INSERT INTO `tbl_customers` VALUES ('1557', 'Lengean', '.', '', '0', '.', 'encoded via pos', '', '2024-01-07 10:51:19', '2024-01-07 10:51:19');
INSERT INTO `tbl_customers` VALUES ('1558', 'Lariza', '1', '', '0', '2', 'encoded via pos', '', '2024-01-07 12:47:34', '2024-01-07 12:47:34');
INSERT INTO `tbl_customers` VALUES ('1559', 'Grospe Indang', '1', '', '0', '1', 'encoded via pos', '', '2024-01-07 13:15:36', '2024-01-07 13:15:36');
INSERT INTO `tbl_customers` VALUES ('1560', 'Garbino Arvin', '1', '', '0', '1', 'encoded via pos', '', '2024-01-07 16:38:22', '2024-01-07 16:38:22');
INSERT INTO `tbl_customers` VALUES ('1561', 'Juanda', '1', '', '0', '1', 'encoded via pos', '', '2024-01-07 16:50:50', '2024-01-07 16:50:50');
INSERT INTO `tbl_customers` VALUES ('1562', 'Dela Cruz G.', '1', '', '0', '1', 'encoded via pos', '', '2024-01-08 08:52:34', '2024-01-08 08:52:34');
INSERT INTO `tbl_customers` VALUES ('1563', 'Miguel', '1', '', '0', '1', 'encoded via pos', '', '2024-01-08 09:44:14', '2024-01-08 09:44:14');
INSERT INTO `tbl_customers` VALUES ('1564', 'Adapan W.', '1', '', '0', '1', 'encoded via pos', '', '2024-01-08 11:23:50', '2024-01-08 11:23:50');
INSERT INTO `tbl_customers` VALUES ('1565', 'Capinpin', '1', '', '0', '.', 'encoded via pos', '', '2024-01-08 11:35:25', '2024-01-08 11:35:25');
INSERT INTO `tbl_customers` VALUES ('1566', 'Publico Tata', '.', '', '0', '.', 'encoded via pos', '', '2024-01-08 13:42:11', '2024-01-08 13:42:11');
INSERT INTO `tbl_customers` VALUES ('1567', 'Cordero Chan', '1', '', '0', '1', 'encoded via pos', '', '2024-01-08 16:53:26', '2024-01-08 16:53:26');
INSERT INTO `tbl_customers` VALUES ('1568', 'sutan', '.', '', '0', '.', 'encoded via pos', '', '2024-01-09 10:27:03', '2024-01-09 10:27:03');
INSERT INTO `tbl_customers` VALUES ('1569', 'Sayson ', '.', '', '0', '.', 'encoded via pos', '', '2024-01-09 13:30:15', '2024-01-09 13:30:15');
INSERT INTO `tbl_customers` VALUES ('1570', 'Pacatan', '1', '', '0', '1', 'encoded via pos', '', '2024-01-09 15:23:16', '2024-01-09 15:23:16');
INSERT INTO `tbl_customers` VALUES ('1571', 'Angatong Sainodin', '1', '', '0', '1', 'encoded via pos', '', '2024-01-10 09:59:06', '2024-01-10 09:59:06');
INSERT INTO `tbl_customers` VALUES ('1572', 'ambal', '.', '', '0', '.', 'encoded via pos', '', '2024-01-10 16:33:38', '2024-01-10 16:33:38');
INSERT INTO `tbl_customers` VALUES ('1573', 'Loida Gumban', '1', '', '0', '1', 'encoded via pos', '', '2024-01-11 09:55:18', '2024-01-11 09:55:18');
INSERT INTO `tbl_customers` VALUES ('1574', 'Rapol', '.', '', '0', '.', 'encoded via pos', '', '2024-01-11 11:39:03', '2024-01-11 11:39:03');
INSERT INTO `tbl_customers` VALUES ('1575', 'Raffols', '1', '', '0', '1', 'encoded via pos', '', '2024-01-11 11:41:38', '2024-01-11 11:41:38');
INSERT INTO `tbl_customers` VALUES ('1576', 'Pineda', '1', '', '0', '1', 'encoded via pos', '', '2024-01-11 13:33:23', '2024-01-11 13:33:23');
INSERT INTO `tbl_customers` VALUES ('1577', 'Saores Mamatas', '1', '', '0', '1', 'encoded via pos', '', '2024-01-12 14:04:24', '2024-01-12 14:04:24');
INSERT INTO `tbl_customers` VALUES ('1578', 'Cabilla Angel', '1', '', '0', '1', 'encoded via pos', '', '2024-01-13 10:10:21', '2024-01-13 10:10:21');
INSERT INTO `tbl_customers` VALUES ('1579', 'Demonteverde Ryan', '1', '', '0', '1', 'encoded via pos', '', '2024-01-13 13:24:46', '2024-01-13 13:24:46');
INSERT INTO `tbl_customers` VALUES ('1580', 'Sultan O.', '1', '', '0', '1', 'encoded via pos', '', '2024-01-13 14:14:45', '2024-01-13 14:14:45');
INSERT INTO `tbl_customers` VALUES ('1581', 'Losaria L.', '1', '', '0', '1', 'encoded via pos', '', '2024-01-14 08:57:05', '2024-01-14 08:57:05');
INSERT INTO `tbl_customers` VALUES ('1582', 'Cerna', '1', '', '0', '1', 'encoded via pos', '', '2024-01-14 10:49:39', '2024-01-14 10:49:39');
INSERT INTO `tbl_customers` VALUES ('1583', 'Midag Monawara', '1', '', '0', '1', 'encoded via pos', '', '2024-01-14 15:34:22', '2024-01-14 15:34:22');
INSERT INTO `tbl_customers` VALUES ('1584', 'Saripada Nasrodin', '1', '', '0', '1', 'encoded via pos', '', '2024-01-15 08:08:18', '2024-01-15 08:08:18');
INSERT INTO `tbl_customers` VALUES ('1585', 'Adapan N.', '1', '', '0', '1', 'encoded via pos', '', '2024-01-15 10:29:01', '2024-01-15 10:29:01');
INSERT INTO `tbl_customers` VALUES ('1586', 'bem2x', '1', '', '0', '1', 'encoded via pos', '', '2024-01-15 10:50:58', '2024-01-15 10:50:58');
INSERT INTO `tbl_customers` VALUES ('1587', 'Angatong E.', 'q', '', '0', 'q', 'encoded via pos', '', '2024-01-15 11:12:51', '2024-01-15 11:12:51');
INSERT INTO `tbl_customers` VALUES ('1588', 'Mapoldo', '.', '', '0', '.', 'encoded via pos', '', '2024-01-15 16:01:06', '2024-01-15 16:01:06');
INSERT INTO `tbl_customers` VALUES ('1589', 'Pamplona Nap', '1', '', '0', '1', 'encoded via pos', '', '2024-01-15 16:56:52', '2024-01-15 16:56:52');
INSERT INTO `tbl_customers` VALUES ('1590', 'decinia', '.', '', '0', '.', 'encoded via pos', '', '2024-01-16 07:24:20', '2024-01-16 07:24:20');
INSERT INTO `tbl_customers` VALUES ('1591', 'Camarista Romnick', '1', '', '0', '1', 'encoded via pos', '', '2024-01-16 09:15:12', '2024-01-16 09:15:12');
INSERT INTO `tbl_customers` VALUES ('1592', 'Camsa Tibayan', '1', '', '0', '1', 'encoded via pos', '', '2024-01-16 09:53:46', '2024-01-16 09:53:46');
INSERT INTO `tbl_customers` VALUES ('1593', 'Ableng Labor', '1', '', '0', '1', 'encoded via pos', '', '2024-01-16 11:52:49', '2024-01-16 11:52:49');
INSERT INTO `tbl_customers` VALUES ('1594', 'Nitton', '1', '', '0', '11', 'encoded via pos', '', '2024-01-16 13:48:13', '2024-01-16 13:48:13');
INSERT INTO `tbl_customers` VALUES ('1595', 'Taman', '.', '', '0', '.', 'encoded via pos', '', '2024-01-16 14:38:23', '2024-01-16 14:38:23');
INSERT INTO `tbl_customers` VALUES ('1596', 'Basultin', '1', '', '0', '1', 'encoded via pos', '', '2024-01-17 07:20:06', '2024-01-17 07:20:06');
INSERT INTO `tbl_customers` VALUES ('1597', 'Castor Norma', '1', '', '0', '1', 'encoded via pos', '', '2024-01-17 12:02:31', '2024-01-17 12:02:31');
INSERT INTO `tbl_customers` VALUES ('1598', 'Mahan', '.', '', '0', '.', 'encoded via pos', '', '2024-01-18 09:06:47', '2024-01-18 09:06:47');
INSERT INTO `tbl_customers` VALUES ('1599', 'Dulatre L.', '1', '', '0', '1', 'encoded via pos', '', '2024-01-18 10:56:42', '2024-01-18 10:56:42');
INSERT INTO `tbl_customers` VALUES ('1600', 'Totte J.', '2', '', '0', '1', 'encoded via pos', '', '2024-01-18 15:10:54', '2024-01-18 15:10:54');
INSERT INTO `tbl_customers` VALUES ('1601', 'Guardario', '1', '', '0', '1', 'encoded via pos', '', '2024-01-19 07:09:44', '2024-01-19 07:09:44');
INSERT INTO `tbl_customers` VALUES ('1602', 'hunada', '.', '', '0', '.', 'encoded via pos', '', '2024-01-19 10:06:15', '2024-01-19 10:06:15');
INSERT INTO `tbl_customers` VALUES ('1603', 'Sanguines Jem', '1', '', '0', '1', 'encoded via pos', '', '2024-01-19 10:08:40', '2024-01-19 10:08:40');
INSERT INTO `tbl_customers` VALUES ('1604', 'Talib D.', '1', '', '0', '1', 'encoded via pos', '', '2024-01-19 11:51:05', '2024-01-19 11:51:05');
INSERT INTO `tbl_customers` VALUES ('1605', 'Apura Amay', '1', '', '0', '1', 'encoded via pos', '', '2024-01-19 14:36:45', '2024-01-19 14:36:45');
INSERT INTO `tbl_customers` VALUES ('1606', 'Maamor Casanudin', '1', '', '0', '1', 'encoded via pos', '', '2024-01-19 15:10:56', '2024-01-19 15:10:56');
INSERT INTO `tbl_customers` VALUES ('1607', 'Panzo Tata', '1', '', '0', '1', 'encoded via pos', '', '2024-01-19 16:00:08', '2024-01-19 16:00:08');
INSERT INTO `tbl_customers` VALUES ('1608', 'Naranja Gleman', '1', '', '0', '1', 'encoded via pos', '', '2024-01-20 08:27:50', '2024-01-20 08:27:50');
INSERT INTO `tbl_customers` VALUES ('1609', 'Majan Pedro Jr.', '1', '', '0', '11', 'encoded via pos', '', '2024-01-20 10:51:21', '2024-01-20 10:51:21');
INSERT INTO `tbl_customers` VALUES ('1610', 'Deala Renante', '1', '', '0', '1', 'encoded via pos', '', '2024-01-20 11:19:30', '2024-01-20 11:19:30');
INSERT INTO `tbl_customers` VALUES ('1611', 'QL Agricultural Supply-Corp', 'Pob 2, Bansilan Cotabato', '.', '30', '.', '.', '1', '2024-01-21 07:33:48', '2024-01-24 13:15:30');
INSERT INTO `tbl_customers` VALUES ('1612', 'pin', '.', '', '0', '.', 'encoded via pos', '', '2024-01-21 10:46:50', '2024-01-21 10:46:50');
INSERT INTO `tbl_customers` VALUES ('1613', 'pid', '.', '', '0', '.', 'encoded via pos', '', '2024-01-21 10:48:34', '2024-01-21 10:48:34');
INSERT INTO `tbl_customers` VALUES ('1614', 'adpilipi', '.', '', '0', '.', 'encoded via pos', '', '2024-01-21 12:13:47', '2024-01-21 12:13:47');
INSERT INTO `tbl_customers` VALUES ('1615', 'Cabarubias Stephen', '1', '', '0', '1', 'encoded via pos', '', '2024-01-21 13:46:49', '2024-01-21 13:46:49');
INSERT INTO `tbl_customers` VALUES ('1616', 'baldelovar Rodjon', '.', '', '0', '.', 'encoded via pos', '', '2024-01-21 14:52:57', '2024-01-21 14:52:57');
INSERT INTO `tbl_customers` VALUES ('1617', 'Gantalao N.', '1', '', '0', '1', 'encoded via pos', '', '2024-01-22 06:55:42', '2024-01-22 06:55:42');
INSERT INTO `tbl_customers` VALUES ('1618', 'Parrael', '1', '', '0', '1', 'encoded via pos', '', '2024-01-22 09:22:58', '2024-01-22 09:22:58');
INSERT INTO `tbl_customers` VALUES ('1619', 'pilar', '.', '', '0', '.', 'encoded via pos', '', '2024-01-22 09:27:50', '2024-01-22 09:27:50');
INSERT INTO `tbl_customers` VALUES ('1620', 'ayolodan', '.', '', '0', '.', 'encoded via pos', '', '2024-01-22 12:35:38', '2024-01-22 12:35:38');
INSERT INTO `tbl_customers` VALUES ('1621', 'Camsa S.', '1', '', '0', '1', 'encoded via pos', '', '2024-01-22 13:14:40', '2024-01-22 13:14:40');
INSERT INTO `tbl_customers` VALUES ('1622', 'Maki', '.', '', '0', '.', 'encoded via pos', '', '2024-01-22 13:28:01', '2024-01-22 13:28:01');
INSERT INTO `tbl_customers` VALUES ('1623', 'Dominguez Eduardo', '1', '', '0', '1', 'encoded via pos', '', '2024-01-22 14:30:31', '2024-01-22 14:30:31');
INSERT INTO `tbl_customers` VALUES ('1624', 'Labing', '1', '', '0', '1', 'encoded via pos', '', '2024-01-23 06:27:17', '2024-01-23 06:27:17');
INSERT INTO `tbl_customers` VALUES ('1625', 'Apinat Dinno', '1', '', '0', '1', 'encoded via pos', '', '2024-01-23 07:00:39', '2024-01-23 07:00:39');
INSERT INTO `tbl_customers` VALUES ('1626', 'Abatir Agot', '.', '', '0', '.', 'encoded via pos', '', '2024-01-23 08:10:39', '2024-01-23 08:10:39');
INSERT INTO `tbl_customers` VALUES ('1627', 'Publico Roselyn', '1', '', '0', '1', 'encoded via pos', '', '2024-01-23 09:18:58', '2024-01-23 09:18:58');
INSERT INTO `tbl_customers` VALUES ('1628', 'Makalalim', '.', '', '0', '.', 'encoded via pos', '', '2024-01-23 12:43:12', '2024-01-23 12:43:12');
INSERT INTO `tbl_customers` VALUES ('1629', 'Baguindali', '1', '', '0', '1', 'encoded via pos', '', '2024-01-24 07:19:46', '2024-01-24 07:19:46');
INSERT INTO `tbl_customers` VALUES ('1630', 'Muedan', '.', '', '0', '.', 'encoded via pos', '', '2024-01-24 09:54:07', '2024-01-24 09:54:07');
INSERT INTO `tbl_customers` VALUES ('1631', 'Aguilar Vilma', '1', '', '0', '1', 'encoded via pos', '', '2024-01-24 09:59:53', '2024-01-24 09:59:53');
INSERT INTO `tbl_customers` VALUES ('1632', 'Bambaki Mando', '1', '', '0', '1', 'encoded via pos', '', '2024-01-24 12:21:54', '2024-01-24 12:21:54');
INSERT INTO `tbl_customers` VALUES ('1633', 'Sultan Allan', '1', '', '0', '1', 'encoded via pos', '', '2024-01-24 12:49:51', '2024-01-24 12:49:51');
INSERT INTO `tbl_customers` VALUES ('1634', 'QL Buy & Sell', '.', '.', '30', '.', '1', '', '2024-01-24 13:16:01', '2024-01-24 13:16:01');
INSERT INTO `tbl_customers` VALUES ('1635', 'Camarista', '1', '', '0', '1', 'encoded via pos', '', '2024-01-24 15:41:09', '2024-01-24 15:41:09');
INSERT INTO `tbl_customers` VALUES ('1636', 'Songcuya bon2x', '.', '', '0', '.', 'encoded via pos', '', '2024-01-24 16:22:02', '2024-01-24 16:22:02');
INSERT INTO `tbl_customers` VALUES ('1637', 'Macarindi', '1', '', '0', '1', 'encoded via pos', '', '2024-01-25 10:26:09', '2024-01-25 10:26:09');
INSERT INTO `tbl_customers` VALUES ('1638', 'Mosquite', '1', '', '0', '1', 'encoded via pos', '', '2024-01-25 11:24:03', '2024-01-25 11:24:03');
INSERT INTO `tbl_customers` VALUES ('1639', 'AreÃ±o', '1', '', '0', '1', 'encoded via pos', '', '2024-01-25 12:56:07', '2024-01-25 12:56:07');
INSERT INTO `tbl_customers` VALUES ('1640', 'Milaga', '.', '', '0', '.', 'encoded via pos', '', '2024-01-25 13:00:40', '2024-01-25 13:00:40');
INSERT INTO `tbl_customers` VALUES ('1641', 'Calbo', '2', '', '0', '1', 'encoded via pos', '', '2024-01-27 06:53:53', '2024-01-27 06:53:53');
INSERT INTO `tbl_customers` VALUES ('1642', 'Baskis', '1', '', '0', '.', 'encoded via pos', '', '2024-01-27 09:53:19', '2024-01-27 09:53:19');
INSERT INTO `tbl_customers` VALUES ('1643', 'Poonadato', '1', '', '0', '1', 'encoded via pos', '', '2024-01-27 15:46:51', '2024-01-27 15:46:51');
INSERT INTO `tbl_customers` VALUES ('1644', 'Jan Dexter Palomar', '1', '1', '1', '1', '1', '', '2024-01-28 05:49:25', '2024-01-28 05:49:25');
INSERT INTO `tbl_customers` VALUES ('1645', 'kimpayan', 'f', '', '0', 'f', 'encoded via pos', '', '2024-01-28 09:47:03', '2024-01-28 09:47:03');
INSERT INTO `tbl_customers` VALUES ('1646', 'Karim', 's', '', '0', 's', 'encoded via pos', '', '2024-01-28 13:51:13', '2024-01-28 13:51:13');
INSERT INTO `tbl_customers` VALUES ('1647', 'Baroa', '.', '', '0', '.', 'encoded via pos', '', '2024-01-28 13:51:28', '2024-01-28 13:51:28');
INSERT INTO `tbl_customers` VALUES ('1648', 'Blah', 'f', '', '0', 'f', 'encoded via pos', '', '2024-01-28 17:19:23', '2024-01-28 17:19:23');
INSERT INTO `tbl_customers` VALUES ('1649', 'Sindingan Tata', '1', '', '0', '1', 'encoded via pos', '', '2024-01-29 07:49:08', '2024-01-29 07:49:08');
INSERT INTO `tbl_customers` VALUES ('1650', 'Kayogan', '.', '', '0', '.', 'encoded via pos', '', '2024-01-29 10:02:32', '2024-01-29 10:02:32');
INSERT INTO `tbl_customers` VALUES ('1651', 'Pabale', '1', '', '0', '1', 'encoded via pos', '', '2024-01-29 12:11:11', '2024-01-29 12:11:11');
INSERT INTO `tbl_customers` VALUES ('1652', 'Adiong Kadabok', '1', '', '0', '1', 'encoded via pos', '', '2024-01-29 13:23:59', '2024-01-29 13:23:59');
INSERT INTO `tbl_customers` VALUES ('1653', 'Bagemben Puli S.', '1', '', '0', '1', 'encoded via pos', '', '2024-01-29 14:23:11', '2024-01-29 14:23:11');
INSERT INTO `tbl_customers` VALUES ('1654', 'Bagenben Puli S.', '1', '', '0', '1', 'encoded via pos', '', '2024-01-29 14:24:32', '2024-01-29 14:24:32');
INSERT INTO `tbl_customers` VALUES ('1655', 'Parbaquil', '.', '', '0', '.', 'encoded via pos', '', '2024-02-03 14:23:21', '2024-02-03 14:23:21');
INSERT INTO `tbl_customers` VALUES ('1656', 'demontevarde josephine', '.', '', '0', '.', 'encoded via pos', '', '2024-02-03 14:58:01', '2024-02-03 14:58:01');
INSERT INTO `tbl_customers` VALUES ('1657', 'Coleste Jen Rose', '.', '', '0', '.', 'encoded via pos', '', '2024-02-04 11:51:04', '2024-02-04 11:51:04');
INSERT INTO `tbl_customers` VALUES ('1658', 'Abilo', '.', '', '0', '.', 'encoded via pos', '', '2024-02-05 14:39:20', '2024-02-05 14:39:20');
INSERT INTO `tbl_customers` VALUES ('1659', 'Tacoyan', '.', '', '0', '.', 'encoded via pos', '', '2024-02-05 17:21:56', '2024-02-05 17:21:56');
INSERT INTO `tbl_customers` VALUES ('1660', 'QL Main', '.', '', '0', '1', 'encoded via pos', '', '2024-02-05 17:47:25', '2024-02-05 17:47:25');
INSERT INTO `tbl_customers` VALUES ('1661', 'Mathing', '.', '', '0', '3', 'encoded via pos', '', '2024-02-06 13:46:27', '2024-02-06 13:46:27');

CREATE TABLE `tbl_debit_memo` (
  `dm_id` int(11) NOT NULL AUTO_INCREMENT,
  `reference_number` varchar(75) NOT NULL,
  `memo_date` date NOT NULL,
  `memo_type` varchar(3) NOT NULL,
  `account_id` int(11) NOT NULL,
  `remarks` varchar(250) NOT NULL,
  `status` varchar(1) NOT NULL DEFAULT 'S' COMMENT 'S = Saved; F = Finish',
  `encoded_by` int(11) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_last_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`dm_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `tbl_debit_memo_details` (
  `dmd_id` int(11) NOT NULL AUTO_INCREMENT,
  `dm_id` int(11) NOT NULL,
  `reference_id` int(11) NOT NULL,
  `ref_type` varchar(3) NOT NULL,
  `amount` decimal(12,3) NOT NULL,
  `description` varchar(250) NOT NULL,
  PRIMARY KEY (`dmd_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `tbl_deposit` (
  `deposit_id` int(11) NOT NULL AUTO_INCREMENT,
  `reference_number` varchar(30) NOT NULL,
  `bank_id` int(11) NOT NULL DEFAULT '0',
  `remarks` varchar(250) NOT NULL,
  `deposit_date` date NOT NULL,
  `deposit_type` varchar(1) NOT NULL COMMENT 'H = check ; C = cash',
  `status` varchar(1) NOT NULL DEFAULT 'S',
  `encoded_by` int(11) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_last_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`deposit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `tbl_deposit_details` (
  `deposit_detail_id` int(11) NOT NULL AUTO_INCREMENT,
  `deposit_id` int(11) NOT NULL,
  `cp_id` int(11) NOT NULL,
  `amount` decimal(12,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`deposit_detail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `tbl_discount_details` (
  `discount_detail_id` int(11) NOT NULL AUTO_INCREMENT,
  `discount_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_last_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`discount_detail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `tbl_discounts` (
  `discount_id` int(11) NOT NULL AUTO_INCREMENT,
  `discount_name` varchar(75) NOT NULL,
  `status` varchar(1) NOT NULL,
  `description` varchar(255) NOT NULL,
  `coverage_type` varchar(1) NOT NULL COMMENT 'A=All;L=Limited',
  `discount_type` varchar(1) NOT NULL COMMENT 'A=Automatic;M=Manual',
  `discount_percent` decimal(12,2) NOT NULL,
  `discount_start` datetime NOT NULL,
  `discount_end` datetime NOT NULL,
  `date_added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_last_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `is_percentage` int(1) NOT NULL,
  `discount_amount` decimal(12,2) NOT NULL,
  PRIMARY KEY (`discount_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `tbl_expense` (
  `expense_id` int(11) NOT NULL AUTO_INCREMENT,
  `reference_number` varchar(50) NOT NULL DEFAULT '',
  `expense_date` date NOT NULL,
  `remarks` varchar(255) NOT NULL DEFAULT '',
  `encoded_by` int(11) NOT NULL,
  `status` varchar(1) NOT NULL DEFAULT '',
  `date_added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_last_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`expense_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
INSERT INTO `tbl_expense` VALUES ('3', 'EXP-20240203101504', '2024-02-03', 'Opening', '1', 'F', '2024-02-03 10:15:11', '2024-02-03 10:16:51');
INSERT INTO `tbl_expense` VALUES ('4', 'EXP-20240203164001', '2024-02-03', 'kahoy', '1', 'F', '2024-02-03 16:40:18', '2024-02-03 16:41:09');
INSERT INTO `tbl_expense` VALUES ('5', 'EXP-20240206060155', '2024-02-05', 'Cellphone', '1', 'F', '2024-02-06 06:02:09', '2024-02-06 06:02:50');

CREATE TABLE `tbl_expense_category` (
  `expense_category_id` int(11) NOT NULL AUTO_INCREMENT,
  `expense_category_code` varchar(10) NOT NULL DEFAULT '',
  `expense_category` varchar(75) NOT NULL DEFAULT '',
  `expense_type` varchar(2) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_last_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`expense_category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=latin1;
INSERT INTO `tbl_expense_category` VALUES ('1', '3001', 'Electricity', 'OE', '2022-11-16 08:16:39', '0000-00-00 00:00:00');
INSERT INTO `tbl_expense_category` VALUES ('2', '3002', 'Water Bill', 'OE', '2022-11-16 08:16:56', '0000-00-00 00:00:00');
INSERT INTO `tbl_expense_category` VALUES ('3', '3003', 'Salaries & Wages', 'OE', '2022-11-16 08:17:12', '0000-00-00 00:00:00');
INSERT INTO `tbl_expense_category` VALUES ('4', '3004', 'Meals- QL Employees', 'OE', '2022-11-16 08:17:26', '2023-03-08 08:17:11');
INSERT INTO `tbl_expense_category` VALUES ('5', '3005', 'Fuel - Van ', 'OE', '2022-11-16 08:17:40', '2023-03-08 08:09:16');
INSERT INTO `tbl_expense_category` VALUES ('6', '3006', 'Lodging', 'OE', '2022-11-16 08:17:56', '0000-00-00 00:00:00');
INSERT INTO `tbl_expense_category` VALUES ('7', '3007', 'Communication - Internet, phone', 'OE', '2022-11-16 08:18:40', '0000-00-00 00:00:00');
INSERT INTO `tbl_expense_category` VALUES ('8', '3008', 'Miscellaneous Expense', 'O', '2022-11-16 08:19:49', '0000-00-00 00:00:00');
INSERT INTO `tbl_expense_category` VALUES ('10', '2002', 'Loan-Coop', 'OE', '2022-11-18 06:34:47', '2022-11-18 06:40:14');
INSERT INTO `tbl_expense_category` VALUES ('12', '2001', 'Loan-EastWest', 'OE', '2022-11-18 06:40:30', '0000-00-00 00:00:00');
INSERT INTO `tbl_expense_category` VALUES ('13', '2003', 'Loan-BPI', 'OE', '2022-11-18 06:40:42', '0000-00-00 00:00:00');
INSERT INTO `tbl_expense_category` VALUES ('14', '2004', 'Loan-Security', 'OE', '2022-11-18 06:41:00', '0000-00-00 00:00:00');
INSERT INTO `tbl_expense_category` VALUES ('15', '3009', 'Trucking Fee -Domas', 'OE', '2022-11-18 10:42:53', '2023-07-18 18:26:35');
INSERT INTO `tbl_expense_category` VALUES ('16', '3010', 'Taxes & Licenses- BIR', 'OE', '2022-11-23 06:41:02', '2023-03-08 13:13:44');
INSERT INTO `tbl_expense_category` VALUES ('17', '3011', 'R&M- Building', 'OE', '2022-12-04 16:54:06', '2023-03-08 08:10:46');
INSERT INTO `tbl_expense_category` VALUES ('18', '2005', 'Loan-RCBC', 'OE', '2022-12-18 06:32:39', '0000-00-00 00:00:00');
INSERT INTO `tbl_expense_category` VALUES ('19', '3029', '13th Month Pay', 'OE', '2022-12-18 06:33:15', '2023-04-29 05:52:06');
INSERT INTO `tbl_expense_category` VALUES ('20', '3012', 'Incentives', 'OE', '2022-12-18 06:33:28', '2023-03-08 08:17:42');
INSERT INTO `tbl_expense_category` VALUES ('21', '3013', 'Office Supplies', 'OE', '2023-01-06 06:36:24', '2023-03-08 08:17:51');
INSERT INTO `tbl_expense_category` VALUES ('22', '3014', 'Advertising & Marketing Expense', 'OE', '2023-01-06 08:31:14', '2023-03-08 08:18:05');
INSERT INTO `tbl_expense_category` VALUES ('23', '3015', 'Fuel- Truck ( GAD  7204)', 'OE', '2023-03-08 08:09:32', '2023-06-01 19:40:02');
INSERT INTO `tbl_expense_category` VALUES ('24', '3016', 'Fuel- Motor', 'OE', '2023-03-08 08:09:44', '2023-03-08 08:18:41');
INSERT INTO `tbl_expense_category` VALUES ('25', '3017', 'Water Expense', 'OE', '2023-03-08 08:19:15', '0000-00-00 00:00:00');
INSERT INTO `tbl_expense_category` VALUES ('26', '3018', 'Labor- Diskarga', 'OE', '2023-03-08 08:19:38', '0000-00-00 00:00:00');
INSERT INTO `tbl_expense_category` VALUES ('27', '3019', 'Labor-Karga', 'OE', '2023-03-08 08:19:52', '0000-00-00 00:00:00');
INSERT INTO `tbl_expense_category` VALUES ('28', '3020', 'Meals- Admin', 'OE', '2023-03-08 08:38:39', '2023-03-08 12:31:15');
INSERT INTO `tbl_expense_category` VALUES ('29', '3021', 'R&M- Truck', 'OE', '2023-03-08 12:31:30', '0000-00-00 00:00:00');
INSERT INTO `tbl_expense_category` VALUES ('30', '3022', 'Travel Allowance', 'OE', '2023-03-08 12:34:44', '0000-00-00 00:00:00');
INSERT INTO `tbl_expense_category` VALUES ('31', '3023', 'Supplies-Tire- Truck', 'OE', '2023-03-08 13:07:16', '0000-00-00 00:00:00');
INSERT INTO `tbl_expense_category` VALUES ('32', '3028', 'R&M- Preventive Maintenance', 'OE', '2023-03-08 13:07:52', '2023-04-29 05:51:51');
INSERT INTO `tbl_expense_category` VALUES ('33', '3024', 'Professional Fee-', 'OE', '2023-03-08 13:13:32', '2023-03-08 13:30:45');
INSERT INTO `tbl_expense_category` VALUES ('34', '3024', 'Taxes & License- Others', 'OE', '2023-03-08 13:14:33', '0000-00-00 00:00:00');
INSERT INTO `tbl_expense_category` VALUES ('35', '3025', 'Truck Rental', 'OE', '2023-03-08 13:31:11', '0000-00-00 00:00:00');
INSERT INTO `tbl_expense_category` VALUES ('36', '3026', 'Office Equipment', 'OE', '2023-03-08 13:38:29', '0000-00-00 00:00:00');
INSERT INTO `tbl_expense_category` VALUES ('37', '2006', 'Loan- 1st Valley Bank', 'OE', '2023-03-08 19:05:44', '0000-00-00 00:00:00');
INSERT INTO `tbl_expense_category` VALUES ('38', '4001', 'Insurance- Sunlife', 'O', '2023-03-08 19:59:55', '0000-00-00 00:00:00');
INSERT INTO `tbl_expense_category` VALUES ('39', '4002', 'SSS Contribution', 'O', '2023-03-08 20:00:14', '0000-00-00 00:00:00');
INSERT INTO `tbl_expense_category` VALUES ('40', '4003', 'Philhealth Contribution', 'O', '2023-03-08 20:00:33', '0000-00-00 00:00:00');
INSERT INTO `tbl_expense_category` VALUES ('41', '4004', 'HDMF Contribution', 'O', '2023-03-08 20:00:52', '0000-00-00 00:00:00');
INSERT INTO `tbl_expense_category` VALUES ('42', '3027', 'Amortization- Van', 'OE', '2023-03-18 06:35:58', '0000-00-00 00:00:00');
INSERT INTO `tbl_expense_category` VALUES ('43', '3030', 'Warehouse-Materials', 'OE', '2023-04-29 05:52:41', '0000-00-00 00:00:00');
INSERT INTO `tbl_expense_category` VALUES ('44', '3031', 'Warehouse-Labor', 'OE', '2023-04-29 05:52:57', '0000-00-00 00:00:00');
INSERT INTO `tbl_expense_category` VALUES ('45', '3032', 'Warehouse-Permit', 'OE', '2023-04-29 05:53:21', '0000-00-00 00:00:00');
INSERT INTO `tbl_expense_category` VALUES ('46', '3033', 'Warehouse-Other Materials', 'OE', '2023-04-29 05:54:24', '0000-00-00 00:00:00');
INSERT INTO `tbl_expense_category` VALUES ('47', '3034', 'Outside Labor', 'OE', '2023-04-29 05:57:52', '0000-00-00 00:00:00');
INSERT INTO `tbl_expense_category` VALUES ('48', '3035', 'Delivery Charge- Lumawag (GAD 7204)', 'OE', '2023-06-01 19:13:09', '0000-00-00 00:00:00');
INSERT INTO `tbl_expense_category` VALUES ('49', '2007', 'BPI-Credit Card', 'O', '2023-06-06 18:07:30', '0000-00-00 00:00:00');
INSERT INTO `tbl_expense_category` VALUES ('50', '3036', 'Monthly Share', 'O', '2023-07-05 20:13:56', '0000-00-00 00:00:00');
INSERT INTO `tbl_expense_category` VALUES ('51', '2008', 'Credit Card-China', 'O', '2023-08-03 13:28:30', '0000-00-00 00:00:00');
INSERT INTO `tbl_expense_category` VALUES ('52', '3037', 'Trucking Fee- Walk in', 'OE', '2023-09-11 07:01:17', '0000-00-00 00:00:00');
INSERT INTO `tbl_expense_category` VALUES ('53', '3038', 'Fuel- Truck ( CBR 6209)', 'OE', '2023-10-01 14:10:05', '0000-00-00 00:00:00');
INSERT INTO `tbl_expense_category` VALUES ('54', '3039', 'Delivery Charge- Wing Van', 'OE', '2023-10-01 14:11:43', '0000-00-00 00:00:00');
INSERT INTO `tbl_expense_category` VALUES ('55', '3040', 'Other Expense- Wing Van', 'OE', '2023-10-01 14:13:03', '0000-00-00 00:00:00');
INSERT INTO `tbl_expense_category` VALUES ('56', '3041', 'R&M-Wing Van ( CBR 6209)', 'OE', '2023-10-01 14:13:46', '0000-00-00 00:00:00');
INSERT INTO `tbl_expense_category` VALUES ('57', '3042', 'Labor- QL Buy & Sell', 'OE', '2024-01-09 19:49:22', '0000-00-00 00:00:00');
INSERT INTO `tbl_expense_category` VALUES ('58', '3043', 'Meals- QL Buy & Sell', 'OE', '2024-01-09 19:49:51', '0000-00-00 00:00:00');
INSERT INTO `tbl_expense_category` VALUES ('59', '3044', 'Labor-Farm', 'OE', '2024-01-09 19:55:13', '0000-00-00 00:00:00');
INSERT INTO `tbl_expense_category` VALUES ('60', '3045', 'QL Group of Companies- Rental Expense', 'OE', '2024-01-09 20:01:37', '2024-01-28 15:01:07');
INSERT INTO `tbl_expense_category` VALUES ('61', '3046', 'Supplies-Store', 'OE', '2024-01-09 20:11:08', '0000-00-00 00:00:00');
INSERT INTO `tbl_expense_category` VALUES ('62', '3047', 'Freight Expense', 'OE', '2024-01-28 14:01:43', '0000-00-00 00:00:00');
INSERT INTO `tbl_expense_category` VALUES ('63', '3048', 'QL Group of Companies- Improvements', 'OE', '2024-01-28 14:32:35', '0000-00-00 00:00:00');
INSERT INTO `tbl_expense_category` VALUES ('64', '3049', 'QL Group of Companies- Electricity', 'OE', '2024-01-28 15:02:28', '0000-00-00 00:00:00');
INSERT INTO `tbl_expense_category` VALUES ('65', '3050', 'QL Group of Companies-Water Expense', 'OE', '2024-01-28 15:07:48', '0000-00-00 00:00:00');
INSERT INTO `tbl_expense_category` VALUES ('66', '3051', 'QL Group of Companies- Meals Expense', 'OE', '2024-01-28 15:08:17', '0000-00-00 00:00:00');
INSERT INTO `tbl_expense_category` VALUES ('67', '3052', 'QL Group of Companies- Delivery Expense', 'OE', '2024-01-28 15:08:50', '0000-00-00 00:00:00');
INSERT INTO `tbl_expense_category` VALUES ('68', '3053', 'QL  Group of Companies- Freight Expense ', 'OE', '2024-01-28 15:12:12', '0000-00-00 00:00:00');
INSERT INTO `tbl_expense_category` VALUES ('69', '3054', 'QL Group of Companies- Bus Permit', 'OE', '2024-01-28 15:15:46', '0000-00-00 00:00:00');
INSERT INTO `tbl_expense_category` VALUES ('70', '3055', 'QL Group of Companies- Taxes & Licenses', 'OE', '2024-01-28 15:18:04', '0000-00-00 00:00:00');
INSERT INTO `tbl_expense_category` VALUES ('71', '3056', 'QL of Companies-Communication', 'OE', '2024-01-28 15:18:43', '0000-00-00 00:00:00');
INSERT INTO `tbl_expense_category` VALUES ('72', '3057', 'QL Group of Companies- Store Supplies', 'OE', '2024-01-28 15:19:24', '0000-00-00 00:00:00');
INSERT INTO `tbl_expense_category` VALUES ('73', '3058', 'QL Group of Companies-Office Supplies', 'OE', '2024-01-28 15:19:51', '0000-00-00 00:00:00');
INSERT INTO `tbl_expense_category` VALUES ('74', '3059', 'QL Group of Companies- Other Expense', 'OE', '2024-01-28 15:24:18', '0000-00-00 00:00:00');
INSERT INTO `tbl_expense_category` VALUES ('75', '3060', 'Incentives- Buy & Sell', 'OE', '2024-01-28 19:52:17', '0000-00-00 00:00:00');
INSERT INTO `tbl_expense_category` VALUES ('76', '3061', 'QL Piggery- Other Expense', 'O', '2024-01-28 20:50:42', '0000-00-00 00:00:00');
INSERT INTO `tbl_expense_category` VALUES ('77', '3062', 'QL Group of Companies- Machines & Equipment', 'OE', '2024-01-28 21:17:41', '0000-00-00 00:00:00');
INSERT INTO `tbl_expense_category` VALUES ('78', '3063', 'Meals', 'OE', '2024-02-03 10:12:33', '0000-00-00 00:00:00');

CREATE TABLE `tbl_expense_details` (
  `expense_detail_id` int(11) NOT NULL AUTO_INCREMENT,
  `expense_id` int(11) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `expense_category_id` int(11) NOT NULL,
  `invoice_no` varchar(15) NOT NULL DEFAULT '',
  `amount` decimal(12,2) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`expense_detail_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
INSERT INTO `tbl_expense_details` VALUES ('1', '3', '75', '28', '0', '700.00', 'Sapin Sapin');
INSERT INTO `tbl_expense_details` VALUES ('2', '3', '75', '28', '0', '1000.00', 'Advertisement');
INSERT INTO `tbl_expense_details` VALUES ('3', '3', '75', '28', '0', '17218.00', 'Food Package');
INSERT INTO `tbl_expense_details` VALUES ('4', '4', '75', '8', '0', '180.00', '4 pcs 2x2');
INSERT INTO `tbl_expense_details` VALUES ('5', '5', '76', '8', '0', '950.00', 'Cellphone');

CREATE TABLE `tbl_formulation` (
  `formulation_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(75) NOT NULL,
  `remarks` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_last_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`formulation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `tbl_formulation_details` (
  `formulation_detail_id` int(11) NOT NULL AUTO_INCREMENT,
  `formulation_id` int(11) NOT NULL DEFAULT '0',
  `product_id` int(11) NOT NULL DEFAULT '0',
  `qty` decimal(7,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`formulation_detail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `tbl_inventory_adjustment_details` (
  `adjustment_detail_id` int(11) NOT NULL AUTO_INCREMENT,
  `adjustment_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` decimal(12,2) NOT NULL,
  `cost` decimal(12,2) NOT NULL,
  `price` decimal(12,2) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_last_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`adjustment_detail_id`)
) ENGINE=InnoDB AUTO_INCREMENT=290 DEFAULT CHARSET=latin1;
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('9', '2', '71', '6.00', '1124.39', '1300.00', '2024-02-01 12:33:56', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('10', '3', '615', '6.00', '1150.00', '1280.00', '2024-02-01 12:34:49', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('11', '3', '103', '6.00', '953.46', '1050.00', '2024-02-01 12:35:33', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('12', '3', '162', '6.00', '834.41', '1000.00', '2024-02-01 12:35:52', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('13', '3', '207', '8.00', '1150.00', '1250.00', '2024-02-01 12:36:36', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('14', '3', '118', '6.00', '0.04', '1100.00', '2024-02-01 12:36:54', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('15', '3', '83', '6.00', '360.64', '1300.00', '2024-02-01 12:37:09', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('16', '3', '517', '4.00', '909.09', '1080.00', '2024-02-01 12:38:00', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('17', '3', '543', '6.00', '444.30', '1150.00', '2024-02-01 12:38:32', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('18', '4', '154', '4.00', '203.75', '1250.00', '2024-02-01 12:41:13', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('19', '4', '156', '6.00', '1297.77', '1400.00', '2024-02-01 12:41:43', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('20', '4', '95', '6.00', '929.98', '1050.00', '2024-02-01 12:42:16', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('21', '4', '455', '4.00', '188.65', '1080.00', '2024-02-01 12:42:44', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('22', '4', '231', '6.00', '194.61', '1150.00', '2024-02-01 12:44:00', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('23', '4', '102', '6.00', '862.90', '1200.00', '2024-02-01 12:44:53', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('24', '4', '110', '6.00', '0.13', '1250.00', '2024-02-01 12:45:18', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('25', '4', '92', '6.00', '345.64', '1080.00', '2024-02-01 12:46:09', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('26', '4', '513', '6.00', '807.11', '1050.00', '2024-02-01 12:46:25', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('27', '4', '495', '4.00', '1604.17', '2100.00', '2024-02-01 12:46:37', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('28', '5', '271', '6.00', '330.17', '650.00', '2024-02-01 12:47:44', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('29', '6', '56', '4.00', '403.85', '750.00', '2024-02-01 12:50:21', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('31', '6', '348', '6.00', '542.67', '750.00', '2024-02-01 12:52:21', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('33', '6', '30', '12.00', '375.00', '650.00', '2024-02-01 12:54:52', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('34', '6', '547', '4.00', '899.99', '1050.00', '2024-02-01 12:55:27', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('35', '6', '220', '4.00', '1220.00', '1400.00', '2024-02-01 12:55:50', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('36', '6', '296', '4.00', '1430.00', '1550.00', '2024-02-01 12:56:11', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('37', '6', '144', '12.00', '1299.99', '1450.00', '2024-02-01 12:57:05', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('38', '7', '7', '30.00', '2300.25', '2350.00', '2024-02-01 12:58:13', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('39', '8', '364', '2.00', '2800.00', '2900.00', '2024-02-01 12:59:01', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('40', '8', '538', '10.00', '3000.00', '3300.00', '2024-02-01 12:59:17', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('41', '8', '587', '5.00', '3718.18', '3950.00', '2024-02-01 12:59:36', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('42', '8', '10', '20.00', '5373.28', '5400.00', '2024-02-01 12:59:51', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('43', '8', '11', '10.00', '4398.80', '4500.00', '2024-02-01 13:00:09', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('44', '8', '516', '20.00', '5266.83', '5600.00', '2024-02-01 13:00:24', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('45', '8', '13', '10.00', '5425.37', '5600.00', '2024-02-01 13:00:39', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('46', '8', '14', '10.00', '4700.00', '5000.00', '2024-02-01 13:01:16', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('47', '8', '360', '10.00', '5100.16', '5300.00', '2024-02-01 13:02:02', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('48', '8', '2', '5.00', '4245.45', '4450.00', '2024-02-01 13:02:13', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('49', '8', '3', '10.00', '2276.17', '2400.00', '2024-02-01 13:02:29', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('50', '8', '193', '10.00', '3737.38', '3950.00', '2024-02-01 13:02:42', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('51', '9', '474', '20.00', '1210.00', '1270.00', '2024-02-01 13:05:16', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('52', '9', '475', '20.00', '871.20', '930.00', '2024-02-01 13:05:33', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('53', '9', '644', '10.00', '1296.43', '1270.00', '2024-02-01 13:05:50', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('54', '9', '553', '10.00', '871.20', '930.00', '2024-02-01 13:06:01', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('55', '9', '382', '5.00', '1380.00', '1420.00', '2024-02-01 13:06:15', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('56', '10', '35', '48.00', '201.87', '320.00', '2024-02-01 13:10:31', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('57', '10', '31', '24.00', '154.15', '270.00', '2024-02-01 13:10:52', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('58', '10', '97', '12.00', '419.85', '470.00', '2024-02-01 13:11:05', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('59', '10', '494', '12.00', '340.00', '400.00', '2024-02-01 13:12:54', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('60', '10', '44', '24.00', '270.91', '400.00', '2024-02-01 13:14:06', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('61', '12', '402', '4.00', '1906.16', '1990.00', '2024-02-01 13:20:47', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('62', '13', '404', '5.00', '1804.29', '1900.00', '2024-02-01 13:22:36', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('63', '13', '482', '2.00', '1609.43', '1668.00', '2024-02-01 13:24:05', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('64', '13', '485', '2.00', '1855.00', '1915.00', '2024-02-01 13:24:37', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('65', '13', '487', '2.00', '1775.00', '1830.00', '2024-02-01 13:24:51', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('66', '13', '389', '1.00', '2110.00', '2160.00', '2024-02-01 13:25:19', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('67', '13', '390', '1.00', '1920.00', '1970.00', '2024-02-01 13:25:31', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('68', '13', '391', '1.00', '1742.00', '1790.00', '2024-02-01 13:36:27', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('69', '13', '392', '1.00', '1838.00', '1890.00', '2024-02-01 13:36:38', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('70', '13', '405', '1.00', '2055.00', '2055.00', '2024-02-01 13:36:52', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('71', '13', '406', '1.00', '1890.00', '1960.00', '2024-02-01 13:37:05', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('72', '13', '407', '1.00', '1910.00', '1980.00', '2024-02-01 13:37:36', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('73', '13', '464', '1.00', '1870.00', '1920.00', '2024-02-01 13:37:49', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('74', '13', '460', '1.00', '860.00', '865.00', '2024-02-01 13:38:05', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('75', '13', '408', '1.00', '1170.00', '1200.00', '2024-02-01 13:38:16', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('76', '13', '409', '1.00', '1228.13', '1230.00', '2024-02-01 13:38:28', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('77', '14', '227', '100.00', '0.01', '1.00', '2024-02-01 13:39:57', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('78', '15', '174', '50.00', '19.00', '35.00', '2024-02-01 13:45:42', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('79', '16', '177', '1000.00', '11.80', '13.00', '2024-02-01 13:47:08', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('80', '16', '178', '500.00', '11.50', '13.50', '2024-02-01 13:47:29', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('81', '17', '117', '12.00', '743.00', '800.00', '2024-02-01 13:48:36', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('82', '17', '388', '13.00', '300.00', '400.00', '2024-02-01 13:48:58', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('83', '18', '288', '3.00', '332.00', '400.00', '2024-02-01 14:38:56', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('84', '18', '217', '4.00', '195.07', '250.00', '2024-02-01 14:39:30', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('85', '18', '57', '4.00', '360.00', '900.00', '2024-02-01 14:39:45', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('86', '20', '288', '3.00', '332.00', '400.00', '2024-02-01 14:42:45', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('87', '21', '217', '4.00', '195.07', '250.00', '2024-02-01 14:44:07', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('88', '21', '57', '4.00', '360.00', '900.00', '2024-02-01 14:44:20', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('89', '21', '315', '4.00', '464.00', '600.00', '2024-02-01 14:44:50', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('90', '21', '123', '1.00', '375.00', '400.00', '2024-02-01 14:45:05', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('91', '21', '124', '4.00', '205.00', '230.00', '2024-02-01 14:45:17', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('92', '21', '282', '6.00', '110.55', '150.00', '2024-02-01 14:45:26', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('93', '21', '117', '1.00', '743.00', '800.00', '2024-02-01 14:45:50', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('94', '21', '167', '1.00', '800.00', '850.00', '2024-02-01 14:46:16', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('95', '21', '214', '2.00', '300.00', '370.00', '2024-02-01 14:46:57', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('96', '21', '125', '2.00', '366.67', '450.00', '2024-02-01 14:47:15', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('97', '21', '289', '5.00', '540.00', '650.00', '2024-02-01 14:47:37', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('98', '21', '640', '2.00', '240.00', '300.00', '2024-02-01 14:48:12', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('99', '21', '251', '1.00', '235.00', '300.00', '2024-02-01 14:48:47', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('100', '21', '90', '4.00', '1516.15', '1680.00', '2024-02-01 14:49:04', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('101', '21', '49', '1.00', '1030.00', '1100.00', '2024-02-01 14:49:17', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('102', '21', '212', '2.00', '880.00', '950.00', '2024-02-01 14:49:33', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('103', '21', '450', '4.00', '1589.29', '1700.00', '2024-02-01 14:49:48', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('104', '21', '230', '3.00', '195.00', '250.00', '2024-02-01 14:49:58', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('105', '21', '62', '2.00', '101.12', '150.00', '2024-02-01 14:50:28', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('106', '21', '80', '4.00', '370.28', '650.00', '2024-02-01 14:50:53', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('107', '21', '274', '2.00', '3.64', '470.00', '2024-02-01 14:51:26', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('108', '21', '112', '2.00', '315.22', '390.00', '2024-02-01 14:51:37', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('109', '21', '113', '2.00', '315.00', '400.00', '2024-02-01 14:51:48', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('110', '23', '41', '2.00', '250.00', '320.00', '2024-02-01 15:04:02', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('111', '23', '211', '6.00', '354.83', '400.00', '2024-02-01 15:04:18', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('112', '23', '645', '2.00', '0.00', '700.00', '2024-02-01 15:04:34', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('113', '23', '548', '3.00', '940.00', '1020.00', '2024-02-01 15:04:49', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('114', '23', '549', '2.00', '650.00', '720.00', '2024-02-01 15:05:05', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('115', '23', '357', '3.00', '1050.00', '1120.00', '2024-02-01 15:05:23', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('116', '23', '75', '4.00', '854.94', '920.00', '2024-02-01 15:05:41', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('117', '23', '74', '1.00', '1554.58', '1700.00', '2024-02-01 15:06:01', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('118', '23', '248', '2.00', '2190.00', '2280.00', '2024-02-01 15:06:17', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('119', '23', '537', '3.00', '785.00', '850.00', '2024-02-01 15:06:28', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('120', '23', '39', '3.00', '384.91', '580.00', '2024-02-01 15:06:43', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('121', '23', '320', '4.00', '300.00', '370.00', '2024-02-01 15:06:59', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('122', '23', '304', '4.00', '550.00', '620.00', '2024-02-01 15:07:12', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('123', '23', '237', '2.00', '760.00', '870.00', '2024-02-01 15:07:44', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('124', '25', '61', '3.00', '1032.86', '1150.00', '2024-02-01 15:12:44', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('125', '25', '511', '6.00', '770.00', '850.00', '2024-02-01 15:12:54', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('126', '25', '261', '2.00', '380.00', '450.00', '2024-02-01 15:13:06', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('127', '25', '91', '4.00', '456.50', '490.00', '2024-02-01 15:14:25', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('128', '25', '153', '6.00', '345.05', '430.00', '2024-02-01 15:14:35', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('129', '25', '469', '3.00', '825.00', '900.00', '2024-02-01 15:14:55', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('130', '25', '283', '4.00', '215.00', '300.00', '2024-02-01 15:15:28', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('131', '25', '466', '2.00', '1250.00', '1300.00', '2024-02-01 15:15:43', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('132', '25', '468', '2.00', '430.00', '470.00', '2024-02-01 15:15:53', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('133', '25', '467', '2.00', '820.00', '870.00', '2024-02-01 15:16:03', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('134', '25', '147', '24.00', '2700.00', '2800.00', '2024-02-01 15:16:21', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('135', '25', '121', '3.00', '253.00', '300.00', '2024-02-01 15:16:33', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('136', '25', '122', '10.00', '70.00', '100.00', '2024-02-01 15:16:42', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('137', '25', '65', '6.00', '360.00', '400.00', '2024-02-01 15:16:52', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('138', '25', '46', '600.00', '69.13', '45.00', '2024-02-01 15:17:02', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('139', '25', '141', '20.00', '18.00', '30.00', '2024-02-01 15:17:16', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('140', '25', '168', '20.00', '129.99', '150.00', '2024-02-01 15:17:29', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('141', '25', '86', '2.00', '240.00', '300.00', '2024-02-01 15:17:44', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('142', '25', '135', '1.00', '125.00', '300.00', '2024-02-01 15:18:00', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('143', '25', '246', '1.00', '98.85', '150.00', '2024-02-01 15:18:13', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('144', '25', '143', '10.00', '186.67', '250.00', '2024-02-01 15:18:28', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('145', '25', '613', '3.00', '0.00', '700.00', '2024-02-01 15:19:13', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('146', '25', '171', '5.00', '100.00', '140.00', '2024-02-01 15:19:29', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('147', '25', '183', '30.00', '100.87', '170.00', '2024-02-01 15:19:43', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('148', '25', '79', '3.00', '250.00', '320.00', '2024-02-01 15:20:06', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('149', '25', '106', '1.00', '335.00', '420.00', '2024-02-01 15:20:36', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('150', '25', '107', '1.00', '345.00', '460.00', '2024-02-01 15:20:58', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('151', '25', '173', '1.00', '270.00', '350.00', '2024-02-01 15:21:26', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('152', '25', '622', '2.00', '620.00', '670.00', '2024-02-01 15:21:42', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('153', '25', '658', '6.00', '520.00', '580.00', '2024-02-01 15:22:18', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('154', '25', '176', '50.00', '6.27', '10.00', '2024-02-01 15:22:39', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('155', '26', '205', '8.00', '212.20', '300.00', '2024-02-01 15:56:30', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('156', '27', '474', '50.00', '1210.00', '1270.00', '2024-02-01 16:17:28', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('157', '28', '475', '30.00', '871.20', '930.00', '2024-02-01 16:18:39', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('158', '28', '553', '20.00', '871.20', '930.00', '2024-02-01 16:18:53', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('159', '29', '402', '10.00', '1906.16', '1990.00', '2024-02-01 16:27:07', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('160', '29', '452', '1.00', '1479.25', '1550.00', '2024-02-01 16:27:14', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('161', '29', '459', '1.00', '960.00', '800.00', '2024-02-01 16:27:25', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('162', '29', '393', '2.00', '1693.17', '1761.00', '2024-02-01 16:27:41', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('163', '29', '394', '3.00', '1605.83', '1676.00', '2024-02-01 16:28:10', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('164', '29', '395', '2.00', '1569.79', '1640.00', '2024-02-01 16:28:25', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('165', '29', '397', '1.00', '1678.00', '1720.00', '2024-02-01 16:28:42', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('166', '29', '396', '1.00', '1559.38', '1629.00', '2024-02-01 16:28:53', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('167', '29', '145', '12.00', '0.00', '450.00', '2024-02-01 16:29:22', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('168', '30', '481', '24.00', '50.00', '53.00', '2024-02-01 16:56:12', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('169', '30', '426', '12.00', '49.03', '55.00', '2024-02-01 16:56:29', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('170', '31', '462', '1.00', '520.00', '570.00', '2024-02-02 11:05:08', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('171', '31', '184', '1.00', '430.00', '500.00', '2024-02-02 11:05:25', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('172', '32', '282', '4.00', '110.55', '150.00', '2024-02-02 11:06:11', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('173', '32', '640', '4.00', '240.00', '300.00', '2024-02-02 11:06:23', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('174', '32', '82', '1.00', '440.00', '550.00', '2024-02-02 11:06:33', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('175', '32', '249', '1.00', '266.88', '350.00', '2024-02-02 11:07:52', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('176', '32', '157', '6.00', '330.00', '420.00', '2024-02-02 11:08:48', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('177', '32', '662', '4.00', '350.00', '550.00', '2024-02-02 11:09:13', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('178', '33', '205', '-8.00', '249.86', '300.00', '2024-02-02 11:10:40', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('179', '34', '132', '2.00', '700.00', '370.00', '2024-02-02 11:13:52', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('180', '34', '313', '2.00', '280.00', '350.00', '2024-02-02 11:14:39', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('181', '34', '634', '2.00', '300.00', '320.00', '2024-02-02 11:14:59', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('182', '34', '119', '2.00', '500.00', '550.00', '2024-02-02 11:15:10', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('183', '34', '87', '40.00', '121.59', '180.00', '2024-02-02 11:15:20', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('184', '34', '344', '2.00', '560.00', '650.00', '2024-02-02 11:15:37', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('185', '35', '508', '6.00', '38.87', '80.00', '2024-02-02 11:19:13', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('186', '35', '236', '4.00', '60.00', '100.00', '2024-02-02 11:19:32', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('187', '35', '363', '21.00', '25.00', '40.00', '2024-02-02 11:20:27', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('188', '35', '104', '12.00', '128.78', '380.00', '2024-02-02 11:20:49', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('189', '35', '641', '10.00', '73.00', '85.00', '2024-02-02 11:20:58', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('190', '35', '654', '2.00', '60.00', '85.00', '2024-02-02 11:21:43', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('191', '35', '483', '6.00', '73.00', '85.00', '2024-02-02 11:22:09', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('192', '35', '650', '10.00', '38.00', '43.00', '2024-02-02 11:22:31', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('193', '35', '530', '10.00', '22.67', '27.00', '2024-02-02 11:22:57', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('194', '35', '413', '5.00', '13.40', '22.00', '2024-02-02 11:23:10', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('195', '35', '526', '5.00', '8.73', '10.00', '2024-02-02 11:23:20', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('196', '35', '500', '5.00', '28.88', '30.00', '2024-02-02 11:23:31', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('197', '35', '616', '10.00', '15.04', '23.00', '2024-02-02 11:23:58', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('198', '35', '504', '3.00', '17.14', '25.00', '2024-02-02 11:24:10', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('199', '35', '414', '6.00', '20.00', '16.00', '2024-02-02 11:24:29', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('200', '35', '415', '5.00', '14.50', '16.00', '2024-02-02 11:24:38', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('201', '35', '528', '10.00', '23.98', '28.00', '2024-02-02 11:24:49', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('202', '35', '410', '6.00', '22.94', '24.00', '2024-02-02 11:25:45', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('203', '35', '412', '6.00', '11.60', '13.00', '2024-02-02 11:25:57', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('204', '35', '411', '6.00', '16.40', '20.00', '2024-02-02 11:26:07', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('205', '35', '666', '10.00', '26.00', '28.00', '2024-02-02 11:27:16', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('206', '35', '665', '10.00', '15.20', '18.00', '2024-02-02 11:27:30', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('207', '35', '503', '10.00', '12.53', '15.00', '2024-02-02 11:27:50', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('208', '35', '502', '10.00', '11.77', '15.00', '2024-02-02 11:28:03', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('209', '35', '419', '10.00', '5.99', '8.00', '2024-02-02 11:28:25', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('210', '35', '651', '20.00', '13.00', '15.00', '2024-02-02 11:28:39', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('211', '35', '663', '10.00', '4.90', '6.00', '2024-02-02 11:29:07', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('212', '35', '653', '10.00', '5.00', '8.00', '2024-02-02 11:29:23', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('213', '35', '423', '10.00', '7.00', '9.00', '2024-02-02 11:29:41', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('214', '35', '652', '10.00', '13.00', '15.00', '2024-02-02 11:29:58', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('215', '36', '281', '4.00', '620.00', '720.00', '2024-02-02 16:23:33', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('216', '36', '540', '6.00', '0.00', '450.00', '2024-02-02 16:23:44', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('217', '36', '659', '4.00', '375.00', '450.00', '2024-02-02 16:23:53', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('218', '36', '544', '2.00', '330.00', '400.00', '2024-02-02 16:24:02', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('219', '36', '165', '3.00', '300.00', '400.00', '2024-02-02 16:24:12', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('221', '36', '244', '4.00', '330.00', '420.00', '2024-02-02 16:25:08', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('222', '36', '274', '2.00', '3.64', '470.00', '2024-02-02 16:25:18', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('223', '37', '291', '9.00', '152.87', '700.00', '2024-02-02 16:26:40', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('224', '38', '403', '8.00', '1340.00', '1470.00', '2024-02-03 07:31:01', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('225', '38', '401', '5.00', '2045.00', '2100.00', '2024-02-03 07:31:14', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('226', '39', '13', '1.00', '5425.37', '5600.00', '2024-02-03 07:52:58', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('227', '39', '143', '4.00', '186.67', '250.00', '2024-02-03 07:53:04', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('228', '40', '13', '-1.00', '5425.37', '5600.00', '2024-02-03 07:55:07', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('229', '40', '143', '-4.00', '186.67', '250.00', '2024-02-03 07:55:12', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('230', '41', '223', '5.00', '1584.59', '2200.00', '2024-02-03 07:58:01', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('231', '41', '222', '5.00', '1800.00', '2600.00', '2024-02-03 07:58:08', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('232', '41', '264', '5.00', '2300.00', '3000.00', '2024-02-03 07:58:16', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('233', '42', '464', '3.00', '1870.00', '1920.00', '2024-02-03 08:39:10', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('234', '42', '407', '1.00', '1910.00', '1980.00', '2024-02-03 08:39:38', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('235', '42', '405', '2.00', '2055.00', '2055.00', '2024-02-03 08:39:52', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('236', '43', '404', '5.00', '1804.29', '1950.00', '2024-02-03 08:47:15', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('237', '44', '358', '1.00', '3.73', '1380.00', '2024-02-03 14:53:02', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('238', '45', '19', '500.00', '1263.45', '1330.00', '2024-02-03 14:55:24', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('239', '45', '28', '500.00', '1349.15', '1430.00', '2024-02-03 14:55:30', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('240', '45', '25', '500.00', '636.21', '700.00', '2024-02-03 14:55:38', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('241', '46', '660', '26.00', '60.00', '70.00', '2024-02-04 07:32:56', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('242', '47', '19', '60.00', '1263.45', '1330.00', '2024-02-04 08:00:51', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('243', '47', '28', '50.00', '1349.15', '1430.00', '2024-02-04 08:01:09', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('244', '47', '18', '30.00', '1388.14', '1480.00', '2024-02-04 08:01:27', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('245', '47', '24', '30.00', '642.04', '730.00', '2024-02-04 08:02:49', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('246', '47', '16', '10.00', '1870.95', '1950.00', '2024-02-04 08:03:02', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('247', '47', '22', '2.00', '2450.53', '2650.00', '2024-02-04 08:03:30', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('248', '49', '19', '-500.00', '1263.45', '1330.00', '2024-02-04 08:39:43', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('249', '50', '28', '-500.00', '1349.15', '1430.00', '2024-02-04 08:51:46', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('250', '51', '19', '-50.00', '1257.28', '1330.00', '2024-02-04 09:04:21', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('251', '51', '28', '-50.00', '1339.48', '1430.00', '2024-02-04 09:04:31', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('252', '51', '18', '-30.00', '1389.07', '1480.00', '2024-02-04 09:04:40', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('253', '51', '24', '-30.00', '651.02', '730.00', '2024-02-04 09:04:56', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('254', '51', '16', '-10.00', '1870.47', '1950.00', '2024-02-04 09:05:06', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('255', '51', '22', '-2.00', '2450.26', '2650.00', '2024-02-04 09:05:13', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('256', '52', '389', '3.00', '2110.00', '2160.00', '2024-02-04 11:16:48', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('257', '52', '390', '2.00', '1920.00', '1970.00', '2024-02-04 11:17:01', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('258', '52', '391', '2.00', '1742.00', '1790.00', '2024-02-04 11:17:20', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('259', '52', '392', '3.00', '1837.00', '1890.00', '2024-02-04 11:17:37', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('260', '52', '487', '3.00', '1775.00', '1830.00', '2024-02-04 11:17:54', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('261', '52', '485', '2.00', '1855.00', '1915.00', '2024-02-04 11:18:16', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('262', '52', '407', '2.00', '1910.00', '1980.00', '2024-02-04 11:18:40', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('263', '52', '464', '1.00', '1870.00', '1920.00', '2024-02-04 11:19:08', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('264', '52', '406', '2.00', '1890.00', '1960.00', '2024-02-04 11:19:23', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('265', '52', '396', '2.00', '1559.00', '1629.00', '2024-02-04 11:19:40', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('266', '53', '389', '-3.00', '2110.00', '2160.00', '2024-02-04 11:21:27', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('267', '53', '390', '-2.00', '1920.00', '1970.00', '2024-02-04 11:21:40', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('268', '53', '391', '-2.00', '1742.00', '1790.00', '2024-02-04 11:21:54', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('269', '53', '392', '-3.00', '1837.00', '1890.00', '2024-02-04 11:22:12', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('270', '53', '487', '-3.00', '1775.00', '1830.00', '2024-02-04 11:22:38', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('271', '53', '485', '-2.00', '1855.00', '1915.00', '2024-02-04 11:23:16', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('272', '53', '407', '-2.00', '1910.00', '1980.00', '2024-02-04 11:23:41', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('273', '53', '464', '-1.00', '1870.00', '1920.00', '2024-02-04 11:24:02', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('274', '53', '406', '-2.00', '1890.00', '1960.00', '2024-02-04 11:24:17', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('275', '53', '396', '-2.00', '1559.00', '1629.00', '2024-02-04 11:24:36', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('276', '54', '253', '36.00', '89.11', '100.00', '2024-02-04 11:34:10', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('277', '55', '567', '3.00', '4974.29', '5880.00', '2024-02-04 18:15:39', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('278', '56', '567', '5.00', '4974.29', '5880.00', '2024-02-04 18:16:02', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('279', '57', '567', '-5.00', '4976.73', '5880.00', '2024-02-05 09:08:17', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('280', '58', '25', '17.00', '636.21', '700.00', '2024-02-06 06:15:36', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('281', '58', '29', '9.00', '1376.79', '1450.00', '2024-02-06 06:15:45', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('282', '59', '13', '-4.00', '5414.34', '5600.00', '2024-02-06 09:50:56', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('283', '60', '19', '-10.00', '1257.28', '1330.00', '2024-02-06 10:02:43', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('284', '61', '25', '-517.00', '636.21', '700.00', '2024-02-06 10:04:47', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('285', '62', '29', '-9.00', '1364.16', '1450.00', '2024-02-06 14:01:44', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('286', '63', '29', '-2.00', '1364.16', '1450.00', '2024-02-06 14:03:00', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('287', '64', '253', '-36.00', '89.11', '100.00', '2024-02-06 14:15:58', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustment_details` VALUES ('289', '66', '143', '-16.00', '186.67', '250.00', '2024-02-06 14:52:03', '0000-00-00 00:00:00');

CREATE TABLE `tbl_inventory_adjustments` (
  `adjustment_id` int(11) NOT NULL AUTO_INCREMENT,
  `reference_number` varchar(75) NOT NULL,
  `remarks` varchar(255) NOT NULL,
  `status` varchar(1) NOT NULL,
  `encoded_by` int(11) NOT NULL,
  `adjustment_date` datetime NOT NULL,
  `date_added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_last_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`adjustment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=latin1;
INSERT INTO `tbl_inventory_adjustments` VALUES ('1', 'IA-20240201103712', '', '', '1', '2024-02-01 00:00:00', '2024-02-01 10:37:13', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustments` VALUES ('2', 'IA-20240201122708', '', 'F', '1', '2024-02-01 00:00:00', '2024-02-01 12:27:12', '2024-02-01 12:34:01');
INSERT INTO `tbl_inventory_adjustments` VALUES ('3', 'IA-20240201123433', '', 'F', '1', '2024-02-01 00:00:00', '2024-02-01 12:34:35', '2024-02-01 12:40:10');
INSERT INTO `tbl_inventory_adjustments` VALUES ('4', 'IA-20240201124027', '', 'F', '1', '2024-02-01 00:00:00', '2024-02-01 12:40:31', '2024-02-01 12:47:13');
INSERT INTO `tbl_inventory_adjustments` VALUES ('5', 'IA-20240201124716', '', 'F', '1', '2024-02-01 00:00:00', '2024-02-01 12:47:18', '2024-02-01 12:48:53');
INSERT INTO `tbl_inventory_adjustments` VALUES ('6', 'IA-20240201124856', '', 'F', '1', '2024-02-01 00:00:00', '2024-02-01 12:48:57', '2024-02-01 12:57:31');
INSERT INTO `tbl_inventory_adjustments` VALUES ('7', 'IA-20240201125735', '', 'F', '1', '2024-02-01 00:00:00', '2024-02-01 12:57:39', '2024-02-01 12:58:18');
INSERT INTO `tbl_inventory_adjustments` VALUES ('8', 'IA-20240201125838', '', 'F', '1', '2024-02-01 00:00:00', '2024-02-01 12:58:39', '2024-02-01 13:03:28');
INSERT INTO `tbl_inventory_adjustments` VALUES ('9', 'IA-20240201130419', '', 'F', '1', '2024-02-01 00:00:00', '2024-02-01 13:04:21', '2024-02-01 13:06:26');
INSERT INTO `tbl_inventory_adjustments` VALUES ('10', 'IA-20240201130710', '', 'F', '1', '2024-02-01 00:00:00', '2024-02-01 13:07:12', '2024-02-01 13:14:42');
INSERT INTO `tbl_inventory_adjustments` VALUES ('11', 'IA-20240201131456', '', '', '1', '2024-02-01 00:00:00', '2024-02-01 13:14:58', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustments` VALUES ('12', 'IA-20240201132011', '', 'F', '1', '2024-02-01 00:00:00', '2024-02-01 13:20:13', '2024-02-01 13:20:51');
INSERT INTO `tbl_inventory_adjustments` VALUES ('13', 'IA-20240201132116', '', 'F', '1', '2024-02-01 00:00:00', '2024-02-01 13:21:49', '2024-02-01 13:39:39');
INSERT INTO `tbl_inventory_adjustments` VALUES ('14', 'IA-20240201133945', '', 'F', '1', '2024-02-01 00:00:00', '2024-02-01 13:39:46', '2024-02-01 13:39:59');
INSERT INTO `tbl_inventory_adjustments` VALUES ('15', 'IA-20240201134501', '', 'F', '1', '2024-02-01 00:00:00', '2024-02-01 13:45:04', '2024-02-01 13:46:11');
INSERT INTO `tbl_inventory_adjustments` VALUES ('16', 'IA-20240201134648', '', 'F', '1', '2024-02-01 00:00:00', '2024-02-01 13:46:50', '2024-02-01 13:47:53');
INSERT INTO `tbl_inventory_adjustments` VALUES ('17', 'IA-20240201134756', '', 'F', '1', '2024-02-01 00:00:00', '2024-02-01 13:47:58', '2024-02-01 13:49:23');
INSERT INTO `tbl_inventory_adjustments` VALUES ('18', 'IA-20240201143634', '', '', '1', '2024-02-01 00:00:00', '2024-02-01 14:36:37', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustments` VALUES ('19', 'IA-20240201143958', '', '', '1', '2024-02-01 00:00:00', '2024-02-01 14:40:01', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustments` VALUES ('20', 'IA-20240201144215', '', 'F', '1', '2024-02-01 00:00:00', '2024-02-01 14:42:19', '2024-02-01 14:43:05');
INSERT INTO `tbl_inventory_adjustments` VALUES ('21', 'IA-20240201144341', '', 'F', '1', '2024-02-01 00:00:00', '2024-02-01 14:43:43', '2024-02-01 14:54:34');
INSERT INTO `tbl_inventory_adjustments` VALUES ('22', 'IA-20240201145630', '', '', '1', '2024-02-01 00:00:00', '2024-02-01 14:56:32', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustments` VALUES ('23', 'IA-20240201150242', '', 'F', '1', '2024-02-01 00:00:00', '2024-02-01 15:02:45', '2024-02-01 15:08:41');
INSERT INTO `tbl_inventory_adjustments` VALUES ('24', 'IA-20240201150917', '', '', '1', '2024-02-01 00:00:00', '2024-02-01 15:09:19', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustments` VALUES ('25', 'IA-20240201151223', '', 'F', '1', '2024-02-01 00:00:00', '2024-02-01 15:12:25', '2024-02-01 15:24:00');
INSERT INTO `tbl_inventory_adjustments` VALUES ('26', 'IA-20240201155600', '', 'F', '1', '2024-02-01 00:00:00', '2024-02-01 15:56:02', '2024-02-01 15:56:52');
INSERT INTO `tbl_inventory_adjustments` VALUES ('27', 'IA-20240201161614', '', 'F', '1', '2024-02-01 00:00:00', '2024-02-01 16:16:16', '2024-02-01 16:17:33');
INSERT INTO `tbl_inventory_adjustments` VALUES ('28', 'IA-20240201161756', '', 'F', '1', '2024-02-01 00:00:00', '2024-02-01 16:17:58', '2024-02-01 16:19:05');
INSERT INTO `tbl_inventory_adjustments` VALUES ('29', 'IA-20240201162411', '', 'F', '1', '2024-02-01 00:00:00', '2024-02-01 16:24:14', '2024-02-01 16:32:25');
INSERT INTO `tbl_inventory_adjustments` VALUES ('30', 'IA-20240201165558', '', 'F', '1', '2024-02-01 00:00:00', '2024-02-01 16:56:00', '2024-02-01 16:56:34');
INSERT INTO `tbl_inventory_adjustments` VALUES ('31', 'IA-20240202110446', '', 'F', '1', '2024-02-02 00:00:00', '2024-02-02 11:04:49', '2024-02-02 11:05:31');
INSERT INTO `tbl_inventory_adjustments` VALUES ('32', 'IA-20240202110556', '', 'F', '1', '2024-02-02 00:00:00', '2024-02-02 11:05:59', '2024-02-02 11:10:28');
INSERT INTO `tbl_inventory_adjustments` VALUES ('33', 'IA-20240202111032', '', 'F', '1', '2024-02-02 00:00:00', '2024-02-02 11:10:34', '2024-02-02 11:10:42');
INSERT INTO `tbl_inventory_adjustments` VALUES ('34', 'IA-20240202111300', '', 'F', '1', '2024-02-02 00:00:00', '2024-02-02 11:13:06', '2024-02-02 11:15:46');
INSERT INTO `tbl_inventory_adjustments` VALUES ('35', 'IA-20240202111620', '', 'F', '1', '2024-02-02 00:00:00', '2024-02-02 11:16:22', '2024-02-02 11:31:23');
INSERT INTO `tbl_inventory_adjustments` VALUES ('36', 'IA-20240202162318', '', 'F', '1', '2024-02-02 00:00:00', '2024-02-02 16:23:21', '2024-02-02 16:25:42');
INSERT INTO `tbl_inventory_adjustments` VALUES ('37', 'IA-20240202162625', '', 'F', '1', '2024-02-02 00:00:00', '2024-02-02 16:26:27', '2024-02-02 16:27:00');
INSERT INTO `tbl_inventory_adjustments` VALUES ('38', 'IA-20240203073039', '', 'F', '1', '2024-02-03 00:00:00', '2024-02-03 07:30:41', '2024-02-03 07:31:21');
INSERT INTO `tbl_inventory_adjustments` VALUES ('39', 'IA-20240203075250', '', 'F', '1', '2024-02-03 00:00:00', '2024-02-03 07:52:52', '2024-02-03 07:53:06');
INSERT INTO `tbl_inventory_adjustments` VALUES ('40', 'IA-20240203075457', '', 'F', '1', '2024-02-03 00:00:00', '2024-02-03 07:54:58', '2024-02-03 07:55:13');
INSERT INTO `tbl_inventory_adjustments` VALUES ('41', 'IA-20240203075747', '', 'F', '1', '2024-02-03 00:00:00', '2024-02-03 07:57:48', '2024-02-03 07:58:20');
INSERT INTO `tbl_inventory_adjustments` VALUES ('42', 'IA-20240203083815', '', 'F', '1', '2024-02-03 00:00:00', '2024-02-03 08:38:25', '2024-02-03 08:40:00');
INSERT INTO `tbl_inventory_adjustments` VALUES ('43', 'IA-20240203084655', '', 'F', '1', '2024-02-03 00:00:00', '2024-02-03 08:46:58', '2024-02-03 08:47:22');
INSERT INTO `tbl_inventory_adjustments` VALUES ('44', 'IA-20240203145254', '', 'F', '1', '2024-02-03 00:00:00', '2024-02-03 14:52:55', '2024-02-03 14:53:04');
INSERT INTO `tbl_inventory_adjustments` VALUES ('45', 'IA-20240203145513', '', 'F', '1', '2024-02-03 00:00:00', '2024-02-03 14:55:15', '2024-02-03 14:55:40');
INSERT INTO `tbl_inventory_adjustments` VALUES ('46', 'IA-20240204073240', '', 'F', '1', '2024-02-04 00:00:00', '2024-02-04 07:32:43', '2024-02-04 07:33:01');
INSERT INTO `tbl_inventory_adjustments` VALUES ('47', 'IA-20240204080026', '', 'F', '1', '2024-02-04 00:00:00', '2024-02-04 08:00:32', '2024-02-04 08:04:09');
INSERT INTO `tbl_inventory_adjustments` VALUES ('48', 'IA-20240204080921', 'abono
', '', '1', '2024-02-04 00:00:00', '2024-02-04 08:09:34', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustments` VALUES ('49', 'IA-20240204083935', '', 'F', '1', '2024-02-04 00:00:00', '2024-02-04 08:39:36', '2024-02-04 08:39:45');
INSERT INTO `tbl_inventory_adjustments` VALUES ('50', 'IA-20240204085137', '', 'F', '1', '2024-02-04 00:00:00', '2024-02-04 08:51:38', '2024-02-04 08:51:48');
INSERT INTO `tbl_inventory_adjustments` VALUES ('51', 'IA-20240204090309', '', 'F', '1', '2024-02-04 00:00:00', '2024-02-04 09:03:16', '2024-02-04 09:05:18');
INSERT INTO `tbl_inventory_adjustments` VALUES ('52', 'IA-20240204111622', '', 'F', '1', '2024-02-04 00:00:00', '2024-02-04 11:16:26', '2024-02-04 11:19:45');
INSERT INTO `tbl_inventory_adjustments` VALUES ('53', 'IA-20240204112104', '', 'F', '1', '2024-02-04 00:00:00', '2024-02-04 11:21:07', '2024-02-04 11:24:41');
INSERT INTO `tbl_inventory_adjustments` VALUES ('54', 'IA-20240204113349', '', 'F', '1', '2024-02-04 00:00:00', '2024-02-04 11:33:51', '2024-02-04 11:34:18');
INSERT INTO `tbl_inventory_adjustments` VALUES ('55', 'IA-20240204181528', '', '', '1', '2024-02-04 00:00:00', '2024-02-04 18:15:29', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustments` VALUES ('56', 'IA-20240204181547', '', 'F', '1', '2024-02-04 00:00:00', '2024-02-04 18:15:48', '2024-02-04 18:16:03');
INSERT INTO `tbl_inventory_adjustments` VALUES ('57', 'IA-20240205090809', '', 'F', '1', '2024-02-05 00:00:00', '2024-02-05 09:08:10', '2024-02-05 09:08:18');
INSERT INTO `tbl_inventory_adjustments` VALUES ('58', 'IA-20240206061437', '', 'F', '1', '2024-02-06 00:00:00', '2024-02-06 06:15:27', '2024-02-06 06:15:48');
INSERT INTO `tbl_inventory_adjustments` VALUES ('59', 'IA-20240206095049', '', 'F', '1', '2024-02-06 00:00:00', '2024-02-06 09:50:50', '2024-02-06 09:50:59');
INSERT INTO `tbl_inventory_adjustments` VALUES ('60', 'IA-20240206100236', '', 'F', '1', '2024-02-06 00:00:00', '2024-02-06 10:02:37', '2024-02-06 10:02:45');
INSERT INTO `tbl_inventory_adjustments` VALUES ('61', 'IA-20240206100435', '', 'F', '1', '2024-02-06 00:00:00', '2024-02-06 10:04:36', '2024-02-06 10:04:49');
INSERT INTO `tbl_inventory_adjustments` VALUES ('62', 'IA-20240206140135', '', 'F', '1', '2024-02-06 00:00:00', '2024-02-06 14:01:36', '2024-02-06 14:01:45');
INSERT INTO `tbl_inventory_adjustments` VALUES ('63', 'IA-20240206140251', '', 'F', '1', '2024-02-06 00:00:00', '2024-02-06 14:02:52', '2024-02-06 14:03:02');
INSERT INTO `tbl_inventory_adjustments` VALUES ('64', 'IA-20240206141545', '', 'F', '1', '2024-02-06 00:00:00', '2024-02-06 14:15:46', '2024-02-06 14:16:00');
INSERT INTO `tbl_inventory_adjustments` VALUES ('65', 'IA-20240206143256', '', '', '1', '2024-02-06 00:00:00', '2024-02-06 14:32:57', '0000-00-00 00:00:00');
INSERT INTO `tbl_inventory_adjustments` VALUES ('66', 'IA-20240206145155', '', 'F', '1', '2024-02-06 00:00:00', '2024-02-06 14:51:56', '2024-02-06 14:52:05');

CREATE TABLE `tbl_job_order_details` (
  `jo_detail_id` int(11) NOT NULL AUTO_INCREMENT,
  `job_order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` decimal(7,2) NOT NULL,
  `cost` decimal(12,5) NOT NULL,
  PRIMARY KEY (`jo_detail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `tbl_job_orders` (
  `job_order_id` int(11) NOT NULL AUTO_INCREMENT,
  `reference_number` varchar(75) NOT NULL,
  `product_id` int(11) NOT NULL,
  `no_of_batches` int(3) NOT NULL,
  `remarks` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `job_order_date` date NOT NULL,
  `encoded_by` int(11) NOT NULL,
  `status` varchar(1) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_last_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`job_order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `tbl_payment_option` (
  `payment_option_id` int(11) NOT NULL AUTO_INCREMENT,
  `payment_option` varchar(50) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_last_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`payment_option_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
INSERT INTO `tbl_payment_option` VALUES ('0', '*suki card rewards', '2023-07-01 20:42:44', '2023-07-01 20:42:44');
INSERT INTO `tbl_payment_option` VALUES ('3', 'Online Payment-Gcash', '2022-11-15 11:16:56', '2022-11-15 11:16:56');
INSERT INTO `tbl_payment_option` VALUES ('4', 'Partial Payment', '2022-11-17 15:43:01', '2022-11-17 15:43:01');

CREATE TABLE `tbl_price_notice` (
  `price_id` int(11) NOT NULL AUTO_INCREMENT,
  `reference_number` varchar(75) NOT NULL,
  `effective_date` date NOT NULL,
  `effective_status` int(1) NOT NULL,
  `remarks` varchar(255) NOT NULL,
  `status` varchar(1) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_last_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`price_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
INSERT INTO `tbl_price_notice` VALUES ('1', 'PN-20240205084734', '2024-02-05', '1', '', 'F', '2024-02-05 08:47:39', '2024-02-05 08:48:30');

CREATE TABLE `tbl_price_notice_details` (
  `price_detail_id` int(11) NOT NULL AUTO_INCREMENT,
  `price_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `old_price` decimal(12,2) NOT NULL,
  `price` decimal(12,2) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_last_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`price_detail_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
INSERT INTO `tbl_price_notice_details` VALUES ('1', '1', '28', '1450.00', '1480.00', '2024-02-05 08:48:00', '0000-00-00 00:00:00');
INSERT INTO `tbl_price_notice_details` VALUES ('2', '1', '29', '1430.00', '1450.00', '2024-02-05 08:48:17', '0000-00-00 00:00:00');

CREATE TABLE `tbl_product_categories` (
  `product_category_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_category` varchar(75) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_last_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`product_category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
INSERT INTO `tbl_product_categories` VALUES ('1', 'Seeds', '2022-11-15 09:29:33', '0000-00-00 00:00:00');
INSERT INTO `tbl_product_categories` VALUES ('2', 'Fertilizer', '2022-11-15 09:32:27', '0000-00-00 00:00:00');
INSERT INTO `tbl_product_categories` VALUES ('3', 'Chemicals', '2022-11-15 09:32:37', '0000-00-00 00:00:00');
INSERT INTO `tbl_product_categories` VALUES ('4', 'Sacks & other farm supply', '2022-11-15 11:36:52', '2022-11-16 09:21:08');
INSERT INTO `tbl_product_categories` VALUES ('5', 'Others', '2022-11-16 09:21:39', '0000-00-00 00:00:00');
INSERT INTO `tbl_product_categories` VALUES ('6', 'Cash', '2022-12-18 06:43:09', '0000-00-00 00:00:00');
INSERT INTO `tbl_product_categories` VALUES ('7', 'Rice', '2023-06-20 17:41:08', '0000-00-00 00:00:00');
INSERT INTO `tbl_product_categories` VALUES ('8', 'Feeds', '2023-06-27 17:03:26', '0000-00-00 00:00:00');
INSERT INTO `tbl_product_categories` VALUES ('9', 'Medicine', '2023-07-01 10:39:37', '0000-00-00 00:00:00');

CREATE TABLE `tbl_product_conversion_details` (
  `conversion_detail_id` int(11) NOT NULL AUTO_INCREMENT,
  `conversion_id` int(11) NOT NULL,
  `original_product_id` int(11) NOT NULL,
  `original_qty` decimal(12,2) NOT NULL,
  `original_cost` decimal(12,2) NOT NULL,
  `original_price` decimal(12,2) NOT NULL,
  `converted_product_id` int(11) NOT NULL,
  `converted_qty` decimal(12,2) NOT NULL,
  `converted_cost` decimal(12,2) NOT NULL,
  `converted_price` decimal(12,2) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_last_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`conversion_detail_id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=latin1;
INSERT INTO `tbl_product_conversion_details` VALUES ('1', '1', '402', '1.00', '1906.16', '1990.00', '440', '50.00', '38.12', '42.00', '2024-02-01 13:18:46', '0000-00-00 00:00:00');
INSERT INTO `tbl_product_conversion_details` VALUES ('2', '2', '404', '1.00', '1804.29', '1900.00', '442', '50.00', '36.09', '40.00', '2024-02-01 13:51:09', '0000-00-00 00:00:00');
INSERT INTO `tbl_product_conversion_details` VALUES ('3', '2', '482', '1.00', '1609.43', '1668.00', '484', '25.00', '64.38', '68.00', '2024-02-01 13:55:14', '0000-00-00 00:00:00');
INSERT INTO `tbl_product_conversion_details` VALUES ('4', '2', '485', '1.00', '1855.00', '1915.00', '486', '50.00', '37.10', '40.00', '2024-02-01 13:55:41', '0000-00-00 00:00:00');
INSERT INTO `tbl_product_conversion_details` VALUES ('5', '2', '487', '1.00', '1775.00', '1830.00', '488', '50.00', '35.50', '37.00', '2024-02-01 13:56:02', '0000-00-00 00:00:00');
INSERT INTO `tbl_product_conversion_details` VALUES ('6', '2', '389', '1.00', '2110.00', '2160.00', '431', '50.00', '42.20', '44.00', '2024-02-01 13:56:29', '0000-00-00 00:00:00');
INSERT INTO `tbl_product_conversion_details` VALUES ('7', '2', '390', '1.00', '1920.00', '1970.00', '432', '50.00', '38.40', '40.00', '2024-02-01 13:56:47', '0000-00-00 00:00:00');
INSERT INTO `tbl_product_conversion_details` VALUES ('8', '2', '391', '1.00', '1742.00', '1790.00', '433', '50.00', '34.84', '36.00', '2024-02-01 13:57:22', '0000-00-00 00:00:00');
INSERT INTO `tbl_product_conversion_details` VALUES ('9', '2', '392', '1.00', '1838.00', '1890.00', '434', '50.00', '36.76', '39.00', '2024-02-01 13:57:46', '0000-00-00 00:00:00');
INSERT INTO `tbl_product_conversion_details` VALUES ('10', '2', '405', '1.00', '2055.00', '2055.00', '428', '50.00', '41.10', '42.00', '2024-02-01 13:59:11', '0000-00-00 00:00:00');
INSERT INTO `tbl_product_conversion_details` VALUES ('11', '2', '406', '1.00', '1890.00', '1960.00', '429', '50.00', '37.80', '40.00', '2024-02-01 13:59:38', '0000-00-00 00:00:00');
INSERT INTO `tbl_product_conversion_details` VALUES ('12', '2', '407', '1.00', '1910.00', '1980.00', '430', '50.00', '38.20', '41.00', '2024-02-01 14:00:11', '0000-00-00 00:00:00');
INSERT INTO `tbl_product_conversion_details` VALUES ('13', '2', '464', '1.00', '1870.00', '1920.00', '465', '50.00', '37.40', '40.00', '2024-02-01 14:00:56', '0000-00-00 00:00:00');
INSERT INTO `tbl_product_conversion_details` VALUES ('14', '2', '460', '1.00', '860.00', '865.00', '478', '25.00', '34.40', '37.00', '2024-02-01 14:01:34', '0000-00-00 00:00:00');
INSERT INTO `tbl_product_conversion_details` VALUES ('15', '2', '408', '1.00', '1170.00', '1200.00', '492', '25.00', '46.80', '51.00', '2024-02-01 14:01:59', '0000-00-00 00:00:00');
INSERT INTO `tbl_product_conversion_details` VALUES ('16', '2', '409', '1.00', '1228.13', '1230.00', '451', '25.00', '49.13', '52.00', '2024-02-01 14:02:37', '0000-00-00 00:00:00');
INSERT INTO `tbl_product_conversion_details` VALUES ('17', '3', '117', '12.00', '743.00', '800.00', '621', '12.00', '743.00', '320.00', '2024-02-01 14:57:22', '0000-00-00 00:00:00');
INSERT INTO `tbl_product_conversion_details` VALUES ('18', '4', '7', '1.00', '2300.25', '2350.00', '205', '8.00', '287.53', '300.00', '2024-02-01 15:58:25', '0000-00-00 00:00:00');
INSERT INTO `tbl_product_conversion_details` VALUES ('19', '5', '3', '1.00', '2276.17', '2400.00', '614', '8.00', '284.52', '300.00', '2024-02-01 16:02:09', '0000-00-00 00:00:00');
INSERT INTO `tbl_product_conversion_details` VALUES ('20', '5', '11', '1.00', '4398.80', '4500.00', '270', '8.00', '549.85', '500.00', '2024-02-01 16:03:40', '0000-00-00 00:00:00');
INSERT INTO `tbl_product_conversion_details` VALUES ('21', '5', '10', '1.00', '5373.28', '5400.00', '268', '9.00', '597.03', '700.00', '2024-02-01 16:04:55', '0000-00-00 00:00:00');
INSERT INTO `tbl_product_conversion_details` VALUES ('22', '5', '14', '1.00', '4700.00', '5000.00', '276', '10.00', '470.00', '650.00', '2024-02-01 16:06:01', '0000-00-00 00:00:00');
INSERT INTO `tbl_product_conversion_details` VALUES ('23', '6', '452', '1.00', '1479.25', '1550.00', '453', '50.00', '29.58', '32.00', '2024-02-01 16:37:16', '0000-00-00 00:00:00');
INSERT INTO `tbl_product_conversion_details` VALUES ('24', '6', '459', '1.00', '960.00', '800.00', '476', '25.00', '38.40', '40.00', '2024-02-01 16:37:37', '0000-00-00 00:00:00');
INSERT INTO `tbl_product_conversion_details` VALUES ('25', '6', '393', '1.00', '1693.17', '1761.00', '444', '50.00', '33.86', '36.00', '2024-02-01 16:40:17', '0000-00-00 00:00:00');
INSERT INTO `tbl_product_conversion_details` VALUES ('26', '6', '394', '1.00', '1605.83', '1676.00', '445', '50.00', '32.12', '35.00', '2024-02-01 16:40:45', '0000-00-00 00:00:00');
INSERT INTO `tbl_product_conversion_details` VALUES ('27', '6', '395', '1.00', '1569.79', '1640.00', '446', '50.00', '31.40', '34.00', '2024-02-01 16:41:16', '0000-00-00 00:00:00');
INSERT INTO `tbl_product_conversion_details` VALUES ('28', '6', '397', '1.00', '1678.00', '1720.00', '448', '50.00', '33.56', '36.00', '2024-02-01 16:41:39', '0000-00-00 00:00:00');
INSERT INTO `tbl_product_conversion_details` VALUES ('29', '6', '396', '1.00', '1559.38', '1629.00', '447', '50.00', '31.19', '34.00', '2024-02-01 16:43:25', '0000-00-00 00:00:00');
INSERT INTO `tbl_product_conversion_details` VALUES ('30', '7', '644', '1.00', '1296.43', '1270.00', '554', '25.00', '51.86', '52.00', '2024-02-02 12:06:33', '0000-00-00 00:00:00');
INSERT INTO `tbl_product_conversion_details` VALUES ('31', '7', '382', '1.00', '1380.00', '1420.00', '383', '25.00', '55.20', '58.00', '2024-02-02 12:06:57', '0000-00-00 00:00:00');
INSERT INTO `tbl_product_conversion_details` VALUES ('32', '7', '474', '2.00', '1210.00', '1270.00', '541', '50.00', '48.40', '53.00', '2024-02-02 12:08:50', '0000-00-00 00:00:00');
INSERT INTO `tbl_product_conversion_details` VALUES ('33', '8', '403', '1.00', '1340.00', '1470.00', '441', '25.00', '53.60', '60.00', '2024-02-03 07:32:03', '0000-00-00 00:00:00');
INSERT INTO `tbl_product_conversion_details` VALUES ('34', '8', '401', '1.00', '2045.00', '2100.00', '439', '50.00', '40.90', '44.00', '2024-02-03 07:32:27', '0000-00-00 00:00:00');
INSERT INTO `tbl_product_conversion_details` VALUES ('35', '9', '474', '1.00', '1210.00', '1270.00', '541', '25.00', '48.40', '53.00', '2024-02-03 09:01:27', '0000-00-00 00:00:00');
INSERT INTO `tbl_product_conversion_details` VALUES ('36', '9', '475', '1.00', '871.20', '930.00', '541', '18.00', '48.40', '53.00', '2024-02-03 09:01:45', '0000-00-00 00:00:00');
INSERT INTO `tbl_product_conversion_details` VALUES ('37', '9', '382', '1.00', '1380.00', '1420.00', '383', '25.00', '55.20', '58.00', '2024-02-03 09:02:19', '0000-00-00 00:00:00');
INSERT INTO `tbl_product_conversion_details` VALUES ('38', '10', '223', '1.00', '1584.59', '2200.00', '633', '1.00', '1584.59', '0.00', '2024-02-04 18:09:14', '0000-00-00 00:00:00');
INSERT INTO `tbl_product_conversion_details` VALUES ('39', '11', '401', '1.00', '2045.00', '2100.00', '439', '50.00', '40.90', '44.00', '2024-02-05 09:14:09', '0000-00-00 00:00:00');
INSERT INTO `tbl_product_conversion_details` VALUES ('40', '11', '402', '1.00', '1906.16', '2050.00', '440', '50.00', '38.12', '42.00', '2024-02-05 09:14:31', '0000-00-00 00:00:00');
INSERT INTO `tbl_product_conversion_details` VALUES ('41', '12', '36', '36.00', '89.11', '150.00', '253', '36.00', '89.11', '100.00', '2024-02-06 14:14:46', '0000-00-00 00:00:00');
INSERT INTO `tbl_product_conversion_details` VALUES ('42', '13', '57', '4.00', '360.00', '900.00', '58', '4.00', '360.00', '400.00', '2024-02-06 14:26:41', '0000-00-00 00:00:00');
INSERT INTO `tbl_product_conversion_details` VALUES ('43', '14', '79', '1.00', '250.00', '320.00', '78', '1.00', '250.00', '320.00', '2024-02-06 14:30:10', '0000-00-00 00:00:00');
INSERT INTO `tbl_product_conversion_details` VALUES ('44', '15', '80', '4.00', '370.27', '650.00', '81', '4.00', '370.27', '220.00', '2024-02-06 14:33:57', '0000-00-00 00:00:00');
INSERT INTO `tbl_product_conversion_details` VALUES ('45', '16', '78', '1.00', '250.00', '320.00', '79', '1.00', '250.00', '320.00', '2024-02-06 14:48:59', '0000-00-00 00:00:00');

CREATE TABLE `tbl_product_conversions` (
  `conversion_id` int(11) NOT NULL AUTO_INCREMENT,
  `reference_number` varchar(75) NOT NULL,
  `original_product_id` int(11) NOT NULL,
  `original_qty` decimal(12,2) NOT NULL,
  `converted_product_id` int(11) NOT NULL,
  `converted_qty` decimal(12,2) NOT NULL,
  `remarks` varchar(255) NOT NULL,
  `encoded_by` int(11) NOT NULL,
  `conversion_date` datetime NOT NULL,
  `date_added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` varchar(1) NOT NULL,
  `date_last_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`conversion_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
INSERT INTO `tbl_product_conversions` VALUES ('1', 'PC-20240201131807', '0', '0.00', '0', '0.00', '', '1', '2024-02-01 00:00:00', '2024-02-01 13:18:09', 'F', '2024-02-01 13:18:50');
INSERT INTO `tbl_product_conversions` VALUES ('2', 'PC-20240201134934', '0', '0.00', '0', '0.00', '', '1', '2024-02-01 00:00:00', '2024-02-01 13:49:36', 'F', '2024-02-01 14:03:33');
INSERT INTO `tbl_product_conversions` VALUES ('3', 'PC-20240201145646', '0', '0.00', '0', '0.00', '', '1', '2024-02-01 00:00:00', '2024-02-01 14:56:49', 'F', '2024-02-01 14:57:27');
INSERT INTO `tbl_product_conversions` VALUES ('4', 'PC-20240201155750', '0', '0.00', '0', '0.00', '', '1', '2024-02-01 00:00:00', '2024-02-01 15:57:52', 'F', '2024-02-01 15:58:29');
INSERT INTO `tbl_product_conversions` VALUES ('5', 'PC-20240201160055', '0', '0.00', '0', '0.00', '', '1', '2024-02-01 00:00:00', '2024-02-01 16:00:58', 'F', '2024-02-01 16:06:27');
INSERT INTO `tbl_product_conversions` VALUES ('6', 'PC-20240201163320', '0', '0.00', '0', '0.00', '', '1', '2024-02-01 00:00:00', '2024-02-01 16:33:22', 'F', '2024-02-01 16:44:02');
INSERT INTO `tbl_product_conversions` VALUES ('7', 'PC-20240202120557', '0', '0.00', '0', '0.00', '', '1', '2024-02-02 00:00:00', '2024-02-02 12:05:59', 'F', '2024-02-02 12:09:02');
INSERT INTO `tbl_product_conversions` VALUES ('8', 'PC-20240203073127', '0', '0.00', '0', '0.00', '', '1', '2024-02-03 00:00:00', '2024-02-03 07:31:31', 'F', '2024-02-03 07:33:32');
INSERT INTO `tbl_product_conversions` VALUES ('9', 'PC-20240203090059', '0', '0.00', '0', '0.00', '', '1', '2024-02-03 00:00:00', '2024-02-03 09:01:01', 'F', '2024-02-03 09:02:24');
INSERT INTO `tbl_product_conversions` VALUES ('10', 'PC-20240204180855', '0', '0.00', '0', '0.00', '', '1', '2024-02-04 00:00:00', '2024-02-04 18:08:56', 'F', '2024-02-04 18:09:17');
INSERT INTO `tbl_product_conversions` VALUES ('11', 'PC-20240205091324', '0', '0.00', '0', '0.00', '', '1', '2024-02-05 00:00:00', '2024-02-05 09:13:26', 'F', '2024-02-05 09:14:45');
INSERT INTO `tbl_product_conversions` VALUES ('12', 'PC-20240206141430', '0', '0.00', '0', '0.00', '', '1', '2024-02-06 00:00:00', '2024-02-06 14:14:31', 'F', '2024-02-06 14:15:07');
INSERT INTO `tbl_product_conversions` VALUES ('13', 'PC-20240206142627', '0', '0.00', '0', '0.00', '', '1', '2024-02-06 00:00:00', '2024-02-06 14:26:28', 'F', '2024-02-06 14:26:45');
INSERT INTO `tbl_product_conversions` VALUES ('14', 'PC-20240206142949', '0', '0.00', '0', '0.00', '', '1', '2024-02-06 00:00:00', '2024-02-06 14:29:51', 'F', '2024-02-06 14:30:12');
INSERT INTO `tbl_product_conversions` VALUES ('15', 'PC-20240206143332', '0', '0.00', '0', '0.00', '', '1', '2024-02-06 00:00:00', '2024-02-06 14:33:33', 'F', '2024-02-06 14:34:07');
INSERT INTO `tbl_product_conversions` VALUES ('16', 'PC-20240206144846', '0', '0.00', '0', '0.00', '', '1', '2024-02-06 00:00:00', '2024-02-06 14:48:47', 'F', '2024-02-06 14:49:01');

CREATE TABLE `tbl_product_transactions` (
  `transaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `quantity` decimal(12,2) NOT NULL,
  `cost` decimal(12,5) NOT NULL,
  `price` decimal(12,2) NOT NULL,
  `header_id` int(11) NOT NULL,
  `detail_id` int(11) NOT NULL,
  `module` varchar(3) NOT NULL DEFAULT '' COMMENT 'SLS=Sales',
  `type` varchar(3) NOT NULL DEFAULT '' COMMENT 'IN,OUT',
  `status` int(1) NOT NULL DEFAULT '0' COMMENT '1=Finished;0=Saved',
  `date_added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`transaction_id`)
) ENGINE=InnoDB AUTO_INCREMENT=720 DEFAULT CHARSET=latin1;
INSERT INTO `tbl_product_transactions` VALUES ('9', '71', '6.00', '1124.39000', '1300.00', '2', '9', 'IA', 'IN', '1', '2024-02-01 12:33:56', '2024-02-01 12:34:01');
INSERT INTO `tbl_product_transactions` VALUES ('10', '615', '6.00', '1150.00000', '1280.00', '3', '10', 'IA', 'IN', '1', '2024-02-01 12:34:49', '2024-02-01 12:40:10');
INSERT INTO `tbl_product_transactions` VALUES ('11', '103', '6.00', '953.46000', '1050.00', '3', '11', 'IA', 'IN', '1', '2024-02-01 12:35:33', '2024-02-01 12:40:10');
INSERT INTO `tbl_product_transactions` VALUES ('12', '162', '6.00', '834.41000', '1000.00', '3', '12', 'IA', 'IN', '1', '2024-02-01 12:35:52', '2024-02-01 12:40:10');
INSERT INTO `tbl_product_transactions` VALUES ('13', '207', '8.00', '1150.00000', '1250.00', '3', '13', 'IA', 'IN', '1', '2024-02-01 12:36:36', '2024-02-01 12:40:10');
INSERT INTO `tbl_product_transactions` VALUES ('14', '118', '6.00', '0.04000', '1100.00', '3', '14', 'IA', 'IN', '1', '2024-02-01 12:36:54', '2024-02-01 12:40:10');
INSERT INTO `tbl_product_transactions` VALUES ('15', '83', '6.00', '360.64000', '1300.00', '3', '15', 'IA', 'IN', '1', '2024-02-01 12:37:09', '2024-02-01 12:40:10');
INSERT INTO `tbl_product_transactions` VALUES ('16', '517', '4.00', '909.09000', '1080.00', '3', '16', 'IA', 'IN', '1', '2024-02-01 12:38:00', '2024-02-01 12:40:10');
INSERT INTO `tbl_product_transactions` VALUES ('17', '543', '6.00', '444.30000', '1150.00', '3', '17', 'IA', 'IN', '1', '2024-02-01 12:38:32', '2024-02-01 12:40:10');
INSERT INTO `tbl_product_transactions` VALUES ('18', '154', '4.00', '203.75000', '1250.00', '4', '18', 'IA', 'IN', '1', '2024-02-01 12:41:13', '2024-02-01 12:47:13');
INSERT INTO `tbl_product_transactions` VALUES ('19', '156', '6.00', '1297.77000', '1400.00', '4', '19', 'IA', 'IN', '1', '2024-02-01 12:41:43', '2024-02-01 12:47:13');
INSERT INTO `tbl_product_transactions` VALUES ('20', '95', '6.00', '929.98000', '1050.00', '4', '20', 'IA', 'IN', '1', '2024-02-01 12:42:16', '2024-02-01 12:47:13');
INSERT INTO `tbl_product_transactions` VALUES ('21', '455', '4.00', '188.65000', '1080.00', '4', '21', 'IA', 'IN', '1', '2024-02-01 12:42:44', '2024-02-01 12:47:13');
INSERT INTO `tbl_product_transactions` VALUES ('22', '231', '6.00', '194.61000', '1150.00', '4', '22', 'IA', 'IN', '1', '2024-02-01 12:44:00', '2024-02-01 12:47:13');
INSERT INTO `tbl_product_transactions` VALUES ('23', '102', '6.00', '862.90000', '1200.00', '4', '23', 'IA', 'IN', '1', '2024-02-01 12:44:53', '2024-02-01 12:47:13');
INSERT INTO `tbl_product_transactions` VALUES ('24', '110', '6.00', '0.13000', '1250.00', '4', '24', 'IA', 'IN', '1', '2024-02-01 12:45:18', '2024-02-01 12:47:13');
INSERT INTO `tbl_product_transactions` VALUES ('25', '92', '6.00', '345.64000', '1080.00', '4', '25', 'IA', 'IN', '1', '2024-02-01 12:46:09', '2024-02-01 12:47:13');
INSERT INTO `tbl_product_transactions` VALUES ('26', '513', '6.00', '807.11000', '1050.00', '4', '26', 'IA', 'IN', '1', '2024-02-01 12:46:25', '2024-02-01 12:47:13');
INSERT INTO `tbl_product_transactions` VALUES ('27', '495', '4.00', '1604.17000', '2100.00', '4', '27', 'IA', 'IN', '1', '2024-02-01 12:46:37', '2024-02-01 12:47:13');
INSERT INTO `tbl_product_transactions` VALUES ('28', '271', '6.00', '330.17000', '650.00', '5', '28', 'IA', 'IN', '1', '2024-02-01 12:47:44', '2024-02-01 12:48:53');
INSERT INTO `tbl_product_transactions` VALUES ('29', '56', '4.00', '403.85000', '750.00', '6', '29', 'IA', 'IN', '1', '2024-02-01 12:50:21', '2024-02-01 12:57:31');
INSERT INTO `tbl_product_transactions` VALUES ('31', '348', '6.00', '542.67000', '750.00', '6', '31', 'IA', 'IN', '1', '2024-02-01 12:52:21', '2024-02-01 12:57:31');
INSERT INTO `tbl_product_transactions` VALUES ('33', '30', '12.00', '375.00000', '650.00', '6', '33', 'IA', 'IN', '1', '2024-02-01 12:54:52', '2024-02-01 12:57:31');
INSERT INTO `tbl_product_transactions` VALUES ('34', '547', '4.00', '899.99000', '1050.00', '6', '34', 'IA', 'IN', '1', '2024-02-01 12:55:27', '2024-02-01 12:57:31');
INSERT INTO `tbl_product_transactions` VALUES ('35', '220', '4.00', '1220.00000', '1400.00', '6', '35', 'IA', 'IN', '1', '2024-02-01 12:55:50', '2024-02-01 12:57:31');
INSERT INTO `tbl_product_transactions` VALUES ('36', '296', '4.00', '1430.00000', '1550.00', '6', '36', 'IA', 'IN', '1', '2024-02-01 12:56:11', '2024-02-01 12:57:31');
INSERT INTO `tbl_product_transactions` VALUES ('37', '144', '12.00', '1299.99000', '1450.00', '6', '37', 'IA', 'IN', '1', '2024-02-01 12:57:05', '2024-02-01 12:57:31');
INSERT INTO `tbl_product_transactions` VALUES ('38', '7', '30.00', '2300.25000', '2350.00', '7', '38', 'IA', 'IN', '1', '2024-02-01 12:58:13', '2024-02-01 12:58:18');
INSERT INTO `tbl_product_transactions` VALUES ('39', '364', '2.00', '2800.00000', '2900.00', '8', '39', 'IA', 'IN', '1', '2024-02-01 12:59:01', '2024-02-01 13:03:28');
INSERT INTO `tbl_product_transactions` VALUES ('40', '538', '10.00', '3000.00000', '3300.00', '8', '40', 'IA', 'IN', '1', '2024-02-01 12:59:17', '2024-02-01 13:03:28');
INSERT INTO `tbl_product_transactions` VALUES ('41', '587', '5.00', '3718.18000', '3950.00', '8', '41', 'IA', 'IN', '1', '2024-02-01 12:59:36', '2024-02-01 13:03:28');
INSERT INTO `tbl_product_transactions` VALUES ('42', '10', '20.00', '5373.28000', '5400.00', '8', '42', 'IA', 'IN', '1', '2024-02-01 12:59:51', '2024-02-01 13:03:28');
INSERT INTO `tbl_product_transactions` VALUES ('43', '11', '10.00', '4398.80000', '4500.00', '8', '43', 'IA', 'IN', '1', '2024-02-01 13:00:09', '2024-02-01 13:03:28');
INSERT INTO `tbl_product_transactions` VALUES ('44', '516', '20.00', '5266.83000', '5600.00', '8', '44', 'IA', 'IN', '1', '2024-02-01 13:00:24', '2024-02-01 13:03:28');
INSERT INTO `tbl_product_transactions` VALUES ('45', '13', '10.00', '5425.37000', '5600.00', '8', '45', 'IA', 'IN', '1', '2024-02-01 13:00:39', '2024-02-01 13:03:28');
INSERT INTO `tbl_product_transactions` VALUES ('46', '14', '10.00', '4700.00000', '5000.00', '8', '46', 'IA', 'IN', '1', '2024-02-01 13:01:16', '2024-02-01 13:03:28');
INSERT INTO `tbl_product_transactions` VALUES ('47', '360', '10.00', '5100.16000', '5300.00', '8', '47', 'IA', 'IN', '1', '2024-02-01 13:02:02', '2024-02-01 13:03:28');
INSERT INTO `tbl_product_transactions` VALUES ('48', '2', '5.00', '4245.45000', '4450.00', '8', '48', 'IA', 'IN', '1', '2024-02-01 13:02:13', '2024-02-01 13:03:28');
INSERT INTO `tbl_product_transactions` VALUES ('49', '3', '10.00', '2276.17000', '2400.00', '8', '49', 'IA', 'IN', '1', '2024-02-01 13:02:29', '2024-02-01 13:03:28');
INSERT INTO `tbl_product_transactions` VALUES ('50', '193', '10.00', '3737.38000', '3950.00', '8', '50', 'IA', 'IN', '1', '2024-02-01 13:02:42', '2024-02-01 13:03:28');
INSERT INTO `tbl_product_transactions` VALUES ('51', '474', '20.00', '1210.00000', '1270.00', '9', '51', 'IA', 'IN', '1', '2024-02-01 13:05:16', '2024-02-01 13:06:26');
INSERT INTO `tbl_product_transactions` VALUES ('52', '475', '20.00', '871.20000', '930.00', '9', '52', 'IA', 'IN', '1', '2024-02-01 13:05:33', '2024-02-01 13:06:26');
INSERT INTO `tbl_product_transactions` VALUES ('53', '644', '10.00', '1296.43000', '1270.00', '9', '53', 'IA', 'IN', '1', '2024-02-01 13:05:50', '2024-02-01 13:06:26');
INSERT INTO `tbl_product_transactions` VALUES ('54', '553', '10.00', '871.20000', '930.00', '9', '54', 'IA', 'IN', '1', '2024-02-01 13:06:01', '2024-02-01 13:06:26');
INSERT INTO `tbl_product_transactions` VALUES ('55', '382', '5.00', '1380.00000', '1420.00', '9', '55', 'IA', 'IN', '1', '2024-02-01 13:06:15', '2024-02-01 13:06:26');
INSERT INTO `tbl_product_transactions` VALUES ('56', '35', '48.00', '201.87000', '320.00', '10', '56', 'IA', 'IN', '1', '2024-02-01 13:10:31', '2024-02-01 13:14:42');
INSERT INTO `tbl_product_transactions` VALUES ('57', '31', '24.00', '154.15000', '270.00', '10', '57', 'IA', 'IN', '1', '2024-02-01 13:10:52', '2024-02-01 13:14:42');
INSERT INTO `tbl_product_transactions` VALUES ('58', '97', '12.00', '419.85000', '470.00', '10', '58', 'IA', 'IN', '1', '2024-02-01 13:11:05', '2024-02-01 13:14:42');
INSERT INTO `tbl_product_transactions` VALUES ('59', '494', '12.00', '340.00000', '400.00', '10', '59', 'IA', 'IN', '1', '2024-02-01 13:12:54', '2024-02-01 13:14:42');
INSERT INTO `tbl_product_transactions` VALUES ('60', '44', '24.00', '270.91000', '400.00', '10', '60', 'IA', 'IN', '1', '2024-02-01 13:14:06', '2024-02-01 13:14:42');
INSERT INTO `tbl_product_transactions` VALUES ('61', '402', '1.00', '1906.16000', '1990.00', '1', '1', 'PC', 'OUT', '1', '2024-02-01 13:18:46', '2024-02-01 13:18:50');
INSERT INTO `tbl_product_transactions` VALUES ('62', '440', '50.00', '38.12000', '42.00', '1', '1', 'PC', 'IN', '1', '2024-02-01 13:18:46', '2024-02-01 13:18:50');
INSERT INTO `tbl_product_transactions` VALUES ('63', '402', '4.00', '1906.16000', '1990.00', '12', '61', 'IA', 'IN', '1', '2024-02-01 13:20:47', '2024-02-01 13:20:51');
INSERT INTO `tbl_product_transactions` VALUES ('64', '404', '5.00', '1804.29000', '1900.00', '13', '62', 'IA', 'IN', '1', '2024-02-01 13:22:36', '2024-02-01 13:39:39');
INSERT INTO `tbl_product_transactions` VALUES ('65', '482', '2.00', '1609.43000', '1668.00', '13', '63', 'IA', 'IN', '1', '2024-02-01 13:24:05', '2024-02-01 13:39:39');
INSERT INTO `tbl_product_transactions` VALUES ('66', '485', '2.00', '1855.00000', '1915.00', '13', '64', 'IA', 'IN', '1', '2024-02-01 13:24:37', '2024-02-01 13:39:39');
INSERT INTO `tbl_product_transactions` VALUES ('67', '487', '2.00', '1775.00000', '1830.00', '13', '65', 'IA', 'IN', '1', '2024-02-01 13:24:51', '2024-02-01 13:39:39');
INSERT INTO `tbl_product_transactions` VALUES ('68', '389', '1.00', '2110.00000', '2160.00', '13', '66', 'IA', 'IN', '1', '2024-02-01 13:25:19', '2024-02-01 13:39:39');
INSERT INTO `tbl_product_transactions` VALUES ('69', '390', '1.00', '1920.00000', '1970.00', '13', '67', 'IA', 'IN', '1', '2024-02-01 13:25:31', '2024-02-01 13:39:39');
INSERT INTO `tbl_product_transactions` VALUES ('70', '391', '1.00', '1742.00000', '1790.00', '13', '68', 'IA', 'IN', '1', '2024-02-01 13:36:27', '2024-02-01 13:39:39');
INSERT INTO `tbl_product_transactions` VALUES ('71', '392', '1.00', '1838.00000', '1890.00', '13', '69', 'IA', 'IN', '1', '2024-02-01 13:36:38', '2024-02-01 13:39:39');
INSERT INTO `tbl_product_transactions` VALUES ('72', '405', '1.00', '2055.00000', '2055.00', '13', '70', 'IA', 'IN', '1', '2024-02-01 13:36:52', '2024-02-01 13:39:39');
INSERT INTO `tbl_product_transactions` VALUES ('73', '406', '1.00', '1890.00000', '1960.00', '13', '71', 'IA', 'IN', '1', '2024-02-01 13:37:05', '2024-02-01 13:39:39');
INSERT INTO `tbl_product_transactions` VALUES ('74', '407', '1.00', '1910.00000', '1980.00', '13', '72', 'IA', 'IN', '1', '2024-02-01 13:37:36', '2024-02-01 13:39:39');
INSERT INTO `tbl_product_transactions` VALUES ('75', '464', '1.00', '1870.00000', '1920.00', '13', '73', 'IA', 'IN', '1', '2024-02-01 13:37:49', '2024-02-01 13:39:39');
INSERT INTO `tbl_product_transactions` VALUES ('76', '460', '1.00', '860.00000', '865.00', '13', '74', 'IA', 'IN', '1', '2024-02-01 13:38:05', '2024-02-01 13:39:39');
INSERT INTO `tbl_product_transactions` VALUES ('77', '408', '1.00', '1170.00000', '1200.00', '13', '75', 'IA', 'IN', '1', '2024-02-01 13:38:16', '2024-02-01 13:39:39');
INSERT INTO `tbl_product_transactions` VALUES ('78', '409', '1.00', '1228.13000', '1230.00', '13', '76', 'IA', 'IN', '1', '2024-02-01 13:38:28', '2024-02-01 13:39:39');
INSERT INTO `tbl_product_transactions` VALUES ('79', '227', '100.00', '0.01000', '1.00', '14', '77', 'IA', 'IN', '1', '2024-02-01 13:39:57', '2024-02-01 13:39:59');
INSERT INTO `tbl_product_transactions` VALUES ('80', '227', '1.00', '0.01000', '1.00', '1', '1', 'SLS', 'OUT', '1', '2024-02-01 13:40:14', '2024-02-01 13:40:19');
INSERT INTO `tbl_product_transactions` VALUES ('81', '174', '50.00', '19.00000', '35.00', '15', '78', 'IA', 'IN', '1', '2024-02-01 13:45:42', '2024-02-01 13:46:11');
INSERT INTO `tbl_product_transactions` VALUES ('82', '177', '1000.00', '11.80000', '13.00', '16', '79', 'IA', 'IN', '1', '2024-02-01 13:47:08', '2024-02-01 13:47:53');
INSERT INTO `tbl_product_transactions` VALUES ('83', '178', '500.00', '11.50000', '13.50', '16', '80', 'IA', 'IN', '1', '2024-02-01 13:47:29', '2024-02-01 13:47:53');
INSERT INTO `tbl_product_transactions` VALUES ('84', '117', '12.00', '743.00000', '800.00', '17', '81', 'IA', 'IN', '1', '2024-02-01 13:48:36', '2024-02-01 13:49:23');
INSERT INTO `tbl_product_transactions` VALUES ('85', '388', '13.00', '300.00000', '400.00', '17', '82', 'IA', 'IN', '1', '2024-02-01 13:48:58', '2024-02-01 13:49:23');
INSERT INTO `tbl_product_transactions` VALUES ('86', '404', '1.00', '1804.29000', '1900.00', '2', '2', 'PC', 'OUT', '1', '2024-02-01 13:51:09', '2024-02-01 14:03:33');
INSERT INTO `tbl_product_transactions` VALUES ('87', '442', '50.00', '36.09000', '40.00', '2', '2', 'PC', 'IN', '1', '2024-02-01 13:51:09', '2024-02-01 14:03:33');
INSERT INTO `tbl_product_transactions` VALUES ('88', '482', '1.00', '1609.43000', '1668.00', '2', '3', 'PC', 'OUT', '1', '2024-02-01 13:55:14', '2024-02-01 14:03:33');
INSERT INTO `tbl_product_transactions` VALUES ('89', '484', '25.00', '64.38000', '68.00', '2', '3', 'PC', 'IN', '1', '2024-02-01 13:55:14', '2024-02-01 14:03:33');
INSERT INTO `tbl_product_transactions` VALUES ('90', '485', '1.00', '1855.00000', '1915.00', '2', '4', 'PC', 'OUT', '1', '2024-02-01 13:55:41', '2024-02-01 14:03:33');
INSERT INTO `tbl_product_transactions` VALUES ('91', '486', '50.00', '37.10000', '40.00', '2', '4', 'PC', 'IN', '1', '2024-02-01 13:55:41', '2024-02-01 14:03:33');
INSERT INTO `tbl_product_transactions` VALUES ('92', '487', '1.00', '1775.00000', '1830.00', '2', '5', 'PC', 'OUT', '1', '2024-02-01 13:56:02', '2024-02-01 14:03:33');
INSERT INTO `tbl_product_transactions` VALUES ('93', '488', '50.00', '35.50000', '37.00', '2', '5', 'PC', 'IN', '1', '2024-02-01 13:56:02', '2024-02-01 14:03:33');
INSERT INTO `tbl_product_transactions` VALUES ('94', '389', '1.00', '2110.00000', '2160.00', '2', '6', 'PC', 'OUT', '1', '2024-02-01 13:56:29', '2024-02-01 14:03:33');
INSERT INTO `tbl_product_transactions` VALUES ('95', '431', '50.00', '42.20000', '44.00', '2', '6', 'PC', 'IN', '1', '2024-02-01 13:56:29', '2024-02-01 14:03:33');
INSERT INTO `tbl_product_transactions` VALUES ('96', '390', '1.00', '1920.00000', '1970.00', '2', '7', 'PC', 'OUT', '1', '2024-02-01 13:56:47', '2024-02-01 14:03:33');
INSERT INTO `tbl_product_transactions` VALUES ('97', '432', '50.00', '38.40000', '40.00', '2', '7', 'PC', 'IN', '1', '2024-02-01 13:56:47', '2024-02-01 14:03:33');
INSERT INTO `tbl_product_transactions` VALUES ('98', '391', '1.00', '1742.00000', '1790.00', '2', '8', 'PC', 'OUT', '1', '2024-02-01 13:57:22', '2024-02-01 14:03:33');
INSERT INTO `tbl_product_transactions` VALUES ('99', '433', '50.00', '34.84000', '36.00', '2', '8', 'PC', 'IN', '1', '2024-02-01 13:57:22', '2024-02-01 14:03:33');
INSERT INTO `tbl_product_transactions` VALUES ('100', '392', '1.00', '1838.00000', '1890.00', '2', '9', 'PC', 'OUT', '1', '2024-02-01 13:57:46', '2024-02-01 14:03:33');
INSERT INTO `tbl_product_transactions` VALUES ('101', '434', '50.00', '36.76000', '39.00', '2', '9', 'PC', 'IN', '1', '2024-02-01 13:57:46', '2024-02-01 14:03:33');
INSERT INTO `tbl_product_transactions` VALUES ('102', '405', '1.00', '2055.00000', '2055.00', '2', '10', 'PC', 'OUT', '1', '2024-02-01 13:59:11', '2024-02-01 14:03:33');
INSERT INTO `tbl_product_transactions` VALUES ('103', '428', '50.00', '41.10000', '42.00', '2', '10', 'PC', 'IN', '1', '2024-02-01 13:59:11', '2024-02-01 14:03:33');
INSERT INTO `tbl_product_transactions` VALUES ('104', '406', '1.00', '1890.00000', '1960.00', '2', '11', 'PC', 'OUT', '1', '2024-02-01 13:59:38', '2024-02-01 14:03:33');
INSERT INTO `tbl_product_transactions` VALUES ('105', '429', '50.00', '37.80000', '40.00', '2', '11', 'PC', 'IN', '1', '2024-02-01 13:59:38', '2024-02-01 14:03:33');
INSERT INTO `tbl_product_transactions` VALUES ('106', '407', '1.00', '1910.00000', '1980.00', '2', '12', 'PC', 'OUT', '1', '2024-02-01 14:00:11', '2024-02-01 14:03:33');
INSERT INTO `tbl_product_transactions` VALUES ('107', '430', '50.00', '38.20000', '41.00', '2', '12', 'PC', 'IN', '1', '2024-02-01 14:00:11', '2024-02-01 14:03:33');
INSERT INTO `tbl_product_transactions` VALUES ('108', '464', '1.00', '1870.00000', '1920.00', '2', '13', 'PC', 'OUT', '1', '2024-02-01 14:00:56', '2024-02-01 14:03:33');
INSERT INTO `tbl_product_transactions` VALUES ('109', '465', '50.00', '37.40000', '40.00', '2', '13', 'PC', 'IN', '1', '2024-02-01 14:00:56', '2024-02-01 14:03:33');
INSERT INTO `tbl_product_transactions` VALUES ('110', '460', '1.00', '860.00000', '865.00', '2', '14', 'PC', 'OUT', '1', '2024-02-01 14:01:34', '2024-02-01 14:03:33');
INSERT INTO `tbl_product_transactions` VALUES ('111', '478', '25.00', '34.40000', '37.00', '2', '14', 'PC', 'IN', '1', '2024-02-01 14:01:34', '2024-02-01 14:03:33');
INSERT INTO `tbl_product_transactions` VALUES ('112', '408', '1.00', '1170.00000', '1200.00', '2', '15', 'PC', 'OUT', '1', '2024-02-01 14:01:59', '2024-02-01 14:03:33');
INSERT INTO `tbl_product_transactions` VALUES ('113', '492', '25.00', '46.80000', '51.00', '2', '15', 'PC', 'IN', '1', '2024-02-01 14:01:59', '2024-02-01 14:03:33');
INSERT INTO `tbl_product_transactions` VALUES ('114', '409', '1.00', '1228.13000', '1230.00', '2', '16', 'PC', 'OUT', '1', '2024-02-01 14:02:37', '2024-02-01 14:03:33');
INSERT INTO `tbl_product_transactions` VALUES ('115', '451', '25.00', '49.13000', '52.00', '2', '16', 'PC', 'IN', '1', '2024-02-01 14:02:37', '2024-02-01 14:03:33');
INSERT INTO `tbl_product_transactions` VALUES ('116', '231', '1.00', '194.60975', '1150.00', '2', '2', 'SLS', 'OUT', '0', '2024-02-01 14:33:00', '0000-00-00 00:00:00');
INSERT INTO `tbl_product_transactions` VALUES ('117', '288', '3.00', '332.00000', '400.00', '18', '83', 'IA', 'IN', '0', '2024-02-01 14:38:56', '0000-00-00 00:00:00');
INSERT INTO `tbl_product_transactions` VALUES ('118', '217', '4.00', '195.07000', '250.00', '18', '84', 'IA', 'IN', '0', '2024-02-01 14:39:30', '0000-00-00 00:00:00');
INSERT INTO `tbl_product_transactions` VALUES ('119', '57', '4.00', '360.00000', '900.00', '18', '85', 'IA', 'IN', '0', '2024-02-01 14:39:45', '0000-00-00 00:00:00');
INSERT INTO `tbl_product_transactions` VALUES ('120', '288', '3.00', '332.00000', '400.00', '20', '86', 'IA', 'IN', '1', '2024-02-01 14:42:45', '2024-02-01 14:43:05');
INSERT INTO `tbl_product_transactions` VALUES ('121', '217', '4.00', '195.07000', '250.00', '21', '87', 'IA', 'IN', '1', '2024-02-01 14:44:07', '2024-02-01 14:54:34');
INSERT INTO `tbl_product_transactions` VALUES ('122', '57', '4.00', '360.00000', '900.00', '21', '88', 'IA', 'IN', '1', '2024-02-01 14:44:20', '2024-02-01 14:54:34');
INSERT INTO `tbl_product_transactions` VALUES ('123', '315', '4.00', '464.00000', '600.00', '21', '89', 'IA', 'IN', '1', '2024-02-01 14:44:50', '2024-02-01 14:54:34');
INSERT INTO `tbl_product_transactions` VALUES ('124', '123', '1.00', '375.00000', '400.00', '21', '90', 'IA', 'IN', '1', '2024-02-01 14:45:05', '2024-02-01 14:54:34');
INSERT INTO `tbl_product_transactions` VALUES ('125', '124', '4.00', '205.00000', '230.00', '21', '91', 'IA', 'IN', '1', '2024-02-01 14:45:17', '2024-02-01 14:54:34');
INSERT INTO `tbl_product_transactions` VALUES ('126', '282', '6.00', '110.55000', '150.00', '21', '92', 'IA', 'IN', '1', '2024-02-01 14:45:26', '2024-02-01 14:54:34');
INSERT INTO `tbl_product_transactions` VALUES ('127', '117', '1.00', '743.00000', '800.00', '21', '93', 'IA', 'IN', '1', '2024-02-01 14:45:50', '2024-02-01 14:54:34');
INSERT INTO `tbl_product_transactions` VALUES ('128', '167', '1.00', '800.00000', '850.00', '21', '94', 'IA', 'IN', '1', '2024-02-01 14:46:16', '2024-02-01 14:54:34');
INSERT INTO `tbl_product_transactions` VALUES ('129', '214', '2.00', '300.00000', '370.00', '21', '95', 'IA', 'IN', '1', '2024-02-01 14:46:57', '2024-02-01 14:54:34');
INSERT INTO `tbl_product_transactions` VALUES ('130', '125', '2.00', '366.67000', '450.00', '21', '96', 'IA', 'IN', '1', '2024-02-01 14:47:15', '2024-02-01 14:54:34');
INSERT INTO `tbl_product_transactions` VALUES ('131', '289', '5.00', '540.00000', '650.00', '21', '97', 'IA', 'IN', '1', '2024-02-01 14:47:37', '2024-02-01 14:54:34');
INSERT INTO `tbl_product_transactions` VALUES ('132', '640', '2.00', '240.00000', '300.00', '21', '98', 'IA', 'IN', '1', '2024-02-01 14:48:12', '2024-02-01 14:54:34');
INSERT INTO `tbl_product_transactions` VALUES ('133', '251', '1.00', '235.00000', '300.00', '21', '99', 'IA', 'IN', '1', '2024-02-01 14:48:47', '2024-02-01 14:54:34');
INSERT INTO `tbl_product_transactions` VALUES ('134', '90', '4.00', '1516.15000', '1680.00', '21', '100', 'IA', 'IN', '1', '2024-02-01 14:49:04', '2024-02-01 14:54:34');
INSERT INTO `tbl_product_transactions` VALUES ('135', '49', '1.00', '1030.00000', '1100.00', '21', '101', 'IA', 'IN', '1', '2024-02-01 14:49:17', '2024-02-01 14:54:34');
INSERT INTO `tbl_product_transactions` VALUES ('136', '212', '2.00', '880.00000', '950.00', '21', '102', 'IA', 'IN', '1', '2024-02-01 14:49:33', '2024-02-01 14:54:34');
INSERT INTO `tbl_product_transactions` VALUES ('137', '450', '4.00', '1589.29000', '1700.00', '21', '103', 'IA', 'IN', '1', '2024-02-01 14:49:48', '2024-02-01 14:54:34');
INSERT INTO `tbl_product_transactions` VALUES ('138', '230', '3.00', '195.00000', '250.00', '21', '104', 'IA', 'IN', '1', '2024-02-01 14:49:58', '2024-02-01 14:54:34');
INSERT INTO `tbl_product_transactions` VALUES ('139', '62', '2.00', '101.12000', '150.00', '21', '105', 'IA', 'IN', '1', '2024-02-01 14:50:28', '2024-02-01 14:54:34');
INSERT INTO `tbl_product_transactions` VALUES ('140', '80', '4.00', '370.28000', '650.00', '21', '106', 'IA', 'IN', '1', '2024-02-01 14:50:53', '2024-02-01 14:54:34');
INSERT INTO `tbl_product_transactions` VALUES ('141', '274', '2.00', '3.64000', '470.00', '21', '107', 'IA', 'IN', '1', '2024-02-01 14:51:26', '2024-02-01 14:54:34');
INSERT INTO `tbl_product_transactions` VALUES ('142', '112', '2.00', '315.22000', '390.00', '21', '108', 'IA', 'IN', '1', '2024-02-01 14:51:37', '2024-02-01 14:54:34');
INSERT INTO `tbl_product_transactions` VALUES ('143', '113', '2.00', '315.00000', '400.00', '21', '109', 'IA', 'IN', '1', '2024-02-01 14:51:48', '2024-02-01 14:54:34');
INSERT INTO `tbl_product_transactions` VALUES ('144', '117', '12.00', '743.00000', '800.00', '3', '17', 'PC', 'OUT', '1', '2024-02-01 14:57:22', '2024-02-01 14:57:27');
INSERT INTO `tbl_product_transactions` VALUES ('145', '621', '12.00', '743.00000', '320.00', '3', '17', 'PC', 'IN', '1', '2024-02-01 14:57:22', '2024-02-01 14:57:27');
INSERT INTO `tbl_product_transactions` VALUES ('146', '41', '2.00', '250.00000', '320.00', '23', '110', 'IA', 'IN', '1', '2024-02-01 15:04:02', '2024-02-01 15:08:41');
INSERT INTO `tbl_product_transactions` VALUES ('147', '211', '6.00', '354.83000', '400.00', '23', '111', 'IA', 'IN', '1', '2024-02-01 15:04:18', '2024-02-01 15:08:41');
INSERT INTO `tbl_product_transactions` VALUES ('148', '645', '2.00', '0.00000', '700.00', '23', '112', 'IA', 'IN', '1', '2024-02-01 15:04:34', '2024-02-01 15:08:41');
INSERT INTO `tbl_product_transactions` VALUES ('149', '548', '3.00', '940.00000', '1020.00', '23', '113', 'IA', 'IN', '1', '2024-02-01 15:04:49', '2024-02-01 15:08:41');
INSERT INTO `tbl_product_transactions` VALUES ('150', '549', '2.00', '650.00000', '720.00', '23', '114', 'IA', 'IN', '1', '2024-02-01 15:05:05', '2024-02-01 15:08:41');
INSERT INTO `tbl_product_transactions` VALUES ('151', '357', '3.00', '1050.00000', '1120.00', '23', '115', 'IA', 'IN', '1', '2024-02-01 15:05:23', '2024-02-01 15:08:41');
INSERT INTO `tbl_product_transactions` VALUES ('152', '75', '4.00', '854.94000', '920.00', '23', '116', 'IA', 'IN', '1', '2024-02-01 15:05:41', '2024-02-01 15:08:41');
INSERT INTO `tbl_product_transactions` VALUES ('153', '74', '1.00', '1554.58000', '1700.00', '23', '117', 'IA', 'IN', '1', '2024-02-01 15:06:01', '2024-02-01 15:08:41');
INSERT INTO `tbl_product_transactions` VALUES ('154', '248', '2.00', '2190.00000', '2280.00', '23', '118', 'IA', 'IN', '1', '2024-02-01 15:06:17', '2024-02-01 15:08:41');
INSERT INTO `tbl_product_transactions` VALUES ('155', '537', '3.00', '785.00000', '850.00', '23', '119', 'IA', 'IN', '1', '2024-02-01 15:06:28', '2024-02-01 15:08:41');
INSERT INTO `tbl_product_transactions` VALUES ('156', '39', '3.00', '384.91000', '580.00', '23', '120', 'IA', 'IN', '1', '2024-02-01 15:06:43', '2024-02-01 15:08:41');
INSERT INTO `tbl_product_transactions` VALUES ('157', '320', '4.00', '300.00000', '370.00', '23', '121', 'IA', 'IN', '1', '2024-02-01 15:06:59', '2024-02-01 15:08:41');
INSERT INTO `tbl_product_transactions` VALUES ('158', '304', '4.00', '550.00000', '620.00', '23', '122', 'IA', 'IN', '1', '2024-02-01 15:07:12', '2024-02-01 15:08:41');
INSERT INTO `tbl_product_transactions` VALUES ('159', '237', '2.00', '760.00000', '870.00', '23', '123', 'IA', 'IN', '1', '2024-02-01 15:07:44', '2024-02-01 15:08:41');
INSERT INTO `tbl_product_transactions` VALUES ('160', '61', '3.00', '1032.86000', '1150.00', '25', '124', 'IA', 'IN', '1', '2024-02-01 15:12:44', '2024-02-01 15:24:00');
INSERT INTO `tbl_product_transactions` VALUES ('161', '511', '6.00', '770.00000', '850.00', '25', '125', 'IA', 'IN', '1', '2024-02-01 15:12:54', '2024-02-01 15:24:00');
INSERT INTO `tbl_product_transactions` VALUES ('162', '261', '2.00', '380.00000', '450.00', '25', '126', 'IA', 'IN', '1', '2024-02-01 15:13:06', '2024-02-01 15:24:00');
INSERT INTO `tbl_product_transactions` VALUES ('163', '91', '4.00', '456.50000', '490.00', '25', '127', 'IA', 'IN', '1', '2024-02-01 15:14:25', '2024-02-01 15:24:00');
INSERT INTO `tbl_product_transactions` VALUES ('164', '153', '6.00', '345.05000', '430.00', '25', '128', 'IA', 'IN', '1', '2024-02-01 15:14:35', '2024-02-01 15:24:00');
INSERT INTO `tbl_product_transactions` VALUES ('165', '469', '3.00', '825.00000', '900.00', '25', '129', 'IA', 'IN', '1', '2024-02-01 15:14:55', '2024-02-01 15:24:00');
INSERT INTO `tbl_product_transactions` VALUES ('166', '283', '4.00', '215.00000', '300.00', '25', '130', 'IA', 'IN', '1', '2024-02-01 15:15:28', '2024-02-01 15:24:00');
INSERT INTO `tbl_product_transactions` VALUES ('167', '466', '2.00', '1250.00000', '1300.00', '25', '131', 'IA', 'IN', '1', '2024-02-01 15:15:43', '2024-02-01 15:24:00');
INSERT INTO `tbl_product_transactions` VALUES ('168', '468', '2.00', '430.00000', '470.00', '25', '132', 'IA', 'IN', '1', '2024-02-01 15:15:53', '2024-02-01 15:24:00');
INSERT INTO `tbl_product_transactions` VALUES ('169', '467', '2.00', '820.00000', '870.00', '25', '133', 'IA', 'IN', '1', '2024-02-01 15:16:03', '2024-02-01 15:24:00');
INSERT INTO `tbl_product_transactions` VALUES ('170', '147', '24.00', '2700.00000', '2800.00', '25', '134', 'IA', 'IN', '1', '2024-02-01 15:16:21', '2024-02-01 15:24:00');
INSERT INTO `tbl_product_transactions` VALUES ('171', '121', '3.00', '253.00000', '300.00', '25', '135', 'IA', 'IN', '1', '2024-02-01 15:16:33', '2024-02-01 15:24:00');
INSERT INTO `tbl_product_transactions` VALUES ('172', '122', '10.00', '70.00000', '100.00', '25', '136', 'IA', 'IN', '1', '2024-02-01 15:16:42', '2024-02-01 15:24:00');
INSERT INTO `tbl_product_transactions` VALUES ('173', '65', '6.00', '360.00000', '400.00', '25', '137', 'IA', 'IN', '1', '2024-02-01 15:16:52', '2024-02-01 15:24:00');
INSERT INTO `tbl_product_transactions` VALUES ('174', '46', '600.00', '69.13000', '45.00', '25', '138', 'IA', 'IN', '1', '2024-02-01 15:17:02', '2024-02-01 15:24:00');
INSERT INTO `tbl_product_transactions` VALUES ('175', '141', '20.00', '18.00000', '30.00', '25', '139', 'IA', 'IN', '1', '2024-02-01 15:17:16', '2024-02-01 15:24:00');
INSERT INTO `tbl_product_transactions` VALUES ('176', '168', '20.00', '129.99000', '150.00', '25', '140', 'IA', 'IN', '1', '2024-02-01 15:17:29', '2024-02-01 15:24:00');
INSERT INTO `tbl_product_transactions` VALUES ('177', '86', '2.00', '240.00000', '300.00', '25', '141', 'IA', 'IN', '1', '2024-02-01 15:17:44', '2024-02-01 15:24:00');
INSERT INTO `tbl_product_transactions` VALUES ('178', '135', '1.00', '125.00000', '300.00', '25', '142', 'IA', 'IN', '1', '2024-02-01 15:18:00', '2024-02-01 15:24:00');
INSERT INTO `tbl_product_transactions` VALUES ('179', '246', '1.00', '98.85000', '150.00', '25', '143', 'IA', 'IN', '1', '2024-02-01 15:18:13', '2024-02-01 15:24:00');
INSERT INTO `tbl_product_transactions` VALUES ('180', '143', '10.00', '186.67000', '250.00', '25', '144', 'IA', 'IN', '1', '2024-02-01 15:18:28', '2024-02-01 15:24:00');
INSERT INTO `tbl_product_transactions` VALUES ('181', '613', '3.00', '0.00000', '700.00', '25', '145', 'IA', 'IN', '1', '2024-02-01 15:19:13', '2024-02-01 15:24:00');
INSERT INTO `tbl_product_transactions` VALUES ('182', '171', '5.00', '100.00000', '140.00', '25', '146', 'IA', 'IN', '1', '2024-02-01 15:19:29', '2024-02-01 15:24:00');
INSERT INTO `tbl_product_transactions` VALUES ('183', '183', '30.00', '100.87000', '170.00', '25', '147', 'IA', 'IN', '1', '2024-02-01 15:19:43', '2024-02-01 15:24:00');
INSERT INTO `tbl_product_transactions` VALUES ('184', '79', '3.00', '250.00000', '320.00', '25', '148', 'IA', 'IN', '1', '2024-02-01 15:20:06', '2024-02-01 15:24:00');
INSERT INTO `tbl_product_transactions` VALUES ('185', '106', '1.00', '335.00000', '420.00', '25', '149', 'IA', 'IN', '1', '2024-02-01 15:20:36', '2024-02-01 15:24:00');
INSERT INTO `tbl_product_transactions` VALUES ('186', '107', '1.00', '345.00000', '460.00', '25', '150', 'IA', 'IN', '1', '2024-02-01 15:20:58', '2024-02-01 15:24:00');
INSERT INTO `tbl_product_transactions` VALUES ('187', '173', '1.00', '270.00000', '350.00', '25', '151', 'IA', 'IN', '1', '2024-02-01 15:21:26', '2024-02-01 15:24:00');
INSERT INTO `tbl_product_transactions` VALUES ('188', '622', '2.00', '620.00000', '670.00', '25', '152', 'IA', 'IN', '1', '2024-02-01 15:21:42', '2024-02-01 15:24:00');
INSERT INTO `tbl_product_transactions` VALUES ('189', '658', '6.00', '520.00000', '580.00', '25', '153', 'IA', 'IN', '1', '2024-02-01 15:22:18', '2024-02-01 15:24:00');
INSERT INTO `tbl_product_transactions` VALUES ('190', '176', '50.00', '6.27000', '10.00', '25', '154', 'IA', 'IN', '1', '2024-02-01 15:22:39', '2024-02-01 15:24:00');
INSERT INTO `tbl_product_transactions` VALUES ('191', '205', '8.00', '212.20000', '300.00', '26', '155', 'IA', 'IN', '1', '2024-02-01 15:56:30', '2024-02-01 15:56:52');
INSERT INTO `tbl_product_transactions` VALUES ('192', '7', '1.00', '2300.25000', '2350.00', '4', '18', 'PC', 'OUT', '1', '2024-02-01 15:58:25', '2024-02-01 15:58:29');
INSERT INTO `tbl_product_transactions` VALUES ('193', '205', '8.00', '287.53000', '300.00', '4', '18', 'PC', 'IN', '1', '2024-02-01 15:58:25', '2024-02-01 15:58:29');
INSERT INTO `tbl_product_transactions` VALUES ('194', '3', '1.00', '2276.17000', '2400.00', '5', '19', 'PC', 'OUT', '1', '2024-02-01 16:02:09', '2024-02-01 16:06:27');
INSERT INTO `tbl_product_transactions` VALUES ('195', '614', '8.00', '284.52000', '300.00', '5', '19', 'PC', 'IN', '1', '2024-02-01 16:02:09', '2024-02-01 16:06:27');
INSERT INTO `tbl_product_transactions` VALUES ('196', '11', '1.00', '4398.80000', '4500.00', '5', '20', 'PC', 'OUT', '1', '2024-02-01 16:03:40', '2024-02-01 16:06:27');
INSERT INTO `tbl_product_transactions` VALUES ('197', '270', '8.00', '549.85000', '500.00', '5', '20', 'PC', 'IN', '1', '2024-02-01 16:03:40', '2024-02-01 16:06:27');
INSERT INTO `tbl_product_transactions` VALUES ('198', '10', '1.00', '5373.28000', '5400.00', '5', '21', 'PC', 'OUT', '1', '2024-02-01 16:04:55', '2024-02-01 16:06:27');
INSERT INTO `tbl_product_transactions` VALUES ('199', '268', '9.00', '597.03000', '700.00', '5', '21', 'PC', 'IN', '1', '2024-02-01 16:04:55', '2024-02-01 16:06:27');
INSERT INTO `tbl_product_transactions` VALUES ('200', '14', '1.00', '4700.00000', '5000.00', '5', '22', 'PC', 'OUT', '1', '2024-02-01 16:06:01', '2024-02-01 16:06:27');
INSERT INTO `tbl_product_transactions` VALUES ('201', '276', '10.00', '470.00000', '650.00', '5', '22', 'PC', 'IN', '1', '2024-02-01 16:06:01', '2024-02-01 16:06:27');
INSERT INTO `tbl_product_transactions` VALUES ('202', '474', '50.00', '1210.00000', '1270.00', '27', '156', 'IA', 'IN', '1', '2024-02-01 16:17:28', '2024-02-01 16:17:33');
INSERT INTO `tbl_product_transactions` VALUES ('203', '475', '30.00', '871.20000', '930.00', '28', '157', 'IA', 'IN', '1', '2024-02-01 16:18:39', '2024-02-01 16:19:05');
INSERT INTO `tbl_product_transactions` VALUES ('204', '553', '20.00', '871.20000', '930.00', '28', '158', 'IA', 'IN', '1', '2024-02-01 16:18:53', '2024-02-01 16:19:05');
INSERT INTO `tbl_product_transactions` VALUES ('205', '402', '10.00', '1906.16000', '1990.00', '29', '159', 'IA', 'IN', '1', '2024-02-01 16:27:07', '2024-02-01 16:32:25');
INSERT INTO `tbl_product_transactions` VALUES ('206', '452', '1.00', '1479.25000', '1550.00', '29', '160', 'IA', 'IN', '1', '2024-02-01 16:27:14', '2024-02-01 16:32:25');
INSERT INTO `tbl_product_transactions` VALUES ('207', '459', '1.00', '960.00000', '800.00', '29', '161', 'IA', 'IN', '1', '2024-02-01 16:27:25', '2024-02-01 16:32:25');
INSERT INTO `tbl_product_transactions` VALUES ('208', '393', '2.00', '1693.17000', '1761.00', '29', '162', 'IA', 'IN', '1', '2024-02-01 16:27:41', '2024-02-01 16:32:25');
INSERT INTO `tbl_product_transactions` VALUES ('209', '394', '3.00', '1605.83000', '1676.00', '29', '163', 'IA', 'IN', '1', '2024-02-01 16:28:10', '2024-02-01 16:32:25');
INSERT INTO `tbl_product_transactions` VALUES ('210', '395', '2.00', '1569.79000', '1640.00', '29', '164', 'IA', 'IN', '1', '2024-02-01 16:28:25', '2024-02-01 16:32:25');
INSERT INTO `tbl_product_transactions` VALUES ('211', '397', '1.00', '1678.00000', '1720.00', '29', '165', 'IA', 'IN', '1', '2024-02-01 16:28:42', '2024-02-01 16:32:25');
INSERT INTO `tbl_product_transactions` VALUES ('212', '396', '1.00', '1559.38000', '1629.00', '29', '166', 'IA', 'IN', '1', '2024-02-01 16:28:53', '2024-02-01 16:32:25');
INSERT INTO `tbl_product_transactions` VALUES ('213', '145', '12.00', '0.00000', '450.00', '29', '167', 'IA', 'IN', '1', '2024-02-01 16:29:22', '2024-02-01 16:32:25');
INSERT INTO `tbl_product_transactions` VALUES ('214', '452', '1.00', '1479.25000', '1550.00', '6', '23', 'PC', 'OUT', '1', '2024-02-01 16:37:16', '2024-02-01 16:44:02');
INSERT INTO `tbl_product_transactions` VALUES ('215', '453', '50.00', '29.58000', '32.00', '6', '23', 'PC', 'IN', '1', '2024-02-01 16:37:16', '2024-02-01 16:44:02');
INSERT INTO `tbl_product_transactions` VALUES ('216', '459', '1.00', '960.00000', '800.00', '6', '24', 'PC', 'OUT', '1', '2024-02-01 16:37:37', '2024-02-01 16:44:02');
INSERT INTO `tbl_product_transactions` VALUES ('217', '476', '25.00', '38.40000', '40.00', '6', '24', 'PC', 'IN', '1', '2024-02-01 16:37:37', '2024-02-01 16:44:02');
INSERT INTO `tbl_product_transactions` VALUES ('218', '393', '1.00', '1693.17000', '1761.00', '6', '25', 'PC', 'OUT', '1', '2024-02-01 16:40:17', '2024-02-01 16:44:02');
INSERT INTO `tbl_product_transactions` VALUES ('219', '444', '50.00', '33.86000', '36.00', '6', '25', 'PC', 'IN', '1', '2024-02-01 16:40:17', '2024-02-01 16:44:02');
INSERT INTO `tbl_product_transactions` VALUES ('220', '394', '1.00', '1605.83000', '1676.00', '6', '26', 'PC', 'OUT', '1', '2024-02-01 16:40:45', '2024-02-01 16:44:02');
INSERT INTO `tbl_product_transactions` VALUES ('221', '445', '50.00', '32.12000', '35.00', '6', '26', 'PC', 'IN', '1', '2024-02-01 16:40:45', '2024-02-01 16:44:02');
INSERT INTO `tbl_product_transactions` VALUES ('222', '395', '1.00', '1569.79000', '1640.00', '6', '27', 'PC', 'OUT', '1', '2024-02-01 16:41:16', '2024-02-01 16:44:02');
INSERT INTO `tbl_product_transactions` VALUES ('223', '446', '50.00', '31.40000', '34.00', '6', '27', 'PC', 'IN', '1', '2024-02-01 16:41:16', '2024-02-01 16:44:02');
INSERT INTO `tbl_product_transactions` VALUES ('224', '397', '1.00', '1678.00000', '1720.00', '6', '28', 'PC', 'OUT', '1', '2024-02-01 16:41:39', '2024-02-01 16:44:02');
INSERT INTO `tbl_product_transactions` VALUES ('225', '448', '50.00', '33.56000', '36.00', '6', '28', 'PC', 'IN', '1', '2024-02-01 16:41:39', '2024-02-01 16:44:02');
INSERT INTO `tbl_product_transactions` VALUES ('226', '396', '1.00', '1559.38000', '1629.00', '6', '29', 'PC', 'OUT', '1', '2024-02-01 16:43:25', '2024-02-01 16:44:02');
INSERT INTO `tbl_product_transactions` VALUES ('227', '447', '50.00', '31.19000', '34.00', '6', '29', 'PC', 'IN', '1', '2024-02-01 16:43:25', '2024-02-01 16:44:02');
INSERT INTO `tbl_product_transactions` VALUES ('228', '481', '24.00', '50.00000', '53.00', '30', '168', 'IA', 'IN', '1', '2024-02-01 16:56:12', '2024-02-01 16:56:34');
INSERT INTO `tbl_product_transactions` VALUES ('229', '426', '12.00', '49.03000', '55.00', '30', '169', 'IA', 'IN', '1', '2024-02-01 16:56:29', '2024-02-01 16:56:34');
INSERT INTO `tbl_product_transactions` VALUES ('230', '462', '1.00', '520.00000', '570.00', '31', '170', 'IA', 'IN', '1', '2024-02-02 11:05:08', '2024-02-02 11:05:31');
INSERT INTO `tbl_product_transactions` VALUES ('231', '184', '1.00', '430.00000', '500.00', '31', '171', 'IA', 'IN', '1', '2024-02-02 11:05:25', '2024-02-02 11:05:31');
INSERT INTO `tbl_product_transactions` VALUES ('232', '282', '4.00', '110.55000', '150.00', '32', '172', 'IA', 'IN', '1', '2024-02-02 11:06:11', '2024-02-02 11:10:28');
INSERT INTO `tbl_product_transactions` VALUES ('233', '640', '4.00', '240.00000', '300.00', '32', '173', 'IA', 'IN', '1', '2024-02-02 11:06:23', '2024-02-02 11:10:28');
INSERT INTO `tbl_product_transactions` VALUES ('234', '82', '1.00', '440.00000', '550.00', '32', '174', 'IA', 'IN', '1', '2024-02-02 11:06:33', '2024-02-02 11:10:28');
INSERT INTO `tbl_product_transactions` VALUES ('235', '249', '1.00', '266.88000', '350.00', '32', '175', 'IA', 'IN', '1', '2024-02-02 11:07:52', '2024-02-02 11:10:28');
INSERT INTO `tbl_product_transactions` VALUES ('236', '157', '6.00', '330.00000', '420.00', '32', '176', 'IA', 'IN', '1', '2024-02-02 11:08:48', '2024-02-02 11:10:28');
INSERT INTO `tbl_product_transactions` VALUES ('237', '662', '4.00', '350.00000', '550.00', '32', '177', 'IA', 'IN', '1', '2024-02-02 11:09:13', '2024-02-02 11:10:28');
INSERT INTO `tbl_product_transactions` VALUES ('238', '205', '8.00', '249.86000', '300.00', '33', '178', 'IA', 'OUT', '1', '2024-02-02 11:10:40', '2024-02-02 11:10:42');
INSERT INTO `tbl_product_transactions` VALUES ('239', '132', '2.00', '700.00000', '370.00', '34', '179', 'IA', 'IN', '1', '2024-02-02 11:13:52', '2024-02-02 11:15:46');
INSERT INTO `tbl_product_transactions` VALUES ('240', '313', '2.00', '280.00000', '350.00', '34', '180', 'IA', 'IN', '1', '2024-02-02 11:14:39', '2024-02-02 11:15:46');
INSERT INTO `tbl_product_transactions` VALUES ('241', '634', '2.00', '300.00000', '320.00', '34', '181', 'IA', 'IN', '1', '2024-02-02 11:14:59', '2024-02-02 11:15:46');
INSERT INTO `tbl_product_transactions` VALUES ('242', '119', '2.00', '500.00000', '550.00', '34', '182', 'IA', 'IN', '1', '2024-02-02 11:15:10', '2024-02-02 11:15:46');
INSERT INTO `tbl_product_transactions` VALUES ('243', '87', '40.00', '121.59000', '180.00', '34', '183', 'IA', 'IN', '1', '2024-02-02 11:15:20', '2024-02-02 11:15:46');
INSERT INTO `tbl_product_transactions` VALUES ('244', '344', '2.00', '560.00000', '650.00', '34', '184', 'IA', 'IN', '1', '2024-02-02 11:15:37', '2024-02-02 11:15:46');
INSERT INTO `tbl_product_transactions` VALUES ('245', '508', '6.00', '38.87000', '80.00', '35', '185', 'IA', 'IN', '1', '2024-02-02 11:19:13', '2024-02-02 11:31:23');
INSERT INTO `tbl_product_transactions` VALUES ('246', '236', '4.00', '60.00000', '100.00', '35', '186', 'IA', 'IN', '1', '2024-02-02 11:19:32', '2024-02-02 11:31:23');
INSERT INTO `tbl_product_transactions` VALUES ('247', '363', '21.00', '25.00000', '40.00', '35', '187', 'IA', 'IN', '1', '2024-02-02 11:20:27', '2024-02-02 11:31:23');
INSERT INTO `tbl_product_transactions` VALUES ('248', '104', '12.00', '128.78000', '380.00', '35', '188', 'IA', 'IN', '1', '2024-02-02 11:20:49', '2024-02-02 11:31:23');
INSERT INTO `tbl_product_transactions` VALUES ('249', '641', '10.00', '73.00000', '85.00', '35', '189', 'IA', 'IN', '1', '2024-02-02 11:20:58', '2024-02-02 11:31:23');
INSERT INTO `tbl_product_transactions` VALUES ('250', '654', '2.00', '60.00000', '85.00', '35', '190', 'IA', 'IN', '1', '2024-02-02 11:21:43', '2024-02-02 11:31:23');
INSERT INTO `tbl_product_transactions` VALUES ('251', '483', '6.00', '73.00000', '85.00', '35', '191', 'IA', 'IN', '1', '2024-02-02 11:22:09', '2024-02-02 11:31:23');
INSERT INTO `tbl_product_transactions` VALUES ('252', '650', '10.00', '38.00000', '43.00', '35', '192', 'IA', 'IN', '1', '2024-02-02 11:22:31', '2024-02-02 11:31:23');
INSERT INTO `tbl_product_transactions` VALUES ('253', '530', '10.00', '22.67000', '27.00', '35', '193', 'IA', 'IN', '1', '2024-02-02 11:22:57', '2024-02-02 11:31:23');
INSERT INTO `tbl_product_transactions` VALUES ('254', '413', '5.00', '13.40000', '22.00', '35', '194', 'IA', 'IN', '1', '2024-02-02 11:23:10', '2024-02-02 11:31:23');
INSERT INTO `tbl_product_transactions` VALUES ('255', '526', '5.00', '8.73000', '10.00', '35', '195', 'IA', 'IN', '1', '2024-02-02 11:23:20', '2024-02-02 11:31:23');
INSERT INTO `tbl_product_transactions` VALUES ('256', '500', '5.00', '28.88000', '30.00', '35', '196', 'IA', 'IN', '1', '2024-02-02 11:23:31', '2024-02-02 11:31:23');
INSERT INTO `tbl_product_transactions` VALUES ('257', '616', '10.00', '15.04000', '23.00', '35', '197', 'IA', 'IN', '1', '2024-02-02 11:23:58', '2024-02-02 11:31:23');
INSERT INTO `tbl_product_transactions` VALUES ('258', '504', '3.00', '17.14000', '25.00', '35', '198', 'IA', 'IN', '1', '2024-02-02 11:24:10', '2024-02-02 11:31:23');
INSERT INTO `tbl_product_transactions` VALUES ('259', '414', '6.00', '20.00000', '16.00', '35', '199', 'IA', 'IN', '1', '2024-02-02 11:24:29', '2024-02-02 11:31:23');
INSERT INTO `tbl_product_transactions` VALUES ('260', '415', '5.00', '14.50000', '16.00', '35', '200', 'IA', 'IN', '1', '2024-02-02 11:24:38', '2024-02-02 11:31:23');
INSERT INTO `tbl_product_transactions` VALUES ('261', '528', '10.00', '23.98000', '28.00', '35', '201', 'IA', 'IN', '1', '2024-02-02 11:24:49', '2024-02-02 11:31:23');
INSERT INTO `tbl_product_transactions` VALUES ('262', '410', '6.00', '22.94000', '24.00', '35', '202', 'IA', 'IN', '1', '2024-02-02 11:25:45', '2024-02-02 11:31:23');
INSERT INTO `tbl_product_transactions` VALUES ('263', '412', '6.00', '11.60000', '13.00', '35', '203', 'IA', 'IN', '1', '2024-02-02 11:25:57', '2024-02-02 11:31:23');
INSERT INTO `tbl_product_transactions` VALUES ('264', '411', '6.00', '16.40000', '20.00', '35', '204', 'IA', 'IN', '1', '2024-02-02 11:26:07', '2024-02-02 11:31:23');
INSERT INTO `tbl_product_transactions` VALUES ('265', '666', '10.00', '26.00000', '28.00', '35', '205', 'IA', 'IN', '1', '2024-02-02 11:27:16', '2024-02-02 11:31:23');
INSERT INTO `tbl_product_transactions` VALUES ('266', '665', '10.00', '15.20000', '18.00', '35', '206', 'IA', 'IN', '1', '2024-02-02 11:27:30', '2024-02-02 11:31:23');
INSERT INTO `tbl_product_transactions` VALUES ('267', '503', '10.00', '12.53000', '15.00', '35', '207', 'IA', 'IN', '1', '2024-02-02 11:27:50', '2024-02-02 11:31:23');
INSERT INTO `tbl_product_transactions` VALUES ('268', '502', '10.00', '11.77000', '15.00', '35', '208', 'IA', 'IN', '1', '2024-02-02 11:28:03', '2024-02-02 11:31:23');
INSERT INTO `tbl_product_transactions` VALUES ('269', '419', '10.00', '5.99000', '8.00', '35', '209', 'IA', 'IN', '1', '2024-02-02 11:28:25', '2024-02-02 11:31:23');
INSERT INTO `tbl_product_transactions` VALUES ('270', '651', '20.00', '13.00000', '15.00', '35', '210', 'IA', 'IN', '1', '2024-02-02 11:28:39', '2024-02-02 11:31:23');
INSERT INTO `tbl_product_transactions` VALUES ('271', '663', '10.00', '4.90000', '6.00', '35', '211', 'IA', 'IN', '1', '2024-02-02 11:29:07', '2024-02-02 11:31:23');
INSERT INTO `tbl_product_transactions` VALUES ('272', '653', '10.00', '5.00000', '8.00', '35', '212', 'IA', 'IN', '1', '2024-02-02 11:29:23', '2024-02-02 11:31:23');
INSERT INTO `tbl_product_transactions` VALUES ('273', '423', '10.00', '7.00000', '9.00', '35', '213', 'IA', 'IN', '1', '2024-02-02 11:29:41', '2024-02-02 11:31:23');
INSERT INTO `tbl_product_transactions` VALUES ('274', '652', '10.00', '13.00000', '15.00', '35', '214', 'IA', 'IN', '1', '2024-02-02 11:29:58', '2024-02-02 11:31:23');
INSERT INTO `tbl_product_transactions` VALUES ('275', '644', '1.00', '1296.43000', '1270.00', '7', '30', 'PC', 'OUT', '1', '2024-02-02 12:06:33', '2024-02-02 12:09:02');
INSERT INTO `tbl_product_transactions` VALUES ('276', '554', '25.00', '51.86000', '52.00', '7', '30', 'PC', 'IN', '1', '2024-02-02 12:06:33', '2024-02-02 12:09:02');
INSERT INTO `tbl_product_transactions` VALUES ('277', '382', '1.00', '1380.00000', '1420.00', '7', '31', 'PC', 'OUT', '1', '2024-02-02 12:06:57', '2024-02-02 12:09:02');
INSERT INTO `tbl_product_transactions` VALUES ('278', '383', '25.00', '55.20000', '58.00', '7', '31', 'PC', 'IN', '1', '2024-02-02 12:06:57', '2024-02-02 12:09:02');
INSERT INTO `tbl_product_transactions` VALUES ('279', '474', '2.00', '1210.00000', '1270.00', '7', '32', 'PC', 'OUT', '1', '2024-02-02 12:08:50', '2024-02-02 12:09:02');
INSERT INTO `tbl_product_transactions` VALUES ('280', '541', '50.00', '48.40000', '53.00', '7', '32', 'PC', 'IN', '1', '2024-02-02 12:08:50', '2024-02-02 12:09:02');
INSERT INTO `tbl_product_transactions` VALUES ('281', '281', '4.00', '620.00000', '720.00', '36', '215', 'IA', 'IN', '1', '2024-02-02 16:23:33', '2024-02-02 16:25:42');
INSERT INTO `tbl_product_transactions` VALUES ('282', '540', '6.00', '0.00000', '450.00', '36', '216', 'IA', 'IN', '1', '2024-02-02 16:23:44', '2024-02-02 16:25:42');
INSERT INTO `tbl_product_transactions` VALUES ('283', '659', '4.00', '375.00000', '450.00', '36', '217', 'IA', 'IN', '1', '2024-02-02 16:23:53', '2024-02-02 16:25:42');
INSERT INTO `tbl_product_transactions` VALUES ('284', '544', '2.00', '330.00000', '400.00', '36', '218', 'IA', 'IN', '1', '2024-02-02 16:24:02', '2024-02-02 16:25:42');
INSERT INTO `tbl_product_transactions` VALUES ('285', '165', '3.00', '300.00000', '400.00', '36', '219', 'IA', 'IN', '1', '2024-02-02 16:24:12', '2024-02-02 16:25:42');
INSERT INTO `tbl_product_transactions` VALUES ('287', '244', '4.00', '330.00000', '420.00', '36', '221', 'IA', 'IN', '1', '2024-02-02 16:25:08', '2024-02-02 16:25:42');
INSERT INTO `tbl_product_transactions` VALUES ('288', '274', '2.00', '3.64000', '470.00', '36', '222', 'IA', 'IN', '1', '2024-02-02 16:25:18', '2024-02-02 16:25:42');
INSERT INTO `tbl_product_transactions` VALUES ('289', '291', '9.00', '152.87000', '700.00', '37', '223', 'IA', 'IN', '1', '2024-02-02 16:26:40', '2024-02-02 16:27:00');
INSERT INTO `tbl_product_transactions` VALUES ('290', '453', '2.00', '29.58000', '32.00', '3', '3', 'SLS', 'OUT', '1', '2024-02-03 06:51:05', '2024-02-03 06:51:15');
INSERT INTO `tbl_product_transactions` VALUES ('292', '143', '4.00', '186.66667', '250.00', '4', '5', 'SLS', 'OUT', '0', '2024-02-03 07:15:05', '2024-02-03 07:27:28');
INSERT INTO `tbl_product_transactions` VALUES ('293', '13', '1.00', '5425.37313', '5600.00', '4', '6', 'SLS', 'OUT', '0', '2024-02-03 07:16:02', '2024-02-03 07:27:28');
INSERT INTO `tbl_product_transactions` VALUES ('294', '143', '4.00', '186.66667', '250.00', '1', '1', 'SR', 'IN', '1', '2024-02-03 07:27:22', '2024-02-03 07:27:28');
INSERT INTO `tbl_product_transactions` VALUES ('295', '13', '1.00', '5425.37313', '5600.00', '1', '2', 'SR', 'IN', '1', '2024-02-03 07:27:22', '2024-02-03 07:27:28');
INSERT INTO `tbl_product_transactions` VALUES ('296', '403', '8.00', '1340.00000', '1470.00', '38', '224', 'IA', 'IN', '1', '2024-02-03 07:31:01', '2024-02-03 07:31:21');
INSERT INTO `tbl_product_transactions` VALUES ('297', '401', '5.00', '2045.00000', '2100.00', '38', '225', 'IA', 'IN', '1', '2024-02-03 07:31:14', '2024-02-03 07:31:21');
INSERT INTO `tbl_product_transactions` VALUES ('298', '403', '1.00', '1340.00000', '1470.00', '8', '33', 'PC', 'OUT', '1', '2024-02-03 07:32:03', '2024-02-03 07:33:32');
INSERT INTO `tbl_product_transactions` VALUES ('299', '441', '25.00', '53.60000', '60.00', '8', '33', 'PC', 'IN', '1', '2024-02-03 07:32:03', '2024-02-03 07:33:32');
INSERT INTO `tbl_product_transactions` VALUES ('300', '401', '1.00', '2045.00000', '2100.00', '8', '34', 'PC', 'OUT', '1', '2024-02-03 07:32:27', '2024-02-03 07:33:32');
INSERT INTO `tbl_product_transactions` VALUES ('301', '439', '50.00', '40.90000', '44.00', '8', '34', 'PC', 'IN', '1', '2024-02-03 07:32:27', '2024-02-03 07:33:32');
INSERT INTO `tbl_product_transactions` VALUES ('303', '447', '2.00', '31.19000', '34.00', '5', '8', 'SLS', 'OUT', '1', '2024-02-03 07:44:55', '2024-02-03 07:45:37');
INSERT INTO `tbl_product_transactions` VALUES ('304', '526', '1.00', '8.73000', '10.00', '5', '9', 'SLS', 'OUT', '1', '2024-02-03 07:45:21', '2024-02-03 07:45:37');
INSERT INTO `tbl_product_transactions` VALUES ('305', '394', '1.00', '1605.83333', '1676.00', '6', '10', 'SLS', 'OUT', '1', '2024-02-03 07:46:15', '2024-02-03 07:47:42');
INSERT INTO `tbl_product_transactions` VALUES ('306', '441', '1.00', '53.60000', '60.00', '7', '11', 'SLS', 'OUT', '1', '2024-02-03 07:49:10', '2024-02-03 07:49:20');
INSERT INTO `tbl_product_transactions` VALUES ('307', '13', '1.00', '5425.37000', '5600.00', '39', '226', 'IA', 'IN', '1', '2024-02-03 07:52:58', '2024-02-03 07:53:06');
INSERT INTO `tbl_product_transactions` VALUES ('308', '143', '4.00', '186.67000', '250.00', '39', '227', 'IA', 'IN', '1', '2024-02-03 07:53:04', '2024-02-03 07:53:06');
INSERT INTO `tbl_product_transactions` VALUES ('309', '13', '1.00', '5425.37313', '5600.00', '8', '12', 'SLS', 'OUT', '0', '2024-02-03 07:53:17', '2024-02-03 07:55:55');
INSERT INTO `tbl_product_transactions` VALUES ('310', '143', '4.00', '186.66667', '250.00', '8', '13', 'SLS', 'OUT', '0', '2024-02-03 07:53:20', '2024-02-03 07:55:55');
INSERT INTO `tbl_product_transactions` VALUES ('311', '13', '1.00', '5425.37313', '5600.00', '9', '14', 'SLS', 'OUT', '0', '2024-02-03 07:54:28', '2024-02-03 07:55:50');
INSERT INTO `tbl_product_transactions` VALUES ('312', '143', '4.00', '186.66667', '250.00', '9', '15', 'SLS', 'OUT', '0', '2024-02-03 07:54:30', '2024-02-03 07:55:50');
INSERT INTO `tbl_product_transactions` VALUES ('313', '13', '1.00', '5425.37000', '5600.00', '40', '228', 'IA', 'OUT', '1', '2024-02-03 07:55:07', '2024-02-03 07:55:13');
INSERT INTO `tbl_product_transactions` VALUES ('314', '143', '4.00', '186.67000', '250.00', '40', '229', 'IA', 'OUT', '1', '2024-02-03 07:55:12', '2024-02-03 07:55:13');
INSERT INTO `tbl_product_transactions` VALUES ('315', '13', '1.00', '5425.37313', '5600.00', '2', '4', 'SR', 'IN', '1', '2024-02-03 07:55:48', '2024-02-03 07:55:50');
INSERT INTO `tbl_product_transactions` VALUES ('316', '143', '4.00', '186.66667', '250.00', '2', '5', 'SR', 'IN', '1', '2024-02-03 07:55:48', '2024-02-03 07:55:50');
INSERT INTO `tbl_product_transactions` VALUES ('317', '13', '1.00', '5425.37313', '5600.00', '3', '7', 'SR', 'IN', '1', '2024-02-03 07:55:53', '2024-02-03 07:55:55');
INSERT INTO `tbl_product_transactions` VALUES ('318', '143', '4.00', '186.66667', '250.00', '3', '8', 'SR', 'IN', '1', '2024-02-03 07:55:53', '2024-02-03 07:55:55');
INSERT INTO `tbl_product_transactions` VALUES ('322', '223', '5.00', '1584.59000', '2200.00', '41', '230', 'IA', 'IN', '1', '2024-02-03 07:58:01', '2024-02-03 07:58:20');
INSERT INTO `tbl_product_transactions` VALUES ('323', '222', '5.00', '1800.00000', '2600.00', '41', '231', 'IA', 'IN', '1', '2024-02-03 07:58:08', '2024-02-03 07:58:20');
INSERT INTO `tbl_product_transactions` VALUES ('324', '264', '5.00', '2300.00000', '3000.00', '41', '232', 'IA', 'IN', '1', '2024-02-03 07:58:16', '2024-02-03 07:58:20');
INSERT INTO `tbl_product_transactions` VALUES ('325', '465', '5.50', '37.40000', '40.00', '10', '16', 'SLS', 'OUT', '1', '2024-02-03 08:14:43', '2024-02-03 08:14:53');
INSERT INTO `tbl_product_transactions` VALUES ('326', '644', '1.00', '1296.42857', '1270.00', '11', '17', 'SLS', 'OUT', '1', '2024-02-03 08:30:39', '2024-02-03 08:30:59');
INSERT INTO `tbl_product_transactions` VALUES ('327', '440', '5.00', '38.12000', '42.00', '12', '18', 'SLS', 'OUT', '1', '2024-02-03 08:31:19', '2024-02-03 08:31:25');
INSERT INTO `tbl_product_transactions` VALUES ('328', '464', '3.00', '1870.00000', '1920.00', '42', '233', 'IA', 'IN', '1', '2024-02-03 08:39:10', '2024-02-03 08:40:00');
INSERT INTO `tbl_product_transactions` VALUES ('329', '407', '1.00', '1910.00000', '1980.00', '42', '234', 'IA', 'IN', '1', '2024-02-03 08:39:38', '2024-02-03 08:40:00');
INSERT INTO `tbl_product_transactions` VALUES ('330', '405', '2.00', '2055.00000', '2055.00', '42', '235', 'IA', 'IN', '1', '2024-02-03 08:39:52', '2024-02-03 08:40:00');
INSERT INTO `tbl_product_transactions` VALUES ('331', '439', '5.00', '40.90000', '44.00', '13', '19', 'SLS', 'OUT', '1', '2024-02-03 08:44:49', '2024-02-03 08:45:27');
INSERT INTO `tbl_product_transactions` VALUES ('332', '404', '5.00', '1804.29000', '1950.00', '43', '236', 'IA', 'IN', '1', '2024-02-03 08:47:15', '2024-02-03 08:47:22');
INSERT INTO `tbl_product_transactions` VALUES ('334', '481', '1.00', '50.00016', '53.00', '14', '21', 'SLS', 'OUT', '1', '2024-02-03 08:50:23', '2024-02-03 08:51:07');
INSERT INTO `tbl_product_transactions` VALUES ('335', '440', '25.00', '38.12000', '42.00', '15', '22', 'SLS', 'OUT', '1', '2024-02-03 08:51:35', '2024-02-03 08:51:47');
INSERT INTO `tbl_product_transactions` VALUES ('336', '464', '1.00', '1870.00000', '1920.00', '16', '23', 'SLS', 'OUT', '1', '2024-02-03 08:55:51', '2024-02-03 08:56:23');
INSERT INTO `tbl_product_transactions` VALUES ('337', '474', '1.00', '1210.00000', '1270.00', '9', '35', 'PC', 'OUT', '1', '2024-02-03 09:01:27', '2024-02-03 09:02:24');
INSERT INTO `tbl_product_transactions` VALUES ('338', '541', '25.00', '48.40000', '53.00', '9', '35', 'PC', 'IN', '1', '2024-02-03 09:01:27', '2024-02-03 09:02:24');
INSERT INTO `tbl_product_transactions` VALUES ('339', '475', '1.00', '871.20000', '930.00', '9', '36', 'PC', 'OUT', '1', '2024-02-03 09:01:45', '2024-02-03 09:02:24');
INSERT INTO `tbl_product_transactions` VALUES ('340', '541', '18.00', '48.40000', '53.00', '9', '36', 'PC', 'IN', '1', '2024-02-03 09:01:45', '2024-02-03 09:02:24');
INSERT INTO `tbl_product_transactions` VALUES ('341', '382', '1.00', '1380.00000', '1420.00', '9', '37', 'PC', 'OUT', '1', '2024-02-03 09:02:19', '2024-02-03 09:02:24');
INSERT INTO `tbl_product_transactions` VALUES ('342', '383', '25.00', '55.20000', '58.00', '9', '37', 'PC', 'IN', '1', '2024-02-03 09:02:19', '2024-02-03 09:02:24');
INSERT INTO `tbl_product_transactions` VALUES ('343', '404', '1.00', '1804.28571', '1950.00', '17', '24', 'SLS', 'OUT', '1', '2024-02-03 09:06:40', '2024-02-03 09:07:07');
INSERT INTO `tbl_product_transactions` VALUES ('344', '547', '80.00', '950.00000', '950.00', '2', '1', 'PO', 'IN', '1', '2024-02-03 09:50:20', '2024-02-03 09:50:28');
INSERT INTO `tbl_product_transactions` VALUES ('345', '628', '20.00', '3800.00000', '3800.00', '4', '2', 'PO', 'IN', '1', '2024-02-03 09:54:39', '2024-02-03 09:54:43');
INSERT INTO `tbl_product_transactions` VALUES ('346', '401', '1.00', '2045.00000', '2100.00', '18', '25', 'SLS', 'OUT', '0', '2024-02-03 10:01:00', '0000-00-00 00:00:00');
INSERT INTO `tbl_product_transactions` VALUES ('347', '482', '1.00', '1609.42857', '1668.00', '18', '26', 'SLS', 'OUT', '0', '2024-02-03 10:01:31', '0000-00-00 00:00:00');
INSERT INTO `tbl_product_transactions` VALUES ('348', '46', '2.00', '69.13394', '45.00', '19', '27', 'SLS', 'OUT', '1', '2024-02-03 10:02:16', '2024-02-03 10:02:23');
INSERT INTO `tbl_product_transactions` VALUES ('349', '653', '4.00', '5.00000', '8.00', '20', '28', 'SLS', 'OUT', '1', '2024-02-03 10:02:44', '2024-02-03 10:02:55');
INSERT INTO `tbl_product_transactions` VALUES ('350', '615', '1.00', '1150.00000', '1280.00', '21', '29', 'SLS', 'OUT', '1', '2024-02-03 10:03:05', '2024-02-03 10:03:39');
INSERT INTO `tbl_product_transactions` VALUES ('351', '35', '1.00', '201.86682', '320.00', '21', '30', 'SLS', 'OUT', '1', '2024-02-03 10:03:22', '2024-02-03 10:03:39');
INSERT INTO `tbl_product_transactions` VALUES ('352', '46', '2.00', '69.13394', '45.00', '21', '31', 'SLS', 'OUT', '1', '2024-02-03 10:03:28', '2024-02-03 10:03:39');
INSERT INTO `tbl_product_transactions` VALUES ('353', '103', '2.00', '953.46477', '1050.00', '22', '32', 'SLS', 'OUT', '1', '2024-02-03 10:42:37', '2024-02-03 10:43:13');
INSERT INTO `tbl_product_transactions` VALUES ('354', '65', '1.00', '360.00000', '400.00', '23', '33', 'SLS', 'OUT', '1', '2024-02-03 10:46:18', '2024-02-03 10:47:02');
INSERT INTO `tbl_product_transactions` VALUES ('355', '644', '1.00', '1296.42857', '1270.00', '23', '34', 'SLS', 'OUT', '1', '2024-02-03 10:46:26', '2024-02-03 10:47:02');
INSERT INTO `tbl_product_transactions` VALUES ('356', '71', '1.00', '1124.38661', '1300.00', '24', '35', 'SLS', 'OUT', '1', '2024-02-03 10:50:16', '2024-02-03 10:50:51');
INSERT INTO `tbl_product_transactions` VALUES ('357', '35', '1.00', '201.86682', '320.00', '24', '36', 'SLS', 'OUT', '1', '2024-02-03 10:50:30', '2024-02-03 10:50:51');
INSERT INTO `tbl_product_transactions` VALUES ('358', '483', '1.00', '73.00000', '85.00', '25', '37', 'SLS', 'OUT', '1', '2024-02-03 11:01:26', '2024-02-03 11:01:31');
INSERT INTO `tbl_product_transactions` VALUES ('359', '292', '60.00', '510.00000', '510.00', '5', '3', 'PO', 'IN', '1', '2024-02-03 11:05:52', '2024-02-03 11:06:00');
INSERT INTO `tbl_product_transactions` VALUES ('360', '410', '2.00', '22.93677', '24.00', '26', '38', 'SLS', 'OUT', '1', '2024-02-03 11:07:33', '2024-02-03 11:07:57');
INSERT INTO `tbl_product_transactions` VALUES ('361', '547', '2.00', '947.61854', '1050.00', '27', '39', 'SLS', 'OUT', '1', '2024-02-03 11:50:50', '2024-02-03 11:51:26');
INSERT INTO `tbl_product_transactions` VALUES ('362', '46', '10.00', '69.13394', '45.00', '27', '40', 'SLS', 'OUT', '1', '2024-02-03 11:51:08', '2024-02-03 11:51:26');
INSERT INTO `tbl_product_transactions` VALUES ('363', '46', '5.00', '69.13394', '45.00', '28', '41', 'SLS', 'OUT', '1', '2024-02-03 11:51:38', '2024-02-03 11:51:45');
INSERT INTO `tbl_product_transactions` VALUES ('364', '439', '5.00', '40.90000', '44.00', '29', '42', 'SLS', 'OUT', '1', '2024-02-03 11:57:35', '2024-02-03 11:59:38');
INSERT INTO `tbl_product_transactions` VALUES ('365', '447', '5.00', '31.19000', '34.00', '29', '43', 'SLS', 'OUT', '1', '2024-02-03 11:57:57', '2024-02-03 11:59:38');
INSERT INTO `tbl_product_transactions` VALUES ('366', '476', '3.00', '38.40000', '40.00', '29', '44', 'SLS', 'OUT', '1', '2024-02-03 11:58:43', '2024-02-03 11:59:38');
INSERT INTO `tbl_product_transactions` VALUES ('367', '483', '1.00', '73.00000', '85.00', '29', '45', 'SLS', 'OUT', '1', '2024-02-03 11:59:15', '2024-02-03 11:59:38');
INSERT INTO `tbl_product_transactions` VALUES ('368', '10', '2.00', '5373.27800', '5400.00', '30', '46', 'SLS', 'OUT', '1', '2024-02-03 12:14:34', '2024-02-03 12:18:02');
INSERT INTO `tbl_product_transactions` VALUES ('369', '39', '1.00', '384.90724', '580.00', '30', '47', 'SLS', 'OUT', '1', '2024-02-03 12:16:20', '2024-02-03 12:18:02');
INSERT INTO `tbl_product_transactions` VALUES ('374', '484', '4.00', '64.38000', '68.00', '31', '48', 'SLS', 'OUT', '1', '2024-02-03 12:21:53', '2024-02-03 12:22:23');
INSERT INTO `tbl_product_transactions` VALUES ('377', '14', '2.00', '4700.00000', '5000.00', '32', '49', 'SLS', 'OUT', '1', '2024-02-03 13:07:37', '2024-02-03 13:08:20');
INSERT INTO `tbl_product_transactions` VALUES ('378', '30', '1.00', '375.00000', '650.00', '32', '50', 'SLS', 'OUT', '1', '2024-02-03 13:07:43', '2024-02-03 13:08:20');
INSERT INTO `tbl_product_transactions` VALUES ('379', '35', '1.00', '201.86682', '320.00', '33', '51', 'SLS', 'OUT', '1', '2024-02-03 13:11:50', '2024-02-03 13:14:23');
INSERT INTO `tbl_product_transactions` VALUES ('380', '143', '1.00', '186.66667', '250.00', '33', '52', 'SLS', 'OUT', '1', '2024-02-03 13:12:05', '2024-02-03 13:14:23');
INSERT INTO `tbl_product_transactions` VALUES ('381', '14', '2.00', '4700.00000', '5000.00', '34', '53', 'SLS', 'OUT', '1', '2024-02-03 14:20:20', '2024-02-03 14:24:25');
INSERT INTO `tbl_product_transactions` VALUES ('382', '144', '1.00', '1299.99382', '1450.00', '34', '54', 'SLS', 'OUT', '1', '2024-02-03 14:21:00', '2024-02-03 14:24:25');
INSERT INTO `tbl_product_transactions` VALUES ('383', '46', '10.00', '69.13394', '45.00', '34', '55', 'SLS', 'OUT', '1', '2024-02-03 14:21:30', '2024-02-03 14:24:25');
INSERT INTO `tbl_product_transactions` VALUES ('384', '71', '1.00', '1124.38661', '1300.00', '34', '56', 'SLS', 'OUT', '1', '2024-02-03 14:21:58', '2024-02-03 14:24:25');
INSERT INTO `tbl_product_transactions` VALUES ('386', '10', '2.00', '5373.27800', '5400.00', '35', '57', 'SLS', 'OUT', '1', '2024-02-03 14:36:24', '2024-02-03 14:37:53');
INSERT INTO `tbl_product_transactions` VALUES ('387', '71', '1.00', '1124.38661', '1300.00', '36', '58', 'SLS', 'OUT', '1', '2024-02-03 14:38:43', '2024-02-03 14:38:54');
INSERT INTO `tbl_product_transactions` VALUES ('388', '474', '1.00', '1210.00000', '1270.00', '37', '59', 'SLS', 'OUT', '1', '2024-02-03 14:39:35', '2024-02-03 14:39:49');
INSERT INTO `tbl_product_transactions` VALUES ('389', '358', '1.00', '3.73000', '1380.00', '44', '237', 'IA', 'IN', '1', '2024-02-03 14:53:02', '2024-02-03 14:53:04');
INSERT INTO `tbl_product_transactions` VALUES ('390', '358', '1.00', '3.72563', '1380.00', '38', '60', 'SLS', 'OUT', '1', '2024-02-03 14:53:35', '2024-02-03 14:54:12');
INSERT INTO `tbl_product_transactions` VALUES ('391', '19', '500.00', '1263.45000', '1330.00', '45', '238', 'IA', 'IN', '1', '2024-02-03 14:55:24', '2024-02-03 14:55:40');
INSERT INTO `tbl_product_transactions` VALUES ('392', '28', '500.00', '1349.15000', '1430.00', '45', '239', 'IA', 'IN', '1', '2024-02-03 14:55:30', '2024-02-03 14:55:40');
INSERT INTO `tbl_product_transactions` VALUES ('393', '25', '500.00', '636.21000', '700.00', '45', '240', 'IA', 'IN', '1', '2024-02-03 14:55:38', '2024-02-03 14:55:40');
INSERT INTO `tbl_product_transactions` VALUES ('394', '19', '1.00', '1263.45301', '1330.00', '39', '61', 'SLS', 'OUT', '1', '2024-02-03 14:56:00', '2024-02-03 14:58:24');
INSERT INTO `tbl_product_transactions` VALUES ('395', '28', '1.00', '1349.14933', '1430.00', '39', '62', 'SLS', 'OUT', '1', '2024-02-03 14:56:42', '2024-02-03 14:58:24');
INSERT INTO `tbl_product_transactions` VALUES ('396', '563', '2.00', '6720.00000', '6720.00', '6', '4', 'PO', 'IN', '1', '2024-02-03 15:36:40', '2024-02-03 15:36:43');
INSERT INTO `tbl_product_transactions` VALUES ('397', '383', '4.00', '55.20000', '58.00', '40', '63', 'SLS', 'OUT', '1', '2024-02-03 15:57:39', '2024-02-03 15:58:17');
INSERT INTO `tbl_product_transactions` VALUES ('398', '474', '1.00', '1210.00000', '1270.00', '41', '64', 'SLS', 'OUT', '1', '2024-02-03 16:05:52', '2024-02-03 16:06:08');
INSERT INTO `tbl_product_transactions` VALUES ('400', '271', '2.00', '330.17303', '650.00', '42', '66', 'SLS', 'OUT', '1', '2024-02-03 16:27:21', '2024-02-03 16:27:56');
INSERT INTO `tbl_product_transactions` VALUES ('401', '95', '1.00', '929.98063', '1050.00', '43', '67', 'SLS', 'OUT', '1', '2024-02-03 16:44:09', '2024-02-03 16:44:17');
INSERT INTO `tbl_product_transactions` VALUES ('402', '474', '1.00', '1210.00000', '1270.00', '44', '68', 'SLS', 'OUT', '1', '2024-02-03 17:09:07', '2024-02-03 17:09:25');
INSERT INTO `tbl_product_transactions` VALUES ('403', '433', '1.00', '34.84000', '36.00', '45', '69', 'SLS', 'OUT', '1', '2024-02-03 17:27:36', '2024-02-03 17:28:08');
INSERT INTO `tbl_product_transactions` VALUES ('404', '428', '1.00', '41.10000', '42.00', '45', '70', 'SLS', 'OUT', '1', '2024-02-03 17:27:43', '2024-02-03 17:28:08');
INSERT INTO `tbl_product_transactions` VALUES ('405', '554', '3.00', '51.86000', '52.00', '46', '71', 'SLS', 'OUT', '1', '2024-02-03 17:30:04', '2024-02-03 17:30:51');
INSERT INTO `tbl_product_transactions` VALUES ('406', '554', '5.00', '51.86000', '52.00', '47', '72', 'SLS', 'OUT', '1', '2024-02-03 17:36:13', '2024-02-03 17:36:30');
INSERT INTO `tbl_product_transactions` VALUES ('407', '476', '1.00', '38.40000', '40.00', '48', '73', 'SLS', 'OUT', '1', '2024-02-03 17:38:53', '2024-02-03 17:39:10');
INSERT INTO `tbl_product_transactions` VALUES ('408', '429', '1.00', '37.80000', '40.00', '48', '74', 'SLS', 'OUT', '1', '2024-02-03 17:39:05', '2024-02-03 17:39:10');
INSERT INTO `tbl_product_transactions` VALUES ('409', '440', '2.00', '38.12000', '42.00', '49', '75', 'SLS', 'OUT', '1', '2024-02-03 17:40:44', '2024-02-03 17:40:49');
INSERT INTO `tbl_product_transactions` VALUES ('410', '35', '1.00', '201.86682', '320.00', '50', '76', 'SLS', 'OUT', '1', '2024-02-03 17:45:47', '2024-02-03 17:46:16');
INSERT INTO `tbl_product_transactions` VALUES ('411', '439', '1.00', '40.90000', '44.00', '51', '77', 'SLS', 'OUT', '1', '2024-02-03 17:54:34', '2024-02-03 17:54:37');
INSERT INTO `tbl_product_transactions` VALUES ('412', '439', '1.00', '40.90000', '44.00', '52', '78', 'SLS', 'OUT', '1', '2024-02-03 17:55:29', '2024-02-03 17:55:40');
INSERT INTO `tbl_product_transactions` VALUES ('413', '481', '1.00', '50.00016', '53.00', '53', '79', 'SLS', 'OUT', '1', '2024-02-03 17:58:22', '2024-02-03 17:58:27');
INSERT INTO `tbl_product_transactions` VALUES ('414', '383', '2.00', '55.20000', '58.00', '54', '80', 'SLS', 'OUT', '1', '2024-02-03 17:58:46', '2024-02-03 17:59:02');
INSERT INTO `tbl_product_transactions` VALUES ('415', '174', '2.00', '19.00000', '35.00', '55', '81', 'SLS', 'OUT', '1', '2024-02-03 18:00:45', '2024-02-03 18:00:50');
INSERT INTO `tbl_product_transactions` VALUES ('416', '429', '1.00', '37.80000', '40.00', '56', '82', 'SLS', 'OUT', '1', '2024-02-04 05:58:09', '2024-02-04 05:58:17');
INSERT INTO `tbl_product_transactions` VALUES ('417', '445', '2.00', '32.12000', '35.00', '57', '83', 'SLS', 'OUT', '1', '2024-02-04 06:02:27', '2024-02-04 06:02:31');
INSERT INTO `tbl_product_transactions` VALUES ('418', '79', '1.00', '250.00000', '320.00', '58', '84', 'SLS', 'OUT', '1', '2024-02-04 06:39:54', '2024-02-04 06:40:00');
INSERT INTO `tbl_product_transactions` VALUES ('420', '270', '2.00', '549.85000', '500.00', '59', '86', 'SLS', 'OUT', '1', '2024-02-04 06:51:06', '2024-02-04 06:51:11');
INSERT INTO `tbl_product_transactions` VALUES ('421', '383', '2.00', '55.20000', '58.00', '60', '87', 'SLS', 'OUT', '1', '2024-02-04 07:22:56', '2024-02-04 07:23:09');
INSERT INTO `tbl_product_transactions` VALUES ('422', '660', '26.00', '60.00000', '70.00', '46', '241', 'IA', 'IN', '1', '2024-02-04 07:32:56', '2024-02-04 07:33:01');
INSERT INTO `tbl_product_transactions` VALUES ('423', '541', '2.00', '48.40000', '53.00', '61', '88', 'SLS', 'OUT', '1', '2024-02-04 07:51:27', '2024-02-04 07:51:35');
INSERT INTO `tbl_product_transactions` VALUES ('424', '19', '60.00', '1263.45000', '1330.00', '47', '242', 'IA', 'IN', '1', '2024-02-04 08:00:51', '2024-02-04 08:04:09');
INSERT INTO `tbl_product_transactions` VALUES ('425', '28', '50.00', '1349.15000', '1430.00', '47', '243', 'IA', 'IN', '1', '2024-02-04 08:01:09', '2024-02-04 08:04:09');
INSERT INTO `tbl_product_transactions` VALUES ('426', '18', '30.00', '1388.14000', '1480.00', '47', '244', 'IA', 'IN', '1', '2024-02-04 08:01:27', '2024-02-04 08:04:09');
INSERT INTO `tbl_product_transactions` VALUES ('427', '24', '30.00', '642.04000', '730.00', '47', '245', 'IA', 'IN', '1', '2024-02-04 08:02:49', '2024-02-04 08:04:09');
INSERT INTO `tbl_product_transactions` VALUES ('428', '16', '10.00', '1870.95000', '1950.00', '47', '246', 'IA', 'IN', '1', '2024-02-04 08:03:02', '2024-02-04 08:04:09');
INSERT INTO `tbl_product_transactions` VALUES ('429', '22', '2.00', '2450.53000', '2650.00', '47', '247', 'IA', 'IN', '1', '2024-02-04 08:03:30', '2024-02-04 08:04:09');
INSERT INTO `tbl_product_transactions` VALUES ('430', '434', '1.00', '36.76000', '39.00', '62', '89', 'SLS', 'OUT', '1', '2024-02-04 08:22:16', '2024-02-04 08:22:26');
INSERT INTO `tbl_product_transactions` VALUES ('431', '19', '500.00', '1263.45000', '1330.00', '49', '248', 'IA', 'OUT', '1', '2024-02-04 08:39:43', '2024-02-04 08:39:45');
INSERT INTO `tbl_product_transactions` VALUES ('432', '28', '500.00', '1349.15000', '1430.00', '50', '249', 'IA', 'OUT', '1', '2024-02-04 08:51:46', '2024-02-04 08:51:48');
INSERT INTO `tbl_product_transactions` VALUES ('433', '292', '60.00', '510.00000', '510.00', '1', '1', 'PR', 'OUT', '1', '2024-02-04 08:54:27', '2024-02-04 08:54:41');
INSERT INTO `tbl_product_transactions` VALUES ('434', '628', '20.00', '3800.00000', '3800.00', '3', '2', 'PR', 'OUT', '1', '2024-02-04 08:56:04', '2024-02-04 08:56:17');
INSERT INTO `tbl_product_transactions` VALUES ('435', '19', '50.00', '1250.00000', '1250.00', '7', '5', 'PO', 'IN', '1', '2024-02-04 08:58:22', '2024-02-04 09:01:50');
INSERT INTO `tbl_product_transactions` VALUES ('436', '28', '50.00', '1330.00000', '1330.00', '7', '6', 'PO', 'IN', '1', '2024-02-04 08:58:34', '2024-02-04 09:01:50');
INSERT INTO `tbl_product_transactions` VALUES ('437', '18', '30.00', '1390.00000', '1390.00', '7', '7', 'PO', 'IN', '1', '2024-02-04 08:58:51', '2024-02-04 09:01:50');
INSERT INTO `tbl_product_transactions` VALUES ('438', '24', '30.00', '660.00000', '660.00', '7', '8', 'PO', 'IN', '1', '2024-02-04 08:59:17', '2024-02-04 09:01:50');
INSERT INTO `tbl_product_transactions` VALUES ('439', '16', '10.00', '1870.00000', '1870.00', '7', '9', 'PO', 'IN', '1', '2024-02-04 09:00:48', '2024-02-04 09:01:50');
INSERT INTO `tbl_product_transactions` VALUES ('440', '22', '2.00', '2450.00000', '2450.00', '7', '10', 'PO', 'IN', '1', '2024-02-04 09:01:03', '2024-02-04 09:01:50');
INSERT INTO `tbl_product_transactions` VALUES ('441', '19', '50.00', '1257.28000', '1330.00', '51', '250', 'IA', 'OUT', '1', '2024-02-04 09:04:21', '2024-02-04 09:05:18');
INSERT INTO `tbl_product_transactions` VALUES ('442', '28', '50.00', '1339.48000', '1430.00', '51', '251', 'IA', 'OUT', '1', '2024-02-04 09:04:31', '2024-02-04 09:05:18');
INSERT INTO `tbl_product_transactions` VALUES ('443', '18', '30.00', '1389.07000', '1480.00', '51', '252', 'IA', 'OUT', '1', '2024-02-04 09:04:40', '2024-02-04 09:05:18');
INSERT INTO `tbl_product_transactions` VALUES ('444', '24', '30.00', '651.02000', '730.00', '51', '253', 'IA', 'OUT', '1', '2024-02-04 09:04:56', '2024-02-04 09:05:18');
INSERT INTO `tbl_product_transactions` VALUES ('445', '16', '10.00', '1870.47000', '1950.00', '51', '254', 'IA', 'OUT', '1', '2024-02-04 09:05:06', '2024-02-04 09:05:18');
INSERT INTO `tbl_product_transactions` VALUES ('446', '22', '2.00', '2450.26000', '2650.00', '51', '255', 'IA', 'OUT', '1', '2024-02-04 09:05:13', '2024-02-04 09:05:18');
INSERT INTO `tbl_product_transactions` VALUES ('447', '432', '2.00', '38.40000', '40.00', '63', '90', 'SLS', 'OUT', '1', '2024-02-04 09:08:32', '2024-02-04 09:08:38');
INSERT INTO `tbl_product_transactions` VALUES ('449', '11', '1.00', '4398.80174', '4500.00', '64', '92', 'SLS', 'OUT', '1', '2024-02-04 09:10:14', '2024-02-04 09:12:18');
INSERT INTO `tbl_product_transactions` VALUES ('450', '7', '2.00', '2300.24736', '2400.00', '64', '93', 'SLS', 'OUT', '1', '2024-02-04 09:11:03', '2024-02-04 09:12:18');
INSERT INTO `tbl_product_transactions` VALUES ('451', '162', '1.00', '834.41290', '1000.00', '64', '94', 'SLS', 'OUT', '1', '2024-02-04 09:11:17', '2024-02-04 09:12:18');
INSERT INTO `tbl_product_transactions` VALUES ('452', '62', '1.00', '101.11500', '150.00', '65', '95', 'SLS', 'OUT', '1', '2024-02-04 09:12:31', '2024-02-04 09:12:35');
INSERT INTO `tbl_product_transactions` VALUES ('453', '554', '2.00', '51.86000', '52.00', '66', '96', 'SLS', 'OUT', '1', '2024-02-04 09:13:01', '2024-02-04 09:13:11');
INSERT INTO `tbl_product_transactions` VALUES ('454', '541', '2.00', '48.40000', '53.00', '67', '97', 'SLS', 'OUT', '1', '2024-02-04 09:13:29', '2024-02-04 09:13:38');
INSERT INTO `tbl_product_transactions` VALUES ('455', '439', '5.00', '40.90000', '44.00', '68', '98', 'SLS', 'OUT', '1', '2024-02-04 10:08:14', '2024-02-04 10:09:29');
INSERT INTO `tbl_product_transactions` VALUES ('456', '526', '1.00', '8.73000', '10.00', '68', '99', 'SLS', 'OUT', '1', '2024-02-04 10:09:25', '2024-02-04 10:09:29');
INSERT INTO `tbl_product_transactions` VALUES ('457', '28', '4.00', '1339.47795', '1430.00', '69', '100', 'SLS', 'OUT', '1', '2024-02-04 10:52:39', '2024-02-04 10:54:44');
INSERT INTO `tbl_product_transactions` VALUES ('458', '19', '5.00', '1257.28190', '1330.00', '69', '101', 'SLS', 'OUT', '1', '2024-02-04 10:52:51', '2024-02-04 10:54:44');
INSERT INTO `tbl_product_transactions` VALUES ('459', '103', '1.00', '953.46477', '1050.00', '70', '102', 'SLS', 'OUT', '1', '2024-02-04 10:56:23', '2024-02-04 10:56:42');
INSERT INTO `tbl_product_transactions` VALUES ('460', '389', '3.00', '2110.00000', '2110.00', '8', '11', 'PO', 'IN', '1', '2024-02-04 11:07:14', '2024-02-04 11:14:47');
INSERT INTO `tbl_product_transactions` VALUES ('461', '390', '2.00', '1920.00000', '1920.00', '8', '12', 'PO', 'IN', '1', '2024-02-04 11:07:45', '2024-02-04 11:14:47');
INSERT INTO `tbl_product_transactions` VALUES ('462', '391', '2.00', '1742.00000', '1742.00', '8', '13', 'PO', 'IN', '1', '2024-02-04 11:08:13', '2024-02-04 11:14:47');
INSERT INTO `tbl_product_transactions` VALUES ('464', '487', '3.00', '1775.00000', '1775.00', '8', '15', 'PO', 'IN', '1', '2024-02-04 11:09:08', '2024-02-04 11:14:47');
INSERT INTO `tbl_product_transactions` VALUES ('465', '392', '3.00', '1837.00000', '1837.00', '8', '16', 'PO', 'IN', '1', '2024-02-04 11:11:54', '2024-02-04 11:14:47');
INSERT INTO `tbl_product_transactions` VALUES ('466', '485', '2.00', '1855.00000', '1855.00', '8', '17', 'PO', 'IN', '1', '2024-02-04 11:12:30', '2024-02-04 11:14:47');
INSERT INTO `tbl_product_transactions` VALUES ('467', '407', '2.00', '1910.00000', '1910.00', '8', '18', 'PO', 'IN', '1', '2024-02-04 11:13:00', '2024-02-04 11:14:47');
INSERT INTO `tbl_product_transactions` VALUES ('468', '464', '1.00', '1870.00000', '1870.00', '8', '19', 'PO', 'IN', '1', '2024-02-04 11:13:41', '2024-02-04 11:14:47');
INSERT INTO `tbl_product_transactions` VALUES ('469', '406', '2.00', '1890.00000', '1890.00', '8', '20', 'PO', 'IN', '1', '2024-02-04 11:14:02', '2024-02-04 11:14:47');
INSERT INTO `tbl_product_transactions` VALUES ('470', '396', '2.00', '1559.00000', '1559.00', '8', '21', 'PO', 'IN', '1', '2024-02-04 11:14:34', '2024-02-04 11:14:47');
INSERT INTO `tbl_product_transactions` VALUES ('471', '389', '3.00', '2110.00000', '2160.00', '52', '256', 'IA', 'IN', '1', '2024-02-04 11:16:48', '2024-02-04 11:19:45');
INSERT INTO `tbl_product_transactions` VALUES ('472', '390', '2.00', '1920.00000', '1970.00', '52', '257', 'IA', 'IN', '1', '2024-02-04 11:17:01', '2024-02-04 11:19:45');
INSERT INTO `tbl_product_transactions` VALUES ('473', '391', '2.00', '1742.00000', '1790.00', '52', '258', 'IA', 'IN', '1', '2024-02-04 11:17:20', '2024-02-04 11:19:45');
INSERT INTO `tbl_product_transactions` VALUES ('474', '392', '3.00', '1837.00000', '1890.00', '52', '259', 'IA', 'IN', '1', '2024-02-04 11:17:37', '2024-02-04 11:19:45');
INSERT INTO `tbl_product_transactions` VALUES ('475', '487', '3.00', '1775.00000', '1830.00', '52', '260', 'IA', 'IN', '1', '2024-02-04 11:17:54', '2024-02-04 11:19:45');
INSERT INTO `tbl_product_transactions` VALUES ('476', '485', '2.00', '1855.00000', '1915.00', '52', '261', 'IA', 'IN', '1', '2024-02-04 11:18:16', '2024-02-04 11:19:45');
INSERT INTO `tbl_product_transactions` VALUES ('477', '407', '2.00', '1910.00000', '1980.00', '52', '262', 'IA', 'IN', '1', '2024-02-04 11:18:40', '2024-02-04 11:19:45');
INSERT INTO `tbl_product_transactions` VALUES ('478', '464', '1.00', '1870.00000', '1920.00', '52', '263', 'IA', 'IN', '1', '2024-02-04 11:19:08', '2024-02-04 11:19:45');
INSERT INTO `tbl_product_transactions` VALUES ('479', '406', '2.00', '1890.00000', '1960.00', '52', '264', 'IA', 'IN', '1', '2024-02-04 11:19:23', '2024-02-04 11:19:45');
INSERT INTO `tbl_product_transactions` VALUES ('480', '396', '2.00', '1559.00000', '1629.00', '52', '265', 'IA', 'IN', '1', '2024-02-04 11:19:40', '2024-02-04 11:19:45');
INSERT INTO `tbl_product_transactions` VALUES ('481', '389', '3.00', '2110.00000', '2160.00', '53', '266', 'IA', 'OUT', '1', '2024-02-04 11:21:27', '2024-02-04 11:24:41');
INSERT INTO `tbl_product_transactions` VALUES ('482', '390', '2.00', '1920.00000', '1970.00', '53', '267', 'IA', 'OUT', '1', '2024-02-04 11:21:40', '2024-02-04 11:24:41');
INSERT INTO `tbl_product_transactions` VALUES ('483', '391', '2.00', '1742.00000', '1790.00', '53', '268', 'IA', 'OUT', '1', '2024-02-04 11:21:54', '2024-02-04 11:24:41');
INSERT INTO `tbl_product_transactions` VALUES ('484', '392', '3.00', '1837.00000', '1890.00', '53', '269', 'IA', 'OUT', '1', '2024-02-04 11:22:12', '2024-02-04 11:24:41');
INSERT INTO `tbl_product_transactions` VALUES ('485', '487', '3.00', '1775.00000', '1830.00', '53', '270', 'IA', 'OUT', '1', '2024-02-04 11:22:38', '2024-02-04 11:24:41');
INSERT INTO `tbl_product_transactions` VALUES ('486', '485', '2.00', '1855.00000', '1915.00', '53', '271', 'IA', 'OUT', '1', '2024-02-04 11:23:16', '2024-02-04 11:24:41');
INSERT INTO `tbl_product_transactions` VALUES ('487', '407', '2.00', '1910.00000', '1980.00', '53', '272', 'IA', 'OUT', '1', '2024-02-04 11:23:41', '2024-02-04 11:24:41');
INSERT INTO `tbl_product_transactions` VALUES ('488', '464', '1.00', '1870.00000', '1920.00', '53', '273', 'IA', 'OUT', '1', '2024-02-04 11:24:02', '2024-02-04 11:24:41');
INSERT INTO `tbl_product_transactions` VALUES ('489', '406', '2.00', '1890.00000', '1960.00', '53', '274', 'IA', 'OUT', '1', '2024-02-04 11:24:17', '2024-02-04 11:24:41');
INSERT INTO `tbl_product_transactions` VALUES ('490', '396', '2.00', '1559.00000', '1629.00', '53', '275', 'IA', 'OUT', '1', '2024-02-04 11:24:36', '2024-02-04 11:24:41');
INSERT INTO `tbl_product_transactions` VALUES ('491', '514', '12.00', '250.00000', '250.00', '9', '22', 'PO', 'IN', '1', '2024-02-04 11:27:47', '2024-02-04 11:31:20');
INSERT INTO `tbl_product_transactions` VALUES ('492', '359', '12.00', '420.00000', '420.00', '9', '23', 'PO', 'IN', '1', '2024-02-04 11:28:06', '2024-02-04 11:31:20');
INSERT INTO `tbl_product_transactions` VALUES ('493', '145', '24.00', '450.00000', '450.00', '9', '24', 'PO', 'IN', '1', '2024-02-04 11:28:29', '2024-02-04 11:31:20');
INSERT INTO `tbl_product_transactions` VALUES ('494', '36', '36.00', '89.11000', '89.11', '9', '25', 'PO', 'IN', '1', '2024-02-04 11:28:52', '2024-02-04 11:31:20');
INSERT INTO `tbl_product_transactions` VALUES ('495', '252', '24.00', '122.96000', '122.96', '9', '26', 'PO', 'IN', '1', '2024-02-04 11:29:27', '2024-02-04 11:31:20');
INSERT INTO `tbl_product_transactions` VALUES ('496', '251', '12.00', '243.67000', '243.67', '9', '27', 'PO', 'IN', '1', '2024-02-04 11:30:00', '2024-02-04 11:31:20');
INSERT INTO `tbl_product_transactions` VALUES ('497', '88', '4.00', '2000.00000', '2000.00', '9', '28', 'PO', 'IN', '1', '2024-02-04 11:30:18', '2024-02-04 11:31:20');
INSERT INTO `tbl_product_transactions` VALUES ('498', '89', '12.00', '550.00000', '550.00', '9', '29', 'PO', 'IN', '1', '2024-02-04 11:30:44', '2024-02-04 11:31:20');
INSERT INTO `tbl_product_transactions` VALUES ('499', '221', '12.00', '696.42000', '696.42', '9', '30', 'PO', 'IN', '1', '2024-02-04 11:30:58', '2024-02-04 11:31:20');
INSERT INTO `tbl_product_transactions` VALUES ('500', '388', '12.00', '300.00000', '300.00', '9', '31', 'PO', 'IN', '1', '2024-02-04 11:31:07', '2024-02-04 11:31:20');
INSERT INTO `tbl_product_transactions` VALUES ('501', '253', '36.00', '89.11000', '100.00', '54', '276', 'IA', 'IN', '1', '2024-02-04 11:34:10', '2024-02-04 11:34:18');
INSERT INTO `tbl_product_transactions` VALUES ('502', '80', '6.00', '370.27000', '370.27', '10', '32', 'PO', 'IN', '1', '2024-02-04 11:39:46', '2024-02-04 11:44:41');
INSERT INTO `tbl_product_transactions` VALUES ('503', '645', '12.00', '700.00000', '700.00', '10', '33', 'PO', 'IN', '1', '2024-02-04 11:39:59', '2024-02-04 11:44:41');
INSERT INTO `tbl_product_transactions` VALUES ('504', '610', '6.00', '1880.00000', '1880.00', '10', '34', 'PO', 'IN', '1', '2024-02-04 11:40:26', '2024-02-04 11:44:41');
INSERT INTO `tbl_product_transactions` VALUES ('505', '620', '1.00', '3000.00000', '3000.00', '10', '35', 'PO', 'IN', '1', '2024-02-04 11:40:54', '2024-02-04 11:44:41');
INSERT INTO `tbl_product_transactions` VALUES ('506', '573', '1.00', '3636.36000', '3636.36', '10', '36', 'PO', 'IN', '1', '2024-02-04 11:41:27', '2024-02-04 11:44:41');
INSERT INTO `tbl_product_transactions` VALUES ('507', '583', '1.00', '1828.57000', '1828.57', '10', '37', 'PO', 'IN', '1', '2024-02-04 11:43:28', '2024-02-04 11:44:41');
INSERT INTO `tbl_product_transactions` VALUES ('508', '558', '2.00', '6000.00000', '6000.00', '10', '38', 'PO', 'IN', '1', '2024-02-04 11:43:48', '2024-02-04 11:44:41');
INSERT INTO `tbl_product_transactions` VALUES ('509', '594', '2.00', '3360.00000', '3360.00', '10', '39', 'PO', 'IN', '1', '2024-02-04 11:44:22', '2024-02-04 11:44:41');
INSERT INTO `tbl_product_transactions` VALUES ('510', '3', '2.00', '2276.17111', '2400.00', '71', '103', 'SLS', 'OUT', '1', '2024-02-04 11:49:11', '2024-02-04 11:51:24');
INSERT INTO `tbl_product_transactions` VALUES ('511', '147', '2.00', '2700.00000', '2800.00', '72', '104', 'SLS', 'OUT', '1', '2024-02-04 11:51:49', '2024-02-04 11:52:04');
INSERT INTO `tbl_product_transactions` VALUES ('512', '445', '3.00', '32.12000', '35.00', '73', '105', 'SLS', 'OUT', '1', '2024-02-04 11:52:57', '2024-02-04 11:53:46');
INSERT INTO `tbl_product_transactions` VALUES ('514', '428', '0.50', '41.10000', '42.00', '73', '107', 'SLS', 'OUT', '1', '2024-02-04 11:53:38', '2024-02-04 11:53:46');
INSERT INTO `tbl_product_transactions` VALUES ('515', '58', '6.00', '360.00000', '360.00', '11', '40', 'PO', 'IN', '1', '2024-02-04 11:55:54', '2024-02-04 11:56:12');
INSERT INTO `tbl_product_transactions` VALUES ('516', '217', '6.00', '250.00000', '250.00', '11', '41', 'PO', 'IN', '1', '2024-02-04 11:56:06', '2024-02-04 11:56:12');
INSERT INTO `tbl_product_transactions` VALUES ('517', '95', '1.00', '929.98063', '1050.00', '74', '108', 'SLS', 'OUT', '1', '2024-02-04 11:58:06', '2024-02-04 11:58:43');
INSERT INTO `tbl_product_transactions` VALUES ('518', '35', '1.00', '201.86682', '320.00', '74', '109', 'SLS', 'OUT', '1', '2024-02-04 11:58:15', '2024-02-04 11:58:43');
INSERT INTO `tbl_product_transactions` VALUES ('519', '124', '24.00', '205.00000', '205.00', '12', '42', 'PO', 'IN', '1', '2024-02-04 12:01:49', '2024-02-04 12:02:11');
INSERT INTO `tbl_product_transactions` VALUES ('520', '282', '34.00', '110.27000', '110.27', '12', '43', 'PO', 'IN', '1', '2024-02-04 12:02:07', '2024-02-04 12:02:11');
INSERT INTO `tbl_product_transactions` VALUES ('521', '134', '4.00', '1374.96000', '1374.96', '13', '44', 'PO', 'IN', '1', '2024-02-04 12:03:10', '2024-02-04 12:04:04');
INSERT INTO `tbl_product_transactions` VALUES ('522', '135', '5.00', '177.43000', '177.43', '13', '45', 'PO', 'IN', '1', '2024-02-04 12:03:31', '2024-02-04 12:04:04');
INSERT INTO `tbl_product_transactions` VALUES ('523', '246', '10.00', '98.02000', '98.02', '13', '46', 'PO', 'IN', '1', '2024-02-04 12:03:43', '2024-02-04 12:04:04');
INSERT INTO `tbl_product_transactions` VALUES ('524', '65', '6.00', '360.00000', '360.00', '13', '47', 'PO', 'IN', '1', '2024-02-04 12:03:56', '2024-02-04 12:04:04');
INSERT INTO `tbl_product_transactions` VALUES ('525', '439', '2.00', '40.90000', '44.00', '75', '110', 'SLS', 'OUT', '1', '2024-02-04 12:18:01', '2024-02-04 12:18:09');
INSERT INTO `tbl_product_transactions` VALUES ('526', '153', '1.00', '345.05457', '430.00', '76', '111', 'SLS', 'OUT', '1', '2024-02-04 12:23:39', '2024-02-04 12:23:56');
INSERT INTO `tbl_product_transactions` VALUES ('527', '35', '1.00', '201.86682', '320.00', '77', '112', 'SLS', 'OUT', '1', '2024-02-04 12:24:09', '2024-02-04 12:24:28');
INSERT INTO `tbl_product_transactions` VALUES ('528', '177', '100.00', '11.80000', '13.00', '78', '113', 'SLS', 'OUT', '1', '2024-02-04 13:19:39', '2024-02-04 13:20:21');
INSERT INTO `tbl_product_transactions` VALUES ('529', '174', '1.00', '19.00000', '35.00', '78', '114', 'SLS', 'OUT', '1', '2024-02-04 13:20:09', '2024-02-04 13:20:21');
INSERT INTO `tbl_product_transactions` VALUES ('530', '40', '12.00', '760.00000', '760.00', '14', '48', 'PO', 'IN', '1', '2024-02-04 13:39:49', '2024-02-04 13:43:28');
INSERT INTO `tbl_product_transactions` VALUES ('531', '669', '10.00', '1700.00000', '1700.00', '14', '49', 'PO', 'IN', '1', '2024-02-04 13:40:34', '2024-02-04 13:43:28');
INSERT INTO `tbl_product_transactions` VALUES ('532', '94', '8.00', '2220.00000', '2220.00', '14', '50', 'PO', 'IN', '1', '2024-02-04 13:40:58', '2024-02-04 13:43:28');
INSERT INTO `tbl_product_transactions` VALUES ('533', '93', '12.00', '610.00000', '610.00', '14', '51', 'PO', 'IN', '1', '2024-02-04 13:41:30', '2024-02-04 13:43:28');
INSERT INTO `tbl_product_transactions` VALUES ('534', '158', '6.00', '750.00000', '750.00', '14', '52', 'PO', 'IN', '1', '2024-02-04 13:42:20', '2024-02-04 13:43:28');
INSERT INTO `tbl_product_transactions` VALUES ('535', '72', '24.00', '340.00000', '340.00', '14', '53', 'PO', 'IN', '1', '2024-02-04 13:42:33', '2024-02-04 13:43:28');
INSERT INTO `tbl_product_transactions` VALUES ('536', '660', '1.00', '60.00000', '70.00', '79', '115', 'SLS', 'OUT', '1', '2024-02-04 14:32:33', '2024-02-04 14:32:40');
INSERT INTO `tbl_product_transactions` VALUES ('537', '35', '1.00', '201.86682', '320.00', '80', '116', 'SLS', 'OUT', '1', '2024-02-04 14:42:56', '2024-02-04 14:43:37');
INSERT INTO `tbl_product_transactions` VALUES ('538', '46', '2.00', '69.13394', '45.00', '80', '117', 'SLS', 'OUT', '1', '2024-02-04 14:43:05', '2024-02-04 14:43:37');
INSERT INTO `tbl_product_transactions` VALUES ('539', '35', '1.00', '201.86682', '320.00', '81', '118', 'SLS', 'OUT', '1', '2024-02-04 15:11:21', '2024-02-04 15:11:31');
INSERT INTO `tbl_product_transactions` VALUES ('540', '95', '1.00', '929.98063', '1050.00', '82', '119', 'SLS', 'OUT', '1', '2024-02-04 15:24:11', '2024-02-04 15:29:35');
INSERT INTO `tbl_product_transactions` VALUES ('541', '162', '1.00', '834.41290', '1000.00', '82', '120', 'SLS', 'OUT', '1', '2024-02-04 15:27:32', '2024-02-04 15:29:35');
INSERT INTO `tbl_product_transactions` VALUES ('542', '92', '1.00', '345.63905', '1080.00', '82', '121', 'SLS', 'OUT', '1', '2024-02-04 15:28:11', '2024-02-04 15:29:35');
INSERT INTO `tbl_product_transactions` VALUES ('543', '46', '10.00', '69.13394', '45.00', '82', '122', 'SLS', 'OUT', '1', '2024-02-04 15:28:51', '2024-02-04 15:29:35');
INSERT INTO `tbl_product_transactions` VALUES ('544', '429', '2.00', '37.80000', '40.00', '83', '123', 'SLS', 'OUT', '1', '2024-02-04 15:32:19', '2024-02-04 15:33:02');
INSERT INTO `tbl_product_transactions` VALUES ('545', '500', '2.00', '28.87802', '30.00', '83', '124', 'SLS', 'OUT', '1', '2024-02-04 15:32:46', '2024-02-04 15:33:02');
INSERT INTO `tbl_product_transactions` VALUES ('546', '10', '5.00', '5373.27800', '5400.00', '84', '125', 'SLS', 'OUT', '1', '2024-02-04 15:33:48', '2024-02-04 18:10:12');
INSERT INTO `tbl_product_transactions` VALUES ('548', '10', '10.00', '5373.27800', '5400.00', '85', '127', 'SLS', 'OUT', '1', '2024-02-04 15:57:23', '2024-02-05 09:17:57');
INSERT INTO `tbl_product_transactions` VALUES ('549', '432', '2.00', '38.40000', '40.00', '86', '128', 'SLS', 'OUT', '1', '2024-02-04 16:04:37', '2024-02-04 16:05:08');
INSERT INTO `tbl_product_transactions` VALUES ('550', '433', '1.00', '34.84000', '36.00', '86', '129', 'SLS', 'OUT', '1', '2024-02-04 16:04:46', '2024-02-04 16:05:08');
INSERT INTO `tbl_product_transactions` VALUES ('551', '177', '150.00', '11.80000', '13.00', '87', '130', 'SLS', 'OUT', '1', '2024-02-04 17:26:05', '2024-02-04 17:34:07');
INSERT INTO `tbl_product_transactions` VALUES ('552', '174', '2.00', '19.00000', '35.00', '88', '131', 'SLS', 'OUT', '1', '2024-02-04 17:35:35', '2024-02-04 17:35:45');
INSERT INTO `tbl_product_transactions` VALUES ('553', '439', '25.00', '40.90000', '44.00', '89', '132', 'SLS', 'OUT', '1', '2024-02-04 17:37:15', '2024-02-04 17:38:02');
INSERT INTO `tbl_product_transactions` VALUES ('554', '439', '1.00', '40.90000', '44.00', '90', '133', 'SLS', 'OUT', '1', '2024-02-04 17:39:46', '2024-02-04 17:39:58');
INSERT INTO `tbl_product_transactions` VALUES ('555', '431', '1.00', '42.20000', '44.00', '90', '134', 'SLS', 'OUT', '1', '2024-02-04 17:39:52', '2024-02-04 17:39:58');
INSERT INTO `tbl_product_transactions` VALUES ('556', '553', '8.00', '871.20000', '930.00', '91', '135', 'SLS', 'OUT', '1', '2024-02-04 17:49:58', '2024-02-04 18:13:40');
INSERT INTO `tbl_product_transactions` VALUES ('557', '644', '2.00', '1296.42857', '1270.00', '91', '136', 'SLS', 'OUT', '1', '2024-02-04 17:50:06', '2024-02-04 18:13:40');
INSERT INTO `tbl_product_transactions` VALUES ('558', '7', '9.00', '2300.24736', '2400.00', '92', '137', 'SLS', 'OUT', '1', '2024-02-04 17:52:09', '2024-02-04 18:14:28');
INSERT INTO `tbl_product_transactions` VALUES ('559', '541', '4.00', '48.40000', '53.00', '93', '138', 'SLS', 'OUT', '1', '2024-02-04 17:57:18', '2024-02-04 17:57:38');
INSERT INTO `tbl_product_transactions` VALUES ('560', '476', '1.00', '38.40000', '40.00', '94', '139', 'SLS', 'OUT', '1', '2024-02-04 17:59:11', '2024-02-04 18:00:03');
INSERT INTO `tbl_product_transactions` VALUES ('561', '430', '0.50', '38.20000', '41.00', '94', '140', 'SLS', 'OUT', '1', '2024-02-04 17:59:44', '2024-02-04 18:00:03');
INSERT INTO `tbl_product_transactions` VALUES ('562', '223', '1.00', '1584.59000', '2200.00', '10', '38', 'PC', 'OUT', '1', '2024-02-04 18:09:14', '2024-02-04 18:09:17');
INSERT INTO `tbl_product_transactions` VALUES ('563', '633', '1.00', '1584.59000', '0.00', '10', '38', 'PC', 'IN', '1', '2024-02-04 18:09:14', '2024-02-04 18:09:17');
INSERT INTO `tbl_product_transactions` VALUES ('564', '633', '1.00', '1584.59000', '0.00', '84', '141', 'SLS', 'OUT', '1', '2024-02-04 18:09:53', '2024-02-04 18:10:12');
INSERT INTO `tbl_product_transactions` VALUES ('565', '439', '2.00', '40.90000', '44.00', '95', '142', 'SLS', 'OUT', '1', '2024-02-04 18:12:38', '2024-02-04 18:12:43');
INSERT INTO `tbl_product_transactions` VALUES ('566', '567', '3.00', '4974.29000', '5880.00', '55', '277', 'IA', 'IN', '0', '2024-02-04 18:15:39', '0000-00-00 00:00:00');
INSERT INTO `tbl_product_transactions` VALUES ('567', '567', '5.00', '4974.29000', '5880.00', '56', '278', 'IA', 'IN', '1', '2024-02-04 18:16:02', '2024-02-04 18:16:03');
INSERT INTO `tbl_product_transactions` VALUES ('569', '567', '1.00', '4974.28572', '5880.00', '96', '144', 'SLS', 'OUT', '1', '2024-02-04 18:17:46', '2024-02-04 18:18:38');
INSERT INTO `tbl_product_transactions` VALUES ('571', '434', '2.00', '36.76000', '39.00', '97', '146', 'SLS', 'OUT', '1', '2024-02-05 06:08:28', '2024-02-05 06:08:35');
INSERT INTO `tbl_product_transactions` VALUES ('572', '431', '0.50', '42.20000', '44.00', '98', '147', 'SLS', 'OUT', '1', '2024-02-05 06:10:04', '2024-02-05 06:10:16');
INSERT INTO `tbl_product_transactions` VALUES ('573', '444', '2.00', '33.86000', '36.00', '99', '148', 'SLS', 'OUT', '1', '2024-02-05 06:25:27', '2024-02-05 06:25:34');
INSERT INTO `tbl_product_transactions` VALUES ('574', '554', '5.00', '51.86000', '52.00', '100', '149', 'SLS', 'OUT', '1', '2024-02-05 06:43:13', '2024-02-05 06:43:32');
INSERT INTO `tbl_product_transactions` VALUES ('575', '35', '1.00', '201.86682', '320.00', '101', '150', 'SLS', 'OUT', '1', '2024-02-05 06:50:13', '2024-02-05 06:50:23');
INSERT INTO `tbl_product_transactions` VALUES ('576', '207', '1.00', '1150.00000', '1250.00', '102', '151', 'SLS', 'OUT', '1', '2024-02-05 07:07:47', '2024-02-05 07:09:23');
INSERT INTO `tbl_product_transactions` VALUES ('578', '31', '1.00', '154.15284', '270.00', '102', '153', 'SLS', 'OUT', '1', '2024-02-05 07:09:10', '2024-02-05 07:09:23');
INSERT INTO `tbl_product_transactions` VALUES ('579', '434', '1.00', '36.76000', '39.00', '103', '154', 'SLS', 'OUT', '1', '2024-02-05 07:21:37', '2024-02-05 07:22:04');
INSERT INTO `tbl_product_transactions` VALUES ('580', '660', '6.00', '60.00000', '70.00', '104', '155', 'SLS', 'OUT', '1', '2024-02-05 07:39:50', '2024-02-05 07:40:27');
INSERT INTO `tbl_product_transactions` VALUES ('581', '19', '1.00', '1257.28190', '1330.00', '105', '156', 'SLS', 'OUT', '1', '2024-02-05 08:31:04', '2024-02-05 08:32:13');
INSERT INTO `tbl_product_transactions` VALUES ('582', '24', '1.00', '651.01753', '730.00', '105', '157', 'SLS', 'OUT', '1', '2024-02-05 08:31:14', '2024-02-05 08:32:13');
INSERT INTO `tbl_product_transactions` VALUES ('583', '10', '15.00', '5400.00000', '5400.00', '15', '54', 'PO', 'IN', '1', '2024-02-05 09:02:50', '2024-02-05 09:05:18');
INSERT INTO `tbl_product_transactions` VALUES ('585', '567', '3.00', '4980.00000', '4980.00', '15', '56', 'PO', 'IN', '1', '2024-02-05 09:05:09', '2024-02-05 09:05:18');
INSERT INTO `tbl_product_transactions` VALUES ('586', '13', '10.00', '5400.00000', '5400.00', '16', '57', 'PO', 'IN', '1', '2024-02-05 09:06:02', '2024-02-05 09:06:40');
INSERT INTO `tbl_product_transactions` VALUES ('587', '14', '10.00', '4700.00000', '4700.00', '16', '58', 'PO', 'IN', '1', '2024-02-05 09:06:15', '2024-02-05 09:06:40');
INSERT INTO `tbl_product_transactions` VALUES ('588', '7', '10.00', '2300.00000', '2300.00', '16', '59', 'PO', 'IN', '1', '2024-02-05 09:06:28', '2024-02-05 09:06:40');
INSERT INTO `tbl_product_transactions` VALUES ('589', '7', '20.00', '2300.00000', '2300.00', '17', '60', 'PO', 'IN', '1', '2024-02-05 09:07:25', '2024-02-05 09:07:33');
INSERT INTO `tbl_product_transactions` VALUES ('590', '567', '5.00', '4976.73000', '5880.00', '57', '279', 'IA', 'OUT', '1', '2024-02-05 09:08:17', '2024-02-05 09:08:18');
INSERT INTO `tbl_product_transactions` VALUES ('591', '401', '1.00', '2045.00000', '2100.00', '11', '39', 'PC', 'OUT', '1', '2024-02-05 09:14:09', '2024-02-05 09:14:45');
INSERT INTO `tbl_product_transactions` VALUES ('592', '439', '50.00', '40.90000', '44.00', '11', '39', 'PC', 'IN', '1', '2024-02-05 09:14:09', '2024-02-05 09:14:45');
INSERT INTO `tbl_product_transactions` VALUES ('593', '402', '1.00', '1906.16000', '2050.00', '11', '40', 'PC', 'OUT', '1', '2024-02-05 09:14:31', '2024-02-05 09:14:45');
INSERT INTO `tbl_product_transactions` VALUES ('594', '440', '50.00', '38.12000', '42.00', '11', '40', 'PC', 'IN', '1', '2024-02-05 09:14:31', '2024-02-05 09:14:45');
INSERT INTO `tbl_product_transactions` VALUES ('595', '7', '4.00', '2300.09276', '2400.00', '106', '158', 'SLS', 'OUT', '1', '2024-02-05 10:40:28', '2024-02-05 10:42:04');
INSERT INTO `tbl_product_transactions` VALUES ('596', '174', '1.00', '19.00000', '35.00', '107', '159', 'SLS', 'OUT', '1', '2024-02-05 11:32:52', '2024-02-05 11:33:17');
INSERT INTO `tbl_product_transactions` VALUES ('597', '35', '1.00', '201.86682', '320.00', '108', '160', 'SLS', 'OUT', '1', '2024-02-05 12:18:58', '2024-02-05 12:19:48');
INSERT INTO `tbl_product_transactions` VALUES ('598', '92', '1.00', '345.63905', '1080.00', '109', '161', 'SLS', 'OUT', '1', '2024-02-05 12:22:16', '2024-02-05 12:22:24');
INSERT INTO `tbl_product_transactions` VALUES ('599', '439', '2.00', '40.90000', '44.00', '110', '162', 'SLS', 'OUT', '1', '2024-02-05 12:29:27', '2024-02-05 12:29:44');
INSERT INTO `tbl_product_transactions` VALUES ('600', '441', '0.50', '53.60000', '60.00', '110', '163', 'SLS', 'OUT', '1', '2024-02-05 12:29:36', '2024-02-05 12:29:44');
INSERT INTO `tbl_product_transactions` VALUES ('601', '176', '2.00', '6.26618', '10.00', '111', '164', 'SLS', 'OUT', '1', '2024-02-05 12:30:30', '2024-02-05 12:30:38');
INSERT INTO `tbl_product_transactions` VALUES ('602', '35', '1.00', '201.86682', '320.00', '112', '165', 'SLS', 'OUT', '1', '2024-02-05 13:07:09', '2024-02-05 13:07:24');
INSERT INTO `tbl_product_transactions` VALUES ('603', '7', '1.00', '2300.09276', '2400.00', '113', '166', 'SLS', 'OUT', '1', '2024-02-05 14:38:10', '2024-02-05 14:39:33');
INSERT INTO `tbl_product_transactions` VALUES ('605', '18', '1.00', '1389.06857', '1480.00', '114', '168', 'SLS', 'OUT', '1', '2024-02-05 14:46:18', '2024-02-05 14:47:27');
INSERT INTO `tbl_product_transactions` VALUES ('606', '28', '1.00', '1339.47795', '1480.00', '114', '169', 'SLS', 'OUT', '1', '2024-02-05 14:46:30', '2024-02-05 14:47:27');
INSERT INTO `tbl_product_transactions` VALUES ('607', '282', '1.00', '110.33323', '150.00', '115', '170', 'SLS', 'OUT', '1', '2024-02-05 14:48:06', '2024-02-05 14:48:31');
INSERT INTO `tbl_product_transactions` VALUES ('608', '145', '1.00', '300.00000', '450.00', '115', '171', 'SLS', 'OUT', '1', '2024-02-05 14:48:12', '2024-02-05 14:48:31');
INSERT INTO `tbl_product_transactions` VALUES ('609', '475', '1.00', '871.20000', '930.00', '116', '172', 'SLS', 'OUT', '1', '2024-02-05 14:51:13', '2024-02-05 14:51:27');
INSERT INTO `tbl_product_transactions` VALUES ('610', '13', '1.00', '5414.34133', '5600.00', '117', '173', 'SLS', 'OUT', '1', '2024-02-05 15:51:53', '2024-02-05 15:53:25');
INSERT INTO `tbl_product_transactions` VALUES ('611', '103', '1.00', '953.46477', '1050.00', '118', '174', 'SLS', 'OUT', '1', '2024-02-05 15:59:39', '2024-02-05 16:00:54');
INSERT INTO `tbl_product_transactions` VALUES ('612', '35', '1.00', '201.86682', '320.00', '118', '175', 'SLS', 'OUT', '1', '2024-02-05 15:59:48', '2024-02-05 16:00:54');
INSERT INTO `tbl_product_transactions` VALUES ('614', '430', '1.00', '38.20000', '41.00', '119', '177', 'SLS', 'OUT', '1', '2024-02-05 16:04:21', '2024-02-05 16:04:29');
INSERT INTO `tbl_product_transactions` VALUES ('616', '251', '1.00', '243.00308', '300.00', '120', '179', 'SLS', 'OUT', '1', '2024-02-05 16:19:14', '2024-02-05 16:19:23');
INSERT INTO `tbl_product_transactions` VALUES ('617', '71', '2.00', '1124.38661', '1300.00', '121', '180', 'SLS', 'OUT', '1', '2024-02-05 16:35:19', '2024-02-06 11:38:07');
INSERT INTO `tbl_product_transactions` VALUES ('618', '30', '1.00', '375.00000', '650.00', '121', '181', 'SLS', 'OUT', '1', '2024-02-05 16:35:41', '2024-02-06 11:38:07');
INSERT INTO `tbl_product_transactions` VALUES ('619', '118', '1.00', '0.04044', '1100.00', '122', '182', 'SLS', 'OUT', '1', '2024-02-05 16:38:04', '2024-02-05 16:39:10');
INSERT INTO `tbl_product_transactions` VALUES ('620', '46', '2.00', '69.13394', '45.00', '122', '183', 'SLS', 'OUT', '1', '2024-02-05 16:38:51', '2024-02-05 16:39:10');
INSERT INTO `tbl_product_transactions` VALUES ('621', '541', '3.00', '48.40000', '53.00', '123', '184', 'SLS', 'OUT', '1', '2024-02-05 17:08:30', '2024-02-05 17:08:50');
INSERT INTO `tbl_product_transactions` VALUES ('623', '360', '10.00', '5100.15541', '5300.00', '124', '186', 'SLS', 'OUT', '1', '2024-02-05 17:19:32', '2024-02-05 17:22:34');
INSERT INTO `tbl_product_transactions` VALUES ('624', '144', '2.00', '1299.99382', '1450.00', '125', '187', 'SLS', 'OUT', '1', '2024-02-05 17:22:56', '2024-02-05 17:23:49');
INSERT INTO `tbl_product_transactions` VALUES ('625', '383', '2.00', '55.20000', '58.00', '126', '188', 'SLS', 'OUT', '1', '2024-02-05 17:29:04', '2024-02-05 17:29:21');
INSERT INTO `tbl_product_transactions` VALUES ('626', '35', '1.00', '201.86682', '320.00', '127', '189', 'SLS', 'OUT', '1', '2024-02-05 17:36:42', '2024-02-05 17:36:51');
INSERT INTO `tbl_product_transactions` VALUES ('627', '407', '2.00', '1910.00000', '1980.00', '128', '190', 'SLS', 'OUT', '1', '2024-02-05 17:47:52', '2024-02-05 17:49:32');
INSERT INTO `tbl_product_transactions` VALUES ('628', '25', '17.00', '636.21000', '700.00', '58', '280', 'IA', 'IN', '1', '2024-02-06 06:15:36', '2024-02-06 06:15:48');
INSERT INTO `tbl_product_transactions` VALUES ('629', '29', '9.00', '1376.79000', '1450.00', '58', '281', 'IA', 'IN', '1', '2024-02-06 06:15:45', '2024-02-06 06:15:48');
INSERT INTO `tbl_product_transactions` VALUES ('630', '441', '1.00', '53.60000', '60.00', '129', '191', 'SLS', 'OUT', '1', '2024-02-06 07:04:55', '2024-02-06 07:05:38');
INSERT INTO `tbl_product_transactions` VALUES ('631', '439', '1.00', '40.90000', '44.00', '130', '192', 'SLS', 'OUT', '1', '2024-02-06 07:10:49', '2024-02-06 07:10:52');
INSERT INTO `tbl_product_transactions` VALUES ('632', '147', '3.00', '2700.00000', '2800.00', '131', '193', 'SLS', 'OUT', '1', '2024-02-06 07:22:35', '2024-02-06 07:23:32');
INSERT INTO `tbl_product_transactions` VALUES ('633', '483', '1.00', '73.00000', '85.00', '132', '194', 'SLS', 'OUT', '1', '2024-02-06 08:02:01', '2024-02-06 08:02:23');
INSERT INTO `tbl_product_transactions` VALUES ('634', '526', '2.00', '8.73000', '10.00', '132', '195', 'SLS', 'OUT', '1', '2024-02-06 08:02:17', '2024-02-06 08:02:23');
INSERT INTO `tbl_product_transactions` VALUES ('635', '13', '4.00', '5414.34000', '5600.00', '59', '282', 'IA', 'OUT', '1', '2024-02-06 09:50:56', '2024-02-06 09:50:59');
INSERT INTO `tbl_product_transactions` VALUES ('636', '19', '10.00', '1257.28000', '1330.00', '60', '283', 'IA', 'OUT', '1', '2024-02-06 10:02:43', '2024-02-06 10:02:45');
INSERT INTO `tbl_product_transactions` VALUES ('637', '25', '517.00', '636.21000', '700.00', '61', '284', 'IA', 'OUT', '1', '2024-02-06 10:04:47', '2024-02-06 10:04:49');
INSERT INTO `tbl_product_transactions` VALUES ('638', '25', '4.00', '640.00000', '640.00', '18', '61', 'PO', 'IN', '1', '2024-02-06 10:05:59', '2024-02-06 10:06:17');
INSERT INTO `tbl_product_transactions` VALUES ('639', '29', '2.00', '1380.00000', '1380.00', '18', '62', 'PO', 'IN', '1', '2024-02-06 10:06:10', '2024-02-06 10:06:17');
INSERT INTO `tbl_product_transactions` VALUES ('640', '25', '4.00', '640.00000', '640.00', '19', '63', 'PO', 'IN', '1', '2024-02-06 11:06:32', '2024-02-06 11:06:47');
INSERT INTO `tbl_product_transactions` VALUES ('641', '29', '2.00', '1350.00000', '1350.00', '19', '64', 'PO', 'IN', '1', '2024-02-06 11:06:40', '2024-02-06 11:06:47');
INSERT INTO `tbl_product_transactions` VALUES ('642', '29', '5.00', '1350.00000', '1350.00', '20', '65', 'PO', 'IN', '1', '2024-02-06 11:07:13', '2024-02-06 11:07:26');
INSERT INTO `tbl_product_transactions` VALUES ('643', '25', '8.00', '680.00000', '680.00', '20', '66', 'PO', 'IN', '1', '2024-02-06 11:07:23', '2024-02-06 11:07:26');
INSERT INTO `tbl_product_transactions` VALUES ('646', '25', '4.00', '660.00000', '700.00', '121', '198', 'SLS', 'OUT', '1', '2024-02-06 11:34:40', '2024-02-06 11:38:07');
INSERT INTO `tbl_product_transactions` VALUES ('647', '29', '2.00', '1366.72864', '1450.00', '121', '199', 'SLS', 'OUT', '1', '2024-02-06 11:34:49', '2024-02-06 11:38:07');
INSERT INTO `tbl_product_transactions` VALUES ('648', '29', '5.00', '1366.72864', '1450.00', '134', '200', 'SLS', 'OUT', '1', '2024-02-06 11:38:46', '2024-02-06 11:43:46');
INSERT INTO `tbl_product_transactions` VALUES ('649', '25', '8.00', '660.00000', '700.00', '134', '201', 'SLS', 'OUT', '1', '2024-02-06 11:38:55', '2024-02-06 11:43:46');
INSERT INTO `tbl_product_transactions` VALUES ('650', '29', '2.00', '1366.72864', '1450.00', '135', '202', 'SLS', 'OUT', '1', '2024-02-06 11:44:01', '2024-02-06 12:12:53');
INSERT INTO `tbl_product_transactions` VALUES ('651', '25', '5.00', '660.00000', '700.00', '135', '203', 'SLS', 'OUT', '1', '2024-02-06 11:44:22', '2024-02-06 12:12:53');
INSERT INTO `tbl_product_transactions` VALUES ('652', '29', '2.00', '1350.00000', '1350.00', '21', '67', 'PO', 'IN', '1', '2024-02-06 11:48:14', '2024-02-06 11:48:28');
INSERT INTO `tbl_product_transactions` VALUES ('653', '25', '5.00', '640.00000', '640.00', '21', '68', 'PO', 'IN', '1', '2024-02-06 11:48:26', '2024-02-06 11:48:28');
INSERT INTO `tbl_product_transactions` VALUES ('655', '575', '5.00', '5200.00000', '5200.00', '22', '69', 'PO', 'IN', '1', '2024-02-06 11:55:12', '2024-02-06 11:55:14');
INSERT INTO `tbl_product_transactions` VALUES ('656', '575', '3.00', '5200.00000', '5800.00', '136', '205', 'SLS', 'OUT', '1', '2024-02-06 12:08:36', '2024-02-06 12:09:25');
INSERT INTO `tbl_product_transactions` VALUES ('657', '19', '9.00', '1257.28190', '1330.00', '137', '206', 'SLS', 'OUT', '0', '2024-02-06 12:27:43', '2024-02-06 12:27:46');
INSERT INTO `tbl_product_transactions` VALUES ('658', '28', '4.00', '1339.47795', '1480.00', '137', '207', 'SLS', 'OUT', '0', '2024-02-06 12:27:55', '2024-02-06 12:27:57');
INSERT INTO `tbl_product_transactions` VALUES ('659', '24', '4.00', '651.01753', '730.00', '137', '208', 'SLS', 'OUT', '0', '2024-02-06 12:28:03', '2024-02-06 12:28:06');
INSERT INTO `tbl_product_transactions` VALUES ('660', '177', '2.00', '11.80000', '13.00', '138', '209', 'SLS', 'OUT', '1', '2024-02-06 12:30:50', '2024-02-06 12:30:57');
INSERT INTO `tbl_product_transactions` VALUES ('661', '144', '1.00', '1299.99382', '1450.00', '139', '210', 'SLS', 'OUT', '1', '2024-02-06 12:37:32', '2024-02-06 12:37:56');
INSERT INTO `tbl_product_transactions` VALUES ('662', '496', '12.00', '560.00000', '560.00', '23', '70', 'PO', 'IN', '1', '2024-02-06 13:07:59', '2024-02-06 13:08:03');
INSERT INTO `tbl_product_transactions` VALUES ('663', '512', '5.00', '500.00000', '500.00', '24', '71', 'PO', 'IN', '1', '2024-02-06 13:09:00', '2024-02-06 13:09:03');
INSERT INTO `tbl_product_transactions` VALUES ('664', '433', '1.00', '34.84000', '36.00', '140', '211', 'SLS', 'OUT', '1', '2024-02-06 13:24:47', '2024-02-06 13:25:47');
INSERT INTO `tbl_product_transactions` VALUES ('665', '432', '1.00', '38.40000', '40.00', '140', '212', 'SLS', 'OUT', '1', '2024-02-06 13:25:21', '2024-02-06 13:25:47');
INSERT INTO `tbl_product_transactions` VALUES ('666', '61', '2.00', '1032.85714', '1150.00', '141', '213', 'SLS', 'OUT', '1', '2024-02-06 13:40:17', '2024-02-06 13:47:34');
INSERT INTO `tbl_product_transactions` VALUES ('667', '19', '4.00', '1257.28190', '1330.00', '141', '214', 'SLS', 'OUT', '1', '2024-02-06 13:42:35', '2024-02-06 13:47:34');
INSERT INTO `tbl_product_transactions` VALUES ('668', '162', '1.00', '834.41290', '1000.00', '141', '215', 'SLS', 'OUT', '1', '2024-02-06 13:43:51', '2024-02-06 13:47:34');
INSERT INTO `tbl_product_transactions` VALUES ('669', '29', '9.00', '1364.16000', '1450.00', '62', '285', 'IA', 'OUT', '1', '2024-02-06 14:01:44', '2024-02-06 14:01:45');
INSERT INTO `tbl_product_transactions` VALUES ('670', '29', '2.00', '1364.16000', '1450.00', '63', '286', 'IA', 'OUT', '1', '2024-02-06 14:03:00', '2024-02-06 14:03:02');
INSERT INTO `tbl_product_transactions` VALUES ('671', '36', '36.00', '89.11000', '150.00', '12', '41', 'PC', 'OUT', '1', '2024-02-06 14:14:46', '2024-02-06 14:15:07');
INSERT INTO `tbl_product_transactions` VALUES ('672', '253', '36.00', '89.11000', '100.00', '12', '41', 'PC', 'IN', '1', '2024-02-06 14:14:46', '2024-02-06 14:15:07');
INSERT INTO `tbl_product_transactions` VALUES ('673', '253', '36.00', '89.11000', '100.00', '64', '287', 'IA', 'OUT', '1', '2024-02-06 14:15:58', '2024-02-06 14:16:00');
INSERT INTO `tbl_product_transactions` VALUES ('674', '57', '4.00', '360.00000', '900.00', '13', '42', 'PC', 'OUT', '1', '2024-02-06 14:26:41', '2024-02-06 14:26:45');
INSERT INTO `tbl_product_transactions` VALUES ('675', '58', '4.00', '360.00000', '400.00', '13', '42', 'PC', 'IN', '1', '2024-02-06 14:26:41', '2024-02-06 14:26:45');
INSERT INTO `tbl_product_transactions` VALUES ('676', '79', '1.00', '250.00000', '320.00', '14', '43', 'PC', 'OUT', '1', '2024-02-06 14:30:10', '2024-02-06 14:30:12');
INSERT INTO `tbl_product_transactions` VALUES ('677', '78', '1.00', '250.00000', '320.00', '14', '43', 'PC', 'IN', '1', '2024-02-06 14:30:10', '2024-02-06 14:30:12');
INSERT INTO `tbl_product_transactions` VALUES ('679', '80', '4.00', '370.27000', '650.00', '15', '44', 'PC', 'OUT', '1', '2024-02-06 14:33:57', '2024-02-06 14:34:07');
INSERT INTO `tbl_product_transactions` VALUES ('680', '81', '4.00', '370.27000', '220.00', '15', '44', 'PC', 'IN', '1', '2024-02-06 14:33:57', '2024-02-06 14:34:07');
INSERT INTO `tbl_product_transactions` VALUES ('681', '78', '1.00', '250.00000', '320.00', '16', '45', 'PC', 'OUT', '1', '2024-02-06 14:48:59', '2024-02-06 14:49:01');
INSERT INTO `tbl_product_transactions` VALUES ('682', '79', '1.00', '250.00000', '320.00', '16', '45', 'PC', 'IN', '1', '2024-02-06 14:48:59', '2024-02-06 14:49:01');
INSERT INTO `tbl_product_transactions` VALUES ('683', '143', '16.00', '186.67000', '250.00', '66', '289', 'IA', 'OUT', '1', '2024-02-06 14:52:03', '2024-02-06 14:52:05');
INSERT INTO `tbl_product_transactions` VALUES ('684', '143', '1.00', '186.66667', '250.00', '142', '216', 'SLS', 'OUT', '1', '2024-02-06 15:02:21', '2024-02-06 15:02:38');
INSERT INTO `tbl_product_transactions` VALUES ('686', '65', '5.00', '360.00000', '400.00', '143', '218', 'SLS', 'OUT', '1', '2024-02-06 15:27:55', '2024-02-06 15:36:39');
INSERT INTO `tbl_product_transactions` VALUES ('687', '30', '2.00', '375.00000', '650.00', '143', '219', 'SLS', 'OUT', '1', '2024-02-06 15:29:15', '2024-02-06 15:36:39');
INSERT INTO `tbl_product_transactions` VALUES ('688', '644', '2.00', '1296.42857', '1270.00', '143', '220', 'SLS', 'OUT', '1', '2024-02-06 15:35:38', '2024-02-06 15:36:39');
INSERT INTO `tbl_product_transactions` VALUES ('689', '156', '2.00', '1297.76599', '1400.00', '144', '221', 'SLS', 'OUT', '1', '2024-02-06 15:37:35', '2024-02-06 15:38:31');
INSERT INTO `tbl_product_transactions` VALUES ('690', '394', '1.00', '1605.83333', '1676.00', '145', '222', 'SLS', 'OUT', '1', '2024-02-06 15:43:52', '2024-02-06 15:44:26');
INSERT INTO `tbl_product_transactions` VALUES ('691', '554', '2.00', '51.86000', '52.00', '146', '223', 'SLS', 'OUT', '1', '2024-02-06 15:49:13', '2024-02-06 15:50:13');
INSERT INTO `tbl_product_transactions` VALUES ('693', '434', '1.28', '36.76000', '39.00', '147', '225', 'SLS', 'OUT', '1', '2024-02-06 15:53:10', '2024-02-06 15:54:01');
INSERT INTO `tbl_product_transactions` VALUES ('694', '554', '4.00', '51.86000', '52.00', '148', '226', 'SLS', 'OUT', '1', '2024-02-06 15:58:01', '2024-02-06 15:58:07');
INSERT INTO `tbl_product_transactions` VALUES ('696', '541', '5.00', '48.40000', '53.00', '149', '228', 'SLS', 'OUT', '1', '2024-02-06 16:36:45', '2024-02-06 16:37:48');
INSERT INTO `tbl_product_transactions` VALUES ('697', '439', '6.00', '40.90000', '44.00', '150', '229', 'SLS', 'OUT', '1', '2024-02-06 16:41:53', '2024-02-06 16:42:43');
INSERT INTO `tbl_product_transactions` VALUES ('698', '654', '1.00', '60.00000', '85.00', '150', '230', 'SLS', 'OUT', '1', '2024-02-06 16:42:12', '2024-02-06 16:42:43');
INSERT INTO `tbl_product_transactions` VALUES ('699', '160', '10.00', '110.00000', '110.00', '25', '72', 'PO', 'IN', '1', '2024-02-06 17:38:54', '2024-02-06 18:20:25');
INSERT INTO `tbl_product_transactions` VALUES ('700', '85', '2.00', '650.00000', '650.00', '25', '73', 'PO', 'IN', '1', '2024-02-06 17:40:29', '2024-02-06 18:20:25');
INSERT INTO `tbl_product_transactions` VALUES ('701', '612', '6.00', '70.00000', '70.00', '25', '74', 'PO', 'IN', '1', '2024-02-06 17:40:51', '2024-02-06 18:20:25');
INSERT INTO `tbl_product_transactions` VALUES ('702', '298', '49.00', '20.00000', '20.00', '25', '75', 'PO', 'IN', '1', '2024-02-06 17:41:07', '2024-02-06 18:20:25');
INSERT INTO `tbl_product_transactions` VALUES ('703', '372', '46.50', '10.00000', '10.00', '25', '76', 'PO', 'IN', '1', '2024-02-06 17:41:32', '2024-02-06 18:20:25');
INSERT INTO `tbl_product_transactions` VALUES ('704', '175', '33.00', '110.00000', '110.00', '25', '77', 'PO', 'IN', '1', '2024-02-06 17:42:07', '2024-02-06 18:20:25');
INSERT INTO `tbl_product_transactions` VALUES ('705', '360', '10.00', '5100.00000', '5100.00', '26', '78', 'PO', 'IN', '1', '2024-02-06 17:50:26', '2024-02-06 17:53:11');
INSERT INTO `tbl_product_transactions` VALUES ('706', '561', '12.00', '930.00000', '930.00', '26', '79', 'PO', 'IN', '1', '2024-02-06 17:51:04', '2024-02-06 17:53:11');
INSERT INTO `tbl_product_transactions` VALUES ('707', '92', '12.00', '930.00000', '930.00', '26', '80', 'PO', 'IN', '1', '2024-02-06 17:51:21', '2024-02-06 17:53:11');
INSERT INTO `tbl_product_transactions` VALUES ('708', '670', '3.00', '2000.00000', '2000.00', '26', '81', 'PO', 'IN', '1', '2024-02-06 17:51:35', '2024-02-06 17:53:11');
INSERT INTO `tbl_product_transactions` VALUES ('709', '672', '3.00', '535.00000', '535.00', '26', '82', 'PO', 'IN', '1', '2024-02-06 17:52:03', '2024-02-06 17:53:11');
INSERT INTO `tbl_product_transactions` VALUES ('710', '76', '6.00', '1170.00000', '1170.00', '26', '83', 'PO', 'IN', '1', '2024-02-06 17:52:29', '2024-02-06 17:53:11');
INSERT INTO `tbl_product_transactions` VALUES ('711', '671', '3.00', '1010.00000', '1010.00', '26', '84', 'PO', 'IN', '1', '2024-02-06 17:53:02', '2024-02-06 17:53:11');
INSERT INTO `tbl_product_transactions` VALUES ('712', '444', '1.00', '33.86000', '36.00', '151', '231', 'SLS', 'OUT', '1', '2024-02-06 17:54:18', '2024-02-06 17:55:08');
INSERT INTO `tbl_product_transactions` VALUES ('713', '481', '1.00', '50.00016', '53.00', '151', '232', 'SLS', 'OUT', '1', '2024-02-06 17:54:23', '2024-02-06 17:55:08');
INSERT INTO `tbl_product_transactions` VALUES ('715', '429', '4.00', '37.80000', '40.00', '151', '234', 'SLS', 'OUT', '1', '2024-02-06 17:54:57', '2024-02-06 17:55:08');
INSERT INTO `tbl_product_transactions` VALUES ('717', '541', '5.00', '48.40000', '53.00', '152', '236', 'SLS', 'OUT', '1', '2024-02-06 17:56:11', '2024-02-06 17:56:24');
INSERT INTO `tbl_product_transactions` VALUES ('718', '310', '6.00', '110.00000', '110.00', '25', '85', 'PO', 'IN', '1', '2024-02-06 18:04:53', '2024-02-06 18:20:25');
INSERT INTO `tbl_product_transactions` VALUES ('719', '292', '3.00', '510.00000', '510.00', '25', '86', 'PO', 'IN', '1', '2024-02-06 18:06:15', '2024-02-06 18:20:25');

CREATE TABLE `tbl_products` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_code` varchar(100) NOT NULL,
  `product_barcode` varchar(50) NOT NULL,
  `product_name` varchar(75) NOT NULL,
  `product_price` decimal(11,2) NOT NULL,
  `product_cost` decimal(12,5) NOT NULL,
  `product_img` text NOT NULL,
  `product_category_id` int(11) NOT NULL,
  `is_package` int(1) NOT NULL,
  `remarks` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_last_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=674 DEFAULT CHARSET=latin1;
INSERT INTO `tbl_products` VALUES ('2', '2002', '2002', 'Bioseed-101', '4450.00', '4245.45455', '', '1', '0', '', '2022-11-15 11:40:35', '2024-01-25 20:02:29');
INSERT INTO `tbl_products` VALUES ('3', '2003', '2003', 'Bioseed-9541', '2400.00', '2276.17111', '', '1', '0', '', '2022-11-15 11:41:04', '2024-01-26 14:40:56');
INSERT INTO `tbl_products` VALUES ('4', '2001', '2001', 'Bioseed-Hi-Fly', '3800.00', '3700.00000', '', '1', '0', '', '2022-11-15 13:41:42', '2023-10-18 14:27:20');
INSERT INTO `tbl_products` VALUES ('5', '2005', '2005', 'D-8131s', '6000.00', '5754.01495', '', '1', '0', '', '2022-11-15 13:42:08', '2023-08-25 07:21:07');
INSERT INTO `tbl_products` VALUES ('6', '2006', '2006', 'D-8899s', '5350.00', '4809.78261', '', '1', '0', '', '2022-11-15 13:42:27', '2023-07-25 05:50:32');
INSERT INTO `tbl_products` VALUES ('7', '2007', '2007', 'Evo-709', '2400.00', '2300.09276', '', '1', '0', '', '2022-11-15 13:42:57', '2024-02-05 09:07:33');
INSERT INTO `tbl_products` VALUES ('8', '2008', '2008', 'Evo-9989', '3500.00', '3188.88889', '', '1', '0', '', '2022-11-15 14:51:23', '2023-07-13 12:31:18');
INSERT INTO `tbl_products` VALUES ('9', '2009', '2009', 'NK 306', '5100.00', '0.00000', '', '1', '0', '', '2022-11-15 14:51:56', '2022-11-15 14:51:56');
INSERT INTO `tbl_products` VALUES ('10', '2010', '2010', 'NK 6505', '5400.00', '5389.31120', '', '1', '0', '', '2022-11-15 14:52:10', '2024-02-05 09:05:18');
INSERT INTO `tbl_products` VALUES ('11', '2011', '2011', 'NK 6410', '4500.00', '4398.80174', '', '1', '0', '', '2022-11-15 14:52:27', '2023-10-23 15:38:21');
INSERT INTO `tbl_products` VALUES ('12', '2012', '2012', 'P 3530', '4200.00', '3900.00000', '', '1', '0', '', '2022-11-15 14:52:52', '2023-02-24 17:31:19');
INSERT INTO `tbl_products` VALUES ('13', '2013', '2013', 'P 3645', '5600.00', '5414.34133', '', '1', '0', '', '2022-11-15 14:54:40', '2024-02-05 09:06:40');
INSERT INTO `tbl_products` VALUES ('14', '2014', '2014', 'P 4124', '5000.00', '4700.00000', '', '1', '0', '', '2022-11-15 14:54:55', '2024-01-27 08:11:58');
INSERT INTO `tbl_products` VALUES ('15', '3001', '3001', '0060-Amigo', '1950.00', '1870.14615', '', '2', '0', '', '2022-11-15 14:55:31', '2024-01-28 11:03:53');
INSERT INTO `tbl_products` VALUES ('16', '3002', '3002', '0060-Atlas', '1950.00', '1870.47312', '', '2', '0', '', '2022-11-15 15:00:00', '2024-02-04 09:01:50');
INSERT INTO `tbl_products` VALUES ('17', '3003', '3003', '141414-Amigo', '1530.00', '1460.00000', '', '2', '0', '', '2022-11-15 15:00:26', '2023-09-30 12:03:29');
INSERT INTO `tbl_products` VALUES ('18', '3004', '3004', '141414-Atlas', '1480.00', '1389.06857', '', '2', '0', '', '2022-11-15 15:00:44', '2024-02-04 09:01:50');
INSERT INTO `tbl_products` VALUES ('19', '3005', '3005', '16200-Atlas', '1330.00', '1257.28190', '', '2', '0', '', '2022-11-15 15:01:02', '2024-02-04 09:01:50');
INSERT INTO `tbl_products` VALUES ('20', '3006', '3006', '16200-Amigo', '1430.00', '1348.67547', '', '2', '0', '', '2022-11-15 15:01:22', '2023-10-19 11:10:35');
INSERT INTO `tbl_products` VALUES ('21', '3007', '3007', '16200-Harvester', '1320.00', '1261.29396', '', '2', '0', '', '2022-11-15 15:01:41', '2024-01-28 11:02:01');
INSERT INTO `tbl_products` VALUES ('22', '3008', '3008', '18460-Amigo', '2650.00', '2450.26474', '', '2', '0', '', '2022-11-15 15:10:03', '2024-02-04 09:01:50');
INSERT INTO `tbl_products` VALUES ('23', '3009', '3009', '2100-Amigo', '700.00', '649.98942', '', '2', '0', '', '2022-11-15 15:11:03', '2023-09-12 13:04:32');
INSERT INTO `tbl_products` VALUES ('24', '3010', '3010', '2100-Atlas', '730.00', '651.01753', '', '2', '0', '', '2022-11-15 15:11:23', '2024-02-04 09:01:50');
INSERT INTO `tbl_products` VALUES ('25', '3011', '3011', '2100-Harvester', '700.00', '648.88889', '', '2', '0', '', '2022-11-15 15:12:43', '2024-02-06 11:48:28');
INSERT INTO `tbl_products` VALUES ('26', '3012', '3012', '25000-Shield ', '1150.00', '1100.00000', '', '2', '0', '', '2022-11-15 15:13:20', '2023-07-09 17:57:14');
INSERT INTO `tbl_products` VALUES ('27', '3013', '3013', '4600-Amigo', '1620.00', '1560.56604', '', '2', '0', '', '2022-11-15 15:14:07', '2023-10-23 13:25:29');
INSERT INTO `tbl_products` VALUES ('28', '3014', '3014', '4600-Atlas', '1480.00', '1339.47795', '', '2', '0', '', '2022-11-15 15:14:29', '2024-02-05 08:48:30');
INSERT INTO `tbl_products` VALUES ('29', '3015', '3015', '4600-Harvester', '1450.00', '1364.15500', '', '2', '0', '', '2022-11-15 15:14:51', '2024-02-06 11:48:28');
INSERT INTO `tbl_products` VALUES ('30', '1001', '1001', '24D-Amine -Gallon', '650.00', '375.00000', '', '3', '0', '', '2022-11-15 15:55:08', '2024-01-29 12:09:27');
INSERT INTO `tbl_products` VALUES ('31', '1002', '1002', '24D-Amine -Liter', '270.00', '154.15284', '', '3', '0', '', '2022-11-15 15:56:18', '2024-01-25 08:43:36');
INSERT INTO `tbl_products` VALUES ('35', '1006', '1006', '24D-Ester -Liter ', '320.00', '201.86682', '', '3', '0', '', '2022-11-15 16:25:05', '2024-01-28 07:31:07');
INSERT INTO `tbl_products` VALUES ('36', '1007', '1007', '24D Ester- 250ml', '150.00', '89.11000', '', '3', '0', '', '2022-11-15 16:26:36', '2024-02-04 11:31:20');
INSERT INTO `tbl_products` VALUES ('39', '1010', '1010', 'advance-500ml', '580.00', '384.90724', '', '3', '0', '', '2022-11-15 16:33:53', '2023-11-27 13:44:49');
INSERT INTO `tbl_products` VALUES ('40', '1011', '1011', 'advance-liter', '850.00', '760.00000', '', '3', '0', '', '2022-11-15 16:34:32', '2024-02-04 13:43:28');
INSERT INTO `tbl_products` VALUES ('41', '1012', '1012', 'agrowell- liter', '320.00', '250.00000', '', '3', '0', '', '2022-11-15 16:35:30', '2023-06-05 14:15:28');
INSERT INTO `tbl_products` VALUES ('42', '1013', '1013', 'akmethryn-liter', '380.00', '320.00000', '', '3', '0', '', '2022-11-15 16:36:24', '2022-11-16 19:53:57');
INSERT INTO `tbl_products` VALUES ('43', '1014', '1014', 'alecta-gallon', '1200.00', '818.18182', '', '3', '0', '', '2022-11-15 16:37:12', '2024-01-29 11:20:48');
INSERT INTO `tbl_products` VALUES ('44', '1015', '1015', 'alecta-liter', '400.00', '270.91475', '', '3', '0', '', '2022-11-15 16:38:17', '2024-01-28 13:08:13');
INSERT INTO `tbl_products` VALUES ('45', '1016', '1016', 'alga 300++-liter', '750.00', '581.53846', '', '3', '0', '', '2022-11-15 16:39:31', '2023-01-03 14:47:16');
INSERT INTO `tbl_products` VALUES ('46', '1017', '1017', 'almix-pack', '45.00', '69.13394', '', '3', '0', '', '2022-11-15 16:40:44', '2024-01-29 17:42:05');
INSERT INTO `tbl_products` VALUES ('47', '1018', '1018', 'astron-pack 100grams.', '320.00', '0.00000', '', '3', '0', '', '2022-11-15 16:42:07', '2022-11-15 16:42:07');
INSERT INTO `tbl_products` VALUES ('48', '1019', '1019', 'atonik-pack', '45.00', '25.00000', '', '3', '0', '', '2022-11-15 16:43:05', '2022-11-16 19:57:25');
INSERT INTO `tbl_products` VALUES ('49', '1020', '1020', 'basagran-liter', '1100.00', '1030.00000', '', '3', '0', '', '2022-11-15 16:44:01', '2023-11-28 14:35:11');
INSERT INTO `tbl_products` VALUES ('50', '1021', '1021', 'basagran-500ml.', '570.00', '470.00000', '', '3', '0', '', '2022-11-15 16:45:20', '2023-09-21 08:08:36');
INSERT INTO `tbl_products` VALUES ('51', '1022', '1022', 'bayluscide-liter', '1150.00', '1080.00000', '', '3', '0', '', '2022-11-15 16:46:08', '2023-03-09 13:33:02');
INSERT INTO `tbl_products` VALUES ('52', '1023', '1023', 'bayluscide-pack (35grams.)', '120.00', '90.00000', '', '3', '0', '', '2022-11-15 16:47:24', '2023-09-18 16:30:15');
INSERT INTO `tbl_products` VALUES ('53', '1024', '1024', 'bio480-gallon', '1300.00', '1100.00000', '', '3', '0', '', '2022-11-15 16:48:12', '2024-01-12 16:06:22');
INSERT INTO `tbl_products` VALUES ('54', '1025', '1025', 'bio480-liter', '450.00', '388.57143', '', '3', '0', '', '2022-11-15 16:48:46', '2023-01-04 15:52:51');
INSERT INTO `tbl_products` VALUES ('55', '1026', '1026', 'bounty grow-liter', '220.00', '175.00000', '', '3', '0', '', '2022-11-15 17:33:07', '2022-11-16 20:04:07');
INSERT INTO `tbl_products` VALUES ('56', '1027', '1027', 'Bounty Grow- Gallon ', '750.00', '403.85000', '', '3', '0', '', '2022-11-15 17:34:41', '2023-11-06 06:47:26');
INSERT INTO `tbl_products` VALUES ('57', '1028', '1028', 'Bulldock-liter', '900.00', '360.00000', '', '3', '0', '', '2022-11-15 17:35:44', '2023-10-16 18:07:52');
INSERT INTO `tbl_products` VALUES ('58', '1029', '1029', 'Bullseye-liter', '400.00', '360.00000', '', '3', '0', '', '2022-11-15 17:37:21', '2023-11-27 13:44:49');
INSERT INTO `tbl_products` VALUES ('59', '1030', '1030', 'Bushwack-liter', '400.00', '335.00000', '', '3', '0', '', '2022-11-15 17:38:38', '2024-01-12 06:00:42');
INSERT INTO `tbl_products` VALUES ('60', '1031', '1031', 'Bushwack 500ml', '250.00', '195.00000', '', '3', '0', '', '2022-11-15 17:39:35', '2023-07-07 18:45:12');
INSERT INTO `tbl_products` VALUES ('61', '1032', '1032', 'Cabrio 250ml', '1150.00', '1032.85714', '', '3', '0', '', '2022-11-15 17:40:35', '2024-01-24 13:10:23');
INSERT INTO `tbl_products` VALUES ('62', '1033', '1033', 'Caligro-liter', '150.00', '101.11500', '', '3', '0', '', '2022-11-15 17:41:41', '2023-04-19 11:10:35');
INSERT INTO `tbl_products` VALUES ('63', '1034', '1034', 'Caligro- Gallon', '500.00', '320.55421', '', '3', '0', '', '2022-11-15 17:42:22', '2023-04-19 11:10:35');
INSERT INTO `tbl_products` VALUES ('64', '1035', '1035', 'Canon- Pack', '80.00', '55.00000', '', '3', '0', '', '2022-11-15 17:43:04', '2023-10-10 12:04:38');
INSERT INTO `tbl_products` VALUES ('65', '1036', '1036', 'Chess-Pack', '400.00', '360.00000', '', '3', '0', '', '2022-11-15 17:43:50', '2023-10-31 10:49:04');
INSERT INTO `tbl_products` VALUES ('66', '1037', '1037', 'Chix 500ml', '400.00', '370.00000', '', '3', '0', '', '2022-11-15 17:44:49', '2022-11-16 20:17:05');
INSERT INTO `tbl_products` VALUES ('67', '1038', '1038', 'Chix- Liter', '850.00', '785.00000', '', '3', '0', '', '2022-11-15 17:45:32', '2023-05-27 14:59:20');
INSERT INTO `tbl_products` VALUES ('68', '1039', '1039', 'Choice 250ml', '1000.00', '835.00000', '', '3', '0', '', '2022-11-15 17:46:38', '2023-12-01 11:15:49');
INSERT INTO `tbl_products` VALUES ('69', '1040', '1040', 'Clear Max 1.5L', '800.00', '1189.85294', '', '3', '0', '', '2022-11-15 17:47:32', '2023-01-18 17:48:37');
INSERT INTO `tbl_products` VALUES ('70', '1041', '1041', 'Clear Max-3L', '1570.00', '1500.00000', '', '3', '0', '', '2022-11-15 17:48:36', '2023-10-09 12:36:52');
INSERT INTO `tbl_products` VALUES ('71', '1042', '1042', 'Clear out 4L', '1300.00', '1124.38661', '', '3', '0', '', '2022-11-15 17:49:23', '2024-01-28 07:31:06');
INSERT INTO `tbl_products` VALUES ('72', '1043', '1043', 'Clear out -liter', '400.00', '340.00000', '', '3', '0', '', '2022-11-15 17:50:10', '2024-02-04 13:43:28');
INSERT INTO `tbl_products` VALUES ('73', '1044', '1044', 'Clear out 5L', '1650.00', '37.05768', '', '3', '0', '', '2022-11-15 17:50:53', '2024-01-08 06:55:57');
INSERT INTO `tbl_products` VALUES ('74', '1045', '1045', 'Clincher-liter', '1700.00', '1554.57627', '', '3', '0', '', '2022-11-15 17:51:43', '2023-06-10 12:04:34');
INSERT INTO `tbl_products` VALUES ('75', '1046', '1046', 'Clincher 500ml', '920.00', '854.94125', '', '3', '0', '', '2022-11-15 17:54:15', '2023-05-10 12:56:07');
INSERT INTO `tbl_products` VALUES ('76', '1047', '1047', 'Core 500ml', '1600.00', '1170.00000', '', '3', '0', '', '2022-11-15 17:56:17', '2024-02-06 17:53:11');
INSERT INTO `tbl_products` VALUES ('77', '1048', '1048', 'Core 250ml', '750.00', '700.00000', '', '3', '0', '', '2022-11-15 17:57:04', '2022-11-16 20:24:15');
INSERT INTO `tbl_products` VALUES ('78', '1049', '1049', 'Crop Giant (Orange)', '320.00', '250.00000', '', '3', '0', '', '2022-11-15 17:58:57', '2023-07-17 14:20:43');
INSERT INTO `tbl_products` VALUES ('79', '1050', '1050', 'Crop Giant (Yellow)', '320.00', '250.00000', '', '3', '0', '', '2022-11-15 18:00:12', '2024-01-04 20:31:46');
INSERT INTO `tbl_products` VALUES ('80', '1051', '1051', 'Crop Gold- Gallon', '650.00', '370.27386', '', '3', '0', '', '2022-11-15 18:01:08', '2024-02-04 11:44:41');
INSERT INTO `tbl_products` VALUES ('81', '1052', '1052', 'Crop Gold-liter', '220.00', '370.27000', '', '3', '0', '', '2022-11-15 18:01:55', '2024-02-06 14:34:07');
INSERT INTO `tbl_products` VALUES ('82', '1053', '1053', 'Cymbush- liter', '550.00', '440.00000', '', '3', '0', '', '2022-11-15 18:03:33', '2024-01-24 13:10:23');
INSERT INTO `tbl_products` VALUES ('83', '1054', '1054', 'Demolition- Gallon', '1300.00', '360.64467', '', '3', '0', '', '2022-11-15 18:04:27', '2024-01-22 14:56:21');
INSERT INTO `tbl_products` VALUES ('84', '1055', '1055', 'Devast-liter', '400.00', '330.00000', '', '3', '0', '', '2022-11-15 18:05:09', '2022-11-16 20:39:24');
INSERT INTO `tbl_products` VALUES ('85', '1056', '1056', 'Dithane-kilo', '700.00', '650.00000', '', '3', '0', '', '2022-11-15 18:06:11', '2024-02-06 18:20:25');
INSERT INTO `tbl_products` VALUES ('86', '1057', '1057', 'Dithane-250g.', '300.00', '240.00000', '', '3', '0', '', '2022-11-15 18:07:04', '2023-11-27 09:32:18');
INSERT INTO `tbl_products` VALUES ('87', '1058', '1058', 'Dragon Humus-pack', '180.00', '121.58949', '', '3', '0', '', '2022-11-15 18:07:49', '2023-11-16 06:40:01');
INSERT INTO `tbl_products` VALUES ('88', '1059', '1059', 'Firestorm- Gallon', '2500.00', '2000.00000', '', '3', '0', '', '2022-11-15 18:08:55', '2023-11-13 16:32:15');
INSERT INTO `tbl_products` VALUES ('89', '1060', '1060', 'Firestorm- liter', '750.00', '550.00000', '', '3', '0', '', '2022-11-15 18:09:40', '2024-02-04 11:31:20');
INSERT INTO `tbl_products` VALUES ('90', '1061', '1061', 'Frontier- liter', '1680.00', '1516.15385', '', '3', '0', '', '2022-11-15 18:10:32', '2023-11-27 09:56:51');
INSERT INTO `tbl_products` VALUES ('91', '1062', '1062', 'Gaucho 100ml', '490.00', '456.49720', '', '3', '0', '', '2022-11-15 18:11:13', '2024-01-24 13:13:39');
INSERT INTO `tbl_products` VALUES ('92', '1063', '1063', 'Glyner-Gallon', '1080.00', '783.90976', '', '3', '0', '', '2022-11-15 18:12:05', '2024-02-06 17:53:11');
INSERT INTO `tbl_products` VALUES ('93', '1064', '1064', 'Glysinate 15sl- liter', '720.00', '610.00000', '', '3', '0', '', '2022-11-15 18:13:03', '2024-01-03 10:07:17');
INSERT INTO `tbl_products` VALUES ('94', '1065', '1065', 'Glysinate 15sl Gallon', '2500.00', '2220.00000', '', '3', '0', '', '2022-11-15 18:14:02', '2024-01-03 10:07:17');
INSERT INTO `tbl_products` VALUES ('95', '1066', '1066', 'Glyzone-Gallon', '1050.00', '929.98063', '', '3', '0', '', '2022-11-15 18:14:41', '2024-01-28 07:31:06');
INSERT INTO `tbl_products` VALUES ('96', '1067', '1067', 'Glyzone- liter', '470.00', '425.00000', '', '3', '0', '', '2022-11-15 18:15:29', '2022-11-17 07:48:04');
INSERT INTO `tbl_products` VALUES ('97', '1068', '1068', 'Gold 500ml', '470.00', '419.85470', '', '3', '0', '', '2022-11-15 18:16:20', '2023-11-12 13:01:50');
INSERT INTO `tbl_products` VALUES ('98', '1069', '1069', 'Gold Grow- Gallon', '650.00', '0.00000', '', '3', '0', '', '2022-11-15 18:17:15', '2022-11-15 18:17:15');
INSERT INTO `tbl_products` VALUES ('99', '1070', '1070', 'Gold Grow- liter', '200.00', '180.00000', '', '3', '0', '', '2022-11-15 18:17:57', '2022-11-16 20:43:21');
INSERT INTO `tbl_products` VALUES ('100', '1071', '1071', 'G-Prox -Gallon', '2350.00', '2110.00000', '', '3', '0', '', '2022-11-15 18:19:05', '2022-11-21 13:13:04');
INSERT INTO `tbl_products` VALUES ('101', '1072', '1072', 'G-Prox- liter', '750.00', '670.00000', '', '3', '0', '', '2022-11-15 18:19:51', '2023-10-16 18:08:08');
INSERT INTO `tbl_products` VALUES ('102', '1073', '1073', 'Grader- Gallon', '1200.00', '862.90323', '', '3', '0', '', '2022-11-15 18:20:53', '2023-11-25 14:05:53');
INSERT INTO `tbl_products` VALUES ('103', '1074', '1074', 'Ground Plus- Gallon', '1050.00', '953.46477', '', '3', '0', '', '2022-11-15 18:21:39', '2024-01-27 13:22:28');
INSERT INTO `tbl_products` VALUES ('104', '1075', '1075', 'Ground Plus- liter', '380.00', '128.77919', '', '3', '0', '', '2022-11-15 18:22:32', '2024-01-21 08:49:09');
INSERT INTO `tbl_products` VALUES ('105', '1076', '1076', 'Grow More-Orange', '250.00', '330.00000', '', '3', '0', '', '2022-11-15 18:23:44', '2023-09-11 15:59:14');
INSERT INTO `tbl_products` VALUES ('106', '1077', '1077', 'Grow More ( red)-4-0-48', '420.00', '335.00000', '', '3', '0', '', '2022-11-15 18:24:46', '2023-12-07 15:07:25');
INSERT INTO `tbl_products` VALUES ('107', '1078', '1078', 'Grow more (yellow) 20 20 20', '460.00', '345.00000', '', '3', '0', '', '2022-11-15 18:25:51', '2023-12-07 15:07:25');
INSERT INTO `tbl_products` VALUES ('108', '1079', '1079', 'Guarante 2x125ml', '570.00', '525.00000', '', '3', '0', '', '2022-11-15 18:28:06', '2023-10-10 12:04:38');
INSERT INTO `tbl_products` VALUES ('109', '1080', '1080', 'Guarante 2x250', '1020.00', '950.00000', '', '3', '0', '', '2022-11-15 18:30:00', '2024-01-24 13:05:12');
INSERT INTO `tbl_products` VALUES ('110', '1081', '1081', 'Herbicut - Gallon ', '1250.00', '0.12568', '', '3', '0', '', '2022-11-15 18:30:52', '2024-01-14 12:22:18');
INSERT INTO `tbl_products` VALUES ('111', '1082', '1082', 'Herbicut -liter', '430.00', '365.00000', '', '3', '0', '', '2022-11-15 18:31:32', '2023-06-05 14:39:18');
INSERT INTO `tbl_products` VALUES ('112', '1083', '1083', 'Hyfer (green)', '390.00', '315.21875', '', '3', '0', '', '2022-11-15 18:32:33', '2023-12-11 16:42:41');
INSERT INTO `tbl_products` VALUES ('113', '1084', '1084', 'Hyfer (orange)', '400.00', '315.00000', '', '3', '0', '', '2022-11-15 18:33:18', '2023-12-11 16:42:41');
INSERT INTO `tbl_products` VALUES ('114', '1085', '1085', 'Karate 250ml', '260.00', '220.00000', '', '3', '0', '', '2022-11-15 18:33:59', '2023-08-03 12:26:28');
INSERT INTO `tbl_products` VALUES ('115', '1086', '1086', 'Karate 100ml', '150.00', '545.00000', '', '3', '0', '', '2022-11-15 18:34:37', '2023-12-22 07:05:33');
INSERT INTO `tbl_products` VALUES ('116', '1087', '1087', 'Karate 500ml', '450.00', '390.00000', '', '3', '0', '', '2022-11-15 18:35:17', '2023-06-21 18:20:51');
INSERT INTO `tbl_products` VALUES ('117', '1088', '1088', 'Karate-liter', '800.00', '743.00000', '', '3', '0', '', '2022-11-15 18:35:59', '2023-07-14 11:57:01');
INSERT INTO `tbl_products` VALUES ('118', '1089', '1089', 'Klear weed- Gallon', '1100.00', '0.04044', '', '3', '0', '', '2022-11-15 18:51:49', '2024-01-11 06:52:42');
INSERT INTO `tbl_products` VALUES ('119', '1090', '1090', 'Kudos - liter', '550.00', '500.00000', '', '3', '0', '', '2022-11-15 18:52:35', '2022-11-17 07:31:04');
INSERT INTO `tbl_products` VALUES ('120', '1091', '1091', 'Lannate 425g', '880.00', '759.09091', '', '3', '0', '', '2022-11-15 18:53:50', '2023-02-24 11:50:18');
INSERT INTO `tbl_products` VALUES ('121', '1092', '1092', 'Lannate 100g', '300.00', '253.00000', '', '3', '0', '', '2022-11-15 18:54:29', '2024-01-24 13:10:23');
INSERT INTO `tbl_products` VALUES ('122', '1093', '1093', 'Lannate 25g', '100.00', '70.00000', '', '3', '0', '', '2022-11-15 18:55:08', '2023-12-21 06:08:46');
INSERT INTO `tbl_products` VALUES ('123', '1094', '1094', 'Magnum- liter ', '400.00', '375.00000', '', '3', '0', '', '2022-11-15 18:55:54', '2024-01-24 13:13:38');
INSERT INTO `tbl_products` VALUES ('124', '1095', '1095', 'Magnum- 500ml', '230.00', '205.00000', '', '3', '0', '', '2022-11-15 18:56:32', '2023-06-20 14:01:56');
INSERT INTO `tbl_products` VALUES ('125', '1096', '1096', 'Malathion- liter', '450.00', '366.66667', '', '3', '0', '', '2022-11-15 18:57:32', '2023-12-22 07:05:33');
INSERT INTO `tbl_products` VALUES ('126', '1097', '1097', 'Malathion 500ml', '250.00', '165.00000', '', '3', '0', '', '2022-11-15 18:58:24', '2023-03-03 16:01:06');
INSERT INTO `tbl_products` VALUES ('127', '1099', '1099', 'Manzate (kilo)', '500.00', '415.00000', '', '3', '0', '', '2022-11-15 18:59:18', '2023-12-21 06:08:46');
INSERT INTO `tbl_products` VALUES ('128', '1100', '1100', 'Manzin (kilo)', '450.00', '370.00000', '', '3', '0', '', '2022-11-15 19:00:30', '2023-10-10 12:04:38');
INSERT INTO `tbl_products` VALUES ('129', '1101', '1101', 'Mower - Gallon', '1600.00', '1542.30769', '', '3', '0', '', '2022-11-15 19:01:09', '2023-01-04 17:13:57');
INSERT INTO `tbl_products` VALUES ('130', '1102', '1102', 'Mower Ultra - Gallon', '1850.00', '1769.52688', '', '3', '0', '', '2022-11-15 19:01:46', '2023-07-12 14:39:36');
INSERT INTO `tbl_products` VALUES ('131', '1103', '1103', 'Nativo- pack', '80.00', '60.00000', '', '3', '0', '', '2022-11-15 19:02:28', '2022-11-17 07:38:44');
INSERT INTO `tbl_products` VALUES ('132', '1104', '1104', 'Nitro Plus -litro', '370.00', '700.00000', '', '3', '0', '', '2022-11-15 19:03:23', '2022-11-17 07:39:05');
INSERT INTO `tbl_products` VALUES ('133', '1105', '1105', 'Nominee one 250ml', '1550.00', '1470.00000', '', '3', '0', '', '2022-11-15 19:04:12', '2022-11-17 07:39:30');
INSERT INTO `tbl_products` VALUES ('134', '1106', '1106', 'Onecide- liter', '1420.00', '1374.96000', '', '3', '0', '', '2022-11-15 19:05:04', '2024-02-04 12:04:04');
INSERT INTO `tbl_products` VALUES ('135', '1107', '1107', 'Padan 100g', '300.00', '168.69167', '', '3', '0', '', '2022-11-15 19:05:47', '2024-02-04 12:04:04');
INSERT INTO `tbl_products` VALUES ('136', '1108', '1108', 'Parapest 500ml', '380.00', '260.00000', '', '3', '0', '', '2022-11-15 19:08:46', '2023-03-03 16:01:06');
INSERT INTO `tbl_products` VALUES ('137', '1109', '1109', 'Parapest- liter', '670.00', '615.00000', '', '3', '0', '', '2022-11-15 19:09:17', '2023-09-11 16:01:16');
INSERT INTO `tbl_products` VALUES ('138', '1110', '1110', 'Pennant 500ml', '520.00', '455.00000', '', '3', '0', '', '2022-11-16 06:44:45', '2023-04-03 14:05:46');
INSERT INTO `tbl_products` VALUES ('139', '1111', '1111', 'Pyanchor 250ml', '500.00', '750.00000', '', '3', '0', '', '2022-11-16 06:45:28', '2023-03-09 14:00:20');
INSERT INTO `tbl_products` VALUES ('140', '1112', '1112', 'Pyanchor-liter', '1480.00', '1285.21168', '', '3', '0', '', '2022-11-16 06:46:10', '2023-10-09 12:32:37');
INSERT INTO `tbl_products` VALUES ('141', '1113', '1113', 'Ratkil- pack', '30.00', '18.00111', '', '3', '0', '', '2022-11-16 06:46:58', '2023-09-06 14:45:05');
INSERT INTO `tbl_products` VALUES ('142', '1114', '1114', 'Regent- kilo', '220.00', '180.00000', '', '3', '0', '', '2022-11-16 06:47:40', '2022-11-17 07:12:47');
INSERT INTO `tbl_products` VALUES ('143', '1115', '1115', 'Ridomil Gold - pack', '250.00', '186.66667', '', '3', '0', '', '2022-11-16 06:48:24', '2024-01-05 19:55:32');
INSERT INTO `tbl_products` VALUES ('144', '1116', '1116', 'Round up - Gallon', '1450.00', '1299.99382', '', '3', '0', '', '2022-11-16 06:49:10', '2024-01-28 07:31:07');
INSERT INTO `tbl_products` VALUES ('145', '1117', '1117', 'Round up- liter', '450.00', '300.00000', '', '3', '0', '', '2022-11-16 06:50:11', '2024-02-04 11:31:20');
INSERT INTO `tbl_products` VALUES ('146', '1118', '1118', 'Seeds-RM', '75.00', '100.41667', '', '1', '0', '', '2022-11-16 06:50:52', '2023-01-04 06:20:41');
INSERT INTO `tbl_products` VALUES ('147', '1119', '1119', 'Suprema - kalabasa', '2800.00', '2700.00000', '', '1', '0', '', '2022-11-16 06:51:40', '2023-11-28 08:31:30');
INSERT INTO `tbl_products` VALUES ('148', '1120', '1120', 'Sevin - pack', '130.00', '99.19231', '', '3', '0', '', '2022-11-16 06:52:17', '2023-12-16 05:50:56');
INSERT INTO `tbl_products` VALUES ('149', '1121', '1121', 'Silwet 100ml', '280.00', '250.00000', '', '3', '0', '', '2022-11-16 06:52:55', '2022-11-17 07:14:37');
INSERT INTO `tbl_products` VALUES ('150', '1122', '1122', 'Sniper - liter', '420.00', '360.00000', '', '3', '0', '', '2022-11-16 06:53:36', '2022-12-13 16:59:04');
INSERT INTO `tbl_products` VALUES ('151', '1123', '1123', 'Sofit - liter', '1080.00', '1020.00000', '', '3', '0', '', '2022-11-16 06:54:23', '2022-11-17 07:15:06');
INSERT INTO `tbl_products` VALUES ('152', '1124', '1124', 'Sofit 500ml', '550.00', '515.00000', '', '3', '0', '', '2022-11-16 06:55:00', '2024-01-04 20:31:46');
INSERT INTO `tbl_products` VALUES ('153', '1125', '1125', 'Solomon 100ml', '430.00', '345.05457', '', '3', '0', '', '2022-11-16 06:55:42', '2024-01-24 13:13:38');
INSERT INTO `tbl_products` VALUES ('154', '1126', '1126', 'Spitfire - Gallon', '1250.00', '203.75134', '', '3', '0', '', '2022-11-16 06:56:14', '2024-01-28 07:31:07');
INSERT INTO `tbl_products` VALUES ('155', '1127', '1127', 'Spitfire - liter', '480.00', '420.00000', '', '3', '0', '', '2022-11-16 06:56:59', '2022-11-24 18:49:41');
INSERT INTO `tbl_products` VALUES ('156', '1128', '1128', 'Square off - Gallon', '1400.00', '1297.76599', '', '3', '0', '', '2022-11-16 06:59:19', '2024-01-14 12:22:19');
INSERT INTO `tbl_products` VALUES ('157', '1129', '1129', 'Square off - liter', '420.00', '330.00000', '', '3', '0', '', '2022-11-16 06:59:54', '2024-01-05 19:55:31');
INSERT INTO `tbl_products` VALUES ('158', '1130', '1130', 'Stand Out - Gallon', '820.00', '750.00000', '', '3', '0', '', '2022-11-16 07:00:40', '2023-11-14 09:41:10');
INSERT INTO `tbl_products` VALUES ('159', '1131', '1131', 'Stand Out - liter', '270.00', '211.58824', '', '3', '0', '', '2022-11-16 07:01:21', '2023-11-12 13:01:50');
INSERT INTO `tbl_products` VALUES ('160', '1132', '1132', 'Sure kill - pack', '150.00', '110.00000', '', '3', '0', '', '2022-11-16 07:02:02', '2023-08-21 11:02:33');
INSERT INTO `tbl_products` VALUES ('161', '1133', '1133', 'Symbio 250ml', '530.00', '480.00000', '', '3', '0', '', '2022-11-16 07:02:53', '2022-11-17 07:19:51');
INSERT INTO `tbl_products` VALUES ('162', '1134', '1134', 'Todo Max - Gallon ', '1000.00', '834.41290', '', '3', '0', '', '2022-11-16 07:03:37', '2024-01-28 07:31:06');
INSERT INTO `tbl_products` VALUES ('163', '1135', '1135', 'Todo Max - liter ', '320.00', '133.49827', '', '3', '0', '', '2022-11-16 07:04:16', '2023-12-09 11:57:41');
INSERT INTO `tbl_products` VALUES ('164', '1136', '1136', 'Triple 8 - Gallon ', '1200.00', '6.95372', '', '3', '0', '', '2022-11-16 07:04:56', '2024-01-28 07:31:06');
INSERT INTO `tbl_products` VALUES ('165', '1137', '1137', 'Triple 8 - liter', '400.00', '300.00000', '', '3', '0', '', '2022-11-16 07:05:41', '2023-10-01 07:53:30');
INSERT INTO `tbl_products` VALUES ('166', '1138', '1138', 'Vindex  500ml', '480.00', '435.00000', '', '3', '0', '', '2022-11-16 07:07:07', '2023-05-25 14:14:16');
INSERT INTO `tbl_products` VALUES ('167', '1139', '1139', 'Vindex- liter ', '850.00', '800.00000', '', '3', '0', '', '2022-11-16 07:07:55', '2023-08-21 11:02:51');
INSERT INTO `tbl_products` VALUES ('168', '1140', '1140', 'Virtako 10g', '150.00', '129.99394', '', '3', '0', '', '2022-11-16 07:09:21', '2024-01-03 10:07:17');
INSERT INTO `tbl_products` VALUES ('169', '1141', '1141', 'Weed Blaster - Gallon', '1380.00', '414.20872', '', '3', '0', '', '2022-11-16 07:10:12', '2024-01-08 06:55:57');
INSERT INTO `tbl_products` VALUES ('170', '1142', '1142', 'Weed Blaster - liter', '450.00', '0.00000', '', '3', '0', '', '2022-11-16 07:10:58', '2022-11-16 07:10:58');
INSERT INTO `tbl_products` VALUES ('171', '1143', '1143', ' Wild kid - pack', '140.00', '100.00000', '', '3', '0', '', '2022-11-16 07:12:04', '2023-12-21 06:08:46');
INSERT INTO `tbl_products` VALUES ('172', '1144', '1144', 'Yara Vita 150ml', '200.00', '169.00000', '', '3', '0', '', '2022-11-16 07:13:05', '2023-04-25 12:16:10');
INSERT INTO `tbl_products` VALUES ('173', '1145', '1145', 'Scorpio 250g', '350.00', '270.00000', '', '3', '0', '', '2022-11-16 07:15:02', '2023-10-09 12:32:37');
INSERT INTO `tbl_products` VALUES ('174', '4001', '4001', 'Talahi - pcs', '35.00', '19.00000', '', '4', '0', '', '2022-11-16 07:16:08', '2023-11-05 14:38:40');
INSERT INTO `tbl_products` VALUES ('175', '4002', '4002', 'Talahi - kilo', '130.00', '110.00000', '', '4', '0', '', '2022-11-16 07:16:50', '2024-02-06 18:20:25');
INSERT INTO `tbl_products` VALUES ('176', '4003', '4003', 'Agoha ', '10.00', '6.26618', '', '4', '0', '', '2022-11-16 07:17:26', '2023-12-07 15:56:42');
INSERT INTO `tbl_products` VALUES ('177', '4004', '4004', 'Sack - JKM', '13.00', '11.80000', '', '4', '0', '', '2022-11-16 07:18:18', '2023-10-07 14:06:43');
INSERT INTO `tbl_products` VALUES ('178', '4005', '4005', 'Sacks - Harvester', '13.50', '11.50000', '', '4', '0', '', '2022-11-16 07:19:48', '2023-12-13 17:41:42');
INSERT INTO `tbl_products` VALUES ('179', '4006', '4006', 'Sacks - Julu', '13.00', '11.38608', '', '4', '0', '', '2022-11-16 07:20:30', '2023-12-13 17:41:41');
INSERT INTO `tbl_products` VALUES ('180', '2015', '2015', 'Bioseed-101 free', '0.00', '0.00000', '', '1', '0', '', '2022-11-16 10:51:27', '2022-11-16 10:51:27');
INSERT INTO `tbl_products` VALUES ('181', '2016', '2016', 'Bioseed-108 free', '0.00', '0.00000', '', '1', '0', '', '2022-11-16 10:51:54', '2023-08-26 15:16:43');
INSERT INTO `tbl_products` VALUES ('182', '1148', '1148', 'Dominate', '600.00', '550.00000', '', '3', '0', '', '2022-11-17 07:52:49', '2022-11-17 07:57:31');
INSERT INTO `tbl_products` VALUES ('183', '1146', '1146', 'Dragon Cartap', '170.00', '100.87296', '', '3', '0', '', '2022-11-17 07:54:01', '2023-11-16 06:40:01');
INSERT INTO `tbl_products` VALUES ('184', '1147', '1147', 'Zebra', '500.00', '430.00000', '', '3', '0', '', '2022-11-17 07:54:56', '2023-08-30 08:47:01');
INSERT INTO `tbl_products` VALUES ('185', '1149', '1149', 'Laser', '100.00', '80.00000', '', '3', '0', '', '2022-11-17 07:55:44', '2022-11-17 07:56:40');
INSERT INTO `tbl_products` VALUES ('186', '1150', '1150', 'Altap', '180.00', '156.89655', '', '3', '0', '', '2022-11-17 08:01:25', '2022-11-17 08:08:22');
INSERT INTO `tbl_products` VALUES ('187', '1151', '1151', 'Legion', '550.00', '450.00000', '', '3', '0', '', '2022-11-17 08:01:58', '2022-11-17 08:09:11');
INSERT INTO `tbl_products` VALUES ('188', '1152', '1152', 'Stimulate', '680.00', '618.75000', '', '3', '0', '', '2022-11-17 08:02:25', '2023-08-18 12:49:55');
INSERT INTO `tbl_products` VALUES ('189', '1153', '1153', 'Siga 300', '400.00', '380.00000', '', '3', '0', '', '2022-11-17 08:10:16', '2022-11-17 08:13:42');
INSERT INTO `tbl_products` VALUES ('190', '1154', '1154', 'Polaris', '550.00', '500.00000', '', '3', '0', '', '2022-11-17 08:10:43', '2022-11-17 08:14:11');
INSERT INTO `tbl_products` VALUES ('191', '1156', '1156', 'Supra', '550.00', '350.00000', '', '3', '0', '', '2022-11-17 08:11:17', '2023-06-23 10:52:00');
INSERT INTO `tbl_products` VALUES ('192', '1155', '1155', 'Tag 357', '450.00', '400.00000', '', '3', '0', '', '2022-11-17 08:12:07', '2022-11-17 08:13:05');
INSERT INTO `tbl_products` VALUES ('193', '2004', '2004', 'Bioseed-108', '3950.00', '3737.38034', '', '1', '0', '', '2022-11-17 12:21:51', '2024-01-25 20:02:16');
INSERT INTO `tbl_products` VALUES ('194', '3016', '3016', '141414-Kilo', '40.00', '28.10545', '', '2', '0', '', '2022-11-17 12:29:53', '2024-01-19 11:05:54');
INSERT INTO `tbl_products` VALUES ('195', '3017', '3017', '16200-Kilo', '35.00', '26.80000', '', '2', '0', '', '2022-11-17 13:15:49', '2024-01-09 13:02:17');
INSERT INTO `tbl_products` VALUES ('196', '3018', '3018', '2100-kilo', '25.00', '12.98603', '', '2', '0', '', '2022-11-17 13:16:35', '2024-01-02 08:20:46');
INSERT INTO `tbl_products` VALUES ('197', '3019', '3019', '4600-kilo', '45.00', '27.35674', '', '2', '0', '', '2022-11-17 13:16:53', '2024-01-23 15:27:47');
INSERT INTO `tbl_products` VALUES ('198', '1157', '1157', 'Manzate 250g', '260.00', '220.00000', '', '3', '0', '', '2022-11-17 16:48:23', '2023-12-05 11:25:21');
INSERT INTO `tbl_products` VALUES ('199', '0001', '0001', 'G-Cash In ( Service Charge)', '10.00', '0.00000', '', '5', '0', '', '2022-11-18 11:57:42', '2023-06-01 19:17:37');
INSERT INTO `tbl_products` VALUES ('200', '0002', '0002', 'G-Cash Out ( Service Charge)', '10.00', '0.00000', '', '5', '0', '', '2022-11-18 11:58:55', '2023-06-01 19:18:01');
INSERT INTO `tbl_products` VALUES ('201', '0003', '0003', 'Service Charge-P10', '10.00', '0.00000', '', '5', '0', '', '2022-11-18 11:59:31', '2022-11-18 12:21:43');
INSERT INTO `tbl_products` VALUES ('202', '0004', '0004', 'Service Charge-P20', '20.00', '0.00000', '', '5', '0', '', '2022-11-18 12:22:19', '2022-11-18 12:22:19');
INSERT INTO `tbl_products` VALUES ('204', '1159', '1159', 'Daconil 250g', '320.00', '270.31250', '', '3', '0', '', '2022-11-21 13:09:55', '2023-06-22 19:36:36');
INSERT INTO `tbl_products` VALUES ('205', '2017', '2017', 'Evo 709-Kilo', '300.00', '249.86464', '', '1', '0', '', '2022-11-24 06:42:56', '2024-02-01 15:58:29');
INSERT INTO `tbl_products` VALUES ('206', '2018', '2018', 'Bioseed-118', '2800.00', '2600.00000', '', '1', '0', '', '2022-11-24 18:06:27', '2023-10-18 14:53:08');
INSERT INTO `tbl_products` VALUES ('207', '1160', '1160', 'Tekweed Gallon', '1250.00', '1150.00000', '', '3', '0', '', '2022-11-24 18:15:04', '2023-09-12 10:33:48');
INSERT INTO `tbl_products` VALUES ('208', '4007', '4007', 'Talahi-Long', '50.00', '20.60161', '', '4', '0', '', '2022-11-25 07:09:06', '2023-06-08 07:51:35');
INSERT INTO `tbl_products` VALUES ('209', '3020', '3020', '4600-Danat', '1450.00', '32.32000', '', '2', '0', '', '2022-11-25 13:50:55', '2023-10-01 09:20:45');
INSERT INTO `tbl_products` VALUES ('210', '4009', '4009', 'Sack-Lopez', '12.50', '10.83418', '', '4', '0', '', '2022-11-29 05:57:22', '2024-01-08 14:30:45');
INSERT INTO `tbl_products` VALUES ('211', '1161', '1161', 'Calcium Boron', '400.00', '354.82759', '', '3', '0', '', '2022-11-29 14:24:17', '2023-12-02 13:12:24');
INSERT INTO `tbl_products` VALUES ('212', '1162', '1162', 'Allcide-Liter', '950.00', '880.00000', '', '3', '0', '', '2022-11-29 14:24:42', '2022-11-29 14:36:48');
INSERT INTO `tbl_products` VALUES ('213', '1163', '1163', 'Escape-500ml', '650.00', '590.00000', '', '3', '0', '', '2022-12-02 13:11:18', '2023-03-14 18:06:34');
INSERT INTO `tbl_products` VALUES ('214', '1164', '1164', 'Malathion-Bot-liter', '370.00', '300.00000', '', '3', '0', '', '2022-12-02 13:12:30', '2023-08-16 17:08:00');
INSERT INTO `tbl_products` VALUES ('215', '1165', '1165', 'Malathion-Bot-500ml', '200.00', '165.00000', '', '3', '0', '', '2022-12-02 13:13:05', '2022-12-02 13:37:31');
INSERT INTO `tbl_products` VALUES ('216', '1166', '1166', 'Malathion-Bot-250ml', '150.00', '105.00000', '', '3', '0', '', '2022-12-02 13:13:41', '2023-11-16 16:23:49');
INSERT INTO `tbl_products` VALUES ('217', '1167', '1167', 'Bullseye-500ml', '250.00', '228.02646', '', '3', '0', '', '2022-12-02 13:15:34', '2024-02-04 11:56:12');
INSERT INTO `tbl_products` VALUES ('218', '1168', '1168', 'Parapest -250ml', '250.00', '205.00000', '', '3', '0', '', '2022-12-02 13:16:23', '2022-12-02 13:37:30');
INSERT INTO `tbl_products` VALUES ('219', '1169', '1169', '24D-Ester 500ml', '250.00', '171.01174', '', '3', '0', '', '2022-12-10 18:01:14', '2024-01-28 13:08:12');
INSERT INTO `tbl_products` VALUES ('220', '1170', '1170', 'Ground Plus- 5 liters', '1400.00', '1220.00000', '', '3', '0', '', '2022-12-14 16:40:58', '2023-12-04 13:59:14');
INSERT INTO `tbl_products` VALUES ('221', '1171', '1171', 'Boom Flower', '750.00', '696.42000', '', '3', '0', '', '2022-12-14 16:41:25', '2024-02-04 11:31:20');
INSERT INTO `tbl_products` VALUES ('222', '4008', '4008', 'Sprayer-Tung ho Plastic 18L', '2600.00', '1800.00000', '', '4', '0', '', '2022-12-16 16:35:00', '2023-08-24 08:10:21');
INSERT INTO `tbl_products` VALUES ('223', '4010', '4010', 'Sprayer- Calidad 16L', '2200.00', '1584.58824', '', '4', '0', '', '2022-12-16 16:36:30', '2024-01-24 05:57:35');
INSERT INTO `tbl_products` VALUES ('224', '1172', '1172', 'Mower Ultra-Liter', '450.00', '375.00000', '', '3', '0', '', '2022-12-17 14:59:46', '2024-01-05 19:55:58');
INSERT INTO `tbl_products` VALUES ('225', '1173', '1173', 'Manzate DF-250 grams', '150.00', '125.00000', '', '3', '0', '', '2022-12-17 15:00:36', '2023-10-23 16:51:42');
INSERT INTO `tbl_products` VALUES ('226', '000', '000', 'Cash', '1.00', '0.00000', '', '6', '0', '', '2022-12-18 06:43:33', '2022-12-18 06:43:33');
INSERT INTO `tbl_products` VALUES ('227', '4011', '4011', 'Sprayer-Parts', '1.00', '0.01000', '', '4', '0', '', '2022-12-18 06:53:38', '2022-12-18 06:54:37');
INSERT INTO `tbl_products` VALUES ('228', '2019', '2019', 'Evo- 9301', '2900.00', '2800.00000', '', '1', '0', '', '2022-12-24 14:58:18', '2023-12-21 06:09:50');
INSERT INTO `tbl_products` VALUES ('229', '1174', '1174', '.', '1850.00', '1800.00000', '', '3', '0', '', '2022-12-26 17:21:50', '2023-08-14 15:26:36');
INSERT INTO `tbl_products` VALUES ('230', '1175', '1175', 'La Themgas', '250.00', '195.00000', '', '3', '0', '', '2022-12-26 17:35:58', '2023-07-27 16:37:42');
INSERT INTO `tbl_products` VALUES ('231', '1176', '1176', 'Glyphotex', '1150.00', '194.60975', '', '3', '0', '', '2022-12-26 17:36:38', '2024-01-16 11:15:36');
INSERT INTO `tbl_products` VALUES ('232', '1177', '1177', 'Seeds-RH', '5.00', '3.15000', '', '1', '0', '', '2022-12-27 11:04:06', '2022-12-27 11:06:25');
INSERT INTO `tbl_products` VALUES ('233', '4012', '4012', 'Nylon # 22', '30.00', '15.00000', '', '4', '0', '', '2022-12-28 14:13:28', '2022-12-28 14:35:15');
INSERT INTO `tbl_products` VALUES ('234', '3021', '3021', '0060-Kilo', '60.00', '38.95941', '', '2', '0', '', '2022-12-28 14:19:16', '2023-12-17 10:44:22');
INSERT INTO `tbl_products` VALUES ('235', '4013', '4013', 'Nylon # 24', '35.00', '17.00000', '', '4', '0', '', '2022-12-28 14:32:22', '2022-12-28 14:35:15');
INSERT INTO `tbl_products` VALUES ('236', '4014', '4014', 'T-Box- Big', '100.00', '60.00000', '', '4', '0', '', '2022-12-28 14:34:02', '2023-12-07 15:58:01');
INSERT INTO `tbl_products` VALUES ('237', '1178', '1178', 'Gold-1000ml', '870.00', '760.00000', '', '3', '0', '', '2022-12-29 14:27:55', '2024-01-28 13:08:13');
INSERT INTO `tbl_products` VALUES ('238', '1179', '1179', 'Marshall 180g', '420.00', '355.00000', '', '3', '0', '', '2022-12-29 14:28:23', '2023-09-18 16:30:15');
INSERT INTO `tbl_products` VALUES ('239', '4015', '4015', 'Kalo', '50.00', '38.00000', '', '4', '0', '', '2022-12-30 17:07:42', '2022-12-30 17:23:19');
INSERT INTO `tbl_products` VALUES ('240', '4016', '4016', 'Nylon # 10', '10.00', '5.00000', '', '4', '0', '', '2022-12-30 17:17:18', '2022-12-30 17:23:19');
INSERT INTO `tbl_products` VALUES ('241', '4017', '4017', 'Nylon # 18', '20.00', '13.00000', '', '4', '0', '', '2022-12-30 17:18:10', '2022-12-30 17:23:19');
INSERT INTO `tbl_products` VALUES ('242', '4018', '4018', 'Nylon # 20', '25.00', '14.00000', '', '4', '0', '', '2022-12-30 17:18:38', '2022-12-30 17:23:19');
INSERT INTO `tbl_products` VALUES ('243', '1180', '1180', 'Ubrupt', '100.00', '65.00000', '', '3', '0', '', '2023-01-03 15:08:25', '2023-01-03 15:09:09');
INSERT INTO `tbl_products` VALUES ('244', '1181', '1181', 'Grader-Liter', '420.00', '330.00000', '', '3', '0', '', '2023-01-04 06:03:07', '2023-07-01 18:13:35');
INSERT INTO `tbl_products` VALUES ('245', '1182', '1182', 'Vaksi-K', '850.00', '800.00000', '', '3', '0', '', '2023-01-04 15:44:17', '2023-01-04 15:52:51');
INSERT INTO `tbl_products` VALUES ('246', '1183', '1183', 'Padan 30g', '150.00', '98.09510', '', '3', '0', '', '2023-01-07 17:38:44', '2024-02-04 12:04:04');
INSERT INTO `tbl_products` VALUES ('247', '1184', '1184', 'Kamandag-Liter', '450.00', '380.00000', '', '3', '0', '', '2023-01-08 07:40:50', '2023-12-09 09:02:09');
INSERT INTO `tbl_products` VALUES ('248', '1185', '1185', 'Authority 480sc', '2280.00', '2190.00000', '', '3', '0', '', '2023-01-09 12:43:27', '2023-05-27 14:43:22');
INSERT INTO `tbl_products` VALUES ('249', '1186', '1186', 'Cymbush-500ml', '350.00', '266.87500', '', '3', '0', '', '2023-01-11 15:56:46', '2024-01-24 13:10:23');
INSERT INTO `tbl_products` VALUES ('250', '1187', '1187', 'Cymbush- 250ml', '200.00', '150.00000', '', '3', '0', '', '2023-01-11 15:57:22', '2023-07-04 06:15:33');
INSERT INTO `tbl_products` VALUES ('251', '1188', '1188', 'CyperMetrin 5EC', '300.00', '243.00308', '', '3', '0', '', '2023-01-11 15:57:53', '2024-02-04 11:31:20');
INSERT INTO `tbl_products` VALUES ('252', '1189', '1189', '24D-Amine 500ml', '180.00', '122.96000', '', '3', '0', '', '2023-01-18 17:55:25', '2024-02-04 11:31:20');
INSERT INTO `tbl_products` VALUES ('253', '1190', '1190', '24D-Amine 250ml', '100.00', '89.11196', '', '3', '0', '', '2023-01-18 17:56:02', '2024-02-06 14:15:07');
INSERT INTO `tbl_products` VALUES ('254', '4019', '4019', 'Parts- Rod 5ft', '300.00', '137.22222', '', '4', '0', '', '2023-01-20 10:19:27', '2023-04-26 11:17:17');
INSERT INTO `tbl_products` VALUES ('255', '4020', '4020', 'Parts- Rod 4ft', '250.00', '182.32323', '', '4', '0', '', '2023-01-20 10:19:50', '2023-04-26 11:17:46');
INSERT INTO `tbl_products` VALUES ('256', '4021', '4021', 'Parts- Rod Plastic', '250.00', '0.00000', '', '4', '0', '', '2023-01-20 10:20:21', '2023-04-26 11:18:05');
INSERT INTO `tbl_products` VALUES ('257', '4022', '4022', 'Ecobag- Large', '10.00', '0.00000', '', '5', '0', '', '2023-01-20 10:20:46', '2023-01-20 10:20:46');
INSERT INTO `tbl_products` VALUES ('258', '4023', '4023', 'Ecobag- Small', '5.00', '0.00000', '', '5', '0', '', '2023-01-20 10:21:32', '2023-01-20 10:21:32');
INSERT INTO `tbl_products` VALUES ('259', '1191', '1191', 'Colt Diuron', '650.00', '560.00000', '', '3', '0', '', '2023-01-20 16:48:23', '2023-01-20 16:49:23');
INSERT INTO `tbl_products` VALUES ('260', '005', '005', 'Delivery Charge', '15.00', '0.00010', '', '5', '0', '', '2023-01-21 10:44:10', '2023-01-21 10:51:22');
INSERT INTO `tbl_products` VALUES ('261', '1192', '1192', 'Alika 100ml', '450.00', '380.00000', '', '3', '0', '', '2023-01-23 13:48:06', '2023-10-26 17:32:02');
INSERT INTO `tbl_products` VALUES ('262', '1193', '1193', 'Cal+Boron+Zinc', '450.00', '390.00000', '', '3', '0', '', '2023-01-25 10:50:36', '2023-01-25 10:53:13');
INSERT INTO `tbl_products` VALUES ('263', '4024', '4024', 'Sprayer- Crystal 16L', '2000.00', '1700.00000', '', '4', '0', '', '2023-02-02 06:23:38', '2023-04-30 14:54:58');
INSERT INTO `tbl_products` VALUES ('264', '4025', '4025', 'Sprayer- Tung Ho- Golden', '3000.00', '2300.00000', '', '4', '0', '', '2023-02-02 06:28:15', '2023-02-02 06:57:08');
INSERT INTO `tbl_products` VALUES ('265', '4026', '4026', 'Spray- MZ 20L', '2600.00', '1900.00000', '', '4', '0', '', '2023-02-02 06:29:27', '2023-08-24 08:10:21');
INSERT INTO `tbl_products` VALUES ('266', '4027', '4027', 'Sprayer-Shield 16L', '1000.00', '516.99588', '', '4', '0', '', '2023-02-02 06:46:35', '2024-01-24 05:57:35');
INSERT INTO `tbl_products` VALUES ('267', '4028', '4028', 'Sack-Busco', '12.00', '10.80000', '', '4', '0', '', '2023-02-02 06:48:09', '2023-10-07 14:06:43');
INSERT INTO `tbl_products` VALUES ('268', '2020', '2020', 'NK 6505-Kilo', '700.00', '597.03000', '', '1', '0', '', '2023-02-02 13:58:29', '2024-02-01 16:06:27');
INSERT INTO `tbl_products` VALUES ('269', '1194', '1194', 'Furadan 30kg', '1450.00', '1350.00000', '', '3', '0', '', '2023-02-03 13:08:43', '2023-02-03 13:14:02');
INSERT INTO `tbl_products` VALUES ('270', '2021', '2021', 'NK 6410-Kilo', '500.00', '549.85000', '', '1', '0', '', '2023-02-03 14:54:57', '2024-02-01 16:06:27');
INSERT INTO `tbl_products` VALUES ('271', '1195', '1195', 'Rich Vitamin -Gal', '650.00', '330.17303', '', '3', '0', '', '2023-02-04 08:06:02', '2024-01-20 11:22:59');
INSERT INTO `tbl_products` VALUES ('272', '1196', '1196', 'Rich Vitamin - Liter', '200.00', '150.00000', '', '3', '0', '', '2023-02-04 08:06:42', '2023-11-07 11:53:43');
INSERT INTO `tbl_products` VALUES ('273', '006', '006', 'Delivery Charge', '25.00', '0.00000', '', '6', '0', '', '2023-02-07 13:54:05', '2023-02-07 13:54:05');
INSERT INTO `tbl_products` VALUES ('274', '1197', '1197', 'Stand-Liter', '470.00', '3.64286', '', '3', '0', '', '2023-02-08 13:03:38', '2023-11-14 09:41:10');
INSERT INTO `tbl_products` VALUES ('275', '2022', '2022', 'P 3645- Kilo', '650.00', '675.00000', '', '1', '0', '', '2023-02-08 17:34:57', '2023-08-22 14:56:12');
INSERT INTO `tbl_products` VALUES ('276', '2023', '2023', 'P 4124- Kilo', '650.00', '470.00000', '', '1', '0', '', '2023-02-08 17:35:23', '2024-02-01 16:06:27');
INSERT INTO `tbl_products` VALUES ('277', '2024', '2024', 'P 3530- Kilo', '550.00', '487.50000', '', '1', '0', '', '2023-02-08 17:35:54', '2023-04-08 10:37:51');
INSERT INTO `tbl_products` VALUES ('278', '2025', '2025', 'D 8899- Kilo', '600.00', '558.96000', '', '1', '0', '', '2023-02-08 17:37:07', '2023-02-23 06:36:02');
INSERT INTO `tbl_products` VALUES ('279', '1198', '1198', 'Top Ace', '990.00', '918.75000', '', '3', '0', '', '2023-02-10 10:12:38', '2023-04-04 15:54:28');
INSERT INTO `tbl_products` VALUES ('280', '007', '007', 'Delivery Charge-30', '30.00', '0.00000', '', '5', '0', '', '2023-02-11 14:06:56', '2023-02-11 14:06:56');
INSERT INTO `tbl_products` VALUES ('281', '1199', '1199', 'Sincera', '720.00', '620.00000', '', '3', '0', '', '2023-02-13 11:25:58', '2023-09-06 14:33:41');
INSERT INTO `tbl_products` VALUES ('282', '1200', '1200', 'Magnum 250ml', '150.00', '110.33323', '', '3', '0', '', '2023-02-13 11:26:19', '2024-02-04 12:02:11');
INSERT INTO `tbl_products` VALUES ('283', '1201', '1201', 'APSA 250ml', '300.00', '215.00000', '', '3', '0', '', '2023-02-16 13:47:06', '2023-07-13 13:46:04');
INSERT INTO `tbl_products` VALUES ('284', '008', '008', 'Delivery Charge-20', '20.00', '0.00000', '', '5', '0', '', '2023-02-16 14:54:36', '2023-02-16 14:54:36');
INSERT INTO `tbl_products` VALUES ('285', '1202', '1202', 'Qaudro 8', '1000.00', '870.00000', '', '3', '0', '', '2023-02-17 09:17:28', '2023-02-17 09:27:20');
INSERT INTO `tbl_products` VALUES ('286', '1203', '1203', 'Acid', '150.00', '95.00000', '', '3', '0', '', '2023-02-17 14:27:42', '2023-02-17 14:50:00');
INSERT INTO `tbl_products` VALUES ('287', '2026', '2026', 'Maharlika- 1400', '2200.00', '1833.33333', '', '1', '0', '', '2023-02-18 13:06:26', '2023-07-10 11:40:33');
INSERT INTO `tbl_products` VALUES ('288', '1204', '1204', 'Rocket- Lit', '400.00', '332.00000', '', '3', '0', '', '2023-02-20 16:19:13', '2023-02-20 16:36:37');
INSERT INTO `tbl_products` VALUES ('289', '1205', '1205', 'Ariba-Lit', '650.00', '540.00000', '', '3', '0', '', '2023-02-20 16:19:48', '2023-02-20 16:36:37');
INSERT INTO `tbl_products` VALUES ('290', '1206', '1206', 'Glyphotex-Lit', '400.00', '335.00000', '', '3', '0', '', '2023-02-20 16:24:25', '2023-06-11 07:23:04');
INSERT INTO `tbl_products` VALUES ('291', '1207', '1207', 'Diutex Diuron- Lit', '700.00', '152.86866', '', '3', '0', '', '2023-02-20 16:28:31', '2024-01-25 08:43:36');
INSERT INTO `tbl_products` VALUES ('292', '1208', '1208', 'Diutex Diuron-Kg', '650.00', '510.00000', '', '3', '0', '', '2023-02-20 16:30:45', '2024-02-06 18:20:25');
INSERT INTO `tbl_products` VALUES ('293', '3022', '3022', '1846 -Kilo', '70.00', '54.77333', '', '2', '0', '', '2023-02-21 12:13:53', '2023-05-09 13:42:58');
INSERT INTO `tbl_products` VALUES ('294', '1209', '1209', 'Better-Seeds', '65.00', '48.00000', '', '1', '0', '', '2023-02-24 10:08:01', '2023-02-24 10:08:35');
INSERT INTO `tbl_products` VALUES ('295', '1210', '1210', 'Devast-Gal', '1320.00', '1255.00000', '', '3', '0', '', '2023-02-24 17:35:26', '2023-02-24 17:35:59');
INSERT INTO `tbl_products` VALUES ('296', '1211', '1211', 'Todomax-5L', '1550.00', '1430.00000', '', '3', '0', '', '2023-02-28 07:12:14', '2024-01-10 18:39:28');
INSERT INTO `tbl_products` VALUES ('297', '1212', '1212', 'Bugati', '400.00', '340.00000', '', '3', '0', '', '2023-02-28 07:12:50', '2023-02-28 07:14:34');
INSERT INTO `tbl_products` VALUES ('298', '4029', '4029', 'Rubber', '20.00', '20.00000', '', '5', '0', '', '2023-03-01 17:43:57', '2024-02-06 18:20:25');
INSERT INTO `tbl_products` VALUES ('299', '1213', '1213', 'Malathion 100ml', '100.00', '60.00000', '', '3', '0', '', '2023-03-03 15:58:43', '2023-03-03 16:01:06');
INSERT INTO `tbl_products` VALUES ('300', '1214', '1214', 'Core 500ml', '1350.00', '1290.00000', '', '3', '0', '', '2023-03-06 10:30:42', '2023-03-06 10:34:24');
INSERT INTO `tbl_products` VALUES ('301', '1215', '1215', 'Cabrio 500ml', '2250.00', '2150.00000', '', '3', '0', '', '2023-03-06 10:32:35', '2023-11-07 12:37:24');
INSERT INTO `tbl_products` VALUES ('302', '1216', '1216', 'Romex- Gal', '550.00', '362.00000', '', '3', '0', '', '2023-03-08 14:25:27', '2023-05-08 14:10:45');
INSERT INTO `tbl_products` VALUES ('303', '1218', '1218', 'Supernet 1000ml', '800.00', '720.00000', '', '3', '0', '', '2023-03-09 13:29:30', '2023-03-09 13:33:02');
INSERT INTO `tbl_products` VALUES ('304', '1217', '1217', 'Bridge 1000ml', '620.00', '550.00000', '', '3', '0', '', '2023-03-09 13:29:59', '2023-09-13 11:33:37');
INSERT INTO `tbl_products` VALUES ('305', '1219', '1219', 'Escape 1000ml', '1200.00', '1065.00000', '', '3', '0', '', '2023-03-09 13:31:31', '2023-03-14 18:06:34');
INSERT INTO `tbl_products` VALUES ('306', '1220', '1220', 'Lead force-Carbofuran', '150.00', '110.00000', '', '3', '0', '', '2023-03-09 13:59:38', '2023-11-12 09:24:34');
INSERT INTO `tbl_products` VALUES ('307', '1221', '1221', 'Pyanchor- 500ml', '750.00', '700.00000', '', '3', '0', '', '2023-03-12 09:20:29', '2023-05-06 10:00:06');
INSERT INTO `tbl_products` VALUES ('308', '1222', '1222', 'Harvest More', '280.00', '220.00000', '', '3', '0', '', '2023-03-14 07:10:02', '2023-03-14 07:14:10');
INSERT INTO `tbl_products` VALUES ('309', '3023', '3023', '4600-Agro Planters', '1600.00', '1560.00000', '', '2', '0', '', '2023-03-19 13:45:57', '2023-10-23 13:25:29');
INSERT INTO `tbl_products` VALUES ('310', '1223', '1223', 'Furamax', '150.00', '110.00000', '', '3', '0', '', '2023-03-19 16:24:43', '2024-01-28 13:08:13');
INSERT INTO `tbl_products` VALUES ('311', '1224', '1224', 'Seeds-Ramgo', '85.00', '44.51777', '', '1', '0', '', '2023-03-19 16:26:10', '2023-10-23 13:42:52');
INSERT INTO `tbl_products` VALUES ('312', '1225', '1225', 'Bushwack-250ml', '150.00', '0.00000', '', '3', '0', '', '2023-03-20 12:21:54', '2023-03-20 12:21:54');
INSERT INTO `tbl_products` VALUES ('313', '1226', '1226', 'Torpedo', '350.00', '280.00000', '', '3', '0', '', '2023-03-21 16:58:22', '2023-07-02 08:33:36');
INSERT INTO `tbl_products` VALUES ('314', '1227', '1227', 'GlyFloMax- Gal', '1250.00', '0.00000', '', '3', '0', '', '2023-03-21 16:58:54', '2023-09-21 13:13:05');
INSERT INTO `tbl_products` VALUES ('315', '1228', '1228', 'King Arthur', '600.00', '464.00000', '', '3', '0', '', '2023-03-26 09:18:35', '2023-11-16 06:40:01');
INSERT INTO `tbl_products` VALUES ('316', '2027', '2027', 'NK 6410- Refund', '1.00', '0.00000', '', '5', '0', '', '2023-03-29 07:11:50', '2023-03-29 07:11:50');
INSERT INTO `tbl_products` VALUES ('317', '1229', '1229', 'Clear Out- 250ml', '250.00', '93.08632', '', '3', '0', '', '2023-03-31 13:51:34', '2023-11-17 07:11:59');
INSERT INTO `tbl_products` VALUES ('318', '1230', '1230', '24D-Amine Gal - Delubyo', '700.00', '0.00000', '', '3', '0', '', '2023-04-02 06:14:26', '2023-08-02 13:07:25');
INSERT INTO `tbl_products` VALUES ('319', '1231', '1231', '24D-Amine Lit ( Delubyo)', '250.00', '0.00000', '', '3', '0', '', '2023-04-02 06:15:00', '2023-04-02 06:15:00');
INSERT INTO `tbl_products` VALUES ('320', '1232', '1232', 'Bridge 500ml', '370.00', '300.00000', '', '3', '0', '', '2023-04-03 14:08:16', '2023-09-13 11:33:37');
INSERT INTO `tbl_products` VALUES ('321', '1233', '1233', 'Hoestick liter', '500.00', '415.00000', '', '3', '0', '', '2023-04-03 14:09:37', '2023-04-03 14:14:30');
INSERT INTO `tbl_products` VALUES ('322', '1234', '1234', 'Tremor-Liter', '620.00', '550.00000', '', '3', '0', '', '2023-04-04 15:44:35', '2023-04-04 15:45:55');
INSERT INTO `tbl_products` VALUES ('323', '3024', '3024', '2100-Agro Planters', '670.00', '630.00000', '', '2', '0', '', '2023-04-09 11:52:00', '2023-11-29 07:24:54');
INSERT INTO `tbl_products` VALUES ('324', '1235', '1235', 'Herbadox lit', '820.00', '750.00000', '', '3', '0', '', '2023-04-20 11:49:54', '2023-04-20 12:03:56');
INSERT INTO `tbl_products` VALUES ('325', '1236', '1236', 'Selecron', '380.00', '310.00000', '', '3', '0', '', '2023-04-20 11:50:32', '2023-04-20 12:03:57');
INSERT INTO `tbl_products` VALUES ('326', '1237', '1237', '24D-Amine-Gallon- Vast', '720.00', '0.00000', '', '3', '0', '', '2023-04-22 12:37:48', '2023-04-22 12:37:48');
INSERT INTO `tbl_products` VALUES ('327', '3025', '3025', '2100-Sunrise', '620.00', '686.00000', '', '2', '0', '', '2023-04-23 13:48:32', '2023-07-15 06:28:56');
INSERT INTO `tbl_products` VALUES ('328', '4030', '4030', 'Parts- Single Nozzle', '150.00', '100.00000', '', '4', '0', '', '2023-04-26 11:18:45', '2023-04-26 11:26:58');
INSERT INTO `tbl_products` VALUES ('329', '4031', '4031', 'Parts- 2- Holes- Silver', '150.00', '125.00000', '', '4', '0', '', '2023-04-26 11:19:26', '2023-04-26 11:26:58');
INSERT INTO `tbl_products` VALUES ('330', '4032', '4032', 'Parts- 3 Holes Nozzle', '150.00', '125.00000', '', '4', '0', '', '2023-04-26 11:19:48', '2023-04-26 11:26:58');
INSERT INTO `tbl_products` VALUES ('331', '4033', '4033', 'Parts- Plastic Handle', '150.00', '125.00000', '', '4', '0', '', '2023-04-26 11:20:25', '2023-04-26 11:26:58');
INSERT INTO `tbl_products` VALUES ('332', '4034', '4034', 'Parts- Plastic Gasket', '80.00', '55.00000', '', '4', '0', '', '2023-04-26 11:21:03', '2023-04-26 11:26:58');
INSERT INTO `tbl_products` VALUES ('333', '4035', '4035', 'Parts- Plastic Noozle', '200.00', '145.00000', '', '4', '0', '', '2023-04-26 11:21:40', '2023-04-26 11:26:58');
INSERT INTO `tbl_products` VALUES ('334', '4036', '4036', 'Parts- Rod ( Extension)', '400.00', '350.00000', '', '4', '0', '', '2023-04-26 11:22:39', '2023-04-26 11:26:58');
INSERT INTO `tbl_products` VALUES ('335', '4037', '4037', 'Parts- Handle ( red)', '150.00', '45.55000', '', '4', '0', '', '2023-04-26 11:26:37', '2023-11-28 16:23:30');
INSERT INTO `tbl_products` VALUES ('336', '3026', '3026', '4600- Sunrise', '1400.00', '1356.00000', '', '2', '0', '', '2023-04-26 15:57:56', '2023-05-13 06:35:08');
INSERT INTO `tbl_products` VALUES ('337', '1238', '1238', 'Diuron- FKA', '630.00', '570.00000', '', '3', '0', '', '2023-05-03 12:06:54', '2023-05-03 12:21:04');
INSERT INTO `tbl_products` VALUES ('338', '1239', '1239', 'Crop Giant Blue- 10+50+10', '370.00', '335.00000', '', '3', '0', '', '2023-05-08 14:14:07', '2023-05-08 14:14:49');
INSERT INTO `tbl_products` VALUES ('339', '1240', '1240', 'Scorpio 500ml', '550.00', '460.00000', '', '3', '0', '', '2023-05-08 14:18:06', '2023-12-27 13:10:12');
INSERT INTO `tbl_products` VALUES ('340', '1241', '1241', 'Round up- FREE', '0.00', '0.00000', '', '3', '0', '', '2023-05-18 14:37:50', '2023-05-18 14:37:50');
INSERT INTO `tbl_products` VALUES ('341', '4038', '4038', 'Sack-BMeg', '14.50', '12.00000', '', '4', '0', '', '2023-05-19 13:28:31', '2023-05-19 15:06:21');
INSERT INTO `tbl_products` VALUES ('342', '4039', '4039', 'Trapal-8ft', '50.00', '34.00000', '', '4', '0', '', '2023-05-19 15:04:48', '2023-07-19 16:00:45');
INSERT INTO `tbl_products` VALUES ('343', '4040', '4040', 'Trapal-12ft', '70.00', '51.67000', '', '4', '0', '', '2023-05-19 15:05:21', '2023-07-27 12:12:54');
INSERT INTO `tbl_products` VALUES ('344', '4041', '4041', 'Furion', '650.00', '560.00000', '', '3', '0', '', '2023-05-19 15:16:00', '2023-07-12 12:48:48');
INSERT INTO `tbl_products` VALUES ('345', '1242', '1242', 'Pennant  liter', '1000.00', '950.00000', '', '3', '0', '', '2023-05-25 14:16:11', '2023-05-25 14:25:29');
INSERT INTO `tbl_products` VALUES ('346', '1243', '1243', 'Ametra Kilo', '1000.00', '950.00000', '', '3', '0', '', '2023-05-25 14:17:24', '2023-05-25 14:25:29');
INSERT INTO `tbl_products` VALUES ('347', '2028', '2028', 'D-8131s- Kilo', '730.00', '682.63778', '', '1', '0', '', '2023-05-28 06:31:59', '2023-07-29 07:36:47');
INSERT INTO `tbl_products` VALUES ('348', '1244', '1244', '24D-Amine-Gal (Double kill)', '750.00', '542.66710', '', '3', '0', '', '2023-05-29 14:25:06', '2023-10-22 11:17:13');
INSERT INTO `tbl_products` VALUES ('349', '1245', '1245', 'Grow More- Blue ( 10-50-10)', '370.00', '0.00000', '', '3', '0', '', '2023-05-30 13:29:07', '2023-05-30 13:29:07');
INSERT INTO `tbl_products` VALUES ('350', '1246', '1246', 'Daconil-Lit', '920.00', '860.00000', '', '3', '0', '', '2023-05-31 17:20:02', '2023-05-31 17:30:24');
INSERT INTO `tbl_products` VALUES ('351', '1247', '1247', 'Armure 250ml', '800.00', '695.00000', '', '3', '0', '', '2023-05-31 17:21:57', '2023-07-19 13:00:18');
INSERT INTO `tbl_products` VALUES ('352', '4042', '4042', 'Trapal- 10 ft', '65.00', '404.46506', '', '4', '0', '', '2023-06-01 16:01:09', '2023-12-10 08:47:58');
INSERT INTO `tbl_products` VALUES ('353', '4043', '4043', 'Trapal 8ft- Roll', '4300.00', '3400.00000', '', '4', '0', '', '2023-06-01 16:03:53', '2023-06-01 17:02:27');
INSERT INTO `tbl_products` VALUES ('354', '4044', '4044', 'Trapal 10ft- Roll', '6400.00', '5200.00000', '', '4', '0', '', '2023-06-01 16:04:18', '2023-12-23 06:24:41');
INSERT INTO `tbl_products` VALUES ('355', '4045', '4045', 'Trapal 12ft - Roll', '6800.00', '5083.33334', '', '4', '0', '', '2023-06-01 16:05:03', '2023-12-10 08:47:58');
INSERT INTO `tbl_products` VALUES ('356', '4046', '4046', 'Sack- 25kg', '10.00', '8.70000', '', '4', '0', '', '2023-06-01 17:01:54', '2023-06-01 17:02:27');
INSERT INTO `tbl_products` VALUES ('357', '1248', '1248', 'ClearZero- liter', '1120.00', '1050.00000', '', '3', '0', '', '2023-06-02 12:29:01', '2023-11-28 08:33:03');
INSERT INTO `tbl_products` VALUES ('358', '1249', '249', 'Sharp Shooter- Gallon', '1380.00', '3.72563', '', '3', '0', '', '2023-06-05 14:25:48', '2024-01-04 07:28:46');
INSERT INTO `tbl_products` VALUES ('359', '1250', '1250', 'Sharp Shooter-liter', '420.00', '420.00000', '', '3', '0', '', '2023-06-05 14:26:16', '2024-02-04 11:31:20');
INSERT INTO `tbl_products` VALUES ('360', '2029', '2029', 'P3582', '5300.00', '5100.00000', '', '1', '0', '', '2023-06-10 12:00:09', '2024-02-06 17:53:11');
INSERT INTO `tbl_products` VALUES ('361', '1251', '1251', 'Salvador-Liter', '1570.00', '1500.00000', '', '3', '0', '', '2023-06-11 17:51:16', '2023-06-11 17:51:43');
INSERT INTO `tbl_products` VALUES ('362', '4047', '4047', 'Walis-paypay', '75.00', '0.00000', '', '5', '0', '', '2023-06-11 18:03:16', '2023-06-11 18:03:35');
INSERT INTO `tbl_products` VALUES ('363', '4048', '4048', 'Higot sa manok', '40.00', '25.00000', '', '5', '0', '', '2023-06-11 18:52:18', '2023-06-11 19:00:26');
INSERT INTO `tbl_products` VALUES ('364', '2030', '2030', 'Evo-9300', '2900.00', '2800.00000', '', '1', '0', '', '2023-06-14 09:11:12', '2023-12-21 06:09:05');
INSERT INTO `tbl_products` VALUES ('365', '2031', '2031', 'PAC 339', '5400.00', '5200.00000', '', '1', '0', '', '2023-06-20 17:35:33', '2023-09-08 13:32:27');
INSERT INTO `tbl_products` VALUES ('366', '2032', '2032', 'SUPER 999', '5400.00', '5200.00000', '', '1', '0', '', '2023-06-20 17:36:17', '2023-09-08 13:32:27');
INSERT INTO `tbl_products` VALUES ('367', '2033', '2033', 'Rice- Dinorado 50kg', '2600.00', '2114.28571', '', '7', '0', '', '2023-06-20 17:40:27', '2023-08-28 15:12:49');
INSERT INTO `tbl_products` VALUES ('368', '2034', '2034', 'Rice-Dinorado 25kg', '1300.00', '1022.85600', '', '7', '0', '', '2023-06-20 17:42:07', '2023-08-30 18:00:52');
INSERT INTO `tbl_products` VALUES ('369', '2035', '2035', 'Rice-Dinorado 1kg', '60.00', '43.68116', '', '7', '0', '', '2023-06-20 17:43:56', '2023-08-29 17:16:03');
INSERT INTO `tbl_products` VALUES ('370', '2036', '2036', 'Bioseed 108- Kilo', '420.00', '358.11450', '', '1', '0', '', '2023-06-21 12:14:12', '2023-08-18 12:21:54');
INSERT INTO `tbl_products` VALUES ('371', '1252', '1252', 'Y Kurat', '420.00', '350.00000', '', '3', '0', '', '2023-06-22 19:32:53', '2023-06-22 19:36:36');
INSERT INTO `tbl_products` VALUES ('372', '2037', '2037', 'Upa/Tahop', '14.00', '10.00000', '', '5', '0', '', '2023-06-23 10:48:48', '2024-02-06 18:20:25');
INSERT INTO `tbl_products` VALUES ('373', '3027', '3027', '2100-Swire', '640.00', '600.00000', '', '2', '0', '', '2023-06-23 12:09:47', '2023-07-07 05:46:53');
INSERT INTO `tbl_products` VALUES ('374', '3028', '3028', '16200-Agro Planters', '1450.00', '1419.56044', '', '2', '0', '', '2023-06-23 12:10:31', '2023-09-22 13:07:33');
INSERT INTO `tbl_products` VALUES ('375', '3029', '3029', '0060-Agro Planters', '2420.00', '0.00000', '', '2', '0', '', '2023-06-23 19:20:22', '2023-07-06 18:00:30');
INSERT INTO `tbl_products` VALUES ('376', '3030', '3030', 'Yara Hydran', '2680.00', '2200.00000', '', '2', '0', '', '2023-06-25 13:18:24', '2023-11-11 14:49:22');
INSERT INTO `tbl_products` VALUES ('377', '2038', '2038', 'Valencia Rice-25kg', '1050.00', '1009.37500', '', '7', '0', '', '2023-06-27 07:34:08', '2023-07-12 12:12:39');
INSERT INTO `tbl_products` VALUES ('378', '2039', '2039', 'Valencia Rice-20 kg', '870.00', '1000.00000', '', '7', '0', '', '2023-06-27 07:35:12', '2023-08-12 09:45:11');
INSERT INTO `tbl_products` VALUES ('379', '2040', '2040', 'Valencia Rice- 1k', '50.00', '50.00000', '', '7', '0', '', '2023-06-27 07:52:27', '2023-08-20 16:06:05');
INSERT INTO `tbl_products` VALUES ('380', '2041', '2041', 'Rice-Alas 25kg', '1100.00', '1050.00000', '', '7', '0', '', '2023-06-27 07:56:28', '2023-06-27 08:04:04');
INSERT INTO `tbl_products` VALUES ('381', '2042', '2042', 'Rice-Alas 1kg', '50.00', '42.00000', '', '7', '0', '', '2023-06-27 07:56:58', '2023-08-17 15:50:56');
INSERT INTO `tbl_products` VALUES ('382', '2043', '2043', 'Rice-Young Chow 25kg', '1420.00', '1380.00000', '', '7', '0', '', '2023-06-27 07:58:58', '2023-12-13 17:51:04');
INSERT INTO `tbl_products` VALUES ('383', '2044', '2044', 'Rice-Young Chow 1kg', '58.00', '55.20000', '', '7', '0', '', '2023-06-27 08:00:11', '2023-12-14 08:49:52');
INSERT INTO `tbl_products` VALUES ('384', '2045', '2045', 'Rice-Dinorado 20kg', '1000.00', '800.00000', '', '7', '0', '', '2023-06-27 08:01:19', '2023-07-13 17:27:06');
INSERT INTO `tbl_products` VALUES ('385', '4049', '4049', 'Sprayer- Uni-up 16kg', '2200.00', '1580.00000', '', '4', '0', '', '2023-06-27 09:38:24', '2023-06-27 09:47:47');
INSERT INTO `tbl_products` VALUES ('386', '4050', '4050', 'Sprayer-2L', '250.00', '150.00000', '', '4', '0', '', '2023-06-27 09:47:18', '2023-10-07 14:06:43');
INSERT INTO `tbl_products` VALUES ('387', '1253', '1253', 'GPS-Gal', '1200.00', '1078.00000', '', '3', '0', '', '2023-06-27 16:52:47', '2023-09-07 08:02:50');
INSERT INTO `tbl_products` VALUES ('388', '1254', '1254', 'GPS-Liter', '400.00', '300.00000', '', '3', '0', '', '2023-06-27 16:53:12', '2023-06-27 16:53:50');
INSERT INTO `tbl_products` VALUES ('389', '5001', '5001', 'Integra 1000-sack', '2160.00', '2110.00000', '', '8', '0', '', '2023-06-27 17:25:27', '2023-10-07 12:13:14');
INSERT INTO `tbl_products` VALUES ('390', '5002', '5002', 'Integra 2000-sack', '1970.00', '1920.00000', '', '8', '0', '', '2023-06-27 17:25:53', '2024-01-21 05:42:29');
INSERT INTO `tbl_products` VALUES ('391', '5003', '5003', 'Integra 3000', '1790.00', '1742.00000', '', '8', '0', '', '2023-06-27 17:27:58', '2024-01-28 12:59:47');
INSERT INTO `tbl_products` VALUES ('392', '5004', '5004', 'Integra 3000 plus', '1890.00', '1837.00000', '', '8', '0', '', '2023-06-27 17:29:50', '2024-02-04 11:14:47');
INSERT INTO `tbl_products` VALUES ('393', '5005', '5005', 'BNZ-Starter 50kg', '1761.00', '1693.16667', '', '8', '0', '', '2023-06-27 17:39:52', '2024-01-15 09:50:59');
INSERT INTO `tbl_products` VALUES ('394', '5006', '5006', 'BNZ-Grower 50kg', '1676.00', '1605.83333', '', '8', '0', '', '2023-06-27 17:40:34', '2024-01-15 09:50:59');
INSERT INTO `tbl_products` VALUES ('395', '5007', '5007', 'BNZ-Finisher 50kg', '1640.00', '1569.79167', '', '8', '0', '', '2023-06-27 17:43:12', '2024-01-28 12:59:48');
INSERT INTO `tbl_products` VALUES ('396', '5008', '5008', 'BNZ-Gestating 50kg', '1629.00', '1559.00000', '', '8', '0', '', '2023-06-27 17:48:53', '2024-02-04 11:14:47');
INSERT INTO `tbl_products` VALUES ('397', '5009', '5009', 'BNZ-Lactating 50kg', '1720.00', '1678.00000', '', '8', '0', '', '2023-06-27 17:49:35', '2024-01-28 12:59:48');
INSERT INTO `tbl_products` VALUES ('398', '5010', '5010', 'Hog Pre-Starter Expert', '1272.00', '1351.00000', '', '8', '0', '', '2023-06-27 17:56:45', '2024-01-15 09:50:59');
INSERT INTO `tbl_products` VALUES ('399', '5011', '5011', 'BSC', '2174.00', '2104.00000', '', '8', '0', '', '2023-06-27 17:57:46', '2023-06-28 11:20:08');
INSERT INTO `tbl_products` VALUES ('400', '5012', '5012', 'CGC', '1970.00', '1900.00000', '', '8', '0', '', '2023-06-27 17:58:15', '2023-06-28 11:20:08');
INSERT INTO `tbl_products` VALUES ('401', '5013', '5013', 'Ultrapack- Starter 50kg', '2100.00', '2045.00000', '', '8', '0', '', '2023-06-27 18:02:08', '2024-01-22 06:55:14');
INSERT INTO `tbl_products` VALUES ('402', '5014', '5014', 'Ultrapack-Grower 50kg', '2050.00', '1906.16471', '', '8', '0', '', '2023-06-27 18:02:46', '2024-02-02 17:06:53');
INSERT INTO `tbl_products` VALUES ('403', '5015', '5015', 'Ultrapack-Pre Starter 25kg', '1470.00', '1340.00000', '', '8', '0', '', '2023-06-27 18:06:02', '2024-01-24 06:00:36');
INSERT INTO `tbl_products` VALUES ('404', '5016', '5016', 'Ultrapack-Finisher 50kg', '1950.00', '1804.28571', '', '8', '0', '', '2023-06-27 18:08:00', '2024-02-02 17:08:14');
INSERT INTO `tbl_products` VALUES ('405', '5017', '5017', 'GalMax 1- sack', '2055.00', '2055.00000', '', '8', '0', '', '2023-07-01 10:13:33', '2024-01-24 06:00:36');
INSERT INTO `tbl_products` VALUES ('406', '5018', '5019', 'GalMax 2- sack', '1960.00', '1890.00000', '', '8', '0', '', '2023-07-01 10:13:55', '2024-01-24 06:00:36');
INSERT INTO `tbl_products` VALUES ('407', '5020', '5020', 'GalMax- 2 plus', '1980.00', '1910.00000', '', '8', '0', '', '2023-07-01 10:18:00', '2024-01-24 06:00:36');
INSERT INTO `tbl_products` VALUES ('408', '5021', '5021', 'Floaters-Grower', '1200.00', '1170.00000', '', '8', '0', '', '2023-07-01 10:30:17', '2023-12-27 12:57:28');
INSERT INTO `tbl_products` VALUES ('409', '5022', '5022', 'Floaters-Starter', '1230.00', '1228.12500', '', '8', '0', '', '2023-07-01 10:30:47', '2024-01-15 09:50:59');
INSERT INTO `tbl_products` VALUES ('410', '50221', '50221', 'Vetracin-Gold', '24.00', '22.93677', '', '9', '0', '', '2023-07-01 10:42:32', '2024-01-21 05:41:00');
INSERT INTO `tbl_products` VALUES ('411', '5023', '5023', 'Vetracin-Prem', '20.00', '16.39628', '', '9', '0', '', '2023-07-01 10:44:29', '2023-12-01 10:10:51');
INSERT INTO `tbl_products` VALUES ('412', '5024', '5024', 'Vetracin-Classic', '13.00', '11.60000', '', '9', '0', '', '2023-07-01 10:44:55', '2023-12-01 10:10:51');
INSERT INTO `tbl_products` VALUES ('413', '5025', '5025', 'Elec-V', '22.00', '13.40000', '', '9', '0', '', '2023-07-01 11:31:48', '2023-07-01 14:03:03');
INSERT INTO `tbl_products` VALUES ('414', '5026', '5026', 'Multi-V- sachet', '16.00', '20.00000', '', '9', '0', '', '2023-07-01 11:33:49', '2023-07-01 14:03:03');
INSERT INTO `tbl_products` VALUES ('415', '5027', '5027', 'Para-V', '16.00', '14.50000', '', '9', '0', '', '2023-07-01 11:40:45', '2023-07-01 14:03:03');
INSERT INTO `tbl_products` VALUES ('416', '5028', '5028', 'Amox-V', '28.00', '24.32432', '', '9', '0', '', '2023-07-01 11:42:54', '2024-01-06 15:10:57');
INSERT INTO `tbl_products` VALUES ('417', '5029', '5029', 'Calcium-bot', '40.00', '33.00000', '', '9', '0', '', '2023-07-01 11:48:34', '2023-07-01 14:03:03');
INSERT INTO `tbl_products` VALUES ('418', '5030', '5030', 'Multi V-Bot', '40.00', '33.00000', '', '9', '0', '', '2023-07-01 12:07:02', '2023-07-01 14:03:03');
INSERT INTO `tbl_products` VALUES ('419', '5031', '5031', 'B12-Tablet', '8.00', '5.98694', '', '9', '0', '', '2023-07-01 12:07:35', '2024-01-21 05:41:00');
INSERT INTO `tbl_products` VALUES ('420', '5032', '5032', 'Premoxil-Tablet', '15.00', '13.00000', '', '9', '0', '', '2023-07-01 12:09:20', '2023-07-01 14:03:03');
INSERT INTO `tbl_products` VALUES ('421', '5033', '5033', 'Amtyl-Tablet', '18.00', '14.17223', '', '9', '0', '', '2023-07-01 12:16:22', '2023-12-27 12:57:28');
INSERT INTO `tbl_products` VALUES ('422', '5034', '5034', 'Hammer', '8.00', '6.00000', '', '9', '0', '', '2023-07-01 12:17:10', '2023-07-01 14:03:03');
INSERT INTO `tbl_products` VALUES ('423', '5035', '5035', 'B-50', '9.00', '7.00000', '', '9', '0', '', '2023-07-01 12:17:34', '2023-12-16 05:57:53');
INSERT INTO `tbl_products` VALUES ('424', '5036', '5036', 'Enerton-pack', '48.00', '44.00000', '', '8', '0', '', '2023-07-01 12:55:41', '2023-11-06 12:01:12');
INSERT INTO `tbl_products` VALUES ('425', '5037', '5037', 'Platinum', '65.00', '62.00000', '', '8', '0', '', '2023-07-01 12:56:18', '2023-08-18 19:45:31');
INSERT INTO `tbl_products` VALUES ('426', '5038', '5038', 'Stag Developer', '55.00', '49.02857', '', '8', '0', '', '2023-07-01 12:57:39', '2024-01-06 15:17:10');
INSERT INTO `tbl_products` VALUES ('427', '5039', '5039', 'Stag developer 4+', '47.00', '42.00000', '', '8', '0', '', '2023-07-01 12:58:10', '2023-07-01 14:03:03');
INSERT INTO `tbl_products` VALUES ('428', '5040', '5040', 'Galmax 1-1kg', '42.00', '41.10000', '', '8', '0', '', '2023-07-01 14:24:33', '2024-02-01 14:03:33');
INSERT INTO `tbl_products` VALUES ('429', '5041', '5041', 'GalMax 2- 1kg', '40.00', '37.80000', '', '8', '0', '', '2023-07-01 14:26:53', '2024-02-01 14:03:33');
INSERT INTO `tbl_products` VALUES ('430', '5042', '5042', 'GalMax 2plus- 1Kg', '41.00', '38.20000', '', '8', '0', '', '2023-07-01 14:30:07', '2024-02-01 14:03:33');
INSERT INTO `tbl_products` VALUES ('431', '5043', '5043', 'Integra 1000- 1Kg', '44.00', '42.20000', '', '8', '0', '', '2023-07-01 14:43:43', '2023-10-07 11:49:20');
INSERT INTO `tbl_products` VALUES ('432', '5044', '5044', 'Integra 2000-1kg', '40.00', '38.40000', '', '8', '0', '', '2023-07-01 14:48:48', '2024-02-01 14:03:33');
INSERT INTO `tbl_products` VALUES ('433', '5045', '5045', 'Integra 3000- 1kg', '36.00', '34.84000', '', '8', '0', '', '2023-07-01 14:53:48', '2024-02-01 14:03:33');
INSERT INTO `tbl_products` VALUES ('434', '5046', '5046', 'Integra 3000 plus- 1kg', '39.00', '36.76000', '', '8', '0', '', '2023-07-01 15:22:51', '2024-02-01 14:03:33');
INSERT INTO `tbl_products` VALUES ('435', '2046', '2046', 'Rice-Red Rice 25kg', '1080.00', '1040.00000', '', '7', '0', '', '2023-07-01 15:29:00', '2023-07-01 16:31:22');
INSERT INTO `tbl_products` VALUES ('436', '2047', '2047', 'Rice-Azuzena 25 kg', '1100.00', '1050.00000', '', '7', '0', '', '2023-07-01 16:16:52', '2023-07-01 16:31:22');
INSERT INTO `tbl_products` VALUES ('437', '5047', '5047', 'BSC-1kg', '45.00', '42.08000', '', '8', '0', '', '2023-07-01 16:44:26', '2023-07-01 17:44:28');
INSERT INTO `tbl_products` VALUES ('438', '5048', '5048', 'CGC-1Kg', '40.00', '38.00000', '', '8', '0', '', '2023-07-01 16:45:05', '2023-07-01 17:44:28');
INSERT INTO `tbl_products` VALUES ('439', '5049', '5049', 'Ultrapack- Starter 1kg', '44.00', '40.90000', '', '8', '0', '', '2023-07-01 17:01:48', '2023-11-10 14:55:31');
INSERT INTO `tbl_products` VALUES ('440', '5050', '5050', 'Ultrapack-Grower 1kg', '42.00', '38.12000', '', '8', '0', '', '2023-07-01 17:03:40', '2024-01-29 11:53:32');
INSERT INTO `tbl_products` VALUES ('441', '5051', '5051', 'Ultrapack- Pre starter- 1kg', '60.00', '53.60000', '', '8', '0', '', '2023-07-01 17:05:47', '2024-02-03 07:33:32');
INSERT INTO `tbl_products` VALUES ('442', '5052', '5052', 'Ultrapack-Finisher 1kg', '40.00', '36.09000', '', '8', '0', '', '2023-07-01 17:08:47', '2024-02-01 14:03:33');
INSERT INTO `tbl_products` VALUES ('443', '5053', '5053', 'Pre-starter expert- 1kg', '52.00', '56.85052', '', '8', '0', '', '2023-07-01 17:32:01', '2024-01-20 07:47:22');
INSERT INTO `tbl_products` VALUES ('444', '5054', '5054', 'BNZ- Starter 1kg', '36.00', '33.86000', '', '8', '0', '', '2023-07-01 17:35:42', '2024-02-01 16:44:01');
INSERT INTO `tbl_products` VALUES ('445', '5055', '5055', 'BNZ-Grower 1kg', '35.00', '32.12000', '', '8', '0', '', '2023-07-01 17:36:21', '2024-02-01 16:44:02');
INSERT INTO `tbl_products` VALUES ('446', '5056', '5056', 'BNZ-Finisher 1kg', '34.00', '31.40000', '', '8', '0', '', '2023-07-01 17:36:59', '2024-02-01 16:44:02');
INSERT INTO `tbl_products` VALUES ('447', '5057', '5057', 'BNZ-Gestating 1kg', '34.00', '31.19000', '', '8', '0', '', '2023-07-01 17:37:38', '2024-02-01 16:44:02');
INSERT INTO `tbl_products` VALUES ('448', '5058', '5058', 'BNZ-Lactating 1kg', '36.00', '33.56000', '', '8', '0', '', '2023-07-01 17:38:10', '2024-02-01 16:44:02');
INSERT INTO `tbl_products` VALUES ('449', '4051', '4051', 'Sprayer-Tonbo', '2200.00', '1600.00000', '', '4', '0', '', '2023-07-02 09:14:34', '2023-07-02 09:15:10');
INSERT INTO `tbl_products` VALUES ('450', '1255', '1255', 'Acanto 500ml', '1700.00', '1589.28571', '', '3', '0', '', '2023-07-02 09:28:56', '2023-09-21 08:07:12');
INSERT INTO `tbl_products` VALUES ('451', '5059', '5059', 'Floaters Starter- 1kg', '52.00', '49.13000', '', '8', '0', '', '2023-07-02 13:30:44', '2024-02-01 14:03:33');
INSERT INTO `tbl_products` VALUES ('452', '5060', '5060', 'Red Pellets-sack', '1550.00', '1479.24604', '', '8', '0', '', '2023-07-05 07:07:14', '2023-12-27 12:54:07');
INSERT INTO `tbl_products` VALUES ('453', '5061', '5061', 'Red Pellets- 1 kg', '32.00', '29.58000', '', '8', '0', '', '2023-07-05 07:08:06', '2024-02-01 16:44:01');
INSERT INTO `tbl_products` VALUES ('454', '5062', '5062', 'Rice-Red Rice 1kg', '45.00', '41.60000', '', '7', '0', '', '2023-07-05 13:44:28', '2023-07-05 13:45:04');
INSERT INTO `tbl_products` VALUES ('455', '1256', '1256', 'Pacyaw', '1080.00', '188.65443', '', '3', '0', '', '2023-07-06 11:11:11', '2024-01-04 07:28:46');
INSERT INTO `tbl_products` VALUES ('456', '5063', '5063', 'Rice-Red Rice 20kg', '890.00', '0.00000', '', '7', '0', '', '2023-07-07 07:56:06', '2023-07-07 07:56:06');
INSERT INTO `tbl_products` VALUES ('457', '5064', '5064', 'Rice-Azuzena 20 kg', '900.00', '0.00000', '', '7', '0', '', '2023-07-07 08:02:03', '2023-07-07 08:02:03');
INSERT INTO `tbl_products` VALUES ('458', '5065', '5065', 'Super Biik 25kg', '1927.00', '1877.00000', '', '8', '0', '', '2023-07-07 13:09:08', '2023-07-14 13:09:50');
INSERT INTO `tbl_products` VALUES ('459', '5066', '5066', 'Slasher 25kg', '800.00', '960.00000', '', '8', '0', '', '2023-07-07 13:09:56', '2023-12-07 15:29:21');
INSERT INTO `tbl_products` VALUES ('460', '5067', '5067', '7-Kinds 25kg', '865.00', '860.00000', '', '8', '0', '', '2023-07-07 13:10:34', '2024-01-06 15:17:10');
INSERT INTO `tbl_products` VALUES ('461', '2048', '2048', 'Rice-#36-50 kg', '1850.00', '1850.00000', '', '7', '0', '', '2023-07-08 13:32:36', '2023-07-13 17:47:09');
INSERT INTO `tbl_products` VALUES ('462', '1257', '1257', 'Atrazine kilo', '570.00', '520.00000', '', '3', '0', '', '2023-07-11 06:01:01', '2023-07-11 06:06:31');
INSERT INTO `tbl_products` VALUES ('463', '1258', '1258', 'Prevathon 250', '850.00', '810.00000', '', '3', '0', '', '2023-07-11 06:02:47', '2023-07-11 06:06:31');
INSERT INTO `tbl_products` VALUES ('464', '5068', '5068', 'GalMax 3- sack', '1920.00', '1870.00000', '', '8', '0', '', '2023-07-11 12:27:33', '2024-01-06 15:17:36');
INSERT INTO `tbl_products` VALUES ('465', '5069', '5069', 'GalMax 3- 1KG', '40.00', '37.40000', '', '8', '0', '', '2023-07-11 12:28:19', '2024-02-01 14:03:33');
INSERT INTO `tbl_products` VALUES ('466', '1259', '1259', 'Megatonic Twin pack lit', '1300.00', '1250.00000', '', '3', '0', '', '2023-07-11 13:06:55', '2023-07-11 13:28:32');
INSERT INTO `tbl_products` VALUES ('467', '1260', '1260', 'Megatonic Twin pack 500ml', '870.00', '820.00000', '', '3', '0', '', '2023-07-11 13:07:29', '2023-07-11 13:28:32');
INSERT INTO `tbl_products` VALUES ('468', '1261', '1261', 'Megatonic Twin 250ml', '470.00', '430.00000', '', '3', '0', '', '2023-07-11 13:08:06', '2023-07-11 13:28:32');
INSERT INTO `tbl_products` VALUES ('469', '1262', '1262', 'APSA 1000ml', '900.00', '825.00000', '', '3', '0', '', '2023-07-13 13:42:41', '2023-07-13 13:46:04');
INSERT INTO `tbl_products` VALUES ('470', '1263', '1263', 'Nutriplant-150g', '400.00', '340.00000', '', '3', '0', '', '2023-07-13 13:43:35', '2023-07-13 13:46:04');
INSERT INTO `tbl_products` VALUES ('471', '2049', '2049', 'Rice-#36-25kg', '940.00', '0.00000', '', '7', '0', '', '2023-07-13 17:41:16', '2023-07-13 17:41:16');
INSERT INTO `tbl_products` VALUES ('472', '2050', '2050', 'Rice-#36-20 kg', '830.00', '800.00000', '', '7', '0', '', '2023-07-13 17:42:15', '2023-07-14 12:51:29');
INSERT INTO `tbl_products` VALUES ('473', '2052', '2052', 'Rice-#36-1kg	', '40.00', '40.00000', '', '7', '0', '', '2023-07-13 17:44:17', '2023-07-19 08:57:14');
INSERT INTO `tbl_products` VALUES ('474', '2053', '2053', 'Rice- Idol 25kg', '1270.00', '1210.00000', '', '7', '0', '', '2023-07-14 13:01:37', '2023-12-17 05:39:36');
INSERT INTO `tbl_products` VALUES ('475', '2054', '2054', 'Rice- Idol 20kg', '930.00', '871.20000', '', '7', '0', '', '2023-07-14 13:02:16', '2023-12-27 07:08:25');
INSERT INTO `tbl_products` VALUES ('476', '5070', '5070', 'Slasher- 1kg', '40.00', '38.40000', '', '8', '0', '', '2023-07-14 13:08:27', '2024-02-01 16:44:01');
INSERT INTO `tbl_products` VALUES ('477', '5071', '5071', 'Super Biik 1kg', '85.00', '75.08000', '', '8', '0', '', '2023-07-14 13:11:38', '2023-07-14 13:14:08');
INSERT INTO `tbl_products` VALUES ('478', '5072', '5072', '7-Kinds 1 kg', '37.00', '34.40000', '', '8', '0', '', '2023-07-14 13:15:46', '2024-02-01 14:03:33');
INSERT INTO `tbl_products` VALUES ('479', '2056', '2056', 'Ukay2x- 6505', '2400.00', '2200.00000', '', '1', '0', '', '2023-07-15 10:53:18', '2023-07-15 10:53:46');
INSERT INTO `tbl_products` VALUES ('480', '1264', '1264', 'Scorpio 100G', '170.00', '135.00000', '', '3', '0', '', '2023-07-17 14:20:08', '2023-07-17 14:21:15');
INSERT INTO `tbl_products` VALUES ('481', '5073', '5073', 'Baby  Stag Booster', '53.00', '50.00016', '', '8', '0', '', '2023-07-17 15:23:52', '2024-01-06 15:17:10');
INSERT INTO `tbl_products` VALUES ('482', '5074', '5074', 'Pigro Pre- Starter 25kg', '1668.00', '1609.42857', '', '8', '0', '', '2023-07-17 15:26:39', '2024-01-19 09:07:27');
INSERT INTO `tbl_products` VALUES ('483', '5075', '5075', 'Animal Vita', '85.00', '73.00000', '', '8', '0', '', '2023-07-17 15:27:58', '2023-12-01 10:10:51');
INSERT INTO `tbl_products` VALUES ('484', '5076', '5076', 'Pigro Pre- Starter 1kg', '68.00', '64.38000', '', '8', '0', '', '2023-07-17 15:33:12', '2024-02-01 14:03:33');
INSERT INTO `tbl_products` VALUES ('485', '5077', '5077', 'Pigro-Starter 50kg', '1915.00', '1855.00000', '', '8', '0', '', '2023-07-17 15:35:24', '2024-01-06 15:17:10');
INSERT INTO `tbl_products` VALUES ('486', '5078', '5078', 'Pigro-Starter 1kg', '40.00', '37.10000', '', '8', '0', '', '2023-07-17 15:35:56', '2024-01-17 16:02:57');
INSERT INTO `tbl_products` VALUES ('487', '5079', '5079', 'Pigro-Grower 50kg', '1830.00', '1775.00000', '', '8', '0', '', '2023-07-17 15:37:48', '2023-11-06 12:10:34');
INSERT INTO `tbl_products` VALUES ('488', '5080', '5080', 'Pigro-Grower 1kg', '37.00', '35.50000', '', '8', '0', '', '2023-07-17 15:38:20', '2024-02-01 14:03:33');
INSERT INTO `tbl_products` VALUES ('489', '5081', '5081', 'Pigro-Finisher 50kg', '1750.00', '1690.00000', '', '8', '0', '', '2023-07-17 15:39:31', '2023-12-11 16:46:26');
INSERT INTO `tbl_products` VALUES ('490', '5082', '5082', 'Pigro-Finisher 1kg', '35.00', '32.72073', '', '8', '0', '', '2023-07-17 15:40:27', '2024-01-26 11:57:09');
INSERT INTO `tbl_products` VALUES ('491', '5083', '5083', 'Enerton-1kg', '46.00', '41.00000', '', '8', '0', '', '2023-07-18 12:11:20', '2023-07-18 12:15:07');
INSERT INTO `tbl_products` VALUES ('492', '5084', '5084', 'Floaters-Grower 1kg', '51.00', '46.80000', '', '8', '0', '', '2023-07-18 12:23:27', '2024-02-01 14:03:33');
INSERT INTO `tbl_products` VALUES ('493', '1265', '1265', 'RPG', '350.00', '300.00000', '', '3', '0', '', '2023-07-18 18:05:33', '2023-07-18 18:06:03');
INSERT INTO `tbl_products` VALUES ('494', '1266', '1266', 'Glyflomax lit', '400.00', '340.00000', '', '3', '0', '', '2023-07-20 11:46:53', '2023-07-20 11:53:56');
INSERT INTO `tbl_products` VALUES ('495', '1267', '1267', 'Glufos Gal', '2100.00', '1604.17000', '', '3', '0', '', '2023-07-20 11:47:50', '2024-01-12 10:03:49');
INSERT INTO `tbl_products` VALUES ('496', '1268', '1268', 'Glufos-lit', '700.00', '560.00000', '', '3', '0', '', '2023-07-20 11:48:32', '2024-02-06 13:08:03');
INSERT INTO `tbl_products` VALUES ('497', '2051', '2051', 'MD30', '3300.00', '0.00000', '', '1', '0', '', '2023-07-26 06:21:19', '2023-07-26 06:21:19');
INSERT INTO `tbl_products` VALUES ('498', '2055', '2055', 'Mais-saka', '2500.00', '0.00000', '', '1', '0', '', '2023-07-26 06:22:30', '2023-07-26 06:22:30');
INSERT INTO `tbl_products` VALUES ('499', '2057', '2057', 'Masipag 20kg', '990.00', '780.00000', '', '7', '0', '', '2023-07-26 06:56:47', '2023-08-29 05:54:17');
INSERT INTO `tbl_products` VALUES ('500', '5085', '5085', 'Ambroxitil 5gms', '30.00', '28.87802', '', '9', '0', '', '2023-07-26 07:41:16', '2024-01-21 05:41:00');
INSERT INTO `tbl_products` VALUES ('501', '5086', '5086', 'Astig 100&#39;s', '9.00', '6.93010', '', '9', '0', '', '2023-07-26 07:42:45', '2023-12-27 12:57:28');
INSERT INTO `tbl_products` VALUES ('502', '5087', '5087', 'Voltplex KQ 100&#39;s', '15.00', '11.77119', '', '9', '0', '', '2023-07-26 07:44:45', '2024-01-21 05:41:00');
INSERT INTO `tbl_products` VALUES ('503', '5088', '5088', 'Promotor 43 100&#39;s', '15.00', '12.52703', '', '9', '0', '', '2023-07-26 07:45:48', '2024-01-06 15:10:31');
INSERT INTO `tbl_products` VALUES ('504', '5089', '5089', 'Bastonero Pus 5grms', '25.00', '17.13750', '', '9', '0', '', '2023-07-26 07:46:39', '2023-12-07 15:29:21');
INSERT INTO `tbl_products` VALUES ('505', '4052', '4052', 'Waterer 1Gal', '90.00', '70.00000', '', '5', '0', '', '2023-07-26 14:24:59', '2023-07-26 14:26:55');
INSERT INTO `tbl_products` VALUES ('506', '4053', '4053', 'Waterer 1/2 gal', '75.00', '55.00000', '', '5', '0', '', '2023-07-26 14:25:34', '2023-07-26 14:26:55');
INSERT INTO `tbl_products` VALUES ('507', '4054', '4054', 'Feederer', '80.00', '50.00000', '', '5', '0', '', '2023-07-26 14:26:03', '2023-07-26 14:27:12');
INSERT INTO `tbl_products` VALUES ('508', '4055', '4055', 'T-Box Small', '80.00', '38.87317', '', '4', '0', '', '2023-07-26 14:32:56', '2023-12-23 06:24:41');
INSERT INTO `tbl_products` VALUES ('509', '1269', '1269', 'Cypermethrine 250ml', '150.00', '105.00000', '', '3', '0', '', '2023-07-28 07:40:07', '2023-07-28 07:45:44');
INSERT INTO `tbl_products` VALUES ('510', '1270', '1270', 'Alika 250ml', '820.00', '760.00000', '', '3', '0', '', '2023-07-28 07:44:34', '2023-10-26 17:32:15');
INSERT INTO `tbl_products` VALUES ('511', '1271', '1271', 'Pexalon ', '850.00', '770.00000', '', '3', '0', '', '2023-07-28 15:36:03', '2023-07-28 15:37:14');
INSERT INTO `tbl_products` VALUES ('512', '1272', '1272', 'Happy Farmers', '750.00', '500.00000', '', '3', '0', '', '2023-07-29 12:05:59', '2024-02-06 13:09:17');
INSERT INTO `tbl_products` VALUES ('513', '1273', '1273', 'G Shot gal', '1050.00', '807.11111', '', '3', '0', '', '2023-08-02 10:08:06', '2023-10-27 15:17:09');
INSERT INTO `tbl_products` VALUES ('514', '1274', '1274', 'Global lit', '300.00', '250.00000', '', '3', '0', '', '2023-08-02 10:15:04', '2023-11-29 11:46:03');
INSERT INTO `tbl_products` VALUES ('515', '1275', '1275', 'Cartap- Sino M', '170.00', '110.00000', '', '3', '0', '', '2023-08-02 10:15:59', '2023-08-24 08:13:31');
INSERT INTO `tbl_products` VALUES ('516', '2058', '2058', 'NK 6130', '5600.00', '5266.83452', '', '1', '0', '', '2023-08-04 13:38:01', '2023-12-16 05:45:34');
INSERT INTO `tbl_products` VALUES ('517', '1276', '1276', 'Supremo gal', '1080.00', '909.09000', '', '3', '0', '', '2023-08-04 15:07:50', '2024-01-24 13:06:13');
INSERT INTO `tbl_products` VALUES ('518', '1277', '1277', 'Halex Gal', '1400.00', '1250.00000', '', '3', '0', '', '2023-08-05 12:18:28', '2023-08-05 12:20:00');
INSERT INTO `tbl_products` VALUES ('519', '2059', '2059', 'Rice-Masipag 25kg', '1240.00', '0.00000', '', '7', '0', '', '2023-08-05 17:39:25', '2023-08-29 05:54:35');
INSERT INTO `tbl_products` VALUES ('520', '2060', '2060', 'Rice-Maragakit 25kg', '1020.00', '0.00000', '', '7', '0', '', '2023-08-11 11:43:05', '2023-08-11 11:43:05');
INSERT INTO `tbl_products` VALUES ('521', '2061', '2061', 'Rice-Maragakit 20kg', '850.00', '0.00000', '', '7', '0', '', '2023-08-11 11:44:03', '2023-08-11 11:44:03');
INSERT INTO `tbl_products` VALUES ('522', '2062', '2062', 'Rice-Maragakit 1kg', '48.00', '0.00000', '', '7', '0', '', '2023-08-11 11:45:41', '2023-08-17 15:55:13');
INSERT INTO `tbl_products` VALUES ('523', '2063', '2063', 'Rice-Basak 20kg', '970.00', '0.00000', '', '7', '0', '', '2023-08-12 10:43:19', '2023-08-26 12:44:37');
INSERT INTO `tbl_products` VALUES ('524', '2064', '2064', 'Rice-Dragon 20kg', '1000.00', '0.00000', '', '7', '0', '', '2023-08-13 10:35:27', '2023-08-13 10:35:27');
INSERT INTO `tbl_products` VALUES ('525', '2065', '2065', 'Rice-Dragon 25kg', '1250.00', '0.00000', '', '7', '0', '', '2023-08-13 10:36:35', '2023-08-13 10:36:35');
INSERT INTO `tbl_products` VALUES ('526', '5090', '5090', 'Latigo 1000', '10.00', '8.73000', '', '9', '0', '', '2023-08-16 15:17:33', '2023-12-27 12:57:28');
INSERT INTO `tbl_products` VALUES ('527', '5091', '5091', 'VitMinPro', '25.00', '18.00000', '', '9', '0', '', '2023-08-16 15:18:59', '2023-08-16 15:29:28');
INSERT INTO `tbl_products` VALUES ('528', '5092', '5092', 'Apralyte', '28.00', '23.98000', '', '9', '0', '', '2023-08-16 15:20:35', '2023-08-16 15:29:28');
INSERT INTO `tbl_products` VALUES ('529', '5093', '5093', 'Agmectin', '30.00', '26.79627', '', '9', '0', '', '2023-08-16 15:21:43', '2024-01-06 15:10:31');
INSERT INTO `tbl_products` VALUES ('530', '5094', '5094', 'Aquadox', '27.00', '22.67000', '', '8', '0', '', '2023-08-16 15:26:16', '2023-08-16 15:29:28');
INSERT INTO `tbl_products` VALUES ('531', '1278', '1278', 'Maisagana Bundle', '3350.00', '3250.00000', '', '3', '0', '', '2023-08-17 13:52:30', '2023-08-17 13:53:40');
INSERT INTO `tbl_products` VALUES ('532', '2066', '2066', 'Bioseed 101-Kilo', '500.00', '0.00000', '', '1', '0', '', '2023-08-18 12:21:10', '2023-08-18 12:21:10');
INSERT INTO `tbl_products` VALUES ('533', '1279', '1279', 'White Label', '450.00', '375.00000', '', '3', '0', '', '2023-08-18 12:48:50', '2023-08-18 12:49:55');
INSERT INTO `tbl_products` VALUES ('534', '5095', '5095', 'Immune Booster', '130.00', '105.00000', '', '8', '0', '', '2023-08-18 19:46:30', '2023-08-18 19:48:19');
INSERT INTO `tbl_products` VALUES ('535', '5096', '5096', 'Tube Feeder 3kg', '300.00', '250.00000', '', '4', '0', '', '2023-08-18 19:47:05', '2023-08-18 19:48:19');
INSERT INTO `tbl_products` VALUES ('536', '5097', '5097', 'Tube Feeder 5kg', '380.00', '330.00000', '', '4', '0', '', '2023-08-18 19:47:31', '2023-08-18 19:48:19');
INSERT INTO `tbl_products` VALUES ('537', '1281', '1281', 'Accept lit', '850.00', '785.00000', '', '3', '0', '', '2023-08-22 11:55:01', '2023-08-22 11:56:06');
INSERT INTO `tbl_products` VALUES ('538', '2067', '2067', 'Evo 9307', '3300.00', '3000.00000', '', '1', '0', '', '2023-08-22 12:19:22', '2024-01-24 19:03:11');
INSERT INTO `tbl_products` VALUES ('539', '1282', '1282', 'Slam liter', '500.00', '0.00000', '', '3', '0', '', '2023-08-27 13:45:15', '2023-08-27 13:53:18');
INSERT INTO `tbl_products` VALUES ('540', '1283', '1283', 'Demolition liter', '450.00', '0.00000', '', '3', '0', '', '2023-08-27 13:45:49', '2023-12-24 06:17:43');
INSERT INTO `tbl_products` VALUES ('541', '2068', '2068', 'Rice-Idol 1kg', '53.00', '48.40000', '', '7', '0', '', '2023-08-29 05:53:55', '2024-02-02 12:09:02');
INSERT INTO `tbl_products` VALUES ('542', '2069', '2069', 'Rice- Basak 1Kg', '50.00', '0.00000', '', '7', '0', '', '2023-08-29 11:37:05', '2023-08-29 11:37:05');
INSERT INTO `tbl_products` VALUES ('543', '1284', '1284', 'Konyk Gal', '1150.00', '444.29834', '', '3', '0', '', '2023-09-06 16:25:55', '2023-11-25 14:05:53');
INSERT INTO `tbl_products` VALUES ('544', '1285', '1285', 'Glyner lit', '400.00', '330.00000', '', '3', '0', '', '2023-09-07 12:40:23', '2023-10-05 12:26:46');
INSERT INTO `tbl_products` VALUES ('545', '5098', '5098', 'Tahop-Mais', '25.00', '418.21714', '', '8', '0', '', '2023-09-11 10:33:24', '2023-11-04 15:15:01');
INSERT INTO `tbl_products` VALUES ('546', '5099', '5099', 'Crack Corn- 1kg', '30.00', '24.98763', '', '8', '0', '', '2023-09-11 10:34:28', '2023-10-07 10:48:25');
INSERT INTO `tbl_products` VALUES ('547', '1286', '1286', 'Sweep- Gal', '1050.00', '947.61854', '', '3', '0', '', '2023-09-11 16:05:06', '2024-02-03 09:50:28');
INSERT INTO `tbl_products` VALUES ('548', '1287', '1287', 'Fluazifop lit', '1020.00', '940.00000', '', '3', '0', '', '2023-09-12 10:30:06', '2024-01-06 15:44:00');
INSERT INTO `tbl_products` VALUES ('549', '1288', '1288', 'Tekburn Lit', '720.00', '650.00000', '', '3', '0', '', '2023-09-12 10:31:31', '2023-09-12 10:33:49');
INSERT INTO `tbl_products` VALUES ('550', '1289', '1289', 'Thripshield-pack', '100.00', '90.00000', '', '3', '0', '', '2023-09-12 10:37:24', '2023-09-12 10:38:15');
INSERT INTO `tbl_products` VALUES ('551', '1290', '1290', 'Agroconazole', '750.00', '680.00000', '', '3', '0', '', '2023-09-12 12:18:05', '2023-09-12 12:20:02');
INSERT INTO `tbl_products` VALUES ('553', '2070', '2070', 'Rice- Special 18 kg', '930.00', '871.20000', '', '7', '0', '', '2023-09-15 16:09:46', '2024-01-03 10:12:26');
INSERT INTO `tbl_products` VALUES ('554', '2071', '2071', 'Rice-Special 1kg', '52.00', '51.86000', '', '7', '0', '', '2023-09-15 16:11:15', '2024-02-02 12:09:02');
INSERT INTO `tbl_products` VALUES ('555', '1291', '1291', 'Klear Weed- Case', '6180.00', '0.00000', '', '3', '0', '', '2023-09-21 08:24:51', '2023-09-21 08:24:51');
INSERT INTO `tbl_products` VALUES ('556', '1292', '1292', 'Herbicut-Case', '7080.00', '0.00000', '', '3', '0', '', '2023-09-21 08:47:47', '2023-09-21 09:17:35');
INSERT INTO `tbl_products` VALUES ('557', '1293', '1293', 'Triple 8- Case', '6780.00', '0.00000', '', '3', '0', '', '2023-09-21 08:54:43', '2023-09-21 09:17:53');
INSERT INTO `tbl_products` VALUES ('558', '1294', '1294', 'Alecta- Case', '6780.00', '6000.00000', '', '3', '0', '', '2023-09-21 08:55:30', '2024-01-28 13:08:12');
INSERT INTO `tbl_products` VALUES ('559', '1295', '1295', 'Glyzone Gal- Case', '6000.00', '5579.97509', '', '3', '0', '', '2023-09-21 08:56:21', '2024-01-29 17:42:04');
INSERT INTO `tbl_products` VALUES ('560', '1296', '1296', 'Sharp Shooter- Case', '7800.00', '0.00000', '', '3', '0', '', '2023-09-21 08:57:01', '2023-09-21 09:18:29');
INSERT INTO `tbl_products` VALUES ('561', '1297', '1297', 'Ground Plus 4L- Case', '6480.00', '930.00000', '', '3', '0', '', '2023-09-21 08:58:38', '2024-02-06 17:53:11');
INSERT INTO `tbl_products` VALUES ('562', '1298', '1298', 'Ground Plus 5L- Case', '5320.00', '4880.00000', '', '3', '0', '', '2023-09-21 09:01:32', '2023-11-07 10:42:18');
INSERT INTO `tbl_products` VALUES ('563', '1299', '1299', 'Clear Out 4L- Cases', '7380.00', '6720.00000', '', '3', '0', '', '2023-09-21 09:12:03', '2024-02-03 15:36:43');
INSERT INTO `tbl_products` VALUES ('564', '1300', '1300', 'Clear Out 5L- Cases', '9480.00', '0.00000', '', '3', '0', '', '2023-09-21 09:12:45', '2023-09-21 09:13:59');
INSERT INTO `tbl_products` VALUES ('565', '1301', '1301', 'Konyk Gallon- Case', '6480.00', '3000.00000', '', '3', '0', '', '2023-09-21 09:24:43', '2023-10-05 10:53:02');
INSERT INTO `tbl_products` VALUES ('566', '1302', '1302', 'Spitfire Gallon- Cases', '4720.00', '0.00000', '', '3', '0', '', '2023-09-21 09:25:41', '2023-09-21 09:25:41');
INSERT INTO `tbl_products` VALUES ('567', '1303', '1303', 'Todomax 4L- Cases', '5880.00', '4976.73470', '', '3', '0', '', '2023-09-21 09:26:43', '2024-02-05 09:05:18');
INSERT INTO `tbl_products` VALUES ('568', '1304', '1304', 'Todomax 5L-Case', '1300.00', '0.00000', '', '3', '0', '', '2023-09-21 09:28:14', '2023-09-21 09:28:14');
INSERT INTO `tbl_products` VALUES ('569', '1305', '1305', 'Glyphotex Gallon- Cases', '7080.00', '0.00000', '', '3', '0', '', '2023-09-21 09:30:52', '2023-09-21 09:30:52');
INSERT INTO `tbl_products` VALUES ('570', '1306', '1306', 'Gly Flomax Gallon- Cases', '7080.00', '0.00000', '', '3', '0', '', '2023-09-21 09:32:41', '2023-09-21 09:32:41');
INSERT INTO `tbl_products` VALUES ('571', '1307', '1307', 'Demolition Gallon- Cases', '7380.00', '4316.25000', '', '3', '0', '', '2023-09-21 09:33:43', '2023-12-24 06:17:43');
INSERT INTO `tbl_products` VALUES ('572', '1308', '1308', 'Glyner Gallon- Case', '7080.00', '0.00000', '', '3', '0', '', '2023-09-21 09:34:49', '2023-09-21 09:34:49');
INSERT INTO `tbl_products` VALUES ('573', '1309', '1309', 'Supremo Gallon- Cases', '6780.00', '3636.36000', '', '3', '0', '', '2023-09-21 09:35:38', '2024-02-04 11:44:41');
INSERT INTO `tbl_products` VALUES ('574', '1310', '1310', 'Glufos Gallon- Case', '7800.00', '6416.66667', '', '3', '0', '', '2023-09-21 09:36:40', '2024-01-06 15:44:00');
INSERT INTO `tbl_products` VALUES ('575', '1311', '1311', 'Round up Gallon- Cases', '5800.00', '5200.00000', '', '3', '0', '', '2023-09-21 09:37:18', '2024-02-06 11:55:14');
INSERT INTO `tbl_products` VALUES ('576', '1312', '1312', 'Grader Gallon- Case', '6780.00', '0.00000', '', '3', '0', '', '2023-09-21 09:39:25', '2023-09-21 09:39:25');
INSERT INTO `tbl_products` VALUES ('577', '1313', '1313', 'Bounty Grow Gallon- Case', '2720.00', '1615.38461', '', '3', '0', '', '2023-09-21 09:40:09', '2023-10-11 15:21:57');
INSERT INTO `tbl_products` VALUES ('578', '1318', '1318', 'G Shot- Cases', '6780.00', '0.00000', '', '3', '0', '', '2023-09-21 10:12:07', '2023-09-21 10:12:07');
INSERT INTO `tbl_products` VALUES ('579', '1315', '1315', 'Pacyaw- Cases', '4520.00', '0.00000', '', '3', '0', '', '2023-09-21 10:21:44', '2023-09-21 10:21:44');
INSERT INTO `tbl_products` VALUES ('580', '1316', '1316', 'GPS- Cases', '6780.00', '0.00000', '', '3', '0', '', '2023-09-21 10:23:21', '2023-09-21 10:23:21');
INSERT INTO `tbl_products` VALUES ('581', '1319', '1319', 'Stand out Gallon- Cases', '4500.00', '4500.00000', '', '3', '0', '', '2023-09-21 10:26:19', '2023-11-12 13:01:50');
INSERT INTO `tbl_products` VALUES ('582', '1317', '1317', 'Diuron Liter- Cases', '7800.00', '0.00000', '', '3', '0', '', '2023-09-21 10:28:13', '2023-09-21 10:28:13');
INSERT INTO `tbl_products` VALUES ('583', '1320', '1320', 'Weed Blaster Gallon- Cases', '7980.00', '1828.57000', '', '3', '0', '', '2023-09-21 10:32:50', '2024-02-04 11:44:41');
INSERT INTO `tbl_products` VALUES ('584', '1321', '1321', 'Rich Vitamin Gallon- Cases', '3600.00', '2100.00000', '', '3', '0', '', '2023-09-21 10:37:17', '2023-11-07 11:53:43');
INSERT INTO `tbl_products` VALUES ('585', '1322', '1322', 'Crop Gold Gallon- Cses', '3600.00', '9900.00000', '', '3', '0', '', '2023-09-21 10:40:33', '2024-01-05 19:58:51');
INSERT INTO `tbl_products` VALUES ('586', '1323', '1323', 'Square Off Gallon- Case', '7980.00', '7650.00000', '', '3', '0', '', '2023-09-21 10:47:22', '2024-01-06 15:44:00');
INSERT INTO `tbl_products` VALUES ('587', '2072', '2072', 'Evo-9815', '3950.00', '3718.18182', '', '1', '0', '', '2023-09-30 11:47:12', '2024-01-24 19:03:11');
INSERT INTO `tbl_products` VALUES ('588', '1324', '1324', 'Triple 8 - 2L', '700.00', '620.00000', '', '3', '0', '', '2023-10-01 07:32:05', '2023-10-01 07:52:45');
INSERT INTO `tbl_products` VALUES ('589', '1325', '1325', 'Taglife Foliar Fertilizer', '100.00', '40.00000', '', '3', '0', '', '2023-10-01 07:36:50', '2023-10-01 07:52:45');
INSERT INTO `tbl_products` VALUES ('590', '1326', '1326', 'Tagchem Gluphosinate- Lit', '600.00', '466.00000', '', '3', '0', '', '2023-10-01 07:37:29', '2023-10-01 07:52:45');
INSERT INTO `tbl_products` VALUES ('591', '2073', '2073', 'P 3582-Kilo', '640.00', '566.75000', '', '1', '0', '', '2023-10-01 07:44:59', '2023-10-01 07:45:23');
INSERT INTO `tbl_products` VALUES ('592', '2074', '2074', 'Rice- Special 25kg ( Blue)', '1270.00', '1210.00000', '', '7', '0', '', '2023-10-03 14:25:28', '2023-12-21 06:30:09');
INSERT INTO `tbl_products` VALUES ('593', '1327', '1327', '24D-Ester Top Agro- Cases', '3360.00', '2500.00000', '', '3', '0', '', '2023-10-05 10:11:16', '2023-12-13 17:38:42');
INSERT INTO `tbl_products` VALUES ('594', '1328', '1328', '24D-Ester Aljay- Cases ', '3360.00', '3360.00000', '', '3', '0', '', '2023-10-05 10:12:57', '2024-02-04 11:44:41');
INSERT INTO `tbl_products` VALUES ('595', '1329', '1329', '24D-Ester Vast- Cases', '3360.00', '1575.00000', '', '3', '0', '', '2023-10-05 10:13:51', '2023-10-15 14:39:28');
INSERT INTO `tbl_products` VALUES ('596', '1330', '1330', '24D-Amine lit- Top Agro-Cases', '2760.00', '971.42857', '', '3', '0', '', '2023-10-05 10:18:04', '2023-12-13 17:38:42');
INSERT INTO `tbl_products` VALUES ('597', '1331', '1331', '24D-Amine Lit-Aljay- Cases', '2760.00', '0.00000', '', '3', '0', '', '2023-10-05 11:08:40', '2023-10-05 11:08:40');
INSERT INTO `tbl_products` VALUES ('598', '1332', '1332', '24D-Amine lit-Vast- Cases', '2760.00', '2700.00000', '', '3', '0', '', '2023-10-05 11:11:58', '2023-10-27 15:50:10');
INSERT INTO `tbl_products` VALUES ('599', '1333', '1333', '24D-Amine Gal-Top Agro-Cases', '3780.00', '2250.00000', '', '3', '0', '', '2023-10-05 11:14:02', '2023-12-13 17:38:42');
INSERT INTO `tbl_products` VALUES ('600', '1334', '1334', '24D-Amine Gal-Aljay- Cases', '2520.00', '0.00000', '', '3', '0', '', '2023-10-05 11:14:52', '2023-10-05 11:14:52');
INSERT INTO `tbl_products` VALUES ('601', '1335', '1335', '24D-Amine Gal-Double kill-Cases', '3780.00', '0.00000', '', '3', '0', '', '2023-10-05 11:16:10', '2023-10-05 11:16:10');
INSERT INTO `tbl_products` VALUES ('602', '1336', '1336', '24D-Amine Gal-Agway- Cases', '3780.00', '1155.55556', '', '3', '0', '', '2023-10-05 11:18:35', '2023-10-27 05:54:32');
INSERT INTO `tbl_products` VALUES ('603', '1337', '1337', '24D-Amine Gal-Vast-Cases', '4500.00', '0.00000', '', '3', '0', '', '2023-10-05 11:21:08', '2023-10-05 11:21:08');
INSERT INTO `tbl_products` VALUES ('604', '1338', '1338', '24D-Amine Gal-Ever-Cases', '3780.00', '0.00000', '', '3', '0', '', '2023-10-05 11:22:52', '2023-10-05 11:22:52');
INSERT INTO `tbl_products` VALUES ('605', '1339', '1339', 'Todomax lit-Cases', '3960.00', '2080.00000', '', '3', '0', '', '2023-10-05 12:22:34', '2024-01-29 17:42:05');
INSERT INTO `tbl_products` VALUES ('606', '1340', '1340', 'Ground Plus lit- Cases', '4200.00', '0.00000', '', '3', '0', '', '2023-10-05 12:23:03', '2023-10-05 12:23:03');
INSERT INTO `tbl_products` VALUES ('607', '1341', '1341', 'Round up lit-cases', '4200.00', '0.00000', '', '3', '0', '', '2023-10-05 12:24:41', '2023-10-05 12:24:41');
INSERT INTO `tbl_products` VALUES ('608', '1342', '1342', 'Vasthrin Lit', '350.00', '290.50000', '', '3', '0', '', '2023-10-06 12:10:10', '2023-10-06 15:16:03');
INSERT INTO `tbl_products` VALUES ('609', '1343', '1343', 'Carbomax 1kg', '150.00', '123.00000', '', '3', '0', '', '2023-10-06 12:10:54', '2023-10-06 15:15:01');
INSERT INTO `tbl_products` VALUES ('610', '1344', '1344', 'Deadshock Gal', '2100.00', '1880.00000', '', '3', '0', '', '2023-10-06 12:11:55', '2023-12-24 06:17:43');
INSERT INTO `tbl_products` VALUES ('611', '4056', '4056', 'Sprayer-Vast', '2500.00', '0.00000', '', '4', '0', '', '2023-10-15 14:37:03', '2023-12-24 06:17:43');
INSERT INTO `tbl_products` VALUES ('612', '1345', '1345', 'Parakohol', '100.00', '70.00000', '', '3', '0', '', '2023-10-16 18:07:18', '2023-10-16 18:07:52');
INSERT INTO `tbl_products` VALUES ('613', '1346', '1346', 'Top Rank- box', '700.00', '0.00000', '', '3', '0', '', '2023-10-17 06:14:01', '2023-10-17 06:15:18');
INSERT INTO `tbl_products` VALUES ('614', '2075', '2075', 'Bioseed-9541 ( Kilo)', '300.00', '284.52000', '', '1', '0', '', '2023-10-23 12:20:46', '2024-02-01 16:06:27');
INSERT INTO `tbl_products` VALUES ('615', '1347', '1347', 'Hitweed-Gallon', '1280.00', '1150.00000', '', '3', '0', '', '2023-10-23 12:57:20', '2024-01-25 08:43:35');
INSERT INTO `tbl_products` VALUES ('616', '5101', '5101', 'Zeromite 10ml', '23.00', '15.04000', '', '9', '0', '', '2023-10-24 08:53:13', '2024-01-06 15:10:31');
INSERT INTO `tbl_products` VALUES ('617', '5102', '5102', 'Ivermectin', '25.00', '0.00000', '', '9', '0', '', '2023-10-24 16:00:17', '2023-10-24 16:00:17');
INSERT INTO `tbl_products` VALUES ('618', '1348', '1348', 'Kathari Gal-Cases', '5580.00', '5340.00000', '', '3', '0', '', '2023-11-10 11:14:42', '2023-11-10 11:23:09');
INSERT INTO `tbl_products` VALUES ('619', '1349', '1349', 'Kathari Gallon', '1000.00', '890.00000', '', '3', '0', '', '2023-11-10 11:15:11', '2023-11-10 12:23:34');
INSERT INTO `tbl_products` VALUES ('620', '1350', '1350', 'Kathari lit- Cases', '3600.00', '3000.00000', '', '3', '0', '', '2023-11-10 11:18:45', '2023-11-10 11:23:09');
INSERT INTO `tbl_products` VALUES ('621', '1351', '1351', 'Kathari-Liter', '320.00', '743.00000', '', '3', '0', '', '2023-11-10 11:19:10', '2024-02-01 14:57:27');
INSERT INTO `tbl_products` VALUES ('622', '1352', '1352', 'ClearDIU', '670.00', '620.00000', '', '3', '0', '', '2023-11-12 13:01:18', '2023-11-12 13:01:50');
INSERT INTO `tbl_products` VALUES ('623', '5103', '5103', 'NK 6230- Free', '1.00', '0.00000', '', '1', '0', '', '2023-11-15 12:01:35', '2023-11-15 12:04:59');
INSERT INTO `tbl_products` VALUES ('624', '1353', '1353', 'Pyra Ultra Liter', '1250.00', '1110.00000', '', '3', '0', '', '2023-11-16 06:02:31', '2023-11-16 06:40:01');
INSERT INTO `tbl_products` VALUES ('625', '1354', '1354', '24D-Amine lit-Tag Chem-Cases', '2760.00', '1920.00000', '', '3', '0', '', '2023-11-16 06:17:06', '2023-11-16 06:40:01');
INSERT INTO `tbl_products` VALUES ('626', '1355', '1355', '24D-Amine-Gallon-Tag Chem-Case', '3900.00', '3600.00000', '', '3', '0', '', '2023-11-16 06:19:37', '2023-11-16 06:40:01');
INSERT INTO `tbl_products` VALUES ('627', '1356', '1356', 'Tag Chem Diuron Kg', '650.00', '550.00000', '', '3', '0', '', '2023-11-16 06:21:12', '2023-11-16 06:40:01');
INSERT INTO `tbl_products` VALUES ('628', '1357', '1357', 'Sweep Gallon- Cases', '3800.00', '0.00000', '', '3', '0', '', '2023-11-16 06:27:00', '2024-02-04 08:56:17');
INSERT INTO `tbl_products` VALUES ('629', '1358', '1358', 'Tekweed Gallon- Cases', '4800.00', '4266.66667', '', '3', '0', '', '2023-11-16 06:30:07', '2024-01-29 17:42:05');
INSERT INTO `tbl_products` VALUES ('630', '5104', '5104', 'NK 6505-Free', '0.00', '0.00000', '', '1', '0', '', '2023-11-17 15:49:37', '2023-11-17 15:50:55');
INSERT INTO `tbl_products` VALUES ('631', '2076', '2076', 'NK 6130- Free', '0.00', '0.00000', '', '1', '0', '', '2023-11-28 10:01:31', '2023-11-29 12:06:18');
INSERT INTO `tbl_products` VALUES ('632', '2077', '2077', 'Evo 709- Free', '0.00', '0.00000', '', '1', '0', '', '2023-11-28 10:02:21', '2023-11-28 10:02:21');
INSERT INTO `tbl_products` VALUES ('633', '4057', '4057', 'Sprayer- Free', '0.00', '1584.59000', '', '4', '0', '', '2023-11-28 10:03:12', '2024-02-04 18:09:17');
INSERT INTO `tbl_products` VALUES ('634', '1359', '1359', 'Supremo- liter', '320.00', '300.00000', '', '3', '0', '', '2023-11-29 11:43:55', '2023-11-30 05:38:36');
INSERT INTO `tbl_products` VALUES ('635', '1360', '1360', '24D-Ester-Lit(Tag Chem)-Cases', '3360.00', '2640.00000', '', '3', '0', '', '2023-11-30 15:50:38', '2023-11-30 15:52:05');
INSERT INTO `tbl_products` VALUES ('636', '1361', '1361', 'Tekweed 5lit-cases', '5800.00', '5520.00000', '', '3', '0', '', '2023-12-02 13:07:10', '2023-12-02 13:12:24');
INSERT INTO `tbl_products` VALUES ('637', '1362', '1362', 'Tekweed 5L', '1450.00', '1380.00000', '', '3', '0', '', '2023-12-02 13:08:02', '2023-12-04 14:16:47');
INSERT INTO `tbl_products` VALUES ('638', '1363', '1363', 'Hitweed Gal- Cases-', '7500.00', '6900.00000', '', '3', '0', '', '2023-12-02 13:11:01', '2023-12-02 13:12:24');
INSERT INTO `tbl_products` VALUES ('639', '5100', '5100', 'B 50', '9.00', '7.00000', '', '9', '0', '', '2023-12-07 15:27:47', '2023-12-07 15:29:21');
INSERT INTO `tbl_products` VALUES ('640', '1364', '1364', 'Kamandag- 500ml', '300.00', '240.00000', '', '3', '0', '', '2023-12-09 09:01:07', '2023-12-09 09:02:09');
INSERT INTO `tbl_products` VALUES ('641', '5105', '5105', 'AA Animal Booster', '85.00', '73.00000', '', '8', '0', '', '2023-12-13 12:04:05', '2023-12-29 14:49:34');
INSERT INTO `tbl_products` VALUES ('642', '2078', '2078', 'Rice-Premium 25kg', '1350.00', '1300.00000', '', '7', '0', '', '2023-12-13 17:47:24', '2023-12-13 17:51:04');
INSERT INTO `tbl_products` VALUES ('643', '2079', '2079', 'Rice-Premium 1Kg', '55.00', '52.00000', '', '7', '0', '', '2023-12-13 17:49:38', '2023-12-14 08:49:52');
INSERT INTO `tbl_products` VALUES ('644', '2080', '2080', 'Rice- Special 25kg ( Yellow)', '1270.00', '1296.42857', '', '7', '0', '', '2023-12-21 06:30:48', '2023-12-22 17:25:43');
INSERT INTO `tbl_products` VALUES ('645', '1365', '1365', 'DeadShock liter', '700.00', '600.00000', '', '3', '0', '', '2023-12-24 06:17:00', '2024-02-04 11:44:41');
INSERT INTO `tbl_products` VALUES ('646', '5106', '5106', 'Ultrapack-Gestating 50kg', '2050.00', '1915.00000', '', '8', '0', '', '2023-12-27 12:30:06', '2024-02-02 17:09:59');
INSERT INTO `tbl_products` VALUES ('647', '5107', '5107', 'Ultrapack-Gestating 1kg', '42.00', '38.27384', '', '8', '0', '', '2023-12-27 12:37:23', '2024-01-11 07:31:51');
INSERT INTO `tbl_products` VALUES ('648', '5108', '5108', 'Galmax 21- 50 kg', '2020.00', '1960.00000', '', '8', '0', '', '2023-12-27 12:52:47', '2023-12-27 12:54:07');
INSERT INTO `tbl_products` VALUES ('649', '5109', '5109', 'Galmax 21- 1kg', '42.00', '39.20000', '', '8', '0', '', '2023-12-27 12:53:39', '2023-12-27 13:00:14');
INSERT INTO `tbl_products` VALUES ('650', '5110', '5110', 'Panamox Forte', '43.00', '38.00000', '', '9', '0', '', '2023-12-28 08:33:20', '2023-12-28 08:39:17');
INSERT INTO `tbl_products` VALUES ('651', '5111', '5111', 'Panamox Caplet', '15.00', '13.00000', '', '9', '0', '', '2023-12-28 08:35:48', '2023-12-28 08:39:17');
INSERT INTO `tbl_products` VALUES ('652', '5112', '5112', 'Intenso Stag', '15.00', '13.00000', '', '9', '0', '', '2023-12-28 08:36:12', '2023-12-28 08:39:17');
INSERT INTO `tbl_products` VALUES ('653', '5113', '5113', 'Worms to go', '8.00', '5.00000', '', '9', '0', '', '2023-12-28 08:36:34', '2023-12-28 08:39:17');
INSERT INTO `tbl_products` VALUES ('654', '5114', '5114', 'Kings Vita plus', '85.00', '60.00000', '', '9', '0', '', '2023-12-28 08:37:15', '2023-12-28 08:39:18');
INSERT INTO `tbl_products` VALUES ('655', '3031', '3031', '16200-Philphos', '1320.00', '305.64263', '', '2', '0', '', '2024-01-06 16:18:38', '2024-01-28 11:02:15');
INSERT INTO `tbl_products` VALUES ('656', '2081', '2081', 'Black Rice- sack', '1370.00', '1300.00000', '', '7', '0', '', '2024-01-07 11:04:28', '2024-01-07 11:07:15');
INSERT INTO `tbl_products` VALUES ('657', '2082', '2082', 'Black Rice- 1kg', '58.00', '52.00000', '', '7', '0', '', '2024-01-07 11:06:16', '2024-01-07 11:07:37');
INSERT INTO `tbl_products` VALUES ('658', '1366', '1366', 'Diuron- Sure Crop', '580.00', '520.00000', '', '3', '0', '', '2024-01-09 19:46:30', '2024-01-09 19:47:12');
INSERT INTO `tbl_products` VALUES ('659', '1367', '1367', 'Mower Lit', '450.00', '375.00000', '', '3', '0', '', '2024-01-10 06:59:23', '2024-01-10 06:59:51');
INSERT INTO `tbl_products` VALUES ('660', '2083', '2083', 'Monggo 1 kg', '70.00', '60.00000', '', '1', '0', '', '2024-01-19 14:21:46', '2024-01-19 14:22:21');
INSERT INTO `tbl_products` VALUES ('661', '2084', '2084', 'Rice-Young Chow 5kg', '320.00', '280.00000', '', '7', '0', '', '2024-01-20 12:39:06', '2024-01-20 12:39:56');
INSERT INTO `tbl_products` VALUES ('662', '1368', '1368', 'Gromex Gal', '550.00', '350.00000', '', '3', '0', '', '2024-01-20 12:45:52', '2024-01-20 12:48:13');
INSERT INTO `tbl_products` VALUES ('663', '5115', '5115', 'PowerGuard (Porga)', '6.00', '4.90000', '', '9', '0', '', '2024-01-20 12:53:43', '2024-01-20 12:59:05');
INSERT INTO `tbl_products` VALUES ('664', '5116', '5116', 'Power Armor ( Shampoo)', '21.00', '17.50000', '', '9', '0', '', '2024-01-20 12:54:20', '2024-01-20 12:59:05');
INSERT INTO `tbl_products` VALUES ('665', '5117', '5117', 'Power Aid (Dextrose)', '18.00', '15.20000', '', '9', '0', '', '2024-01-20 12:56:07', '2024-01-20 12:59:05');
INSERT INTO `tbl_products` VALUES ('666', '5118', '5118', 'Supradox', '28.00', '26.00000', '', '9', '0', '', '2024-01-20 12:56:45', '2024-01-20 12:59:05');
INSERT INTO `tbl_products` VALUES ('667', '5119', '5119', 'Prime- Gestating 1 kg', '37.00', '33.74000', '', '8', '0', '', '2024-01-24 06:06:08', '2024-01-27 07:41:19');
INSERT INTO `tbl_products` VALUES ('668', '5120', '5120', 'Prime-Gestating 50kg', '1737.00', '1687.00000', '', '8', '0', '', '2024-01-24 06:06:45', '2024-01-24 06:09:28');
INSERT INTO `tbl_products` VALUES ('669', '1369', '1369', 'Clearmore-2lit', '1780.00', '1700.00000', '', '3', '0', '', '2024-02-04 13:37:07', '2024-02-04 13:43:28');
INSERT INTO `tbl_products` VALUES ('670', '1370', '1370', 'Maximus Gal', '2300.00', '2000.00000', '', '3', '0', '', '2024-02-06 11:16:06', '2024-02-06 17:53:11');
INSERT INTO `tbl_products` VALUES ('671', '1371', '1371', 'Gold Rush- lit', '1070.00', '1010.00000', '', '3', '0', '', '2024-02-06 11:19:47', '2024-02-06 17:53:11');
INSERT INTO `tbl_products` VALUES ('672', '1372', '1372', 'Gold Rush- 500ml', '620.00', '535.00000', '', '3', '0', '', '2024-02-06 11:20:12', '2024-02-06 17:53:11');
INSERT INTO `tbl_products` VALUES ('673', '1373', '1373', 'Clear out Lit-Cases', '4560.00', '0.00000', '', '3', '0', '', '2024-02-06 17:24:03', '2024-02-06 17:24:03');

CREATE TABLE `tbl_purchase_order` (
  `po_id` int(11) NOT NULL AUTO_INCREMENT,
  `reference_number` varchar(30) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `po_invoice` varchar(30) NOT NULL,
  `po_terms` int(5) NOT NULL DEFAULT '0',
  `po_date` date NOT NULL,
  `po_type` varchar(1) NOT NULL,
  `paid_status` int(1) NOT NULL DEFAULT '0' COMMENT '1 = Paid; 0 = Unpaid',
  `po_remarks` varchar(255) NOT NULL,
  `status` varchar(1) NOT NULL,
  `encoded_by` int(11) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_last_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`po_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;
INSERT INTO `tbl_purchase_order` VALUES ('1', 'PO-20240203094712', '2', '10537', '45', '2024-03-18', 'H', '0', '', '', '1', '2024-02-03 09:48:36', '2024-02-03 09:48:36');
INSERT INTO `tbl_purchase_order` VALUES ('2', 'PO-20240203094906', '2', '10537', '45', '2024-03-18', 'H', '0', '', 'F', '1', '2024-02-03 09:49:53', '2024-02-03 09:49:53');
INSERT INTO `tbl_purchase_order` VALUES ('3', 'PO-20240203095233', '2', '10537', '45', '2024-03-18', 'H', '0', '', '', '1', '2024-02-03 09:52:55', '2024-02-03 09:52:55');
INSERT INTO `tbl_purchase_order` VALUES ('4', 'PO-20240203095332', '2', '10537', '45', '2024-02-02', 'H', '0', '', 'F', '1', '2024-02-03 09:54:05', '2024-02-03 09:54:05');
INSERT INTO `tbl_purchase_order` VALUES ('5', 'PO-20240203110330', '36', '0555', '0', '2024-02-03', 'H', '0', 'powder', 'F', '1', '2024-02-03 11:04:06', '2024-02-03 11:04:06');
INSERT INTO `tbl_purchase_order` VALUES ('6', 'PO-20240203153602', '76', '001341', '30', '2024-02-03', 'H', '0', '', 'F', '1', '2024-02-03 15:36:23', '2024-02-03 15:36:23');
INSERT INTO `tbl_purchase_order` VALUES ('7', 'PO-20240204085738', '76', '040440', '30', '2024-02-04', 'H', '0', '', 'F', '1', '2024-02-04 08:58:03', '2024-02-04 08:58:03');
INSERT INTO `tbl_purchase_order` VALUES ('8', 'PO-20240204110539', '76', '040439', '0', '2024-02-04', 'H', '0', '', 'F', '1', '2024-02-04 11:06:29', '2024-02-04 11:06:29');
INSERT INTO `tbl_purchase_order` VALUES ('9', 'PO-20240204112708', '76', '040441', '0', '2024-02-04', 'H', '0', '', 'F', '1', '2024-02-04 11:27:28', '2024-02-04 11:27:28');
INSERT INTO `tbl_purchase_order` VALUES ('10', 'PO-20240204113905', '76', '040446', '0', '2024-02-04', 'H', '0', '', 'F', '1', '2024-02-04 11:39:29', '2024-02-04 11:39:29');
INSERT INTO `tbl_purchase_order` VALUES ('11', 'PO-20240204115516', '76', '040447', '0', '2024-02-04', 'H', '0', '', 'F', '1', '2024-02-04 11:55:40', '2024-02-04 11:55:40');
INSERT INTO `tbl_purchase_order` VALUES ('12', 'PO-20240204120105', '76', '040448', '0', '2024-02-04', 'H', '0', '', 'F', '1', '2024-02-04 12:01:35', '2024-02-04 12:01:35');
INSERT INTO `tbl_purchase_order` VALUES ('13', 'PO-20240204120231', '76', '040444', '0', '2024-02-04', 'H', '0', '', 'F', '1', '2024-02-04 12:02:55', '2024-02-04 12:02:55');
INSERT INTO `tbl_purchase_order` VALUES ('14', 'PO-20240204133811', '76', '001610', '0', '2024-02-04', 'H', '0', '', 'F', '1', '2024-02-04 13:38:31', '2024-02-04 13:38:31');
INSERT INTO `tbl_purchase_order` VALUES ('15', 'PO-20240205090212', '76', '001660', '30', '2024-02-05', 'H', '0', '', 'F', '1', '2024-02-05 09:02:34', '2024-02-05 09:02:34');
INSERT INTO `tbl_purchase_order` VALUES ('16', 'PO-20240205090524', '76', '001611', '30', '2024-02-05', 'H', '0', '', 'F', '1', '2024-02-05 09:05:49', '2024-02-05 09:05:49');
INSERT INTO `tbl_purchase_order` VALUES ('17', 'PO-20240205090647', '76', '001612', '30', '2024-02-05', 'H', '0', '', 'F', '1', '2024-02-05 09:07:13', '2024-02-05 09:07:13');
INSERT INTO `tbl_purchase_order` VALUES ('18', 'PO-20240206100518', '76', '000205', '30', '2024-02-06', 'H', '0', '', 'F', '1', '2024-02-06 10:05:39', '2024-02-06 10:05:39');
INSERT INTO `tbl_purchase_order` VALUES ('19', 'PO-20240206110546', '76', '000205', '30', '2024-02-06', 'H', '0', '', 'F', '1', '2024-02-06 11:06:11', '2024-02-06 11:06:11');
INSERT INTO `tbl_purchase_order` VALUES ('20', 'PO-20240206110651', '76', '000206', '30', '2024-02-06', 'H', '0', '', 'F', '1', '2024-02-06 11:07:04', '2024-02-06 11:07:04');
INSERT INTO `tbl_purchase_order` VALUES ('21', 'PO-20240206114749', '76', '00207', '30', '2024-02-05', 'H', '0', '', 'F', '1', '2024-02-06 11:48:05', '2024-02-06 11:48:05');
INSERT INTO `tbl_purchase_order` VALUES ('22', 'PO-20240206115434', '76', '000', '30', '2024-02-06', 'H', '0', '', 'F', '1', '2024-02-06 11:54:46', '2024-02-06 11:54:46');
INSERT INTO `tbl_purchase_order` VALUES ('23', 'PO-20240206130735', '76', '001635', '30', '2024-02-06', 'H', '0', '', 'F', '1', '2024-02-06 13:07:48', '2024-02-06 13:07:48');
INSERT INTO `tbl_purchase_order` VALUES ('24', 'PO-20240206130810', '76', '001634', '30', '2024-02-06', 'H', '0', '', 'F', '1', '2024-02-06 13:08:45', '2024-02-06 13:08:45');
INSERT INTO `tbl_purchase_order` VALUES ('25', 'PO-20240206173741', '76', '001631', '30', '2024-02-06', 'H', '0', '', 'F', '1', '2024-02-06 17:38:00', '2024-02-06 17:38:00');
INSERT INTO `tbl_purchase_order` VALUES ('26', 'PO-20240206174230', '76', '001664', '30', '2024-02-06', 'H', '0', '', 'F', '1', '2024-02-06 17:44:18', '2024-02-06 17:44:18');

CREATE TABLE `tbl_purchase_order_details` (
  `po_detail_id` int(11) NOT NULL AUTO_INCREMENT,
  `po_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` decimal(11,2) NOT NULL,
  `supplier_price` decimal(11,2) NOT NULL,
  PRIMARY KEY (`po_detail_id`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=latin1;
INSERT INTO `tbl_purchase_order_details` VALUES ('1', '2', '547', '80.00', '950.00');
INSERT INTO `tbl_purchase_order_details` VALUES ('2', '4', '628', '20.00', '3800.00');
INSERT INTO `tbl_purchase_order_details` VALUES ('3', '5', '292', '60.00', '510.00');
INSERT INTO `tbl_purchase_order_details` VALUES ('4', '6', '563', '2.00', '6720.00');
INSERT INTO `tbl_purchase_order_details` VALUES ('5', '7', '19', '50.00', '1250.00');
INSERT INTO `tbl_purchase_order_details` VALUES ('6', '7', '28', '50.00', '1330.00');
INSERT INTO `tbl_purchase_order_details` VALUES ('7', '7', '18', '30.00', '1390.00');
INSERT INTO `tbl_purchase_order_details` VALUES ('8', '7', '24', '30.00', '660.00');
INSERT INTO `tbl_purchase_order_details` VALUES ('9', '7', '16', '10.00', '1870.00');
INSERT INTO `tbl_purchase_order_details` VALUES ('10', '7', '22', '2.00', '2450.00');
INSERT INTO `tbl_purchase_order_details` VALUES ('11', '8', '389', '3.00', '2110.00');
INSERT INTO `tbl_purchase_order_details` VALUES ('12', '8', '390', '2.00', '1920.00');
INSERT INTO `tbl_purchase_order_details` VALUES ('13', '8', '391', '2.00', '1742.00');
INSERT INTO `tbl_purchase_order_details` VALUES ('15', '8', '487', '3.00', '1775.00');
INSERT INTO `tbl_purchase_order_details` VALUES ('16', '8', '392', '3.00', '1837.00');
INSERT INTO `tbl_purchase_order_details` VALUES ('17', '8', '485', '2.00', '1855.00');
INSERT INTO `tbl_purchase_order_details` VALUES ('18', '8', '407', '2.00', '1910.00');
INSERT INTO `tbl_purchase_order_details` VALUES ('19', '8', '464', '1.00', '1870.00');
INSERT INTO `tbl_purchase_order_details` VALUES ('20', '8', '406', '2.00', '1890.00');
INSERT INTO `tbl_purchase_order_details` VALUES ('21', '8', '396', '2.00', '1559.00');
INSERT INTO `tbl_purchase_order_details` VALUES ('22', '9', '514', '12.00', '250.00');
INSERT INTO `tbl_purchase_order_details` VALUES ('23', '9', '359', '12.00', '420.00');
INSERT INTO `tbl_purchase_order_details` VALUES ('24', '9', '145', '24.00', '450.00');
INSERT INTO `tbl_purchase_order_details` VALUES ('25', '9', '36', '36.00', '89.11');
INSERT INTO `tbl_purchase_order_details` VALUES ('26', '9', '252', '24.00', '122.96');
INSERT INTO `tbl_purchase_order_details` VALUES ('27', '9', '251', '12.00', '243.67');
INSERT INTO `tbl_purchase_order_details` VALUES ('28', '9', '88', '4.00', '2000.00');
INSERT INTO `tbl_purchase_order_details` VALUES ('29', '9', '89', '12.00', '550.00');
INSERT INTO `tbl_purchase_order_details` VALUES ('30', '9', '221', '12.00', '696.42');
INSERT INTO `tbl_purchase_order_details` VALUES ('31', '9', '388', '12.00', '300.00');
INSERT INTO `tbl_purchase_order_details` VALUES ('32', '10', '80', '6.00', '370.27');
INSERT INTO `tbl_purchase_order_details` VALUES ('33', '10', '645', '12.00', '700.00');
INSERT INTO `tbl_purchase_order_details` VALUES ('34', '10', '610', '6.00', '1880.00');
INSERT INTO `tbl_purchase_order_details` VALUES ('35', '10', '620', '1.00', '3000.00');
INSERT INTO `tbl_purchase_order_details` VALUES ('36', '10', '573', '1.00', '3636.36');
INSERT INTO `tbl_purchase_order_details` VALUES ('37', '10', '583', '1.00', '1828.57');
INSERT INTO `tbl_purchase_order_details` VALUES ('38', '10', '558', '2.00', '6000.00');
INSERT INTO `tbl_purchase_order_details` VALUES ('39', '10', '594', '2.00', '3360.00');
INSERT INTO `tbl_purchase_order_details` VALUES ('40', '11', '58', '6.00', '360.00');
INSERT INTO `tbl_purchase_order_details` VALUES ('41', '11', '217', '6.00', '250.00');
INSERT INTO `tbl_purchase_order_details` VALUES ('42', '12', '124', '24.00', '205.00');
INSERT INTO `tbl_purchase_order_details` VALUES ('43', '12', '282', '34.00', '110.27');
INSERT INTO `tbl_purchase_order_details` VALUES ('44', '13', '134', '4.00', '1374.96');
INSERT INTO `tbl_purchase_order_details` VALUES ('45', '13', '135', '5.00', '177.43');
INSERT INTO `tbl_purchase_order_details` VALUES ('46', '13', '246', '10.00', '98.02');
INSERT INTO `tbl_purchase_order_details` VALUES ('47', '13', '65', '6.00', '360.00');
INSERT INTO `tbl_purchase_order_details` VALUES ('48', '14', '40', '12.00', '760.00');
INSERT INTO `tbl_purchase_order_details` VALUES ('49', '14', '669', '10.00', '1700.00');
INSERT INTO `tbl_purchase_order_details` VALUES ('50', '14', '94', '8.00', '2220.00');
INSERT INTO `tbl_purchase_order_details` VALUES ('51', '14', '93', '12.00', '610.00');
INSERT INTO `tbl_purchase_order_details` VALUES ('52', '14', '158', '6.00', '750.00');
INSERT INTO `tbl_purchase_order_details` VALUES ('53', '14', '72', '24.00', '340.00');
INSERT INTO `tbl_purchase_order_details` VALUES ('54', '15', '10', '15.00', '5400.00');
INSERT INTO `tbl_purchase_order_details` VALUES ('56', '15', '567', '3.00', '4980.00');
INSERT INTO `tbl_purchase_order_details` VALUES ('57', '16', '13', '10.00', '5400.00');
INSERT INTO `tbl_purchase_order_details` VALUES ('58', '16', '14', '10.00', '4700.00');
INSERT INTO `tbl_purchase_order_details` VALUES ('59', '16', '7', '10.00', '2300.00');
INSERT INTO `tbl_purchase_order_details` VALUES ('60', '17', '7', '20.00', '2300.00');
INSERT INTO `tbl_purchase_order_details` VALUES ('61', '18', '25', '4.00', '640.00');
INSERT INTO `tbl_purchase_order_details` VALUES ('62', '18', '29', '2.00', '1380.00');
INSERT INTO `tbl_purchase_order_details` VALUES ('63', '19', '25', '4.00', '640.00');
INSERT INTO `tbl_purchase_order_details` VALUES ('64', '19', '29', '2.00', '1350.00');
INSERT INTO `tbl_purchase_order_details` VALUES ('65', '20', '29', '5.00', '1350.00');
INSERT INTO `tbl_purchase_order_details` VALUES ('66', '20', '25', '8.00', '680.00');
INSERT INTO `tbl_purchase_order_details` VALUES ('67', '21', '29', '2.00', '1350.00');
INSERT INTO `tbl_purchase_order_details` VALUES ('68', '21', '25', '5.00', '640.00');
INSERT INTO `tbl_purchase_order_details` VALUES ('69', '22', '575', '5.00', '5200.00');
INSERT INTO `tbl_purchase_order_details` VALUES ('70', '23', '496', '12.00', '560.00');
INSERT INTO `tbl_purchase_order_details` VALUES ('71', '24', '512', '5.00', '500.00');
INSERT INTO `tbl_purchase_order_details` VALUES ('72', '25', '160', '10.00', '110.00');
INSERT INTO `tbl_purchase_order_details` VALUES ('73', '25', '85', '2.00', '650.00');
INSERT INTO `tbl_purchase_order_details` VALUES ('74', '25', '612', '6.00', '70.00');
INSERT INTO `tbl_purchase_order_details` VALUES ('75', '25', '298', '49.00', '20.00');
INSERT INTO `tbl_purchase_order_details` VALUES ('76', '25', '372', '46.50', '10.00');
INSERT INTO `tbl_purchase_order_details` VALUES ('77', '25', '175', '33.00', '110.00');
INSERT INTO `tbl_purchase_order_details` VALUES ('78', '26', '360', '10.00', '5100.00');
INSERT INTO `tbl_purchase_order_details` VALUES ('79', '26', '561', '12.00', '930.00');
INSERT INTO `tbl_purchase_order_details` VALUES ('80', '26', '92', '12.00', '930.00');
INSERT INTO `tbl_purchase_order_details` VALUES ('81', '26', '670', '3.00', '2000.00');
INSERT INTO `tbl_purchase_order_details` VALUES ('82', '26', '672', '3.00', '535.00');
INSERT INTO `tbl_purchase_order_details` VALUES ('83', '26', '76', '6.00', '1170.00');
INSERT INTO `tbl_purchase_order_details` VALUES ('84', '26', '671', '3.00', '1010.00');
INSERT INTO `tbl_purchase_order_details` VALUES ('85', '25', '310', '6.00', '110.00');
INSERT INTO `tbl_purchase_order_details` VALUES ('86', '25', '292', '3.00', '510.00');

CREATE TABLE `tbl_purchase_return` (
  `pr_id` int(11) NOT NULL AUTO_INCREMENT,
  `reference_number` varchar(50) NOT NULL,
  `po_id` int(11) NOT NULL,
  `return_date` date NOT NULL,
  `remarks` varchar(255) NOT NULL,
  `status` varchar(1) NOT NULL,
  `encoded_by` int(11) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_last_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`pr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
INSERT INTO `tbl_purchase_return` VALUES ('1', 'PO-RET-20240204085421', '5', '2024-02-04', '', 'F', '1', '2024-02-04 08:54:27', '2024-02-04 08:54:27');
INSERT INTO `tbl_purchase_return` VALUES ('2', 'PO-RET-20240204085457', '0', '2024-02-04', '', '', '1', '2024-02-04 08:55:06', '2024-02-04 08:55:06');
INSERT INTO `tbl_purchase_return` VALUES ('3', 'PO-RET-20240204085556', '4', '2024-02-04', '', 'F', '1', '2024-02-04 08:56:04', '2024-02-04 08:56:04');

CREATE TABLE `tbl_purchase_return_details` (
  `pr_detail_id` int(11) NOT NULL AUTO_INCREMENT,
  `pr_id` int(11) NOT NULL,
  `po_detail_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` decimal(12,2) NOT NULL DEFAULT '0.00',
  `qty_return` decimal(12,2) NOT NULL DEFAULT '0.00',
  `supplier_price` decimal(12,5) NOT NULL,
  PRIMARY KEY (`pr_detail_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
INSERT INTO `tbl_purchase_return_details` VALUES ('1', '1', '3', '292', '60.00', '60.00', '510.00000');
INSERT INTO `tbl_purchase_return_details` VALUES ('2', '3', '2', '628', '20.00', '20.00', '3800.00000');

CREATE TABLE `tbl_redeemed_points` (
  `redeem_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `reference_number` varchar(30) NOT NULL DEFAULT '',
  `customer_id` int(11) NOT NULL,
  `suki_card_number` varchar(15) NOT NULL,
  `sales_id` int(11) NOT NULL,
  `redeem_points` decimal(9,2) NOT NULL,
  `encoded_by` int(11) NOT NULL,
  `status` varchar(1) NOT NULL DEFAULT '',
  `sales_summary_id` int(11) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_last_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`redeem_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `tbl_sales` (
  `sales_id` int(11) NOT NULL AUTO_INCREMENT,
  `withdrawal_status` int(1) DEFAULT '0' COMMENT '0 = Fully served ; 1 = Pending',
  `sales_invoice` int(11) NOT NULL,
  `reference_number` varchar(30) NOT NULL DEFAULT '',
  `customer_id` int(11) NOT NULL,
  `for_pick_up` int(1) NOT NULL DEFAULT '0' COMMENT '1 = Yes; 0 = No',
  `status` varchar(1) NOT NULL DEFAULT 'S' COMMENT 'F',
  `sales_type` varchar(1) NOT NULL DEFAULT '' COMMENT 'C=Cash;H=Charge',
  `remarks` varchar(255) NOT NULL DEFAULT '',
  `sales_date` date NOT NULL,
  `paid_status` varchar(1) NOT NULL DEFAULT '0' COMMENT 'COMMENT ''1 = Paid; 0 = Unpaid'',',
  `sales_summary_id` int(11) NOT NULL,
  `reward_points` decimal(6,2) NOT NULL DEFAULT '0.00',
  `terms` int(3) NOT NULL,
  `encoded_by` int(11) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_last_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `discount_id` int(11) NOT NULL DEFAULT '0' COMMENT 'Manual Discounts',
  PRIMARY KEY (`sales_id`)
) ENGINE=InnoDB AUTO_INCREMENT=153 DEFAULT CHARSET=latin1;
INSERT INTO `tbl_sales` VALUES ('1', '0', '0', '000001', '0', '0', 'F', 'C', 'walk-in', '2024-02-01', '1', '1', '0.00', '0', '7', '2024-02-01 13:40:14', '2024-02-03 18:19:02', '0');
INSERT INTO `tbl_sales` VALUES ('2', '0', '0', '000002', '0', '0', 'S', 'C', 'walk-in', '2024-02-01', '1', '0', '0.00', '0', '7', '2024-02-01 14:33:00', '2024-02-01 14:33:00', '0');
INSERT INTO `tbl_sales` VALUES ('3', '0', '0', '000003', '0', '0', 'F', 'C', 'walk-in', '2024-02-03', '1', '1', '0.00', '0', '7', '2024-02-03 06:51:05', '2024-02-03 18:19:02', '0');
INSERT INTO `tbl_sales` VALUES ('4', '0', '0', '000004', '1432', '1', 'R', 'C', 'walk-in', '2024-02-03', '1', '0', '0.00', '0', '7', '2024-02-03 07:13:49', '2024-02-03 07:27:28', '0');
INSERT INTO `tbl_sales` VALUES ('5', '0', '0', '000005', '0', '0', 'F', 'C', 'walk-in', '2024-02-03', '1', '1', '0.00', '0', '7', '2024-02-03 07:39:45', '2024-02-03 18:19:02', '0');
INSERT INTO `tbl_sales` VALUES ('6', '0', '0', '000006', '0', '0', 'F', 'C', 'walk-in', '2024-02-03', '1', '1', '0.00', '0', '7', '2024-02-03 07:46:15', '2024-02-03 18:19:02', '0');
INSERT INTO `tbl_sales` VALUES ('7', '0', '0', '000007', '0', '0', 'F', 'C', 'walk-in', '2024-02-03', '1', '1', '0.00', '0', '7', '2024-02-03 07:49:10', '2024-02-03 18:19:02', '0');
INSERT INTO `tbl_sales` VALUES ('8', '0', '0', '000008', '0', '0', 'R', 'C', 'walk-in', '2024-02-03', '1', '0', '0.00', '0', '7', '2024-02-03 07:53:17', '2024-02-03 07:55:55', '0');
INSERT INTO `tbl_sales` VALUES ('9', '0', '0', '000009', '0', '0', 'R', 'C', 'walk-in', '2024-02-03', '1', '0', '0.00', '0', '7', '2024-02-03 07:54:28', '2024-02-03 07:55:50', '0');
INSERT INTO `tbl_sales` VALUES ('10', '0', '0', '000010', '0', '0', 'F', 'C', 'walk-in', '2024-02-03', '1', '1', '0.00', '0', '7', '2024-02-03 08:14:43', '2024-02-03 18:19:02', '0');
INSERT INTO `tbl_sales` VALUES ('11', '0', '0', '000011', '0', '0', 'F', 'C', 'walk-in', '2024-02-03', '1', '1', '0.00', '0', '7', '2024-02-03 08:30:39', '2024-02-03 18:19:02', '0');
INSERT INTO `tbl_sales` VALUES ('12', '0', '0', '000012', '0', '0', 'F', 'C', 'walk-in', '2024-02-03', '1', '1', '0.00', '0', '7', '2024-02-03 08:31:19', '2024-02-03 18:19:02', '0');
INSERT INTO `tbl_sales` VALUES ('13', '0', '0', '000013', '0', '0', 'F', 'C', 'walk-in', '2024-02-03', '1', '1', '0.00', '0', '7', '2024-02-03 08:44:49', '2024-02-03 18:19:02', '0');
INSERT INTO `tbl_sales` VALUES ('14', '0', '0', '000014', '0', '0', 'F', 'C', 'walk-in', '2024-02-03', '1', '1', '0.00', '0', '7', '2024-02-03 08:50:03', '2024-02-03 18:19:02', '0');
INSERT INTO `tbl_sales` VALUES ('15', '0', '0', '000015', '0', '0', 'F', 'C', 'walk-in', '2024-02-03', '1', '1', '0.00', '0', '7', '2024-02-03 08:51:35', '2024-02-03 18:19:02', '0');
INSERT INTO `tbl_sales` VALUES ('16', '0', '0', '000016', '0', '0', 'F', 'C', 'walk-in', '2024-02-03', '1', '1', '0.00', '0', '7', '2024-02-03 08:55:51', '2024-02-03 18:19:02', '0');
INSERT INTO `tbl_sales` VALUES ('17', '0', '0', '000017', '0', '0', 'F', 'C', 'walk-in', '2024-02-03', '1', '1', '0.00', '0', '7', '2024-02-03 09:06:40', '2024-02-03 18:19:02', '0');
INSERT INTO `tbl_sales` VALUES ('18', '0', '0', '000018', '0', '0', 'P', 'C', 'walk-in', '2024-02-03', '1', '0', '0.00', '0', '7', '2024-02-03 10:01:00', '2024-02-03 10:01:54', '0');
INSERT INTO `tbl_sales` VALUES ('19', '0', '0', '000019', '0', '0', 'F', 'C', 'walk-in', '2024-02-03', '1', '1', '0.00', '0', '7', '2024-02-03 10:02:16', '2024-02-03 18:19:02', '0');
INSERT INTO `tbl_sales` VALUES ('20', '0', '0', '000020', '0', '0', 'F', 'C', 'walk-in', '2024-02-03', '1', '1', '0.00', '0', '7', '2024-02-03 10:02:44', '2024-02-03 18:19:02', '0');
INSERT INTO `tbl_sales` VALUES ('21', '0', '0', '000021', '0', '0', 'F', 'C', 'walk-in', '2024-02-03', '1', '1', '0.00', '0', '7', '2024-02-03 10:03:05', '2024-02-03 18:19:02', '0');
INSERT INTO `tbl_sales` VALUES ('22', '0', '0', '000022', '0', '0', 'F', 'C', 'walk-in', '2024-02-03', '1', '1', '0.00', '0', '7', '2024-02-03 10:42:37', '2024-02-03 18:19:02', '0');
INSERT INTO `tbl_sales` VALUES ('23', '0', '0', '000023', '0', '0', 'F', 'C', 'walk-in', '2024-02-03', '1', '1', '0.00', '0', '7', '2024-02-03 10:46:18', '2024-02-03 18:19:02', '0');
INSERT INTO `tbl_sales` VALUES ('24', '0', '0', '000024', '0', '0', 'F', 'C', 'walk-in', '2024-02-03', '1', '1', '0.00', '0', '7', '2024-02-03 10:50:16', '2024-02-03 18:19:02', '0');
INSERT INTO `tbl_sales` VALUES ('25', '0', '0', '000025', '0', '0', 'F', 'C', 'walk-in', '2024-02-03', '1', '1', '0.00', '0', '7', '2024-02-03 11:01:26', '2024-02-03 18:19:02', '0');
INSERT INTO `tbl_sales` VALUES ('26', '0', '0', '000026', '0', '0', 'F', 'C', 'walk-in', '2024-02-03', '1', '1', '0.00', '0', '7', '2024-02-03 11:07:33', '2024-02-03 18:19:02', '0');
INSERT INTO `tbl_sales` VALUES ('27', '0', '0', '000027', '0', '0', 'F', 'C', 'walk-in', '2024-02-03', '1', '1', '0.00', '0', '7', '2024-02-03 11:50:50', '2024-02-03 18:19:02', '0');
INSERT INTO `tbl_sales` VALUES ('28', '0', '0', '000028', '0', '0', 'F', 'C', 'walk-in', '2024-02-03', '1', '1', '0.00', '0', '7', '2024-02-03 11:51:38', '2024-02-03 18:19:02', '0');
INSERT INTO `tbl_sales` VALUES ('29', '0', '0', '000029', '0', '0', 'F', 'C', 'walk-in', '2024-02-03', '1', '1', '0.00', '0', '7', '2024-02-03 11:57:35', '2024-02-03 18:19:02', '0');
INSERT INTO `tbl_sales` VALUES ('30', '0', '0', '000030', '473', '1', 'F', 'C', 'walk-in', '2024-02-03', '1', '1', '0.00', '0', '7', '2024-02-03 12:14:34', '2024-02-03 18:19:02', '0');
INSERT INTO `tbl_sales` VALUES ('31', '0', '0', '000031', '0', '0', 'F', 'C', 'walk-in', '2024-02-03', '1', '1', '0.00', '0', '7', '2024-02-03 12:21:53', '2024-02-03 18:19:02', '0');
INSERT INTO `tbl_sales` VALUES ('32', '0', '0', '000032', '1005', '1', 'F', 'C', 'walk-in', '2024-02-03', '1', '1', '0.00', '0', '7', '2024-02-03 13:07:37', '2024-02-03 18:19:02', '0');
INSERT INTO `tbl_sales` VALUES ('33', '0', '0', '000033', '0', '0', 'F', 'C', 'walk-in', '2024-02-03', '1', '1', '0.00', '0', '7', '2024-02-03 13:11:50', '2024-02-03 18:19:02', '0');
INSERT INTO `tbl_sales` VALUES ('34', '0', '0', '000034', '1655', '1', 'F', 'C', 'walk-in', '2024-02-03', '1', '1', '0.00', '0', '7', '2024-02-03 14:20:20', '2024-02-03 18:19:02', '0');
INSERT INTO `tbl_sales` VALUES ('35', '0', '0', '000035', '1185', '1', 'F', 'C', 'walk-in', '2024-02-03', '1', '1', '0.00', '0', '7', '2024-02-03 14:36:24', '2024-02-03 18:19:02', '0');
INSERT INTO `tbl_sales` VALUES ('36', '0', '0', '000036', '0', '0', 'F', 'C', 'walk-in', '2024-02-03', '1', '1', '0.00', '0', '7', '2024-02-03 14:38:43', '2024-02-03 18:19:02', '0');
INSERT INTO `tbl_sales` VALUES ('37', '0', '0', '000037', '0', '0', 'F', 'C', 'walk-in', '2024-02-03', '1', '1', '0.00', '0', '7', '2024-02-03 14:39:35', '2024-02-03 18:19:02', '0');
INSERT INTO `tbl_sales` VALUES ('38', '0', '0', '000038', '73', '0', 'F', 'C', 'walk-in', '2024-02-03', '1', '1', '0.00', '0', '7', '2024-02-03 14:53:35', '2024-02-03 18:19:02', '0');
INSERT INTO `tbl_sales` VALUES ('39', '0', '0', '000039', '1656', '1', 'F', 'C', 'walk-in', '2024-02-03', '1', '1', '0.00', '0', '7', '2024-02-03 14:56:00', '2024-02-03 18:19:02', '0');
INSERT INTO `tbl_sales` VALUES ('40', '0', '0', '000040', '0', '0', 'F', 'C', 'walk-in', '2024-02-03', '1', '1', '0.00', '0', '7', '2024-02-03 15:57:39', '2024-02-03 18:19:02', '0');
INSERT INTO `tbl_sales` VALUES ('41', '0', '0', '000041', '0', '0', 'F', 'C', 'walk-in', '2024-02-03', '1', '1', '0.00', '0', '7', '2024-02-03 16:05:52', '2024-02-03 18:19:02', '0');
INSERT INTO `tbl_sales` VALUES ('42', '0', '0', '000042', '0', '0', 'F', 'C', 'walk-in', '2024-02-03', '1', '1', '0.00', '0', '7', '2024-02-03 16:18:10', '2024-02-03 18:19:02', '0');
INSERT INTO `tbl_sales` VALUES ('43', '0', '0', '000043', '0', '0', 'F', 'C', 'walk-in', '2024-02-03', '1', '1', '0.00', '0', '7', '2024-02-03 16:44:08', '2024-02-03 18:19:02', '0');
INSERT INTO `tbl_sales` VALUES ('44', '0', '0', '000044', '0', '0', 'F', 'C', 'walk-in', '2024-02-03', '1', '1', '0.00', '0', '7', '2024-02-03 17:09:07', '2024-02-03 18:19:02', '0');
INSERT INTO `tbl_sales` VALUES ('45', '0', '0', '000045', '0', '0', 'F', 'C', 'walk-in', '2024-02-03', '1', '1', '0.00', '0', '7', '2024-02-03 17:27:36', '2024-02-03 18:19:02', '0');
INSERT INTO `tbl_sales` VALUES ('46', '0', '0', '000046', '0', '0', 'F', 'C', 'walk-in', '2024-02-03', '1', '1', '0.00', '0', '7', '2024-02-03 17:30:04', '2024-02-03 18:19:02', '0');
INSERT INTO `tbl_sales` VALUES ('47', '0', '0', '000047', '0', '0', 'F', 'C', 'walk-in', '2024-02-03', '1', '1', '0.00', '0', '7', '2024-02-03 17:36:13', '2024-02-03 18:19:02', '0');
INSERT INTO `tbl_sales` VALUES ('48', '0', '0', '000048', '0', '0', 'F', 'C', 'walk-in', '2024-02-03', '1', '1', '0.00', '0', '7', '2024-02-03 17:38:53', '2024-02-03 18:19:02', '0');
INSERT INTO `tbl_sales` VALUES ('49', '0', '0', '000049', '0', '0', 'F', 'C', 'walk-in', '2024-02-03', '1', '1', '0.00', '0', '7', '2024-02-03 17:40:44', '2024-02-03 18:19:02', '0');
INSERT INTO `tbl_sales` VALUES ('50', '0', '0', '000050', '0', '0', 'F', 'C', 'walk-in', '2024-02-03', '1', '1', '0.00', '0', '7', '2024-02-03 17:45:47', '2024-02-03 18:19:02', '0');
INSERT INTO `tbl_sales` VALUES ('51', '0', '0', '000051', '0', '0', 'F', 'C', 'walk-in', '2024-02-03', '1', '1', '0.00', '0', '7', '2024-02-03 17:54:34', '2024-02-03 18:19:02', '0');
INSERT INTO `tbl_sales` VALUES ('52', '0', '0', '000052', '0', '0', 'F', 'C', 'walk-in', '2024-02-03', '1', '1', '0.00', '0', '7', '2024-02-03 17:55:29', '2024-02-03 18:19:02', '0');
INSERT INTO `tbl_sales` VALUES ('53', '0', '0', '000053', '0', '0', 'F', 'C', 'walk-in', '2024-02-03', '1', '1', '0.00', '0', '7', '2024-02-03 17:58:22', '2024-02-03 18:19:02', '0');
INSERT INTO `tbl_sales` VALUES ('54', '0', '0', '000054', '0', '0', 'F', 'C', 'walk-in', '2024-02-03', '1', '1', '0.00', '0', '7', '2024-02-03 17:58:46', '2024-02-03 18:19:02', '0');
INSERT INTO `tbl_sales` VALUES ('55', '0', '0', '000055', '0', '0', 'F', 'C', 'walk-in', '2024-02-03', '1', '1', '0.00', '0', '7', '2024-02-03 18:00:45', '2024-02-03 18:19:02', '0');
INSERT INTO `tbl_sales` VALUES ('56', '0', '0', '000056', '0', '0', 'F', 'C', 'walk-in', '2024-02-04', '1', '2', '0.00', '0', '7', '2024-02-04 05:58:09', '2024-02-04 18:20:36', '0');
INSERT INTO `tbl_sales` VALUES ('57', '0', '0', '000057', '0', '0', 'F', 'C', 'walk-in', '2024-02-04', '1', '2', '0.00', '0', '7', '2024-02-04 06:02:27', '2024-02-04 18:20:36', '0');
INSERT INTO `tbl_sales` VALUES ('58', '0', '0', '000058', '0', '0', 'F', 'C', 'walk-in', '2024-02-04', '1', '2', '0.00', '0', '7', '2024-02-04 06:39:54', '2024-02-04 18:20:36', '0');
INSERT INTO `tbl_sales` VALUES ('59', '0', '0', '000059', '0', '0', 'F', 'C', 'walk-in', '2024-02-04', '1', '2', '0.00', '0', '7', '2024-02-04 06:44:37', '2024-02-04 18:20:36', '0');
INSERT INTO `tbl_sales` VALUES ('60', '0', '0', '000060', '0', '0', 'F', 'C', 'walk-in', '2024-02-04', '1', '2', '0.00', '0', '7', '2024-02-04 07:22:56', '2024-02-04 18:20:36', '0');
INSERT INTO `tbl_sales` VALUES ('61', '0', '0', '000061', '0', '0', 'F', 'C', 'walk-in', '2024-02-04', '1', '2', '0.00', '0', '7', '2024-02-04 07:51:27', '2024-02-04 18:20:36', '0');
INSERT INTO `tbl_sales` VALUES ('62', '0', '0', '000062', '0', '0', 'F', 'C', 'walk-in', '2024-02-04', '1', '2', '0.00', '0', '7', '2024-02-04 08:22:16', '2024-02-04 18:20:36', '0');
INSERT INTO `tbl_sales` VALUES ('63', '0', '0', '000063', '0', '0', 'F', 'C', 'walk-in', '2024-02-04', '1', '2', '0.00', '0', '7', '2024-02-04 09:08:32', '2024-02-04 18:20:36', '0');
INSERT INTO `tbl_sales` VALUES ('64', '0', '0', '000064', '1184', '1', 'F', 'C', 'walk-in', '2024-02-04', '1', '2', '0.00', '0', '7', '2024-02-04 09:09:54', '2024-02-05 14:22:07', '0');
INSERT INTO `tbl_sales` VALUES ('65', '0', '0', '000065', '0', '0', 'F', 'C', 'walk-in', '2024-02-04', '1', '2', '0.00', '0', '7', '2024-02-04 09:12:31', '2024-02-04 18:20:36', '0');
INSERT INTO `tbl_sales` VALUES ('66', '0', '0', '000066', '0', '0', 'F', 'C', 'walk-in', '2024-02-04', '1', '2', '0.00', '0', '7', '2024-02-04 09:13:01', '2024-02-04 18:20:36', '0');
INSERT INTO `tbl_sales` VALUES ('67', '0', '0', '000067', '0', '0', 'F', 'C', 'walk-in', '2024-02-04', '1', '2', '0.00', '0', '7', '2024-02-04 09:13:29', '2024-02-04 18:20:36', '0');
INSERT INTO `tbl_sales` VALUES ('68', '0', '0', '000068', '0', '0', 'F', 'C', 'walk-in', '2024-02-04', '1', '2', '0.00', '0', '7', '2024-02-04 10:08:14', '2024-02-04 18:20:36', '0');
INSERT INTO `tbl_sales` VALUES ('69', '0', '0', '000069', '1184', '1', 'F', 'C', 'walk-in', '2024-02-04', '1', '2', '0.00', '0', '7', '2024-02-04 10:52:39', '2024-02-04 18:20:36', '0');
INSERT INTO `tbl_sales` VALUES ('70', '0', '0', '000070', '0', '0', 'F', 'C', 'walk-in', '2024-02-04', '1', '2', '0.00', '0', '7', '2024-02-04 10:56:23', '2024-02-04 18:20:36', '0');
INSERT INTO `tbl_sales` VALUES ('71', '0', '0', '000071', '1657', '1', 'F', 'C', 'walk-in', '2024-02-04', '1', '2', '0.00', '0', '7', '2024-02-04 11:49:11', '2024-02-04 18:20:36', '0');
INSERT INTO `tbl_sales` VALUES ('72', '0', '0', '000072', '0', '0', 'F', 'C', 'walk-in', '2024-02-04', '1', '2', '0.00', '0', '7', '2024-02-04 11:51:49', '2024-02-04 18:20:36', '0');
INSERT INTO `tbl_sales` VALUES ('73', '0', '0', '000073', '0', '0', 'F', 'C', 'walk-in', '2024-02-04', '1', '2', '0.00', '0', '7', '2024-02-04 11:52:56', '2024-02-04 18:20:36', '0');
INSERT INTO `tbl_sales` VALUES ('74', '0', '0', '000074', '0', '0', 'F', 'C', 'walk-in', '2024-02-04', '1', '2', '0.00', '0', '7', '2024-02-04 11:58:06', '2024-02-04 18:20:36', '0');
INSERT INTO `tbl_sales` VALUES ('75', '0', '0', '000075', '0', '0', 'F', 'C', 'walk-in', '2024-02-04', '1', '2', '0.00', '0', '7', '2024-02-04 12:18:01', '2024-02-04 18:20:36', '0');
INSERT INTO `tbl_sales` VALUES ('76', '0', '0', '000076', '0', '0', 'F', 'C', 'walk-in', '2024-02-04', '1', '2', '0.00', '0', '7', '2024-02-04 12:23:39', '2024-02-04 18:20:36', '0');
INSERT INTO `tbl_sales` VALUES ('77', '0', '0', '000077', '0', '0', 'F', 'C', 'walk-in', '2024-02-04', '1', '2', '0.00', '0', '7', '2024-02-04 12:24:09', '2024-02-04 18:20:36', '0');
INSERT INTO `tbl_sales` VALUES ('78', '0', '0', '000078', '0', '0', 'F', 'C', 'walk-in', '2024-02-04', '1', '2', '0.00', '0', '7', '2024-02-04 13:19:39', '2024-02-04 18:20:36', '0');
INSERT INTO `tbl_sales` VALUES ('79', '0', '0', '000079', '0', '0', 'F', 'C', 'walk-in', '2024-02-04', '1', '2', '0.00', '0', '7', '2024-02-04 14:32:33', '2024-02-04 18:20:36', '0');
INSERT INTO `tbl_sales` VALUES ('80', '0', '0', '000080', '0', '0', 'F', 'C', 'walk-in', '2024-02-04', '1', '2', '0.00', '0', '7', '2024-02-04 14:42:56', '2024-02-04 18:20:36', '0');
INSERT INTO `tbl_sales` VALUES ('81', '0', '0', '000081', '0', '0', 'F', 'C', 'walk-in', '2024-02-04', '1', '2', '0.00', '0', '7', '2024-02-04 15:11:21', '2024-02-04 18:20:36', '0');
INSERT INTO `tbl_sales` VALUES ('82', '0', '0', '000082', '0', '0', 'F', 'C', 'walk-in', '2024-02-04', '1', '2', '0.00', '0', '7', '2024-02-04 15:24:11', '2024-02-04 18:20:36', '0');
INSERT INTO `tbl_sales` VALUES ('83', '0', '0', '000083', '0', '0', 'F', 'C', 'walk-in', '2024-02-04', '1', '2', '0.00', '0', '7', '2024-02-04 15:32:19', '2024-02-04 18:20:36', '0');
INSERT INTO `tbl_sales` VALUES ('84', '0', '0', '000084', '796', '1', 'F', 'C', 'walk-in', '2024-02-04', '1', '2', '0.00', '0', '7', '2024-02-04 15:33:47', '2024-02-05 14:22:14', '0');
INSERT INTO `tbl_sales` VALUES ('85', '0', '0', '000085', '1611', '1', 'F', 'H', '1', '2024-02-04', '0', '3', '10.80', '0', '7', '2024-02-04 15:57:23', '2024-02-05 17:57:55', '0');
INSERT INTO `tbl_sales` VALUES ('86', '0', '0', '000086', '0', '0', 'F', 'C', 'walk-in', '2024-02-04', '1', '2', '0.00', '0', '7', '2024-02-04 16:04:37', '2024-02-04 18:20:36', '0');
INSERT INTO `tbl_sales` VALUES ('87', '0', '0', '000087', '0', '0', 'F', 'C', 'walk-in', '2024-02-04', '1', '2', '0.00', '0', '7', '2024-02-04 17:26:05', '2024-02-04 18:20:36', '0');
INSERT INTO `tbl_sales` VALUES ('88', '0', '0', '000088', '0', '0', 'F', 'C', 'walk-in', '2024-02-04', '1', '2', '0.00', '0', '7', '2024-02-04 17:35:35', '2024-02-04 18:20:36', '0');
INSERT INTO `tbl_sales` VALUES ('89', '0', '0', '000089', '0', '0', 'F', 'C', 'walk-in', '2024-02-04', '1', '2', '0.00', '0', '7', '2024-02-04 17:37:15', '2024-02-04 18:20:36', '0');
INSERT INTO `tbl_sales` VALUES ('90', '0', '0', '000090', '0', '0', 'F', 'C', 'walk-in', '2024-02-04', '1', '2', '0.00', '0', '7', '2024-02-04 17:39:46', '2024-02-04 18:20:36', '0');
INSERT INTO `tbl_sales` VALUES ('91', '0', '0', '000091', '417', '0', 'F', 'H', 'walk-in', '2024-02-04', '0', '2', '0.00', '0', '7', '2024-02-04 17:49:58', '2024-02-04 18:20:36', '0');
INSERT INTO `tbl_sales` VALUES ('92', '0', '0', '000092', '1', '1', 'F', 'H', '0', '2024-02-04', '0', '2', '4.32', '0', '7', '2024-02-04 17:52:09', '2024-02-04 18:20:36', '0');
INSERT INTO `tbl_sales` VALUES ('93', '0', '0', '000093', '0', '0', 'F', 'C', 'walk-in', '2024-02-04', '1', '2', '0.00', '0', '7', '2024-02-04 17:57:18', '2024-02-04 18:20:36', '0');
INSERT INTO `tbl_sales` VALUES ('94', '0', '0', '000094', '0', '0', 'F', 'C', 'walk-in', '2024-02-04', '1', '2', '0.00', '0', '7', '2024-02-04 17:59:11', '2024-02-04 18:20:36', '0');
INSERT INTO `tbl_sales` VALUES ('95', '0', '0', '000095', '0', '0', 'F', 'C', 'walk-in', '2024-02-04', '1', '2', '0.00', '0', '7', '2024-02-04 18:12:38', '2024-02-04 18:20:36', '0');
INSERT INTO `tbl_sales` VALUES ('96', '0', '0', '000096', '0', '0', 'F', 'C', 'walk-in', '2024-02-04', '1', '2', '0.00', '0', '7', '2024-02-04 18:17:14', '2024-02-04 18:20:36', '0');
INSERT INTO `tbl_sales` VALUES ('97', '0', '0', '000097', '0', '0', 'F', 'C', 'walk-in', '2024-02-05', '1', '3', '0.00', '0', '7', '2024-02-05 06:08:06', '2024-02-05 17:57:55', '0');
INSERT INTO `tbl_sales` VALUES ('98', '0', '0', '000098', '0', '0', 'F', 'C', 'walk-in', '2024-02-05', '1', '3', '0.00', '0', '7', '2024-02-05 06:10:04', '2024-02-05 17:57:55', '0');
INSERT INTO `tbl_sales` VALUES ('99', '0', '0', '000099', '0', '0', 'F', 'C', 'walk-in', '2024-02-05', '1', '3', '0.00', '0', '7', '2024-02-05 06:25:27', '2024-02-05 17:57:55', '0');
INSERT INTO `tbl_sales` VALUES ('100', '0', '0', '000100', '0', '0', 'F', 'C', 'walk-in', '2024-02-05', '1', '3', '0.00', '0', '7', '2024-02-05 06:43:13', '2024-02-05 17:57:55', '0');
INSERT INTO `tbl_sales` VALUES ('101', '0', '0', '000101', '0', '0', 'F', 'C', 'walk-in', '2024-02-05', '1', '3', '0.00', '0', '7', '2024-02-05 06:50:13', '2024-02-05 17:57:55', '0');
INSERT INTO `tbl_sales` VALUES ('102', '0', '0', '000102', '0', '0', 'F', 'C', 'walk-in', '2024-02-05', '1', '3', '0.00', '0', '7', '2024-02-05 07:07:47', '2024-02-05 17:57:55', '0');
INSERT INTO `tbl_sales` VALUES ('103', '0', '0', '000103', '0', '0', 'F', 'C', 'walk-in', '2024-02-05', '1', '3', '0.00', '0', '7', '2024-02-05 07:21:37', '2024-02-05 17:57:55', '0');
INSERT INTO `tbl_sales` VALUES ('104', '0', '0', '000104', '0', '0', 'F', 'C', 'walk-in', '2024-02-05', '1', '3', '0.00', '0', '7', '2024-02-05 07:39:50', '2024-02-05 17:57:55', '0');
INSERT INTO `tbl_sales` VALUES ('105', '0', '0', '000105', '936', '1', 'F', 'C', 'walk-in', '2024-02-05', '1', '3', '0.00', '0', '7', '2024-02-05 08:31:04', '2024-02-05 17:57:55', '0');
INSERT INTO `tbl_sales` VALUES ('106', '0', '0', '000106', '1506', '1', 'F', 'C', 'walk-in', '2024-02-05', '1', '3', '0.00', '0', '7', '2024-02-05 10:40:28', '2024-02-05 17:57:55', '0');
INSERT INTO `tbl_sales` VALUES ('107', '0', '0', '000107', '0', '0', 'F', 'C', 'walk-in', '2024-02-05', '1', '3', '0.00', '0', '7', '2024-02-05 11:32:52', '2024-02-05 17:57:55', '0');
INSERT INTO `tbl_sales` VALUES ('108', '0', '0', '000108', '0', '0', 'F', 'C', 'walk-in', '2024-02-05', '1', '3', '0.00', '0', '7', '2024-02-05 12:18:58', '2024-02-05 17:57:55', '0');
INSERT INTO `tbl_sales` VALUES ('109', '0', '0', '000109', '0', '0', 'F', 'C', 'walk-in', '2024-02-05', '1', '3', '0.00', '0', '7', '2024-02-05 12:22:16', '2024-02-05 17:57:55', '0');
INSERT INTO `tbl_sales` VALUES ('110', '0', '0', '000110', '0', '0', 'F', 'C', 'walk-in', '2024-02-05', '1', '3', '0.00', '0', '7', '2024-02-05 12:29:27', '2024-02-05 17:57:55', '0');
INSERT INTO `tbl_sales` VALUES ('111', '0', '0', '000111', '0', '0', 'F', 'C', 'walk-in', '2024-02-05', '1', '3', '0.00', '0', '7', '2024-02-05 12:30:30', '2024-02-05 17:57:55', '0');
INSERT INTO `tbl_sales` VALUES ('112', '0', '0', '000112', '0', '0', 'F', 'C', 'walk-in', '2024-02-05', '1', '3', '0.00', '0', '7', '2024-02-05 13:07:09', '2024-02-05 17:57:55', '0');
INSERT INTO `tbl_sales` VALUES ('113', '0', '0', '000113', '1658', '1', 'F', 'C', 'walk-in', '2024-02-05', '1', '3', '0.00', '0', '7', '2024-02-05 14:38:10', '2024-02-05 17:57:55', '0');
INSERT INTO `tbl_sales` VALUES ('114', '0', '0', '000114', '337', '1', 'F', 'C', 'walk-in', '2024-02-05', '1', '3', '0.00', '0', '7', '2024-02-05 14:45:58', '2024-02-05 17:57:55', '0');
INSERT INTO `tbl_sales` VALUES ('115', '0', '0', '000115', '0', '0', 'F', 'C', 'walk-in', '2024-02-05', '1', '3', '0.00', '0', '7', '2024-02-05 14:48:06', '2024-02-05 17:57:55', '0');
INSERT INTO `tbl_sales` VALUES ('116', '0', '0', '000116', '0', '0', 'F', 'C', 'walk-in', '2024-02-05', '1', '3', '0.00', '0', '7', '2024-02-05 14:51:13', '2024-02-05 17:57:55', '0');
INSERT INTO `tbl_sales` VALUES ('117', '0', '0', '000117', '941', '1', 'F', 'C', 'walk-in', '2024-02-05', '1', '3', '0.00', '0', '7', '2024-02-05 15:51:53', '2024-02-05 17:57:55', '0');
INSERT INTO `tbl_sales` VALUES ('118', '0', '0', '000118', '0', '0', 'F', 'C', 'walk-in', '2024-02-05', '1', '3', '0.00', '0', '7', '2024-02-05 15:59:39', '2024-02-05 17:57:55', '0');
INSERT INTO `tbl_sales` VALUES ('119', '0', '0', '000119', '0', '0', 'F', 'C', 'walk-in', '2024-02-05', '1', '3', '0.00', '0', '7', '2024-02-05 16:03:24', '2024-02-05 17:57:55', '0');
INSERT INTO `tbl_sales` VALUES ('120', '0', '0', '000120', '0', '0', 'F', 'C', 'walk-in', '2024-02-05', '1', '3', '0.00', '0', '7', '2024-02-05 16:18:57', '2024-02-05 17:57:55', '0');
INSERT INTO `tbl_sales` VALUES ('121', '0', '0', '000121', '1660', '1', 'F', 'C', 'walk-in', '2024-02-05', '1', '0', '0.00', '0', '7', '2024-02-05 16:35:19', '2024-02-06 11:38:34', '0');
INSERT INTO `tbl_sales` VALUES ('122', '0', '0', '000122', '0', '0', 'F', 'C', 'walk-in', '2024-02-05', '1', '3', '0.00', '0', '7', '2024-02-05 16:38:04', '2024-02-05 17:57:55', '0');
INSERT INTO `tbl_sales` VALUES ('123', '0', '0', '000123', '0', '0', 'F', 'C', 'walk-in', '2024-02-05', '1', '3', '0.00', '0', '7', '2024-02-05 17:08:30', '2024-02-05 17:57:55', '0');
INSERT INTO `tbl_sales` VALUES ('124', '0', '0', '000124', '1659', '1', 'F', 'C', 'walk-in', '2024-02-05', '1', '3', '0.00', '0', '7', '2024-02-05 17:17:11', '2024-02-05 17:57:55', '0');
INSERT INTO `tbl_sales` VALUES ('125', '0', '0', '000125', '0', '0', 'F', 'C', 'walk-in', '2024-02-05', '1', '3', '0.00', '0', '7', '2024-02-05 17:22:56', '2024-02-05 17:57:55', '0');
INSERT INTO `tbl_sales` VALUES ('126', '0', '0', '000126', '0', '0', 'F', 'C', 'walk-in', '2024-02-05', '1', '3', '0.00', '0', '7', '2024-02-05 17:29:04', '2024-02-05 17:57:55', '0');
INSERT INTO `tbl_sales` VALUES ('127', '0', '0', '000127', '0', '0', 'F', 'C', 'walk-in', '2024-02-05', '1', '3', '0.00', '0', '7', '2024-02-05 17:36:41', '2024-02-05 17:57:55', '0');
INSERT INTO `tbl_sales` VALUES ('128', '0', '0', '000128', '1660', '0', 'F', 'H', 'walk-in', '2024-02-05', '0', '3', '0.00', '0', '7', '2024-02-05 17:47:52', '2024-02-05 17:57:55', '0');
INSERT INTO `tbl_sales` VALUES ('129', '0', '0', '000129', '0', '0', 'F', 'C', 'walk-in', '2024-02-06', '1', '0', '0.00', '0', '7', '2024-02-06 07:04:55', '2024-02-06 07:05:38', '0');
INSERT INTO `tbl_sales` VALUES ('130', '0', '0', '000130', '0', '0', 'F', 'C', 'walk-in', '2024-02-06', '1', '0', '0.00', '0', '7', '2024-02-06 07:10:49', '2024-02-06 07:10:52', '0');
INSERT INTO `tbl_sales` VALUES ('131', '0', '0', '000131', '0', '0', 'F', 'C', 'walk-in', '2024-02-06', '1', '0', '0.00', '0', '7', '2024-02-06 07:22:35', '2024-02-06 07:23:32', '0');
INSERT INTO `tbl_sales` VALUES ('132', '0', '0', '000132', '0', '0', 'F', 'C', 'walk-in', '2024-02-06', '1', '0', '0.00', '0', '7', '2024-02-06 08:02:01', '2024-02-06 08:02:23', '0');
INSERT INTO `tbl_sales` VALUES ('133', '0', '0', '000133', '0', '0', 'S', 'C', 'walk-in', '2024-02-06', '1', '0', '0.00', '0', '7', '2024-02-06 11:31:11', '2024-02-06 11:31:11', '0');
INSERT INTO `tbl_sales` VALUES ('134', '0', '0', '000134', '1660', '1', 'F', 'C', 'walk-in', '2024-02-06', '1', '0', '0.00', '0', '7', '2024-02-06 11:38:46', '2024-02-06 11:43:51', '0');
INSERT INTO `tbl_sales` VALUES ('135', '0', '0', '000135', '1660', '1', 'F', 'C', 'walk-in', '2024-02-06', '1', '0', '0.00', '0', '7', '2024-02-06 11:44:01', '2024-02-06 12:12:57', '0');
INSERT INTO `tbl_sales` VALUES ('136', '0', '0', '000136', '0', '1', 'F', 'C', 'walk-in', '2024-02-06', '1', '0', '0.00', '0', '7', '2024-02-06 11:53:37', '2024-02-06 12:09:29', '0');
INSERT INTO `tbl_sales` VALUES ('137', '0', '0', '000137', '341', '0', 'P', 'C', 'walk-in', '2024-02-06', '1', '0', '0.00', '0', '7', '2024-02-06 12:27:43', '2024-02-06 12:29:04', '0');
INSERT INTO `tbl_sales` VALUES ('138', '0', '0', '000138', '0', '0', 'F', 'C', 'walk-in', '2024-02-06', '1', '0', '0.00', '0', '7', '2024-02-06 12:30:50', '2024-02-06 12:30:57', '0');
INSERT INTO `tbl_sales` VALUES ('139', '0', '0', '000139', '0', '0', 'F', 'C', 'walk-in', '2024-02-06', '1', '0', '0.00', '0', '7', '2024-02-06 12:37:32', '2024-02-06 12:37:56', '0');
INSERT INTO `tbl_sales` VALUES ('140', '0', '0', '000140', '0', '0', 'F', 'C', 'walk-in', '2024-02-06', '1', '0', '0.00', '0', '7', '2024-02-06 13:24:47', '2024-02-06 13:25:47', '0');
INSERT INTO `tbl_sales` VALUES ('141', '0', '0', '000141', '1661', '1', 'F', 'C', 'walk-in', '2024-02-06', '1', '0', '0.00', '0', '7', '2024-02-06 13:40:17', '2024-02-06 13:51:07', '0');
INSERT INTO `tbl_sales` VALUES ('142', '0', '0', '000142', '0', '0', 'F', 'C', 'walk-in', '2024-02-06', '1', '0', '0.00', '0', '7', '2024-02-06 15:02:21', '2024-02-06 15:02:38', '0');
INSERT INTO `tbl_sales` VALUES ('143', '0', '0', '000143', '0', '0', 'F', 'C', 'walk-in', '2024-02-06', '1', '0', '0.00', '0', '7', '2024-02-06 15:17:59', '2024-02-06 15:36:39', '0');
INSERT INTO `tbl_sales` VALUES ('144', '0', '0', '000144', '0', '0', 'F', 'C', 'walk-in', '2024-02-06', '1', '0', '0.00', '0', '7', '2024-02-06 15:37:35', '2024-02-06 15:38:31', '0');
INSERT INTO `tbl_sales` VALUES ('145', '0', '0', '000145', '0', '0', 'F', 'C', 'walk-in', '2024-02-06', '1', '0', '0.00', '0', '7', '2024-02-06 15:43:52', '2024-02-06 15:44:26', '0');
INSERT INTO `tbl_sales` VALUES ('146', '0', '0', '000146', '0', '0', 'F', 'C', 'walk-in', '2024-02-06', '1', '0', '0.00', '0', '7', '2024-02-06 15:49:13', '2024-02-06 15:50:13', '0');
INSERT INTO `tbl_sales` VALUES ('147', '0', '0', '000147', '0', '0', 'F', 'C', 'walk-in', '2024-02-06', '1', '0', '0.00', '0', '7', '2024-02-06 15:52:40', '2024-02-06 15:54:01', '0');
INSERT INTO `tbl_sales` VALUES ('148', '0', '0', '000148', '0', '0', 'F', 'C', 'walk-in', '2024-02-06', '1', '0', '0.00', '0', '7', '2024-02-06 15:58:01', '2024-02-06 15:58:07', '0');
INSERT INTO `tbl_sales` VALUES ('149', '0', '0', '000149', '0', '0', 'F', 'C', 'walk-in', '2024-02-06', '1', '0', '0.00', '0', '7', '2024-02-06 16:36:06', '2024-02-06 16:37:48', '0');
INSERT INTO `tbl_sales` VALUES ('150', '0', '0', '000150', '0', '0', 'F', 'C', 'walk-in', '2024-02-06', '1', '0', '0.00', '0', '7', '2024-02-06 16:41:53', '2024-02-06 16:42:43', '0');
INSERT INTO `tbl_sales` VALUES ('151', '0', '0', '000151', '0', '0', 'F', 'C', 'walk-in', '2024-02-06', '1', '0', '0.00', '0', '7', '2024-02-06 17:54:18', '2024-02-06 17:55:08', '0');
INSERT INTO `tbl_sales` VALUES ('152', '0', '0', '000152', '0', '0', 'F', 'C', 'walk-in', '2024-02-06', '1', '0', '0.00', '0', '7', '2024-02-06 17:55:17', '2024-02-06 17:56:24', '0');

CREATE TABLE `tbl_sales_details` (
  `sales_detail_id` int(11) NOT NULL AUTO_INCREMENT,
  `sales_id` int(11) NOT NULL,
  `product_category_id` int(11) NOT NULL,
  `discount_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `discount` decimal(8,2) NOT NULL,
  `quantity` decimal(12,2) NOT NULL,
  `cost` decimal(12,5) NOT NULL,
  `price` decimal(12,2) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_last_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`sales_detail_id`)
) ENGINE=InnoDB AUTO_INCREMENT=237 DEFAULT CHARSET=latin1;
INSERT INTO `tbl_sales_details` VALUES ('1', '1', '0', '0', '227', '0.00', '1.00', '0.01000', '1.00', '2024-02-01 13:40:14', '0000-00-00 00:00:00');
INSERT INTO `tbl_sales_details` VALUES ('2', '2', '0', '0', '231', '0.00', '1.00', '194.60975', '1150.00', '2024-02-01 14:33:00', '0000-00-00 00:00:00');
INSERT INTO `tbl_sales_details` VALUES ('3', '3', '0', '0', '453', '0.00', '2.00', '29.58000', '32.00', '2024-02-03 06:51:05', '2024-02-03 06:51:10');
INSERT INTO `tbl_sales_details` VALUES ('5', '4', '0', '0', '143', '40.00', '4.00', '186.66667', '250.00', '2024-02-03 07:15:05', '2024-02-03 07:17:29');
INSERT INTO `tbl_sales_details` VALUES ('6', '4', '0', '0', '13', '100.00', '1.00', '5425.37313', '5600.00', '2024-02-03 07:16:02', '2024-02-03 07:17:07');
INSERT INTO `tbl_sales_details` VALUES ('8', '5', '0', '0', '447', '0.00', '2.00', '31.19000', '34.00', '2024-02-03 07:44:55', '2024-02-03 07:45:10');
INSERT INTO `tbl_sales_details` VALUES ('9', '5', '0', '0', '526', '0.00', '1.00', '8.73000', '10.00', '2024-02-03 07:45:21', '0000-00-00 00:00:00');
INSERT INTO `tbl_sales_details` VALUES ('10', '6', '0', '0', '394', '26.00', '1.00', '1605.83333', '1676.00', '2024-02-03 07:46:15', '2024-02-03 07:46:48');
INSERT INTO `tbl_sales_details` VALUES ('11', '7', '0', '0', '441', '0.00', '1.00', '53.60000', '60.00', '2024-02-03 07:49:10', '0000-00-00 00:00:00');
INSERT INTO `tbl_sales_details` VALUES ('12', '8', '0', '0', '13', '100.00', '1.00', '5425.37313', '5600.00', '2024-02-03 07:53:17', '2024-02-03 07:53:28');
INSERT INTO `tbl_sales_details` VALUES ('13', '8', '0', '0', '143', '40.00', '4.00', '186.66667', '250.00', '2024-02-03 07:53:20', '2024-02-03 07:53:32');
INSERT INTO `tbl_sales_details` VALUES ('14', '9', '0', '0', '13', '100.00', '1.00', '5425.37313', '5600.00', '2024-02-03 07:54:28', '2024-02-03 07:54:41');
INSERT INTO `tbl_sales_details` VALUES ('15', '9', '0', '0', '143', '40.00', '4.00', '186.66667', '250.00', '2024-02-03 07:54:30', '2024-02-03 07:54:37');
INSERT INTO `tbl_sales_details` VALUES ('16', '10', '0', '0', '465', '0.00', '5.50', '37.40000', '40.00', '2024-02-03 08:14:43', '2024-02-03 08:14:48');
INSERT INTO `tbl_sales_details` VALUES ('17', '11', '0', '0', '644', '20.00', '1.00', '1296.42857', '1270.00', '2024-02-03 08:30:39', '2024-02-03 08:30:50');
INSERT INTO `tbl_sales_details` VALUES ('18', '12', '0', '0', '440', '0.00', '5.00', '38.12000', '42.00', '2024-02-03 08:31:19', '2024-02-03 08:31:22');
INSERT INTO `tbl_sales_details` VALUES ('19', '13', '0', '0', '439', '0.00', '5.00', '40.90000', '44.00', '2024-02-03 08:44:49', '2024-02-03 08:44:51');
INSERT INTO `tbl_sales_details` VALUES ('21', '14', '0', '0', '481', '0.00', '1.00', '50.00016', '53.00', '2024-02-03 08:50:23', '0000-00-00 00:00:00');
INSERT INTO `tbl_sales_details` VALUES ('22', '15', '0', '0', '440', '50.00', '25.00', '38.12000', '42.00', '2024-02-03 08:51:35', '2024-02-03 08:51:42');
INSERT INTO `tbl_sales_details` VALUES ('23', '16', '0', '0', '464', '30.00', '1.00', '1870.00000', '1920.00', '2024-02-03 08:55:51', '2024-02-03 08:56:13');
INSERT INTO `tbl_sales_details` VALUES ('24', '17', '0', '0', '404', '50.00', '1.00', '1804.28571', '1950.00', '2024-02-03 09:06:40', '2024-02-03 09:06:55');
INSERT INTO `tbl_sales_details` VALUES ('25', '18', '0', '0', '401', '0.00', '1.00', '2045.00000', '2100.00', '2024-02-03 10:01:00', '0000-00-00 00:00:00');
INSERT INTO `tbl_sales_details` VALUES ('26', '18', '0', '0', '482', '0.00', '1.00', '1609.42857', '1668.00', '2024-02-03 10:01:31', '0000-00-00 00:00:00');
INSERT INTO `tbl_sales_details` VALUES ('27', '19', '0', '0', '46', '0.00', '2.00', '69.13394', '45.00', '2024-02-03 10:02:16', '2024-02-03 10:02:19');
INSERT INTO `tbl_sales_details` VALUES ('28', '20', '0', '0', '653', '0.00', '4.00', '5.00000', '8.00', '2024-02-03 10:02:44', '2024-02-03 10:02:45');
INSERT INTO `tbl_sales_details` VALUES ('29', '21', '0', '0', '615', '30.00', '1.00', '1150.00000', '1280.00', '2024-02-03 10:03:05', '2024-02-03 10:03:09');
INSERT INTO `tbl_sales_details` VALUES ('30', '21', '0', '0', '35', '20.00', '1.00', '201.86682', '320.00', '2024-02-03 10:03:22', '2024-02-03 10:03:25');
INSERT INTO `tbl_sales_details` VALUES ('31', '21', '0', '0', '46', '0.00', '2.00', '69.13394', '45.00', '2024-02-03 10:03:28', '2024-02-03 10:03:30');
INSERT INTO `tbl_sales_details` VALUES ('32', '22', '0', '0', '103', '100.00', '2.00', '953.46477', '1050.00', '2024-02-03 10:42:37', '2024-02-03 10:43:09');
INSERT INTO `tbl_sales_details` VALUES ('33', '23', '0', '0', '65', '0.00', '1.00', '360.00000', '400.00', '2024-02-03 10:46:18', '0000-00-00 00:00:00');
INSERT INTO `tbl_sales_details` VALUES ('34', '23', '0', '0', '644', '20.00', '1.00', '1296.42857', '1270.00', '2024-02-03 10:46:26', '2024-02-03 10:46:36');
INSERT INTO `tbl_sales_details` VALUES ('35', '24', '0', '0', '71', '50.00', '1.00', '1124.38661', '1300.00', '2024-02-03 10:50:16', '2024-02-03 10:50:24');
INSERT INTO `tbl_sales_details` VALUES ('36', '24', '0', '0', '35', '20.00', '1.00', '201.86682', '320.00', '2024-02-03 10:50:30', '2024-02-03 10:50:41');
INSERT INTO `tbl_sales_details` VALUES ('37', '25', '0', '0', '483', '0.00', '1.00', '73.00000', '85.00', '2024-02-03 11:01:26', '0000-00-00 00:00:00');
INSERT INTO `tbl_sales_details` VALUES ('38', '26', '0', '0', '410', '0.00', '2.00', '22.93677', '24.00', '2024-02-03 11:07:33', '2024-02-03 11:07:38');
INSERT INTO `tbl_sales_details` VALUES ('39', '27', '0', '0', '547', '100.00', '2.00', '947.61854', '1050.00', '2024-02-03 11:50:50', '2024-02-03 11:50:58');
INSERT INTO `tbl_sales_details` VALUES ('40', '27', '0', '0', '46', '20.00', '10.00', '69.13394', '45.00', '2024-02-03 11:51:08', '2024-02-03 11:51:16');
INSERT INTO `tbl_sales_details` VALUES ('41', '28', '0', '0', '46', '0.00', '5.00', '69.13394', '45.00', '2024-02-03 11:51:38', '2024-02-03 11:51:41');
INSERT INTO `tbl_sales_details` VALUES ('42', '29', '0', '0', '439', '0.00', '5.00', '40.90000', '44.00', '2024-02-03 11:57:35', '2024-02-03 11:57:37');
INSERT INTO `tbl_sales_details` VALUES ('43', '29', '0', '0', '447', '0.00', '5.00', '31.19000', '34.00', '2024-02-03 11:57:57', '2024-02-03 11:57:59');
INSERT INTO `tbl_sales_details` VALUES ('44', '29', '0', '0', '476', '0.00', '3.00', '38.40000', '40.00', '2024-02-03 11:58:43', '2024-02-03 11:58:45');
INSERT INTO `tbl_sales_details` VALUES ('45', '29', '0', '0', '483', '0.00', '1.00', '73.00000', '85.00', '2024-02-03 11:59:15', '0000-00-00 00:00:00');
INSERT INTO `tbl_sales_details` VALUES ('46', '30', '0', '0', '10', '200.00', '2.00', '5373.27800', '5400.00', '2024-02-03 12:14:34', '2024-02-03 12:15:53');
INSERT INTO `tbl_sales_details` VALUES ('47', '30', '0', '0', '39', '20.00', '1.00', '384.90724', '580.00', '2024-02-03 12:16:20', '2024-02-03 12:17:36');
INSERT INTO `tbl_sales_details` VALUES ('48', '31', '0', '0', '484', '0.00', '4.00', '64.38000', '68.00', '2024-02-03 12:21:53', '2024-02-03 12:22:01');
INSERT INTO `tbl_sales_details` VALUES ('49', '32', '0', '0', '14', '400.00', '2.00', '4700.00000', '5000.00', '2024-02-03 13:07:37', '2024-02-03 13:07:49');
INSERT INTO `tbl_sales_details` VALUES ('50', '32', '0', '0', '30', '0.00', '1.00', '375.00000', '650.00', '2024-02-03 13:07:43', '0000-00-00 00:00:00');
INSERT INTO `tbl_sales_details` VALUES ('51', '33', '0', '0', '35', '20.00', '1.00', '201.86682', '320.00', '2024-02-03 13:11:50', '2024-02-03 13:11:55');
INSERT INTO `tbl_sales_details` VALUES ('52', '33', '0', '0', '143', '0.00', '1.00', '186.66667', '250.00', '2024-02-03 13:12:05', '0000-00-00 00:00:00');
INSERT INTO `tbl_sales_details` VALUES ('53', '34', '0', '0', '14', '200.00', '2.00', '4700.00000', '5000.00', '2024-02-03 14:20:20', '2024-02-03 14:21:25');
INSERT INTO `tbl_sales_details` VALUES ('54', '34', '0', '0', '144', '50.00', '1.00', '1299.99382', '1450.00', '2024-02-03 14:21:00', '2024-02-03 14:21:05');
INSERT INTO `tbl_sales_details` VALUES ('55', '34', '0', '0', '46', '20.00', '10.00', '69.13394', '45.00', '2024-02-03 14:21:30', '2024-02-03 14:21:39');
INSERT INTO `tbl_sales_details` VALUES ('56', '34', '0', '0', '71', '50.00', '1.00', '1124.38661', '1300.00', '2024-02-03 14:21:58', '2024-02-03 14:22:04');
INSERT INTO `tbl_sales_details` VALUES ('57', '35', '0', '0', '10', '0.00', '2.00', '5373.27800', '5400.00', '2024-02-03 14:36:24', '2024-02-03 14:36:27');
INSERT INTO `tbl_sales_details` VALUES ('58', '36', '0', '0', '71', '50.00', '1.00', '1124.38661', '1300.00', '2024-02-03 14:38:43', '2024-02-03 14:38:48');
INSERT INTO `tbl_sales_details` VALUES ('59', '37', '0', '0', '474', '20.00', '1.00', '1210.00000', '1270.00', '2024-02-03 14:39:35', '2024-02-03 14:39:43');
INSERT INTO `tbl_sales_details` VALUES ('60', '38', '0', '0', '358', '30.00', '1.00', '3.72563', '1380.00', '2024-02-03 14:53:35', '2024-02-03 14:53:42');
INSERT INTO `tbl_sales_details` VALUES ('61', '39', '0', '0', '19', '30.00', '1.00', '1263.45301', '1330.00', '2024-02-03 14:56:00', '2024-02-03 14:56:04');
INSERT INTO `tbl_sales_details` VALUES ('62', '39', '0', '0', '28', '30.00', '1.00', '1349.14933', '1430.00', '2024-02-03 14:56:42', '2024-02-03 14:56:47');
INSERT INTO `tbl_sales_details` VALUES ('63', '40', '0', '0', '383', '0.00', '4.00', '55.20000', '58.00', '2024-02-03 15:57:39', '2024-02-03 15:57:45');
INSERT INTO `tbl_sales_details` VALUES ('64', '41', '0', '0', '474', '20.00', '1.00', '1210.00000', '1270.00', '2024-02-03 16:05:52', '2024-02-03 16:05:55');
INSERT INTO `tbl_sales_details` VALUES ('66', '42', '0', '0', '271', '100.00', '2.00', '330.17303', '650.00', '2024-02-03 16:27:21', '2024-02-03 16:27:35');
INSERT INTO `tbl_sales_details` VALUES ('67', '43', '0', '0', '95', '50.00', '1.00', '929.98063', '1050.00', '2024-02-03 16:44:09', '2024-02-03 16:44:13');
INSERT INTO `tbl_sales_details` VALUES ('68', '44', '0', '0', '474', '20.00', '1.00', '1210.00000', '1270.00', '2024-02-03 17:09:07', '2024-02-03 17:09:11');
INSERT INTO `tbl_sales_details` VALUES ('69', '45', '0', '0', '433', '0.00', '1.00', '34.84000', '36.00', '2024-02-03 17:27:36', '0000-00-00 00:00:00');
INSERT INTO `tbl_sales_details` VALUES ('70', '45', '0', '0', '428', '0.00', '1.00', '41.10000', '42.00', '2024-02-03 17:27:43', '0000-00-00 00:00:00');
INSERT INTO `tbl_sales_details` VALUES ('71', '46', '0', '0', '554', '0.00', '3.00', '51.86000', '52.00', '2024-02-03 17:30:04', '2024-02-03 17:30:21');
INSERT INTO `tbl_sales_details` VALUES ('72', '47', '0', '0', '554', '0.00', '5.00', '51.86000', '52.00', '2024-02-03 17:36:13', '2024-02-03 17:36:15');
INSERT INTO `tbl_sales_details` VALUES ('73', '48', '0', '0', '476', '0.00', '1.00', '38.40000', '40.00', '2024-02-03 17:38:53', '0000-00-00 00:00:00');
INSERT INTO `tbl_sales_details` VALUES ('74', '48', '0', '0', '429', '0.00', '1.00', '37.80000', '40.00', '2024-02-03 17:39:05', '0000-00-00 00:00:00');
INSERT INTO `tbl_sales_details` VALUES ('75', '49', '0', '0', '440', '0.00', '2.00', '38.12000', '42.00', '2024-02-03 17:40:44', '2024-02-03 17:40:46');
INSERT INTO `tbl_sales_details` VALUES ('76', '50', '0', '0', '35', '20.00', '1.00', '201.86682', '320.00', '2024-02-03 17:45:47', '2024-02-03 17:45:53');
INSERT INTO `tbl_sales_details` VALUES ('77', '51', '0', '0', '439', '0.00', '1.00', '40.90000', '44.00', '2024-02-03 17:54:34', '0000-00-00 00:00:00');
INSERT INTO `tbl_sales_details` VALUES ('78', '52', '0', '0', '439', '0.00', '1.00', '40.90000', '44.00', '2024-02-03 17:55:29', '0000-00-00 00:00:00');
INSERT INTO `tbl_sales_details` VALUES ('79', '53', '0', '0', '481', '0.00', '1.00', '50.00016', '53.00', '2024-02-03 17:58:22', '0000-00-00 00:00:00');
INSERT INTO `tbl_sales_details` VALUES ('80', '54', '0', '0', '383', '0.00', '2.00', '55.20000', '58.00', '2024-02-03 17:58:46', '2024-02-03 17:58:48');
INSERT INTO `tbl_sales_details` VALUES ('81', '55', '0', '0', '174', '0.00', '2.00', '19.00000', '35.00', '2024-02-03 18:00:45', '2024-02-03 18:00:47');
INSERT INTO `tbl_sales_details` VALUES ('82', '56', '0', '0', '429', '0.00', '1.00', '37.80000', '40.00', '2024-02-04 05:58:09', '0000-00-00 00:00:00');
INSERT INTO `tbl_sales_details` VALUES ('83', '57', '0', '0', '445', '0.00', '2.00', '32.12000', '35.00', '2024-02-04 06:02:27', '2024-02-04 06:02:28');
INSERT INTO `tbl_sales_details` VALUES ('84', '58', '0', '0', '79', '0.00', '1.00', '250.00000', '320.00', '2024-02-04 06:39:54', '0000-00-00 00:00:00');
INSERT INTO `tbl_sales_details` VALUES ('86', '59', '0', '0', '270', '0.00', '2.00', '549.85000', '500.00', '2024-02-04 06:51:06', '2024-02-04 06:51:08');
INSERT INTO `tbl_sales_details` VALUES ('87', '60', '0', '0', '383', '0.00', '2.00', '55.20000', '58.00', '2024-02-04 07:22:56', '2024-02-04 07:22:58');
INSERT INTO `tbl_sales_details` VALUES ('88', '61', '0', '0', '541', '0.00', '2.00', '48.40000', '53.00', '2024-02-04 07:51:27', '2024-02-04 07:51:30');
INSERT INTO `tbl_sales_details` VALUES ('89', '62', '0', '0', '434', '0.00', '1.00', '36.76000', '39.00', '2024-02-04 08:22:16', '0000-00-00 00:00:00');
INSERT INTO `tbl_sales_details` VALUES ('90', '63', '0', '0', '432', '0.00', '2.00', '38.40000', '40.00', '2024-02-04 09:08:32', '2024-02-04 09:08:35');
INSERT INTO `tbl_sales_details` VALUES ('92', '64', '0', '0', '11', '100.00', '1.00', '4398.80174', '4500.00', '2024-02-04 09:10:14', '2024-02-04 09:10:51');
INSERT INTO `tbl_sales_details` VALUES ('93', '64', '0', '0', '7', '200.00', '2.00', '2300.24736', '2400.00', '2024-02-04 09:11:03', '2024-02-04 09:11:11');
INSERT INTO `tbl_sales_details` VALUES ('94', '64', '0', '0', '162', '50.00', '1.00', '834.41290', '1000.00', '2024-02-04 09:11:17', '2024-02-04 09:11:21');
INSERT INTO `tbl_sales_details` VALUES ('95', '65', '0', '0', '62', '0.00', '1.00', '101.11500', '150.00', '2024-02-04 09:12:31', '0000-00-00 00:00:00');
INSERT INTO `tbl_sales_details` VALUES ('96', '66', '0', '0', '554', '0.00', '2.00', '51.86000', '52.00', '2024-02-04 09:13:01', '2024-02-04 09:13:05');
INSERT INTO `tbl_sales_details` VALUES ('97', '67', '0', '0', '541', '0.00', '2.00', '48.40000', '53.00', '2024-02-04 09:13:29', '2024-02-04 09:13:32');
INSERT INTO `tbl_sales_details` VALUES ('98', '68', '0', '0', '439', '0.00', '5.00', '40.90000', '44.00', '2024-02-04 10:08:14', '2024-02-04 10:08:16');
INSERT INTO `tbl_sales_details` VALUES ('99', '68', '0', '0', '526', '0.00', '1.00', '8.73000', '10.00', '2024-02-04 10:09:25', '0000-00-00 00:00:00');
INSERT INTO `tbl_sales_details` VALUES ('100', '69', '0', '0', '28', '120.00', '4.00', '1339.47795', '1430.00', '2024-02-04 10:52:39', '2024-02-04 10:53:06');
INSERT INTO `tbl_sales_details` VALUES ('101', '69', '0', '0', '19', '150.00', '5.00', '1257.28190', '1330.00', '2024-02-04 10:52:51', '2024-02-04 10:53:01');
INSERT INTO `tbl_sales_details` VALUES ('102', '70', '0', '0', '103', '50.00', '1.00', '953.46477', '1050.00', '2024-02-04 10:56:23', '2024-02-04 10:56:32');
INSERT INTO `tbl_sales_details` VALUES ('103', '71', '0', '0', '3', '200.00', '2.00', '2276.17111', '2400.00', '2024-02-04 11:49:11', '2024-02-04 11:49:24');
INSERT INTO `tbl_sales_details` VALUES ('104', '72', '0', '0', '147', '100.00', '2.00', '2700.00000', '2800.00', '2024-02-04 11:51:49', '2024-02-04 11:51:59');
INSERT INTO `tbl_sales_details` VALUES ('105', '73', '0', '0', '445', '0.00', '3.00', '32.12000', '35.00', '2024-02-04 11:52:57', '2024-02-04 11:52:58');
INSERT INTO `tbl_sales_details` VALUES ('107', '73', '0', '0', '428', '0.00', '0.50', '41.10000', '42.00', '2024-02-04 11:53:38', '2024-02-04 11:53:41');
INSERT INTO `tbl_sales_details` VALUES ('108', '74', '0', '0', '95', '50.00', '1.00', '929.98063', '1050.00', '2024-02-04 11:58:06', '2024-02-04 11:58:29');
INSERT INTO `tbl_sales_details` VALUES ('109', '74', '0', '0', '35', '20.00', '1.00', '201.86682', '320.00', '2024-02-04 11:58:15', '2024-02-04 11:58:35');
INSERT INTO `tbl_sales_details` VALUES ('110', '75', '0', '0', '439', '0.00', '2.00', '40.90000', '44.00', '2024-02-04 12:18:01', '2024-02-04 12:18:04');
INSERT INTO `tbl_sales_details` VALUES ('111', '76', '0', '0', '153', '0.00', '1.00', '345.05457', '430.00', '2024-02-04 12:23:39', '0000-00-00 00:00:00');
INSERT INTO `tbl_sales_details` VALUES ('112', '77', '0', '0', '35', '20.00', '1.00', '201.86682', '320.00', '2024-02-04 12:24:09', '2024-02-04 12:24:21');
INSERT INTO `tbl_sales_details` VALUES ('113', '78', '0', '0', '177', '50.00', '100.00', '11.80000', '13.00', '2024-02-04 13:19:39', '2024-02-04 13:19:48');
INSERT INTO `tbl_sales_details` VALUES ('114', '78', '0', '0', '174', '0.00', '1.00', '19.00000', '35.00', '2024-02-04 13:20:09', '0000-00-00 00:00:00');
INSERT INTO `tbl_sales_details` VALUES ('115', '79', '0', '0', '660', '0.00', '1.00', '60.00000', '70.00', '2024-02-04 14:32:33', '0000-00-00 00:00:00');
INSERT INTO `tbl_sales_details` VALUES ('116', '80', '0', '0', '35', '20.00', '1.00', '201.86682', '320.00', '2024-02-04 14:42:56', '2024-02-04 14:43:02');
INSERT INTO `tbl_sales_details` VALUES ('117', '80', '0', '0', '46', '0.00', '2.00', '69.13394', '45.00', '2024-02-04 14:43:05', '2024-02-04 14:43:07');
INSERT INTO `tbl_sales_details` VALUES ('118', '81', '0', '0', '35', '20.00', '1.00', '201.86682', '320.00', '2024-02-04 15:11:21', '2024-02-04 15:11:28');
INSERT INTO `tbl_sales_details` VALUES ('119', '82', '0', '0', '95', '50.00', '1.00', '929.98063', '1050.00', '2024-02-04 15:24:11', '2024-02-04 15:24:35');
INSERT INTO `tbl_sales_details` VALUES ('120', '82', '0', '0', '162', '50.00', '1.00', '834.41290', '1000.00', '2024-02-04 15:27:32', '2024-02-04 15:28:00');
INSERT INTO `tbl_sales_details` VALUES ('121', '82', '0', '0', '92', '30.00', '1.00', '345.63905', '1080.00', '2024-02-04 15:28:11', '2024-02-04 15:28:25');
INSERT INTO `tbl_sales_details` VALUES ('122', '82', '0', '0', '46', '0.00', '10.00', '69.13394', '45.00', '2024-02-04 15:28:51', '2024-02-04 15:29:13');
INSERT INTO `tbl_sales_details` VALUES ('123', '83', '0', '0', '429', '0.00', '2.00', '37.80000', '40.00', '2024-02-04 15:32:19', '2024-02-04 15:32:36');
INSERT INTO `tbl_sales_details` VALUES ('124', '83', '0', '0', '500', '0.00', '2.00', '28.87802', '30.00', '2024-02-04 15:32:46', '2024-02-04 15:32:51');
INSERT INTO `tbl_sales_details` VALUES ('125', '84', '0', '0', '10', '0.00', '5.00', '5373.27800', '5400.00', '2024-02-04 15:33:48', '2024-02-04 15:33:50');
INSERT INTO `tbl_sales_details` VALUES ('127', '85', '0', '0', '10', '0.00', '10.00', '5373.27800', '5400.00', '2024-02-04 15:57:23', '2024-02-04 15:57:26');
INSERT INTO `tbl_sales_details` VALUES ('128', '86', '0', '0', '432', '0.00', '2.00', '38.40000', '40.00', '2024-02-04 16:04:37', '2024-02-04 16:04:40');
INSERT INTO `tbl_sales_details` VALUES ('129', '86', '0', '0', '433', '0.00', '1.00', '34.84000', '36.00', '2024-02-04 16:04:46', '0000-00-00 00:00:00');
INSERT INTO `tbl_sales_details` VALUES ('130', '87', '0', '0', '177', '75.00', '150.00', '11.80000', '13.00', '2024-02-04 17:26:05', '2024-02-04 17:26:17');
INSERT INTO `tbl_sales_details` VALUES ('131', '88', '0', '0', '174', '0.00', '2.00', '19.00000', '35.00', '2024-02-04 17:35:35', '2024-02-04 17:35:37');
INSERT INTO `tbl_sales_details` VALUES ('132', '89', '0', '0', '439', '50.00', '25.00', '40.90000', '44.00', '2024-02-04 17:37:15', '2024-02-04 17:37:24');
INSERT INTO `tbl_sales_details` VALUES ('133', '90', '0', '0', '439', '0.00', '1.00', '40.90000', '44.00', '2024-02-04 17:39:46', '0000-00-00 00:00:00');
INSERT INTO `tbl_sales_details` VALUES ('134', '90', '0', '0', '431', '0.00', '1.00', '42.20000', '44.00', '2024-02-04 17:39:52', '0000-00-00 00:00:00');
INSERT INTO `tbl_sales_details` VALUES ('135', '91', '0', '0', '553', '240.00', '8.00', '871.20000', '930.00', '2024-02-04 17:49:58', '2024-02-04 17:51:32');
INSERT INTO `tbl_sales_details` VALUES ('136', '91', '0', '0', '644', '80.00', '2.00', '1296.42857', '1270.00', '2024-02-04 17:50:06', '2024-02-04 17:51:24');
INSERT INTO `tbl_sales_details` VALUES ('137', '92', '0', '0', '7', '0.00', '9.00', '2300.24736', '2400.00', '2024-02-04 17:52:09', '2024-02-04 17:52:12');
INSERT INTO `tbl_sales_details` VALUES ('138', '93', '0', '0', '541', '0.00', '4.00', '48.40000', '53.00', '2024-02-04 17:57:18', '2024-02-04 17:57:20');
INSERT INTO `tbl_sales_details` VALUES ('139', '94', '0', '0', '476', '0.00', '1.00', '38.40000', '40.00', '2024-02-04 17:59:11', '0000-00-00 00:00:00');
INSERT INTO `tbl_sales_details` VALUES ('140', '94', '0', '0', '430', '0.00', '0.50', '38.20000', '41.00', '2024-02-04 17:59:44', '2024-02-04 17:59:47');
INSERT INTO `tbl_sales_details` VALUES ('141', '84', '0', '0', '633', '0.00', '1.00', '1584.59000', '0.00', '2024-02-04 18:09:53', '0000-00-00 00:00:00');
INSERT INTO `tbl_sales_details` VALUES ('142', '95', '0', '0', '439', '0.00', '2.00', '40.90000', '44.00', '2024-02-04 18:12:38', '2024-02-04 18:12:40');
INSERT INTO `tbl_sales_details` VALUES ('144', '96', '0', '0', '567', '180.00', '1.00', '4974.28572', '5880.00', '2024-02-04 18:17:46', '2024-02-04 18:18:30');
INSERT INTO `tbl_sales_details` VALUES ('146', '97', '0', '0', '434', '0.00', '2.00', '36.76000', '39.00', '2024-02-05 06:08:28', '2024-02-05 06:08:30');
INSERT INTO `tbl_sales_details` VALUES ('147', '98', '0', '0', '431', '0.00', '0.50', '42.20000', '44.00', '2024-02-05 06:10:04', '2024-02-05 06:10:07');
INSERT INTO `tbl_sales_details` VALUES ('148', '99', '0', '0', '444', '0.00', '2.00', '33.86000', '36.00', '2024-02-05 06:25:27', '2024-02-05 06:25:29');
INSERT INTO `tbl_sales_details` VALUES ('149', '100', '0', '0', '554', '0.00', '5.00', '51.86000', '52.00', '2024-02-05 06:43:13', '2024-02-05 06:43:15');
INSERT INTO `tbl_sales_details` VALUES ('150', '101', '0', '0', '35', '20.00', '1.00', '201.86682', '320.00', '2024-02-05 06:50:13', '2024-02-05 06:50:17');
INSERT INTO `tbl_sales_details` VALUES ('151', '102', '0', '0', '207', '50.00', '1.00', '1150.00000', '1250.00', '2024-02-05 07:07:47', '2024-02-05 07:07:51');
INSERT INTO `tbl_sales_details` VALUES ('153', '102', '0', '0', '31', '20.00', '1.00', '154.15284', '270.00', '2024-02-05 07:09:10', '2024-02-05 07:09:15');
INSERT INTO `tbl_sales_details` VALUES ('154', '103', '0', '0', '434', '0.00', '1.00', '36.76000', '39.00', '2024-02-05 07:21:37', '0000-00-00 00:00:00');
INSERT INTO `tbl_sales_details` VALUES ('155', '104', '0', '0', '660', '0.00', '6.00', '60.00000', '70.00', '2024-02-05 07:39:50', '2024-02-05 07:40:21');
INSERT INTO `tbl_sales_details` VALUES ('156', '105', '0', '0', '19', '20.00', '1.00', '1257.28190', '1330.00', '2024-02-05 08:31:04', '2024-02-05 08:31:10');
INSERT INTO `tbl_sales_details` VALUES ('157', '105', '0', '0', '24', '20.00', '1.00', '651.01753', '730.00', '2024-02-05 08:31:14', '2024-02-05 08:31:18');
INSERT INTO `tbl_sales_details` VALUES ('158', '106', '0', '0', '7', '200.00', '4.00', '2300.09276', '2400.00', '2024-02-05 10:40:28', '2024-02-05 10:40:42');
INSERT INTO `tbl_sales_details` VALUES ('159', '107', '0', '0', '174', '0.00', '1.00', '19.00000', '35.00', '2024-02-05 11:32:52', '0000-00-00 00:00:00');
INSERT INTO `tbl_sales_details` VALUES ('160', '108', '0', '0', '35', '20.00', '1.00', '201.86682', '320.00', '2024-02-05 12:18:58', '2024-02-05 12:19:04');
INSERT INTO `tbl_sales_details` VALUES ('161', '109', '0', '0', '92', '30.00', '1.00', '345.63905', '1080.00', '2024-02-05 12:22:16', '2024-02-05 12:22:20');
INSERT INTO `tbl_sales_details` VALUES ('162', '110', '0', '0', '439', '0.00', '2.00', '40.90000', '44.00', '2024-02-05 12:29:27', '2024-02-05 12:29:29');
INSERT INTO `tbl_sales_details` VALUES ('163', '110', '0', '0', '441', '0.00', '0.50', '53.60000', '60.00', '2024-02-05 12:29:36', '2024-02-05 12:29:39');
INSERT INTO `tbl_sales_details` VALUES ('164', '111', '0', '0', '176', '0.00', '2.00', '6.26618', '10.00', '2024-02-05 12:30:30', '2024-02-05 12:30:35');
INSERT INTO `tbl_sales_details` VALUES ('165', '112', '0', '0', '35', '20.00', '1.00', '201.86682', '320.00', '2024-02-05 13:07:09', '2024-02-05 13:07:13');
INSERT INTO `tbl_sales_details` VALUES ('166', '113', '0', '0', '7', '50.00', '1.00', '2300.09276', '2400.00', '2024-02-05 14:38:10', '2024-02-05 14:38:14');
INSERT INTO `tbl_sales_details` VALUES ('168', '114', '0', '0', '18', '30.00', '1.00', '1389.06857', '1480.00', '2024-02-05 14:46:18', '2024-02-05 14:46:50');
INSERT INTO `tbl_sales_details` VALUES ('169', '114', '0', '0', '28', '30.00', '1.00', '1339.47795', '1480.00', '2024-02-05 14:46:30', '2024-02-05 14:46:37');
INSERT INTO `tbl_sales_details` VALUES ('170', '115', '0', '0', '282', '0.00', '1.00', '110.33323', '150.00', '2024-02-05 14:48:06', '0000-00-00 00:00:00');
INSERT INTO `tbl_sales_details` VALUES ('171', '115', '0', '0', '145', '0.00', '1.00', '300.00000', '450.00', '2024-02-05 14:48:12', '0000-00-00 00:00:00');
INSERT INTO `tbl_sales_details` VALUES ('172', '116', '0', '0', '475', '10.00', '1.00', '871.20000', '930.00', '2024-02-05 14:51:13', '2024-02-05 14:51:16');
INSERT INTO `tbl_sales_details` VALUES ('173', '117', '0', '0', '13', '20.00', '1.00', '5414.34133', '5600.00', '2024-02-05 15:51:53', '2024-02-05 15:59:52');
INSERT INTO `tbl_sales_details` VALUES ('174', '118', '0', '0', '103', '50.00', '1.00', '953.46477', '1050.00', '2024-02-05 15:59:39', '2024-02-05 16:00:18');
INSERT INTO `tbl_sales_details` VALUES ('175', '118', '0', '0', '35', '20.00', '1.00', '201.86682', '320.00', '2024-02-05 15:59:48', '2024-02-05 16:00:07');
INSERT INTO `tbl_sales_details` VALUES ('177', '119', '0', '0', '430', '0.00', '1.00', '38.20000', '41.00', '2024-02-05 16:04:21', '0000-00-00 00:00:00');
INSERT INTO `tbl_sales_details` VALUES ('179', '120', '0', '0', '251', '0.00', '1.00', '243.00308', '300.00', '2024-02-05 16:19:14', '0000-00-00 00:00:00');
INSERT INTO `tbl_sales_details` VALUES ('180', '121', '0', '0', '71', '80.00', '2.00', '1124.38661', '1300.00', '2024-02-05 16:35:19', '2024-02-06 11:37:06');
INSERT INTO `tbl_sales_details` VALUES ('181', '121', '0', '0', '30', '0.00', '1.00', '375.00000', '650.00', '2024-02-05 16:35:41', '0000-00-00 00:00:00');
INSERT INTO `tbl_sales_details` VALUES ('182', '122', '0', '0', '118', '50.00', '1.00', '0.04044', '1100.00', '2024-02-05 16:38:04', '2024-02-05 16:38:08');
INSERT INTO `tbl_sales_details` VALUES ('183', '122', '0', '0', '46', '0.00', '2.00', '69.13394', '45.00', '2024-02-05 16:38:51', '2024-02-05 16:38:53');
INSERT INTO `tbl_sales_details` VALUES ('184', '123', '0', '0', '541', '0.00', '3.00', '48.40000', '53.00', '2024-02-05 17:08:30', '2024-02-05 17:08:33');
INSERT INTO `tbl_sales_details` VALUES ('186', '124', '0', '0', '360', '1000.00', '10.00', '5100.15541', '5300.00', '2024-02-05 17:19:32', '2024-02-05 17:19:55');
INSERT INTO `tbl_sales_details` VALUES ('187', '125', '0', '0', '144', '100.00', '2.00', '1299.99382', '1450.00', '2024-02-05 17:22:56', '2024-02-05 17:23:03');
INSERT INTO `tbl_sales_details` VALUES ('188', '126', '0', '0', '383', '0.00', '2.00', '55.20000', '58.00', '2024-02-05 17:29:04', '2024-02-05 17:29:06');
INSERT INTO `tbl_sales_details` VALUES ('189', '127', '0', '0', '35', '20.00', '1.00', '201.86682', '320.00', '2024-02-05 17:36:42', '2024-02-05 17:36:46');
INSERT INTO `tbl_sales_details` VALUES ('190', '128', '0', '0', '407', '0.00', '2.00', '1910.00000', '1980.00', '2024-02-05 17:47:52', '2024-02-05 17:48:30');
INSERT INTO `tbl_sales_details` VALUES ('191', '129', '0', '0', '441', '0.00', '1.00', '53.60000', '60.00', '2024-02-06 07:04:55', '0000-00-00 00:00:00');
INSERT INTO `tbl_sales_details` VALUES ('192', '130', '0', '0', '439', '0.00', '1.00', '40.90000', '44.00', '2024-02-06 07:10:49', '0000-00-00 00:00:00');
INSERT INTO `tbl_sales_details` VALUES ('193', '131', '0', '0', '147', '150.00', '3.00', '2700.00000', '2800.00', '2024-02-06 07:22:35', '2024-02-06 07:23:10');
INSERT INTO `tbl_sales_details` VALUES ('194', '132', '0', '0', '483', '0.00', '1.00', '73.00000', '85.00', '2024-02-06 08:02:01', '0000-00-00 00:00:00');
INSERT INTO `tbl_sales_details` VALUES ('195', '132', '0', '0', '526', '0.00', '2.00', '8.73000', '10.00', '2024-02-06 08:02:17', '2024-02-06 08:02:18');
INSERT INTO `tbl_sales_details` VALUES ('198', '121', '0', '0', '25', '80.00', '4.00', '660.00000', '700.00', '2024-02-06 11:34:40', '2024-02-06 11:36:41');
INSERT INTO `tbl_sales_details` VALUES ('199', '121', '0', '0', '29', '0.00', '2.00', '1366.72864', '1450.00', '2024-02-06 11:34:49', '2024-02-06 11:34:53');
INSERT INTO `tbl_sales_details` VALUES ('200', '134', '0', '0', '29', '30.00', '5.00', '1366.72864', '1450.00', '2024-02-06 11:38:46', '2024-02-06 11:43:10');
INSERT INTO `tbl_sales_details` VALUES ('201', '134', '0', '0', '25', '80.00', '8.00', '660.00000', '700.00', '2024-02-06 11:38:55', '2024-02-06 11:41:14');
INSERT INTO `tbl_sales_details` VALUES ('202', '135', '0', '0', '29', '30.00', '2.00', '1366.72864', '1450.00', '2024-02-06 11:44:01', '2024-02-06 12:12:39');
INSERT INTO `tbl_sales_details` VALUES ('203', '135', '0', '0', '25', '50.00', '5.00', '660.00000', '700.00', '2024-02-06 11:44:22', '2024-02-06 12:11:18');
INSERT INTO `tbl_sales_details` VALUES ('205', '136', '0', '0', '575', '1200.00', '3.00', '5200.00000', '5800.00', '2024-02-06 12:08:36', '2024-02-06 12:09:06');
INSERT INTO `tbl_sales_details` VALUES ('206', '137', '0', '0', '19', '450.00', '9.00', '1257.28190', '1330.00', '2024-02-06 12:27:43', '2024-02-06 12:28:44');
INSERT INTO `tbl_sales_details` VALUES ('207', '137', '0', '0', '28', '400.00', '4.00', '1339.47795', '1480.00', '2024-02-06 12:27:55', '2024-02-06 12:28:27');
INSERT INTO `tbl_sales_details` VALUES ('208', '137', '0', '0', '24', '120.00', '4.00', '651.01753', '730.00', '2024-02-06 12:28:03', '2024-02-06 12:28:14');
INSERT INTO `tbl_sales_details` VALUES ('209', '138', '0', '0', '177', '0.00', '2.00', '11.80000', '13.00', '2024-02-06 12:30:50', '2024-02-06 12:30:53');
INSERT INTO `tbl_sales_details` VALUES ('210', '139', '0', '0', '144', '50.00', '1.00', '1299.99382', '1450.00', '2024-02-06 12:37:32', '2024-02-06 12:37:52');
INSERT INTO `tbl_sales_details` VALUES ('211', '140', '0', '0', '433', '0.00', '1.00', '34.84000', '36.00', '2024-02-06 13:24:47', '0000-00-00 00:00:00');
INSERT INTO `tbl_sales_details` VALUES ('212', '140', '0', '0', '432', '0.00', '1.00', '38.40000', '40.00', '2024-02-06 13:25:21', '0000-00-00 00:00:00');
INSERT INTO `tbl_sales_details` VALUES ('213', '141', '0', '0', '61', '100.00', '2.00', '1032.85714', '1150.00', '2024-02-06 13:40:17', '2024-02-06 13:42:11');
INSERT INTO `tbl_sales_details` VALUES ('214', '141', '0', '0', '19', '120.00', '4.00', '1257.28190', '1330.00', '2024-02-06 13:42:35', '2024-02-06 13:43:24');
INSERT INTO `tbl_sales_details` VALUES ('215', '141', '0', '0', '162', '50.00', '1.00', '834.41290', '1000.00', '2024-02-06 13:43:51', '2024-02-06 13:44:20');
INSERT INTO `tbl_sales_details` VALUES ('216', '142', '0', '0', '143', '0.00', '1.00', '186.66667', '250.00', '2024-02-06 15:02:21', '0000-00-00 00:00:00');
INSERT INTO `tbl_sales_details` VALUES ('218', '143', '0', '0', '65', '150.00', '5.00', '360.00000', '400.00', '2024-02-06 15:27:55', '2024-02-06 15:28:49');
INSERT INTO `tbl_sales_details` VALUES ('219', '143', '0', '0', '30', '100.00', '2.00', '375.00000', '650.00', '2024-02-06 15:29:15', '2024-02-06 15:34:56');
INSERT INTO `tbl_sales_details` VALUES ('220', '143', '0', '0', '644', '40.00', '2.00', '1296.42857', '1270.00', '2024-02-06 15:35:38', '2024-02-06 15:36:14');
INSERT INTO `tbl_sales_details` VALUES ('221', '144', '0', '0', '156', '200.00', '2.00', '1297.76599', '1400.00', '2024-02-06 15:37:35', '2024-02-06 15:38:13');
INSERT INTO `tbl_sales_details` VALUES ('222', '145', '0', '0', '394', '31.00', '1.00', '1605.83333', '1676.00', '2024-02-06 15:43:52', '2024-02-06 15:44:23');
INSERT INTO `tbl_sales_details` VALUES ('223', '146', '0', '0', '554', '0.00', '2.00', '51.86000', '52.00', '2024-02-06 15:49:13', '2024-02-06 15:49:41');
INSERT INTO `tbl_sales_details` VALUES ('225', '147', '0', '0', '434', '0.00', '1.28', '36.76000', '39.00', '2024-02-06 15:53:10', '2024-02-06 15:53:45');
INSERT INTO `tbl_sales_details` VALUES ('226', '148', '0', '0', '554', '0.00', '4.00', '51.86000', '52.00', '2024-02-06 15:58:01', '2024-02-06 15:58:03');
INSERT INTO `tbl_sales_details` VALUES ('228', '149', '0', '0', '541', '0.00', '5.00', '48.40000', '53.00', '2024-02-06 16:36:45', '2024-02-06 16:37:21');
INSERT INTO `tbl_sales_details` VALUES ('229', '150', '0', '0', '439', '0.00', '6.00', '40.90000', '44.00', '2024-02-06 16:41:53', '2024-02-06 16:41:55');
INSERT INTO `tbl_sales_details` VALUES ('230', '150', '0', '0', '654', '0.00', '1.00', '60.00000', '85.00', '2024-02-06 16:42:12', '0000-00-00 00:00:00');
INSERT INTO `tbl_sales_details` VALUES ('231', '151', '0', '0', '444', '0.00', '1.00', '33.86000', '36.00', '2024-02-06 17:54:18', '0000-00-00 00:00:00');
INSERT INTO `tbl_sales_details` VALUES ('232', '151', '0', '0', '481', '0.00', '1.00', '50.00016', '53.00', '2024-02-06 17:54:23', '0000-00-00 00:00:00');
INSERT INTO `tbl_sales_details` VALUES ('234', '151', '0', '0', '429', '0.00', '4.00', '37.80000', '40.00', '2024-02-06 17:54:57', '2024-02-06 17:55:02');
INSERT INTO `tbl_sales_details` VALUES ('236', '152', '0', '0', '541', '0.00', '5.00', '48.40000', '53.00', '2024-02-06 17:56:11', '2024-02-06 17:56:15');

CREATE TABLE `tbl_sales_return` (
  `sales_return_id` int(11) NOT NULL AUTO_INCREMENT,
  `sales_id` int(11) NOT NULL,
  `sales_reference_number` varchar(30) NOT NULL DEFAULT '',
  `reference_number` varchar(30) NOT NULL DEFAULT '',
  `return_date` date NOT NULL,
  `status` varchar(1) NOT NULL DEFAULT 'S',
  `encoded_by` int(11) NOT NULL,
  `remarks` varchar(255) NOT NULL DEFAULT '',
  `date_added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_last_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `sales_summary_id` int(11) NOT NULL,
  PRIMARY KEY (`sales_return_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
INSERT INTO `tbl_sales_return` VALUES ('1', '4', '', 'SLS-RET-20240203072722', '2024-02-03', 'F', '7', 'encoded via pos', '2024-02-03 07:27:22', '2024-02-03 18:19:02', '1');
INSERT INTO `tbl_sales_return` VALUES ('2', '9', '', 'SLS-RET-20240203075548', '2024-02-03', 'F', '7', 'encoded via pos', '2024-02-03 07:55:48', '2024-02-03 18:19:02', '1');
INSERT INTO `tbl_sales_return` VALUES ('3', '8', '', 'SLS-RET-20240203075553', '2024-02-03', 'F', '7', 'encoded via pos', '2024-02-03 07:55:53', '2024-02-03 18:19:02', '1');

CREATE TABLE `tbl_sales_return_details` (
  `return_detail_id` int(11) NOT NULL AUTO_INCREMENT,
  `sales_return_id` int(11) NOT NULL,
  `sales_detail_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `discount` decimal(12,2) NOT NULL,
  `quantity` decimal(12,2) NOT NULL,
  `quantity_return` decimal(12,2) NOT NULL,
  `price` decimal(12,2) NOT NULL,
  `cost` decimal(12,5) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`return_detail_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;
INSERT INTO `tbl_sales_return_details` VALUES ('1', '1', '5', '143', '40.00', '4.00', '4.00', '250.00', '186.66667', '2024-02-03 07:27:22');
INSERT INTO `tbl_sales_return_details` VALUES ('2', '1', '6', '13', '100.00', '1.00', '1.00', '5600.00', '5425.37313', '2024-02-03 07:27:22');
INSERT INTO `tbl_sales_return_details` VALUES ('4', '2', '14', '13', '100.00', '1.00', '1.00', '5600.00', '5425.37313', '2024-02-03 07:55:48');
INSERT INTO `tbl_sales_return_details` VALUES ('5', '2', '15', '143', '40.00', '4.00', '4.00', '250.00', '186.66667', '2024-02-03 07:55:48');
INSERT INTO `tbl_sales_return_details` VALUES ('7', '3', '12', '13', '100.00', '1.00', '1.00', '5600.00', '5425.37313', '2024-02-03 07:55:53');
INSERT INTO `tbl_sales_return_details` VALUES ('8', '3', '13', '143', '40.00', '4.00', '4.00', '250.00', '186.66667', '2024-02-03 07:55:53');

CREATE TABLE `tbl_sales_summary` (
  `sales_summary_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `cashier_id` int(11) NOT NULL,
  `starting_balance` decimal(11,2) NOT NULL,
  `total_sales_amount` decimal(11,2) NOT NULL,
  `total_amount_collected` decimal(11,2) NOT NULL,
  `total_deficit` decimal(9,2) DEFAULT NULL,
  `encoded_by` int(11) NOT NULL,
  `status` varchar(1) NOT NULL DEFAULT '',
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`sales_summary_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
INSERT INTO `tbl_sales_summary` VALUES ('1', '7', '1.00', '58240.00', '58241.00', '0.00', '7', 'F', '2024-02-01 10:34:15');
INSERT INTO `tbl_sales_summary` VALUES ('2', '7', '1.00', '79649.50', '79650.50', '0.00', '7', 'F', '2024-02-04 05:56:57');
INSERT INTO `tbl_sales_summary` VALUES ('3', '7', '0.00', '86390.00', '86390.00', '0.00', '7', 'F', '2024-02-05 06:02:57');
INSERT INTO `tbl_sales_summary` VALUES ('4', '7', '0.00', '0.00', '0.00', '0.00', '0', 'S', '2024-02-06 06:00:37');

CREATE TABLE `tbl_settings` (
  `settings_id` int(11) NOT NULL AUTO_INCREMENT,
  `module_discount` varchar(32) NOT NULL,
  `module_cancel` varchar(32) NOT NULL,
  `module_delete` varchar(32) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_last_modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `module_add_customer` varchar(32) NOT NULL,
  `module_change_payment_type` varchar(32) NOT NULL,
  `module_remove_online_payment` varchar(32) NOT NULL,
  `company_name` varchar(50) NOT NULL,
  `company_address` varchar(100) NOT NULL,
  `print_header` text NOT NULL,
  `print_footer` text NOT NULL,
  `duplicate_order_slip` int(1) NOT NULL DEFAULT '0',
  `duplicate_withdrawal_slip` int(1) NOT NULL DEFAULT '0',
  `duplicate_claim_slip` int(1) NOT NULL DEFAULT '0',
  `duplicate_payment_slip` int(1) NOT NULL DEFAULT '0',
  `rewards_point_factor` decimal(12,2) NOT NULL DEFAULT '0.00',
  `has_warehouse_checker` int(1) NOT NULL,
  PRIMARY KEY (`settings_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
INSERT INTO `tbl_settings` VALUES ('1', 'q', '0615', '0615', '2022-10-21 11:14:31', '2024-02-01 13:40:47', '1', '1', '0615', 'QL POULTRY AND AGRICULTURAL SUPPLY', 'Poblacion 1, Banisilan Cotabato', '', 'This is for Inventory purposes only', '0', '0', '1', '1', '5000.00', '1');

CREATE TABLE `tbl_stock_withdrawal` (
  `withdrawal_id` int(11) NOT NULL AUTO_INCREMENT,
  `reference_number` varchar(50) NOT NULL,
  `sales_id` int(11) NOT NULL DEFAULT '0',
  `status` varchar(1) NOT NULL DEFAULT 'S',
  `remarks` varchar(250) NOT NULL,
  `withdrawal_date` date NOT NULL,
  `encoded_by` int(11) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_last_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`withdrawal_id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=latin1;
INSERT INTO `tbl_stock_withdrawal` VALUES ('1', '000000', '4', 'F', '', '2024-02-03', '7', '2024-02-03 07:18:36', '2024-02-03 07:18:36');
INSERT INTO `tbl_stock_withdrawal` VALUES ('2', '000002', '4', 'F', '', '2024-02-03', '7', '2024-02-03 07:18:40', '2024-02-03 07:18:40');
INSERT INTO `tbl_stock_withdrawal` VALUES ('3', '000003', '30', 'F', '', '2024-02-03', '7', '2024-02-03 12:18:32', '2024-02-03 12:18:32');
INSERT INTO `tbl_stock_withdrawal` VALUES ('4', '000004', '30', 'F', '', '2024-02-03', '7', '2024-02-03 12:19:07', '2024-02-03 12:19:07');
INSERT INTO `tbl_stock_withdrawal` VALUES ('5', '000005', '32', 'F', '', '2024-02-03', '7', '2024-02-03 13:08:34', '2024-02-03 13:08:34');
INSERT INTO `tbl_stock_withdrawal` VALUES ('6', '000006', '32', 'F', '', '2024-02-03', '7', '2024-02-03 13:08:39', '2024-02-03 13:08:39');
INSERT INTO `tbl_stock_withdrawal` VALUES ('7', '000007', '34', 'F', '', '2024-02-03', '7', '2024-02-03 14:25:36', '2024-02-03 14:25:36');
INSERT INTO `tbl_stock_withdrawal` VALUES ('8', '000008', '34', 'F', '', '2024-02-03', '7', '2024-02-03 14:25:42', '2024-02-03 14:25:42');
INSERT INTO `tbl_stock_withdrawal` VALUES ('12', '000009', '35', 'F', '', '2024-02-03', '7', '2024-02-03 14:38:04', '2024-02-03 14:38:04');
INSERT INTO `tbl_stock_withdrawal` VALUES ('13', '000013', '39', 'F', '', '2024-02-03', '7', '2024-02-03 14:58:32', '2024-02-03 14:58:32');
INSERT INTO `tbl_stock_withdrawal` VALUES ('14', '000014', '64', 'F', '', '2024-02-04', '7', '2024-02-04 09:12:44', '2024-02-04 09:12:44');
INSERT INTO `tbl_stock_withdrawal` VALUES ('15', '000015', '69', 'F', '', '2024-02-04', '7', '2024-02-04 10:55:12', '2024-02-04 10:55:12');
INSERT INTO `tbl_stock_withdrawal` VALUES ('16', '000016', '71', 'F', '', '2024-02-04', '7', '2024-02-04 11:51:32', '2024-02-04 11:51:32');
INSERT INTO `tbl_stock_withdrawal` VALUES ('17', '000017', '84', 'F', '', '2024-02-04', '7', '2024-02-04 18:10:28', '2024-02-04 18:10:28');
INSERT INTO `tbl_stock_withdrawal` VALUES ('18', '000018', '92', 'F', '', '2024-02-04', '7', '2024-02-04 18:14:33', '2024-02-04 18:14:33');
INSERT INTO `tbl_stock_withdrawal` VALUES ('19', '000019', '105', 'F', '', '2024-02-05', '7', '2024-02-05 08:32:31', '2024-02-05 08:32:31');
INSERT INTO `tbl_stock_withdrawal` VALUES ('20', '000020', '85', 'F', '', '2024-02-05', '7', '2024-02-05 09:18:11', '2024-02-05 09:18:11');
INSERT INTO `tbl_stock_withdrawal` VALUES ('21', '000021', '106', 'F', '', '2024-02-05', '7', '2024-02-05 10:43:03', '2024-02-05 10:43:03');
INSERT INTO `tbl_stock_withdrawal` VALUES ('25', '000022', '84', 'F', '', '2024-02-05', '7', '2024-02-05 14:15:21', '2024-02-05 14:15:21');
INSERT INTO `tbl_stock_withdrawal` VALUES ('27', '000026', '64', 'F', '', '2024-02-05', '7', '2024-02-05 14:16:58', '2024-02-05 14:16:58');
INSERT INTO `tbl_stock_withdrawal` VALUES ('37', '000028', '113', 'F', '', '2024-02-05', '7', '2024-02-05 14:39:55', '2024-02-05 14:39:55');
INSERT INTO `tbl_stock_withdrawal` VALUES ('39', '000038', '114', 'F', '', '2024-02-05', '7', '2024-02-05 14:47:44', '2024-02-05 14:47:44');
INSERT INTO `tbl_stock_withdrawal` VALUES ('41', '000040', '117', 'F', '', '2024-02-05', '7', '2024-02-05 15:54:30', '2024-02-05 15:54:30');
INSERT INTO `tbl_stock_withdrawal` VALUES ('44', '000042', '124', 'F', '', '2024-02-05', '7', '2024-02-05 17:22:45', '2024-02-05 17:22:45');
INSERT INTO `tbl_stock_withdrawal` VALUES ('46', '000045', '121', 'F', '', '2024-02-06', '7', '2024-02-06 11:38:28', '2024-02-06 11:38:28');
INSERT INTO `tbl_stock_withdrawal` VALUES ('47', '000047', '121', 'F', '', '2024-02-06', '7', '2024-02-06 11:38:34', '2024-02-06 11:38:34');
INSERT INTO `tbl_stock_withdrawal` VALUES ('48', '000048', '134', 'F', '', '2024-02-06', '7', '2024-02-06 11:43:51', '2024-02-06 11:43:51');
INSERT INTO `tbl_stock_withdrawal` VALUES ('49', '000049', '136', 'F', '', '2024-02-06', '7', '2024-02-06 12:09:29', '2024-02-06 12:09:29');
INSERT INTO `tbl_stock_withdrawal` VALUES ('50', '000050', '135', 'F', '', '2024-02-06', '7', '2024-02-06 12:12:57', '2024-02-06 12:12:57');
INSERT INTO `tbl_stock_withdrawal` VALUES ('51', '000051', '141', 'F', '', '2024-02-06', '7', '2024-02-06 13:49:22', '2024-02-06 13:49:22');
INSERT INTO `tbl_stock_withdrawal` VALUES ('52', '000052', '141', 'F', '', '2024-02-06', '7', '2024-02-06 13:51:07', '2024-02-06 13:51:07');

CREATE TABLE `tbl_stock_withdrawal_details` (
  `sw_detail_id` int(11) NOT NULL AUTO_INCREMENT,
  `withdrawal_id` int(11) NOT NULL DEFAULT '0',
  `sales_detail_id` int(11) NOT NULL DEFAULT '0',
  `product_id` int(11) DEFAULT NULL,
  `qty` decimal(8,2) NOT NULL DEFAULT '0.00',
  `status` varchar(1) NOT NULL DEFAULT 'S',
  PRIMARY KEY (`sw_detail_id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=latin1;
INSERT INTO `tbl_stock_withdrawal_details` VALUES ('1', '1', '6', '13', '1.00', 'F');
INSERT INTO `tbl_stock_withdrawal_details` VALUES ('2', '1', '5', '143', '0.00', 'F');
INSERT INTO `tbl_stock_withdrawal_details` VALUES ('3', '2', '6', '13', '0.00', 'F');
INSERT INTO `tbl_stock_withdrawal_details` VALUES ('4', '2', '5', '143', '4.00', 'F');
INSERT INTO `tbl_stock_withdrawal_details` VALUES ('5', '3', '47', '39', '0.00', 'F');
INSERT INTO `tbl_stock_withdrawal_details` VALUES ('6', '3', '46', '10', '2.00', 'F');
INSERT INTO `tbl_stock_withdrawal_details` VALUES ('7', '4', '47', '39', '1.00', 'F');
INSERT INTO `tbl_stock_withdrawal_details` VALUES ('8', '4', '46', '10', '0.00', 'F');
INSERT INTO `tbl_stock_withdrawal_details` VALUES ('9', '5', '50', '30', '0.00', 'F');
INSERT INTO `tbl_stock_withdrawal_details` VALUES ('10', '5', '49', '14', '2.00', 'F');
INSERT INTO `tbl_stock_withdrawal_details` VALUES ('11', '6', '50', '30', '1.00', 'F');
INSERT INTO `tbl_stock_withdrawal_details` VALUES ('12', '6', '49', '14', '0.00', 'F');
INSERT INTO `tbl_stock_withdrawal_details` VALUES ('13', '7', '56', '71', '0.00', 'F');
INSERT INTO `tbl_stock_withdrawal_details` VALUES ('14', '7', '55', '46', '0.00', 'F');
INSERT INTO `tbl_stock_withdrawal_details` VALUES ('15', '7', '54', '144', '0.00', 'F');
INSERT INTO `tbl_stock_withdrawal_details` VALUES ('16', '7', '53', '14', '2.00', 'F');
INSERT INTO `tbl_stock_withdrawal_details` VALUES ('17', '8', '56', '71', '1.00', 'F');
INSERT INTO `tbl_stock_withdrawal_details` VALUES ('18', '8', '55', '46', '10.00', 'F');
INSERT INTO `tbl_stock_withdrawal_details` VALUES ('19', '8', '54', '144', '1.00', 'F');
INSERT INTO `tbl_stock_withdrawal_details` VALUES ('20', '8', '53', '14', '0.00', 'F');
INSERT INTO `tbl_stock_withdrawal_details` VALUES ('21', '12', '57', '10', '2.00', 'F');
INSERT INTO `tbl_stock_withdrawal_details` VALUES ('22', '13', '62', '28', '1.00', 'F');
INSERT INTO `tbl_stock_withdrawal_details` VALUES ('23', '13', '61', '19', '1.00', 'F');
INSERT INTO `tbl_stock_withdrawal_details` VALUES ('24', '14', '94', '162', '0.00', 'F');
INSERT INTO `tbl_stock_withdrawal_details` VALUES ('25', '14', '93', '7', '2.00', 'F');
INSERT INTO `tbl_stock_withdrawal_details` VALUES ('26', '14', '92', '11', '1.00', 'F');
INSERT INTO `tbl_stock_withdrawal_details` VALUES ('27', '15', '101', '19', '5.00', 'F');
INSERT INTO `tbl_stock_withdrawal_details` VALUES ('28', '15', '100', '28', '4.00', 'F');
INSERT INTO `tbl_stock_withdrawal_details` VALUES ('29', '16', '103', '3', '2.00', 'F');
INSERT INTO `tbl_stock_withdrawal_details` VALUES ('30', '17', '141', '633', '0.00', 'F');
INSERT INTO `tbl_stock_withdrawal_details` VALUES ('31', '17', '125', '10', '5.00', 'F');
INSERT INTO `tbl_stock_withdrawal_details` VALUES ('32', '18', '137', '7', '9.00', 'F');
INSERT INTO `tbl_stock_withdrawal_details` VALUES ('33', '19', '157', '24', '1.00', 'F');
INSERT INTO `tbl_stock_withdrawal_details` VALUES ('34', '19', '156', '19', '1.00', 'F');
INSERT INTO `tbl_stock_withdrawal_details` VALUES ('35', '20', '127', '10', '10.00', 'F');
INSERT INTO `tbl_stock_withdrawal_details` VALUES ('36', '21', '158', '7', '4.00', 'F');
INSERT INTO `tbl_stock_withdrawal_details` VALUES ('37', '25', '141', '633', '1.00', 'F');
INSERT INTO `tbl_stock_withdrawal_details` VALUES ('38', '27', '94', '162', '1.00', 'F');
INSERT INTO `tbl_stock_withdrawal_details` VALUES ('39', '37', '166', '7', '1.00', 'F');
INSERT INTO `tbl_stock_withdrawal_details` VALUES ('40', '39', '169', '28', '1.00', 'F');
INSERT INTO `tbl_stock_withdrawal_details` VALUES ('41', '39', '168', '18', '1.00', 'F');
INSERT INTO `tbl_stock_withdrawal_details` VALUES ('42', '41', '173', '13', '1.00', 'F');
INSERT INTO `tbl_stock_withdrawal_details` VALUES ('43', '44', '186', '360', '10.00', 'F');
INSERT INTO `tbl_stock_withdrawal_details` VALUES ('44', '46', '199', '29', '2.00', 'F');
INSERT INTO `tbl_stock_withdrawal_details` VALUES ('45', '46', '198', '25', '4.00', 'F');
INSERT INTO `tbl_stock_withdrawal_details` VALUES ('46', '46', '181', '30', '0.00', 'F');
INSERT INTO `tbl_stock_withdrawal_details` VALUES ('47', '46', '180', '71', '0.00', 'F');
INSERT INTO `tbl_stock_withdrawal_details` VALUES ('48', '47', '199', '29', '0.00', 'F');
INSERT INTO `tbl_stock_withdrawal_details` VALUES ('49', '47', '198', '25', '0.00', 'F');
INSERT INTO `tbl_stock_withdrawal_details` VALUES ('50', '47', '181', '30', '1.00', 'F');
INSERT INTO `tbl_stock_withdrawal_details` VALUES ('51', '47', '180', '71', '2.00', 'F');
INSERT INTO `tbl_stock_withdrawal_details` VALUES ('52', '48', '201', '25', '8.00', 'F');
INSERT INTO `tbl_stock_withdrawal_details` VALUES ('53', '48', '200', '29', '5.00', 'F');
INSERT INTO `tbl_stock_withdrawal_details` VALUES ('54', '49', '205', '575', '3.00', 'F');
INSERT INTO `tbl_stock_withdrawal_details` VALUES ('55', '50', '203', '25', '5.00', 'F');
INSERT INTO `tbl_stock_withdrawal_details` VALUES ('56', '50', '202', '29', '2.00', 'F');
INSERT INTO `tbl_stock_withdrawal_details` VALUES ('57', '51', '215', '162', '0.00', 'F');
INSERT INTO `tbl_stock_withdrawal_details` VALUES ('58', '51', '214', '19', '4.00', 'F');
INSERT INTO `tbl_stock_withdrawal_details` VALUES ('59', '51', '213', '61', '0.00', 'F');
INSERT INTO `tbl_stock_withdrawal_details` VALUES ('60', '52', '215', '162', '1.00', 'F');
INSERT INTO `tbl_stock_withdrawal_details` VALUES ('61', '52', '214', '19', '0.00', 'F');
INSERT INTO `tbl_stock_withdrawal_details` VALUES ('62', '52', '213', '61', '2.00', 'F');

CREATE TABLE `tbl_supplier_payment` (
  `sp_id` int(11) NOT NULL AUTO_INCREMENT,
  `reference_number` varchar(50) NOT NULL,
  `payment_type` varchar(1) NOT NULL COMMENT 'C = Cash; H = Check',
  `bank_id` int(11) NOT NULL,
  `check_number` varchar(30) NOT NULL,
  `check_date` date NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `payment_date` date NOT NULL,
  `remarks` varchar(255) NOT NULL,
  `status` varchar(1) NOT NULL,
  `encoded_by` int(11) NOT NULL,
  `due_status` int(1) NOT NULL DEFAULT '0' COMMENT '0 = Pending; 1 = cleared',
  `date_added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_last_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`sp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=295 DEFAULT CHARSET=latin1;
INSERT INTO `tbl_supplier_payment` VALUES ('1', 'SP-20221117041129', 'H', '2', '900138', '2023-01-17', '2', '2022-11-17', 'payment for B108 with promo', 'F', '1', '0', '2022-11-17 12:10:29', '2022-11-17 12:10:29');
INSERT INTO `tbl_supplier_payment` VALUES ('2', 'SP-20221117094930', 'H', '1', '344394', '2022-12-17', '1', '2022-11-17', 'payment for chemicals', 'F', '1', '1', '2022-11-17 16:50:02', '2022-11-17 16:50:02');
INSERT INTO `tbl_supplier_payment` VALUES ('3', 'SP-20221117100325', 'H', '1', '344393', '2023-01-17', '1', '2022-11-17', 'Seeds', 'F', '1', '0', '2022-11-17 17:04:02', '2022-11-17 17:04:02');
INSERT INTO `tbl_supplier_payment` VALUES ('4', 'SP-20221118031202', 'H', '1', '344397', '2022-11-26', '1', '2022-11-18', '21-0-0 atlas = 120 bags ', 'F', '1', '1', '2022-11-18 10:12:59', '2022-11-18 10:12:59');
INSERT INTO `tbl_supplier_payment` VALUES ('5', 'SP-20221119070737', 'H', '1', '344398', '2022-12-04', '4', '2022-11-19', 'FERTILIZER', 'F', '1', '1', '2022-11-19 14:08:12', '2022-11-19 14:08:12');
INSERT INTO `tbl_supplier_payment` VALUES ('6', 'SP-20221119071008', 'H', '4', '377535412', '2023-01-20', '4', '2022-11-19', 'SEEDS', 'F', '1', '0', '2022-11-19 14:10:35', '2022-11-19 14:10:35');
INSERT INTO `tbl_supplier_payment` VALUES ('7', 'SP-20221121055243', 'H', '1', '344389', '2022-11-21', '2', '2022-11-21', 'suprema # 124570', 'F', '1', '1', '2022-11-21 12:53:29', '2022-11-21 12:53:29');
INSERT INTO `tbl_supplier_payment` VALUES ('8', 'SP-20221121055557', 'H', '1', '344390', '2023-01-21', '2', '2022-11-21', 'seeds= 108', 'F', '1', '0', '2022-11-21 12:56:45', '2022-11-21 12:56:45');
INSERT INTO `tbl_supplier_payment` VALUES ('9', 'SP-20221121061313', 'H', '1', '344388', '2022-12-21', '2', '2022-11-21', 'checmicals', 'F', '1', '1', '2022-11-21 13:14:28', '2022-11-21 13:14:28');
INSERT INTO `tbl_supplier_payment` VALUES ('10', 'SP-20221121062023', 'H', '3', '1000178158', '2022-12-21', '1', '2022-11-21', 'chemicals', 'F', '1', '0', '2022-11-21 13:21:02', '2022-11-21 13:21:02');
INSERT INTO `tbl_supplier_payment` VALUES ('11', 'SP-20221121062421', 'H', '1', '344395', '2022-11-26', '1', '2022-11-21', 'Fertilizer', 'F', '1', '1', '2022-11-21 13:24:46', '2022-11-21 13:24:46');
INSERT INTO `tbl_supplier_payment` VALUES ('12', 'SP-20221124231019', 'H', '3', '1000178162', '2023-01-21', '1', '2022-11-21', 'Seeds', 'F', '1', '0', '2022-11-25 06:11:00', '2022-11-25 06:11:00');
INSERT INTO `tbl_supplier_payment` VALUES ('13', 'SP-20221124231527', 'H', '3', '1000178160', '2023-01-24', '19', '2022-11-24', 'Chemicals', 'F', '1', '0', '2022-11-25 06:16:11', '2022-11-25 06:16:11');
INSERT INTO `tbl_supplier_payment` VALUES ('14', 'SP-20221124234313', 'H', '1', '344301', '2023-01-25', '1', '2022-11-25', 'seeds', 'F', '1', '0', '2022-11-25 06:44:07', '2022-11-25 06:44:07');
INSERT INTO `tbl_supplier_payment` VALUES ('15', 'SP-20221125064434', 'H', '1', '344306', '2022-11-25', '1', '2022-11-25', '', 'F', '1', '1', '2022-11-25 13:45:35', '2022-11-25 13:45:35');
INSERT INTO `tbl_supplier_payment` VALUES ('16', 'SP-20221125064742', 'H', '1', '344302', '2022-11-25', '2', '2022-11-25', '', 'F', '1', '1', '2022-11-25 13:47:56', '2022-11-25 13:47:56');
INSERT INTO `tbl_supplier_payment` VALUES ('17', 'SP-20221125065224', 'H', '1', '344304', '2022-12-10', '2', '2022-11-25', '', 'F', '1', '1', '2022-11-25 13:52:58', '2022-11-25 13:52:58');
INSERT INTO `tbl_supplier_payment` VALUES ('18', 'SP-20221125065924', 'H', '1', '344305', '2022-12-26', '2', '2022-11-25', '', 'F', '1', '1', '2022-11-25 13:59:43', '2022-11-25 13:59:43');
INSERT INTO `tbl_supplier_payment` VALUES ('19', 'SP-20221127041432', 'H', '1', '344399', '2022-12-04', '1', '2022-11-27', '', 'F', '1', '1', '2022-11-27 11:15:04', '2022-11-27 11:15:04');
INSERT INTO `tbl_supplier_payment` VALUES ('20', 'SP-20221127041521', 'H', '4', '377535413', '2023-01-28', '1', '2022-11-27', '', 'F', '1', '0', '2022-11-27 11:15:57', '2022-11-27 11:15:57');
INSERT INTO `tbl_supplier_payment` VALUES ('21', 'SP-20221129074858', 'H', '1', '344308', '2022-12-29', '1', '2022-11-29', '', 'F', '1', '1', '2022-11-29 14:50:33', '2022-11-29 14:50:33');
INSERT INTO `tbl_supplier_payment` VALUES ('22', 'SP-20221129075045', 'H', '1', '344308', '2022-12-14', '2', '2022-11-29', '', 'F', '1', '1', '2022-11-29 14:51:40', '2022-11-29 14:51:40');
INSERT INTO `tbl_supplier_payment` VALUES ('23', 'SP-20221202063917', 'H', '2', '9000139', '2023-01-02', '2', '2022-12-02', '', 'F', '1', '0', '2022-12-02 13:39:55', '2022-12-02 13:39:55');
INSERT INTO `tbl_supplier_payment` VALUES ('24', 'SP-20221202064116', 'H', '1', '344309', '2023-01-02', '1', '2022-12-02', '', 'F', '1', '0', '2022-12-02 13:42:47', '2022-12-02 13:42:47');
INSERT INTO `tbl_supplier_payment` VALUES ('25', 'SP-20221204094251', 'H', '1', '344310', '2022-12-05', '1', '2022-12-04', '', 'F', '1', '1', '2022-12-04 16:43:30', '2022-12-04 16:43:30');
INSERT INTO `tbl_supplier_payment` VALUES ('26', 'SP-20221204094354', 'H', '3', '1000178561', '2023-01-02', '1', '2022-12-04', '', 'F', '1', '0', '2022-12-04 16:44:48', '2022-12-04 16:44:48');
INSERT INTO `tbl_supplier_payment` VALUES ('27', 'SP-20221204094506', 'H', '3', '1000178162', '2023-02-02', '1', '2022-12-04', '', 'F', '1', '0', '2022-12-04 16:45:35', '2022-12-04 16:45:35');
INSERT INTO `tbl_supplier_payment` VALUES ('28', 'SP-20221208031630', 'C', '0', '', '2022-12-08', '5', '2022-12-08', '', 'F', '1', '0', '2022-12-08 10:16:38', '2022-12-08 10:16:38');
INSERT INTO `tbl_supplier_payment` VALUES ('29', 'SP-20221208031655', 'H', '1', '344314', '2022-12-08', '3', '2022-12-08', '', 'F', '1', '1', '2022-12-08 10:17:15', '2022-12-08 10:17:15');
INSERT INTO `tbl_supplier_payment` VALUES ('30', 'SP-20221208031827', 'H', '1', '3443011', '2022-12-20', '4', '2022-12-08', '', 'F', '1', '1', '2022-12-08 10:18:47', '2022-12-08 10:18:47');
INSERT INTO `tbl_supplier_payment` VALUES ('31', 'SP-20221208032054', 'H', '2', '9000141-42', '2023-02-04', '4', '2022-12-08', '', 'F', '1', '0', '2022-12-08 10:21:32', '2022-12-08 10:21:32');
INSERT INTO `tbl_supplier_payment` VALUES ('32', 'SP-20221208034239', 'H', '1', '344312', '2022-12-05', '2', '2022-12-08', '', 'F', '1', '1', '2022-12-08 10:43:34', '2022-12-08 10:43:34');
INSERT INTO `tbl_supplier_payment` VALUES ('33', 'SP-20221208034930', 'H', '1', '3443013', '2022-12-18', '2', '2022-12-08', '', 'F', '1', '1', '2022-12-08 10:50:03', '2022-12-08 10:50:03');
INSERT INTO `tbl_supplier_payment` VALUES ('34', 'SP-20221210093138', 'H', '1', '344316', '2023-02-10', '1', '2022-12-10', '', 'F', '1', '0', '2022-12-10 16:32:14', '2022-12-10 16:32:14');
INSERT INTO `tbl_supplier_payment` VALUES ('35', 'SP-20221210093237', 'H', '1', '344315', '2023-01-10', '1', '2022-12-10', '', 'F', '1', '0', '2022-12-10 16:33:38', '2022-12-10 16:33:38');
INSERT INTO `tbl_supplier_payment` VALUES ('36', 'SP-20221210093351', 'H', '1', '344317', '2023-01-10', '1', '2022-12-10', '', 'F', '1', '0', '2022-12-10 16:34:15', '2022-12-10 16:34:15');
INSERT INTO `tbl_supplier_payment` VALUES ('37', 'SP-20221210093546', 'H', '2', '9000143', '2022-12-24', '2', '2022-12-10', '', 'F', '1', '0', '2022-12-10 16:36:19', '2022-12-10 16:36:19');
INSERT INTO `tbl_supplier_payment` VALUES ('38', 'SP-20221210093645', 'H', '2', '9000144', '2023-02-08', '2', '2022-12-10', '', 'F', '1', '0', '2022-12-10 16:37:16', '2022-12-10 16:37:16');
INSERT INTO `tbl_supplier_payment` VALUES ('39', 'SP-20221210094124', 'H', '2', '9000145', '2023-01-15', '2', '2022-12-10', '', 'F', '1', '0', '2022-12-10 16:41:44', '2022-12-10 16:41:44');
INSERT INTO `tbl_supplier_payment` VALUES ('40', 'SP-20221210094537', 'H', '3', '1000178163', '2022-12-17', '8', '2022-12-10', '', 'F', '1', '0', '2022-12-10 16:46:05', '2022-12-10 16:46:05');
INSERT INTO `tbl_supplier_payment` VALUES ('41', 'SP-20221214115151', 'H', '2', '9000146', '2023-02-14', '2', '2022-12-14', 'NK6410', 'F', '1', '0', '2022-12-14 18:53:51', '2022-12-14 18:53:51');
INSERT INTO `tbl_supplier_payment` VALUES ('42', 'SP-20221214115405', 'H', '2', '9000147', '2022-12-30', '2', '2022-12-14', 'ABONO', 'F', '1', '0', '2022-12-14 18:54:36', '2022-12-14 18:54:36');
INSERT INTO `tbl_supplier_payment` VALUES ('43', 'SP-20221214115457', 'H', '2', '9000149', '2023-01-14', '2', '2022-12-14', 'CHEMICALS', 'F', '1', '0', '2022-12-14 18:55:24', '2022-12-14 18:55:24');
INSERT INTO `tbl_supplier_payment` VALUES ('44', 'SP-20221214115542', 'H', '2', '9000149', '2023-01-14', '2', '2022-12-14', 'CHEMICALS-VINDEX', 'F', '1', '0', '2022-12-14 18:56:15', '2022-12-14 18:56:15');
INSERT INTO `tbl_supplier_payment` VALUES ('45', 'SP-20221214115627', 'H', '2', '9000150', '2023-01-14', '2', '2022-12-14', 'CHEMICALS', 'F', '1', '0', '2022-12-14 18:56:57', '2022-12-14 18:56:57');
INSERT INTO `tbl_supplier_payment` VALUES ('46', 'SP-20221215045915', 'H', '1', '344321', '2023-04-15', '22', '2022-12-15', '', 'F', '1', '0', '2022-12-15 11:59:49', '2022-12-15 11:59:49');
INSERT INTO `tbl_supplier_payment` VALUES ('47', 'SP-20221215054733', 'H', '1', '344324', '2023-04-15', '4', '2022-12-15', '', 'F', '1', '0', '2022-12-15 12:47:54', '2022-12-15 12:47:54');
INSERT INTO `tbl_supplier_payment` VALUES ('48', 'SP-20221217012343', 'H', '1', '344319', '2023-02-14', '1', '2022-12-17', '', 'F', '1', '0', '2022-12-17 08:24:11', '2022-12-17 08:24:11');
INSERT INTO `tbl_supplier_payment` VALUES ('49', 'SP-20221217012421', 'H', '1', '344318', '2023-02-14', '1', '2022-12-17', '', 'F', '1', '0', '2022-12-17 08:24:40', '2022-12-17 08:24:40');
INSERT INTO `tbl_supplier_payment` VALUES ('50', 'SP-20221217013040', 'H', '3', '1000178165', '0023-02-10', '19', '2022-12-17', '', 'F', '1', '0', '2022-12-17 08:31:24', '2022-12-17 08:31:24');
INSERT INTO `tbl_supplier_payment` VALUES ('51', 'SP-20221217071018', 'H', '1', '344323', '2023-01-17', '1', '2022-12-17', '', 'F', '1', '0', '2022-12-17 14:10:41', '2022-12-17 14:10:41');
INSERT INTO `tbl_supplier_payment` VALUES ('52', 'SP-20221219040410', 'H', '3', '1000178166', '2023-02-19', '19', '2022-12-19', '', 'F', '1', '0', '2022-12-19 11:06:28', '2022-12-19 11:06:28');
INSERT INTO `tbl_supplier_payment` VALUES ('53', 'SP-20221219060234', 'H', '4', '377535414', '2023-01-19', '2', '2022-12-19', '', 'F', '1', '0', '2022-12-19 13:02:56', '2022-12-19 13:02:56');
INSERT INTO `tbl_supplier_payment` VALUES ('54', 'SP-20221219060754', 'H', '4', '03377535415', '2023-01-17', '2', '2022-12-19', '', 'F', '1', '0', '2022-12-19 13:08:25', '2022-12-19 13:08:25');
INSERT INTO `tbl_supplier_payment` VALUES ('55', 'SP-20221223012032', 'H', '4', '0377535416', '2023-02-22', '20', '2022-12-23', 'Todomax/Ground Plus', 'F', '1', '0', '2022-12-23 08:21:09', '2022-12-23 08:21:09');
INSERT INTO `tbl_supplier_payment` VALUES ('56', 'SP-20221223012444', 'H', '1', '344324', '2023-01-04', '2', '2022-12-19', '', 'F', '1', '0', '2022-12-23 08:25:22', '2022-12-23 08:25:22');
INSERT INTO `tbl_supplier_payment` VALUES ('57', 'SP-20221223050449', 'H', '1', '344327', '2022-01-23', '1', '2022-12-23', '', 'F', '1', '1', '2022-12-23 12:05:15', '2022-12-23 12:05:15');
INSERT INTO `tbl_supplier_payment` VALUES ('58', 'SP-20221224022907', 'H', '1', '344328', '2023-01-24', '1', '2022-12-24', 'fertilizer', 'F', '1', '0', '2022-12-24 09:30:18', '2022-12-24 09:30:18');
INSERT INTO `tbl_supplier_payment` VALUES ('59', 'SP-20221226102417', 'H', '1', '344329', '2022-12-26', '2', '2022-12-26', '', 'F', '1', '1', '2022-12-26 17:24:32', '2022-12-26 17:24:32');
INSERT INTO `tbl_supplier_payment` VALUES ('60', 'SP-20221226102623', 'H', '2', '9000151', '2023-01-21', '2', '2022-12-26', '', 'F', '1', '0', '2022-12-26 17:26:48', '2022-12-26 17:26:48');
INSERT INTO `tbl_supplier_payment` VALUES ('61', 'SP-20221228002705', 'H', '2', '9000152', '2023-01-26', '2', '2022-12-26', 'clear out', 'F', '1', '0', '2022-12-28 07:27:51', '2022-12-28 07:27:51');
INSERT INTO `tbl_supplier_payment` VALUES ('62', 'SP-20221228002828', 'H', '2', '9000154', '2023-01-26', '2', '2022-12-26', 'chemicals', 'F', '1', '0', '2022-12-28 07:28:55', '2022-12-28 07:28:55');
INSERT INTO `tbl_supplier_payment` VALUES ('63', 'SP-20221228004802', 'H', '3', '1000178168', '2023-01-24', '8', '2022-12-24', '', 'F', '1', '0', '2022-12-28 07:58:10', '2022-12-28 07:58:10');
INSERT INTO `tbl_supplier_payment` VALUES ('64', 'SP-20221229085632', 'H', '1', '344331', '2023-01-29', '1', '2022-12-29', '', 'F', '1', '0', '2022-12-29 15:56:54', '2022-12-29 15:56:54');
INSERT INTO `tbl_supplier_payment` VALUES ('65', 'SP-20230103234556', 'H', '5', '423352', '2023-03-03', '19', '2023-01-03', '', 'F', '1', '0', '2023-01-04 06:46:28', '2023-01-04 06:46:28');
INSERT INTO `tbl_supplier_payment` VALUES ('66', 'SP-20230103235736', 'H', '1', '344331', '2023-03-04', '1', '2023-01-02', 'P4124', 'F', '1', '0', '2023-01-04 06:58:06', '2023-01-04 06:58:06');
INSERT INTO `tbl_supplier_payment` VALUES ('67', 'SP-20230104101444', 'H', '2', '9000155', '2023-01-06', '2', '2023-01-04', '', 'F', '1', '0', '2023-01-04 17:15:10', '2023-01-04 17:15:10');
INSERT INTO `tbl_supplier_payment` VALUES ('68', 'SP-20230104103043', 'H', '2', '9000157', '2023-02-04', '2', '2023-01-04', '', 'F', '1', '0', '2023-01-04 17:31:07', '2023-01-04 17:31:07');
INSERT INTO `tbl_supplier_payment` VALUES ('69', 'SP-20230104103122', 'H', '2', '9000158', '2023-02-04', '2', '2023-01-04', '', 'F', '1', '0', '2023-01-04 17:31:44', '2023-01-04 17:31:44');
INSERT INTO `tbl_supplier_payment` VALUES ('70', 'SP-20230104103219', 'H', '2', '9000156', '2023-02-04', '27', '2023-01-04', '', 'F', '1', '0', '2023-01-04 17:32:49', '2023-01-04 17:32:49');
INSERT INTO `tbl_supplier_payment` VALUES ('71', 'SP-20230106092459', 'H', '2', '9000159', '2023-01-06', '2', '2023-03-06', '', 'F', '1', '0', '2023-01-06 16:25:19', '2023-01-06 16:25:19');
INSERT INTO `tbl_supplier_payment` VALUES ('72', 'SP-20230106094136', 'H', '1', '344335', '2023-02-06', '1', '2023-01-06', 'chemicals', 'F', '1', '0', '2023-01-06 16:42:48', '2023-01-06 16:42:48');
INSERT INTO `tbl_supplier_payment` VALUES ('73', 'SP-20230108004244', 'H', '2', '9000160', '2023-02-07', '2', '2023-01-08', '', 'F', '1', '0', '2023-01-08 07:43:20', '2023-01-08 07:43:20');
INSERT INTO `tbl_supplier_payment` VALUES ('74', 'SP-20230108004330', 'H', '2', '9000161', '2023-01-24', '2', '2023-02-24', '', 'F', '1', '0', '2023-01-08 07:43:54', '2023-01-08 07:43:54');
INSERT INTO `tbl_supplier_payment` VALUES ('75', 'SP-20230111062430', 'H', '3', '1000178168', '2023-03-11', '19', '2023-01-11', '', 'F', '1', '0', '2023-01-11 13:25:19', '2023-01-11 13:25:19');
INSERT INTO `tbl_supplier_payment` VALUES ('76', 'SP-20230112054236', 'H', '1', '344340', '2023-03-11', '30', '2023-01-12', 'Herbicut', 'F', '1', '0', '2023-01-12 12:43:03', '2023-01-12 12:43:03');
INSERT INTO `tbl_supplier_payment` VALUES ('77', 'SP-20230112054514', 'H', '3', '1000178170', '2023-03-11', '19', '2023-01-12', '', 'F', '1', '0', '2023-01-12 12:45:55', '2023-01-12 12:45:55');
INSERT INTO `tbl_supplier_payment` VALUES ('78', 'SP-20230112054914', 'H', '4', '37753519', '2023-03-11', '19', '2023-01-12', '', 'F', '1', '0', '2023-01-12 12:49:50', '2023-01-12 12:49:50');
INSERT INTO `tbl_supplier_payment` VALUES ('79', 'SP-20230112055106', 'H', '4', '377535421', '2023-03-11', '19', '2023-01-12', '', 'F', '1', '0', '2023-01-12 12:51:28', '2023-01-12 12:51:28');
INSERT INTO `tbl_supplier_payment` VALUES ('80', 'SP-20230112055305', 'H', '3', '1000178170', '2023-03-11', '19', '2023-01-12', '', 'F', '1', '0', '2023-01-12 12:54:31', '2023-01-12 12:54:31');
INSERT INTO `tbl_supplier_payment` VALUES ('81', 'SP-20230112055512', 'H', '4', '37753517', '2023-01-18', '3', '2023-01-12', '', 'F', '1', '0', '2023-01-12 12:55:42', '2023-01-12 12:55:42');
INSERT INTO `tbl_supplier_payment` VALUES ('82', 'SP-20230112055840', 'H', '4', '423354', '2023-02-08', '4', '2023-01-12', '', 'F', '1', '0', '2023-01-12 12:59:03', '2023-01-12 12:59:03');
INSERT INTO `tbl_supplier_payment` VALUES ('83', 'SP-20230112055914', 'H', '5', '423355', '2023-04-30', '4', '2023-01-12', '', 'F', '1', '0', '2023-01-12 12:59:46', '2023-01-12 12:59:46');
INSERT INTO `tbl_supplier_payment` VALUES ('84', 'SP-20230112055958', 'H', '5', '423356', '2023-05-01', '4', '2023-01-12', '', 'F', '1', '0', '2023-01-12 13:00:19', '2023-01-12 13:00:19');
INSERT INTO `tbl_supplier_payment` VALUES ('85', 'SP-20230112060211', 'H', '5', '423357', '2023-06-30', '4', '2023-01-12', '', 'F', '1', '0', '2023-01-12 13:02:30', '2023-01-12 13:02:30');
INSERT INTO `tbl_supplier_payment` VALUES ('86', 'SP-20230112060240', 'H', '5', '423358', '2023-05-01', '4', '2023-01-12', '', 'F', '1', '0', '2023-01-12 13:03:12', '2023-01-12 13:03:12');
INSERT INTO `tbl_supplier_payment` VALUES ('87', 'SP-20230112060540', 'H', '2', '9000165', '2023-01-28', '2', '2023-01-12', '', 'F', '1', '0', '2023-01-12 13:05:59', '2023-01-12 13:05:59');
INSERT INTO `tbl_supplier_payment` VALUES ('88', 'SP-20230112060616', 'H', '2', '9000164', '2023-02-11', '2', '2023-01-12', '', 'F', '1', '0', '2023-01-12 13:06:50', '2023-01-12 13:06:50');
INSERT INTO `tbl_supplier_payment` VALUES ('89', 'SP-20230112060733', 'H', '2', '9000163', '2023-03-11', '2', '2023-01-12', '', 'F', '1', '0', '2023-01-12 13:07:55', '2023-01-12 13:07:55');
INSERT INTO `tbl_supplier_payment` VALUES ('90', 'SP-20230112060812', 'H', '2', '9000162', '2023-02-11', '2', '2023-01-12', '', 'F', '1', '0', '2023-01-12 13:08:59', '2023-01-12 13:08:59');
INSERT INTO `tbl_supplier_payment` VALUES ('91', 'SP-20230116000713', 'H', '1', '344339', '2023-02-25', '31', '2023-01-16', '', 'F', '1', '0', '2023-01-16 07:07:48', '2023-01-16 07:07:48');
INSERT INTO `tbl_supplier_payment` VALUES ('92', 'SP-20230116000955', 'H', '2', '9000166', '2023-01-28', '2', '2023-01-16', 'abono#36256', 'F', '1', '0', '2023-01-16 07:10:23', '2023-01-16 07:10:23');
INSERT INTO `tbl_supplier_payment` VALUES ('93', 'SP-20230116001251', 'H', '1', '344336', '2023-02-08', '1', '2023-01-16', '', 'F', '1', '0', '2023-01-16 07:15:04', '2023-01-16 07:15:04');
INSERT INTO `tbl_supplier_payment` VALUES ('94', 'SP-20230116001558', 'H', '1', '344335', '2023-03-08', '1', '2023-01-16', '', 'F', '1', '0', '2023-01-16 07:16:28', '2023-01-16 07:16:28');
INSERT INTO `tbl_supplier_payment` VALUES ('95', 'SP-20230118103230', 'H', '2', '9000167', '2023-02-03', '2', '2023-01-18', 'abono#36259', 'F', '1', '0', '2023-01-18 17:33:03', '2023-01-18 17:33:03');
INSERT INTO `tbl_supplier_payment` VALUES ('96', 'SP-20230118104141', 'H', '2', '9000169', '2023-03-18', '2', '2023-01-18', 'seeds #36260', 'F', '1', '0', '2023-01-18 17:42:23', '2023-01-18 17:42:23');
INSERT INTO `tbl_supplier_payment` VALUES ('97', 'SP-20230118105029', 'H', '2', '9000171', '2023-02-18', '2', '2023-01-18', 'chemicals # 9729', 'F', '1', '0', '2023-01-18 17:51:11', '2023-01-18 17:51:11');
INSERT INTO `tbl_supplier_payment` VALUES ('98', 'SP-20230118105148', 'H', '2', '9000170', '2023-02-04', '2', '2023-01-18', 'abono # 36261', 'F', '1', '0', '2023-01-18 17:52:31', '2023-01-18 17:52:31');
INSERT INTO `tbl_supplier_payment` VALUES ('99', 'SP-20230118105952', 'H', '2', '9000172', '2023-02-18', '2', '2023-01-18', 'chemical#9728 ', 'F', '1', '0', '2023-01-18 18:00:48', '2023-01-18 18:00:48');
INSERT INTO `tbl_supplier_payment` VALUES ('100', 'SP-20230118110858', 'H', '2', '9000173', '2023-02-18', '2', '2023-01-18', 'chem # 9727', 'F', '1', '0', '2023-01-18 18:09:30', '2023-01-18 18:09:30');
INSERT INTO `tbl_supplier_payment` VALUES ('101', 'SP-20230118111134', 'H', '4', '377535423', '2023-02-16', '8', '2023-01-18', '709', 'F', '1', '0', '2023-01-18 18:12:17', '2023-01-18 18:12:17');
INSERT INTO `tbl_supplier_payment` VALUES ('102', 'SP-20230118111846', 'H', '4', '0377535424', '2023-02-18', '8', '2023-01-18', '', 'F', '1', '0', '2023-01-18 18:19:12', '2023-01-18 18:19:12');
INSERT INTO `tbl_supplier_payment` VALUES ('103', 'SP-20230118112356', 'H', '1', '344346', '2023-02-16', '1', '2023-01-16', '', 'F', '1', '0', '2023-01-18 18:24:24', '2023-01-18 18:24:24');
INSERT INTO `tbl_supplier_payment` VALUES ('104', 'SP-20230118112503', 'H', '1', '344345', '2023-02-16', '1', '2023-01-16', '', 'F', '1', '0', '2023-01-18 18:25:28', '2023-01-18 18:25:28');
INSERT INTO `tbl_supplier_payment` VALUES ('105', 'SP-20230118112547', 'H', '1', '344343', '2023-02-17', '1', '2023-01-17', '', 'F', '1', '0', '2023-01-18 18:26:15', '2023-01-18 18:26:15');
INSERT INTO `tbl_supplier_payment` VALUES ('106', 'SP-20230118112633', 'H', '1', '344344', '2023-02-17', '1', '2023-01-17', '', 'F', '1', '0', '2023-01-18 18:27:07', '2023-01-18 18:27:07');
INSERT INTO `tbl_supplier_payment` VALUES ('107', 'SP-20230118112807', 'H', '3', '1000178171', '2023-03-18', '19', '2023-01-18', '', 'F', '1', '0', '2023-01-18 18:28:44', '2023-01-18 18:28:44');
INSERT INTO `tbl_supplier_payment` VALUES ('108', 'SP-20230118112901', 'H', '3', '1000178172', '2023-03-18', '32', '2023-01-18', '', 'F', '1', '0', '2023-01-18 18:29:25', '2023-01-18 18:29:25');
INSERT INTO `tbl_supplier_payment` VALUES ('109', 'SP-20230119062953', 'H', '5', '423362', '2023-02-19', '4', '2023-01-19', 'abono-71681', 'F', '1', '0', '2023-01-19 13:30:16', '2023-01-19 13:30:16');
INSERT INTO `tbl_supplier_payment` VALUES ('110', 'SP-20230119063106', 'H', '5', '423359', '2023-05-19', '4', '2023-01-19', 'nk 6505-71682', 'F', '1', '0', '2023-01-19 13:31:53', '2023-01-19 13:31:53');
INSERT INTO `tbl_supplier_payment` VALUES ('111', 'SP-20230119063208', 'H', '5', '423360', '2023-04-30', '4', '2023-04-30', 'seeds-71682', 'F', '1', '0', '2023-01-19 13:32:42', '2023-01-19 13:32:42');
INSERT INTO `tbl_supplier_payment` VALUES ('112', 'SP-20230120061239', 'H', '1', '344348', '2023-01-20', '1', '2023-01-20', '', 'F', '1', '0', '2023-01-20 13:13:00', '2023-01-20 13:13:00');
INSERT INTO `tbl_supplier_payment` VALUES ('113', 'SP-20230120061311', 'H', '3', '1000178173', '2023-02-20', '27', '2023-01-20', '', 'F', '1', '0', '2023-01-20 13:13:42', '2023-01-20 13:13:42');
INSERT INTO `tbl_supplier_payment` VALUES ('114', 'SP-20230121043618', 'H', '1', '344401', '2023-03-20', '1', '2023-01-21', 'D8899', 'F', '1', '0', '2023-01-21 11:36:58', '2023-01-21 11:36:58');
INSERT INTO `tbl_supplier_payment` VALUES ('115', 'SP-20230121044025', 'H', '1', '344402', '2023-03-21', '1', '2023-01-21', 'H-001138', 'F', '1', '0', '2023-01-21 11:41:24', '2023-01-21 11:41:24');
INSERT INTO `tbl_supplier_payment` VALUES ('116', 'SP-20230121050919', 'H', '3', '100017874', '2023-02-20', '19', '2023-01-21', 'SEEDS-*8131', 'F', '1', '0', '2023-01-21 12:10:03', '2023-01-21 12:10:03');
INSERT INTO `tbl_supplier_payment` VALUES ('117', 'SP-20230121051015', 'H', '3', '1000178175', '2023-03-20', '19', '2023-01-21', 'CHEMICALS', 'F', '1', '0', '2023-01-21 12:10:49', '2023-01-21 12:10:49');
INSERT INTO `tbl_supplier_payment` VALUES ('118', 'SP-20230121233548', 'H', '2', '9000176', '2023-02-07', '2', '2023-01-22', '', 'F', '1', '0', '2023-01-22 06:36:11', '2023-01-22 06:36:11');
INSERT INTO `tbl_supplier_payment` VALUES ('119', 'SP-20230121233655', 'H', '2', '9000175', '2023-02-07', '2', '2023-01-22', '', 'F', '1', '0', '2023-01-22 06:37:19', '2023-01-22 06:37:19');
INSERT INTO `tbl_supplier_payment` VALUES ('120', 'SP-20230121233733', 'H', '2', '9000174', '2023-02-07', '2', '2023-01-22', '', 'F', '1', '0', '2023-01-22 06:38:00', '2023-01-22 06:38:00');
INSERT INTO `tbl_supplier_payment` VALUES ('121', 'SP-20230124053147', 'H', '2', '9000177', '2023-02-11', '2', '2023-01-24', 'Abono-36265', 'F', '1', '0', '2023-01-24 12:32:27', '2023-01-24 12:32:27');
INSERT INTO `tbl_supplier_payment` VALUES ('122', 'SP-20230125052223', 'H', '1', '34406', '2023-02-25', '1', '2023-01-25', 'H001144', 'F', '1', '0', '2023-01-25 12:22:48', '2023-01-25 12:22:48');
INSERT INTO `tbl_supplier_payment` VALUES ('123', 'SP-20230125052333', 'H', '1', '344405', '2023-01-25', '31', '2023-01-25', 'weed blaster', 'F', '1', '0', '2023-01-25 12:23:59', '2023-01-25 12:23:59');
INSERT INTO `tbl_supplier_payment` VALUES ('124', 'SP-20230125052518', 'H', '1', '344404', '2023-02-24', '1', '2023-01-24', 'H-001143', 'F', '1', '0', '2023-01-25 12:26:13', '2023-01-25 12:26:13');
INSERT INTO `tbl_supplier_payment` VALUES ('125', 'SP-20230125052754', 'H', '2', '9000177', '2023-02-11', '2', '2023-01-24', 'abono-36266', 'F', '1', '0', '2023-01-25 12:29:50', '2023-01-25 12:29:50');
INSERT INTO `tbl_supplier_payment` VALUES ('126', 'SP-20230125053035', 'H', '2', '9000179', '2023-02-25', '2', '2023-01-25', 'chemicals-9731', 'F', '1', '0', '2023-01-25 12:31:06', '2023-01-25 12:31:06');
INSERT INTO `tbl_supplier_payment` VALUES ('127', 'SP-20230125233230', 'H', '1', '344403', '2023-02-24', '30', '2023-01-23', 'HERBICUT', 'F', '1', '0', '2023-01-26 06:33:10', '2023-01-26 06:33:10');
INSERT INTO `tbl_supplier_payment` VALUES ('129', 'SP-20230125234553', 'H', '2', '9000185', '2023-02-11', '2', '2023-01-26', 'ABONO', 'F', '1', '0', '2023-01-26 06:46:16', '2023-01-26 06:46:16');
INSERT INTO `tbl_supplier_payment` VALUES ('130', 'SP-20230125234631', 'H', '2', '9000183', '2023-04-09', '2', '2023-01-26', 'SEEDS', 'F', '1', '0', '2023-01-26 06:47:09', '2023-01-26 06:47:09');
INSERT INTO `tbl_supplier_payment` VALUES ('131', 'SP-20230125234745', 'H', '2', '9000182', '2023-04-25', '2', '2023-01-26', 'SEEDS', 'F', '1', '0', '2023-01-26 06:48:03', '2023-01-26 06:48:03');
INSERT INTO `tbl_supplier_payment` VALUES ('133', 'SP-20230126000214', 'H', '2', '9000178', '2023-02-24', '2', '2023-01-26', 'CHEMICALS', 'F', '1', '0', '2023-01-26 07:02:36', '2023-01-26 07:02:36');
INSERT INTO `tbl_supplier_payment` VALUES ('134', 'SP-20230131000622', 'H', '1', '344410', '2023-01-29', '32', '2023-01-29', '', 'F', '1', '0', '2023-01-31 07:06:53', '2023-01-31 07:06:53');
INSERT INTO `tbl_supplier_payment` VALUES ('135', 'SP-20230131000706', 'H', '1', '344412', '2023-02-28', '32', '2023-01-29', '', 'F', '1', '0', '2023-01-31 07:07:36', '2023-01-31 07:07:36');
INSERT INTO `tbl_supplier_payment` VALUES ('136', 'SP-20230131003429', 'H', '2', '9000191', '2023-03-31', '2', '2023-01-31', '', 'F', '1', '0', '2023-01-31 07:34:51', '2023-01-31 07:34:51');
INSERT INTO `tbl_supplier_payment` VALUES ('137', 'SP-20230131003547', 'H', '1', '344415-16', '2023-01-29', '2', '2023-01-29', '', 'F', '1', '0', '2023-01-31 07:36:23', '2023-01-31 07:36:23');
INSERT INTO `tbl_supplier_payment` VALUES ('138', 'SP-20230131003820', 'H', '2', '9000188', '2023-02-12', '2', '2023-01-31', '', 'F', '1', '0', '2023-01-31 07:38:42', '2023-01-31 07:38:42');
INSERT INTO `tbl_supplier_payment` VALUES ('139', 'SP-20230131003903', 'H', '2', '9000186', '2023-02-11', '2', '2023-01-31', '', 'F', '1', '0', '2023-01-31 07:39:45', '2023-01-31 07:39:45');
INSERT INTO `tbl_supplier_payment` VALUES ('140', 'SP-20230131003958', 'H', '2', '9000185', '2023-02-11', '2', '2023-01-31', '', 'F', '1', '0', '2023-01-31 07:40:36', '2023-01-31 07:40:36');
INSERT INTO `tbl_supplier_payment` VALUES ('141', 'SP-20230131004733', 'H', '3', '1000178176', '2023-02-26', '8', '2023-01-31', '', 'F', '1', '0', '2023-01-31 07:48:12', '2023-01-31 07:48:12');
INSERT INTO `tbl_supplier_payment` VALUES ('142', 'SP-20230131042640', 'H', '1', '344419', '2023-03-02', '1', '2023-01-31', '', 'F', '1', '0', '2023-01-31 11:27:03', '2023-01-31 11:27:03');
INSERT INTO `tbl_supplier_payment` VALUES ('143', 'SP-20230203114539', 'H', '2', '9000194', '2023-04-03', '2', '2023-02-03', '', 'F', '1', '0', '2023-02-03 18:45:58', '2023-02-03 18:45:58');
INSERT INTO `tbl_supplier_payment` VALUES ('144', 'SP-20230203114613', 'H', '2', '9000193', '2023-02-03', '2', '2023-02-03', '', 'F', '1', '0', '2023-02-03 18:46:33', '2023-02-03 18:46:33');
INSERT INTO `tbl_supplier_payment` VALUES ('145', 'SP-20230203114651', 'H', '2', '9000189', '2023-01-30', '2', '2023-02-03', '', 'F', '1', '0', '2023-02-03 18:47:34', '2023-02-03 18:47:34');
INSERT INTO `tbl_supplier_payment` VALUES ('146', 'SP-20230203114755', 'H', '2', '9000192', '2023-02-03', '2', '2023-02-03', '', 'F', '1', '0', '2023-02-03 18:48:18', '2023-02-03 18:48:18');
INSERT INTO `tbl_supplier_payment` VALUES ('147', 'SP-20230203115458', 'H', '2', '9000195', '2023-03-02', '2', '2023-02-03', '', 'F', '1', '0', '2023-02-03 18:55:14', '2023-02-03 18:55:14');
INSERT INTO `tbl_supplier_payment` VALUES ('148', 'SP-20230203115614', 'H', '2', '9000196', '2023-02-18', '2', '2023-02-03', '', 'F', '1', '0', '2023-02-03 18:56:30', '2023-02-03 18:56:30');
INSERT INTO `tbl_supplier_payment` VALUES ('149', 'SP-20230203115836', 'H', '2', '9000197', '2023-03-02', '2', '2023-02-03', '', 'F', '1', '0', '2023-02-03 18:58:57', '2023-02-03 18:58:57');
INSERT INTO `tbl_supplier_payment` VALUES ('150', 'SP-20230203120330', 'H', '1', '344429', '2023-04-03', '33', '2023-02-03', '', 'F', '1', '0', '2023-02-03 19:03:51', '2023-02-03 19:03:51');
INSERT INTO `tbl_supplier_payment` VALUES ('151', 'SP-20230203120808', 'H', '1', '344425', '2023-02-02', '33', '2023-02-03', '', 'F', '1', '0', '2023-02-03 19:08:33', '2023-02-03 19:08:33');
INSERT INTO `tbl_supplier_payment` VALUES ('152', 'SP-20230203120845', 'H', '1', '344426', '2023-04-02', '33', '2023-02-03', '', 'F', '1', '0', '2023-02-03 19:09:07', '2023-02-03 19:09:07');
INSERT INTO `tbl_supplier_payment` VALUES ('153', 'SP-20230203121157', 'H', '1', '344423', '2023-02-01', '20', '2023-02-03', '', 'F', '1', '0', '2023-02-03 19:12:12', '2023-02-03 19:12:12');
INSERT INTO `tbl_supplier_payment` VALUES ('154', 'SP-20230203121438', 'H', '1', '344424', '2023-03-01', '34', '2023-02-03', '', 'F', '1', '0', '2023-02-03 19:14:57', '2023-02-03 19:14:57');
INSERT INTO `tbl_supplier_payment` VALUES ('155', 'SP-20230203121744', 'H', '5', '423364', '2023-05-01', '4', '2023-02-03', '', 'F', '1', '0', '2023-02-03 19:18:05', '2023-02-03 19:18:05');
INSERT INTO `tbl_supplier_payment` VALUES ('156', 'SP-20230203122208', 'H', '3', '1000178178', '2023-03-29', '19', '2023-02-03', '', 'F', '1', '0', '2023-02-03 19:22:29', '2023-02-03 19:22:29');
INSERT INTO `tbl_supplier_payment` VALUES ('157', 'SP-20230203122251', 'H', '3', '1000178177', '2023-03-29', '19', '2023-02-03', '', 'F', '1', '0', '2023-02-03 19:23:13', '2023-02-03 19:23:13');
INSERT INTO `tbl_supplier_payment` VALUES ('158', 'SP-20230203122408', 'H', '3', '1000178180', '2023-03-02', '19', '2023-02-03', '', 'F', '1', '0', '2023-02-03 19:24:30', '2023-02-03 19:24:30');
INSERT INTO `tbl_supplier_payment` VALUES ('159', 'SP-20230203122847', 'H', '2', '9000172', '2023-02-18', '2', '2023-02-03', '', 'F', '1', '0', '2023-02-03 19:29:13', '2023-02-03 19:29:13');
INSERT INTO `tbl_supplier_payment` VALUES ('160', 'SP-20230203123201', 'H', '1', '344427', '2023-02-02', '1', '2023-02-03', '', 'F', '1', '0', '2023-02-03 19:32:20', '2023-02-03 19:32:20');
INSERT INTO `tbl_supplier_payment` VALUES ('161', 'SP-20230203123302', 'H', '1', '344422', '2023-02-02', '1', '2023-02-02', '', 'F', '1', '0', '2023-02-03 19:33:20', '2023-02-03 19:33:20');
INSERT INTO `tbl_supplier_payment` VALUES ('162', 'SP-20230203123441', 'H', '1', '344407', '2023-02-26', '1', '2023-02-03', '', 'F', '1', '0', '2023-02-03 19:35:06', '2023-02-03 19:35:06');
INSERT INTO `tbl_supplier_payment` VALUES ('163', 'SP-20230203123738', 'H', '1', '344408', '2023-02-28', '1', '2023-02-03', '', 'F', '1', '0', '2023-02-03 19:38:29', '2023-02-03 19:38:29');
INSERT INTO `tbl_supplier_payment` VALUES ('164', 'SP-20230203124106', 'H', '1', '344421', '2023-01-30', '1', '2023-01-30', '', 'F', '1', '0', '2023-02-03 19:41:33', '2023-02-03 19:41:33');
INSERT INTO `tbl_supplier_payment` VALUES ('165', 'SP-20230203124319', 'H', '1', '344418', '2023-03-01', '1', '2023-02-03', '', 'F', '1', '0', '2023-02-03 19:43:52', '2023-02-03 19:43:52');
INSERT INTO `tbl_supplier_payment` VALUES ('166', 'SP-20230203124620', 'C', '0', '', '2023-02-03', '5', '2023-02-03', '', 'F', '1', '0', '2023-02-03 19:46:28', '2023-02-03 19:46:28');
INSERT INTO `tbl_supplier_payment` VALUES ('167', 'SP-20230204024707', 'H', '1', '3444131', '2023-03-04', '1', '2023-02-04', '', 'F', '1', '0', '2023-02-04 09:47:34', '2023-02-04 09:47:34');
INSERT INTO `tbl_supplier_payment` VALUES ('168', 'SP-20230206230934', 'H', '2', '9000701', '2023-04-03', '2', '2023-02-07', 'nk 6505', 'F', '1', '0', '2023-02-07 06:10:01', '2023-02-07 06:10:01');
INSERT INTO `tbl_supplier_payment` VALUES ('169', 'SP-20230206231017', 'H', '2', '9000702', '2023-02-22', '2', '2023-02-07', 'abono-36275', 'F', '1', '0', '2023-02-07 06:10:51', '2023-02-07 06:10:51');
INSERT INTO `tbl_supplier_payment` VALUES ('170', 'SP-20230206231107', 'H', '2', '9000703', '2023-03-02', '2', '2023-02-07', 'chem- 9736', 'F', '1', '0', '2023-02-07 06:11:37', '2023-02-07 06:11:37');
INSERT INTO `tbl_supplier_payment` VALUES ('171', 'SP-20230206231303', 'H', '2', '9000198', '2023-02-06', '2', '2023-02-07', 'kalabasa-125194', 'F', '1', '0', '2023-02-07 06:13:34', '2023-02-07 06:13:34');
INSERT INTO `tbl_supplier_payment` VALUES ('172', 'SP-20230206231435', 'H', '2', '9000199', '2023-02-06', '2', '2023-02-07', 'suprema-125192', 'F', '1', '0', '2023-02-07 06:15:02', '2023-02-07 06:15:02');
INSERT INTO `tbl_supplier_payment` VALUES ('173', 'SP-20230207040506', 'H', '6', '33854', '2023-04-07', '27', '2023-02-07', '', 'F', '1', '0', '2023-02-07 11:05:36', '2023-02-07 11:05:36');
INSERT INTO `tbl_supplier_payment` VALUES ('174', 'SP-20230207072253', 'H', '1', '344435', '2023-03-08', '1', '2023-02-07', '', 'F', '1', '0', '2023-02-07 14:23:10', '2023-02-07 14:23:10');
INSERT INTO `tbl_supplier_payment` VALUES ('175', 'SP-20230208052359', 'H', '6', '33855', '2023-02-08', '1', '2023-02-08', '', 'F', '1', '0', '2023-02-08 12:24:24', '2023-02-08 12:24:24');
INSERT INTO `tbl_supplier_payment` VALUES ('176', 'SP-20230208082222', 'H', '1', '344437', '2023-03-05', '19', '2023-02-08', '', 'F', '1', '0', '2023-02-08 15:22:43', '2023-02-08 15:22:43');
INSERT INTO `tbl_supplier_payment` VALUES ('177', 'SP-20230208082433', 'H', '3', '1000178184', '2023-04-08', '19', '2023-02-08', '', 'F', '1', '0', '2023-02-08 15:24:59', '2023-02-08 15:24:59');
INSERT INTO `tbl_supplier_payment` VALUES ('178', 'SP-20230209013218', 'H', '5', '423369', '2023-05-01', '4', '2023-02-09', '', 'F', '1', '0', '2023-02-09 08:33:28', '2023-02-09 08:33:28');
INSERT INTO `tbl_supplier_payment` VALUES ('179', 'SP-20230209013407', 'H', '5', '423370', '2023-06-09', '4', '2023-02-09', '', 'F', '1', '0', '2023-02-09 08:34:28', '2023-02-09 08:34:28');
INSERT INTO `tbl_supplier_payment` VALUES ('180', 'SP-20230209013444', 'H', '5', '423362', '2023-02-19', '4', '2023-02-09', '', 'F', '1', '0', '2023-02-09 08:35:04', '2023-02-09 08:35:04');
INSERT INTO `tbl_supplier_payment` VALUES ('181', 'SP-20230209013519', 'H', '5', '423366', '2023-03-04', '4', '2023-02-09', '', 'F', '1', '0', '2023-02-09 08:35:46', '2023-02-09 08:35:46');
INSERT INTO `tbl_supplier_payment` VALUES ('182', 'SP-20230209013600', 'H', '5', '423367', '2023-05-01', '4', '2023-02-09', '', 'F', '1', '0', '2023-02-09 08:36:19', '2023-02-09 08:36:19');
INSERT INTO `tbl_supplier_payment` VALUES ('184', 'SP-20230209014020', 'H', '1', '344433', '2023-04-05', '19', '2023-02-09', '', 'F', '1', '0', '2023-02-09 08:41:00', '2023-02-09 08:41:00');
INSERT INTO `tbl_supplier_payment` VALUES ('185', 'SP-20230209014130', 'H', '3', '10001781', '2023-04-05', '19', '2023-02-09', '', 'F', '1', '0', '2023-02-09 08:42:05', '2023-02-09 08:42:05');
INSERT INTO `tbl_supplier_payment` VALUES ('186', 'SP-20230209014220', 'H', '3', '10001783', '2023-04-07', '19', '2023-02-09', '', 'F', '1', '0', '2023-02-09 08:42:33', '2023-02-09 08:42:33');
INSERT INTO `tbl_supplier_payment` VALUES ('187', 'SP-20230211034558', 'H', '6', '33856', '2023-04-11', '27', '2023-02-11', '00', 'F', '1', '0', '2023-02-11 10:47:06', '2023-02-11 10:47:06');
INSERT INTO `tbl_supplier_payment` VALUES ('188', 'SP-20230211065543', 'H', '3', '1000178189', '2023-04-11', '19', '2023-02-11', 'BPI PDC', 'F', '1', '0', '2023-02-11 13:56:36', '2023-02-11 13:56:36');
INSERT INTO `tbl_supplier_payment` VALUES ('189', 'SP-20230211065721', 'H', '2', '0009000705', '2023-03-09', '19', '2023-02-11', 'PDC', 'F', '1', '0', '2023-02-11 13:58:48', '2023-02-11 13:58:48');
INSERT INTO `tbl_supplier_payment` VALUES ('190', 'SP-20230211075303', 'H', '6', '33857', '2023-04-11', '20', '2023-02-11', 'chemicals', 'F', '1', '0', '2023-02-11 14:54:44', '2023-02-11 14:54:44');
INSERT INTO `tbl_supplier_payment` VALUES ('191', 'SP-20230211103847', 'H', '1', '344439', '2023-02-11', '2', '2023-02-11', 'PDC LBP', 'F', '1', '0', '2023-02-11 17:39:53', '2023-02-11 17:39:53');
INSERT INTO `tbl_supplier_payment` VALUES ('192', 'SP-20230211104039', 'H', '1', '344441', '2023-02-11', '2', '2023-02-11', 'LBP ', 'F', '1', '0', '2023-02-11 17:41:38', '2023-02-11 17:41:38');
INSERT INTO `tbl_supplier_payment` VALUES ('193', 'SP-20230211104504', 'H', '3', '1000178187', '2023-03-09', '30', '2023-02-11', 'bpi', 'F', '1', '0', '2023-02-11 17:46:05', '2023-02-11 17:46:05');
INSERT INTO `tbl_supplier_payment` VALUES ('194', 'SP-20230211104639', 'H', '3', '1000178188', '2023-04-08', '8', '2023-02-11', 'bpi', 'F', '1', '0', '2023-02-11 17:47:09', '2023-02-11 17:47:09');
INSERT INTO `tbl_supplier_payment` VALUES ('195', 'SP-20230216004952', 'H', '3', '100017819', '2023-03-12', '19', '2023-02-16', '', 'F', '1', '0', '2023-02-16 07:50:16', '2023-02-16 07:50:16');
INSERT INTO `tbl_supplier_payment` VALUES ('196', 'SP-20230216005056', 'C', '0', '', '2023-02-16', '5', '2023-02-16', '', 'F', '1', '0', '2023-02-16 07:51:04', '2023-02-16 07:51:04');
INSERT INTO `tbl_supplier_payment` VALUES ('197', 'SP-20230216005240', 'H', '1', '34447', '2023-02-16', '1', '2023-02-16', '', 'F', '1', '0', '2023-02-16 07:53:01', '2023-02-16 07:53:01');
INSERT INTO `tbl_supplier_payment` VALUES ('198', 'SP-20230216005805', 'H', '1', '344442', '2023-03-13', '1', '2023-02-16', '', 'F', '1', '0', '2023-02-16 07:58:27', '2023-02-16 07:58:27');
INSERT INTO `tbl_supplier_payment` VALUES ('199', 'SP-20230216011219', 'H', '2', '9000707', '2023-02-15', '2', '2023-02-15', '', 'F', '1', '0', '2023-02-16 08:12:47', '2023-02-16 08:12:47');
INSERT INTO `tbl_supplier_payment` VALUES ('200', 'SP-20230216011511', 'H', '1', '344414', '2023-03-14', '27', '2023-02-15', '', 'F', '1', '0', '2023-02-16 08:15:38', '2023-02-16 08:15:38');
INSERT INTO `tbl_supplier_payment` VALUES ('201', 'SP-20230216011549', 'H', '1', '9000708', '2023-03-15', '27', '2023-02-15', '', 'F', '1', '0', '2023-02-16 08:16:14', '2023-02-16 08:16:14');
INSERT INTO `tbl_supplier_payment` VALUES ('202', 'SP-20230216011817', 'H', '2', '9000709', '2023-04-15', '2', '2023-02-15', '', 'F', '1', '0', '2023-02-16 08:18:40', '2023-02-16 08:18:40');
INSERT INTO `tbl_supplier_payment` VALUES ('203', 'SP-20230216012006', 'H', '2', '9000710', '2023-03-15', '2', '2023-02-15', '', 'F', '1', '0', '2023-02-16 08:20:28', '2023-02-16 08:20:28');
INSERT INTO `tbl_supplier_payment` VALUES ('204', 'SP-20230216012825', 'H', '2', '9000711', '2023-04-15', '2', '2023-02-15', '', 'F', '1', '0', '2023-02-16 08:28:46', '2023-02-16 08:28:46');
INSERT INTO `tbl_supplier_payment` VALUES ('205', 'SP-20230218104828', 'H', '1', '344454', '2023-03-18', '35', '2023-02-18', 'bounty grow', 'F', '1', '0', '2023-02-18 17:49:27', '2023-02-18 17:49:27');
INSERT INTO `tbl_supplier_payment` VALUES ('206', 'SP-20230218105131', 'H', '1', '344453', '2023-02-18', '20', '2023-02-18', '', 'F', '1', '0', '2023-02-18 17:53:06', '2023-02-18 17:53:06');
INSERT INTO `tbl_supplier_payment` VALUES ('207', 'SP-20230218105339', 'H', '1', '344452', '2023-03-18', '1', '2023-02-18', '', 'F', '1', '0', '2023-02-18 17:54:34', '2023-02-18 17:54:34');
INSERT INTO `tbl_supplier_payment` VALUES ('208', 'SP-20230218105730', 'H', '1', '344455', '2023-03-16', '1', '2023-02-18', '', 'F', '1', '0', '2023-02-18 17:58:11', '2023-02-18 17:58:11');
INSERT INTO `tbl_supplier_payment` VALUES ('209', 'SP-20230218110722', 'H', '2', '9000717', '2023-03-10', '2', '2023-02-18', 'chemicals', 'F', '1', '0', '2023-02-18 18:08:26', '2023-02-18 18:08:26');
INSERT INTO `tbl_supplier_payment` VALUES ('210', 'SP-20230218110853', 'H', '1', '9000718', '2023-04-18', '2', '2023-02-18', 'seeds', 'F', '1', '0', '2023-02-18 18:09:34', '2023-02-18 18:09:34');
INSERT INTO `tbl_supplier_payment` VALUES ('211', 'SP-20230218111315', 'H', '2', '9000719', '2023-04-18', '2', '2023-02-18', 'nk6410', 'F', '1', '0', '2023-02-18 18:13:48', '2023-02-18 18:13:48');
INSERT INTO `tbl_supplier_payment` VALUES ('213', 'SP-20230218111752', 'H', '3', '1000178185', '2023-06-08', '22', '2023-02-18', '', 'F', '1', '0', '2023-02-18 18:19:50', '2023-02-18 18:19:50');
INSERT INTO `tbl_supplier_payment` VALUES ('214', 'SP-20230218112423', 'H', '2', '9000716', '2023-02-18', '2', '2023-02-18', 'abono', 'F', '1', '0', '2023-02-18 18:25:09', '2023-02-18 18:25:09');
INSERT INTO `tbl_supplier_payment` VALUES ('215', 'SP-20230218113045', 'H', '1', '344445', '2023-03-14', '20', '2023-02-18', '', 'F', '1', '0', '2023-02-18 18:31:20', '2023-02-18 18:31:20');
INSERT INTO `tbl_supplier_payment` VALUES ('217', 'SP-20230218114116', 'H', '1', '344410', '2023-03-16', '1', '2023-02-18', '', 'F', '1', '0', '2023-02-18 18:41:37', '2023-02-18 18:41:37');
INSERT INTO `tbl_supplier_payment` VALUES ('218', 'SP-20230218114216', 'C', '0', '', '2023-02-18', '1', '2023-02-18', '', 'F', '1', '0', '2023-02-18 18:42:22', '2023-02-18 18:42:22');
INSERT INTO `tbl_supplier_payment` VALUES ('222', 'SP-20230218115509', 'H', '1', '3444134', '2023-02-06', '2', '2023-02-18', '', 'F', '1', '0', '2023-02-18 18:55:39', '2023-02-18 18:55:39');
INSERT INTO `tbl_supplier_payment` VALUES ('223', 'SP-20230218115605', 'H', '3', '1000178190', '2023-02-13', '2', '2023-02-18', '', 'F', '1', '0', '2023-02-18 18:56:32', '2023-02-18 18:56:32');
INSERT INTO `tbl_supplier_payment` VALUES ('224', 'SP-20230219060353', 'H', '6', '033858', '2023-03-15', '19', '2023-02-19', '', 'F', '1', '0', '2023-02-19 13:04:32', '2023-02-19 13:04:32');
INSERT INTO `tbl_supplier_payment` VALUES ('225', 'SP-20230219060504', 'H', '6', '033860', '2023-04-30', '19', '2023-02-19', '', 'F', '1', '0', '2023-02-19 13:05:50', '2023-02-19 13:05:50');
INSERT INTO `tbl_supplier_payment` VALUES ('226', 'SP-20230219060613', 'H', '6', '033862', '2023-04-19', '19', '2023-02-19', '', 'F', '1', '0', '2023-02-19 13:06:45', '2023-02-19 13:06:45');
INSERT INTO `tbl_supplier_payment` VALUES ('227', 'SP-20230221011604', 'H', '2', '9000720', '2023-03-22', '2', '2023-02-21', '', 'F', '1', '0', '2023-02-21 08:16:09', '2023-02-21 08:16:09');
INSERT INTO `tbl_supplier_payment` VALUES ('228', 'SP-20230221011648', 'H', '2', '9000721', '2023-03-22', '2', '2023-02-21', '', 'F', '1', '0', '2023-02-21 08:17:19', '2023-02-21 08:17:19');
INSERT INTO `tbl_supplier_payment` VALUES ('229', 'SP-20230221012157', 'H', '2', '9000722', '2023-03-20', '36', '2023-02-21', '', 'F', '1', '0', '2023-02-21 08:22:25', '2023-02-21 08:22:25');
INSERT INTO `tbl_supplier_payment` VALUES ('230', 'SP-20230221012414', 'H', '1', '344469', '2023-02-20', '1', '2023-02-21', '', 'F', '1', '0', '2023-02-21 08:24:30', '2023-02-21 08:24:30');
INSERT INTO `tbl_supplier_payment` VALUES ('231', 'SP-20230221012532', 'H', '1', '344458', '2023-02-19', '1', '2023-02-21', '', 'F', '1', '0', '2023-02-21 08:25:48', '2023-02-21 08:25:48');
INSERT INTO `tbl_supplier_payment` VALUES ('232', 'SP-20230221012630', 'H', '1', '344457', '2023-03-19', '1', '2023-02-21', '', 'F', '1', '0', '2023-02-21 08:26:52', '2023-02-21 08:26:52');
INSERT INTO `tbl_supplier_payment` VALUES ('233', 'SP-20230221012706', 'H', '1', '344455', '2023-02-19', '1', '2023-02-21', '', 'F', '1', '0', '2023-02-21 08:27:25', '2023-02-21 08:27:25');
INSERT INTO `tbl_supplier_payment` VALUES ('234', 'SP-20230221013223', 'H', '1', '344452', '2023-03-18', '1', '2023-02-21', '', 'F', '1', '0', '2023-02-21 08:32:27', '2023-02-21 08:32:27');
INSERT INTO `tbl_supplier_payment` VALUES ('235', 'SP-20230221013324', 'H', '5', '423371', '2023-06-16', '4', '2023-02-21', '', 'F', '1', '0', '2023-02-21 08:33:29', '2023-02-21 08:33:29');
INSERT INTO `tbl_supplier_payment` VALUES ('236', 'SP-20230221013517', 'H', '5', '423372', '2023-05-01', '4', '2023-02-21', '', 'F', '1', '0', '2023-02-21 08:35:36', '2023-02-21 08:35:36');
INSERT INTO `tbl_supplier_payment` VALUES ('237', 'SP-20230221104042', 'H', '2', '9000723', '2023-02-21', '2', '2023-02-21', '', 'F', '1', '0', '2023-02-21 17:40:56', '2023-02-21 17:40:56');
INSERT INTO `tbl_supplier_payment` VALUES ('238', 'SP-20230223072752', 'H', '3', '1000178194', '2023-04-23', '19', '2023-02-23', '', 'F', '1', '0', '2023-02-23 14:28:19', '2023-02-23 14:28:19');
INSERT INTO `tbl_supplier_payment` VALUES ('239', 'SP-20230223072831', 'H', '3', '1000178195', '2023-04-23', '19', '2023-02-23', '', 'F', '1', '0', '2023-02-23 14:28:50', '2023-02-23 14:28:50');
INSERT INTO `tbl_supplier_payment` VALUES ('240', 'SP-20230223072901', 'H', '3', '1000178196', '2023-03-30', '19', '2023-02-23', '', 'F', '1', '0', '2023-02-23 14:29:29', '2023-02-23 14:29:29');
INSERT INTO `tbl_supplier_payment` VALUES ('241', 'SP-20230303104645', 'H', '2', '9000740', '2023-03-24', '2', '2023-03-03', '', 'F', '1', '0', '2023-03-03 17:47:04', '2023-03-03 17:47:04');
INSERT INTO `tbl_supplier_payment` VALUES ('242', 'SP-20230303110107', 'H', '2', '9000741', '2023-04-03', '2', '2023-03-03', '', 'F', '1', '0', '2023-03-03 18:01:29', '2023-03-03 18:01:29');
INSERT INTO `tbl_supplier_payment` VALUES ('243', 'SP-20230303110147', 'H', '2', '9000742', '2023-04-03', '2', '2023-03-03', '', 'F', '1', '0', '2023-03-03 18:02:07', '2023-03-03 18:02:07');
INSERT INTO `tbl_supplier_payment` VALUES ('244', 'SP-20230303110331', 'H', '2', '9000743', '2023-04-03', '2', '2023-03-03', '', 'F', '1', '0', '2023-03-03 18:03:52', '2023-03-03 18:03:52');
INSERT INTO `tbl_supplier_payment` VALUES ('245', 'SP-20230304053418', 'H', '3', '1000178231', '2023-05-04', '19', '2023-03-04', '', 'F', '1', '0', '2023-03-04 12:34:39', '2023-03-04 12:34:39');
INSERT INTO `tbl_supplier_payment` VALUES ('246', 'SP-20230305020325', 'H', '1', '344461', '2023-04-05', '1', '2023-03-05', '', 'F', '1', '0', '2023-03-05 09:03:51', '2023-03-05 09:03:51');
INSERT INTO `tbl_supplier_payment` VALUES ('247', 'SP-20230305020402', 'H', '3', '1000178232', '2023-03-05', '1', '2023-03-05', '', 'F', '1', '0', '2023-03-05 09:04:25', '2023-03-05 09:04:25');
INSERT INTO `tbl_supplier_payment` VALUES ('248', 'SP-20230307032844', 'H', '2', '9000746', '2023-03-07', '2', '2023-03-07', '', 'F', '1', '0', '2023-03-07 10:29:13', '2023-03-07 10:29:13');
INSERT INTO `tbl_supplier_payment` VALUES ('249', 'SP-20230308075807', 'H', '1', '344479', '2023-03-08', '38', '2023-03-08', '', 'F', '1', '0', '2023-03-08 14:58:24', '2023-03-08 14:58:24');
INSERT INTO `tbl_supplier_payment` VALUES ('250', 'SP-20230308075841', 'H', '1', '344480', '2023-06-08', '38', '2023-03-08', '', 'F', '1', '0', '2023-03-08 14:59:06', '2023-03-08 14:59:06');
INSERT INTO `tbl_supplier_payment` VALUES ('251', 'SP-20230309054841', 'H', '3', '1000178235', '2023-03-25', '19', '2023-03-09', '', 'F', '1', '0', '2023-03-09 12:49:00', '2023-03-09 12:49:00');
INSERT INTO `tbl_supplier_payment` VALUES ('252', 'SP-20230309055505', 'H', '3', '1000178236', '2023-06-10', '19', '2023-03-09', '', 'F', '1', '0', '2023-03-09 12:55:24', '2023-03-09 12:55:24');
INSERT INTO `tbl_supplier_payment` VALUES ('253', 'SP-20230310084611', 'H', '2', '9000750', '2023-07-10', '2', '2023-03-10', '', 'F', '1', '0', '2023-03-10 15:46:28', '2023-03-10 15:46:28');
INSERT INTO `tbl_supplier_payment` VALUES ('254', 'SP-20230310085724', 'H', '3', '1000178240', '2023-06-10', '2', '2023-03-10', '', 'F', '1', '0', '2023-03-10 15:57:47', '2023-03-10 15:57:47');
INSERT INTO `tbl_supplier_payment` VALUES ('255', 'SP-20230310090308', 'H', '3', '100078239', '2023-03-10', '2', '2023-03-10', '', 'F', '1', '0', '2023-03-10 16:03:38', '2023-03-10 16:03:38');
INSERT INTO `tbl_supplier_payment` VALUES ('256', 'SP-20230311042826', 'H', '3', '1000178238', '2023-03-14', '2', '2023-03-11', '', 'F', '1', '0', '2023-03-11 11:28:52', '2023-03-11 11:28:52');
INSERT INTO `tbl_supplier_payment` VALUES ('257', 'SP-20230311044238', 'H', '2', '9000749', '2023-04-09', '2', '2023-03-11', '', 'F', '1', '0', '2023-03-11 11:43:53', '2023-03-11 11:43:53');
INSERT INTO `tbl_supplier_payment` VALUES ('258', 'SP-20230311044443', 'H', '2', '9000748', '2023-04-09', '2', '2023-03-11', '', 'F', '1', '0', '2023-03-11 11:49:10', '2023-03-11 11:49:10');
INSERT INTO `tbl_supplier_payment` VALUES ('259', 'SP-20230311045056', 'H', '2', '9000747', '2023-05-09', '2', '2023-03-11', '', 'F', '1', '0', '2023-03-11 11:51:50', '2023-03-11 11:51:50');
INSERT INTO `tbl_supplier_payment` VALUES ('260', 'SP-20230311051049', 'H', '2', '9000746', '2023-04-07', '2', '2023-03-11', '', 'F', '1', '0', '2023-03-11 12:11:20', '2023-03-11 12:11:20');
INSERT INTO `tbl_supplier_payment` VALUES ('261', 'SP-20230311051222', 'H', '2', '9000475', '2023-05-06', '2', '2023-03-11', '', 'F', '1', '0', '2023-03-11 12:12:54', '2023-03-11 12:12:54');
INSERT INTO `tbl_supplier_payment` VALUES ('262', 'SP-20230311052404', 'H', '2', '9000739', '2023-03-27', '2', '2023-03-11', '', 'F', '1', '0', '2023-03-11 12:37:46', '2023-03-11 12:37:46');
INSERT INTO `tbl_supplier_payment` VALUES ('263', 'SP-20230311054421', 'H', '2', '9000738', '2023-04-27', '2', '2023-03-11', '', 'F', '1', '0', '2023-03-11 12:45:16', '2023-03-11 12:45:16');
INSERT INTO `tbl_supplier_payment` VALUES ('264', 'SP-20230311063003', 'H', '2', '9000724', '2023-02-22', '2', '2023-03-11', '', 'F', '1', '0', '2023-03-11 13:30:38', '2023-03-11 13:30:38');
INSERT INTO `tbl_supplier_payment` VALUES ('265', 'SP-20230311063138', 'H', '2', '9000726', '2023-03-22', '2', '2023-03-11', '', 'F', '1', '0', '2023-03-11 13:32:04', '2023-03-11 13:32:04');
INSERT INTO `tbl_supplier_payment` VALUES ('266', 'SP-20230311063314', 'H', '2', '9000727', '2023-02-24', '2', '2023-03-11', '', 'F', '1', '0', '2023-03-11 13:33:45', '2023-03-11 13:33:45');
INSERT INTO `tbl_supplier_payment` VALUES ('267', 'SP-20230311063700', 'H', '3', '1000178241', '2023-03-18', '2', '2023-03-11', '', 'F', '1', '0', '2023-03-11 13:38:52', '2023-03-11 13:38:52');
INSERT INTO `tbl_supplier_payment` VALUES ('268', 'SP-20230311064103', 'H', '3', '1000178240', '2023-06-10', '2', '2023-03-11', '', 'F', '1', '0', '2023-03-11 13:41:33', '2023-03-11 13:41:33');
INSERT INTO `tbl_supplier_payment` VALUES ('269', 'SP-20230311064559', 'H', '1', '344465', '2023-02-27', '2', '2023-03-11', '', 'F', '1', '0', '2023-03-11 13:46:53', '2023-03-11 13:46:53');
INSERT INTO `tbl_supplier_payment` VALUES ('270', 'SP-20230311065319', 'H', '2', '9000735', '2023-03-27', '2', '2023-03-11', '', 'F', '1', '0', '2023-03-11 13:53:48', '2023-03-11 13:53:48');
INSERT INTO `tbl_supplier_payment` VALUES ('271', 'SP-20230311065425', 'H', '2', '9000734', '2023-03-27', '2', '2023-03-11', '', 'F', '1', '0', '2023-03-11 13:54:47', '2023-03-11 13:54:47');
INSERT INTO `tbl_supplier_payment` VALUES ('272', 'SP-20230311065518', 'H', '2', '9000736', '2023-04-27', '2', '2023-03-11', '', 'F', '1', '0', '2023-03-11 13:55:43', '2023-03-11 13:55:43');
INSERT INTO `tbl_supplier_payment` VALUES ('273', 'SP-20230311065913', 'H', '2', '9000737', '2023-03-28', '2', '2023-03-11', '', 'F', '1', '0', '2023-03-11 13:59:35', '2023-03-11 13:59:35');
INSERT INTO `tbl_supplier_payment` VALUES ('274', 'SP-20230312101349', 'C', '0', '', '2023-03-12', '5', '2023-03-12', '', 'F', '1', '0', '2023-03-12 17:13:56', '2023-03-12 17:13:56');
INSERT INTO `tbl_supplier_payment` VALUES ('275', 'SP-20230312104905', 'H', '5', '423390', '2023-03-21', '4', '2023-03-12', '', 'F', '1', '0', '2023-03-12 17:49:10', '2023-03-12 17:49:10');
INSERT INTO `tbl_supplier_payment` VALUES ('276', 'SP-20230312105028', 'H', '5', '423389', '2023-05-13', '4', '2023-03-12', '', 'F', '1', '0', '2023-03-12 17:50:50', '2023-03-12 17:50:50');
INSERT INTO `tbl_supplier_payment` VALUES ('277', 'SP-20230312105104', 'H', '5', '423388', '2023-03-17', '4', '2023-03-12', '', 'F', '1', '0', '2023-03-12 17:51:22', '2023-03-12 17:51:22');
INSERT INTO `tbl_supplier_payment` VALUES ('278', 'SP-20230312105137', 'H', '5', '423387', '2023-05-17', '4', '2023-03-12', '', 'F', '1', '0', '2023-03-12 17:52:02', '2023-03-12 17:52:02');
INSERT INTO `tbl_supplier_payment` VALUES ('279', 'SP-20230312105217', 'H', '5', '423385', '2023-05-10', '4', '2023-03-12', '', 'F', '1', '0', '2023-03-12 17:52:49', '2023-03-12 17:52:49');
INSERT INTO `tbl_supplier_payment` VALUES ('281', 'SP-20230318033808', 'H', '6', '33865', '2023-03-18', '1', '2023-03-18', '', 'F', '1', '0', '2023-03-18 10:38:23', '2023-03-18 10:38:23');
INSERT INTO `tbl_supplier_payment` VALUES ('282', 'SP-20230318033839', 'H', '6', '33867', '2023-03-18', '1', '2023-03-18', '', 'F', '1', '0', '2023-03-18 10:38:55', '2023-03-18 10:38:55');
INSERT INTO `tbl_supplier_payment` VALUES ('283', 'SP-20230318033908', 'H', '6', '33866', '2023-03-18', '1', '2023-03-18', '', 'F', '1', '0', '2023-03-18 10:39:23', '2023-03-18 10:39:23');
INSERT INTO `tbl_supplier_payment` VALUES ('284', 'SP-20230329103138', 'H', '5', '423399', '2023-04-13', '4', '2023-03-29', '', 'F', '1', '0', '2023-03-29 16:32:16', '2023-03-29 16:32:16');
INSERT INTO `tbl_supplier_payment` VALUES ('285', 'SP-20230329103313', 'H', '5', '423398', '2023-06-28', '4', '2023-03-29', '', 'F', '1', '0', '2023-03-29 16:33:33', '2023-03-29 16:33:33');
INSERT INTO `tbl_supplier_payment` VALUES ('286', 'SP-20230329103359', 'H', '5', '423396', '2023-04-12', '4', '2023-03-29', '', 'F', '1', '0', '2023-03-29 16:34:22', '2023-03-29 16:34:22');
INSERT INTO `tbl_supplier_payment` VALUES ('287', 'SP-20230329103443', 'H', '5', '423395', '2023-04-09', '4', '2023-03-29', '', 'F', '1', '0', '2023-03-29 16:35:08', '2023-03-29 16:35:08');
INSERT INTO `tbl_supplier_payment` VALUES ('288', 'SP-20230329103531', 'H', '5', '423393', '2023-03-28', '4', '2023-03-29', '', 'F', '1', '0', '2023-03-29 16:35:51', '2023-03-29 16:35:51');
INSERT INTO `tbl_supplier_payment` VALUES ('289', 'SP-20230329104654', 'H', '6', '33872', '2023-03-28', '31', '2023-03-29', '', 'F', '1', '0', '2023-03-29 16:47:23', '2023-03-29 16:47:23');
INSERT INTO `tbl_supplier_payment` VALUES ('290', 'SP-20230329104754', 'H', '6', '33871', '2023-03-28', '2', '2023-03-29', '', 'F', '1', '0', '2023-03-29 16:48:17', '2023-03-29 16:48:17');
INSERT INTO `tbl_supplier_payment` VALUES ('291', 'SP-20230329104844', 'H', '6', '33869', '2023-03-29', '4', '2023-03-29', '', 'F', '1', '0', '2023-03-29 16:49:06', '2023-03-29 16:49:06');
INSERT INTO `tbl_supplier_payment` VALUES ('292', 'SP-20230329104923', 'H', '6', '33868', '2023-03-29', '4', '2023-03-29', '', 'F', '1', '0', '2023-03-29 16:49:45', '2023-03-29 16:49:45');
INSERT INTO `tbl_supplier_payment` VALUES ('294', 'SP-20230401114536', 'H', '2', '9000360', '2023-05-01', '42', '2023-04-01', '', 'F', '1', '0', '2023-04-01 17:46:24', '2023-04-01 17:46:24');

CREATE TABLE `tbl_supplier_payment_details` (
  `spd_id` int(11) NOT NULL AUTO_INCREMENT,
  `sp_id` int(11) NOT NULL,
  `ref_id` int(11) NOT NULL,
  `type` varchar(2) NOT NULL COMMENT 'BB, PO',
  `amount` decimal(12,2) NOT NULL,
  PRIMARY KEY (`spd_id`)
) ENGINE=InnoDB AUTO_INCREMENT=314 DEFAULT CHARSET=latin1;
INSERT INTO `tbl_supplier_payment_details` VALUES ('1', '1', '1', 'PO', '52500.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('2', '2', '3', 'PO', '53800.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('3', '3', '4', 'PO', '66000.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('4', '4', '5', 'PO', '121200.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('5', '5', '7', 'PO', '487500.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('6', '6', '8', 'PO', '80250.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('7', '7', '10', 'PO', '39600.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('8', '8', '11', 'PO', '42000.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('9', '9', '12', 'PO', '23895.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('10', '10', '13', 'PO', '29380.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('11', '11', '6', 'PO', '258000.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('12', '12', '14', 'PO', '45600.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('14', '13', '16', 'PO', '248260.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('15', '14', '15', 'PO', '25000.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('16', '15', '17', 'PO', '27400.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('17', '16', '18', 'PO', '18480.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('18', '17', '19', 'PO', '256800.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('19', '18', '20', 'PO', '8100.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('20', '19', '21', 'PO', '121200.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('21', '20', '22', 'PO', '88300.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('22', '21', '26', 'PO', '36450.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('23', '22', '25', 'PO', '255600.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('24', '23', '28', 'PO', '42210.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('25', '24', '29', 'PO', '40500.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('26', '25', '33', 'PO', '26400.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('27', '26', '35', 'PO', '16365.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('28', '27', '34', 'PO', '50300.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('29', '28', '172', 'BB', '42380.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('30', '29', '9', 'PO', '309500.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('31', '30', '37', 'PO', '528200.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('32', '31', '38', 'PO', '222000.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('33', '32', '36', 'PO', '63360.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('34', '33', '31', 'PO', '255600.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('35', '34', '44', 'PO', '150000.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('36', '34', '43', 'PO', '39000.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('37', '35', '45', 'PO', '105450.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('38', '36', '42', 'PO', '126720.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('39', '37', '41', 'PO', '173750.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('40', '38', '40', 'PO', '84000.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('41', '39', '32', 'PO', '226000.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('42', '40', '2', 'PO', '240000.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('43', '41', '48', 'PO', '42000.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('44', '42', '54', 'PO', '259600.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('45', '43', '51', 'PO', '44500.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('46', '44', '52', 'PO', '1305.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('47', '45', '53', 'PO', '50455.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('48', '46', '55', 'PO', '13104.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('49', '47', '56', 'PO', '230000.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('50', '48', '49', 'PO', '78000.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('51', '49', '50', 'PO', '156900.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('52', '50', '46', 'PO', '94900.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('53', '51', '58', 'PO', '88640.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('54', '52', '60', 'PO', '70200.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('55', '53', '61', 'PO', '33090.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('56', '54', '59', 'PO', '33970.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('57', '55', '65', 'PO', '256800.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('58', '56', '62', 'PO', '88200.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('59', '57', '66', 'PO', '183600.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('60', '58', '67', 'PO', '227500.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('61', '59', '70', 'PO', '63360.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('62', '60', '63', 'PO', '73415.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('63', '61', '71', 'PO', '120600.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('64', '62', '72', 'PO', '44565.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('65', '63', '68', 'PO', '336000.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('66', '64', '75', 'PO', '383025.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('67', '65', '79', 'PO', '223700.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('69', '66', '77', 'PO', '70500.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('70', '67', '86', 'PO', '262410.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('71', '68', '87', 'PO', '82380.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('72', '69', '88', 'PO', '58625.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('73', '70', '85', 'PO', '37820.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('74', '71', '91', 'PO', '78000.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('75', '72', '90', 'PO', '88200.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('76', '73', '94', 'PO', '38800.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('77', '74', '93', 'PO', '249350.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('78', '75', '114', 'PO', '163500.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('79', '76', '113', 'PO', '264240.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('80', '77', '92', 'PO', '156750.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('81', '78', '116', 'PO', '68850.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('82', '79', '117', 'PO', '15600.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('83', '80', '115', 'PO', '154900.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('84', '81', '47', 'PO', '832500.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('85', '82', '97', 'PO', '486500.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('86', '83', '112', 'PO', '102000.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('87', '84', '98', 'PO', '267500.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('88', '85', '89', 'PO', '240000.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('89', '86', '89', 'PO', '437550.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('90', '87', '120', 'PO', '202000.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('91', '88', '111', 'PO', '12360.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('92', '89', '109', 'PO', '78000.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('93', '90', '110', 'PO', '271200.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('94', '91', '119', 'PO', '45000.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('95', '92', '121', 'PO', '243580.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('96', '93', '106', 'PO', '258500.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('97', '93', '101', 'PO', '75000.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('98', '93', '102', 'PO', '117500.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('99', '94', '100', 'PO', '114000.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('100', '94', '103', 'PO', '28320.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('101', '94', '105', 'PO', '60430.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('102', '94', '104', 'PO', '241800.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('103', '95', '131', 'PO', '114000.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('104', '96', '132', 'PO', '58500.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('105', '97', '134', 'PO', '16230.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('106', '98', '133', 'PO', '229800.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('107', '99', '136', 'PO', '4035.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('108', '100', '137', 'PO', '61860.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('109', '101', '122', 'PO', '240000.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('110', '102', '138', 'PO', '64000.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('111', '103', '123', 'PO', '63360.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('112', '104', '124', 'PO', '275000.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('113', '105', '125', 'PO', '126700.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('114', '106', '127', 'PO', '170400.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('115', '107', '129', 'PO', '362660.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('116', '108', '130', 'PO', '38400.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('117', '109', '144', 'PO', '481250.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('118', '110', '142', 'PO', '240000.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('119', '111', '143', 'PO', '500000.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('120', '112', '147', 'PO', '38640.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('121', '113', '145', 'PO', '30890.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('122', '114', '150', 'PO', '147000.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('123', '115', '151', 'PO', '111600.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('124', '116', '148', 'PO', '440000.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('125', '117', '149', 'PO', '133320.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('126', '118', '154', 'PO', '194175.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('127', '119', '153', 'PO', '226800.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('128', '120', '152', 'PO', '235800.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('129', '121', '157', 'PO', '256450.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('130', '122', '165', 'PO', '214400.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('131', '123', '160', 'PO', '41400.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('132', '124', '164', 'PO', '4680.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('133', '125', '161', 'PO', '252075.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('134', '126', '163', 'PO', '37400.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('135', '127', '156', 'PO', '395640.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('136', '129', '166', 'PO', '257475.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('137', '130', '162', 'PO', '48000.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('138', '131', '162', 'PO', '45000.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('139', '133', '155', 'PO', '134890.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('140', '133', '158', 'PO', '19200.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('141', '134', '174', 'PO', '254400.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('142', '135', '178', 'PO', '190800.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('143', '136', '185', 'PO', '180000.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('144', '137', '180', 'PO', '325200.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('145', '138', '173', 'PO', '189200.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('146', '139', '167', 'PO', '232800.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('147', '140', '181', 'PO', '257960.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('148', '141', '170', 'PO', '240000.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('149', '142', '187', 'PO', '19660.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('150', '142', '186', 'PO', '3900.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('151', '143', '207', 'PO', '96000.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('152', '144', '201', 'PO', '187000.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('153', '145', '199', 'PO', '241800.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('154', '146', '206', 'PO', '222400.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('155', '147', '203', 'PO', '165600.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('156', '148', '202', 'PO', '77400.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('157', '149', '205', 'PO', '219490.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('158', '150', '204', 'PO', '53000.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('159', '151', '193', 'PO', '76500.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('160', '152', '194', 'PO', '39000.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('161', '153', '196', 'PO', '300000.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('162', '154', '195', 'PO', '62400.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('163', '155', '191', 'PO', '163500.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('164', '156', '177', 'PO', '153000.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('165', '157', '176', 'PO', '80480.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('166', '158', '197', 'PO', '30000.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('167', '159', '135', 'PO', '1455.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('168', '160', '192', 'PO', '147000.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('169', '161', '189', 'PO', '57900.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('170', '162', '168', 'PO', '914400.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('171', '162', '171', 'PO', '16000.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('172', '163', '175', 'PO', '40000.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('173', '163', '179', 'PO', '416200.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('174', '164', '184', 'PO', '201140.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('175', '165', '188', 'PO', '165600.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('176', '166', '82', 'PO', '99140.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('177', '166', '96', 'PO', '20640.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('178', '166', '107', 'PO', '51480.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('179', '166', '128', 'PO', '46500.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('180', '166', '200', 'PO', '294000.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('181', '167', '209', 'PO', '118000.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('182', '168', '218', 'PO', '48000.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('183', '169', '216', 'PO', '316800.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('184', '170', '217', 'PO', '47640.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('185', '171', '213', 'PO', '63360.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('186', '172', '215', 'PO', '225600.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('187', '173', '219', 'PO', '151500.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('188', '174', '221', 'PO', '61270.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('189', '175', '222', 'PO', '147000.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('190', '176', '223', 'PO', '755000.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('191', '177', '224', 'PO', '32400.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('192', '178', '227', 'PO', '52000.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('193', '179', '226', 'PO', '120000.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('194', '180', '141', 'PO', '481250.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('195', '181', '210', 'PO', '480500.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('196', '182', '211', 'PO', '78000.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('197', '184', '212', 'PO', '500000.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('198', '185', '212', 'PO', '303900.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('199', '186', '220', 'PO', '237600.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('200', '187', '235', 'PO', '252500.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('201', '188', '238', 'PO', '148200.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('202', '189', '237', 'PO', '849350.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('203', '190', '239', 'PO', '233220.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('204', '191', '240', 'PO', '225600.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('205', '192', '233', 'PO', '96000.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('206', '193', '229', 'PO', '88920.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('207', '194', '232', 'PO', '669000.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('208', '195', '249', 'PO', '1016250.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('209', '196', '234', 'PO', '481500.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('210', '197', '250', 'PO', '216000.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('211', '197', '252', 'PO', '23940.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('212', '197', '251', 'PO', '56100.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('213', '198', '253', 'PO', '46920.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('214', '198', '241', 'PO', '9300.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('215', '199', '245', 'PO', '224400.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('216', '200', '243', 'PO', '28400.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('217', '201', '247', 'PO', '151500.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('218', '202', '246', 'PO', '67500.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('219', '203', '248', 'PO', '10950.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('220', '204', '254', 'PO', '72000.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('221', '205', '267', 'PO', '62300.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('222', '206', '268', 'PO', '170000.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('223', '207', '265', 'PO', '256000.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('224', '207', '266', 'PO', '65835.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('225', '208', '261', 'PO', '139000.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('226', '209', '231', 'PO', '14280.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('227', '210', '264', 'PO', '103500.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('228', '211', '269', 'PO', '63000.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('229', '213', '230', 'PO', '8190.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('230', '214', '270', 'PO', '223200.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('231', '215', '257', 'PO', '51000.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('232', '217', '260', 'PO', '150000.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('233', '217', '255', 'PO', '55220.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('234', '218', '228', 'PO', '48260.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('235', '222', '214', 'PO', '126720.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('236', '223', '242', 'PO', '160200.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('237', '224', '273', 'PO', '747075.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('238', '225', '274', 'PO', '154800.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('239', '226', '272', 'PO', '19800.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('240', '227', '278', 'PO', '77700.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('241', '228', '280', 'PO', '135000.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('242', '229', '279', 'PO', '302784.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('243', '230', '281', 'PO', '262500.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('244', '231', '277', 'PO', '157500.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('245', '232', '275', 'PO', '216000.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('246', '233', '271', 'PO', '216000.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('247', '234', '244', 'PO', '216000.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('248', '235', '258', 'PO', '144000.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('249', '236', '259', 'PO', '104000.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('250', '237', '282', 'PO', '188000.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('251', '238', '295', 'PO', '21750.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('252', '239', '294', 'PO', '227200.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('253', '240', '293', 'PO', '1051725.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('254', '241', '298', 'PO', '30300.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('255', '242', '336', 'PO', '102200.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('256', '243', '337', 'PO', '5880.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('257', '244', '335', 'PO', '3600.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('258', '245', '342', 'PO', '153600.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('259', '246', '345', 'PO', '18090.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('260', '247', '344', 'PO', '531000.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('261', '248', '351', 'PO', '222000.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('262', '249', '354', 'PO', '30408.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('263', '250', '355', 'PO', '30408.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('264', '251', '359', 'PO', '1120600.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('265', '252', '360', 'PO', '61200.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('266', '253', '370', 'PO', '324000.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('267', '254', '371', 'PO', '96600.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('268', '255', '372', 'PO', '315000.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('269', '256', '376', 'PO', '875000.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('270', '257', '366', 'PO', '41890.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('271', '258', '365', 'PO', '9130.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('272', '259', '364', 'PO', '104000.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('273', '260', '350', 'PO', '47580.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('274', '261', '349', 'PO', '86000.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('275', '262', '310', 'PO', '180000.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('276', '263', '311', 'PO', '225000.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('277', '264', '284', 'PO', '223200.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('278', '265', '286', 'PO', '16265.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('279', '266', '297', 'PO', '223800.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('280', '267', '375', 'PO', '444000.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('281', '268', '304', 'PO', '96000.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('282', '269', '314', 'PO', '966000.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('283', '270', '315', 'PO', '7200.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('284', '271', '316', 'PO', '3330.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('286', '272', '317', 'PO', '84000.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('287', '273', '320', 'PO', '6390.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('288', '274', '292', 'PO', '35100.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('289', '274', '299', 'PO', '61950.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('290', '274', '309', 'PO', '224200.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('291', '274', '326', 'PO', '71820.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('292', '274', '327', 'PO', '17850.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('293', '274', '329', 'PO', '6800.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('294', '274', '339', 'PO', '17400.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('295', '274', '377', 'PO', '17750.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('296', '275', '379', 'PO', '462500.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('297', '276', '378', 'PO', '138000.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('298', '277', '368', 'PO', '462500.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('299', '278', '367', 'PO', '92000.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('300', '279', '353', 'PO', '92000.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('301', '281', '410', 'PO', '8400.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('302', '282', '412', 'PO', '77100.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('303', '283', '411', 'PO', '522000.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('304', '284', '453', 'PO', '427750.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('305', '285', '446', 'PO', '243750.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('306', '286', '447', 'PO', '447500.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('307', '287', '431', 'PO', '462500.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('308', '288', '394', 'PO', '462500.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('309', '289', '382', 'PO', '76800.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('310', '290', '443', 'PO', '165000.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('311', '291', '414', 'PO', '651000.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('312', '292', '415', 'PO', '277500.00');
INSERT INTO `tbl_supplier_payment_details` VALUES ('313', '294', '467', 'PO', '367200.00');

CREATE TABLE `tbl_suppliers` (
  `supplier_id` int(11) NOT NULL AUTO_INCREMENT,
  `supplier_name` varchar(100) NOT NULL,
  `supplier_address` varchar(255) NOT NULL,
  `contact_number` varchar(15) NOT NULL,
  `remarks` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_last_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`supplier_id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=latin1;
INSERT INTO `tbl_suppliers` VALUES ('1', 'GoodFarms Trading Corporation', 'Wao', '09366048342', 'Manager- Raquel', '2022-11-15 11:35:18', '2022-11-16 07:45:25');
INSERT INTO `tbl_suppliers` VALUES ('2', 'FMN', 'Wao', '09173035452', 'Manager- Ritchell', '2022-11-16 07:42:27', '2022-11-16 07:45:13');
INSERT INTO `tbl_suppliers` VALUES ('3', 'Abigail Farm Supply, Inc.', 'Davao', '.', '', '2022-11-16 07:43:39', '2022-11-16 07:43:39');
INSERT INTO `tbl_suppliers` VALUES ('4', 'De Oro Maramag Agricultural Supply, Inc.', 'Valencia', '09171202239', 'contact person- Ricky Dudas', '2022-11-16 07:45:00', '2022-11-16 07:45:00');
INSERT INTO `tbl_suppliers` VALUES ('5', 'Felix Penuliar', 'Wadya', '09462945052', '', '2022-11-16 07:46:00', '2022-11-16 07:46:00');
INSERT INTO `tbl_suppliers` VALUES ('6', 'Vinz Hardware', 'Banisilan', '.', '', '2022-11-16 08:22:01', '2022-11-16 08:22:01');
INSERT INTO `tbl_suppliers` VALUES ('7', 'Sari Sari Store', 'Banisilan', '.', '', '2022-11-16 08:22:20', '2022-11-16 08:22:20');
INSERT INTO `tbl_suppliers` VALUES ('8', 'Evo Gene Seeds Corporation', 'Gen Santos', '.', '.
', '2022-11-17 16:40:02', '2022-11-17 16:40:02');
INSERT INTO `tbl_suppliers` VALUES ('9', 'Juan IT Solutions POS', 'Bacolod City', '.', '.', '2022-11-17 17:48:59', '2022-11-17 17:48:59');
INSERT INTO `tbl_suppliers` VALUES ('10', 'Smart Communication', '.', '.', '.', '2022-11-18 06:23:09', '2022-11-18 06:23:09');
INSERT INTO `tbl_suppliers` VALUES ('11', 'Globe Telecom', '.', '.', '.', '2022-11-18 06:23:22', '2022-11-18 06:23:22');
INSERT INTO `tbl_suppliers` VALUES ('12', 'Petron ', '.', '.', '.', '2022-11-18 06:28:01', '2022-11-18 06:28:01');
INSERT INTO `tbl_suppliers` VALUES ('13', 'Security Bank', 'Manila', '012', '', '2022-11-18 06:30:47', '2022-11-18 06:30:47');
INSERT INTO `tbl_suppliers` VALUES ('14', 'Roy Gasoline Station', 'Wao', '0', '', '2022-11-18 06:31:04', '2022-11-18 06:31:04');
INSERT INTO `tbl_suppliers` VALUES ('15', 'BPI', 'Manila', '0', '', '2022-11-18 06:32:53', '2022-11-18 06:32:53');
INSERT INTO `tbl_suppliers` VALUES ('16', 'Coop', '0', '0', '', '2022-11-18 06:33:04', '2022-11-18 06:33:04');
INSERT INTO `tbl_suppliers` VALUES ('17', 'QL Labor', '.', '.', '.', '2022-11-18 10:45:12', '2022-11-18 10:45:12');
INSERT INTO `tbl_suppliers` VALUES ('18', 'Treasurer office', 'Banisilan', '.', '.', '2022-11-23 06:42:34', '2022-11-23 06:42:34');
INSERT INTO `tbl_suppliers` VALUES ('19', 'Nicanor Polon', '.', '.', '.', '2022-11-24 18:12:14', '2022-11-24 18:12:14');
INSERT INTO `tbl_suppliers` VALUES ('20', 'Walk in', '.', '.', '.', '2022-11-25 16:13:04', '2022-11-25 16:13:04');
INSERT INTO `tbl_suppliers` VALUES ('21', 'Jomer', 'Don carlos', '.', '.', '2022-11-29 05:54:26', '2022-11-29 05:54:26');
INSERT INTO `tbl_suppliers` VALUES ('22', 'ABCRIS FERTILIZERS TRADING', 'DAVAO', '09265482686', '1', '2022-12-15 11:57:11', '2022-12-15 11:57:11');
INSERT INTO `tbl_suppliers` VALUES ('23', 'RCBC', '.', '.', '.', '2022-12-18 06:41:40', '2022-12-18 06:41:40');
INSERT INTO `tbl_suppliers` VALUES ('24', '1st Valley', '.', '.', '.', '2022-12-18 06:41:52', '2022-12-18 06:41:52');
INSERT INTO `tbl_suppliers` VALUES ('25', 'Eastwest Bank', '.', '.', '.', '2022-12-18 06:42:20', '2022-12-18 06:42:20');
INSERT INTO `tbl_suppliers` VALUES ('26', 'COTELCO', 'Banisilan', '.', '.', '2022-12-31 06:27:36', '2022-12-31 06:27:36');
INSERT INTO `tbl_suppliers` VALUES ('27', 'Albert Gicole', 'Wao', '.', '.', '2023-01-04 15:40:54', '2023-01-04 15:40:54');
INSERT INTO `tbl_suppliers` VALUES ('28', 'Brend Radio', 'Banisilan', '.', '.', '2023-01-06 08:35:26', '2023-01-06 08:35:26');
INSERT INTO `tbl_suppliers` VALUES ('29', 'Radio Kastigo', 'Banisilan', '.', '.', '2023-01-06 08:35:46', '2023-01-06 08:35:46');
INSERT INTO `tbl_suppliers` VALUES ('30', 'Best Season Agri-Venture Corporation', 'Davao', '.', '.', '2023-01-11 13:00:46', '2023-01-11 13:00:46');
INSERT INTO `tbl_suppliers` VALUES ('31', 'Geds Enterprises', '.', '.', '.', '2023-01-11 16:07:58', '2023-01-11 16:07:58');
INSERT INTO `tbl_suppliers` VALUES ('32', 'Melita Galendez', 'Cagayan', '.', '.', '2023-01-18 13:18:12', '2023-01-18 13:18:12');
INSERT INTO `tbl_suppliers` VALUES ('33', 'Francis Farm Supply', 'Matalam, Cotabator', '.', '.', '2023-02-02 14:12:34', '2023-02-02 14:12:34');
INSERT INTO `tbl_suppliers` VALUES ('34', 'AVC Agricultural Supply', 'Valencia', '.', '.', '2023-02-02 14:13:05', '2023-02-02 14:13:05');
INSERT INTO `tbl_suppliers` VALUES ('35', 'PMC Enterprises', '0', '0', '0', '2023-02-18 16:32:42', '2023-02-18 16:32:42');
INSERT INTO `tbl_suppliers` VALUES ('36', 'NAC ENTERPRISES', 'Valencia', '.', '.', '2023-02-20 16:16:32', '2023-02-20 16:16:32');
INSERT INTO `tbl_suppliers` VALUES ('37', 'Norther Prime Trading Corporation', '.', '.', '', '2023-02-28 07:13:16', '2023-02-28 07:13:16');
INSERT INTO `tbl_suppliers` VALUES ('38', 'Bulls Agri Supply', 'Valencia', '.', '', '2023-03-08 14:24:26', '2023-03-08 14:24:26');
INSERT INTO `tbl_suppliers` VALUES ('39', 'BIR', 'Banisilan', '.', '', '2023-03-10 17:32:02', '2023-03-10 17:32:02');
INSERT INTO `tbl_suppliers` VALUES ('40', 'FKA Agri Chemical Corporation', '.', '.', '.', '2023-03-22 14:08:40', '2023-03-22 14:08:40');
INSERT INTO `tbl_suppliers` VALUES ('41', 'Wagas Farm', '.', '.', '', '2023-03-30 13:05:00', '2023-03-30 13:05:00');
INSERT INTO `tbl_suppliers` VALUES ('42', 'Jomar Malijana', '.', '.', '', '2023-04-01 17:01:52', '2023-04-01 17:01:52');
INSERT INTO `tbl_suppliers` VALUES ('43', 'Felina Apura', '.', '.', '.', '2023-04-02 17:30:54', '2023-04-02 17:30:54');
INSERT INTO `tbl_suppliers` VALUES ('44', 'Michael Jay Gresones', '.', '.', '', '2023-04-21 11:20:02', '2023-04-21 11:20:02');
INSERT INTO `tbl_suppliers` VALUES ('45', 'Lumawag Trucking Services', 'Banisilan', '.', '.', '2023-06-01 19:28:40', '2023-06-01 19:28:40');
INSERT INTO `tbl_suppliers` VALUES ('46', 'Christine Jane Quiamco', '.', '.', '.', '2023-06-06 18:13:10', '2023-06-06 18:13:10');
INSERT INTO `tbl_suppliers` VALUES ('47', 'Advanta', '.', '.', '', '2023-06-20 17:36:49', '2023-06-20 17:36:49');
INSERT INTO `tbl_suppliers` VALUES ('48', 'JH Rice & Corn Trading', 'Maramag', '.', '.', '2023-06-27 07:30:45', '2023-06-27 07:30:45');
INSERT INTO `tbl_suppliers` VALUES ('49', 'Macaya Hardware', '.', '.', '.', '2023-07-05 19:54:46', '2023-07-05 19:54:46');
INSERT INTO `tbl_suppliers` VALUES ('50', 'Wao Hardware', '.', '.', '.', '2023-07-05 19:54:59', '2023-07-05 19:54:59');
INSERT INTO `tbl_suppliers` VALUES ('51', 'Great Harvest Gen Merchandis', '.', '.', '.', '2023-07-06 11:11:58', '2023-07-06 11:11:58');
INSERT INTO `tbl_suppliers` VALUES ('52', 'RJR Agro Industrial Enterprises', '.', '.', '', '2023-07-10 11:39:16', '2023-07-10 11:39:16');
INSERT INTO `tbl_suppliers` VALUES ('53', 'HBO Ventures, Inc', '.', '.', '', '2023-07-10 12:15:19', '2023-07-10 12:15:19');
INSERT INTO `tbl_suppliers` VALUES ('54', 'Ana Victoria Baral', '.', '.', '.', '2023-07-14 13:27:20', '2023-07-14 13:27:20');
INSERT INTO `tbl_suppliers` VALUES ('55', 'MDK gen Merchandise', 'Wao', '.', '.', '2023-07-17 15:45:11', '2023-07-17 15:45:11');
INSERT INTO `tbl_suppliers` VALUES ('56', 'Vigour Seeds', '.', '.', '.', '2023-07-26 06:19:02', '2023-07-26 06:19:02');
INSERT INTO `tbl_suppliers` VALUES ('57', 'Excellence Poultry & Livestocks Specialist inc', '.', '.', '.', '2023-07-26 07:48:09', '2023-07-26 07:48:09');
INSERT INTO `tbl_suppliers` VALUES ('58', 'GenSan Planters Supply', '.', '.', '', '2023-08-02 10:17:53', '2023-08-02 10:17:53');
INSERT INTO `tbl_suppliers` VALUES ('59', 'Vast Agro Soluttions, Inc', '.', '.', '.', '2023-08-27 13:31:21', '2023-08-27 13:31:21');
INSERT INTO `tbl_suppliers` VALUES ('60', 'CGA Farm Products', '.', '.', '.', '2023-09-06 17:32:20', '2023-09-06 17:32:20');
INSERT INTO `tbl_suppliers` VALUES ('61', 'Charina Adame', '.', '.', '.', '2023-09-08 09:59:25', '2023-09-08 09:59:25');
INSERT INTO `tbl_suppliers` VALUES ('62', 'Christie Milan  Chavez', '.', '.', '.', '2023-09-10 07:25:09', '2023-09-10 07:25:09');
INSERT INTO `tbl_suppliers` VALUES ('63', 'Tagchem Dragon Distribution, Inc', '.', '.', '', '2023-10-01 07:47:38', '2023-10-01 07:47:38');
INSERT INTO `tbl_suppliers` VALUES ('64', 'HKP', 'Wao', '.....', '...', '2023-10-01 14:19:53', '2023-10-01 14:19:53');
INSERT INTO `tbl_suppliers` VALUES ('65', 'Charlz Commercial', 'Kalilangan', '.', '.', '2023-10-01 14:21:42', '2023-10-01 14:21:42');
INSERT INTO `tbl_suppliers` VALUES ('66', 'Agropro Agrotech Agri-Products Corp', '.', '.', '.', '2023-10-05 10:51:07', '2023-10-05 10:51:07');
INSERT INTO `tbl_suppliers` VALUES ('67', 'Lorna Pablico', '.', '.', '.', '2023-10-18 14:41:01', '2023-10-18 14:41:01');
INSERT INTO `tbl_suppliers` VALUES ('68', 'Angel Grace Agricultural Supplies Trading', '.', '.', '.', '2023-11-10 11:00:49', '2023-11-10 11:00:49');
INSERT INTO `tbl_suppliers` VALUES ('69', 'Lawrence Aligasin', '.', '.', '.', '2024-01-09 20:02:42', '2024-01-09 20:02:42');
INSERT INTO `tbl_suppliers` VALUES ('70', 'Mike Bayangan', 'Banisilan', '.', '.', '2024-01-20 12:41:11', '2024-01-20 12:41:11');
INSERT INTO `tbl_suppliers` VALUES ('71', 'Vinz Fuels', '.', '.', '.', '2024-01-20 12:43:31', '2024-01-20 12:43:31');
INSERT INTO `tbl_suppliers` VALUES ('72', 'Jam Agrivet Supply', 'Don Carlos', '09753565735', '.', '2024-01-22 07:00:04', '2024-01-22 07:00:04');
INSERT INTO `tbl_suppliers` VALUES ('73', 'Roel Baral', '...', '...', '...', '2024-01-24 18:53:58', '2024-01-24 18:53:58');
INSERT INTO `tbl_suppliers` VALUES ('74', 'Lawrence Alegasin', 'Pob 1', '.', '.', '2024-01-28 20:27:27', '2024-01-28 20:27:27');
INSERT INTO `tbl_suppliers` VALUES ('75', 'QL Store 1', 'Banisilan', '0', '', '2024-02-03 10:14:40', '2024-02-03 10:14:40');
INSERT INTO `tbl_suppliers` VALUES ('76', 'QL Agri Supply- Main', 'Pob 2', '.', '.', '2024-02-03 15:35:52', '2024-02-03 15:35:52');

CREATE TABLE `tbl_user_privileges` (
  `privilege_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `url` varchar(50) NOT NULL,
  `status` int(1) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_last_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`privilege_id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=latin1;
INSERT INTO `tbl_user_privileges` VALUES ('1', '9', 'stock-withdrawal', '1', '2023-06-09 06:20:18', '0000-00-00 00:00:00');
INSERT INTO `tbl_user_privileges` VALUES ('2', '10', 'stock-withdrawal', '1', '2023-06-09 06:21:45', '0000-00-00 00:00:00');
INSERT INTO `tbl_user_privileges` VALUES ('3', '10', 'product-conversion', '1', '2023-06-09 06:21:45', '0000-00-00 00:00:00');
INSERT INTO `tbl_user_privileges` VALUES ('4', '10', 'inventory-report', '1', '2023-06-09 06:21:45', '0000-00-00 00:00:00');
INSERT INTO `tbl_user_privileges` VALUES ('5', '10', 'stock-card', '1', '2023-06-09 06:21:45', '0000-00-00 00:00:00');
INSERT INTO `tbl_user_privileges` VALUES ('6', '21', 'beginning-balance', '1', '2024-02-04 05:54:44', '2024-02-04 05:54:55');
INSERT INTO `tbl_user_privileges` VALUES ('7', '21', 'product-categories', '1', '2024-02-04 05:54:44', '2024-02-04 05:54:55');
INSERT INTO `tbl_user_privileges` VALUES ('8', '21', 'products', '1', '2024-02-04 05:54:44', '2024-02-04 05:54:55');
INSERT INTO `tbl_user_privileges` VALUES ('9', '21', 'product-price', '1', '2024-02-04 05:54:44', '2024-02-04 05:54:55');
INSERT INTO `tbl_user_privileges` VALUES ('10', '21', 'banks', '1', '2024-02-04 05:54:44', '2024-02-04 05:54:55');
INSERT INTO `tbl_user_privileges` VALUES ('11', '21', 'customers', '1', '2024-02-04 05:54:44', '2024-02-04 05:54:55');
INSERT INTO `tbl_user_privileges` VALUES ('12', '21', 'suppliers', '1', '2024-02-04 05:54:44', '2024-02-04 05:54:55');
INSERT INTO `tbl_user_privileges` VALUES ('13', '21', 'discounts', '1', '2024-02-04 05:54:44', '2024-02-04 05:54:55');
INSERT INTO `tbl_user_privileges` VALUES ('14', '21', 'payment-option', '1', '2024-02-04 05:54:44', '2024-02-04 05:54:55');
INSERT INTO `tbl_user_privileges` VALUES ('15', '21', 'formulation', '1', '2024-02-04 05:54:44', '2024-02-04 05:54:55');
INSERT INTO `tbl_user_privileges` VALUES ('16', '21', 'credit-memo', '1', '2024-02-04 05:54:44', '2024-02-04 05:54:55');
INSERT INTO `tbl_user_privileges` VALUES ('17', '21', 'debit-memo', '1', '2024-02-04 05:54:44', '2024-02-04 05:54:55');
INSERT INTO `tbl_user_privileges` VALUES ('18', '21', 'purchase-order', '1', '2024-02-04 05:54:44', '2024-02-04 05:54:55');
INSERT INTO `tbl_user_privileges` VALUES ('19', '21', 'purchase-return', '1', '2024-02-04 05:54:44', '2024-02-04 05:54:55');
INSERT INTO `tbl_user_privileges` VALUES ('20', '21', 'sales', '1', '2024-02-04 05:54:44', '2024-02-04 05:54:55');
INSERT INTO `tbl_user_privileges` VALUES ('21', '21', 'sales-return', '1', '2024-02-04 05:54:44', '2024-02-04 05:54:55');
INSERT INTO `tbl_user_privileges` VALUES ('22', '21', 'stock-withdrawal', '1', '2024-02-04 05:54:44', '2024-02-04 05:54:55');
INSERT INTO `tbl_user_privileges` VALUES ('23', '21', 'customer-payment', '1', '2024-02-04 05:54:44', '2024-02-04 05:54:55');
INSERT INTO `tbl_user_privileges` VALUES ('24', '21', 'supplier-payment', '1', '2024-02-04 05:54:44', '2024-02-04 05:54:55');
INSERT INTO `tbl_user_privileges` VALUES ('25', '21', 'expense', '1', '2024-02-04 05:54:44', '2024-02-04 05:54:55');
INSERT INTO `tbl_user_privileges` VALUES ('26', '21', 'expense-category', '1', '2024-02-04 05:54:44', '2024-02-04 05:54:55');
INSERT INTO `tbl_user_privileges` VALUES ('27', '21', 'job-order', '1', '2024-02-04 05:54:44', '2024-02-04 05:54:55');
INSERT INTO `tbl_user_privileges` VALUES ('28', '21', 'product-conversion', '1', '2024-02-04 05:54:44', '2024-02-04 05:54:55');
INSERT INTO `tbl_user_privileges` VALUES ('29', '21', 'inventory-adjustment', '1', '2024-02-04 05:54:44', '2024-02-04 05:54:55');
INSERT INTO `tbl_user_privileges` VALUES ('30', '21', 'deposit', '1', '2024-02-04 05:54:44', '2024-02-04 05:54:55');
INSERT INTO `tbl_user_privileges` VALUES ('31', '21', 'bank-ledger', '1', '2024-02-04 05:54:44', '2024-02-04 05:54:55');
INSERT INTO `tbl_user_privileges` VALUES ('32', '21', 'customer-soa', '1', '2024-02-04 05:54:44', '2024-02-04 05:54:55');
INSERT INTO `tbl_user_privileges` VALUES ('33', '21', 'expense-report', '1', '2024-02-04 05:54:44', '2024-02-04 05:54:55');
INSERT INTO `tbl_user_privileges` VALUES ('34', '21', 'bankdue-report', '1', '2024-02-04 05:54:44', '2024-02-04 05:54:55');
INSERT INTO `tbl_user_privileges` VALUES ('35', '21', 'payable-aging', '1', '2024-02-04 05:54:44', '2024-02-04 05:54:55');
INSERT INTO `tbl_user_privileges` VALUES ('36', '21', 'payable-ledger', '1', '2024-02-04 05:54:44', '2024-02-04 05:54:55');
INSERT INTO `tbl_user_privileges` VALUES ('37', '21', 'payable-report', '1', '2024-02-04 05:54:44', '2024-02-04 05:54:55');
INSERT INTO `tbl_user_privileges` VALUES ('38', '21', 'price-list', '1', '2024-02-04 05:54:44', '2024-02-04 05:54:55');
INSERT INTO `tbl_user_privileges` VALUES ('39', '21', 'purchase-report', '1', '2024-02-04 05:54:44', '2024-02-04 05:54:55');
INSERT INTO `tbl_user_privileges` VALUES ('40', '21', 'receivable-aging', '1', '2024-02-04 05:54:44', '2024-02-04 05:54:55');
INSERT INTO `tbl_user_privileges` VALUES ('41', '21', 'receivable-ledger', '1', '2024-02-04 05:54:44', '2024-02-04 05:54:55');
INSERT INTO `tbl_user_privileges` VALUES ('42', '21', 'receivable-report', '1', '2024-02-04 05:54:44', '2024-02-04 05:54:55');
INSERT INTO `tbl_user_privileges` VALUES ('43', '21', 'sales-report', '1', '2024-02-04 05:54:44', '2024-02-04 05:54:55');
INSERT INTO `tbl_user_privileges` VALUES ('44', '21', 'stock-releasal', '1', '2024-02-04 05:54:44', '2024-02-04 05:54:55');
INSERT INTO `tbl_user_privileges` VALUES ('45', '21', 'inventory-report', '1', '2024-02-04 05:54:44', '2024-02-04 05:54:55');
INSERT INTO `tbl_user_privileges` VALUES ('46', '21', 'stock-card', '1', '2024-02-04 05:54:44', '2024-02-04 05:54:55');
INSERT INTO `tbl_user_privileges` VALUES ('47', '21', 'income-statement', '1', '2024-02-04 05:54:44', '2024-02-04 05:54:55');
INSERT INTO `tbl_user_privileges` VALUES ('48', '21', 'statement-of-accounts', '1', '2024-02-04 05:54:44', '2024-02-04 05:54:55');

CREATE TABLE `tbl_users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_fullname` varchar(100) NOT NULL,
  `user_category` varchar(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` text NOT NULL,
  `date_added` datetime NOT NULL,
  `date_last_modified` datetime NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;
INSERT INTO `tbl_users` VALUES ('1', 'Benjie Val Lumawag', 'A', 'admin', '6e746846ad849391755c57db7166827c', '2022-09-27 16:39:33', '2022-09-27 16:39:34');
INSERT INTO `tbl_users` VALUES ('7', 'Benjie', 'C', 'Benjie', '6e746846ad849391755c57db7166827c', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `tbl_users` VALUES ('13', 'christian progella', 'W', 'christian', '46d045ff5190f6ea93739da6c0aa19bc', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `tbl_users` VALUES ('14', 'warehouse', 'W', 'warehouse', '6e746846ad849391755c57db7166827c', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `tbl_users` VALUES ('15', 'Benjie', 'W', 'Benjie01', '6e746846ad849391755c57db7166827c', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `tbl_users` VALUES ('16', 'Hanny Jean Dejaro', 'C', 'Hanny', '09178804165a66be33d207e4137c5fd5', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `tbl_users` VALUES ('19', 'Merry Joy Barotas', 'C', 'Merry Joy', '3f088ebeda03513be71d34d214291986', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `tbl_users` VALUES ('20', 'Warren Dejaro JR', 'W', 'Warren', '814f06ab7f40b2cff77f2c7bdffd3415', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `tbl_users` VALUES ('22', 'john john francisco', 'S', 'john', '6e746846ad849391755c57db7166827c', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

CREATE DEFINER=`root`@`localhost` TRIGGER `add_transaction_in_bb` AFTER INSERT ON `tbl_beginning_balance` FOR EACH ROW IF(NEW.bb_module = 'INV') 
  THEN
    INSERT INTO tbl_product_transactions (product_id,quantity,header_id,module,TYPE,STATUS,cost) VALUES (NEW.bb_ref_id,NEW.bb_qty,NEW.bb_id,'BB','IN', '1', (NEW.bb_amount/NEW.bb_qty));
  END IF;;

CREATE DEFINER=`root`@`localhost` TRIGGER `delete_transaction_bb` AFTER DELETE ON `tbl_beginning_balance` FOR EACH ROW DELETE FROM tbl_product_transactions WHERE header_id = OLD.bb_id AND module = 'BB';;

CREATE DEFINER=`root`@`localhost` TRIGGER `delete_custmer_payment_details` AFTER DELETE ON `tbl_customer_payment` FOR EACH ROW DELETE FROM tbl_customer_payment_details WHERE cp_id = OLD.cp_id;;

CREATE DEFINER=`root`@`localhost` TRIGGER `delete_expenses_details` AFTER DELETE ON `tbl_expense` FOR EACH ROW DELETE FROM tbl_expense_details WHERE expense_id = OLD.expense_id;;

CREATE DEFINER=`root`@`localhost` TRIGGER `delete_formulation_details` AFTER DELETE ON `tbl_formulation` FOR EACH ROW DELETE FROM tbl_formulation_details WHERE formulation_id= OLD.formulation_id;;

CREATE DEFINER=`root`@`localhost` TRIGGER `add_adjustment_detail` AFTER INSERT ON `tbl_inventory_adjustment_details` FOR EACH ROW INSERT INTO tbl_product_transactions (product_id,quantity,cost,price,header_id,detail_id,module,type) VALUES (NEW.product_id,ABS(NEW.quantity),NEW.cost,NEW.price,NEW.adjustment_id,NEW.adjustment_detail_id,'IA',IF(NEW.quantity > 0,'IN','OUT'));;

CREATE DEFINER=`root`@`localhost` TRIGGER `delete_adjustment_detail` AFTER DELETE ON `tbl_inventory_adjustment_details` FOR EACH ROW DELETE FROM tbl_product_transactions WHERE header_id = OLD.adjustment_id AND detail_id = OLD.adjustment_detail_id AND module = 'IA';;

CREATE DEFINER=`root`@`localhost` TRIGGER `finish_adjustment` AFTER UPDATE ON `tbl_inventory_adjustments` FOR EACH ROW UPDATE tbl_product_transactions SET status = IF (NEW.status = 'F', 1, 0) WHERE header_id = NEW.adjustment_id AND module = 'IA';;

CREATE DEFINER=`root`@`localhost` TRIGGER `delete_adjustment` AFTER DELETE ON `tbl_inventory_adjustments` FOR EACH ROW DELETE FROM tbl_inventory_adjustment_details WHERE adjustment_id = OLD.adjustment_id;;

CREATE DEFINER=`root`@`localhost` TRIGGER `add_transaction_out_jo` AFTER INSERT ON `tbl_job_order_details` FOR EACH ROW INSERT INTO tbl_product_transactions (product_id,quantity,cost,price,header_id,detail_id,module,type) VALUES (NEW.product_id,NEW.qty,NEW.cost,NEW.cost,NEW.job_order_id,NEW.jo_detail_id,'JO','OUT');;

CREATE DEFINER=`root`@`localhost` TRIGGER `delete_transaction_jo_details` AFTER DELETE ON `tbl_job_order_details` FOR EACH ROW DELETE FROM tbl_product_transactions WHERE detail_id = OLD.jo_detail_id AND header_id = OLD.job_order_id AND module = 'JO';;

CREATE DEFINER=`root`@`localhost` TRIGGER `add_transaction_in_jo` AFTER INSERT ON `tbl_job_orders` FOR EACH ROW INSERT INTO tbl_product_transactions (product_id,quantity,header_id,module,type) VALUES (NEW.product_id,NEW.no_of_batches,NEW.job_order_id,'JO','IN');;

CREATE DEFINER=`root`@`localhost` TRIGGER `finish_transaction_jo` AFTER UPDATE ON `tbl_job_orders` FOR EACH ROW UPDATE tbl_product_transactions SET status = IF (NEW.status = 'F', 1, 0) WHERE header_id = NEW.job_order_id AND module = 'JO';;

CREATE DEFINER=`root`@`localhost` TRIGGER `delete_job_order_details` AFTER DELETE ON `tbl_job_orders` FOR EACH ROW BEGIN
DELETE FROM tbl_job_order_details WHERE job_order_id = OLD.job_order_id;
DELETE FROM tbl_product_transactions WHERE header_id = OLD.job_order_id AND module = 'JO';
END;;

CREATE DEFINER=`root`@`localhost` TRIGGER `add_conversion_detail` AFTER INSERT ON `tbl_product_conversion_details` FOR EACH ROW BEGIN INSERT INTO tbl_product_transactions (product_id,quantity,cost,price,header_id,detail_id,module,type) VALUES (NEW.original_product_id,NEW.original_qty,NEW.original_cost,NEW.original_price,NEW.conversion_id,NEW.conversion_detail_id,'PC','OUT'); INSERT INTO tbl_product_transactions (product_id,quantity,cost,price,header_id,detail_id,module,type) VALUES (NEW.converted_product_id,NEW.converted_qty,NEW.converted_cost,NEW.converted_price,NEW.conversion_id,NEW.conversion_detail_id,'PC','IN'); END;;

CREATE DEFINER=`root`@`localhost` TRIGGER `delete_conversion_detail` AFTER DELETE ON `tbl_product_conversion_details` FOR EACH ROW DELETE FROM tbl_product_transactions WHERE header_id = OLD.conversion_id AND detail_id = OLD.conversion_detail_id AND module = 'PC';;

CREATE DEFINER=`root`@`localhost` TRIGGER `finish_conversion` AFTER UPDATE ON `tbl_product_conversions` FOR EACH ROW UPDATE tbl_product_transactions SET status = IF (NEW.status = 'F', 1, 0) WHERE header_id = NEW.conversion_id AND module = 'PC';;

CREATE DEFINER=`root`@`localhost` TRIGGER `delete_conversion` AFTER DELETE ON `tbl_product_conversions` FOR EACH ROW DELETE FROM tbl_inventory_adjustment_details WHERE conversion_id = OLD.conversion_id;;

CREATE DEFINER=`root`@`localhost` TRIGGER `finish_transaction_po` AFTER UPDATE ON `tbl_purchase_order` FOR EACH ROW UPDATE tbl_product_transactions SET status = IF (NEW.status = 'F', 1, 0) WHERE header_id = NEW.po_id AND module = 'PO';;

CREATE DEFINER=`root`@`localhost` TRIGGER `delete_po_details` AFTER DELETE ON `tbl_purchase_order` FOR EACH ROW DELETE FROM tbl_purchase_order_details WHERE po_id = OLD.po_id;;

CREATE DEFINER=`root`@`localhost` TRIGGER `add_transaction_in_po` AFTER INSERT ON `tbl_purchase_order_details` FOR EACH ROW INSERT INTO tbl_product_transactions (product_id,quantity,cost,price,header_id,detail_id,module,type) VALUES (NEW.product_id,NEW.qty,NEW.supplier_price,NEW.supplier_price,NEW.po_id,NEW.po_detail_id,'PO','IN');;

CREATE DEFINER=`root`@`localhost` TRIGGER `delete_transaction_po_details` AFTER DELETE ON `tbl_purchase_order_details` FOR EACH ROW DELETE FROM tbl_product_transactions WHERE detail_id = OLD.po_detail_id AND header_id = OLD.po_id AND module = 'PO';;

CREATE DEFINER=`root`@`localhost` TRIGGER `finish_transaction_purchase_return` AFTER UPDATE ON `tbl_purchase_return` FOR EACH ROW UPDATE tbl_product_transactions SET status = IF (NEW.status = 'F', 1, 0) WHERE header_id = NEW.pr_id AND module = 'PR';;

CREATE DEFINER=`root`@`localhost` TRIGGER `delete_purchase_return_details` AFTER DELETE ON `tbl_purchase_return` FOR EACH ROW DELETE FROM tbl_purchase_return_details WHERE pr_id = OLD.pr_id;;

CREATE DEFINER=`root`@`localhost` TRIGGER `add_transaction_out_purchase_return` AFTER INSERT ON `tbl_purchase_return_details` FOR EACH ROW INSERT INTO tbl_product_transactions (product_id,quantity,cost,price,header_id,detail_id,module,type) VALUES (NEW.product_id,NEW.qty_return,NEW.supplier_price,NEW.supplier_price,NEW.pr_id,NEW.pr_detail_id,'PR','OUT');;

CREATE DEFINER=`root`@`localhost` TRIGGER `update_transaction_qty_pr` AFTER UPDATE ON `tbl_purchase_return_details` FOR EACH ROW UPDATE tbl_product_transactions SET quantity=NEW.qty_return WHERE header_id = NEW.pr_id AND detail_id= NEW.pr_detail_id AND module = 'PR';;

CREATE DEFINER=`root`@`localhost` TRIGGER `delete_transaction_purchase_return` AFTER DELETE ON `tbl_purchase_return_details` FOR EACH ROW DELETE FROM tbl_product_transactions WHERE detail_id = OLD.pr_detail_id AND header_id = OLD.pr_id AND module = 'PR';;

CREATE DEFINER=`root`@`localhost` TRIGGER `finish_transaction_sales` AFTER UPDATE ON `tbl_sales` FOR EACH ROW UPDATE tbl_product_transactions SET status = IF (NEW.status = 'F', 1, 0) WHERE header_id = NEW.sales_id AND module = 'SLS';;

CREATE DEFINER=`root`@`localhost` TRIGGER `delete_sales_details` AFTER DELETE ON `tbl_sales` FOR EACH ROW DELETE FROM tbl_sales_details WHERE sales_id = OLD.sales_id;;

CREATE DEFINER=`root`@`localhost` TRIGGER `add_transaction_out_sales` AFTER INSERT ON `tbl_sales_details` FOR EACH ROW INSERT INTO tbl_product_transactions (product_id,quantity,cost,price,header_id,detail_id,module,type) VALUES (NEW.product_id,NEW.quantity,NEW.cost,NEW.price,NEW.sales_id,NEW.sales_detail_id,'SLS','OUT');;

CREATE DEFINER=`root`@`localhost` TRIGGER `update_transaction` AFTER UPDATE ON `tbl_sales_details` FOR EACH ROW UPDATE tbl_product_transactions SET product_id = NEW.product_id,quantity = NEW.quantity,cost=NEW.cost, price = NEW.price WHERE detail_id = OLD.sales_detail_id AND header_id = OLD.sales_id AND module = 'SLS';;

CREATE DEFINER=`root`@`localhost` TRIGGER `delete_transaction_sales` AFTER DELETE ON `tbl_sales_details` FOR EACH ROW DELETE FROM tbl_product_transactions WHERE detail_id = OLD.sales_detail_id AND header_id = OLD.sales_id AND module = 'SLS';;

CREATE DEFINER=`root`@`localhost` TRIGGER `finish_transaction_sales_return` AFTER UPDATE ON `tbl_sales_return` FOR EACH ROW UPDATE tbl_product_transactions SET status = IF (NEW.status = 'F', 1, 0) WHERE header_id = NEW.sales_return_id AND module = 'SR';;

CREATE DEFINER=`root`@`localhost` TRIGGER `delete_sales_return_details` AFTER DELETE ON `tbl_sales_return` FOR EACH ROW DELETE FROM tbl_sales_return_details WHERE sales_return_id = OLD.sales_return_id;;

CREATE DEFINER=`root`@`localhost` TRIGGER `add_transaction_in_sales_return` AFTER INSERT ON `tbl_sales_return_details` FOR EACH ROW INSERT INTO tbl_product_transactions (product_id,quantity,cost,price,header_id,detail_id,module,type) VALUES (NEW.product_id,NEW.quantity_return,NEW.cost,NEW.price,NEW.sales_return_id,NEW.return_detail_id,'SR','IN');;

CREATE DEFINER=`root`@`localhost` TRIGGER `update_transaction_qty_sr` AFTER UPDATE ON `tbl_sales_return_details` FOR EACH ROW UPDATE tbl_product_transactions SET quantity=NEW.quantity_return WHERE header_id = NEW.sales_return_id AND detail_id= NEW.return_detail_id AND module = 'SR';;

CREATE DEFINER=`root`@`localhost` TRIGGER `delete_transaction_sales_return` AFTER DELETE ON `tbl_sales_return_details` FOR EACH ROW DELETE FROM tbl_product_transactions WHERE detail_id = OLD.return_detail_id AND header_id = OLD.sales_return_id AND module = 'SR';;

CREATE DEFINER=`root`@`localhost` TRIGGER `delete_stock_withdrawal_details` AFTER DELETE ON `tbl_stock_withdrawal` FOR EACH ROW DELETE FROM tbl_stock_withdrawal_details WHERE withdrawal_id = OLD.withdrawal_id;;

CREATE DEFINER=`root`@`localhost` TRIGGER `delete_supplier_payment_details` AFTER DELETE ON `tbl_supplier_payment` FOR EACH ROW DELETE FROM tbl_supplier_payment_details WHERE sp_id = OLD.sp_id;;


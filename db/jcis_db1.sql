-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.1.38-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Dumping structure for table jcis_db.tbl_banks
CREATE TABLE IF NOT EXISTS `tbl_banks` (
  `bank_id` int(11) NOT NULL AUTO_INCREMENT,
  `bank_name` varchar(50) DEFAULT NULL,
  `bank_branch` varchar(150) DEFAULT NULL,
  `bank_account_name` varchar(50) DEFAULT NULL,
  `bank_account_number` varchar(50) DEFAULT NULL,
  `date_added` datetime DEFAULT CURRENT_TIMESTAMP,
  `date_last_modified` datetime DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`bank_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table jcis_db.tbl_beginning_balance
CREATE TABLE IF NOT EXISTS `tbl_beginning_balance` (
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
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table jcis_db.tbl_customers
CREATE TABLE IF NOT EXISTS `tbl_customers` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_name` varchar(100) NOT NULL,
  `customer_address` varchar(255) NOT NULL,
  `customer_contact_number` varchar(15) NOT NULL,
  `remarks` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_last_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table jcis_db.tbl_customer_payment
CREATE TABLE IF NOT EXISTS `tbl_customer_payment` (
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
  `date_added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_last_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`cp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table jcis_db.tbl_customer_payment_details
CREATE TABLE IF NOT EXISTS `tbl_customer_payment_details` (
  `cpd_id` int(11) NOT NULL AUTO_INCREMENT,
  `cp_id` int(11) NOT NULL,
  `ref_id` int(11) NOT NULL,
  `amount` decimal(12,2) NOT NULL,
  `type` varchar(2) NOT NULL COMMENT 'DR = sales ; BB = beginning balance',
  PRIMARY KEY (`cpd_id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table jcis_db.tbl_deposit
CREATE TABLE IF NOT EXISTS `tbl_deposit` (
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table jcis_db.tbl_deposit_details
CREATE TABLE IF NOT EXISTS `tbl_deposit_details` (
  `deposit_detail_id` int(11) NOT NULL AUTO_INCREMENT,
  `deposit_id` int(11) NOT NULL,
  `cp_id` int(11) NOT NULL,
  `amount` decimal(12,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`deposit_detail_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table jcis_db.tbl_discounts
CREATE TABLE IF NOT EXISTS `tbl_discounts` (
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table jcis_db.tbl_discount_details
CREATE TABLE IF NOT EXISTS `tbl_discount_details` (
  `discount_detail_id` int(11) NOT NULL AUTO_INCREMENT,
  `discount_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_last_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`discount_detail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table jcis_db.tbl_expense
CREATE TABLE IF NOT EXISTS `tbl_expense` (
  `expense_id` int(11) NOT NULL AUTO_INCREMENT,
  `reference_number` varchar(50) NOT NULL DEFAULT '',
  `expense_date` date NOT NULL,
  `remarks` varchar(255) NOT NULL DEFAULT '',
  `encoded_by` int(11) NOT NULL,
  `status` varchar(1) NOT NULL DEFAULT '',
  `date_added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_last_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`expense_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table jcis_db.tbl_expense_category
CREATE TABLE IF NOT EXISTS `tbl_expense_category` (
  `expense_category_id` int(11) NOT NULL AUTO_INCREMENT,
  `expense_category_code` varchar(10) NOT NULL DEFAULT '',
  `expense_category` varchar(75) NOT NULL DEFAULT '',
  `expense_type` varchar(2) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_last_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`expense_category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table jcis_db.tbl_expense_details
CREATE TABLE IF NOT EXISTS `tbl_expense_details` (
  `expense_detail_id` int(11) NOT NULL AUTO_INCREMENT,
  `expense_id` int(11) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `expense_category_id` int(11) NOT NULL,
  `invoice_no` varchar(15) NOT NULL DEFAULT '',
  `amount` decimal(12,2) NOT NULL,
  PRIMARY KEY (`expense_detail_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table jcis_db.tbl_formulation
CREATE TABLE IF NOT EXISTS `tbl_formulation` (
  `formulation_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(75) NOT NULL,
  `remarks` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_last_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`formulation_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table jcis_db.tbl_formulation_details
CREATE TABLE IF NOT EXISTS `tbl_formulation_details` (
  `formulation_detail_id` int(11) NOT NULL AUTO_INCREMENT,
  `formulation_id` int(11) NOT NULL DEFAULT '0',
  `product_id` int(11) NOT NULL DEFAULT '0',
  `qty` decimal(7,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`formulation_detail_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table jcis_db.tbl_inventory_adjustments
CREATE TABLE IF NOT EXISTS `tbl_inventory_adjustments` (
  `adjustment_id` int(11) NOT NULL AUTO_INCREMENT,
  `reference_number` varchar(75) NOT NULL,
  `remarks` varchar(255) NOT NULL,
  `status` varchar(1) NOT NULL,
  `encoded_by` int(11) NOT NULL,
  `adjustment_date` datetime NOT NULL,
  `date_added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_last_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`adjustment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table jcis_db.tbl_inventory_adjustment_details
CREATE TABLE IF NOT EXISTS `tbl_inventory_adjustment_details` (
  `adjustment_detail_id` int(11) NOT NULL AUTO_INCREMENT,
  `adjustment_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` decimal(12,2) NOT NULL,
  `cost` decimal(12,2) NOT NULL,
  `price` decimal(12,2) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_last_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`adjustment_detail_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table jcis_db.tbl_job_orders
CREATE TABLE IF NOT EXISTS `tbl_job_orders` (
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table jcis_db.tbl_job_order_details
CREATE TABLE IF NOT EXISTS `tbl_job_order_details` (
  `jo_detail_id` int(11) NOT NULL AUTO_INCREMENT,
  `job_order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` decimal(7,2) NOT NULL,
  `cost` decimal(12,5) NOT NULL,
  PRIMARY KEY (`jo_detail_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table jcis_db.tbl_payment_option
CREATE TABLE IF NOT EXISTS `tbl_payment_option` (
  `payment_option_id` int(11) NOT NULL AUTO_INCREMENT,
  `payment_option` varchar(50) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_last_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`payment_option_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table jcis_db.tbl_price_notice
CREATE TABLE IF NOT EXISTS `tbl_price_notice` (
  `price_id` int(11) NOT NULL AUTO_INCREMENT,
  `reference_number` varchar(75) NOT NULL,
  `effective_date` date NOT NULL,
  `effective_status` int(1) NOT NULL,
  `remarks` varchar(255) NOT NULL,
  `status` varchar(1) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_last_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`price_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table jcis_db.tbl_price_notice_details
CREATE TABLE IF NOT EXISTS `tbl_price_notice_details` (
  `price_detail_id` int(11) NOT NULL AUTO_INCREMENT,
  `price_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `old_price` decimal(12,2) NOT NULL,
  `price` decimal(12,2) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_last_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`price_detail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table jcis_db.tbl_products
CREATE TABLE IF NOT EXISTS `tbl_products` (
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table jcis_db.tbl_product_categories
CREATE TABLE IF NOT EXISTS `tbl_product_categories` (
  `product_category_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_category` varchar(75) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_last_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`product_category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table jcis_db.tbl_product_conversions
CREATE TABLE IF NOT EXISTS `tbl_product_conversions` (
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
  `date_last_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `status` varchar(1) NOT NULL,
  PRIMARY KEY (`conversion_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table jcis_db.tbl_product_conversion_details
CREATE TABLE IF NOT EXISTS `tbl_product_conversion_details` (
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table jcis_db.tbl_product_transactions
CREATE TABLE IF NOT EXISTS `tbl_product_transactions` (
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
) ENGINE=InnoDB AUTO_INCREMENT=352 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table jcis_db.tbl_purchase_order
CREATE TABLE IF NOT EXISTS `tbl_purchase_order` (
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
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table jcis_db.tbl_purchase_order_details
CREATE TABLE IF NOT EXISTS `tbl_purchase_order_details` (
  `po_detail_id` int(11) NOT NULL AUTO_INCREMENT,
  `po_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` decimal(11,2) NOT NULL,
  `supplier_price` decimal(11,2) NOT NULL,
  PRIMARY KEY (`po_detail_id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table jcis_db.tbl_purchase_return
CREATE TABLE IF NOT EXISTS `tbl_purchase_return` (
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

-- Data exporting was unselected.

-- Dumping structure for table jcis_db.tbl_purchase_return_details
CREATE TABLE IF NOT EXISTS `tbl_purchase_return_details` (
  `pr_detail_id` int(11) NOT NULL AUTO_INCREMENT,
  `pr_id` int(11) NOT NULL,
  `po_detail_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` decimal(12,2) NOT NULL DEFAULT '0.00',
  `qty_return` decimal(12,2) NOT NULL DEFAULT '0.00',
  `supplier_price` decimal(12,5) NOT NULL,
  PRIMARY KEY (`pr_detail_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table jcis_db.tbl_sales
CREATE TABLE IF NOT EXISTS `tbl_sales` (
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
  `encoded_by` int(11) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_last_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `discount_id` int(11) NOT NULL DEFAULT '0' COMMENT 'Manual Discounts',
  PRIMARY KEY (`sales_id`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table jcis_db.tbl_sales_details
CREATE TABLE IF NOT EXISTS `tbl_sales_details` (
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
) ENGINE=InnoDB AUTO_INCREMENT=128 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table jcis_db.tbl_sales_return
CREATE TABLE IF NOT EXISTS `tbl_sales_return` (
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
  PRIMARY KEY (`sales_return_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table jcis_db.tbl_sales_return_details
CREATE TABLE IF NOT EXISTS `tbl_sales_return_details` (
  `return_detail_id` int(11) NOT NULL AUTO_INCREMENT,
  `sales_return_id` int(11) NOT NULL,
  `sales_detail_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` decimal(12,2) NOT NULL,
  `quantity_return` decimal(12,2) NOT NULL,
  `price` decimal(12,2) NOT NULL,
  `discount` decimal(12,2) NOT NULL,
  `cost` decimal(12,5) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`return_detail_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table jcis_db.tbl_sales_summary
CREATE TABLE IF NOT EXISTS `tbl_sales_summary` (
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table jcis_db.tbl_settings
CREATE TABLE IF NOT EXISTS `tbl_settings` (
  `settings_id` int(11) NOT NULL AUTO_INCREMENT,
  `module_discount` varchar(32) NOT NULL,
  `module_cancel` varchar(32) NOT NULL,
  `module_delete` varchar(32) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_last_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `module_add_customer` varchar(32) NOT NULL,
  `module_change_payment_type` varchar(32) NOT NULL,
  `module_remove_online_payment` varchar(32) NOT NULL,
  `company_name` varchar(50) NOT NULL,
  `company_address` varchar(100) NOT NULL,
  `print_header` text NOT NULL,
  `print_footer` text NOT NULL,
  PRIMARY KEY (`settings_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table jcis_db.tbl_stock_withdrawal
CREATE TABLE IF NOT EXISTS `tbl_stock_withdrawal` (
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table jcis_db.tbl_stock_withdrawal_details
CREATE TABLE IF NOT EXISTS `tbl_stock_withdrawal_details` (
  `sw_detail_id` int(11) NOT NULL AUTO_INCREMENT,
  `withdrawal_id` int(11) NOT NULL DEFAULT '0',
  `sales_detail_id` int(11) NOT NULL DEFAULT '0',
  `product_id` int(11) DEFAULT NULL,
  `qty` decimal(8,2) NOT NULL DEFAULT '0.00',
  `status` varchar(1) NOT NULL DEFAULT 'S',
  PRIMARY KEY (`sw_detail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table jcis_db.tbl_suppliers
CREATE TABLE IF NOT EXISTS `tbl_suppliers` (
  `supplier_id` int(11) NOT NULL AUTO_INCREMENT,
  `supplier_name` varchar(100) NOT NULL,
  `supplier_address` varchar(255) NOT NULL,
  `contact_number` varchar(15) NOT NULL,
  `remarks` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_last_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`supplier_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table jcis_db.tbl_supplier_payment
CREATE TABLE IF NOT EXISTS `tbl_supplier_payment` (
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table jcis_db.tbl_supplier_payment_details
CREATE TABLE IF NOT EXISTS `tbl_supplier_payment_details` (
  `spd_id` int(11) NOT NULL AUTO_INCREMENT,
  `sp_id` int(11) NOT NULL,
  `ref_id` int(11) NOT NULL,
  `type` varchar(2) NOT NULL COMMENT 'BB, PO',
  `amount` decimal(12,2) NOT NULL,
  PRIMARY KEY (`spd_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table jcis_db.tbl_users
CREATE TABLE IF NOT EXISTS `tbl_users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_fullname` varchar(100) NOT NULL,
  `user_category` varchar(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` text NOT NULL,
  `date_added` datetime NOT NULL,
  `date_last_modified` datetime NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table jcis_db.tbl_user_privileges
CREATE TABLE IF NOT EXISTS `tbl_user_privileges` (
  `privilege_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `url` varchar(50) NOT NULL,
  `status` int(1) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_last_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`privilege_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for trigger jcis_db.add_adjustment_detail
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER add_adjustment_detail AFTER INSERT ON tbl_inventory_adjustment_details FOR EACH ROW  INSERT INTO tbl_product_transactions (product_id,quantity,cost,price,header_id,detail_id,module,type) VALUES (NEW.product_id,ABS(NEW.quantity),NEW.cost,NEW.price,NEW.adjustment_id,NEW.adjustment_detail_id,'IA',IF(NEW.quantity > 0,'IN','OUT'))//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger jcis_db.add_conversion_detail
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER add_conversion_detail AFTER INSERT ON tbl_product_conversion_details FOR EACH ROW BEGIN INSERT INTO tbl_product_transactions (product_id,quantity,cost,price,header_id,detail_id,module,type) VALUES (NEW.original_product_id,NEW.original_qty,NEW.original_cost,NEW.original_price,NEW.conversion_id,NEW.conversion_detail_id,'PC','OUT'); INSERT INTO tbl_product_transactions (product_id,quantity,cost,price,header_id,detail_id,module,type) VALUES (NEW.converted_product_id,NEW.converted_qty,NEW.converted_cost,NEW.converted_price,NEW.conversion_id,NEW.conversion_detail_id,'PC','IN'); END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger jcis_db.add_transaction_in_bb
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `add_transaction_in_bb` AFTER INSERT ON `tbl_beginning_balance` FOR EACH ROW IF(NEW.bb_module = 'INV') 
  THEN
    INSERT INTO tbl_product_transactions (product_id,quantity,header_id,module,TYPE,STATUS,cost) VALUES (NEW.bb_ref_id,NEW.bb_qty,NEW.bb_id,'BB','IN', '1', (NEW.bb_amount/NEW.bb_qty));
  END IF//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger jcis_db.add_transaction_in_jo
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `add_transaction_in_jo` AFTER INSERT ON `tbl_job_orders` FOR EACH ROW INSERT INTO tbl_product_transactions (product_id,quantity,header_id,module,type) VALUES (NEW.product_id,NEW.no_of_batches,NEW.job_order_id,'JO','IN')//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger jcis_db.add_transaction_in_po
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `add_transaction_in_po` AFTER INSERT ON `tbl_purchase_order_details` FOR EACH ROW INSERT INTO tbl_product_transactions (product_id,quantity,cost,price,header_id,detail_id,module,type) VALUES (NEW.product_id,NEW.qty,NEW.supplier_price,NEW.supplier_price,NEW.po_id,NEW.po_detail_id,'PO','IN')//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger jcis_db.add_transaction_in_sales_return
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `add_transaction_in_sales_return` AFTER INSERT ON `tbl_sales_return_details` FOR EACH ROW INSERT INTO tbl_product_transactions (product_id,quantity,cost,price,header_id,detail_id,module,type) VALUES (NEW.product_id,NEW.quantity_return,NEW.cost,NEW.price,NEW.sales_return_id,NEW.return_detail_id,'SR','IN')//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger jcis_db.add_transaction_out_jo
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `add_transaction_out_jo` AFTER INSERT ON `tbl_job_order_details` FOR EACH ROW INSERT INTO tbl_product_transactions (product_id,quantity,cost,price,header_id,detail_id,module,type) VALUES (NEW.product_id,NEW.qty,NEW.cost,NEW.cost,NEW.job_order_id,NEW.jo_detail_id,'JO','OUT')//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger jcis_db.add_transaction_out_purchase_return
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `add_transaction_out_purchase_return` AFTER INSERT ON `tbl_purchase_return_details` FOR EACH ROW INSERT INTO tbl_product_transactions (product_id,quantity,cost,price,header_id,detail_id,module,type) VALUES (NEW.product_id,NEW.qty_return,NEW.supplier_price,NEW.supplier_price,NEW.pr_id,NEW.pr_detail_id,'PR','OUT')//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger jcis_db.add_transaction_out_sales
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `add_transaction_out_sales` AFTER INSERT ON `tbl_sales_details` FOR EACH ROW INSERT INTO tbl_product_transactions (product_id,quantity,cost,price,header_id,detail_id,module,type) VALUES (NEW.product_id,NEW.quantity,NEW.cost,NEW.price,NEW.sales_id,NEW.sales_detail_id,'SLS','OUT')//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger jcis_db.delete_adjustment
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER delete_adjustment AFTER DELETE ON tbl_inventory_adjustments FOR EACH ROW  DELETE FROM tbl_inventory_adjustment_details WHERE adjustment_id = OLD.adjustment_id//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger jcis_db.delete_adjustment_detail
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER delete_adjustment_detail AFTER DELETE ON tbl_inventory_adjustment_details FOR EACH ROW  DELETE FROM tbl_product_transactions WHERE header_id = OLD.adjustment_id AND detail_id = OLD.adjustment_detail_id AND module = 'IA'//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger jcis_db.delete_conversion
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER delete_conversion AFTER DELETE ON tbl_product_conversions FOR EACH ROW  DELETE FROM tbl_inventory_adjustment_details WHERE conversion_id = OLD.conversion_id//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger jcis_db.delete_conversion_detail
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER delete_conversion_detail AFTER DELETE ON tbl_product_conversion_details FOR EACH ROW  DELETE FROM tbl_product_transactions WHERE header_id = OLD.conversion_id AND detail_id = OLD.conversion_detail_id AND module = 'PC'//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger jcis_db.delete_custmer_payment_details
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `delete_custmer_payment_details` AFTER DELETE ON `tbl_customer_payment` FOR EACH ROW DELETE FROM tbl_customer_payment_details WHERE cp_id = OLD.cp_id//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger jcis_db.delete_expenses_details
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `delete_expenses_details` AFTER DELETE ON `tbl_expense` FOR EACH ROW DELETE FROM tbl_expense_details WHERE expense_id = OLD.expense_id//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger jcis_db.delete_formulation_details
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `delete_formulation_details` AFTER DELETE ON `tbl_formulation` FOR EACH ROW DELETE FROM tbl_formulation_details WHERE formulation_id= OLD.formulation_id//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger jcis_db.delete_job_order_details
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `delete_job_order_details` AFTER DELETE ON `tbl_job_orders` FOR EACH ROW BEGIN
DELETE FROM tbl_job_order_details WHERE job_order_id = OLD.job_order_id;
DELETE FROM tbl_product_transactions WHERE header_id = OLD.job_order_id AND module = 'JO';
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger jcis_db.delete_po_details
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `delete_po_details` AFTER DELETE ON `tbl_purchase_order` FOR EACH ROW DELETE FROM tbl_purchase_order_details WHERE po_id = OLD.po_id//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger jcis_db.delete_purchase_return_details
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `delete_purchase_return_details` AFTER DELETE ON `tbl_purchase_return` FOR EACH ROW DELETE FROM tbl_purchase_return_details WHERE pr_id = OLD.pr_id//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger jcis_db.delete_sales_details
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `delete_sales_details` AFTER DELETE ON `tbl_sales` FOR EACH ROW DELETE FROM tbl_sales_details WHERE sales_id = OLD.sales_id//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger jcis_db.delete_sales_return_details
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `delete_sales_return_details` AFTER DELETE ON `tbl_sales_return` FOR EACH ROW DELETE FROM tbl_sales_return_details WHERE sales_return_id = OLD.sales_return_id//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger jcis_db.delete_stock_withdrawal_details
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `delete_stock_withdrawal_details` AFTER DELETE ON `tbl_stock_withdrawal` FOR EACH ROW DELETE FROM tbl_stock_withdrawal_details WHERE withdrawal_id = OLD.withdrawal_id//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger jcis_db.delete_supplier_payment_details
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `delete_supplier_payment_details` AFTER DELETE ON `tbl_supplier_payment` FOR EACH ROW DELETE FROM tbl_supplier_payment_details WHERE sp_id = OLD.sp_id//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger jcis_db.delete_transaction_bb
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `delete_transaction_bb` AFTER DELETE ON `tbl_beginning_balance` FOR EACH ROW DELETE FROM tbl_product_transactions WHERE header_id = OLD.bb_id AND module = 'BB'//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger jcis_db.delete_transaction_jo_details
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `delete_transaction_jo_details` AFTER DELETE ON `tbl_job_order_details` FOR EACH ROW DELETE FROM tbl_product_transactions WHERE detail_id = OLD.jo_detail_id AND header_id = OLD.job_order_id AND module = 'JO'//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger jcis_db.delete_transaction_po_details
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `delete_transaction_po_details` AFTER DELETE ON `tbl_purchase_order_details` FOR EACH ROW DELETE FROM tbl_product_transactions WHERE detail_id = OLD.po_detail_id AND header_id = OLD.po_id AND module = 'PO'//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger jcis_db.delete_transaction_purchase_return
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `delete_transaction_purchase_return` AFTER DELETE ON `tbl_purchase_return_details` FOR EACH ROW DELETE FROM tbl_product_transactions WHERE detail_id = OLD.pr_detail_id AND header_id = OLD.pr_id AND module = 'PR'//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger jcis_db.delete_transaction_sales
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `delete_transaction_sales` AFTER DELETE ON `tbl_sales_details` FOR EACH ROW DELETE FROM tbl_product_transactions WHERE detail_id = OLD.sales_detail_id AND header_id = OLD.sales_id AND module = 'SLS'//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger jcis_db.delete_transaction_sales_return
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `delete_transaction_sales_return` AFTER DELETE ON `tbl_sales_return_details` FOR EACH ROW DELETE FROM tbl_product_transactions WHERE detail_id = OLD.return_detail_id AND header_id = OLD.sales_return_id AND module = 'SR'//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger jcis_db.finish_adjustment
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER finish_adjustment AFTER UPDATE ON tbl_inventory_adjustments FOR EACH ROW  UPDATE tbl_product_transactions SET status = IF (NEW.status = 'F', 1, 0) WHERE header_id = NEW.adjustment_id AND module = 'IA'//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger jcis_db.finish_conversion
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER finish_conversion AFTER UPDATE ON tbl_product_conversions FOR EACH ROW  UPDATE tbl_product_transactions SET status = IF (NEW.status = 'F', 1, 0) WHERE header_id = NEW.conversion_id AND module = 'PC'//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger jcis_db.finish_transaction_jo
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `finish_transaction_jo` AFTER UPDATE ON `tbl_job_orders` FOR EACH ROW UPDATE tbl_product_transactions SET status = IF (NEW.status = 'F', 1, 0) WHERE header_id = NEW.job_order_id AND module = 'JO'//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger jcis_db.finish_transaction_po
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `finish_transaction_po` AFTER UPDATE ON `tbl_purchase_order` FOR EACH ROW UPDATE tbl_product_transactions SET status = IF (NEW.status = 'F', 1, 0) WHERE header_id = NEW.po_id AND module = 'PO'//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger jcis_db.finish_transaction_purchase_return
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `finish_transaction_purchase_return` AFTER UPDATE ON `tbl_purchase_return` FOR EACH ROW UPDATE tbl_product_transactions SET status = IF (NEW.status = 'F', 1, 0) WHERE header_id = NEW.pr_id AND module = 'PR'//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger jcis_db.finish_transaction_sales
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `finish_transaction_sales` AFTER UPDATE ON `tbl_sales` FOR EACH ROW UPDATE tbl_product_transactions SET status = IF (NEW.status = 'F', 1, 0) WHERE header_id = NEW.sales_id AND module = 'SLS'//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger jcis_db.finish_transaction_sales_return
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `finish_transaction_sales_return` AFTER UPDATE ON `tbl_sales_return` FOR EACH ROW UPDATE tbl_product_transactions SET status = IF (NEW.status = 'F', 1, 0) WHERE header_id = NEW.sales_return_id AND module = 'SR'//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger jcis_db.update_transaction
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO';
DELIMITER //
CREATE TRIGGER `update_transaction` AFTER UPDATE ON `tbl_sales_details` FOR EACH ROW UPDATE tbl_product_transactions SET product_id = NEW.product_id,quantity = NEW.quantity,cost=NEW.cost, price = NEW.price WHERE detail_id = OLD.sales_detail_id AND header_id = OLD.sales_id AND module = 'SLS'//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger jcis_db.update_transaction_qty_pr
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `update_transaction_qty_pr` AFTER UPDATE ON `tbl_purchase_return_details` FOR EACH ROW UPDATE tbl_product_transactions SET quantity=NEW.qty_return WHERE header_id = NEW.pr_id AND detail_id= NEW.pr_detail_id AND module = 'PR'//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger jcis_db.update_transaction_qty_sr
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `update_transaction_qty_sr` AFTER UPDATE ON `tbl_sales_return_details` FOR EACH ROW UPDATE tbl_product_transactions SET quantity=NEW.quantity_return WHERE header_id = NEW.sales_return_id AND detail_id= NEW.return_detail_id AND module = 'SR'//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;

-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.6.5-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Dumping structure for table final.db_book
CREATE TABLE IF NOT EXISTS `db_book` (
  `BookID` int(11) NOT NULL,
  `Title` varchar(50) DEFAULT NULL,
  `UnitPrice` float DEFAULT NULL,
  `Author` varchar(50) DEFAULT NULL,
  `Quantity` int(11) DEFAULT NULL,
  `SupplierID` int(11) DEFAULT NULL,
  `SubjectID` int(11) DEFAULT NULL,
  PRIMARY KEY (`BookID`),
  KEY `FK_db_book_db_supplier` (`SupplierID`),
  KEY `FK_db_book_db_subject` (`SubjectID`),
  CONSTRAINT `FK_db_book_db_subject` FOREIGN KEY (`SubjectID`) REFERENCES `db_subject` (`SubjectID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_db_book_db_supplier` FOREIGN KEY (`SupplierID`) REFERENCES `db_supplier` (`SupplierID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table final.db_book: ~8 rows (approximately)
/*!40000 ALTER TABLE `db_book` DISABLE KEYS */;
INSERT INTO `db_book` (`BookID`, `Title`, `UnitPrice`, `Author`, `Quantity`, `SupplierID`, `SubjectID`) VALUES
	(1, 'book1', 12.34, 'author1', 5, 3, 1),
	(2, 'book2', 56.78, 'author2', 2, 3, 1),
	(3, 'book3', 90.12, 'author3', 10, 2, 1),
	(4, 'book4', 34.56, 'author4', 12, 3, 2),
	(5, 'book5', 78.9, 'author5', 5, 2, 2),
	(6, 'book6', 12.34, 'author6', 30, 1, 3),
	(7, 'book7', 56.9, 'author2', 17, 3, 4),
	(8, 'book8', 33.44, 'author7', 2, 1, 3);
/*!40000 ALTER TABLE `db_book` ENABLE KEYS */;

-- Dumping structure for table final.db_customer
CREATE TABLE IF NOT EXISTS `db_customer` (
  `CustomerID` int(11) NOT NULL,
  `LastName` varchar(50) DEFAULT NULL,
  `FirstName` varchar(50) DEFAULT NULL,
  `Phone` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`CustomerID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table final.db_customer: ~4 rows (approximately)
/*!40000 ALTER TABLE `db_customer` DISABLE KEYS */;
INSERT INTO `db_customer` (`CustomerID`, `LastName`, `FirstName`, `Phone`) VALUES
	(1, 'lastname1', 'firstname1', '334-001-001'),
	(2, 'lastname2', 'firstname2', '334-002-002'),
	(3, 'lastname3', 'firstname3', '334-003-003'),
	(4, 'lastname4', 'firstname4', '334-004-004');
/*!40000 ALTER TABLE `db_customer` ENABLE KEYS */;

-- Dumping structure for table final.db_employee
CREATE TABLE IF NOT EXISTS `db_employee` (
  `EmployeeID` int(11) NOT NULL,
  `LastName` varchar(50) DEFAULT NULL,
  `FirstName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`EmployeeID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table final.db_employee: ~3 rows (approximately)
/*!40000 ALTER TABLE `db_employee` DISABLE KEYS */;
INSERT INTO `db_employee` (`EmployeeID`, `LastName`, `FirstName`) VALUES
	(1, 'lastname5', 'firstname5'),
	(2, 'lastname6', 'firstname6'),
	(3, 'lastname6', 'firstname9');
/*!40000 ALTER TABLE `db_employee` ENABLE KEYS */;

-- Dumping structure for table final.db_order
CREATE TABLE IF NOT EXISTS `db_order` (
  `OrderID` int(11) NOT NULL,
  `CustomerID` int(11) DEFAULT NULL,
  `EmployeeID` int(11) DEFAULT NULL,
  `OrderDate` date DEFAULT NULL,
  `ShippedDate` date DEFAULT NULL,
  `ShipperID` int(11) DEFAULT NULL,
  PRIMARY KEY (`OrderID`),
  KEY `FK_db_order_db_customer` (`CustomerID`),
  KEY `FK_db_order_db_employee` (`EmployeeID`),
  KEY `FK_db_order_db_shipper` (`ShipperID`),
  CONSTRAINT `FK_db_order_db_customer` FOREIGN KEY (`CustomerID`) REFERENCES `db_customer` (`CustomerID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_db_order_db_employee` FOREIGN KEY (`EmployeeID`) REFERENCES `db_employee` (`EmployeeID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_db_order_db_shipper` FOREIGN KEY (`ShipperID`) REFERENCES `db_shipper` (`ShipperID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table final.db_order: ~7 rows (approximately)
/*!40000 ALTER TABLE `db_order` DISABLE KEYS */;
INSERT INTO `db_order` (`OrderID`, `CustomerID`, `EmployeeID`, `OrderDate`, `ShippedDate`, `ShipperID`) VALUES
	(1, 1, 1, '2016-08-01', '2016-08-03', 1),
	(2, 1, 2, '2016-08-04', NULL, NULL),
	(3, 2, 1, '2016-08-01', '2016-08-04', 2),
	(4, 4, 2, '2016-08-04', '2016-08-04', 1),
	(5, 1, 1, '2016-08-04', '2016-08-05', 1),
	(6, 4, 2, '2016-08-04', '2016-08-05', 1),
	(7, 3, 1, '2016-08-04', '2016-08-04', 1);
/*!40000 ALTER TABLE `db_order` ENABLE KEYS */;

-- Dumping structure for table final.db_order_detail
CREATE TABLE IF NOT EXISTS `db_order_detail` (
  `BookID` int(11) DEFAULT NULL,
  `OrderID` int(11) DEFAULT NULL,
  `Quantity` int(11) DEFAULT NULL,
  KEY `FK_db_order_detail_db_book` (`BookID`),
  KEY `FK_db_order_detail_db_order` (`OrderID`),
  CONSTRAINT `FK_db_order_detail_db_book` FOREIGN KEY (`BookID`) REFERENCES `db_book` (`BookID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_db_order_detail_db_order` FOREIGN KEY (`OrderID`) REFERENCES `db_order` (`OrderID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table final.db_order_detail: ~11 rows (approximately)
/*!40000 ALTER TABLE `db_order_detail` DISABLE KEYS */;
INSERT INTO `db_order_detail` (`BookID`, `OrderID`, `Quantity`) VALUES
	(1, 1, 2),
	(4, 1, 1),
	(6, 2, 2),
	(7, 2, 3),
	(5, 3, 1),
	(3, 4, 2),
	(4, 4, 1),
	(7, 4, 1),
	(1, 5, 1),
	(1, 6, 2),
	(1, 7, 1);
/*!40000 ALTER TABLE `db_order_detail` ENABLE KEYS */;

-- Dumping structure for table final.db_shipper
CREATE TABLE IF NOT EXISTS `db_shipper` (
  `ShipperID` int(11) NOT NULL,
  `ShipperName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ShipperID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table final.db_shipper: ~4 rows (approximately)
/*!40000 ALTER TABLE `db_shipper` DISABLE KEYS */;
INSERT INTO `db_shipper` (`ShipperID`, `ShipperName`) VALUES
	(1, 'shipper1'),
	(2, 'shipper2'),
	(3, 'shipper3'),
	(4, 'shipper4');
/*!40000 ALTER TABLE `db_shipper` ENABLE KEYS */;

-- Dumping structure for table final.db_subject
CREATE TABLE IF NOT EXISTS `db_subject` (
  `SubjectID` int(11) NOT NULL,
  `CategoryName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`SubjectID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table final.db_subject: ~5 rows (approximately)
/*!40000 ALTER TABLE `db_subject` DISABLE KEYS */;
INSERT INTO `db_subject` (`SubjectID`, `CategoryName`) VALUES
	(1, 'category1'),
	(2, 'category2'),
	(3, 'category3'),
	(4, 'category4'),
	(5, 'category5');
/*!40000 ALTER TABLE `db_subject` ENABLE KEYS */;

-- Dumping structure for table final.db_supplier
CREATE TABLE IF NOT EXISTS `db_supplier` (
  `SupplierID` int(11) NOT NULL DEFAULT 0,
  `CompanyName` varchar(50) DEFAULT NULL,
  `ContactLastName` varchar(50) DEFAULT NULL,
  `ContactFirstName` varchar(50) DEFAULT NULL,
  `Phone` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`SupplierID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table final.db_supplier: ~4 rows (approximately)
/*!40000 ALTER TABLE `db_supplier` DISABLE KEYS */;
INSERT INTO `db_supplier` (`SupplierID`, `CompanyName`, `ContactLastName`, `ContactFirstName`, `Phone`) VALUES
	(1, 'supplier1', 'company1', 'company1', '1111111111'),
	(2, 'supplier2', 'company2', 'company2', '2222222222'),
	(3, 'supplier3', 'company3', 'company3', '3333333333'),
	(4, 'supplier4', 'company4', NULL, '4444444444');
/*!40000 ALTER TABLE `db_supplier` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;

-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Erstellungszeit: 10. Jul 2014 um 20:18
-- Server Version: 5.5.27
-- PHP-Version: 5.4.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Datenbank: `smoothy`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `tblcities`
--

CREATE TABLE IF NOT EXISTS `tblcities` (
  `CityID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `postalCode` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`CityID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `tblcompanies`
--

CREATE TABLE IF NOT EXISTS `tblcompanies` (
  `companyID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `street` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `houseNumber` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `cityID` int(10) unsigned NOT NULL,
  `landID` int(10) unsigned NOT NULL,
  `salesTaxIdentificationNumber` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`companyID`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Contains companies' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `tblcustomercompanylink`
--

CREATE TABLE IF NOT EXISTS `tblcustomercompanylink` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `customerNumber` int(10) unsigned NOT NULL,
  `companyID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `customerNumber` (`customerNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Associates company with customer' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `tblcustomers`
--

CREATE TABLE IF NOT EXISTS `tblcustomers` (
  `contactID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `customerNumber` int(10) unsigned NOT NULL,
  `firstName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `lastName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `eMail` varchar(254) COLLATE utf8_unicode_ci NOT NULL,
  `telephoneNumber` decimal(32,0) NOT NULL,
  `MobileNumber` decimal(32,0) NOT NULL,
  `FaxNumber` decimal(32,0) NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `registrationDate` date NOT NULL,
  `disabled` tinyint(1) NOT NULL,
  `disabledDate` date NOT NULL,
  `terminationDate` date NOT NULL,
  PRIMARY KEY (`contactID`),
  UNIQUE KEY `eMail` (`eMail`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Contains all customers' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `tblinvoices`
--

CREATE TABLE IF NOT EXISTS `tblinvoices` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `customerID` int(10) unsigned NOT NULL,
  `invoiceNumber` decimal(10,0) unsigned NOT NULL,
  `dateFrom` date NOT NULL,
  `dateUntil` date NOT NULL,
  `paid` tinyint(1) NOT NULL DEFAULT '0',
  `attachement` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `invoiceNumber` (`invoiceNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Contains invoices' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `tbllands`
--

CREATE TABLE IF NOT EXISTS `tbllands` (
  `landID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `abbreviationISO31662` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`landID`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Contains lands' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `tblorderitems`
--

CREATE TABLE IF NOT EXISTS `tblorderitems` (
  `positionNumber` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `orderNumber` int(10) unsigned NOT NULL,
  `productNumber` int(10) unsigned NOT NULL,
  `amount` decimal(10,0) NOT NULL,
  PRIMARY KEY (`positionNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Contains ordered items' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `tblorders`
--

CREATE TABLE IF NOT EXISTS `tblorders` (
  `orderNumber` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `customerNumber` int(10) unsigned NOT NULL,
  `orderDate` date NOT NULL,
  PRIMARY KEY (`orderNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `tblproducts`
--

CREATE TABLE IF NOT EXISTS `tblproducts` (
  `productNumber` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `price` decimal(10,2) NOT NULL,
  PRIMARY KEY (`productNumber`),
  UNIQUE KEY `productName` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Contains offering products' AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

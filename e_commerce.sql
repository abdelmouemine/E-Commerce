-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 01, 2022 at 04:04 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `e_commerce`
--

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `ID` varchar(2) NOT NULL,
  `First_Name` varchar(30) NOT NULL,
  `Last_Name` varchar(30) NOT NULL,
  `Adresse` varchar(254) NOT NULL,
  `Phone_Number` varchar(30) NOT NULL,
  `Email` varchar(30) NOT NULL,
  `Password` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`ID`, `First_Name`, `Last_Name`, `Adresse`, `Phone_Number`, `Email`, `Password`) VALUES
('01', 'Abdelmouemine', 'Boulaich', 'morocco tanger', '0622418831', 'mouemin2000@hotmail.com', 'Password123'),
('02', 'Wafae', 'Zouini', 'morocco tanger', '0654518951', 'wafaezouini@gmail.com', 'Password123'),
('03', 'Mariam', 'Bouzine', 'morocco tanger', '0675437951', 'Mariam@gmail.com', 'Password123'),
('04', 'Karim', 'Hajji', 'morocco tanger', '0658638951', 'Karim@gmail.com', 'Password123'),
('05', 'Aicha', 'Bouzine', 'morocco tanger', '0654517774', 'Aicha@gmail.com', 'Password123'),
('06', 'Zoubir', 'Soudi', 'morocco tanger', '0654518654', 'Zoubir@gmail.com', 'Password123'),
('07', 'Fatima', 'Bencharki', 'morocco tanger', '0654518654', 'Fatima@gmail.com', 'Password123'),
('08', 'Mohamed', 'Bekkour', 'morocco tanger', '0688816554', 'Mohamed@gmail.com', 'Password123'),
('09', 'Amine', 'Bakkali', 'morocco tanger', '0654565439', 'Amine@gmail.com', 'Password123'),
('10', 'Mohamed', 'Bencharki', 'morocco tanger', '0698718654', 'Fatima@gmail.com', 'Password123');

-- --------------------------------------------------------

--
-- Table structure for table `details`
--

CREATE TABLE `details` (
  `Quantity` int(11) NOT NULL,
  `ID_Orders` varchar(4) NOT NULL,
  `ID_Products` varchar(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `ID_Orders` varchar(4) NOT NULL,
  `Date` date DEFAULT NULL,
  `Adresse` varchar(254) DEFAULT NULL,
  `ID_Clients` varchar(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`ID_Orders`, `Date`, `Adresse`, `ID_Clients`) VALUES
('0001', '2022-02-25', 'morocco tanger', '01'),
('0002', '2022-02-25', 'morocco tanger', '01'),
('0003', '2022-02-25', 'morocco tanger', '02'),
('0004', '2022-02-26', 'spain barcelona', '03'),
('0005', '2022-02-27', 'spain barcelona', '04');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `ID_Products` varchar(4) NOT NULL,
  `Libellé` varchar(30) DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `Price` float DEFAULT NULL,
  `Quantity_On_Stock` int(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`ID_Products`, `Libellé`, `Description`, `Price`, `Quantity_On_Stock`) VALUES
('0001', '7lib', '7lib d b9ar 1L', 10, 300),
('0002', 'Lkhobz', 'Lkhobza d Zra3', 3, 60),
('0003', 'Zit', 'Zit d L3od 7orra 1L', 18, 900),
('0004', 'Chocolat', 'Choclat d l7alwa 500G', 30, 56);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `details`
--
ALTER TABLE `details`
  ADD PRIMARY KEY (`ID_Orders`,`ID_Products`),
  ADD KEY `ID_Products` (`ID_Products`),
  ADD KEY `ID_Orders` (`ID_Orders`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`ID_Orders`),
  ADD KEY `ID_Clients` (`ID_Clients`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`ID_Products`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `details`
--
ALTER TABLE `details`
  ADD CONSTRAINT `details_ibfk_1` FOREIGN KEY (`ID_Orders`) REFERENCES `orders` (`ID_Orders`),
  ADD CONSTRAINT `details_ibfk_2` FOREIGN KEY (`ID_Products`) REFERENCES `products` (`ID_Products`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`ID_Clients`) REFERENCES `clients` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

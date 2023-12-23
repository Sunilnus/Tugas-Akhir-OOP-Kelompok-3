-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 13, 2023 at 01:55 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bankingdatabase`
--

-- --------------------------------------------------------

--
-- Table structure for table `msrekening`
--

CREATE TABLE `msrekening` (
  `no_rekening` int(11) NOT NULL,
  `pin_rekening` int(11) DEFAULT NULL,
  `jumlah_saldo` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `msrekening`
--

INSERT INTO `msrekening` (`no_rekening`, `pin_rekening`, `jumlah_saldo`) VALUES
(19812630, 703010, 89090500),
(19812632, 123456, 800000);

-- --------------------------------------------------------

--
-- Table structure for table `mstransaksi`
--

CREATE TABLE `mstransaksi` (
  `id_transaksi` char(5) NOT NULL,
  `total_transaksi` double DEFAULT NULL,
  `waktu_transaksi` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mstransaksi`
--

INSERT INTO `mstransaksi` (`id_transaksi`, `total_transaksi`, `waktu_transaksi`) VALUES
('DE001', 200000, '2023-12-11 23:42:35'),
('DE002', 500000, '2023-12-12 23:14:13'),
('DE003', 500000, '2023-12-12 23:28:10'),
('DE004', 500000, '2023-12-12 23:30:01'),
('DE005', 400000, '2023-12-12 23:38:57'),
('DE006', 45000, '2023-12-13 17:02:47'),
('DE007', 800000, '2023-12-13 19:50:36'),
('TR001', 90000, '2023-12-13 00:31:33'),
('TR002', 10000, '2023-12-13 00:43:53'),
('TR003', 350000, '2023-12-13 00:45:22'),
('TR004', 10000000, '2023-12-13 00:46:46'),
('TR005', 5000, '2023-12-13 00:57:41'),
('TR006', 45000, '2023-12-13 17:03:53'),
('TR007', 9500, '2023-12-13 17:16:11'),
('WI001', 200000, '2023-12-12 23:38:27'),
('WI002', 100000, '2023-12-12 23:44:03'),
('WI003', 45000, '2023-12-13 17:01:10');

-- --------------------------------------------------------

--
-- Table structure for table `msusername`
--

CREATE TABLE `msusername` (
  `username` varchar(20) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `pass` varchar(20) DEFAULT NULL,
  `nama_nasabah` varchar(50) DEFAULT NULL,
  `alamat_nasabah` varchar(50) DEFAULT NULL,
  `tanggal_lahir_nasabah` date DEFAULT NULL,
  `gender` enum('L','P') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `msusername`
--

INSERT INTO `msusername` (`username`, `email`, `pass`, `nama_nasabah`, `alamat_nasabah`, `tanggal_lahir_nasabah`, `gender`) VALUES
('absussss', 'abesus@gmail.com', 'abe12345', 'Adrian B', 'Jl. Adrian', '2004-12-01', 'L'),
('geraldoooo', 'ge@gmail.com', 'gege1234', 'Gerald Davin', 'Jl. Tanggul', '2004-09-21', 'L');

-- --------------------------------------------------------

--
-- Table structure for table `transactionheader`
--

CREATE TABLE `transactionheader` (
  `no_rekening` int(11) DEFAULT NULL,
  `username` varchar(20) DEFAULT NULL,
  `id_transaksi` char(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transactionheader`
--

INSERT INTO `transactionheader` (`no_rekening`, `username`, `id_transaksi`) VALUES
(19812630, 'absussss', 'DE001'),
(19812630, 'absussss', 'DE002'),
(19812630, 'absussss', 'DE003'),
(19812630, 'absussss', 'DE004'),
(19812630, 'absussss', 'WI001'),
(19812630, 'absussss', 'DE005'),
(19812630, 'absussss', 'WI002'),
(19812630, 'absussss', 'TR001'),
(19812630, 'absussss', 'TR002'),
(19812630, 'absussss', 'TR003'),
(19812630, 'absussss', 'TR004'),
(19812630, 'absussss', 'TR005'),
(19812630, 'absussss', 'WI003'),
(19812630, 'absussss', 'DE006'),
(19812630, 'absussss', 'TR006'),
(19812630, 'absussss', 'TR007'),
(19812632, 'geraldoooo', 'DE007');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `msrekening`
--
ALTER TABLE `msrekening`
  ADD PRIMARY KEY (`no_rekening`);

--
-- Indexes for table `mstransaksi`
--
ALTER TABLE `mstransaksi`
  ADD PRIMARY KEY (`id_transaksi`);

--
-- Indexes for table `msusername`
--
ALTER TABLE `msusername`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `transactionheader`
--
ALTER TABLE `transactionheader`
  ADD KEY `no_rekening` (`no_rekening`),
  ADD KEY `username` (`username`),
  ADD KEY `id_transaksi` (`id_transaksi`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `transactionheader`
--
ALTER TABLE `transactionheader`
  ADD CONSTRAINT `transactionheader_ibfk_1` FOREIGN KEY (`no_rekening`) REFERENCES `msrekening` (`no_rekening`),
  ADD CONSTRAINT `transactionheader_ibfk_2` FOREIGN KEY (`username`) REFERENCES `msusername` (`username`),
  ADD CONSTRAINT `transactionheader_ibfk_3` FOREIGN KEY (`id_transaksi`) REFERENCES `mstransaksi` (`id_transaksi`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

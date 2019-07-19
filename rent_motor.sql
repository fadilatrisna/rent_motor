-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 19, 2019 at 03:45 AM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rent_motor`
--

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `penyewa`
--

CREATE TABLE `penyewa` (
  `kode_penyewa` varchar(10) NOT NULL,
  `nama` varchar(35) NOT NULL,
  `alamat` varchar(30) NOT NULL,
  `no_telp` varchar(15) NOT NULL,
  `tanggal_sewa` date NOT NULL,
  `jaminan` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `penyewa`
--

INSERT INTO `penyewa` (`kode_penyewa`, `nama`, `alamat`, `no_telp`, `tanggal_sewa`, `jaminan`) VALUES
('M002', 'asdfgh', 'dddddddd', '1234678', '2019-07-13', 'kk'),
('M003', 'Fadila', 'Wonogiri', '0987654321', '2019-07-23', 'ktp');

-- --------------------------------------------------------

--
-- Table structure for table `tblkategori`
--

CREATE TABLE `tblkategori` (
  `no_kendaraan` varchar(10) NOT NULL,
  `merek_motor` varchar(20) NOT NULL,
  `harga_sewa` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblkategori`
--

INSERT INTO `tblkategori` (`no_kendaraan`, `merek_motor`, `harga_sewa`) VALUES
('AD 123 AA', 'Yamaha', 200000),
('AD 123 BB', 'Smash', 10000),
('AD 321 AA', 'Yamaha', 200000),
('AD 414 NA', 'Suzuki', 150000);

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `no_transaksi` varchar(15) NOT NULL,
  `kode_penyewa` varchar(10) NOT NULL,
  `no_kendaraan` varchar(10) NOT NULL,
  `merek_motor` varchar(30) NOT NULL,
  `harga_sewa` varchar(12) NOT NULL,
  `lama_sewa` varchar(10) NOT NULL,
  `total_bayar` varchar(20) NOT NULL,
  `bayar` varchar(20) NOT NULL,
  `kembali` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`no_transaksi`, `kode_penyewa`, `no_kendaraan`, `merek_motor`, `harga_sewa`, `lama_sewa`, `total_bayar`, `bayar`, `kembali`) VALUES
('1', 'M002', 'AD 123 AA', 'qq1', '12000', '3', '36000', '40000', '4000');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `penyewa`
--
ALTER TABLE `penyewa`
  ADD PRIMARY KEY (`kode_penyewa`);

--
-- Indexes for table `tblkategori`
--
ALTER TABLE `tblkategori`
  ADD PRIMARY KEY (`no_kendaraan`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`no_transaksi`),
  ADD KEY `no_kendaraan` (`no_kendaraan`),
  ADD KEY `kode_penyewa` (`kode_penyewa`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`no_kendaraan`) REFERENCES `tblkategori` (`no_kendaraan`),
  ADD CONSTRAINT `transaksi_ibfk_2` FOREIGN KEY (`kode_penyewa`) REFERENCES `penyewa` (`kode_penyewa`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

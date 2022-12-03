-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 03, 2022 at 10:57 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_laundry`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_daftar_paket`
--

CREATE TABLE `tb_daftar_paket` (
  `id_paket` int(11) NOT NULL,
  `foto` varchar(200) DEFAULT NULL,
  `nama_paket` varchar(200) DEFAULT NULL,
  `keterangan` varchar(200) DEFAULT NULL,
  `harga` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_daftar_paket`
--

INSERT INTO `tb_daftar_paket` (`id_paket`, `foto`, `nama_paket`, `keterangan`, `harga`) VALUES
(2, '87485-cuci gosok.jpg', 'Cuci Gosok', 'Cuci &amp; gosok', '100000'),
(3, 'cuci.jpg', 'Cuci', 'Cuci aja', '3000000'),
(4, 'setrika.jpg', 'Setrika', 'Setrika aja', '400000');

-- --------------------------------------------------------

--
-- Table structure for table `tb_order`
--

CREATE TABLE `tb_order` (
  `id` int(11) NOT NULL,
  `packet_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `total_price` varchar(250) NOT NULL,
  `qty` int(50) NOT NULL,
  `notes` varchar(250) NOT NULL,
  `status` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_order`
--

INSERT INTO `tb_order` (`id`, `packet_id`, `user_id`, `total_price`, `qty`, `notes`, `status`) VALUES
(1, 2, 19, '100000', 1, 'notes', 2),
(2, 2, 19, '1000', 1, 'okok', 0),
(3, 2, 19, '1000', 1, 'okok', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tb_user`
--

CREATE TABLE `tb_user` (
  `id_user` int(11) NOT NULL,
  `username` varchar(200) DEFAULT NULL,
  `password` varchar(200) DEFAULT NULL,
  `level` int(1) DEFAULT NULL,
  `nama` varchar(200) DEFAULT NULL,
  `nohp` varchar(15) DEFAULT NULL,
  `alamat` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_user`
--

INSERT INTO `tb_user` (`id_user`, `username`, `password`, `level`, `nama`, `nohp`, `alamat`) VALUES
(2, 'kasir@inicafe.com', '5f4dcc3b5aa765d61d8327deb882cf99', 2, 'kasir', '1202933', NULL),
(3, 'pelayan@inicafe.com', '5f4dcc3b5aa765d61d8327deb882cf99', 3, 'pelayan', '23402398', NULL),
(4, 'dapur@inicafe.com', '5f4dcc3b5aa765d61d8327deb882cf99', 4, 'dapur', '2342938423', NULL),
(19, 'asas@aa.cc', '5f4dcc3b5aa765d61d8327deb882cf99', 1, 'sfsdf', '343534', 'sdfsdf'),
(20, 'sdfsdf@ee.cc', '5f4dcc3b5aa765d61d8327deb882cf99', 2, 'edit', '323435345', 'sdsdczcxzc'),
(21, 'admin@admin.com', '5f4dcc3b5aa765d61d8327deb882cf99', 1, 'admin', '29893489384', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_daftar_paket`
--
ALTER TABLE `tb_daftar_paket`
  ADD PRIMARY KEY (`id_paket`);

--
-- Indexes for table `tb_order`
--
ALTER TABLE `tb_order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_tb_order_tb_daftar_paket` (`packet_id`),
  ADD KEY `FK_tb_order_tb_user` (`user_id`);

--
-- Indexes for table `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_daftar_paket`
--
ALTER TABLE `tb_daftar_paket`
  MODIFY `id_paket` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `tb_order`
--
ALTER TABLE `tb_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tb_order`
--
ALTER TABLE `tb_order`
  ADD CONSTRAINT `FK_tb_order_tb_daftar_paket` FOREIGN KEY (`packet_id`) REFERENCES `tb_daftar_paket` (`id_paket`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_tb_order_tb_user` FOREIGN KEY (`user_id`) REFERENCES `tb_user` (`id_user`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

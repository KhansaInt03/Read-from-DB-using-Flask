-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 14, 2022 at 06:57 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_akademik`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_mahasiswa`
--

CREATE TABLE `tbl_mahasiswa` (
  `nim` varchar(10) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `alamat` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_mahasiswa`
--

INSERT INTO `tbl_mahasiswa` (`nim`, `nama`, `alamat`) VALUES
('20.01.1235', 'Mulyaningsih', 'Jakarta'),
('20.01.1236', 'Abraham Somad', 'Jakarta'),
('20.01.1237', 'Rizki Mulyadi', 'Yogyakarta'),
('20.01.1238', 'Sasongko Jati', 'Yogyakarta'),
('20.01.1239', 'Ilham Budaya', 'Surabaya'),
('20.01.1240', 'Galau D. Muhamad', 'Palembang'),
('20.01.1241', 'Kendatu Hanon Santoso', 'Yogyakarta'),
('20.01.1242', 'Rasyid Tegar', 'Yogyakarta'),
('20.01.1243', 'Renita Oktavia', 'Yogyakarta'),
('20.01.1245', 'Renita Yoranika', 'Yogyakarta'),
('20.01.1246', 'Sylvia Mayangsari', 'Yogyakarta'),
('20.01.1247', 'Angelina Sondakh', 'Jakarta'),
('20.01.1248', 'Gayus Tambunan', 'Jakarta'),
('20.01.1249', 'Joko Wandik', 'Papua'),
('20.01.1250', 'Zulaikha', 'Bandung'),
('20.03.0001', 'Rizky Nasar', 'Bekasi'),
('20.03.0002', 'Rahmad Baekhan', 'Bekasi'),
('20.03.0003', 'Fajri Ahmad', 'Bandung'),
('20.03.0004', 'Levi Ackerman', 'Marley'),
('20.03.0005', 'Musthafa Khairandi', 'Yogyakarta'),
('20.03.0006', 'Yuni Karisma', 'Bandung'),
('20.04.1251', 'Arjuna Rama', 'Yogyakarta'),
('20.04.1252', 'Bima Yakan', 'Yogyakarta'),
('20.04.1334', 'Rahmat Santoso', 'Yogyakarta'),
('20.04.1335', 'Raihan Ahmad', 'Yogyakarta'),
('20.04.1336', 'Bekti Indrayanto', 'Bandung'),
('20.04.1337', 'Andi Sidomukti', 'Yogyakarta'),
('20.05.2000', 'Shin', 'Giad'),
('20.05.2001', 'Lena Milize', 'Alba'),
('20.05.2002', 'Rena', 'Giad'),
('20.05.2003', 'Theo', 'Giad');

--
-- Triggers `tbl_mahasiswa`
--
DELIMITER $$
CREATE TRIGGER `delete_data` BEFORE DELETE ON `tbl_mahasiswa` FOR EACH ROW begin
delete from tbl_users
where tbl_users.nim = old.nim;
end
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `insert_tbl_users` AFTER INSERT ON `tbl_mahasiswa` FOR EACH ROW begin
insert into tbl_users
set username = right(new.nim,4),
password = md5(username),
nim = new.nim,
status = 1; END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_users`
--

CREATE TABLE `tbl_users` (
  `id` int(11) NOT NULL,
  `username` varchar(4) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `nim` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_users`
--

INSERT INTO `tbl_users` (`id`, `username`, `password`, `status`, `nim`) VALUES
(2, '1235', '9996535e07258a7bbfd8b132435c5962', 1, '20.01.1235'),
(3, '1236', '7bccfde7714a1ebadf06c5f4cea752c1', 1, '20.01.1236'),
(4, '1237', 'a9eb812238f753132652ae09963a05e9', 1, '20.01.1237'),
(5, '1238', 'd38901788c533e8286cb6400b40b386d', 1, '20.01.1238'),
(6, '1239', 'b3ba8f1bee1238a2f37603d90b58898d', 1, '20.01.1239'),
(7, '1240', 'a9078e8653368c9c291ae2f8b74012e7', 1, '20.01.1240'),
(8, '1241', '1c65cef3dfd1e00c0b03923a1c591db4', 1, '20.01.1241'),
(9, '1242', '2de5d16682c3c35007e4e92982f1a2ba', 1, '20.01.1242'),
(10, '1243', 'e1d5be1c7f2f456670de3d53c7b54f4a', 1, '20.01.1243'),
(11, '1245', '5eac43aceba42c8757b54003a58277b5', 1, '20.01.1245'),
(12, '1246', '905056c1ac1dad141560467e0a99e1cf', 1, '20.01.1246'),
(13, '1247', 'e6d8545daa42d5ced125a4bf747b3688', 1, '20.01.1247'),
(14, '1248', '39e4973ba3321b80f37d9b55f63ed8b8', 1, '20.01.1248'),
(15, '1249', '2ba8698b79439589fdd2b0f7218d8b07', 1, '20.01.1249'),
(16, '1250', '81e5f81db77c596492e6f1a5a792ed53', 1, '20.01.1250'),
(17, '0001', '25bbdcd06c32d477f7fa1c3e4a91b032', 1, '20.03.0001'),
(18, '0002', 'fcd04e26e900e94b9ed6dd604fed2b64', 1, '20.03.0002'),
(19, '0003', '7cd86ecb09aa48c6e620b340f6a74592', 1, '20.03.0003'),
(20, '0004', '95b09698fda1f64af16708ffb859eab9', 1, '20.03.0004'),
(21, '1334', '8edd72158ccd2a879f79cb2538568fdc', 1, '20.04.1334'),
(22, '1335', '9cb67ffb59554ab1dabb65bcb370ddd9', 1, '20.04.1335'),
(23, '1336', '3d779cae2d46cf6a8a99a35ba4167977', 1, '20.04.1336'),
(24, '2000', '08f90c1a417155361a5c4b8d297e0d78', 1, '20.05.2000'),
(25, '1337', 'e48e13207341b6bffb7fb1622282247b', 1, '20.04.1337'),
(26, '1251', '838e8afb1ca34354ac209f53d90c3a43', 1, '20.04.1251'),
(27, '1252', 'a284df1155ec3e67286080500df36a9a', 1, '20.04.1252'),
(28, '2001', 'd0fb963ff976f9c37fc81fe03c21ea7b', 1, '20.05.2001'),
(29, '2002', '4ba29b9f9e5732ed33761840f4ba6c53', 1, '20.05.2002'),
(30, '2003', 'a591024321c5e2bdbd23ed35f0574dde', 1, '20.05.2003'),
(31, '0005', 'd39934ce111a864abf40391f3da9cdf5', 1, '20.03.0005'),
(32, '0006', '7f8bb0fe8b33780a08fe6b60ced14529', 1, '20.03.0006');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_mahasiswa`
--
ALTER TABLE `tbl_mahasiswa`
  ADD PRIMARY KEY (`nim`);

--
-- Indexes for table `tbl_users`
--
ALTER TABLE `tbl_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nim` (`nim`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_users`
--
ALTER TABLE `tbl_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_users`
--
ALTER TABLE `tbl_users`
  ADD CONSTRAINT `tbl_users_ibfk_1` FOREIGN KEY (`nim`) REFERENCES `tbl_mahasiswa` (`nim`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

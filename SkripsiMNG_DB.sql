-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Dec 06, 2017 at 11:09 PM
-- Server version: 5.7.20-0ubuntu0.16.04.1-log
-- PHP Version: 7.0.22-0ubuntu0.16.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `SkripsiMNG_DB`
--

-- --------------------------------------------------------

--
-- Table structure for table `Dosen`
--

CREATE TABLE `Dosen` (
  `Sandi_dosen` int(4) UNSIGNED ZEROFILL NOT NULL,
  `Nama_dosen` varchar(50) NOT NULL,
  `NIDN` int(10) UNSIGNED ZEROFILL NOT NULL,
  `Pangkat` varchar(50) NOT NULL,
  `Jumlah_membina_mhs` tinyint(2) UNSIGNED NOT NULL DEFAULT '0',
  `Alamat` text NOT NULL,
  `No_hp` varchar(15) NOT NULL,
  `email` varchar(90) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Dosen`
--

INSERT INTO `Dosen` (`Sandi_dosen`, `Nama_dosen`, `NIDN`, `Pangkat`, `Jumlah_membina_mhs`, `Alamat`, `No_hp`, `email`) VALUES
(5333, 'M. Zainal Arifin, S.Si., M.Kom.', 0007088007, 'Asisten Ahli/IIIb', 1, 'Pondok Blimbing Indah D3/07, Malang', '081234562398', 'arifin.mzainal@gmail.com'),
(5331, 'Didik Dwi Prasetya, S.T., M.T.', 0030097905, 'IIId / Lektor', 0, 'Perum. Bukit Cemara Tidar Block C5 No. 12, Malang', '085659948383', 'didikdwi@um.ac.id');

-- --------------------------------------------------------

--
-- Table structure for table `log_revisi_judul`
--

CREATE TABLE `log_revisi_judul` (
  `Waktu_submit_revisi` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ID_judul` int(3) NOT NULL,
  `Judul_Sebelum_revisi` varchar(200) NOT NULL,
  `Judul_Setelah_Revisi` varchar(200) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `log_revisi_judul`
--

INSERT INTO `log_revisi_judul` (`Waktu_submit_revisi`, `ID_judul`, `Judul_Sebelum_revisi`, `Judul_Setelah_Revisi`) VALUES
('2017-12-06 16:08:25', 1, 'MENGIMPLEMENTASI PREVENTIVE RISK MANAGEMENT PADA TEAM AGILE SOFTWARE DEVELOPMENT', 'MENGIMPLEMENTASI METODE PREVENTIVE RISK MANAGEMENT PADA TEAM AGILE SOFTWARE DEVELOPMENT');

--
-- Triggers `log_revisi_judul`
--
DELIMITER $$
CREATE TRIGGER `Update_Judul` AFTER INSERT ON `log_revisi_judul` FOR EACH ROW UPDATE Pengajuan_judul SET Pengajuan_judul.Nama_judul = new.Judul_Setelah_Revisi WHERE Pengajuan_judul.ID_Judul = new.ID_Judul
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `Mahasiswa`
--

CREATE TABLE `Mahasiswa` (
  `NIM` bigint(12) UNSIGNED ZEROFILL NOT NULL,
  `Nama` varchar(90) NOT NULL,
  `Program_studi` varchar(90) NOT NULL,
  `Jumlah_sks` int(3) UNSIGNED NOT NULL DEFAULT '0',
  `Alamat` text NOT NULL,
  `No_hp` varchar(15) NOT NULL,
  `email` varchar(90) NOT NULL,
  `Sandi_dosen_pembimbing` int(4) NOT NULL,
  `Nama_dosen` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Mahasiswa`
--

INSERT INTO `Mahasiswa` (`NIM`, `Nama`, `Program_studi`, `Jumlah_sks`, `Alamat`, `No_hp`, `email`, `Sandi_dosen_pembimbing`, `Nama_dosen`) VALUES
(160535611844, 'Oemar Syarif Burhan', 'S1 Teknik Informatika', 40, 'Puncak Dieng Blok JJ6/18', '081331671833', 'syarifburhan@gmail.com', 5333, 'M. Zainal Arifin, S.Si., M.Kom.');

--
-- Triggers `Mahasiswa`
--
DELIMITER $$
CREATE TRIGGER `Update_Nama_dosen` AFTER INSERT ON `Mahasiswa` FOR EACH ROW UPDATE Dosen SET Dosen.Jumlah_membina_mhs = Dosen.Jumlah_membina_mhs + 1 WHERE Dosen.Sandi_dosen = new.Sandi_dosen_pembimbing
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `Pengajuan_judul`
--

CREATE TABLE `Pengajuan_judul` (
  `ID_Judul` int(3) NOT NULL,
  `NIM` bigint(12) NOT NULL,
  `Nama_mhs` varchar(50) NOT NULL,
  `Nama_judul` varchar(200) NOT NULL,
  `Tgl_submit_judul` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Pengajuan_judul`
--

INSERT INTO `Pengajuan_judul` (`ID_Judul`, `NIM`, `Nama_mhs`, `Nama_judul`, `Tgl_submit_judul`) VALUES
(1, 160535611844, 'Oemar Syarif Burhan', 'MENGIMPLEMENTASI METODE PREVENTIVE RISK MANAGEMENT PADA TEAM AGILE SOFTWARE DEVELOPMENT', '2017-12-06 22:59:55');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Dosen`
--
ALTER TABLE `Dosen`
  ADD PRIMARY KEY (`Sandi_dosen`),
  ADD UNIQUE KEY `NIDN_U` (`NIDN`);

--
-- Indexes for table `log_revisi_judul`
--
ALTER TABLE `log_revisi_judul`
  ADD PRIMARY KEY (`Waktu_submit_revisi`),
  ADD KEY `ID_judul_idx` (`ID_judul`);

--
-- Indexes for table `Mahasiswa`
--
ALTER TABLE `Mahasiswa`
  ADD PRIMARY KEY (`NIM`);

--
-- Indexes for table `Pengajuan_judul`
--
ALTER TABLE `Pengajuan_judul`
  ADD PRIMARY KEY (`ID_Judul`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Dosen`
--
ALTER TABLE `Dosen`
  MODIFY `Sandi_dosen` int(4) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5334;
--
-- AUTO_INCREMENT for table `Mahasiswa`
--
ALTER TABLE `Mahasiswa`
  MODIFY `NIM` bigint(12) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=160535611845;
--
-- AUTO_INCREMENT for table `Pengajuan_judul`
--
ALTER TABLE `Pengajuan_judul`
  MODIFY `ID_Judul` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

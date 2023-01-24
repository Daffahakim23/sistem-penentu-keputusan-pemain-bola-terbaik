-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 24, 2023 at 08:06 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dss_profile_matching`
--

-- --------------------------------------------------------

--
-- Table structure for table `master_pelamar`
--

CREATE TABLE `master_pelamar` (
  `id_pelamar` int(11) NOT NULL,
  `nama_pelamar` varchar(50) NOT NULL,
  `no_hp` varchar(12) NOT NULL,
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `master_pelamar`
--

INSERT INTO `master_pelamar` (`id_pelamar`, `nama_pelamar`, `no_hp`, `email`) VALUES
(10, 'Karim Benzema', 'Striker', 'Real Madrid'),
(11, 'Mohammed Salah', 'Striker', 'Liverpool'),
(12, 'Lionel Messi', 'Mildfilder', 'Paris Saint Germain'),
(13, 'Kylian Mbappe', 'Striker', 'Paris Saint Germain'),
(14, 'Son', 'Striker', 'Spurs');

-- --------------------------------------------------------

--
-- Table structure for table `master_user`
--

CREATE TABLE `master_user` (
  `id_user` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `password` varchar(50) NOT NULL,
  `level` tinyint(1) NOT NULL,
  `dibuat_oleh` int(11) NOT NULL,
  `tgl_dibuat` datetime NOT NULL,
  `diubah_oleh` int(11) NOT NULL,
  `tgl_diubah` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `master_user`
--

INSERT INTO `master_user` (`id_user`, `username`, `nama`, `password`, `level`, `dibuat_oleh`, `tgl_dibuat`, `diubah_oleh`, `tgl_diubah`) VALUES
(1, 'HRD', 'Muhamad Fikri Rahmat', '21232f297a57a5a743894a0e4a801fc3', 1, 1, '2020-08-25 22:05:05', 0, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `pm_aspek`
--

CREATE TABLE `pm_aspek` (
  `id_aspek` tinyint(3) UNSIGNED NOT NULL,
  `aspek` varchar(100) NOT NULL,
  `prosentase` float NOT NULL,
  `bobot_core` float NOT NULL,
  `bobot_secondary` float NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pm_aspek`
--

INSERT INTO `pm_aspek` (`id_aspek`, `aspek`, `prosentase`, `bobot_core`, `bobot_secondary`) VALUES
(1, 'Performa', 70, 60, 40),
(2, 'Fair Play', 30, 60, 40);

-- --------------------------------------------------------

--
-- Table structure for table `pm_bobot`
--

CREATE TABLE `pm_bobot` (
  `selisih` tinyint(3) NOT NULL,
  `bobot` float NOT NULL,
  `keterangan` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pm_bobot`
--

INSERT INTO `pm_bobot` (`selisih`, `bobot`, `keterangan`) VALUES
(0, 5, 'Tidak ada selisih (kompetensi sesuai dgn yg dibutuhkan)'),
(1, 4.5, 'Kompetensi individu kelebihan 1 tingkat'),
(-1, 4, 'Kompetensi individu kekurangan 1 tingkat'),
(2, 3.5, 'Kompetensi individu kelebihan 2 tingkat'),
(-2, 3, 'Kompetensi individu kekurangan 2 tingkat'),
(3, 2.5, 'Kompetensi individu  kelebihan 3 tingkat'),
(-3, 2, 'Kompetensi individu  kekurangan 3 tingkat'),
(4, 1.5, 'Kompetensi individu kelebihan 4 tingkat'),
(-4, 1, 'Kompetensi individu kekurangan 4 tingkat');

-- --------------------------------------------------------

--
-- Table structure for table `pm_faktor`
--

CREATE TABLE `pm_faktor` (
  `id_faktor` tinyint(3) UNSIGNED NOT NULL,
  `id_aspek` tinyint(3) UNSIGNED NOT NULL,
  `faktor` varchar(30) NOT NULL,
  `target` tinyint(3) NOT NULL,
  `type` set('core','secondary') DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pm_faktor`
--

INSERT INTO `pm_faktor` (`id_faktor`, `id_aspek`, `faktor`, `target`, `type`) VALUES
(1, 1, 'Gelar Individu', 4, 'core'),
(2, 1, 'Gelar Juara Tim', 4, 'secondary'),
(3, 1, 'Kontribusi Goal', 4, 'core'),
(4, 1, 'Penampilan', 3, 'secondary'),
(5, 2, 'Hukuman Larangan Bermain', 4, 'core'),
(6, 2, 'Fouls', 4, 'secondary'),
(7, 2, 'Kartu Merah', 3, 'core'),
(8, 2, 'Kartu Kuning', 3, 'secondary');

-- --------------------------------------------------------

--
-- Table structure for table `pm_ranking`
--

CREATE TABLE `pm_ranking` (
  `id_pelamar` int(11) NOT NULL,
  `nilai_akhir` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pm_ranking`
--

INSERT INTO `pm_ranking` (`id_pelamar`, `nilai_akhir`) VALUES
(10, '4.9'),
(11, '4.23'),
(12, '4.37'),
(13, '4.28'),
(14, '1.29');

-- --------------------------------------------------------

--
-- Table structure for table `pm_sample`
--

CREATE TABLE `pm_sample` (
  `id_sample` int(11) UNSIGNED NOT NULL,
  `id_pelamar` tinyint(3) UNSIGNED NOT NULL,
  `id_faktor` tinyint(3) UNSIGNED NOT NULL,
  `value` tinyint(3) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pm_sample`
--

INSERT INTO `pm_sample` (`id_sample`, `id_pelamar`, `id_faktor`, `value`) VALUES
(559, 9, 11, 3),
(556, 5, 12, 4),
(555, 5, 11, 3),
(554, 5, 10, 4),
(612, 13, 8, 4),
(553, 5, 9, 3),
(552, 4, 12, 4),
(611, 13, 7, 2),
(560, 9, 12, 3),
(557, 9, 9, 3),
(610, 13, 6, 4),
(609, 13, 5, 2),
(608, 12, 8, 4),
(551, 4, 11, 3),
(607, 12, 7, 2),
(606, 12, 6, 4),
(605, 12, 5, 3),
(550, 4, 10, 3),
(604, 11, 8, 4),
(603, 11, 7, 2),
(549, 4, 9, 4),
(548, 3, 12, 3),
(602, 11, 6, 4),
(601, 11, 5, 3),
(600, 10, 8, 4),
(547, 3, 11, 3),
(599, 10, 7, 3),
(546, 3, 10, 3),
(545, 3, 9, 3),
(544, 2, 12, 4),
(596, 13, 4, 3),
(543, 2, 11, 3),
(595, 13, 3, 3),
(594, 13, 2, 4),
(542, 2, 10, 4),
(593, 13, 1, 3),
(592, 12, 4, 3),
(541, 2, 9, 4),
(591, 12, 3, 3),
(590, 12, 2, 4),
(558, 9, 10, 3),
(540, 1, 12, 2),
(589, 12, 1, 3),
(588, 11, 4, 3),
(587, 11, 3, 3),
(539, 1, 11, 3),
(586, 11, 2, 3),
(585, 11, 1, 3),
(598, 10, 6, 4),
(538, 1, 10, 2),
(584, 10, 4, 4),
(583, 10, 3, 4),
(597, 10, 5, 4),
(537, 1, 9, 4),
(582, 10, 2, 4),
(581, 10, 1, 4);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `master_pelamar`
--
ALTER TABLE `master_pelamar`
  ADD PRIMARY KEY (`id_pelamar`);

--
-- Indexes for table `master_user`
--
ALTER TABLE `master_user`
  ADD PRIMARY KEY (`id_user`);

--
-- Indexes for table `pm_aspek`
--
ALTER TABLE `pm_aspek`
  ADD PRIMARY KEY (`id_aspek`);

--
-- Indexes for table `pm_bobot`
--
ALTER TABLE `pm_bobot`
  ADD PRIMARY KEY (`selisih`);

--
-- Indexes for table `pm_faktor`
--
ALTER TABLE `pm_faktor`
  ADD PRIMARY KEY (`id_faktor`);

--
-- Indexes for table `pm_ranking`
--
ALTER TABLE `pm_ranking`
  ADD PRIMARY KEY (`id_pelamar`);

--
-- Indexes for table `pm_sample`
--
ALTER TABLE `pm_sample`
  ADD PRIMARY KEY (`id_sample`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `master_pelamar`
--
ALTER TABLE `master_pelamar`
  MODIFY `id_pelamar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `master_user`
--
ALTER TABLE `master_user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pm_aspek`
--
ALTER TABLE `pm_aspek`
  MODIFY `id_aspek` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `pm_faktor`
--
ALTER TABLE `pm_faktor`
  MODIFY `id_faktor` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `pm_ranking`
--
ALTER TABLE `pm_ranking`
  MODIFY `id_pelamar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `pm_sample`
--
ALTER TABLE `pm_sample`
  MODIFY `id_sample` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=613;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 15 Apr 2020 pada 18.24
-- Versi server: 10.1.37-MariaDB
-- Versi PHP: 7.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `6666`
--
CREATE DATABASE IF NOT EXISTS `6666` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `6666`;

-- --------------------------------------------------------

--
-- Struktur dari tabel `house`
--

DROP TABLE IF EXISTS `house`;
CREATE TABLE `house` (
  `id` varchar(5) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `alamat` varchar(59) NOT NULL,
  `tipe` varchar(50) NOT NULL,
  `max` int(11) NOT NULL,
  `harga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `house`
--

INSERT INTO `house` (`id`, `nama`, `alamat`, `tipe`, `max`, `harga`) VALUES
('AS001', 'asdsc', '', 'rumah', 2, 10000),
('AS002', 'asdsc', '', 'rumah', 2, 10000),
('AS003', 'asdsc', '', 'kamar', 2, 10000),
('AS004', 'asdsc', '', 'apartement', 2, 10000),
('AS005', 'asdsc', '', 'apartement', 2, 10000),
('AS006', 'asdsc', 'surabaya', 'apartement', 2, 10000),
('AS007', 'asdsc', 'surabaya', 'apartement', 2, 10000),
('AS008', 'asdsc', 'surabaya', 'apartement', 2, 10000),
('AS009', 'asdsc', 'surabaya', 'apartement', 10, 10000),
('AS010', 'asdsc', 'surabaya', 'apartement', 10, 10000),
('RU001', 'rumahku', '', 'rumah', 2, 10000),
('RU002', 'rumahku', '', 'rumah', 2, 10000),
('RU003', 'rumahku', '', 'rumah', 2, 10000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `sewa`
--

DROP TABLE IF EXISTS `sewa`;
CREATE TABLE `sewa` (
  `id` int(11) NOT NULL,
  `nohp_peminjam` varchar(50) NOT NULL,
  `nohp_pemilik` varchar(50) NOT NULL,
  `id_rumah` varchar(50) NOT NULL,
  `startdate` date NOT NULL,
  `enddate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `sewa`
--

INSERT INTO `sewa` (`id`, `nohp_peminjam`, `nohp_pemilik`, `id_rumah`, `startdate`, `enddate`) VALUES
(10, '123', '321', 'AS001', '2019-01-01', '2020-01-01'),
(11, '123', '321', 'AS001', '2019-01-01', '2020-01-01'),
(17, '123', '321', 'AS001', '2019-01-01', '2020-01-01'),
(18, '123', '321', 'AS001', '2019-01-01', '2020-01-01'),
(19, '123', '321', 'AS001', '2019-01-01', '2020-01-01'),
(20, '123', '321', 'AS001', '2019-01-01', '2020-01-01'),
(21, '123', '321', 'AS001', '2019-01-01', '2020-01-01'),
(23, '123', '321', 'AS001', '2019-01-01', '2020-01-01'),
(25, '123', '123', 'AS001', '2019-01-01', '2020-01-01'),
(26, '123', '321', 'AS001', '2019-01-01', '2020-01-01'),
(27, '123', '321', 'AS001', '2019-01-01', '2020-01-01'),
(28, '123', '321', 'AS001', '2019-01-01', '2020-01-01'),
(29, '123', '321', 'AS001', '2019-01-01', '2020-01-01'),
(30, '321', '111', 'RU003', '2020-04-15', '2020-04-29'),
(31, '123', '321', 'AS001', '2019-01-01', '2020-01-01'),
(32, '123', '321', 'AS001', '2019-01-01', '2020-01-01');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `nomorhp` varchar(50) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `alamat` varchar(50) NOT NULL,
  `status` int(1) NOT NULL,
  `saldo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`nomorhp`, `nama`, `password`, `alamat`, `status`, `saldo`) VALUES
('111', 'Wenly', '123', 'sby', 0, 10009),
('123', 'Wenly', '123', 'sby', 1, 102000),
('222', 'Wenly', '123', 'sby', 0, 10000),
('321', 'Wenly', '123', 'sby', 0, 30009);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `house`
--
ALTER TABLE `house`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `sewa`
--
ALTER TABLE `sewa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_rumah` (`id_rumah`),
  ADD KEY `fk_nohp_peminjam` (`nohp_peminjam`),
  ADD KEY `fk_nohp_pemilik` (`nohp_pemilik`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`nomorhp`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `sewa`
--
ALTER TABLE `sewa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `sewa`
--
ALTER TABLE `sewa`
  ADD CONSTRAINT `fk_nohp_pemilik` FOREIGN KEY (`nohp_pemilik`) REFERENCES `user` (`nomorhp`),
  ADD CONSTRAINT `fk_nohp_peminjam` FOREIGN KEY (`nohp_peminjam`) REFERENCES `user` (`nomorhp`),
  ADD CONSTRAINT `fk_rumah` FOREIGN KEY (`id_rumah`) REFERENCES `house` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

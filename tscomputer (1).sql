-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 24 Agu 2022 pada 05.36
-- Versi server: 10.4.17-MariaDB
-- Versi PHP: 8.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tscomputer`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `cart`
--

CREATE TABLE `cart` (
  `idcart` int(11) NOT NULL,
  `orderid` varchar(100) NOT NULL,
  `userid` int(11) NOT NULL,
  `tglorder` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` varchar(10) NOT NULL DEFAULT 'Cart',
  `ongkir` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `cart`
--

INSERT INTO `cart` (`idcart`, `orderid`, `userid`, `tglorder`, `status`, `ongkir`) VALUES
(77, '16bQpn1r9V9wY', 2, '2022-08-23 17:23:48', 'Payment', 'Rp 3.706.000,00'),
(78, '16YlzDFtvEJ9E', 3, '2022-08-23 17:37:04', 'Payment', 'Rp 1.011.000,00'),
(79, '160pZdp4Vx6xQ', 2, '2022-08-24 03:21:19', 'Cart', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `detailorder`
--

CREATE TABLE `detailorder` (
  `detailid` int(11) NOT NULL,
  `orderid` varchar(100) NOT NULL,
  `idproduk` int(11) NOT NULL,
  `qty` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `detailorder`
--

INSERT INTO `detailorder` (`detailid`, `orderid`, `idproduk`, `qty`) VALUES
(115, '16bQpn1r9V9wY', 17, 1),
(116, '16bQpn1r9V9wY', 21, 1),
(117, '16YlzDFtvEJ9E', 17, 1),
(118, '160pZdp4Vx6xQ', 21, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori`
--

CREATE TABLE `kategori` (
  `idkategori` int(11) NOT NULL,
  `namakategori` varchar(20) NOT NULL,
  `tgldibuat` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `kategori`
--

INSERT INTO `kategori` (`idkategori`, `namakategori`, `tgldibuat`) VALUES
(16, 'Aksesoris Gaming', '2022-07-17 12:03:13'),
(17, 'Komponen Komputer', '2022-07-17 12:09:40'),
(18, 'PC Gaming', '2022-07-27 08:41:41'),
(19, 'Monitor PC', '2022-07-30 15:40:24');

-- --------------------------------------------------------

--
-- Struktur dari tabel `konfirmasi`
--

CREATE TABLE `konfirmasi` (
  `idkonfirmasi` int(11) NOT NULL,
  `orderid` varchar(100) NOT NULL,
  `userid` int(11) NOT NULL,
  `payment` varchar(30) NOT NULL,
  `namarekening` varchar(25) NOT NULL,
  `tglbayar` date NOT NULL,
  `tglsubmit` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `konfirmasi`
--

INSERT INTO `konfirmasi` (`idkonfirmasi`, `orderid`, `userid`, `payment`, `namarekening`, `tglbayar`, `tglsubmit`) VALUES
(2, '16QC1QlRhO6PQ', 2, 'Bank BCA', 'saya', '2022-04-17', '2022-04-17 14:09:04'),
(3, '16mdDi4495L7.', 2, 'Bank BCA', 'Dwi', '2022-07-15', '2022-07-15 08:50:17'),
(5, '16QS36NxizVfU', 2, 'Bank BCA', 'Dwi', '2022-08-01', '2022-08-01 06:59:53'),
(6, '169D99jYkky4.', 2, 'DANA', 'Dwi', '2022-08-01', '2022-08-01 07:28:46'),
(12, '163jMD.l/JO7w', 2, 'Cash On Delivery', 'Dia', '0000-00-00', '2022-08-18 22:01:48'),
(13, '16YEb22NFFII6', 2, 'Cash On Delivery', 'Dia', '2022-08-19', '2022-08-18 22:04:00'),
(14, '16YfBGptwTMOM', 2, 'Cash On Delivery', 'Adek', '2022-08-23', '2022-08-23 04:00:56'),
(15, '16wNs/89mCwzA', 2, 'Bank BSI', 'dsfas', '2022-08-23', '2022-08-23 08:53:45'),
(16, '163/PoYjK.4oc', 2, 'Bank BSI', 'adsfsa', '2022-08-23', '2022-08-23 09:02:44');

-- --------------------------------------------------------

--
-- Struktur dari tabel `login`
--

CREATE TABLE `login` (
  `userid` int(11) NOT NULL,
  `namalengkap` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(150) NOT NULL,
  `notelp` varchar(15) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `tgljoin` timestamp NOT NULL DEFAULT current_timestamp(),
  `role` varchar(7) NOT NULL DEFAULT 'Member',
  `lastlogin` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `login`
--

INSERT INTO `login` (`userid`, `namalengkap`, `email`, `password`, `notelp`, `alamat`, `tgljoin`, `role`, `lastlogin`) VALUES
(1, 'Admin', 'admin', '$2y$10$GJVGd4ji3QE8ikTBzNyA0uLQhiGd6MirZeSJV1O6nUpjSVp1eaKzS', '01234567890', 'Indonesia', '2020-03-16 11:31:17', 'Admin', NULL),
(2, 'Guest', 'guest', '$2y$10$xXEMgj5pMT9EE0QAx3QW8uEn155Je.FHH5SuIATxVheOt0Z4rhK6K', '01234567890', 'Indonesia', '2020-03-16 11:30:40', 'Member', NULL),
(3, 'Dwi', 'dwigaluhstr@gmail.com', '$2y$10$leHcQgQh8sN4uLtARQaV7OnXB4pR/TH1bPqpxHFEitCrawYASl1Vq', '0819191919', 'Jalan Bersama', '2022-07-15 09:01:47', 'Member', NULL),
(10, 'Pemilik', 'pemilik', '$2y$10$f6cbvijLSI.H2wSLJdSFX.BMpHLmHYfdUW/XrGDzJCa7OQPB8lEfO', '0812812981298', 'Pontianak', '2022-07-27 09:23:44', 'Admin', NULL),
(11, 'SAYA', 'saya@gmail.com', '$2y$10$k6c33NBbOMtKgUD3zKp5r.FU6h3jziKvkjeFWODNJrRRmPL.p6KsS', '099425', 'sakfaskjflasd', '2022-08-23 10:51:05', 'Member', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembayaran`
--

CREATE TABLE `pembayaran` (
  `no` int(11) NOT NULL,
  `metode` varchar(25) NOT NULL,
  `norek` varchar(25) NOT NULL,
  `logo` text DEFAULT NULL,
  `an` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `pembayaran`
--

INSERT INTO `pembayaran` (`no`, `metode`, `norek`, `logo`, `an`) VALUES
(1, 'Bank BCA', '8171015634', 'images/bca.jpg', 'Puji Laksono'),
(2, 'Bank BSI', '7756345634', 'images/bsi.png', 'Puji Laksono'),
(3, 'DANA', '+62 831-5227-6678', 'images/16hv6Vo8si3uA.png', 'Puji Laksono'),
(7, 'Cash On Delivery', '(+628) 96-9381-7325', 'images/165H4fLK7UdiM.jpg', 'Puji Laksono');

-- --------------------------------------------------------

--
-- Struktur dari tabel `produk`
--

CREATE TABLE `produk` (
  `idproduk` int(11) NOT NULL,
  `idkategori` int(11) NOT NULL,
  `namaproduk` varchar(30) NOT NULL,
  `berat_produk` int(10) NOT NULL,
  `gambar` varchar(100) NOT NULL,
  `deskripsi` varchar(200) NOT NULL,
  `rate` int(11) NOT NULL,
  `hargabefore` int(11) NOT NULL,
  `hargaafter` int(11) NOT NULL,
  `tgldibuat` timestamp NOT NULL DEFAULT current_timestamp(),
  `stok_produk` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `produk`
--

INSERT INTO `produk` (`idproduk`, `idkategori`, `namaproduk`, `berat_produk`, `gambar`, `deskripsi`, `rate`, `hargabefore`, `hargaafter`, `tgldibuat`, `stok_produk`) VALUES
(16, 18, 'Custom PC', 8, 'produk/16E4sv8rJ4SRY.jpeg', 'Mantap Gaming', 5, 0, 20000000, '2022-07-30 15:35:09', 3),
(17, 16, 'Meja Gaming', 5, 'produk/16Av2EDI6TMaE.jpeg', 'Meja Gaming', 5, 1500000, 1000000, '2022-07-30 15:36:08', 2),
(18, 17, 'SSD', 6, 'produk/16CfLmJtx2hK6.jpeg', 'Baru', 5, 1000000, 700000, '2022-07-30 15:36:57', 5),
(19, 17, 'Power Supply', 2, 'produk/16sZgTiZesU0w.jpeg', 'Bagus', 5, 0, 1000000, '2022-07-30 15:37:45', 1),
(20, 19, 'Monitor AOC 22B2HN', 4, 'produk/165GVI3WjZiOQ.jpeg', 'Monitor 75 Hz', 5, 0, 2000000, '2022-07-30 15:41:31', 0),
(21, 17, 'Prosesor Intel® Core™ i5-12400', 5, 'produk/16YpPM.nGnXlQ.jpeg', 'i5 Gen 12', 5, 3000000, 2700000, '2022-07-30 15:50:45', 3),
(23, 17, 'VGA GTX 1080 TI', 6, 'produk/16I3xXxUbqwTk.jpg', 'Vga Baru', 5, 0, 1500000, '2022-08-01 09:28:50', 0),
(24, 18, 'PC RGB', 3, 'produk/16Jofi8pKh8BQ.jpeg', 'Full RGB', 5, 0, 15000000, '2022-08-01 10:07:54', 0),
(25, 16, 'Meja Gaming', 2, 'produk/16Av2EDI6TMaE.jpeg', 'Meja Gaming', 5, 0, 1200000, '2022-08-01 10:17:10', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tujuan`
--

CREATE TABLE `tujuan` (
  `id` int(11) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `provinsi` varchar(255) NOT NULL,
  `distrik` varchar(255) NOT NULL,
  `ekspedisi` varchar(255) NOT NULL,
  `orderid` varchar(100) NOT NULL,
  `paket` varchar(100) NOT NULL,
  `estimasi` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tujuan`
--

INSERT INTO `tujuan` (`id`, `alamat`, `provinsi`, `distrik`, `ekspedisi`, `orderid`, `paket`, `estimasi`) VALUES
(6, 'jalan bersama (78122)', 'Kalimantan Barat', 'Pontianak', 'jne', '16bQpn1r9V9wY', 'CTC', '1-2'),
(7, 'jalan kita', 'Kalimantan Barat', 'Sambas', 'jne', '16YlzDFtvEJ9E', 'OKE', '5-7');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`idcart`),
  ADD UNIQUE KEY `orderid` (`orderid`),
  ADD KEY `orderid_2` (`orderid`);

--
-- Indeks untuk tabel `detailorder`
--
ALTER TABLE `detailorder`
  ADD PRIMARY KEY (`detailid`),
  ADD KEY `orderid` (`orderid`),
  ADD KEY `idproduk` (`idproduk`);

--
-- Indeks untuk tabel `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`idkategori`);

--
-- Indeks untuk tabel `konfirmasi`
--
ALTER TABLE `konfirmasi`
  ADD PRIMARY KEY (`idkonfirmasi`),
  ADD KEY `userid` (`userid`);

--
-- Indeks untuk tabel `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`userid`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indeks untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`no`);

--
-- Indeks untuk tabel `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`idproduk`),
  ADD KEY `idkategori` (`idkategori`);

--
-- Indeks untuk tabel `tujuan`
--
ALTER TABLE `tujuan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orderid` (`orderid`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `cart`
--
ALTER TABLE `cart`
  MODIFY `idcart` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT untuk tabel `detailorder`
--
ALTER TABLE `detailorder`
  MODIFY `detailid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=119;

--
-- AUTO_INCREMENT untuk tabel `kategori`
--
ALTER TABLE `kategori`
  MODIFY `idkategori` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT untuk tabel `konfirmasi`
--
ALTER TABLE `konfirmasi`
  MODIFY `idkonfirmasi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT untuk tabel `login`
--
ALTER TABLE `login`
  MODIFY `userid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  MODIFY `no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `produk`
--
ALTER TABLE `produk`
  MODIFY `idproduk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT untuk tabel `tujuan`
--
ALTER TABLE `tujuan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `detailorder`
--
ALTER TABLE `detailorder`
  ADD CONSTRAINT `idproduk` FOREIGN KEY (`idproduk`) REFERENCES `produk` (`idproduk`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orderid` FOREIGN KEY (`orderid`) REFERENCES `cart` (`orderid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `konfirmasi`
--
ALTER TABLE `konfirmasi`
  ADD CONSTRAINT `userid` FOREIGN KEY (`userid`) REFERENCES `login` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `produk`
--
ALTER TABLE `produk`
  ADD CONSTRAINT `idkategori` FOREIGN KEY (`idkategori`) REFERENCES `kategori` (`idkategori`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tujuan`
--
ALTER TABLE `tujuan`
  ADD CONSTRAINT `tujuan_ibfk_1` FOREIGN KEY (`orderid`) REFERENCES `detailorder` (`orderid`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

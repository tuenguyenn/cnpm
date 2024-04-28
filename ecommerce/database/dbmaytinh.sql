-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th3 01, 2024 lúc 02:34 PM
-- Phiên bản máy phục vụ: 10.4.28-MariaDB
-- Phiên bản PHP: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `dbmaytinh`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cart`
--

CREATE TABLE `cart` (
  `ID` int(11) NOT NULL,
  `Product` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Đang đổ dữ liệu cho bảng `category`
--

INSERT INTO `category` (`id`, `title`) VALUES
(1, 'Laptops'),
(2, 'Case máy tính'),
(3, 'Ổ cứng'),
(4, 'Ghế Gaming'),
(6, 'Bàn phím'),
(11, 'RAM'),
(15, 'Chuột máy tính'),
(18, 'Card đồ hoạ'),
(20, 'Phụ kiện'),
(22, 'PC'),
(23, 'Màn hình');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order`
--

CREATE TABLE `order` (
  `id` int(11) NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `contact` varchar(100) NOT NULL,
  `address` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(100) NOT NULL,
  `item` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `amount` varchar(100) NOT NULL,
  `status` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `dateOrdered` varchar(100) NOT NULL,
  `dateDelivered` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Đang đổ dữ liệu cho bảng `order`
--

INSERT INTO `order` (`id`, `name`, `contact`, `address`, `email`, `item`, `amount`, `status`, `dateOrdered`, `dateDelivered`) VALUES
(12, 'tuệ Nguyễn', '222', 'hh', '', '(2) test, ', '0', 'confirmed', '02/28/24 05:18:42 PM', '02/28/24 05:32:51 PM'),
(13, 'ngọc ánh', '0961912697', '55 trường chinh', '', '(1) Laptop ASUS X512 I3-1315u, ', '0', 'unconfirmed', '02/29/24 12:48:54 AM', ''),
(14, 'tuệ Nguyễn', '0961912697', '55 trường chinh', 'dungx@gmail.com', '', '0', 'unconfirmed', '02/29/24 12:52:25 AM', ''),
(15, 'tuệ Nguyễn', '0961912697', '55 trường chinh', 'dungx@gmail.com', '', '0', 'confirmed', '02/29/24 12:54:51 AM', '02/29/24 12:55:31 AM'),
(16, 'ad ad', '0961912697', 'ad', 'tuenguyenn2706@gmail.com', '(1) Logitech G502 Hero Gaming Mouse, ', '0', 'unconfirmed', '02/29/24 12:57:30 AM', ''),
(17, 'ad Nguyễn', '0961912697', 'hh', '', '(1) Laptop ASUS X512 I3-1315u, ', '0', 'confirmed', '02/29/24 12:59:34 AM', '03/01/24 03:37:37 PM'),
(18, 'tuệ Nguyễn', '0961912697', 'hh', 'tuenguyenn2706@gmail.com', '', '0', 'unconfirmed', '02/29/24 01:00:28 AM', ''),
(19, 'ad ánh', '0961912697', '55 trường chinh', '', '', '0', 'delivered', '02/29/24 01:01:11 AM', '03/01/24 07:18:54 PM'),
(20, 'tuệ ad', '222', '55 trường chinh', 'dungx@gmail.com', '(1) Logitech G Pro Mechanical Keyboard, ', '0', 'unconfirmed', '02/29/24 01:01:55 AM', ''),
(21, 'ad ad', 'a', '55 trường chinh', 'dungx@gmail.com', '(1) Logitech G Pro Mechanical Keyboard, ', '0', 'unconfirmed', '02/29/24 01:02:15 AM', ''),
(22, 'ad ad', 'a', '55 trường chinh', 'dungx@gmail.com', '', '0', 'unconfirmed', '02/29/24 01:02:31 AM', ''),
(23, 'ad ad', 'a', '55 trường chinh', 'dungx@gmail.com', '', '0', 'unconfirmed', '02/29/24 01:04:03 AM', ''),
(24, 'ngọc Nguyễn', '0961912697', 'hh', 'dungx@gmail.com', '', '0', 'unconfirmed', '02/29/24 01:04:21 AM', ''),
(25, 'tuệ Nguyễn', '0961912697', '55 trường chinh', 'dungx@gmail.com', '(1) HyperX Cloud II Gaming Headset, (1) Laptop ASUS X512 I3-1315u, ', '0', 'unconfirmed', '03/01/24 03:44:33 PM', '');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `ID` int(11) NOT NULL,
  `imgUrl` text NOT NULL,
  `Product` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Price` double NOT NULL,
  `Category` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`ID`, `imgUrl`, `Product`, `Description`, `Price`, `Category`) VALUES
(86, 'asusx512.jpg', 'Laptop ASUS X512 I3-1315u', 'Laptop mỏng nhẹ, màn hình 15.6 inch', 849.99, 'Laptops'),
(87, 'hp-omen-25l-ryzen--new-2.jpg', 'Desktop Gaming HP Omen', 'Máy tính đồng bộ chuyên game', 1499.99, 'PC'),
(88, '78559_man_hinh_dell_ultrasharp_u2419h_cu_dep_2.png', 'Monitor Dell UltraSharp U2419H', 'Màn hình IPS 24 inch', 299.99, 'Màn hình'),
(89, 'pavilion.jpg', 'Laptop HP Pavilion', 'Laptop đa nhiệm với cấu hình mạnh mẽ', 799.99, 'Laptops'),
(90, 'Logitech-G-Pro-X-3.jpg', 'Logitech G Pro Mechanical Keyboard', 'Bàn phím cơ chuyên gaming', 129.99, 'Bàn phím'),
(91, 'H6c8aa7fad6e945f98187af03fb366c2f4.jpg_300x300.jpg', 'Logitech G502 Hero Gaming Mouse', 'Chuột gaming chất lượng cao', 69.99, 'Chuột máy tính'),
(92, 'l850-3.jpg', 'Epson EcoTank L3150 Printer', 'Máy in phun màu tiết kiệm mực', 299.99, 'Phụ kiện'),
(93, 'shopping.jpg', 'WD Elements External HDD 1TB', 'Ổ cứng di động dung lượng lớn', 59.99, 'Bộ nhớ'),
(94, 'shoppingaa.jpg', 'Laptop Lenovo IdeaPad', 'Laptop màn hình 14 inch, cấu hình phổ thông', 599.99, 'Laptops'),
(95, 'inspiron-aio-desktops-5410-600x600.jpg', 'Desktop Dell Inspiron', 'Máy tính đồng bộ phổ thông', 899.99, 'PC'),
(96, 'manhinhsamsunglc27g55tqbexxv27inchqhd144hzcong_0b1b9eaaabff4192acdaa1ebeb9bf275_grande.jpg', 'Samsung Curved Monitor', 'Màn hình cong LED 27 inch', 399.99, 'Màn hình'),
(97, 'shoppingnmn.jpg', 'Laptop Dell XPS 13', 'Laptop siêu mỏng, màn hình InfinityEdge', 1299.99, 'Laptops'),
(98, 'keybo.jpg', 'Razer BlackWidow Mechanical Keyboard', 'Bàn phím cơ chuyên gaming với đèn RGB', 169.99, 'Bàn phím'),
(99, 'mousea.jpg', 'SteelSeries Rival 600 Gaming Mouse', 'Chuột gaming với cảm biến kép', 79.99, 'Chuột máy tính'),
(100, 'printera.jpg', 'HP LaserJet Pro M404dn Printer', 'Máy in laser đơn sắc tốc độ cao', 249.99, 'Phụ kiện'),
(101, 'ssda.jpg', 'Samsung T5 Portable SSD 1TB', 'Ổ cứng SSD di động siêu nhỏ gọn', 149.99, 'Bộ nhớ'),
(102, 'keyboarda.jpg', 'Logitech G413 Mechanical Keyboard', 'Bàn phím cơ chuyên gaming với cảm biến Romer-G', 79.99, 'Bàn phím'),
(103, 'keyboardb.jpg', 'Corsair K95 RGB Platinum XT Keyboard', 'Bàn phím cơ chuyên gaming với đèn RGB đầy đủ', 179.99, 'Bàn phím'),
(105, 'heada.jpg', 'Sennheiser HD 660 S Audiophile Headphones', 'Tai nghe chất lượng cao dành cho người yêu nhạc', 449.99, 'Phụ kiện'),
(108, 'casea.jpg', 'Corsair Crystal Series 570X RGB Case', 'Vỏ máy tính chất lượng cao với đèn RGB', 199.99, 'Case máy tính'),
(109, 'caseb.jpg', 'NZXT H510 Compact ATX Mid-Tower Case', 'Vỏ máy tính kiểu dáng hiện đại', 79.99, 'Case máy tính'),
(110, 'ramb.jpg', 'HyperX Fury RGB 16GB (2 x 8GB) DDR4 RAM', 'Bộ nhớ RAM DDR4 với đèn RGB', 89.99, 'Bộ nhớ'),
(111, 'rama.jpg', 'G.SKILL Trident Z Neo Series 32GB (2 x 16GB) DDR4 RAM', 'Bộ nhớ RAM DDR4 chuyên gaming', 159.99, 'Bộ nhớ'),
(112, 'coolera.jpg', 'Cooler Master Hyper 212 RGB CPU Cooler', 'Quạt tản nhiệt CPU với đèn RGB', 49.99, 'Phụ kiện'),
(113, 'coolerb.jpg', 'Noctua NH-D15 Dual Tower CPU Cooler', 'Quạt tản nhiệt CPU cao cấp', 89.99, 'Phụ kiện'),
(114, 'cardb.jpg', 'NVIDIA GeForce RTX 3080 Graphics Card', 'Card đồ hoạ mạnh mẽ với ray tracing', 699.99, 'Card đồ hoạ'),
(115, 'carda.jpg', 'MSI GeForce RTX 4060 VENTUS 2X WHITE 8G OC VTS', 'Hỗ trợ chơi game, xử lý đồ họa hiệu quả với 8GB VRAM', 649.99, 'Card đồ hoạ'),
(116, 'cardc.jpg', 'NVIDIA GeForce GTX 1660 Super Graphics Card', 'Card đồ hoạ giá trung bình với hiệu suất tốt', 249.99, 'Card đồ hoạ'),
(117, 'cardd.jpg', 'ASUS Dual GeForce RTX 3060 Graphics Card', 'Card đồ hoạ đa nhiệm với công nghệ NVIDIA DLSS', 399.99, 'Card đồ hoạ'),
(118, 'chaira.jpg', 'Secretlab Titan Series Gaming Chair', 'Ghế gaming cao cấp với đệm lưng lớn', 399.99, 'Ghế Gaming'),
(119, 'ghea.jpg', 'DXRacer Formula Series Gaming Chair', 'Ghế gaming chất lượng với kiểu dáng thể thao', 249.99, 'Ghế Gaming'),
(120, 'ghec.jpg', 'AKRacing Masters Series Pro Gaming Chair', 'Ghế gaming chuyên nghiệp với đệm cổ và đệm lưng', 299.99, 'Ghế Gaming'),
(121, 'ghe-comg-thai-hoc-gt-chair-marritx_c1b7eafc8d984849bbfc7d0b0383f604_master.jpg', 'Vertagear Racing Series S-Line SL4000 Gaming Chair', 'Ghế gaming có khung thép và đệm bọc da', 249.99, 'Ghế Gaming');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Đang đổ dữ liệu cho bảng `user`
--

INSERT INTO `user` (`id`, `username`, `password`) VALUES
(1, 'administrator', 'bobby'),
(2, 'admin', 'admin');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`ID`);

--
-- Chỉ mục cho bảng `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `cart`
--
ALTER TABLE `cart`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT cho bảng `order`
--
ALTER TABLE `order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=122;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

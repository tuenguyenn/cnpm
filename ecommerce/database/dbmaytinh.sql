-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th4 29, 2024 lúc 12:30 AM
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
  `customer_id` int(11) DEFAULT NULL,
  `Product` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `imgUrl` text NOT NULL,
  `Price` decimal(10,2) NOT NULL,
  `Quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Đang đổ dữ liệu cho bảng `cart`
--

INSERT INTO `cart` (`ID`, `customer_id`, `Product`, `imgUrl`, `Price`, `Quantity`) VALUES
(85, 13, 'Mac Mini', '', 699.99, 1);

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
(24, 'Iphone'),
(25, 'Ipad'),
(26, 'Watch'),
(27, 'Phụ kiện'),
(28, 'Máy cũ'),
(30, 'Mac');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `address` varchar(30) NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  `birthdate` date DEFAULT NULL,
  `cususer` varchar(30) NOT NULL,
  `cuspass` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `customer`
--

INSERT INTO `customer` (`customer_id`, `name`, `address`, `phone_number`, `birthdate`, `cususer`, `cuspass`) VALUES
(7, 'tue', 'aa', '0901231131', '2024-04-11', 'tue', 'ebbe2769ec44e15f1abbc94e20709456'),
(12, 'Nguyễn Tuệ', '772 Kim Giang', '0382122539', '2024-04-17', 'tuenguỷen', '123456'),
(13, 'Ngọc Ánh', '123', '95754744', '2024-04-11', 'tuee123', '7e7576bde8baa58874dc2a8a752ee3dc');

--
-- Bẫy `customer`
--
DELIMITER $$
CREATE TRIGGER `encrypt_cuspass` BEFORE INSERT ON `customer` FOR EACH ROW BEGIN
    SET NEW.cuspass = MD5(NEW.cuspass);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order`
--

CREATE TABLE `order` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `contact` varchar(100) NOT NULL,
  `address` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `item` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `imgUrl` text NOT NULL,
  `amount` int(100) NOT NULL,
  `status` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `dateOrdered` varchar(100) NOT NULL,
  `dateDelivered` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Đang đổ dữ liệu cho bảng `order`
--

INSERT INTO `order` (`id`, `customer_id`, `name`, `contact`, `address`, `item`, `imgUrl`, `amount`, `status`, `dateOrdered`, `dateDelivered`) VALUES
(12, NULL, 'tuệ Nguyễn', '222', 'hh', '(2) test, ', '', 0, 'confirmed', '02/28/24 05:18:42 PM', '02/28/24 05:32:51 PM'),
(13, NULL, 'ngọc ánh', '0961912697', '55 trường chinh', '(1) Laptop ASUS X512 I3-1315u, ', '', 0, 'unconfirmed', '02/29/24 12:48:54 AM', ''),
(14, NULL, 'tuệ Nguyễn', '0961912697', '55 trường chinh', '', '', 0, 'delivered', '02/29/24 12:52:25 AM', '04/03/24 10:27:13 PM'),
(15, NULL, 'tuệ Nguyễn', '0961912697', '55 trường chinh', '', '', 0, 'confirmed', '02/29/24 12:54:51 AM', '02/29/24 12:55:31 AM'),
(16, NULL, 'ad ad', '0961912697', 'ad', '(1) Logitech G502 Hero Gaming Mouse, ', '', 0, 'unconfirmed', '02/29/24 12:57:30 AM', ''),
(17, NULL, 'ad Nguyễn', '0961912697', 'hh', '(1) Laptop ASUS X512 I3-1315u, ', '', 0, 'confirmed', '02/29/24 12:59:34 AM', '03/01/24 03:37:37 PM'),
(18, NULL, 'tuệ Nguyễn', '0961912697', 'hh', '', '', 0, 'unconfirmed', '02/29/24 01:00:28 AM', ''),
(19, NULL, 'ad ánh', '0961912697', '55 trường chinh', '', '', 0, 'delivered', '02/29/24 01:01:11 AM', '03/01/24 07:18:54 PM'),
(20, NULL, 'tuệ ad', '222', '55 trường chinh', '(1) Logitech G Pro Mechanical Keyboard, ', '', 0, 'unconfirmed', '02/29/24 01:01:55 AM', ''),
(21, NULL, 'ad ad', 'a', '55 trường chinh', '(1) Logitech G Pro Mechanical Keyboard, ', '', 0, 'unconfirmed', '02/29/24 01:02:15 AM', ''),
(22, NULL, 'ad ad', 'a', '55 trường chinh', '', '', 0, 'unconfirmed', '02/29/24 01:02:31 AM', ''),
(23, NULL, 'ad ad', 'a', '55 trường chinh', '', '', 0, 'unconfirmed', '02/29/24 01:04:03 AM', ''),
(24, NULL, 'ngọc Nguyễn', '0961912697', 'hh', '', '', 0, 'unconfirmed', '02/29/24 01:04:21 AM', ''),
(25, NULL, 'tuệ Nguyễn', '0961912697', '55 trường chinh', '(1) HyperX Cloud II Gaming Headset, (1) Laptop ASUS X512 I3-1315u, ', '', 0, 'delivered', '03/01/24 03:44:33 PM', '03/01/24 09:10:58 PM'),
(26, NULL, 'â d', 'a', 'a', '', '', 0, 'unconfirmed', '04/15/24 10:59:43 PM', ''),
(42, 13, 'Ngọc Ánh aaa', '0961912697', 'aaa', '(2) iPhone X (Đã qua sử dụng), ', '???ng_d?n_?nh_9', 0, 'unconfirmed', '04/29/24 03:40:58 AM', ''),
(43, 13, 'Ngọc Ánh', '95754744', '123', '', '', 0, 'unconfirmed', '04/29/24 03:58:29 AM', ''),
(44, 13, '', 'a', 'aaa', '(1) iPhone X (Đã qua sử dụng), ', '???ng_d?n_?nh_9', 0, 'unconfirmed', '04/29/24 04:05:38 AM', ''),
(45, 13, 'Ngọc Ánh', '95754744', '123', '(1) MacBook Pro 2024, ', 'Annotation 2023-11-24 132733.png', 0, 'unconfirmed', '04/29/24 04:09:58 AM', ''),
(46, 13, 'Ngọc Ánh', '95754744', '123', '(1) Iphone 15 512g, ', 'iphone_15_didongviet.jpg', 0, 'unconfirmed', '04/29/24 04:10:59 AM', ''),
(47, 13, 'Ngọc Ánh', '95754744', '123', '(1) iPhone 8 (Đã qua sử dụng), ', '???ng_d?n_?nh_10', 0, 'unconfirmed', '04/29/24 04:11:25 AM', ''),
(48, 13, 'Ngọc Ánh', '95754744', '123', '(1) MacBook Pro 2023, ', '???ng_d?n_?nh_3', 0, 'unconfirmed', '04/29/24 04:14:40 AM', ''),
(49, 13, 'Ngọc Ánh', '95754744', '123', '(1) HomePod Mini, ', '???ng_d?n_?nh_8', 0, 'unconfirmed', '04/29/24 04:15:31 AM', ''),
(50, 13, 'Ngọc Ánh', '95754744', '123', '(1) iPhone X (Đã qua sử dụng), ', '???ng_d?n_?nh_9', 0, 'unconfirmed', '04/29/24 04:16:47 AM', ''),
(51, 13, '', '', '', '(1) MacBook Pro 2023, ', '???ng_d?n_?nh_3', 0, 'unconfirmed', '04/29/24 04:22:11 AM', ''),
(52, 13, 'Ngọc Ánh', '95754744', '123', '(1) MacBook Pro 2023, ', '???ng_d?n_?nh_3', 0, 'unconfirmed', '04/29/24 04:36:00 AM', ''),
(53, 13, 'Ngọc Ánh', '95754744', '123', '(1) iPhone X (Đã qua sử dụng), ', '???ng_d?n_?nh_9', 0, 'unconfirmed', '04/29/24 04:38:30 AM', ''),
(54, 13, 'Ngọc Ánh', '95754744', '123', '(1) MacBook Pro 2023, ', '???ng_d?n_?nh_3', 0, 'unconfirmed', '04/29/24 04:52:57 AM', ''),
(55, 13, 'Ngọc Ánh', '95754744', '123', '(1) HomePod Mini, ', '???ng_d?n_?nh_8', 0, 'unconfirmed', '04/29/24 04:55:09 AM', '');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `Product_ID` int(11) NOT NULL,
  `imgUrl` text NOT NULL,
  `Product` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Price` double NOT NULL,
  `Category` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`Product_ID`, `imgUrl`, `Product`, `Description`, `Price`, `Category`) VALUES
(123, 'iphone-14-128gb-mau-xanh-didongviet.jpg', 'Iphone 14 128g', 'được xem là mẫu smartphone bùng nổ của nhà táo trong năm 2022, ấn tượng với ngoại hình trẻ trung, màn hình chất lượng đi kèm với những cải tiến về hệ điều hành và thuật toán xử lý hình ảnh, giúp máy trở thành cái tên thu hút được đông đảo người dùng quan tâm tại thời điểm ra mắt.', 7999, 'Iphone'),
(126, 'iphone_15_didongviet.jpg', 'Iphone 15 512g', 'được xem là mẫu smartphone bùng nổ của nhà táo trong năm 2022, ấn tượng với ngoại hình trẻ trung, màn hình chất lượng đi kèm với những cải tiến về hệ điều hành và thuật toán xử lý hình ảnh, giúp máy trở thành cái tên thu hút được đông đảo người dùng quan tâm tại thời điểm ra mắt.', 9999, 'Iphone'),
(127, 'iphone-15-pro-max-.jpg', 'iPhone 15pro max', 'Sản phẩm mới nhất của Apple, với nhiều tính năng tiên tiến và thiết kế đẹp mắt.', 10999.99, 'Iphone'),
(128, 'ipad-pro.jpg', 'iPad Pro 2024', 'Bản cập nhật mới của dòng iPad Pro với màn hình lớn và hiệu suất mạnh mẽ.', 1299.99, 'ipad'),
(129, 'Annotation 2023-11-24 132733.png', 'MacBook Pro 2024', 'Laptop cao cấp của Apple với chip M2 và màn hình Retina chất lượng cao.', 2299.99, 'Mac'),
(131, '???ng_d?n_?nh_2', 'iPad Pro 2024', 'Bản cập nhật mới của dòng iPad Pro với màn hình lớn và hiệu suất mạnh mẽ.', 1299.99, 'Iphone'),
(132, '???ng_d?n_?nh_3', 'MacBook Pro 2023', 'Laptop cao cấp của Apple với chip M2 và màn hình Retina chất lượng cao.', 2299.99, 'Mac'),
(133, '???ng_d?n_?nh_4', 'Apple Watch Series 8', 'Đồng hồ thông minh tiên tiến với nhiều tính năng sức khỏe và liên lạc.', 499.99, 'Watch'),
(134, '???ng_d?n_?nh_5', 'AirPods Pro', 'Tai nghe không dây cao cấp với chế độ chống ồn và chất âm tuyệt vời.', 249.99, 'Phụ kiện'),
(135, '???ng_d?n_?nh_6', 'Mac Mini', 'Máy tính để bàn nhỏ gọn với hiệu suất mạnh mẽ và khả năng mở rộng linh hoạt.', 699.99, 'mac'),
(136, '???ng_d?n_?nh_7', 'iMac 27-inch', 'Máy tính All-in-One với màn hình lớn và hiệu suất đa nhiệm tốt.', 1799.99, 'mac'),
(137, '???ng_d?n_?nh_8', 'HomePod Mini', 'Loa thông minh với âm thanh chất lượng cao và tính năng trợ lý ảo Siri tích hợp.', 99.99, 'Phụ kiện'),
(138, '???ng_d?n_?nh_9', 'Magic Keyboard', 'Bàn phím không dây với thiết kế mỏng nhẹ và cảm biến cảm ứng.', 129.99, 'Phụ kiện'),
(139, '???ng_d?n_?nh_10', 'Apple Pencil (2nd Generation)', 'Bút cảm ứng cho iPad với khả năng nhận biết áp lực và góc nghiêng.', 129.99, 'accessories'),
(140, '???ng_d?n_?nh_6', 'Mac Mini', 'Máy tính để bàn nhỏ gọn với hiệu suất mạnh mẽ và khả năng mở rộng linh hoạt.', 699.99, 'mac'),
(141, '???ng_d?n_?nh_7', 'iMac 27-inch', 'Máy tính All-in-One với màn hình lớn và hiệu suất đa nhiệm tốt.', 1799.99, 'mac'),
(142, '???ng_d?n_?nh_8', 'HomePod Mini', 'Loa thông minh với âm thanh chất lượng cao và tính năng trợ lý ảo Siri tích hợp.', 99.99, 'Phụ kiện'),
(143, '???ng_d?n_?nh_9', 'Magic Keyboard', 'Bàn phím không dây với thiết kế mỏng nhẹ và cảm biến cảm ứng.', 129.99, 'Phụ kiện'),
(144, '???ng_d?n_?nh_10', 'Apple Pencil (2nd Generation)', 'Bút cảm ứng cho iPad với khả năng nhận biết áp lực và góc nghiêng.', 129.99, 'Phụ kiện'),
(145, '???ng_d?n_?nh_8', 'iPhone 11 (Đã qua sử dụng)', 'iPhone 11 đã qua sử dụng, có thể có một số vết trầy xước nhẹ hoặc dấu hiệu về sử dụng.', 399.99, 'Máy cũ'),
(146, '???ng_d?n_?nh_9', 'iPhone X (Đã qua sử dụng)', 'iPhone X đã qua sử dụng, có thể có một số vết trầy xước nhỏ hoặc dấu hiệu về sử dụng.', 299.99, 'Máy cũ'),
(147, '???ng_d?n_?nh_10', 'iPhone 8 (Đã qua sử dụng)', 'iPhone 8 đã qua sử dụng, có thể có một số vết trầy xước nhỏ hoặc dấu hiệu về sử dụng.', 199.99, 'Máy cũ'),
(148, '???ng_d?n_?nh_11', 'iPhone SE (Đã qua sử dụng)', 'iPhone SE đã qua sử dụng, có thể có một số vết trầy xước nhẹ hoặc dấu hiệu về sử dụng.', 149.99, 'Máy cũ'),
(149, '14-pro-max.jpg', 'Iphone 14 pro max', 'được xem là mẫu smartphone bùng nổ của nhà táo trong năm 2022, ấn tượng với ngoại hình trẻ trung, màn hình chất lượng đi kèm với những cải tiến về hệ điều hành và thuật toán xử lý hình ảnh, giúp máy trở thành cái tên thu hút được đông đảo người dùng quan tâm tại thời điểm ra mắt', 10199, 'Iphone');

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
  ADD PRIMARY KEY (`ID`),
  ADD KEY `fk_customer_id` (`customer_id`);

--
-- Chỉ mục cho bảng `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`);

--
-- Chỉ mục cho bảng `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_order_customer` (`customer_id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`Product_ID`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `cart`
--
ALTER TABLE `cart`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- AUTO_INCREMENT cho bảng `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT cho bảng `customer`
--
ALTER TABLE `customer`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT cho bảng `order`
--
ALTER TABLE `order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `Product_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=150;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `fk_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `fk_order_customer` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

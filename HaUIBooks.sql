/*create database HauiBooks;*/
ALTER TABLE nguoidung ADD COLUMN avatar VARCHAR(255) DEFAULT NULL;nguoidung
use HauiBooks;
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


DROP TABLE IF EXISTS `chitietsanpham`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chitietsanpham` (
  `id` int NOT NULL AUTO_INCREMENT,
  `MaSanPham` int NOT NULL,
  `NgonNgu` NVARCHAR(50) NOT NULL,
  `NhaXuatBan` NVARCHAR(20) NOT NULL,
  `SoLuong` INT NOT NULL,
  `daxoa` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `MaSanPham` (`MaSanPham`),
  CONSTRAINT `chitietsanpham_ibfk_1` FOREIGN KEY (`MaSanPham`) REFERENCES `sanpham` (`MaSanPham`)
) ENGINE=InnoDB AUTO_INCREMENT=406 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;



LOCK TABLES `chitietsanpham` WRITE;
/*!40000 ALTER TABLE `chitietsanpham` DISABLE KEYS */;
INSERT INTO chitietsanpham (MaSanPham, NgonNgu, NhaXuatBan, SoLuong, daxoa) VALUES
(1, 'English', 'NXB Kim Đồng', 10, 0),
(2, 'Tiếng Việt', 'NXB Tuổi Trẻ', 15, 0),
(3, 'English', 'NXB Tuổi Trẻ', 20, 0),
(4, 'Tiếng Việt', 'NXB Kim Đồng', 8, 0),
(5, 'English', 'NXB Tuổi Trẻ', 12, 0),
(6, 'Tiếng Việt', 'NXB Tuổi Trẻ', 7, 0),
(7, 'English', 'NXB Kim Đồng', 25, 0),
(2, 'Tiếng Việt', 'NXB Tuổi Trẻ', 5, 0),
(9, 'English', 'NXB Tuổi Trẻ', 18, 0),
(10, 'Tiếng Việt', 'NXB Kim Đồng', 30, 0);

/*!40000 ALTER TABLE `chitietsanpham` ENABLE KEYS */;
UNLOCK TABLES;



DROP TABLE IF EXISTS `danhgia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `danhgia` (
  `idDanhGia` int NOT NULL AUTO_INCREMENT,
  `MaNguoiDung` int NOT NULL,
  `tenNguoiDung` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `MaSanPham` int NOT NULL,
  `soLuongSao` int NOT NULL DEFAULT '1',
  `noiDung` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `thoiGian` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `phanHoiQuantrivien` varchar(5000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`idDanhGia`),
  KEY `MaNguoiDung` (`MaNguoiDung`),
  KEY `MaSanPham` (`MaSanPham`),
  CONSTRAINT `danhgia_ibfk_1` FOREIGN KEY (`MaNguoiDung`) REFERENCES `nguoidung` (`MaNguoiDung`),
  CONSTRAINT `danhgia_ibfk_2` FOREIGN KEY (`MaSanPham`) REFERENCES `sanpham` (`MaSanPham`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `danhgia`
--

LOCK TABLES `danhgia` WRITE;
/*!40000 ALTER TABLE `danhgia` DISABLE KEYS */;
INSERT INTO danhgia (MaNguoiDung, tenNguoiDung, MaSanPham, soLuongSao, noiDung, thoiGian, phanHoiQuantrivien) VALUES
(1, 'Nguyen Van A', 17, 5, 'Sách rất hay, phù hợp cho trẻ em.', '2025-05-01 10:00:00', NULL),
(2, 'Nguyen Van A', 18, 4, 'Truyện hấp dẫn, hình ảnh đẹp.', '2025-05-02 11:20:00', NULL),
(3, 'Nguyen Van A', 19, 3, 'Nội dung ổn nhưng in hơi mờ.', '2025-05-03 09:45:00', NULL),
(4, 'Nguyen Van A', 20, 5, 'Rất đáng tiền, con tôi rất thích.', '2025-05-03 15:30:00', NULL),
(5, 'Nguyen Van A', 21, 4, 'Truyện cổ tích thú vị, phù hợp mọi lứa tuổi.', '2025-05-04 08:00:00', NULL),
(6, 'Nguyen Van A', 22, 2, 'Nội dung đơn giản quá, không như mong đợi.', '2025-05-04 17:00:00', NULL),
(1, 'Nguyen Van A', 23, 5, 'Tuyệt vời, sách minh họa sinh động.', '2025-05-05 12:30:00', NULL),
(2, 'Nguyen Van A', 24, 3, 'Khá ổn nhưng giấy in không tốt lắm.', '2025-05-06 14:00:00', NULL),
(3, 'Nguyen Van A', 25, 4, 'Sách có nhiều kiến thức bổ ích.', '2025-05-07 09:00:00', NULL),
(4, 'Nguyen Van A', 26, 5, 'Con tôi rất thích cuốn này, cảm ơn shop!', '2025-05-07 16:00:00', NULL);

/*!40000 ALTER TABLE `danhgia` ENABLE KEYS */;
UNLOCK TABLES;



DROP TABLE IF EXISTS `danhmucsanpham`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `danhmucsanpham` (
  `MaDanhMuc` int NOT NULL AUTO_INCREMENT,
  `TenDanhMuc` nvarchar(100) NOT NULL,
  `daxoa` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`MaDanhMuc`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;



LOCK TABLES `danhmucsanpham` WRITE;
/*!40000 ALTER TABLE `danhmucsanpham` DISABLE KEYS */;
INSERT INTO `danhmucsanpham` VALUES (1,'Sách thiếu nhi',0),(2,'Truyện cổ tích',0),(3,'Truyện dân gian',0),(4,'Sách giáo khoa',0);
/*!40000 ALTER TABLE `danhmucsanpham` ENABLE KEYS */;
UNLOCK TABLES;


DROP TABLE IF EXISTS `donhang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `donhang` (
  `idDonHang` int NOT NULL AUTO_INCREMENT,
  `MaNguoiDung` int NOT NULL,
  `id` int NOT NULL,
  `TenKhachHang` varchar(255) NOT NULL,
  `SoDienThoai` int NOT NULL,
  `DiaChiGiaoHang` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `TrangThai` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `SoLuong` int DEFAULT NULL,
  `Gia` decimal(10,2) DEFAULT NULL,
  `ngaydathang` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`idDonHang`),
  KEY `MaNguoiDung` (`MaNguoiDung`),
  KEY `id` (`id`),
  CONSTRAINT `donhang_ibfk_1` FOREIGN KEY (`MaNguoiDung`) REFERENCES `nguoidung` (`MaNguoiDung`),
  CONSTRAINT `donhang_ibfk_2` FOREIGN KEY (`id`) REFERENCES `chitietsanpham` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;



LOCK TABLES `donhang` WRITE;
/*!40000 ALTER TABLE `donhang` DISABLE KEYS */;
INSERT INTO `donhang` VALUES (6,2,4,'Nguyễn Hữu Thắng',357975654,'Trường đại học công nghiệp hà nội','Đang giao đến bạn',1,16.64,'14/2/2024'),(12,2,15,'Nguyễn Hữu Thắng',357975654,'Hà Nội','Đang chuẩn bị hàng',1,17.66,'18/3/2024'),(13,3,15,'Vũ Công Tốn',376998401,'Vĩnh Phúc','Hoàn thành',21,247.17,'19/4/2024'),(15,4,22,'Nguyễn Đào Quốc Việt',376998401,'Dak','Đang giao đến bạn',2,70.62,'19/5/2024'),(18,4,22,'Nguyễn Đào Quốc Việt',376998401,'Dak','Hoàn thành',3,35.31,'21/6/2024'),(19,3,22,'Vũ Công Tốn',376998401,'Vĩnh Phúc','Hoàn thành',2,70.62,'21/1/2024'),(20,3,22,'Vũ Công Tốn',376998401,'Vĩnh Phúc','Tạm dừng',2,70.62,'21/7/2024'),(21,4,4,'Nguyễn Đào Quốc Việt',376998401,'Dak','Đang giao đến bạn',2,8.32,'21/9/2024'),(22,6,4,'Nguyễn Văn Tiến',347320177,'Hà Nội','Hoàn thành',1,16.64,'22/8/2024'),(24,2,399,'Nguyễn Hữu Thắng',357975654,'Hà Nội','Hoàn thành',1,25.50,'23/11/2024'),(25,5,15,'Trần Đức Tâm',55725276,'Nam Định','Hoàn thành',3,105.93,'23/12/2024'),(31,2,15,'Nguyễn Hữu Thắng',357975654,'Hà Nội','đang chuẩn bị hàng',2,70.62,'18/04/2025'),(32,2,15,'Nguyễn Hữu Thắng',357975654,'Hà Nội','đang chuẩn bị hàng',1,35.31,'18/04/2025');
/*!40000 ALTER TABLE `donhang` ENABLE KEYS */;
UNLOCK TABLES;


DROP TABLE IF EXISTS `giohang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `giohang` (
  `idGioHang` int NOT NULL AUTO_INCREMENT,
  `MaNguoiDung` int NOT NULL,
  `id` int NOT NULL,
  `soLuong` int NOT NULL DEFAULT '1',
  `NgonNgu` NVARCHAR(50) NOT NULL,
  `NhaXuatBan` NVARCHAR(50) NOT NULL,
  `giaTien` decimal(10,2) DEFAULT NULL,
  `trangThai` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `duongdananh` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `tensanpham` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`idGioHang`),
  KEY `MaNguoiDung` (`MaNguoiDung`),
  KEY `id` (`id`),
  CONSTRAINT `giohang_ibfk_1` FOREIGN KEY (`MaNguoiDung`) REFERENCES `nguoidung` (`MaNguoiDung`),
  CONSTRAINT `giohang_ibfk_2` FOREIGN KEY (`id`) REFERENCES `chitietsanpham` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;



LOCK TABLES `giohang` WRITE;
/*!40000 ALTER TABLE `giohang` DISABLE KEYS */;
INSERT INTO giohang (MaNguoiDung, id, soLuong, NgonNgu, NhaXuatBan, giaTien, trangThai, duongdananh, tensanpham) VALUES
(1, 1, 1, 'English', 'NXB Kim Đồng', 50000.00, 'True', 'images/sach1.jpg', 'Cuốn sách 1'),
(1, 2, 2, 'Tiếng Việt', 'NXB Tuổi Trẻ', 60000.00, 'True', 'images/sach1.jpg', 'Cuốn sách 2'),
(1, 3, 1, 'English', 'NXB Tuổi Trẻ', 70000.00, 'True', 'images/sach1.jpg', 'Cuốn sách 3'),
(1, 4, 3, 'Tiếng Việt', 'NXB Kim Đồng', 80000.00, 'True', 'images/sach1.jpg', 'Cuốn sách 4'),
(1, 5, 1, 'English', 'NXB Tuổi Trẻ', 55000.00, 'True', 'images/sach1.jpg', 'Cuốn sách 5'),
(1, 6, 2, 'Tiếng Việt', 'NXB Tuổi Trẻ', 65000.00, 'True', 'images/sach1.jpg', 'Cuốn sách 6'),
(1, 7, 1, 'English', 'NXB Kim Đồng', 75000.00, 'True', 'images/sach1.jpg', 'Cuốn sách 7'),
(1, 8, 1, 'Tiếng Việt', 'NXB TuổiTrẻ', 85000.00, 'True', 'images/sach1.jpg', 'Cuốn sách 8'),
(1, 9, 2, 'English', 'NXB Giáo Dục', 90000.00, 'True', 'images/sach1.jpg', 'Cuốn sách 9'),
(1, 10, 1, 'Tiếng Việt', 'NXB Kim Đồng', 95000.00, 'True', 'images/sach1.jpg', 'Cuốn sách 10');

/*!40000 ALTER TABLE `giohang` ENABLE KEYS */;
UNLOCK TABLES;


DROP TABLE IF EXISTS `khuyenmai`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `khuyenmai` (
  `maKhuyeMai` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `noiDungKhuyenMai` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `phanTramKhuyenMai` float DEFAULT NULL,
  `MaSanPham` int DEFAULT NULL,
  PRIMARY KEY (`maKhuyeMai`),
  KEY `fk_MaSanPham` (`MaSanPham`),
  CONSTRAINT `fk_MaSanPham` FOREIGN KEY (`MaSanPham`) REFERENCES `sanpham` (`MaSanPham`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;


LOCK TABLES `khuyenmai` WRITE;
/*!40000 ALTER TABLE `khuyenmai` DISABLE KEYS */;
INSERT INTO `khuyenmai` VALUES ('Lophocjavaa','khuyến mãi 50%',0.5,1);
/*!40000 ALTER TABLE `khuyenmai` ENABLE KEYS */;
UNLOCK TABLES;


DROP TABLE IF EXISTS `nguoidung`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nguoidung` (
  `MaNguoiDung` int NOT NULL AUTO_INCREMENT,
  `TenDangNhap` varchar(50) NOT NULL,
  `MatKhau` varchar(255) NOT NULL,
  `HoTen` varchar(100) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `SoDienThoai` varchar(15) DEFAULT NULL,
  `MaQuyen` int NOT NULL,
  `DiaChi` varchar(255) DEFAULT NULL,
  `trangThai` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`MaNguoiDung`),
  UNIQUE KEY `TenDangNhap` (`TenDangNhap`),
  UNIQUE KEY `Email` (`Email`),
  KEY `MaQuyen` (`MaQuyen`),
  CONSTRAINT `nguoidung_ibfk_1` FOREIGN KEY (`MaQuyen`) REFERENCES `quyen` (`MaQuyen`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;


LOCK TABLES `nguoidung` WRITE;
/*!40000 ALTER TABLE `nguoidung` DISABLE KEYS */;
INSERT INTO `nguoidung` VALUES (1,'tona1','ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f',' Vũ Công Tốn ','tona1slvp@gmail.com','376998401',1,'Hà Nội','True'),(2,'thangne','ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f','Nguyễn Hữu Thắng','thangne123@gmail.com','0357975654',3,'Hà Nội','True'),(3,'tonne','ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f','Vũ Công Tốn','vucongton12345@gmail.com','0376998401',3,'Vĩnh Phúc','True'),(4,'vietne','ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f','Nguyễn Đào Quốc Việt','vietlo12345678@gmail.com','0376998401',3,'Dak','True'),(5,'tamne','ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f','Trần Đức Tâm','tamne12345678@gmail.com','055725276',3,'Nam Định','Flase'),(6,'tienne','ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f','Nguyễn Văn Tiến','tienne2542004@gmail.com','0347320177',1,'Hà Nội','True');
/*!40000 ALTER TABLE `nguoidung` ENABLE KEYS */;
UNLOCK TABLES;



DROP TABLE IF EXISTS `quyen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quyen` (
  `MaQuyen` int NOT NULL AUTO_INCREMENT,
  `TenQuyen` varchar(50) NOT NULL,
  `moTa` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`MaQuyen`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;



LOCK TABLES `quyen` WRITE;
/*!40000 ALTER TABLE `quyen` DISABLE KEYS */;
INSERT INTO `quyen` VALUES (1,'Quản trị viên','Có quyền kiểm soát toàn bộ hệ thống của trang web'),(3,'Khách hàng','Có quyền sử dụng các dịch vụ hoặc chức năng mà trang web cung cấp');
/*!40000 ALTER TABLE `quyen` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `sanpham`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sanpham` (
  `MaSanPham` int NOT NULL AUTO_INCREMENT,
  `TenSanPham` varchar(100) NOT NULL,
  `Gia` decimal(10,2) NOT NULL,
  `MoTa` text,
  `MaDanhMuc` int DEFAULT NULL,
  `DuongDanAnh` varchar(255) DEFAULT NULL,
  `daxoa` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`MaSanPham`),
  KEY `MaDanhMuc` (`MaDanhMuc`),
  CONSTRAINT `sanpham_ibfk_1` FOREIGN KEY (`MaDanhMuc`) REFERENCES `danhmucsanpham` (`MaDanhMuc`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;



LOCK TABLES `sanpham` WRITE;
/*!40000 ALTER TABLE `sanpham` DISABLE KEYS */;
INSERT INTO sanpham (MaSanPham,TenSanPham, Gia, MoTa, MaDanhMuc, DuongDanAnh, daxoa) VALUES
(1,'Cuốn sách 1', 50000.00, 'Mô tả cho Cuốn sách 1', 1, 'images/sach1.jpg', 0),
(2,'Cuốn sách 2', 60000.00, 'Mô tả cho Cuốn sách 2', 2, 'images/sach1.jpg', 0),
(3,'Cuốn sách 3', 70000.00, 'Mô tả cho Cuốn sách 3', 3, 'images/sach1.jpg', 0),
(4,'Cuốn sách 4', 80000.00, 'Mô tả cho Cuốn sách 4', 4, 'images/sach1.jpg', 0),
(5,'Cuốn sách 5', 55000.00, 'Mô tả cho Cuốn sách 5', 1, 'images/sach1.jpg', 0),
(6,'Cuốn sách 6', 65000.00, 'Mô tả cho Cuốn sách 6', 2, 'images/sach1.jpg', 0),
(7,'Cuốn sách 7', 75000.00, 'Mô tả cho Cuốn sách 7', 3, 'images/sach1.jpg', 0),
(8,'Cuốn sách 8', 85000.00, 'Mô tả cho Cuốn sách 8', 4, 'images/sach1.jpg', 0),
(9,'Cuốn sách 9', 90000.00, 'Mô tả cho Cuốn sách 9', 1, 'images/sach1.jpg', 0),
(10,'Cuốn sách 10', 95000.00, 'Mô tả cho Cuốn sách 10', 2, 'images/sach1.jpg', 0);

/*!40000 ALTER TABLE `sanpham` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;


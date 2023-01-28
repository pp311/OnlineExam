-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 28, 2023 at 03:28 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `onlineexamdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `answer`
--

CREATE TABLE `answer` (
  `IDAnswer` int(11) NOT NULL,
  `Content` text NOT NULL,
  `IsCorrectAnswer` tinyint(1) NOT NULL,
  `IDQuestion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `answer`
--

INSERT INTO `answer` (`IDAnswer`, `Content`, `IsCorrectAnswer`, `IDQuestion`) VALUES
(27, 'e chọn A', 0, 7),
(28, 'B cũng được', 0, 7),
(29, 'thôi lụi C', 1, 7),
(30, 'có thể là D', 0, 7),
(31, 'e không biết', 1, 8),
(32, 'e chọn hết', 0, 8),
(33, 'k đáp án nào đúng', 0, 8),
(34, 'e không chọn', 1, 8),
(43, '', 1, 11),
(44, '', 0, 11),
(45, '', 0, 11),
(46, '', 0, 11),
(47, '', 0, 12),
(48, '', 0, 12),
(49, '', 0, 12),
(50, '', 1, 12),
(75, '', 0, 19),
(76, '', 0, 19),
(77, '', 0, 19),
(78, '', 1, 19),
(79, '', 0, 20),
(80, '', 1, 20),
(81, '', 0, 20),
(82, '', 0, 20),
(83, '', 0, 21),
(84, '', 0, 21),
(85, '', 0, 21),
(86, '', 1, 21);

-- --------------------------------------------------------

--
-- Table structure for table `history`
--

CREATE TABLE `history` (
  `IDResult` int(11) NOT NULL,
  `IDAnswer` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `history`
--

INSERT INTO `history` (`IDResult`, `IDAnswer`) VALUES
(3, 27),
(3, 32),
(3, 34),
(4, 29),
(4, 31),
(4, 34),
(5, 27),
(5, 31),
(5, 34),
(6, 43),
(6, 48),
(7, 43),
(7, 48),
(8, 43),
(8, 48),
(9, 46),
(9, 50),
(10, 76),
(10, 79),
(14, 29),
(15, 30),
(16, 31),
(17, 31),
(17, 34),
(18, 29),
(18, 31),
(18, 32);

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `IDLogin` int(11) NOT NULL,
  `Username` varchar(40) NOT NULL,
  `Password` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`IDLogin`, `Username`, `Password`) VALUES
(1, 'admin1', '123'),
(2, 'user1', '123'),
(3, 'user2', '123'),
(4, 'user3', '123'),
(5, 'user4', '123'),
(7, 'user02', '123'),
(8, 'admin2', '123');

-- --------------------------------------------------------

--
-- Table structure for table `question`
--

CREATE TABLE `question` (
  `IDQuestion` int(11) NOT NULL,
  `Content` text NOT NULL,
  `MultiChoice` tinyint(1) NOT NULL,
  `IDTest` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `question`
--

INSERT INTO `question` (`IDQuestion`, `Content`, `MultiChoice`, `IDTest`) VALUES
(7, 'câu 1 là câu hỏi đầu tiên', 0, 6),
(8, 'câu 2 là câu hỏi thứ 2', 1, 6),
(11, '', 0, 8),
(12, '', 0, 8),
(19, '', 0, 12),
(20, '', 0, 12),
(21, '', 0, 13);

-- --------------------------------------------------------

--
-- Table structure for table `result`
--

CREATE TABLE `result` (
  `IDResult` int(11) NOT NULL,
  `Username` varchar(40) NOT NULL,
  `Grade` double NOT NULL,
  `SummitTime` datetime NOT NULL,
  `IDTest` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `result`
--

INSERT INTO `result` (`IDResult`, `Username`, `Grade`, `SummitTime`, `IDTest`) VALUES
(2, 'user1', 8, '2022-10-10 00:00:00', 2),
(3, 'user2', 0, '2022-12-05 22:34:30', 6),
(4, 'user2', 10, '2022-12-05 22:34:51', 6),
(5, 'user2', 5, '2022-12-05 22:35:02', 6),
(6, 'user2', 5, '2022-12-06 11:34:06', 8),
(7, 'user2', 5, '2022-12-06 11:35:35', 8),
(8, 'user2', 5, '2022-12-06 11:35:39', 8),
(9, 'user2', 5, '2022-12-06 11:39:08', 8),
(10, 'user2', 0, '2022-12-06 16:29:29', 12),
(11, 'user2', 0, '2022-12-06 16:36:22', 12),
(12, 'user2', 0, '2022-12-06 16:36:30', 13),
(13, 'user2', 0, '2022-12-06 16:40:28', 6),
(14, 'user2', 5, '2022-12-06 16:40:42', 6),
(15, 'user2', 0, '2022-12-06 16:40:49', 6),
(16, 'user2', 2.5, '2022-12-06 16:40:59', 6),
(17, 'user2', 5, '2022-12-06 16:41:07', 6),
(18, 'user2', 5, '2022-12-06 16:41:16', 6);

-- --------------------------------------------------------

--
-- Table structure for table `subject`
--

CREATE TABLE `subject` (
  `IDSubject` int(11) NOT NULL,
  `SubjectName` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `subject`
--

INSERT INTO `subject` (`IDSubject`, `SubjectName`) VALUES
(1, 'Công nghệ Web'),
(2, 'Lập trình mạng'),
(3, 'Toán UDCNTT'),
(4, 'Lập trình Linux'),
(5, 'Chương trình dịch'),
(6, 'Lập trình HĐT');

-- --------------------------------------------------------

--
-- Table structure for table `test`
--

CREATE TABLE `test` (
  `IDTest` int(11) NOT NULL,
  `DateTest` datetime NOT NULL,
  `NumberQuestion` int(11) NOT NULL,
  `Time` int(11) NOT NULL,
  `TestName` text NOT NULL,
  `IDSubject` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `test`
--

INSERT INTO `test` (`IDTest`, `DateTest`, `NumberQuestion`, `Time`, `TestName`, `IDSubject`) VALUES
(3, '2022-11-18 21:57:35', 45, 45, 'Bài test OOP', 6),
(6, '2022-12-04 07:00:00', 2, 12, 'Giữa kỳ 2', 2),
(8, '2022-12-06 11:33:00', 2, 2, '12', 1),
(12, '2022-12-06 16:26:00', 2, 3, 'f', 1),
(13, '2022-12-06 16:30:00', 1, 2, '2', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `Username` varchar(40) NOT NULL,
  `Name` text DEFAULT NULL,
  `Gender` tinyint(1) DEFAULT NULL,
  `Code` varchar(9) NOT NULL,
  `Class` varchar(12) DEFAULT NULL,
  `Faculty` text DEFAULT NULL,
  `Position` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`Username`, `Name`, `Gender`, `Code`, `Class`, `Faculty`, `Position`) VALUES
('admin1', 'Hoàng Thái', 1, 'AD01', NULL, NULL, 'admin'),
('admin2', NULL, NULL, '11', NULL, NULL, 'teacher'),
('user02', 'P P', 1, '102200227', '20TCLC_DT3', 'CNTT', 'student'),
('user1', 'Phan Phúc', 1, '102200226', '20TCLC_DT4', 'CNTT', 'student'),
('user2', 'Đoàn Quốc', 1, '102200228', '20TCLC_DT5', 'CNTT2', 'student'),
('user3', 'Đăng Hoan', 1, '102200101', '20TCLC_DT2', 'CNTT', 'student'),
('user4', 'Lập Nhân', 1, 'GV01', NULL, 'CNTT', 'teacher');

-- --------------------------------------------------------

--
-- Table structure for table `user_test`
--

CREATE TABLE `user_test` (
  `Username` varchar(40) NOT NULL,
  `IDTest` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `answer`
--
ALTER TABLE `answer`
  ADD PRIMARY KEY (`IDAnswer`),
  ADD KEY `FK_Answer_Question` (`IDQuestion`);

--
-- Indexes for table `history`
--
ALTER TABLE `history`
  ADD PRIMARY KEY (`IDResult`,`IDAnswer`),
  ADD KEY `FK_History_Answer` (`IDAnswer`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`IDLogin`),
  ADD KEY `Username` (`Username`);

--
-- Indexes for table `question`
--
ALTER TABLE `question`
  ADD PRIMARY KEY (`IDQuestion`),
  ADD KEY `FK_Question_Test` (`IDTest`);

--
-- Indexes for table `result`
--
ALTER TABLE `result`
  ADD PRIMARY KEY (`IDResult`),
  ADD KEY `FK_Result_User` (`Username`);

--
-- Indexes for table `subject`
--
ALTER TABLE `subject`
  ADD PRIMARY KEY (`IDSubject`);

--
-- Indexes for table `test`
--
ALTER TABLE `test`
  ADD PRIMARY KEY (`IDTest`),
  ADD KEY `IDSubject` (`IDSubject`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`Username`);

--
-- Indexes for table `user_test`
--
ALTER TABLE `user_test`
  ADD PRIMARY KEY (`Username`,`IDTest`),
  ADD KEY `FK_Test` (`IDTest`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `answer`
--
ALTER TABLE `answer`
  MODIFY `IDAnswer` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `IDLogin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `question`
--
ALTER TABLE `question`
  MODIFY `IDQuestion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `result`
--
ALTER TABLE `result`
  MODIFY `IDResult` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `subject`
--
ALTER TABLE `subject`
  MODIFY `IDSubject` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `test`
--
ALTER TABLE `test`
  MODIFY `IDTest` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `answer`
--
ALTER TABLE `answer`
  ADD CONSTRAINT `FK_Answer_Question` FOREIGN KEY (`IDQuestion`) REFERENCES `question` (`IDQuestion`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `history`
--
ALTER TABLE `history`
  ADD CONSTRAINT `FK_History_Answer` FOREIGN KEY (`IDAnswer`) REFERENCES `answer` (`IDAnswer`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_History_Result` FOREIGN KEY (`IDResult`) REFERENCES `result` (`IDResult`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `login`
--
ALTER TABLE `login`
  ADD CONSTRAINT `FK_Login_User` FOREIGN KEY (`Username`) REFERENCES `user` (`Username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `question`
--
ALTER TABLE `question`
  ADD CONSTRAINT `FK_Question_Test` FOREIGN KEY (`IDTest`) REFERENCES `test` (`IDTest`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `result`
--
ALTER TABLE `result`
  ADD CONSTRAINT `FK_Result_User` FOREIGN KEY (`Username`) REFERENCES `user` (`Username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `test`
--
ALTER TABLE `test`
  ADD CONSTRAINT `IDSubject` FOREIGN KEY (`IDSubject`) REFERENCES `subject` (`IDSubject`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_test`
--
ALTER TABLE `user_test`
  ADD CONSTRAINT `FK_Test` FOREIGN KEY (`IDTest`) REFERENCES `test` (`IDTest`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_User` FOREIGN KEY (`Username`) REFERENCES `user` (`Username`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

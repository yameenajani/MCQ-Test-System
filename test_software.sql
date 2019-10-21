-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 02, 2019 at 02:09 PM
-- Server version: 10.3.15-MariaDB
-- PHP Version: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `test_software`
--

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `username` varchar(100) NOT NULL,
  `pwd` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`username`, `pwd`) VALUES
('kush', '123');

-- --------------------------------------------------------

--
-- Table structure for table `question`
--

CREATE TABLE `question` (
  `qno` int(11) NOT NULL,
  `topicno` int(11) NOT NULL,
  `quest` varchar(1000) NOT NULL,
  `op1` varchar(100) NOT NULL,
  `op2` varchar(100) NOT NULL,
  `op3` varchar(100) NOT NULL,
  `op4` varchar(100) NOT NULL,
  `cans` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `question`
--

INSERT INTO `question` (`qno`, `topicno`, `quest`, `op1`, `op2`, `op3`, `op4`, `cans`) VALUES
(1, 2, 'q1', 'o1', 'o2', 'o3', 'o4', 1),
(2, 2, 'q2', 'o1_2', 'o2_2', 'o3_2', 'o4_2', 2);

-- --------------------------------------------------------

--
-- Table structure for table `topic`
--

CREATE TABLE `topic` (
  `serialno` int(11) NOT NULL,
  `topic` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `topic`
--

INSERT INTO `topic` (`serialno`, `topic`) VALUES
(1, 'Java Loops'),
(2, 'Java Arrays');

-- --------------------------------------------------------

--
-- Table structure for table `userans`
--

CREATE TABLE `userans` (
  `username` varchar(100) NOT NULL,
  `qno` int(11) NOT NULL,
  `ans` int(11) NOT NULL,
  `status` varchar(1) NOT NULL,
  `anstime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `userans`
--

INSERT INTO `userans` (`username`, `qno`, `ans`, `status`, `anstime`) VALUES
('kush', 1, 2, 'W', '2019-09-11 04:22:12'),
('kush', 2, 4, 'W', '2019-09-11 04:22:16');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `question`
--
ALTER TABLE `question`
  ADD PRIMARY KEY (`qno`),
  ADD KEY `topicno` (`topicno`);

--
-- Indexes for table `topic`
--
ALTER TABLE `topic`
  ADD PRIMARY KEY (`serialno`);

--
-- Indexes for table `userans`
--
ALTER TABLE `userans`
  ADD PRIMARY KEY (`username`,`qno`),
  ADD KEY `qno` (`qno`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `topic`
--
ALTER TABLE `topic`
  MODIFY `serialno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `question`
--
ALTER TABLE `question`
  ADD CONSTRAINT `question_ibfk_1` FOREIGN KEY (`topicno`) REFERENCES `topic` (`serialno`);

--
-- Constraints for table `userans`
--
ALTER TABLE `userans`
  ADD CONSTRAINT `userans_ibfk_1` FOREIGN KEY (`qno`) REFERENCES `question` (`qno`),
  ADD CONSTRAINT `userans_ibfk_2` FOREIGN KEY (`username`) REFERENCES `login` (`username`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

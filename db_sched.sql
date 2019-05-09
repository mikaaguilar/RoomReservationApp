-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 15, 2018 at 07:46 AM
-- Server version: 10.1.26-MariaDB
-- PHP Version: 7.1.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_sched`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `Account_ID` int(11) NOT NULL,
  `Employee_ID` int(11) NOT NULL,
  `Acc_Uname` varchar(50) NOT NULL,
  `Acc_Pass` varchar(50) NOT NULL,
  `acc_type` varchar(5) NOT NULL,
  `count` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`Account_ID`, `Employee_ID`, `Acc_Uname`, `Acc_Pass`, `acc_type`, `count`) VALUES
(1, 2122, 'marserrano', '1234', 'admin', 0),
(3, 123, 'marjaygab1', '123456', 'user', 0),
(4, 678, 'mishelkate', '12345', '', 0),
(5, 2014164791, 'alaindannpaciteng', 'nexus777esports', '', 0),
(123456, 1234567890, 'user', 'password', 'user', 0);

-- --------------------------------------------------------

--
-- Table structure for table `announcement_table`
--

CREATE TABLE `announcement_table` (
  `ID` int(11) NOT NULL,
  `announcements` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `announcement_table`
--

INSERT INTO `announcement_table` (`ID`, `announcements`) VALUES
(1, 'Server Maintenance on May 3, 2018.'),
(2, 'Please contact your Server Administrator for any inconvenience.');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `Employee_ID` int(11) NOT NULL,
  `Emp_FN` varchar(30) NOT NULL,
  `Emp_LN` varchar(30) NOT NULL,
  `Emp_Address` varchar(50) NOT NULL,
  `Emp_Age` int(11) NOT NULL,
  `Emp_Department` varchar(30) NOT NULL,
  `Emp_Email` varchar(30) NOT NULL,
  `Emp_Gender` varchar(30) NOT NULL,
  `Emp_CNumber` varchar(12) NOT NULL,
  `Emp_Photo` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`Employee_ID`, `Emp_FN`, `Emp_LN`, `Emp_Address`, `Emp_Age`, `Emp_Department`, `Emp_Email`, `Emp_Gender`, `Emp_CNumber`, `Emp_Photo`) VALUES
(2122, 'Mar', 'Serrano', 'Sampaguita', 20, 'CpE', 'mar@gmail.com', 'Male', '639208434262', '59641db9ac.jpg'),
(123, 'Marjay', 'Tapay', '085,', 19, 'Technical', 'tapaymarjay@gmail.com', 'Male', '639153591108', '87f599d129.jpg'),
(1234567890, 'alain', 'dann', 'alaindannpaciteng@gmail.com', 20, '', 'alaindannpaciteng@gmail.com', 'men', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_room`
--

CREATE TABLE `tbl_room` (
  `id` int(200) NOT NULL,
  `room_id` varchar(5) NOT NULL,
  `emp_id` varchar(5) NOT NULL,
  `time_in` time NOT NULL,
  `time_out` time NOT NULL,
  `date` date NOT NULL,
  `u_code` varchar(5) NOT NULL,
  `Status` tinyint(1) NOT NULL,
  `time_millis` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_room`
--

INSERT INTO `tbl_room` (`id`, `room_id`, `emp_id`, `time_in`, `time_out`, `date`, `u_code`, `Status`, `time_millis`) VALUES
(54, '208', '2122', '20:00:00', '21:00:00', '2018-05-15', '24146', 1, 3600000);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_roomlist`
--

CREATE TABLE `tbl_roomlist` (
  `room_id` varchar(5) NOT NULL,
  `room_name` varchar(100) NOT NULL,
  `room_bldg` varchar(100) NOT NULL,
  `room_floor` varchar(50) NOT NULL,
  `mac_address` varchar(100) NOT NULL,
  `Amenities` varchar(1000) NOT NULL,
  `Pax` int(200) NOT NULL,
  `Room_Status` varchar(100) NOT NULL,
  `timeframe_in` time NOT NULL DEFAULT '08:00:00',
  `timeframe_out` time NOT NULL DEFAULT '17:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_roomlist`
--

INSERT INTO `tbl_roomlist` (`room_id`, `room_name`, `room_bldg`, `room_floor`, `mac_address`, `Amenities`, `Pax`, `Room_Status`, `timeframe_in`, `timeframe_out`) VALUES
('208', 'CpE Lab', 'Mabini Building', '2', 'DEAD:BEEF:FEED', 'Lights,Table,Chairs,Projector', 20, 'FREE', '01:00:00', '23:59:00'),
('510', 'Computer Laboratory', 'Mabini Building', '5', 'FFFF:ED23:WQPR', 'Lights,Table,Chairs,Projector', 40, 'FREE', '04:00:00', '23:00:00'),
('509', 'Mobile Laboratory', 'Mabini Building', '5', 'DDDD:1234:CBDA', 'Lights,Table,Chairs,Projector', 60, 'FREE', '04:00:00', '23:00:00'),
('101', 'Mobile Room', 'Mabini Building', '1', 'CCCC:DDDD:AAAA', 'Lights,Table,Chairs,Projector', 20, 'FREE', '04:00:00', '23:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_sched`
--

CREATE TABLE `tbl_sched` (
  `id` int(11) NOT NULL,
  `room_id` varchar(5) NOT NULL,
  `emp_id` varchar(5) NOT NULL,
  `time_in` time NOT NULL,
  `time_out` time NOT NULL,
  `date` date NOT NULL,
  `u_code` varchar(5) NOT NULL,
  `Status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_sched`
--

INSERT INTO `tbl_sched` (`id`, `room_id`, `emp_id`, `time_in`, `time_out`, `date`, `u_code`, `Status`) VALUES
(44, '208', '2122', '16:00:00', '17:00:00', '2018-05-08', '44009', 0),
(45, '208', '2122', '08:00:00', '09:00:00', '2018-05-10', '14114', 0),
(46, '208', '2122', '03:00:00', '04:00:00', '2018-05-15', '13198', 0),
(47, '208', '2122', '04:00:00', '05:00:00', '2018-05-15', '91767', 0),
(48, '208', '2122', '05:00:00', '06:00:00', '2018-05-15', '68758', 0),
(49, '208', '2122', '07:00:00', '09:00:00', '2018-05-15', '29960', 0),
(50, '208', '2122', '14:00:00', '15:00:00', '2018-05-15', '21994', 0),
(51, '208', '2122', '15:00:00', '16:00:00', '2018-05-15', '97862', 0),
(52, '208', '2122', '17:00:00', '18:00:00', '2018-05-15', '40896', 0),
(53, '208', '2122', '19:00:00', '20:00:00', '2018-05-15', '43199', 0),
(54, '208', '2122', '20:00:00', '21:00:00', '2018-05-15', '24146', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`Account_ID`);

--
-- Indexes for table `announcement_table`
--
ALTER TABLE `announcement_table`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tbl_sched`
--
ALTER TABLE `tbl_sched`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `Account_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=123457;
--
-- AUTO_INCREMENT for table `announcement_table`
--
ALTER TABLE `announcement_table`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `tbl_sched`
--
ALTER TABLE `tbl_sched`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

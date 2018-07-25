-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Feb 27, 2018 at 04:29 PM
-- Server version: 5.7.19
-- PHP Version: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `collegee`
--

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

DROP TABLE IF EXISTS `attendance`;
CREATE TABLE IF NOT EXISTS `attendance` (
  `usn` varchar(15) NOT NULL,
  `sem` tinyint(4) NOT NULL,
  `class` varchar(2) NOT NULL,
  `subject` varchar(20) NOT NULL,
  `no_of_present` int(3) NOT NULL,
  `total_class` int(3) NOT NULL,
  PRIMARY KEY (`usn`,`subject`),
  KEY `usn` (`usn`),
  KEY `subject` (`subject`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `attendance`
--

INSERT INTO `attendance` (`usn`, `sem`, `class`, `subject`, `no_of_present`, `total_class`) VALUES
('089', 5, 'A', 'AI', 0, 0),
('089', 5, 'A', 'ATC', 0, 0),
('089', 5, 'A', 'CN', 0, 0),
('1rn14is052', 7, 'A', 'OOMD', 0, 0),
('1rn14is052', 7, 'A', 'OS', 0, 0),
('1rn14is053', 7, 'A', 'OOMD', 0, 0),
('1rn14is053', 7, 'A', 'OS', 0, 0),
('1rn14is087', 7, 'B', 'OOMD', 1, 1),
('1rn14is087', 7, 'B', 'OS', 0, 0),
('1rn14is096', 7, 'B', 'OOMD', 1, 1),
('1rn14is096', 7, 'B', 'OS', 0, 0),
('1rn15is061', 5, 'A', 'AI', 0, 0),
('1rn15is061', 5, 'A', 'ATC', 0, 0),
('1rn15is061', 5, 'A', 'CN', 7, 8),
('1rn15is062', 5, 'A', 'AI', 0, 0),
('1rn15is062', 5, 'A', 'ATC', 0, 0),
('1rn15is062', 5, 'A', 'CN', 4, 5),
('1rn15is064', 5, 'B', 'AI', 0, 0),
('1rn15is064', 5, 'B', 'ATC', 0, 0),
('1rn15is064', 5, 'B', 'CN', 0, 0),
('1rn15is102', 5, 'B', 'AI', 0, 0),
('1rn15is102', 5, 'B', 'ATC', 0, 0),
('1rn15is102', 5, 'B', 'CN', 0, 0),
('1rn16is052', 3, 'A', 'ADE', 0, 0),
('1rn16is052', 3, 'A', 'CO', 2, 3),
('1rn16is052', 3, 'A', 'UNIX', 0, 0),
('1rn16is061', 3, 'A', 'ADE', 0, 0),
('1rn16is061', 3, 'A', 'CO', 1, 3),
('1rn16is061', 3, 'A', 'UNIX', 0, 0),
('1rn16is064', 3, 'B', 'ADE', 0, 0),
('1rn16is064', 3, 'B', 'CO', 0, 0),
('1rn16is064', 3, 'B', 'UNIX', 0, 0),
('1rn16is089', 3, 'B', 'ADE', 0, 0),
('1rn16is089', 3, 'B', 'CO', 0, 0),
('1rn16is089', 3, 'B', 'UNIX', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `attendances`
--

DROP TABLE IF EXISTS `attendances`;
CREATE TABLE IF NOT EXISTS `attendances` (
  `sub_id` int(11) NOT NULL,
  `sid` int(11) NOT NULL,
  `no_of_absent` int(3) NOT NULL,
  KEY `sidAttendFk` (`sid`),
  KEY `subidAttendFk` (`sub_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `attendances`
--

INSERT INTO `attendances` (`sub_id`, `sid`, `no_of_absent`) VALUES
(1, 2, 7),
(1, 3, 6),
(1, 5, 10),
(1, 7, 10),
(33, 7, 0),
(33, 7, 0),
(46, 7, 0),
(46, 7, 0),
(1, 12, 11),
(33, 12, 0),
(33, 12, 0),
(46, 12, 0),
(46, 12, 0),
(1, 47, 11),
(33, 47, 0),
(33, 47, 0),
(46, 47, 0),
(46, 47, 0);

-- --------------------------------------------------------

--
-- Table structure for table `class`
--

DROP TABLE IF EXISTS `class`;
CREATE TABLE IF NOT EXISTS `class` (
  `dept` varchar(20) NOT NULL,
  `sem` tinyint(4) NOT NULL,
  `classname` varchar(2) NOT NULL,
  PRIMARY KEY (`dept`,`sem`,`classname`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `class`
--

INSERT INTO `class` (`dept`, `sem`, `classname`) VALUES
('ISE', 1, 'A'),
('ISE', 1, 'B'),
('ISE', 3, 'A'),
('ISE', 3, 'B'),
('ISE', 5, 'A'),
('ISE', 5, 'B'),
('ISE', 7, 'A'),
('ISE', 7, 'B');

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
CREATE TABLE IF NOT EXISTS `department` (
  `Dept` varchar(3) NOT NULL,
  `hod` varchar(5) NOT NULL,
  PRIMARY KEY (`Dept`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `deptsemsec`
--

DROP TABLE IF EXISTS `deptsemsec`;
CREATE TABLE IF NOT EXISTS `deptsemsec` (
  `dept_id` int(11) NOT NULL,
  `sem_id` int(11) NOT NULL AUTO_INCREMENT,
  `sem` int(2) NOT NULL,
  `sec` varchar(1) NOT NULL,
  PRIMARY KEY (`sem_id`),
  UNIQUE KEY `dept_id` (`dept_id`,`sem`,`sec`),
  KEY `sem_id` (`sem_id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `deptsemsec`
--

INSERT INTO `deptsemsec` (`dept_id`, `sem_id`, `sem`, `sec`) VALUES
(1, 16, 1, 'A'),
(1, 17, 1, 'B'),
(1, 18, 1, 'C'),
(1, 19, 3, 'A'),
(1, 20, 3, 'B'),
(1, 21, 3, 'C'),
(1, 1, 5, 'A'),
(1, 2, 5, 'B'),
(1, 3, 7, 'A'),
(1, 4, 7, 'B'),
(2, 27, 1, 'A'),
(2, 28, 1, 'B'),
(2, 29, 1, 'C'),
(2, 33, 3, 'A'),
(2, 34, 3, 'B'),
(2, 35, 3, 'C'),
(2, 51, 4, 'A'),
(2, 52, 4, 'B'),
(2, 53, 4, 'C'),
(2, 22, 5, 'A'),
(2, 23, 5, 'B'),
(2, 24, 5, 'C'),
(2, 42, 7, 'A'),
(2, 43, 7, 'B'),
(2, 44, 7, 'C'),
(2, 25, 8, 'A'),
(2, 26, 8, 'B');

-- --------------------------------------------------------

--
-- Table structure for table `dept_info`
--

DROP TABLE IF EXISTS `dept_info`;
CREATE TABLE IF NOT EXISTS `dept_info` (
  `dept_id` int(11) NOT NULL AUTO_INCREMENT,
  `dept_name` varchar(50) NOT NULL,
  `dept_hod` int(11) NOT NULL,
  PRIMARY KEY (`dept_id`,`dept_hod`),
  UNIQUE KEY `dept_name` (`dept_name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dept_info`
--

INSERT INTO `dept_info` (`dept_id`, `dept_name`, `dept_hod`) VALUES
(4, 'Civil', 0),
(2, 'Computer Science Engineering', 5023),
(1, 'Information Science Engineering', 5025),
(3, 'Principal', 0);

-- --------------------------------------------------------

--
-- Table structure for table `designations_available`
--

DROP TABLE IF EXISTS `designations_available`;
CREATE TABLE IF NOT EXISTS `designations_available` (
  `desig_id` int(11) NOT NULL AUTO_INCREMENT,
  `desig_name` varchar(50) NOT NULL,
  `desig_abbr` varchar(50) NOT NULL COMMENT 'abbreviation/optional',
  PRIMARY KEY (`desig_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `designations_available`
--

INSERT INTO `designations_available` (`desig_id`, `desig_name`, `desig_abbr`) VALUES
(1, 'Assistant Professor', 'Asst. Prof.'),
(2, 'Lab Incharge', 'Lab Incharge');

-- --------------------------------------------------------

--
-- Stand-in structure for view `everything`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `everything`;
CREATE TABLE IF NOT EXISTS `everything` (
`name` varchar(50)
,`sub_name` varchar(50)
,`sub_abbr` varchar(10)
,`sid` int(11)
,`sub_id` int(11)
,`internals1` int(3)
,`internals2` int(3)
,`internals3` int(3)
,`quiz1` int(11)
,`quiz2` int(11)
,`quiz3` int(11)
,`assignment1` int(11)
,`assignment2` int(11)
,`assignment3` int(11)
,`finalIA` int(3)
,`total_classes` int(11)
,`no_of_absent` int(3)
);

-- --------------------------------------------------------

--
-- Table structure for table `iamarks`
--

DROP TABLE IF EXISTS `iamarks`;
CREATE TABLE IF NOT EXISTS `iamarks` (
  `sid` int(11) NOT NULL,
  `sub_id` int(11) NOT NULL,
  `internals1` int(3) NOT NULL,
  `internals2` int(3) NOT NULL,
  `internals3` int(3) NOT NULL,
  `quiz1` int(11) NOT NULL,
  `quiz2` int(11) NOT NULL,
  `quiz3` int(11) NOT NULL,
  `assignment1` int(11) NOT NULL,
  `assignment2` int(11) NOT NULL,
  `assignment3` int(11) NOT NULL,
  `finalIA` int(3) NOT NULL,
  PRIMARY KEY (`sid`,`sub_id`),
  KEY `subIdIamarksFk` (`sub_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `iamarks`
--

INSERT INTO `iamarks` (`sid`, `sub_id`, `internals1`, `internals2`, `internals3`, `quiz1`, `quiz2`, `quiz3`, `assignment1`, `assignment2`, `assignment3`, `finalIA`) VALUES
(2, 1, 40, 16, 8, 10, 4, 10, 3, 3, 3, 15),
(4, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 2),
(5, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7, 33, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7, 46, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(12, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(12, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(12, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(12, 33, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(12, 46, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(45, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(45, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(45, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(45, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(47, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(47, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(47, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(47, 33, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(47, 46, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
CREATE TABLE IF NOT EXISTS `login` (
  `Username` varchar(30) NOT NULL,
  `Password` varchar(45) NOT NULL,
  `ID` varchar(10) NOT NULL,
  `type` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`Username`),
  KEY `name` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`Username`, `Password`, `ID`, `type`) VALUES
('leelavathi', 'leelavathi', '5004', 1),
('prakash', 'prakash', '5002', 1),
('rajkumar', 'rajkumar', '5003', 1),
('s', 'ss', '', 1),
('sudha', 'sudha', '5001', 1),
('tejaswini', 'tejaswini', '5005', 1);

-- --------------------------------------------------------

--
-- Table structure for table `login_hod`
--

DROP TABLE IF EXISTS `login_hod`;
CREATE TABLE IF NOT EXISTS `login_hod` (
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `type` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login_hod`
--

INSERT INTO `login_hod` (`username`, `password`, `type`) VALUES
('alpha', 'qwerty', 0);

-- --------------------------------------------------------

--
-- Table structure for table `scheme`
--

DROP TABLE IF EXISTS `scheme`;
CREATE TABLE IF NOT EXISTS `scheme` (
  `scheme_name` varchar(30) NOT NULL,
  `final_internal_marks` int(3) NOT NULL,
  `theory` int(3) NOT NULL,
  `quiz` int(3) NOT NULL,
  `assignment` int(3) NOT NULL,
  `theory_reduced` int(3) NOT NULL,
  `quiz_reduced` int(3) NOT NULL,
  `assignment_reduced` int(3) NOT NULL,
  PRIMARY KEY (`scheme_name`),
  KEY `scheme_name` (`scheme_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `scheme`
--

INSERT INTO `scheme` (`scheme_name`, `final_internal_marks`, `theory`, `quiz`, `assignment`, `theory_reduced`, `quiz_reduced`, `assignment_reduced`) VALUES
('new scheme2050', 40, 50, 10, 10, 20, 5, 5),
('scheme_2012', 20, 50, 10, 3, 15, 2, 3),
('scheme_2015', 20, 45, 10, 3, 15, 2, 3),
('scheme_trial', 20, 45, 10, 3, 15, 2, 3);

-- --------------------------------------------------------

--
-- Table structure for table `scheme_assign`
--

DROP TABLE IF EXISTS `scheme_assign`;
CREATE TABLE IF NOT EXISTS `scheme_assign` (
  `sem_id` int(11) NOT NULL,
  `scheme_name` varchar(20) NOT NULL,
  PRIMARY KEY (`sem_id`),
  KEY `sem_id` (`sem_id`),
  KEY `scheme_name` (`scheme_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `scheme_assign`
--

INSERT INTO `scheme_assign` (`sem_id`, `scheme_name`) VALUES
(44, 'scheme_2012'),
(1, 'scheme_2015'),
(51, 'scheme_2015'),
(52, 'scheme_2015'),
(53, 'scheme_2015');

-- --------------------------------------------------------

--
-- Table structure for table `signup_and_login_users_table`
--

DROP TABLE IF EXISTS `signup_and_login_users_table`;
CREATE TABLE IF NOT EXISTS `signup_and_login_users_table` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `dept_id` int(11) NOT NULL,
  `fullname` varchar(200) NOT NULL,
  `username` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  `user_levels` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `phone` int(10) NOT NULL,
  PRIMARY KEY (`id`,`dept_id`),
  UNIQUE KEY `username` (`username`,`user_levels`),
  KEY `deptFk` (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5026 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `signup_and_login_users_table`
--

INSERT INTO `signup_and_login_users_table` (`id`, `dept_id`, `fullname`, `username`, `password`, `user_levels`, `email`, `phone`) VALUES
(3, 1, 'Nishanth', 'nishanth', '19b58543c85b97c5498edfd89c11c3aa8cb5fe51', '0', 'nishanth.star1@gmail.com', 0),
(4, 1, 'Dr. Sudhamani', 'raghavendra', '19b58543c85b97c5498edfd89c11c3aa8cb5fe51', '1', 'raghavendra@gmail.com', 0),
(5001, 1, 'sudha.v', 'sudha', 'b1b3773a05c0ed0176787a4f1574ff0075f7521e', '0', 'sudha@gmail.com', 0),
(5002, 1, 'Shanthakumar', 'sa', '19b58543c85b97c5498edfd89c11c3aa8cb5fe51', '0', '', 0),
(5003, 1, 'Venkatesh', 'venkatesh18', '19b58543c85b97c5498edfd89c11c3aa8cb5fe51', '2', '', 0),
(5005, 1, 'asdf', 'asdf35', '19b58543c85b97c5498edfd89c11c3aa8cb5fe51', '0', '', 0),
(5008, 1, 'ASLDFKJ', 'ASLDFKJ15', '19b58543c85b97c5498edfd89c11c3aa8cb5fe51', '0', '', 0),
(5009, 1, 'nISHANTH', 'nISHANTH89', '19b58543c85b97c5498edfd89c11c3aa8cb5fe51', '0', '', 0),
(5010, 1, 'nISHANTH', 'nISHANTH24', '19b58543c85b97c5498edfd89c11c3aa8cb5fe51', '0', '', 0),
(5011, 1, 'asdfjkladsf', 'asdfjkladsf24', '19b58543c85b97c5498edfd89c11c3aa8cb5fe51', '0', '', 0),
(5013, 1, 'nishasf', 'nishasf30', '19b58543c85b97c5498edfd89c11c3aa8cb5fe51', '0', '', 0),
(5015, 1, 'jhglkjghkh', 'jhglkjghkh9', '19b58543c85b97c5498edfd89c11c3aa8cb5fe51', '0', '', 0),
(5016, 1, 'Rajkumar', 'Rajkumar84', 'b1b3773a05c0ed0176787a4f1574ff0075f7521e', '0', '', 0),
(5018, 1, 'Raj', 'Raj26', 'b1b3773a05c0ed0176787a4f1574ff0075f7521e', '0', '', 0),
(5019, 3, 'Venkatesh', 'venkatesh01', 'b1b3773a05c0ed0176787a4f1574ff0075f7521e', '2', 'venkatesh@gmail.com', 99944433),
(5022, 2, 'GT RAJU', 'GTRAJU94', 'b1b3773a05c0ed0176787a4f1574ff0075f7521e', '1', '', 0),
(5024, 2, 'asdf', 'asdf61', 'b1b3773a05c0ed0176787a4f1574ff0075f7521e', '0', '', 0),
(5025, 1, 'Dr. Prathap', 'Dr.Prathap89', 'b1b3773a05c0ed0176787a4f1574ff0075f7521e', '1', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
CREATE TABLE IF NOT EXISTS `student` (
  `Usn` varchar(10) NOT NULL,
  `Name` varchar(20) NOT NULL,
  `Dept` varchar(3) NOT NULL,
  `Sem` int(2) NOT NULL,
  `Class` varchar(2) NOT NULL,
  PRIMARY KEY (`Usn`),
  KEY `Name` (`Name`),
  KEY `Class` (`Class`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`Usn`, `Name`, `Dept`, `Sem`, `Class`) VALUES
('', '', 'ISE', 0, '<b'),
('089', 'Nishhsh', 'ISE', 5, 'A'),
('1rn14is052', 'naveen', 'ise', 7, 'A'),
('1rn14is053', 'neeraj', 'ise', 7, 'A'),
('1rn14is087', 'sharat', 'ise', 7, 'B'),
('1rn14is096', 'sumanth', 'ise', 7, 'B'),
('1rn15is010', 'Akshay', 'ISE', 5, 'A'),
('1rn15is011', 'Anirudh', 'ISE', 5, 'A'),
('1rn15is022', 'Christopher', 'ISE', 5, 'A'),
('1rn15is055', 'Nishanth', 'ISE', 5, 'A'),
('1rn15is061', 'pranav', 'ise', 5, 'A'),
('1rn15is062', 'Pranitha', 'ise', 5, 'A'),
('1rn15is064', 'praveen gowda', 'ise', 5, 'B'),
('1rn15is102', 'sureet', 'ise', 5, 'B'),
('1rn16is052', 'nikhil', 'ise', 3, 'A'),
('1rn16is061', 'pavan', 'cse', 3, 'A'),
('1rn16is064', 'raghav', 'ise', 3, 'B'),
('1rn16is089', 'samarth', 'ise', 3, 'B');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
CREATE TABLE IF NOT EXISTS `students` (
  `sid` int(11) NOT NULL AUTO_INCREMENT,
  `dept_id` int(11) NOT NULL,
  `sem_id` int(11) NOT NULL,
  `usn` varchar(7) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`sid`),
  UNIQUE KEY `usn` (`usn`),
  UNIQUE KEY `dept_id` (`dept_id`,`usn`),
  KEY `semStudFk` (`sem_id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`sid`, `dept_id`, `sem_id`, `usn`, `name`) VALUES
(1, 1, 1, '15is100', 'Raghavendra'),
(2, 1, 1, '15is055', 'Nishanth'),
(3, 1, 1, '15is061', 'Pranav'),
(4, 1, 3, '14is044', 'Ram'),
(5, 1, 1, '15is057', 'vijay'),
(7, 1, 1, '15is050', 'Nami'),
(12, 1, 1, '15is095', 'Spoorthi KR'),
(45, 1, 19, 'aaa3222', 'sadfas'),
(47, 2, 22, '15cs095', 'asdfajd');

--
-- Triggers `students`
--
DROP TRIGGER IF EXISTS `afterInsertOfStudent`;
DELIMITER $$
CREATE TRIGGER `afterInsertOfStudent` AFTER INSERT ON `students` FOR EACH ROW BEGIN
DECLARE done INT DEFAULT FALSE;
DECLARE a INT;
DECLARE cur1 CURSOR FOR 
SELECT s.sub_id FROM subjects s WHERE s.sem IN (SELECT d.sem FROM deptsemsec d WHERE d.sem_id = new.sem_id);
DECLARE CONTINUE HANDLER FOR NOT found SET done = TRUE;

OPEN cur1;
read_loop: LOOP	
	FETCH cur1 INTO a;
    IF done THEN 
    	LEAVE read_loop;
    END IF;
    INSERT INTO `iamarks`(`sid`, `sub_id`, `internals1`, `internals2`, `internals3`, `quiz1`, `quiz2`, `quiz3`, `assignment1`, `assignment2`, `assignment3`, `finalIA`) VALUES (new.sid,a,0,0,0,0,0,0,0,0,0,0);
    INSERT INTO `attendances`(`sub_id`, `sid`, `no_of_absent`) SELECT a, new.sid, c.total_classes FROM (SELECT t.total_classes FROM total_classes_held t WHERE t.sub_id = a) as c;
    END LOOP;
    CLOSE cur1;
    end
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `subject`
--

DROP TABLE IF EXISTS `subject`;
CREATE TABLE IF NOT EXISTS `subject` (
  `subject` varchar(20) NOT NULL,
  `sem` tinyint(4) NOT NULL,
  `class` varchar(2) NOT NULL,
  PRIMARY KEY (`subject`,`sem`,`class`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subject`
--

INSERT INTO `subject` (`subject`, `sem`, `class`) VALUES
('ADE', 3, 'A'),
('ADE', 3, 'B'),
('AI', 5, 'A'),
('AI', 5, 'B'),
('ATC', 5, 'A'),
('ATC', 5, 'B'),
('CN', 5, 'A'),
('CN', 5, 'B'),
('CO', 3, 'A'),
('CO', 3, 'B'),
('OOMD', 7, 'A'),
('OOMD', 7, 'B'),
('OS', 7, 'A'),
('OS', 7, 'B'),
('UNIX', 3, 'A'),
('UNIX', 3, 'B');

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

DROP TABLE IF EXISTS `subjects`;
CREATE TABLE IF NOT EXISTS `subjects` (
  `sub_id` int(11) NOT NULL AUTO_INCREMENT,
  `dept_id` int(11) NOT NULL,
  `sub_name` varchar(50) NOT NULL,
  `sub_abbr` varchar(10) NOT NULL,
  `sem` int(2) NOT NULL,
  PRIMARY KEY (`sub_id`),
  UNIQUE KEY `dept_id` (`dept_id`,`sub_abbr`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subjects`
--

INSERT INTO `subjects` (`sub_id`, `dept_id`, `sub_name`, `sub_abbr`, `sem`) VALUES
(1, 1, 'Artificial Intelligence', 'AI', 5),
(2, 1, 'Automata Theory', 'ATC', 5),
(3, 1, 'Computer Networks', 'CN', 5),
(4, 1, 'Discrete Mathematics', 'DMS', 3),
(6, 1, 'Microprocessor and microcontroller', 'MPMC', 3),
(7, 1, 'Object Oriented Programming', 'OOP', 3),
(8, 1, 'Operating System', 'OS', 7),
(9, 1, 'Unix', 'UNIX', 3),
(33, 1, 'Database Management System', 'DBMS', 5),
(46, 1, 'Mathematics-3', 'M3', 5),
(47, 1, 'Mathematics-1', 'M1', 1);

-- --------------------------------------------------------

--
-- Table structure for table `teacher`
--

DROP TABLE IF EXISTS `teacher`;
CREATE TABLE IF NOT EXISTS `teacher` (
  `tid` varchar(5) NOT NULL,
  `name` varchar(20) NOT NULL,
  `class` varchar(2) NOT NULL,
  `subject` varchar(25) NOT NULL,
  `sem` tinyint(4) NOT NULL,
  PRIMARY KEY (`tid`,`class`,`sem`),
  KEY `subject` (`subject`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `teacher`
--

INSERT INTO `teacher` (`tid`, `name`, `class`, `subject`, `sem`) VALUES
('5001', 'sudha.v', 'A', 'CN', 5),
('5001', 'sudha.v', 'B', 'OOMD', 7),
('5002', 'prakash', 'A', 'CO', 3),
('5002', 'prakash', 'B', 'CN', 5),
('5003', 'rajkumar', 'A', 'OS', 7),
('5004', 'leelavathi', 'B', 'UNIX', 3),
('5005', 'tejaswini', 'A', 'UNIX', 3);

-- --------------------------------------------------------

--
-- Table structure for table `teachers_classes`
--

DROP TABLE IF EXISTS `teachers_classes`;
CREATE TABLE IF NOT EXISTS `teachers_classes` (
  `tid` int(100) NOT NULL,
  `sem_id` int(11) NOT NULL,
  `subabbr` int(11) NOT NULL,
  PRIMARY KEY (`tid`,`sem_id`,`subabbr`),
  KEY `subAbbrFk` (`subabbr`),
  KEY `semFk` (`sem_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `teachers_classes`
--

INSERT INTO `teachers_classes` (`tid`, `sem_id`, `subabbr`) VALUES
(5001, 1, 1),
(5001, 2, 1),
(5016, 1, 3),
(5001, 3, 8);

-- --------------------------------------------------------

--
-- Table structure for table `teacher_personal_data`
--

DROP TABLE IF EXISTS `teacher_personal_data`;
CREATE TABLE IF NOT EXISTS `teacher_personal_data` (
  `tid` int(11) NOT NULL AUTO_INCREMENT,
  `t_name` varchar(50) NOT NULL,
  `t_desig` int(11) NOT NULL,
  `t_email` varchar(50) NOT NULL,
  `t_phone` varchar(10) NOT NULL,
  PRIMARY KEY (`tid`),
  KEY `desigFk` (`t_desig`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `teacher_personal_data`
--

INSERT INTO `teacher_personal_data` (`tid`, `t_name`, `t_desig`, `t_email`, `t_phone`) VALUES
(1, 'asdf', 1, '', ''),
(2, 'Asha', 1, '', ''),
(5, 'Ash', 1, '', ''),
(6, 'Asha', 1, '', ''),
(7, 'aa', 1, '', ''),
(8, 'Leelavathi', 1, '', ''),
(9, 'Prakash', 1, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `total_classes_held`
--

DROP TABLE IF EXISTS `total_classes_held`;
CREATE TABLE IF NOT EXISTS `total_classes_held` (
  `sub_id` int(11) NOT NULL,
  `sem_id` int(11) NOT NULL,
  `total_classes` int(11) NOT NULL,
  PRIMARY KEY (`sub_id`,`sem_id`),
  KEY `adfd` (`sem_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `total_classes_held`
--

INSERT INTO `total_classes_held` (`sub_id`, `sem_id`, `total_classes`) VALUES
(1, 1, 11),
(33, 1, 0),
(33, 2, 0),
(46, 1, 0),
(46, 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `t_desig`
--

DROP TABLE IF EXISTS `t_desig`;
CREATE TABLE IF NOT EXISTS `t_desig` (
  `tid` int(100) NOT NULL,
  `desig_id` int(11) NOT NULL,
  PRIMARY KEY (`tid`),
  KEY `tFk` (`desig_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_desig`
--

INSERT INTO `t_desig` (`tid`, `desig_id`) VALUES
(3, 1),
(5001, 1),
(5003, 1),
(5009, 1),
(5016, 1),
(5002, 2),
(5005, 2),
(5010, 2),
(5011, 2);

-- --------------------------------------------------------

--
-- Structure for view `everything`
--
DROP TABLE IF EXISTS `everything`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `everything`  AS  (select `stud`.`name` AS `name`,`sub`.`sub_name` AS `sub_name`,`sub`.`sub_abbr` AS `sub_abbr`,`ia`.`sid` AS `sid`,`ia`.`sub_id` AS `sub_id`,`ia`.`internals1` AS `internals1`,`ia`.`internals2` AS `internals2`,`ia`.`internals3` AS `internals3`,`ia`.`quiz1` AS `quiz1`,`ia`.`quiz2` AS `quiz2`,`ia`.`quiz3` AS `quiz3`,`ia`.`assignment1` AS `assignment1`,`ia`.`assignment2` AS `assignment2`,`ia`.`assignment3` AS `assignment3`,`ia`.`finalIA` AS `finalIA`,`held`.`total_classes` AS `total_classes`,`a`.`no_of_absent` AS `no_of_absent` from (((((`iamarks` `ia` join `subjects` `sub`) join `deptsemsec` `d`) join `students` `stud`) join `attendances` `a`) join `total_classes_held` `held`) where ((`ia`.`sid` = `stud`.`sid`) and (`ia`.`sub_id` = `sub`.`sub_id`) and (`held`.`sub_id` = `a`.`sub_id`) and (`a`.`sid` = `stud`.`sid`) and (`d`.`dept_id` = 1) and (`d`.`sem` = 5) and (`d`.`sec` = 'A') and (`stud`.`sem_id` = `d`.`sem_id`))) ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attendance`
--
ALTER TABLE `attendance`
  ADD CONSTRAINT `attendance_ibfk_1` FOREIGN KEY (`usn`) REFERENCES `student` (`Usn`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `attendances`
--
ALTER TABLE `attendances`
  ADD CONSTRAINT `sidAttendFk` FOREIGN KEY (`sid`) REFERENCES `students` (`sid`) ON DELETE CASCADE,
  ADD CONSTRAINT `subidAttendFk` FOREIGN KEY (`sub_id`) REFERENCES `subjects` (`sub_id`) ON DELETE CASCADE;

--
-- Constraints for table `deptsemsec`
--
ALTER TABLE `deptsemsec`
  ADD CONSTRAINT `deptSemFk` FOREIGN KEY (`dept_id`) REFERENCES `dept_info` (`dept_id`);

--
-- Constraints for table `iamarks`
--
ALTER TABLE `iamarks`
  ADD CONSTRAINT `sidIamarksFk` FOREIGN KEY (`sid`) REFERENCES `students` (`sid`) ON DELETE CASCADE,
  ADD CONSTRAINT `subIdIamarksFk` FOREIGN KEY (`sub_id`) REFERENCES `subjects` (`sub_id`) ON DELETE CASCADE;

--
-- Constraints for table `scheme_assign`
--
ALTER TABLE `scheme_assign`
  ADD CONSTRAINT `scheme_assign_ibfk_1` FOREIGN KEY (`sem_id`) REFERENCES `deptsemsec` (`sem_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `scheme_assign_ibfk_2` FOREIGN KEY (`scheme_name`) REFERENCES `scheme` (`scheme_name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `signup_and_login_users_table`
--
ALTER TABLE `signup_and_login_users_table`
  ADD CONSTRAINT `deptFk` FOREIGN KEY (`dept_id`) REFERENCES `dept_info` (`dept_id`);

--
-- Constraints for table `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `deptStudFk` FOREIGN KEY (`dept_id`) REFERENCES `dept_info` (`dept_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `semStudFk` FOREIGN KEY (`sem_id`) REFERENCES `deptsemsec` (`sem_id`) ON DELETE CASCADE;

--
-- Constraints for table `subjects`
--
ALTER TABLE `subjects`
  ADD CONSTRAINT `dept_idsubjectsFk` FOREIGN KEY (`dept_id`) REFERENCES `dept_info` (`dept_id`) ON DELETE CASCADE;

--
-- Constraints for table `teacher`
--
ALTER TABLE `teacher`
  ADD CONSTRAINT `teacher_ibfk_1` FOREIGN KEY (`subject`) REFERENCES `subject` (`subject`) ON DELETE CASCADE;

--
-- Constraints for table `teachers_classes`
--
ALTER TABLE `teachers_classes`
  ADD CONSTRAINT `semFk` FOREIGN KEY (`sem_id`) REFERENCES `deptsemsec` (`sem_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `subAbbrFk` FOREIGN KEY (`subabbr`) REFERENCES `subjects` (`sub_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `teacherclassFk` FOREIGN KEY (`tid`) REFERENCES `signup_and_login_users_table` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `teacher_personal_data`
--
ALTER TABLE `teacher_personal_data`
  ADD CONSTRAINT `desigFk` FOREIGN KEY (`t_desig`) REFERENCES `designations_available` (`desig_id`);

--
-- Constraints for table `total_classes_held`
--
ALTER TABLE `total_classes_held`
  ADD CONSTRAINT `adfd` FOREIGN KEY (`sem_id`) REFERENCES `deptsemsec` (`sem_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `s` FOREIGN KEY (`sub_id`) REFERENCES `subjects` (`sub_id`) ON DELETE CASCADE;

--
-- Constraints for table `t_desig`
--
ALTER TABLE `t_desig`
  ADD CONSTRAINT `tFk` FOREIGN KEY (`desig_id`) REFERENCES `designations_available` (`desig_id`),
  ADD CONSTRAINT `tidFk` FOREIGN KEY (`tid`) REFERENCES `signup_and_login_users_table` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

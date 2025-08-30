-- phpMyAdmin SQL Dump
-- version 3.2.0.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jul 01, 2015 at 10:24 AM
-- Server version: 5.1.36
-- PHP Version: 5.3.0

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `olcp`
--

-- --------------------------------------------------------

--
-- Table structure for table `announcement`
--

CREATE TABLE IF NOT EXISTS `announcement` (
  `Announcementid` int(11) NOT NULL AUTO_INCREMENT,
  `Courseid` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `Description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Announcementid`),
  KEY `Courseid` (`Courseid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=717 ;

--
-- Dumping data for table `announcement`
--

INSERT INTO `announcement` (`Announcementid`, `Courseid`, `date`, `Description`) VALUES
(701, 201, '2012-01-30', 'Exam postponed'),
(702, 206, '2012-02-05', 'Latest material is uploaded'),
(706, 201, '2012-02-07', 'New Material is posted'),
(707, 201, '2012-02-10', 'power point presentations avaliable'),
(711, 201, '2012-03-01', 'new material is uploaded'),
(712, 201, '2012-03-12', 'sda'),
(713, 201, '2012-03-12', 'new materials are uploaded'),
(714, 201, '2012-03-14', 'exam poat'),
(715, 201, '2015-03-12', 'new batch ready'),
(716, 201, '2015-07-01', 'take exam');

-- --------------------------------------------------------

--
-- Table structure for table `campus`
--

CREATE TABLE IF NOT EXISTS `campus` (
  `Fac_id` varchar(45) NOT NULL,
  `Facname` varchar(45) NOT NULL,
  `Colz` varchar(50) NOT NULL,
  `Dept` varchar(45) NOT NULL,
  `Qual` varchar(45) NOT NULL,
  `Designation` varchar(45) NOT NULL,
  PRIMARY KEY (`Fac_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `campus`
--

INSERT INTO `campus` (`Fac_id`, `Facname`, `Colz`, `Dept`, `Qual`, `Designation`) VALUES
('12345', 'reddy', 'sai aditya', 'cse', 'BTECH', 'Associate Professor'),
('sa0001', 'agnihotrasharma', 'sai aditya', 'cse', ' MTECH', 'Professor'),
('sa0002', 'gupta', 'sai aditya', 'cse', 'MTECH', 'Professor'),
('sa0003', 'arunbaskhar', 'sai aditya', 'cse', 'MTECH', 'Professor'),
('sa0004', 'lalitha', 'sai aditya', 'cse', 'MTECH', 'Professor'),
('sa0005', 'Deepthi', 'sai aditya', 'cse', 'MTECH', 'Professor'),
('sa0006', 'shanthi', 'sai aditya', 'cse', 'MTECH', 'Professor'),
('sa0007', 'shankar', 'sai aditya', 'cse', 'MTECH', 'Professor'),
('sa0008', 'rajesh', 'sai aditya', 'cse', 'MTECH', 'Professor'),
('sa0009', 'umadevi', 'sai aditya', 'cse', 'MTECH', 'Professor'),
('sa0010', 'somireddy', 'sai aditya', 'cse', 'MTECH', 'Professor'),
('sa0011', 'saritha', 'sai aditya', 'it', 'MTECH', 'Professor'),
('sa0012', 'sailaja', 'sai aditya', 'cse', 'BTECH', 'Professor'),
('sa0013', 'pavani', 'sai aditya', 'cse', 'BTECH', 'Professor'),
('sa0014', 'ramsekhar', 'sai aditya', 'cse', 'MTECH', 'Associate Professor'),
('sa0015', 'pallavi singh', 'sai aditya', 'cse', 'BTECH', 'Professor'),
('sa0016', 'ram', 'sai aditya', 'cse', 'MTECH', 'Professor'),
('sa0020', 'pattabhi', 'sai aditya', 'cse', 'MTECH', 'Associate Professor'),
('sa0021', 'maheshwari', 'sai aditya', 'cse', 'BTECH', 'Professor');

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE IF NOT EXISTS `course` (
  `Courseid` int(11) NOT NULL AUTO_INCREMENT,
  `Cname` varchar(45) NOT NULL,
  `Description` longtext,
  `Status` varchar(45) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `filename` varchar(45) NOT NULL,
  PRIMARY KEY (`Courseid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=239 ;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`Courseid`, `Cname`, `Description`, `Status`, `Date`, `filename`) VALUES
(201, 'JAVA', './course/JAVA.html', 'Active', '2012-01-29', 'JAVA.html'),
(206, 'Webtechnologies', './course/Webtechnologies.html', 'Active', '2012-01-30', 'Webtechnologies.html'),
(209, 'STM', './course/STM.html', 'Active', '2012-01-31', 'STM.html'),
(210, 'C', './course/C.html', 'Active', '2012-01-31', 'C.html'),
(211, 'SPM', './course/SPM.html', 'Active', '2012-02-27', 'SPM.html'),
(212, 'SoftwareEngineering', './course/SoftwareEngineering.html', 'Active', '2012-02-27', 'SoftwareEngineering.html'),
(234, 'bhjb', './course/unit1.doc', 'Active', '2012-03-13', 'unit1.doc'),
(235, 'MP', './course/create.html', 'Active', '2012-03-13', 'create.html'),
(236, 'kjk', './course/create.html', 'Active', '2012-03-14', 'create.html'),
(237, 'spm', './course/admindex.html', 'Active', '2012-03-14', 'admindex.html'),
(238, 'PHP', './course/', 'Active', '2015-07-01', '');

-- --------------------------------------------------------

--
-- Table structure for table `coursereg`
--

CREATE TABLE IF NOT EXISTS `coursereg` (
  `Cid` int(11) NOT NULL AUTO_INCREMENT,
  `Cname` varchar(45) DEFAULT NULL,
  `Username` varchar(45) DEFAULT NULL,
  `Status` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Cid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=29 ;

--
-- Dumping data for table `coursereg`
--

INSERT INTO `coursereg` (`Cid`, `Cname`, `Username`, `Status`) VALUES
(2, 'Webtechnologies', 'sharma', 'a'),
(3, 'STM', 'sharma', 'a'),
(4, 'C', 'sharma', 'a'),
(6, 'SPM', 'sharma', 'a'),
(7, 'JAVA', 'lalitha', 'a'),
(8, 'Webtechnologies', 'lalitha', 'a'),
(9, 'STM', 'lalitha', 'a'),
(10, 'C', 'lalitha', 'a'),
(11, 'JAVA', 'shanthi', 'a'),
(12, 'Webtechnologies', 'shanthi', 'a'),
(13, 'unix', 'sharma', 'a'),
(14, 'JAVA', 'sharma', 'a'),
(15, 'SoftwareEngineering', 'sharma', 'a'),
(17, 'STM', 'shanthi', 'a'),
(18, 'C', 'shanthi', 'a'),
(19, 'SoftwareEngineering', 'shanthi', 'a'),
(20, 'SPM', 'lalitha', 'a'),
(21, 'SoftwareEngineering', 'lalitha', 'a'),
(22, 'SoftwareEngineering', 'somireddy', 'a'),
(23, 'JAVA', 'nagireddy', 'u'),
(24, 'Webtechnologies', 'nagireddy', 'u'),
(25, 'JAVA', 'null', 'u'),
(26, 'STM', 'nagireddy', 'u'),
(27, 'C', 'nagireddy', 'u'),
(28, 'JAVA', 'mahisri', 'a');

-- --------------------------------------------------------

--
-- Table structure for table `discussion`
--

CREATE TABLE IF NOT EXISTS `discussion` (
  `disid` int(11) NOT NULL AUTO_INCREMENT,
  `Courseid` int(11) DEFAULT NULL,
  `Username` varchar(45) DEFAULT NULL,
  `Topicname` varchar(100) DEFAULT NULL,
  `Query` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`disid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=20 ;

--
-- Dumping data for table `discussion`
--

INSERT INTO `discussion` (`disid`, `Courseid`, `Username`, `Topicname`, `Query`) VALUES
(1, 201, 'satya', 'Multiple inheritance', ' In java how we acheive multiple inheritance '),
(2, 201, 'sharma', 'Constructor and method', 'What is the difference between a constructor and a method'),
(3, 201, 'sharma', 'Abstract class', 'where we use this class'),
(4, 201, 'sharma', 'polymorphism', 'what is polymorphism?'),
(5, 209, 'satya', 'what is spm?', 'In Software where we apply this mechanism'),
(6, 201, 'satya', 'garbage collection', 'what is garbage collection?'),
(18, 206, 'satya', 'what is html', 'sdfjsd'),
(19, 201, 'abhilash', 'multilevelinheritance', 'hhhjjjjjjjjjjjjjjjjjjj\r\nvvvvvvvvvvvvvvvvvr\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `email`
--

CREATE TABLE IF NOT EXISTS `email` (
  `email` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `email`
--

INSERT INTO `email` (`email`) VALUES
('parvathi.sabu@gmail.com '),
('ssit.hari512@gmail.com'),
('bada.harikrishna@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `faccourse`
--

CREATE TABLE IF NOT EXISTS `faccourse` (
  `Username` varchar(45) NOT NULL DEFAULT '',
  `Courseid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Username`,`Courseid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `faccourse`
--

INSERT INTO `faccourse` (`Username`, `Courseid`) VALUES
('lalitha', 201),
('lalitha', 206),
('lalitha', 210),
('mahisri', 201),
('nagireddy', 201),
('pavani', 201),
('pavani', 206),
('shanthi', 201),
('shanthi', 206),
('sharma', 201),
('sharma', 206),
('sharma', 207),
('sharma', 209),
('sharma', 211),
('sharma', 212),
('somireddy', 201),
('somireddy', 206),
('somireddy', 207);

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE IF NOT EXISTS `feedback` (
  `feedbackid` int(11) NOT NULL AUTO_INCREMENT,
  `Username` varchar(45) DEFAULT NULL,
  `Courseid` int(11) DEFAULT NULL,
  `Grade` varchar(45) NOT NULL,
  `Suggestion` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`feedbackid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`feedbackid`, `Username`, `Courseid`, `Grade`, `Suggestion`) VALUES
(1, 'lalitha', 201, 'Good', NULL),
(4, 'sharma', 201, 'Very Good', 'wsedqw'),
(5, 'sharma', 201, 'Good', 'sdas'),
(6, 'sharma', 201, 'Average', 'need more explanation'),
(7, 'sharma', 201, 'Very Good', 'good explaation'),
(8, 'sharma', 201, 'Very Good', 'Need more depth in subject'),
(9, 'sharma', 201, 'Good', 'need suggestions'),
(10, 'lalitha', 201, 'Good', 'need more depth'),
(11, 'shanthi', 201, 'Good', 'good'),
(12, 'lalitha', 201, 'Very Good', 'ur so genious');

-- --------------------------------------------------------

--
-- Table structure for table `file`
--

CREATE TABLE IF NOT EXISTS `file` (
  `Fileid` int(11) NOT NULL AUTO_INCREMENT,
  `Cname` varchar(45) NOT NULL,
  `Filepath` mediumtext NOT NULL,
  `Filename` longtext NOT NULL,
  `Date` date DEFAULT NULL,
  PRIMARY KEY (`Fileid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=56 ;

--
-- Dumping data for table `file`
--

INSERT INTO `file` (`Fileid`, `Cname`, `Filepath`, `Filename`, `Date`) VALUES
(1, 'JAVA', 'c', 'as', '2012-02-02'),
(55, 'JAVA', 'C:\\Documents and Settings\\Administrator\\My Documents\\NetBeansProjects\\courseportal\\build\\web\\uploadedFiles\\upload1.jsp', 'upload1.jsp', '2012-02-29');

-- --------------------------------------------------------

--
-- Table structure for table `files`
--

CREATE TABLE IF NOT EXISTS `files` (
  `fileid` int(11) NOT NULL AUTO_INCREMENT,
  `Cname` varchar(45) NOT NULL,
  `Filepath` longtext NOT NULL,
  `Filename` longtext NOT NULL,
  `Date` date NOT NULL,
  `Username` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`fileid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=32 ;

--
-- Dumping data for table `files`
--

INSERT INTO `files` (`fileid`, `Cname`, `Filepath`, `Filename`, `Date`, `Username`) VALUES
(18, 'JAVA', './uploadedFiles/main.docx', 'main.docx', '2012-03-09', 'agnihotrasharma'),
(19, 'JAVA', './uploadedFiles/net.txt', 'net.txt', '2012-03-09', 'agnihotrasharma'),
(20, 'JAVA', './uploadedFiles/admin1.html', 'admin1.html', '2012-03-13', 'agnihotrasharma'),
(21, 'JAVA', './uploadedFiles/C.html', 'C.html', '2012-03-13', 'agnihotrasharma'),
(22, 'JAVA', './uploadedFiles/C.html', 'C.html', '2012-03-13', 'agnihotrasharma'),
(23, 'JAVA', './uploadedFiles/c_program_execution.gif', 'c_program_execution.gif', '2012-03-13', 'agnihotrasharma'),
(24, 'JAVA', './uploadedFiles/', '', '2015-03-12', 'lalitha'),
(25, 'JAVA', './uploadedFiles/', '', '2015-03-12', 'lalitha'),
(26, 'JAVA', './uploadedFiles/AboutUs.jsp', 'AboutUs.jsp', '2015-04-03', 'lalitha'),
(27, 'JAVA', './uploadedFiles/B.HariKrishnaReddy_Java_B.tech-Resume.txt', 'B.HariKrishnaReddy_Java_B.tech-Resume.txt', '2015-04-03', 'lalitha'),
(28, 'JAVA', './uploadedFiles/17.Crowdsourcing Predictors of Behavioral Outcomes.doc', '17.Crowdsourcing Predictors of Behavioral Outcomes.doc', '2015-04-03', 'lalitha'),
(29, 'JAVA', './uploadedFiles/aboutus.html', 'aboutus.html', '2015-04-09', 'lalitha'),
(30, 'JAVA', './uploadedFiles/Infoware servieces.docx', 'Infoware servieces.docx', '2015-06-04', 'lalitha'),
(31, 'JAVA', './uploadedFiles/kk.jpg', 'kk.jpg', '2015-07-01', 'Maheshwari');

-- --------------------------------------------------------

--
-- Table structure for table `img`
--

CREATE TABLE IF NOT EXISTS `img` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Course` varchar(45) DEFAULT NULL,
  `Filepath` longtext,
  `File` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `img`
--

INSERT INTO `img` (`id`, `Course`, `Filepath`, `File`) VALUES
(1, 'JAVA', NULL, NULL),
(2, 'MP', './course/create_logo_v2.png', 'create_logo_v2.png'),
(3, 'kjk', './course/admin.jpg', 'admin.jpg'),
(4, 'spm', './course/admin.jpg', 'admin.jpg'),
(5, 'PHP', './course/', '');

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE IF NOT EXISTS `login` (
  `Username` varchar(45) NOT NULL DEFAULT '',
  `Password` varchar(45) NOT NULL,
  `Role` varchar(45) NOT NULL,
  `Mail` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Username`),
  KEY `Username` (`Username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`Username`, `Password`, `Role`, `Mail`) VALUES
('abhilash', '1234567', 'student', 'abhi@gmail.com'),
('admin', 'admin', 'admin', 'admin@gmail.com'),
('ananya', 'ananya88', 'student', 'mahi@gmail.com'),
('harsha', 'harsha1', 'student', 'harsha@gmail.com'),
('krishna', 'krishna', 'student', 'krish@gmail.com'),
('lalitha', 'lalitha', 'faculty', 'lalitha@gmail.com'),
('lalli', 'lalitha', 'student', 'lalli@gmail.com'),
('maheshwari', 'mahi888', 'student', 'mahi@gmail.com'),
('mahisri', 'mahisri88', 'faculty', 'mahi@gmail.com'),
('manideep', 'manideep', 'student', 'manideep78@gmail.com'),
('nagireddy', 'nagireddy', 'faculty', 'nagireddy@gmail.com'),
('pattabhi', 'pattabhi', 'student', 'pattu@gmail.com'),
('pavani', 'hhhhhhh', 'faculty', 'null'),
('prakash', 'prakash', 'student', 'prakash.padala21@gmail.com'),
('reddy', 'krishnareddy', 'student', 'krishnareddy@gmail.com'),
('santhosh', 'santosh', 'student', 'santu@gmail.com'),
('satya', 'satya', 'student', 'satyapadala@gmail.com'),
('shanthi', 'shanthi', 'faculty', 'shanthi@gmail.com'),
('sharma', 'sharma123', 'faculty', 'sharma@gmail.com'),
('somireddy', 'somireddy', 'faculty', 'somireddy@gmail.com'),
('swetha', 'swethagunnam', 'student', 'swethagunnam524@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `mail`
--

CREATE TABLE IF NOT EXISTS `mail` (
  `Rec` varchar(45) NOT NULL,
  `Send` varchar(45) NOT NULL,
  `Sub` varchar(45) DEFAULT NULL,
  `Message` varchar(250) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=55 ;

--
-- Dumping data for table `mail`
--

INSERT INTO `mail` (`Rec`, `Send`, `Sub`, `Message`, `id`, `Date`) VALUES
('psatyak@gmail.com', 'admin@gmail.com', 'Your Request is pending', 'Report will be send soon', 1, '2012-02-01'),
('psatyak@gmail.com', 'admin@gmail.com', 'Your request is accepted', 'Report', 2, '2012-02-01'),
('psatyak@gmail.com', 'admin@gmail.com', 'About subject registration', 'sdjbfkjsd', 4, '2012-02-10'),
('psatyak@gmail.com', 'sharma@gmail.com', 'bhad', 'asdhkjas', 5, '2012-02-10'),
('satyapadala@gmail.com', 'admin@gmail.com', 'Course deletion', 'SoftwareEngineering is deleted by administator', 6, '2012-02-25'),
('sharma@gmail.com', 'admin@gmail.com', 'Course Member Deletion', 'sharma has been deleted as a member to JAVA by administator', 10, '2012-02-27'),
('shanthi@gmail.com', 'admin@gmail.com', 'New Course is added', 'JAVA is added ', 12, '2012-02-27'),
('shanthi@gmail.com', 'admin@gmail.com', 'New Course is added', 'Webtechnologies is added ', 13, '2012-02-27'),
('lalli@gmail.com', 'admin@gmail.com', 'Course Member Deletion', 'lalitha has been deleted as a member to JAVA by administator', 19, '2012-02-27'),
('lalli@gmail.com', 'admin@gmail.com', 'Need faculty for C', 'forward d message', 23, '2012-02-27'),
('sharma@gmail.com', 'admin@gmail.com', 'New Course is added', 'Webtechnologies is added ', 24, '2012-03-01'),
('shanthi@gmail.com', 'satyapadala@gmail.com', 'hsda', 'sdbas', 26, '2012-03-08'),
('admin@gmail.com', 'satyapadala@gmail.com', 'hgh', 'sfbcks', 27, '2012-03-08'),
('admin@gmail.com', 'satyapadala@gmail.com', 'hgh', 'sfbcks', 28, '2012-03-08'),
('sharma@gmail.com', 'admin@gmail.com', 'New Course is added', 'STM is added ', 29, '2012-03-12'),
('sharma@gmail.com', 'admin@gmail.com', 'New Course is added', 'SoftwareEngineering is added ', 30, '2012-03-12'),
('sharma@gmail.com', 'admin@gmail.com', 'New Course is added', 'C is added ', 31, '2012-03-12'),
('sharma@gmail.com', 'admin@gmail.com', 'New Course is added', 'SPM is added ', 32, '2012-03-12'),
('lalitha@gmail.com', 'admin@gmail.com', 'New Course is added', 'JAVA is added ', 33, '2012-03-12'),
('sharma@gmail.com', 'admin@gmail.com', 'Course Member Deletion', 'sharma has been deleted as a member to SoftwareEngineering by administator', 34, '2012-03-12'),
('satyapadala@gmail.com', 'admin@gmail.com', 'sa', 'satya your request is accepted', 35, '2012-03-12'),
('shanthi@gmail.com', 'admin@gmail.com', 'Your Registration is not accepted', 'STM is not accepted ', 36, '2012-03-12'),
('shanthi@gmail.com', 'admin@gmail.com', 'New Course is added', 'JAVA is added ', 37, '2012-03-12'),
('sharma@gmail.com', 'admin@gmail.com', 'New Course is added', 'unix is added ', 38, '2012-03-13'),
('lalitha@gmail.com', 'admin@gmail.com', 'New Course is added', 'Webtechnologies is added ', 39, '2012-03-14'),
('sharma@gmail.com', 'admin@gmail.com', 'Course Member Deletion', 'sharma has been deleted as a member to JAVA by administator', 40, '2012-03-14'),
('lalitha@gmail.com', 'admin@gmail.com', 'Course Member Deletion', 'sharma has been deleted as a member to JAVA by administator', 41, '2012-03-14'),
('shanthi@gmail.com', 'admin@gmail.com', 'Course Member Deletion', 'sharma has been deleted as a member to JAVA by administator', 42, '2012-03-14'),
('sharma@gmail.com', 'admin@gmail.com', 'New Course is added', 'JAVA is added ', 43, '2012-03-14'),
('shanthi@gmail.com', 'admin@gmail.com', 'New Course is added', 'C is added ', 44, '2012-03-14'),
('shanthi@gmail.com', 'admin@gmail.com', 'New Course is added', 'STM is added ', 45, '2012-03-14'),
('sharma@gmail.com', 'admin@gmail.com', 'New Course is added', 'SoftwareEngineering is added ', 46, '2012-03-14'),
('somireddy@gmail.com', 'admin@gmail.com', 'New Course is added', 'SoftwareEngineering is added ', 47, '2012-03-14'),
('lalitha@gmail.com', 'admin@gmail.com', 'New Course is added', 'SPM is added ', 48, '2012-03-14'),
('sharma@gmail.com', 'admin@gmail.com', 'Your Registration is not accepted', 'MP is not accepted ', 49, '2012-03-20'),
('lalitha@gmail.com', 'admin@gmail.com', 'New Course is added', 'SoftwareEngineering is added ', 50, '2012-03-20'),
('abhi@gmail.com', 'santu@gmail.com', 'material', 'u gud boy', 51, '2015-03-12'),
('krish@gmail.com', 'admin@gmail.com', 'ntng', 'zmlxcklmzvk', 52, '2015-03-12'),
('mahi@gmail.com', 'admin@gmail.com', 'New Course is added', 'JAVA is added ', 53, '2015-07-01'),
('mahi@gmail.com', 'mahi@gmail.com', 'hi', 'GVHKJKLJ', 54, '2015-07-01');

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE IF NOT EXISTS `news` (
  `tittle` varchar(1000) NOT NULL,
  `message` varchar(2000) NOT NULL,
  `date` varchar(200) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`tittle`, `message`, `date`) VALUES
('krishna', 'sksjkds', '1980-january-1'),
('exam', 'Gate exam', '2015-april-19');

-- --------------------------------------------------------

--
-- Table structure for table `registration`
--

CREATE TABLE IF NOT EXISTS `registration` (
  `Name` varchar(45) NOT NULL,
  `Username` varchar(45) NOT NULL,
  `Password` varchar(45) NOT NULL,
  `Email` varchar(45) NOT NULL,
  `Mobileno` varchar(45) NOT NULL,
  `College` varchar(45) NOT NULL,
  `Department` varchar(45) NOT NULL,
  `Qualification` varchar(45) DEFAULT NULL,
  `Semister` varchar(45) DEFAULT NULL,
  `Address` varchar(100) NOT NULL,
  `Designation` varchar(45) DEFAULT NULL,
  `Reg_id` int(11) NOT NULL,
  `Role` varchar(45) NOT NULL,
  `Fac_id` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Username`),
  UNIQUE KEY `Reg_id_UNIQUE` (`Reg_id`),
  UNIQUE KEY `Fac_id_UNIQUE` (`Fac_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `registration`
--

INSERT INTO `registration` (`Name`, `Username`, `Password`, `Email`, `Mobileno`, `College`, `Department`, `Qualification`, `Semister`, `Address`, `Designation`, `Reg_id`, `Role`, `Fac_id`) VALUES
('abhilash', 'abhilash', '1234567', 'abhi@gmail.com', '9876543210', 'bvc', 'cse', NULL, '3-2', 'amp     ', NULL, 210, 'student', NULL),
('administrator', 'admin', 'admin', 'admin@gmail.com', '78787878787', 'aditya', 'admin', NULL, NULL, 'Peddapuram', NULL, 100, 'admin', NULL),
('Maheshwari', 'ananya', 'ananya88', 'mahi@gmail.com', '9948488673', 'Mahaveer', 'cse', NULL, '4-1', 'Hyd', NULL, 213, 'student', NULL),
('arunbaskhar', 'arunbaskhar', 'arunbaskhar', 'arun@gmail.com', '8989898989', 'MRECW', 'cse', 'BTECH', NULL, 'rjy', 'Professor', 505, 'faculty', 'sa0003'),
('harsha', 'harsha', 'harsha1', 'harsha@gmail.com', '9843215764', 'sai aditya', 'cse', NULL, '4-2', '                tuni', NULL, 207, 'student', NULL),
('krishna', 'krishna', 'krishna', 'krish@gmail.com', '1478523697', 'bvc', 'It', NULL, '1-1', 'jsgdsakhdsjd', NULL, 208, 'student', NULL),
('krishna', 'krishnareddy', 'krishnareddy', 'krishnareddy@gmail.com', '1234567890', 'MRECW', 'cse', 'BTECH', NULL, 'hyd                ', 'Professor', 510, 'faculty', '12345'),
('lalitha', 'lalitha', 'lalitha', 'lalitha@gmail.com', '9848953904', 'sai aditya', 'cse', 'BTECH', NULL, '                Kakinada', 'Professor', 506, 'faculty', 'sa0004'),
('lalitha', 'lalli', 'lalitha', 'lalli@gmail.com', '9030234875', 'Sai Aditya', 'cse', NULL, '4-2', '                peddapuram', NULL, 205, 'student', NULL),
('maheshwari', 'maheshwari', 'mahi888', 'mahi@gmail.com', '8989765432', 'RGUKT', 'cse', NULL, '4-2', ' Hyd        ', NULL, 212, 'student', NULL),
('Maheshwari', 'mahisri', 'mahisri88', 'mahi@gmail.com', '8989765432', 'IIIT', 'cse', 'BTECH', NULL, '                Hyd', 'Professor', 512, 'faculty', 'sa0021'),
('manideep', 'manideep', 'manideep', 'manideep78@gmail.com', '7878787878', 'sai aditya', 'cse', NULL, '1-1', '                kakinada', NULL, 202, 'student', NULL),
('nagireddy', 'nagireddy', 'nagireddy', 'nagireddy@gmail.com', '1234567890', 'MRECW', 'cse', 'BTECH', NULL, 'hyd                ', 'Professor', 511, 'faculty', 'sa0020'),
('pattabhi', 'pattabhi', 'pattabhi', 'pattu@gmail.com', '7878787878', 'sai aditya', 'cse', NULL, '1-1', '                kolamuru', NULL, 203, 'student', NULL),
('pavani', 'pavani', 'hhhhhhh', 'null', 'null', 'sai aditya', 'cse', 'BTECH', NULL, '                kkd', 'Professor', 509, 'faculty', 'sa0012'),
('prakash', 'prakash', 'prakash', 'prakash.padala21@gmail.com', '9848953904', 'sai aditya', 'cse', NULL, '4-2', 'kolamuru\r\nrajahmundry rural', NULL, 206, 'student', NULL),
('krishnareddy', 'reddy', 'krishnareddy', 'krishnareddy@gmail.com', '1234567890', 'bvc', 'mech', NULL, '1-1', 'sdns', NULL, 209, 'student', NULL),
('santosh', 'santhosh', 'santosh', 'santu@gmail.com', '1111123654', 'bvc', 'civil', NULL, '4-1', '                kpt', NULL, 211, 'student', NULL),
('satya', 'satya', 'satya', 'satyapadala@gmail.com', '78787878787', 'aditya', 'cse', 'M.tech', NULL, 'rjy', NULL, 201, 'student', NULL),
('shankar', 'shankar', 'shankar', 'shankar@gmail.com', '8789088098', 'sai aditya', 'cse', 'BTECH', NULL, '                rjy', 'Professor', 503, 'faculty', 'sa0001'),
('shanthi', 'shanthi', 'shanthi', 'shanthi@gmail.com', '9848953904', 'sai aditya', 'cse', 'BTECH', NULL, '                Rajahmundry', 'Professor', 507, 'faculty', 'sa0006'),
('agnihotrasharma', 'sharma', 'sharma123', 'sharma@gmail.com', '9848953904', 'sai aditya', 'cse', 'BTECH', NULL, '                rjy', 'Professor', 504, 'faculty', 'sa0002'),
('somireddy', 'somireddy', 'somireddy', 'somireddy@gmail.com', '9848953904', 'sai aditya', 'cse', 'BTECH', NULL, '                kkd', 'Professor', 508, 'faculty', 'sa0010'),
('swetha', 'swetha', 'swethagunnam', 'swethagunnam524@gmail.com', '8978643474', 'sai aditya', 'cse', NULL, '4-2', '                Karapa\r\n', NULL, 204, 'student', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `reply`
--

CREATE TABLE IF NOT EXISTS `reply` (
  `disid` int(11) NOT NULL,
  `Courseid` int(11) NOT NULL,
  `Username` varchar(45) DEFAULT NULL,
  `Topic` varchar(100) DEFAULT NULL,
  `Replymsg` varchar(1000) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `reply`
--

INSERT INTO `reply` (`disid`, `Courseid`, `Username`, `Topic`, `Replymsg`, `id`) VALUES
(1, 201, 'sharma', 'Multiple inheritance', 'by using interface we can achieve multiple inheritance  ', 1),
(1, 201, 'sharma', 'Multiple Inheritance', 'In java we use interface instead of class to achieve multiple inheritance', 2),
(2, 201, 'sharma', 'Constructor and method', 'A constructor is a member function of a class that is used to create objects of that class. It has the same name as the class itself, has no return type, and is invoked using the new operator.\r\nA method is an ordinary member function of a class. It has its own name, a return type (which may be void), and is invoked using the dot operator.\r\n', 5),
(3, 201, 'sharma', 'Abstract class', 'Abstract class must be extended/subclassed (to be useful). It serves as a template. A class that is abstract may not be instantiated (ie. you may not call its constructor), abstract class may contain static data.\r\nAny class with an abstract method is automatically abstract itself, and must be declared as such. A class may be declared abstract even if it has no abstract methods. This prevents it from being instantiated.\r\n', 6),
(6, 201, 'lalli', 'kjhfdakj', 'goto c drive\r\nformat this laptop', 7),
(2, 201, 'satya', 'i also dont know', 'Please tell me', 8),
(6, 201, 'satya', 'garbage', 'It is nothing but automatic deletion of memory', 9),
(2, 201, 'abhilash', 'wishes', 'thanku for ur kind information', 10);

-- --------------------------------------------------------

--
-- Table structure for table `stdcourse`
--

CREATE TABLE IF NOT EXISTS `stdcourse` (
  `Username` varchar(45) NOT NULL,
  `Courseid` int(11) NOT NULL,
  PRIMARY KEY (`Username`,`Courseid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stdcourse`
--

INSERT INTO `stdcourse` (`Username`, `Courseid`) VALUES
('abhilash', 201),
('abhilash', 206),
('abhilash', 212),
('abhilash', 237),
('krishna', 201),
('krishna', 206),
('krishna', 234),
('lalli', 201),
('lalli', 206),
('lalli', 210),
('maheshwari', 201),
('manideep', 201),
('manideep', 206),
('manideep', 210),
('null', 201),
('prakash', 201),
('prakash', 206),
('santhosh', 237),
('satya', 201),
('satya', 205),
('satya', 206),
('satya', 208),
('satya', 209),
('satya', 210),
('satya', 211),
('satya', 213),
('satya', 231),
('satya', 235),
('satya', 236);

-- --------------------------------------------------------

--
-- Table structure for table `test`
--

CREATE TABLE IF NOT EXISTS `test` (
  `idtest` int(11) NOT NULL AUTO_INCREMENT,
  `Question` varchar(1000) NOT NULL,
  `option1` varchar(100) NOT NULL,
  `option2` varchar(100) NOT NULL,
  `option3` varchar(100) NOT NULL,
  `option4` varchar(100) NOT NULL,
  `answer` varchar(100) NOT NULL,
  `Courseid` int(11) DEFAULT NULL,
  PRIMARY KEY (`idtest`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=41 ;

--
-- Dumping data for table `test`
--

INSERT INTO `test` (`idtest`, `Question`, `option1`, `option2`, `option3`, `option4`, `answer`, `Courseid`) VALUES
(4, 'What is java?', 'structured language', 'partial object oriented language', 'network oriented language', 'fully object oriented language', 'fully object oriented language', 201),
(5, 'java achieve multiple inheritance through', 'class', 'method', 'interface', 'abstract class', 'interface', 201),
(6, 'Which class or interface defines the wait(), notify(),and notifyAll() methods?', 'Object ', 'Thread ', 'Runnable ', 'Class ', 'Object ', 201),
(7, 'What is the numerical range of char?', '0 to 32767 ', '0 to 65535 ', '-256 to 255 ', '-32768 to 32767 ', '0 to 65535 ', 201),
(8, 'Which one of these lists contains only Java programming language keywords?', 'class, if, void, long, Int, continue', 'goto, instanceof, native, finally, default, throws', 'try, virtual, throw, final, volatile, transient', 'byte, break, assert, switch, include', 'goto, instanceof, native, finally, default, throws', 201),
(9, 'Which will legally declare, construct, and initialize an array?', 'int [] myList = {"1", "2", "3"};', 'int [] myList = (5, 8, 2);', 'int myList [] [] = {4,9,7,0};', 'int myList [] = {4, 3, 7};', 'int myList [] = {4, 3, 7};', 201),
(10, 'Which is a reserved word in the Java programming language?', 'method', 'reference', 'native', 'array', 'native', 201),
(11, 'what is polymorphism?', 'exist in one form', 'exist in two forms', 'wrapping of data', 'none', 'wrapping of data', 201),
(12, 'What if I write static public void instead of public static void?', 'Gives compile error', 'Program compiles and runs properly', 'Gives runtime error', 'none', 'Program compiles and runs properly', 201),
(13, 'Which one of the following will declare an array and initialize it with five numbers?', 'Array a = new Array(5);', 'int [] a = {23,22,21,20,19};', 'int a [] = new int[5];', 'int [5] array;', 'int [] a = {23,22,21,20,19};', 201),
(14, 'Which is the valid declarations within an interface definition?', 'public double methoda();', 'public final double methoda();', 'protected void methoda(double d1);', 'static void methoda(double d1);', 'static void methoda(double d1);', 201),
(15, 'You want subclasses in any package to have access to members of a superclass. Which is the most restrictive access that accomplishes this objective', 'public', 'private', 'protected', 'transient', 'protected', 201),
(16, 'You want subclasses in any package to have access to members of a superclass. Which is the most restrictive access that accomplishes this objective', 'public', 'private', 'protected', 'transient', 'protected', 201),
(17, 'What is the most restrictive access modifier that will allow members of one class to have access to members of another class in the same package?', 'public', 'default access ', 'synchronized', 'abstract', 'default access ', 201),
(18, 'Which cause a compiler error?', 'int[ ] scores = {3, 5, 7};', 'boolean results[ ] = new boolean [] {true, false, true};', 'Integer results[ ] = {new Integer(3), new Integer(5), new Integer(8)};', 'int [ ][ ] scores = {2,7,6}, {9,3,45};', 'int [ ][ ] scores = {2,7,6}, {9,3,45};', 201),
(19, 'Which one creates an instance of an array?', 'float fa = new float[20];', 'int ia[ ] [ ] = { 4, 5, 6 }, { 1,2,3 };', 'int[ ] ia = new int[15];', 'char[ ] ca = "Some String";', 'int[ ] ia = new int[15];', 201),
(20, 'Which of the following class level (nonlocal) variable declarations will not compile?', 'private synchronized int e;', 'protected int a;', 'volatile int d;', 'transient int b = 3;', 'private synchronized int e;', 201),
(21, 'Given a method in a protected class, what access modifier do you use to restrict access to that method to only the other members of the same class?', 'final', 'private', 'static', 'protected', 'private', 201),
(22, 'Which is a valid declaration within an interface?', 'protected short stop = 23;', 'final void madness(short stop); ', 'transient short stop = 23;', 'public static short stop = 23;', 'public static short stop = 23;', 201),
(23, 'Suppose that you would like to create an instance of a new Map that has an iteration order that is the same as the iteration order of an existing instance of a Map. Which concrete implementation of the Map interface should be used for the new instance?', 'The answer depends on the implementation of the existing instance.', 'TreeMap', 'LinkedHashMap', 'Hashmap', 'LinkedHashMap', 201),
(24, 'Which class does not override the equals() and hashCode() methods, inheriting them directly from class Object?', 'java.lang.String', 'java.lang.Double', 'java.lang.Character', 'java.lang.StringBuffer', 'java.lang.StringBuffer', 201),
(25, 'what is java?', 'tiffin', 'language', 'programming language', 'snack', 'snack', 212),
(26, 'what is S.E?', 'subject', 'course', 'stream', 'all of the above', 'all of the above', 212),
(27, 'what is abbrevation of oop?', 'object programming', 'object oriented programming', 'obj obj programming', 'object orientation programming', 'object orientation programming', 212),
(28, 'what is ur name?', 'santosh', 'apparao', 'ramarao', 'subbarao', 'subbarao', 237),
(29, 'what is ur father name?', 'ranga', 'apparao', 'linga', 'robo', 'robo', 237),
(30, 'what is ur age?', '20', '21', '22', 'none of the above', 'none of the above', 237),
(31, 'hello', '123', '123', '23', '45', '45', 206),
(32, 'krishna', 'bfczznfmdj', 'jcchgjdj', 'hjdfk', 'xkfjkd', 'xkfjkd', 206),
(33, 'krishna', 'bfczznfmdj', 'jcchgjdj', 'hjdfk', 'xkfjkd', 'xkfjkd', 206),
(34, 'vnbmndmf', 'mnv,mxg.x,g.', 'm mng', '  gfmg fm,sg', 'gfg', 'gfg', 206),
(35, 'm  m,', 'kcldkflkdlfe', 'mnmfdmfldlfkldkfl', 'mnfdfd', 'ksdkjf', 'ksdkjf', 206),
(36, 'm mnvc,vm,vc', 'c vmcc', 'c vmcmc', 'cv m cmv', 'mnvf', 'mnvf', 206),
(37, ' ffmnf,xmx', 'mdnmdf,dm', 'm,md,sm', 'wdskld', 'mnfdmf', 'mnfdmf', 206),
(38, 'mkkk', 'kkdfdffd', 'kdskdksdsfdkfksdksCKFDF', 'KKEKWsdkrkr', 'dfkdkf', 'dfkdkf', 206),
(39, 'krishna', 'bvbv', 'dsds', 'dsdss', 'dssds', 'dssds', 206),
(40, 'resjhh', 'nhshdjs', 'bsdhsjb', 'jjkjkk', 'dgshd', 'dgshd', 206);

-- --------------------------------------------------------

--
-- Table structure for table `testresult`
--

CREATE TABLE IF NOT EXISTS `testresult` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Username` varchar(45) NOT NULL,
  `Course` varchar(45) DEFAULT NULL,
  `Score` int(11) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=57 ;

--
-- Dumping data for table `testresult`
--

INSERT INTO `testresult` (`id`, `Username`, `Course`, `Score`, `Date`) VALUES
(2, 'satya', 'JAVA', 17, '2012-03-09'),
(5, 'lalli', 'JAVA', 17, '2012-03-09'),
(6, 'prakash', 'Webtechnologies', 20, '2012-03-09'),
(7, 'satya', 'JAVA', 20, '2012-03-13'),
(8, 'satya', 'JAVA', 1, '2012-03-14'),
(9, 'manideep', 'JAVA', 1, '2012-03-14'),
(10, 'manideep', 'JAVA', 4, '2012-03-14'),
(11, 'null', 'JAVA', 0, '2012-03-14'),
(12, 'null', 'JAVA', 0, '2012-03-14'),
(13, 'null', 'JAVA', 0, '2012-03-14'),
(14, 'null', 'JAVA', 0, '2012-03-14'),
(15, 'null', 'JAVA', 0, '2012-03-14'),
(16, 'null', 'JAVA', 1, '2012-03-14'),
(17, 'null', 'JAVA', 1, '2012-03-14'),
(18, 'null', 'JAVA', 1, '2012-03-14'),
(19, 'null', 'JAVA', 1, '2012-03-14'),
(20, 'null', 'JAVA', 1, '2012-03-14'),
(21, 'null', 'JAVA', 1, '2012-03-14'),
(22, 'null', 'JAVA', 3, '2012-03-14'),
(23, 'null', 'JAVA', 3, '2012-03-14'),
(24, 'null', 'JAVA', 3, '2012-03-14'),
(25, 'null', 'JAVA', 3, '2012-03-14'),
(26, 'null', 'JAVA', 3, '2012-03-14'),
(27, 'null', 'JAVA', 3, '2012-03-14'),
(28, 'null', 'JAVA', 3, '2012-03-14'),
(29, 'null', 'JAVA', 3, '2012-03-14'),
(30, 'null', 'JAVA', 3, '2012-03-14'),
(31, 'null', 'JAVA', 3, '2012-03-14'),
(32, 'null', 'JAVA', 3, '2012-03-14'),
(33, 'null', 'JAVA', 3, '2012-03-14'),
(34, 'null', 'JAVA', 3, '2012-03-14'),
(35, 'null', 'JAVA', 3, '2012-03-14'),
(36, 'null', 'JAVA', 3, '2012-03-14'),
(37, 'null', 'JAVA', 3, '2012-03-14'),
(38, 'manideep', 'JAVA', 16, '2012-03-14'),
(39, 'manideep', 'JAVA', 0, '2012-03-14'),
(40, 'manideep', 'JAVA', 0, '2012-03-14'),
(41, 'manideep', 'JAVA', 0, '2012-03-14'),
(42, 'manideep', 'JAVA', 0, '2012-03-14'),
(43, 'manideep', 'JAVA', 0, '2012-03-14'),
(44, 'manideep', 'JAVA', 0, '2012-03-14'),
(45, 'manideep', 'JAVA', 0, '2012-03-14'),
(46, 'manideep', 'JAVA', 8, '2012-03-14'),
(47, 'manideep', 'JAVA', 8, '2012-03-14'),
(48, 'manideep', 'JAVA', 15, '2012-03-15'),
(49, 'manideep', 'JAVA', 15, '2012-03-15'),
(50, 'manideep', 'JAVA', 15, '2012-03-15'),
(51, 'manideep', 'JAVA', 15, '2012-03-15'),
(52, 'manideep', 'JAVA', 15, '2012-03-15'),
(53, 'satya', 'JAVA', 1, '2012-03-20'),
(54, 'abhilash', 'JAVA', 5, '2015-03-12'),
(55, 'abhilash', 'JAVA', 0, '2015-03-12'),
(56, 'abhilash', 'JAVA', 8, '2015-03-12');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `announcement`
--
ALTER TABLE `announcement`
  ADD CONSTRAINT `Courseid` FOREIGN KEY (`Courseid`) REFERENCES `course` (`Courseid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `login`
--
ALTER TABLE `login`
  ADD CONSTRAINT `Username` FOREIGN KEY (`Username`) REFERENCES `registration` (`Username`) ON DELETE CASCADE ON UPDATE CASCADE;

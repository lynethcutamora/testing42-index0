-- phpMyAdmin SQL Dump
-- version 4.1.6
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Oct 18, 2015 at 01:04 PM
-- Server version: 5.6.16
-- PHP Version: 5.5.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `snbdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `blacklist_dtl`
--

CREATE TABLE IF NOT EXISTS `blacklist_dtl` (
  `reportNo` char(8) DEFAULT NULL,
  `complainId` char(8) NOT NULL,
  `fromUserId` char(10) DEFAULT NULL,
  `complainContent` varchar(1000) NOT NULL,
  `reportDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `complainStatus` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `blacklist_md`
--

CREATE TABLE IF NOT EXISTS `blacklist_md` (
  `userId` char(10) DEFAULT NULL,
  `reportNo` char(8) NOT NULL,
  `countReports` int(11) DEFAULT NULL,
  `rstatus` varchar(10) NOT NULL,
  `blackBadge` int(11) DEFAULT NULL,
  PRIMARY KEY (`reportNo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `chat_dtl`
--

CREATE TABLE IF NOT EXISTS `chat_dtl` (
  `messageId` char(15) DEFAULT NULL,
  `fromUserId` char(10) NOT NULL,
  `toUserId` char(10) NOT NULL,
  `msgContent` varchar(1000) NOT NULL,
  `dateSent` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `chat_md`
--

CREATE TABLE IF NOT EXISTS `chat_md` (
  `messageId` char(15) NOT NULL,
  `chatType` varchar(10) NOT NULL,
  `countMsgs` int(11) DEFAULT NULL,
  PRIMARY KEY (`messageId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `company_dtl`
--

CREATE TABLE IF NOT EXISTS `company_dtl` (
  `userId` char(10) DEFAULT NULL,
  `companyName` varchar(100) NOT NULL,
  `businessType` varchar(50) NOT NULL,
  `address` varchar(100) NOT NULL,
  `ownerName` varchar(50) NOT NULL,
  `yearFounded` date NOT NULL,
  `emailAdd` varchar(50) NOT NULL,
  `pssWord` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `conference_dtl`
--

CREATE TABLE IF NOT EXISTS `conference_dtl` (
  `confId` char(10) NOT NULL,
  `groupId` char(10) DEFAULT NULL,
  `userId` char(10) DEFAULT NULL,
  `timeStarted` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `timeEdned` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`confId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `devreports_md`
--

CREATE TABLE IF NOT EXISTS `devreports_md` (
  `reportNo` char(8) NOT NULL,
  `fromUserId` char(10) DEFAULT NULL,
  `rstatus` int(11) NOT NULL,
  `reportContent` varchar(1000) NOT NULL,
  `reportDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`reportNo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `extn_group_dtl`
--

CREATE TABLE IF NOT EXISTS `extn_group_dtl` (
  `groupId` char(10) DEFAULT NULL,
  `profilePic` varchar(100) DEFAULT NULL,
  `projects` varchar(100) DEFAULT NULL,
  `groupCover` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `extn_investor_dtl`
--

CREATE TABLE IF NOT EXISTS `extn_investor_dtl` (
  `userId` char(10) DEFAULT NULL,
  `nameOfBusiness` varchar(100) DEFAULT NULL,
  `businessType` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `extn_userbadge`
--

CREATE TABLE IF NOT EXISTS `extn_userbadge` (
  `userId` char(10) DEFAULT NULL,
  `bronzeBadge` int(11) DEFAULT NULL,
  `silverBadge` int(11) DEFAULT NULL,
  `goldBadge` int(11) DEFAULT NULL,
  `blackBadge` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `group_dtl`
--

CREATE TABLE IF NOT EXISTS `group_dtl` (
  `userId` char(10) DEFAULT NULL,
  `groupId` char(10) NOT NULL DEFAULT '',
  `groupName` varchar(100) NOT NULL,
  `groupDescription` varchar(1000) DEFAULT NULL,
  `noOfProjects` int(11) DEFAULT NULL,
  PRIMARY KEY (`groupId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ideas_dtl`
--

CREATE TABLE IF NOT EXISTS `ideas_dtl` (
  `postId` char(15) NOT NULL,
  `postTitle` varchar(50) NOT NULL,
  `shortDescription` varchar(100) DEFAULT NULL,
  `explanation` varchar(1000) NOT NULL,
  `relatedLinks` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`postId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `iteminventory_md`
--

CREATE TABLE IF NOT EXISTS `iteminventory_md` (
  `itemId` char(8) NOT NULL,
  `ownerId` char(10) DEFAULT NULL,
  `itemDescription` varchar(100) DEFAULT NULL,
  `snapshots` varchar(100) DEFAULT NULL,
  `relatedLinks` varchar(500) DEFAULT NULL,
  `postId` char(15) DEFAULT NULL,
  PRIMARY KEY (`itemId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `userposts_dtl`
--

CREATE TABLE IF NOT EXISTS `userposts_dtl` (
  `postId` char(15) DEFAULT NULL,
  `commentId` char(15) DEFAULT NULL,
  `fromUserId` char(10) DEFAULT NULL,
  `commentContent` varchar(500) DEFAULT NULL,
  `commentLikes` int(11) DEFAULT NULL,
  `commentDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `userposts_md`
--

CREATE TABLE IF NOT EXISTS `userposts_md` (
  `userId` char(10) DEFAULT NULL,
  `postId` char(15) NOT NULL,
  `noOfVotes` int(11) DEFAULT NULL,
  `noOfComments` int(11) DEFAULT NULL,
  `noOfShares` int(11) DEFAULT NULL,
  `datePosted` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `rank` int(11) DEFAULT NULL,
  PRIMARY KEY (`postId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_dtl`
--

CREATE TABLE IF NOT EXISTS `user_dtl` (
  `userId` int(10) NOT NULL AUTO_INCREMENT,
  `lName` varchar(30) NOT NULL,
  `fName` varchar(50) NOT NULL,
  `midInit` char(2) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `gender` varchar(2) NOT NULL,
  `address` varchar(100) NOT NULL,
  `emailAdd` varchar(50) NOT NULL,
  `pssWord` varchar(20) NOT NULL,
  `profilePic` varchar(100) DEFAULT NULL,
  `shortSelfDescription` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10000013 ;

--
-- Dumping data for table `user_dtl`
--

INSERT INTO `user_dtl` (`userId`, `lName`, `fName`, `midInit`, `age`, `gender`, `address`, `emailAdd`, `pssWord`, `profilePic`, `shortSelfDescription`) VALUES
(1000000000, 'jason', 'pitogo', 'D', 2, 'M', 'Sa imong heart', 'jason.@gmail.com', 'qwer', NULL, NULL),
(1000000002, 'Cutamora', 'Lyneth', 'C.', 19, 'F', 'Looc, Mandaue City', 'lyneth.cutamora@gmail.com', 'Kyutemooa1', NULL, NULL),
(1000000003, 'Pitogo', 'Jason', 'D.', 20, 'M', 'Sangi, New Road, Lapulapu City', 'jason.pitogo1@gmail.com', 'index1', NULL, NULL),
(1000000004, 'Dimpas', 'Alfie', 'C.', 20, 'M', 'Labogon, Mandaue City', 'alfiedimpas@icloud.com', 'index2', NULL, NULL),
(1000000005, 'Albaracin', 'Edelito Jr.', 'D.', 20, 'M', 'Labogon, Mandaue City', 'jryouken@gmail.com', 'index3', NULL, NULL),
(1000000006, 'Estose', 'Isidro Jr.', 'A.', 24, 'M.', 'Sangi, New Road, Lapulapu City', 'estose.isidro@gmail.com', 'index4', NULL, NULL),
(1000000007, 'jason', 'pitogo', 'D', 2, 'M', 'Sa imong heart', 'jason.@gmail.com', 'qwer', NULL, NULL),
(1000000008, 'jason', 'pitogo', 'D', 2, 'M', 'Sa imong heart', 'jason.@gmail.com', 'qwer', NULL, NULL),
(1000000009, 'jason', 'pitogo', 'D', 2, 'M', 'Sa imong heart', 'jason.@gmail.com', 'qwer', NULL, NULL),
(1000000010, 'jason', 'awe', 'D', 2, 'M', 'Sa imong heartwew', 'jason.@gmail.com', 'qwer', NULL, NULL),
(1000000011, '312asdqwqw', 'asdasd', 's', 0, 'F', 'eqw', 'qwqw', 'qweq', NULL, NULL),
(1000000012, 'wew', 'wew', 'w', 2, 'M', 'wew', 'wew', 'wew', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_md`
--

CREATE TABLE IF NOT EXISTS `user_md` (
  `userId` char(10) NOT NULL,
  `userType` varchar(10) NOT NULL,
  `noOfPosts` int(11) DEFAULT NULL,
  `reputation` int(11) DEFAULT NULL,
  `dateRegistered` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_md`
--

INSERT INTO `user_md` (`userId`, `userType`, `noOfPosts`, `reputation`, `dateRegistered`) VALUES
('1000000000', 'ideator', 0, 0, '2015-10-11 07:55:34'),
('1000000001', 'ideator', 0, 0, '2015-10-11 08:02:15'),
('1000000002', 'ideator', 0, 0, '2015-10-11 08:02:15'),
('1000000003', 'ideator', 0, 0, '2015-10-11 08:03:25'),
('1000000004', 'ideator', 0, 0, '2015-10-11 08:03:25');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

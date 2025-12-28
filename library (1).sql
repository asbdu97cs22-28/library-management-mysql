-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Dec 14, 2025 at 04:32 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `library`
--

-- --------------------------------------------------------

--
-- Stand-in structure for view `all_borrows`
-- (See below for the actual view)
--
CREATE TABLE `all_borrows` (
`Borrow_ID` int(11)
,`User_ID` int(11)
,`Book_ID` int(11)
,`Borrow_Date` datetime
,`Due_Date` datetime
,`Return_Date` datetime
,`Status` enum('Borrowed','Returned','Overdue')
,`Penalty_Paid` decimal(8,2)
,`UserName` varchar(200)
,`Title` varchar(300)
,`AuthorName` varchar(200)
,`Status_Calc` varchar(8)
);

-- --------------------------------------------------------

--
-- Table structure for table `authors`
--

CREATE TABLE `authors` (
  `Author_ID` int(11) NOT NULL,
  `Name` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `authors`
--

INSERT INTO `authors` (`Author_ID`, `Name`) VALUES
(1, 'J.R.R. Tolkien'),
(2, 'J.K. Rowling'),
(3, 'George R.R'),
(4, 'Robert C. Martin'),
(5, 'Donald Knuth'),
(6, 'F. Scott Fitzgerald'),
(7, 'Harper Lee'),
(8, 'Jane Austen'),
(9, 'Mark Twain'),
(10, 'Ernest Hemingway'),
(11, 'Yuval Noah Harari'),
(12, 'Malcolm Gladwell'),
(13, 'Stephen King'),
(14, 'Agatha Christie'),
(15, 'Isaac Asimov'),
(16, 'Arthur C. Clarke'),
(17, 'Paulo Coelho'),
(18, 'Dan Brown'),
(19, 'Nicholas Sparks'),
(20, 'Brene Brown'),
(21, 'Kurt Vonnegut'),
(22, 'Toni Morrison'),
(23, 'Gabriel Garcia Marquez'),
(24, 'Salman Rushdie'),
(25, 'Vikram Seth'),
(26, 'E.M. Forster'),
(27, 'Søren Kierkegaard'),
(28, 'Leo Tolstoy'),
(29, 'Fyodor Dostoevsky'),
(30, 'Chimamanda Ngozi Adichie');

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `Book_ID` int(11) NOT NULL,
  `Title` varchar(300) NOT NULL,
  `Author_ID` int(11) NOT NULL,
  `Category_ID` int(11) NOT NULL,
  `Published_Year` year(4) DEFAULT NULL,
  `Total_Copies` int(11) NOT NULL DEFAULT 1,
  `Available_Copies` int(11) NOT NULL DEFAULT 1,
  `ISBN` varchar(13) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`Book_ID`, `Title`, `Author_ID`, `Category_ID`, `Published_Year`, `Total_Copies`, `Available_Copies`, `ISBN`) VALUES
(1, 'The Hobbit', 1, 1, '1937', 5, 3, NULL),
(2, 'Harry Potter and the Sorcerer\'s Stone', 2, 1, '1997', 10, 6, NULL),
(3, 'A Game of Thrones', 3, 1, '1996', 6, 2, NULL),
(4, 'Clean Code', 4, 3, '2008', 4, 4, NULL),
(5, 'The Art of Computer Programming', 5, 4, '1968', 3, 1, NULL),
(6, 'The Great Gatsby', 6, 5, '1925', 5, 5, NULL),
(7, 'To Kill a Mockingbird', 7, 6, '1960', 6, 3, NULL),
(8, 'Pride and Prejudice', 8, 5, '0000', 4, 2, NULL),
(9, 'Adventures of Huckleberry Finn', 9, 5, '0000', 3, 1, NULL),
(10, 'The Old Man and the Sea', 10, 6, '1952', 2, 1, NULL),
(11, 'Sapiens', 11, 11, '2011', 6, 3, NULL),
(12, 'Outliers', 12, 11, '2008', 5, 4, NULL),
(13, 'The Shining', 13, 20, '1977', 4, 2, NULL),
(14, 'Murder on the Orient Express', 14, 7, '1934', 5, 1, NULL),
(15, 'Foundation', 15, 2, '1951', 4, 2, NULL),
(16, '2001: A Space Odyssey', 16, 2, '1968', 3, 2, NULL),
(17, 'The Alchemist', 17, 6, '1988', 8, 5, NULL),
(18, 'The Da Vinci Code', 18, 8, '2003', 6, 3, NULL),
(19, 'The Notebook', 19, 13, '1996', 4, 2, NULL),
(20, 'Daring Greatly', 20, 12, '2012', 4, 5, NULL),
(21, 'Slaughterhouse-Five', 21, 6, '1969', 3, 1, NULL),
(22, 'Beloved', 22, 6, '1987', 2, 1, NULL),
(23, 'One Hundred Years of Solitude', 23, 6, '1967', 4, 2, NULL),
(24, 'Midnight\'s Children', 24, 6, '1981', 3, 2, NULL),
(25, 'A Suitable Boy', 25, 6, '1993', 3, 1, NULL),
(26, 'A Passage to India', 26, 6, '1924', 2, 1, NULL),
(27, 'Either/Or', 27, 9, '0000', 2, 2, NULL),
(28, 'War and Peace', 28, 5, '0000', 3, 1, NULL),
(29, 'Crime and Punishment', 29, 5, '0000', 3, 1, NULL),
(30, 'Half of a Yellow Sun', 30, 6, '2006', 4, 2, NULL),
(31, 'Introduction to Algorithms', 4, 4, '2009', 5, 3, NULL),
(32, 'Let Us C', 5, 4, '2015', 6, 4, NULL),
(33, 'Digital Logic Design', 5, 4, '2018', 3, 1, NULL),
(34, 'Strength of Materials', 25, 14, '2017', 2, 2, NULL),
(35, 'Database System Concepts', 5, 23, '2020', 4, 4, NULL),
(36, 'Programming in ANSI C', 5, 3, '2021', 3, 1, NULL),
(37, 'The Theory of Machines', 25, 14, '2018', 2, 1, NULL),
(38, 'The Da Vinci Code - Illustrated', 18, 8, '2006', 1, 1, NULL),
(39, 'Atomic Habits', 11, 12, '2018', 10, 8, NULL),
(40, 'Angels & Demons', 18, 8, '2000', 4, 2, NULL),
(41, 'The Hobbit: Illustrated', 1, 1, '1997', 2, 1, NULL),
(42, 'Modern Operating Systems', 5, 24, '2014', 3, 2, NULL),
(43, 'Deep Work', 12, 12, '2016', 4, 3, NULL),
(44, 'The Psychology of Money', 11, 11, '2020', 5, 4, NULL),
(45, 'Clean Architecture', 4, 3, '2017', 4, 1, NULL),
(46, 'The Alchemist', 3, 4, NULL, 5, 5, '9780345391803'),
(51, 'The Alchemist', 3, 5, NULL, 3, 3, '9734345391805');

-- --------------------------------------------------------

--
-- Stand-in structure for view `borrow_history`
-- (See below for the actual view)
--
CREATE TABLE `borrow_history` (
`Borrow_ID` int(11)
,`User_ID` int(11)
,`UserName` varchar(200)
,`Book_ID` int(11)
,`BookName` varchar(300)
,`AuthorName` varchar(200)
,`CategoryName` varchar(150)
,`Borrow_Date` datetime
,`Due_Date` datetime
,`Return_Date` datetime
,`Recorded_Status` enum('Borrowed','Returned','Overdue')
,`Status_Calc` varchar(8)
,`Overdue_Days` int(7)
,`Penalty_Amount` decimal(9,2)
,`Penalty_Paid` decimal(8,2)
);

-- --------------------------------------------------------

--
-- Table structure for table `borrow_record`
--

CREATE TABLE `borrow_record` (
  `Borrow_ID` int(11) NOT NULL,
  `User_ID` int(11) NOT NULL,
  `Book_ID` int(11) NOT NULL,
  `Borrow_Date` datetime NOT NULL,
  `Due_Date` datetime NOT NULL,
  `Return_Date` datetime DEFAULT NULL,
  `Status` enum('Borrowed','Returned','Overdue') NOT NULL DEFAULT 'Borrowed',
  `Penalty_Paid` decimal(8,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `borrow_record`
--

INSERT INTO `borrow_record` (`Borrow_ID`, `User_ID`, `Book_ID`, `Borrow_Date`, `Due_Date`, `Return_Date`, `Status`, `Penalty_Paid`) VALUES
(1, 2, 1, '2023-09-01 10:00:00', '2023-09-15 10:00:00', '2023-09-14 09:00:00', 'Returned', 0.00),
(2, 3, 2, '2023-11-01 08:30:00', '2023-11-14 08:30:00', NULL, 'Borrowed', 0.00),
(3, 4, 4, '2023-07-05 12:00:00', '2023-07-19 12:00:00', '2023-07-25 11:00:00', 'Returned', 6.00),
(4, 5, 5, '2023-10-01 09:00:00', '2023-10-10 09:00:00', NULL, 'Overdue', 0.00),
(5, 6, 6, '2023-12-01 09:30:00', '2023-12-15 09:30:00', NULL, 'Borrowed', 0.00),
(6, 7, 7, '2023-08-01 10:00:00', '2023-08-15 10:00:00', '2023-08-20 11:00:00', 'Returned', 2.50),
(7, 8, 8, '2023-12-01 11:00:00', '2023-12-15 11:00:00', NULL, 'Borrowed', 0.00),
(8, 9, 9, '2023-05-01 09:00:00', '2023-05-15 09:00:00', '2023-05-20 09:00:00', 'Returned', 7.50),
(9, 10, 11, '2023-09-10 10:00:00', '2023-09-24 10:00:00', NULL, 'Overdue', 0.00),
(10, 11, 13, '2023-10-07 08:00:00', '2023-10-21 08:00:00', '2023-10-19 12:00:00', 'Returned', 0.00),
(11, 12, 17, '2023-11-05 09:00:00', '2023-11-19 09:00:00', NULL, 'Borrowed', 0.00),
(12, 13, 18, '2023-08-20 14:00:00', '2023-09-03 14:00:00', '2023-09-10 15:00:00', 'Returned', 10.50),
(13, 14, 19, '2023-07-01 10:00:00', '2023-07-15 10:00:00', '2023-07-15 09:00:00', 'Returned', 0.00),
(14, 15, 20, '2023-11-20 10:00:00', '2023-12-04 10:00:00', '2025-12-14 17:18:11', 'Returned', 740.96),
(15, 16, 21, '2023-06-01 09:00:00', '2023-06-15 09:00:00', '2023-07-01 09:00:00', 'Returned', 24.00),
(16, 17, 22, '2023-09-01 09:00:00', '2023-09-15 09:00:00', '2023-09-15 09:30:00', 'Returned', 0.00),
(17, 18, 23, '2023-10-01 10:00:00', '2023-10-15 10:00:00', NULL, 'Overdue', 0.00),
(18, 19, 24, '2023-04-01 08:00:00', '2023-04-15 08:00:00', '2023-04-20 10:00:00', 'Returned', 7.50),
(19, 20, 25, '2023-11-10 12:00:00', '2023-11-24 12:00:00', NULL, 'Borrowed', 0.00),
(20, 21, 26, '2023-08-12 10:00:00', '2023-08-26 10:00:00', '2023-09-01 11:00:00', 'Returned', 9.00),
(21, 22, 27, '2023-07-20 10:00:00', '2023-08-03 10:00:00', '2023-08-04 09:00:00', 'Returned', 1.50),
(22, 23, 28, '2023-12-01 09:00:00', '2023-12-15 09:00:00', NULL, 'Borrowed', 0.00),
(23, 24, 29, '2023-10-10 09:00:00', '2023-10-24 09:00:00', '2023-11-01 10:00:00', 'Returned', 12.00),
(24, 25, 30, '2023-09-01 09:00:00', '2023-09-15 09:00:00', '2023-09-16 09:30:00', 'Returned', 1.50),
(25, 26, 31, '2023-12-01 11:00:00', '2023-12-15 11:00:00', NULL, 'Borrowed', 0.00),
(26, 27, 32, '2023-05-05 09:00:00', '2023-05-19 09:00:00', '2023-05-27 09:00:00', 'Returned', 12.00),
(27, 28, 33, '2023-08-25 09:00:00', '2023-09-08 09:00:00', '2023-09-08 09:00:00', 'Returned', 0.00),
(28, 29, 34, '2023-11-01 10:00:00', '2023-11-15 10:00:00', NULL, 'Borrowed', 0.00),
(29, 30, 35, '2023-10-20 11:00:00', '2023-11-03 11:00:00', '2023-11-10 11:00:00', 'Returned', 10.50),
(30, 31, 36, '2023-12-01 10:00:00', '2023-12-15 10:00:00', NULL, 'Borrowed', 0.00),
(31, 9, 45, '2025-12-14 17:18:37', '2025-12-28 17:18:37', NULL, 'Borrowed', 0.00);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `Category_ID` int(11) NOT NULL,
  `Name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`Category_ID`, `Name`) VALUES
(1, 'Fantasy'),
(2, 'Science Fiction'),
(3, 'Programming'),
(4, 'Algorithms'),
(5, 'Classics'),
(6, 'Literary Fiction'),
(7, 'Mystery'),
(8, 'Thriller'),
(9, 'Philosophy'),
(10, 'History'),
(11, 'Non-Fiction'),
(12, 'Self-Help'),
(13, 'Romance'),
(14, 'Drama'),
(15, 'Poetry'),
(16, 'Biographies'),
(17, 'Business'),
(18, 'Psychology'),
(19, 'Travel'),
(20, 'Horror'),
(21, 'Comedy'),
(22, 'Young Adult'),
(23, 'Education'),
(24, 'Reference'),
(25, 'Art'),
(26, 'Health'),
(27, 'Science'),
(28, 'Religion'),
(29, 'Politics'),
(30, 'Technology');

-- --------------------------------------------------------

--
-- Table structure for table `ratings`
--

CREATE TABLE `ratings` (
  `Rating_ID` int(11) NOT NULL,
  `User_ID` int(11) NOT NULL,
  `Book_ID` int(11) NOT NULL,
  `Rating` tinyint(4) NOT NULL CHECK (`Rating` between 1 and 5),
  `Review` text DEFAULT NULL,
  `Created_At` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ratings`
--

INSERT INTO `ratings` (`Rating_ID`, `User_ID`, `Book_ID`, `Rating`, `Review`, `Created_At`) VALUES
(1, 2, 1, 5, 'Timeless classic, loved the adventure.', '2023-09-05 10:00:00'),
(2, 3, 2, 5, 'Magical and delightful for all ages.', '2023-11-02 09:00:00'),
(3, 4, 4, 4, 'Great practices for writing clean code.', '2023-07-07 12:30:00'),
(4, 5, 39, 5, 'Very practical habits, life-changing.', '2023-06-01 08:00:00'),
(5, 6, 11, 5, 'Excellent overview of human history.', '2023-09-15 10:00:00'),
(6, 7, 15, 4, 'Classic sci-fi, very influential.', '2023-10-01 11:00:00'),
(7, 8, 18, 4, 'Page-turner and interesting puzzles.', '2023-12-01 10:30:00');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `User_ID` int(11) NOT NULL,
  `Name` varchar(200) NOT NULL,
  `Email` varchar(150) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `Role` enum('Admin','Student','Faculty','Staff') NOT NULL DEFAULT 'Student',
  `Department` varchar(100) DEFAULT NULL,
  `Year` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`User_ID`, `Name`, `Email`, `Password`, `Role`, `Department`, `Year`) VALUES
(1, 'Library Admin', 'admin@chozha.com', 'admin123', 'Admin', 'Administration', NULL),
(2, 'Aarav Sharma', 'aarav@student.local', 'student123', 'Student', 'CSE', 2),
(3, 'Sneha Iyer', 'sneha@student.local', 'student123', 'Student', 'ECE', 2),
(4, 'Rahul Das', 'rahul@student.local', 'student123', 'Student', 'MECH', 4),
(5, 'Priya Menon', 'priya@student.local', 'student123', 'Student', 'CSE', 1),
(6, 'Vikram Rao', 'vikram@student.local', 'student123', 'Student', 'EEE', 3),
(7, 'Nisha Patel', 'nisha@student.local', 'student123', 'Student', 'IT', 2),
(8, 'Karan Mehta', 'karan@student.local', 'student123', 'Student', 'CSE', 4),
(9, 'Divya Nair', 'divya@student.local', 'student123', 'Student', 'CIVIL', 2),
(10, 'Rohan Singh', 'rohan@student.local', 'student123', 'Student', 'ECE', 3),
(11, 'Anjali Verma', 'anjali@student.local', 'student123', 'Student', 'CSE', 4),
(12, 'Jane Doe', 'jane@student.local', 'student123', 'Student', 'Physics', 2),
(13, 'Srividhya Prakash', 'srividhya@student.local', 'sri123', 'Student', 'Computer Science', NULL),
(14, 'Lakshana Raj', 'lakshana@student.local', 'laksh321', 'Student', 'Physics', NULL),
(15, 'Shakundhala Devi', 'shakundhala@student.local', 'sha2024', 'Student', 'Chemistry', NULL),
(16, 'Hari Krishnan', 'hari@student.local', 'student123', 'Student', 'CSE', 1),
(17, 'Bindhu Madhavi', 'bindhu@student.local', 'student123', 'Student', 'CSE', 3),
(18, 'Ravi Kumar', 'ravi@student.local', 'student123', 'Student', 'IT', 2),
(19, 'Sakshi Kapoor', 'sakshi@student.local', 'student123', 'Student', 'MECH', 4),
(20, 'Arjun Menon', 'arjun@student.local', 'student123', 'Student', 'CSE', 2),
(21, 'Meera Nair', 'meera@student.local', 'student123', 'Student', 'ECE', 3),
(22, 'Om Prakash', 'om@student.local', 'student123', 'Student', 'Civil', 4),
(23, 'Rekha K', 'rekha@student.local', 'student123', 'Student', 'CSE', 1),
(24, 'Suresh R', 'suresh@student.local', 'student123', 'Student', 'EEE', 3),
(25, 'Aditi Sharma', 'aditi@student.local', 'student123', 'Student', 'IT', 2),
(26, 'Naveen Kumar', 'naveen@student.local', 'student123', 'Student', 'CSE', 2),
(27, 'Priyanka K', 'priyanka@student.local', 'student123', 'Student', 'CSE', 3),
(28, 'Manish Patel', 'manish@student.local', 'student123', 'Student', 'MECH', 4),
(29, 'Kavya R', 'kavya@student.local', 'student123', 'Student', 'CIVIL', 2),
(30, 'Sidharth Roy', 'sidharth@student.local', 'student123', 'Student', 'ECE', 2),
(31, 'Ritika Sen', 'ritika@student.local', 'student123', 'Student', 'CSE', 1),
(32, 'Shilpa Reddy', 'shilpu@student.local', 'tempPassword123', 'Student', NULL, NULL),
(35, 'shanthini kumar', 'shan@student.local', 'tempPassword123', 'Student', NULL, NULL);

-- --------------------------------------------------------

--
-- Structure for view `all_borrows`
--
DROP TABLE IF EXISTS `all_borrows`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `all_borrows`  AS SELECT `br`.`Borrow_ID` AS `Borrow_ID`, `br`.`User_ID` AS `User_ID`, `br`.`Book_ID` AS `Book_ID`, `br`.`Borrow_Date` AS `Borrow_Date`, `br`.`Due_Date` AS `Due_Date`, `br`.`Return_Date` AS `Return_Date`, `br`.`Status` AS `Status`, `br`.`Penalty_Paid` AS `Penalty_Paid`, `u`.`Name` AS `UserName`, `b`.`Title` AS `Title`, `a`.`Name` AS `AuthorName`, CASE WHEN `br`.`Return_Date` is null AND `br`.`Due_Date` < curdate() THEN 'Overdue' ELSE `br`.`Status` END AS `Status_Calc` FROM (((`borrow_record` `br` join `users` `u` on(`br`.`User_ID` = `u`.`User_ID`)) join `books` `b` on(`br`.`Book_ID` = `b`.`Book_ID`)) join `authors` `a` on(`b`.`Author_ID` = `a`.`Author_ID`)) ;

-- --------------------------------------------------------

--
-- Structure for view `borrow_history`
--
DROP TABLE IF EXISTS `borrow_history`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `borrow_history`  AS SELECT `br`.`Borrow_ID` AS `Borrow_ID`, `br`.`User_ID` AS `User_ID`, `u`.`Name` AS `UserName`, `br`.`Book_ID` AS `Book_ID`, `b`.`Title` AS `BookName`, `a`.`Name` AS `AuthorName`, `c`.`Name` AS `CategoryName`, `br`.`Borrow_Date` AS `Borrow_Date`, `br`.`Due_Date` AS `Due_Date`, `br`.`Return_Date` AS `Return_Date`, `br`.`Status` AS `Recorded_Status`, CASE WHEN `br`.`Status` = 'Borrowed' AND cast(`br`.`Due_Date` as date) < curdate() THEN 'Overdue' WHEN `br`.`Status` = 'Returned' THEN 'Returned' ELSE `br`.`Status` END AS `Status_Calc`, greatest(to_days(curdate()) - to_days(cast(`br`.`Due_Date` as date)),0) AS `Overdue_Days`, round(greatest(to_days(curdate()) - to_days(cast(`br`.`Due_Date` as date)),0) * 1.50,2) AS `Penalty_Amount`, `br`.`Penalty_Paid` AS `Penalty_Paid` FROM ((((`borrow_record` `br` join `users` `u` on(`br`.`User_ID` = `u`.`User_ID`)) join `books` `b` on(`br`.`Book_ID` = `b`.`Book_ID`)) join `authors` `a` on(`b`.`Author_ID` = `a`.`Author_ID`)) join `categories` `c` on(`b`.`Category_ID` = `c`.`Category_ID`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `authors`
--
ALTER TABLE `authors`
  ADD PRIMARY KEY (`Author_ID`);

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`Book_ID`),
  ADD UNIQUE KEY `ISBN` (`ISBN`),
  ADD KEY `idx_books_author` (`Author_ID`),
  ADD KEY `idx_books_category` (`Category_ID`);

--
-- Indexes for table `borrow_record`
--
ALTER TABLE `borrow_record`
  ADD PRIMARY KEY (`Borrow_ID`),
  ADD KEY `idx_borrow_user` (`User_ID`),
  ADD KEY `idx_borrow_book` (`Book_ID`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`Category_ID`);

--
-- Indexes for table `ratings`
--
ALTER TABLE `ratings`
  ADD PRIMARY KEY (`Rating_ID`),
  ADD KEY `rating_ibfk_user` (`User_ID`),
  ADD KEY `idx_ratings_book` (`Book_ID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`User_ID`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `authors`
--
ALTER TABLE `authors`
  MODIFY `Author_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `Book_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `borrow_record`
--
ALTER TABLE `borrow_record`
  MODIFY `Borrow_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `Category_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `ratings`
--
ALTER TABLE `ratings`
  MODIFY `Rating_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `User_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `books`
--
ALTER TABLE `books`
  ADD CONSTRAINT `books_ibfk_author` FOREIGN KEY (`Author_ID`) REFERENCES `authors` (`Author_ID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `books_ibfk_category` FOREIGN KEY (`Category_ID`) REFERENCES `categories` (`Category_ID`) ON UPDATE CASCADE;

--
-- Constraints for table `borrow_record`
--
ALTER TABLE `borrow_record`
  ADD CONSTRAINT `br_ibfk_book` FOREIGN KEY (`Book_ID`) REFERENCES `books` (`Book_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `br_ibfk_user` FOREIGN KEY (`User_ID`) REFERENCES `users` (`User_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ratings`
--
ALTER TABLE `ratings`
  ADD CONSTRAINT `rating_ibfk_book` FOREIGN KEY (`Book_ID`) REFERENCES `books` (`Book_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `rating_ibfk_user` FOREIGN KEY (`User_ID`) REFERENCES `users` (`User_ID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

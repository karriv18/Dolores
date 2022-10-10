-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 10, 2022 at 10:32 AM
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
-- Database: `db_dpmc`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_account`
--

CREATE TABLE `tbl_account` (
  `acct_id` int(11) NOT NULL,
  `acct_first_name` varchar(50) NOT NULL,
  `acct_last_name` varchar(50) NOT NULL,
  `acct_email` varchar(50) NOT NULL,
  `acct_addr` varchar(50) NOT NULL,
  `acct_contact_num` varchar(11) NOT NULL,
  `acct_username` varchar(32) NOT NULL,
  `acct_password` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_account`
--

INSERT INTO `tbl_account` (`acct_id`, `acct_first_name`, `acct_last_name`, `acct_email`, `acct_addr`, `acct_contact_num`, `acct_username`, `acct_password`) VALUES
(1, 'chester', 'jazmin', 'test123@gmail.com', 'test st. test st.', '09123456', 'cheschesj', '123pass');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_customer`
--

CREATE TABLE `tbl_customer` (
  `Cust_id` int(11) NOT NULL,
  `Cust_first_name` varchar(50) NOT NULL,
  `Cust_last_name` varchar(50) NOT NULL,
  `Cust_addr` varchar(50) NOT NULL,
  `Cust_phone` varchar(13) NOT NULL,
  `Cust_email` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_customer`
--

INSERT INTO `tbl_customer` (`Cust_id`, `Cust_first_name`, `Cust_last_name`, `Cust_addr`, `Cust_phone`, `Cust_email`) VALUES
(1, 'chester', 'jazmin', 'test test st', '0912345', 'test123@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_inventory`
--

CREATE TABLE `tbl_inventory` (
  `Invnt_id` int(11) NOT NULL,
  `Invnt_product_name` varchar(20) NOT NULL,
  `Invnt_product_ListPrice` int(11) NOT NULL,
  `Invnt_product_retailPrice` int(11) NOT NULL,
  `Invnt_total_quantity` int(11) NOT NULL,
  `Invnt_quantity_available` int(11) NOT NULL,
  `Invnt_DateTime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_orders`
--

CREATE TABLE `tbl_orders` (
  `Order_id` int(11) NOT NULL,
  `Prchs_id` int(11) NOT NULL,
  `Order_verify` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_payment`
--

CREATE TABLE `tbl_payment` (
  `Pay_id` int(11) NOT NULL,
  `Pay_method` varchar(10) NOT NULL,
  `Pay_cash` decimal(7,2) NOT NULL,
  `Pay_amount` decimal(7,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_payment`
--

INSERT INTO `tbl_payment` (`Pay_id`, `Pay_method`, `Pay_cash`, `Pay_amount`) VALUES
(1, 'gcash', '100.00', '100.00');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_people`
--

CREATE TABLE `tbl_people` (
  `ppl_id` int(11) NOT NULL,
  `acct_id` int(11) NOT NULL,
  `ppl_role` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_purchase`
--

CREATE TABLE `tbl_purchase` (
  `Prchs_id` int(11) NOT NULL,
  `Cust_id` int(11) NOT NULL,
  `Pay_id` int(11) NOT NULL,
  `Prchs_product` varchar(50) NOT NULL,
  `Prchs_quantity` int(11) NOT NULL,
  `Prchs_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_purchase`
--

INSERT INTO `tbl_purchase` (`Prchs_id`, `Cust_id`, `Pay_id`, `Prchs_product`, `Prchs_quantity`, `Prchs_date`) VALUES
(1, 1, 1, 'kakanin', 2, '2022-10-13');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_report`
--

CREATE TABLE `tbl_report` (
  `Report_id` int(11) NOT NULL,
  `Sales_id` int(11) NOT NULL,
  `Time_Date` datetime NOT NULL,
  `Revenue` decimal(7,2) NOT NULL,
  `Capital` decimal(7,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_sales`
--

CREATE TABLE `tbl_sales` (
  `Sales_id` int(11) NOT NULL,
  `Order_id` int(11) NOT NULL,
  `Sales_amount` decimal(7,2) NOT NULL,
  `Sales_DateTime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_account`
--
ALTER TABLE `tbl_account`
  ADD PRIMARY KEY (`acct_id`);

--
-- Indexes for table `tbl_customer`
--
ALTER TABLE `tbl_customer`
  ADD PRIMARY KEY (`Cust_id`);

--
-- Indexes for table `tbl_inventory`
--
ALTER TABLE `tbl_inventory`
  ADD PRIMARY KEY (`Invnt_id`);

--
-- Indexes for table `tbl_orders`
--
ALTER TABLE `tbl_orders`
  ADD PRIMARY KEY (`Order_id`),
  ADD KEY `Prchs_id` (`Prchs_id`);

--
-- Indexes for table `tbl_payment`
--
ALTER TABLE `tbl_payment`
  ADD PRIMARY KEY (`Pay_id`);

--
-- Indexes for table `tbl_people`
--
ALTER TABLE `tbl_people`
  ADD PRIMARY KEY (`ppl_id`),
  ADD KEY `acct_id` (`acct_id`);

--
-- Indexes for table `tbl_purchase`
--
ALTER TABLE `tbl_purchase`
  ADD PRIMARY KEY (`Prchs_id`),
  ADD KEY `Pay_id` (`Pay_id`),
  ADD KEY `Cust_id` (`Cust_id`);

--
-- Indexes for table `tbl_report`
--
ALTER TABLE `tbl_report`
  ADD PRIMARY KEY (`Report_id`),
  ADD KEY `Sales_id` (`Sales_id`);

--
-- Indexes for table `tbl_sales`
--
ALTER TABLE `tbl_sales`
  ADD PRIMARY KEY (`Sales_id`),
  ADD KEY `Order_id` (`Order_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_account`
--
ALTER TABLE `tbl_account`
  MODIFY `acct_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_customer`
--
ALTER TABLE `tbl_customer`
  MODIFY `Cust_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_inventory`
--
ALTER TABLE `tbl_inventory`
  MODIFY `Invnt_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_people`
--
ALTER TABLE `tbl_people`
  MODIFY `ppl_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_purchase`
--
ALTER TABLE `tbl_purchase`
  MODIFY `Prchs_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_orders`
--
ALTER TABLE `tbl_orders`
  ADD CONSTRAINT `tbl_orders_ibfk_1` FOREIGN KEY (`Prchs_id`) REFERENCES `tbl_purchase` (`Prchs_id`);

--
-- Constraints for table `tbl_people`
--
ALTER TABLE `tbl_people`
  ADD CONSTRAINT `tbl_people_ibfk_1` FOREIGN KEY (`acct_id`) REFERENCES `tbl_account` (`acct_id`);

--
-- Constraints for table `tbl_purchase`
--
ALTER TABLE `tbl_purchase`
  ADD CONSTRAINT `tbl_purchase_ibfk_1` FOREIGN KEY (`Pay_id`) REFERENCES `tbl_payment` (`Pay_id`),
  ADD CONSTRAINT `tbl_purchase_ibfk_2` FOREIGN KEY (`Cust_id`) REFERENCES `tbl_customer` (`Cust_id`);

--
-- Constraints for table `tbl_report`
--
ALTER TABLE `tbl_report`
  ADD CONSTRAINT `tbl_report_ibfk_1` FOREIGN KEY (`Sales_id`) REFERENCES `tbl_sales` (`Sales_id`);

--
-- Constraints for table `tbl_sales`
--
ALTER TABLE `tbl_sales`
  ADD CONSTRAINT `tbl_sales_ibfk_1` FOREIGN KEY (`Order_id`) REFERENCES `tbl_orders` (`Order_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 4.9.7deb1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 26, 2021 at 06:12 PM
-- Server version: 8.0.25-0ubuntu0.21.04.1
-- PHP Version: 7.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ssnodb`
--

-- --------------------------------------------------------

--
-- Table structure for table `ambulance_call`
--

CREATE TABLE `ambulance_call` (
  `id` int NOT NULL,
  `bill_no` varchar(200) NOT NULL,
  `patient_name` varchar(50) DEFAULT NULL,
  `contact_no` varchar(30) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `vehicle_no` varchar(20) DEFAULT NULL,
  `vehicle_model` varchar(20) DEFAULT NULL,
  `driver` varchar(100) NOT NULL,
  `amount` decimal(15,2) DEFAULT NULL,
  `date` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `generated_by` int NOT NULL,
  `call_from` varchar(200) NOT NULL,
  `call_to` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

CREATE TABLE `appointment` (
  `id` int NOT NULL,
  `patient_id` int NOT NULL,
  `appointment_no` varchar(100) NOT NULL,
  `date` datetime DEFAULT NULL,
  `priority` varchar(100) NOT NULL,
  `patient_name` varchar(50) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `mobileno` varchar(50) DEFAULT NULL,
  `specialist` varchar(100) NOT NULL,
  `doctor` varchar(50) DEFAULT NULL,
  `amount` varchar(200) NOT NULL,
  `message` varchar(255) DEFAULT NULL,
  `appointment_status` varchar(11) DEFAULT NULL,
  `source` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_opd` varchar(200) NOT NULL,
  `is_ipd` varchar(200) NOT NULL,
  `live_consult` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `appoint_priority`
--

CREATE TABLE `appoint_priority` (
  `id` int NOT NULL,
  `appoint_priority` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `appoint_priority`
--

INSERT INTO `appoint_priority` (`id`, `appoint_priority`) VALUES
(1, 'Normal'),
(2, 'Urgent'),
(3, 'Very Urgent'),
(4, 'Low');

-- --------------------------------------------------------

--
-- Table structure for table `bed`
--

CREATE TABLE `bed` (
  `id` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `bed_type_id` int NOT NULL,
  `bed_group_id` int NOT NULL,
  `is_active` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `bed_group`
--

CREATE TABLE `bed_group` (
  `id` int NOT NULL,
  `name` varchar(200) NOT NULL,
  `description` varchar(200) NOT NULL,
  `floor` varchar(100) NOT NULL,
  `is_active` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `bed_type`
--

CREATE TABLE `bed_type` (
  `id` int NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `birth_report`
--

CREATE TABLE `birth_report` (
  `id` int NOT NULL,
  `ref_no` varchar(200) NOT NULL,
  `opd_ipd_no` varchar(200) NOT NULL,
  `child_name` varchar(200) NOT NULL,
  `child_pic` varchar(200) NOT NULL,
  `gender` varchar(200) NOT NULL,
  `birth_date` datetime NOT NULL,
  `weight` varchar(200) NOT NULL,
  `mother_name` varchar(200) NOT NULL,
  `contact` varchar(200) NOT NULL,
  `mother_pic` varchar(200) NOT NULL,
  `father_name` varchar(200) NOT NULL,
  `father_pic` varchar(200) NOT NULL,
  `birth_report` mediumtext NOT NULL,
  `document` varchar(200) NOT NULL,
  `address` varchar(200) NOT NULL,
  `is_active` varchar(200) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `blood_bank_status`
--

CREATE TABLE `blood_bank_status` (
  `id` int NOT NULL,
  `blood_group` varchar(3) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `ceated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `blood_bank_status`
--

INSERT INTO `blood_bank_status` (`id`, `blood_group`, `status`, `ceated_at`) VALUES
(1, 'A+', '0', '2018-08-18 11:40:07'),
(2, 'B+', '0', '2018-08-18 12:10:55'),
(3, 'A-', '0', '2018-08-18 12:11:24'),
(4, 'B-', '0', '2018-08-18 12:11:44'),
(5, 'O+', '0', '2018-08-18 12:12:06'),
(6, 'O-', '0', '2018-08-18 12:12:20'),
(7, 'AB+', '0', '2018-08-18 12:12:36'),
(8, 'AB-', '0', '2018-08-18 12:13:18');

-- --------------------------------------------------------

--
-- Table structure for table `blood_donor`
--

CREATE TABLE `blood_donor` (
  `id` int NOT NULL,
  `donor_name` varchar(100) DEFAULT NULL,
  `age` varchar(11) DEFAULT NULL,
  `month` varchar(20) DEFAULT NULL,
  `blood_group` varchar(11) DEFAULT NULL,
  `gender` varchar(11) DEFAULT NULL,
  `father_name` varchar(100) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `contact_no` varchar(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `blood_donor_cycle`
--

CREATE TABLE `blood_donor_cycle` (
  `id` int NOT NULL,
  `blood_donor_id` int NOT NULL,
  `institution` varchar(100) DEFAULT NULL,
  `lot` varchar(11) DEFAULT NULL,
  `bag_no` varchar(11) DEFAULT NULL,
  `quantity` varchar(11) DEFAULT NULL,
  `donate_date` date NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `blood_issue`
--

CREATE TABLE `blood_issue` (
  `id` int NOT NULL,
  `bill_no` varchar(200) NOT NULL,
  `date_of_issue` datetime DEFAULT NULL,
  `recieve_to` varchar(50) DEFAULT NULL,
  `blood_group` varchar(50) DEFAULT NULL,
  `gender` varchar(50) DEFAULT NULL,
  `doctor` varchar(200) DEFAULT NULL,
  `institution` varchar(100) DEFAULT NULL,
  `technician` varchar(50) DEFAULT NULL,
  `amount` decimal(15,2) DEFAULT NULL,
  `donor_name` varchar(50) DEFAULT NULL,
  `lot` varchar(20) DEFAULT NULL,
  `bag_no` varchar(20) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `generated_by` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `charges`
--

CREATE TABLE `charges` (
  `id` int NOT NULL,
  `charge_type` varchar(200) NOT NULL,
  `charge_category` varchar(200) NOT NULL,
  `description` varchar(200) NOT NULL,
  `code` varchar(100) NOT NULL,
  `standard_charge` varchar(200) NOT NULL,
  `date` date NOT NULL,
  `status` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `charge_categories`
--

CREATE TABLE `charge_categories` (
  `id` int NOT NULL,
  `name` varchar(200) NOT NULL,
  `description` varchar(200) NOT NULL,
  `charge_type` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `charge_type_master`
--

CREATE TABLE `charge_type_master` (
  `id` int NOT NULL,
  `charge_type` varchar(200) NOT NULL,
  `is_default` varchar(100) NOT NULL,
  `is_active` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `charge_type_master`
--

INSERT INTO `charge_type_master` (`id`, `charge_type`, `is_default`, `is_active`) VALUES
(1, 'Procedures', 'yes', 'yes'),
(2, 'Investigations', 'yes', 'yes'),
(3, 'Supplier', 'yes', 'yes'),
(4, 'Operation Theatre', 'yes', 'yes'),
(5, 'Others', 'yes', 'yes');

-- --------------------------------------------------------

--
-- Table structure for table `complaint`
--

CREATE TABLE `complaint` (
  `id` int NOT NULL,
  `complaint_type` varchar(100) NOT NULL,
  `source` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `contact` varchar(15) NOT NULL,
  `email` varchar(200) NOT NULL,
  `date` date NOT NULL,
  `description` text NOT NULL,
  `action_taken` varchar(200) NOT NULL,
  `assigned` varchar(50) NOT NULL,
  `note` text NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `complaint_type`
--

CREATE TABLE `complaint_type` (
  `id` int NOT NULL,
  `complaint_type` varchar(100) NOT NULL,
  `description` mediumtext NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `conferences`
--

CREATE TABLE `conferences` (
  `id` int NOT NULL,
  `purpose` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `staff_id` int DEFAULT NULL,
  `patient_id` int NOT NULL,
  `opd_id` int NOT NULL,
  `ipd_id` int NOT NULL,
  `created_id` int DEFAULT NULL,
  `title` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `date` datetime NOT NULL,
  `duration` int NOT NULL,
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `host_video` int NOT NULL,
  `client_video` int NOT NULL,
  `description` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `timezone` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `return_response` text NOT NULL,
  `api_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `conferences_history`
--

CREATE TABLE `conferences_history` (
  `id` int NOT NULL,
  `conference_id` int NOT NULL,
  `staff_id` int NOT NULL,
  `patient_id` int DEFAULT NULL,
  `total_hit` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `conference_staff`
--

CREATE TABLE `conference_staff` (
  `id` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `conference_id` int NOT NULL,
  `staff_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `consultant_register`
--

CREATE TABLE `consultant_register` (
  `id` int NOT NULL,
  `patient_id` int NOT NULL,
  `ipd_id` int NOT NULL,
  `date` varchar(100) DEFAULT NULL,
  `ins_date` varchar(50) DEFAULT NULL,
  `instruction` varchar(200) NOT NULL,
  `cons_doctor` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `consult_charges`
--

CREATE TABLE `consult_charges` (
  `id` int NOT NULL,
  `doctor` int NOT NULL,
  `standard_charge` varchar(200) NOT NULL,
  `date` date NOT NULL,
  `status` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `contents`
--

CREATE TABLE `contents` (
  `id` int NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `is_public` varchar(10) DEFAULT 'No',
  `class_id` int DEFAULT NULL,
  `cls_sec_id` int NOT NULL,
  `file` varchar(250) DEFAULT NULL,
  `created_by` int NOT NULL,
  `note` text,
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `content_for`
--

CREATE TABLE `content_for` (
  `id` int NOT NULL,
  `role` varchar(50) DEFAULT NULL,
  `content_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `custom_fields`
--

CREATE TABLE `custom_fields` (
  `id` int NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `belong_to` varchar(100) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `bs_column` int DEFAULT NULL,
  `validation` int DEFAULT '0',
  `field_values` mediumtext,
  `show_table` varchar(100) DEFAULT NULL,
  `visible_on_table` int NOT NULL,
  `weight` int DEFAULT NULL,
  `is_active` int DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `custom_field_values`
--

CREATE TABLE `custom_field_values` (
  `id` int NOT NULL,
  `belong_table_id` int DEFAULT NULL,
  `custom_field_id` int DEFAULT NULL,
  `field_value` varchar(200) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `death_report`
--

CREATE TABLE `death_report` (
  `id` int NOT NULL,
  `opdipd_no` varchar(200) NOT NULL,
  `patient` varchar(200) NOT NULL,
  `gender` varchar(50) NOT NULL,
  `image` varchar(200) NOT NULL,
  `death_date` datetime NOT NULL,
  `guardian_name` varchar(200) NOT NULL,
  `contact` varchar(15) NOT NULL,
  `address` varchar(200) NOT NULL,
  `death_report` text NOT NULL,
  `is_active` varchar(200) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `id` int NOT NULL,
  `department_name` varchar(200) NOT NULL,
  `is_active` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `diagnosis`
--

CREATE TABLE `diagnosis` (
  `id` int NOT NULL,
  `patient_id` int NOT NULL,
  `report_type` varchar(200) NOT NULL,
  `document` varchar(200) NOT NULL,
  `description` varchar(400) NOT NULL,
  `report_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `discharged_summary`
--

CREATE TABLE `discharged_summary` (
  `id` int NOT NULL,
  `patient_id` int NOT NULL,
  `ipd_id` int NOT NULL,
  `operation` varchar(200) NOT NULL,
  `diagnosis` varchar(200) NOT NULL,
  `note` text NOT NULL,
  `investigations` text NOT NULL,
  `treatment_home` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `discharged_summary_opd`
--

CREATE TABLE `discharged_summary_opd` (
  `id` int NOT NULL,
  `patient_id` int NOT NULL,
  `opd_id` int NOT NULL,
  `operation` varchar(200) NOT NULL,
  `diagnosis` varchar(200) NOT NULL,
  `note` text NOT NULL,
  `investigations` text NOT NULL,
  `treatment_home` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dispatch_receive`
--

CREATE TABLE `dispatch_receive` (
  `id` int NOT NULL,
  `reference_no` varchar(50) NOT NULL,
  `to_title` varchar(100) NOT NULL,
  `address` varchar(500) NOT NULL,
  `note` varchar(500) NOT NULL,
  `from_title` varchar(200) NOT NULL,
  `date` varchar(20) NOT NULL,
  `image` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `type` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `email_config`
--

CREATE TABLE `email_config` (
  `id` int UNSIGNED NOT NULL,
  `email_type` varchar(100) DEFAULT NULL,
  `smtp_server` varchar(100) DEFAULT NULL,
  `smtp_port` varchar(100) DEFAULT NULL,
  `smtp_username` varchar(100) DEFAULT NULL,
  `smtp_password` varchar(100) DEFAULT NULL,
  `ssl_tls` varchar(100) DEFAULT NULL,
  `is_active` varchar(10) NOT NULL DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `email_config`
--

INSERT INTO `email_config` (`id`, `email_type`, `smtp_server`, `smtp_port`, `smtp_username`, `smtp_password`, `ssl_tls`, `is_active`) VALUES
(2, 'sendmail', '', '', '', '', '', 'yes');

-- --------------------------------------------------------

--
-- Table structure for table `enquiry`
--

CREATE TABLE `enquiry` (
  `id` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `contact` varchar(20) NOT NULL,
  `address` mediumtext NOT NULL,
  `reference` varchar(20) NOT NULL,
  `date` date NOT NULL,
  `description` varchar(500) NOT NULL,
  `follow_up_date` date NOT NULL,
  `note` mediumtext NOT NULL,
  `source` varchar(50) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `assigned` varchar(100) NOT NULL,
  `class` int NOT NULL,
  `no_of_child` varchar(11) DEFAULT NULL,
  `status` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `enquiry_type`
--

CREATE TABLE `enquiry_type` (
  `id` int NOT NULL,
  `enquiry_type` varchar(100) NOT NULL,
  `description` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` int NOT NULL,
  `event_title` varchar(200) NOT NULL,
  `event_description` varchar(300) NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `event_type` varchar(100) NOT NULL,
  `event_color` varchar(200) NOT NULL,
  `event_for` varchar(100) NOT NULL,
  `role_id` int NOT NULL,
  `is_active` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `id` int NOT NULL,
  `exp_head_id` int DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `invoice_no` varchar(200) NOT NULL,
  `date` date DEFAULT NULL,
  `amount` decimal(15,2) DEFAULT NULL,
  `documents` varchar(255) DEFAULT NULL,
  `note` text,
  `is_active` varchar(255) DEFAULT 'yes',
  `is_deleted` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `expense_head`
--

CREATE TABLE `expense_head` (
  `id` int NOT NULL,
  `exp_category` varchar(50) DEFAULT NULL,
  `description` text,
  `is_active` varchar(255) DEFAULT 'yes',
  `is_deleted` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `floor`
--

CREATE TABLE `floor` (
  `id` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `follow_up`
--

CREATE TABLE `follow_up` (
  `id` int NOT NULL,
  `enquiry_id` int NOT NULL,
  `date` date NOT NULL,
  `next_date` date NOT NULL,
  `response` text NOT NULL,
  `note` text NOT NULL,
  `followup_by` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `front_cms_media_gallery`
--

CREATE TABLE `front_cms_media_gallery` (
  `id` int NOT NULL,
  `image` varchar(300) DEFAULT NULL,
  `thumb_path` varchar(300) DEFAULT NULL,
  `dir_path` varchar(300) DEFAULT NULL,
  `img_name` varchar(300) DEFAULT NULL,
  `thumb_name` varchar(300) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `file_type` varchar(100) NOT NULL,
  `file_size` varchar(100) NOT NULL,
  `vid_url` mediumtext NOT NULL,
  `vid_title` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `front_cms_menus`
--

CREATE TABLE `front_cms_menus` (
  `id` int NOT NULL,
  `menu` varchar(100) DEFAULT NULL,
  `slug` varchar(200) DEFAULT NULL,
  `description` mediumtext,
  `open_new_tab` int NOT NULL DEFAULT '0',
  `ext_url` mediumtext NOT NULL,
  `ext_url_link` mediumtext NOT NULL,
  `publish` int NOT NULL DEFAULT '0',
  `content_type` varchar(10) NOT NULL DEFAULT 'manual',
  `is_active` varchar(10) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `front_cms_menus`
--

INSERT INTO `front_cms_menus` (`id`, `menu`, `slug`, `description`, `open_new_tab`, `ext_url`, `ext_url_link`, `publish`, `content_type`, `is_active`) VALUES
(1, 'Main Menu', 'main-menu', 'Main menu', 0, '', '', 0, 'default', 'no'),
(2, 'Bottom Menu', 'bottom-menu', 'Bottom Menu', 0, '', '', 0, 'default', 'no');

-- --------------------------------------------------------

--
-- Table structure for table `front_cms_menu_items`
--

CREATE TABLE `front_cms_menu_items` (
  `id` int NOT NULL,
  `menu_id` int NOT NULL,
  `menu` varchar(100) DEFAULT NULL,
  `page_id` int NOT NULL,
  `parent_id` int NOT NULL,
  `ext_url` mediumtext,
  `open_new_tab` int DEFAULT '0',
  `ext_url_link` mediumtext,
  `slug` varchar(200) DEFAULT NULL,
  `weight` int DEFAULT NULL,
  `publish` int NOT NULL DEFAULT '0',
  `description` mediumtext,
  `is_active` varchar(10) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `front_cms_menu_items`
--

INSERT INTO `front_cms_menu_items` (`id`, `menu_id`, `menu`, `page_id`, `parent_id`, `ext_url`, `open_new_tab`, `ext_url_link`, `slug`, `weight`, `publish`, `description`, `is_active`) VALUES
(16, 2, 'Home', 1, 0, NULL, NULL, NULL, 'home-1', NULL, 0, NULL, 'no'),
(23, 1, 'Appointment', 77, 0, '1', NULL, 'http://yourdomainname.com/form/appointment', 'appointment', 2, 0, NULL, 'no'),
(26, 1, 'Home', 1, 0, NULL, NULL, NULL, 'home', NULL, 0, NULL, 'no'),
(27, 2, 'Appointment', 0, 0, '1', NULL, 'http://yourdomainname.com/form/appointment', 'appointment-1', NULL, 0, NULL, 'no');

-- --------------------------------------------------------

--
-- Table structure for table `front_cms_pages`
--

CREATE TABLE `front_cms_pages` (
  `id` int NOT NULL,
  `page_type` varchar(10) NOT NULL DEFAULT 'manual',
  `is_homepage` int DEFAULT '0',
  `title` varchar(250) DEFAULT NULL,
  `url` varchar(250) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `slug` varchar(200) DEFAULT NULL,
  `meta_title` mediumtext,
  `meta_description` mediumtext,
  `meta_keyword` mediumtext,
  `feature_image` varchar(200) NOT NULL,
  `description` longtext,
  `publish_date` date NOT NULL,
  `publish` int DEFAULT '0',
  `sidebar` int DEFAULT '0',
  `is_active` varchar(10) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `front_cms_pages`
--

INSERT INTO `front_cms_pages` (`id`, `page_type`, `is_homepage`, `title`, `url`, `type`, `slug`, `meta_title`, `meta_description`, `meta_keyword`, `feature_image`, `description`, `publish_date`, `publish`, `sidebar`, `is_active`) VALUES
(1, 'default', 1, 'Home', 'page/home', 'page', 'home', '', '', '', '', '<p>Home page</p>', '0000-00-00', 1, 1, 'no'),
(2, 'default', 0, 'Complain', 'page/complain', 'page', 'complain', 'Complain form', '                                                                                                                                                                                    complain form                                                                                                                                                                                                                                ', 'complain form', '', '<div class=\"col-md-12 col-sm-12\">\r\n<h2 class=\"text-center\">&nbsp;</h2>\r\n\r\n<p class=\"text-center\">[form-builder:complain]</p>\r\n</div>', '0000-00-00', 1, 1, 'no'),
(54, 'default', 0, '404 page', 'page/404-page', 'page', '404-page', '', '                                ', '', '', '<html>\r\n<head>\r\n <title></title>\r\n</head>\r\n<body>\r\n<p>404 page found</p>\r\n</body>\r\n</html>', '0000-00-00', 0, NULL, 'no'),
(76, 'default', 0, 'Contact us', 'page/contact-us', 'page', 'contact-us', '', '', '', '', '<p>[form-builder:contact_us]</p>', '0000-00-00', 0, NULL, 'no'),
(77, 'manual', 0, 'our-appointment', 'page/our-appointment', 'page', 'our-appointment', '', '', '', '', '<form action=\"welcome/appointment\" method=\"get\">\r\n  First name: <input type=\"text\" name=\"fname\"><br>\r\n  Last name: <input type=\"text\" name=\"lname\"><br>\r\n  <input type=\"submit\" value=\"Submit\">\r\n</form>', '0000-00-00', 0, 1, 'no');

-- --------------------------------------------------------

--
-- Table structure for table `front_cms_page_contents`
--

CREATE TABLE `front_cms_page_contents` (
  `id` int NOT NULL,
  `page_id` int DEFAULT NULL,
  `content_type` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `front_cms_programs`
--

CREATE TABLE `front_cms_programs` (
  `id` int NOT NULL,
  `type` varchar(50) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `url` mediumtext,
  `title` varchar(200) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `event_start` date DEFAULT NULL,
  `event_end` date DEFAULT NULL,
  `event_venue` mediumtext,
  `description` mediumtext,
  `is_active` varchar(10) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `meta_title` mediumtext NOT NULL,
  `meta_description` mediumtext NOT NULL,
  `meta_keyword` mediumtext NOT NULL,
  `feature_image` mediumtext NOT NULL,
  `publish_date` date NOT NULL,
  `publish` varchar(10) DEFAULT '0',
  `sidebar` int DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `front_cms_program_photos`
--

CREATE TABLE `front_cms_program_photos` (
  `id` int NOT NULL,
  `program_id` int DEFAULT NULL,
  `media_gallery_id` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `front_cms_settings`
--

CREATE TABLE `front_cms_settings` (
  `id` int NOT NULL,
  `theme` varchar(50) DEFAULT NULL,
  `is_active_rtl` int DEFAULT '0',
  `is_active_front_cms` int DEFAULT '0',
  `is_active_sidebar` int DEFAULT '0',
  `logo` varchar(200) DEFAULT NULL,
  `contact_us_email` varchar(100) DEFAULT NULL,
  `complain_form_email` varchar(100) DEFAULT NULL,
  `sidebar_options` mediumtext NOT NULL,
  `fb_url` varchar(200) NOT NULL,
  `twitter_url` varchar(200) NOT NULL,
  `youtube_url` varchar(200) NOT NULL,
  `google_plus` varchar(200) NOT NULL,
  `instagram_url` varchar(200) NOT NULL,
  `pinterest_url` varchar(200) NOT NULL,
  `linkedin_url` varchar(200) NOT NULL,
  `google_analytics` mediumtext,
  `footer_text` varchar(500) DEFAULT NULL,
  `fav_icon` varchar(250) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `front_cms_settings`
--

INSERT INTO `front_cms_settings` (`id`, `theme`, `is_active_rtl`, `is_active_front_cms`, `is_active_sidebar`, `logo`, `contact_us_email`, `complain_form_email`, `sidebar_options`, `fb_url`, `twitter_url`, `youtube_url`, `google_plus`, `instagram_url`, `pinterest_url`, `linkedin_url`, `google_analytics`, `footer_text`, `fav_icon`) VALUES
(1, 'default', NULL, 0, 0, '', '', '', '[\"news\",\"complain\"]', '', '', '', '', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `general_calls`
--

CREATE TABLE `general_calls` (
  `id` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `contact` varchar(12) NOT NULL,
  `date` date NOT NULL,
  `description` varchar(500) NOT NULL,
  `follow_up_date` date NOT NULL,
  `call_dureation` varchar(50) NOT NULL,
  `note` mediumtext NOT NULL,
  `call_type` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `income`
--

CREATE TABLE `income` (
  `id` int NOT NULL,
  `inc_head_id` varchar(11) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `invoice_no` varchar(200) NOT NULL,
  `date` date DEFAULT NULL,
  `amount` decimal(15,2) DEFAULT NULL,
  `note` text,
  `is_active` varchar(255) DEFAULT 'yes',
  `is_deleted` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `documents` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `income_head`
--

CREATE TABLE `income_head` (
  `id` int NOT NULL,
  `income_category` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `is_active` varchar(255) NOT NULL DEFAULT 'yes',
  `is_deleted` varchar(255) NOT NULL DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `ipd_billing`
--

CREATE TABLE `ipd_billing` (
  `id` int NOT NULL,
  `patient_id` int NOT NULL,
  `ipd_id` int NOT NULL,
  `discount` int NOT NULL,
  `other_charge` varchar(200) NOT NULL,
  `date` date NOT NULL,
  `tax` decimal(15,2) NOT NULL,
  `gross_total` decimal(15,2) NOT NULL,
  `net_amount` decimal(15,2) NOT NULL,
  `total_amount` decimal(15,2) NOT NULL,
  `generated_by` int NOT NULL,
  `status` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `ipd_details`
--

CREATE TABLE `ipd_details` (
  `id` int NOT NULL,
  `patient_id` int NOT NULL,
  `height` varchar(5) DEFAULT NULL,
  `weight` varchar(5) DEFAULT NULL,
  `pulse` varchar(200) NOT NULL,
  `temperature` varchar(200) NOT NULL,
  `respiration` varchar(200) NOT NULL,
  `bp` varchar(20) DEFAULT NULL,
  `ipd_no` varchar(200) NOT NULL,
  `room` varchar(100) NOT NULL,
  `bed` varchar(100) NOT NULL,
  `bed_group_id` varchar(10) DEFAULT NULL,
  `case_type` varchar(100) NOT NULL,
  `casualty` varchar(100) NOT NULL,
  `symptoms` varchar(200) NOT NULL,
  `known_allergies` varchar(200) NOT NULL,
  `note` text NOT NULL,
  `refference` varchar(200) NOT NULL,
  `cons_doctor` int NOT NULL,
  `amount` varchar(100) NOT NULL,
  `credit_limit` varchar(100) NOT NULL,
  `tax` varchar(100) NOT NULL,
  `payment_mode` varchar(100) NOT NULL,
  `date` datetime NOT NULL,
  `discharged` varchar(200) NOT NULL,
  `discharged_date` date NOT NULL,
  `live_consult` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `ipd_prescription_basic`
--

CREATE TABLE `ipd_prescription_basic` (
  `id` int NOT NULL,
  `ipd_id` int NOT NULL,
  `header_note` varchar(100) NOT NULL,
  `footer_note` varchar(100) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `ipd_prescription_details`
--

CREATE TABLE `ipd_prescription_details` (
  `id` int NOT NULL,
  `basic_id` int NOT NULL,
  `ipd_id` int NOT NULL,
  `medicine_category_id` int NOT NULL,
  `medicine` varchar(200) NOT NULL,
  `dosage` varchar(200) NOT NULL,
  `instruction` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE `item` (
  `id` int NOT NULL,
  `item_category_id` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `unit` varchar(200) NOT NULL,
  `item_photo` varchar(225) DEFAULT NULL,
  `description` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `item_store_id` int DEFAULT NULL,
  `item_supplier_id` int DEFAULT NULL,
  `quantity` int NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `item_category`
--

CREATE TABLE `item_category` (
  `id` int NOT NULL,
  `item_category` varchar(255) NOT NULL,
  `is_active` varchar(255) NOT NULL DEFAULT 'yes',
  `description` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `item_issue`
--

CREATE TABLE `item_issue` (
  `id` int NOT NULL,
  `issue_type` varchar(15) DEFAULT NULL,
  `issue_to` varchar(100) DEFAULT NULL,
  `issue_by` varchar(100) DEFAULT NULL,
  `issue_date` date DEFAULT NULL,
  `return_date` date DEFAULT NULL,
  `item_category_id` int DEFAULT NULL,
  `item_id` int DEFAULT NULL,
  `quantity` int NOT NULL,
  `note` text NOT NULL,
  `is_returned` int NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_active` varchar(10) DEFAULT 'no'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `item_stock`
--

CREATE TABLE `item_stock` (
  `id` int NOT NULL,
  `item_id` int DEFAULT NULL,
  `supplier_id` int DEFAULT NULL,
  `symbol` varchar(10) NOT NULL DEFAULT '+',
  `store_id` int DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `purchase_price` varchar(200) NOT NULL,
  `date` date NOT NULL,
  `attachment` varchar(250) DEFAULT NULL,
  `description` text NOT NULL,
  `is_active` varchar(10) DEFAULT 'yes',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `item_store`
--

CREATE TABLE `item_store` (
  `id` int NOT NULL,
  `item_store` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `item_supplier`
--

CREATE TABLE `item_supplier` (
  `id` int NOT NULL,
  `item_supplier` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `contact_person_name` varchar(255) NOT NULL,
  `contact_person_phone` varchar(255) NOT NULL,
  `contact_person_email` varchar(255) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `lab`
--

CREATE TABLE `lab` (
  `id` int NOT NULL,
  `lab_name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` int NOT NULL,
  `language` varchar(50) DEFAULT NULL,
  `short_code` varchar(255) NOT NULL,
  `country_code` varchar(255) NOT NULL,
  `is_deleted` varchar(10) NOT NULL DEFAULT 'yes',
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_active`, `updated_at`) VALUES
(1, 'Azerbaijan', 'az', 'az', 'no', 'no', '0000-00-00'),
(2, 'Albanian', 'sq', 'al', 'no', 'no', '0000-00-00'),
(3, 'Amharic', 'am', 'am', 'no', 'no', '0000-00-00'),
(4, 'English', 'en', 'us', 'no', 'no', '0000-00-00'),
(5, 'Arabic', 'ar', 'sa', 'no', 'no', '0000-00-00'),
(7, 'Afrikaans', 'af', 'af', 'no', 'no', '0000-00-00'),
(8, 'Basque', 'eu', 'es', 'no', 'no', '0000-00-00'),
(11, 'Bengali', 'bn', 'in', 'no', 'no', '0000-00-00'),
(13, 'Bosnian', 'bs', 'bs', 'no', 'no', '0000-00-00'),
(14, 'Welsh', 'cy', 'cy', 'no', 'no', '0000-00-00'),
(15, 'Hungarian', 'hu', 'hu', 'no', 'no', '0000-00-00'),
(16, 'Vietnamese', 'vi', 'vi', 'no', 'no', '0000-00-00'),
(17, 'Haitian', 'ht', 'ht', 'no', 'no', '0000-00-00'),
(18, 'Galician', 'gl', 'gl', 'no', 'no', '0000-00-00'),
(19, 'Dutch', 'nl', 'nl', 'no', 'no', '0000-00-00'),
(21, 'Greek', 'el', 'gr', 'no', 'no', '0000-00-00'),
(22, 'Georgian', 'ka', 'ge', 'no', 'no', '0000-00-00'),
(23, 'Gujarati', 'gu', 'in', 'no', 'no', '0000-00-00'),
(24, 'Danish', 'da', 'dk', 'no', 'no', '0000-00-00'),
(25, 'Hebrew', 'he', 'il', 'no', 'no', '0000-00-00'),
(26, 'Yiddish', 'yi', 'il', 'no', 'no', '0000-00-00'),
(27, 'Indonesian', 'id', 'id', 'no', 'no', '0000-00-00'),
(28, 'Irish', 'ga', 'ga', 'no', 'no', '0000-00-00'),
(29, 'Italian', 'it', 'it', 'no', 'no', '0000-00-00'),
(30, 'Icelandic', 'is', 'is', 'no', 'no', '0000-00-00'),
(31, 'Spanish', 'es', 'es', 'no', 'no', '0000-00-00'),
(33, 'Kannada', 'kn', 'kn', 'no', 'no', '0000-00-00'),
(34, 'Catalan', 'ca', 'ca', 'no', 'no', '0000-00-00'),
(36, 'Chinese', 'zh', 'cn', 'no', 'no', '0000-00-00'),
(37, 'Korean', 'ko', 'kr', 'no', 'no', '0000-00-00'),
(38, 'Xhosa', 'xh', 'ls', 'no', 'no', '0000-00-00'),
(39, 'Latin', 'la', 'la', 'no', 'no', '0000-00-00'),
(40, 'Latvian', 'lv', 'lv', 'no', 'no', '0000-00-00'),
(41, 'Lithuanian', 'lt', 'lt', 'no', 'no', '0000-00-00'),
(43, 'Malagasy', 'mg', 'mg', 'no', 'no', '0000-00-00'),
(44, 'Malay', 'ms', 'ms', 'no', 'no', '0000-00-00'),
(45, 'Malayalam', 'ml', 'ml', 'no', 'no', '0000-00-00'),
(46, 'Maltese', 'mt', 'mt', 'no', 'no', '0000-00-00'),
(47, 'Macedonian', 'mk', 'mk', 'no', 'no', '0000-00-00'),
(48, 'Maori', 'mi', 'nz', 'no', 'no', '0000-00-00'),
(49, 'Marathi', 'mr', 'in', 'no', 'no', '0000-00-00'),
(51, 'Mongolian', 'mn', 'mn', 'no', 'no', '0000-00-00'),
(52, 'German', 'de', 'de', 'no', 'no', '0000-00-00'),
(53, 'Nepali', 'ne', 'ne', 'no', 'no', '0000-00-00'),
(54, 'Norwegian', 'no', 'no', 'no', 'no', '0000-00-00'),
(55, 'Punjabi', 'pa', 'in', 'no', 'no', '0000-00-00'),
(57, 'Persian', 'fa', 'ir', 'no', 'no', '0000-00-00'),
(59, 'Portuguese', 'pt', 'pt', 'no', 'no', '0000-00-00'),
(60, 'Romanian', 'ro', 'ro', 'no', 'no', '0000-00-00'),
(61, 'Russian', 'ru', 'ru', 'no', 'no', '0000-00-00'),
(62, 'Cebuano', 'ceb', 'ph', 'no', 'no', '0000-00-00'),
(64, 'Sinhala', 'si', 'si', 'no', 'no', '0000-00-00'),
(65, 'Slovakian', 'sk', 'sk', 'no', 'no', '0000-00-00'),
(66, 'Slovenian', 'sl', 'sl', 'no', 'no', '0000-00-00'),
(67, 'Swahili', 'sw', 'ke', 'no', 'no', '0000-00-00'),
(68, 'Sundanese', 'su', 'sd', 'no', 'no', '0000-00-00'),
(70, 'Thai', 'th', 'th', 'no', 'no', '0000-00-00'),
(71, 'Tagalog', 'tl', 'tl', 'no', 'no', '0000-00-00'),
(72, 'Tamil', 'ta', 'in', 'no', 'no', '0000-00-00'),
(74, 'Telugu', 'te', 'in', 'no', 'no', '0000-00-00'),
(75, 'Turkish', 'tr', 'tr', 'no', 'no', '0000-00-00'),
(77, 'Uzbek', 'uz', 'uz', 'no', 'no', '0000-00-00'),
(79, 'Urdu', 'ur', 'pk', 'no', 'no', '0000-00-00'),
(80, 'Finnish', 'fi', 'fi', 'no', 'no', '0000-00-00'),
(81, 'French', 'fr', 'fr', 'no', 'no', '0000-00-00'),
(82, 'Hindi', 'hi', 'in', 'no', 'no', '0000-00-00'),
(84, 'Czech', 'cs', 'cz', 'no', 'no', '0000-00-00'),
(85, 'Swedish', 'sv', 'sv', 'no', 'no', '0000-00-00'),
(86, 'Scottish', 'gd', 'gd', 'no', 'no', '0000-00-00'),
(87, 'Estonian', 'et', 'et', 'no', 'no', '0000-00-00'),
(88, 'Esperanto', 'eo', 'br', 'no', 'no', '0000-00-00'),
(89, 'Javanese', 'jv', 'id', 'no', 'no', '0000-00-00'),
(90, 'Japanese', 'ja', 'jp', 'no', 'no', '0000-00-00'),
(91, 'Polish', 'pl', 'pl', 'yes', 'no', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `leave_types`
--

CREATE TABLE `leave_types` (
  `id` int NOT NULL,
  `type` varchar(200) NOT NULL,
  `is_active` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `medicine_bad_stock`
--

CREATE TABLE `medicine_bad_stock` (
  `id` int NOT NULL,
  `pharmacy_id` int NOT NULL,
  `outward_date` date NOT NULL,
  `expiry_date` varchar(200) NOT NULL,
  `batch_no` varchar(200) NOT NULL,
  `quantity` varchar(200) NOT NULL,
  `note` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `medicine_batch_details`
--

CREATE TABLE `medicine_batch_details` (
  `id` int NOT NULL,
  `supplier_bill_basic_id` varchar(100) NOT NULL,
  `medicine_category_id` varchar(200) NOT NULL,
  `pharmacy_id` int NOT NULL,
  `inward_date` datetime NOT NULL,
  `expiry_date` varchar(100) DEFAULT NULL,
  `expiry_date_format` date NOT NULL,
  `batch_no` varchar(100) NOT NULL,
  `packing_qty` varchar(100) NOT NULL,
  `purchase_rate_packing` varchar(100) NOT NULL,
  `quantity` varchar(200) NOT NULL,
  `mrp` varchar(11) DEFAULT NULL,
  `purchase_price` varchar(200) NOT NULL,
  `sale_rate` varchar(11) DEFAULT NULL,
  `batch_amount` decimal(10,2) NOT NULL,
  `amount` varchar(100) DEFAULT NULL,
  `available_quantity` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `medicine_category`
--

CREATE TABLE `medicine_category` (
  `id` int NOT NULL,
  `medicine_category` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `medicine_dosage`
--

CREATE TABLE `medicine_dosage` (
  `id` int NOT NULL,
  `medicine_category_id` int NOT NULL,
  `dosage_form` varchar(100) NOT NULL,
  `dosage` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int NOT NULL,
  `title` varchar(200) DEFAULT NULL,
  `message` text,
  `send_mail` varchar(10) DEFAULT '0',
  `send_sms` varchar(10) DEFAULT '0',
  `is_group` varchar(10) DEFAULT '0',
  `is_individual` varchar(10) DEFAULT '0',
  `file` varchar(200) NOT NULL,
  `group_list` text,
  `user_list` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `version` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `notification_roles`
--

CREATE TABLE `notification_roles` (
  `id` int NOT NULL,
  `send_notification_id` int DEFAULT NULL,
  `role_id` int DEFAULT NULL,
  `is_active` int DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `notification_setting`
--

CREATE TABLE `notification_setting` (
  `id` int NOT NULL,
  `type` varchar(100) DEFAULT NULL,
  `is_mail` int DEFAULT '0',
  `is_sms` int DEFAULT '0',
  `is_mobileapp` int NOT NULL,
  `is_notification` int NOT NULL,
  `display_notification` int NOT NULL,
  `display_sms` int NOT NULL,
  `template` longtext NOT NULL,
  `subject` text NOT NULL,
  `variables` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `opd_billing`
--

CREATE TABLE `opd_billing` (
  `id` int NOT NULL,
  `patient_id` int NOT NULL,
  `opd_id` int NOT NULL,
  `discount` int NOT NULL,
  `other_charge` varchar(200) NOT NULL,
  `date` date NOT NULL,
  `tax` decimal(15,2) NOT NULL,
  `gross_total` decimal(15,2) NOT NULL,
  `net_amount` decimal(15,2) NOT NULL,
  `total_amount` decimal(15,2) NOT NULL,
  `generated_by` int NOT NULL,
  `status` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `opd_details`
--

CREATE TABLE `opd_details` (
  `id` int NOT NULL,
  `patient_id` int NOT NULL,
  `opd_no` varchar(100) NOT NULL,
  `appointment_date` datetime NOT NULL,
  `case_type` varchar(200) NOT NULL,
  `casualty` varchar(200) NOT NULL,
  `symptoms` text,
  `bp` varchar(200) NOT NULL,
  `height` varchar(100) NOT NULL,
  `weight` varchar(100) NOT NULL,
  `pulse` varchar(200) NOT NULL,
  `temperature` varchar(200) NOT NULL,
  `respiration` varchar(200) NOT NULL,
  `known_allergies` varchar(200) NOT NULL,
  `note_remark` varchar(225) DEFAULT NULL,
  `refference` varchar(100) NOT NULL,
  `cons_doctor` int NOT NULL,
  `amount` decimal(15,2) NOT NULL,
  `tax` decimal(15,2) NOT NULL,
  `payment_mode` varchar(200) NOT NULL,
  `header_note` varchar(200) NOT NULL,
  `footer_note` varchar(200) NOT NULL,
  `generated_by` int NOT NULL,
  `discharged` varchar(200) NOT NULL,
  `live_consult` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `opd_patient_charges`
--

CREATE TABLE `opd_patient_charges` (
  `id` int NOT NULL,
  `date` date NOT NULL,
  `patient_id` int NOT NULL,
  `opd_id` int NOT NULL,
  `charge_id` int NOT NULL,
  `org_charge_id` int NOT NULL,
  `apply_charge` decimal(15,2) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `opd_payment`
--

CREATE TABLE `opd_payment` (
  `id` int NOT NULL,
  `patient_id` int NOT NULL,
  `opd_id` int NOT NULL,
  `paid_amount` decimal(15,2) NOT NULL,
  `balance_amount` decimal(15,2) NOT NULL,
  `total_amount` decimal(15,2) NOT NULL,
  `payment_mode` varchar(100) NOT NULL,
  `note` varchar(200) NOT NULL,
  `date` date NOT NULL,
  `document` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `operation_theatre`
--

CREATE TABLE `operation_theatre` (
  `id` int NOT NULL,
  `bill_no` varchar(200) NOT NULL,
  `patient_id` int NOT NULL,
  `customer_type` varchar(50) DEFAULT NULL,
  `charge_id` varchar(11) DEFAULT NULL,
  `operation_name` varchar(100) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `operation_type` varchar(100) DEFAULT NULL,
  `consultant_doctor` varchar(100) DEFAULT NULL,
  `ass_consultant_1` varchar(50) DEFAULT NULL,
  `ass_consultant_2` varchar(50) DEFAULT NULL,
  `anesthetist` varchar(50) DEFAULT NULL,
  `anaethesia_type` varchar(50) DEFAULT NULL,
  `ot_technician` varchar(100) DEFAULT NULL,
  `ot_assistant` varchar(100) DEFAULT NULL,
  `result` varchar(50) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `height` varchar(200) NOT NULL,
  `pulse` varchar(200) NOT NULL,
  `temperature` varchar(200) NOT NULL,
  `respiration` varchar(200) NOT NULL,
  `weight` varchar(200) NOT NULL,
  `bp` varchar(200) NOT NULL,
  `symptoms` text,
  `apply_charge` decimal(15,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `generated_by` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `organisation`
--

CREATE TABLE `organisation` (
  `id` int NOT NULL,
  `organisation_name` varchar(200) NOT NULL,
  `code` varchar(50) NOT NULL,
  `contact_no` varchar(200) NOT NULL,
  `address` varchar(300) NOT NULL,
  `contact_person_name` varchar(200) NOT NULL,
  `contact_person_phone` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `organisations_charges`
--

CREATE TABLE `organisations_charges` (
  `id` int NOT NULL,
  `org_id` int NOT NULL,
  `charge_type` varchar(50) NOT NULL,
  `charge_id` int NOT NULL,
  `org_charge` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `ot_consultant_register`
--

CREATE TABLE `ot_consultant_register` (
  `id` int NOT NULL,
  `patient_id` int NOT NULL,
  `date` varchar(50) NOT NULL,
  `ins_date` date NOT NULL,
  `ins_time` time NOT NULL,
  `instruction` varchar(200) NOT NULL,
  `cons_doctor` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `pathology`
--

CREATE TABLE `pathology` (
  `id` int NOT NULL,
  `test_name` varchar(100) DEFAULT NULL,
  `short_name` varchar(100) DEFAULT NULL,
  `test_type` varchar(100) DEFAULT NULL,
  `pathology_category_id` varchar(11) NOT NULL,
  `pathology_parameter_id` varchar(100) NOT NULL,
  `unit` varchar(50) NOT NULL,
  `sub_category` varchar(50) NOT NULL,
  `report_days` varchar(50) NOT NULL,
  `method` varchar(50) NOT NULL,
  `charge_id` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `pathology_category`
--

CREATE TABLE `pathology_category` (
  `id` int NOT NULL,
  `category_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `pathology_parameter`
--

CREATE TABLE `pathology_parameter` (
  `id` int NOT NULL,
  `parameter_name` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `test_value` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `reference_range` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `gender` varchar(100) NOT NULL,
  `unit` varchar(100) NOT NULL,
  `description` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `pathology_parameterdetails`
--

CREATE TABLE `pathology_parameterdetails` (
  `id` int NOT NULL,
  `pathology_id` int NOT NULL,
  `parameter_id` int NOT NULL,
  `created_id` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `pathology_report_id` int NOT NULL,
  `pathology_report_value` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pathology_report`
--

CREATE TABLE `pathology_report` (
  `id` int NOT NULL,
  `bill_no` varchar(200) NOT NULL,
  `pathology_id` int NOT NULL,
  `patient_id` varchar(30) DEFAULT NULL,
  `customer_type` varchar(50) DEFAULT NULL,
  `patient_name` varchar(100) DEFAULT NULL,
  `consultant_doctor` varchar(10) NOT NULL,
  `reporting_date` date DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `pathology_report` varchar(255) DEFAULT NULL,
  `apply_charge` decimal(15,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `generated_by` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `pathology_report_parameterdetails`
--

CREATE TABLE `pathology_report_parameterdetails` (
  `id` int NOT NULL,
  `pathology_report_id` int NOT NULL,
  `parameter_id` int NOT NULL,
  `pathology_report_value` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `patients`
--

CREATE TABLE `patients` (
  `id` int NOT NULL,
  `patient_unique_id` int NOT NULL,
  `lang_id` int NOT NULL,
  `admission_date` varchar(100) DEFAULT NULL,
  `patient_name` varchar(100) DEFAULT NULL,
  `age` varchar(10) NOT NULL,
  `month` varchar(200) NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `mobileno` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `gender` varchar(100) DEFAULT NULL,
  `marital_status` varchar(100) NOT NULL,
  `blood_group` varchar(200) NOT NULL,
  `address` text NOT NULL,
  `guardian_name` varchar(100) DEFAULT NULL,
  `guardian_phone` varchar(100) DEFAULT NULL,
  `guardian_address` text,
  `guardian_email` varchar(100) NOT NULL,
  `is_active` varchar(255) DEFAULT 'no',
  `discharged` varchar(100) NOT NULL,
  `patient_type` varchar(200) NOT NULL,
  `credit_limit` varchar(50) DEFAULT NULL,
  `organisation` varchar(100) NOT NULL,
  `known_allergies` varchar(200) NOT NULL,
  `old_patient` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `disable_at` date NOT NULL,
  `note` varchar(200) NOT NULL,
  `is_ipd` varchar(200) NOT NULL,
  `app_key` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `patients`
--

INSERT INTO `patients` (`id`, `patient_unique_id`, `lang_id`, `admission_date`, `patient_name`, `age`, `month`, `image`, `mobileno`, `email`, `dob`, `gender`, `marital_status`, `blood_group`, `address`, `guardian_name`, `guardian_phone`, `guardian_address`, `guardian_email`, `is_active`, `discharged`, `patient_type`, `credit_limit`, `organisation`, `known_allergies`, `old_patient`, `disable_at`, `note`, `is_ipd`, `app_key`) VALUES
(1, 1001, 0, NULL, 'Inder sein', '0', '1', 'uploads/patient_images/no_image.png', '+919874563210', 'indersein@mailinator.com', '2021-06-28', 'Male', 'Single', 'O+', 'Vpo bhagu', 'asdad', NULL, NULL, '', 'yes', 'no', '', NULL, '', 'ada', '', '0000-00-00', 'adasd', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `patient_charges`
--

CREATE TABLE `patient_charges` (
  `id` int NOT NULL,
  `date` varchar(50) DEFAULT NULL,
  `patient_id` int DEFAULT NULL,
  `ipd_id` int NOT NULL,
  `charge_id` int DEFAULT NULL,
  `org_charge_id` int DEFAULT NULL,
  `apply_charge` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `patient_timeline`
--

CREATE TABLE `patient_timeline` (
  `id` int NOT NULL,
  `patient_id` int NOT NULL,
  `title` varchar(200) NOT NULL,
  `timeline_date` date NOT NULL,
  `description` varchar(200) NOT NULL,
  `document` varchar(200) NOT NULL,
  `status` varchar(100) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `id` int NOT NULL,
  `patient_id` int NOT NULL,
  `ipd_id` int NOT NULL,
  `paid_amount` decimal(15,2) NOT NULL,
  `balance_amount` decimal(15,2) NOT NULL,
  `total_amount` decimal(15,2) NOT NULL,
  `payment_mode` varchar(100) NOT NULL,
  `note` varchar(200) NOT NULL,
  `date` date NOT NULL,
  `document` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `payment_settings`
--

CREATE TABLE `payment_settings` (
  `id` int NOT NULL,
  `payment_type` varchar(200) NOT NULL,
  `api_username` varchar(200) DEFAULT NULL,
  `api_secret_key` varchar(200) NOT NULL,
  `salt` varchar(200) NOT NULL,
  `api_publishable_key` varchar(200) NOT NULL,
  `paytm_website` varchar(255) NOT NULL,
  `paytm_industrytype` varchar(255) NOT NULL,
  `api_password` varchar(200) DEFAULT NULL,
  `api_signature` varchar(200) DEFAULT NULL,
  `api_email` varchar(200) DEFAULT NULL,
  `paypal_demo` varchar(100) NOT NULL,
  `account_no` varchar(200) NOT NULL,
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `payment_settings`
--

INSERT INTO `payment_settings` (`id`, `payment_type`, `api_username`, `api_secret_key`, `salt`, `api_publishable_key`, `paytm_website`, `paytm_industrytype`, `api_password`, `api_signature`, `api_email`, `paypal_demo`, `account_no`, `is_active`) VALUES
(1, 'pesapal', NULL, '', '', '', '', '', NULL, NULL, NULL, '', '', 'no'),
(2, 'ipayafrica', NULL, '', '', '', '', '', NULL, NULL, NULL, '', '', 'no'),
(3, 'razorpay', NULL, 'VxawI2eWSo9H0krjCj1jxYQT', '', 'rzp_test_65XcijwZsuxIGr', '', '', NULL, NULL, NULL, '', '', 'yes');

-- --------------------------------------------------------

--
-- Table structure for table `payslip_allowance`
--

CREATE TABLE `payslip_allowance` (
  `id` int NOT NULL,
  `payslip_id` int NOT NULL,
  `allowance_type` varchar(200) NOT NULL,
  `amount` float NOT NULL,
  `staff_id` int NOT NULL,
  `cal_type` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `permission_category`
--

CREATE TABLE `permission_category` (
  `id` int NOT NULL,
  `perm_group_id` int DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `short_code` varchar(100) DEFAULT NULL,
  `enable_view` int DEFAULT '0',
  `enable_add` int DEFAULT '0',
  `enable_edit` int DEFAULT '0',
  `enable_delete` int DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `permission_category`
--

INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`) VALUES
(9, 3, 'Income', 'income', 1, 1, 1, 1),
(10, 3, 'Income Head', 'income_head', 1, 1, 1, 1),
(12, 4, 'Expense', 'expense', 1, 1, 1, 1),
(13, 4, 'Expense Head', 'expense_head', 1, 1, 1, 1),
(27, 8, 'Upload Content', 'upload_content', 1, 1, 0, 1),
(31, 10, 'Issue Item', 'issue_item', 1, 1, 0, 1),
(32, 10, 'Item Stock', 'item_stock', 1, 1, 1, 1),
(33, 10, 'Item', 'item', 1, 1, 1, 1),
(34, 10, 'Store', 'store', 1, 1, 1, 1),
(35, 10, 'Supplier', 'supplier', 1, 1, 1, 1),
(43, 13, 'Notice Board', 'notice_board', 1, 1, 1, 1),
(44, 13, 'Email / SMS', 'email_sms', 1, 0, 0, 0),
(48, 14, 'OPD Report', 'opd_report', 1, 0, 0, 0),
(53, 15, 'Languages', 'languages', 0, 1, 0, 0),
(54, 15, 'General Setting', 'general_setting', 1, 0, 1, 0),
(56, 15, 'Notification Setting', 'notification_setting', 1, 0, 1, 0),
(57, 15, 'SMS Setting', 'sms_setting', 1, 0, 1, 0),
(58, 15, 'Email Setting', 'email_setting', 1, 0, 1, 0),
(59, 15, 'Front CMS Setting', 'front_cms_setting', 1, 0, 1, 0),
(60, 15, 'Payment Methods', 'payment_methods', 1, 0, 1, 0),
(61, 16, 'Menus', 'menus', 1, 1, 0, 1),
(62, 16, 'Media Manager', 'media_manager', 1, 1, 0, 1),
(63, 16, 'Banner Images', 'banner_images', 1, 1, 0, 1),
(64, 16, 'Pages', 'pages', 1, 1, 1, 1),
(65, 16, 'Gallery', 'gallery', 1, 1, 1, 1),
(66, 16, 'Event', 'event', 1, 1, 1, 1),
(67, 16, 'News', 'notice', 1, 1, 1, 1),
(80, 17, 'Visitor Book', 'visitor_book', 1, 1, 1, 1),
(81, 17, 'Phone Call Log', 'phone_call_log', 1, 1, 1, 1),
(82, 17, 'Postal Dispatch', 'postal_dispatch', 1, 1, 1, 1),
(83, 17, 'Postal Receive', 'postal_receive', 1, 1, 1, 1),
(84, 17, 'Complain', 'complain', 1, 1, 1, 1),
(85, 17, 'Setup Front Office', 'setup_front_office', 1, 1, 1, 1),
(86, 18, 'Staff', 'staff', 1, 1, 1, 1),
(87, 18, 'Disable Staff', 'disable_staff', 1, 0, 0, 0),
(88, 18, 'Staff Attendance', 'staff_attendance', 1, 1, 1, 0),
(89, 18, 'Staff Attendance Report', 'staff_attendance_report', 1, 0, 0, 0),
(90, 18, 'Staff Payroll', 'staff_payroll', 1, 1, 0, 1),
(91, 18, 'Payroll Report', 'payroll_report', 1, 0, 0, 0),
(102, 21, 'Calendar To Do List', 'calendar_to_do_list', 1, 1, 1, 1),
(104, 10, 'Item Category', 'item_category', 1, 1, 1, 1),
(108, 18, ' Approve Leave Request', 'approve_leave_request', 1, 1, 1, 1),
(109, 18, 'Apply Leave', 'apply_leave', 1, 1, 0, 1),
(110, 18, 'Leave Types ', 'leave_types', 1, 1, 1, 1),
(111, 18, 'Department', 'department', 1, 1, 1, 1),
(112, 18, 'Designation', 'designation', 1, 1, 1, 1),
(118, 22, 'Staff Role Count Widget', 'staff_role_count_widget', 1, 0, 0, 0),
(126, 15, 'User Status', 'user_status', 1, 0, 0, 0),
(127, 18, 'Can See Other Users Profile', 'can_see_other_users_profile', 1, 0, 0, 0),
(129, 18, 'Staff Timeline', 'staff_timeline', 0, 1, 0, 1),
(130, 15, 'Backup', 'backup', 1, 1, 0, 1),
(131, 15, 'Restore', 'restore', 1, 0, 0, 0),
(132, 23, 'OPD Patient', 'opd_patient', 1, 1, 1, 1),
(134, 23, 'Prescription', 'prescription', 1, 1, 1, 1),
(135, 23, 'Revisit', 'revisit', 1, 1, 1, 1),
(136, 23, 'OPD Diagnosis', 'opd diagnosis', 1, 1, 1, 1),
(137, 23, 'OPD Timeline', 'opd timeline', 1, 1, 1, 1),
(138, 24, 'IPD Patients', 'ipd_patient', 1, 1, 1, 1),
(139, 24, 'Discharged Patients', 'discharged patients', 1, 1, 1, 1),
(140, 24, 'Consultant Register', 'consultant register', 1, 1, 1, 1),
(141, 24, 'IPD Diagnosis', 'ipd diagnosis', 1, 1, 1, 1),
(142, 24, 'IPD Timeline', 'ipd timeline', 1, 1, 1, 1),
(143, 24, 'Charges', 'charges', 1, 1, 1, 1),
(144, 24, 'Payment', 'payment', 1, 1, 1, 1),
(145, 24, 'Bill', 'bill', 1, 1, 1, 1),
(146, 25, 'Medicine', 'medicine', 1, 1, 1, 1),
(147, 25, 'Add Medicine Stock', 'add_medicine_stock', 1, 1, 1, 1),
(148, 25, 'Pharmacy Bill', 'pharmacy bill', 1, 1, 1, 1),
(149, 26, 'Pathology Test', 'pathology test', 1, 1, 1, 1),
(150, 26, 'Add Patient & Test Report', 'add_patho_patient_test_report', 1, 1, 1, 1),
(152, 27, 'Radiology Test', 'radiology test', 1, 1, 1, 1),
(153, 27, 'Add Patient & Test Report', 'add_radio_patient_test_report', 1, 1, 1, 1),
(155, 22, 'IPD Income Widget', 'ipd_income_widget', 1, 0, 0, 0),
(156, 22, 'OPD Income Widget', 'opd_income_widget', 1, 0, 0, 0),
(157, 22, 'Pharmacy Income Widget', 'pharmacy_income_widget', 1, 0, 0, 0),
(158, 22, 'Pathology Income Widget', 'pathology_income_widget', 1, 0, 0, 0),
(159, 22, 'Radiology Income Widget', 'radiology_income_widget', 1, 0, 0, 0),
(160, 22, 'OT Income Widget', 'ot_income_widget', 1, 0, 0, 0),
(161, 22, 'Blood Bank Income Widget', 'blood_bank_income_widget', 1, 0, 0, 0),
(162, 22, 'Ambulance Income Widget', 'ambulance_income_widget', 1, 0, 0, 0),
(163, 28, 'OT Patient', 'ot_patient', 1, 1, 1, 1),
(164, 28, 'OT Consultant Instruction', 'ot_consultant_instruction', 1, 1, 1, 1),
(165, 29, 'Ambulance Call', 'ambulance_call', 1, 1, 1, 1),
(166, 29, 'Ambulance', 'ambulance', 1, 1, 1, 1),
(167, 30, 'Blood Bank Status', 'blood_bank_status', 1, 1, 1, 1),
(168, 30, 'Blood Issue', 'blood_issue', 1, 1, 1, 1),
(169, 30, 'Blood Donor', 'blood_donor', 1, 1, 1, 1),
(170, 25, 'Medicine Category', 'medicine_category', 1, 1, 1, 1),
(171, 27, 'Radiology Category', 'radiology category', 1, 1, 1, 1),
(173, 31, 'Organisation', 'organisation', 1, 1, 1, 1),
(174, 31, 'Charges', 'tpa_charges', 1, 1, 1, 1),
(175, 26, 'Pathology Category', 'pathology_category', 1, 1, 1, 1),
(176, 32, 'Charges', 'hospital_charges', 1, 1, 1, 1),
(178, 14, 'IPD Report', 'ipd_report', 1, 0, 0, 0),
(179, 14, 'Pharmacy Bill Report', 'pharmacy_bill_report', 1, 0, 0, 0),
(180, 14, 'Pathology Patient Report', 'pathology_patient_report', 1, 0, 0, 0),
(181, 14, 'Radiology Patient Report', 'radiology_patient_report', 1, 0, 0, 0),
(182, 14, 'OT Report', 'ot_report', 1, 0, 0, 0),
(183, 14, 'Blood Donor Report', 'blood_donor_report', 1, 0, 0, 0),
(184, 14, 'Payroll Month Report', 'payroll_month_report', 1, 0, 0, 0),
(185, 14, 'Payroll Report', 'payroll_report', 1, 0, 0, 0),
(186, 14, 'Staff Attendance Report', 'staff_attendance_report', 1, 0, 0, 0),
(187, 14, 'User Log', 'user_log', 1, 0, 0, 0),
(188, 14, 'Patient Login Credential', 'patient_login_credential', 1, 0, 0, 0),
(189, 14, 'Email / SMS Log', 'email_sms_log', 1, 0, 0, 0),
(190, 22, 'Yearly Income & Expense Chart', 'yearly_income_expense_chart', 1, 0, 0, 0),
(191, 22, 'Monthly Income & Expense Chart', 'monthly_income_expense_chart', 1, 0, 0, 0),
(192, 23, 'OPD Prescription Print Header Footer ', 'opd_prescription_print_header_footer', 1, 1, 1, 1),
(193, 24, 'Revert Generated Bill', 'revert_generated_bill', 1, 0, 0, 0),
(194, 24, 'Calculate Bill', 'calculate_bill', 1, 0, 0, 0),
(195, 24, 'Generate Bill & Discharge Patient', 'generate_bill_discharge_patient', 1, 0, 0, 0),
(196, 24, 'Bed', 'bed', 1, 1, 1, 1),
(197, 24, 'IPD Prescription Print Header Footer', 'ipd_prescription_print_header_footer', 1, 1, 1, 1),
(198, 24, 'Bed Status', 'bed_status', 1, 0, 0, 0),
(200, 25, 'Medicine Bad Stock', 'medicine_bad_stock', 1, 1, 0, 1),
(201, 25, 'Pharmacy Bill print Header Footer', 'pharmacy_bill_print_header_footer', 1, 1, 1, 1),
(202, 30, 'Donate Blood', 'donate_blood', 1, 1, 0, 1),
(203, 32, 'Charge Category', 'charge_category', 1, 1, 1, 1),
(204, 17, 'Appointment', 'appointment', 1, 1, 1, 1),
(205, 17, 'Appointment Approve', 'appointment_approve', 1, 0, 0, 0),
(206, 14, 'TPA Report', 'tpa_report', 1, 0, 0, 0),
(207, 14, 'Ambulance Report', 'ambulance_report', 1, 0, 0, 0),
(208, 14, 'Discharge Patient Report', 'discharge_patient_report', 1, 0, 0, 0),
(209, 14, 'Appointment Report', 'appointment_report', 1, 0, 0, 0),
(210, 14, 'Transaction Report', 'transaction_report', 1, 0, 0, 0),
(211, 14, 'Blood Issue Report', 'blood_issue_report', 1, 0, 0, 0),
(212, 14, 'Income Report', 'income_report', 1, 0, 0, 0),
(213, 14, 'Expense Report', 'expense_report', 1, 0, 0, 0),
(214, 34, 'Birth Record', 'birth_record', 1, 1, 1, 1),
(215, 34, 'Death Record', 'death_record', 1, 1, 1, 1),
(216, 17, 'Move Patient in OPD', 'move_patient_in_opd', 1, 0, 0, 0),
(217, 17, 'Move Patient in IPD', 'move_patient_in_ipd', 1, 0, 0, 0),
(218, 23, 'Move Patient in IPD', 'opd_move _patient_in_ipd', 1, 0, 0, 0),
(219, 23, 'Manual Prescription', 'manual_prescription', 1, 0, 0, 0),
(220, 24, 'Prescription ', 'ipd_prescription', 1, 1, 1, 1),
(221, 23, 'Charges', 'opd_charges', 1, 1, 1, 1),
(222, 23, 'Payment', 'opd_payment', 1, 1, 1, 1),
(223, 23, 'Bill', 'opd_bill', 1, 1, 1, 1),
(224, 25, 'Import Medicine', 'import_medicine', 1, 0, 0, 0),
(225, 25, 'Medicine Purchase', 'medicine_purchase', 1, 1, 1, 1),
(226, 25, 'Medicine Supplier', 'medicine_supplier', 1, 1, 1, 1),
(227, 25, 'Medicine Dosage', 'medicine_dosage', 1, 1, 1, 1),
(228, 32, 'Doctor OPD Charges', 'doctor_opd_charges', 1, 1, 1, 1),
(236, 36, 'Patient', 'patient', 1, 1, 1, 1),
(237, 36, 'Enabled/Disabled', 'enabled_disabled', 1, 0, 0, 0),
(238, 22, 'Notification Center', 'notification_center', 1, 0, 0, 0),
(239, 36, 'Import', 'patient_import', 1, 0, 0, 0),
(240, 34, 'Birth Print Header Footer', 'birth_print_header_footer', 1, 1, 1, 1),
(241, 34, 'Custom Fields', 'birth_death_customfields', 1, 1, 1, 1),
(242, 34, 'Death Print Header Footer', 'death_print_header_footer', 1, 1, 1, 1),
(243, 26, 'Print Header Footer', 'pathology_print_header_footer', 1, 1, 1, 1),
(244, 27, 'Print Header Footer', 'radiology_print_header_footer', 1, 1, 1, 1),
(245, 28, 'Print Header Footer', 'ot_print_header_footer', 1, 1, 1, 1),
(246, 30, 'Print Header Footer', 'bloodbank_print_header_footer', 1, 1, 1, 1),
(247, 29, 'Print Header Footer', 'ambulance_print_header_footer', 1, 1, 1, 1),
(248, 24, 'IPD Bill Print Header Footer', 'ipd_bill_print_header_footer', 1, 1, 1, 1),
(249, 18, 'Print Payslip Header Footer', 'print_payslip_header_footer', 1, 1, 1, 1),
(250, 14, 'Income Group Report', 'income_group_report', 1, 0, 0, 0),
(251, 14, 'Expense Group Report', 'expense_group_report', 1, 0, 0, 0),
(253, 14, 'Inventory Stock Report', 'inventory_stock_report', 1, 0, 0, 0),
(254, 14, 'Inventory Item Report', 'add_item_report', 1, 0, 0, 0),
(255, 14, 'Inventory Issue Report', 'issue_inventory_report', 1, 0, 0, 0),
(256, 14, 'Expiry Medicine Report', 'expiry_medicine_report', 1, 0, 0, 0),
(257, 26, 'Pathology Bill', 'pathology bill', 1, 1, 1, 1),
(258, 14, 'Birth Report', 'birth_report', 1, 0, 0, 0),
(259, 14, 'Death Report', 'death_report', 1, 0, 0, 0),
(260, 26, 'Pathology Unit', 'pathology_unit', 1, 1, 1, 1),
(261, 27, 'Radiology Unit', 'radiology_unit', 1, 1, 1, 1),
(262, 27, 'Radiology Parameter', 'radiology_parameter', 1, 1, 1, 1),
(263, 26, 'Pathology Parameter', 'pathology_parameter', 1, 1, 1, 1),
(264, 32, 'Charge Type', 'charge_type', 1, 1, 0, 1),
(265, 14, 'OPD Balance Report', 'opd_balance_report', 1, 0, 0, 0),
(266, 14, 'IPD Balance Report', 'ipd_balance_report', 1, 0, 0, 0),
(267, 36, 'Symptoms Type', 'symptoms_type', 1, 1, 1, 1),
(268, 24, 'Discharged Summary', 'discharged_summary', 0, 0, 1, 0),
(269, 37, 'Live Consultation', 'live_consultation', 1, 1, 0, 1),
(270, 37, 'Live Meeting', 'live_meeting', 1, 1, 0, 1),
(271, 37, 'Live Consultation Report', 'live_consultation_report', 1, 0, 0, 0),
(272, 37, 'Live Meeting Report', 'live_meeting_report', 1, 0, 0, 0),
(273, 37, 'Setting', 'setting', 1, 0, 1, 0),
(274, 15, 'Language Switcher', 'language_switcher', 1, 0, 0, 0),
(275, 26, 'Pathology Print Bill', 'pathology_print_bill', 1, 0, 0, 0),
(276, 27, 'Radiology Print Bill', 'radiology_print_bill', 1, 0, 0, 0),
(277, 26, 'Pathology Print Report', 'pathology_print_report', 1, 0, 0, 0),
(278, 27, 'Radiology Print Report', 'radiology_print_report', 1, 0, 0, 0),
(279, 36, 'Symptoms Head', 'symptoms_head', 1, 1, 1, 1),
(280, 18, 'Specialist', 'specialist', 1, 1, 1, 1),
(281, 22, 'General Income Widget', 'general_income_widget', 1, 0, 0, 0),
(282, 22, 'Expenses Widget', 'expenses_widget', 1, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `permission_group`
--

CREATE TABLE `permission_group` (
  `id` int NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `short_code` varchar(100) NOT NULL,
  `is_active` int DEFAULT '0',
  `system` int NOT NULL,
  `sort_order` decimal(10,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `permission_group`
--

INSERT INTO `permission_group` (`id`, `name`, `short_code`, `is_active`, `system`, `sort_order`) VALUES
(3, 'Income', 'income', 1, 0, '9.00'),
(4, 'Expense', 'expense', 1, 0, '10.00'),
(8, 'Download Center', 'download_center', 1, 0, '15.00'),
(10, 'Inventory', 'inventory', 1, 0, '16.00'),
(13, 'Messaging', 'communicate', 1, 0, '14.00'),
(14, 'Reports', 'reports', 1, 1, '19.00'),
(15, 'System Settings', 'system_settings', 1, 1, '18.00'),
(16, 'Front CMS', 'front_cms', 1, 0, '17.00'),
(17, 'Front Office', 'front_office', 1, 0, '12.00'),
(18, 'Human Resource', 'human_resource', 1, 1, '13.00'),
(21, 'Calendar To Do List', 'calendar_to_do_list', 1, 0, '22.00'),
(22, 'Dashboard and Widgets', 'dashboard_and_widgets', 1, 1, '20.00'),
(23, 'OPD', 'OPD', 1, 0, '1.00'),
(24, 'IPD', 'IPD', 1, 0, '2.00'),
(25, 'Pharmacy', 'pharmacy', 1, 0, '3.00'),
(26, 'Pathology', 'pathology', 1, 0, '4.00'),
(27, 'Radiology', 'radiology', 1, 0, '5.00'),
(28, 'Operation Theatre', 'operation_theatre', 1, 0, '6.00'),
(29, 'Ambulance', 'ambulance', 1, 0, '11.00'),
(30, 'Blood Bank', 'blood_bank', 1, 0, '7.00'),
(31, 'TPA Management', 'tpa_management', 1, 0, '8.00'),
(32, 'Hospital Charges', 'hospital_charges', 1, 1, '10.10'),
(34, 'Birth Death Record', 'birth_death_report', 1, 0, '12.00'),
(36, 'Patient', 'patient', 1, 0, '21.00'),
(37, 'Zoom Live Consultation', 'zoom_live_meeting', 1, 0, '7.01');

-- --------------------------------------------------------

--
-- Table structure for table `pharmacy`
--

CREATE TABLE `pharmacy` (
  `id` int NOT NULL,
  `medicine_name` varchar(200) DEFAULT NULL,
  `medicine_category_id` varchar(50) NOT NULL,
  `medicine_image` varchar(200) NOT NULL,
  `medicine_company` varchar(100) DEFAULT NULL,
  `medicine_composition` varchar(100) DEFAULT NULL,
  `medicine_group` varchar(100) DEFAULT NULL,
  `unit` varchar(50) DEFAULT NULL,
  `min_level` varchar(50) DEFAULT NULL,
  `reorder_level` varchar(50) DEFAULT NULL,
  `vat` varchar(50) DEFAULT NULL,
  `unit_packing` varchar(50) DEFAULT NULL,
  `supplier` varchar(50) DEFAULT NULL,
  `vat_ac` varchar(50) DEFAULT NULL,
  `note` varchar(200) NOT NULL,
  `is_active` varchar(200) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `pharmacy_bill_basic`
--

CREATE TABLE `pharmacy_bill_basic` (
  `id` int NOT NULL,
  `bill_no` varchar(50) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `patient_id` varchar(200) NOT NULL,
  `customer_name` varchar(50) DEFAULT NULL,
  `customer_type` varchar(50) DEFAULT NULL,
  `doctor_name` varchar(50) DEFAULT NULL,
  `file` varchar(200) NOT NULL,
  `opd_ipd_no` varchar(50) DEFAULT NULL,
  `total` decimal(15,2) DEFAULT NULL,
  `discount` decimal(15,2) NOT NULL,
  `tax` decimal(15,2) NOT NULL,
  `net_amount` decimal(15,2) NOT NULL,
  `note` varchar(200) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `generated_by` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `pharmacy_bill_detail`
--

CREATE TABLE `pharmacy_bill_detail` (
  `id` int NOT NULL,
  `pharmacy_bill_basic_id` varchar(50) NOT NULL,
  `medicine_category_id` int NOT NULL,
  `medicine_name` varchar(200) NOT NULL,
  `expire_date` varchar(100) NOT NULL,
  `batch_no` varchar(200) NOT NULL,
  `quantity` varchar(100) NOT NULL,
  `sale_price` decimal(15,2) NOT NULL,
  `amount` decimal(15,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `prescription`
--

CREATE TABLE `prescription` (
  `id` int NOT NULL,
  `opd_id` int NOT NULL,
  `visit_id` int NOT NULL,
  `medicine_category_id` int NOT NULL,
  `medicine` varchar(200) NOT NULL,
  `dosage` varchar(200) NOT NULL,
  `instruction` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `print_setting`
--

CREATE TABLE `print_setting` (
  `id` int NOT NULL,
  `print_header` varchar(300) NOT NULL,
  `print_footer` varchar(200) NOT NULL,
  `setting_for` varchar(200) NOT NULL,
  `is_active` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `radio`
--

CREATE TABLE `radio` (
  `id` int NOT NULL,
  `test_name` varchar(100) DEFAULT NULL,
  `short_name` varchar(100) DEFAULT NULL,
  `test_type` varchar(100) DEFAULT NULL,
  `radiology_category_id` varchar(11) NOT NULL,
  `radiology_parameter_id` varchar(100) NOT NULL,
  `sub_category` varchar(50) NOT NULL,
  `report_days` varchar(50) NOT NULL,
  `charge_id` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `radiology_parameter`
--

CREATE TABLE `radiology_parameter` (
  `id` int NOT NULL,
  `parameter_name` varchar(100) NOT NULL,
  `test_value` varchar(100) NOT NULL,
  `reference_range` varchar(100) NOT NULL,
  `gender` varchar(100) NOT NULL,
  `unit` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `radiology_parameterdetails`
--

CREATE TABLE `radiology_parameterdetails` (
  `id` int NOT NULL,
  `radiology_id` varchar(100) NOT NULL,
  `parameter_id` varchar(100) NOT NULL,
  `created_id` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `radiology_report_id` int NOT NULL,
  `radiology_report_value` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `radiology_report`
--

CREATE TABLE `radiology_report` (
  `id` int NOT NULL,
  `bill_no` varchar(200) NOT NULL,
  `radiology_id` int NOT NULL,
  `patient_id` varchar(11) DEFAULT NULL,
  `customer_type` varchar(50) DEFAULT NULL,
  `patient_name` varchar(100) DEFAULT NULL,
  `consultant_doctor` varchar(10) NOT NULL,
  `reporting_date` date DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `radiology_report` varchar(255) DEFAULT NULL,
  `apply_charge` decimal(15,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `generated_by` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `radiology_report_parameterdetails`
--

CREATE TABLE `radiology_report_parameterdetails` (
  `id` int NOT NULL,
  `radiology_report_id` int NOT NULL,
  `parameter_id` int NOT NULL,
  `radiology_report_value` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `read_notification`
--

CREATE TABLE `read_notification` (
  `id` int NOT NULL,
  `student_id` int DEFAULT NULL,
  `parent_id` int DEFAULT NULL,
  `staff_id` int DEFAULT NULL,
  `notification_id` int DEFAULT NULL,
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `read_systemnotification`
--

CREATE TABLE `read_systemnotification` (
  `id` int NOT NULL,
  `notification_id` int NOT NULL,
  `receiver_id` int NOT NULL,
  `is_active` varchar(200) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `slug` varchar(150) DEFAULT NULL,
  `is_active` int DEFAULT '0',
  `is_system` int NOT NULL DEFAULT '0',
  `is_superadmin` int NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `slug`, `is_active`, `is_system`, `is_superadmin`) VALUES
(1, 'Admin', NULL, 0, 1, 0),
(2, 'Accountant', NULL, 0, 1, 0),
(3, 'Doctor', NULL, 0, 1, 0),
(4, 'Pharmacist', NULL, 0, 1, 0),
(5, 'Pathologist', NULL, 0, 1, 0),
(6, 'Radiologist', NULL, 0, 1, 0),
(7, 'Super Admin', NULL, 0, 1, 1),
(8, 'Receptionist', NULL, 0, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `roles_permissions`
--

CREATE TABLE `roles_permissions` (
  `id` int NOT NULL,
  `role_id` int DEFAULT NULL,
  `perm_cat_id` int DEFAULT NULL,
  `can_view` int DEFAULT NULL,
  `can_add` int DEFAULT NULL,
  `can_edit` int DEFAULT NULL,
  `can_delete` int DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `roles_permissions`
--

INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`) VALUES
(1, 1, 132, 1, 1, 1, 1),
(3, 1, 134, 1, 1, 1, 1),
(4, 1, 135, 1, 1, 1, 1),
(5, 1, 136, 1, 1, 1, 1),
(6, 1, 137, 1, 1, 1, 1),
(7, 1, 192, 1, 1, 1, 1),
(8, 1, 138, 1, 1, 1, 1),
(9, 1, 139, 1, 1, 1, 1),
(10, 1, 140, 1, 1, 1, 1),
(11, 1, 141, 1, 1, 1, 1),
(12, 1, 142, 1, 1, 1, 1),
(13, 1, 143, 1, 1, 1, 1),
(14, 1, 144, 1, 1, 1, 1),
(15, 1, 145, 1, 1, 1, 1),
(16, 1, 193, 1, 0, 0, 0),
(17, 1, 194, 1, 0, 0, 0),
(18, 1, 195, 1, 0, 0, 0),
(19, 1, 196, 1, 1, 1, 1),
(20, 1, 197, 1, 1, 1, 1),
(21, 1, 198, 1, 0, 0, 0),
(22, 1, 146, 1, 1, 1, 1),
(23, 1, 147, 1, 1, 1, 1),
(24, 1, 148, 1, 1, 1, 1),
(25, 1, 170, 1, 1, 1, 1),
(26, 1, 200, 1, 1, 0, 1),
(27, 1, 201, 1, 1, 1, 1),
(28, 1, 149, 1, 1, 1, 1),
(29, 1, 150, 1, 1, 1, 1),
(30, 1, 175, 1, 1, 1, 1),
(31, 1, 152, 1, 1, 1, 1),
(32, 1, 153, 1, 1, 1, 1),
(33, 1, 171, 1, 1, 1, 1),
(34, 1, 163, 1, 1, 1, 1),
(35, 1, 164, 1, 1, 1, 1),
(36, 1, 167, 1, 1, 1, 1),
(37, 1, 168, 1, 1, 1, 1),
(38, 1, 169, 1, 1, 1, 1),
(39, 1, 202, 1, 1, 0, 1),
(40, 1, 173, 1, 1, 1, 1),
(41, 1, 174, 1, 1, 1, 1),
(42, 1, 9, 1, 1, 1, 1),
(43, 1, 10, 1, 1, 1, 1),
(45, 1, 176, 1, 1, 1, 1),
(46, 1, 203, 1, 1, 1, 1),
(47, 1, 12, 1, 1, 1, 1),
(48, 1, 13, 1, 1, 1, 1),
(49, 1, 14, 1, 0, 0, 0),
(50, 1, 165, 1, 1, 1, 1),
(51, 1, 166, 1, 1, 1, 1),
(52, 1, 80, 1, 1, 1, 1),
(53, 1, 81, 1, 1, 1, 1),
(54, 1, 82, 1, 1, 1, 1),
(55, 1, 83, 1, 1, 1, 1),
(56, 1, 84, 1, 1, 1, 1),
(57, 1, 85, 1, 1, 1, 1),
(58, 1, 204, 1, 1, 1, 1),
(59, 1, 205, 1, 0, 0, 0),
(60, 1, 86, 1, 1, 1, 1),
(61, 1, 87, 1, 0, 0, 0),
(63, 1, 89, 1, 0, 0, 0),
(64, 1, 90, 1, 1, 0, 1),
(65, 1, 91, 1, 0, 0, 0),
(66, 1, 108, 1, 1, 1, 1),
(67, 1, 109, 1, 1, 0, 1),
(68, 1, 110, 1, 1, 1, 1),
(69, 1, 111, 1, 1, 1, 1),
(70, 1, 112, 1, 1, 1, 1),
(72, 1, 129, 0, 1, 0, 1),
(73, 1, 43, 1, 1, 1, 1),
(74, 1, 44, 1, 0, 0, 0),
(75, 1, 46, 1, 0, 0, 0),
(76, 1, 27, 1, 1, 0, 1),
(77, 1, 31, 1, 1, 0, 1),
(78, 1, 32, 1, 1, 1, 1),
(79, 1, 33, 1, 1, 1, 1),
(80, 1, 34, 1, 1, 1, 1),
(81, 1, 35, 1, 1, 1, 1),
(82, 1, 104, 1, 1, 1, 1),
(83, 1, 61, 1, 1, 0, 1),
(85, 1, 63, 1, 1, 0, 1),
(86, 1, 64, 1, 1, 1, 1),
(87, 1, 65, 1, 1, 1, 1),
(88, 1, 66, 1, 1, 1, 1),
(89, 1, 67, 1, 1, 1, 1),
(90, 1, 53, 0, 1, 0, 0),
(91, 1, 54, 1, 0, 1, 0),
(92, 1, 56, 1, 0, 1, 0),
(93, 1, 57, 1, 0, 1, 0),
(94, 1, 58, 1, 0, 1, 0),
(95, 1, 59, 1, 0, 1, 0),
(96, 1, 60, 1, 0, 1, 0),
(97, 1, 126, 1, 0, 0, 0),
(98, 1, 130, 1, 1, 0, 1),
(99, 1, 131, 1, 0, 0, 0),
(100, 1, 48, 1, 0, 0, 0),
(101, 1, 178, 1, 0, 0, 0),
(102, 1, 179, 1, 0, 0, 0),
(103, 1, 180, 1, 0, 0, 0),
(104, 1, 181, 1, 0, 0, 0),
(105, 1, 182, 1, 0, 0, 0),
(106, 1, 183, 1, 0, 0, 0),
(107, 1, 184, 1, 0, 0, 0),
(108, 1, 185, 1, 0, 0, 0),
(109, 1, 186, 1, 0, 0, 0),
(110, 1, 187, 1, 0, 0, 0),
(111, 1, 188, 1, 0, 0, 0),
(112, 1, 189, 1, 0, 0, 0),
(113, 1, 206, 1, 0, 0, 0),
(114, 1, 207, 1, 0, 0, 0),
(115, 1, 208, 1, 0, 0, 0),
(116, 1, 209, 1, 0, 0, 0),
(117, 1, 210, 1, 0, 0, 0),
(118, 1, 211, 1, 0, 0, 0),
(119, 1, 212, 1, 0, 0, 0),
(120, 1, 213, 1, 0, 0, 0),
(121, 1, 118, 1, 0, 0, 0),
(122, 1, 155, 1, 0, 0, 0),
(123, 1, 156, 1, 0, 0, 0),
(124, 1, 157, 1, 0, 0, 0),
(125, 1, 158, 1, 0, 0, 0),
(126, 1, 159, 1, 0, 0, 0),
(127, 1, 160, 1, 0, 0, 0),
(128, 1, 161, 1, 0, 0, 0),
(129, 1, 162, 1, 0, 0, 0),
(130, 1, 190, 1, 0, 0, 0),
(131, 1, 191, 1, 0, 0, 0),
(132, 1, 102, 1, 1, 1, 1),
(133, 2, 132, 1, 1, 1, 0),
(134, 2, 135, 1, 1, 1, 0),
(135, 2, 138, 1, 1, 1, 0),
(136, 2, 139, 1, 1, 1, 0),
(137, 2, 143, 1, 1, 1, 1),
(138, 2, 144, 1, 1, 1, 1),
(139, 2, 145, 1, 1, 1, 1),
(140, 2, 193, 1, 0, 0, 0),
(141, 2, 194, 1, 0, 0, 0),
(142, 2, 195, 1, 0, 0, 0),
(143, 2, 196, 1, 1, 1, 1),
(144, 2, 198, 1, 0, 0, 0),
(145, 2, 148, 1, 0, 0, 0),
(146, 2, 149, 1, 0, 0, 0),
(147, 2, 150, 1, 0, 0, 0),
(148, 2, 152, 1, 0, 0, 0),
(149, 2, 153, 1, 0, 0, 0),
(150, 2, 163, 1, 1, 1, 0),
(151, 2, 167, 1, 0, 0, 0),
(152, 2, 168, 1, 0, 0, 0),
(153, 2, 173, 1, 1, 1, 1),
(154, 2, 174, 1, 1, 1, 1),
(155, 2, 9, 1, 1, 1, 1),
(156, 2, 10, 1, 1, 1, 1),
(158, 2, 176, 1, 1, 1, 1),
(159, 2, 203, 1, 1, 1, 1),
(160, 2, 12, 1, 1, 1, 1),
(161, 2, 13, 1, 1, 1, 1),
(162, 2, 14, 1, 0, 0, 0),
(163, 2, 165, 1, 1, 1, 0),
(164, 2, 166, 1, 0, 0, 0),
(165, 2, 204, 1, 1, 1, 1),
(166, 2, 205, 1, 0, 0, 0),
(167, 2, 86, 1, 1, 1, 1),
(168, 2, 87, 1, 0, 0, 0),
(169, 2, 88, 1, 1, 1, 0),
(170, 2, 89, 1, 0, 0, 0),
(171, 2, 90, 1, 1, 0, 1),
(172, 2, 91, 1, 0, 0, 0),
(173, 2, 108, 1, 1, 1, 1),
(174, 2, 109, 1, 1, 0, 1),
(175, 2, 110, 1, 1, 1, 1),
(176, 2, 111, 1, 1, 1, 1),
(177, 2, 112, 1, 1, 1, 1),
(178, 2, 127, 1, 0, 0, 0),
(179, 2, 129, 0, 1, 0, 1),
(180, 2, 43, 1, 1, 1, 1),
(181, 2, 44, 1, 0, 0, 0),
(182, 2, 46, 1, 0, 0, 0),
(183, 2, 27, 1, 1, 0, 1),
(184, 2, 31, 1, 1, 0, 1),
(185, 2, 32, 1, 1, 1, 1),
(186, 2, 33, 1, 1, 1, 1),
(187, 2, 34, 1, 1, 1, 1),
(188, 2, 35, 1, 1, 1, 1),
(189, 2, 104, 1, 1, 1, 1),
(190, 2, 48, 1, 0, 0, 0),
(191, 2, 178, 1, 0, 0, 0),
(192, 2, 179, 1, 0, 0, 0),
(193, 2, 180, 1, 0, 0, 0),
(194, 2, 181, 1, 0, 0, 0),
(195, 2, 182, 1, 0, 0, 0),
(196, 2, 184, 1, 0, 0, 0),
(197, 2, 185, 1, 0, 0, 0),
(198, 2, 186, 1, 0, 0, 0),
(199, 2, 188, 1, 0, 0, 0),
(200, 2, 189, 1, 0, 0, 0),
(201, 2, 206, 1, 0, 0, 0),
(202, 2, 207, 1, 0, 0, 0),
(203, 2, 208, 1, 0, 0, 0),
(204, 2, 209, 1, 0, 0, 0),
(205, 2, 210, 1, 0, 0, 0),
(206, 2, 211, 1, 0, 0, 0),
(207, 2, 212, 1, 0, 0, 0),
(208, 2, 213, 1, 0, 0, 0),
(209, 2, 118, 1, 0, 0, 0),
(210, 2, 155, 1, 0, 0, 0),
(211, 2, 156, 1, 0, 0, 0),
(212, 2, 157, 1, 0, 0, 0),
(213, 2, 158, 1, 0, 0, 0),
(214, 2, 159, 1, 0, 0, 0),
(215, 2, 160, 1, 0, 0, 0),
(216, 2, 161, 1, 0, 0, 0),
(217, 2, 162, 1, 0, 0, 0),
(218, 2, 190, 1, 0, 0, 0),
(219, 2, 191, 1, 0, 0, 0),
(220, 2, 102, 1, 1, 1, 1),
(221, 3, 132, 1, 1, 1, 1),
(222, 3, 134, 1, 1, 1, 1),
(223, 3, 135, 1, 1, 1, 1),
(224, 3, 136, 1, 1, 1, 1),
(225, 3, 137, 1, 1, 1, 1),
(226, 3, 138, 1, 1, 1, 1),
(227, 3, 139, 1, 1, 1, 1),
(228, 3, 140, 1, 1, 1, 1),
(229, 3, 141, 1, 1, 1, 1),
(230, 3, 142, 1, 1, 1, 1),
(231, 3, 143, 1, 1, 1, 1),
(232, 3, 144, 1, 1, 1, 1),
(233, 3, 145, 1, 1, 1, 1),
(234, 3, 194, 1, 0, 0, 0),
(235, 3, 198, 1, 0, 0, 0),
(236, 3, 163, 1, 1, 1, 1),
(237, 3, 164, 1, 1, 1, 1),
(238, 3, 167, 1, 0, 0, 0),
(239, 3, 166, 1, 0, 0, 0),
(240, 3, 204, 1, 1, 1, 1),
(241, 3, 205, 1, 0, 0, 0),
(242, 3, 86, 1, 0, 0, 0),
(243, 3, 109, 1, 1, 0, 1),
(244, 3, 127, 1, 0, 0, 0),
(245, 3, 43, 1, 1, 1, 1),
(246, 3, 44, 1, 0, 0, 0),
(248, 3, 27, 1, 1, 0, 1),
(249, 3, 48, 1, 0, 0, 0),
(250, 3, 178, 1, 0, 0, 0),
(251, 3, 182, 1, 0, 0, 0),
(253, 3, 208, 1, 0, 0, 0),
(254, 3, 209, 1, 0, 0, 0),
(255, 3, 118, 1, 0, 0, 0),
(256, 3, 155, 1, 0, 0, 0),
(257, 3, 156, 1, 0, 0, 0),
(262, 3, 102, 1, 1, 1, 1),
(277, 5, 149, 1, 1, 1, 1),
(278, 5, 150, 1, 1, 1, 1),
(279, 5, 175, 1, 1, 1, 1),
(280, 5, 86, 1, 0, 0, 0),
(281, 5, 109, 1, 1, 0, 1),
(282, 5, 43, 1, 1, 1, 1),
(283, 5, 44, 1, 0, 0, 0),
(285, 5, 27, 1, 1, 0, 1),
(286, 5, 180, 1, 0, 0, 0),
(288, 5, 158, 1, 0, 0, 0),
(289, 5, 102, 1, 1, 1, 1),
(290, 6, 152, 1, 1, 1, 1),
(291, 6, 153, 1, 1, 1, 1),
(292, 6, 171, 1, 1, 1, 1),
(293, 6, 86, 1, 0, 0, 0),
(294, 6, 109, 1, 1, 0, 1),
(295, 6, 181, 1, 0, 0, 0),
(297, 6, 118, 1, 0, 0, 0),
(298, 6, 159, 1, 0, 0, 0),
(299, 6, 102, 1, 1, 1, 1),
(300, 8, 132, 1, 1, 1, 1),
(306, 8, 81, 1, 1, 1, 1),
(492, 8, 236, 1, 1, 1, 0),
(493, 8, 146, 1, 0, 0, 0),
(495, 8, 138, 1, 1, 1, 1),
(496, 8, 139, 1, 1, 1, 1),
(500, 8, 143, 1, 0, 0, 0),
(501, 8, 144, 1, 0, 0, 0),
(502, 8, 145, 1, 0, 0, 0),
(504, 8, 194, 1, 0, 0, 0),
(506, 8, 196, 1, 0, 1, 1),
(508, 8, 198, 1, 0, 0, 0),
(511, 8, 148, 1, 0, 0, 0),
(516, 8, 225, 1, 0, 0, 0),
(540, 3, 245, 1, 1, 1, 1),
(580, 2, 221, 1, 1, 1, 1),
(581, 2, 222, 1, 1, 1, 1),
(582, 2, 223, 1, 1, 1, 1),
(583, 2, 225, 1, 0, 0, 0),
(584, 2, 216, 1, 0, 0, 0),
(585, 2, 217, 1, 0, 0, 0),
(587, 2, 249, 1, 1, 1, 1),
(588, 2, 250, 1, 0, 0, 0),
(589, 2, 251, 1, 0, 0, 0),
(590, 2, 253, 1, 0, 0, 0),
(591, 2, 254, 1, 0, 0, 0),
(592, 2, 255, 1, 0, 0, 0),
(593, 2, 256, 1, 0, 0, 0),
(594, 2, 238, 1, 0, 0, 0),
(595, 2, 236, 1, 1, 1, 0),
(596, 2, 237, 1, 0, 0, 0),
(597, 3, 192, 1, 1, 1, 1),
(598, 3, 218, 1, 0, 0, 0),
(599, 3, 219, 1, 0, 0, 0),
(600, 3, 221, 1, 1, 1, 1),
(601, 3, 222, 1, 1, 1, 1),
(602, 3, 223, 1, 1, 1, 1),
(603, 3, 193, 1, 0, 0, 0),
(604, 3, 195, 1, 0, 0, 0),
(605, 3, 196, 1, 1, 1, 1),
(606, 3, 197, 1, 1, 1, 1),
(607, 3, 220, 1, 1, 1, 1),
(608, 3, 248, 1, 1, 1, 1),
(609, 3, 146, 1, 0, 0, 0),
(610, 3, 149, 1, 0, 0, 0),
(611, 3, 152, 1, 0, 0, 0),
(612, 3, 173, 1, 0, 0, 0),
(613, 3, 174, 1, 0, 0, 0),
(614, 3, 176, 1, 0, 0, 0),
(615, 3, 228, 1, 0, 0, 0),
(616, 3, 165, 1, 0, 0, 0),
(617, 3, 214, 1, 1, 1, 1),
(618, 3, 215, 1, 1, 1, 1),
(619, 3, 216, 1, 0, 0, 0),
(620, 3, 217, 1, 0, 0, 0),
(621, 3, 236, 1, 1, 1, 1),
(623, 5, 243, 1, 1, 1, 1),
(624, 5, 236, 1, 0, 0, 0),
(625, 6, 43, 1, 1, 1, 1),
(626, 6, 44, 1, 0, 0, 0),
(627, 6, 27, 1, 1, 0, 1),
(628, 6, 236, 1, 0, 0, 0),
(629, 8, 135, 1, 1, 1, 1),
(630, 8, 218, 1, 0, 0, 0),
(631, 8, 219, 1, 0, 0, 0),
(632, 8, 221, 1, 0, 0, 0),
(633, 8, 222, 1, 0, 0, 0),
(634, 8, 223, 1, 0, 0, 0),
(635, 8, 149, 1, 0, 0, 0),
(636, 8, 152, 1, 0, 0, 0),
(637, 8, 163, 1, 0, 0, 0),
(638, 8, 167, 1, 0, 0, 0),
(639, 8, 173, 1, 0, 0, 0),
(640, 8, 174, 1, 0, 0, 0),
(641, 8, 176, 1, 0, 0, 0),
(642, 8, 228, 1, 0, 0, 0),
(643, 8, 165, 1, 0, 0, 0),
(644, 8, 166, 1, 0, 0, 0),
(645, 8, 214, 1, 0, 0, 0),
(646, 8, 215, 1, 0, 0, 0),
(647, 8, 82, 1, 1, 1, 1),
(648, 8, 83, 1, 1, 1, 1),
(649, 8, 84, 1, 1, 1, 1),
(650, 8, 85, 1, 1, 1, 1),
(651, 8, 204, 1, 1, 1, 1),
(652, 8, 205, 1, 0, 0, 0),
(653, 8, 216, 1, 0, 0, 0),
(654, 8, 217, 1, 0, 0, 0),
(655, 8, 109, 1, 1, 0, 1),
(656, 8, 43, 1, 1, 1, 1),
(657, 8, 44, 1, 0, 0, 0),
(658, 8, 27, 1, 1, 0, 1),
(659, 8, 31, 1, 0, 0, 0),
(660, 8, 32, 1, 0, 0, 0),
(661, 8, 33, 1, 0, 0, 0),
(662, 8, 48, 1, 0, 0, 0),
(663, 8, 178, 1, 0, 0, 0),
(664, 8, 180, 1, 0, 0, 0),
(665, 8, 181, 1, 0, 0, 0),
(666, 8, 186, 1, 0, 0, 0),
(667, 8, 207, 1, 0, 0, 0),
(668, 8, 208, 1, 0, 0, 0),
(669, 8, 209, 1, 0, 0, 0),
(670, 8, 253, 1, 0, 0, 0),
(671, 8, 254, 1, 0, 0, 0),
(672, 8, 255, 1, 0, 0, 0),
(673, 8, 118, 1, 0, 0, 0),
(674, 8, 238, 1, 0, 0, 0),
(675, 8, 102, 1, 1, 1, 1),
(676, 5, 176, 1, 0, 0, 0),
(677, 6, 176, 1, 0, 0, 0),
(678, 8, 86, 1, 0, 0, 0),
(679, 8, 182, 1, 0, 0, 0),
(680, 2, 147, 1, 0, 0, 0),
(681, 2, 200, 1, 0, 0, 0),
(682, 2, 164, 1, 0, 0, 0),
(683, 2, 146, 1, 0, 0, 0),
(684, 1, 218, 1, 0, 0, 0),
(685, 1, 219, 1, 0, 0, 0),
(686, 1, 221, 1, 1, 1, 1),
(687, 1, 222, 1, 1, 1, 1),
(688, 1, 223, 1, 1, 1, 1),
(689, 1, 220, 1, 1, 1, 1),
(690, 1, 248, 1, 1, 1, 1),
(691, 1, 224, 1, 0, 0, 0),
(692, 1, 225, 1, 1, 1, 1),
(693, 1, 226, 1, 1, 1, 1),
(694, 1, 227, 1, 1, 1, 1),
(695, 1, 243, 1, 1, 1, 1),
(696, 1, 257, 1, 1, 1, 1),
(697, 1, 244, 1, 1, 1, 1),
(698, 1, 245, 1, 1, 1, 1),
(699, 1, 246, 1, 1, 1, 1),
(700, 1, 252, 1, 0, 0, 0),
(701, 1, 228, 1, 1, 1, 1),
(702, 1, 247, 1, 1, 1, 1),
(703, 1, 214, 1, 1, 1, 1),
(704, 1, 215, 1, 1, 1, 1),
(705, 1, 240, 1, 1, 1, 1),
(706, 1, 241, 1, 1, 1, 1),
(707, 1, 242, 1, 1, 1, 1),
(708, 1, 216, 1, 0, 0, 0),
(709, 1, 217, 1, 0, 0, 0),
(711, 1, 249, 1, 1, 1, 1),
(712, 1, 250, 1, 0, 0, 0),
(713, 1, 251, 1, 0, 0, 0),
(714, 1, 253, 1, 0, 0, 0),
(715, 1, 254, 1, 0, 0, 0),
(716, 1, 255, 1, 0, 0, 0),
(717, 1, 256, 1, 0, 0, 0),
(718, 1, 258, 1, 0, 0, 0),
(719, 1, 259, 1, 0, 0, 0),
(720, 1, 238, 1, 0, 0, 0),
(721, 1, 236, 1, 1, 1, 1),
(722, 1, 237, 1, 0, 0, 0),
(723, 1, 239, 1, 0, 0, 0),
(724, 3, 226, 1, 0, 0, 0),
(727, 3, 238, 1, 0, 0, 0),
(728, 9, 132, 1, 1, 1, 1),
(958, 1, 268, 0, 0, 1, 0),
(963, 1, 267, 1, 1, 1, 1),
(1077, 3, 270, 1, 1, 0, 1),
(1087, 1, 269, 1, 1, 0, 1),
(1088, 1, 270, 1, 1, 0, 1),
(1089, 1, 271, 1, 0, 0, 0),
(1090, 1, 272, 1, 0, 0, 0),
(1091, 1, 273, 1, 0, 1, 0),
(1093, 3, 274, 1, 0, 0, 0),
(1094, 1, 274, 1, 0, 0, 0),
(1120, 4, 197, 1, 1, 1, 1),
(1125, 4, 146, 1, 1, 1, 1),
(1126, 4, 147, 1, 1, 1, 1),
(1128, 4, 170, 1, 1, 1, 1),
(1129, 4, 200, 1, 1, 0, 1),
(1130, 4, 201, 1, 1, 1, 1),
(1131, 4, 224, 1, 0, 0, 0),
(1132, 4, 225, 1, 1, 1, 1),
(1133, 4, 226, 1, 1, 1, 1),
(1134, 4, 227, 1, 1, 1, 1),
(1138, 4, 243, 1, 0, 0, 0),
(1145, 4, 244, 1, 0, 0, 0),
(1150, 4, 245, 1, 0, 0, 0),
(1160, 4, 252, 1, 0, 0, 0),
(1163, 4, 14, 1, 0, 0, 0),
(1164, 4, 176, 1, 0, 0, 0),
(1165, 4, 203, 1, 0, 0, 0),
(1166, 4, 228, 1, 0, 0, 0),
(1171, 4, 247, 1, 0, 0, 0),
(1184, 4, 214, 1, 0, 0, 0),
(1185, 4, 215, 1, 0, 0, 0),
(1186, 4, 240, 1, 0, 0, 0),
(1187, 4, 241, 1, 1, 1, 1),
(1188, 4, 242, 1, 1, 1, 1),
(1204, 4, 249, 1, 1, 1, 1),
(1205, 4, 43, 1, 1, 1, 1),
(1208, 4, 27, 1, 1, 0, 1),
(1230, 4, 179, 1, 0, 0, 0),
(1254, 4, 256, 1, 0, 0, 0),
(1269, 4, 274, 1, 0, 0, 0),
(1270, 4, 118, 1, 0, 0, 0),
(1271, 4, 155, 1, 0, 0, 0),
(1272, 4, 156, 1, 0, 0, 0),
(1273, 4, 157, 1, 0, 0, 0),
(1274, 4, 158, 1, 0, 0, 0),
(1275, 4, 159, 1, 0, 0, 0),
(1276, 4, 160, 1, 0, 0, 0),
(1277, 4, 161, 1, 0, 0, 0),
(1278, 4, 162, 1, 0, 0, 0),
(1279, 4, 190, 1, 0, 0, 0),
(1280, 4, 191, 1, 0, 0, 0),
(1281, 4, 238, 1, 0, 0, 0),
(1282, 4, 236, 1, 0, 0, 0),
(1287, 4, 102, 1, 1, 1, 1),
(1291, 4, 148, 1, 1, 1, 1),
(1295, 1, 88, 1, 1, 1, 0),
(1304, 4, 44, 1, 0, 0, 0),
(1314, 4, 109, 1, 1, 0, 1),
(1316, 1, 279, 1, 1, 1, 1),
(1320, 1, 260, 1, 1, 1, 1),
(1321, 1, 263, 1, 1, 1, 1),
(1322, 1, 275, 1, 0, 0, 0),
(1323, 1, 277, 1, 0, 0, 0),
(1324, 1, 261, 1, 1, 1, 1),
(1325, 1, 262, 1, 1, 1, 1),
(1326, 1, 276, 1, 0, 0, 0),
(1327, 1, 278, 1, 0, 0, 0),
(1328, 1, 264, 1, 1, 0, 1),
(1329, 1, 127, 1, 0, 0, 0),
(1330, 1, 62, 1, 1, 0, 1),
(1331, 1, 265, 1, 0, 0, 0),
(1332, 1, 266, 1, 0, 0, 0),
(1333, 2, 275, 1, 0, 0, 0),
(1334, 2, 276, 1, 0, 0, 0),
(1335, 2, 266, 1, 0, 0, 0),
(1336, 2, 274, 1, 0, 0, 0),
(1337, 3, 268, 0, 0, 1, 0),
(1338, 3, 279, 1, 0, 0, 0),
(1339, 4, 86, 1, 0, 0, 0),
(1340, 5, 275, 1, 0, 0, 0),
(1341, 5, 277, 1, 0, 0, 0),
(1342, 5, 270, 1, 0, 0, 0),
(1343, 2, 270, 1, 0, 0, 0),
(1344, 3, 269, 1, 1, 0, 1),
(1345, 4, 270, 1, 0, 0, 0),
(1346, 6, 261, 1, 1, 1, 1),
(1347, 6, 262, 1, 1, 1, 1),
(1348, 6, 276, 1, 0, 0, 0),
(1349, 6, 278, 1, 0, 0, 0),
(1350, 6, 270, 1, 0, 0, 0),
(1351, 5, 260, 1, 1, 1, 1),
(1352, 5, 263, 1, 1, 1, 1),
(1353, 8, 147, 1, 0, 0, 0),
(1354, 8, 200, 1, 0, 0, 0),
(1355, 8, 164, 1, 0, 0, 0),
(1356, 8, 80, 1, 1, 1, 1),
(1357, 8, 270, 1, 0, 0, 0),
(1358, 6, 244, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sch_settings`
--

CREATE TABLE `sch_settings` (
  `id` int NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `address` text,
  `start_month` varchar(100) NOT NULL,
  `session_id` int DEFAULT NULL,
  `lang_id` int DEFAULT NULL,
  `languages` varchar(255) NOT NULL DEFAULT '["4"]',
  `dise_code` varchar(50) DEFAULT NULL,
  `date_format` varchar(50) NOT NULL,
  `time_format` varchar(20) DEFAULT '24-hour',
  `currency` varchar(50) NOT NULL,
  `currency_symbol` varchar(50) NOT NULL,
  `is_rtl` varchar(10) DEFAULT 'disabled',
  `timezone` varchar(30) DEFAULT 'UTC',
  `image` varchar(100) DEFAULT NULL,
  `mini_logo` varchar(200) NOT NULL,
  `theme` varchar(200) NOT NULL DEFAULT 'default.jpg',
  `credit_limit` varchar(255) DEFAULT NULL,
  `opd_record_month` varchar(50) DEFAULT NULL,
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `cron_secret_key` varchar(100) NOT NULL,
  `doctor_restriction` varchar(100) NOT NULL,
  `superadmin_restriction` varchar(200) NOT NULL,
  `mobile_api_url` varchar(200) NOT NULL,
  `app_primary_color_code` varchar(50) NOT NULL,
  `app_secondary_color_code` varchar(50) NOT NULL,
  `app_logo` varchar(200) NOT NULL,
  `zoom_api_key` varchar(200) NOT NULL,
  `zoom_api_secret` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `sch_settings`
--

INSERT INTO `sch_settings` (`id`, `name`, `email`, `phone`, `address`, `start_month`, `session_id`, `lang_id`, `languages`, `dise_code`, `date_format`, `time_format`, `currency`, `currency_symbol`, `is_rtl`, `timezone`, `image`, `mini_logo`, `theme`, `credit_limit`, `opd_record_month`, `is_active`, `cron_secret_key`, `doctor_restriction`, `superadmin_restriction`, `mobile_api_url`, `app_primary_color_code`, `app_secondary_color_code`, `app_logo`, `zoom_api_key`, `zoom_api_secret`) VALUES
(0, 'Your Hospital Name', 'Your Hospital Email', 'Your Hospital Phone', 'Your Hospital Address', '', NULL, 4, '[\"4\"]', 'Your Hospital Code', 'd-m-Y', '12-hour', 'USD', '$', 'disabled', 'UTC', '0.png', '0mini_logo.png', 'default.jpg', '20000', '1', 'no', '', 'disabled', 'enabled', '', '', '', '0app_logo.png', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `send_notification`
--

CREATE TABLE `send_notification` (
  `id` int NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  `publish_date` date DEFAULT NULL,
  `date` date DEFAULT NULL,
  `message` text,
  `visible_staff` varchar(10) NOT NULL DEFAULT 'no',
  `visible_patient` varchar(10) NOT NULL DEFAULT 'no',
  `created_by` varchar(60) DEFAULT NULL,
  `created_id` int DEFAULT NULL,
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `sms_config`
--

CREATE TABLE `sms_config` (
  `id` int NOT NULL,
  `type` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `api_id` varchar(100) NOT NULL,
  `authkey` varchar(100) NOT NULL,
  `senderid` varchar(100) NOT NULL,
  `contact` text,
  `username` varchar(150) DEFAULT NULL,
  `url` varchar(150) DEFAULT NULL,
  `password` varchar(150) DEFAULT NULL,
  `is_active` varchar(255) DEFAULT 'disabled',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `source`
--

CREATE TABLE `source` (
  `id` int NOT NULL,
  `source` varchar(100) NOT NULL,
  `description` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `specialist`
--

CREATE TABLE `specialist` (
  `id` int NOT NULL,
  `specialist_name` varchar(200) NOT NULL,
  `is_active` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `id` int NOT NULL,
  `employee_id` varchar(200) NOT NULL,
  `lang_id` int NOT NULL,
  `department` varchar(100) NOT NULL,
  `designation` varchar(100) NOT NULL,
  `specialist` varchar(200) NOT NULL,
  `qualification` varchar(200) NOT NULL,
  `work_exp` varchar(200) NOT NULL,
  `specialization` varchar(200) NOT NULL,
  `name` varchar(200) NOT NULL,
  `surname` varchar(200) NOT NULL,
  `father_name` varchar(200) NOT NULL,
  `mother_name` varchar(200) NOT NULL,
  `contact_no` varchar(200) NOT NULL,
  `emergency_contact_no` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `dob` date NOT NULL,
  `marital_status` varchar(100) NOT NULL,
  `date_of_joining` date NOT NULL,
  `date_of_leaving` date NOT NULL,
  `local_address` varchar(300) NOT NULL,
  `permanent_address` varchar(200) NOT NULL,
  `note` varchar(200) NOT NULL,
  `image` varchar(200) NOT NULL,
  `password` varchar(250) NOT NULL,
  `gender` varchar(50) NOT NULL,
  `blood_group` varchar(100) NOT NULL,
  `account_title` varchar(200) NOT NULL,
  `bank_account_no` varchar(200) NOT NULL,
  `bank_name` varchar(200) NOT NULL,
  `ifsc_code` varchar(200) NOT NULL,
  `bank_branch` varchar(100) NOT NULL,
  `payscale` varchar(200) NOT NULL,
  `basic_salary` varchar(200) NOT NULL,
  `epf_no` varchar(200) NOT NULL,
  `contract_type` varchar(100) NOT NULL,
  `shift` varchar(100) NOT NULL,
  `location` varchar(100) NOT NULL,
  `facebook` varchar(200) NOT NULL,
  `twitter` varchar(200) NOT NULL,
  `linkedin` varchar(200) NOT NULL,
  `instagram` varchar(200) NOT NULL,
  `resume` varchar(200) NOT NULL,
  `joining_letter` varchar(200) NOT NULL,
  `resignation_letter` varchar(200) NOT NULL,
  `other_document_name` varchar(200) NOT NULL,
  `other_document_file` varchar(200) NOT NULL,
  `user_id` int NOT NULL,
  `is_active` int NOT NULL,
  `verification_code` varchar(100) NOT NULL,
  `zoom_api_key` varchar(100) NOT NULL,
  `zoom_api_secret` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`id`, `employee_id`, `lang_id`, `department`, `designation`, `specialist`, `qualification`, `work_exp`, `specialization`, `name`, `surname`, `father_name`, `mother_name`, `contact_no`, `emergency_contact_no`, `email`, `dob`, `marital_status`, `date_of_joining`, `date_of_leaving`, `local_address`, `permanent_address`, `note`, `image`, `password`, `gender`, `blood_group`, `account_title`, `bank_account_no`, `bank_name`, `ifsc_code`, `bank_branch`, `payscale`, `basic_salary`, `epf_no`, `contract_type`, `shift`, `location`, `facebook`, `twitter`, `linkedin`, `instagram`, `resume`, `joining_letter`, `resignation_letter`, `other_document_name`, `other_document_file`, `user_id`, `is_active`, `verification_code`, `zoom_api_key`, `zoom_api_secret`) VALUES
(1, '9001', 0, '', '', '', '', '', '', 'Super Admin', '', '', '', '', '', 'admin@gmail.com', '0000-00-00', '', '0000-00-00', '0000-00-00', '', '', '', '', '$2y$10$OMtEIrGLXHV1tnahdWcGh.E/APD0qs6gXNIkzr/0fam1Zyf7iKTqq', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 1, '', '', ''),
(2, '1', 0, 'select', 'select', 'select', 'asd', 'asd', 'asd', 'Inder', 'sein', '', 'asdad', '+919874563210', '+919874563210', 'indersein@mailinator.com', '2021-07-07', 'Single', '0000-00-00', '0000-00-00', 'Vpo bhagu', 'Vpo bhagu', 'asd', '', '$2y$10$gGVYm6HS2f9W9fztaf1u0.8.mDofz3jdV7DS6avCPVhtm7UvVnWle', 'Male', 'O+', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 1, '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `staff_attendance`
--

CREATE TABLE `staff_attendance` (
  `id` int NOT NULL,
  `date` date NOT NULL,
  `staff_id` int NOT NULL,
  `staff_attendance_type_id` int NOT NULL,
  `remark` varchar(200) NOT NULL,
  `is_active` int NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `staff_attendance_type`
--

CREATE TABLE `staff_attendance_type` (
  `id` int NOT NULL,
  `type` varchar(200) NOT NULL,
  `key_value` varchar(200) NOT NULL,
  `is_active` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `staff_attendance_type`
--

INSERT INTO `staff_attendance_type` (`id`, `type`, `key_value`, `is_active`) VALUES
(1, 'Present', '<b class=\"text text-success\">P</b>', 'yes'),
(2, 'Late', '<b class=\"text text-warning\">L</b>', 'yes'),
(3, 'Absent', '<b class=\"text text-danger\">A</b>', 'yes'),
(4, 'Half Day', '<b class=\"text text-warning\">F</b>', 'yes'),
(5, 'Holiday', 'H', 'yes');

-- --------------------------------------------------------

--
-- Table structure for table `staff_designation`
--

CREATE TABLE `staff_designation` (
  `id` int NOT NULL,
  `designation` varchar(200) NOT NULL,
  `is_active` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `staff_leave_details`
--

CREATE TABLE `staff_leave_details` (
  `id` int NOT NULL,
  `staff_id` int NOT NULL,
  `leave_type_id` int NOT NULL,
  `alloted_leave` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `staff_leave_request`
--

CREATE TABLE `staff_leave_request` (
  `id` int NOT NULL,
  `staff_id` int NOT NULL,
  `leave_type_id` int NOT NULL,
  `leave_from` date NOT NULL,
  `leave_to` date NOT NULL,
  `leave_days` int NOT NULL,
  `employee_remark` varchar(200) NOT NULL,
  `admin_remark` varchar(200) NOT NULL,
  `status` varchar(100) NOT NULL,
  `applied_by` varchar(200) NOT NULL,
  `document_file` varchar(200) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `staff_payroll`
--

CREATE TABLE `staff_payroll` (
  `id` int NOT NULL,
  `basic_salary` int NOT NULL,
  `pay_scale` varchar(200) NOT NULL,
  `grade` varchar(50) NOT NULL,
  `is_active` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `staff_payslip`
--

CREATE TABLE `staff_payslip` (
  `id` int NOT NULL,
  `staff_id` int NOT NULL,
  `basic` float NOT NULL,
  `total_allowance` float NOT NULL,
  `total_deduction` float NOT NULL,
  `leave_deduction` int NOT NULL,
  `tax` decimal(15,2) NOT NULL,
  `net_salary` float NOT NULL,
  `status` varchar(100) NOT NULL,
  `month` varchar(200) NOT NULL,
  `year` varchar(200) NOT NULL,
  `payment_mode` varchar(200) NOT NULL,
  `payment_date` date NOT NULL,
  `remark` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `staff_roles`
--

CREATE TABLE `staff_roles` (
  `id` int NOT NULL,
  `role_id` int DEFAULT NULL,
  `staff_id` int DEFAULT NULL,
  `is_active` int DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `staff_roles`
--

INSERT INTO `staff_roles` (`id`, `role_id`, `staff_id`, `is_active`) VALUES
(1, 7, 1, 0),
(2, 3, 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `staff_timeline`
--

CREATE TABLE `staff_timeline` (
  `id` int NOT NULL,
  `staff_id` int NOT NULL,
  `title` varchar(200) NOT NULL,
  `timeline_date` date NOT NULL,
  `description` varchar(300) NOT NULL,
  `document` varchar(200) NOT NULL,
  `status` varchar(200) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `subscription`
--

CREATE TABLE `subscription` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `amount` double NOT NULL,
  `circle` enum('1','3','6','12') NOT NULL COMMENT 'in months',
  `isActive` int NOT NULL COMMENT '0 => Pending, 1 => processing, 2 => completed',
  `subscriptionActiveTime` datetime DEFAULT NULL,
  `paymentId` varchar(200) NOT NULL,
  `paymentResponse` mediumtext,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `subscription`
--

INSERT INTO `subscription` (`id`, `user_id`, `amount`, `circle`, `isActive`, `subscriptionActiveTime`, `paymentId`, `paymentResponse`, `created_at`) VALUES
(7, 1, 2000, '1', 2, '2021-05-21 12:41:39', 'pay_HbYwkyaLhLqHSL', '{\"id\":\"pay_HbYwkyaLhLqHSL\",\"entity\":\"payment\",\"amount\":550000,\"currency\":\"INR\",\"status\":\"captured\",\"order_id\":\"order_HbYwakhMMLqgM7\",\"invoice_id\":null,\"international\":false,\"method\":\"netbanking\",\"amount_refunded\":0,\"refund_status\":null,\"captured\":true,\"description\":\"Subscription Payment\",\"card_id\":null,\"bank\":\"SBIN\",\"wallet\":null,\"vpa\":null,\"email\":\"indersein@mailinator.com\",\"contact\":\"+919874563210\",\"notes\":{\"user_id\":\"1\",\"amount\":\"5500\",\"startDate\":\"2021-07-21 16:51:56\",\"circle\":\"3\",\"address\":\"\"},\"fee\":12980,\"tax\":1980,\"error_code\":null,\"error_description\":null,\"error_source\":null,\"error_step\":null,\"error_reason\":null,\"acquirer_data\":{\"bank_transaction_id\":\"8331857\"},\"created_at\":1626866527}', '2021-07-21 16:52:12'),
(14, 1, 5500, '3', 2, '2021-07-22 17:05:42', 'pay_HbxiSaU5Ttj3iK', '{\"id\":\"pay_HbxiSaU5Ttj3iK\",\"entity\":\"payment\",\"amount\":550000,\"currency\":\"INR\",\"status\":\"captured\",\"order_id\":\"order_HbxiGZdm79775p\",\"invoice_id\":null,\"international\":false,\"method\":\"netbanking\",\"amount_refunded\":0,\"refund_status\":null,\"captured\":true,\"description\":\"Subscription Payment\",\"card_id\":null,\"bank\":\"SBIN\",\"wallet\":null,\"vpa\":null,\"email\":\"indersein416@gmail.com\",\"contact\":\"+919815376872\",\"notes\":{\"user_id\":\"1\",\"amount\":\"5500\",\"startDate\":\"2021-07-22 17:05:42\",\"circle\":\"3\",\"address\":\"\"},\"fee\":12980,\"tax\":1980,\"error_code\":null,\"error_description\":null,\"error_source\":null,\"error_step\":null,\"error_reason\":null,\"acquirer_data\":{\"bank_transaction_id\":\"6234443\"},\"created_at\":1626953756}', '2021-07-22 17:06:00'),
(15, 1, 5500, '3', 2, '2021-10-22 17:05:42', 'pay_HbxkjjwVZuvoqo', '{\"id\":\"pay_HbxkjjwVZuvoqo\",\"entity\":\"payment\",\"amount\":550000,\"currency\":\"INR\",\"status\":\"captured\",\"order_id\":\"order_HbxkbXv14E1bUu\",\"invoice_id\":null,\"international\":false,\"method\":\"netbanking\",\"amount_refunded\":0,\"refund_status\":null,\"captured\":true,\"description\":\"Subscription Payment\",\"card_id\":null,\"bank\":\"SBIN\",\"wallet\":null,\"vpa\":null,\"email\":\"indersein@mailinator.com\",\"contact\":\"+919815376872\",\"notes\":{\"user_id\":\"1\",\"amount\":\"5500\",\"startDate\":\"2021-10-22 17:05:42\",\"circle\":\"3\",\"address\":\"\"},\"fee\":12980,\"tax\":1980,\"error_code\":null,\"error_description\":null,\"error_source\":null,\"error_step\":null,\"error_reason\":null,\"acquirer_data\":{\"bank_transaction_id\":\"8598534\"},\"created_at\":1626953885}', '2021-07-22 17:08:09'),
(16, 1, 11000, '6', 2, '2022-01-22 17:05:42', 'pay_HbxlE665yk9w9P', '{\"id\":\"pay_HbxlE665yk9w9P\",\"entity\":\"payment\",\"amount\":1100000,\"currency\":\"INR\",\"status\":\"captured\",\"order_id\":\"order_Hbxl3uRiBTCEcK\",\"invoice_id\":null,\"international\":false,\"method\":\"netbanking\",\"amount_refunded\":0,\"refund_status\":null,\"captured\":true,\"description\":\"Subscription Payment\",\"card_id\":null,\"bank\":\"SBIN\",\"wallet\":null,\"vpa\":null,\"email\":\"indersein416@gmail.com\",\"contact\":\"+919815376872\",\"notes\":{\"user_id\":\"1\",\"amount\":\"11000\",\"startDate\":\"2022-01-22 17:05:42\",\"circle\":\"6\",\"address\":\"\"},\"fee\":25960,\"tax\":3960,\"error_code\":null,\"error_description\":null,\"error_source\":null,\"error_step\":null,\"error_reason\":null,\"acquirer_data\":{\"bank_transaction_id\":\"2637315\"},\"created_at\":1626953913}', '2021-07-22 17:08:38');

-- --------------------------------------------------------

--
-- Table structure for table `subscription_plans`
--

CREATE TABLE `subscription_plans` (
  `id` int NOT NULL,
  `circle` enum('1','3','6') NOT NULL,
  `amount` double NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `subscription_plans`
--

INSERT INTO `subscription_plans` (`id`, `circle`, `amount`, `created_at`) VALUES
(1, '1', 2000, '2021-07-20 15:39:29'),
(2, '3', 5500, '2021-07-20 15:39:39'),
(3, '6', 11000, '2021-07-20 15:39:52');

-- --------------------------------------------------------

--
-- Table structure for table `supplier_bill_basic`
--

CREATE TABLE `supplier_bill_basic` (
  `id` int NOT NULL,
  `purchase_no` varchar(200) NOT NULL,
  `invoice_no` varchar(100) NOT NULL,
  `date` varchar(200) NOT NULL,
  `supplier_id` int NOT NULL,
  `supplier_name` varchar(200) NOT NULL,
  `file` varchar(200) NOT NULL,
  `total` varchar(200) NOT NULL,
  `tax` varchar(200) NOT NULL,
  `discount` varchar(200) NOT NULL,
  `net_amount` varchar(200) NOT NULL,
  `note` varchar(200) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `supplier_bill_detail`
--

CREATE TABLE `supplier_bill_detail` (
  `id` int NOT NULL,
  `supplier_bill_basic_id` varchar(200) NOT NULL,
  `medicine_category_id` varchar(200) NOT NULL,
  `medicine_name` varchar(200) NOT NULL,
  `expire_date` varchar(100) NOT NULL,
  `batch_no` varchar(200) NOT NULL,
  `quantity` varchar(100) NOT NULL,
  `purchase_price` varchar(200) NOT NULL,
  `mrp` varchar(200) NOT NULL,
  `sale_price` varchar(200) NOT NULL,
  `amount` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `supplier_category`
--

CREATE TABLE `supplier_category` (
  `id` int NOT NULL,
  `supplier_category` varchar(200) NOT NULL,
  `contact` varchar(200) NOT NULL,
  `supplier_person` varchar(200) NOT NULL,
  `supplier_person_contact` varchar(200) NOT NULL,
  `address` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `symptoms`
--

CREATE TABLE `symptoms` (
  `id` int NOT NULL,
  `symptoms_title` varchar(200) NOT NULL,
  `description` text NOT NULL,
  `type` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `symptoms_classification`
--

CREATE TABLE `symptoms_classification` (
  `id` int NOT NULL,
  `symptoms_type` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `system_notification`
--

CREATE TABLE `system_notification` (
  `id` int NOT NULL,
  `notification_title` varchar(200) NOT NULL,
  `notification_type` varchar(200) NOT NULL,
  `notification_desc` varchar(200) NOT NULL,
  `notification_for` varchar(200) NOT NULL,
  `receiver_id` int NOT NULL,
  `date` datetime NOT NULL,
  `is_active` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `test_type_report`
--

CREATE TABLE `test_type_report` (
  `id` int NOT NULL,
  `radiology_id` int NOT NULL,
  `type` varchar(100) DEFAULT NULL,
  `test_name` varchar(100) DEFAULT NULL,
  `reporting_date` date DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `test_report` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `tpa_doctorcharges`
--

CREATE TABLE `tpa_doctorcharges` (
  `id` int NOT NULL,
  `org_id` int NOT NULL,
  `charge_id` int NOT NULL,
  `org_charge` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `tpa_master`
--

CREATE TABLE `tpa_master` (
  `id` int NOT NULL,
  `organisation` varchar(200) NOT NULL,
  `charge_id` int NOT NULL,
  `organisation_charge` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `unit`
--

CREATE TABLE `unit` (
  `id` int NOT NULL,
  `unit_name` varchar(100) NOT NULL,
  `unit_type` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `userlog`
--

CREATE TABLE `userlog` (
  `id` int NOT NULL,
  `user` varchar(100) DEFAULT NULL,
  `role` varchar(100) DEFAULT NULL,
  `ipaddress` varchar(100) DEFAULT NULL,
  `user_agent` varchar(500) DEFAULT NULL,
  `login_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `userlog`
--

INSERT INTO `userlog` (`id`, `user`, `role`, `ipaddress`, `user_agent`) VALUES
(1, 'admin@gmail.com', 'Super Admin', '::1', 'Chrome 93.0.4558.0, Linux'),
(2, 'admin@gmail.com', 'Super Admin', '::1', 'Chrome 93.0.4558.0, Linux'),
(3, 'admin@gmail.com', 'Super Admin', '::1', 'Chrome 93.0.4558.0, Linux'),
(4, 'admin@gmail.com', 'Super Admin', '::1', 'Chrome 93.0.4558.0, Linux'),
(5, 'admin@gmail.com', 'Super Admin', '::1', 'Chrome 93.0.4558.0, Linux'),
(6, 'pat1', 'patient', '::1', 'Chrome 93.0.4558.0, Linux'),
(7, 'admin@gmail.com', 'Super Admin', '::1', 'Chrome 93.0.4558.0, Linux'),
(8, 'admin@gmail.com', 'Super Admin', '::1', 'Chrome 93.0.4558.0, Linux'),
(9, 'admin@gmail.com', 'Super Admin', '::1', 'Chrome 93.0.4558.0, Linux'),
(10, 'admin@gmail.com', 'Super Admin', '::1', 'Chrome 93.0.4558.0, Linux'),
(11, 'admin@gmail.com', 'Super Admin', '::1', 'Chrome 93.0.4558.0, Linux');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `childs` text NOT NULL,
  `role` varchar(30) NOT NULL,
  `verification_code` varchar(200) NOT NULL,
  `is_active` varchar(255) DEFAULT 'yes',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `is_active`) VALUES
(1, 1, 'pat1', 'rdrzt0', '', 'patient', '', 'yes');

-- --------------------------------------------------------

--
-- Table structure for table `users_authentication`
--

CREATE TABLE `users_authentication` (
  `id` int NOT NULL,
  `users_id` int NOT NULL,
  `token` varchar(200) NOT NULL,
  `expired_at` datetime NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `vehicles`
--

CREATE TABLE `vehicles` (
  `id` int UNSIGNED NOT NULL,
  `vehicle_no` varchar(20) DEFAULT NULL,
  `vehicle_model` varchar(100) NOT NULL DEFAULT 'None',
  `manufacture_year` varchar(4) DEFAULT NULL,
  `vehicle_type` varchar(100) NOT NULL,
  `driver_name` varchar(50) DEFAULT NULL,
  `driver_licence` varchar(50) NOT NULL DEFAULT 'None',
  `driver_contact` varchar(20) DEFAULT NULL,
  `note` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `visitors_book`
--

CREATE TABLE `visitors_book` (
  `id` int NOT NULL,
  `source` varchar(100) DEFAULT NULL,
  `purpose` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `contact` varchar(12) NOT NULL,
  `id_proof` varchar(50) NOT NULL,
  `no_of_pepple` int NOT NULL,
  `date` date NOT NULL,
  `in_time` varchar(20) NOT NULL,
  `out_time` varchar(20) NOT NULL,
  `note` mediumtext NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `visitors_purpose`
--

CREATE TABLE `visitors_purpose` (
  `id` int NOT NULL,
  `visitors_purpose` varchar(100) NOT NULL,
  `description` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `visit_details`
--

CREATE TABLE `visit_details` (
  `id` int NOT NULL,
  `patient_id` int NOT NULL,
  `opd_id` int NOT NULL,
  `opd_no` varchar(100) NOT NULL,
  `cons_doctor` int NOT NULL,
  `case_type` varchar(200) NOT NULL,
  `appointment_date` datetime NOT NULL,
  `symptoms` varchar(200) NOT NULL,
  `bp` varchar(100) NOT NULL,
  `height` varchar(100) NOT NULL,
  `weight` varchar(100) NOT NULL,
  `pulse` varchar(200) NOT NULL,
  `temperature` varchar(200) NOT NULL,
  `respiration` varchar(200) NOT NULL,
  `known_allergies` varchar(100) NOT NULL,
  `casualty` varchar(200) NOT NULL,
  `refference` varchar(200) NOT NULL,
  `date` date NOT NULL,
  `note` varchar(100) NOT NULL,
  `amount` decimal(15,2) NOT NULL,
  `tax` decimal(15,2) NOT NULL,
  `note_remark` mediumtext NOT NULL,
  `payment_mode` varchar(100) NOT NULL,
  `header_note` text NOT NULL,
  `footer_note` text NOT NULL,
  `generated_by` int NOT NULL,
  `discharged` varchar(200) NOT NULL,
  `live_consult` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `zoom_settings`
--

CREATE TABLE `zoom_settings` (
  `id` int NOT NULL,
  `zoom_api_key` varchar(200) DEFAULT NULL,
  `zoom_api_secret` varchar(200) DEFAULT NULL,
  `use_doctor_api` int DEFAULT '1',
  `use_zoom_app` int DEFAULT '1',
  `opd_duration` int DEFAULT NULL,
  `ipd_duration` int DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `zoom_settings`
--

INSERT INTO `zoom_settings` (`id`, `zoom_api_key`, `zoom_api_secret`, `use_doctor_api`, `use_zoom_app`, `opd_duration`, `ipd_duration`) VALUES
(1, NULL, NULL, 1, 1, 0, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ambulance_call`
--
ALTER TABLE `ambulance_call`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `appoint_priority`
--
ALTER TABLE `appoint_priority`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bed`
--
ALTER TABLE `bed`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bed_group`
--
ALTER TABLE `bed_group`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bed_type`
--
ALTER TABLE `bed_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `birth_report`
--
ALTER TABLE `birth_report`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blood_bank_status`
--
ALTER TABLE `blood_bank_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blood_donor`
--
ALTER TABLE `blood_donor`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blood_donor_cycle`
--
ALTER TABLE `blood_donor_cycle`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blood_issue`
--
ALTER TABLE `blood_issue`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `charges`
--
ALTER TABLE `charges`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `charge_categories`
--
ALTER TABLE `charge_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `charge_type_master`
--
ALTER TABLE `charge_type_master`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `complaint`
--
ALTER TABLE `complaint`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `complaint_type`
--
ALTER TABLE `complaint_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `conferences`
--
ALTER TABLE `conferences`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `conferences_history`
--
ALTER TABLE `conferences_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `conference_staff`
--
ALTER TABLE `conference_staff`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `consultant_register`
--
ALTER TABLE `consultant_register`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `consult_charges`
--
ALTER TABLE `consult_charges`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contents`
--
ALTER TABLE `contents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `content_for`
--
ALTER TABLE `content_for`
  ADD PRIMARY KEY (`id`),
  ADD KEY `content_id` (`content_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `custom_fields`
--
ALTER TABLE `custom_fields`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `custom_field_values`
--
ALTER TABLE `custom_field_values`
  ADD PRIMARY KEY (`id`),
  ADD KEY `custom_field_id` (`custom_field_id`);

--
-- Indexes for table `death_report`
--
ALTER TABLE `death_report`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `diagnosis`
--
ALTER TABLE `diagnosis`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `discharged_summary`
--
ALTER TABLE `discharged_summary`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `discharged_summary_opd`
--
ALTER TABLE `discharged_summary_opd`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dispatch_receive`
--
ALTER TABLE `dispatch_receive`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_config`
--
ALTER TABLE `email_config`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `enquiry`
--
ALTER TABLE `enquiry`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `enquiry_type`
--
ALTER TABLE `enquiry_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expense_head`
--
ALTER TABLE `expense_head`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `floor`
--
ALTER TABLE `floor`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `follow_up`
--
ALTER TABLE `follow_up`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `front_cms_media_gallery`
--
ALTER TABLE `front_cms_media_gallery`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `front_cms_menus`
--
ALTER TABLE `front_cms_menus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `front_cms_menu_items`
--
ALTER TABLE `front_cms_menu_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `front_cms_pages`
--
ALTER TABLE `front_cms_pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `front_cms_page_contents`
--
ALTER TABLE `front_cms_page_contents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `page_id` (`page_id`);

--
-- Indexes for table `front_cms_programs`
--
ALTER TABLE `front_cms_programs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `front_cms_program_photos`
--
ALTER TABLE `front_cms_program_photos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `program_id` (`program_id`);

--
-- Indexes for table `front_cms_settings`
--
ALTER TABLE `front_cms_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `general_calls`
--
ALTER TABLE `general_calls`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `income`
--
ALTER TABLE `income`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `income_head`
--
ALTER TABLE `income_head`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ipd_billing`
--
ALTER TABLE `ipd_billing`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ipd_details`
--
ALTER TABLE `ipd_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ipd_prescription_basic`
--
ALTER TABLE `ipd_prescription_basic`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ipd_prescription_details`
--
ALTER TABLE `ipd_prescription_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `item_category`
--
ALTER TABLE `item_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `item_issue`
--
ALTER TABLE `item_issue`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_id` (`item_id`),
  ADD KEY `item_category_id` (`item_category_id`);

--
-- Indexes for table `item_stock`
--
ALTER TABLE `item_stock`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_id` (`item_id`),
  ADD KEY `supplier_id` (`supplier_id`),
  ADD KEY `store_id` (`store_id`);

--
-- Indexes for table `item_store`
--
ALTER TABLE `item_store`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `item_supplier`
--
ALTER TABLE `item_supplier`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lab`
--
ALTER TABLE `lab`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `leave_types`
--
ALTER TABLE `leave_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `type` (`type`);

--
-- Indexes for table `medicine_bad_stock`
--
ALTER TABLE `medicine_bad_stock`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `medicine_batch_details`
--
ALTER TABLE `medicine_batch_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `medicine_category`
--
ALTER TABLE `medicine_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `medicine_dosage`
--
ALTER TABLE `medicine_dosage`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notification_roles`
--
ALTER TABLE `notification_roles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `send_notification_id` (`send_notification_id`),
  ADD KEY `role_id` (`role_id`);

--
-- Indexes for table `opd_billing`
--
ALTER TABLE `opd_billing`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `opd_details`
--
ALTER TABLE `opd_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `opd_patient_charges`
--
ALTER TABLE `opd_patient_charges`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `opd_payment`
--
ALTER TABLE `opd_payment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `operation_theatre`
--
ALTER TABLE `operation_theatre`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `organisation`
--
ALTER TABLE `organisation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `organisations_charges`
--
ALTER TABLE `organisations_charges`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `org_id` (`org_id`) USING BTREE,
  ADD KEY `charge_id` (`charge_id`) USING BTREE;

--
-- Indexes for table `ot_consultant_register`
--
ALTER TABLE `ot_consultant_register`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pathology`
--
ALTER TABLE `pathology`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pathology_category`
--
ALTER TABLE `pathology_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pathology_parameter`
--
ALTER TABLE `pathology_parameter`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pathology_parameterdetails`
--
ALTER TABLE `pathology_parameterdetails`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pathology_report`
--
ALTER TABLE `pathology_report`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pathology_report_parameterdetails`
--
ALTER TABLE `pathology_report_parameterdetails`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `patient_charges`
--
ALTER TABLE `patient_charges`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `patient_timeline`
--
ALTER TABLE `patient_timeline`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_settings`
--
ALTER TABLE `payment_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payslip_allowance`
--
ALTER TABLE `payslip_allowance`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permission_category`
--
ALTER TABLE `permission_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permission_group`
--
ALTER TABLE `permission_group`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pharmacy`
--
ALTER TABLE `pharmacy`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pharmacy_bill_basic`
--
ALTER TABLE `pharmacy_bill_basic`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pharmacy_bill_detail`
--
ALTER TABLE `pharmacy_bill_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `prescription`
--
ALTER TABLE `prescription`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `print_setting`
--
ALTER TABLE `print_setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `radio`
--
ALTER TABLE `radio`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `radiology_parameter`
--
ALTER TABLE `radiology_parameter`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `radiology_parameterdetails`
--
ALTER TABLE `radiology_parameterdetails`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `radiology_report`
--
ALTER TABLE `radiology_report`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `radiology_report_parameterdetails`
--
ALTER TABLE `radiology_report_parameterdetails`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `read_notification`
--
ALTER TABLE `read_notification`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `read_systemnotification`
--
ALTER TABLE `read_systemnotification`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles_permissions`
--
ALTER TABLE `roles_permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sch_settings`
--
ALTER TABLE `sch_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lang_id` (`lang_id`),
  ADD KEY `session_id` (`session_id`);

--
-- Indexes for table `send_notification`
--
ALTER TABLE `send_notification`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sms_config`
--
ALTER TABLE `sms_config`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `source`
--
ALTER TABLE `source`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `specialist`
--
ALTER TABLE `specialist`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `employee_id` (`employee_id`);

--
-- Indexes for table `staff_attendance`
--
ALTER TABLE `staff_attendance`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `staff_attendance_type`
--
ALTER TABLE `staff_attendance_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `staff_designation`
--
ALTER TABLE `staff_designation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `staff_leave_details`
--
ALTER TABLE `staff_leave_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `staff_leave_request`
--
ALTER TABLE `staff_leave_request`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `staff_payroll`
--
ALTER TABLE `staff_payroll`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `staff_payslip`
--
ALTER TABLE `staff_payslip`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `staff_roles`
--
ALTER TABLE `staff_roles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_id` (`role_id`),
  ADD KEY `staff_id` (`staff_id`);

--
-- Indexes for table `staff_timeline`
--
ALTER TABLE `staff_timeline`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscription`
--
ALTER TABLE `subscription`
  ADD PRIMARY KEY (`id`),
  ADD KEY `circle` (`circle`),
  ADD KEY `amount` (`amount`),
  ADD KEY `isActive` (`isActive`),
  ADD KEY `subscriptionActiveTime` (`subscriptionActiveTime`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `paymentId` (`paymentId`);

--
-- Indexes for table `subscription_plans`
--
ALTER TABLE `subscription_plans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `circle` (`circle`);

--
-- Indexes for table `supplier_bill_basic`
--
ALTER TABLE `supplier_bill_basic`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `supplier_bill_detail`
--
ALTER TABLE `supplier_bill_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `supplier_category`
--
ALTER TABLE `supplier_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `symptoms`
--
ALTER TABLE `symptoms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `symptoms_classification`
--
ALTER TABLE `symptoms_classification`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_notification`
--
ALTER TABLE `system_notification`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `test_type_report`
--
ALTER TABLE `test_type_report`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tpa_doctorcharges`
--
ALTER TABLE `tpa_doctorcharges`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `org_id` (`org_id`) USING BTREE,
  ADD KEY `charge_id` (`charge_id`) USING BTREE;

--
-- Indexes for table `tpa_master`
--
ALTER TABLE `tpa_master`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `unit`
--
ALTER TABLE `unit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `userlog`
--
ALTER TABLE `userlog`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users_authentication`
--
ALTER TABLE `users_authentication`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vehicles`
--
ALTER TABLE `vehicles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `visitors_book`
--
ALTER TABLE `visitors_book`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `visitors_purpose`
--
ALTER TABLE `visitors_purpose`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `visit_details`
--
ALTER TABLE `visit_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zoom_settings`
--
ALTER TABLE `zoom_settings`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ambulance_call`
--
ALTER TABLE `ambulance_call`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `appointment`
--
ALTER TABLE `appointment`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `appoint_priority`
--
ALTER TABLE `appoint_priority`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `bed`
--
ALTER TABLE `bed`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bed_group`
--
ALTER TABLE `bed_group`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bed_type`
--
ALTER TABLE `bed_type`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `birth_report`
--
ALTER TABLE `birth_report`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blood_bank_status`
--
ALTER TABLE `blood_bank_status`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `blood_donor`
--
ALTER TABLE `blood_donor`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blood_donor_cycle`
--
ALTER TABLE `blood_donor_cycle`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blood_issue`
--
ALTER TABLE `blood_issue`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `charges`
--
ALTER TABLE `charges`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `charge_categories`
--
ALTER TABLE `charge_categories`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `charge_type_master`
--
ALTER TABLE `charge_type_master`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `complaint`
--
ALTER TABLE `complaint`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `complaint_type`
--
ALTER TABLE `complaint_type`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `conferences`
--
ALTER TABLE `conferences`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `conferences_history`
--
ALTER TABLE `conferences_history`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `conference_staff`
--
ALTER TABLE `conference_staff`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `consultant_register`
--
ALTER TABLE `consultant_register`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `consult_charges`
--
ALTER TABLE `consult_charges`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contents`
--
ALTER TABLE `contents`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `content_for`
--
ALTER TABLE `content_for`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `custom_fields`
--
ALTER TABLE `custom_fields`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `custom_field_values`
--
ALTER TABLE `custom_field_values`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `death_report`
--
ALTER TABLE `death_report`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `diagnosis`
--
ALTER TABLE `diagnosis`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `discharged_summary`
--
ALTER TABLE `discharged_summary`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `discharged_summary_opd`
--
ALTER TABLE `discharged_summary_opd`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dispatch_receive`
--
ALTER TABLE `dispatch_receive`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `email_config`
--
ALTER TABLE `email_config`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `enquiry`
--
ALTER TABLE `enquiry`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `enquiry_type`
--
ALTER TABLE `enquiry_type`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `expense_head`
--
ALTER TABLE `expense_head`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `floor`
--
ALTER TABLE `floor`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `follow_up`
--
ALTER TABLE `follow_up`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `front_cms_media_gallery`
--
ALTER TABLE `front_cms_media_gallery`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `front_cms_menus`
--
ALTER TABLE `front_cms_menus`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `front_cms_menu_items`
--
ALTER TABLE `front_cms_menu_items`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `front_cms_pages`
--
ALTER TABLE `front_cms_pages`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT for table `front_cms_page_contents`
--
ALTER TABLE `front_cms_page_contents`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `front_cms_programs`
--
ALTER TABLE `front_cms_programs`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `front_cms_program_photos`
--
ALTER TABLE `front_cms_program_photos`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `front_cms_settings`
--
ALTER TABLE `front_cms_settings`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `general_calls`
--
ALTER TABLE `general_calls`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `income`
--
ALTER TABLE `income`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `income_head`
--
ALTER TABLE `income_head`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ipd_billing`
--
ALTER TABLE `ipd_billing`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ipd_details`
--
ALTER TABLE `ipd_details`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ipd_prescription_basic`
--
ALTER TABLE `ipd_prescription_basic`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ipd_prescription_details`
--
ALTER TABLE `ipd_prescription_details`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `item`
--
ALTER TABLE `item`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `item_category`
--
ALTER TABLE `item_category`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `item_issue`
--
ALTER TABLE `item_issue`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `item_stock`
--
ALTER TABLE `item_stock`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `item_store`
--
ALTER TABLE `item_store`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `item_supplier`
--
ALTER TABLE `item_supplier`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lab`
--
ALTER TABLE `lab`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;

--
-- AUTO_INCREMENT for table `leave_types`
--
ALTER TABLE `leave_types`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `medicine_bad_stock`
--
ALTER TABLE `medicine_bad_stock`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `medicine_batch_details`
--
ALTER TABLE `medicine_batch_details`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `medicine_category`
--
ALTER TABLE `medicine_category`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `medicine_dosage`
--
ALTER TABLE `medicine_dosage`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notification_roles`
--
ALTER TABLE `notification_roles`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `opd_billing`
--
ALTER TABLE `opd_billing`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `opd_details`
--
ALTER TABLE `opd_details`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `opd_patient_charges`
--
ALTER TABLE `opd_patient_charges`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `opd_payment`
--
ALTER TABLE `opd_payment`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `operation_theatre`
--
ALTER TABLE `operation_theatre`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `organisation`
--
ALTER TABLE `organisation`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `organisations_charges`
--
ALTER TABLE `organisations_charges`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ot_consultant_register`
--
ALTER TABLE `ot_consultant_register`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pathology`
--
ALTER TABLE `pathology`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pathology_category`
--
ALTER TABLE `pathology_category`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pathology_parameter`
--
ALTER TABLE `pathology_parameter`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pathology_parameterdetails`
--
ALTER TABLE `pathology_parameterdetails`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pathology_report`
--
ALTER TABLE `pathology_report`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pathology_report_parameterdetails`
--
ALTER TABLE `pathology_report_parameterdetails`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `patients`
--
ALTER TABLE `patients`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `patient_charges`
--
ALTER TABLE `patient_charges`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `patient_timeline`
--
ALTER TABLE `patient_timeline`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_settings`
--
ALTER TABLE `payment_settings`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `payslip_allowance`
--
ALTER TABLE `payslip_allowance`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permission_category`
--
ALTER TABLE `permission_category`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=283;

--
-- AUTO_INCREMENT for table `permission_group`
--
ALTER TABLE `permission_group`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `pharmacy`
--
ALTER TABLE `pharmacy`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pharmacy_bill_basic`
--
ALTER TABLE `pharmacy_bill_basic`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pharmacy_bill_detail`
--
ALTER TABLE `pharmacy_bill_detail`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `prescription`
--
ALTER TABLE `prescription`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `print_setting`
--
ALTER TABLE `print_setting`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `radio`
--
ALTER TABLE `radio`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `radiology_parameter`
--
ALTER TABLE `radiology_parameter`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `radiology_parameterdetails`
--
ALTER TABLE `radiology_parameterdetails`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `radiology_report`
--
ALTER TABLE `radiology_report`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `radiology_report_parameterdetails`
--
ALTER TABLE `radiology_report_parameterdetails`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `read_notification`
--
ALTER TABLE `read_notification`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `read_systemnotification`
--
ALTER TABLE `read_systemnotification`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `roles_permissions`
--
ALTER TABLE `roles_permissions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1359;

--
-- AUTO_INCREMENT for table `send_notification`
--
ALTER TABLE `send_notification`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sms_config`
--
ALTER TABLE `sms_config`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `source`
--
ALTER TABLE `source`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `specialist`
--
ALTER TABLE `specialist`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `staff_attendance`
--
ALTER TABLE `staff_attendance`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `staff_attendance_type`
--
ALTER TABLE `staff_attendance_type`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `staff_designation`
--
ALTER TABLE `staff_designation`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `staff_leave_details`
--
ALTER TABLE `staff_leave_details`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `staff_leave_request`
--
ALTER TABLE `staff_leave_request`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `staff_payroll`
--
ALTER TABLE `staff_payroll`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `staff_payslip`
--
ALTER TABLE `staff_payslip`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `staff_roles`
--
ALTER TABLE `staff_roles`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `staff_timeline`
--
ALTER TABLE `staff_timeline`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subscription`
--
ALTER TABLE `subscription`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `subscription_plans`
--
ALTER TABLE `subscription_plans`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `supplier_bill_basic`
--
ALTER TABLE `supplier_bill_basic`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `supplier_bill_detail`
--
ALTER TABLE `supplier_bill_detail`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `supplier_category`
--
ALTER TABLE `supplier_category`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `symptoms`
--
ALTER TABLE `symptoms`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `symptoms_classification`
--
ALTER TABLE `symptoms_classification`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `system_notification`
--
ALTER TABLE `system_notification`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `test_type_report`
--
ALTER TABLE `test_type_report`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tpa_doctorcharges`
--
ALTER TABLE `tpa_doctorcharges`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tpa_master`
--
ALTER TABLE `tpa_master`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `unit`
--
ALTER TABLE `unit`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `userlog`
--
ALTER TABLE `userlog`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users_authentication`
--
ALTER TABLE `users_authentication`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vehicles`
--
ALTER TABLE `vehicles`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `visitors_book`
--
ALTER TABLE `visitors_book`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `visitors_purpose`
--
ALTER TABLE `visitors_purpose`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `visit_details`
--
ALTER TABLE `visit_details`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `zoom_settings`
--
ALTER TABLE `zoom_settings`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `content_for`
--
ALTER TABLE `content_for`
  ADD CONSTRAINT `content_for_ibfk_1` FOREIGN KEY (`content_id`) REFERENCES `contents` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `content_for_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `front_cms_page_contents`
--
ALTER TABLE `front_cms_page_contents`
  ADD CONSTRAINT `front_cms_page_contents_ibfk_1` FOREIGN KEY (`page_id`) REFERENCES `front_cms_pages` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `front_cms_program_photos`
--
ALTER TABLE `front_cms_program_photos`
  ADD CONSTRAINT `front_cms_program_photos_ibfk_1` FOREIGN KEY (`program_id`) REFERENCES `front_cms_programs` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `item_issue`
--
ALTER TABLE `item_issue`
  ADD CONSTRAINT `item_issue_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `item_issue_ibfk_2` FOREIGN KEY (`item_category_id`) REFERENCES `item_category` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `item_stock`
--
ALTER TABLE `item_stock`
  ADD CONSTRAINT `item_stock_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `item_stock_ibfk_2` FOREIGN KEY (`supplier_id`) REFERENCES `item_supplier` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `item_stock_ibfk_3` FOREIGN KEY (`store_id`) REFERENCES `item_store` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `notification_roles`
--
ALTER TABLE `notification_roles`
  ADD CONSTRAINT `notification_roles_ibfk_1` FOREIGN KEY (`send_notification_id`) REFERENCES `send_notification` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `notification_roles_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- Smart Hospital DB
-- version 3.1
-- https://smart-hospital.in
-- https://qdocs.in
-- Total tables: 140


SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

-- --------------------------------------------------------

--
-- Table structure for table `ambulance_call`
--

CREATE TABLE `ambulance_call` (
  `id` int(11) NOT NULL,
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
  `generated_by` int(11) NOT NULL,
  `call_from` varchar(200) NOT NULL,
  `call_to` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

CREATE TABLE `appointment` (
  `id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `appoint_priority`
--

CREATE TABLE `appoint_priority` (
  `id` int(11) NOT NULL,
  `appoint_priority` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `appoint_priority`
--

INSERT INTO `appoint_priority` (`id`, `appoint_priority`, `created_at`) VALUES
(1, 'Normal', '0000-00-00 00:00:00'),
(2, 'Urgent', '0000-00-00 00:00:00'),
(3, 'Very Urgent', '0000-00-00 00:00:00'),
(4, 'Low', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `bed`
--

CREATE TABLE `bed` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `bed_type_id` int(11) NOT NULL,
  `bed_group_id` int(100) NOT NULL,
  `is_active` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bed_group`
--

CREATE TABLE `bed_group` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `description` varchar(200) NOT NULL,
  `floor` varchar(100) NOT NULL,
  `is_active` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bed_type`
--

CREATE TABLE `bed_type` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `birth_report`
--

CREATE TABLE `birth_report` (
  `id` int(11) NOT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `blood_bank_status`
--

CREATE TABLE `blood_bank_status` (
  `id` int(11) NOT NULL,
  `blood_group` varchar(3) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `ceated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  `id` int(11) NOT NULL,
  `donor_name` varchar(100) DEFAULT NULL,
  `age` varchar(11) DEFAULT NULL,
  `month` varchar(20) DEFAULT NULL,
  `blood_group` varchar(11) DEFAULT NULL,
  `gender` varchar(11) DEFAULT NULL,
  `father_name` varchar(100) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `contact_no` varchar(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `blood_donor_cycle`
--

CREATE TABLE `blood_donor_cycle` (
  `id` int(11) NOT NULL,
  `blood_donor_id` int(11) NOT NULL,
  `institution` varchar(100) DEFAULT NULL,
  `lot` varchar(11) DEFAULT NULL,
  `bag_no` varchar(11) DEFAULT NULL,
  `quantity` varchar(11) DEFAULT NULL,
  `donate_date` date NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `blood_issue`
--

CREATE TABLE `blood_issue` (
  `id` int(11) NOT NULL,
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
  `generated_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `charges`
--

CREATE TABLE `charges` (
  `id` int(11) NOT NULL,
  `charge_type` varchar(200) NOT NULL,
  `charge_category` varchar(200) NOT NULL,
  `description` varchar(200) NOT NULL,
  `code` varchar(100) NOT NULL,
  `standard_charge` varchar(200) NOT NULL,
  `date` date NOT NULL,
  `status` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `charge_categories`
--

CREATE TABLE `charge_categories` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `description` varchar(200) NOT NULL,
  `charge_type` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `charge_type_master`
--

CREATE TABLE `charge_type_master` (
  `id` int(11) NOT NULL,
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
  `id` int(11) NOT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `complaint_type`
--

CREATE TABLE `complaint_type` (
  `id` int(11) NOT NULL,
  `complaint_type` varchar(100) NOT NULL,
  `description` mediumtext NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `conferences`
--

CREATE TABLE `conferences` (
  `id` int(11) NOT NULL,
  `purpose` varchar(200) CHARACTER SET utf8 NOT NULL,
  `staff_id` int(11) DEFAULT NULL,
  `patient_id` int(11) NOT NULL,
  `opd_id` int(11) NOT NULL,
  `ipd_id` int(11) NOT NULL,
  `created_id` int(11) DEFAULT NULL,
  `title` text CHARACTER SET utf8 NOT NULL,
  `date` datetime NOT NULL,
  `duration` int(11) NOT NULL,
  `password` varchar(100) CHARACTER SET utf8 NOT NULL,
  `host_video` int(11) NOT NULL,
  `client_video` int(11) NOT NULL,
  `description` varchar(100) CHARACTER SET utf8 NOT NULL,
  `timezone` varchar(100) CHARACTER SET utf8 NOT NULL,
  `return_response` text NOT NULL,
  `api_type` varchar(50) CHARACTER SET utf8 NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `conferences_history`
--

CREATE TABLE `conferences_history` (
  `id` int(11) NOT NULL,
  `conference_id` int(11) NOT NULL,
  `staff_id` int(11) NOT NULL,
  `patient_id` int(11) DEFAULT NULL,
  `total_hit` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `conference_staff`
--

CREATE TABLE `conference_staff` (
  `id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `conference_id` int(11) NOT NULL,
  `staff_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `consultant_register`
--

CREATE TABLE `consultant_register` (
  `id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `ipd_id` int(11) NOT NULL,
  `date` varchar(100) DEFAULT NULL,
  `ins_date` varchar(50) DEFAULT NULL,
  `instruction` varchar(200) NOT NULL,
  `cons_doctor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `consult_charges`
--

CREATE TABLE `consult_charges` (
  `id` int(11) NOT NULL,
  `doctor` int(11) NOT NULL,
  `standard_charge` varchar(200) NOT NULL,
  `date` date NOT NULL,
  `status` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `contents`
--

CREATE TABLE `contents` (
  `id` int(11) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `is_public` varchar(10) DEFAULT 'No',
  `class_id` int(11) DEFAULT NULL,
  `cls_sec_id` int(10) NOT NULL,
  `file` varchar(250) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `note` text,
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `content_for`
--

CREATE TABLE `content_for` (
  `id` int(11) NOT NULL,
  `role` varchar(50) DEFAULT NULL,
  `content_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `custom_fields`
--

CREATE TABLE `custom_fields` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `belong_to` varchar(100) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `bs_column` int(10) DEFAULT NULL,
  `validation` int(11) DEFAULT '0',
  `field_values` mediumtext,
  `show_table` varchar(100) DEFAULT NULL,
  `visible_on_table` int(11) NOT NULL,
  `weight` int(11) DEFAULT NULL,
  `is_active` int(11) DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `custom_field_values`
--

CREATE TABLE `custom_field_values` (
  `id` int(11) NOT NULL,
  `belong_table_id` int(11) DEFAULT NULL,
  `custom_field_id` int(11) DEFAULT NULL,
  `field_value` varchar(200) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `death_report`
--

CREATE TABLE `death_report` (
  `id` int(11) NOT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `id` int(11) NOT NULL,
  `department_name` varchar(200) NOT NULL,
  `is_active` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `diagnosis`
--

CREATE TABLE `diagnosis` (
  `id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `report_type` varchar(200) NOT NULL,
  `document` varchar(200) NOT NULL,
  `description` varchar(400) NOT NULL,
  `report_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `discharged_summary`
--

CREATE TABLE `discharged_summary` (
  `id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `ipd_id` int(11) NOT NULL,
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
  `id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `opd_id` int(11) NOT NULL,
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
  `id` int(11) NOT NULL,
  `reference_no` varchar(50) NOT NULL,
  `to_title` varchar(100) NOT NULL,
  `address` varchar(500) NOT NULL,
  `note` varchar(500) NOT NULL,
  `from_title` varchar(200) NOT NULL,
  `date` varchar(20) NOT NULL,
  `image` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `type` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `email_config`
--

CREATE TABLE `email_config` (
  `id` int(11) UNSIGNED NOT NULL,
  `email_type` varchar(100) DEFAULT NULL,
  `smtp_server` varchar(100) DEFAULT NULL,
  `smtp_port` varchar(100) DEFAULT NULL,
  `smtp_username` varchar(100) DEFAULT NULL,
  `smtp_password` varchar(100) DEFAULT NULL,
  `ssl_tls` varchar(100) DEFAULT NULL,
  `is_active` varchar(10) NOT NULL DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `email_config`
--

INSERT INTO `email_config` (`id`, `email_type`, `smtp_server`, `smtp_port`, `smtp_username`, `smtp_password`, `ssl_tls`, `is_active`, `created_at`) VALUES
(2, 'sendmail', '', '', '', '', '', 'yes', '2019-11-01 12:51:35');

-- --------------------------------------------------------

--
-- Table structure for table `enquiry`
--

CREATE TABLE `enquiry` (
  `id` int(11) NOT NULL,
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
  `class` int(11) NOT NULL,
  `no_of_child` varchar(11) DEFAULT NULL,
  `status` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `enquiry_type`
--

CREATE TABLE `enquiry_type` (
  `id` int(11) NOT NULL,
  `enquiry_type` varchar(100) NOT NULL,
  `description` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` int(11) NOT NULL,
  `event_title` varchar(200) NOT NULL,
  `event_description` varchar(300) NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `event_type` varchar(100) NOT NULL,
  `event_color` varchar(200) NOT NULL,
  `event_for` varchar(100) NOT NULL,
  `role_id` int(11) NOT NULL,
  `is_active` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `id` int(11) NOT NULL,
  `exp_head_id` int(11) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `invoice_no` varchar(200) NOT NULL,
  `date` date DEFAULT NULL,
  `amount` decimal(15,2) DEFAULT NULL,
  `documents` varchar(255) DEFAULT NULL,
  `note` text,
  `is_active` varchar(255) DEFAULT 'yes',
  `is_deleted` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `expense_head`
--

CREATE TABLE `expense_head` (
  `id` int(11) NOT NULL,
  `exp_category` varchar(50) DEFAULT NULL,
  `description` text,
  `is_active` varchar(255) DEFAULT 'yes',
  `is_deleted` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `floor`
--

CREATE TABLE `floor` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `follow_up`
--

CREATE TABLE `follow_up` (
  `id` int(11) NOT NULL,
  `enquiry_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `next_date` date NOT NULL,
  `response` text NOT NULL,
  `note` text NOT NULL,
  `followup_by` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `front_cms_media_gallery`
--

CREATE TABLE `front_cms_media_gallery` (
  `id` int(11) NOT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `front_cms_menus`
--

CREATE TABLE `front_cms_menus` (
  `id` int(11) NOT NULL,
  `menu` varchar(100) DEFAULT NULL,
  `slug` varchar(200) DEFAULT NULL,
  `description` mediumtext,
  `open_new_tab` int(10) NOT NULL DEFAULT '0',
  `ext_url` mediumtext NOT NULL,
  `ext_url_link` mediumtext NOT NULL,
  `publish` int(11) NOT NULL DEFAULT '0',
  `content_type` varchar(10) NOT NULL DEFAULT 'manual',
  `is_active` varchar(10) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `front_cms_menus`
--

INSERT INTO `front_cms_menus` (`id`, `menu`, `slug`, `description`, `open_new_tab`, `ext_url`, `ext_url_link`, `publish`, `content_type`, `is_active`, `created_at`) VALUES
(1, 'Main Menu', 'main-menu', 'Main menu', 0, '', '', 0, 'default', 'no', '2018-04-20 09:24:49'),
(2, 'Bottom Menu', 'bottom-menu', 'Bottom Menu', 0, '', '', 0, 'default', 'no', '2018-04-20 09:24:55');

-- --------------------------------------------------------

--
-- Table structure for table `front_cms_menu_items`
--

CREATE TABLE `front_cms_menu_items` (
  `id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `menu` varchar(100) DEFAULT NULL,
  `page_id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `ext_url` mediumtext,
  `open_new_tab` int(11) DEFAULT '0',
  `ext_url_link` mediumtext,
  `slug` varchar(200) DEFAULT NULL,
  `weight` int(11) DEFAULT NULL,
  `publish` int(11) NOT NULL DEFAULT '0',
  `description` mediumtext,
  `is_active` varchar(10) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `front_cms_menu_items`
--

INSERT INTO `front_cms_menu_items` (`id`, `menu_id`, `menu`, `page_id`, `parent_id`, `ext_url`, `open_new_tab`, `ext_url_link`, `slug`, `weight`, `publish`, `description`, `is_active`, `created_at`) VALUES
(16, 2, 'Home', 1, 0, NULL, NULL, NULL, 'home-1', NULL, 0, NULL, 'no', '2018-07-14 08:44:12'),
(23, 1, 'Appointment', 77, 0, '1', NULL, 'http://yourdomainname.com/form/appointment', 'appointment', 2, 0, NULL, 'no', '2019-11-01 07:36:32'),
(26, 1, 'Home', 1, 0, NULL, NULL, NULL, 'home', NULL, 0, NULL, 'no', '2019-01-24 08:48:17'),
(27, 2, 'Appointment', 0, 0, '1', NULL, 'http://yourdomainname.com/form/appointment', 'appointment-1', NULL, 0, NULL, 'no', '2019-11-02 16:24:41');

-- --------------------------------------------------------

--
-- Table structure for table `front_cms_pages`
--

CREATE TABLE `front_cms_pages` (
  `id` int(11) NOT NULL,
  `page_type` varchar(10) NOT NULL DEFAULT 'manual',
  `is_homepage` int(1) DEFAULT '0',
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
  `publish` int(10) DEFAULT '0',
  `sidebar` int(10) DEFAULT '0',
  `is_active` varchar(10) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `front_cms_pages`
--

INSERT INTO `front_cms_pages` (`id`, `page_type`, `is_homepage`, `title`, `url`, `type`, `slug`, `meta_title`, `meta_description`, `meta_keyword`, `feature_image`, `description`, `publish_date`, `publish`, `sidebar`, `is_active`, `created_at`) VALUES
(1, 'default', 1, 'Home', 'page/home', 'page', 'home', '', '', '', '', '<p>Home page</p>', '0000-00-00', 1, 1, 'no', '2019-01-24 08:33:59'),
(2, 'default', 0, 'Complain', 'page/complain', 'page', 'complain', 'Complain form', '                                                                                                                                                                                    complain form                                                                                                                                                                                                                                ', 'complain form', '', '<div class="col-md-12 col-sm-12">\r\n<h2 class="text-center">&nbsp;</h2>\r\n\r\n<p class="text-center">[form-builder:complain]</p>\r\n</div>', '0000-00-00', 1, 1, 'no', '2019-01-24 08:30:12'),
(54, 'default', 0, '404 page', 'page/404-page', 'page', '404-page', '', '                                ', '', '', '<html>\r\n<head>\r\n <title></title>\r\n</head>\r\n<body>\r\n<p>404 page found</p>\r\n</body>\r\n</html>', '0000-00-00', 0, NULL, 'no', '2018-05-18 09:16:04'),
(76, 'default', 0, 'Contact us', 'page/contact-us', 'page', 'contact-us', '', '', '', '', '<p>[form-builder:contact_us]</p>', '0000-00-00', 0, NULL, 'no', '2019-01-24 08:31:58'),
(77, 'manual', 0, 'our-appointment', 'page/our-appointment', 'page', 'our-appointment', '', '', '', '', '<form action="welcome/appointment" method="get">\r\n  First name: <input type="text" name="fname"><br>\r\n  Last name: <input type="text" name="lname"><br>\r\n  <input type="submit" value="Submit">\r\n</form>', '0000-00-00', 0, 1, 'no', '2019-11-01 07:32:48');

-- --------------------------------------------------------

--
-- Table structure for table `front_cms_page_contents`
--

CREATE TABLE `front_cms_page_contents` (
  `id` int(11) NOT NULL,
  `page_id` int(11) DEFAULT NULL,
  `content_type` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `front_cms_programs`
--

CREATE TABLE `front_cms_programs` (
  `id` int(11) NOT NULL,
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
  `sidebar` int(10) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `front_cms_program_photos`
--

CREATE TABLE `front_cms_program_photos` (
  `id` int(11) NOT NULL,
  `program_id` int(11) DEFAULT NULL,
  `media_gallery_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `front_cms_settings`
--

CREATE TABLE `front_cms_settings` (
  `id` int(11) NOT NULL,
  `theme` varchar(50) DEFAULT NULL,
  `is_active_rtl` int(10) DEFAULT '0',
  `is_active_front_cms` int(11) DEFAULT '0',
  `is_active_sidebar` int(1) DEFAULT '0',
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `front_cms_settings`
--

INSERT INTO `front_cms_settings` (`id`, `theme`, `is_active_rtl`, `is_active_front_cms`, `is_active_sidebar`, `logo`, `contact_us_email`, `complain_form_email`, `sidebar_options`, `fb_url`, `twitter_url`, `youtube_url`, `google_plus`, `instagram_url`, `pinterest_url`, `linkedin_url`, `google_analytics`, `footer_text`, `fav_icon`, `created_at`) VALUES
(1, 'default', NULL, 0, 0, '', '', '', '["news","complain"]', '', '', '', '', '', '', '', '', '', '', '2019-11-02 16:23:38');

-- --------------------------------------------------------

--
-- Table structure for table `general_calls`
--

CREATE TABLE `general_calls` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `contact` varchar(12) NOT NULL,
  `date` date NOT NULL,
  `description` varchar(500) NOT NULL,
  `follow_up_date` date NOT NULL,
  `call_dureation` varchar(50) NOT NULL,
  `note` mediumtext NOT NULL,
  `call_type` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `income`
--

CREATE TABLE `income` (
  `id` int(11) NOT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `income_head`
--

CREATE TABLE `income_head` (
  `id` int(255) NOT NULL,
  `income_category` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `is_active` varchar(255) NOT NULL DEFAULT 'yes',
  `is_deleted` varchar(255) NOT NULL DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ipd_billing`
--

CREATE TABLE `ipd_billing` (
  `id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `ipd_id` int(11) NOT NULL,
  `discount` int(11) NOT NULL,
  `other_charge` varchar(200) NOT NULL,
  `date` date NOT NULL,
  `tax` decimal(15,2) NOT NULL,
  `gross_total` decimal(15,2) NOT NULL,
  `net_amount` decimal(15,2) NOT NULL,
  `total_amount` decimal(15,2) NOT NULL,
  `generated_by` int(11) NOT NULL,
  `status` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ipd_details`
--

CREATE TABLE `ipd_details` (
  `id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
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
  `cons_doctor` int(11) NOT NULL,
  `amount` varchar(100) NOT NULL,
  `credit_limit` varchar(100) NOT NULL,
  `tax` varchar(100) NOT NULL,
  `payment_mode` varchar(100) NOT NULL,
  `date` datetime NOT NULL,
  `discharged` varchar(200) NOT NULL,
  `discharged_date` date NOT NULL,
  `live_consult` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ipd_prescription_basic`
--

CREATE TABLE `ipd_prescription_basic` (
  `id` int(11) NOT NULL,
  `ipd_id` int(11) NOT NULL,
  `header_note` varchar(100) NOT NULL,
  `footer_note` varchar(100) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ipd_prescription_details`
--

CREATE TABLE `ipd_prescription_details` (
  `id` int(11) NOT NULL,
  `basic_id` int(11) NOT NULL,
  `ipd_id` int(11) NOT NULL,
  `medicine_category_id` int(11) NOT NULL,
  `medicine` varchar(200) NOT NULL,
  `dosage` varchar(200) NOT NULL,
  `instruction` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE `item` (
  `id` int(11) NOT NULL,
  `item_category_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `unit` varchar(200) NOT NULL,
  `item_photo` varchar(225) DEFAULT NULL,
  `description` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `item_store_id` int(11) DEFAULT NULL,
  `item_supplier_id` int(11) DEFAULT NULL,
  `quantity` int(100) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `item_category`
--

CREATE TABLE `item_category` (
  `id` int(255) NOT NULL,
  `item_category` varchar(255) NOT NULL,
  `is_active` varchar(255) NOT NULL DEFAULT 'yes',
  `description` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `item_issue`
--

CREATE TABLE `item_issue` (
  `id` int(11) NOT NULL,
  `issue_type` varchar(15) DEFAULT NULL,
  `issue_to` varchar(100) DEFAULT NULL,
  `issue_by` varchar(100) DEFAULT NULL,
  `issue_date` date DEFAULT NULL,
  `return_date` date DEFAULT NULL,
  `item_category_id` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `quantity` int(10) NOT NULL,
  `note` text NOT NULL,
  `is_returned` int(2) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_active` varchar(10) DEFAULT 'no'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `item_stock`
--

CREATE TABLE `item_stock` (
  `id` int(11) NOT NULL,
  `item_id` int(11) DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `symbol` varchar(10) NOT NULL DEFAULT '+',
  `store_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `purchase_price` varchar(200) NOT NULL,
  `date` date NOT NULL,
  `attachment` varchar(250) DEFAULT NULL,
  `description` text NOT NULL,
  `is_active` varchar(10) DEFAULT 'yes',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `item_store`
--

CREATE TABLE `item_store` (
  `id` int(255) NOT NULL,
  `item_store` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `item_supplier`
--

CREATE TABLE `item_supplier` (
  `id` int(255) NOT NULL,
  `item_supplier` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `contact_person_name` varchar(255) NOT NULL,
  `contact_person_phone` varchar(255) NOT NULL,
  `contact_person_email` varchar(255) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `lab`
--

CREATE TABLE `lab` (
  `id` int(11) NOT NULL,
  `lab_name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` int(11) NOT NULL,
  `language` varchar(50) DEFAULT NULL,
  `short_code` varchar(255) NOT NULL,
  `country_code` varchar(255) NOT NULL,
  `is_deleted` varchar(10) NOT NULL DEFAULT 'yes',
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Azerbaijan', 'az', 'az', 'no', 'no', '2019-11-20 11:23:12', '0000-00-00'),
(2, 'Albanian', 'sq', 'al', 'no', 'no', '2019-11-20 11:42:42', '0000-00-00'),
(3, 'Amharic', 'am', 'am', 'no', 'no', '2019-11-20 11:24:23', '0000-00-00'),
(4, 'English', 'en', 'us', 'no', 'no', '2019-11-20 11:38:50', '0000-00-00'),
(5, 'Arabic', 'ar', 'sa', 'no', 'no', '2019-11-20 11:47:28', '0000-00-00'),
(7, 'Afrikaans', 'af', 'af', 'no', 'no', '2019-11-20 11:24:23', '0000-00-00'),
(8, 'Basque', 'eu', 'es', 'no', 'no', '2019-11-20 11:54:10', '0000-00-00'),
(11, 'Bengali', 'bn', 'in', 'no', 'no', '2019-11-20 11:41:53', '0000-00-00'),
(13, 'Bosnian', 'bs', 'bs', 'no', 'no', '2019-11-20 11:24:23', '0000-00-00'),
(14, 'Welsh', 'cy', 'cy', 'no', 'no', '2019-11-20 11:24:23', '0000-00-00'),
(15, 'Hungarian', 'hu', 'hu', 'no', 'no', '2019-11-20 11:24:23', '0000-00-00'),
(16, 'Vietnamese', 'vi', 'vi', 'no', 'no', '2019-11-20 11:24:23', '0000-00-00'),
(17, 'Haitian', 'ht', 'ht', 'no', 'no', '2019-11-20 11:24:23', '0000-00-00'),
(18, 'Galician', 'gl', 'gl', 'no', 'no', '2019-11-20 11:24:23', '0000-00-00'),
(19, 'Dutch', 'nl', 'nl', 'no', 'no', '2019-11-20 11:24:23', '0000-00-00'),
(21, 'Greek', 'el', 'gr', 'no', 'no', '2019-11-20 12:12:08', '0000-00-00'),
(22, 'Georgian', 'ka', 'ge', 'no', 'no', '2019-11-20 12:11:40', '0000-00-00'),
(23, 'Gujarati', 'gu', 'in', 'no', 'no', '2019-11-20 11:39:16', '0000-00-00'),
(24, 'Danish', 'da', 'dk', 'no', 'no', '2019-11-20 12:03:25', '0000-00-00'),
(25, 'Hebrew', 'he', 'il', 'no', 'no', '2019-11-20 12:13:50', '0000-00-00'),
(26, 'Yiddish', 'yi', 'il', 'no', 'no', '2019-11-20 12:25:33', '0000-00-00'),
(27, 'Indonesian', 'id', 'id', 'no', 'no', '2019-11-20 11:24:23', '0000-00-00'),
(28, 'Irish', 'ga', 'ga', 'no', 'no', '2019-11-20 11:24:23', '0000-00-00'),
(29, 'Italian', 'it', 'it', 'no', 'no', '2019-11-20 11:24:23', '0000-00-00'),
(30, 'Icelandic', 'is', 'is', 'no', 'no', '2019-11-20 11:24:23', '0000-00-00'),
(31, 'Spanish', 'es', 'es', 'no', 'no', '2019-11-20 11:24:23', '0000-00-00'),
(33, 'Kannada', 'kn', 'kn', 'no', 'no', '2019-11-20 11:24:23', '0000-00-00'),
(34, 'Catalan', 'ca', 'ca', 'no', 'no', '2019-11-20 11:24:23', '0000-00-00'),
(36, 'Chinese', 'zh', 'cn', 'no', 'no', '2019-11-20 12:01:48', '0000-00-00'),
(37, 'Korean', 'ko', 'kr', 'no', 'no', '2019-11-20 12:19:09', '0000-00-00'),
(38, 'Xhosa', 'xh', 'ls', 'no', 'no', '2019-11-20 12:24:39', '0000-00-00'),
(39, 'Latin', 'la', 'la', 'no', 'no', '2019-11-20 11:24:23', '0000-00-00'),
(40, 'Latvian', 'lv', 'lv', 'no', 'no', '2019-11-20 11:24:23', '0000-00-00'),
(41, 'Lithuanian', 'lt', 'lt', 'no', 'no', '2019-11-20 11:24:23', '0000-00-00'),
(43, 'Malagasy', 'mg', 'mg', 'no', 'no', '2019-11-20 11:24:23', '0000-00-00'),
(44, 'Malay', 'ms', 'ms', 'no', 'no', '2019-11-20 11:24:23', '0000-00-00'),
(45, 'Malayalam', 'ml', 'ml', 'no', 'no', '2019-11-20 11:24:23', '0000-00-00'),
(46, 'Maltese', 'mt', 'mt', 'no', 'no', '2019-11-20 11:24:23', '0000-00-00'),
(47, 'Macedonian', 'mk', 'mk', 'no', 'no', '2019-11-20 11:24:23', '0000-00-00'),
(48, 'Maori', 'mi', 'nz', 'no', 'no', '2019-11-20 12:20:27', '0000-00-00'),
(49, 'Marathi', 'mr', 'in', 'no', 'no', '2019-11-20 11:39:51', '0000-00-00'),
(51, 'Mongolian', 'mn', 'mn', 'no', 'no', '2019-11-20 11:24:23', '0000-00-00'),
(52, 'German', 'de', 'de', 'no', 'no', '2019-11-20 11:24:23', '0000-00-00'),
(53, 'Nepali', 'ne', 'ne', 'no', 'no', '2019-11-20 11:24:23', '0000-00-00'),
(54, 'Norwegian', 'no', 'no', 'no', 'no', '2019-11-20 11:24:23', '0000-00-00'),
(55, 'Punjabi', 'pa', 'in', 'no', 'no', '2019-11-20 11:40:16', '0000-00-00'),
(57, 'Persian', 'fa', 'ir', 'no', 'no', '2019-11-20 12:21:17', '0000-00-00'),
(59, 'Portuguese', 'pt', 'pt', 'no', 'no', '2019-11-20 11:24:23', '0000-00-00'),
(60, 'Romanian', 'ro', 'ro', 'no', 'no', '2019-11-20 11:24:23', '0000-00-00'),
(61, 'Russian', 'ru', 'ru', 'no', 'no', '2019-11-20 11:24:23', '0000-00-00'),
(62, 'Cebuano', 'ceb', 'ph', 'no', 'no', '2019-11-20 11:59:12', '0000-00-00'),
(64, 'Sinhala', 'si', 'si', 'no', 'no', '2019-11-20 11:24:23', '0000-00-00'),
(65, 'Slovakian', 'sk', 'sk', 'no', 'no', '2019-11-20 11:24:23', '0000-00-00'),
(66, 'Slovenian', 'sl', 'sl', 'no', 'no', '2019-11-20 11:24:23', '0000-00-00'),
(67, 'Swahili', 'sw', 'ke', 'no', 'no', '2019-11-20 12:21:57', '0000-00-00'),
(68, 'Sundanese', 'su', 'sd', 'no', 'no', '2019-12-03 11:06:57', '0000-00-00'),
(70, 'Thai', 'th', 'th', 'no', 'no', '2019-11-20 11:24:23', '0000-00-00'),
(71, 'Tagalog', 'tl', 'tl', 'no', 'no', '2019-11-20 11:24:23', '0000-00-00'),
(72, 'Tamil', 'ta', 'in', 'no', 'no', '2019-11-20 11:40:53', '0000-00-00'),
(74, 'Telugu', 'te', 'in', 'no', 'no', '2019-11-20 11:41:15', '0000-00-00'),
(75, 'Turkish', 'tr', 'tr', 'no', 'no', '2019-11-20 11:24:23', '0000-00-00'),
(77, 'Uzbek', 'uz', 'uz', 'no', 'no', '2019-11-20 11:24:23', '0000-00-00'),
(79, 'Urdu', 'ur', 'pk', 'no', 'no', '2019-11-20 12:23:57', '0000-00-00'),
(80, 'Finnish', 'fi', 'fi', 'no', 'no', '2019-11-20 11:24:23', '0000-00-00'),
(81, 'French', 'fr', 'fr', 'no', 'no', '2019-11-20 11:24:23', '0000-00-00'),
(82, 'Hindi', 'hi', 'in', 'no', 'no', '2019-11-20 11:36:34', '0000-00-00'),
(84, 'Czech', 'cs', 'cz', 'no', 'no', '2019-11-20 12:02:36', '0000-00-00'),
(85, 'Swedish', 'sv', 'sv', 'no', 'no', '2019-11-20 11:24:23', '0000-00-00'),
(86, 'Scottish', 'gd', 'gd', 'no', 'no', '2019-11-20 11:24:23', '0000-00-00'),
(87, 'Estonian', 'et', 'et', 'no', 'no', '2019-11-20 11:24:23', '0000-00-00'),
(88, 'Esperanto', 'eo', 'br', 'no', 'no', '2019-11-21 04:49:18', '0000-00-00'),
(89, 'Javanese', 'jv', 'id', 'no', 'no', '2019-11-20 12:18:29', '0000-00-00'),
(90, 'Japanese', 'ja', 'jp', 'no', 'no', '2019-11-20 12:14:39', '0000-00-00'),
(91, 'Polish', 'pl', 'pl', 'yes', 'no', '2020-04-05 14:09:04', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `leave_types`
--

CREATE TABLE `leave_types` (
  `id` int(11) NOT NULL,
  `type` varchar(200) NOT NULL,
  `is_active` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `medicine_bad_stock`
--

CREATE TABLE `medicine_bad_stock` (
  `id` int(11) NOT NULL,
  `pharmacy_id` int(11) NOT NULL,
  `outward_date` date NOT NULL,
  `expiry_date` varchar(200) NOT NULL,
  `batch_no` varchar(200) NOT NULL,
  `quantity` varchar(200) NOT NULL,
  `note` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `medicine_batch_details`
--

CREATE TABLE `medicine_batch_details` (
  `id` int(11) NOT NULL,
  `supplier_bill_basic_id` varchar(100) NOT NULL,
  `medicine_category_id` varchar(200) NOT NULL,
  `pharmacy_id` int(100) NOT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `medicine_category`
--

CREATE TABLE `medicine_category` (
  `id` int(11) NOT NULL,
  `medicine_category` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `medicine_dosage`
--

CREATE TABLE `medicine_dosage` (
  `id` int(11) NOT NULL,
  `medicine_category_id` int(11) NOT NULL,
  `dosage_form` varchar(100) NOT NULL,
  `dosage` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `version` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `notification_roles`
--

CREATE TABLE `notification_roles` (
  `id` int(11) NOT NULL,
  `send_notification_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `is_active` int(11) DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `notification_setting`
--

CREATE TABLE `notification_setting` (
  `id` int(11) NOT NULL,
  `type` varchar(100) DEFAULT NULL,
  `is_mail` int(11) DEFAULT '0',
  `is_sms` int(11) DEFAULT '0',
  `is_mobileapp` int(11) NOT NULL,
  `is_notification` int(11) NOT NULL,
  `display_notification` int(11) NOT NULL,
  `display_sms` int(11) NOT NULL,
  `template` longtext NOT NULL,
  `subject` text NOT NULL,
  `variables` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `notification_setting`
--

INSERT INTO `notification_setting` (`id`, `type`, `is_mail`, `is_sms`, `is_mobileapp`, `is_notification`, `display_notification`, `display_sms`, `template`, `subject`, `variables`, `created_at`) VALUES
(1, 'opd_patient_registration', 1, 0, 0, 0, 1, 1, 'Dear {{patient_name}} your OPD Registration is successful at Hospital Name with Patient Id  {{patient_unique_id}} and OPD No  {{opd_no}}', 'OPD Patient', '{{patient_name}} {{mobileno}} {{email}}  {{dob}} {{gender}}  {{patient_unique_id}}    {{opd_no}}', '2020-11-10 06:59:59'),
(2, 'ipd_patient_registration', 1, 0, 0, 0, 1, 1, 'Dear {{patient_name}} your IPD Registration is successful at Hospital Name with Patient Id  {{patient_unique_id}} and IPD No {{ipd_no}}', 'IPD Patient', '{{patient_name}} {{mobileno}} {{email}}  {{dob}} {{gender}}  {{patient_unique_id}}   {{ipd_no}} ', '2020-11-10 06:59:59'),
(3, 'ipd_patient_discharged', 1, 0, 0, 0, 1, 1, 'IPD Patient {{patient_name}} is now discharged from Hospital Name Total Charges: {{currency_symbol}} {{charge_amount}}  Total payment: {{currency_symbol}} {{paid_amount}} Your net payable bill amount was {{currency_symbol}} {{net_amount}}', 'IPD Discharged Patient', '{{patient_name}} {{mobileno}} {{email}} {{dob}} {{gender}} {{patient_unique_id}} {{currency_symbol}} {{charge_amount}} {{paid_amount}} {{net_amount}}', '2020-11-10 06:59:59'),
(4, 'opd_patient_revisit', 1, 0, 0, 0, 1, 1, 'Dear {{patient_name}} your OPD Registration is successful at Hospital Name with Patient Id  {{patient_unique_id}} and OPD No {{opd_no}}\r\n\r\n{{patient_name}} {{mobileno}} {{email}} {{dob}} {{gender}} {{patient_unique_id}} {{opd_no}}', 'OPD Patient Revisit', '{{patient_name}} {{mobileno}} {{email}}  {{dob}} {{gender}}  {{patient_unique_id}} {{opd_no}} ', '2020-11-10 06:59:59'),
(5, 'login_credential', 1, 0, 0, 0, 0, 1, 'Hello {{display_name}} your login details for Url: {{url}} Username:  {{username}} Password: {{password}} {{email}}', 'Login Patient', '{{display_name}}    {{url}} {{username}} {{password}} {{email}}', '2020-11-10 06:57:09'),
(6, 'appointment_approved', 1, 0, 0, 0, 1, 1, 'Dear {{patient_name}} your appointment with {{staff_name}} {{staff_surname}} is confirmed on {{date}} with appointment no: {{appointment_no}}', 'Appointment Approved', '{{patient_name}} {{mobileno}} {{email}}   {{gender}}    {{staff_name}}\r\n{{staff_surname}}  {{date}} {{appointment_no}}', '2020-11-10 06:59:59'),
(7, 'live_meeting', 1, 0, 0, 0, 0, 1, 'Dear staff, your live meeting {{title}} has been scheduled on {{date}} for the duration of {{duration}} minute, please do not share the link to any body.\r\n\r\n{{title}} {{date}} {{duration}} {{employee_id}} {{department}} {{designation}} {{name}} {{contact_no}} {{email}}', 'Live Meeting', '{{title}} {{date}} {{duration}} {{employee_id}} {{department}} {{designation}} {{name}} {{contact_no}} {{email}}', '2020-11-07 12:55:38'),
(8, 'live_consult', 1, 0, 0, 0, 1, 1, 'Dear patient, your live consultation {{title}} has been scheduled on {{date}} for the duration of {{duration}} minute, please do not share the link to any body.\r\n\r\n{{title}} {{date}} {{duration}}', 'Live Consultation', '{{title}} {{date}} {{duration}}', '2020-11-10 06:59:59'),
(9, 'opd_patient_discharged', 1, 0, 0, 0, 1, 1, 'OPD No {{opd_no}}  {{patient_name}} is now discharged from Hospital Name Your net payable bill amount was {{currency_symbol}}  \r\n {{billing_amount}}\r\n\r\n\r\n{{patient_name}} {{mobileno}} {{email}} {{dob}} {{gender}} {{patient_unique_id}} {{opd_no}} {{currency_symbol}} {{billing_amount}}', 'OPD Discharged Patient', '{{patient_name}} {{mobileno}} {{email}} {{dob}} {{gender}} {{patient_unique_id}} {{opd_no}}{{currency_symbol}} {{billing_amount}}', '2020-11-10 06:59:59'),
(10, 'forgot_password', 1, 0, 0, 0, 0, 0, 'Dear  {{display_name}} , Recently a request was submitted to reset password for your account. If you didn\'t make the request, just ignore this email. Otherwise you can reset your password using this link <a href=\'{{resetpasslink}}\'>Click here to reset your password</a>, if you\'re having trouble clicking the password reset button, copy and paste the URL below into your web browser. {{resetpasslink}} <br> Regards,  <br>\r\n{{site_url}}', 'Password Update Request', '{{display_name}}  {{email}}  {{resetpasslink} {{site_url}}', '2020-11-07 12:54:53');

-- --------------------------------------------------------

--
-- Table structure for table `opd_billing`
--

CREATE TABLE `opd_billing` (
  `id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `opd_id` int(11) NOT NULL,
  `discount` int(11) NOT NULL,
  `other_charge` varchar(200) NOT NULL,
  `date` date NOT NULL,
  `tax` decimal(15,2) NOT NULL,
  `gross_total` decimal(15,2) NOT NULL,
  `net_amount` decimal(15,2) NOT NULL,
  `total_amount` decimal(15,2) NOT NULL,
  `generated_by` int(11) NOT NULL,
  `status` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `opd_details`
--

CREATE TABLE `opd_details` (
  `id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
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
  `cons_doctor` int(11) NOT NULL,
  `amount` decimal(15,2) NOT NULL,
  `tax` decimal(15,2) NOT NULL,
  `payment_mode` varchar(200) NOT NULL,
  `header_note` varchar(200) NOT NULL,
  `footer_note` varchar(200) NOT NULL,
  `generated_by` int(11) NOT NULL,
  `discharged` varchar(200) NOT NULL,
  `live_consult` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `opd_patient_charges`
--

CREATE TABLE `opd_patient_charges` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `patient_id` int(11) NOT NULL,
  `opd_id` int(11) NOT NULL,
  `charge_id` int(11) NOT NULL,
  `org_charge_id` int(11) NOT NULL,
  `apply_charge` decimal(15,2) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `opd_payment`
--

CREATE TABLE `opd_payment` (
  `id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `opd_id` int(11) NOT NULL,
  `paid_amount` decimal(15,2) NOT NULL,
  `balance_amount` decimal(15,2) NOT NULL,
  `total_amount` decimal(15,2) NOT NULL,
  `payment_mode` varchar(100) NOT NULL,
  `note` varchar(200) NOT NULL,
  `date` date NOT NULL,
  `document` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `operation_theatre`
--

CREATE TABLE `operation_theatre` (
  `id` int(11) NOT NULL,
  `bill_no` varchar(200) NOT NULL,
  `patient_id` int(11) NOT NULL,
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
  `generated_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `organisation`
--

CREATE TABLE `organisation` (
  `id` int(11) NOT NULL,
  `organisation_name` varchar(200) NOT NULL,
  `code` varchar(50) NOT NULL,
  `contact_no` varchar(200) NOT NULL,
  `address` varchar(300) NOT NULL,
  `contact_person_name` varchar(200) NOT NULL,
  `contact_person_phone` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `organisations_charges`
--

CREATE TABLE `organisations_charges` (
  `id` int(11) NOT NULL,
  `org_id` int(11) NOT NULL,
  `charge_type` varchar(50) NOT NULL,
  `charge_id` int(11) NOT NULL,
  `org_charge` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ot_consultant_register`
--

CREATE TABLE `ot_consultant_register` (
  `id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `date` varchar(50) NOT NULL,
  `ins_date` date NOT NULL,
  `ins_time` time NOT NULL,
  `instruction` varchar(200) NOT NULL,
  `cons_doctor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pathology`
--

CREATE TABLE `pathology` (
  `id` int(11) NOT NULL,
  `test_name` varchar(100) DEFAULT NULL,
  `short_name` varchar(100) DEFAULT NULL,
  `test_type` varchar(100) DEFAULT NULL,
  `pathology_category_id` varchar(11) NOT NULL,
  `pathology_parameter_id` varchar(100) NOT NULL,
  `unit` varchar(50) NOT NULL,
  `sub_category` varchar(50) NOT NULL,
  `report_days` varchar(50) NOT NULL,
  `method` varchar(50) NOT NULL,
  `charge_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pathology_category`
--

CREATE TABLE `pathology_category` (
  `id` int(11) NOT NULL,
  `category_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pathology_parameter`
--

CREATE TABLE `pathology_parameter` (
  `id` int(11) NOT NULL,
  `parameter_name` varchar(100) CHARACTER SET latin1 NOT NULL,
  `test_value` varchar(100) CHARACTER SET latin1 NOT NULL,
  `reference_range` varchar(100) CHARACTER SET latin1 NOT NULL,
  `gender` varchar(100) NOT NULL,
  `unit` varchar(100) NOT NULL,
  `description` text CHARACTER SET latin1 NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pathology_parameterdetails`
--

CREATE TABLE `pathology_parameterdetails` (
  `id` int(11) NOT NULL,
  `pathology_id` int(11) NOT NULL,
  `parameter_id` int(11) NOT NULL,
  `created_id` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `pathology_report_id` int(11) NOT NULL,
  `pathology_report_value` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pathology_report`
--

CREATE TABLE `pathology_report` (
  `id` int(11) NOT NULL,
  `bill_no` varchar(200) NOT NULL,
  `pathology_id` int(11) NOT NULL,
  `patient_id` varchar(30) DEFAULT NULL,
  `customer_type` varchar(50) DEFAULT NULL,
  `patient_name` varchar(100) DEFAULT NULL,
  `consultant_doctor` varchar(10) NOT NULL,
  `reporting_date` date DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `pathology_report` varchar(255) DEFAULT NULL,
  `apply_charge` decimal(15,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `generated_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pathology_report_parameterdetails`
--

CREATE TABLE `pathology_report_parameterdetails` (
  `id` int(11) NOT NULL,
  `pathology_report_id` int(11) NOT NULL,
  `parameter_id` int(11) NOT NULL,
  `pathology_report_value` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `patients`
--

CREATE TABLE `patients` (
  `id` int(11) NOT NULL,
  `patient_unique_id` int(11) NOT NULL,
  `lang_id` int(11) NOT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `patient_charges`
--

CREATE TABLE `patient_charges` (
  `id` int(11) NOT NULL,
  `date` varchar(50) DEFAULT NULL,
  `patient_id` int(11) DEFAULT NULL,
  `ipd_id` int(11) NOT NULL,
  `charge_id` int(11) DEFAULT NULL,
  `org_charge_id` int(11) DEFAULT NULL,
  `apply_charge` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `patient_timeline`
--

CREATE TABLE `patient_timeline` (
  `id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `timeline_date` date NOT NULL,
  `description` varchar(200) NOT NULL,
  `document` varchar(200) NOT NULL,
  `status` varchar(100) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `ipd_id` int(11) NOT NULL,
  `paid_amount` decimal(15,2) NOT NULL,
  `balance_amount` decimal(15,2) NOT NULL,
  `total_amount` decimal(15,2) NOT NULL,
  `payment_mode` varchar(100) NOT NULL,
  `note` varchar(200) NOT NULL,
  `date` date NOT NULL,
  `document` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `payment_settings`
--

CREATE TABLE `payment_settings` (
  `id` int(11) NOT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `payment_settings`
--

INSERT INTO `payment_settings` (`id`, `payment_type`, `api_username`, `api_secret_key`, `salt`, `api_publishable_key`, `paytm_website`, `paytm_industrytype`, `api_password`, `api_signature`, `api_email`, `paypal_demo`, `account_no`, `is_active`, `created_at`) VALUES
(1, 'pesapal', NULL, '', '', '', '', '', NULL, NULL, NULL, '', '', 'no', '2020-11-04 23:20:40'),
(2, 'ipayafrica', NULL, '', '', '', '', '', NULL, NULL, NULL, '', '', 'no', '2020-11-04 23:20:40');

-- --------------------------------------------------------

--
-- Table structure for table `payslip_allowance`
--

CREATE TABLE `payslip_allowance` (
  `id` int(11) NOT NULL,
  `payslip_id` int(11) NOT NULL,
  `allowance_type` varchar(200) NOT NULL,
  `amount` float NOT NULL,
  `staff_id` int(11) NOT NULL,
  `cal_type` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `permission_category`
--

CREATE TABLE `permission_category` (
  `id` int(11) NOT NULL,
  `perm_group_id` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `short_code` varchar(100) DEFAULT NULL,
  `enable_view` int(11) DEFAULT '0',
  `enable_add` int(11) DEFAULT '0',
  `enable_edit` int(11) DEFAULT '0',
  `enable_delete` int(11) DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `permission_category`
--

INSERT INTO `permission_category` (`id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES
(9, 3, 'Income', 'income', 1, 1, 1, 1, '2018-06-22 10:23:21'),
(10, 3, 'Income Head', 'income_head', 1, 1, 1, 1, '2018-06-22 10:22:44'),
(12, 4, 'Expense', 'expense', 1, 1, 1, 1, '2018-06-22 10:24:06'),
(13, 4, 'Expense Head', 'expense_head', 1, 1, 1, 1, '2018-06-22 10:23:47'),
(27, 8, 'Upload Content', 'upload_content', 1, 1, 0, 1, '2018-06-22 10:33:19'),
(31, 10, 'Issue Item', 'issue_item', 1, 1, 0, 1, '2018-12-17 09:55:14'),
(32, 10, 'Item Stock', 'item_stock', 1, 1, 1, 1, '2018-06-22 10:35:17'),
(33, 10, 'Item', 'item', 1, 1, 1, 1, '2018-06-22 10:35:40'),
(34, 10, 'Store', 'store', 1, 1, 1, 1, '2018-06-22 10:36:02'),
(35, 10, 'Supplier', 'supplier', 1, 1, 1, 1, '2018-06-22 10:36:25'),
(43, 13, 'Notice Board', 'notice_board', 1, 1, 1, 1, '2018-06-22 10:41:17'),
(44, 13, 'Email / SMS', 'email_sms', 1, 0, 0, 0, '2018-06-22 10:40:54'),
(48, 14, 'OPD Report', 'opd_report', 1, 0, 0, 0, '2018-12-18 08:59:18'),
(53, 15, 'Languages', 'languages', 0, 1, 0, 0, '2018-06-22 10:43:18'),
(54, 15, 'General Setting', 'general_setting', 1, 0, 1, 0, '2018-07-05 09:08:35'),
(56, 15, 'Notification Setting', 'notification_setting', 1, 0, 1, 0, '2018-07-05 09:08:41'),
(57, 15, 'SMS Setting', 'sms_setting', 1, 0, 1, 0, '2018-07-05 09:08:47'),
(58, 15, 'Email Setting', 'email_setting', 1, 0, 1, 0, '2018-07-05 09:08:51'),
(59, 15, 'Front CMS Setting', 'front_cms_setting', 1, 0, 1, 0, '2018-07-05 09:08:55'),
(60, 15, 'Payment Methods', 'payment_methods', 1, 0, 1, 0, '2018-07-05 09:08:59'),
(61, 16, 'Menus', 'menus', 1, 1, 0, 1, '2018-07-09 03:50:06'),
(62, 16, 'Media Manager', 'media_manager', 1, 1, 0, 1, '2018-07-09 03:50:26'),
(63, 16, 'Banner Images', 'banner_images', 1, 1, 0, 1, '2018-06-22 10:46:02'),
(64, 16, 'Pages', 'pages', 1, 1, 1, 1, '2018-06-22 10:46:21'),
(65, 16, 'Gallery', 'gallery', 1, 1, 1, 1, '2018-06-22 10:47:02'),
(66, 16, 'Event', 'event', 1, 1, 1, 1, '2018-06-22 10:47:20'),
(67, 16, 'News', 'notice', 1, 1, 1, 1, '2018-07-03 08:39:34'),
(80, 17, 'Visitor Book', 'visitor_book', 1, 1, 1, 1, '2018-06-22 10:48:58'),
(81, 17, 'Phone Call Log', 'phone_call_log', 1, 1, 1, 1, '2018-06-22 10:50:57'),
(82, 17, 'Postal Dispatch', 'postal_dispatch', 1, 1, 1, 1, '2018-06-22 10:50:21'),
(83, 17, 'Postal Receive', 'postal_receive', 1, 1, 1, 1, '2018-06-22 10:50:04'),
(84, 17, 'Complain', 'complain', 1, 1, 1, 1, '2018-12-19 09:11:37'),
(85, 17, 'Setup Front Office', 'setup_front_office', 1, 1, 1, 1, '2018-11-15 00:49:58'),
(86, 18, 'Staff', 'staff', 1, 1, 1, 1, '2018-06-22 10:53:31'),
(87, 18, 'Disable Staff', 'disable_staff', 1, 0, 0, 0, '2018-06-22 10:53:12'),
(88, 18, 'Staff Attendance', 'staff_attendance', 1, 1, 1, 0, '2018-06-22 10:53:10'),
(89, 18, 'Staff Attendance Report', 'staff_attendance_report', 1, 0, 0, 0, '2018-06-22 10:52:54'),
(90, 18, 'Staff Payroll', 'staff_payroll', 1, 1, 0, 1, '2018-06-22 10:52:51'),
(91, 18, 'Payroll Report', 'payroll_report', 1, 0, 0, 0, '2018-06-22 10:52:34'),
(102, 21, 'Calendar To Do List', 'calendar_to_do_list', 1, 1, 1, 1, '2018-06-22 10:54:41'),
(104, 10, 'Item Category', 'item_category', 1, 1, 1, 1, '2018-06-22 10:34:33'),
(108, 18, ' Approve Leave Request', 'approve_leave_request', 1, 1, 1, 1, '2018-07-02 10:17:41'),
(109, 18, 'Apply Leave', 'apply_leave', 1, 1, 0, 1, '2020-08-25 01:48:58'),
(110, 18, 'Leave Types ', 'leave_types', 1, 1, 1, 1, '2018-07-02 10:17:56'),
(111, 18, 'Department', 'department', 1, 1, 1, 1, '2018-06-26 03:57:07'),
(112, 18, 'Designation', 'designation', 1, 1, 1, 1, '2018-06-26 03:57:07'),
(118, 22, 'Staff Role Count Widget', 'staff_role_count_widget', 1, 0, 0, 0, '2018-07-03 07:13:35'),
(126, 15, 'User Status', 'user_status', 1, 0, 0, 0, '2018-07-03 08:42:29'),
(127, 18, 'Can See Other Users Profile', 'can_see_other_users_profile', 1, 0, 0, 0, '2018-07-03 08:42:29'),
(129, 18, 'Staff Timeline', 'staff_timeline', 0, 1, 0, 1, '2018-07-05 08:08:52'),
(130, 15, 'Backup', 'backup', 1, 1, 0, 1, '2018-07-09 04:17:17'),
(131, 15, 'Restore', 'restore', 1, 0, 0, 0, '2018-07-09 04:17:17'),
(132, 23, 'OPD Patient', 'opd_patient', 1, 1, 1, 1, '2018-12-20 09:37:26'),
(134, 23, 'Prescription', 'prescription', 1, 1, 1, 1, '2018-10-11 01:28:26'),
(135, 23, 'Revisit', 'revisit', 1, 1, 1, 1, '2018-10-11 01:28:26'),
(136, 23, 'OPD Diagnosis', 'opd diagnosis', 1, 1, 1, 1, '2018-10-11 06:46:59'),
(137, 23, 'OPD Timeline', 'opd timeline', 1, 1, 1, 1, '2018-10-11 06:47:22'),
(138, 24, 'IPD Patients', 'ipd_patient', 1, 1, 1, 1, '2018-10-11 07:14:55'),
(139, 24, 'Discharged Patients', 'discharged patients', 1, 1, 1, 1, '2018-10-11 01:28:26'),
(140, 24, 'Consultant Register', 'consultant register', 1, 1, 1, 1, '2018-10-11 01:28:26'),
(141, 24, 'IPD Diagnosis', 'ipd diagnosis', 1, 1, 1, 1, '2018-10-11 06:49:18'),
(142, 24, 'IPD Timeline', 'ipd timeline', 1, 1, 1, 1, '2018-10-11 06:49:42'),
(143, 24, 'Charges', 'charges', 1, 1, 1, 1, '2018-10-11 01:28:26'),
(144, 24, 'Payment', 'payment', 1, 1, 1, 1, '2018-10-11 01:28:26'),
(145, 24, 'Bill', 'bill', 1, 1, 1, 1, '2018-10-11 01:28:26'),
(146, 25, 'Medicine', 'medicine', 1, 1, 1, 1, '2018-10-11 01:28:26'),
(147, 25, 'Add Medicine Stock', 'add_medicine_stock', 1, 1, 1, 1, '2018-12-21 10:49:20'),
(148, 25, 'Pharmacy Bill', 'pharmacy bill', 1, 1, 1, 1, '2018-10-11 01:28:26'),
(149, 26, 'Pathology Test', 'pathology test', 1, 1, 1, 1, '2018-12-22 08:46:42'),
(150, 26, 'Add Patient & Test Report', 'add_patho_patient_test_report', 1, 1, 1, 1, '2019-10-18 07:05:57'),
(152, 27, 'Radiology Test', 'radiology test', 1, 1, 1, 1, '2018-10-11 01:28:26'),
(153, 27, 'Add Patient & Test Report', 'add_radio_patient_test_report', 1, 1, 1, 1, '2020-08-25 00:13:27'),
(155, 22, 'IPD Income Widget', 'ipd_income_widget', 1, 0, 0, 0, '2018-12-20 09:08:05'),
(156, 22, 'OPD Income Widget', 'opd_income_widget', 1, 0, 0, 0, '2018-12-20 09:08:15'),
(157, 22, 'Pharmacy Income Widget', 'pharmacy_income_widget', 1, 0, 0, 0, '2018-12-20 09:08:25'),
(158, 22, 'Pathology Income Widget', 'pathology_income_widget', 1, 0, 0, 0, '2018-12-20 09:08:37'),
(159, 22, 'Radiology Income Widget', 'radiology_income_widget', 1, 0, 0, 0, '2018-12-20 09:08:49'),
(160, 22, 'OT Income Widget', 'ot_income_widget', 1, 0, 0, 0, '2018-12-20 09:09:02'),
(161, 22, 'Blood Bank Income Widget', 'blood_bank_income_widget', 1, 0, 0, 0, '2018-12-20 09:09:13'),
(162, 22, 'Ambulance Income Widget', 'ambulance_income_widget', 1, 0, 0, 0, '2018-12-20 09:09:25'),
(163, 28, 'OT Patient', 'ot_patient', 1, 1, 1, 1, '2018-10-27 03:35:57'),
(164, 28, 'OT Consultant Instruction', 'ot_consultant_instruction', 1, 1, 1, 1, '2018-10-27 03:36:19'),
(165, 29, 'Ambulance Call', 'ambulance_call', 1, 1, 1, 1, '2018-10-27 03:37:51'),
(166, 29, 'Ambulance', 'ambulance', 1, 1, 1, 1, '2018-10-27 03:37:59'),
(167, 30, 'Blood Bank Status', 'blood_bank_status', 1, 1, 1, 1, '2018-10-27 04:20:09'),
(168, 30, 'Blood Issue', 'blood_issue', 1, 1, 1, 1, '2018-10-27 04:20:15'),
(169, 30, 'Blood Donor', 'blood_donor', 1, 1, 1, 1, '2018-10-27 04:20:19'),
(170, 25, 'Medicine Category', 'medicine_category', 1, 1, 1, 1, '2018-10-25 06:10:24'),
(171, 27, 'Radiology Category', 'radiology category', 1, 1, 1, 1, '2018-12-22 09:03:20'),
(173, 31, 'Organisation', 'organisation', 1, 1, 1, 1, '2018-10-25 06:10:24'),
(174, 31, 'Charges', 'tpa_charges', 1, 1, 1, 1, '2018-12-22 10:06:57'),
(175, 26, 'Pathology Category', 'pathology_category', 1, 1, 1, 1, '2018-10-25 06:10:24'),
(176, 32, 'Charges', 'hospital_charges', 1, 1, 1, 1, '2018-12-22 10:08:26'),
(178, 14, 'IPD Report', 'ipd_report', 1, 0, 0, 0, '2018-12-12 10:09:24'),
(179, 14, 'Pharmacy Bill Report', 'pharmacy_bill_report', 1, 0, 0, 0, '2018-12-12 10:09:24'),
(180, 14, 'Pathology Patient Report', 'pathology_patient_report', 1, 0, 0, 0, '2018-12-12 10:09:24'),
(181, 14, 'Radiology Patient Report', 'radiology_patient_report', 1, 0, 0, 0, '2018-12-12 10:09:24'),
(182, 14, 'OT Report', 'ot_report', 1, 0, 0, 0, '2019-03-08 06:56:54'),
(183, 14, 'Blood Donor Report', 'blood_donor_report', 1, 0, 0, 0, '2019-03-08 06:56:54'),
(184, 14, 'Payroll Month Report', 'payroll_month_report', 1, 0, 0, 0, '2019-03-08 06:57:25'),
(185, 14, 'Payroll Report', 'payroll_report', 1, 0, 0, 0, '2019-03-08 06:57:35'),
(186, 14, 'Staff Attendance Report', 'staff_attendance_report', 1, 0, 0, 0, '2019-03-08 07:03:28'),
(187, 14, 'User Log', 'user_log', 1, 0, 0, 0, '2018-12-12 10:09:24'),
(188, 14, 'Patient Login Credential', 'patient_login_credential', 1, 0, 0, 0, '2018-12-12 10:09:24'),
(189, 14, 'Email / SMS Log', 'email_sms_log', 1, 0, 0, 0, '2018-12-12 10:09:24'),
(190, 22, 'Yearly Income & Expense Chart', 'yearly_income_expense_chart', 1, 0, 0, 0, '2018-12-12 10:22:05'),
(191, 22, 'Monthly Income & Expense Chart', 'monthly_income_expense_chart', 1, 0, 0, 0, '2018-12-12 10:25:14'),
(192, 23, 'OPD Prescription Print Header Footer ', 'opd_prescription_print_header_footer', 1, 1, 1, 1, '2018-12-12 10:31:07'),
(193, 24, 'Revert Generated Bill', 'revert_generated_bill', 1, 0, 0, 0, '2018-12-12 10:34:02'),
(194, 24, 'Calculate Bill', 'calculate_bill', 1, 0, 0, 0, '2018-12-12 10:35:30'),
(195, 24, 'Generate Bill & Discharge Patient', 'generate_bill_discharge_patient', 1, 0, 0, 0, '2018-12-21 09:26:00'),
(196, 24, 'Bed', 'bed', 1, 1, 1, 1, '2018-12-12 10:46:01'),
(197, 24, 'IPD Prescription Print Header Footer', 'ipd_prescription_print_header_footer', 1, 1, 1, 1, '2018-12-12 10:39:42'),
(198, 24, 'Bed Status', 'bed_status', 1, 0, 0, 0, '2018-12-12 10:39:42'),
(200, 25, 'Medicine Bad Stock', 'medicine_bad_stock', 1, 1, 0, 1, '2018-12-18 01:12:46'),
(201, 25, 'Pharmacy Bill print Header Footer', 'pharmacy_bill_print_header_footer', 1, 1, 1, 1, '2018-12-12 11:06:47'),
(202, 30, 'Donate Blood', 'donate_blood', 1, 1, 0, 1, '2018-12-12 11:17:10'),
(203, 32, 'Charge Category', 'charge_category', 1, 1, 1, 1, '2018-12-12 11:19:38'),
(204, 17, 'Appointment', 'appointment', 1, 1, 1, 1, '2018-12-18 11:52:53'),
(205, 17, 'Appointment Approve', 'appointment_approve', 1, 0, 0, 0, '2018-12-18 11:55:58'),
(206, 14, 'TPA Report', 'tpa_report', 1, 0, 0, 0, '2019-03-08 06:49:25'),
(207, 14, 'Ambulance Report', 'ambulance_report', 1, 0, 0, 0, '2019-03-08 06:49:41'),
(208, 14, 'Discharge Patient Report', 'discharge_patient_report', 1, 0, 0, 0, '2019-03-08 06:49:55'),
(209, 14, 'Appointment Report', 'appointment_report', 1, 0, 0, 0, '2019-03-08 06:50:10'),
(210, 14, 'Transaction Report', 'transaction_report', 1, 0, 0, 0, '2019-03-08 06:57:35'),
(211, 14, 'Blood Issue Report', 'blood_issue_report', 1, 0, 0, 0, '2019-03-08 06:57:35'),
(212, 14, 'Income Report', 'income_report', 1, 0, 0, 0, '2019-03-08 06:57:35'),
(213, 14, 'Expense Report', 'expense_report', 1, 0, 0, 0, '2019-03-08 06:57:35'),
(214, 34, 'Birth Record', 'birth_record', 1, 1, 1, 1, '2018-06-22 10:36:02'),
(215, 34, 'Death Record', 'death_record', 1, 1, 1, 1, '2018-06-22 10:36:02'),
(216, 17, 'Move Patient in OPD', 'move_patient_in_opd', 1, 0, 0, 0, '2019-09-23 04:44:41'),
(217, 17, 'Move Patient in IPD', 'move_patient_in_ipd', 1, 0, 0, 0, '2018-12-18 11:55:58'),
(218, 23, 'Move Patient in IPD', 'opd_move _patient_in_ipd', 1, 0, 0, 0, '2019-09-23 04:49:42'),
(219, 23, 'Manual Prescription', 'manual_prescription', 1, 0, 0, 0, '2019-09-23 04:52:06'),
(220, 24, 'Prescription ', 'ipd_prescription', 1, 1, 1, 1, '2019-09-24 00:59:27'),
(221, 23, 'Charges', 'opd_charges', 1, 1, 1, 1, '2019-09-23 04:58:03'),
(222, 23, 'Payment', 'opd_payment', 1, 1, 1, 1, '2019-09-24 00:44:29'),
(223, 23, 'Bill', 'opd_bill', 1, 1, 1, 1, '2019-09-23 04:59:37'),
(224, 25, 'Import Medicine', 'import_medicine', 1, 0, 0, 0, '2019-09-23 05:03:31'),
(225, 25, 'Medicine Purchase', 'medicine_purchase', 1, 1, 1, 1, '2019-09-23 05:05:53'),
(226, 25, 'Medicine Supplier', 'medicine_supplier', 1, 1, 1, 1, '2019-09-23 05:09:36'),
(227, 25, 'Medicine Dosage', 'medicine_dosage', 1, 1, 1, 1, '2019-09-23 05:17:16'),
(228, 32, 'Doctor OPD Charges', 'doctor_opd_charges', 1, 1, 1, 1, '2019-09-23 05:20:26'),
(236, 36, 'Patient', 'patient', 1, 1, 1, 1, '2019-09-23 06:25:35'),
(237, 36, 'Enabled/Disabled', 'enabled_disabled', 1, 0, 0, 0, '2019-09-23 06:25:35'),
(238, 22, 'Notification Center', 'notification_center', 1, 0, 0, 0, '2019-09-24 03:48:33'),
(239, 36, 'Import', 'patient_import', 1, 0, 0, 0, '2019-10-04 01:20:26'),
(240, 34, 'Birth Print Header Footer', 'birth_print_header_footer', 1, 1, 1, 1, '2019-10-04 02:44:01'),
(241, 34, 'Custom Fields', 'birth_death_customfields', 1, 1, 1, 1, '2019-10-04 01:23:55'),
(242, 34, 'Death Print Header Footer', 'death_print_header_footer', 1, 1, 1, 1, '2019-10-04 02:43:56'),
(243, 26, 'Print Header Footer', 'pathology_print_header_footer', 1, 1, 1, 1, '2019-10-04 01:36:15'),
(244, 27, 'Print Header Footer', 'radiology_print_header_footer', 1, 1, 1, 1, '2019-10-04 01:40:01'),
(245, 28, 'Print Header Footer', 'ot_print_header_footer', 1, 1, 1, 1, '2019-10-04 01:41:15'),
(246, 30, 'Print Header Footer', 'bloodbank_print_header_footer', 1, 1, 1, 1, '2019-10-04 02:47:17'),
(247, 29, 'Print Header Footer', 'ambulance_print_header_footer', 1, 1, 1, 1, '2019-10-04 01:45:03'),
(248, 24, 'IPD Bill Print Header Footer', 'ipd_bill_print_header_footer', 1, 1, 1, 1, '2019-10-04 02:13:28'),
(249, 18, 'Print Payslip Header Footer', 'print_payslip_header_footer', 1, 1, 1, 1, '2019-10-04 02:31:33'),
(250, 14, 'Income Group Report', 'income_group_report', 1, 0, 0, 0, '2020-08-12 05:52:52'),
(251, 14, 'Expense Group Report', 'expense_group_report', 1, 0, 0, 0, '2019-10-04 04:15:56'),
(253, 14, 'Inventory Stock Report', 'inventory_stock_report', 1, 0, 0, 0, '2019-10-04 05:20:31'),
(254, 14, 'Inventory Item Report', 'add_item_report', 1, 0, 0, 0, '2019-10-04 05:23:22'),
(255, 14, 'Inventory Issue Report', 'issue_inventory_report', 1, 0, 0, 0, '2019-10-04 05:24:40'),
(256, 14, 'Expiry Medicine Report', 'expiry_medicine_report', 1, 0, 0, 0, '2019-10-04 06:00:11'),
(257, 26, 'Pathology Bill', 'pathology bill', 1, 1, 1, 1, '2018-12-22 08:46:42'),
(258, 14, 'Birth Report', 'birth_report', 1, 0, 0, 0, '2019-10-14 03:12:35'),
(259, 14, 'Death Report', 'death_report', 1, 0, 0, 0, '2019-10-14 03:13:56'),
(260, 26, 'Pathology Unit', 'pathology_unit', 1, 1, 1, 1, '2020-07-22 01:13:49'),
(261, 27, 'Radiology Unit', 'radiology_unit', 1, 1, 1, 1, '2020-07-22 01:14:47'),
(262, 27, 'Radiology Parameter', 'radiology_parameter', 1, 1, 1, 1, '2020-07-22 01:20:28'),
(263, 26, 'Pathology Parameter', 'pathology_parameter', 1, 1, 1, 1, '2020-07-22 01:20:28'),
(264, 32, 'Charge Type', 'charge_type', 1, 1, 0, 1, '2020-07-22 04:09:44'),
(265, 14, 'OPD Balance Report', 'opd_balance_report', 1, 0, 0, 0, '2020-07-28 02:03:34'),
(266, 14, 'IPD Balance Report', 'ipd_balance_report', 1, 0, 0, 0, '2020-07-28 02:03:34'),
(267, 36, 'Symptoms Type', 'symptoms_type', 1, 1, 1, 1, '2020-08-04 07:24:49'),
(268, 24, 'Discharged Summary', 'discharged_summary', 0, 0, 1, 0, '2020-08-12 02:10:43'),
(269, 37, 'Live Consultation', 'live_consultation', 1, 1, 0, 1, '2020-08-13 06:19:27'),
(270, 37, 'Live Meeting', 'live_meeting', 1, 1, 0, 1, '2020-08-13 06:19:27'),
(271, 37, 'Live Consultation Report', 'live_consultation_report', 1, 0, 0, 0, '2020-08-13 06:21:25'),
(272, 37, 'Live Meeting Report', 'live_meeting_report', 1, 0, 0, 0, '2020-08-13 06:21:25'),
(273, 37, 'Setting', 'setting', 1, 0, 1, 0, '2020-08-13 07:03:28'),
(274, 15, 'Language Switcher', 'language_switcher', 1, 0, 0, 0, '2020-08-21 04:48:53'),
(275, 26, 'Pathology Print Bill', 'pathology_print_bill', 1, 0, 0, 0, '2020-08-25 00:16:11'),
(276, 27, 'Radiology Print Bill', 'radiology_print_bill', 1, 0, 0, 0, '2020-08-25 00:15:24'),
(277, 26, 'Pathology Print Report', 'pathology_print_report', 1, 0, 0, 0, '2020-08-25 00:16:11'),
(278, 27, 'Radiology Print Report', 'radiology_print_report', 1, 0, 0, 0, '2020-08-25 00:15:24'),
(279, 36, 'Symptoms Head', 'symptoms_head', 1, 1, 1, 1, '2020-08-25 04:24:29'),
(280, 18, 'Specialist', 'specialist', 1, 1, 1, 1, '2019-10-03 21:01:33'),
(281, 22, 'General Income Widget', 'general_income_widget', 1, 0, 0, 0, '2018-12-20 03:38:05'),
(282, 22, 'Expenses Widget', 'expenses_widget', 1, 0, 0, 0, '2018-12-20 03:38:05');

-- --------------------------------------------------------

--
-- Table structure for table `permission_group`
--

CREATE TABLE `permission_group` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `short_code` varchar(100) NOT NULL,
  `is_active` int(11) DEFAULT '0',
  `system` int(11) NOT NULL,
  `sort_order` decimal(10,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `permission_group`
--

INSERT INTO `permission_group` (`id`, `name`, `short_code`, `is_active`, `system`, `sort_order`, `created_at`) VALUES
(3, 'Income', 'income', 1, 0, '9.00', '2018-12-23 16:26:51'),
(4, 'Expense', 'expense', 1, 0, '10.00', '2018-12-18 10:20:47'),
(8, 'Download Center', 'download_center', 1, 0, '15.00', '2018-12-18 10:23:12'),
(10, 'Inventory', 'inventory', 1, 0, '16.00', '2018-12-18 10:23:27'),
(13, 'Messaging', 'communicate', 1, 0, '14.00', '2018-12-18 10:22:54'),
(14, 'Reports', 'reports', 1, 1, '19.00', '2018-12-18 10:24:41'),
(15, 'System Settings', 'system_settings', 1, 1, '18.00', '2018-12-18 10:24:23'),
(16, 'Front CMS', 'front_cms', 1, 0, '17.00', '2018-12-18 10:23:47'),
(17, 'Front Office', 'front_office', 1, 0, '12.00', '2018-12-18 10:21:58'),
(18, 'Human Resource', 'human_resource', 1, 1, '13.00', '2018-12-18 10:22:37'),
(21, 'Calendar To Do List', 'calendar_to_do_list', 1, 0, '22.00', '2019-10-04 07:26:23'),
(22, 'Dashboard and Widgets', 'dashboard_and_widgets', 1, 1, '20.00', '2018-12-18 10:24:51'),
(23, 'OPD', 'OPD', 1, 0, '1.00', '2019-11-01 12:36:37'),
(24, 'IPD', 'IPD', 1, 0, '2.00', '2019-10-30 13:05:10'),
(25, 'Pharmacy', 'pharmacy', 1, 0, '3.00', '2018-12-18 10:02:51'),
(26, 'Pathology', 'pathology', 1, 0, '4.00', '2018-12-18 10:02:56'),
(27, 'Radiology', 'radiology', 1, 0, '5.00', '2018-12-18 10:03:00'),
(28, 'Operation Theatre', 'operation_theatre', 1, 0, '6.00', '2018-12-18 10:03:05'),
(29, 'Ambulance', 'ambulance', 1, 0, '11.00', '2018-12-18 10:20:57'),
(30, 'Blood Bank', 'blood_bank', 1, 0, '7.00', '2018-12-18 10:19:14'),
(31, 'TPA Management', 'tpa_management', 1, 0, '8.00', '2018-12-18 10:19:39'),
(32, 'Hospital Charges', 'hospital_charges', 1, 1, '10.10', '2019-03-10 07:08:22'),
(34, 'Birth Death Record', 'birth_death_report', 1, 0, '12.00', '2019-10-04 07:18:39'),
(36, 'Patient', 'patient', 1, 0, '21.00', '2019-10-04 07:26:19'),
(37, 'Zoom Live Consultation', 'zoom_live_meeting', 1, 0, '7.01', '2020-11-06 11:55:47');

-- --------------------------------------------------------

--
-- Table structure for table `pharmacy`
--

CREATE TABLE `pharmacy` (
  `id` int(11) NOT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pharmacy_bill_basic`
--

CREATE TABLE `pharmacy_bill_basic` (
  `id` int(11) NOT NULL,
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
  `generated_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pharmacy_bill_detail`
--

CREATE TABLE `pharmacy_bill_detail` (
  `id` int(11) NOT NULL,
  `pharmacy_bill_basic_id` varchar(50) NOT NULL,
  `medicine_category_id` int(11) NOT NULL,
  `medicine_name` varchar(200) NOT NULL,
  `expire_date` varchar(100) NOT NULL,
  `batch_no` varchar(200) NOT NULL,
  `quantity` varchar(100) NOT NULL,
  `sale_price` decimal(15,2) NOT NULL,
  `amount` decimal(15,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `prescription`
--

CREATE TABLE `prescription` (
  `id` int(11) NOT NULL,
  `opd_id` int(11) NOT NULL,
  `visit_id` int(11) NOT NULL,
  `medicine_category_id` int(11) NOT NULL,
  `medicine` varchar(200) NOT NULL,
  `dosage` varchar(200) NOT NULL,
  `instruction` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `print_setting`
--

CREATE TABLE `print_setting` (
  `id` int(11) NOT NULL,
  `print_header` varchar(300) NOT NULL,
  `print_footer` varchar(200) NOT NULL,
  `setting_for` varchar(200) NOT NULL,
  `is_active` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `radio`
--

CREATE TABLE `radio` (
  `id` int(11) NOT NULL,
  `test_name` varchar(100) DEFAULT NULL,
  `short_name` varchar(100) DEFAULT NULL,
  `test_type` varchar(100) DEFAULT NULL,
  `radiology_category_id` varchar(11) NOT NULL,
  `radiology_parameter_id` varchar(100) NOT NULL,
  `sub_category` varchar(50) NOT NULL,
  `report_days` varchar(50) NOT NULL,
  `charge_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `radiology_parameter`
--

CREATE TABLE `radiology_parameter` (
  `id` int(11) NOT NULL,
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
  `id` int(11) NOT NULL,
  `radiology_id` varchar(100) NOT NULL,
  `parameter_id` varchar(100) NOT NULL,
  `created_id` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `radiology_report_id` int(11) NOT NULL,
  `radiology_report_value` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `radiology_report`
--

CREATE TABLE `radiology_report` (
  `id` int(11) NOT NULL,
  `bill_no` varchar(200) NOT NULL,
  `radiology_id` int(11) NOT NULL,
  `patient_id` varchar(11) DEFAULT NULL,
  `customer_type` varchar(50) DEFAULT NULL,
  `patient_name` varchar(100) DEFAULT NULL,
  `consultant_doctor` varchar(10) NOT NULL,
  `reporting_date` date DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `radiology_report` varchar(255) DEFAULT NULL,
  `apply_charge` decimal(15,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `generated_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `radiology_report_parameterdetails`
--

CREATE TABLE `radiology_report_parameterdetails` (
  `id` int(11) NOT NULL,
  `radiology_report_id` int(11) NOT NULL,
  `parameter_id` int(11) NOT NULL,
  `radiology_report_value` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `read_notification`
--

CREATE TABLE `read_notification` (
  `id` int(11) NOT NULL,
  `student_id` int(11) DEFAULT NULL,
  `parent_id` int(10) DEFAULT NULL,
  `staff_id` int(11) DEFAULT NULL,
  `notification_id` int(11) DEFAULT NULL,
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `read_systemnotification`
--

CREATE TABLE `read_systemnotification` (
  `id` int(11) NOT NULL,
  `notification_id` int(11) NOT NULL,
  `receiver_id` int(11) NOT NULL,
  `is_active` varchar(200) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `slug` varchar(150) DEFAULT NULL,
  `is_active` int(11) DEFAULT '0',
  `is_system` int(1) NOT NULL DEFAULT '0',
  `is_superadmin` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `slug`, `is_active`, `is_system`, `is_superadmin`, `created_at`) VALUES
(1, 'Admin', NULL, 0, 1, 0, '2018-12-25 11:49:43'),
(2, 'Accountant', NULL, 0, 1, 0, '2018-12-25 11:49:38'),
(3, 'Doctor', NULL, 0, 1, 0, '2018-07-21 10:37:36'),
(4, 'Pharmacist', NULL, 0, 1, 0, '2018-07-21 10:38:26'),
(5, 'Pathologist', NULL, 0, 1, 0, '2018-12-25 11:49:59'),
(6, 'Radiologist', NULL, 0, 1, 0, '2018-12-25 11:50:27'),
(7, 'Super Admin', NULL, 0, 1, 1, '2018-12-25 11:52:24'),
(8, 'Receptionist', NULL, 0, 1, 0, '2018-12-25 11:50:22');

-- --------------------------------------------------------

--
-- Table structure for table `roles_permissions`
--

CREATE TABLE `roles_permissions` (
  `id` int(11) NOT NULL,
  `role_id` int(11) DEFAULT NULL,
  `perm_cat_id` int(11) DEFAULT NULL,
  `can_view` int(11) DEFAULT NULL,
  `can_add` int(11) DEFAULT NULL,
  `can_edit` int(11) DEFAULT NULL,
  `can_delete` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `roles_permissions`
--

INSERT INTO `roles_permissions` (`id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES
(1, 1, 132, 1, 1, 1, 1, '2019-03-09 11:56:01'),
(3, 1, 134, 1, 1, 1, 1, '2019-03-09 11:56:01'),
(4, 1, 135, 1, 1, 1, 1, '2019-03-09 11:56:01'),
(5, 1, 136, 1, 1, 1, 1, '2019-03-09 11:56:01'),
(6, 1, 137, 1, 1, 1, 1, '2019-03-09 11:56:01'),
(7, 1, 192, 1, 1, 1, 1, '2019-03-09 11:56:01'),
(8, 1, 138, 1, 1, 1, 1, '2019-03-09 11:56:01'),
(9, 1, 139, 1, 1, 1, 1, '2019-03-09 11:56:01'),
(10, 1, 140, 1, 1, 1, 1, '2019-03-09 11:56:01'),
(11, 1, 141, 1, 1, 1, 1, '2019-03-09 11:56:01'),
(12, 1, 142, 1, 1, 1, 1, '2019-03-09 11:56:01'),
(13, 1, 143, 1, 1, 1, 1, '2019-03-09 11:56:01'),
(14, 1, 144, 1, 1, 1, 1, '2019-03-09 11:56:01'),
(15, 1, 145, 1, 1, 1, 1, '2019-03-09 11:56:01'),
(16, 1, 193, 1, 0, 0, 0, '2019-03-09 11:56:01'),
(17, 1, 194, 1, 0, 0, 0, '2019-03-09 11:56:01'),
(18, 1, 195, 1, 0, 0, 0, '2019-03-09 11:56:01'),
(19, 1, 196, 1, 1, 1, 1, '2019-03-09 11:56:01'),
(20, 1, 197, 1, 1, 1, 1, '2019-03-09 11:56:01'),
(21, 1, 198, 1, 0, 0, 0, '2019-03-09 11:56:01'),
(22, 1, 146, 1, 1, 1, 1, '2019-03-09 11:56:01'),
(23, 1, 147, 1, 1, 1, 1, '2019-03-09 11:56:01'),
(24, 1, 148, 1, 1, 1, 1, '2019-03-09 11:56:01'),
(25, 1, 170, 1, 1, 1, 1, '2019-03-09 11:56:01'),
(26, 1, 200, 1, 1, 0, 1, '2019-03-09 11:56:01'),
(27, 1, 201, 1, 1, 1, 1, '2019-03-09 11:56:01'),
(28, 1, 149, 1, 1, 1, 1, '2019-03-09 11:56:01'),
(29, 1, 150, 1, 1, 1, 1, '2019-03-09 11:56:01'),
(30, 1, 175, 1, 1, 1, 1, '2019-03-09 11:56:01'),
(31, 1, 152, 1, 1, 1, 1, '2019-03-09 11:56:01'),
(32, 1, 153, 1, 1, 1, 1, '2019-03-09 11:56:01'),
(33, 1, 171, 1, 1, 1, 1, '2019-03-09 11:56:01'),
(34, 1, 163, 1, 1, 1, 1, '2019-03-09 11:56:01'),
(35, 1, 164, 1, 1, 1, 1, '2019-03-09 11:56:01'),
(36, 1, 167, 1, 1, 1, 1, '2019-03-09 11:56:01'),
(37, 1, 168, 1, 1, 1, 1, '2019-03-09 11:56:01'),
(38, 1, 169, 1, 1, 1, 1, '2019-03-09 11:56:01'),
(39, 1, 202, 1, 1, 0, 1, '2019-03-09 11:56:01'),
(40, 1, 173, 1, 1, 1, 1, '2019-03-09 11:56:01'),
(41, 1, 174, 1, 1, 1, 1, '2019-03-09 11:56:01'),
(42, 1, 9, 1, 1, 1, 1, '2019-03-09 11:56:01'),
(43, 1, 10, 1, 1, 1, 1, '2019-03-09 11:56:01'),
(45, 1, 176, 1, 1, 1, 1, '2019-03-09 11:56:01'),
(46, 1, 203, 1, 1, 1, 1, '2019-03-09 11:56:01'),
(47, 1, 12, 1, 1, 1, 1, '2019-03-09 11:56:01'),
(48, 1, 13, 1, 1, 1, 1, '2019-03-09 11:56:01'),
(49, 1, 14, 1, 0, 0, 0, '2019-03-09 11:56:01'),
(50, 1, 165, 1, 1, 1, 1, '2019-03-09 11:56:01'),
(51, 1, 166, 1, 1, 1, 1, '2019-03-09 11:56:01'),
(52, 1, 80, 1, 1, 1, 1, '2019-03-09 11:56:01'),
(53, 1, 81, 1, 1, 1, 1, '2019-03-09 11:56:01'),
(54, 1, 82, 1, 1, 1, 1, '2019-03-09 11:56:01'),
(55, 1, 83, 1, 1, 1, 1, '2019-03-09 11:56:01'),
(56, 1, 84, 1, 1, 1, 1, '2019-03-09 11:56:01'),
(57, 1, 85, 1, 1, 1, 1, '2019-03-09 11:56:01'),
(58, 1, 204, 1, 1, 1, 1, '2019-03-09 11:56:01'),
(59, 1, 205, 1, 0, 0, 0, '2019-03-09 11:56:01'),
(60, 1, 86, 1, 1, 1, 1, '2019-03-09 11:56:01'),
(61, 1, 87, 1, 0, 0, 0, '2019-03-09 11:56:01'),
(63, 1, 89, 1, 0, 0, 0, '2019-03-09 11:56:01'),
(64, 1, 90, 1, 1, 0, 1, '2019-03-09 11:56:01'),
(65, 1, 91, 1, 0, 0, 0, '2019-03-09 11:56:01'),
(66, 1, 108, 1, 1, 1, 1, '2019-03-09 11:56:01'),
(67, 1, 109, 1, 1, 0, 1, '2020-08-25 01:48:35'),
(68, 1, 110, 1, 1, 1, 1, '2019-03-09 11:56:01'),
(69, 1, 111, 1, 1, 1, 1, '2019-03-09 11:56:01'),
(70, 1, 112, 1, 1, 1, 1, '2019-03-09 11:56:01'),
(72, 1, 129, 0, 1, 0, 1, '2019-03-09 11:56:01'),
(73, 1, 43, 1, 1, 1, 1, '2020-08-28 07:04:54'),
(74, 1, 44, 1, 0, 0, 0, '2019-03-09 11:56:01'),
(75, 1, 46, 1, 0, 0, 0, '2019-03-09 11:56:01'),
(76, 1, 27, 1, 1, 0, 1, '2019-03-09 11:56:01'),
(77, 1, 31, 1, 1, 0, 1, '2019-03-09 11:56:01'),
(78, 1, 32, 1, 1, 1, 1, '2019-03-09 11:56:01'),
(79, 1, 33, 1, 1, 1, 1, '2019-03-09 11:56:01'),
(80, 1, 34, 1, 1, 1, 1, '2019-03-09 11:56:01'),
(81, 1, 35, 1, 1, 1, 1, '2019-03-09 11:56:01'),
(82, 1, 104, 1, 1, 1, 1, '2019-03-09 11:56:01'),
(83, 1, 61, 1, 1, 0, 1, '2019-03-09 11:56:01'),
(85, 1, 63, 1, 1, 0, 1, '2020-08-28 07:04:54'),
(86, 1, 64, 1, 1, 1, 1, '2019-03-09 11:56:01'),
(87, 1, 65, 1, 1, 1, 1, '2019-03-09 11:56:01'),
(88, 1, 66, 1, 1, 1, 1, '2019-03-09 11:56:01'),
(89, 1, 67, 1, 1, 1, 1, '2019-03-09 11:56:01'),
(90, 1, 53, 0, 1, 0, 0, '2019-03-09 11:56:01'),
(91, 1, 54, 1, 0, 1, 0, '2019-03-09 11:56:01'),
(92, 1, 56, 1, 0, 1, 0, '2019-03-09 11:56:01'),
(93, 1, 57, 1, 0, 1, 0, '2019-03-09 11:56:01'),
(94, 1, 58, 1, 0, 1, 0, '2019-03-09 11:56:01'),
(95, 1, 59, 1, 0, 1, 0, '2019-03-09 11:56:01'),
(96, 1, 60, 1, 0, 1, 0, '2019-03-09 11:56:01'),
(97, 1, 126, 1, 0, 0, 0, '2019-03-09 11:56:01'),
(98, 1, 130, 1, 1, 0, 1, '2019-03-09 11:56:01'),
(99, 1, 131, 1, 0, 0, 0, '2019-03-09 11:56:01'),
(100, 1, 48, 1, 0, 0, 0, '2019-03-09 11:56:01'),
(101, 1, 178, 1, 0, 0, 0, '2019-03-09 11:56:01'),
(102, 1, 179, 1, 0, 0, 0, '2019-03-09 11:56:01'),
(103, 1, 180, 1, 0, 0, 0, '2019-03-09 11:56:01'),
(104, 1, 181, 1, 0, 0, 0, '2019-03-09 11:56:01'),
(105, 1, 182, 1, 0, 0, 0, '2019-03-09 11:56:01'),
(106, 1, 183, 1, 0, 0, 0, '2019-03-09 11:56:01'),
(107, 1, 184, 1, 0, 0, 0, '2019-03-09 11:56:01'),
(108, 1, 185, 1, 0, 0, 0, '2019-03-09 11:56:01'),
(109, 1, 186, 1, 0, 0, 0, '2019-03-09 11:56:01'),
(110, 1, 187, 1, 0, 0, 0, '2019-03-09 11:56:01'),
(111, 1, 188, 1, 0, 0, 0, '2019-03-09 11:56:01'),
(112, 1, 189, 1, 0, 0, 0, '2019-03-09 11:56:01'),
(113, 1, 206, 1, 0, 0, 0, '2019-03-09 11:56:01'),
(114, 1, 207, 1, 0, 0, 0, '2019-03-09 11:56:01'),
(115, 1, 208, 1, 0, 0, 0, '2019-03-09 11:56:01'),
(116, 1, 209, 1, 0, 0, 0, '2019-03-09 11:56:01'),
(117, 1, 210, 1, 0, 0, 0, '2019-03-09 11:56:01'),
(118, 1, 211, 1, 0, 0, 0, '2019-03-09 11:56:01'),
(119, 1, 212, 1, 0, 0, 0, '2019-03-09 11:56:01'),
(120, 1, 213, 1, 0, 0, 0, '2019-03-09 11:56:01'),
(121, 1, 118, 1, 0, 0, 0, '2019-03-09 11:56:01'),
(122, 1, 155, 1, 0, 0, 0, '2019-03-09 11:56:01'),
(123, 1, 156, 1, 0, 0, 0, '2019-03-09 11:56:01'),
(124, 1, 157, 1, 0, 0, 0, '2019-03-09 11:56:01'),
(125, 1, 158, 1, 0, 0, 0, '2019-03-09 11:56:01'),
(126, 1, 159, 1, 0, 0, 0, '2019-03-09 11:56:01'),
(127, 1, 160, 1, 0, 0, 0, '2019-03-09 11:56:01'),
(128, 1, 161, 1, 0, 0, 0, '2019-03-09 11:56:01'),
(129, 1, 162, 1, 0, 0, 0, '2019-03-09 11:56:01'),
(130, 1, 190, 1, 0, 0, 0, '2019-03-09 11:56:01'),
(131, 1, 191, 1, 0, 0, 0, '2019-03-09 11:56:01'),
(132, 1, 102, 1, 1, 1, 1, '2019-03-09 11:56:01'),
(133, 2, 132, 1, 1, 1, 0, '2019-03-09 12:13:21'),
(134, 2, 135, 1, 1, 1, 0, '2019-03-09 12:13:21'),
(135, 2, 138, 1, 1, 1, 0, '2019-03-09 12:13:21'),
(136, 2, 139, 1, 1, 1, 0, '2019-03-09 12:13:21'),
(137, 2, 143, 1, 1, 1, 1, '2019-03-09 12:13:21'),
(138, 2, 144, 1, 1, 1, 1, '2019-03-09 12:13:21'),
(139, 2, 145, 1, 1, 1, 1, '2019-03-09 12:13:21'),
(140, 2, 193, 1, 0, 0, 0, '2019-03-09 12:13:21'),
(141, 2, 194, 1, 0, 0, 0, '2019-03-09 12:13:21'),
(142, 2, 195, 1, 0, 0, 0, '2019-03-09 12:13:21'),
(143, 2, 196, 1, 1, 1, 1, '2019-03-09 12:13:21'),
(144, 2, 198, 1, 0, 0, 0, '2019-03-09 12:13:21'),
(145, 2, 148, 1, 0, 0, 0, '2019-03-09 12:13:21'),
(146, 2, 149, 1, 0, 0, 0, '2019-03-09 12:13:21'),
(147, 2, 150, 1, 0, 0, 0, '2019-03-09 12:13:21'),
(148, 2, 152, 1, 0, 0, 0, '2019-03-09 12:13:21'),
(149, 2, 153, 1, 0, 0, 0, '2019-03-09 12:13:21'),
(150, 2, 163, 1, 1, 1, 0, '2019-03-09 12:13:21'),
(151, 2, 167, 1, 0, 0, 0, '2019-03-09 12:13:21'),
(152, 2, 168, 1, 0, 0, 0, '2019-03-09 12:13:21'),
(153, 2, 173, 1, 1, 1, 1, '2019-03-09 12:13:21'),
(154, 2, 174, 1, 1, 1, 1, '2019-03-09 12:13:21'),
(155, 2, 9, 1, 1, 1, 1, '2019-03-09 12:13:21'),
(156, 2, 10, 1, 1, 1, 1, '2019-03-09 12:13:21'),
(158, 2, 176, 1, 1, 1, 1, '2019-03-09 12:13:21'),
(159, 2, 203, 1, 1, 1, 1, '2019-03-09 12:13:21'),
(160, 2, 12, 1, 1, 1, 1, '2019-03-09 12:13:21'),
(161, 2, 13, 1, 1, 1, 1, '2019-03-09 12:13:21'),
(162, 2, 14, 1, 0, 0, 0, '2019-03-09 12:13:21'),
(163, 2, 165, 1, 1, 1, 0, '2019-03-09 12:13:21'),
(164, 2, 166, 1, 0, 0, 0, '2019-03-09 12:13:21'),
(165, 2, 204, 1, 1, 1, 1, '2019-03-09 12:13:21'),
(166, 2, 205, 1, 0, 0, 0, '2019-03-09 12:13:21'),
(167, 2, 86, 1, 1, 1, 1, '2019-03-09 12:13:21'),
(168, 2, 87, 1, 0, 0, 0, '2019-03-09 12:13:21'),
(169, 2, 88, 1, 1, 1, 0, '2019-03-09 12:13:21'),
(170, 2, 89, 1, 0, 0, 0, '2019-03-09 12:13:21'),
(171, 2, 90, 1, 1, 0, 1, '2019-03-09 12:13:21'),
(172, 2, 91, 1, 0, 0, 0, '2019-03-09 12:13:21'),
(173, 2, 108, 1, 1, 1, 1, '2019-03-09 12:13:21'),
(174, 2, 109, 1, 1, 0, 1, '2020-08-25 01:48:35'),
(175, 2, 110, 1, 1, 1, 1, '2019-03-09 12:13:21'),
(176, 2, 111, 1, 1, 1, 1, '2019-03-09 12:13:21'),
(177, 2, 112, 1, 1, 1, 1, '2019-03-09 12:13:21'),
(178, 2, 127, 1, 0, 0, 0, '2019-03-09 12:13:21'),
(179, 2, 129, 0, 1, 0, 1, '2019-03-09 12:13:21'),
(180, 2, 43, 1, 1, 1, 1, '2019-03-09 12:13:21'),
(181, 2, 44, 1, 0, 0, 0, '2019-03-09 12:13:21'),
(182, 2, 46, 1, 0, 0, 0, '2019-03-09 12:13:21'),
(183, 2, 27, 1, 1, 0, 1, '2019-03-09 12:13:21'),
(184, 2, 31, 1, 1, 0, 1, '2019-03-09 12:13:21'),
(185, 2, 32, 1, 1, 1, 1, '2019-03-09 12:13:21'),
(186, 2, 33, 1, 1, 1, 1, '2019-03-09 12:13:21'),
(187, 2, 34, 1, 1, 1, 1, '2019-03-09 12:13:21'),
(188, 2, 35, 1, 1, 1, 1, '2019-03-09 12:13:21'),
(189, 2, 104, 1, 1, 1, 1, '2019-03-09 12:13:21'),
(190, 2, 48, 1, 0, 0, 0, '2019-03-09 12:13:21'),
(191, 2, 178, 1, 0, 0, 0, '2019-03-09 12:13:21'),
(192, 2, 179, 1, 0, 0, 0, '2019-03-09 12:13:21'),
(193, 2, 180, 1, 0, 0, 0, '2019-03-09 12:13:21'),
(194, 2, 181, 1, 0, 0, 0, '2019-03-09 12:13:21'),
(195, 2, 182, 1, 0, 0, 0, '2019-03-09 12:13:21'),
(196, 2, 184, 1, 0, 0, 0, '2019-03-09 12:13:21'),
(197, 2, 185, 1, 0, 0, 0, '2019-03-09 12:13:21'),
(198, 2, 186, 1, 0, 0, 0, '2019-03-09 12:13:21'),
(199, 2, 188, 1, 0, 0, 0, '2019-03-09 12:13:21'),
(200, 2, 189, 1, 0, 0, 0, '2019-03-09 12:13:21'),
(201, 2, 206, 1, 0, 0, 0, '2019-03-09 12:13:21'),
(202, 2, 207, 1, 0, 0, 0, '2019-03-09 12:13:21'),
(203, 2, 208, 1, 0, 0, 0, '2019-03-09 12:13:21'),
(204, 2, 209, 1, 0, 0, 0, '2019-03-09 12:13:21'),
(205, 2, 210, 1, 0, 0, 0, '2019-03-09 12:13:21'),
(206, 2, 211, 1, 0, 0, 0, '2019-03-09 12:13:21'),
(207, 2, 212, 1, 0, 0, 0, '2019-03-09 12:13:21'),
(208, 2, 213, 1, 0, 0, 0, '2019-03-09 12:13:21'),
(209, 2, 118, 1, 0, 0, 0, '2019-03-09 12:13:21'),
(210, 2, 155, 1, 0, 0, 0, '2019-03-09 12:13:21'),
(211, 2, 156, 1, 0, 0, 0, '2019-03-09 12:13:21'),
(212, 2, 157, 1, 0, 0, 0, '2019-03-09 12:13:21'),
(213, 2, 158, 1, 0, 0, 0, '2019-03-09 12:13:21'),
(214, 2, 159, 1, 0, 0, 0, '2019-03-09 12:13:21'),
(215, 2, 160, 1, 0, 0, 0, '2019-03-09 12:13:21'),
(216, 2, 161, 1, 0, 0, 0, '2019-03-09 12:13:21'),
(217, 2, 162, 1, 0, 0, 0, '2019-03-09 12:13:21'),
(218, 2, 190, 1, 0, 0, 0, '2019-03-09 12:13:21'),
(219, 2, 191, 1, 0, 0, 0, '2019-03-09 12:13:21'),
(220, 2, 102, 1, 1, 1, 1, '2019-03-09 12:13:21'),
(221, 3, 132, 1, 1, 1, 1, '2019-03-10 01:47:01'),
(222, 3, 134, 1, 1, 1, 1, '2019-03-10 01:47:01'),
(223, 3, 135, 1, 1, 1, 1, '2019-03-10 01:47:01'),
(224, 3, 136, 1, 1, 1, 1, '2019-03-10 01:47:01'),
(225, 3, 137, 1, 1, 1, 1, '2019-03-10 01:47:01'),
(226, 3, 138, 1, 1, 1, 1, '2019-03-10 01:47:01'),
(227, 3, 139, 1, 1, 1, 1, '2019-03-10 01:47:01'),
(228, 3, 140, 1, 1, 1, 1, '2019-03-10 01:47:01'),
(229, 3, 141, 1, 1, 1, 1, '2019-03-10 01:47:01'),
(230, 3, 142, 1, 1, 1, 1, '2019-03-10 01:47:01'),
(231, 3, 143, 1, 1, 1, 1, '2019-03-10 01:47:01'),
(232, 3, 144, 1, 1, 1, 1, '2019-03-10 01:47:01'),
(233, 3, 145, 1, 1, 1, 1, '2019-03-10 01:47:01'),
(234, 3, 194, 1, 0, 0, 0, '2019-03-10 01:47:01'),
(235, 3, 198, 1, 0, 0, 0, '2019-03-10 01:47:01'),
(236, 3, 163, 1, 1, 1, 1, '2019-03-10 01:47:01'),
(237, 3, 164, 1, 1, 1, 1, '2019-03-10 01:47:01'),
(238, 3, 167, 1, 0, 0, 0, '2019-03-10 01:47:01'),
(239, 3, 166, 1, 0, 0, 0, '2019-10-12 06:32:53'),
(240, 3, 204, 1, 1, 1, 1, '2019-03-10 01:47:01'),
(241, 3, 205, 1, 0, 0, 0, '2019-03-10 01:47:01'),
(242, 3, 86, 1, 0, 0, 0, '2019-03-10 01:47:01'),
(243, 3, 109, 1, 1, 0, 1, '2020-08-25 01:48:35'),
(244, 3, 127, 1, 0, 0, 0, '2019-03-10 01:47:01'),
(245, 3, 43, 1, 1, 1, 1, '2019-03-10 01:47:01'),
(246, 3, 44, 1, 0, 0, 0, '2019-03-10 01:47:01'),
(248, 3, 27, 1, 1, 0, 1, '2019-03-10 01:47:01'),
(249, 3, 48, 1, 0, 0, 0, '2019-03-10 01:47:01'),
(250, 3, 178, 1, 0, 0, 0, '2019-03-10 01:47:01'),
(251, 3, 182, 1, 0, 0, 0, '2019-03-10 01:47:01'),
(253, 3, 208, 1, 0, 0, 0, '2019-03-10 01:47:01'),
(254, 3, 209, 1, 0, 0, 0, '2019-03-10 01:47:01'),
(255, 3, 118, 1, 0, 0, 0, '2019-03-10 01:47:01'),
(256, 3, 155, 1, 0, 0, 0, '2019-03-10 01:47:01'),
(257, 3, 156, 1, 0, 0, 0, '2019-03-10 01:47:01'),
(262, 3, 102, 1, 1, 1, 1, '2019-03-10 01:47:01'),
(277, 5, 149, 1, 1, 1, 1, '2019-03-10 01:53:30'),
(278, 5, 150, 1, 1, 1, 1, '2019-03-10 01:53:30'),
(279, 5, 175, 1, 1, 1, 1, '2019-03-10 01:53:30'),
(280, 5, 86, 1, 0, 0, 0, '2019-03-10 01:53:30'),
(281, 5, 109, 1, 1, 0, 1, '2020-08-25 01:48:35'),
(282, 5, 43, 1, 1, 1, 1, '2019-03-10 01:53:30'),
(283, 5, 44, 1, 0, 0, 0, '2019-03-10 01:53:30'),
(285, 5, 27, 1, 1, 0, 1, '2019-03-10 01:53:30'),
(286, 5, 180, 1, 0, 0, 0, '2019-03-10 01:53:30'),
(288, 5, 158, 1, 0, 0, 0, '2019-03-10 01:53:30'),
(289, 5, 102, 1, 1, 1, 1, '2019-03-10 01:53:30'),
(290, 6, 152, 1, 1, 1, 1, '2019-03-10 02:01:58'),
(291, 6, 153, 1, 1, 1, 1, '2019-03-10 02:01:58'),
(292, 6, 171, 1, 1, 1, 1, '2019-03-10 02:01:58'),
(293, 6, 86, 1, 0, 0, 0, '2019-03-10 02:01:58'),
(294, 6, 109, 1, 1, 0, 1, '2020-08-25 01:48:35'),
(295, 6, 181, 1, 0, 0, 0, '2019-03-10 02:01:58'),
(297, 6, 118, 1, 0, 0, 0, '2019-03-10 02:01:58'),
(298, 6, 159, 1, 0, 0, 0, '2019-03-10 02:01:58'),
(299, 6, 102, 1, 1, 1, 1, '2019-03-10 02:01:58'),
(300, 8, 132, 1, 1, 1, 1, '2019-03-10 02:08:46'),
(306, 8, 81, 1, 1, 1, 1, '2019-03-10 02:08:46'),
(492, 8, 236, 1, 1, 1, 0, '2019-10-12 07:10:43'),
(493, 8, 146, 1, 0, 0, 0, '2019-10-12 07:10:43'),
(495, 8, 138, 1, 1, 1, 1, '2019-10-04 01:05:20'),
(496, 8, 139, 1, 1, 1, 1, '2019-10-04 01:05:49'),
(500, 8, 143, 1, 0, 0, 0, '2019-10-12 07:10:43'),
(501, 8, 144, 1, 0, 0, 0, '2019-10-12 07:10:43'),
(502, 8, 145, 1, 0, 0, 0, '2019-10-12 07:10:43'),
(504, 8, 194, 1, 0, 0, 0, '2019-10-04 01:06:51'),
(506, 8, 196, 1, 0, 1, 1, '2019-10-12 07:46:52'),
(508, 8, 198, 1, 0, 0, 0, '2019-10-04 01:06:51'),
(511, 8, 148, 1, 0, 0, 0, '2019-10-12 07:10:43'),
(516, 8, 225, 1, 0, 0, 0, '2019-10-12 07:10:43'),
(540, 3, 245, 1, 1, 1, 1, '2019-10-12 06:32:53'),
(580, 2, 221, 1, 1, 1, 1, '2019-10-12 06:26:04'),
(581, 2, 222, 1, 1, 1, 1, '2019-10-12 06:26:04'),
(582, 2, 223, 1, 1, 1, 1, '2019-10-12 06:26:04'),
(583, 2, 225, 1, 0, 0, 0, '2019-10-12 06:26:04'),
(584, 2, 216, 1, 0, 0, 0, '2019-10-12 06:26:04'),
(585, 2, 217, 1, 0, 0, 0, '2019-10-12 06:26:04'),
(587, 2, 249, 1, 1, 1, 1, '2019-10-12 06:26:04'),
(588, 2, 250, 1, 0, 0, 0, '2019-10-12 06:26:04'),
(589, 2, 251, 1, 0, 0, 0, '2019-10-12 06:26:04'),
(590, 2, 253, 1, 0, 0, 0, '2019-10-12 06:26:04'),
(591, 2, 254, 1, 0, 0, 0, '2019-10-12 06:26:04'),
(592, 2, 255, 1, 0, 0, 0, '2019-10-12 06:26:04'),
(593, 2, 256, 1, 0, 0, 0, '2019-10-12 06:26:04'),
(594, 2, 238, 1, 0, 0, 0, '2019-10-12 06:26:04'),
(595, 2, 236, 1, 1, 1, 0, '2019-10-12 06:26:04'),
(596, 2, 237, 1, 0, 0, 0, '2019-10-12 06:26:04'),
(597, 3, 192, 1, 1, 1, 1, '2019-10-12 06:32:53'),
(598, 3, 218, 1, 0, 0, 0, '2019-10-12 06:32:53'),
(599, 3, 219, 1, 0, 0, 0, '2019-10-12 06:32:53'),
(600, 3, 221, 1, 1, 1, 1, '2019-10-12 06:32:53'),
(601, 3, 222, 1, 1, 1, 1, '2019-10-12 06:32:53'),
(602, 3, 223, 1, 1, 1, 1, '2019-10-12 06:32:53'),
(603, 3, 193, 1, 0, 0, 0, '2019-10-12 06:32:53'),
(604, 3, 195, 1, 0, 0, 0, '2019-10-12 06:32:53'),
(605, 3, 196, 1, 1, 1, 1, '2019-10-12 06:32:53'),
(606, 3, 197, 1, 1, 1, 1, '2019-10-12 06:32:53'),
(607, 3, 220, 1, 1, 1, 1, '2019-10-12 06:32:53'),
(608, 3, 248, 1, 1, 1, 1, '2019-10-12 06:32:53'),
(609, 3, 146, 1, 0, 0, 0, '2019-10-12 06:32:53'),
(610, 3, 149, 1, 0, 0, 0, '2019-10-12 06:32:53'),
(611, 3, 152, 1, 0, 0, 0, '2019-10-12 06:32:53'),
(612, 3, 173, 1, 0, 0, 0, '2019-10-12 06:32:53'),
(613, 3, 174, 1, 0, 0, 0, '2019-10-12 06:32:53'),
(614, 3, 176, 1, 0, 0, 0, '2019-10-12 06:32:53'),
(615, 3, 228, 1, 0, 0, 0, '2019-10-12 06:32:53'),
(616, 3, 165, 1, 0, 0, 0, '2019-10-12 06:32:53'),
(617, 3, 214, 1, 1, 1, 1, '2019-10-12 06:32:53'),
(618, 3, 215, 1, 1, 1, 1, '2019-10-12 06:32:53'),
(619, 3, 216, 1, 0, 0, 0, '2019-10-12 06:32:53'),
(620, 3, 217, 1, 0, 0, 0, '2019-10-12 06:32:53'),
(621, 3, 236, 1, 1, 1, 1, '2019-10-12 06:32:53'),
(623, 5, 243, 1, 1, 1, 1, '2019-10-12 06:54:41'),
(624, 5, 236, 1, 0, 0, 0, '2019-10-12 06:54:41'),
(625, 6, 43, 1, 1, 1, 1, '2019-10-12 07:00:16'),
(626, 6, 44, 1, 0, 0, 0, '2019-10-12 07:00:16'),
(627, 6, 27, 1, 1, 0, 1, '2019-10-12 07:00:16'),
(628, 6, 236, 1, 0, 0, 0, '2019-10-12 07:00:16'),
(629, 8, 135, 1, 1, 1, 1, '2019-10-12 07:10:43'),
(630, 8, 218, 1, 0, 0, 0, '2019-10-12 07:10:43'),
(631, 8, 219, 1, 0, 0, 0, '2019-10-12 07:10:43'),
(632, 8, 221, 1, 0, 0, 0, '2019-10-12 07:10:43'),
(633, 8, 222, 1, 0, 0, 0, '2019-10-12 07:10:43'),
(634, 8, 223, 1, 0, 0, 0, '2019-10-12 07:10:43'),
(635, 8, 149, 1, 0, 0, 0, '2019-10-12 07:10:43'),
(636, 8, 152, 1, 0, 0, 0, '2019-10-12 07:10:43'),
(637, 8, 163, 1, 0, 0, 0, '2019-10-12 07:10:43'),
(638, 8, 167, 1, 0, 0, 0, '2019-10-12 07:10:43'),
(639, 8, 173, 1, 0, 0, 0, '2019-10-12 07:10:43'),
(640, 8, 174, 1, 0, 0, 0, '2019-10-12 07:10:43'),
(641, 8, 176, 1, 0, 0, 0, '2019-10-12 07:10:43'),
(642, 8, 228, 1, 0, 0, 0, '2019-10-12 07:10:43'),
(643, 8, 165, 1, 0, 0, 0, '2019-10-12 07:10:43'),
(644, 8, 166, 1, 0, 0, 0, '2019-10-12 07:10:43'),
(645, 8, 214, 1, 0, 0, 0, '2019-10-12 07:10:43'),
(646, 8, 215, 1, 0, 0, 0, '2019-10-12 07:10:43'),
(647, 8, 82, 1, 1, 1, 1, '2019-10-12 07:10:43'),
(648, 8, 83, 1, 1, 1, 1, '2019-10-12 07:10:43'),
(649, 8, 84, 1, 1, 1, 1, '2019-10-12 07:10:43'),
(650, 8, 85, 1, 1, 1, 1, '2019-10-12 07:10:43'),
(651, 8, 204, 1, 1, 1, 1, '2019-10-12 07:10:43'),
(652, 8, 205, 1, 0, 0, 0, '2019-10-12 07:10:43'),
(653, 8, 216, 1, 0, 0, 0, '2019-10-12 07:10:43'),
(654, 8, 217, 1, 0, 0, 0, '2019-10-12 07:10:43'),
(655, 8, 109, 1, 1, 0, 1, '2020-08-25 01:48:35'),
(656, 8, 43, 1, 1, 1, 1, '2019-10-12 07:10:43'),
(657, 8, 44, 1, 0, 0, 0, '2019-10-12 07:10:43'),
(658, 8, 27, 1, 1, 0, 1, '2019-10-12 07:10:43'),
(659, 8, 31, 1, 0, 0, 0, '2019-10-12 07:10:43'),
(660, 8, 32, 1, 0, 0, 0, '2019-10-12 07:10:43'),
(661, 8, 33, 1, 0, 0, 0, '2019-10-12 07:10:43'),
(662, 8, 48, 1, 0, 0, 0, '2019-10-12 07:10:43'),
(663, 8, 178, 1, 0, 0, 0, '2019-10-12 07:10:43'),
(664, 8, 180, 1, 0, 0, 0, '2019-10-12 07:10:43'),
(665, 8, 181, 1, 0, 0, 0, '2019-10-12 07:10:43'),
(666, 8, 186, 1, 0, 0, 0, '2019-10-12 07:10:43'),
(667, 8, 207, 1, 0, 0, 0, '2019-10-12 07:10:43'),
(668, 8, 208, 1, 0, 0, 0, '2019-10-12 07:10:43'),
(669, 8, 209, 1, 0, 0, 0, '2019-10-12 07:10:43'),
(670, 8, 253, 1, 0, 0, 0, '2019-10-12 07:10:43'),
(671, 8, 254, 1, 0, 0, 0, '2019-10-12 07:10:43'),
(672, 8, 255, 1, 0, 0, 0, '2019-10-12 07:10:43'),
(673, 8, 118, 1, 0, 0, 0, '2019-10-12 07:10:43'),
(674, 8, 238, 1, 0, 0, 0, '2019-10-12 07:10:43'),
(675, 8, 102, 1, 1, 1, 1, '2019-10-12 07:10:43'),
(676, 5, 176, 1, 0, 0, 0, '2019-10-12 07:40:30'),
(677, 6, 176, 1, 0, 0, 0, '2019-10-12 07:42:51'),
(678, 8, 86, 1, 0, 0, 0, '2019-10-12 07:46:52'),
(679, 8, 182, 1, 0, 0, 0, '2019-10-12 07:46:52'),
(680, 2, 147, 1, 0, 0, 0, '2019-10-14 04:04:51'),
(681, 2, 200, 1, 0, 0, 0, '2019-10-14 04:04:51'),
(682, 2, 164, 1, 0, 0, 0, '2019-10-14 04:06:36'),
(683, 2, 146, 1, 0, 0, 0, '2019-10-14 04:09:47'),
(684, 1, 218, 1, 0, 0, 0, '2019-10-15 00:48:33'),
(685, 1, 219, 1, 0, 0, 0, '2019-10-15 00:48:33'),
(686, 1, 221, 1, 1, 1, 1, '2019-10-15 00:48:33'),
(687, 1, 222, 1, 1, 1, 1, '2019-10-15 00:48:33'),
(688, 1, 223, 1, 1, 1, 1, '2019-10-15 00:48:33'),
(689, 1, 220, 1, 1, 1, 1, '2019-10-15 00:48:33'),
(690, 1, 248, 1, 1, 1, 1, '2019-10-15 00:48:33'),
(691, 1, 224, 1, 0, 0, 0, '2019-10-15 00:48:33'),
(692, 1, 225, 1, 1, 1, 1, '2019-10-15 00:48:33'),
(693, 1, 226, 1, 1, 1, 1, '2019-10-15 00:48:33'),
(694, 1, 227, 1, 1, 1, 1, '2019-10-15 00:48:33'),
(695, 1, 243, 1, 1, 1, 1, '2019-10-15 00:48:33'),
(696, 1, 257, 1, 1, 1, 1, '2019-10-15 00:48:33'),
(697, 1, 244, 1, 1, 1, 1, '2019-10-15 00:48:33'),
(698, 1, 245, 1, 1, 1, 1, '2019-10-15 00:48:33'),
(699, 1, 246, 1, 1, 1, 1, '2019-10-15 00:48:33'),
(700, 1, 252, 1, 0, 0, 0, '2019-10-15 00:48:33'),
(701, 1, 228, 1, 1, 1, 1, '2019-10-15 00:48:33'),
(702, 1, 247, 1, 1, 1, 1, '2019-10-15 00:48:33'),
(703, 1, 214, 1, 1, 1, 1, '2019-10-15 00:48:33'),
(704, 1, 215, 1, 1, 1, 1, '2019-10-15 00:48:33'),
(705, 1, 240, 1, 1, 1, 1, '2019-10-15 00:48:33'),
(706, 1, 241, 1, 1, 1, 1, '2019-10-15 00:48:33'),
(707, 1, 242, 1, 1, 1, 1, '2019-10-15 00:48:33'),
(708, 1, 216, 1, 0, 0, 0, '2019-10-15 00:48:33'),
(709, 1, 217, 1, 0, 0, 0, '2019-10-15 00:48:33'),
(711, 1, 249, 1, 1, 1, 1, '2019-10-15 00:48:33'),
(712, 1, 250, 1, 0, 0, 0, '2019-10-15 00:48:33'),
(713, 1, 251, 1, 0, 0, 0, '2019-10-15 00:48:33'),
(714, 1, 253, 1, 0, 0, 0, '2019-10-15 00:48:33'),
(715, 1, 254, 1, 0, 0, 0, '2019-10-15 00:48:33'),
(716, 1, 255, 1, 0, 0, 0, '2019-10-15 00:48:33'),
(717, 1, 256, 1, 0, 0, 0, '2019-10-15 00:48:33'),
(718, 1, 258, 1, 0, 0, 0, '2019-10-15 00:48:33'),
(719, 1, 259, 1, 0, 0, 0, '2019-10-15 00:48:33'),
(720, 1, 238, 1, 0, 0, 0, '2019-10-15 00:48:33'),
(721, 1, 236, 1, 1, 1, 1, '2019-10-15 00:48:33'),
(722, 1, 237, 1, 0, 0, 0, '2019-10-15 00:48:33'),
(723, 1, 239, 1, 0, 0, 0, '2019-10-15 00:48:33'),
(724, 3, 226, 1, 0, 0, 0, '2019-10-18 05:03:53'),
(727, 3, 238, 1, 0, 0, 0, '2019-11-01 00:10:24'),
(728, 9, 132, 1, 1, 1, 1, '2020-08-11 23:31:56'),
(958, 1, 268, 0, 0, 1, 0, '2020-08-12 02:11:09'),
(963, 1, 267, 1, 1, 1, 1, '2020-08-12 02:37:31'),
(1077, 3, 270, 1, 1, 0, 1, '2020-08-14 01:53:14'),
(1087, 1, 269, 1, 1, 0, 1, '2020-08-21 01:58:52'),
(1088, 1, 270, 1, 1, 0, 1, '2020-08-21 01:58:52'),
(1089, 1, 271, 1, 0, 0, 0, '2020-08-21 01:58:52'),
(1090, 1, 272, 1, 0, 0, 0, '2020-08-21 01:58:52'),
(1091, 1, 273, 1, 0, 1, 0, '2020-08-21 01:58:52'),
(1093, 3, 274, 1, 0, 0, 0, '2020-08-21 04:51:39'),
(1094, 1, 274, 1, 0, 0, 0, '2020-08-21 04:53:41'),
(1120, 4, 197, 1, 1, 1, 1, '2020-08-23 02:35:15'),
(1125, 4, 146, 1, 1, 1, 1, '2020-08-23 02:47:35'),
(1126, 4, 147, 1, 1, 1, 1, '2020-08-28 08:26:27'),
(1128, 4, 170, 1, 1, 1, 1, '2020-08-23 02:48:26'),
(1129, 4, 200, 1, 1, 0, 1, '2020-08-23 02:49:17'),
(1130, 4, 201, 1, 1, 1, 1, '2020-08-23 02:50:51'),
(1131, 4, 224, 1, 0, 0, 0, '2020-08-23 02:51:00'),
(1132, 4, 225, 1, 1, 1, 1, '2020-08-23 02:52:02'),
(1133, 4, 226, 1, 1, 1, 1, '2020-08-23 02:52:56'),
(1134, 4, 227, 1, 1, 1, 1, '2020-08-23 02:53:36'),
(1138, 4, 243, 1, 0, 0, 0, '2020-08-28 08:26:27'),
(1145, 4, 244, 1, 0, 0, 0, '2020-08-28 08:26:27'),
(1150, 4, 245, 1, 0, 0, 0, '2020-08-28 08:26:27'),
(1160, 4, 252, 1, 0, 0, 0, '2020-08-23 03:24:46'),
(1163, 4, 14, 1, 0, 0, 0, '2020-08-23 03:27:14'),
(1164, 4, 176, 1, 0, 0, 0, '2020-08-28 08:26:27'),
(1165, 4, 203, 1, 0, 0, 0, '2020-08-28 08:26:27'),
(1166, 4, 228, 1, 0, 0, 0, '2020-08-28 08:26:27'),
(1171, 4, 247, 1, 0, 0, 0, '2020-08-28 08:26:27'),
(1184, 4, 214, 1, 0, 0, 0, '2020-08-28 08:26:27'),
(1185, 4, 215, 1, 0, 0, 0, '2020-08-28 08:26:27'),
(1186, 4, 240, 1, 0, 0, 0, '2020-08-28 08:26:27'),
(1187, 4, 241, 1, 1, 1, 1, '2020-08-23 03:48:55'),
(1188, 4, 242, 1, 1, 1, 1, '2020-08-23 03:49:50'),
(1204, 4, 249, 1, 1, 1, 1, '2020-08-23 04:10:21'),
(1205, 4, 43, 1, 1, 1, 1, '2020-08-28 08:26:27'),
(1208, 4, 27, 1, 1, 0, 1, '2020-08-23 04:13:31'),
(1230, 4, 179, 1, 0, 0, 0, '2020-08-23 04:31:41'),
(1254, 4, 256, 1, 0, 0, 0, '2020-08-23 04:40:36'),
(1269, 4, 274, 1, 0, 0, 0, '2020-08-23 04:46:38'),
(1270, 4, 118, 1, 0, 0, 0, '2020-08-23 04:46:51'),
(1271, 4, 155, 1, 0, 0, 0, '2020-08-23 04:47:34'),
(1272, 4, 156, 1, 0, 0, 0, '2020-08-23 04:47:49'),
(1273, 4, 157, 1, 0, 0, 0, '2020-08-23 04:47:59'),
(1274, 4, 158, 1, 0, 0, 0, '2020-08-23 04:48:10'),
(1275, 4, 159, 1, 0, 0, 0, '2020-08-23 04:48:20'),
(1276, 4, 160, 1, 0, 0, 0, '2020-08-23 04:48:30'),
(1277, 4, 161, 1, 0, 0, 0, '2020-08-23 04:48:39'),
(1278, 4, 162, 1, 0, 0, 0, '2020-08-23 04:48:48'),
(1279, 4, 190, 1, 0, 0, 0, '2020-08-23 04:48:59'),
(1280, 4, 191, 1, 0, 0, 0, '2020-08-23 04:49:10'),
(1281, 4, 238, 1, 0, 0, 0, '2020-08-23 04:49:20'),
(1282, 4, 236, 1, 0, 0, 0, '2020-08-28 08:26:27'),
(1287, 4, 102, 1, 1, 1, 1, '2020-08-23 04:53:17'),
(1291, 4, 148, 1, 1, 1, 1, '2020-08-25 05:12:23'),
(1295, 1, 88, 1, 1, 1, 0, '2020-08-25 01:27:16'),
(1304, 4, 44, 1, 0, 0, 0, '2020-08-25 05:51:16'),
(1314, 4, 109, 1, 1, 0, 1, '2020-08-25 23:41:03'),
(1316, 1, 279, 1, 1, 1, 1, '2020-08-26 01:33:11'),
(1320, 1, 260, 1, 1, 1, 1, '2020-08-28 07:04:54'),
(1321, 1, 263, 1, 1, 1, 1, '2020-08-28 07:04:54'),
(1322, 1, 275, 1, 0, 0, 0, '2020-08-28 07:04:54'),
(1323, 1, 277, 1, 0, 0, 0, '2020-08-28 07:04:54'),
(1324, 1, 261, 1, 1, 1, 1, '2020-08-28 07:04:54'),
(1325, 1, 262, 1, 1, 1, 1, '2020-08-28 07:04:54'),
(1326, 1, 276, 1, 0, 0, 0, '2020-08-28 07:04:54'),
(1327, 1, 278, 1, 0, 0, 0, '2020-08-28 07:04:54'),
(1328, 1, 264, 1, 1, 0, 1, '2020-08-28 07:04:54'),
(1329, 1, 127, 1, 0, 0, 0, '2020-08-28 07:04:54'),
(1330, 1, 62, 1, 1, 0, 1, '2020-08-28 07:04:54'),
(1331, 1, 265, 1, 0, 0, 0, '2020-08-28 07:04:54'),
(1332, 1, 266, 1, 0, 0, 0, '2020-08-28 07:04:54'),
(1333, 2, 275, 1, 0, 0, 0, '2020-08-28 22:11:55'),
(1334, 2, 276, 1, 0, 0, 0, '2020-08-28 22:11:55'),
(1335, 2, 266, 1, 0, 0, 0, '2020-08-28 22:11:55'),
(1336, 2, 274, 1, 0, 0, 0, '2020-08-28 22:11:55'),
(1337, 3, 268, 0, 0, 1, 0, '2020-08-28 22:25:27'),
(1338, 3, 279, 1, 0, 0, 0, '2020-08-28 22:25:27'),
(1339, 4, 86, 1, 0, 0, 0, '2020-08-28 22:33:24'),
(1340, 5, 275, 1, 0, 0, 0, '2020-08-28 22:40:17'),
(1341, 5, 277, 1, 0, 0, 0, '2020-08-28 22:40:17'),
(1342, 5, 270, 1, 0, 0, 0, '2020-08-28 22:40:17'),
(1343, 2, 270, 1, 0, 0, 0, '2020-08-28 22:40:54'),
(1344, 3, 269, 1, 1, 0, 1, '2020-08-28 22:42:09'),
(1345, 4, 270, 1, 0, 0, 0, '2020-08-28 22:42:29'),
(1346, 6, 261, 1, 1, 1, 1, '2020-08-28 22:48:58'),
(1347, 6, 262, 1, 1, 1, 1, '2020-08-28 22:48:58'),
(1348, 6, 276, 1, 0, 0, 0, '2020-08-28 22:48:58'),
(1349, 6, 278, 1, 0, 0, 0, '2020-08-28 22:48:58'),
(1350, 6, 270, 1, 0, 0, 0, '2020-08-28 22:48:58'),
(1351, 5, 260, 1, 1, 1, 1, '2020-08-28 22:51:14'),
(1352, 5, 263, 1, 1, 1, 1, '2020-08-28 22:51:14'),
(1353, 8, 147, 1, 0, 0, 0, '2020-08-28 23:01:41'),
(1354, 8, 200, 1, 0, 0, 0, '2020-08-28 23:01:41'),
(1355, 8, 164, 1, 0, 0, 0, '2020-08-28 23:01:41'),
(1356, 8, 80, 1, 1, 1, 1, '2020-08-28 23:01:41'),
(1357, 8, 270, 1, 0, 0, 0, '2020-08-28 23:01:41'),
(1358, 6, 244, 1, 1, 1, 1, '2020-08-28 23:12:16');

-- --------------------------------------------------------

--
-- Table structure for table `sch_settings`
--

CREATE TABLE `sch_settings` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `address` text,
  `start_month` varchar(100) NOT NULL,
  `session_id` int(11) DEFAULT NULL,
  `lang_id` int(11) DEFAULT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sch_settings`
--

INSERT INTO `sch_settings` (`id`, `name`, `email`, `phone`, `address`, `start_month`, `session_id`, `lang_id`, `languages`, `dise_code`, `date_format`, `time_format`, `currency`, `currency_symbol`, `is_rtl`, `timezone`, `image`, `mini_logo`, `theme`, `credit_limit`, `opd_record_month`, `is_active`, `created_at`, `cron_secret_key`, `doctor_restriction`, `superadmin_restriction`, `mobile_api_url`, `app_primary_color_code`, `app_secondary_color_code`, `app_logo`, `zoom_api_key`, `zoom_api_secret`) VALUES
(0, 'Your Hospital Name', 'Your Hospital Email', 'Your Hospital Phone', 'Your Hospital Address', '', NULL, 4, '["4"]', 'Your Hospital Code', 'd-m-Y', '12-hour', 'USD', '$', 'disabled', 'UTC', '0.png', '0mini_logo.png', 'default.jpg', '20000', '1', 'no', '2019-11-01 12:29:48', '', 'disabled', 'enabled', '', '', '', '0app_logo.png', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `send_notification`
--

CREATE TABLE `send_notification` (
  `id` int(11) NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  `publish_date` date DEFAULT NULL,
  `date` date DEFAULT NULL,
  `message` text,
  `visible_staff` varchar(10) NOT NULL DEFAULT 'no',
  `visible_patient` varchar(10) NOT NULL DEFAULT 'no',
  `created_by` varchar(60) DEFAULT NULL,
  `created_id` int(11) DEFAULT NULL,
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sms_config`
--

CREATE TABLE `sms_config` (
  `id` int(11) NOT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `source`
--

CREATE TABLE `source` (
  `id` int(11) NOT NULL,
  `source` varchar(100) NOT NULL,
  `description` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `specialist`
--

CREATE TABLE `specialist` (
  `id` int(11) NOT NULL,
  `specialist_name` varchar(200) NOT NULL,
  `is_active` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `id` int(11) NOT NULL,
  `employee_id` varchar(200) NOT NULL,
  `lang_id` int(11) NOT NULL,
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
  `user_id` int(11) NOT NULL,
  `is_active` int(11) NOT NULL,
  `verification_code` varchar(100) NOT NULL,
  `zoom_api_key` varchar(100) NOT NULL,
  `zoom_api_secret` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `staff_attendance`
--

CREATE TABLE `staff_attendance` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `staff_id` int(11) NOT NULL,
  `staff_attendance_type_id` int(11) NOT NULL,
  `remark` varchar(200) NOT NULL,
  `is_active` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `staff_attendance_type`
--

CREATE TABLE `staff_attendance_type` (
  `id` int(11) NOT NULL,
  `type` varchar(200) NOT NULL,
  `key_value` varchar(200) NOT NULL,
  `is_active` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `staff_attendance_type`
--

INSERT INTO `staff_attendance_type` (`id`, `type`, `key_value`, `is_active`, `created_at`) VALUES
(1, 'Present', '<b class="text text-success">P</b>', 'yes', '0000-00-00 00:00:00'),
(2, 'Late', '<b class="text text-warning">L</b>', 'yes', '0000-00-00 00:00:00'),
(3, 'Absent', '<b class="text text-danger">A</b>', 'yes', '0000-00-00 00:00:00'),
(4, 'Half Day', '<b class="text text-warning">F</b>', 'yes', '2018-05-07 01:56:16'),
(5, 'Holiday', 'H', 'yes', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `staff_designation`
--

CREATE TABLE `staff_designation` (
  `id` int(11) NOT NULL,
  `designation` varchar(200) NOT NULL,
  `is_active` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `staff_leave_details`
--

CREATE TABLE `staff_leave_details` (
  `id` int(11) NOT NULL,
  `staff_id` int(11) NOT NULL,
  `leave_type_id` int(11) NOT NULL,
  `alloted_leave` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `staff_leave_request`
--

CREATE TABLE `staff_leave_request` (
  `id` int(11) NOT NULL,
  `staff_id` int(11) NOT NULL,
  `leave_type_id` int(11) NOT NULL,
  `leave_from` date NOT NULL,
  `leave_to` date NOT NULL,
  `leave_days` int(11) NOT NULL,
  `employee_remark` varchar(200) NOT NULL,
  `admin_remark` varchar(200) NOT NULL,
  `status` varchar(100) NOT NULL,
  `applied_by` varchar(200) NOT NULL,
  `document_file` varchar(200) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `staff_payroll`
--

CREATE TABLE `staff_payroll` (
  `id` int(11) NOT NULL,
  `basic_salary` int(11) NOT NULL,
  `pay_scale` varchar(200) NOT NULL,
  `grade` varchar(50) NOT NULL,
  `is_active` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `staff_payslip`
--

CREATE TABLE `staff_payslip` (
  `id` int(11) NOT NULL,
  `staff_id` int(11) NOT NULL,
  `basic` float NOT NULL,
  `total_allowance` float NOT NULL,
  `total_deduction` float NOT NULL,
  `leave_deduction` int(11) NOT NULL,
  `tax` decimal(15,2) NOT NULL,
  `net_salary` float NOT NULL,
  `status` varchar(100) NOT NULL,
  `month` varchar(200) NOT NULL,
  `year` varchar(200) NOT NULL,
  `payment_mode` varchar(200) NOT NULL,
  `payment_date` date NOT NULL,
  `remark` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `staff_roles`
--

CREATE TABLE `staff_roles` (
  `id` int(11) NOT NULL,
  `role_id` int(11) DEFAULT NULL,
  `staff_id` int(11) DEFAULT NULL,
  `is_active` int(11) DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `staff_timeline`
--

CREATE TABLE `staff_timeline` (
  `id` int(11) NOT NULL,
  `staff_id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `timeline_date` date NOT NULL,
  `description` varchar(300) NOT NULL,
  `document` varchar(200) NOT NULL,
  `status` varchar(200) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `supplier_bill_basic`
--

CREATE TABLE `supplier_bill_basic` (
  `id` int(11) NOT NULL,
  `purchase_no` varchar(200) NOT NULL,
  `invoice_no` varchar(100) NOT NULL,
  `date` varchar(200) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `supplier_name` varchar(200) NOT NULL,
  `file` varchar(200) NOT NULL,
  `total` varchar(200) NOT NULL,
  `tax` varchar(200) NOT NULL,
  `discount` varchar(200) NOT NULL,
  `net_amount` varchar(200) NOT NULL,
  `note` varchar(200) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `supplier_bill_detail`
--

CREATE TABLE `supplier_bill_detail` (
  `id` int(11) NOT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `supplier_category`
--

CREATE TABLE `supplier_category` (
  `id` int(11) NOT NULL,
  `supplier_category` varchar(200) NOT NULL,
  `contact` varchar(200) NOT NULL,
  `supplier_person` varchar(200) NOT NULL,
  `supplier_person_contact` varchar(200) NOT NULL,
  `address` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `symptoms`
--

CREATE TABLE `symptoms` (
  `id` int(11) NOT NULL,
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
  `id` int(11) NOT NULL,
  `symptoms_type` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `system_notification`
--

CREATE TABLE `system_notification` (
  `id` int(11) NOT NULL,
  `notification_title` varchar(200) NOT NULL,
  `notification_type` varchar(200) NOT NULL,
  `notification_desc` varchar(200) NOT NULL,
  `notification_for` varchar(200) NOT NULL,
  `receiver_id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `is_active` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `test_type_report`
--

CREATE TABLE `test_type_report` (
  `id` int(11) NOT NULL,
  `radiology_id` int(11) NOT NULL,
  `type` varchar(100) DEFAULT NULL,
  `test_name` varchar(100) DEFAULT NULL,
  `reporting_date` date DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `test_report` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tpa_doctorcharges`
--

CREATE TABLE `tpa_doctorcharges` (
  `id` int(11) NOT NULL,
  `org_id` int(11) NOT NULL,
  `charge_id` int(11) NOT NULL,
  `org_charge` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tpa_master`
--

CREATE TABLE `tpa_master` (
  `id` int(11) NOT NULL,
  `organisation` varchar(200) NOT NULL,
  `charge_id` int(11) NOT NULL,
  `organisation_charge` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `unit`
--

CREATE TABLE `unit` (
  `id` int(11) NOT NULL,
  `unit_name` varchar(100) NOT NULL,
  `unit_type` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `userlog`
--

CREATE TABLE `userlog` (
  `id` int(11) NOT NULL,
  `user` varchar(100) DEFAULT NULL,
  `role` varchar(100) DEFAULT NULL,
  `ipaddress` varchar(100) DEFAULT NULL,
  `user_agent` varchar(500) DEFAULT NULL,
  `login_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `user_id` int(10) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `childs` text NOT NULL,
  `role` varchar(30) NOT NULL,
  `verification_code` varchar(200) NOT NULL,
  `is_active` varchar(255) DEFAULT 'yes',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `users_authentication`
--

CREATE TABLE `users_authentication` (
  `id` int(11) NOT NULL,
  `users_id` int(11) NOT NULL,
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
  `id` int(10) UNSIGNED NOT NULL,
  `vehicle_no` varchar(20) DEFAULT NULL,
  `vehicle_model` varchar(100) NOT NULL DEFAULT 'None',
  `manufacture_year` varchar(4) DEFAULT NULL,
  `vehicle_type` varchar(100) NOT NULL,
  `driver_name` varchar(50) DEFAULT NULL,
  `driver_licence` varchar(50) NOT NULL DEFAULT 'None',
  `driver_contact` varchar(20) DEFAULT NULL,
  `note` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `visitors_book`
--

CREATE TABLE `visitors_book` (
  `id` int(11) NOT NULL,
  `source` varchar(100) DEFAULT NULL,
  `purpose` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `contact` varchar(12) NOT NULL,
  `id_proof` varchar(50) NOT NULL,
  `no_of_pepple` int(11) NOT NULL,
  `date` date NOT NULL,
  `in_time` varchar(20) NOT NULL,
  `out_time` varchar(20) NOT NULL,
  `note` mediumtext NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `visitors_purpose`
--

CREATE TABLE `visitors_purpose` (
  `id` int(11) NOT NULL,
  `visitors_purpose` varchar(100) NOT NULL,
  `description` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `visit_details`
--

CREATE TABLE `visit_details` (
  `id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `opd_id` int(11) NOT NULL,
  `opd_no` varchar(100) NOT NULL,
  `cons_doctor` int(11) NOT NULL,
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
  `generated_by` int(11) NOT NULL,
  `discharged` varchar(200) NOT NULL,
  `live_consult` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `zoom_settings`
--

CREATE TABLE `zoom_settings` (
  `id` int(11) NOT NULL,
  `zoom_api_key` varchar(200) DEFAULT NULL,
  `zoom_api_secret` varchar(200) DEFAULT NULL,
  `use_doctor_api` int(1) DEFAULT '1',
  `use_zoom_app` int(1) DEFAULT '1',
  `opd_duration` int(11) DEFAULT NULL,
  `ipd_duration` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `zoom_settings`
--

INSERT INTO `zoom_settings` (`id`, `zoom_api_key`, `zoom_api_secret`, `use_doctor_api`, `use_zoom_app`, `opd_duration`, `ipd_duration`, `created_at`) VALUES
(1, NULL, NULL, 1, 1, 0, 0, '0000-00-00 00:00:00');

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
-- Indexes for table `notification_setting`
--
ALTER TABLE `notification_setting`
  ADD PRIMARY KEY (`id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `appointment`
--
ALTER TABLE `appointment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `appoint_priority`
--
ALTER TABLE `appoint_priority`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `bed`
--
ALTER TABLE `bed`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `bed_group`
--
ALTER TABLE `bed_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `bed_type`
--
ALTER TABLE `bed_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `birth_report`
--
ALTER TABLE `birth_report`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `blood_bank_status`
--
ALTER TABLE `blood_bank_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `blood_donor`
--
ALTER TABLE `blood_donor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `blood_donor_cycle`
--
ALTER TABLE `blood_donor_cycle`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `blood_issue`
--
ALTER TABLE `blood_issue`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `charges`
--
ALTER TABLE `charges`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `charge_categories`
--
ALTER TABLE `charge_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `charge_type_master`
--
ALTER TABLE `charge_type_master`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `complaint`
--
ALTER TABLE `complaint`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `complaint_type`
--
ALTER TABLE `complaint_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `conferences`
--
ALTER TABLE `conferences`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `conferences_history`
--
ALTER TABLE `conferences_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `conference_staff`
--
ALTER TABLE `conference_staff`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `consultant_register`
--
ALTER TABLE `consultant_register`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `consult_charges`
--
ALTER TABLE `consult_charges`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `contents`
--
ALTER TABLE `contents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `content_for`
--
ALTER TABLE `content_for`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `custom_fields`
--
ALTER TABLE `custom_fields`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `custom_field_values`
--
ALTER TABLE `custom_field_values`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `death_report`
--
ALTER TABLE `death_report`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `diagnosis`
--
ALTER TABLE `diagnosis`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `discharged_summary`
--
ALTER TABLE `discharged_summary`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `discharged_summary_opd`
--
ALTER TABLE `discharged_summary_opd`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `dispatch_receive`
--
ALTER TABLE `dispatch_receive`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `email_config`
--
ALTER TABLE `email_config`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `enquiry`
--
ALTER TABLE `enquiry`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `enquiry_type`
--
ALTER TABLE `enquiry_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `expense_head`
--
ALTER TABLE `expense_head`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `floor`
--
ALTER TABLE `floor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `follow_up`
--
ALTER TABLE `follow_up`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `front_cms_media_gallery`
--
ALTER TABLE `front_cms_media_gallery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `front_cms_menus`
--
ALTER TABLE `front_cms_menus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `front_cms_menu_items`
--
ALTER TABLE `front_cms_menu_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT for table `front_cms_pages`
--
ALTER TABLE `front_cms_pages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;
--
-- AUTO_INCREMENT for table `front_cms_page_contents`
--
ALTER TABLE `front_cms_page_contents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `front_cms_programs`
--
ALTER TABLE `front_cms_programs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `front_cms_program_photos`
--
ALTER TABLE `front_cms_program_photos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `front_cms_settings`
--
ALTER TABLE `front_cms_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `general_calls`
--
ALTER TABLE `general_calls`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `income`
--
ALTER TABLE `income`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `income_head`
--
ALTER TABLE `income_head`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ipd_billing`
--
ALTER TABLE `ipd_billing`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ipd_details`
--
ALTER TABLE `ipd_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ipd_prescription_basic`
--
ALTER TABLE `ipd_prescription_basic`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ipd_prescription_details`
--
ALTER TABLE `ipd_prescription_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `item`
--
ALTER TABLE `item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `item_category`
--
ALTER TABLE `item_category`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `item_issue`
--
ALTER TABLE `item_issue`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `item_stock`
--
ALTER TABLE `item_stock`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `item_store`
--
ALTER TABLE `item_store`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `item_supplier`
--
ALTER TABLE `item_supplier`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `lab`
--
ALTER TABLE `lab`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;
--
-- AUTO_INCREMENT for table `leave_types`
--
ALTER TABLE `leave_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `medicine_bad_stock`
--
ALTER TABLE `medicine_bad_stock`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `medicine_batch_details`
--
ALTER TABLE `medicine_batch_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `medicine_category`
--
ALTER TABLE `medicine_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `medicine_dosage`
--
ALTER TABLE `medicine_dosage`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `notification_roles`
--
ALTER TABLE `notification_roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `notification_setting`
--
ALTER TABLE `notification_setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `opd_billing`
--
ALTER TABLE `opd_billing`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `opd_details`
--
ALTER TABLE `opd_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `opd_patient_charges`
--
ALTER TABLE `opd_patient_charges`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `opd_payment`
--
ALTER TABLE `opd_payment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `operation_theatre`
--
ALTER TABLE `operation_theatre`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `organisation`
--
ALTER TABLE `organisation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `organisations_charges`
--
ALTER TABLE `organisations_charges`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ot_consultant_register`
--
ALTER TABLE `ot_consultant_register`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pathology`
--
ALTER TABLE `pathology`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pathology_category`
--
ALTER TABLE `pathology_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pathology_parameter`
--
ALTER TABLE `pathology_parameter`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pathology_parameterdetails`
--
ALTER TABLE `pathology_parameterdetails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pathology_report`
--
ALTER TABLE `pathology_report`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pathology_report_parameterdetails`
--
ALTER TABLE `pathology_report_parameterdetails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `patients`
--
ALTER TABLE `patients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `patient_charges`
--
ALTER TABLE `patient_charges`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `patient_timeline`
--
ALTER TABLE `patient_timeline`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `payment_settings`
--
ALTER TABLE `payment_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `payslip_allowance`
--
ALTER TABLE `payslip_allowance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `permission_category`
--
ALTER TABLE `permission_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=283;
--
-- AUTO_INCREMENT for table `permission_group`
--
ALTER TABLE `permission_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;
--
-- AUTO_INCREMENT for table `pharmacy`
--
ALTER TABLE `pharmacy`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pharmacy_bill_basic`
--
ALTER TABLE `pharmacy_bill_basic`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pharmacy_bill_detail`
--
ALTER TABLE `pharmacy_bill_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `prescription`
--
ALTER TABLE `prescription`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `print_setting`
--
ALTER TABLE `print_setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `radio`
--
ALTER TABLE `radio`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `radiology_parameter`
--
ALTER TABLE `radiology_parameter`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `radiology_parameterdetails`
--
ALTER TABLE `radiology_parameterdetails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `radiology_report`
--
ALTER TABLE `radiology_report`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `radiology_report_parameterdetails`
--
ALTER TABLE `radiology_report_parameterdetails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `read_notification`
--
ALTER TABLE `read_notification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `read_systemnotification`
--
ALTER TABLE `read_systemnotification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `roles_permissions`
--
ALTER TABLE `roles_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1359;
--
-- AUTO_INCREMENT for table `send_notification`
--
ALTER TABLE `send_notification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sms_config`
--
ALTER TABLE `sms_config`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `source`
--
ALTER TABLE `source`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `specialist`
--
ALTER TABLE `specialist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `staff_attendance`
--
ALTER TABLE `staff_attendance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `staff_attendance_type`
--
ALTER TABLE `staff_attendance_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `staff_designation`
--
ALTER TABLE `staff_designation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `staff_leave_details`
--
ALTER TABLE `staff_leave_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `staff_leave_request`
--
ALTER TABLE `staff_leave_request`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `staff_payroll`
--
ALTER TABLE `staff_payroll`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `staff_payslip`
--
ALTER TABLE `staff_payslip`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `staff_roles`
--
ALTER TABLE `staff_roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `staff_timeline`
--
ALTER TABLE `staff_timeline`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `supplier_bill_basic`
--
ALTER TABLE `supplier_bill_basic`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `supplier_bill_detail`
--
ALTER TABLE `supplier_bill_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `supplier_category`
--
ALTER TABLE `supplier_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `symptoms`
--
ALTER TABLE `symptoms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `symptoms_classification`
--
ALTER TABLE `symptoms_classification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `system_notification`
--
ALTER TABLE `system_notification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `test_type_report`
--
ALTER TABLE `test_type_report`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tpa_doctorcharges`
--
ALTER TABLE `tpa_doctorcharges`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tpa_master`
--
ALTER TABLE `tpa_master`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `unit`
--
ALTER TABLE `unit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `userlog`
--
ALTER TABLE `userlog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `users_authentication`
--
ALTER TABLE `users_authentication`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `vehicles`
--
ALTER TABLE `vehicles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `visitors_book`
--
ALTER TABLE `visitors_book`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `visitors_purpose`
--
ALTER TABLE `visitors_purpose`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `visit_details`
--
ALTER TABLE `visit_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `zoom_settings`
--
ALTER TABLE `zoom_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
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

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

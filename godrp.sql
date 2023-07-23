-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 23, 2023 at 06:13 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `godrp`
--

-- --------------------------------------------------------

--
-- Table structure for table `apartments`
--

CREATE TABLE `apartments` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `citizenid` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `apartments`
--

INSERT INTO `apartments` (`id`, `name`, `type`, `label`, `citizenid`) VALUES
(1, 'apartment54246', 'apartment5', 'Fantastic Plaza 4246', 'RYL88153');

-- --------------------------------------------------------

--
-- Table structure for table `bank_accounts`
--

CREATE TABLE `bank_accounts` (
  `record_id` bigint(255) NOT NULL,
  `citizenid` varchar(250) DEFAULT NULL,
  `business` varchar(50) DEFAULT NULL,
  `businessid` int(11) DEFAULT NULL,
  `gangid` varchar(50) DEFAULT NULL,
  `amount` bigint(255) NOT NULL DEFAULT 0,
  `account_type` enum('Current','Savings','business','Gang') NOT NULL DEFAULT 'Current'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bank_cards`
--

CREATE TABLE `bank_cards` (
  `record_id` bigint(255) NOT NULL,
  `citizenid` varchar(50) NOT NULL,
  `cardNumber` varchar(50) DEFAULT NULL,
  `cardPin` varchar(50) DEFAULT NULL,
  `cardActive` tinyint(4) DEFAULT 1,
  `cardLocked` tinyint(4) DEFAULT 0,
  `cardType` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bank_statements`
--

CREATE TABLE `bank_statements` (
  `record_id` bigint(255) NOT NULL,
  `citizenid` varchar(50) DEFAULT NULL,
  `account` varchar(50) DEFAULT NULL,
  `business` varchar(50) DEFAULT NULL,
  `businessid` int(11) DEFAULT NULL,
  `gangid` varchar(50) DEFAULT NULL,
  `deposited` int(11) DEFAULT NULL,
  `withdraw` int(11) DEFAULT NULL,
  `balance` int(11) DEFAULT NULL,
  `date` varchar(50) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bans`
--

CREATE TABLE `bans` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `license` varchar(50) DEFAULT NULL,
  `discord` varchar(50) DEFAULT NULL,
  `ip` varchar(50) DEFAULT NULL,
  `reason` text DEFAULT NULL,
  `expire` int(11) DEFAULT NULL,
  `bannedby` varchar(255) NOT NULL DEFAULT 'LeBanhammer'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `crypto`
--

CREATE TABLE `crypto` (
  `crypto` varchar(50) NOT NULL DEFAULT 'qbit',
  `worth` int(11) NOT NULL DEFAULT 0,
  `history` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `crypto`
--

INSERT INTO `crypto` (`crypto`, `worth`, `history`) VALUES
('qbit', 995, '[{\"PreviousWorth\":999,\"NewWorth\":999},{\"PreviousWorth\":999,\"NewWorth\":999},{\"PreviousWorth\":999,\"NewWorth\":999},{\"PreviousWorth\":999,\"NewWorth\":995}]');

-- --------------------------------------------------------

--
-- Table structure for table `crypto_transactions`
--

CREATE TABLE `crypto_transactions` (
  `id` int(11) NOT NULL,
  `citizenid` varchar(50) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `message` varchar(50) DEFAULT NULL,
  `date` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dealers`
--

CREATE TABLE `dealers` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL DEFAULT '0',
  `coords` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `time` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `createdby` varchar(50) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ethicalpixel_admin`
--

CREATE TABLE `ethicalpixel_admin` (
  `id` int(11) NOT NULL,
  `cid` varchar(50) DEFAULT NULL,
  `favorite` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`favorite`))
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `ethicalpixel_admin`
--

INSERT INTO `ethicalpixel_admin` (`id`, `cid`, `favorite`) VALUES
(4, 'WAC28700', '[{\"name\":\"changemodel\"},{\"name\":\"ban\"},{\"name\":\"bring\"},{\"name\":\"csay\"},{\"name\":\"fixvehicle\"},{\"name\":\"givecash\"},{\"name\":\"godmode\"},{\"name\":\"noclip\"},{\"name\":\"clothes\"}]');

-- --------------------------------------------------------

--
-- Table structure for table `ethicalpixel_admin_banned`
--

CREATE TABLE `ethicalpixel_admin_banned` (
  `id` int(11) NOT NULL,
  `steam` varchar(50) DEFAULT NULL,
  `reason` varchar(50) DEFAULT NULL,
  `length` varchar(50) DEFAULT NULL,
  `ip` varchar(50) DEFAULT NULL,
  `discord` varchar(50) DEFAULT NULL,
  `license` varchar(50) DEFAULT NULL,
  `DisplayName` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ethicalpixel_admin_log`
--

CREATE TABLE `ethicalpixel_admin_log` (
  `id` int(11) NOT NULL,
  `Identifier` varchar(50) DEFAULT NULL,
  `log` longtext DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `date` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gloveboxitems`
--

CREATE TABLE `gloveboxitems` (
  `id` int(11) NOT NULL,
  `plate` varchar(255) NOT NULL DEFAULT '[]',
  `items` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `houselocations`
--

CREATE TABLE `houselocations` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `coords` text DEFAULT NULL,
  `owned` tinyint(1) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `tier` tinyint(4) DEFAULT NULL,
  `garage` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `house_plants`
--

CREATE TABLE `house_plants` (
  `id` int(11) NOT NULL,
  `building` varchar(50) DEFAULT NULL,
  `stage` varchar(50) DEFAULT 'stage-a',
  `sort` varchar(50) DEFAULT NULL,
  `gender` varchar(50) DEFAULT NULL,
  `food` int(11) DEFAULT 100,
  `health` int(11) DEFAULT 100,
  `progress` int(11) DEFAULT 0,
  `coords` text DEFAULT NULL,
  `plantid` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lapraces`
--

CREATE TABLE `lapraces` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `checkpoints` text DEFAULT NULL,
  `records` text DEFAULT NULL,
  `creator` varchar(50) DEFAULT NULL,
  `distance` int(11) DEFAULT NULL,
  `raceid` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `management_funds`
--

CREATE TABLE `management_funds` (
  `id` int(11) NOT NULL,
  `job_name` varchar(50) NOT NULL,
  `amount` int(100) NOT NULL,
  `type` enum('boss','gang') NOT NULL DEFAULT 'boss'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `management_funds`
--

INSERT INTO `management_funds` (`id`, `job_name`, `amount`, `type`) VALUES
(1, 'police', 0, 'boss'),
(2, 'ambulance', 0, 'boss'),
(3, 'realestate', 0, 'boss'),
(4, 'taxi', 0, 'boss'),
(5, 'cardealer', 0, 'boss'),
(6, 'mechanic', 0, 'boss'),
(7, 'lostmc', 0, 'gang'),
(8, 'ballas', 0, 'gang'),
(9, 'vagos', 0, 'gang'),
(10, 'cartel', 0, 'gang'),
(11, 'families', 0, 'gang'),
(12, 'triads', 0, 'gang');

-- --------------------------------------------------------

--
-- Table structure for table `ns_mdt_call`
--

CREATE TABLE `ns_mdt_call` (
  `id` int(11) NOT NULL,
  `emergency_type` tinyint(1) NOT NULL,
  `police_required` tinyint(1) NOT NULL,
  `ambulance_required` tinyint(1) NOT NULL,
  `fire_required` tinyint(1) NOT NULL,
  `description` varchar(5000) NOT NULL,
  `callername` varchar(100) NOT NULL,
  `contact_details` varchar(100) NOT NULL,
  `area` varchar(100) NOT NULL,
  `postal` varchar(25) NOT NULL,
  `street` varchar(100) NOT NULL,
  `calltrackedby` varchar(5000) NOT NULL,
  `call_coords_x` decimal(10,6) NOT NULL,
  `call_coords_y` decimal(10,6) NOT NULL,
  `call_coords_z` decimal(10,6) NOT NULL,
  `archived_call` tinyint(1) NOT NULL DEFAULT 0,
  `call_time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ns_mdt_civilian`
--

CREATE TABLE `ns_mdt_civilian` (
  `id` int(11) NOT NULL,
  `profile_picture_url` varchar(250) DEFAULT NULL,
  `first_name` varchar(25) NOT NULL,
  `last_name` varchar(25) NOT NULL,
  `dob` date DEFAULT NULL,
  `gender` varchar(25) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone_number` varchar(25) NOT NULL,
  `address_line_1` varchar(100) NOT NULL,
  `address_line_2` varchar(25) DEFAULT NULL,
  `city` varchar(25) NOT NULL,
  `state` varchar(25) NOT NULL,
  `postal_code` varchar(25) NOT NULL,
  `country` varchar(25) NOT NULL,
  `occupation` varchar(25) NOT NULL,
  `nationality` varchar(25) NOT NULL,
  `license_car` tinyint(1) NOT NULL,
  `license_bike` tinyint(1) NOT NULL,
  `license_truck` tinyint(1) NOT NULL,
  `license_boat` tinyint(1) NOT NULL,
  `license_pilot` tinyint(1) NOT NULL,
  `user_steam_id` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ns_mdt_marker`
--

CREATE TABLE `ns_mdt_marker` (
  `id` int(11) NOT NULL,
  `armed_and_dangerous` tinyint(1) NOT NULL,
  `assault` tinyint(1) NOT NULL,
  `burglary` tinyint(1) NOT NULL,
  `drug_related` tinyint(1) NOT NULL,
  `gang_affiliation` tinyint(1) NOT NULL,
  `homicide` tinyint(1) NOT NULL,
  `kidnapping` tinyint(1) NOT NULL,
  `mental_health_issues` tinyint(1) NOT NULL,
  `sex_offense` tinyint(1) NOT NULL,
  `terrorism` tinyint(1) NOT NULL,
  `theft` tinyint(1) NOT NULL,
  `traffic_violation` tinyint(1) NOT NULL,
  `wanted_person` tinyint(1) NOT NULL,
  `other` tinyint(1) NOT NULL,
  `flag_description` varchar(5000) NOT NULL,
  `active_warrant` tinyint(1) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` varchar(500) NOT NULL,
  `civ_id` int(11) NOT NULL,
  `user_steam_id` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ns_mdt_operations`
--

CREATE TABLE `ns_mdt_operations` (
  `id` int(11) NOT NULL,
  `report_type` varchar(50) NOT NULL,
  `sub_report_type` varchar(500) NOT NULL,
  `employee_involved` varchar(500) NOT NULL,
  `civilian_involved` varchar(500) NOT NULL,
  `vehicle_involved` varchar(500) NOT NULL,
  `location` varchar(100) NOT NULL,
  `description` varchar(5000) NOT NULL,
  `report_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `signature` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ns_mdt_police_fine`
--

CREATE TABLE `ns_mdt_police_fine` (
  `id` int(11) NOT NULL,
  `fine_type` varchar(50) NOT NULL,
  `fine_description` varchar(5000) NOT NULL,
  `fine_amount` decimal(10,2) NOT NULL,
  `fine_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fine_location` varchar(250) NOT NULL,
  `issuing_officer` varchar(50) NOT NULL,
  `due_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `paid` tinyint(1) NOT NULL,
  `civ_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ns_mdt_police_report`
--

CREATE TABLE `ns_mdt_police_report` (
  `id` int(11) NOT NULL,
  `charge` varchar(500) NOT NULL,
  `description` varchar(5000) NOT NULL,
  `victims` varchar(500) NOT NULL,
  `location` varchar(500) NOT NULL,
  `officer` varchar(49) NOT NULL,
  `sentence` varchar(500) NOT NULL,
  `report_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `prosecuted` tinyint(1) NOT NULL,
  `civ_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ns_mdt_user`
--

CREATE TABLE `ns_mdt_user` (
  `steam_id` varchar(100) NOT NULL,
  `discord_id` varchar(100) NOT NULL,
  `name` varchar(500) NOT NULL,
  `shift_time` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ns_mdt_vehicle`
--

CREATE TABLE `ns_mdt_vehicle` (
  `id` int(11) NOT NULL,
  `vehicle_picture_url` varchar(250) DEFAULT NULL,
  `license_plate` varchar(8) NOT NULL,
  `make` varchar(50) NOT NULL,
  `model` varchar(50) NOT NULL,
  `color` varchar(50) NOT NULL,
  `build_year` year(4) NOT NULL,
  `registration_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `tax` tinyint(1) NOT NULL,
  `mot` tinyint(1) NOT NULL,
  `insurance` tinyint(1) NOT NULL,
  `stolen` tinyint(1) NOT NULL,
  `bolo` tinyint(1) NOT NULL,
  `bolo_description` varchar(5000) NOT NULL,
  `civ_id` int(11) NOT NULL,
  `user_steam_id` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `occasion_vehicles`
--

CREATE TABLE `occasion_vehicles` (
  `id` int(11) NOT NULL,
  `seller` varchar(50) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `plate` varchar(50) DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  `mods` text DEFAULT NULL,
  `occasionid` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phone_gallery`
--

CREATE TABLE `phone_gallery` (
  `citizenid` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `date` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phone_invoices`
--

CREATE TABLE `phone_invoices` (
  `id` int(10) NOT NULL,
  `citizenid` varchar(50) DEFAULT NULL,
  `amount` int(11) NOT NULL DEFAULT 0,
  `society` tinytext DEFAULT NULL,
  `sender` varchar(50) DEFAULT NULL,
  `sendercitizenid` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phone_messages`
--

CREATE TABLE `phone_messages` (
  `id` int(11) NOT NULL,
  `citizenid` varchar(50) DEFAULT NULL,
  `number` varchar(50) DEFAULT NULL,
  `messages` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phone_tweets`
--

CREATE TABLE `phone_tweets` (
  `id` int(11) NOT NULL,
  `citizenid` varchar(50) DEFAULT NULL,
  `firstName` varchar(25) DEFAULT NULL,
  `lastName` varchar(25) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `date` datetime DEFAULT current_timestamp(),
  `url` text DEFAULT NULL,
  `picture` varchar(512) DEFAULT './img/default.png',
  `tweetId` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `players`
--

CREATE TABLE `players` (
  `id` int(11) NOT NULL,
  `citizenid` varchar(50) NOT NULL,
  `cid` int(11) DEFAULT NULL,
  `license` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `money` text NOT NULL,
  `charinfo` text DEFAULT NULL,
  `job` text NOT NULL,
  `gang` text DEFAULT NULL,
  `position` text NOT NULL,
  `metadata` text NOT NULL,
  `inventory` longtext DEFAULT NULL,
  `last_updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `players`
--

INSERT INTO `players` (`id`, `citizenid`, `cid`, `license`, `name`, `money`, `charinfo`, `job`, `gang`, `position`, `metadata`, `inventory`, `last_updated`) VALUES
(1, 'RYL88153', 1, 'license:0a30b7792e0c6b5d33b4593624259daf52211e60', 'Debby', '{\"cash\":172,\"bank\":999995149,\"crypto\":0}', '{\"account\":\"US09QBCore7619838162\",\"phone\":\"6973238922\",\"backstory\":\"placeholder backstory\",\"firstname\":\"Debby\",\"birthdate\":\"2023-07-22\",\"gender\":0,\"cid\":1,\"lastname\":\"an\",\"nationality\":\"India\"}', '{\"type\":\"mechanic\",\"isboss\":true,\"label\":\"Mechanic\",\"payment\":150,\"onduty\":false,\"grade\":{\"level\":4,\"name\":\"Manager\"},\"name\":\"mechanic\"}', '{\"label\":\"No Gang Affiliaton\",\"grade\":{\"level\":0,\"name\":\"none\"},\"isboss\":false,\"name\":\"none\"}', '{\"x\":51.16484069824219,\"y\":-894.3692016601563,\"z\":29.819091796875}', '{\"ishandcuffed\":false,\"phone\":[],\"fingerprint\":\"QG831i71PUR0358\",\"craftingrep\":0,\"bloodtype\":\"A-\",\"phonedata\":{\"SerialNumber\":89475300,\"InstalledApps\":[]},\"injail\":0,\"licences\":{\"weapon\":false,\"driver\":true,\"business\":false},\"inside\":{\"apartment\":[]},\"callsign\":\"NO CALLSIGN\",\"armor\":0,\"stress\":0,\"status\":[],\"attachmentcraftingrep\":0,\"thirst\":84.80000000000001,\"jobrep\":{\"hotdog\":0,\"tow\":0,\"taxi\":0,\"trucker\":0},\"inlaststand\":false,\"tracker\":false,\"walletid\":\"QB-41693398\",\"dealerrep\":0,\"isdead\":false,\"hunger\":78.99999999999999,\"jailitems\":[],\"fitbit\":[],\"criminalrecord\":{\"hasRecord\":false},\"commandbinds\":[]}', '[{\"type\":\"item\",\"info\":{\"citizenid\":\"RYL88153\",\"birthdate\":\"2023-07-22\",\"nationality\":\"India\",\"lastname\":\"an\",\"gender\":0,\"firstname\":\"Debby\"},\"amount\":1,\"name\":\"id_card\",\"slot\":1},{\"type\":\"item\",\"info\":{\"birthdate\":\"2023-07-22\",\"firstname\":\"Debby\",\"type\":\"Class C Driver License\",\"lastname\":\"an\"},\"amount\":1,\"name\":\"driver_license\",\"slot\":2},{\"type\":\"item\",\"info\":[],\"amount\":1,\"name\":\"phone\",\"slot\":3},{\"type\":\"item\",\"info\":{\"quality\":99},\"amount\":1,\"created\":1690127168,\"name\":\"bandage\",\"slot\":4},{\"type\":\"item\",\"info\":[],\"amount\":1,\"name\":\"water_bottle\",\"slot\":13},{\"type\":\"item\",\"info\":[],\"amount\":1,\"name\":\"bandage\",\"slot\":16}]', '2023-07-23 16:07:26');

-- --------------------------------------------------------

--
-- Table structure for table `playerskins`
--

CREATE TABLE `playerskins` (
  `id` int(11) NOT NULL,
  `citizenid` varchar(255) NOT NULL,
  `model` varchar(255) NOT NULL,
  `skin` text NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `playerskins`
--

INSERT INTO `playerskins` (`id`, `citizenid`, `model`, `skin`, `active`) VALUES
(1, 'RYL88153', '1825562762', '{\"beard\":{\"texture\":1,\"defaultItem\":-1,\"item\":-1,\"defaultTexture\":1},\"eyebrows\":{\"texture\":1,\"defaultItem\":-1,\"item\":-1,\"defaultTexture\":1},\"accessory\":{\"texture\":0,\"defaultItem\":0,\"item\":0,\"defaultTexture\":0},\"face\":{\"texture\":0,\"defaultItem\":0,\"item\":0,\"defaultTexture\":0},\"nose_3\":{\"texture\":0,\"defaultItem\":0,\"item\":0,\"defaultTexture\":0},\"face2\":{\"texture\":0,\"defaultItem\":0,\"item\":0,\"defaultTexture\":0},\"bag\":{\"texture\":0,\"defaultItem\":0,\"item\":0,\"defaultTexture\":0},\"mask\":{\"texture\":0,\"defaultItem\":0,\"item\":0,\"defaultTexture\":0},\"nose_1\":{\"texture\":0,\"defaultItem\":0,\"item\":0,\"defaultTexture\":0},\"glass\":{\"texture\":0,\"defaultItem\":0,\"item\":0,\"defaultTexture\":0},\"hat\":{\"texture\":0,\"defaultItem\":-1,\"item\":-1,\"defaultTexture\":0},\"hair\":{\"texture\":0,\"defaultItem\":0,\"item\":0,\"defaultTexture\":0},\"torso2\":{\"texture\":0,\"defaultItem\":0,\"item\":0,\"defaultTexture\":0},\"chimp_hole\":{\"texture\":0,\"defaultItem\":0,\"item\":0,\"defaultTexture\":0},\"t-shirt\":{\"texture\":0,\"defaultItem\":1,\"item\":1,\"defaultTexture\":0},\"facemix\":{\"defaultSkinMix\":0.0,\"defaultShapeMix\":0.0,\"shapeMix\":0,\"skinMix\":0},\"chimp_bone_width\":{\"texture\":0,\"defaultItem\":0,\"item\":0,\"defaultTexture\":0},\"eye_color\":{\"texture\":0,\"defaultItem\":-1,\"item\":-1,\"defaultTexture\":0},\"bracelet\":{\"texture\":0,\"defaultItem\":-1,\"item\":-1,\"defaultTexture\":0},\"watch\":{\"texture\":0,\"defaultItem\":-1,\"item\":-1,\"defaultTexture\":0},\"cheek_2\":{\"texture\":0,\"defaultItem\":0,\"item\":0,\"defaultTexture\":0},\"nose_0\":{\"texture\":0,\"defaultItem\":0,\"item\":0,\"defaultTexture\":0},\"nose_2\":{\"texture\":0,\"defaultItem\":0,\"item\":0,\"defaultTexture\":0},\"lips_thickness\":{\"texture\":0,\"defaultItem\":0,\"item\":0,\"defaultTexture\":0},\"decals\":{\"texture\":0,\"defaultItem\":0,\"item\":0,\"defaultTexture\":0},\"chimp_bone_lenght\":{\"texture\":0,\"defaultItem\":0,\"item\":0,\"defaultTexture\":0},\"nose_4\":{\"texture\":0,\"defaultItem\":0,\"item\":0,\"defaultTexture\":0},\"shoes\":{\"texture\":0,\"defaultItem\":1,\"item\":1,\"defaultTexture\":0},\"eyebrown_forward\":{\"texture\":0,\"defaultItem\":0,\"item\":0,\"defaultTexture\":0},\"blush\":{\"texture\":1,\"defaultItem\":-1,\"item\":-1,\"defaultTexture\":1},\"cheek_3\":{\"texture\":0,\"defaultItem\":0,\"item\":0,\"defaultTexture\":0},\"makeup\":{\"texture\":1,\"defaultItem\":-1,\"item\":-1,\"defaultTexture\":1},\"lipstick\":{\"texture\":1,\"defaultItem\":-1,\"item\":-1,\"defaultTexture\":1},\"jaw_bone_width\":{\"texture\":0,\"defaultItem\":0,\"item\":0,\"defaultTexture\":0},\"chimp_bone_lowering\":{\"texture\":0,\"defaultItem\":0,\"item\":0,\"defaultTexture\":0},\"eye_opening\":{\"texture\":0,\"defaultItem\":0,\"item\":0,\"defaultTexture\":0},\"neck_thikness\":{\"texture\":0,\"defaultItem\":0,\"item\":0,\"defaultTexture\":0},\"eyebrown_high\":{\"texture\":0,\"defaultItem\":0,\"item\":0,\"defaultTexture\":0},\"jaw_bone_back_lenght\":{\"texture\":0,\"defaultItem\":0,\"item\":0,\"defaultTexture\":0},\"cheek_1\":{\"texture\":0,\"defaultItem\":0,\"item\":0,\"defaultTexture\":0},\"nose_5\":{\"texture\":0,\"defaultItem\":0,\"item\":0,\"defaultTexture\":0},\"ear\":{\"texture\":0,\"defaultItem\":-1,\"item\":-1,\"defaultTexture\":0},\"vest\":{\"texture\":0,\"defaultItem\":0,\"item\":0,\"defaultTexture\":0},\"ageing\":{\"texture\":0,\"defaultItem\":-1,\"item\":-1,\"defaultTexture\":0},\"moles\":{\"texture\":0,\"defaultItem\":-1,\"item\":-1,\"defaultTexture\":0},\"arms\":{\"texture\":0,\"defaultItem\":0,\"item\":0,\"defaultTexture\":0},\"pants\":{\"texture\":0,\"defaultItem\":0,\"item\":0,\"defaultTexture\":0}}', 1);

-- --------------------------------------------------------

--
-- Table structure for table `player_contacts`
--

CREATE TABLE `player_contacts` (
  `id` int(11) NOT NULL,
  `citizenid` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `number` varchar(50) DEFAULT NULL,
  `iban` varchar(50) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `player_houses`
--

CREATE TABLE `player_houses` (
  `id` int(255) NOT NULL,
  `house` varchar(50) NOT NULL,
  `identifier` varchar(50) DEFAULT NULL,
  `citizenid` varchar(50) DEFAULT NULL,
  `keyholders` text DEFAULT NULL,
  `decorations` text DEFAULT NULL,
  `stash` text DEFAULT NULL,
  `outfit` text DEFAULT NULL,
  `logout` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `player_mails`
--

CREATE TABLE `player_mails` (
  `id` int(11) NOT NULL,
  `citizenid` varchar(50) DEFAULT NULL,
  `sender` varchar(50) DEFAULT NULL,
  `subject` varchar(50) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `read` tinyint(4) DEFAULT 0,
  `mailid` int(11) DEFAULT NULL,
  `date` timestamp NULL DEFAULT current_timestamp(),
  `button` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `player_outfits`
--

CREATE TABLE `player_outfits` (
  `id` int(11) NOT NULL,
  `citizenid` varchar(50) DEFAULT NULL,
  `outfitname` varchar(50) NOT NULL,
  `model` varchar(50) DEFAULT NULL,
  `skin` text DEFAULT NULL,
  `outfitId` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `player_vehicles`
--

CREATE TABLE `player_vehicles` (
  `id` int(11) NOT NULL,
  `license` varchar(50) DEFAULT NULL,
  `citizenid` varchar(50) DEFAULT NULL,
  `vehicle` varchar(50) DEFAULT NULL,
  `hash` varchar(50) DEFAULT NULL,
  `mods` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `plate` varchar(50) NOT NULL,
  `fakeplate` varchar(50) DEFAULT NULL,
  `garage` varchar(50) DEFAULT NULL,
  `fuel` int(11) DEFAULT 100,
  `engine` float DEFAULT 1000,
  `body` float DEFAULT 1000,
  `state` int(11) DEFAULT 1,
  `depotprice` int(11) NOT NULL DEFAULT 0,
  `drivingdistance` int(50) DEFAULT NULL,
  `status` text DEFAULT NULL,
  `balance` int(11) NOT NULL DEFAULT 0,
  `paymentamount` int(11) NOT NULL DEFAULT 0,
  `paymentsleft` int(11) NOT NULL DEFAULT 0,
  `financetime` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `player_vehicles`
--

INSERT INTO `player_vehicles` (`id`, `license`, `citizenid`, `vehicle`, `hash`, `mods`, `plate`, `fakeplate`, `garage`, `fuel`, `engine`, `body`, `state`, `depotprice`, `drivingdistance`, `status`, `balance`, `paymentamount`, `paymentsleft`, `financetime`) VALUES
(1, 'license:0a30b7792e0c6b5d33b4593624259daf52211e60', 'RYL88153', 'issi8', '1550581940', '{\"modSpoilers\":-1,\"modStruts\":-1,\"pearlescentColor\":111,\"modSeats\":-1,\"modExhaust\":-1,\"modEngine\":-1,\"modHorns\":-1,\"wheelWidth\":1.0,\"modXenon\":false,\"modTurbo\":false,\"modSideSkirt\":-1,\"xenonColor\":255,\"modGrille\":-1,\"modBrakes\":-1,\"modDoorSpeaker\":-1,\"color1\":111,\"modTrimB\":-1,\"modDashboard\":-1,\"tireBurstCompletely\":{\"1\":false,\"2\":false,\"3\":false,\"4\":false,\"5\":false,\"0\":false},\"modAerials\":-1,\"bodyHealth\":1000.0592475178704,\"modSmokeEnabled\":false,\"doorStatus\":{\"1\":false,\"2\":false,\"3\":false,\"4\":false,\"5\":false,\"0\":false},\"plate\":\"6GA591LW\",\"modArmor\":-1,\"modDial\":-1,\"wheels\":7,\"modTrunk\":-1,\"modKit49\":-1,\"modArchCover\":-1,\"wheelColor\":0,\"neonColor\":[255,0,255],\"plateIndex\":0,\"neonEnabled\":[false,false,false,false],\"modKit17\":-1,\"oilLevel\":4.76596940834568,\"modKit21\":-1,\"extras\":[],\"tankHealth\":1000.0592475178704,\"tyreSmokeColor\":[255,255,255],\"modFrontWheels\":-1,\"headlightColor\":255,\"tireHealth\":{\"1\":1000.0,\"2\":1000.0,\"3\":1000.0,\"0\":1000.0},\"modLivery\":-1,\"modBackWheels\":-1,\"modSteeringWheel\":-1,\"modFrontBumper\":-1,\"color2\":0,\"modTrimA\":-1,\"modVanityPlate\":-1,\"wheelSize\":1.0,\"modKit19\":-1,\"fuelLevel\":98.4967011058109,\"liveryRoof\":-1,\"modFrame\":-1,\"modSpeakers\":-1,\"dashboardColor\":134,\"windowTint\":-1,\"modHydrolic\":-1,\"tireBurstState\":{\"1\":false,\"2\":false,\"3\":false,\"4\":false,\"5\":false,\"0\":false},\"modRightFender\":-1,\"modKit47\":-1,\"windowStatus\":{\"1\":true,\"2\":true,\"3\":true,\"4\":false,\"5\":false,\"6\":true,\"7\":true,\"0\":true},\"modAPlate\":-1,\"model\":1550581940,\"modRoof\":-1,\"modSuspension\":-1,\"modShifterLeavers\":-1,\"dirtLevel\":12.7092517555885,\"modFender\":-1,\"modPlateHolder\":-1,\"modCustomTiresR\":false,\"modWindows\":-1,\"modRearBumper\":-1,\"modEngineBlock\":-1,\"interiorColor\":93,\"modCustomTiresF\":false,\"modTransmission\":-1,\"modTank\":-1,\"modAirFilter\":-1,\"engineHealth\":1000.0592475178704,\"modOrnaments\":-1,\"modHood\":-1}', '6GA591LW', NULL, 'leigonsquarealley', 98, 1000, 1000, 1, 0, 454, NULL, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `player_warns`
--

CREATE TABLE `player_warns` (
  `id` int(11) NOT NULL,
  `senderIdentifier` varchar(50) DEFAULT NULL,
  `targetIdentifier` varchar(50) DEFAULT NULL,
  `reason` text DEFAULT NULL,
  `warnId` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stashitems`
--

CREATE TABLE `stashitems` (
  `id` int(11) NOT NULL,
  `stash` varchar(255) NOT NULL DEFAULT '[]',
  `items` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `trunkitems`
--

CREATE TABLE `trunkitems` (
  `id` int(11) NOT NULL,
  `plate` varchar(255) NOT NULL DEFAULT '[]',
  `items` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `apartments`
--
ALTER TABLE `apartments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `citizenid` (`citizenid`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `bank_accounts`
--
ALTER TABLE `bank_accounts`
  ADD PRIMARY KEY (`record_id`),
  ADD UNIQUE KEY `citizenid` (`citizenid`),
  ADD KEY `business` (`business`),
  ADD KEY `businessid` (`businessid`),
  ADD KEY `gangid` (`gangid`);

--
-- Indexes for table `bank_cards`
--
ALTER TABLE `bank_cards`
  ADD PRIMARY KEY (`citizenid`),
  ADD KEY `record_id` (`record_id`);

--
-- Indexes for table `bank_statements`
--
ALTER TABLE `bank_statements`
  ADD PRIMARY KEY (`record_id`),
  ADD KEY `business` (`business`),
  ADD KEY `businessid` (`businessid`),
  ADD KEY `gangid` (`gangid`);

--
-- Indexes for table `bans`
--
ALTER TABLE `bans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `license` (`license`),
  ADD KEY `discord` (`discord`),
  ADD KEY `ip` (`ip`);

--
-- Indexes for table `crypto`
--
ALTER TABLE `crypto`
  ADD PRIMARY KEY (`crypto`);

--
-- Indexes for table `crypto_transactions`
--
ALTER TABLE `crypto_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `citizenid` (`citizenid`);

--
-- Indexes for table `dealers`
--
ALTER TABLE `dealers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ethicalpixel_admin`
--
ALTER TABLE `ethicalpixel_admin`
  ADD KEY `id` (`id`);

--
-- Indexes for table `ethicalpixel_admin_banned`
--
ALTER TABLE `ethicalpixel_admin_banned`
  ADD KEY `id` (`id`);

--
-- Indexes for table `ethicalpixel_admin_log`
--
ALTER TABLE `ethicalpixel_admin_log`
  ADD KEY `id` (`id`);

--
-- Indexes for table `gloveboxitems`
--
ALTER TABLE `gloveboxitems`
  ADD PRIMARY KEY (`plate`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `houselocations`
--
ALTER TABLE `houselocations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `house_plants`
--
ALTER TABLE `house_plants`
  ADD PRIMARY KEY (`id`),
  ADD KEY `building` (`building`),
  ADD KEY `plantid` (`plantid`);

--
-- Indexes for table `lapraces`
--
ALTER TABLE `lapraces`
  ADD PRIMARY KEY (`id`),
  ADD KEY `raceid` (`raceid`);

--
-- Indexes for table `management_funds`
--
ALTER TABLE `management_funds`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `job_name` (`job_name`),
  ADD KEY `type` (`type`);

--
-- Indexes for table `ns_mdt_call`
--
ALTER TABLE `ns_mdt_call`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ns_mdt_civilian`
--
ALTER TABLE `ns_mdt_civilian`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ns_mdt_marker`
--
ALTER TABLE `ns_mdt_marker`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ns_mdt_operations`
--
ALTER TABLE `ns_mdt_operations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ns_mdt_police_fine`
--
ALTER TABLE `ns_mdt_police_fine`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ns_mdt_police_report`
--
ALTER TABLE `ns_mdt_police_report`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ns_mdt_user`
--
ALTER TABLE `ns_mdt_user`
  ADD PRIMARY KEY (`steam_id`),
  ADD UNIQUE KEY `discord_id` (`discord_id`);

--
-- Indexes for table `ns_mdt_vehicle`
--
ALTER TABLE `ns_mdt_vehicle`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `occasion_vehicles`
--
ALTER TABLE `occasion_vehicles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `occasionId` (`occasionid`);

--
-- Indexes for table `phone_invoices`
--
ALTER TABLE `phone_invoices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `citizenid` (`citizenid`);

--
-- Indexes for table `phone_messages`
--
ALTER TABLE `phone_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `citizenid` (`citizenid`),
  ADD KEY `number` (`number`);

--
-- Indexes for table `phone_tweets`
--
ALTER TABLE `phone_tweets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `citizenid` (`citizenid`);

--
-- Indexes for table `players`
--
ALTER TABLE `players`
  ADD PRIMARY KEY (`citizenid`),
  ADD KEY `id` (`id`),
  ADD KEY `last_updated` (`last_updated`),
  ADD KEY `license` (`license`);

--
-- Indexes for table `playerskins`
--
ALTER TABLE `playerskins`
  ADD PRIMARY KEY (`id`),
  ADD KEY `citizenid` (`citizenid`),
  ADD KEY `active` (`active`);

--
-- Indexes for table `player_contacts`
--
ALTER TABLE `player_contacts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `citizenid` (`citizenid`);

--
-- Indexes for table `player_houses`
--
ALTER TABLE `player_houses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `house` (`house`),
  ADD KEY `citizenid` (`citizenid`),
  ADD KEY `identifier` (`identifier`);

--
-- Indexes for table `player_mails`
--
ALTER TABLE `player_mails`
  ADD PRIMARY KEY (`id`),
  ADD KEY `citizenid` (`citizenid`);

--
-- Indexes for table `player_outfits`
--
ALTER TABLE `player_outfits`
  ADD PRIMARY KEY (`id`),
  ADD KEY `citizenid` (`citizenid`),
  ADD KEY `outfitId` (`outfitId`);

--
-- Indexes for table `player_vehicles`
--
ALTER TABLE `player_vehicles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_playervehicles_plate` (`plate`),
  ADD KEY `plate` (`plate`),
  ADD KEY `citizenid` (`citizenid`),
  ADD KEY `license` (`license`);

--
-- Indexes for table `player_warns`
--
ALTER TABLE `player_warns`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stashitems`
--
ALTER TABLE `stashitems`
  ADD PRIMARY KEY (`stash`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `trunkitems`
--
ALTER TABLE `trunkitems`
  ADD PRIMARY KEY (`plate`),
  ADD KEY `id` (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `apartments`
--
ALTER TABLE `apartments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `bank_accounts`
--
ALTER TABLE `bank_accounts`
  MODIFY `record_id` bigint(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bank_cards`
--
ALTER TABLE `bank_cards`
  MODIFY `record_id` bigint(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bank_statements`
--
ALTER TABLE `bank_statements`
  MODIFY `record_id` bigint(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bans`
--
ALTER TABLE `bans`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `crypto_transactions`
--
ALTER TABLE `crypto_transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dealers`
--
ALTER TABLE `dealers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ethicalpixel_admin`
--
ALTER TABLE `ethicalpixel_admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `ethicalpixel_admin_banned`
--
ALTER TABLE `ethicalpixel_admin_banned`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `ethicalpixel_admin_log`
--
ALTER TABLE `ethicalpixel_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `gloveboxitems`
--
ALTER TABLE `gloveboxitems`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `houselocations`
--
ALTER TABLE `houselocations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `house_plants`
--
ALTER TABLE `house_plants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lapraces`
--
ALTER TABLE `lapraces`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `management_funds`
--
ALTER TABLE `management_funds`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `ns_mdt_call`
--
ALTER TABLE `ns_mdt_call`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ns_mdt_civilian`
--
ALTER TABLE `ns_mdt_civilian`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ns_mdt_marker`
--
ALTER TABLE `ns_mdt_marker`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ns_mdt_operations`
--
ALTER TABLE `ns_mdt_operations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ns_mdt_police_fine`
--
ALTER TABLE `ns_mdt_police_fine`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ns_mdt_police_report`
--
ALTER TABLE `ns_mdt_police_report`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ns_mdt_vehicle`
--
ALTER TABLE `ns_mdt_vehicle`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `occasion_vehicles`
--
ALTER TABLE `occasion_vehicles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `phone_invoices`
--
ALTER TABLE `phone_invoices`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `phone_messages`
--
ALTER TABLE `phone_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `phone_tweets`
--
ALTER TABLE `phone_tweets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `players`
--
ALTER TABLE `players`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `playerskins`
--
ALTER TABLE `playerskins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `player_contacts`
--
ALTER TABLE `player_contacts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `player_houses`
--
ALTER TABLE `player_houses`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `player_mails`
--
ALTER TABLE `player_mails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `player_outfits`
--
ALTER TABLE `player_outfits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `player_vehicles`
--
ALTER TABLE `player_vehicles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `player_warns`
--
ALTER TABLE `player_warns`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stashitems`
--
ALTER TABLE `stashitems`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `trunkitems`
--
ALTER TABLE `trunkitems`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `player_vehicles`
--
ALTER TABLE `player_vehicles`
  ADD CONSTRAINT `FK_playervehicles_players` FOREIGN KEY (`citizenid`) REFERENCES `players` (`citizenid`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

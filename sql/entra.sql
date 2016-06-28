/*
 Navicat Premium Data Transfer

 Source Server         : Xserver
 Source Server Type    : MySQL
 Source Server Version : 50625
 Source Host           : localhost
 Source Database       : entra

 Target Server Type    : MySQL
 Target Server Version : 50625
 File Encoding         : utf-8

 Date: 03/28/2016 10:59:50 AM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `activities`
-- ----------------------------
DROP TABLE IF EXISTS `activities`;
CREATE TABLE `activities` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `activity_type` int(10) unsigned NOT NULL COMMENT '1=success,2=danger,3=warning,4=info',
  `description` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `activities_user_id_foreign` (`user_id`),
  CONSTRAINT `activities_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `activities`
-- ----------------------------
BEGIN;
INSERT INTO `activities` VALUES ('1', '1', '1', 'Changed password', '2015-11-18 22:05:22', '0000-00-00 00:00:00');
COMMIT;

-- ----------------------------
--  Table structure for `branch_admins`
-- ----------------------------
DROP TABLE IF EXISTS `branch_admins`;
CREATE TABLE `branch_admins` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `branch_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `work_phone` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `branch_admins_branch_id_foreign` (`branch_id`),
  KEY `branch_admins_user_id_foreign` (`user_id`),
  CONSTRAINT `branch_admins_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  CONSTRAINT `branch_admins_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `branch_admins`
-- ----------------------------
BEGIN;
INSERT INTO `branch_admins` VALUES ('1', '1', '4', '08099999999', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
COMMIT;

-- ----------------------------
--  Table structure for `branches`
-- ----------------------------
DROP TABLE IF EXISTS `branches`;
CREATE TABLE `branches` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `company_id` int(10) unsigned NOT NULL,
  `state_id` int(10) unsigned DEFAULT NULL,
  `city` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_number` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `slug` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `branches_slug_unique` (`slug`),
  KEY `branches_state_id_foreign` (`state_id`),
  KEY `branches_company_id_foreign` (`company_id`),
  KEY `branches_slug_index` (`slug`),
  CONSTRAINT `branches_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `branches_state_id_foreign` FOREIGN KEY (`state_id`) REFERENCES `states` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `branches`
-- ----------------------------
BEGIN;
INSERT INTO `branches` VALUES ('1', 'Jibowu', '1', '24', 'Jibowu', '31, Ikorodu Road', '01 861 1200', '', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Jibowu'), ('2', 'Alafia', '1', '2', 'Orile', '100, Badagry Express Way, Alafia-Bus/Stop', '', '', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Alafia'), ('3', 'Ikotun', '1', '24', 'Ikotun', '3, Idimu Road', '', '', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Ikotun'), ('4', 'Maza-Maza', '1', '24', 'Maza-Maza', '27, Old Ojo Road', '', '', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Maza-Maza'), ('5', 'Iba', '1', '24', 'Iba', 'Iyano School Opposite Elshadai Hospital', '', '', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Iba'), ('8', 'Port Harcourt', '1', '32', 'Port Harcourt', '159 Aba Road', '', '', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Port Harcour'), ('9', 'Abuja', '1', '37', 'Utako', '7A, E.Ekukinam St, Plot 172', '', '', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Abuja'), ('10', 'Jabi', '1', '37', 'Jabi', 'Jabi Park', '', '', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Jabi'), ('11', 'Kubwa', '1', '37', 'Kubwa', '118, Gado Nasco Road', '', '', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Kubwa'), ('13', 'Onitsha', '1', '3', 'Onitsha', 'Onitsha/Owerri Upper Iweka', '', '', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Onitsha'), ('14', 'Nnewi', '1', '3', 'Nnewi', 'Nkwo Nnewi Round About', '', '', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Nnewi');
COMMIT;

-- ----------------------------
--  Table structure for `companies`
-- ----------------------------
DROP TABLE IF EXISTS `companies`;
CREATE TABLE `companies` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `slogan` varchar(120) COLLATE utf8_unicode_ci NOT NULL,
  `logo_url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `website` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `companies`
-- ----------------------------
BEGIN;
INSERT INTO `companies` VALUES ('1', 'E. Ekesons', 'To carry Man and Materials to their several and various destination within the Nigeria states safely, comfortably and pr', 'files/logos/ekesons.jpg', 'http://ekesons.com.ng/', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
COMMIT;

-- ----------------------------
--  Table structure for `company_addresses`
-- ----------------------------
DROP TABLE IF EXISTS `company_addresses`;
CREATE TABLE `company_addresses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(10) unsigned NOT NULL,
  `phone_number` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(555) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `company_addresses_company_id_foreign` (`company_id`),
  CONSTRAINT `company_addresses_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `company_addresses`
-- ----------------------------
BEGIN;
INSERT INTO `company_addresses` VALUES ('1', '1', '0', 'ekesons@entranic.com', 'Lagos', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
COMMIT;

-- ----------------------------
--  Table structure for `company_admins`
-- ----------------------------
DROP TABLE IF EXISTS `company_admins`;
CREATE TABLE `company_admins` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `work_phone` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `company_admins_company_id_foreign` (`company_id`),
  KEY `company_admins_user_id_foreign` (`user_id`),
  CONSTRAINT `company_admins_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `company_admins_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `company_admins`
-- ----------------------------
BEGIN;
INSERT INTO `company_admins` VALUES ('1', '1', '3', '08099999999', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
COMMIT;

-- ----------------------------
--  Table structure for `customers`
-- ----------------------------
DROP TABLE IF EXISTS `customers`;
CREATE TABLE `customers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `gender` int(10) unsigned DEFAULT NULL COMMENT '1=Male,2=Female',
  `next_of_kin_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `next_of_kin_number` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `branch_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `fullname` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_number` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `customers_branch_id_foreign` (`branch_id`),
  CONSTRAINT `customers_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `customers`
-- ----------------------------
BEGIN;
INSERT INTO `customers` VALUES ('1', '1', 'Bob Johnson', '23480654321', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Omoenu Nnadozie', 'sample address', '08067685874'), ('2', null, 'koko momoh', '090190290912', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Kalu Jimoh', null, '0930090190'), ('3', null, 'koko momoh', '090190290917', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'queen marry', null, '093009019006');
COMMIT;

-- ----------------------------
--  Table structure for `destination_stops`
-- ----------------------------
DROP TABLE IF EXISTS `destination_stops`;
CREATE TABLE `destination_stops` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `destination_id` int(10) unsigned NOT NULL,
  `branch_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `destination_stops_branch_id_foreign` (`branch_id`),
  KEY `destination_stops_destination_id_foreign` (`destination_id`),
  CONSTRAINT `destination_stops_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  CONSTRAINT `destination_stops_destination_id_foreign` FOREIGN KEY (`destination_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `destinations`
-- ----------------------------
DROP TABLE IF EXISTS `destinations`;
CREATE TABLE `destinations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `user_id` int(10) unsigned NOT NULL,
  `company_id` int(10) unsigned NOT NULL,
  `destination_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `branch_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `destinations_user_id_foreign` (`user_id`),
  KEY `destinations_company_id_foreign` (`company_id`),
  KEY `destinations_branch_id_foreign` (`branch_id`),
  CONSTRAINT `destinations_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `destinations_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `destinations_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `destinations`
-- ----------------------------
BEGIN;
INSERT INTO `destinations` VALUES ('1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '3', '1', 'Lagos', '1'), ('2', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '3', '1', 'Kano', '1'), ('3', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '3', '1', 'Kogi', '1'), ('4', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '3', '1', 'Ganan', '1'), ('5', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '3', '1', 'Sokoto', '1'), ('6', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '3', '1', 'Kaduna', '1'), ('7', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '3', '1', 'Abia', '1'), ('8', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '3', '1', 'Benue', '1'), ('9', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '3', '1', 'Portharcourt', '1'), ('10', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '3', '1', 'Abuja', '1'), ('17', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '5', '1', 'okene', '1'), ('18', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '5', '1', 'abaji', '1'), ('19', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '5', '1', 'keffi', '1'), ('20', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '5', '1', 'okene', '2'), ('21', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '5', '1', 'abaji', '2'), ('22', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '5', '1', 'keffi', '2');
COMMIT;

-- ----------------------------
--  Table structure for `driver_vehicle`
-- ----------------------------
DROP TABLE IF EXISTS `driver_vehicle`;
CREATE TABLE `driver_vehicle` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `driver_id` int(10) unsigned NOT NULL,
  `vehicle_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `driver_vehicle_driver_id_index` (`driver_id`),
  KEY `driver_vehicle_vehicle_id_index` (`vehicle_id`),
  CONSTRAINT `driver_vehicle_driver_id_foreign` FOREIGN KEY (`driver_id`) REFERENCES `drivers` (`id`) ON DELETE CASCADE,
  CONSTRAINT `driver_vehicle_vehicle_id_foreign` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `driver_vehicle`
-- ----------------------------
BEGIN;
INSERT INTO `driver_vehicle` VALUES ('1', '1', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('2', '2', '11', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('3', '3', '3', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('4', '4', '2', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('5', '5', '7', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
COMMIT;

-- ----------------------------
--  Table structure for `drivers`
-- ----------------------------
DROP TABLE IF EXISTS `drivers`;
CREATE TABLE `drivers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `branch_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `gender` int(10) unsigned DEFAULT NULL COMMENT '1=Male,2=Female',
  `next_of_kin_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `next_of_kin_number` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `license_no` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `date_employed` datetime NOT NULL,
  `work_phone` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `drivers_branch_id_foreign` (`branch_id`),
  KEY `drivers_user_id_foreign` (`user_id`),
  CONSTRAINT `drivers_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  CONSTRAINT `drivers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `drivers`
-- ----------------------------
BEGIN;
INSERT INTO `drivers` VALUES ('1', '1', '8', '1', 'Bob Johnson', '23480654321', '123456789', '2015-11-18 22:59:22', '23480123456', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('2', '2', '9', '1', 'Tunde Johnson', '23480123456', '987654321', '2015-11-18 23:44:40', '23480654321', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('3', '1', '10', '1', 'Bob Johnson', '23480654321', '123456789', '2015-11-18 23:02:40', '23480123456', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('4', '2', '11', '1', 'Tunde Johnson', '23480123456', '987654321', '2015-11-18 23:02:58', '23480654321', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('5', '1', '12', '1', 'Bob Johnson', '23480654321', '123456789', '2015-11-18 23:03:15', '23480123456', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
COMMIT;

-- ----------------------------
--  Table structure for `expense_types`
-- ----------------------------
DROP TABLE IF EXISTS `expense_types`;
CREATE TABLE `expense_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `branch_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `expense_types_branch_id_index` (`branch_id`),
  CONSTRAINT `expense_types_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `expense_types`
-- ----------------------------
BEGIN;
INSERT INTO `expense_types` VALUES ('1', 'Travel Allowance', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('2', 'Office Supplies', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('3', 'Bill Renewal', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
COMMIT;

-- ----------------------------
--  Table structure for `expenses`
-- ----------------------------
DROP TABLE IF EXISTS `expenses`;
CREATE TABLE `expenses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `schedule_id` int(10) unsigned DEFAULT NULL,
  `branch_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `amount` decimal(8,2) unsigned NOT NULL,
  `description` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL,
  `expense_type_id` int(10) unsigned NOT NULL,
  `assigned_to` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `expenses_branch_id_index` (`branch_id`),
  KEY `expenses_user_id_index` (`user_id`),
  KEY `expenses_expense_type_id_index` (`expense_type_id`),
  CONSTRAINT `expenses_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `expenses_expense_type_id_foreign` FOREIGN KEY (`expense_type_id`) REFERENCES `expense_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `expenses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `fleet_managers`
-- ----------------------------
DROP TABLE IF EXISTS `fleet_managers`;
CREATE TABLE `fleet_managers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `work_phone` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `fleet_managers_user_id_foreign` (`user_id`),
  KEY `fleet_managers_company_id_foreign` (`company_id`),
  CONSTRAINT `fleet_managers_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fleet_managers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `fleet_managers`
-- ----------------------------
BEGIN;
INSERT INTO `fleet_managers` VALUES ('1', '1', '6', '08099999999', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
COMMIT;

-- ----------------------------
--  Table structure for `migrations`
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `migrations`
-- ----------------------------
BEGIN;
INSERT INTO `migrations` VALUES ('2015_12_19_223953_create_roles_table', '1'), ('2015_12_19_225614_create_permissions_table', '1'), ('2015_12_19_225645_create_permission_role_table', '1'), ('2015_12_19_230039_create_users_table', '1'), ('2015_12_19_230516_create_role_user_table', '1'), ('2015_12_19_230835_create_activities_table', '1'), ('2015_12_19_230932_create_states_table', '1'), ('2015_12_19_231117_create_companies_table', '1'), ('2015_12_19_231231_create_company_addresses_table', '1'), ('2015_12_19_231326_create_company_admins_table', '1'), ('2015_12_19_231354_create_fleet_managers_table', '1'), ('2015_12_19_231745_create_branches_table', '1'), ('2015_12_19_231823_create_branch_admins_table', '1'), ('2015_12_19_231846_create_sales_reps_table', '1'), ('2015_12_19_232008_create_vehicle_types_table', '1'), ('2015_12_19_232201_create_vehicles_table', '1'), ('2015_12_19_232516_create_drivers_table', '1'), ('2015_12_19_232532_create_driver_vehicle_table', '1'), ('2015_12_19_232604_create_destinations_table', '1'), ('2015_12_19_232637_create_destination_stops_table', '1'), ('2015_12_19_232815_create_schedules_table', '1'), ('2015_12_19_232929_create_customers_table', '1'), ('2015_12_19_233009_create_payment_methods_table', '1'), ('2015_12_19_233353_create_tickets_table', '1'), ('2016_01_11_114414_create_expense_types_table', '1'), ('2016_01_11_140150_create_expenses_table', '1'), ('2016_01_22_195126_add_slug_to_branches_table', '1'), ('2016_02_20_172511_add_name_to_destination_stop_table', '1'), ('2016_02_21_021119_add_date_boarded_to_schedules_table', '1'), ('2016_02_21_142023_add_active_to_destinations_table', '1'), ('2016_03_18_171701_add_fields_to_customer_table', '1'), ('2016_03_21_122837_add field to the ticket table', '1'), ('2016_03_21_161557_add fields to destination table', '1'), ('2016_03_23_090427_update_tickets_table', '1'), ('2016_03_23_095458_update_tickets_table_with_destination_id', '1'), ('2016_03_23_141244_update_tickets_table_with_foreign_keys', '2'), ('2016_03_24_144842_add_relationships_to_vehicles', '3'), ('2016_03_24_154840_add_fields_to_destination_table', '4'), ('2016_03_24_160608_add_fields_to_scheldule_table', '5');
COMMIT;

-- ----------------------------
--  Table structure for `payment_methods`
-- ----------------------------
DROP TABLE IF EXISTS `payment_methods`;
CREATE TABLE `payment_methods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `payment_methods`
-- ----------------------------
BEGIN;
INSERT INTO `payment_methods` VALUES ('1', 'Cash', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('2', 'E-payment', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
COMMIT;

-- ----------------------------
--  Table structure for `permission_role`
-- ----------------------------
DROP TABLE IF EXISTS `permission_role`;
CREATE TABLE `permission_role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `permission_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `permission_role_permission_id_index` (`permission_id`),
  KEY `permission_role_role_id_index` (`role_id`),
  CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `permission_role`
-- ----------------------------
BEGIN;
INSERT INTO `permission_role` VALUES ('1', '1001', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('2', '1', '2', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('3', '2', '2', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('4', '9', '2', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('5', '10', '2', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('6', '11', '2', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('7', '12', '2', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('8', '14', '2', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('9', '16', '2', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('10', '17', '2', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('11', '18', '2', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('12', '19', '2', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('13', '20', '2', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('14', '21', '2', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('15', '4', '3', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('16', '9', '3', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('17', '10', '3', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('18', '11', '3', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('19', '12', '3', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('20', '13', '3', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('21', '15', '3', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('22', '17', '3', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('23', '18', '3', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('24', '19', '3', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('25', '21', '3', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('26', '10', '4', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('27', '11', '4', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('28', '12', '4', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('29', '13', '4', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('30', '15', '4', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('31', '17', '4', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('32', '18', '4', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('33', '19', '4', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('34', '21', '4', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('35', '13', '5', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('36', '14', '5', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('37', '15', '5', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('38', '16', '5', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('39', '17', '5', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('40', '18', '5', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
COMMIT;

-- ----------------------------
--  Table structure for `permissions`
-- ----------------------------
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `permissions_slug_index` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=1002 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `permissions`
-- ----------------------------
BEGIN;
INSERT INTO `permissions` VALUES ('1', 'Manage Company Admin', 'manage-company-admins', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('2', 'Manage Terminals', 'manage-terminals', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('3', 'Add Terminal', 'add-terminal', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('4', 'Edit Terminal', 'edit-terminal', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('5', 'Delete Terminal', 'delete-terminal', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('6', 'Add Sales Rep', 'add-sales-rep', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('7', 'Edit Sales Rep', 'edit-sales-rep', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('8', 'Delete Sales Rep', 'delete-sales-rep', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('9', 'Manage Sales Reps', 'manage-sales-reps', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('10', 'View Sales Manifests', 'view-sales-manifests', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('11', 'View Income and Expe', 'view-income-and-expense', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('12', 'View Sales Performan', 'view-sales-performance', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('13', 'View Fleet', 'view-fleet', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('14', 'Manage Fleet', 'manage-fleet', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('15', 'View Drivers', 'view-drivers', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('16', 'Manage Drivers', 'manage-drivers', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('17', 'Assign Drivers', 'assign-drivers', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('18', 'Assign Vehicles', 'assign-vehicles', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('19', 'View Ongoing Sales', 'view-ongoing-sales', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('20', 'View Login Activity', 'view-login-activity', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('21', 'View Customers', 'view-customers', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('1001', 'Super', 'super', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
COMMIT;

-- ----------------------------
--  Table structure for `role_user`
-- ----------------------------
DROP TABLE IF EXISTS `role_user`;
CREATE TABLE `role_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `role_user_role_id_index` (`role_id`),
  KEY `role_user_user_id_index` (`user_id`),
  CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `role_user`
-- ----------------------------
BEGIN;
INSERT INTO `role_user` VALUES ('1', '1', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('2', '1', '2', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('3', '2', '3', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('4', '3', '4', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('5', '4', '5', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('6', '5', '6', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('7', '7', '7', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('8', '6', '8', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('9', '6', '9', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('10', '6', '10', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('11', '6', '11', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('12', '6', '12', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
COMMIT;

-- ----------------------------
--  Table structure for `roles`
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `roles_slug_index` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `roles`
-- ----------------------------
BEGIN;
INSERT INTO `roles` VALUES ('1', 'Super Admin', 'super', 'Super Administrator', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('2', 'Company Admin', 'company', 'Company Administrator', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('3', 'Branch Admin', 'branch', 'Branch Administrator', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('4', 'Sales Rep', 'sales', 'Sales Rep', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('5', 'Fleet Manager', 'fleet', 'Fleet Manager', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('6', 'Driver', 'driver', 'Driver', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('7', 'Customer', 'customer', 'Customer', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
COMMIT;

-- ----------------------------
--  Table structure for `sales_reps`
-- ----------------------------
DROP TABLE IF EXISTS `sales_reps`;
CREATE TABLE `sales_reps` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `branch_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `work_phone` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `sales_reps_branch_id_foreign` (`branch_id`),
  KEY `sales_reps_user_id_foreign` (`user_id`),
  CONSTRAINT `sales_reps_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  CONSTRAINT `sales_reps_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `sales_reps`
-- ----------------------------
BEGIN;
INSERT INTO `sales_reps` VALUES ('1', '1', '5', '08099999999', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
COMMIT;

-- ----------------------------
--  Table structure for `schedules`
-- ----------------------------
DROP TABLE IF EXISTS `schedules`;
CREATE TABLE `schedules` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `branch_id` int(10) unsigned DEFAULT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `vehicle_id` int(10) unsigned NOT NULL,
  `driver_id` int(10) unsigned NOT NULL,
  `departure_time` datetime NOT NULL,
  `price` decimal(8,2) unsigned NOT NULL,
  `endpoint` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `schedules_branch_id_index` (`branch_id`),
  KEY `schedules_departure_time_index` (`departure_time`),
  KEY `schedules_user_id_foreign` (`user_id`),
  KEY `schedules_endpoint_foreign` (`endpoint`),
  CONSTRAINT `schedules_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  CONSTRAINT `schedules_endpoint_foreign` FOREIGN KEY (`endpoint`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  CONSTRAINT `schedules_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `schedules`
-- ----------------------------
BEGIN;
INSERT INTO `schedules` VALUES ('1', '1', '5', '1', '1', '2015-12-19 06:00:00', '5000.00', '1'), ('2', '1', '5', '1', '2', '2015-12-19 06:30:00', '5000.00', '1'), ('7', '1', '5', '1', '2', '2015-12-19 06:00:00', '4000.00', '1'), ('8', '1', '5', '13', '3', '2015-12-19 07:30:00', '3500.00', '1'), ('9', '1', '5', '1', '4', '2015-12-19 07:00:00', '4000.00', '1'), ('10', '1', '5', '14', '5', '2015-12-19 08:30:00', '4000.00', '1'), ('11', '1', '5', '1', '3', '2015-12-19 08:00:00', '4000.00', '1'), ('12', '1', '5', '11', '4', '2015-12-19 09:30:00', '3200.00', '1'), ('13', '1', '5', '1', '5', '2015-12-19 09:00:00', '4000.00', '1'), ('14', '1', '5', '12', '1', '2015-12-19 09:30:00', '3200.00', '1'), ('16', '1', '5', '24', '1', '2015-12-19 09:30:00', '2000.00', '1'), ('17', '1', '5', '24', '1', '2016-03-24 09:30:00', '2000.00', '2'), ('18', '2', '5', '24', '1', '2016-03-24 09:30:00', '2000.00', '3');
COMMIT;

-- ----------------------------
--  Table structure for `states`
-- ----------------------------
DROP TABLE IF EXISTS `states`;
CREATE TABLE `states` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `states`
-- ----------------------------
BEGIN;
INSERT INTO `states` VALUES ('1', 'Abia', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('2', 'Adamawa', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('3', 'Anambra', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('4', 'Akwa Ibom', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('5', 'Bauchi', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('6', 'Bayelsa', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('7', 'Benue', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('8', 'Borno', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('9', 'Cross River', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('10', 'Delta', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('11', 'Ebonyi', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('12', 'Enugu', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('13', 'Edo', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('14', 'Ekiti', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('15', 'Gombe', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('16', 'Imo', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('17', 'Jigawa', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('18', 'Kaduna', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('19', 'Kano', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('20', 'Katsina', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('21', 'Kebbi', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('22', 'Kogi', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('23', 'Kwara', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('24', 'Lagos', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('25', 'Nasarawa', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('26', 'Niger', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('27', 'Ogun', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('28', 'Ondo', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('29', 'Osun', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('30', 'Oyo', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('31', 'Plateau', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('32', 'Rivers', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('33', 'Sokoto', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('34', 'Taraba', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('35', 'Yobe', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('36', 'Zamfara', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('37', 'Abuja', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('38', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
COMMIT;

-- ----------------------------
--  Table structure for `tickets`
-- ----------------------------
DROP TABLE IF EXISTS `tickets`;
CREATE TABLE `tickets` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int(10) unsigned DEFAULT NULL,
  `channel` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '1=Manual,2=Web,3=Android',
  `price_paid` decimal(8,2) NOT NULL,
  `payment_method_id` int(10) unsigned NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `seat_no` int(10) unsigned DEFAULT NULL,
  `branch_id` int(10) unsigned DEFAULT NULL,
  `vehicle_id` int(10) unsigned NOT NULL,
  `driver_id` int(10) unsigned NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_id` int(10) unsigned NOT NULL,
  `passenger_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `passenger_next_of_kin` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `passenger_next_of_kin_phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `destination_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tickets_customer_id_index` (`customer_id`),
  KEY `tickets_active_index` (`active`),
  KEY `tickets_branch_id_foreign` (`branch_id`),
  KEY `tickets_driver_id_foreign` (`driver_id`),
  KEY `tickets_payment_method_id_foreign` (`payment_method_id`),
  KEY `tickets_user_id_foreign` (`user_id`),
  KEY `tickets_destination_id_foreign` (`destination_id`),
  KEY `tickets_vehicle_id_foreign` (`vehicle_id`),
  CONSTRAINT `tickets_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tickets_destination_id_foreign` FOREIGN KEY (`destination_id`) REFERENCES `destinations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tickets_driver_id_foreign` FOREIGN KEY (`driver_id`) REFERENCES `drivers` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tickets_payment_method_id_foreign` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_methods` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tickets_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tickets_vehicle_id_foreign` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `tickets`
-- ----------------------------
BEGIN;
INSERT INTO `tickets` VALUES ('1', '1', '1', '3500.00', '1', '1', null, null, '1', '0', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', null, null, null, '0'), ('2', '1', '1', '3500.00', '1', '1', null, null, '1', '0', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', null, null, null, '0'), ('3', '1', '1', '3500.00', '1', '1', null, null, '1', '0', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', null, null, null, '0'), ('4', '1', '1', '3500.00', '1', '1', null, null, '1', '0', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', null, null, null, '0'), ('5', '1', '1', '3500.00', '1', '1', null, null, '1', '0', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', null, null, null, '0'), ('6', '1', '1', '3500.00', '1', '1', null, null, '1', '0', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', null, null, null, '0'), ('7', '1', '1', '3500.00', '1', '1', null, null, '1', '0', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', null, null, null, '0'), ('8', '1', '1', '3500.00', '1', '1', null, null, '1', '0', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', null, null, null, '0'), ('25', '1', '3', '2000.00', '1', '1', null, '1', '1', '1', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '5', 'Tunde john', 'Ajani kunle', '090190290915', '17'), ('26', '0', '3', '2000.00', '1', '1', null, '1', '1', '1', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '5', 'Kalu Jimoh', 'koko momoh', '090190290912', '18'), ('27', '0', '3', '2000.00', '1', '1', null, '1', '1', '1', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '5', 'queen marry', 'koko momoh', '090190290917', '19'), ('28', '1', '3', '2000.00', '1', '1', null, '1', '1', '1', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '5', 'Tunde john', 'Ajani kunle', '090190290915', '17'), ('29', '0', '3', '2000.00', '1', '1', null, '1', '1', '1', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '5', 'Kalu Jimoh', 'koko momoh', '090190290912', '18'), ('30', '0', '3', '2000.00', '1', '1', null, '1', '1', '1', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '5', 'queen marry', 'koko momoh', '090190290917', '19'), ('31', '1', '3', '2000.00', '1', '1', null, '1', '1', '1', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '5', 'Tunde john', 'Ajani kunle', '090190290915', '17'), ('32', '0', '3', '2000.00', '1', '1', null, '1', '1', '1', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '5', 'Kalu Jimoh', 'koko momoh', '090190290912', '18'), ('33', '0', '3', '2000.00', '1', '1', null, '1', '1', '1', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '5', 'queen marry', 'koko momoh', '090190290917', '19'), ('34', '1', '3', '2000.00', '1', '1', '4', '1', '1', '1', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '5', 'Tunde john', 'Ajani kunle', '090190290915', '17'), ('35', '0', '3', '2000.00', '1', '1', null, '1', '1', '1', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '5', 'Kalu Jimoh', 'koko momoh', '090190290912', '18'), ('36', '0', '3', '2000.00', '1', '1', null, '1', '1', '1', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '5', 'queen marry', 'koko momoh', '090190290917', '19'), ('37', '1', '3', '2000.00', '1', '1', '4', '1', '1', '1', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '5', 'Tunde john', 'Ajani kunle', '090190290915', '17'), ('38', '0', '3', '2000.00', '1', '1', '0', '1', '1', '1', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '5', 'Kalu Jimoh', 'koko momoh', '090190290912', '18'), ('39', '0', '3', '2000.00', '1', '1', '0', '1', '1', '1', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '5', 'queen marry', 'koko momoh', '090190290917', '19'), ('40', '1', '3', '2000.00', '1', '1', '4', '1', '1', '1', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '5', 'Tunde john', 'Ajani kunle', '090190290915', '17'), ('41', '1', '3', '2000.00', '1', '1', '4', '1', '1', '1', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '5', 'Tunde john', 'Ajani kunle', '090190290915', '17'), ('42', '1', '3', '2000.00', '1', '1', '4', '1', '1', '1', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '5', 'Tunde john', 'Ajani kunle', '090190290915', '17'), ('43', '0', '3', '2000.00', '1', '1', '0', '1', '1', '1', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '5', 'Kalu Jimoh', 'koko momoh', '090190290912', '18'), ('44', '0', '3', '2000.00', '1', '1', '0', '1', '1', '1', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '5', 'queen marry', 'koko momoh', '090190290917', '19'), ('45', '1', '3', '2000.00', '1', '1', '4', '2', '1', '1', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '5', 'Tunde john', 'Ajani kunle', '090190290915', '17'), ('46', '2', '3', '2000.00', '1', '1', '0', '2', '1', '1', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '5', 'Kalu Jimoh', 'koko momoh', '090190290912', '18'), ('47', '3', '3', '2000.00', '1', '1', '0', '2', '1', '1', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '5', 'queen marry', 'koko momoh', '090190290917', '19'), ('48', '1', '3', '2000.00', '1', '1', '4', '2', '1', '1', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '5', 'Tunde john', 'Ajani kunle', '090190290915', '20'), ('49', '2', '3', '2000.00', '1', '1', '0', '2', '1', '1', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '5', 'Kalu Jimoh', 'koko momoh', '090190290912', '21'), ('50', '3', '3', '2000.00', '1', '1', '0', '2', '1', '1', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '5', 'queen marry', 'koko momoh', '090190290917', '22'), ('51', '1', '3', '2000.00', '1', '1', '4', '2', '1', '1', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '5', 'Tunde john', 'Ajani kunle', '090190290915', '20'), ('52', '2', '3', '2000.00', '1', '1', '0', '2', '1', '1', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '5', 'Kalu Jimoh', 'koko momoh', '090190290912', '21'), ('53', '3', '3', '2000.00', '1', '1', '0', '2', '1', '1', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '5', 'queen marry', 'koko momoh', '090190290917', '22');
COMMIT;

-- ----------------------------
--  Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `phone_number` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '1=Pending,2=Verified,3=Disabled',
  `remember_token` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `last_login` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_phone_number_index` (`phone_number`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `users`
-- ----------------------------
BEGIN;
INSERT INTO `users` VALUES ('1', 'Chibueze', 'Opata', 'opatachibueze@gmail.com', '$2y$10$3mkdwNwDN.vNHZxc3MKaFuI13Tv79OKSMsjIW9kRFemRxLeA6UL6C', '08099636703', '2', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('2', 'Chris', 'Aniemeka', 'chris@entranic.com', '$2y$10$qqb7txCGnlKcJ7BKx4UoTetbvdW6tptkroFr0usiN8As8cAfRA51q', '08132593580', '2', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('3', 'Company', 'User', 'company@entranic.com', '$2y$10$3VyKCW5gxh7LKLBmKrjxi.DahZEFt0O48F4yuA74rp2gFhEiWyC2m', '080123910102', '2', 'hRyuMIqqBVrDX8cc4z0wzqe73XhCEqyuss2MMunVoCuBlQhAvwOx38jXQ1gQ', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2016-03-23 14:40:02'), ('4', 'Branch', 'User', 'branch@entranic.com', '$2y$10$5Ii/Tghu9YSy0H4uA6FmYeAbJzAzIh1epfsLMeAmh2KciZjEJn6gS', '080234123129', '2', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('5', 'Sales', 'User', 'sales@entranic.com', '$2y$10$eeXHAVHj65zzs0hg7rUoCeHsiUZrxk8tE0tyIERTQ6LN92wN9AMt6', '0802341231291', '2', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('6', 'Fleet', 'Manager', 'fleet@entranic.com', '$2y$10$fM8woNtRKMi.Rc0j74OPP.l36/irUZNw55s4I7imykVFIyntj/WQe', '080234123129', '2', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('7', 'Ike', 'Okosa', 'customer@entranic.com', '$2y$10$DHVDx7nvpLXcVdiq49zvxOQ6U1x9fQx9UWKHzxYPkR8Eb0FFBVA4e', '080234123129', '2', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('8', 'Dope', 'Johnson', 'driver@entranic.com', '$2y$10$kDXUMuI1PrvoOCT6xlRVR.45uuWG7umFBrO/F8UKOXddjh81FRm3G', '080234123129', '2', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('9', 'Noah', 'Johnson', 'driver2@entranic.com', '$2y$10$Wenz.xO6ct1HRO3jr.RVBuZmVoaoxILP4aAEEIabj0FcrsH93owzS', '080234123129', '2', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('10', 'Ben', 'Johnson', 'driver3@entranic.com', '$2y$10$DG1sD/X71TuG7kI2yNwBQ.6wa/C0NFF1bCVzReAzUGx7GBEX6wxxy', '080234123129', '2', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('11', 'Steve', 'Johnson', 'driver4@entranic.com', '$2y$10$V4zEURntpxjMTM9Xvs7t5.o26LBa/JYgGuqEWJVHafMFF59mgNgai', '080234123129', '2', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('12', 'Clark', 'Johnson', 'driver5@entranic.com', '$2y$10$72v00PbfElsY4MX7WMd4.ui/wdOur.APB03OWAfkVXZEAmFiVWxX.', '080234123129', '2', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
COMMIT;

-- ----------------------------
--  Table structure for `vehicle_types`
-- ----------------------------
DROP TABLE IF EXISTS `vehicle_types`;
CREATE TABLE `vehicle_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `seat_number` int(10) unsigned NOT NULL,
  `has_ac` tinyint(1) NOT NULL,
  `company_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `vehicle_types_company_id_foreign` (`company_id`),
  CONSTRAINT `vehicle_types_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `vehicle_types`
-- ----------------------------
BEGIN;
INSERT INTO `vehicle_types` VALUES ('1', '5 Seater', '5', '1', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('2', '60 Seater', '60', '1', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('3', '55 Seat Coach', '55', '1', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('4', 'Sienna 7 Seater', '7', '1', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('5', 'TM 17 Seater', '17', '1', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('6', '16 Seater', '16', '1', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('7', 'Mini Bus', '15', '1', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('8', 'Mini Luxury Bus', '15', '1', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('9', 'Luxury Bus', '15', '1', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('10', 'Sienna Bus', '15', '1', '11', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
COMMIT;

-- ----------------------------
--  Table structure for `vehicles`
-- ----------------------------
DROP TABLE IF EXISTS `vehicles`;
CREATE TABLE `vehicles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `vehicle_type_id` int(10) unsigned NOT NULL,
  `branch_id` int(10) unsigned NOT NULL,
  `plate_no` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `serial_no` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `vehicles_plate_no_index` (`plate_no`),
  KEY `vehicles_vehicle_type_id_foreign` (`vehicle_type_id`),
  KEY `vehicles_branch_id_foreign` (`branch_id`),
  CONSTRAINT `vehicles_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  CONSTRAINT `vehicles_vehicle_type_id_foreign` FOREIGN KEY (`vehicle_type_id`) REFERENCES `vehicle_types` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=127 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `vehicles`
-- ----------------------------
BEGIN;
INSERT INTO `vehicles` VALUES ('1', '9', '1', 'JJJ  800  SK', '1', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('2', '9', '1', 'RBC  451  XB', '2', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('3', '9', '1', 'FST  444  XD', '3', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('4', '9', '1', 'LSD  400  XG', '4', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('5', '9', '1', 'XT  292  LND', '5', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('6', '9', '1', 'XT  288  LND', '6', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('7', '9', '1', 'XR  241  AGL', '7', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('8', '9', '1', 'XR  243  AGL', '8', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('9', '9', '1', 'XP  293  APP', '9', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('10', '9', '1', 'XU  441  AHA', '10', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('11', '7', '1', 'XH  487  MUS', '11', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('12', '7', '1', 'XT  759  JJJ', '12', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('13', '7', '1', 'YA  885  AKD', '13', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('14', '7', '1', 'YA  887  AKD', '14', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('15', '7', '1', 'YA  891  AKD', '15', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('16', '7', '1', 'YA  898  AKD', '16', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('17', '7', '1', 'YA  903  AKD', '17', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('18', '7', '1', 'YB  114  MUS', '18', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('19', '7', '1', 'YB  117  MUS', '19', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('20', '7', '1', 'YB  122 MUS', '20', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('21', '7', '1', 'ABC  354  XA', '21', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('22', '7', '1', 'ABC  360  XA', '22', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('23', '7', '1', 'ABC  368  XA', '23', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('24', '7', '1', 'ABC  370  XA', '24', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('25', '7', '1', 'ABC  372  XA', '25', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('26', '7', '1', 'LSD  436  XA', '26', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('27', '7', '1', 'LSD  438  XA', '27', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('28', '7', '1', 'LSD  440  XA', '28', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('29', '7', '1', 'ABJ  433  XA', '29', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('30', '7', '1', 'ABJ  435  XA', '30', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('31', '7', '1', 'EPE  649  XF', '31', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('32', '7', '1', 'EPE  924  XF', '32', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('33', '7', '1', 'EPE  926  XF', '33', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('34', '7', '1', 'EPE  970  XF', '34', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('35', '7', '1', 'LSR  820  XC', '35', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('36', '7', '1', 'LSR  822  XC', '36', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('37', '7', '1', 'LSR  840  XC', '37', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('38', '7', '1', 'APP  931  XC', '38', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('39', '7', '1', 'APP  936  XC', '39', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('40', '7', '1', 'AAH  06  XA', '40', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('41', '7', '1', 'AAH  08  XA', '41', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('42', '7', '1', 'AAH  20  XA', '42', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('43', '7', '1', 'AAH  23  XA', '43', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('44', '7', '1', 'BDG  892  XB', '44', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('45', '7', '1', 'BDG  894  XB', '45', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('46', '7', '1', 'SMK  536  XE', '46', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('47', '7', '1', 'SMK  538  XE', '47', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('48', '7', '1', 'SMK  540  XE', '48', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('49', '7', '1', 'SMK  544  XE', '49', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('50', '7', '1', 'LND  401  XG', '50', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('51', '7', '1', 'LND  403  XG', '51', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('52', '7', '1', 'KRD  226  XF', '52', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('53', '7', '1', 'JJJ  52  XJ', '53', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('54', '7', '1', 'MUS  232  XN', '54', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('55', '7', '1', 'APP  625  XN', '55', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('56', '7', '1', 'APP  627  XN', '56', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('57', '7', '1', 'APP  629  XN', '57', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('58', '7', '1', 'APP  631  XN', '58', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('59', '7', '1', 'APP  634  XN', '59', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('60', '7', '1', 'LSD  815  XP', '60', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('61', '7', '1', 'LSD  817  XP', '61', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('62', '7', '1', 'LSD  819  XP', '62', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('63', '7', '1', 'LSD  821  XP', '63', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('64', '7', '1', 'LSD  823  XP', '64', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('65', '7', '1', 'XH  942  MUS', '65', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('66', '7', '1', 'XT  760  JJJ', '66', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('67', '7', '1', 'YA  886  AKD', '67', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('68', '7', '1', 'YA  888 AKD', '68', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('69', '7', '1', 'YA  894  AKD', '69', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('70', '7', '1', 'YA  901  AKD', '70', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('71', '7', '1', 'YA  904  AKD', '71', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('72', '7', '1', 'YB  116  MUS', '72', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('73', '7', '1', 'YB  120  MUS', '73', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('74', '7', '1', 'XN  304  GGE', '74', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('75', '7', '1', 'ABC  358  XA', '75', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('76', '7', '1', 'ABC  365  XA', '76', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('77', '7', '1', 'ABC  369  XA', '77', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('78', '7', '1', 'ABC  371  XA', '78', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('79', '7', '1', 'LSD  435  XA', '79', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('80', '7', '1', 'LSD  437  XA', '80', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('81', '7', '1', 'LSD  439  XA', '81', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('82', '7', '1', 'ABJ  432  XA', '82', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('83', '7', '1', 'ABJ  434  XA', '83', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('84', '7', '1', 'EPE  647  XF', '84', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('85', '7', '1', 'EPE  650  XF', '85', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('86', '7', '1', 'EPE  925  XF', '86', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('87', '7', '1', 'EPE  969  XF', '87', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('88', '7', '1', 'LSR  819  XC', '88', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('89', '7', '1', 'LSR  821  XC', '89', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('90', '7', '1', 'LSR  823  XC', '90', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('91', '7', '1', 'APP  928  XC', '91', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('92', '7', '1', 'APP  932  XC', '92', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('93', '7', '1', 'APP 937  XC', '93', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('94', '7', '1', 'AAH  07  XA', '94', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('95', '7', '1', 'AAH  09  XA', '95', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('96', '7', '1', 'AAH  22  XA', '96', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('97', '7', '1', 'AAH  40  XA', '97', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('98', '7', '1', 'BDG  893  XB', '98', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('99', '7', '1', 'BDG  895  XB', '99', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('100', '7', '1', 'SMK  537  XE', '100', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('101', '7', '1', 'SMK  539  XE', '101', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('102', '7', '1', 'SMK  543  XE', '102', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('103', '7', '1', 'LND  400 XG', '103', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('104', '7', '1', 'LND  402 XG', '104', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('105', '7', '1', 'LND  404  XG', '105', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('106', '7', '1', 'KRD  231  XF', '106', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('107', '7', '1', 'MUS  231  XN', '107', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('108', '7', '1', 'MUS  233  XN', '108', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('109', '7', '1', 'APP  626  XN', '109', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('110', '7', '1', 'APP  628  XN', '110', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('111', '7', '1', 'APP  630  XN', '111', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('112', '7', '1', 'APP  633  XN', '112', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('113', '7', '1', 'APP  637  XN', '113', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('114', '7', '1', 'LSD  816  XP', '114', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('115', '7', '1', 'LSD  818  XP', '115', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('116', '7', '1', 'LSD  820  XP', '116', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('117', '7', '1', 'LSD  822  XP', '117', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('118', '7', '1', 'LSD  824  XP', '118', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('119', '8', '1', 'GWA  675  XA', '119', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('120', '10', '1', 'AAH  78  XR', '120', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('121', '10', '1', 'AAH  77  XR', '121', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('122', '10', '1', 'APP  535  XQ ', '122', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('123', '10', '1', 'AAA  620  XR', '123', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('124', '10', '1', 'AAA  618  XR', '124', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('125', '10', '1', 'AAA  569  XR', '125', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('126', '10', '1', 'AAA  568  XR', '126', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;

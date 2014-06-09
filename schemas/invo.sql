/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50617
 Source Host           : localhost
 Source Database       : invo

 Target Server Type    : MySQL
 Target Server Version : 50617
 File Encoding         : utf-8

 Date: 06/09/2014 20:42:40 PM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `companies`
-- ----------------------------
DROP TABLE IF EXISTS `companies`;
CREATE TABLE `companies` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(70) COLLATE utf8_spanish_ci NOT NULL,
  `telephone` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `address` varchar(40) COLLATE utf8_spanish_ci NOT NULL,
  `city` varchar(40) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- ----------------------------
--  Records of `companies`
-- ----------------------------
BEGIN;
INSERT INTO `companies` VALUES ('1', 'Acme', '31566564', 'Address', 'Hello'), ('2', 'Acme Inc', '+44 564612345', 'Guildhall, PO Box 270, London', 'London');
COMMIT;

-- ----------------------------
--  Table structure for `contact`
-- ----------------------------
DROP TABLE IF EXISTS `contact`;
CREATE TABLE `contact` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(70) COLLATE utf8_spanish_ci NOT NULL,
  `email` varchar(70) COLLATE utf8_spanish_ci NOT NULL,
  `comments` text COLLATE utf8_spanish_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- ----------------------------
--  Table structure for `parts`
-- ----------------------------
DROP TABLE IF EXISTS `parts`;
CREATE TABLE `parts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(70) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `parts`
-- ----------------------------
BEGIN;
INSERT INTO `parts` VALUES ('1', 'parts1'), ('2', 'parts2');
COMMIT;

-- ----------------------------
--  Table structure for `product_types`
-- ----------------------------
DROP TABLE IF EXISTS `product_types`;
CREATE TABLE `product_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(70) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- ----------------------------
--  Records of `product_types`
-- ----------------------------
BEGIN;
INSERT INTO `product_types` VALUES ('5', 'Vegetables'), ('6', 'Fruits');
COMMIT;

-- ----------------------------
--  Table structure for `products`
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_types_id` int(10) unsigned NOT NULL,
  `name` varchar(70) COLLATE utf8_spanish_ci NOT NULL,
  `price` decimal(16,2) NOT NULL,
  `active` enum('Y','N') COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- ----------------------------
--  Records of `products`
-- ----------------------------
BEGIN;
INSERT INTO `products` VALUES ('1', '5', 'Artichoke', '10.50', 'Y'), ('2', '5', 'Bell pepper', '10.40', 'Y'), ('3', '5', 'Cauliflower', '20.10', 'Y'), ('4', '5', 'Chinese cabbage', '15.50', 'Y'), ('5', '5', 'Malabar spinach', '7.50', 'Y'), ('6', '5', 'Onion', '3.50', 'Y'), ('7', '5', 'Peanut', '4.50', 'Y');
COMMIT;

-- ----------------------------
--  Table structure for `robots`
-- ----------------------------
DROP TABLE IF EXISTS `robots`;
CREATE TABLE `robots` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(70) NOT NULL,
  `type` varchar(32) NOT NULL,
  `year` int(11) NOT NULL,
  `conditions` int(11) DEFAULT '10',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `robots`
-- ----------------------------
BEGIN;
INSERT INTO `robots` VALUES ('1', 'robots1', '1', '1111', '10'), ('2', 'robots2', '1', '2222', '10'), ('3', 'Astro Boy', '2', '1952', null);
COMMIT;

-- ----------------------------
--  Table structure for `robots_parts`
-- ----------------------------
DROP TABLE IF EXISTS `robots_parts`;
CREATE TABLE `robots_parts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `robots_id` int(10) NOT NULL,
  `parts_id` int(10) NOT NULL,
  `created_at` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `robots_id` (`robots_id`),
  KEY `parts_id` (`parts_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `robots_parts`
-- ----------------------------
BEGIN;
INSERT INTO `robots_parts` VALUES ('1', '1', '1', '2014-06-06'), ('2', '1', '2', '2014-06-06'), ('3', '2', '2', '2014-06-06'), ('4', '2', '1', '2014-06-06');
COMMIT;

-- ----------------------------
--  Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(32) COLLATE utf8_spanish_ci NOT NULL,
  `password` char(40) COLLATE utf8_spanish_ci NOT NULL,
  `name` varchar(120) COLLATE utf8_spanish_ci NOT NULL,
  `email` varchar(70) COLLATE utf8_spanish_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `active` char(1) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- ----------------------------
--  Records of `users`
-- ----------------------------
BEGIN;
INSERT INTO `users` VALUES ('1', 'demo', 'c0bd96dc7ea4ec56741a4e07f6ce98012814d853', 'Phalcon Demo', 'demo@phalconphp.com', '2012-04-10 20:53:03', 'Y'), ('4', 'feiyuhit', 'a642a77abd7d4f51bf9226ceaf891fcbb5b299b8', 'feiyuhit', 'feiyu-87@163.com', '2014-06-05 17:37:31', 'Y');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;

/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 80011
Source Host           : localhost:3306
Source Database       : shop

Target Server Type    : MYSQL
Target Server Version : 80011
File Encoding         : 65001

Date: 2019-02-28 00:14:36
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('admin', 'admin');

-- ----------------------------
-- Table structure for car
-- ----------------------------
DROP TABLE IF EXISTS `car`;
CREATE TABLE `car` (
  `Uname` varchar(255) DEFAULT NULL,
  `Gid` int(11) DEFAULT NULL,
  `date` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of car
-- ----------------------------
INSERT INTO `car` VALUES ('12345678910', '3', '2018-12-25-15-32');

-- ----------------------------
-- Table structure for dingdan
-- ----------------------------
DROP TABLE IF EXISTS `dingdan`;
CREATE TABLE `dingdan` (
  `id` varchar(255) DEFAULT NULL,
  `goods` varchar(255) DEFAULT NULL,
  `total` varchar(255) DEFAULT NULL,
  `time` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dingdan
-- ----------------------------
INSERT INTO `dingdan` VALUES ('201902017215433248', '小米（MI）\r\n海信(Hisense) A66 55英寸高清4K\r\n海信（Hisense）NU8800U\r\n', '12188.0', '21:54:33');
INSERT INTO `dingdan` VALUES ('201902017220727643', '小米（MI）\r\n海信(Hisense) A66 55英寸高清4K\r\n海信（Hisense）NU8800U\r\n', '12188.0', '22:07:27');
INSERT INTO `dingdan` VALUES ('201902017220847494', '小米（MI）\r\n海信（Hisense）HZ55E52A 55英寸4K高清智能平板液晶AI全面屏电视机\r\n', '7580.0', '22:08:47');

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `Gid` int(11) NOT NULL AUTO_INCREMENT,
  `Gname` text,
  `Gprice` double DEFAULT NULL,
  `Gcontent` text,
  `Gimg` text,
  `Gdate` datetime DEFAULT NULL,
  `Gamount` int(11) DEFAULT NULL,
  `Glook` int(11) DEFAULT '0',
  `Gkind` text,
  PRIMARY KEY (`Gid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES ('1', '小米（MI）', '5124', '小米（MI）小米电视4A 65英寸 L65M5-AZ/L65M5-AD 2GB+8GB HDR 4K超高清 人工智能网络液晶平板电视', 'img/user/201812024223050667.jpg', '2018-12-24 22:30:50', '10', '0', '3');
INSERT INTO `goods` VALUES ('2', '海信（Hisense）HZ55E52A 55英寸4K高清智能平板液晶AI全面屏电视机', '2456', '海信（Hisense）H55E3A 55英寸 超高清4K HDR 金属背板 人工智能电视 丰富影视教育资源', 'img/user/201812025152621389.jpg', '2018-12-25 15:26:21', '100', '0', '电视');
INSERT INTO `goods` VALUES ('3', '海信(Hisense) A66 55英寸高清4K', '2500', '海信(Hisense) A66 55英寸高清4K HDR 人工智能 液晶曲面WIFI网络平板电视 55英HZ55A66', 'img/user/201812025152803830.jpg', '2018-12-25 15:28:03', '50', '0', '电视');
INSERT INTO `goods` VALUES ('4', '海信（Hisense）HZ65E6AC 65', '6500', '海信（Hisense）HZ65E6AC 65英寸 4K曲面 无边全面屏 语音控制 AI人工智能电视', 'img/user/201812025152933100.jpg', '2018-12-25 15:29:33', '20', '0', '电视');
INSERT INTO `goods` VALUES ('5', '海信（Hisense）NU8800U', '4564', '海信（Hisense）NU8800U系列 4K高清 薄 ULED画质 人工语音智能量子点电视 LED55NU8800U(55英)', 'img/user/201812025153046694.jpg', '2018-12-25 15:30:46', '2', '0', '电视');
INSERT INTO `goods` VALUES ('6', '微鲸 （WHALEY）', '2499', '微鲸 （WHALEY）55D2UK 55英寸 4K超高清 2GB+16GB 超薄 人工智能 互联网LED液晶平板电视机', 'img/user/201812025153357705.jpg', '2018-12-25 15:33:57', '5', '0', '电视');
INSERT INTO `goods` VALUES ('7', '海尔（Haier）大吸力 ', '1349', '海尔（Haier）大吸力 一级能效 18立方米瞬吸 欧式抽油烟机 CXW-200-E900T2S', 'img/user/201902017201107855.jpg', '2018-12-25 15:35:57', '15', '0', '厨具');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `birthday` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('570524201', '570524201', '25', '17332720426', '199808301514');
INSERT INTO `users` VALUES ('123456', '12345678', '25', '17332720426', '1198');
INSERT INTO `users` VALUES ('5705242011', '570524201', '25', '17332720426', '19980830');
INSERT INTO `users` VALUES ('12345678910', '12345678910', '2', '120120120', '1998-08-22');

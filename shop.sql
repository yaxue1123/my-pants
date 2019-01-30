/*
Navicat MySQL Data Transfer

Source Server         : gyx
Source Server Version : 50625
Source Host           : localhost:3306
Source Database       : shop

Target Server Type    : MYSQL
Target Server Version : 50625
File Encoding         : 65001

Date: 2015-11-10 13:07:53
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for account1
-- ----------------------------
DROP TABLE IF EXISTS `account1`;
CREATE TABLE `account1` (
  `AccountId` int(11) NOT NULL AUTO_INCREMENT,
  `UserName` varchar(255) DEFAULT NULL,
  `Money` float DEFAULT NULL,
  PRIMARY KEY (`AccountId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of account1
-- ----------------------------
INSERT INTO `account1` VALUES ('7', 'guoyaxue', '8016');
INSERT INTO `account1` VALUES ('8', 'ggg', '108');
INSERT INTO `account1` VALUES ('9', 'admin', '10000');
INSERT INTO `account1` VALUES ('10', 'meadow', '8728');

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart` (
  `Id` int(255) NOT NULL AUTO_INCREMENT,
  `ProductName` varchar(255) DEFAULT NULL,
  `ProductId` int(255) DEFAULT NULL,
  `Price` float(20,0) DEFAULT NULL,
  `Amount` int(255) DEFAULT NULL,
  `Sum` float(20,0) DEFAULT NULL,
  `Size` varchar(255) DEFAULT NULL,
  `Color` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cart
-- ----------------------------

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `ProductId` int(11) DEFAULT NULL,
  `UserId` int(11) DEFAULT NULL,
  `UserName` varchar(255) DEFAULT NULL,
  `Grade` int(11) DEFAULT NULL,
  `Content` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('8', '10', null, 'guoyaxue', '5', 'very good ');
INSERT INTO `comment` VALUES ('9', '11', null, 'meadow', '5', 'very soft and nice');
INSERT INTO `comment` VALUES ('10', '19', null, 'meadow', '5', 'This jeans is super stretchful and beautiful.I wear it for a whole day and feel very comfort.Also, the price is reasonable.Buy it now!');
INSERT INTO `comment` VALUES ('11', '8', null, 'meadow', '5', 'niceeeeee!!!!');
INSERT INTO `comment` VALUES ('12', '8', null, 'ggg', '5', 'very gooddddd!!!');
INSERT INTO `comment` VALUES ('13', '11', null, 'ggg', '5', 'good');
INSERT INTO `comment` VALUES ('14', '2', null, 'ggg', '5', 'sgsrgshertrh');

-- ----------------------------
-- Table structure for logistic
-- ----------------------------
DROP TABLE IF EXISTS `logistic`;
CREATE TABLE `logistic` (
  `LogisticId` int(11) NOT NULL AUTO_INCREMENT,
  `Complete` varchar(255) DEFAULT NULL,
  `OrderId` int(11) DEFAULT NULL,
  PRIMARY KEY (`LogisticId`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of logistic
-- ----------------------------
INSERT INTO `logistic` VALUES ('25', 'no', '135');
INSERT INTO `logistic` VALUES ('26', 'no', '136');
INSERT INTO `logistic` VALUES ('27', 'no', '137');
INSERT INTO `logistic` VALUES ('28', 'no', '138');
INSERT INTO `logistic` VALUES ('29', 'no', '139');
INSERT INTO `logistic` VALUES ('30', 'no', '140');
INSERT INTO `logistic` VALUES ('31', 'no', '141');
INSERT INTO `logistic` VALUES ('32', 'no', '142');
INSERT INTO `logistic` VALUES ('33', 'no', '143');
INSERT INTO `logistic` VALUES ('34', 'no', '144');

-- ----------------------------
-- Table structure for olunion
-- ----------------------------
DROP TABLE IF EXISTS `olunion`;
CREATE TABLE `olunion` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `orderId` int(11) DEFAULT NULL,
  `logisticId` int(11) DEFAULT NULL,
  `desitination` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of olunion
-- ----------------------------
INSERT INTO `olunion` VALUES ('25', '136', '26', 'warehouse');
INSERT INTO `olunion` VALUES ('26', '137', '27', 'warehouse');
INSERT INTO `olunion` VALUES ('27', '138', '28', 'warehouse');
INSERT INTO `olunion` VALUES ('28', '139', '29', 'warehouse');
INSERT INTO `olunion` VALUES ('29', '140', '30', 'warehouse');
INSERT INTO `olunion` VALUES ('30', '141', '31', 'warehouse');
INSERT INTO `olunion` VALUES ('31', '142', '32', 'warehouse');
INSERT INTO `olunion` VALUES ('32', '143', '33', 'warehouse');
INSERT INTO `olunion` VALUES ('33', '144', '34', 'warehouse');

-- ----------------------------
-- Table structure for oorder
-- ----------------------------
DROP TABLE IF EXISTS `oorder`;
CREATE TABLE `oorder` (
  `OderId` int(11) NOT NULL AUTO_INCREMENT,
  `Price` float(10,0) DEFAULT NULL,
  `UserName` varchar(255) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `Consignee` varchar(255) DEFAULT NULL,
  `Tele` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`OderId`)
) ENGINE=InnoDB AUTO_INCREMENT=145 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oorder
-- ----------------------------
INSERT INTO `oorder` VALUES ('136', '1029', 'guoyaxue', '35', 'gs', '14324');
INSERT INTO `oorder` VALUES ('137', '589', 'guoyaxue', 'shahe', 'gyx', '177234536');
INSERT INTO `oorder` VALUES ('138', '366', 'guoyaxue', 'shahe', 'gyx', '17710176030');
INSERT INTO `oorder` VALUES ('139', '476', 'meadow', 'cufe', 'maidou', '18810396651');
INSERT INTO `oorder` VALUES ('140', '198', 'meadow', 'sh', 'md', '13803776958');
INSERT INTO `oorder` VALUES ('141', '496', 'ggg', 'shahe', 'gyx', '17710176030');
INSERT INTO `oorder` VALUES ('142', '198', 'ggg', 'shahe', 'gyxxx', '17710176030');
INSERT INTO `oorder` VALUES ('143', '198', 'ggg', 'aaa', 'ggg', '111');
INSERT INTO `oorder` VALUES ('144', '1074', 'meadow', '123', 'wqd', '213');

-- ----------------------------
-- Table structure for opunion
-- ----------------------------
DROP TABLE IF EXISTS `opunion`;
CREATE TABLE `opunion` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `OrderId` int(11) DEFAULT NULL,
  `ProductId` int(11) DEFAULT NULL,
  `Number` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of opunion
-- ----------------------------
INSERT INTO `opunion` VALUES ('51', '136', '3', '3');
INSERT INTO `opunion` VALUES ('52', '137', '12', '1');
INSERT INTO `opunion` VALUES ('53', '137', '16', '2');
INSERT INTO `opunion` VALUES ('54', '138', '11', '1');
INSERT INTO `opunion` VALUES ('55', '138', '5', '1');
INSERT INTO `opunion` VALUES ('56', '139', '11', '1');
INSERT INTO `opunion` VALUES ('57', '139', '19', '1');
INSERT INTO `opunion` VALUES ('58', '140', '8', '1');
INSERT INTO `opunion` VALUES ('59', '141', '8', '1');
INSERT INTO `opunion` VALUES ('60', '141', '4', '1');
INSERT INTO `opunion` VALUES ('61', '142', '11', '1');
INSERT INTO `opunion` VALUES ('62', '143', '2', '1');
INSERT INTO `opunion` VALUES ('63', '144', '12', '2');
INSERT INTO `opunion` VALUES ('64', '144', '8', '2');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `ProductId` int(11) NOT NULL AUTO_INCREMENT,
  `ProductName` varchar(255) DEFAULT NULL,
  `Category` varchar(255) DEFAULT NULL,
  `Price` float DEFAULT NULL,
  `Memo` varchar(255) DEFAULT NULL,
  `Sex` varchar(255) DEFAULT NULL,
  `Size` varchar(255) DEFAULT NULL,
  `Color` varchar(255) DEFAULT NULL,
  `Stock` int(11) DEFAULT NULL,
  `CostPrice` float DEFAULT NULL,
  `Shelves` varchar(255) DEFAULT NULL,
  `BuildDate` date DEFAULT NULL,
  PRIMARY KEY (`ProductId`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('1', 'sorona', 'xx', '198', 'soft and extremely stain resistant', 'm', 'm', 'black', '53', null, null, null);
INSERT INTO `product` VALUES ('2', 'sorona', 'xx', '198', 'soft and extremely stain resistant', 'm', 'm', 'khaki', '42', null, null, null);
INSERT INTO `product` VALUES ('3', 'sports-straight', 'xx', '339', 'for sporty girls', 'f', 'm', 'pink', '47', null, null, null);
INSERT INTO `product` VALUES ('4', 'skinny jeans', 'nz', '298', 'this jeans makes you look skinny', 'f', 'l', 'blue', '53', null, null, null);
INSERT INTO `product` VALUES ('5', 'short jeans', 'nz', '168', 'cool and soft', 'f', 'l', 'white', '52', null, null, null);
INSERT INTO `product` VALUES ('6', 'lycra', 'nz', '278', 'soft and elastic', 'm', 's', 'black', '55', null, null, null);
INSERT INTO `product` VALUES ('7', 'lycra', 'nz', '278', 'soft and elastic', 'm', 's', 'blue', '53', null, null, null);
INSERT INTO `product` VALUES ('8', 'sorona', 'xx', '198', 'soft and extremely stain resistant', 'm', 's', 'black', '14', null, null, null);
INSERT INTO `product` VALUES ('9', 'sorona', 'xx', '198', 'soft and extremely stain resistant', 'm', 'l', 'black', '54', null, null, null);
INSERT INTO `product` VALUES ('10', 'sorona', 'xx', '198', 'soft and extremely stain resistant', 'm', 's', 'khaki', '52', null, null, null);
INSERT INTO `product` VALUES ('11', 'sorona', 'xx', '198', 'soft and extremely stain resistant', 'm', 'l', 'khaki', '52', null, null, null);
INSERT INTO `product` VALUES ('12', 'sports-straight', 'xx', '339', 'for sporty girls', 'f', 's', 'pink', '52', null, null, null);
INSERT INTO `product` VALUES ('13', 'sports-straight', 'xx', '339', 'for sporty girls', 'f', 'l', 'pink', '55', null, null, null);
INSERT INTO `product` VALUES ('14', 'skinny jeans', 'nz', '298', 'this jeans makes you look skinny', 'f', 's', 'blue', '53', null, null, null);
INSERT INTO `product` VALUES ('15', 'skinny jeans', 'nz', '298', 'this jeans makes you look skinny', 'f', 'm', 'blue', '55', null, null, null);
INSERT INTO `product` VALUES ('16', 'short jeans', 'nz', '168', 'cool and soft', 'f', 's', 'white', '53', null, null, null);
INSERT INTO `product` VALUES ('17', 'short jeans', 'nz', '168', 'cool and soft', 'f', 'm', 'white', '55', null, null, null);
INSERT INTO `product` VALUES ('18', 'lycra', 'nz', '278', 'soft and elastic', 'm', 'm', 'black', '55', null, null, null);
INSERT INTO `product` VALUES ('19', 'lycra', 'nz', '278', 'soft and elastic', 'm', 'l', 'black', '54', null, null, null);
INSERT INTO `product` VALUES ('20', 'lycra', 'nz', '278', 'soft and elastic', 'm', 'm', 'blue', '55', null, null, null);
INSERT INTO `product` VALUES ('21', 'lycra', 'nz', '278', 'soft and elastic', 'm', 'l', 'blue', '55', null, null, null);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `LoginName` varchar(255) NOT NULL DEFAULT '',
  `Password` varchar(255) DEFAULT NULL,
  `FullName` varchar(255) DEFAULT NULL,
  `Gender` varchar(255) DEFAULT NULL,
  `BirthDate` varchar(255) DEFAULT NULL,
  `BuildDate` date DEFAULT NULL,
  `VIPLevel` varchar(255) DEFAULT NULL,
  `E-mail` varchar(255) DEFAULT NULL,
  `Status` varchar(255) DEFAULT NULL,
  `ConsumptionAmount` float DEFAULT NULL,
  `Region` varchar(255) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `Score` varchar(255) DEFAULT NULL,
  `PreDeposit` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', '123456', 'guanliyuan', 'man', '1900-01-01', null, null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('3', 'meadow', '0628', 'maidou', 'f', '20150628', null, null, null, null, null, null, null, null, null);

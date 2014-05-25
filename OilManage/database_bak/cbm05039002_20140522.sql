/*
Navicat MySQL Data Transfer

Source Server         : oil
Source Server Version : 50508
Source Host           : localhost:3306
Source Database       : cbm05039002

Target Server Type    : MYSQL
Target Server Version : 50508
File Encoding         : 65001

Date: 2014-05-22 23:44:51
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_algorithminput`
-- ----------------------------
DROP TABLE IF EXISTS `t_algorithminput`;
CREATE TABLE `t_algorithminput` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CycleID` int(11) DEFAULT NULL,
  `ParamID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_algorithminput
-- ----------------------------
INSERT INTO `t_algorithminput` VALUES ('13', '16', '4');
INSERT INTO `t_algorithminput` VALUES ('14', '16', '5');

-- ----------------------------
-- Table structure for `t_algorithmoutput`
-- ----------------------------
DROP TABLE IF EXISTS `t_algorithmoutput`;
CREATE TABLE `t_algorithmoutput` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CycleID` int(11) DEFAULT NULL,
  `ParamID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_algorithmoutput
-- ----------------------------
INSERT INTO `t_algorithmoutput` VALUES ('1', '12', '2');
INSERT INTO `t_algorithmoutput` VALUES ('2', '12', '3');
INSERT INTO `t_algorithmoutput` VALUES ('3', '13', '6');
INSERT INTO `t_algorithmoutput` VALUES ('4', '14', '6');
INSERT INTO `t_algorithmoutput` VALUES ('5', '15', '6');
INSERT INTO `t_algorithmoutput` VALUES ('6', '16', '6');

-- ----------------------------
-- Table structure for `t_algorithmscycle`
-- ----------------------------
DROP TABLE IF EXISTS `t_algorithmscycle`;
CREATE TABLE `t_algorithmscycle` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `InputID` int(11) DEFAULT NULL,
  `PlanID` int(11) DEFAULT NULL,
  `OutputID` int(11) DEFAULT NULL,
  `AuthorID` int(11) DEFAULT NULL,
  `Description` varchar(100) DEFAULT NULL,
  `AddTime` datetime DEFAULT NULL,
  `LastUpdateTime` datetime DEFAULT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `FilePath` varchar(255) DEFAULT NULL,
  `ClassName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_algorithmscycle
-- ----------------------------
INSERT INTO `t_algorithmscycle` VALUES ('16', '0', '0', '0', '1', 'final', '2014-03-28 10:47:45', '2014-03-28 10:47:45', '相加测试final', 'E:\\software\\tomcat7\\webapps\\OilManage\\uploadAlgorithm\\1395974864047.alg', 'TestAlg');
INSERT INTO `t_algorithmscycle` VALUES ('17', '0', '0', '0', '1', '根据直角边算斜边', '2014-03-31 16:04:44', '2014-03-31 16:04:44', '勾股定理', 'E:\\software\\tomcat7\\webapps\\OilManage\\uploadAlgorithm\\1396253083568.alg', 'TestGG');

-- ----------------------------
-- Table structure for `t_calchis`
-- ----------------------------
DROP TABLE IF EXISTS `t_calchis`;
CREATE TABLE `t_calchis` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Pro_ID` int(11) DEFAULT NULL,
  `Algorith_ID` int(11) DEFAULT NULL,
  `Calc_StartTime` datetime DEFAULT NULL,
  `Calc_EndTime` datetime DEFAULT NULL,
  `Calc_re` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_calchis
-- ----------------------------
INSERT INTO `t_calchis` VALUES ('1', null, '14', null, null, null);
INSERT INTO `t_calchis` VALUES ('3', '3', '14', '2014-03-27 10:54:13', '2014-03-27 10:54:20', 'OK');
INSERT INTO `t_calchis` VALUES ('4', '3', '14', '2014-03-27 10:54:16', '2014-03-27 10:54:42', 'OK');
INSERT INTO `t_calchis` VALUES ('5', '3', '14', '2014-03-28 10:41:05', '2014-03-28 10:41:25', 'OK');
INSERT INTO `t_calchis` VALUES ('6', '3', '14', '2014-03-28 10:50:04', '2014-03-28 10:50:26', 'OK');
INSERT INTO `t_calchis` VALUES ('7', '3', '14', '2014-03-28 10:51:58', '2014-03-28 10:52:14', 'OK');
INSERT INTO `t_calchis` VALUES ('8', '5', '16', '2014-03-28 10:52:44', '2014-03-28 10:52:44', 'OK');
INSERT INTO `t_calchis` VALUES ('9', '5', '16', '2014-03-28 10:53:25', '2014-03-28 10:53:25', 'OK');
INSERT INTO `t_calchis` VALUES ('10', '5', '16', '2014-03-28 11:09:55', '2014-03-28 11:09:55', 'OK');
INSERT INTO `t_calchis` VALUES ('11', '5', '16', '2014-03-28 11:10:03', '2014-03-28 11:10:03', 'OK');
INSERT INTO `t_calchis` VALUES ('12', '5', '16', '2014-03-28 11:16:15', '2014-03-28 11:16:15', 'OK');
INSERT INTO `t_calchis` VALUES ('13', '5', '16', '2014-03-28 11:16:20', '2014-03-28 11:16:20', 'OK');
INSERT INTO `t_calchis` VALUES ('14', '5', '16', '2014-03-31 15:46:09', '2014-03-31 15:46:10', null);
INSERT INTO `t_calchis` VALUES ('15', '5', '16', '2014-03-31 15:47:28', '2014-03-31 15:48:00', null);
INSERT INTO `t_calchis` VALUES ('16', '5', '16', '2014-03-31 15:57:20', '2014-03-31 15:57:25', null);
INSERT INTO `t_calchis` VALUES ('17', '6', '17', '2014-03-31 16:05:55', '2014-03-31 16:05:56', null);
INSERT INTO `t_calchis` VALUES ('18', '6', '17', '2014-03-31 16:08:01', '2014-03-31 16:08:02', null);
INSERT INTO `t_calchis` VALUES ('19', '6', '17', '2014-03-31 16:12:11', '2014-03-31 16:12:11', null);

-- ----------------------------
-- Table structure for `t_calcinput_his`
-- ----------------------------
DROP TABLE IF EXISTS `t_calcinput_his`;
CREATE TABLE `t_calcinput_his` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Pro_ID` int(11) DEFAULT NULL,
  `par_id` int(11) DEFAULT NULL,
  `par_display` varchar(50) DEFAULT NULL,
  `par_value` double DEFAULT NULL,
  `par_name` varchar(50) DEFAULT NULL,
  `par_messID` int(11) DEFAULT NULL,
  `par_ISOValue` double DEFAULT NULL,
  `Calc_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_calcinput_his
-- ----------------------------
INSERT INTO `t_calcinput_his` VALUES ('1', '2', '1', null, '0', null, null, null, '-1');
INSERT INTO `t_calcinput_his` VALUES ('2', '2', '3', null, '0', null, null, null, '-1');
INSERT INTO `t_calcinput_his` VALUES ('4', '2', '1', null, '0', null, null, null, '-1');
INSERT INTO `t_calcinput_his` VALUES ('5', '2', '3', null, '0', null, null, null, '-1');
INSERT INTO `t_calcinput_his` VALUES ('7', '2', '1', null, '0', null, null, null, '-1');
INSERT INTO `t_calcinput_his` VALUES ('8', '2', '3', null, '0', null, null, null, '-1');
INSERT INTO `t_calcinput_his` VALUES ('9', '3', '4', '加数1', '156', 'a', '2', '15.600000000000001', '3');
INSERT INTO `t_calcinput_his` VALUES ('10', '3', '5', '加数2', '1561', 'b', '3', '15.610000000000001', '3');
INSERT INTO `t_calcinput_his` VALUES ('12', '3', '4', '加数1', '156', 'a', '2', '15.600000000000001', '4');
INSERT INTO `t_calcinput_his` VALUES ('13', '3', '5', '加数2', '1561', 'b', '3', '15.610000000000001', '4');
INSERT INTO `t_calcinput_his` VALUES ('14', '3', '4', '加数1', '156', 'a', '2', '15.600000000000001', '5');
INSERT INTO `t_calcinput_his` VALUES ('15', '3', '5', '加数2', '1561', 'b', '3', '15.610000000000001', '5');
INSERT INTO `t_calcinput_his` VALUES ('17', '3', '4', '加数1', '156', 'a', '2', '15.600000000000001', '6');
INSERT INTO `t_calcinput_his` VALUES ('18', '3', '5', '加数2', '1561', 'b', '3', '15.610000000000001', '6');
INSERT INTO `t_calcinput_his` VALUES ('20', '3', '4', '加数1', '156', 'a', '2', '15.600000000000001', '7');
INSERT INTO `t_calcinput_his` VALUES ('21', '3', '5', '加数2', '1561', 'b', '3', '15.610000000000001', '7');
INSERT INTO `t_calcinput_his` VALUES ('23', '5', '4', '加数1', '99', 'a', '2', '9.9', '8');
INSERT INTO `t_calcinput_his` VALUES ('24', '5', '5', '加数2', '154.2', 'b', '3', '1.5419999999999998', '8');
INSERT INTO `t_calcinput_his` VALUES ('26', '5', '4', '加数1', '99', 'a', '2', '9.9', '9');
INSERT INTO `t_calcinput_his` VALUES ('27', '5', '5', '加数2', '154.2', 'b', '3', '1.5419999999999998', '9');
INSERT INTO `t_calcinput_his` VALUES ('29', '5', '4', '加数1', '99', 'a', '2', '9.9', '10');
INSERT INTO `t_calcinput_his` VALUES ('30', '5', '5', '加数2', '154.2', 'b', '3', '1.5419999999999998', '10');
INSERT INTO `t_calcinput_his` VALUES ('32', '5', '4', '加数1', '99', 'a', '2', '9.9', '11');
INSERT INTO `t_calcinput_his` VALUES ('33', '5', '5', '加数2', '154.2', 'b', '3', '1.5419999999999998', '11');
INSERT INTO `t_calcinput_his` VALUES ('35', '5', '4', '加数1', '99', 'a', '2', '9.9', '12');
INSERT INTO `t_calcinput_his` VALUES ('36', '5', '5', '加数2', '154.2', 'b', '3', '1.5419999999999998', '12');
INSERT INTO `t_calcinput_his` VALUES ('38', '5', '4', '加数1', '99', 'a', '2', '9.9', '13');
INSERT INTO `t_calcinput_his` VALUES ('39', '5', '5', '加数2', '154.2', 'b', '3', '1.5419999999999998', '13');
INSERT INTO `t_calcinput_his` VALUES ('40', '5', '4', '加数1', '13.54', 'a', '2', '9.9', '14');
INSERT INTO `t_calcinput_his` VALUES ('41', '5', '5', '加数2', '154.2', 'b', '3', '1.5419999999999998', '14');
INSERT INTO `t_calcinput_his` VALUES ('43', '5', '4', '加数1', '13.54', 'a', '2', '9.9', '15');
INSERT INTO `t_calcinput_his` VALUES ('44', '5', '5', '加数2', '154.2', 'b', '3', '1.5419999999999998', '15');
INSERT INTO `t_calcinput_his` VALUES ('46', '5', '4', '加数1', '12.15', 'a', '2', '1.215', '16');
INSERT INTO `t_calcinput_his` VALUES ('47', '5', '5', '加数2', '154.2', 'b', '3', '1.5419999999999998', '16');
INSERT INTO `t_calcinput_his` VALUES ('49', '6', '7', '直角边a', '50', 'ZHIBIAN1', '3', '0.5', '17');
INSERT INTO `t_calcinput_his` VALUES ('50', '6', '8', '直角边b', '1.2', 'ZHIBIAN2', '1', '1.2', '17');
INSERT INTO `t_calcinput_his` VALUES ('52', '6', '7', '直角边a', '3', 'ZHIBIAN1', '3', '3000', '18');
INSERT INTO `t_calcinput_his` VALUES ('53', '6', '8', '直角边b', '0.04', 'ZHIBIAN2', '1', '0.00004', '18');
INSERT INTO `t_calcinput_his` VALUES ('55', '6', '7', '直角边a', '3', 'ZHIBIAN1', '3', '0.03', '19');
INSERT INTO `t_calcinput_his` VALUES ('56', '6', '8', '直角边b', '0.04', 'ZHIBIAN2', '1', '0.04', '19');

-- ----------------------------
-- Table structure for `t_calcoutput_his`
-- ----------------------------
DROP TABLE IF EXISTS `t_calcoutput_his`;
CREATE TABLE `t_calcoutput_his` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Pro_ID` int(11) DEFAULT NULL,
  `Par_ID` int(11) DEFAULT NULL,
  `par_display` varchar(50) DEFAULT NULL,
  `par_value` double DEFAULT NULL,
  `par_name` varchar(50) DEFAULT NULL,
  `par_messID` int(11) DEFAULT NULL,
  `par_ISOValue` double DEFAULT NULL,
  `Calc_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_calcoutput_his
-- ----------------------------
INSERT INTO `t_calcoutput_his` VALUES ('1', '3', '6', '相加结果', '3121', 'c', '3', '31.21', '3');
INSERT INTO `t_calcoutput_his` VALUES ('2', '3', '6', '相加结果', '3121', 'c', '3', '31.21', '4');
INSERT INTO `t_calcoutput_his` VALUES ('3', '3', '6', '相加结果', '3121', 'c', '3', '31.21', '5');
INSERT INTO `t_calcoutput_his` VALUES ('4', '3', '6', '相加结果', '3121', 'c', '3', '31.21', '6');
INSERT INTO `t_calcoutput_his` VALUES ('5', '3', '6', '相加结果', '3121', 'c', '3', '31.21', '7');
INSERT INTO `t_calcoutput_his` VALUES ('6', '5', '6', '相加结果', '1144.2', 'c', '3', '11.442', '8');
INSERT INTO `t_calcoutput_his` VALUES ('7', '5', '6', '相加结果', '1144.2', 'c', '3', '11.442', '9');
INSERT INTO `t_calcoutput_his` VALUES ('8', '5', '6', '相加结果', '1144.2', 'c', '3', '11.442', '10');
INSERT INTO `t_calcoutput_his` VALUES ('9', '5', '6', '相加结果', '1144.2', 'c', '3', '11.442', '11');
INSERT INTO `t_calcoutput_his` VALUES ('10', '5', '6', '相加结果', '1144.2', 'c', '3', '11.442', '12');
INSERT INTO `t_calcoutput_his` VALUES ('11', '5', '6', '相加结果', '1144.2', 'c', '3', '11.442', '13');
INSERT INTO `t_calcoutput_his` VALUES ('12', '5', '6', '相加结果', '1144.2', 'c', '3', '11.442', '14');
INSERT INTO `t_calcoutput_his` VALUES ('13', '5', '6', '相加结果', '1144.2', 'c', '3', '11.442', '15');
INSERT INTO `t_calcoutput_his` VALUES ('14', '5', '6', '相加结果', '275.7', 'c', '3', '2.7569999999999997', '16');
INSERT INTO `t_calcoutput_his` VALUES ('15', '6', '9', '斜边', '130', 'XIEBIAN', '3', '1.3', '17');
INSERT INTO `t_calcoutput_his` VALUES ('16', '6', '9', '斜边', '300000.00000000006', 'XIEBIAN', '3', '3000.0000000000005', '18');
INSERT INTO `t_calcoutput_his` VALUES ('17', '6', '9', '斜边', '5', 'XIEBIAN', '3', '0.05', '19');

-- ----------------------------
-- Table structure for `t_guiconnect`
-- ----------------------------
DROP TABLE IF EXISTS `t_guiconnect`;
CREATE TABLE `t_guiconnect` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pro_id` int(11) DEFAULT NULL,
  `pointleft` int(11) DEFAULT NULL,
  `pointright` int(11) DEFAULT NULL,
  `statusNow` int(11) DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_guiconnect
-- ----------------------------
INSERT INTO `t_guiconnect` VALUES ('2', '63', '223', '200', '-1', '2014-05-22 23:33:10');
INSERT INTO `t_guiconnect` VALUES ('3', '63', '223', '200', '-1', '2014-05-22 23:34:16');
INSERT INTO `t_guiconnect` VALUES ('4', '63', '223', '200', '-1', '2014-05-22 23:39:01');
INSERT INTO `t_guiconnect` VALUES ('5', '63', '223', '200', '-1', '2014-05-22 23:43:18');
INSERT INTO `t_guiconnect` VALUES ('6', '63', '219', '203', '-1', '2014-05-22 23:43:18');
INSERT INTO `t_guiconnect` VALUES ('7', '63', '227', '219', '-1', '2014-05-22 23:43:18');
INSERT INTO `t_guiconnect` VALUES ('8', '63', '206', '227', '1', '2014-05-22 23:43:56');

-- ----------------------------
-- Table structure for `t_guijson`
-- ----------------------------
DROP TABLE IF EXISTS `t_guijson`;
CREATE TABLE `t_guijson` (
  `ID` int(11) NOT NULL,
  `JSONData` text,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_guijson
-- ----------------------------
INSERT INTO `t_guijson` VALUES ('1', '{\"attrs\":{\"x\":100,\"id\":\"painting\",\"width\":3000,\"height\":2000,\"fill\":\"#ff33ee\",\"draggable\":true},\"className\":\"Layer\",\"children\":[{\"attrs\":{\"x\":219,\"y\":57,\"points\":[0,0,90,0,90,10,0,10],\"fill\":\"#00D2FF\",\"stroke\":\"black\",\"draggable\":true,\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"x\":270,\"y\":130,\"points\":[0,0,90,0,90,10,0,10],\"fill\":\"#00FF00\",\"stroke\":\"black\",\"draggable\":true,\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"x\":99,\"y\":122,\"points\":[0,0,90,0,90,10,0,10],\"fill\":\"#FF0000\",\"stroke\":\"black\",\"draggable\":true,\"closed\":true},\"className\":\"Line\"}]}');
INSERT INTO `t_guijson` VALUES ('2', '{\"attrs\":{\"x\":100,\"id\":\"painting\",\"width\":3000,\"height\":2000,\"fill\":\"#ff33ee\",\"draggable\":true},\"className\":\"Layer\",\"children\":[{\"attrs\":{\"x\":100,\"y\":58,\"points\":[0,0,90,0,90,10,0,10],\"fill\":\"#00D2FF\",\"stroke\":\"black\",\"draggable\":true,\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"x\":292,\"y\":108,\"points\":[0,0,90,0,90,10,0,10],\"fill\":\"#00FF00\",\"stroke\":\"black\",\"draggable\":true,\"closed\":true},\"className\":\"Line\"}]}');
INSERT INTO `t_guijson` VALUES ('3', '{\"attrs\":{\"x\":100,\"id\":\"painting\",\"width\":3000,\"height\":2000,\"fill\":\"#ff33ee\",\"draggable\":true},\"className\":\"Layer\",\"children\":[{\"attrs\":{\"x\":100,\"y\":58,\"points\":[0,0,90,0,90,10,0,10],\"fill\":\"#00D2FF\",\"stroke\":\"black\",\"draggable\":true,\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"x\":292,\"y\":108,\"points\":[0,0,90,0,90,10,0,10],\"fill\":\"#00FF00\",\"stroke\":\"black\",\"draggable\":true,\"closed\":true},\"className\":\"Line\"}]}');
INSERT INTO `t_guijson` VALUES ('4', '{\"attrs\":{\"x\":100,\"id\":\"painting\",\"width\":3000,\"height\":2000,\"fill\":\"#ff33ee\",\"draggable\":true},\"className\":\"Layer\",\"children\":[]}');
INSERT INTO `t_guijson` VALUES ('5', '{\"attrs\":{\"x\":100,\"id\":\"painting\",\"width\":3000,\"height\":2000,\"fill\":\"#ff33ee\",\"draggable\":true},\"className\":\"Layer\",\"children\":[]}');
INSERT INTO `t_guijson` VALUES ('6', '{\"attrs\":{\"x\":100,\"y\":100,\"id\":\"painting\",\"width\":3000,\"height\":2000,\"fill\":\"#ff33ee\",\"draggable\":true},\"className\":\"Layer\",\"children\":[]}');
INSERT INTO `t_guijson` VALUES ('7', '{\"attrs\":{\"x\":100,\"y\":100,\"id\":\"painting\",\"width\":3000,\"height\":2000,\"fill\":\"#ff33ee\",\"draggable\":true},\"className\":\"Layer\",\"children\":[{\"attrs\":{\"x\":102,\"y\":-44,\"points\":[0,0,90,0,90,10,0,10],\"fill\":\"#00D2FF\",\"stroke\":\"black\",\"draggable\":true,\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"x\":89,\"y\":-23,\"points\":[0,0,90,0,90,10,0,10],\"fill\":\"#00FF00\",\"stroke\":\"black\",\"draggable\":true,\"closed\":true},\"className\":\"Line\"}]}');
INSERT INTO `t_guijson` VALUES ('8', '{\"attrs\":{\"x\":100,\"y\":100,\"id\":\"painting\",\"width\":3000,\"height\":2000,\"fill\":\"#ff33ee\",\"draggable\":true},\"className\":\"Layer\",\"children\":[{\"attrs\":{\"x\":229,\"y\":8,\"points\":[0,0,90,0,90,10,0,10],\"fill\":\"#00FF00\",\"stroke\":\"black\",\"draggable\":true,\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"x\":141,\"y\":62,\"points\":[0,0,90,0,90,10,0,10],\"fill\":\"#FF0000\",\"stroke\":\"black\",\"draggable\":true,\"closed\":true},\"className\":\"Line\"}]}');
INSERT INTO `t_guijson` VALUES ('9', '{\"attrs\":{\"x\":100,\"y\":100,\"id\":\"painting\",\"width\":3000,\"height\":2000,\"fill\":\"#ff33ee\",\"draggable\":true,\"scaleX\":0.8,\"scaleY\":0.8},\"className\":\"Layer\",\"children\":[{\"attrs\":{\"x\":226,\"y\":36,\"points\":[0,0,90,0,90,10,0,10],\"fill\":\"#FF0000\",\"stroke\":\"black\",\"draggable\":true,\"closed\":true},\"className\":\"Line\"}]}');
INSERT INTO `t_guijson` VALUES ('10', '{\"attrs\":{\"x\":100,\"y\":100,\"id\":\"painting\",\"width\":3000,\"height\":2000,\"fill\":\"#ff33ee\",\"draggable\":true},\"className\":\"Layer\",\"children\":[{\"attrs\":{\"x\":144,\"points\":[0,0,90,0,90,10,0,10],\"fill\":\"#00FF00\",\"stroke\":\"black\",\"draggable\":true,\"closed\":true},\"className\":\"Line\"}]}');
INSERT INTO `t_guijson` VALUES ('11', '{\"attrs\":{\"x\":100,\"y\":100,\"id\":\"painting\",\"width\":3000,\"height\":2000,\"fill\":\"#ff33ee\",\"draggable\":true,\"visible\":true},\"className\":\"Layer\",\"children\":[{\"attrs\":{\"x\":242,\"y\":75,\"points\":[0,0,90,0,90,10,0,10],\"fill\":\"#00FF00\",\"stroke\":\"black\",\"draggable\":true,\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"x\":337,\"y\":79,\"points\":[0,0,90,0,90,10,0,10],\"fill\":\"#44ffee\",\"stroke\":\"black\",\"draggable\":true,\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"x\":141,\"y\":76,\"points\":[0,0,90,0,90,10,0,10],\"fill\":\"#44ffee\",\"stroke\":\"black\",\"draggable\":true,\"closed\":true},\"className\":\"Line\"}]}');
INSERT INTO `t_guijson` VALUES ('12', '{\"attrs\":{\"x\":100,\"y\":100,\"id\":\"painting\",\"width\":3000,\"height\":2000,\"fill\":\"#ff33ee\",\"draggable\":true},\"className\":\"Layer\",\"children\":[]}');
INSERT INTO `t_guijson` VALUES ('13', '{\"attrs\":{\"x\":100,\"y\":100,\"id\":\"painting\",\"width\":3000,\"height\":2000,\"fill\":\"#ff33ee\",\"draggable\":true},\"className\":\"Layer\",\"children\":[]}');
INSERT INTO `t_guijson` VALUES ('14', '{\"attrs\":{\"x\":100,\"y\":100,\"id\":\"painting\",\"width\":3000,\"height\":2000,\"fill\":\"#ff33ee\",\"draggable\":true},\"className\":\"Layer\",\"children\":[]}');
INSERT INTO `t_guijson` VALUES ('15', '{\"attrs\":{\"x\":100,\"y\":100,\"id\":\"painting\",\"width\":3000,\"height\":2000,\"fill\":\"#ff33ee\",\"draggable\":true,\"visible\":true},\"className\":\"Layer\",\"children\":[{\"attrs\":{\"x\":285,\"y\":62,\"radius\":15,\"fill\":\"red\",\"stroke\":\"black\",\"name\":\"test5\",\"rotation\":-10,\"draggable\":true},\"className\":\"Circle\"}]}');
INSERT INTO `t_guijson` VALUES ('16', '{\"attrs\":{\"x\":100,\"y\":100,\"id\":\"painting\",\"width\":3000,\"height\":2000,\"fill\":\"#ff33ee\",\"draggable\":true},\"className\":\"Layer\",\"children\":[]}');
INSERT INTO `t_guijson` VALUES ('17', '{\"attrs\":{\"x\":100,\"y\":100,\"id\":\"painting\",\"width\":3000,\"height\":2000,\"fill\":\"#ff33ee\",\"draggable\":true,\"visible\":true},\"className\":\"Layer\",\"children\":[{\"attrs\":{\"x\":143,\"y\":46,\"points\":[0,0,90,0,90,10,0,10],\"fill\":\"#00D2FF\",\"stroke\":\"black\",\"draggable\":true,\"closed\":true},\"className\":\"Line\"}]}');
INSERT INTO `t_guijson` VALUES ('18', '{\"attrs\":{\"x\":100,\"y\":100,\"id\":\"painting\",\"width\":3000,\"height\":2000,\"fill\":\"#ff33ee\",\"draggable\":true},\"className\":\"Layer\",\"children\":[]}');
INSERT INTO `t_guijson` VALUES ('19', '{\"attrs\":{\"x\":100,\"y\":100,\"id\":\"painting\",\"width\":3000,\"height\":2000,\"fill\":\"#ff33ee\",\"draggable\":true,\"visible\":true},\"className\":\"Layer\",\"children\":[{\"attrs\":{\"x\":124,\"y\":-8,\"points\":[0,0,90,0,90,10,0,10],\"fill\":\"#00FF00\",\"stroke\":\"black\",\"draggable\":true,\"name\":\"test2\",\"closed\":true},\"className\":\"Line\"}]}');
INSERT INTO `t_guijson` VALUES ('20', '{\"attrs\":{\"x\":100,\"y\":100,\"id\":\"painting\",\"width\":3000,\"height\":2000,\"fill\":\"#ff33ee\",\"draggable\":true},\"className\":\"Layer\",\"children\":[]}');
INSERT INTO `t_guijson` VALUES ('21', '{\"attrs\":{\"x\":100,\"y\":100,\"id\":\"painting\",\"width\":3000,\"height\":2000,\"fill\":\"#ff33ee\",\"draggable\":true},\"className\":\"Layer\",\"children\":[]}');
INSERT INTO `t_guijson` VALUES ('22', '{\"attrs\":{\"x\":100,\"y\":100,\"id\":\"painting\",\"width\":3000,\"height\":2000,\"fill\":\"#ff33ee\",\"draggable\":true},\"className\":\"Layer\",\"children\":[]}');
INSERT INTO `t_guijson` VALUES ('23', '{\"attrs\":{\"x\":100,\"y\":100,\"id\":\"painting\",\"width\":3000,\"height\":2000,\"fill\":\"#ff33ee\",\"draggable\":true},\"className\":\"Layer\",\"children\":[]}');
INSERT INTO `t_guijson` VALUES ('24', '{\"attrs\":{\"x\":100,\"y\":100,\"id\":\"painting\",\"width\":3000,\"height\":2000,\"fill\":\"#ff33ee\",\"draggable\":true},\"className\":\"Layer\",\"children\":[]}');
INSERT INTO `t_guijson` VALUES ('25', '{\"attrs\":{\"x\":100,\"y\":100,\"id\":\"painting\",\"width\":3000,\"height\":2000,\"fill\":\"#ff33ee\",\"draggable\":true},\"className\":\"Layer\",\"children\":[]}');
INSERT INTO `t_guijson` VALUES ('26', '{\"attrs\":{\"x\":100,\"y\":100,\"id\":\"painting\",\"width\":3000,\"height\":2000,\"fill\":\"#ff33ee\",\"draggable\":true},\"className\":\"Layer\",\"children\":[]}');
INSERT INTO `t_guijson` VALUES ('27', '{\"attrs\":{\"x\":100,\"y\":100,\"id\":\"painting\",\"width\":3000,\"height\":2000,\"fill\":\"#ff33ee\",\"draggable\":true},\"className\":\"Layer\",\"children\":[]}');
INSERT INTO `t_guijson` VALUES ('28', '{\"attrs\":{\"x\":100,\"y\":100,\"id\":\"painting\",\"width\":3000,\"height\":2000,\"fill\":\"#ff33ee\",\"draggable\":true},\"className\":\"Layer\",\"children\":[]}');
INSERT INTO `t_guijson` VALUES ('29', '{\"attrs\":{\"x\":100,\"y\":100,\"id\":\"painting\",\"width\":3000,\"height\":2000,\"fill\":\"#ff33ee\",\"draggable\":true},\"className\":\"Layer\",\"children\":[]}');
INSERT INTO `t_guijson` VALUES ('30', '{\"attrs\":{\"x\":100,\"y\":100,\"id\":\"painting\",\"width\":3000,\"height\":2000,\"fill\":\"#ff33ee\",\"draggable\":true},\"className\":\"Layer\",\"children\":[]}');
INSERT INTO `t_guijson` VALUES ('31', '{\"attrs\":{\"x\":100,\"y\":100,\"id\":\"painting\",\"width\":3000,\"height\":2000,\"fill\":\"#ff33ee\",\"draggable\":true},\"className\":\"Layer\",\"children\":[]}');
INSERT INTO `t_guijson` VALUES ('32', '{\"attrs\":{\"x\":100,\"y\":100,\"id\":\"painting\",\"width\":3000,\"height\":2000,\"fill\":\"#ff33ee\",\"draggable\":true},\"className\":\"Layer\",\"children\":[]}');
INSERT INTO `t_guijson` VALUES ('33', '{\"attrs\":{\"x\":100,\"y\":75,\"id\":\"painting\",\"width\":3000,\"height\":2000,\"fill\":\"#ff33ee\",\"draggable\":true,\"visible\":true,\"scaleX\":1.25,\"scaleY\":1.25},\"className\":\"Layer\",\"children\":[{\"attrs\":{\"x\":117,\"y\":21,\"draggable\":true,\"visible\":true},\"className\":\"Group\",\"children\":[{\"attrs\":{\"points\":[0,0,90,0,90,10,0,10],\"fill\":\"#FF0000\",\"stroke\":\"black\",\"name\":\"test3\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"y\":5,\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"name\":\"connPointsLeft\",\"visible\":true},\"className\":\"Circle\"},{\"attrs\":{\"x\":90,\"y\":5,\"name\":\"connPointsRight\",\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"visible\":true},\"className\":\"Circle\"}]},{\"attrs\":{\"x\":207,\"y\":21,\"draggable\":true,\"visible\":true},\"className\":\"Group\",\"children\":[{\"attrs\":{\"points\":[0,0,90,0,90,10,0,10],\"fill\":\"#FF0000\",\"stroke\":\"black\",\"name\":\"test3\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"y\":5,\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"name\":\"connPointsLeft\",\"visible\":true},\"className\":\"Circle\"},{\"attrs\":{\"x\":90,\"y\":5,\"name\":\"connPointsRight\",\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"visible\":true},\"className\":\"Circle\"}]},{\"attrs\":{\"x\":297,\"y\":21,\"draggable\":true,\"visible\":true},\"className\":\"Group\",\"children\":[{\"attrs\":{\"points\":[0,0,90,0,90,10,0,10],\"fill\":\"#44ffee\",\"stroke\":\"black\",\"name\":\"test4\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"y\":5,\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"name\":\"connPointsLeft\",\"visible\":true},\"className\":\"Circle\"},{\"attrs\":{\"x\":90,\"y\":5,\"name\":\"connPointsRight\",\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"visible\":true},\"className\":\"Circle\"}]},{\"attrs\":{\"x\":392,\"y\":26,\"draggable\":true,\"rotation\":90,\"visible\":true},\"className\":\"Group\",\"children\":[{\"attrs\":{\"points\":[0,0,90,0,90,10,0,10],\"fill\":\"#FF0000\",\"stroke\":\"black\",\"name\":\"test3\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"y\":5,\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"name\":\"connPointsLeft\",\"visible\":true},\"className\":\"Circle\"},{\"attrs\":{\"x\":90,\"y\":5,\"name\":\"connPointsRight\",\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"visible\":true},\"className\":\"Circle\"}]},{\"attrs\":{\"x\":387,\"y\":111,\"draggable\":true,\"visible\":true},\"className\":\"Group\",\"children\":[{\"attrs\":{\"points\":[0,0,90,0,90,10,0,10],\"fill\":\"#44ffee\",\"stroke\":\"black\",\"name\":\"test4\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"y\":5,\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"name\":\"connPointsLeft\",\"visible\":true},\"className\":\"Circle\"},{\"attrs\":{\"x\":90,\"y\":5,\"name\":\"connPointsRight\",\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"visible\":true},\"className\":\"Circle\"}]},{\"attrs\":{\"x\":477,\"y\":111,\"draggable\":true,\"visible\":true},\"className\":\"Group\",\"children\":[{\"attrs\":{\"points\":[0,0,90,0,90,10,0,10],\"fill\":\"#44ffee\",\"stroke\":\"black\",\"name\":\"test4\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"y\":5,\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"name\":\"connPointsLeft\",\"visible\":true},\"className\":\"Circle\"},{\"attrs\":{\"x\":90,\"y\":5,\"name\":\"connPointsRight\",\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"visible\":true},\"className\":\"Circle\"}]},{\"attrs\":{\"x\":572,\"y\":116,\"draggable\":true,\"rotation\":90,\"visible\":true},\"className\":\"Group\",\"children\":[{\"attrs\":{\"points\":[0,0,90,0,90,10,0,10],\"fill\":\"#FF0000\",\"stroke\":\"black\",\"name\":\"test3\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"y\":5,\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"name\":\"connPointsLeft\",\"visible\":true},\"className\":\"Circle\"},{\"attrs\":{\"x\":90,\"y\":5,\"name\":\"connPointsRight\",\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"visible\":true},\"className\":\"Circle\"}]},{\"attrs\":{\"x\":567,\"y\":201,\"draggable\":true,\"visible\":true},\"className\":\"Group\",\"children\":[{\"attrs\":{\"points\":[0,0,90,0,90,10,0,10],\"fill\":\"#44ffee\",\"stroke\":\"black\",\"name\":\"test4\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"y\":5,\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"name\":\"connPointsLeft\",\"visible\":true},\"className\":\"Circle\"},{\"attrs\":{\"x\":90,\"y\":5,\"name\":\"connPointsRight\",\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"visible\":true},\"className\":\"Circle\"}]},{\"attrs\":{\"x\":662,\"y\":206,\"draggable\":true,\"rotation\":90,\"visible\":true},\"className\":\"Group\",\"children\":[{\"attrs\":{\"points\":[0,0,90,0,90,10,0,10],\"fill\":\"#44ffee\",\"stroke\":\"black\",\"name\":\"test4\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"y\":5,\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"name\":\"connPointsLeft\",\"visible\":true},\"className\":\"Circle\"},{\"attrs\":{\"x\":90,\"y\":5,\"name\":\"connPointsRight\",\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"visible\":true},\"className\":\"Circle\"}]},{\"attrs\":{\"x\":567,\"y\":301,\"draggable\":true,\"rotation\":180,\"visible\":true},\"className\":\"Group\",\"children\":[{\"attrs\":{\"points\":[0,0,90,0,90,10,0,10],\"fill\":\"#FF0000\",\"stroke\":\"black\",\"name\":\"test3\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"y\":5,\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"name\":\"connPointsLeft\",\"visible\":true},\"className\":\"Circle\"},{\"attrs\":{\"x\":90,\"y\":5,\"name\":\"connPointsRight\",\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"visible\":true},\"className\":\"Circle\"}]},{\"attrs\":{\"x\":657,\"y\":301,\"draggable\":true,\"rotation\":180,\"visible\":true},\"className\":\"Group\",\"children\":[{\"attrs\":{\"points\":[0,0,90,0,90,10,0,10],\"fill\":\"#FF0000\",\"stroke\":\"black\",\"name\":\"test3\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"y\":5,\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"name\":\"connPointsLeft\",\"visible\":true},\"className\":\"Circle\"},{\"attrs\":{\"x\":90,\"y\":5,\"name\":\"connPointsRight\",\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"visible\":true},\"className\":\"Circle\"}]}]}');
INSERT INTO `t_guijson` VALUES ('34', '{\"attrs\":{\"x\":100,\"y\":100,\"id\":\"painting\",\"width\":3000,\"height\":2000,\"fill\":\"#ff33ee\",\"draggable\":true},\"className\":\"Layer\",\"children\":[]}');
INSERT INTO `t_guijson` VALUES ('35', '{\"attrs\":{\"x\":100,\"y\":100,\"id\":\"painting\",\"width\":3000,\"height\":2000,\"fill\":\"#ff33ee\",\"draggable\":true},\"className\":\"Layer\",\"children\":[]}');
INSERT INTO `t_guijson` VALUES ('36', '{\"attrs\":{\"x\":100,\"y\":100,\"id\":\"painting\",\"width\":3000,\"height\":2000,\"fill\":\"#ff33ee\",\"draggable\":true},\"className\":\"Layer\",\"children\":[]}');
INSERT INTO `t_guijson` VALUES ('37', '{\"attrs\":{\"x\":100,\"y\":100,\"id\":\"painting\",\"width\":3000,\"height\":2000,\"fill\":\"#ff33ee\",\"draggable\":true,\"visible\":true},\"className\":\"Layer\",\"children\":[{\"attrs\":{\"x\":216,\"y\":89,\"draggable\":true},\"className\":\"Group\",\"children\":[{\"attrs\":{\"points\":[0,0,90,0,90,10,0,10],\"fill\":\"#44ffee\",\"stroke\":\"black\",\"name\":\"test4\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"y\":5,\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"name\":\"connPointsLeft\",\"visible\":false},\"className\":\"Circle\"},{\"attrs\":{\"x\":90,\"y\":5,\"name\":\"connPointsRight\",\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"visible\":false},\"className\":\"Circle\"}]},{\"attrs\":{\"x\":231,\"y\":25,\"draggable\":true},\"className\":\"Group\",\"children\":[{\"attrs\":{\"radius\":15,\"fill\":\"red\",\"stroke\":\"black\",\"name\":\"test5\",\"rotation\":-10},\"className\":\"Circle\"},{\"attrs\":{\"y\":5,\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"name\":\"connPointsLeft\",\"visible\":false},\"className\":\"Circle\"},{\"attrs\":{\"x\":90,\"y\":5,\"name\":\"connPointsRight\",\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"visible\":false},\"className\":\"Circle\"}]},{\"attrs\":{\"x\":305,\"y\":89,\"draggable\":true},\"className\":\"Group\",\"children\":[{\"attrs\":{\"points\":[0,0,90,0,90,10,0,10],\"fill\":\"#00FF00\",\"stroke\":\"black\",\"name\":\"test2\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"y\":5,\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"name\":\"connPointsLeft\",\"visible\":false},\"className\":\"Circle\"},{\"attrs\":{\"x\":90,\"y\":5,\"name\":\"connPointsRight\",\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"visible\":false},\"className\":\"Circle\"}]}]}');
INSERT INTO `t_guijson` VALUES ('38', '{\"attrs\":{\"x\":100,\"y\":100,\"id\":\"painting\",\"width\":3000,\"height\":2000,\"fill\":\"#ff33ee\",\"draggable\":true},\"className\":\"Layer\",\"children\":[]}');
INSERT INTO `t_guijson` VALUES ('39', '{\"attrs\":{\"x\":100,\"y\":100,\"id\":\"painting\",\"width\":3000,\"height\":2000,\"fill\":\"#ff33ee\",\"draggable\":true,\"visible\":true},\"className\":\"Layer\",\"children\":[{\"attrs\":{\"x\":219,\"y\":14,\"draggable\":true,\"visible\":true},\"className\":\"Group\",\"children\":[{\"attrs\":{\"points\":[0,0,90,0,90,10,0,10],\"fill\":\"#00FF00\",\"stroke\":\"black\",\"name\":\"test2\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"y\":5,\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"name\":\"connPointsLeft\",\"visible\":true},\"className\":\"Circle\"},{\"attrs\":{\"x\":90,\"y\":5,\"name\":\"connPointsRight\",\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"visible\":true},\"className\":\"Circle\"}]},{\"attrs\":{\"x\":309,\"y\":14,\"draggable\":true,\"visible\":true},\"className\":\"Group\",\"children\":[{\"attrs\":{\"points\":[0,0,90,0,90,10,0,10],\"fill\":\"#FF0000\",\"stroke\":\"black\",\"name\":\"test3\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"y\":5,\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"name\":\"connPointsLeft\",\"visible\":true},\"className\":\"Circle\"},{\"attrs\":{\"x\":90,\"y\":5,\"name\":\"connPointsRight\",\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"visible\":true},\"className\":\"Circle\"}]},{\"attrs\":{\"x\":226,\"y\":91,\"draggable\":true,\"visible\":true},\"className\":\"Group\",\"children\":[{\"attrs\":{\"points\":[0,0,90,0,90,10,0,10],\"fill\":\"#FF0000\",\"stroke\":\"black\",\"name\":\"test3\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"y\":5,\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"name\":\"connPointsLeft\",\"visible\":true},\"className\":\"Circle\"},{\"attrs\":{\"x\":90,\"y\":5,\"name\":\"connPointsRight\",\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"visible\":true},\"className\":\"Circle\"}]},{\"attrs\":{\"x\":408,\"y\":145,\"draggable\":true,\"visible\":true},\"className\":\"Group\",\"children\":[{\"attrs\":{\"points\":[0,0,90,0,90,10,0,10],\"fill\":\"#44ffee\",\"stroke\":\"black\",\"name\":\"test4\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"y\":5,\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"name\":\"connPointsLeft\",\"visible\":true},\"className\":\"Circle\"},{\"attrs\":{\"x\":90,\"y\":5,\"name\":\"connPointsRight\",\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"visible\":true},\"className\":\"Circle\"}]},{\"attrs\":{\"x\":410,\"y\":6,\"draggable\":true,\"rotation\":90,\"visible\":true},\"className\":\"Group\",\"children\":[{\"attrs\":{\"points\":[0,0,90,0,90,10,0,10],\"fill\":\"#44ffee\",\"stroke\":\"black\",\"name\":\"test4\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"y\":5,\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"name\":\"connPointsLeft\",\"visible\":true},\"className\":\"Circle\"},{\"attrs\":{\"x\":90,\"y\":5,\"name\":\"connPointsRight\",\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"visible\":true},\"className\":\"Circle\"}]},{\"attrs\":{\"x\":493,\"y\":91,\"draggable\":true,\"visible\":true},\"className\":\"Group\",\"children\":[{\"attrs\":{\"points\":[0,0,90,0,90,10,0,10],\"fill\":\"#44ffee\",\"stroke\":\"black\",\"name\":\"test4\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"y\":5,\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"name\":\"connPointsLeft\",\"visible\":true},\"className\":\"Circle\"},{\"attrs\":{\"x\":90,\"y\":5,\"name\":\"connPointsRight\",\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"visible\":true},\"className\":\"Circle\"}]},{\"attrs\":{\"x\":129,\"y\":14,\"draggable\":true},\"className\":\"Group\",\"children\":[{\"attrs\":{\"points\":[0,0,90,0,90,10,0,10],\"fill\":\"#FF0000\",\"stroke\":\"black\",\"name\":\"test3\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"y\":5,\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"name\":\"connPointsLeft\",\"visible\":true},\"className\":\"Circle\"},{\"attrs\":{\"x\":90,\"y\":5,\"name\":\"connPointsRight\",\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"visible\":true},\"className\":\"Circle\"}]}]}');
INSERT INTO `t_guijson` VALUES ('40', '{\"attrs\":{\"x\":100,\"y\":100,\"id\":\"painting\",\"width\":3000,\"height\":2000,\"fill\":\"#ff33ee\",\"draggable\":true},\"className\":\"Layer\",\"children\":[]}');
INSERT INTO `t_guijson` VALUES ('41', '{\"attrs\":{\"x\":100,\"y\":100,\"id\":\"painting\",\"width\":3000,\"height\":2000,\"fill\":\"#ff33ee\",\"draggable\":true},\"className\":\"Layer\",\"children\":[]}');
INSERT INTO `t_guijson` VALUES ('42', '{\"attrs\":{\"x\":100,\"y\":100,\"id\":\"painting\",\"width\":3000,\"height\":2000,\"fill\":\"#ff33ee\",\"draggable\":true},\"className\":\"Layer\",\"children\":[]}');
INSERT INTO `t_guijson` VALUES ('43', '{\"attrs\":{\"x\":100,\"y\":100,\"id\":\"painting\",\"width\":3000,\"height\":2000,\"fill\":\"#ff33ee\",\"draggable\":true},\"className\":\"Layer\",\"children\":[]}');
INSERT INTO `t_guijson` VALUES ('44', '{\"attrs\":{\"x\":100,\"y\":100,\"id\":\"painting\",\"width\":3000,\"height\":2000,\"fill\":\"#ff33ee\",\"draggable\":true,\"visible\":true},\"className\":\"Layer\",\"children\":[{\"attrs\":{\"x\":224,\"y\":7,\"draggable\":true},\"className\":\"Group\",\"children\":[{\"attrs\":{\"points\":[0,0,90,0,90,10,0,10],\"fill\":\"#00FF00\",\"stroke\":\"black\",\"name\":\"test2\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"y\":5,\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"name\":\"connPointsLeft\",\"visible\":false},\"className\":\"Circle\"},{\"attrs\":{\"x\":90,\"y\":5,\"name\":\"connPointsRight\",\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"visible\":false},\"className\":\"Circle\"}]},{\"attrs\":{\"x\":301,\"y\":44,\"draggable\":true},\"className\":\"Group\",\"children\":[{\"attrs\":{\"points\":[0,0,90,0,90,10,0,10],\"fill\":\"#FF0000\",\"stroke\":\"black\",\"name\":\"test3\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"y\":5,\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"name\":\"connPointsLeft\",\"visible\":false},\"className\":\"Circle\"},{\"attrs\":{\"x\":90,\"y\":5,\"name\":\"connPointsRight\",\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"visible\":false},\"className\":\"Circle\"}]}]}');
INSERT INTO `t_guijson` VALUES ('45', '{\"attrs\":{\"x\":100,\"y\":100,\"id\":\"painting\",\"width\":3000,\"height\":2000,\"fill\":\"#ff33ee\",\"draggable\":true,\"visible\":true},\"className\":\"Layer\",\"children\":[{\"attrs\":{\"x\":153,\"y\":-8,\"draggable\":true},\"className\":\"Group\",\"children\":[{\"attrs\":{\"points\":[0,0,90,0,90,10,0,10],\"fill\":\"#00FF00\",\"stroke\":\"black\",\"name\":\"test2\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"y\":5,\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"name\":\"connPointsLeft\",\"visible\":false},\"className\":\"Circle\"},{\"attrs\":{\"x\":90,\"y\":5,\"name\":\"connPointsRight\",\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"visible\":false},\"className\":\"Circle\"}]}]}');
INSERT INTO `t_guijson` VALUES ('46', '{\"attrs\":{\"x\":100,\"y\":100,\"id\":\"painting\",\"width\":3000,\"height\":2000,\"fill\":\"#ff33ee\",\"draggable\":true},\"className\":\"Layer\",\"children\":[]}');
INSERT INTO `t_guijson` VALUES ('47', '{\"attrs\":{\"x\":100,\"y\":100,\"id\":\"painting\",\"width\":3000,\"height\":2000,\"fill\":\"#ff33ee\",\"draggable\":true,\"visible\":true},\"className\":\"Layer\",\"children\":[{\"attrs\":{\"x\":202,\"y\":15,\"name\":\"test2\",\"draggable\":true},\"className\":\"Group\",\"children\":[{\"attrs\":{\"points\":[0,0,90,0,90,10,0,10],\"fill\":\"#00FF00\",\"stroke\":\"black\",\"name\":\"test2\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"y\":5,\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"name\":\"connPointsLeft\",\"visible\":false},\"className\":\"Circle\"},{\"attrs\":{\"x\":90,\"y\":5,\"name\":\"connPointsRight\",\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"visible\":false},\"className\":\"Circle\"}]}]}');
INSERT INTO `t_guijson` VALUES ('48', '{\"attrs\":{\"x\":100,\"y\":100,\"id\":\"painting\",\"width\":3000,\"height\":2000,\"fill\":\"#ff33ee\",\"draggable\":true,\"visible\":true},\"className\":\"Layer\",\"children\":[{\"attrs\":{\"x\":81,\"y\":-9,\"name\":\"test2\",\"draggable\":true,\"id\":200},\"className\":\"Group\",\"children\":[{\"attrs\":{\"points\":[0,0,90,0,90,10,0,10],\"fill\":\"#00FF00\",\"stroke\":\"black\",\"name\":\"test2\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"y\":5,\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"name\":\"connPointsLeft\",\"visible\":false},\"className\":\"Circle\"},{\"attrs\":{\"x\":90,\"y\":5,\"name\":\"connPointsRight\",\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"visible\":false},\"className\":\"Circle\"}]}]}');
INSERT INTO `t_guijson` VALUES ('49', '{\"attrs\":{\"x\":100,\"y\":100,\"id\":\"painting\",\"width\":3000,\"height\":2000,\"fill\":\"#ff33ee\",\"draggable\":true,\"visible\":true},\"className\":\"Layer\",\"children\":[{\"attrs\":{\"x\":126,\"y\":-17,\"name\":\"test2\",\"draggable\":true,\"id\":200},\"className\":\"Group\",\"children\":[{\"attrs\":{\"points\":[0,0,90,0,90,10,0,10],\"fill\":\"#00FF00\",\"stroke\":\"black\",\"name\":\"test2\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"y\":5,\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"name\":\"connPointsLeft\",\"visible\":false},\"className\":\"Circle\"},{\"attrs\":{\"x\":90,\"y\":5,\"name\":\"connPointsRight\",\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"visible\":false},\"className\":\"Circle\"}]}]}');
INSERT INTO `t_guijson` VALUES ('50', '{\"attrs\":{\"x\":100,\"y\":100,\"id\":\"painting\",\"width\":3000,\"height\":2000,\"fill\":\"#ff33ee\",\"draggable\":true,\"visible\":true},\"className\":\"Layer\",\"children\":[{\"attrs\":{\"x\":195,\"y\":5,\"name\":\"test2\",\"draggable\":true,\"id\":200},\"className\":\"Group\",\"children\":[{\"attrs\":{\"points\":[0,0,90,0,90,10,0,10],\"fill\":\"#00FF00\",\"stroke\":\"black\",\"name\":\"test2\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"y\":5,\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"name\":\"connPointsLeft\",\"visible\":false},\"className\":\"Circle\"},{\"attrs\":{\"x\":90,\"y\":5,\"name\":\"connPointsRight\",\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"visible\":false},\"className\":\"Circle\"}]}]}');
INSERT INTO `t_guijson` VALUES ('51', '{\"attrs\":{\"x\":100,\"y\":100,\"id\":\"painting\",\"width\":3000,\"height\":2000,\"fill\":\"#ff33ee\",\"draggable\":true,\"visible\":true},\"className\":\"Layer\",\"children\":[{\"attrs\":{\"x\":139,\"y\":-1,\"name\":\"test2\",\"draggable\":true,\"id\":200},\"className\":\"Group\",\"children\":[{\"attrs\":{\"points\":[0,0,90,0,90,10,0,10],\"fill\":\"#00FF00\",\"stroke\":\"black\",\"name\":\"test2\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"y\":5,\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"name\":\"connPointsLeft\",\"visible\":false},\"className\":\"Circle\"},{\"attrs\":{\"x\":90,\"y\":5,\"name\":\"connPointsRight\",\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"visible\":false},\"className\":\"Circle\"}]},{\"attrs\":{\"x\":212,\"y\":58,\"name\":\"test3\",\"draggable\":true,\"id\":203},\"className\":\"Group\",\"children\":[{\"attrs\":{\"points\":[0,0,90,0,90,10,0,10],\"fill\":\"#FF0000\",\"stroke\":\"black\",\"name\":\"test3\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"y\":5,\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"name\":\"connPointsLeft\",\"visible\":false},\"className\":\"Circle\"},{\"attrs\":{\"x\":90,\"y\":5,\"name\":\"connPointsRight\",\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"visible\":false},\"className\":\"Circle\"}]}]}');
INSERT INTO `t_guijson` VALUES ('52', '{\"attrs\":{\"x\":100,\"y\":100,\"id\":\"painting\",\"width\":3000,\"height\":2000,\"fill\":\"#ff33ee\",\"draggable\":true,\"visible\":true},\"className\":\"Layer\",\"children\":[{\"attrs\":{\"x\":127,\"y\":-11,\"name\":\"test2\",\"draggable\":true,\"id\":200},\"className\":\"Group\",\"children\":[{\"attrs\":{\"points\":[0,0,90,0,90,10,0,10],\"fill\":\"#00FF00\",\"stroke\":\"black\",\"name\":\"test2\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"y\":5,\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"name\":\"connPointsLeft\",\"visible\":true},\"className\":\"Circle\"},{\"attrs\":{\"x\":90,\"y\":5,\"name\":\"connPointsRight\",\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"visible\":true},\"className\":\"Circle\"}]},{\"attrs\":{\"x\":217,\"y\":-11,\"name\":\"test3\",\"draggable\":true,\"id\":203},\"className\":\"Group\",\"children\":[{\"attrs\":{\"points\":[0,0,90,0,90,10,0,10],\"fill\":\"#FF0000\",\"stroke\":\"black\",\"name\":\"test3\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"y\":5,\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"name\":\"connPointsLeft\",\"visible\":true},\"className\":\"Circle\"},{\"attrs\":{\"x\":90,\"y\":5,\"name\":\"connPointsRight\",\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"visible\":true},\"className\":\"Circle\"}]}]}');
INSERT INTO `t_guijson` VALUES ('53', '{\"attrs\":{\"x\":100,\"y\":100,\"id\":\"painting\",\"width\":3000,\"height\":2000,\"fill\":\"#ff33ee\",\"draggable\":true,\"visible\":true},\"className\":\"Layer\",\"children\":[{\"attrs\":{\"x\":183,\"y\":-16,\"name\":\"test2\",\"draggable\":true,\"id\":200},\"className\":\"Group\",\"children\":[{\"attrs\":{\"points\":[0,0,90,0,90,10,0,10],\"fill\":\"#00FF00\",\"stroke\":\"black\",\"name\":\"test2\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"y\":5,\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"name\":\"connPointsLeft\",\"visible\":true},\"className\":\"Circle\"},{\"attrs\":{\"x\":90,\"y\":5,\"name\":\"connPointsRight\",\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"visible\":true},\"className\":\"Circle\"}]},{\"attrs\":{\"x\":273,\"y\":-16,\"name\":\"test2\",\"draggable\":true,\"id\":219},\"className\":\"Group\",\"children\":[{\"attrs\":{\"points\":[0,0,90,0,90,10,0,10],\"fill\":\"#00FF00\",\"stroke\":\"black\",\"name\":\"test2\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"y\":5,\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"name\":\"connPointsLeft\",\"visible\":true},\"className\":\"Circle\"},{\"attrs\":{\"x\":90,\"y\":5,\"name\":\"connPointsRight\",\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"visible\":true},\"className\":\"Circle\"}]}]}');
INSERT INTO `t_guijson` VALUES ('54', '{\"attrs\":{\"x\":100,\"y\":100,\"id\":\"painting\",\"width\":3000,\"height\":2000,\"fill\":\"#ff33ee\",\"draggable\":true,\"visible\":true},\"className\":\"Layer\",\"children\":[{\"attrs\":{\"x\":41,\"y\":24,\"name\":\"test3\",\"draggable\":true,\"id\":203},\"className\":\"Group\",\"children\":[{\"attrs\":{\"points\":[0,0,90,0,90,10,0,10],\"fill\":\"#FF0000\",\"stroke\":\"black\",\"name\":\"test3\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"y\":5,\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"name\":\"connPointsLeft\",\"visible\":true},\"className\":\"Circle\"},{\"attrs\":{\"x\":90,\"y\":5,\"name\":\"connPointsRight\",\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"visible\":true},\"className\":\"Circle\"}]},{\"attrs\":{\"x\":131,\"y\":24,\"name\":\"test2\",\"draggable\":true,\"id\":200},\"className\":\"Group\",\"children\":[{\"attrs\":{\"points\":[0,0,90,0,90,10,0,10],\"fill\":\"#00FF00\",\"stroke\":\"black\",\"name\":\"test2\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"y\":5,\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"name\":\"connPointsLeft\",\"visible\":true},\"className\":\"Circle\"},{\"attrs\":{\"x\":90,\"y\":5,\"name\":\"connPointsRight\",\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"visible\":true},\"className\":\"Circle\"}]}]}');
INSERT INTO `t_guijson` VALUES ('55', '{\"attrs\":{\"x\":100,\"y\":100,\"id\":\"painting\",\"width\":3000,\"height\":2000,\"fill\":\"#ff33ee\",\"draggable\":true},\"className\":\"Layer\",\"children\":[]}');
INSERT INTO `t_guijson` VALUES ('56', '{\"attrs\":{\"x\":100,\"y\":100,\"id\":\"painting\",\"width\":3000,\"height\":2000,\"fill\":\"#ff33ee\",\"draggable\":true,\"visible\":true},\"className\":\"Layer\",\"children\":[{\"attrs\":{\"x\":47,\"y\":-14,\"name\":\"test2\",\"draggable\":true,\"id\":200},\"className\":\"Group\",\"children\":[{\"attrs\":{\"points\":[0,0,90,0,90,10,0,10],\"fill\":\"#00FF00\",\"stroke\":\"black\",\"name\":\"test2\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"y\":5,\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"name\":\"connPointsLeft\",\"visible\":true},\"className\":\"Circle\"},{\"attrs\":{\"x\":90,\"y\":5,\"name\":\"connPointsRight\",\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"visible\":true},\"className\":\"Circle\"}]},{\"attrs\":{\"x\":137,\"y\":-14,\"name\":\"test3\",\"draggable\":true,\"id\":203},\"className\":\"Group\",\"children\":[{\"attrs\":{\"points\":[0,0,90,0,90,10,0,10],\"fill\":\"#FF0000\",\"stroke\":\"black\",\"name\":\"test3\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"y\":5,\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"name\":\"connPointsLeft\",\"visible\":true},\"className\":\"Circle\"},{\"attrs\":{\"x\":90,\"y\":5,\"name\":\"connPointsRight\",\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"visible\":true},\"className\":\"Circle\"}]}]}');
INSERT INTO `t_guijson` VALUES ('57', '{\"attrs\":{\"x\":100,\"y\":100,\"id\":\"painting\",\"width\":3000,\"height\":2000,\"fill\":\"#ff33ee\",\"draggable\":true,\"visible\":true},\"className\":\"Layer\",\"children\":[{\"attrs\":{\"x\":156,\"y\":-6,\"name\":\"test2\",\"draggable\":true,\"id\":200},\"className\":\"Group\",\"children\":[{\"attrs\":{\"points\":[0,0,90,0,90,10,0,10],\"fill\":\"#00FF00\",\"stroke\":\"black\",\"name\":\"test2\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"y\":5,\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"name\":\"connPointsLeft\",\"visible\":true},\"className\":\"Circle\"},{\"attrs\":{\"x\":90,\"y\":5,\"name\":\"connPointsRight\",\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"visible\":true},\"className\":\"Circle\"}]},{\"attrs\":{\"x\":246,\"y\":-6,\"name\":\"test3\",\"draggable\":true,\"id\":203},\"className\":\"Group\",\"children\":[{\"attrs\":{\"points\":[0,0,90,0,90,10,0,10],\"fill\":\"#FF0000\",\"stroke\":\"black\",\"name\":\"test3\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"y\":5,\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"name\":\"connPointsLeft\",\"visible\":true},\"className\":\"Circle\"},{\"attrs\":{\"x\":90,\"y\":5,\"name\":\"connPointsRight\",\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"visible\":true},\"className\":\"Circle\"}]}]}');
INSERT INTO `t_guijson` VALUES ('58', '{\"attrs\":{\"x\":100,\"y\":100,\"id\":\"painting\",\"width\":3000,\"height\":2000,\"fill\":\"#ff33ee\",\"draggable\":true,\"visible\":true},\"className\":\"Layer\",\"children\":[{\"attrs\":{\"x\":172,\"y\":-12,\"name\":\"test2\",\"draggable\":true,\"id\":200},\"className\":\"Group\",\"children\":[{\"attrs\":{\"points\":[0,0,90,0,90,10,0,10],\"fill\":\"#00FF00\",\"stroke\":\"black\",\"name\":\"test2\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"y\":5,\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"name\":\"connPointsLeft\",\"visible\":true},\"className\":\"Circle\"},{\"attrs\":{\"x\":90,\"y\":5,\"name\":\"connPointsRight\",\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"visible\":true},\"className\":\"Circle\"}]},{\"attrs\":{\"x\":262,\"y\":-12,\"name\":\"test3\",\"draggable\":true,\"id\":203},\"className\":\"Group\",\"children\":[{\"attrs\":{\"points\":[0,0,90,0,90,10,0,10],\"fill\":\"#FF0000\",\"stroke\":\"black\",\"name\":\"test3\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"y\":5,\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"name\":\"connPointsLeft\",\"visible\":true},\"className\":\"Circle\"},{\"attrs\":{\"x\":90,\"y\":5,\"name\":\"connPointsRight\",\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"visible\":true},\"className\":\"Circle\"}]}]}');
INSERT INTO `t_guijson` VALUES ('59', '{\"attrs\":{\"x\":100,\"y\":100,\"id\":\"painting\",\"width\":3000,\"height\":2000,\"fill\":\"#ff33ee\",\"draggable\":true,\"visible\":true},\"className\":\"Layer\",\"children\":[{\"attrs\":{\"x\":52,\"y\":-19,\"name\":\"test2\",\"draggable\":true,\"id\":200},\"className\":\"Group\",\"children\":[{\"attrs\":{\"points\":[0,0,90,0,90,10,0,10],\"fill\":\"#00FF00\",\"stroke\":\"black\",\"name\":\"test2\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"y\":5,\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"name\":\"connPointsLeft\",\"visible\":true},\"className\":\"Circle\"},{\"attrs\":{\"x\":90,\"y\":5,\"name\":\"connPointsRight\",\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"visible\":true},\"className\":\"Circle\"}]},{\"attrs\":{\"x\":142,\"y\":-19,\"name\":\"test3\",\"draggable\":true,\"id\":203},\"className\":\"Group\",\"children\":[{\"attrs\":{\"points\":[0,0,90,0,90,10,0,10],\"fill\":\"#FF0000\",\"stroke\":\"black\",\"name\":\"test3\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"y\":5,\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"name\":\"connPointsLeft\",\"visible\":true},\"className\":\"Circle\"},{\"attrs\":{\"x\":90,\"y\":5,\"name\":\"connPointsRight\",\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"visible\":true},\"className\":\"Circle\"}]}]}');
INSERT INTO `t_guijson` VALUES ('60', '{\"attrs\":{\"x\":100,\"y\":100,\"id\":\"painting\",\"width\":3000,\"height\":2000,\"fill\":\"#ff33ee\",\"draggable\":true,\"visible\":true},\"className\":\"Layer\",\"children\":[{\"attrs\":{\"x\":160,\"y\":11,\"name\":\"test3\",\"draggable\":true,\"id\":203},\"className\":\"Group\",\"children\":[{\"attrs\":{\"points\":[0,0,90,0,90,10,0,10],\"fill\":\"#FF0000\",\"stroke\":\"black\",\"name\":\"test3\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"y\":5,\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"name\":\"connPointsLeft\",\"visible\":true},\"className\":\"Circle\"},{\"attrs\":{\"x\":90,\"y\":5,\"name\":\"connPointsRight\",\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"visible\":true},\"className\":\"Circle\"}]},{\"attrs\":{\"x\":250,\"y\":11,\"name\":\"test3\",\"draggable\":true,\"id\":219},\"className\":\"Group\",\"children\":[{\"attrs\":{\"points\":[0,0,90,0,90,10,0,10],\"fill\":\"#FF0000\",\"stroke\":\"black\",\"name\":\"test3\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"y\":5,\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"name\":\"connPointsLeft\",\"visible\":true},\"className\":\"Circle\"},{\"attrs\":{\"x\":90,\"y\":5,\"name\":\"connPointsRight\",\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"visible\":true},\"className\":\"Circle\"}]}]}');
INSERT INTO `t_guijson` VALUES ('61', '{\"attrs\":{\"x\":100,\"y\":100,\"id\":\"painting\",\"width\":3000,\"height\":2000,\"fill\":\"#ff33ee\",\"draggable\":true,\"visible\":true},\"className\":\"Layer\",\"children\":[{\"attrs\":{\"x\":101,\"y\":-18,\"name\":\"test2\",\"draggable\":true,\"id\":200},\"className\":\"Group\",\"children\":[{\"attrs\":{\"points\":[0,0,90,0,90,10,0,10],\"fill\":\"#00FF00\",\"stroke\":\"black\",\"name\":\"test2\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"y\":5,\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"name\":\"connPointsLeft\",\"visible\":true},\"className\":\"Circle\"},{\"attrs\":{\"x\":90,\"y\":5,\"name\":\"connPointsRight\",\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"visible\":true},\"className\":\"Circle\"}]},{\"attrs\":{\"x\":191,\"y\":-18,\"name\":\"test3\",\"draggable\":true,\"id\":203},\"className\":\"Group\",\"children\":[{\"attrs\":{\"points\":[0,0,90,0,90,10,0,10],\"fill\":\"#FF0000\",\"stroke\":\"black\",\"name\":\"test3\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"y\":5,\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"name\":\"connPointsLeft\",\"visible\":true},\"className\":\"Circle\"},{\"attrs\":{\"x\":90,\"y\":5,\"name\":\"connPointsRight\",\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"visible\":true},\"className\":\"Circle\"}]}]}');
INSERT INTO `t_guijson` VALUES ('62', '{\"attrs\":{\"x\":100,\"y\":100,\"id\":\"painting\",\"width\":3000,\"height\":2000,\"fill\":\"#ff33ee\",\"draggable\":true,\"visible\":true},\"className\":\"Layer\",\"children\":[{\"attrs\":{\"x\":200,\"name\":\"test2\",\"draggable\":true,\"id\":200},\"className\":\"Group\",\"children\":[{\"attrs\":{\"points\":[0,0,90,0,90,10,0,10],\"fill\":\"#00FF00\",\"stroke\":\"black\",\"name\":\"test2\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"y\":5,\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"name\":\"connPointsLeft\",\"visible\":true},\"className\":\"Circle\"},{\"attrs\":{\"x\":90,\"y\":5,\"name\":\"connPointsRight\",\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"visible\":true},\"className\":\"Circle\"}]},{\"attrs\":{\"x\":290,\"name\":\"test3\",\"draggable\":true,\"id\":203},\"className\":\"Group\",\"children\":[{\"attrs\":{\"points\":[0,0,90,0,90,10,0,10],\"fill\":\"#FF0000\",\"stroke\":\"black\",\"name\":\"test3\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"y\":5,\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"name\":\"connPointsLeft\",\"visible\":true},\"className\":\"Circle\"},{\"attrs\":{\"x\":90,\"y\":5,\"name\":\"connPointsRight\",\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"visible\":true},\"className\":\"Circle\"}]},{\"attrs\":{\"x\":380,\"name\":\"test3\",\"draggable\":true,\"id\":223},\"className\":\"Group\",\"children\":[{\"attrs\":{\"points\":[0,0,90,0,90,10,0,10],\"fill\":\"#FF0000\",\"stroke\":\"black\",\"name\":\"test3\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"y\":5,\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"name\":\"connPointsLeft\",\"visible\":true},\"className\":\"Circle\"},{\"attrs\":{\"x\":90,\"y\":5,\"name\":\"connPointsRight\",\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"visible\":true},\"className\":\"Circle\"}]},{\"attrs\":{\"x\":470,\"name\":\"test4\",\"draggable\":true,\"id\":206},\"className\":\"Group\",\"children\":[{\"attrs\":{\"points\":[0,0,90,0,90,10,0,10],\"fill\":\"#44ffee\",\"stroke\":\"black\",\"name\":\"test4\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"y\":5,\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"name\":\"connPointsLeft\",\"visible\":true},\"className\":\"Circle\"},{\"attrs\":{\"x\":90,\"y\":5,\"name\":\"connPointsRight\",\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"visible\":true},\"className\":\"Circle\"}]}]}');
INSERT INTO `t_guijson` VALUES ('63', '{\"attrs\":{\"x\":100,\"y\":100,\"id\":\"painting\",\"width\":3000,\"height\":2000,\"fill\":\"#ff33ee\",\"draggable\":true,\"visible\":true},\"className\":\"Layer\",\"children\":[{\"attrs\":{\"x\":125,\"y\":-8,\"name\":\"test2\",\"draggable\":true,\"id\":200},\"className\":\"Group\",\"children\":[{\"attrs\":{\"points\":[0,0,90,0,90,10,0,10],\"fill\":\"#00FF00\",\"stroke\":\"black\",\"name\":\"test2\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"y\":5,\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"name\":\"connPointsLeft\",\"visible\":false},\"className\":\"Circle\"},{\"attrs\":{\"x\":90,\"y\":5,\"name\":\"connPointsRight\",\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"visible\":false},\"className\":\"Circle\"}]},{\"attrs\":{\"x\":131,\"y\":70,\"name\":\"test3\",\"draggable\":true,\"id\":203},\"className\":\"Group\",\"children\":[{\"attrs\":{\"points\":[0,0,90,0,90,10,0,10],\"fill\":\"#FF0000\",\"stroke\":\"black\",\"name\":\"test3\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"y\":5,\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"name\":\"connPointsLeft\",\"visible\":false},\"className\":\"Circle\"},{\"attrs\":{\"x\":90,\"y\":5,\"name\":\"connPointsRight\",\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"visible\":false},\"className\":\"Circle\"}]},{\"attrs\":{\"x\":399,\"y\":70,\"name\":\"test4\",\"draggable\":true,\"id\":206},\"className\":\"Group\",\"children\":[{\"attrs\":{\"points\":[0,0,90,0,90,10,0,10],\"fill\":\"#44ffee\",\"stroke\":\"black\",\"name\":\"test4\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"y\":5,\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"name\":\"connPointsLeft\",\"visible\":false},\"className\":\"Circle\"},{\"attrs\":{\"x\":90,\"y\":5,\"name\":\"connPointsRight\",\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"visible\":false},\"className\":\"Circle\"}]},{\"attrs\":{\"x\":311,\"y\":70,\"name\":\"test4\",\"draggable\":true,\"id\":227},\"className\":\"Group\",\"children\":[{\"attrs\":{\"points\":[0,0,90,0,90,10,0,10],\"fill\":\"#44ffee\",\"stroke\":\"black\",\"name\":\"test4\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"y\":5,\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"name\":\"connPointsLeft\",\"visible\":false},\"className\":\"Circle\"},{\"attrs\":{\"x\":90,\"y\":5,\"name\":\"connPointsRight\",\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"visible\":false},\"className\":\"Circle\"}]},{\"attrs\":{\"x\":344,\"y\":18,\"name\":\"test1\",\"draggable\":true,\"id\":197},\"className\":\"Group\",\"children\":[{\"attrs\":{\"points\":[0,0,90,0,90,10,0,10],\"fill\":\"#00D2FF\",\"stroke\":\"black\",\"name\":\"test1\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"y\":5,\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"name\":\"connPointsLeft\",\"visible\":false},\"className\":\"Circle\"},{\"attrs\":{\"x\":90,\"y\":5,\"name\":\"connPointsRight\",\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"visible\":false},\"className\":\"Circle\"}]}]}');

-- ----------------------------
-- Table structure for `t_guipoint`
-- ----------------------------
DROP TABLE IF EXISTS `t_guipoint`;
CREATE TABLE `t_guipoint` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pro_id` int(11) DEFAULT NULL,
  `name` varchar(15) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `typename` varchar(15) DEFAULT NULL,
  `statusNow` int(11) DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_guipoint
-- ----------------------------
INSERT INTO `t_guipoint` VALUES ('15', '63', '200', '2', 'test2', '-1', '2014-05-22 23:33:10');
INSERT INTO `t_guipoint` VALUES ('16', '63', '203', '2', 'test3', '-1', '2014-05-22 23:33:10');
INSERT INTO `t_guipoint` VALUES ('17', '63', '206', '2', 'test4', '-1', '2014-05-22 23:33:10');
INSERT INTO `t_guipoint` VALUES ('18', '63', '227', '2', 'test4', '-1', '2014-05-22 23:33:10');
INSERT INTO `t_guipoint` VALUES ('19', '63', '219', '2', 'test2', '-1', '2014-05-22 23:33:10');
INSERT INTO `t_guipoint` VALUES ('20', '63', '223', '2', 'test3', '-1', '2014-05-22 23:33:10');
INSERT INTO `t_guipoint` VALUES ('21', '63', '197', '1', 'test1', '-1', '2014-05-22 23:33:10');
INSERT INTO `t_guipoint` VALUES ('22', '63', '200', '2', 'test2', '-1', '2014-05-22 23:34:16');
INSERT INTO `t_guipoint` VALUES ('23', '63', '203', '2', 'test3', '-1', '2014-05-22 23:34:16');
INSERT INTO `t_guipoint` VALUES ('24', '63', '206', '2', 'test4', '-1', '2014-05-22 23:34:16');
INSERT INTO `t_guipoint` VALUES ('25', '63', '227', '2', 'test4', '-1', '2014-05-22 23:34:16');
INSERT INTO `t_guipoint` VALUES ('26', '63', '219', '2', 'test2', '-1', '2014-05-22 23:34:16');
INSERT INTO `t_guipoint` VALUES ('27', '63', '223', '2', 'test3', '-1', '2014-05-22 23:34:16');
INSERT INTO `t_guipoint` VALUES ('28', '63', '197', '1', 'test1', '-1', '2014-05-22 23:34:16');
INSERT INTO `t_guipoint` VALUES ('29', '63', '200', '2', 'test2', '-1', '2014-05-22 23:39:01');
INSERT INTO `t_guipoint` VALUES ('30', '63', '203', '2', 'test3', '-1', '2014-05-22 23:39:01');
INSERT INTO `t_guipoint` VALUES ('31', '63', '206', '2', 'test4', '-1', '2014-05-22 23:39:01');
INSERT INTO `t_guipoint` VALUES ('32', '63', '227', '2', 'test4', '-1', '2014-05-22 23:39:01');
INSERT INTO `t_guipoint` VALUES ('33', '63', '219', '2', 'test2', '-1', '2014-05-22 23:39:01');
INSERT INTO `t_guipoint` VALUES ('34', '63', '223', '2', 'test3', '-1', '2014-05-22 23:39:01');
INSERT INTO `t_guipoint` VALUES ('35', '63', '197', '1', 'test1', '-1', '2014-05-22 23:39:01');
INSERT INTO `t_guipoint` VALUES ('36', '63', '200', '2', 'test2', '-1', '2014-05-22 23:42:10');
INSERT INTO `t_guipoint` VALUES ('37', '63', '203', '2', 'test3', '-1', '2014-05-22 23:42:10');
INSERT INTO `t_guipoint` VALUES ('38', '63', '206', '2', 'test4', '-1', '2014-05-22 23:42:10');
INSERT INTO `t_guipoint` VALUES ('39', '63', '227', '2', 'test4', '-1', '2014-05-22 23:42:10');
INSERT INTO `t_guipoint` VALUES ('40', '63', '219', '2', 'test2', '-1', '2014-05-22 23:42:10');
INSERT INTO `t_guipoint` VALUES ('41', '63', '223', '2', 'test3', '-1', '2014-05-22 23:42:10');
INSERT INTO `t_guipoint` VALUES ('42', '63', '197', '1', 'test1', '-1', '2014-05-22 23:42:10');
INSERT INTO `t_guipoint` VALUES ('43', '63', '200', '2', 'test2', '-1', '2014-05-22 23:42:54');
INSERT INTO `t_guipoint` VALUES ('44', '63', '203', '2', 'test3', '-1', '2014-05-22 23:42:54');
INSERT INTO `t_guipoint` VALUES ('45', '63', '206', '2', 'test4', '-1', '2014-05-22 23:42:54');
INSERT INTO `t_guipoint` VALUES ('46', '63', '227', '2', 'test4', '-1', '2014-05-22 23:42:54');
INSERT INTO `t_guipoint` VALUES ('47', '63', '219', '2', 'test2', '-1', '2014-05-22 23:42:54');
INSERT INTO `t_guipoint` VALUES ('48', '63', '223', '2', 'test3', '-1', '2014-05-22 23:42:54');
INSERT INTO `t_guipoint` VALUES ('49', '63', '197', '1', 'test1', '-1', '2014-05-22 23:42:54');
INSERT INTO `t_guipoint` VALUES ('50', '63', '200', '2', 'test2', '-1', '2014-05-22 23:43:18');
INSERT INTO `t_guipoint` VALUES ('51', '63', '203', '2', 'test3', '-1', '2014-05-22 23:43:18');
INSERT INTO `t_guipoint` VALUES ('52', '63', '206', '2', 'test4', '-1', '2014-05-22 23:43:18');
INSERT INTO `t_guipoint` VALUES ('53', '63', '227', '2', 'test4', '-1', '2014-05-22 23:43:18');
INSERT INTO `t_guipoint` VALUES ('54', '63', '219', '2', 'test2', '-1', '2014-05-22 23:43:18');
INSERT INTO `t_guipoint` VALUES ('55', '63', '223', '2', 'test3', '-1', '2014-05-22 23:43:18');
INSERT INTO `t_guipoint` VALUES ('56', '63', '197', '1', 'test1', '-1', '2014-05-22 23:43:18');
INSERT INTO `t_guipoint` VALUES ('57', '63', '200', '2', 'test2', '1', '2014-05-22 23:43:56');
INSERT INTO `t_guipoint` VALUES ('58', '63', '203', '2', 'test3', '1', '2014-05-22 23:43:56');
INSERT INTO `t_guipoint` VALUES ('59', '63', '206', '2', 'test4', '1', '2014-05-22 23:43:56');
INSERT INTO `t_guipoint` VALUES ('60', '63', '227', '2', 'test4', '1', '2014-05-22 23:43:56');
INSERT INTO `t_guipoint` VALUES ('61', '63', '197', '1', 'test1', '1', '2014-05-22 23:43:56');

-- ----------------------------
-- Table structure for `t_guipointvalue`
-- ----------------------------
DROP TABLE IF EXISTS `t_guipointvalue`;
CREATE TABLE `t_guipointvalue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `point_id` int(11) DEFAULT NULL,
  `par_id` int(11) DEFAULT NULL,
  `par_display` varchar(50) DEFAULT NULL,
  `par_value` double DEFAULT NULL,
  `par_name` varchar(50) DEFAULT NULL,
  `par_messID` int(11) DEFAULT NULL,
  `par_ISOValue` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_guipointvalue
-- ----------------------------

-- ----------------------------
-- Table structure for `t_guipro`
-- ----------------------------
DROP TABLE IF EXISTS `t_guipro`;
CREATE TABLE `t_guipro` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `AuthorID` int(11) DEFAULT NULL,
  `AddTime` datetime DEFAULT NULL,
  `Description` varchar(250) DEFAULT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_guipro
-- ----------------------------
INSERT INTO `t_guipro` VALUES ('1', '1', '2014-04-30 16:03:58', 'testDes', 'testname', '1');
INSERT INTO `t_guipro` VALUES ('2', '1', '2014-04-30 15:23:59', 'testDes', 'testname', '1');
INSERT INTO `t_guipro` VALUES ('3', '1', '2014-04-30 15:24:55', 'testDes', 'testname', '1');
INSERT INTO `t_guipro` VALUES ('4', '1', '2014-04-30 15:27:10', 'testDes', 'testname', '1');
INSERT INTO `t_guipro` VALUES ('5', '1', '2014-04-30 15:28:25', 'testDes', 'testname', '1');
INSERT INTO `t_guipro` VALUES ('6', '1', '2014-05-07 15:38:53', '', 'test32', '0');
INSERT INTO `t_guipro` VALUES ('7', '1', '2014-05-07 16:11:46', '', 'qdw', '0');
INSERT INTO `t_guipro` VALUES ('8', '1', '2014-05-07 16:34:34', '', 'test', '0');
INSERT INTO `t_guipro` VALUES ('9', '1', '2014-05-07 17:05:25', '', 'testasf', '0');
INSERT INTO `t_guipro` VALUES ('10', '1', '2014-05-07 17:06:33', '', 'sdfasdf', '0');
INSERT INTO `t_guipro` VALUES ('11', '1', '2014-05-10 15:38:52', '', 'asdfafd', '0');
INSERT INTO `t_guipro` VALUES ('12', '1', '2014-05-09 16:58:23', 's', 'asd', '0');
INSERT INTO `t_guipro` VALUES ('13', '1', '2014-05-09 16:58:51', 'fd', 'asd', '0');
INSERT INTO `t_guipro` VALUES ('14', '1', '2014-05-09 16:59:57', 's', 'sadf', '0');
INSERT INTO `t_guipro` VALUES ('15', '1', '2014-05-10 20:24:01', 's', 'sadf', '0');
INSERT INTO `t_guipro` VALUES ('16', '1', '2014-05-10 15:10:04', 'zz', 'test', '1');
INSERT INTO `t_guipro` VALUES ('17', '1', '2014-05-10 15:26:06', 'df', 'sadf', '0');
INSERT INTO `t_guipro` VALUES ('18', '1', '2014-05-10 20:08:44', 'sd', 'fasdf', '0');
INSERT INTO `t_guipro` VALUES ('19', '1', '2014-05-10 20:14:39', 'z', 'test', '0');
INSERT INTO `t_guipro` VALUES ('20', '1', '2014-05-12 10:48:39', 'z', 'zzz', '0');
INSERT INTO `t_guipro` VALUES ('21', '1', '2014-05-12 10:49:56', 'z', 'zzz2', '0');
INSERT INTO `t_guipro` VALUES ('22', '1', '2014-05-12 10:53:03', 'z', 'zzz3', '0');
INSERT INTO `t_guipro` VALUES ('23', '1', '2014-05-12 11:00:09', 'wq', 'zzz34', '0');
INSERT INTO `t_guipro` VALUES ('24', '1', '2014-05-12 11:02:35', 's', 'adfasdf', '0');
INSERT INTO `t_guipro` VALUES ('25', '1', '2014-05-12 15:42:45', '', 'asffd', '0');
INSERT INTO `t_guipro` VALUES ('26', '1', '2014-05-12 15:44:07', '', 'sadf', '0');
INSERT INTO `t_guipro` VALUES ('27', '1', '2014-05-12 15:48:42', '', 'asffd', '0');
INSERT INTO `t_guipro` VALUES ('28', '1', '2014-05-12 15:49:47', '', 'asffd', '0');
INSERT INTO `t_guipro` VALUES ('29', '1', '2014-05-12 17:26:10', '', 'final', '0');
INSERT INTO `t_guipro` VALUES ('30', '1', '2014-05-12 17:26:11', '', 'final', '0');
INSERT INTO `t_guipro` VALUES ('31', '1', '2014-05-12 17:29:58', '', 'asdasdfas', '0');
INSERT INTO `t_guipro` VALUES ('32', '1', '2014-05-12 20:50:01', '', 'afdsaf', '0');
INSERT INTO `t_guipro` VALUES ('33', '1', '2014-05-12 21:47:35', '', 'asffdnm32', '0');
INSERT INTO `t_guipro` VALUES ('34', '1', '2014-05-18 21:57:23', '', 'asdasdfas', '0');
INSERT INTO `t_guipro` VALUES ('35', '1', '2014-05-18 22:01:42', '', 'asd', '0');
INSERT INTO `t_guipro` VALUES ('36', '1', '2014-05-18 22:04:25', '', 'ads', '0');
INSERT INTO `t_guipro` VALUES ('37', '1', '2014-05-18 23:37:41', '', 'asd', '0');
INSERT INTO `t_guipro` VALUES ('38', '1', '2014-05-18 22:05:42', '', '123', '0');
INSERT INTO `t_guipro` VALUES ('39', '1', '2014-05-18 23:37:25', '', 'sada', '0');
INSERT INTO `t_guipro` VALUES ('40', '1', '2014-05-22 21:23:41', '', 'zxa', '0');
INSERT INTO `t_guipro` VALUES ('41', '1', '2014-05-22 21:27:07', '', 'weq', '0');
INSERT INTO `t_guipro` VALUES ('42', '1', '2014-05-22 21:30:03', '', 'asd', '0');
INSERT INTO `t_guipro` VALUES ('43', '1', '2014-05-22 21:32:36', '', 'asd', '0');
INSERT INTO `t_guipro` VALUES ('44', '1', '2014-05-22 21:33:16', '', 'asdasdadad', '0');
INSERT INTO `t_guipro` VALUES ('45', '1', '2014-05-22 21:38:20', '', 'asd', '0');
INSERT INTO `t_guipro` VALUES ('46', '1', '2014-05-22 21:41:15', '', 'asdads', '0');
INSERT INTO `t_guipro` VALUES ('47', '1', '2014-05-22 21:44:16', '', 'asdf', '0');
INSERT INTO `t_guipro` VALUES ('48', '1', '2014-05-22 21:47:03', '', 'asd', '0');
INSERT INTO `t_guipro` VALUES ('49', '1', '2014-05-22 21:50:12', '', '13', '0');
INSERT INTO `t_guipro` VALUES ('50', '1', '2014-05-22 21:51:51', '', '654', '0');
INSERT INTO `t_guipro` VALUES ('51', '1', '2014-05-22 21:54:51', '', '52', '0');
INSERT INTO `t_guipro` VALUES ('52', '1', '2014-05-22 22:37:50', '', '24', '0');
INSERT INTO `t_guipro` VALUES ('53', '1', '2014-05-22 22:40:19', '', 'df', '0');
INSERT INTO `t_guipro` VALUES ('54', '1', '2014-05-22 22:42:08', '', 'ax', '0');
INSERT INTO `t_guipro` VALUES ('55', '1', '2014-05-22 22:44:35', '', 'ds', '0');
INSERT INTO `t_guipro` VALUES ('56', '1', '2014-05-22 23:00:21', '', 'ds', '0');
INSERT INTO `t_guipro` VALUES ('57', '1', '2014-05-22 23:07:32', '', 'ds', '0');
INSERT INTO `t_guipro` VALUES ('58', '1', '2014-05-22 23:07:32', '', 'ds', '0');
INSERT INTO `t_guipro` VALUES ('59', '1', '2014-05-22 23:07:32', '', 'ds', '0');
INSERT INTO `t_guipro` VALUES ('60', '1', '2014-05-22 23:09:06', '', 'ds', '0');
INSERT INTO `t_guipro` VALUES ('61', '1', '2014-05-22 23:11:40', '', 'ds', '0');
INSERT INTO `t_guipro` VALUES ('62', '1', '2014-05-22 23:15:17', '', 'ds', '0');
INSERT INTO `t_guipro` VALUES ('63', '1', '2014-05-22 23:43:56', '', 'finaltest', '0');

-- ----------------------------
-- Table structure for `t_mapline`
-- ----------------------------
DROP TABLE IF EXISTS `t_mapline`;
CREATE TABLE `t_mapline` (
  `ProID` int(11) DEFAULT NULL,
  `Start` varchar(32) DEFAULT NULL,
  `End` varchar(32) DEFAULT NULL,
  `Type` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_mapline
-- ----------------------------
INSERT INTO `t_mapline` VALUES ('93', 'PH66-04', 'PH1-002', '1');
INSERT INTO `t_mapline` VALUES ('93', 'PH66-02', 'PH1-002', '1');
INSERT INTO `t_mapline` VALUES ('93', 'PH66-05', 'PH1-002', '1');
INSERT INTO `t_mapline` VALUES ('93', 'PH66-08', 'PH1-002', '1');
INSERT INTO `t_mapline` VALUES ('93', 'PH66-03', 'PH1-002', '1');
INSERT INTO `t_mapline` VALUES ('93', 'PH56-10', 'PH1-002', '1');
INSERT INTO `t_mapline` VALUES ('93', 'PH56-11', 'PH1-002', '1');
INSERT INTO `t_mapline` VALUES ('93', 'PH56-09', 'PH1-002', '1');
INSERT INTO `t_mapline` VALUES ('93', 'PH56-06', 'PH35-07', '1');
INSERT INTO `t_mapline` VALUES ('93', 'PH56-03', 'PH35-07', '1');
INSERT INTO `t_mapline` VALUES ('93', 'PH56-08', 'PH35-07', '1');
INSERT INTO `t_mapline` VALUES ('93', 'PH66-01', 'PH35-07', '1');
INSERT INTO `t_mapline` VALUES ('93', 'PH56-06', 'PH35-07', '1');
INSERT INTO `t_mapline` VALUES ('93', 'PH77-16', 'PH35-07', '1');
INSERT INTO `t_mapline` VALUES ('93', 'PH88-02', 'PH35-07', '1');
INSERT INTO `t_mapline` VALUES ('93', 'PH88-04', 'PH35-07', '1');
INSERT INTO `t_mapline` VALUES ('93', 'PH88-03', 'PH35-07', '1');
INSERT INTO `t_mapline` VALUES ('93', 'PH88-07', 'PH35-07', '1');
INSERT INTO `t_mapline` VALUES ('93', 'PH1-002', 'JIQIZHAN', '2');
INSERT INTO `t_mapline` VALUES ('93', 'PH35-07', 'JIQIZHAN', '2');
INSERT INTO `t_mapline` VALUES ('94', 'PH66-04', 'PH1-002', '1');
INSERT INTO `t_mapline` VALUES ('94', 'PH66-02', 'PH1-002', '1');
INSERT INTO `t_mapline` VALUES ('94', 'PH66-05', 'PH1-002', '1');
INSERT INTO `t_mapline` VALUES ('94', 'PH66-08', 'PH1-002', '1');
INSERT INTO `t_mapline` VALUES ('94', 'PH66-03', 'PH1-002', '1');
INSERT INTO `t_mapline` VALUES ('94', 'PH56-10', 'PH1-002', '1');
INSERT INTO `t_mapline` VALUES ('94', 'PH56-11', 'PH1-002', '1');
INSERT INTO `t_mapline` VALUES ('94', 'PH56-09', 'PH1-002', '1');
INSERT INTO `t_mapline` VALUES ('94', 'PH56-06', 'PH35-07', '1');
INSERT INTO `t_mapline` VALUES ('94', 'PH56-03', 'PH35-07', '1');
INSERT INTO `t_mapline` VALUES ('94', 'PH56-08', 'PH35-07', '1');
INSERT INTO `t_mapline` VALUES ('94', 'PH66-01', 'PH35-07', '1');
INSERT INTO `t_mapline` VALUES ('94', 'PH56-06', 'PH35-07', '1');
INSERT INTO `t_mapline` VALUES ('94', 'PH77-16', 'PH35-07', '1');
INSERT INTO `t_mapline` VALUES ('94', 'PH88-02', 'PH35-07', '1');
INSERT INTO `t_mapline` VALUES ('94', 'PH88-04', 'PH35-07', '1');
INSERT INTO `t_mapline` VALUES ('94', 'PH88-03', 'PH35-07', '1');
INSERT INTO `t_mapline` VALUES ('94', 'PH88-07', 'PH35-07', '1');
INSERT INTO `t_mapline` VALUES ('94', 'PH1-002', 'JIQIZHAN', '2');
INSERT INTO `t_mapline` VALUES ('94', 'PH35-07', 'JIQIZHAN', '2');
INSERT INTO `t_mapline` VALUES ('95', 'PH66-04', 'PH1-002', '1');
INSERT INTO `t_mapline` VALUES ('95', 'PH66-02', 'PH1-002', '1');
INSERT INTO `t_mapline` VALUES ('95', 'PH66-05', 'PH1-002', '1');
INSERT INTO `t_mapline` VALUES ('95', 'PH66-08', 'PH1-002', '1');
INSERT INTO `t_mapline` VALUES ('95', 'PH66-03', 'PH1-002', '1');
INSERT INTO `t_mapline` VALUES ('95', 'PH56-10', 'PH1-002', '1');
INSERT INTO `t_mapline` VALUES ('95', 'PH56-11', 'PH1-002', '1');
INSERT INTO `t_mapline` VALUES ('95', 'PH56-09', 'PH1-002', '1');
INSERT INTO `t_mapline` VALUES ('95', 'PH56-06', 'PH35-07', '1');
INSERT INTO `t_mapline` VALUES ('95', 'PH56-03', 'PH35-07', '1');
INSERT INTO `t_mapline` VALUES ('95', 'PH56-08', 'PH35-07', '1');
INSERT INTO `t_mapline` VALUES ('95', 'PH66-01', 'PH35-07', '1');
INSERT INTO `t_mapline` VALUES ('95', 'PH56-06', 'PH35-07', '1');
INSERT INTO `t_mapline` VALUES ('95', 'PH77-16', 'PH35-07', '1');
INSERT INTO `t_mapline` VALUES ('95', 'PH88-02', 'PH35-07', '1');
INSERT INTO `t_mapline` VALUES ('95', 'PH88-04', 'PH35-07', '1');
INSERT INTO `t_mapline` VALUES ('95', 'PH88-03', 'PH35-07', '1');
INSERT INTO `t_mapline` VALUES ('95', 'PH88-07', 'PH35-07', '1');
INSERT INTO `t_mapline` VALUES ('95', 'PH1-002', 'JIQIZHAN', '2');
INSERT INTO `t_mapline` VALUES ('95', 'PH35-07', 'JIQIZHAN', '2');

-- ----------------------------
-- Table structure for `t_mappoint`
-- ----------------------------
DROP TABLE IF EXISTS `t_mappoint`;
CREATE TABLE `t_mappoint` (
  `ProID` int(11) DEFAULT NULL,
  `PointName` varchar(32) DEFAULT NULL,
  `Type` varchar(32) DEFAULT NULL,
  `GeodeticCoordinatesX` double DEFAULT NULL,
  `GeodeticCoordinatesY` double DEFAULT NULL,
  `Latitude` double DEFAULT NULL,
  `Longitude` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_mappoint
-- ----------------------------
INSERT INTO `t_mappoint` VALUES ('93', 'PH35-07', 'fazu', '643830.9864', '3948698.53', '35.671684812614046', '118.5892320977849');
INSERT INTO `t_mappoint` VALUES ('93', 'PH77-16', 'jingkou', '643826.9864', '3948658.53', '35.67132487824821', '118.58918076788424');
INSERT INTO `t_mappoint` VALUES ('93', 'JIQIZHAN', 'jiqizhan', '643000.9864', '3948000.53', '35.665514552098855', '118.57994031031862');
INSERT INTO `t_mappoint` VALUES ('93', 'PH1-002', 'fazu', '642413.5666', '3947679.092', '35.662702481580894', '118.57339556775331');
INSERT INTO `t_mappoint` VALUES ('93', 'PH66-08', 'jingkou', '642877.5666', '3947678.192', '35.662627216009334', '118.57851997538629');
INSERT INTO `t_mappoint` VALUES ('93', 'PH88-07', 'jingkou', '644135.4246', '3949632.468', '35.680057845934535', '118.59276205159699');
INSERT INTO `t_mappoint` VALUES ('93', 'PH56-11', 'jingkou', '642883.1592', '3947125.296', '35.65764314219483', '118.57848364358466');
INSERT INTO `t_mappoint` VALUES ('93', 'PH66-04', 'jingkou', '642150.4345', '3947632.937', '35.66232446961591', '118.57048129542315');
INSERT INTO `t_mappoint` VALUES ('93', 'PH56-10', 'jingkou', '642497.1578', '3947153.18', '35.65795033440878', '118.57422571810082');
INSERT INTO `t_mappoint` VALUES ('93', 'PH66-03', 'jingkou', '642735.4336', '3947269.037', '35.65896008493791', '118.57687769199374');
INSERT INTO `t_mappoint` VALUES ('93', 'PH88-03', 'jingkou', '644458.4138', '3949409.207', '35.67799829573185', '118.59628990411746');
INSERT INTO `t_mappoint` VALUES ('93', 'PH56-03', 'jingkou', '642176.8753', '3946598.227', '35.65299475414599', '118.57059066061505');
INSERT INTO `t_mappoint` VALUES ('93', 'PH88-04', 'jingkou', '644586.7507', '3949695.279', '35.68055780691314', '118.59775896514007');
INSERT INTO `t_mappoint` VALUES ('93', 'PH66-05', 'jingkou', '642598.6307', '3947479.802', '35.66087951671918', '118.57540418634292');
INSERT INTO `t_mappoint` VALUES ('93', 'PH88-02', 'jingkou', '644008.5306', '3949266.397', '35.67677703191632', '118.59129477868382');
INSERT INTO `t_mappoint` VALUES ('93', 'PH56-04', 'jingkou', '642572.4831', '3946415.014', '35.65128632019088', '118.57492693710482');
INSERT INTO `t_mappoint` VALUES ('93', 'PH66-02', 'jingkou', '642370.2253', '3947415.113', '35.660329489014096', '118.57287021956822');
INSERT INTO `t_mappoint` VALUES ('93', 'PH56-06', 'jingkou', '642430.1129', '3946669.858', '35.65360381859533', '118.57339983132138');
INSERT INTO `t_mappoint` VALUES ('93', 'PH66-01', 'jingkou', '642111.7407', '3947240.585', '35.65879375845324', '118.5699847098955');
INSERT INTO `t_mappoint` VALUES ('93', 'PH56-09', 'jingkou', '642696.1411', '3946827.752', '35.6549884566997', '118.57636557213044');
INSERT INTO `t_mappoint` VALUES ('93', 'PH56-08', 'jingkou', '642192.5931', '3946984.241', '35.65647165576007', '118.57083237255222');
INSERT INTO `t_mappoint` VALUES ('94', 'PH35-07', 'fazu', '643830.9864', '3948698.53', '35.671684812614046', '118.5892320977849');
INSERT INTO `t_mappoint` VALUES ('94', 'PH77-16', 'jingkou', '643826.9864', '3948658.53', '35.67132487824821', '118.58918076788424');
INSERT INTO `t_mappoint` VALUES ('94', 'JIQIZHAN', 'jiqizhan', '643000.9864', '3948000.53', '35.665514552098855', '118.57994031031862');
INSERT INTO `t_mappoint` VALUES ('94', 'PH1-002', 'fazu', '642413.5666', '3947679.092', '35.662702481580894', '118.57339556775331');
INSERT INTO `t_mappoint` VALUES ('94', 'PH66-08', 'jingkou', '642877.5666', '3947678.192', '35.662627216009334', '118.57851997538629');
INSERT INTO `t_mappoint` VALUES ('94', 'PH88-07', 'jingkou', '644135.4246', '3949632.468', '35.680057845934535', '118.59276205159699');
INSERT INTO `t_mappoint` VALUES ('94', 'PH56-11', 'jingkou', '642883.1592', '3947125.296', '35.65764314219483', '118.57848364358466');
INSERT INTO `t_mappoint` VALUES ('94', 'PH66-04', 'jingkou', '642150.4345', '3947632.937', '35.66232446961591', '118.57048129542315');
INSERT INTO `t_mappoint` VALUES ('94', 'PH56-10', 'jingkou', '642497.1578', '3947153.18', '35.65795033440878', '118.57422571810082');
INSERT INTO `t_mappoint` VALUES ('94', 'PH66-03', 'jingkou', '642735.4336', '3947269.037', '35.65896008493791', '118.57687769199374');
INSERT INTO `t_mappoint` VALUES ('94', 'PH88-03', 'jingkou', '644458.4138', '3949409.207', '35.67799829573185', '118.59628990411746');
INSERT INTO `t_mappoint` VALUES ('94', 'PH56-03', 'jingkou', '642176.8753', '3946598.227', '35.65299475414599', '118.57059066061505');
INSERT INTO `t_mappoint` VALUES ('94', 'PH88-04', 'jingkou', '644586.7507', '3949695.279', '35.68055780691314', '118.59775896514007');
INSERT INTO `t_mappoint` VALUES ('94', 'PH66-05', 'jingkou', '642598.6307', '3947479.802', '35.66087951671918', '118.57540418634292');
INSERT INTO `t_mappoint` VALUES ('94', 'PH88-02', 'jingkou', '644008.5306', '3949266.397', '35.67677703191632', '118.59129477868382');
INSERT INTO `t_mappoint` VALUES ('94', 'PH56-04', 'jingkou', '642572.4831', '3946415.014', '35.65128632019088', '118.57492693710482');
INSERT INTO `t_mappoint` VALUES ('94', 'PH66-02', 'jingkou', '642370.2253', '3947415.113', '35.660329489014096', '118.57287021956822');
INSERT INTO `t_mappoint` VALUES ('94', 'PH56-06', 'jingkou', '642430.1129', '3946669.858', '35.65360381859533', '118.57339983132138');
INSERT INTO `t_mappoint` VALUES ('94', 'PH66-01', 'jingkou', '642111.7407', '3947240.585', '35.65879375845324', '118.5699847098955');
INSERT INTO `t_mappoint` VALUES ('94', 'PH56-09', 'jingkou', '642696.1411', '3946827.752', '35.6549884566997', '118.57636557213044');
INSERT INTO `t_mappoint` VALUES ('94', 'PH56-08', 'jingkou', '642192.5931', '3946984.241', '35.65647165576007', '118.57083237255222');
INSERT INTO `t_mappoint` VALUES ('95', 'PH35-07', 'fazu', '643830.9864', '3948698.53', '35.671684812614046', '118.5892320977849');
INSERT INTO `t_mappoint` VALUES ('95', 'PH77-16', 'jingkou', '643826.9864', '3948658.53', '35.67132487824821', '118.58918076788424');
INSERT INTO `t_mappoint` VALUES ('95', 'JIQIZHAN', 'jiqizhan', '643000.9864', '3948000.53', '35.665514552098855', '118.57994031031862');
INSERT INTO `t_mappoint` VALUES ('95', 'PH1-002', 'fazu', '642413.5666', '3947679.092', '35.662702481580894', '118.57339556775331');
INSERT INTO `t_mappoint` VALUES ('95', 'PH66-08', 'jingkou', '642877.5666', '3947678.192', '35.662627216009334', '118.57851997538629');
INSERT INTO `t_mappoint` VALUES ('95', 'PH88-07', 'jingkou', '644135.4246', '3949632.468', '35.680057845934535', '118.59276205159699');
INSERT INTO `t_mappoint` VALUES ('95', 'PH56-11', 'jingkou', '642883.1592', '3947125.296', '35.65764314219483', '118.57848364358466');
INSERT INTO `t_mappoint` VALUES ('95', 'PH66-04', 'jingkou', '642150.4345', '3947632.937', '35.66232446961591', '118.57048129542315');
INSERT INTO `t_mappoint` VALUES ('95', 'PH56-10', 'jingkou', '642497.1578', '3947153.18', '35.65795033440878', '118.57422571810082');
INSERT INTO `t_mappoint` VALUES ('95', 'PH66-03', 'jingkou', '642735.4336', '3947269.037', '35.65896008493791', '118.57687769199374');
INSERT INTO `t_mappoint` VALUES ('95', 'PH88-03', 'jingkou', '644458.4138', '3949409.207', '35.67799829573185', '118.59628990411746');
INSERT INTO `t_mappoint` VALUES ('95', 'PH56-03', 'jingkou', '642176.8753', '3946598.227', '35.65299475414599', '118.57059066061505');
INSERT INTO `t_mappoint` VALUES ('95', 'PH88-04', 'jingkou', '644586.7507', '3949695.279', '35.68055780691314', '118.59775896514007');
INSERT INTO `t_mappoint` VALUES ('95', 'PH66-05', 'jingkou', '642598.6307', '3947479.802', '35.66087951671918', '118.57540418634292');
INSERT INTO `t_mappoint` VALUES ('95', 'PH88-02', 'jingkou', '644008.5306', '3949266.397', '35.67677703191632', '118.59129477868382');
INSERT INTO `t_mappoint` VALUES ('95', 'PH56-04', 'jingkou', '642572.4831', '3946415.014', '35.65128632019088', '118.57492693710482');
INSERT INTO `t_mappoint` VALUES ('95', 'PH66-02', 'jingkou', '642370.2253', '3947415.113', '35.660329489014096', '118.57287021956822');
INSERT INTO `t_mappoint` VALUES ('95', 'PH56-06', 'jingkou', '642430.1129', '3946669.858', '35.65360381859533', '118.57339983132138');
INSERT INTO `t_mappoint` VALUES ('95', 'PH66-01', 'jingkou', '642111.7407', '3947240.585', '35.65879375845324', '118.5699847098955');
INSERT INTO `t_mappoint` VALUES ('95', 'PH56-09', 'jingkou', '642696.1411', '3946827.752', '35.6549884566997', '118.57636557213044');
INSERT INTO `t_mappoint` VALUES ('95', 'PH56-08', 'jingkou', '642192.5931', '3946984.241', '35.65647165576007', '118.57083237255222');

-- ----------------------------
-- Table structure for `t_mappro`
-- ----------------------------
DROP TABLE IF EXISTS `t_mappro`;
CREATE TABLE `t_mappro` (
  `ID` int(8) NOT NULL AUTO_INCREMENT,
  `ProName` varchar(25) DEFAULT NULL,
  `FilePath` varchar(255) DEFAULT NULL,
  `AddDate` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_mappro
-- ----------------------------
INSERT INTO `t_mappro` VALUES ('1', '123', '12341', '2013-12-23 14:25:01');
INSERT INTO `t_mappro` VALUES ('2', '123', '12341', '2013-12-23 15:48:58');
INSERT INTO `t_mappro` VALUES ('3', 'asd', 'adfsa', '2013-12-23 15:50:12');
INSERT INTO `t_mappro` VALUES ('5', 'asd', 'adfsa', '2013-12-23 15:50:15');
INSERT INTO `t_mappro` VALUES ('6', 'asd', 'adfsa', '2013-12-23 15:50:17');
INSERT INTO `t_mappro` VALUES ('9', 'asd', 'adfsa', '2013-12-23 15:50:20');
INSERT INTO `t_mappro` VALUES ('10', 'asd', 'adfsa', '2013-12-23 15:50:29');
INSERT INTO `t_mappro` VALUES ('11', 'asd', 'adfsa', '2013-12-23 15:50:32');
INSERT INTO `t_mappro` VALUES ('12', 'asd', 'adfsa', '2013-12-23 15:50:34');
INSERT INTO `t_mappro` VALUES ('13', 'asd', 'adfsa', '2013-12-23 15:50:36');
INSERT INTO `t_mappro` VALUES ('14', 'asd', 'adfsa', '2013-12-23 15:50:38');
INSERT INTO `t_mappro` VALUES ('15', 'asd', 'adfsa', '2013-12-23 15:50:39');
INSERT INTO `t_mappro` VALUES ('92', 'asd', 'adfsa', '2013-12-23 15:50:25');
INSERT INTO `t_mappro` VALUES ('93', 'test', 'E:\\software\\tomcat7\\webapps\\OilManage\\upload\\1388739016679.csv', '2014-01-03 16:50:17');
INSERT INTO `t_mappro` VALUES ('94', 'tes3', 'E:\\software\\tomcat7\\webapps\\OilManage\\upload\\1389600252802.csv', '2014-01-13 16:04:22');
INSERT INTO `t_mappro` VALUES ('95', 'tes3', 'E:\\software\\tomcat7\\webapps\\OilManage\\upload\\1389600252802.csv', '2014-01-13 16:04:26');

-- ----------------------------
-- Table structure for `t_measure`
-- ----------------------------
DROP TABLE IF EXISTS `t_measure`;
CREATE TABLE `t_measure` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PhysicalID` int(11) DEFAULT NULL,
  `EName` varchar(50) DEFAULT NULL,
  `CName` varchar(32) DEFAULT NULL,
  `Symbol` varchar(16) DEFAULT NULL,
  `RatioA` double DEFAULT NULL,
  `RatioB` double DEFAULT NULL,
  `StyleID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_measure
-- ----------------------------
INSERT INTO `t_measure` VALUES ('1', '1', 'Metre', '米', 'm', '1', '0', '1');
INSERT INTO `t_measure` VALUES ('2', '1', 'Decimeter', '分米', 'dm', '0.1', '0', '1');
INSERT INTO `t_measure` VALUES ('3', '1', 'Centimetre', '厘米', 'cm', '0.01', '0', '1');
INSERT INTO `t_measure` VALUES ('4', '1', 'Millimetre ', '毫米\r\n', 'mm', '0.001', '0', '1');
INSERT INTO `t_measure` VALUES ('5', '1', 'Kilometre', '千米', 'km', '1000', '0', '1');
INSERT INTO `t_measure` VALUES ('6', '1', 'Foot', '英尺', 'ft', '0.3048', '0', '2');
INSERT INTO `t_measure` VALUES ('7', '1', 'Inch', '英寸', 'in', '0.0254', '0', '2');
INSERT INTO `t_measure` VALUES ('8', '1', 'Yard', '码', 'yard', '0.9144', '0', '2');
INSERT INTO `t_measure` VALUES ('9', '1', 'Mile', '英里', 'mile', '1609.344', '0', '2');

-- ----------------------------
-- Table structure for `t_parameters`
-- ----------------------------
DROP TABLE IF EXISTS `t_parameters`;
CREATE TABLE `t_parameters` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `measureID` int(11) DEFAULT NULL,
  `display` varchar(32) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_parameters
-- ----------------------------
INSERT INTO `t_parameters` VALUES ('1', '4', '管道长度', 'lineslength');
INSERT INTO `t_parameters` VALUES ('2', '2', '管道长度3', 'lineslength3');
INSERT INTO `t_parameters` VALUES ('3', '5', '管道长度2', 'lineslength2');
INSERT INTO `t_parameters` VALUES ('4', '2', '加数1', 'a');
INSERT INTO `t_parameters` VALUES ('5', '3', '加数2', 'b');
INSERT INTO `t_parameters` VALUES ('6', '3', '相加结果', 'c');
INSERT INTO `t_parameters` VALUES ('7', '3', '直角边a', 'ZHIBIAN1');
INSERT INTO `t_parameters` VALUES ('8', '1', '直角边b', 'ZHIBIAN2');
INSERT INTO `t_parameters` VALUES ('9', '3', '斜边', 'XIEBIAN');

-- ----------------------------
-- Table structure for `t_physical`
-- ----------------------------
DROP TABLE IF EXISTS `t_physical`;
CREATE TABLE `t_physical` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CName` varchar(32) DEFAULT NULL,
  `EName` varchar(32) DEFAULT NULL,
  `Description` varchar(50) DEFAULT NULL,
  `ISOBasicUnit` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_physical
-- ----------------------------
INSERT INTO `t_physical` VALUES ('1', '长度单位', null, '长度\r\n', '米');
INSERT INTO `t_physical` VALUES ('15', '质量', '', null, '千克');
INSERT INTO `t_physical` VALUES ('16', '温度', '', null, '开尔文');
INSERT INTO `t_physical` VALUES ('17', '物质的量', '', null, '摩尔');
INSERT INTO `t_physical` VALUES ('18', '面积', '', null, '米^2');
INSERT INTO `t_physical` VALUES ('19', '体积', '', null, '米^3');
INSERT INTO `t_physical` VALUES ('26', '力', '', '力', 'M*L*T^(-2)');
INSERT INTO `t_physical` VALUES ('27', '压强', '', '压强', 'M*T^(-2)*L^(-1)');
INSERT INTO `t_physical` VALUES ('28', '速度', '', '速度', 'L*T^(-1)');
INSERT INTO `t_physical` VALUES ('29', '加速度', '', '加速度', '米/秒^2');
INSERT INTO `t_physical` VALUES ('30', '功率', '', '功率', '瓦');
INSERT INTO `t_physical` VALUES ('31', '动力粘度', '', '动力粘度', '帕秒');
INSERT INTO `t_physical` VALUES ('32', '运动粘度', '', '运动粘度', '米^2/秒');
INSERT INTO `t_physical` VALUES ('33', '密度', '', '密度', '千克/米^3');
INSERT INTO `t_physical` VALUES ('34', '摩尔流量', '', '摩尔流量', '摩尔/秒');
INSERT INTO `t_physical` VALUES ('35', '体积流量', '', '体积流量', '立方米/秒');
INSERT INTO `t_physical` VALUES ('36', '质量流量', '', '质量流量', '千克/秒');
INSERT INTO `t_physical` VALUES ('37', '热量/能量', '', '热量/能量', '焦耳');
INSERT INTO `t_physical` VALUES ('38', '导热系数', '', '导热系数', '瓦/(米*开)');
INSERT INTO `t_physical` VALUES ('39', '传热系数', '', '传热系数', '瓦/(米^2*开)');
INSERT INTO `t_physical` VALUES ('40', '负荷', 'Duty', '负荷', 'MM kJ/hr');
INSERT INTO `t_physical` VALUES ('41', 'test', 'test', 'tet', 'test');
INSERT INTO `t_physical` VALUES ('42', 'test', '', '', 'test ');
INSERT INTO `t_physical` VALUES ('43', 'test', '', '', 'test');
INSERT INTO `t_physical` VALUES ('44', 'test', '', '', 'test');
INSERT INTO `t_physical` VALUES ('45', 'test', '', 'test', 'test');
INSERT INTO `t_physical` VALUES ('46', 'test', '', 'test', '');

-- ----------------------------
-- Table structure for `t_physicalstyle`
-- ----------------------------
DROP TABLE IF EXISTS `t_physicalstyle`;
CREATE TABLE `t_physicalstyle` (
  `StyleID` int(11) DEFAULT NULL,
  `StyleName` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_physicalstyle
-- ----------------------------
INSERT INTO `t_physicalstyle` VALUES ('1', 'ISO');
INSERT INTO `t_physicalstyle` VALUES ('2', 'English');
INSERT INTO `t_physicalstyle` VALUES ('3', 'UserDefine');

-- ----------------------------
-- Table structure for `t_projectinputs`
-- ----------------------------
DROP TABLE IF EXISTS `t_projectinputs`;
CREATE TABLE `t_projectinputs` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Pro_ID` int(11) DEFAULT NULL,
  `par_id` int(11) DEFAULT NULL,
  `par_display` varchar(50) DEFAULT NULL,
  `par_value` double DEFAULT NULL,
  `par_name` varchar(50) DEFAULT NULL,
  `par_messID` int(11) DEFAULT NULL,
  `par_ISOValue` double DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_projectinputs
-- ----------------------------
INSERT INTO `t_projectinputs` VALUES ('-1', '1', '1', '管道长度', '0', 'lineslength', '4', null);
INSERT INTO `t_projectinputs` VALUES ('1', '1', '1', '管道长度', '0', 'lineslength', '4', null);
INSERT INTO `t_projectinputs` VALUES ('2', '1', '1', '管道长度', '0', 'lineslength', '4', null);
INSERT INTO `t_projectinputs` VALUES ('3', '1', '1', '管道长度', '0', 'lineslength', '4', null);
INSERT INTO `t_projectinputs` VALUES ('4', '1', '2', '管道长度3', '32', 'lineslength3', '2', null);
INSERT INTO `t_projectinputs` VALUES ('5', '1', '2', '管道长度3', '32', 'lineslength3', '2', null);
INSERT INTO `t_projectinputs` VALUES ('6', '2', '2', '管道长度3', '20', 'lineslength3', '2', '4');
INSERT INTO `t_projectinputs` VALUES ('7', '3', '4', '加数1', '156', 'a', '2', '15.600000000000001');
INSERT INTO `t_projectinputs` VALUES ('8', '3', '5', '加数2', '1561', 'b', '3', '15.610000000000001');
INSERT INTO `t_projectinputs` VALUES ('9', '4', '4', '加数1', '32', 'a', '2', '3.2');
INSERT INTO `t_projectinputs` VALUES ('10', '4', '5', '加数2', '4124', 'b', '3', '41.24');
INSERT INTO `t_projectinputs` VALUES ('11', '5', '4', '加数1', '12.15', 'a', '2', '1.215');
INSERT INTO `t_projectinputs` VALUES ('12', '5', '5', '加数2', '154.2', 'b', '3', '1.5419999999999998');
INSERT INTO `t_projectinputs` VALUES ('13', '6', '7', '直角边a', '3', 'ZHIBIAN1', '3', '0.03');
INSERT INTO `t_projectinputs` VALUES ('14', '6', '8', '直角边b', '0.04', 'ZHIBIAN2', '1', '0.04');

-- ----------------------------
-- Table structure for `t_projectoutputs`
-- ----------------------------
DROP TABLE IF EXISTS `t_projectoutputs`;
CREATE TABLE `t_projectoutputs` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Pro_ID` int(11) DEFAULT NULL,
  `Par_ID` int(11) DEFAULT NULL,
  `par_display` varchar(50) DEFAULT NULL,
  `par_value` double DEFAULT NULL,
  `par_name` varchar(50) DEFAULT NULL,
  `par_messID` int(11) DEFAULT NULL,
  `par_ISOValue` double DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_projectoutputs
-- ----------------------------
INSERT INTO `t_projectoutputs` VALUES ('10', '3', '6', '相加结果', '3121', 'c', '3', '31.21');
INSERT INTO `t_projectoutputs` VALUES ('19', '5', '6', '相加结果', '275.7', 'c', '3', '2.7569999999999997');
INSERT INTO `t_projectoutputs` VALUES ('22', '6', '9', '斜边', '5', 'XIEBIAN', '3', '0.05');

-- ----------------------------
-- Table structure for `t_projects`
-- ----------------------------
DROP TABLE IF EXISTS `t_projects`;
CREATE TABLE `t_projects` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Pro_InputNum` int(11) DEFAULT NULL,
  `AuthorID` int(11) DEFAULT NULL,
  `AddTime` datetime DEFAULT NULL,
  `LastCalcTime` datetime DEFAULT NULL,
  `CalcHisNum` int(11) DEFAULT NULL,
  `Description` varchar(250) DEFAULT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `Algorithm_ID` int(11) DEFAULT NULL,
  `CalcRes` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_projects
-- ----------------------------
INSERT INTO `t_projects` VALUES ('1', null, '1', '2014-03-21 15:06:10', null, null, 'asdfsdf', 'abcd', null, null);
INSERT INTO `t_projects` VALUES ('2', null, '1', '2014-03-26 15:34:40', null, null, '测试下看看', '相加测试1', null, null);
INSERT INTO `t_projects` VALUES ('3', null, '1', '2014-03-26 16:22:10', null, null, 'test3', '相加测试2', '14', null);
INSERT INTO `t_projects` VALUES ('4', null, '1', '2014-03-28 10:40:27', null, null, '相加测试4', 'test4', '15', null);
INSERT INTO `t_projects` VALUES ('5', null, '1', '2014-03-28 10:48:28', '2014-03-31 15:57:25', '9', 'final', 'ice final', '16', null);
INSERT INTO `t_projects` VALUES ('6', null, '1', '2014-03-31 16:04:59', '2014-03-31 16:12:11', '3', '计算下试试', '勾股定理测试', '17', null);

-- ----------------------------
-- Table structure for `t_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `Username` varchar(32) DEFAULT NULL,
  `Password` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', 'ice', 'ice');

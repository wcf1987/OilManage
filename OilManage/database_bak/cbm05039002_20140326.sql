/*
Navicat MySQL Data Transfer

Source Server         : oil
Source Server Version : 50508
Source Host           : localhost:3306
Source Database       : cbm05039002

Target Server Type    : MYSQL
Target Server Version : 50508
File Encoding         : 65001

Date: 2014-03-26 16:34:24
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_algorithminput
-- ----------------------------
INSERT INTO `t_algorithminput` VALUES ('1', '2', '3');
INSERT INTO `t_algorithminput` VALUES ('2', '2', '1');
INSERT INTO `t_algorithminput` VALUES ('3', '12', '1');
INSERT INTO `t_algorithminput` VALUES ('4', '12', '2');
INSERT INTO `t_algorithminput` VALUES ('5', '12', '3');
INSERT INTO `t_algorithminput` VALUES ('6', '13', '4');
INSERT INTO `t_algorithminput` VALUES ('7', '13', '5');

-- ----------------------------
-- Table structure for `t_algorithmoutput`
-- ----------------------------
DROP TABLE IF EXISTS `t_algorithmoutput`;
CREATE TABLE `t_algorithmoutput` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CycleID` int(11) DEFAULT NULL,
  `ParamID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_algorithmoutput
-- ----------------------------
INSERT INTO `t_algorithmoutput` VALUES ('1', '12', '2');
INSERT INTO `t_algorithmoutput` VALUES ('2', '12', '3');
INSERT INTO `t_algorithmoutput` VALUES ('3', '13', '6');

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
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_algorithmscycle
-- ----------------------------
INSERT INTO `t_algorithmscycle` VALUES ('2', '0', '0', '0', '1', 'icetest', '2014-03-17 22:22:28', '2014-03-17 22:22:28', null, null);
INSERT INTO `t_algorithmscycle` VALUES ('3', '0', '0', '0', '1', 'test2', '2014-03-24 15:23:20', '2014-03-24 15:23:20', null, null);
INSERT INTO `t_algorithmscycle` VALUES ('4', '0', '0', '0', '1', 'test2', '2014-03-24 15:42:50', '2014-03-24 15:42:50', null, null);
INSERT INTO `t_algorithmscycle` VALUES ('5', '0', '0', '0', '1', 'test2', '2014-03-24 15:48:17', '2014-03-24 15:48:17', null, null);
INSERT INTO `t_algorithmscycle` VALUES ('6', '0', '0', '0', '1', 'test2', '2014-03-24 15:51:14', '2014-03-24 15:51:14', null, null);
INSERT INTO `t_algorithmscycle` VALUES ('7', '0', '0', '0', '1', 'test3', '2014-03-24 15:52:55', '2014-03-24 15:52:55', null, null);
INSERT INTO `t_algorithmscycle` VALUES ('8', '0', '0', '0', '1', 'test3', '2014-03-24 15:53:27', '2014-03-24 15:53:27', null, null);
INSERT INTO `t_algorithmscycle` VALUES ('9', '0', '0', '0', '1', 'aa', '2014-03-24 16:05:41', '2014-03-24 16:05:41', null, null);
INSERT INTO `t_algorithmscycle` VALUES ('10', '0', '0', '0', '1', 'ttt', '2014-03-24 16:06:26', '2014-03-24 16:06:26', null, null);
INSERT INTO `t_algorithmscycle` VALUES ('11', '0', '0', '0', '1', 'testf', '2014-03-24 16:10:00', '2014-03-24 16:10:00', null, null);
INSERT INTO `t_algorithmscycle` VALUES ('12', '0', '0', '0', '1', 'testf', '2014-03-24 16:10:41', '2014-03-24 16:10:41', null, 'E:\\software\\tomcat7\\webapps\\OilManage\\uploadAlgorithm\\1395648630845.alg');
INSERT INTO `t_algorithmscycle` VALUES ('13', '0', '0', '0', '1', '加数测试', '2014-03-26 15:33:31', '2014-03-26 15:33:31', null, 'E:\\software\\tomcat7\\webapps\\OilManage\\uploadAlgorithm\\1395819210688.alg');

-- ----------------------------
-- Table structure for `t_calchis`
-- ----------------------------
DROP TABLE IF EXISTS `t_calchis`;
CREATE TABLE `t_calchis` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Pro_ID` int(11) DEFAULT NULL,
  `Calc_Date` datetime DEFAULT NULL,
  `Algorith_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_calchis
-- ----------------------------

-- ----------------------------
-- Table structure for `t_calcinput_his`
-- ----------------------------
DROP TABLE IF EXISTS `t_calcinput_his`;
CREATE TABLE `t_calcinput_his` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Calc_ID` int(11) DEFAULT NULL,
  `Pro_ID` int(11) DEFAULT NULL,
  `AlgorCycle_ID` int(11) DEFAULT NULL,
  `Input_Par_ID` int(11) DEFAULT NULL,
  `Input_Par_Value` double DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_calcinput_his
-- ----------------------------
INSERT INTO `t_calcinput_his` VALUES ('1', '-1', '2', '2', '1', '0');
INSERT INTO `t_calcinput_his` VALUES ('2', '-1', '2', '2', '3', '0');
INSERT INTO `t_calcinput_his` VALUES ('4', '-1', '2', '2', '1', '0');
INSERT INTO `t_calcinput_his` VALUES ('5', '-1', '2', '2', '3', '0');
INSERT INTO `t_calcinput_his` VALUES ('7', '-1', '2', '2', '1', '0');
INSERT INTO `t_calcinput_his` VALUES ('8', '-1', '2', '2', '3', '0');

-- ----------------------------
-- Table structure for `t_calcoutput_his`
-- ----------------------------
DROP TABLE IF EXISTS `t_calcoutput_his`;
CREATE TABLE `t_calcoutput_his` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Calc_ID` int(11) DEFAULT NULL,
  `Pro_ID` int(11) DEFAULT NULL,
  `Output_ID` int(11) DEFAULT NULL,
  `Output_Par_ID` int(11) DEFAULT NULL,
  `Output_Par_Value` double DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_calcoutput_his
-- ----------------------------

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_parameters
-- ----------------------------
INSERT INTO `t_parameters` VALUES ('1', '4', '管道长度', 'lineslength');
INSERT INTO `t_parameters` VALUES ('2', '2', '管道长度3', 'lineslength3');
INSERT INTO `t_parameters` VALUES ('3', '5', '管道长度2', 'lineslength2');
INSERT INTO `t_parameters` VALUES ('4', '2', '加数1', 'a');
INSERT INTO `t_parameters` VALUES ('5', '3', '加数2', 'b');
INSERT INTO `t_parameters` VALUES ('6', '3', '相加结果', 'c');

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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_projectoutputs
-- ----------------------------

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
  `Algorithm` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_projects
-- ----------------------------
INSERT INTO `t_projects` VALUES ('1', null, '1', '2014-03-21 15:06:10', null, null, 'asdfsdf', 'abcd', null);
INSERT INTO `t_projects` VALUES ('2', null, '1', '2014-03-26 15:34:40', null, null, '测试下看看', '相加测试1', null);
INSERT INTO `t_projects` VALUES ('3', null, '1', '2014-03-26 16:22:10', null, null, 'test3', '相加测试2', null);

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

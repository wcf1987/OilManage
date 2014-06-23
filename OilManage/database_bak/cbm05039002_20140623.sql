/*
Navicat MySQL Data Transfer

Source Server         : Oil
Source Server Version : 50616
Source Host           : localhost:3306
Source Database       : cbm05039002

Target Server Type    : MYSQL
Target Server Version : 50616
File Encoding         : 65001

Date: 2014-06-23 20:31:55
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_algorithminput
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
-- Table structure for t_algorithmoutput
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
-- Table structure for t_algorithmscycle
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
-- Table structure for t_algrole
-- ----------------------------
DROP TABLE IF EXISTS `t_algrole`;
CREATE TABLE `t_algrole` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) DEFAULT NULL,
  `algorithm_id` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `other` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_algrole
-- ----------------------------

-- ----------------------------
-- Table structure for t_calchis
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
-- Table structure for t_calcinput_his
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
-- Table structure for t_calcoutput_his
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
-- Table structure for t_guiconnect
-- ----------------------------
DROP TABLE IF EXISTS `t_guiconnect`;
CREATE TABLE `t_guiconnect` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pro_id` int(11) DEFAULT NULL,
  `left_id` int(11) DEFAULT NULL,
  `pointleft` varchar(16) DEFAULT NULL,
  `right_id` int(11) DEFAULT NULL,
  `pointright` varchar(16) DEFAULT NULL,
  `statusNow` int(11) DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_guiconnect
-- ----------------------------
INSERT INTO `t_guiconnect` VALUES ('1', '114', '8', '11463102248665', '7', '11463102247500', '-1', '2014-06-03 10:22:57');
INSERT INTO `t_guiconnect` VALUES ('2', '114', '9', '11463102253286', '8', '11463102248665', '-1', '2014-06-03 10:22:57');
INSERT INTO `t_guiconnect` VALUES ('3', '114', '11', '11463102317501', '10', '11463102314511', '-1', '2014-06-03 10:23:24');
INSERT INTO `t_guiconnect` VALUES ('4', '114', '12', '11463102319110', '11', '11463102317501', '-1', '2014-06-03 10:23:24');
INSERT INTO `t_guiconnect` VALUES ('5', '113', '14', '11463102248665', '13', '11463102247500', '1', '2014-06-03 10:23:03');
INSERT INTO `t_guiconnect` VALUES ('6', '113', '15', '11463102253286', '14', '11463102248665', '1', '2014-06-03 10:23:03');
INSERT INTO `t_guiconnect` VALUES ('7', '114', '21', '11463102319110', '19', '11463102314511', '1', '2014-06-03 10:53:41');
INSERT INTO `t_guiconnect` VALUES ('8', '114', '20', '11463102317501', '21', '11463102319110', '1', '2014-06-03 10:53:41');
INSERT INTO `t_guiconnect` VALUES ('9', '114', '22', '1146310530487', '20', '11463102317501', '1', '2014-06-03 10:53:41');
INSERT INTO `t_guiconnect` VALUES ('10', '114', '23', '1146310539166', '22', '1146310530487', '1', '2014-06-03 10:53:41');
INSERT INTO `t_guiconnect` VALUES ('11', '114', '25', '11463105318183', '22', '1146310530487', '1', '2014-06-03 10:53:41');
INSERT INTO `t_guiconnect` VALUES ('12', '114', '24', '11463105313185', '23', '1146310539166', '1', '2014-06-03 10:53:41');
INSERT INTO `t_guiconnect` VALUES ('13', '114', '26', '11463105327802', '25', '11463105318183', '1', '2014-06-03 10:53:41');
INSERT INTO `t_guiconnect` VALUES ('14', '114', '27', '11463105331541', '26', '11463105327802', '1', '2014-06-03 10:53:41');
INSERT INTO `t_guiconnect` VALUES ('15', '115', '33', '114614105231477', '30', '11461410521959', '1', '2014-06-14 10:52:56');
INSERT INTO `t_guiconnect` VALUES ('16', '115', '32', '114614105229182', '33', '114614105231477', '1', '2014-06-14 10:52:56');
INSERT INTO `t_guiconnect` VALUES ('17', '115', '34', '114614105243639', '32', '114614105229182', '1', '2014-06-14 10:52:56');
INSERT INTO `t_guiconnect` VALUES ('18', '115', '35', '114614105247385', '34', '114614105243639', '1', '2014-06-14 10:52:56');
INSERT INTO `t_guiconnect` VALUES ('19', '121', '36', '114616205319640', '37', '114616205321394', '1', '2014-06-16 21:10:19');
INSERT INTO `t_guiconnect` VALUES ('20', '121', '37', '114616205321394', '38', '114616205329672', '1', '2014-06-16 21:10:19');
INSERT INTO `t_guiconnect` VALUES ('21', '121', '39', '114616205336123', '37', '114616205321394', '1', '2014-06-16 21:10:19');
INSERT INTO `t_guiconnect` VALUES ('22', '121', '40', '114616205345795', '39', '114616205336123', '1', '2014-06-16 21:10:19');
INSERT INTO `t_guiconnect` VALUES ('23', '121', '40', '114616205345795', '41', '114616205351705', '1', '2014-06-16 21:10:19');
INSERT INTO `t_guiconnect` VALUES ('24', '121', '42', '11461621108731', '40', '114616205345795', '1', '2014-06-16 21:10:19');
INSERT INTO `t_guiconnect` VALUES ('25', '122', '45', '11461622556895', '43', '11461622552281', '-1', '2014-06-16 22:08:24');
INSERT INTO `t_guiconnect` VALUES ('26', '122', '46', '11461622559968', '45', '11461622556895', '-1', '2014-06-16 22:08:24');
INSERT INTO `t_guiconnect` VALUES ('27', '122', '49', '11461622556895', '47', '11461622552281', '-1', '2014-06-16 22:14:33');
INSERT INTO `t_guiconnect` VALUES ('28', '122', '50', '11461622559968', '49', '11461622556895', '-1', '2014-06-16 22:14:33');
INSERT INTO `t_guiconnect` VALUES ('29', '122', '53', '11461622556895', '51', '11461622552281', '1', '2014-06-16 22:21:59');
INSERT INTO `t_guiconnect` VALUES ('30', '122', '54', '11461622559968', '53', '11461622556895', '1', '2014-06-16 22:21:59');
INSERT INTO `t_guiconnect` VALUES ('31', '123', '58', '114616224046949', '61', '114616224055453', '1', '2014-06-16 22:41:42');
INSERT INTO `t_guiconnect` VALUES ('32', '123', '60', '114616224051993', '59', '114616224050399', '1', '2014-06-16 22:41:42');
INSERT INTO `t_guiconnect` VALUES ('33', '123', '62', '114616224110704', '59', '114616224050399', '1', '2014-06-16 22:41:42');
INSERT INTO `t_guiconnect` VALUES ('34', '123', '61', '114616224055453', '60', '114616224051993', '1', '2014-06-16 22:41:42');
INSERT INTO `t_guiconnect` VALUES ('35', '127', '65', '114616233452643', '64', '114616233449167', '1', '2014-06-16 23:35:55');
INSERT INTO `t_guiconnect` VALUES ('36', '127', '66', '114616233456457', '65', '114616233452643', '1', '2014-06-16 23:35:55');
INSERT INTO `t_guiconnect` VALUES ('37', '127', '67', '1146162335045', '65', '114616233452643', '1', '2014-06-16 23:35:55');
INSERT INTO `t_guiconnect` VALUES ('38', '127', '70', '114616233512868', '66', '114616233456457', '1', '2014-06-16 23:35:55');
INSERT INTO `t_guiconnect` VALUES ('39', '127', '68', '11461623356338', '67', '1146162335045', '1', '2014-06-16 23:35:55');
INSERT INTO `t_guiconnect` VALUES ('40', '127', '69', '11461623359978', '68', '11461623356338', '1', '2014-06-16 23:35:55');
INSERT INTO `t_guiconnect` VALUES ('41', '127', '71', '114616233528553', '69', '11461623359978', '1', '2014-06-16 23:35:55');
INSERT INTO `t_guiconnect` VALUES ('42', '136', '82', '114621173145331', '80', '114621173137179', '1', '2014-06-21 17:31:49');
INSERT INTO `t_guiconnect` VALUES ('43', '0', '85', '114621173145331', '83', '114621173137179', '-1', '2014-06-21 17:34:45');
INSERT INTO `t_guiconnect` VALUES ('44', '0', '86', '114621173442462', '85', '114621173145331', '-1', '2014-06-21 17:34:45');
INSERT INTO `t_guiconnect` VALUES ('45', '141', '90', '114621173622154', '88', '114621173618266', '-1', '2014-06-21 17:36:27');
INSERT INTO `t_guiconnect` VALUES ('46', '141', '94', '114621173622154', '92', '114621173618266', '-1', '2014-06-21 17:40:43');
INSERT INTO `t_guiconnect` VALUES ('47', '141', '95', '114621174037844', '94', '114621173622154', '-1', '2014-06-21 17:40:43');
INSERT INTO `t_guiconnect` VALUES ('48', '0', '110', '114621174446465', '109', '114621174445543', '-1', '2014-06-21 17:44:50');
INSERT INTO `t_guiconnect` VALUES ('49', '146', '112', '114621174446465', '111', '114621174445543', '-1', '2014-06-21 17:45:03');
INSERT INTO `t_guiconnect` VALUES ('50', '146', '114', '114621174446465', '113', '114621174445543', '1', '2014-06-21 17:45:38');
INSERT INTO `t_guiconnect` VALUES ('51', '159', '151', '11462123137913', '149', '114621231150969', '-1', '2014-06-21 23:13:17');
INSERT INTO `t_guiconnect` VALUES ('52', '161', '167', '1146221214872', '166', '1146221213186', '-1', '2014-06-22 01:21:07');
INSERT INTO `t_guiconnect` VALUES ('53', '0', '191', '11462214722629', '190', '11462214721578', '-1', '2014-06-22 01:47:25');
INSERT INTO `t_guiconnect` VALUES ('54', '0', '194', '1146221478381', '193', '1146221477329', '1', '2014-06-22 01:47:30');
INSERT INTO `t_guiconnect` VALUES ('55', '170', '210', '11462215217286', '209', '11462215216229', '-1', '2014-06-22 01:52:22');
INSERT INTO `t_guiconnect` VALUES ('56', '169', '212', '1146221523198', '211', '11462215058439', '-1', '2014-06-22 01:52:39');
INSERT INTO `t_guiconnect` VALUES ('57', '169', '211', '11462215058439', '213', '1146221524488', '-1', '2014-06-22 01:52:39');
INSERT INTO `t_guiconnect` VALUES ('58', '169', '213', '1146221524488', '214', '11462215210473', '-1', '2014-06-22 01:52:39');
INSERT INTO `t_guiconnect` VALUES ('59', '169', '220', '1146221523198', '219', '11462215058439', '-1', '2014-06-22 01:53:44');
INSERT INTO `t_guiconnect` VALUES ('60', '169', '219', '11462215058439', '221', '1146221524488', '-1', '2014-06-22 01:53:44');
INSERT INTO `t_guiconnect` VALUES ('61', '169', '221', '1146221524488', '222', '11462215210473', '-1', '2014-06-22 01:53:44');
INSERT INTO `t_guiconnect` VALUES ('62', '169', '224', '1146221523198', '223', '11462215058439', '-1', '2014-06-22 02:14:36');
INSERT INTO `t_guiconnect` VALUES ('63', '169', '223', '11462215058439', '225', '1146221524488', '-1', '2014-06-22 02:14:36');
INSERT INTO `t_guiconnect` VALUES ('64', '169', '225', '1146221524488', '226', '11462215210473', '-1', '2014-06-22 02:14:36');
INSERT INTO `t_guiconnect` VALUES ('65', '170', '230', '11462215217286', '229', '11462215216229', '-1', '2014-06-22 02:14:46');
INSERT INTO `t_guiconnect` VALUES ('66', '169', '234', '1146221523198', '233', '11462215058439', '-1', '2014-06-22 02:14:51');
INSERT INTO `t_guiconnect` VALUES ('67', '169', '233', '11462215058439', '235', '1146221524488', '-1', '2014-06-22 02:14:51');
INSERT INTO `t_guiconnect` VALUES ('68', '169', '235', '1146221524488', '236', '11462215210473', '-1', '2014-06-22 02:14:51');
INSERT INTO `t_guiconnect` VALUES ('69', '170', '242', '11462215217286', '241', '11462215216229', '-1', '2014-06-22 02:15:11');
INSERT INTO `t_guiconnect` VALUES ('70', '169', '248', '1146221523198', '247', '11462215058439', '-1', '2014-06-22 02:15:17');
INSERT INTO `t_guiconnect` VALUES ('71', '169', '247', '11462215058439', '249', '1146221524488', '-1', '2014-06-22 02:15:17');
INSERT INTO `t_guiconnect` VALUES ('72', '169', '249', '1146221524488', '250', '11462215210473', '-1', '2014-06-22 02:15:17');
INSERT INTO `t_guiconnect` VALUES ('73', '170', '254', '11462215217286', '253', '11462215216229', '-1', '2014-06-22 22:30:32');
INSERT INTO `t_guiconnect` VALUES ('74', '170', '259', '11462215217286', '258', '11462215216229', '-1', '2014-06-22 22:30:37');
INSERT INTO `t_guiconnect` VALUES ('75', '169', '263', '1146221523198', '262', '11462215058439', '1', '2014-06-22 22:30:40');
INSERT INTO `t_guiconnect` VALUES ('76', '169', '262', '11462215058439', '264', '1146221524488', '1', '2014-06-22 22:30:40');
INSERT INTO `t_guiconnect` VALUES ('77', '169', '264', '1146221524488', '265', '11462215210473', '1', '2014-06-22 22:30:40');
INSERT INTO `t_guiconnect` VALUES ('78', '170', '271', '11462215217286', '270', '11462215216229', '1', '2014-06-22 22:33:43');

-- ----------------------------
-- Table structure for t_guijson
-- ----------------------------
DROP TABLE IF EXISTS `t_guijson`;
CREATE TABLE `t_guijson` (
  `ID` int(11) NOT NULL,
  `JSONData` text,
  `ScalN` double DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_guijson
-- ----------------------------
INSERT INTO `t_guijson` VALUES ('112', '{\"attrs\":{\"x\":100,\"y\":100,\"id\":\"painting\",\"width\":3000,\"height\":2000,\"fill\":\"#ff33ee\",\"draggable\":true},\"className\":\"Layer\",\"children\":[]}', '1');
INSERT INTO `t_guijson` VALUES ('113', '{\"attrs\":{\"x\":100,\"y\":175,\"id\":\"painting\",\"width\":3000,\"height\":2000,\"fill\":\"#ff33ee\",\"draggable\":true,\"visible\":false,\"scaleX\":1.953125,\"scaleY\":1.953125},\"className\":\"Layer\",\"children\":[{\"attrs\":{\"x\":115,\"y\":-11,\"name\":\"test3\",\"draggable\":true,\"id\":\"11463102247500\"},\"className\":\"Group\",\"children\":[{\"attrs\":{\"points\":[0,0,90,0,90,10,0,10],\"fill\":\"#FF0000\",\"stroke\":\"black\",\"name\":\"test3\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"y\":5,\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"name\":\"connPointsLeft\",\"visible\":false},\"className\":\"Circle\"},{\"attrs\":{\"x\":90,\"y\":5,\"name\":\"connPointsRight\",\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"visible\":false},\"className\":\"Circle\"}]},{\"attrs\":{\"x\":205,\"y\":-11.000000000000004,\"name\":\"test4\",\"draggable\":true,\"id\":\"11463102248665\"},\"className\":\"Group\",\"children\":[{\"attrs\":{\"points\":[0,0,90,0,90,10,0,10],\"fill\":\"#44ffee\",\"stroke\":\"black\",\"name\":\"test4\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"y\":5,\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"name\":\"connPointsLeft\",\"visible\":false},\"className\":\"Circle\"},{\"attrs\":{\"x\":90,\"y\":5,\"name\":\"connPointsRight\",\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"visible\":false},\"className\":\"Circle\"}]},{\"attrs\":{\"x\":295,\"y\":-11.000000000000002,\"name\":\"test4\",\"draggable\":true,\"id\":\"11463102253286\"},\"className\":\"Group\",\"children\":[{\"attrs\":{\"points\":[0,0,90,0,90,10,0,10],\"fill\":\"#44ffee\",\"stroke\":\"black\",\"name\":\"test4\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"y\":5,\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"name\":\"connPointsLeft\",\"visible\":false},\"className\":\"Circle\"},{\"attrs\":{\"x\":90,\"y\":5,\"name\":\"connPointsRight\",\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"visible\":false},\"className\":\"Circle\"}]}]}', '1.953125');
INSERT INTO `t_guijson` VALUES ('114', '{\"attrs\":{\"x\":-381.3908045977011,\"y\":175,\"id\":\"painting\",\"width\":3000,\"height\":2000,\"fill\":\"#ff33ee\",\"draggable\":true,\"visible\":true,\"scaleX\":2.44140625,\"scaleY\":2.44140625},\"className\":\"Layer\",\"children\":[{\"attrs\":{\"x\":23.33760000000008,\"y\":-3.660800000000017,\"name\":\"test3\",\"draggable\":true,\"id\":\"11463102314511\",\"visible\":false},\"className\":\"Group\",\"children\":[{\"attrs\":{\"points\":[0,0,90,0,90,10,0,10],\"fill\":\"#FF0000\",\"stroke\":\"black\",\"name\":\"test3\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"y\":5,\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"name\":\"connPointsLeft\",\"visible\":false},\"className\":\"Circle\"},{\"attrs\":{\"x\":90,\"y\":5,\"name\":\"connPointsRight\",\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"visible\":false},\"className\":\"Circle\"}]},{\"attrs\":{\"x\":203.33760000000012,\"y\":-3.660800000000015,\"name\":\"test3\",\"draggable\":true,\"id\":\"11463102317501\",\"visible\":true},\"className\":\"Group\",\"children\":[{\"attrs\":{\"points\":[0,0,90,0,90,10,0,10],\"fill\":\"#FF0000\",\"stroke\":\"black\",\"name\":\"test3\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"y\":5,\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"name\":\"connPointsLeft\",\"visible\":false},\"className\":\"Circle\"},{\"attrs\":{\"x\":90,\"y\":5,\"name\":\"connPointsRight\",\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"visible\":false},\"className\":\"Circle\"}]},{\"attrs\":{\"x\":113.33760000000007,\"y\":-3.660800000000016,\"name\":\"test3\",\"draggable\":true,\"id\":\"11463102319110\",\"visible\":false},\"className\":\"Group\",\"children\":[{\"attrs\":{\"points\":[0,0,90,0,90,10,0,10],\"fill\":\"#FF0000\",\"stroke\":\"black\",\"name\":\"test3\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"y\":5,\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"name\":\"connPointsLeft\",\"visible\":false},\"className\":\"Circle\"},{\"attrs\":{\"x\":90,\"y\":5,\"name\":\"connPointsRight\",\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"visible\":false},\"className\":\"Circle\"}]},{\"attrs\":{\"x\":293.3376000000001,\"y\":-3.6608000000000196,\"name\":\"test4\",\"draggable\":true,\"id\":\"1146310530487\",\"visible\":true},\"className\":\"Group\",\"children\":[{\"attrs\":{\"points\":[0,0,90,0,90,10,0,10],\"fill\":\"#44ffee\",\"stroke\":\"black\",\"name\":\"test4\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"y\":5,\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"name\":\"connPointsLeft\",\"visible\":false},\"className\":\"Circle\"},{\"attrs\":{\"x\":90,\"y\":5,\"name\":\"connPointsRight\",\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"visible\":false},\"className\":\"Circle\"}]},{\"attrs\":{\"x\":383.3376000000002,\"y\":-3.660800000000018,\"name\":\"test3\",\"draggable\":true,\"id\":\"1146310539166\",\"visible\":true},\"className\":\"Group\",\"children\":[{\"attrs\":{\"points\":[0,0,90,0,90,10,0,10],\"fill\":\"#FF0000\",\"stroke\":\"black\",\"name\":\"test3\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"y\":5,\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"name\":\"connPointsLeft\",\"visible\":false},\"className\":\"Circle\"},{\"attrs\":{\"x\":90,\"y\":5,\"name\":\"connPointsRight\",\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"visible\":false},\"className\":\"Circle\"}]},{\"attrs\":{\"x\":473.3376000000002,\"y\":-3.660800000000017,\"name\":\"test4\",\"draggable\":true,\"id\":\"11463105313185\",\"visible\":true},\"className\":\"Group\",\"children\":[{\"attrs\":{\"points\":[0,0,90,0,90,10,0,10],\"fill\":\"#44ffee\",\"stroke\":\"black\",\"name\":\"test4\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"y\":5,\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"name\":\"connPointsLeft\",\"visible\":false},\"className\":\"Circle\"},{\"attrs\":{\"x\":90,\"y\":5,\"name\":\"connPointsRight\",\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"visible\":false},\"className\":\"Circle\"}]},{\"attrs\":{\"x\":388.3376000000002,\"y\":1.3391999999999813,\"name\":\"test2\",\"draggable\":true,\"rotation\":90,\"id\":\"11463105318183\",\"visible\":true},\"className\":\"Group\",\"children\":[{\"attrs\":{\"points\":[0,0,90,0,90,10,0,10],\"fill\":\"#00FF00\",\"stroke\":\"black\",\"name\":\"test2\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"y\":5,\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"name\":\"connPointsLeft\",\"visible\":false},\"className\":\"Circle\"},{\"attrs\":{\"x\":90,\"y\":5,\"name\":\"connPointsRight\",\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"visible\":false},\"className\":\"Circle\"}]},{\"attrs\":{\"x\":383.3376000000002,\"y\":86.33919999999999,\"name\":\"test4\",\"draggable\":true,\"id\":\"11463105327802\",\"visible\":true},\"className\":\"Group\",\"children\":[{\"attrs\":{\"points\":[0,0,90,0,90,10,0,10],\"fill\":\"#44ffee\",\"stroke\":\"black\",\"name\":\"test4\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"y\":5,\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"name\":\"connPointsLeft\",\"visible\":false},\"className\":\"Circle\"},{\"attrs\":{\"x\":90,\"y\":5,\"name\":\"connPointsRight\",\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"visible\":false},\"className\":\"Circle\"}]},{\"attrs\":{\"x\":473.3376000000002,\"y\":86.3392,\"name\":\"test4\",\"draggable\":true,\"id\":\"11463105331541\",\"visible\":true},\"className\":\"Group\",\"children\":[{\"attrs\":{\"points\":[0,0,90,0,90,10,0,10],\"fill\":\"#44ffee\",\"stroke\":\"black\",\"name\":\"test4\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"y\":5,\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"name\":\"connPointsLeft\",\"visible\":false},\"className\":\"Circle\"},{\"attrs\":{\"x\":90,\"y\":5,\"name\":\"connPointsRight\",\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"visible\":false},\"className\":\"Circle\"}]}]}', '2.44140625');
INSERT INTO `t_guijson` VALUES ('115', '{\"attrs\":{\"x\":-263.81609195402297,\"y\":100,\"id\":\"painting\",\"width\":3000,\"height\":2000,\"fill\":\"#ff33ee\",\"draggable\":true,\"visible\":true,\"scaleX\":1.953125,\"scaleY\":1.953125},\"className\":\"Layer\",\"children\":[{\"attrs\":{\"x\":260,\"y\":47,\"name\":\"test2\",\"draggable\":true,\"id\":\"11461410521959\",\"visible\":true},\"className\":\"Group\",\"children\":[{\"attrs\":{\"points\":[0,0,90,0,90,10,0,10],\"fill\":\"#00FF00\",\"stroke\":\"black\",\"name\":\"test2\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"y\":5,\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"name\":\"connPointsLeft\",\"visible\":false},\"className\":\"Circle\"},{\"attrs\":{\"x\":90,\"y\":5,\"name\":\"connPointsRight\",\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"visible\":false},\"className\":\"Circle\"}]},{\"attrs\":{\"x\":310,\"y\":131,\"name\":\"test4\",\"draggable\":true,\"id\":\"114614105220317\",\"visible\":true},\"className\":\"Group\",\"children\":[{\"attrs\":{\"points\":[0,0,90,0,90,10,0,10],\"fill\":\"#44ffee\",\"stroke\":\"black\",\"name\":\"test4\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"y\":5,\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"name\":\"connPointsLeft\",\"visible\":false},\"className\":\"Circle\"},{\"attrs\":{\"x\":90,\"y\":5,\"name\":\"connPointsRight\",\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"visible\":false},\"className\":\"Circle\"}]},{\"attrs\":{\"x\":440,\"y\":47,\"name\":\"test4\",\"draggable\":true,\"id\":\"114614105229182\",\"visible\":true},\"className\":\"Group\",\"children\":[{\"attrs\":{\"points\":[0,0,90,0,90,10,0,10],\"fill\":\"#44ffee\",\"stroke\":\"black\",\"name\":\"test4\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"y\":5,\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"name\":\"connPointsLeft\",\"visible\":false},\"className\":\"Circle\"},{\"attrs\":{\"x\":90,\"y\":5,\"name\":\"connPointsRight\",\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"visible\":false},\"className\":\"Circle\"}]},{\"attrs\":{\"x\":350,\"y\":47,\"name\":\"test3\",\"draggable\":true,\"id\":\"114614105231477\",\"visible\":true},\"className\":\"Group\",\"children\":[{\"attrs\":{\"points\":[0,0,90,0,90,10,0,10],\"fill\":\"#FF0000\",\"stroke\":\"black\",\"name\":\"test3\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"y\":5,\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"name\":\"connPointsLeft\",\"visible\":false},\"className\":\"Circle\"},{\"attrs\":{\"x\":90,\"y\":5,\"name\":\"connPointsRight\",\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"visible\":false},\"className\":\"Circle\"}]},{\"attrs\":{\"x\":530,\"y\":47,\"name\":\"test2\",\"draggable\":true,\"id\":\"114614105243639\"},\"className\":\"Group\",\"children\":[{\"attrs\":{\"points\":[0,0,90,0,90,10,0,10],\"fill\":\"#00FF00\",\"stroke\":\"black\",\"name\":\"test2\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"y\":5,\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"name\":\"connPointsLeft\",\"visible\":false},\"className\":\"Circle\"},{\"attrs\":{\"x\":90,\"y\":5,\"name\":\"connPointsRight\",\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"visible\":false},\"className\":\"Circle\"}]},{\"attrs\":{\"x\":620,\"y\":47,\"name\":\"test1\",\"draggable\":true,\"id\":\"114614105247385\"},\"className\":\"Group\",\"children\":[{\"attrs\":{\"points\":[0,0,90,0,90,10,0,10],\"fill\":\"#00D2FF\",\"stroke\":\"black\",\"name\":\"test1\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"y\":5,\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"name\":\"connPointsLeft\",\"visible\":false},\"className\":\"Circle\"},{\"attrs\":{\"x\":90,\"y\":5,\"name\":\"connPointsRight\",\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"visible\":false},\"className\":\"Circle\"}]}]}', '1.953125');
INSERT INTO `t_guijson` VALUES ('116', '{\"attrs\":{\"x\":100,\"y\":100,\"id\":\"painting\",\"width\":3000,\"height\":2000,\"fill\":\"#ff33ee\",\"draggable\":true},\"className\":\"Layer\",\"children\":[]}', '1');
INSERT INTO `t_guijson` VALUES ('117', '{\"attrs\":{\"x\":100,\"y\":100,\"id\":\"painting\",\"width\":3000,\"height\":2000,\"fill\":\"#ff33ee\",\"draggable\":true},\"className\":\"Layer\",\"children\":[]}', '1');
INSERT INTO `t_guijson` VALUES ('118', '{\"attrs\":{\"x\":100,\"y\":100,\"id\":\"painting\",\"width\":3000,\"height\":2000,\"fill\":\"#ff33ee\",\"draggable\":true},\"className\":\"Layer\",\"children\":[]}', '1');
INSERT INTO `t_guijson` VALUES ('119', '{\"attrs\":{\"x\":100,\"y\":100,\"id\":\"painting\",\"width\":3000,\"height\":2000,\"fill\":\"#ff33ee\",\"draggable\":true},\"className\":\"Layer\",\"children\":[]}', '1');
INSERT INTO `t_guijson` VALUES ('120', '{\"attrs\":{\"x\":100,\"y\":100,\"id\":\"painting\",\"width\":3000,\"height\":2000,\"fill\":\"#ff33ee\",\"draggable\":true},\"className\":\"Layer\",\"children\":[]}', '1');
INSERT INTO `t_guijson` VALUES ('121', '{\"attrs\":{\"x\":100,\"y\":100,\"id\":\"painting\",\"width\":3000,\"height\":2000,\"fill\":\"#ff33ee\",\"draggable\":true,\"visible\":true},\"className\":\"Layer\",\"children\":[{\"attrs\":{\"x\":241,\"y\":-9,\"name\":\"type1\",\"draggable\":true,\"id\":\"114616205319640\"},\"className\":\"Group\",\"children\":[{\"attrs\":{\"width\":80,\"name\":\"type1\",\"height\":80},\"className\":\"Image\"},{\"attrs\":{\"y\":40,\"radius\":5,\"fill\":\"red\",\"stroke\":\"black\",\"name\":\"connPointsLeft\",\"visible\":false},\"className\":\"Circle\"}]},{\"attrs\":{\"x\":161,\"y\":-9,\"name\":\"type2\",\"draggable\":true,\"id\":\"114616205321394\"},\"className\":\"Group\",\"children\":[{\"attrs\":{\"width\":80,\"name\":\"type2\",\"height\":80},\"className\":\"Image\"},{\"attrs\":{\"y\":40,\"radius\":5,\"fill\":\"red\",\"stroke\":\"black\",\"name\":\"connPointsLeft\",\"visible\":false},\"className\":\"Circle\"},{\"attrs\":{\"x\":80,\"y\":40,\"name\":\"connPointsRight\",\"radius\":5,\"fill\":\"red\",\"stroke\":\"black\",\"visible\":false},\"className\":\"Circle\"}]},{\"attrs\":{\"x\":81,\"y\":-9,\"name\":\"type2\",\"draggable\":true,\"id\":\"114616205329672\"},\"className\":\"Group\",\"children\":[{\"attrs\":{\"width\":80,\"name\":\"type2\",\"height\":80},\"className\":\"Image\"},{\"attrs\":{\"y\":40,\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"name\":\"connPointsLeft\",\"visible\":false},\"className\":\"Circle\"},{\"attrs\":{\"x\":80,\"y\":40,\"name\":\"connPointsRight\",\"radius\":5,\"fill\":\"red\",\"stroke\":\"black\",\"visible\":false},\"className\":\"Circle\"}]},{\"attrs\":{\"x\":281,\"y\":31,\"name\":\"type3\",\"draggable\":true,\"rotation\":90,\"id\":\"114616205336123\"},\"className\":\"Group\",\"children\":[{\"attrs\":{\"width\":80,\"name\":\"type3\",\"height\":80},\"className\":\"Image\"},{\"attrs\":{\"y\":40,\"radius\":5,\"fill\":\"red\",\"stroke\":\"black\",\"name\":\"connPointsLeft\",\"visible\":false},\"className\":\"Circle\"},{\"attrs\":{\"x\":80,\"y\":40,\"name\":\"connPointsRight\",\"radius\":5,\"fill\":\"red\",\"stroke\":\"black\",\"visible\":false},\"className\":\"Circle\"}]},{\"attrs\":{\"x\":241,\"y\":71,\"name\":\"type2\",\"draggable\":true,\"id\":\"114616205345795\"},\"className\":\"Group\",\"children\":[{\"attrs\":{\"width\":80,\"name\":\"type2\",\"height\":80},\"className\":\"Image\"},{\"attrs\":{\"y\":40,\"radius\":5,\"fill\":\"red\",\"stroke\":\"black\",\"name\":\"connPointsLeft\",\"visible\":false},\"className\":\"Circle\"},{\"attrs\":{\"x\":80,\"y\":40,\"name\":\"connPointsRight\",\"radius\":5,\"fill\":\"red\",\"stroke\":\"black\",\"visible\":false},\"className\":\"Circle\"}]},{\"attrs\":{\"x\":161,\"y\":71,\"name\":\"type3\",\"draggable\":true,\"id\":\"114616205351705\"},\"className\":\"Group\",\"children\":[{\"attrs\":{\"width\":80,\"name\":\"type3\",\"height\":80},\"className\":\"Image\"},{\"attrs\":{\"y\":40,\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"name\":\"connPointsLeft\",\"visible\":false},\"className\":\"Circle\"},{\"attrs\":{\"x\":80,\"y\":40,\"name\":\"connPointsRight\",\"radius\":5,\"fill\":\"red\",\"stroke\":\"black\",\"visible\":false},\"className\":\"Circle\"}]},{\"attrs\":{\"x\":321,\"y\":71,\"name\":\"type2\",\"draggable\":true,\"id\":\"11461621108731\"},\"className\":\"Group\",\"children\":[{\"attrs\":{\"width\":80,\"name\":\"type2\",\"height\":80},\"className\":\"Image\"},{\"attrs\":{\"y\":40,\"radius\":5,\"fill\":\"red\",\"stroke\":\"black\",\"name\":\"connPointsLeft\",\"visible\":false},\"className\":\"Circle\"},{\"attrs\":{\"x\":80,\"y\":40,\"name\":\"connPointsRight\",\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"visible\":false},\"className\":\"Circle\"}]}]}', '1');
INSERT INTO `t_guijson` VALUES ('122', '{\"attrs\":{\"x\":100,\"y\":100,\"id\":\"painting\",\"width\":3000,\"height\":2000,\"fill\":\"#ff33ee\",\"draggable\":true,\"visible\":true},\"className\":\"Layer\",\"children\":[{\"attrs\":{\"x\":225,\"y\":32,\"name\":\"type2\",\"draggable\":true,\"id\":\"11461622552281\",\"visible\":true},\"className\":\"Group\",\"children\":[{\"attrs\":{\"width\":80,\"name\":\"type2\",\"height\":80},\"className\":\"Image\"},{\"attrs\":{\"y\":40,\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"name\":\"connPointsLeft\",\"visible\":true},\"className\":\"Circle\"},{\"attrs\":{\"x\":80,\"y\":40,\"name\":\"connPointsRight\",\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"visible\":true},\"className\":\"Circle\"}]},{\"attrs\":{\"x\":145,\"y\":32,\"name\":\"type0\",\"draggable\":true,\"id\":\"11461622553793\",\"visible\":true},\"className\":\"Group\",\"children\":[{\"attrs\":{\"width\":80,\"name\":\"type0\",\"height\":80},\"className\":\"Image\"},{\"attrs\":{\"x\":80,\"y\":40,\"name\":\"connPointsRight\",\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"visible\":true},\"className\":\"Circle\"}]},{\"attrs\":{\"x\":305,\"y\":32,\"name\":\"type3\",\"draggable\":true,\"id\":\"11461622556895\",\"visible\":true},\"className\":\"Group\",\"children\":[{\"attrs\":{\"width\":80,\"name\":\"type3\",\"height\":80},\"className\":\"Image\"},{\"attrs\":{\"y\":40,\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"name\":\"connPointsLeft\",\"visible\":true},\"className\":\"Circle\"},{\"attrs\":{\"x\":80,\"y\":40,\"name\":\"connPointsRight\",\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"visible\":true},\"className\":\"Circle\"}]},{\"attrs\":{\"x\":385,\"y\":32,\"name\":\"type3\",\"draggable\":true,\"id\":\"11461622559968\",\"visible\":true},\"className\":\"Group\",\"children\":[{\"attrs\":{\"width\":80,\"name\":\"type3\",\"height\":80},\"className\":\"Image\"},{\"attrs\":{\"y\":40,\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"name\":\"connPointsLeft\",\"visible\":true},\"className\":\"Circle\"},{\"attrs\":{\"x\":80,\"y\":40,\"name\":\"connPointsRight\",\"radius\":5,\"fill\":\"red\",\"stroke\":\"black\",\"visible\":true},\"className\":\"Circle\"}]},{\"attrs\":{\"x\":265,\"y\":72,\"name\":\"type2\",\"draggable\":true,\"rotation\":90,\"id\":\"114616221450545\"},\"className\":\"Group\",\"children\":[{\"attrs\":{\"width\":80,\"name\":\"type2\",\"height\":80},\"className\":\"Image\"},{\"attrs\":{\"y\":40,\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"name\":\"connPointsLeft\",\"visible\":true},\"className\":\"Circle\"},{\"attrs\":{\"x\":80,\"y\":40,\"name\":\"connPointsRight\",\"radius\":5,\"fill\":\"red\",\"stroke\":\"black\",\"visible\":true},\"className\":\"Circle\"}]},{\"attrs\":{\"x\":444,\"y\":191,\"name\":\"type0\",\"draggable\":true,\"id\":\"114616221841107\"},\"className\":\"Group\",\"children\":[{\"attrs\":{\"width\":80,\"name\":\"type0\",\"height\":80},\"className\":\"Image\"},{\"attrs\":{\"x\":80,\"y\":40,\"name\":\"connPointsRight\",\"radius\":5,\"fill\":\"red\",\"stroke\":\"black\",\"visible\":true},\"className\":\"Circle\"}]}]}', '1');
INSERT INTO `t_guijson` VALUES ('123', '{\"attrs\":{\"x\":100,\"y\":100,\"id\":\"painting\",\"width\":3000,\"height\":2000,\"fill\":\"#ff33ee\",\"draggable\":true,\"visible\":true,\"scaleX\":0.8,\"scaleY\":0.8},\"className\":\"Layer\",\"children\":[{\"attrs\":{\"x\":161,\"y\":104,\"name\":\"type0\",\"draggable\":true,\"id\":\"114616224045383\"},\"className\":\"Group\",\"children\":[{\"attrs\":{\"width\":80,\"name\":\"type0\",\"height\":80},\"className\":\"Image\"},{\"attrs\":{\"x\":80,\"y\":40,\"name\":\"connPointsRight\",\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"visible\":true},\"className\":\"Circle\"}]},{\"attrs\":{\"x\":480.99999999999994,\"y\":103.99999999999999,\"name\":\"type1\",\"draggable\":true,\"id\":\"114616224046949\"},\"className\":\"Group\",\"children\":[{\"attrs\":{\"width\":80,\"name\":\"type1\",\"height\":80},\"className\":\"Image\"},{\"attrs\":{\"y\":40,\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"name\":\"connPointsLeft\",\"visible\":true},\"className\":\"Circle\"}]},{\"attrs\":{\"x\":241,\"y\":104,\"name\":\"type2\",\"draggable\":true,\"id\":\"114616224050399\"},\"className\":\"Group\",\"children\":[{\"attrs\":{\"width\":80,\"name\":\"type2\",\"height\":80},\"className\":\"Image\"},{\"attrs\":{\"y\":40,\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"name\":\"connPointsLeft\",\"visible\":true},\"className\":\"Circle\"},{\"attrs\":{\"x\":80,\"y\":40,\"name\":\"connPointsRight\",\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"visible\":true},\"className\":\"Circle\"}]},{\"attrs\":{\"x\":321,\"y\":104,\"name\":\"type3\",\"draggable\":true,\"id\":\"114616224051993\"},\"className\":\"Group\",\"children\":[{\"attrs\":{\"width\":80,\"name\":\"type3\",\"height\":80},\"className\":\"Image\"},{\"attrs\":{\"y\":40,\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"name\":\"connPointsLeft\",\"visible\":true},\"className\":\"Circle\"},{\"attrs\":{\"x\":80,\"y\":40,\"name\":\"connPointsRight\",\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"visible\":true},\"className\":\"Circle\"}]},{\"attrs\":{\"x\":401,\"y\":104,\"name\":\"type4\",\"draggable\":true,\"id\":\"114616224055453\"},\"className\":\"Group\",\"children\":[{\"attrs\":{\"width\":80,\"name\":\"type4\",\"height\":80},\"className\":\"Image\"},{\"attrs\":{\"y\":40,\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"name\":\"connPointsLeft\",\"visible\":true},\"className\":\"Circle\"},{\"attrs\":{\"x\":80,\"y\":40,\"name\":\"connPointsRight\",\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"visible\":true},\"className\":\"Circle\"}]},{\"attrs\":{\"x\":361,\"y\":143.99999999999994,\"name\":\"type3\",\"draggable\":true,\"rotation\":90,\"id\":\"114616224110704\"},\"className\":\"Group\",\"children\":[{\"attrs\":{\"width\":80,\"name\":\"type3\",\"height\":80},\"className\":\"Image\"},{\"attrs\":{\"y\":40,\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"name\":\"connPointsLeft\",\"visible\":true},\"className\":\"Circle\"},{\"attrs\":{\"x\":80,\"y\":40,\"name\":\"connPointsRight\",\"radius\":5,\"fill\":\"red\",\"stroke\":\"black\",\"visible\":true},\"className\":\"Circle\"}]}]}', '0.8');
INSERT INTO `t_guijson` VALUES ('124', '{\"attrs\":{\"x\":100,\"y\":100,\"id\":\"painting\",\"width\":3000,\"height\":2000,\"fill\":\"#ff33ee\",\"draggable\":true},\"className\":\"Layer\",\"children\":[]}', '1');
INSERT INTO `t_guijson` VALUES ('125', '{\"attrs\":{\"x\":100,\"y\":100,\"id\":\"painting\",\"width\":3000,\"height\":2000,\"fill\":\"#ff33ee\",\"draggable\":true},\"className\":\"Layer\",\"children\":[]}', '1');
INSERT INTO `t_guijson` VALUES ('126', '{\"attrs\":{\"x\":100,\"y\":100,\"id\":\"painting\",\"width\":3000,\"height\":2000,\"fill\":\"#ff33ee\",\"draggable\":true},\"className\":\"Layer\",\"children\":[]}', '1');
INSERT INTO `t_guijson` VALUES ('127', '{\"attrs\":{\"x\":100,\"y\":100,\"id\":\"painting\",\"width\":3000,\"height\":2000,\"fill\":\"#ff33ee\",\"draggable\":true,\"visible\":true,\"scaleX\":1.5625,\"scaleY\":1.5625},\"className\":\"Layer\",\"children\":[{\"attrs\":{\"x\":113,\"y\":14,\"name\":\"type0\",\"draggable\":true,\"id\":\"114616233447300\"},\"className\":\"Group\",\"children\":[{\"attrs\":{\"width\":80,\"name\":\"type0\",\"height\":60},\"className\":\"Image\"},{\"attrs\":{\"x\":80,\"y\":30,\"name\":\"connPointsRight\",\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"visible\":true},\"className\":\"Circle\"}]},{\"attrs\":{\"x\":193,\"y\":14,\"name\":\"type2\",\"draggable\":true,\"id\":\"114616233449167\"},\"className\":\"Group\",\"children\":[{\"attrs\":{\"width\":80,\"name\":\"type2\",\"height\":60},\"className\":\"Image\"},{\"attrs\":{\"y\":30,\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"name\":\"connPointsLeft\",\"visible\":true},\"className\":\"Circle\"},{\"attrs\":{\"x\":80,\"y\":30,\"name\":\"connPointsRight\",\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"visible\":true},\"className\":\"Circle\"}]},{\"attrs\":{\"x\":273,\"y\":14,\"name\":\"type2\",\"draggable\":true,\"id\":\"114616233452643\"},\"className\":\"Group\",\"children\":[{\"attrs\":{\"width\":80,\"name\":\"type2\",\"height\":60},\"className\":\"Image\"},{\"attrs\":{\"y\":30,\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"name\":\"connPointsLeft\",\"visible\":true},\"className\":\"Circle\"},{\"attrs\":{\"x\":80,\"y\":30,\"name\":\"connPointsRight\",\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"visible\":true},\"className\":\"Circle\"}]},{\"attrs\":{\"x\":353.00000000000006,\"y\":14,\"name\":\"type3\",\"draggable\":true,\"id\":\"114616233456457\"},\"className\":\"Group\",\"children\":[{\"attrs\":{\"width\":80,\"name\":\"type3\",\"height\":60},\"className\":\"Image\"},{\"attrs\":{\"y\":30,\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"name\":\"connPointsLeft\",\"visible\":true},\"className\":\"Circle\"},{\"attrs\":{\"x\":80,\"y\":30,\"name\":\"connPointsRight\",\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"visible\":true},\"className\":\"Circle\"}]},{\"attrs\":{\"x\":383,\"y\":44,\"name\":\"type3\",\"draggable\":true,\"rotation\":90,\"id\":\"1146162335045\"},\"className\":\"Group\",\"children\":[{\"attrs\":{\"width\":80,\"name\":\"type3\",\"height\":60},\"className\":\"Image\"},{\"attrs\":{\"y\":30,\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"name\":\"connPointsLeft\",\"visible\":true},\"className\":\"Circle\"},{\"attrs\":{\"x\":80,\"y\":30,\"name\":\"connPointsRight\",\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"visible\":true},\"className\":\"Circle\"}]},{\"attrs\":{\"x\":383,\"y\":124.00000000000001,\"name\":\"type2\",\"draggable\":true,\"rotation\":90,\"id\":\"11461623356338\"},\"className\":\"Group\",\"children\":[{\"attrs\":{\"width\":80,\"name\":\"type2\",\"height\":60},\"className\":\"Image\"},{\"attrs\":{\"y\":30,\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"name\":\"connPointsLeft\",\"visible\":true},\"className\":\"Circle\"},{\"attrs\":{\"x\":80,\"y\":30,\"name\":\"connPointsRight\",\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"visible\":true},\"className\":\"Circle\"}]},{\"attrs\":{\"x\":353.00000000000006,\"y\":174,\"name\":\"type3\",\"draggable\":true,\"id\":\"11461623359978\"},\"className\":\"Group\",\"children\":[{\"attrs\":{\"width\":80,\"name\":\"type3\",\"height\":60},\"className\":\"Image\"},{\"attrs\":{\"y\":30,\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"name\":\"connPointsLeft\",\"visible\":true},\"className\":\"Circle\"},{\"attrs\":{\"x\":80,\"y\":30,\"name\":\"connPointsRight\",\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"visible\":true},\"className\":\"Circle\"}]},{\"attrs\":{\"x\":433.00000000000006,\"y\":13.999999999999998,\"name\":\"type1\",\"draggable\":true,\"id\":\"114616233512868\"},\"className\":\"Group\",\"children\":[{\"attrs\":{\"width\":80,\"name\":\"type1\",\"height\":60},\"className\":\"Image\"},{\"attrs\":{\"y\":30,\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"name\":\"connPointsLeft\",\"visible\":true},\"className\":\"Circle\"}]},{\"attrs\":{\"x\":433.0000000000001,\"y\":174,\"name\":\"type1\",\"draggable\":true,\"id\":\"114616233528553\"},\"className\":\"Group\",\"children\":[{\"attrs\":{\"width\":80,\"name\":\"type1\",\"height\":60},\"className\":\"Image\"},{\"attrs\":{\"y\":30,\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"name\":\"connPointsLeft\",\"visible\":true},\"className\":\"Circle\"}]}]}', '1.5625');
INSERT INTO `t_guijson` VALUES ('128', '{\"attrs\":{\"x\":100,\"y\":100,\"id\":\"painting\",\"width\":3000,\"height\":2000,\"fill\":\"#ff33ee\",\"draggable\":true},\"className\":\"Layer\",\"children\":[]}', '1');
INSERT INTO `t_guijson` VALUES ('129', '{\"attrs\":{\"x\":100,\"y\":100,\"id\":\"painting\",\"width\":3000,\"height\":2000,\"fill\":\"#ff33ee\",\"draggable\":true},\"className\":\"Layer\",\"children\":[]}', '1');
INSERT INTO `t_guijson` VALUES ('130', '{\"attrs\":{\"x\":100,\"y\":100,\"id\":\"painting\",\"width\":3000,\"height\":2000,\"fill\":\"#ff33ee\",\"draggable\":true},\"className\":\"Layer\",\"children\":[]}', '1');
INSERT INTO `t_guijson` VALUES ('131', '{\"attrs\":{\"x\":100,\"y\":100,\"id\":\"painting\",\"width\":3000,\"height\":2000,\"fill\":\"#ff33ee\",\"draggable\":true},\"className\":\"Layer\",\"children\":[]}', '1');
INSERT INTO `t_guijson` VALUES ('132', '{\"attrs\":{\"x\":100,\"y\":100,\"id\":\"painting\",\"width\":3000,\"height\":2000,\"fill\":\"#ff33ee\",\"draggable\":true,\"visible\":true},\"className\":\"Layer\",\"children\":[{\"attrs\":{\"x\":190,\"y\":-12,\"name\":\"type0\",\"draggable\":true,\"id\":\"11462114434866\",\"visible\":true},\"className\":\"Group\",\"children\":[{\"attrs\":{\"width\":80,\"name\":\"type0\",\"height\":60},\"className\":\"Image\"},{\"attrs\":{\"y\":32,\"points\":[60,0,80,0],\"stroke\":\"black\",\"strokeWidth\":5,\"name\":\"lineRight\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"x\":80,\"y\":30,\"name\":\"connPointsRight\",\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"visible\":true},\"className\":\"Circle\"}]},{\"attrs\":{\"x\":270,\"y\":-12,\"name\":\"type1\",\"draggable\":true,\"id\":\"114621144349192\",\"visible\":true},\"className\":\"Group\",\"children\":[{\"attrs\":{\"width\":80,\"name\":\"type1\",\"height\":60},\"className\":\"Image\"},{\"attrs\":{\"y\":32,\"points\":[0,0,20,0],\"stroke\":\"black\",\"strokeWidth\":5,\"name\":\"lineLeft\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"y\":30,\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"name\":\"connPointsLeft\",\"visible\":true},\"className\":\"Circle\"}]}]}', '1');
INSERT INTO `t_guijson` VALUES ('133', '{\"attrs\":{\"x\":100,\"y\":100,\"id\":\"painting\",\"width\":3000,\"height\":2000,\"fill\":\"#ff33ee\",\"draggable\":true},\"className\":\"Layer\",\"children\":[]}', '1');
INSERT INTO `t_guijson` VALUES ('134', '{\"attrs\":{\"x\":100,\"y\":100,\"id\":\"painting\",\"width\":3000,\"height\":2000,\"fill\":\"#ff33ee\",\"draggable\":true},\"className\":\"Layer\",\"children\":[]}', '1');
INSERT INTO `t_guijson` VALUES ('135', '{\"attrs\":{\"x\":100,\"y\":100,\"id\":\"painting\",\"width\":3000,\"height\":2000,\"fill\":\"#ff33ee\",\"draggable\":true},\"className\":\"Layer\",\"children\":[]}', '1');
INSERT INTO `t_guijson` VALUES ('136', '{\"attrs\":{\"x\":100,\"y\":100,\"id\":\"painting\",\"width\":3000,\"height\":2000,\"fill\":\"#ff33ee\",\"draggable\":true,\"visible\":true,\"scaleX\":1.25,\"scaleY\":1.25},\"className\":\"Layer\",\"children\":[{\"attrs\":{\"x\":197,\"y\":-6,\"name\":\"type2\",\"draggable\":true,\"id\":\"114621173137179\"},\"className\":\"Group\",\"children\":[{\"attrs\":{\"width\":80,\"name\":\"type2\",\"height\":60},\"className\":\"Image\"},{\"attrs\":{\"x\":60,\"y\":30,\"points\":[0,0,20,0],\"stroke\":\"black\",\"strokeWidth\":5,\"name\":\"lineRight\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"y\":30,\"points\":[0,0,20,0],\"stroke\":\"black\",\"strokeWidth\":5,\"name\":\"lineLeft\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"y\":30,\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"name\":\"connPointsLeft\",\"visible\":true},\"className\":\"Circle\"},{\"attrs\":{\"x\":80,\"y\":30,\"name\":\"connPointsRight\",\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"visible\":true},\"className\":\"Circle\"}]},{\"attrs\":{\"x\":117,\"y\":-6,\"name\":\"type0\",\"draggable\":true,\"id\":\"114621173138285\"},\"className\":\"Group\",\"children\":[{\"attrs\":{\"width\":80,\"name\":\"type0\",\"height\":60},\"className\":\"Image\"},{\"attrs\":{\"x\":60,\"y\":30,\"points\":[0,0,20,0],\"stroke\":\"black\",\"strokeWidth\":5,\"name\":\"lineRight\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"x\":80,\"y\":30,\"name\":\"connPointsRight\",\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"visible\":true},\"className\":\"Circle\"}]},{\"attrs\":{\"x\":277,\"y\":-5.9999999999999885,\"name\":\"type5\",\"draggable\":true,\"id\":\"114621173145331\"},\"className\":\"Group\",\"children\":[{\"attrs\":{\"width\":80,\"name\":\"type5\",\"height\":60},\"className\":\"Image\"},{\"attrs\":{\"x\":60,\"y\":30,\"points\":[0,0,20,0],\"stroke\":\"black\",\"strokeWidth\":5,\"name\":\"lineRight\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"y\":30,\"points\":[0,0,20,0],\"stroke\":\"black\",\"strokeWidth\":5,\"name\":\"lineLeft\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"y\":30,\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"name\":\"connPointsLeft\",\"visible\":true},\"className\":\"Circle\"},{\"attrs\":{\"x\":80,\"y\":30,\"name\":\"connPointsRight\",\"radius\":5,\"fill\":\"red\",\"stroke\":\"black\",\"visible\":true},\"className\":\"Circle\"}]}]}', '1.25');
INSERT INTO `t_guijson` VALUES ('137', '{\"attrs\":{\"x\":100,\"y\":100,\"id\":\"painting\",\"width\":3000,\"height\":2000,\"fill\":\"#ff33ee\",\"draggable\":true},\"className\":\"Layer\",\"children\":[]}', '1');
INSERT INTO `t_guijson` VALUES ('138', '{\"attrs\":{\"x\":100,\"y\":100,\"id\":\"painting\",\"width\":3000,\"height\":2000,\"fill\":\"#ff33ee\",\"draggable\":true},\"className\":\"Layer\",\"children\":[]}', '1');
INSERT INTO `t_guijson` VALUES ('139', '{\"attrs\":{\"x\":100,\"y\":100,\"id\":\"painting\",\"width\":3000,\"height\":2000,\"fill\":\"#ff33ee\",\"draggable\":true},\"className\":\"Layer\",\"children\":[]}', '1');
INSERT INTO `t_guijson` VALUES ('140', '{\"attrs\":{\"x\":100,\"y\":100,\"id\":\"painting\",\"width\":3000,\"height\":2000,\"fill\":\"#ff33ee\",\"draggable\":true},\"className\":\"Layer\",\"children\":[]}', '1');
INSERT INTO `t_guijson` VALUES ('141', '{\"attrs\":{\"x\":100,\"y\":100,\"id\":\"painting\",\"width\":3000,\"height\":2000,\"fill\":\"#ff33ee\",\"draggable\":true,\"visible\":false},\"className\":\"Layer\",\"children\":[{\"attrs\":{\"x\":229,\"y\":17,\"name\":\"type2\",\"draggable\":true,\"id\":\"11462117437840\"},\"className\":\"Group\",\"children\":[{\"attrs\":{\"width\":80,\"name\":\"type2\",\"height\":60},\"className\":\"Image\"},{\"attrs\":{\"x\":60,\"y\":30,\"points\":[0,0,20,0],\"stroke\":\"black\",\"strokeWidth\":5,\"name\":\"lineRight\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"y\":30,\"points\":[0,0,20,0],\"stroke\":\"black\",\"strokeWidth\":5,\"name\":\"lineLeft\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"y\":30,\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"name\":\"connPointsLeft\",\"visible\":true},\"className\":\"Circle\"},{\"attrs\":{\"x\":80,\"y\":30,\"name\":\"connPointsRight\",\"radius\":5,\"fill\":\"red\",\"stroke\":\"black\",\"visible\":true},\"className\":\"Circle\"}]},{\"attrs\":{\"x\":149,\"y\":17,\"name\":\"type0\",\"draggable\":true,\"id\":\"11462117439157\"},\"className\":\"Group\",\"children\":[{\"attrs\":{\"width\":80,\"name\":\"type0\",\"height\":60},\"className\":\"Image\"},{\"attrs\":{\"x\":60,\"y\":30,\"points\":[0,0,20,0],\"stroke\":\"black\",\"strokeWidth\":5,\"name\":\"lineRight\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"x\":80,\"y\":30,\"name\":\"connPointsRight\",\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"visible\":true},\"className\":\"Circle\"}]}]}', '1');
INSERT INTO `t_guijson` VALUES ('142', '{\"attrs\":{\"x\":100,\"y\":100,\"id\":\"painting\",\"width\":3000,\"height\":2000,\"fill\":\"#ff33ee\",\"draggable\":true},\"className\":\"Layer\",\"children\":[]}', '1');
INSERT INTO `t_guijson` VALUES ('143', '{\"attrs\":{\"x\":100,\"y\":100,\"id\":\"painting\",\"width\":3000,\"height\":2000,\"fill\":\"#ff33ee\",\"draggable\":true},\"className\":\"Layer\",\"children\":[]}', '1');
INSERT INTO `t_guijson` VALUES ('144', '{\"attrs\":{\"x\":100,\"y\":100,\"id\":\"painting\",\"width\":3000,\"height\":2000,\"fill\":\"#ff33ee\",\"draggable\":true},\"className\":\"Layer\",\"children\":[]}', '1');
INSERT INTO `t_guijson` VALUES ('145', '{\"attrs\":{\"x\":100,\"y\":100,\"id\":\"painting\",\"width\":3000,\"height\":2000,\"fill\":\"#ff33ee\",\"draggable\":true},\"className\":\"Layer\",\"children\":[]}', '1');
INSERT INTO `t_guijson` VALUES ('146', '{\"attrs\":{\"x\":100,\"y\":100,\"id\":\"painting\",\"width\":3000,\"height\":2000,\"fill\":\"#ff33ee\",\"draggable\":true,\"visible\":false},\"className\":\"Layer\",\"children\":[{\"attrs\":{\"x\":112,\"y\":31,\"name\":\"type2\",\"draggable\":true,\"id\":\"114621174445543\"},\"className\":\"Group\",\"children\":[{\"attrs\":{\"width\":80,\"name\":\"type2\",\"height\":60},\"className\":\"Image\"},{\"attrs\":{\"x\":60,\"y\":30,\"points\":[0,0,20,0],\"stroke\":\"black\",\"strokeWidth\":5,\"name\":\"lineRight\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"y\":30,\"points\":[0,0,20,0],\"stroke\":\"black\",\"strokeWidth\":5,\"name\":\"lineLeft\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"y\":30,\"radius\":5,\"fill\":\"red\",\"stroke\":\"black\",\"name\":\"connPointsLeft\",\"visible\":true},\"className\":\"Circle\"},{\"attrs\":{\"x\":80,\"y\":30,\"name\":\"connPointsRight\",\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"visible\":true},\"className\":\"Circle\"}]},{\"attrs\":{\"x\":192,\"y\":31,\"name\":\"type3\",\"draggable\":true,\"id\":\"114621174446465\"},\"className\":\"Group\",\"children\":[{\"attrs\":{\"width\":80,\"name\":\"type3\",\"height\":60},\"className\":\"Image\"},{\"attrs\":{\"x\":60,\"y\":30,\"points\":[0,0,20,0],\"stroke\":\"black\",\"strokeWidth\":5,\"name\":\"lineRight\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"y\":30,\"points\":[0,0,20,0],\"stroke\":\"black\",\"strokeWidth\":5,\"name\":\"lineLeft\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"y\":30,\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"name\":\"connPointsLeft\",\"visible\":true},\"className\":\"Circle\"},{\"attrs\":{\"x\":80,\"y\":30,\"name\":\"connPointsRight\",\"radius\":5,\"fill\":\"red\",\"stroke\":\"black\",\"visible\":true},\"className\":\"Circle\"}]}]}', '1');
INSERT INTO `t_guijson` VALUES ('147', '{\"attrs\":{\"x\":100,\"y\":100,\"id\":\"painting\",\"width\":3000,\"height\":2000,\"fill\":\"#ff33ee\",\"draggable\":true},\"className\":\"Layer\",\"children\":[]}', '1');
INSERT INTO `t_guijson` VALUES ('148', '{\"attrs\":{\"x\":100,\"y\":100,\"id\":\"painting\",\"width\":3000,\"height\":2000,\"fill\":\"#ff33ee\",\"draggable\":true,\"visible\":false},\"className\":\"Layer\",\"children\":[{\"attrs\":{\"x\":187,\"y\":15,\"name\":\"type2\",\"draggable\":true,\"id\":\"114621174620743\"},\"className\":\"Group\",\"children\":[{\"attrs\":{\"width\":80,\"name\":\"type2\",\"height\":60},\"className\":\"Image\"},{\"attrs\":{\"x\":60,\"y\":30,\"points\":[0,0,20,0],\"stroke\":\"black\",\"strokeWidth\":5,\"name\":\"lineRight\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"y\":30,\"points\":[0,0,20,0],\"stroke\":\"black\",\"strokeWidth\":5,\"name\":\"lineLeft\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"y\":30,\"radius\":5,\"fill\":\"red\",\"stroke\":\"black\",\"name\":\"connPointsLeft\",\"visible\":true},\"className\":\"Circle\"},{\"attrs\":{\"x\":80,\"y\":30,\"name\":\"connPointsRight\",\"radius\":5,\"fill\":\"red\",\"stroke\":\"black\",\"visible\":true},\"className\":\"Circle\"}]}]}', '1');
INSERT INTO `t_guijson` VALUES ('149', '{\"attrs\":{\"x\":100,\"y\":100,\"id\":\"painting\",\"width\":3000,\"height\":2000,\"fill\":\"#ff33ee\",\"draggable\":true},\"className\":\"Layer\",\"children\":[]}', '1');
INSERT INTO `t_guijson` VALUES ('150', '{\"attrs\":{\"x\":100,\"y\":100,\"id\":\"painting\",\"width\":3000,\"height\":2000,\"fill\":\"#ff33ee\",\"draggable\":true},\"className\":\"Layer\",\"children\":[]}', '1');
INSERT INTO `t_guijson` VALUES ('151', '{\"attrs\":{\"x\":100,\"y\":100,\"id\":\"painting\",\"width\":3000,\"height\":2000,\"fill\":\"#ff33ee\",\"draggable\":true},\"className\":\"Layer\",\"children\":[]}', '1');
INSERT INTO `t_guijson` VALUES ('152', '{\"attrs\":{\"x\":100,\"y\":100,\"id\":\"painting\",\"width\":3000,\"height\":2000,\"fill\":\"#ff33ee\",\"draggable\":true,\"visible\":false},\"className\":\"Layer\",\"children\":[{\"attrs\":{\"x\":138,\"y\":-27,\"name\":\"type2\",\"draggable\":true,\"id\":\"114621175346836\"},\"className\":\"Group\",\"children\":[{\"attrs\":{\"width\":80,\"name\":\"type2\",\"height\":60},\"className\":\"Image\"},{\"attrs\":{\"x\":60,\"y\":30,\"points\":[0,0,20,0],\"stroke\":\"black\",\"strokeWidth\":5,\"name\":\"lineRight\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"y\":30,\"points\":[0,0,20,0],\"stroke\":\"black\",\"strokeWidth\":5,\"name\":\"lineLeft\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"y\":30,\"radius\":5,\"fill\":\"red\",\"stroke\":\"black\",\"name\":\"connPointsLeft\",\"visible\":true},\"className\":\"Circle\"},{\"attrs\":{\"x\":80,\"y\":30,\"name\":\"connPointsRight\",\"radius\":5,\"fill\":\"red\",\"stroke\":\"black\",\"visible\":true},\"className\":\"Circle\"}]}]}', '1');
INSERT INTO `t_guijson` VALUES ('153', '{\"attrs\":{\"x\":100,\"y\":100,\"id\":\"painting\",\"width\":3000,\"height\":2000,\"fill\":\"#ff33ee\",\"draggable\":true,\"visible\":true},\"className\":\"Layer\",\"children\":[{\"attrs\":{\"x\":138,\"y\":-27,\"name\":\"type2\",\"draggable\":true,\"id\":\"114621175346836\"},\"className\":\"Group\",\"children\":[{\"attrs\":{\"width\":80,\"name\":\"type2\",\"height\":60},\"className\":\"Image\"},{\"attrs\":{\"x\":60,\"y\":30,\"points\":[0,0,20,0],\"stroke\":\"black\",\"strokeWidth\":5,\"name\":\"lineRight\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"y\":30,\"points\":[0,0,20,0],\"stroke\":\"black\",\"strokeWidth\":5,\"name\":\"lineLeft\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"y\":30,\"radius\":5,\"fill\":\"red\",\"stroke\":\"black\",\"name\":\"connPointsLeft\",\"visible\":true},\"className\":\"Circle\"},{\"attrs\":{\"x\":80,\"y\":30,\"name\":\"connPointsRight\",\"radius\":5,\"fill\":\"red\",\"stroke\":\"black\",\"visible\":true},\"className\":\"Circle\"}]}]}', '1');
INSERT INTO `t_guijson` VALUES ('154', '{\"attrs\":{\"x\":100,\"y\":175,\"id\":\"painting\",\"width\":3000,\"height\":2000,\"fill\":\"#ff33ee\",\"draggable\":true,\"visible\":false,\"scaleX\":0.8,\"scaleY\":0.8},\"className\":\"Layer\",\"children\":[{\"attrs\":{\"x\":143,\"y\":-18,\"name\":\"type2\",\"draggable\":true,\"id\":\"114621175531642\",\"visible\":true},\"className\":\"Group\",\"children\":[{\"attrs\":{\"width\":80,\"name\":\"type2\",\"height\":60},\"className\":\"Image\"},{\"attrs\":{\"x\":60,\"y\":30,\"points\":[0,0,20,0],\"stroke\":\"black\",\"strokeWidth\":5,\"name\":\"lineRight\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"y\":30,\"points\":[0,0,20,0],\"stroke\":\"black\",\"strokeWidth\":5,\"name\":\"lineLeft\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"y\":30,\"radius\":5,\"fill\":\"red\",\"stroke\":\"black\",\"name\":\"connPointsLeft\",\"visible\":true},\"className\":\"Circle\"},{\"attrs\":{\"x\":80,\"y\":30,\"name\":\"connPointsRight\",\"radius\":5,\"fill\":\"red\",\"stroke\":\"black\",\"visible\":true},\"className\":\"Circle\"}]},{\"attrs\":{\"x\":110.4,\"y\":-42.19999999999999,\"name\":\"type5\",\"draggable\":true,\"id\":\"11462117583245\",\"visible\":false},\"className\":\"Group\",\"children\":[{\"attrs\":{\"width\":80,\"name\":\"type5\",\"height\":60},\"className\":\"Image\"},{\"attrs\":{\"x\":60,\"y\":30,\"points\":[0,0,20,0],\"stroke\":\"black\",\"strokeWidth\":5,\"name\":\"lineRight\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"y\":30,\"points\":[0,0,20,0],\"stroke\":\"black\",\"strokeWidth\":5,\"name\":\"lineLeft\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"y\":30,\"radius\":5,\"fill\":\"red\",\"stroke\":\"black\",\"name\":\"connPointsLeft\",\"visible\":true},\"className\":\"Circle\"},{\"attrs\":{\"x\":80,\"y\":30,\"name\":\"connPointsRight\",\"radius\":5,\"fill\":\"red\",\"stroke\":\"black\",\"visible\":true},\"className\":\"Circle\"}]}]}', '0.8');
INSERT INTO `t_guijson` VALUES ('155', '{\"attrs\":{\"x\":100,\"y\":100,\"id\":\"painting\",\"width\":3000,\"height\":2000,\"fill\":\"#ff33ee\",\"draggable\":true,\"visible\":true},\"className\":\"Layer\",\"children\":[{\"attrs\":{\"x\":143,\"y\":-18,\"name\":\"type2\",\"draggable\":true,\"id\":\"114621175531642\"},\"className\":\"Group\",\"children\":[{\"attrs\":{\"width\":80,\"name\":\"type2\",\"height\":60},\"className\":\"Image\"},{\"attrs\":{\"x\":60,\"y\":30,\"points\":[0,0,20,0],\"stroke\":\"black\",\"strokeWidth\":5,\"name\":\"lineRight\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"y\":30,\"points\":[0,0,20,0],\"stroke\":\"black\",\"strokeWidth\":5,\"name\":\"lineLeft\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"y\":30,\"radius\":5,\"fill\":\"red\",\"stroke\":\"black\",\"name\":\"connPointsLeft\",\"visible\":true},\"className\":\"Circle\"},{\"attrs\":{\"x\":80,\"y\":30,\"name\":\"connPointsRight\",\"radius\":5,\"fill\":\"red\",\"stroke\":\"black\",\"visible\":true},\"className\":\"Circle\"}]}]}', '1');
INSERT INTO `t_guijson` VALUES ('156', '{\"attrs\":{\"x\":100,\"y\":100,\"id\":\"painting\",\"width\":3000,\"height\":2000,\"fill\":\"#ff33ee\",\"draggable\":true,\"visible\":false},\"className\":\"Layer\",\"children\":[{\"attrs\":{\"x\":109,\"y\":2,\"name\":\"type2\",\"draggable\":true,\"id\":\"11462118222934\"},\"className\":\"Group\",\"children\":[{\"attrs\":{\"width\":80,\"name\":\"type2\",\"height\":60},\"className\":\"Image\"},{\"attrs\":{\"x\":60,\"y\":30,\"points\":[0,0,20,0],\"stroke\":\"black\",\"strokeWidth\":5,\"name\":\"lineRight\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"y\":30,\"points\":[0,0,20,0],\"stroke\":\"black\",\"strokeWidth\":5,\"name\":\"lineLeft\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"y\":30,\"radius\":5,\"fill\":\"red\",\"stroke\":\"black\",\"name\":\"connPointsLeft\",\"visible\":true},\"className\":\"Circle\"},{\"attrs\":{\"x\":80,\"y\":30,\"name\":\"connPointsRight\",\"radius\":5,\"fill\":\"red\",\"stroke\":\"black\",\"visible\":true},\"className\":\"Circle\"}]}]}', '1');
INSERT INTO `t_guijson` VALUES ('157', '{\"attrs\":{\"x\":100,\"y\":100,\"id\":\"painting\",\"width\":3000,\"height\":2000,\"fill\":\"#ff33ee\",\"draggable\":true},\"className\":\"Layer\",\"children\":[]}', '1');
INSERT INTO `t_guijson` VALUES ('158', '{\"attrs\":{\"x\":100,\"y\":100,\"id\":\"painting\",\"width\":3000,\"height\":2000,\"fill\":\"#ff33ee\",\"draggable\":true,\"visible\":false},\"className\":\"Layer\",\"children\":[{\"attrs\":{\"x\":115,\"y\":-8,\"name\":\"type0\",\"draggable\":true,\"id\":\"114621231140235\",\"visible\":true},\"className\":\"Group\",\"children\":[{\"attrs\":{\"width\":80,\"name\":\"type0\",\"height\":60},\"className\":\"Image\"},{\"attrs\":{\"x\":60,\"y\":30,\"points\":[0,0,20,0],\"stroke\":\"black\",\"strokeWidth\":5,\"name\":\"lineRight\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"x\":80,\"y\":30,\"name\":\"connPointsRight\",\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"visible\":true},\"className\":\"Circle\"}]},{\"attrs\":{\"x\":195,\"y\":-8,\"name\":\"type2\",\"draggable\":true,\"id\":\"114621231141733\",\"visible\":true},\"className\":\"Group\",\"children\":[{\"attrs\":{\"width\":80,\"name\":\"type2\",\"height\":60},\"className\":\"Image\"},{\"attrs\":{\"x\":60,\"y\":30,\"points\":[0,0,20,0],\"stroke\":\"black\",\"strokeWidth\":5,\"name\":\"lineRight\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"y\":30,\"points\":[0,0,20,0],\"stroke\":\"black\",\"strokeWidth\":5,\"name\":\"lineLeft\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"y\":30,\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"name\":\"connPointsLeft\",\"visible\":true},\"className\":\"Circle\"},{\"attrs\":{\"x\":80,\"y\":30,\"name\":\"connPointsRight\",\"radius\":5,\"fill\":\"red\",\"stroke\":\"black\",\"visible\":true},\"className\":\"Circle\"}]},{\"attrs\":{\"x\":364,\"y\":9,\"name\":\"type5\",\"draggable\":true,\"id\":\"114621231145281\",\"visible\":true},\"className\":\"Group\",\"children\":[{\"attrs\":{\"width\":80,\"name\":\"type5\",\"height\":60},\"className\":\"Image\"},{\"attrs\":{\"x\":60,\"y\":30,\"points\":[0,0,20,0],\"stroke\":\"black\",\"strokeWidth\":5,\"name\":\"lineRight\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"y\":30,\"points\":[0,0,20,0],\"stroke\":\"black\",\"strokeWidth\":5,\"name\":\"lineLeft\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"y\":30,\"radius\":5,\"fill\":\"red\",\"stroke\":\"black\",\"name\":\"connPointsLeft\",\"visible\":true},\"className\":\"Circle\"},{\"attrs\":{\"x\":80,\"y\":30,\"name\":\"connPointsRight\",\"radius\":5,\"fill\":\"red\",\"stroke\":\"black\",\"visible\":true},\"className\":\"Circle\"}]},{\"attrs\":{\"x\":319,\"y\":150,\"name\":\"type5\",\"draggable\":true,\"id\":\"11462211442372\"},\"className\":\"Group\",\"children\":[{\"attrs\":{\"width\":80,\"name\":\"type5\",\"height\":60},\"className\":\"Image\"},{\"attrs\":{\"x\":60,\"y\":30,\"points\":[0,0,20,0],\"stroke\":\"black\",\"strokeWidth\":5,\"name\":\"lineRight\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"y\":30,\"points\":[0,0,20,0],\"stroke\":\"black\",\"strokeWidth\":5,\"name\":\"lineLeft\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"y\":30,\"radius\":5,\"fill\":\"red\",\"stroke\":\"black\",\"name\":\"connPointsLeft\",\"visible\":true},\"className\":\"Circle\"},{\"attrs\":{\"x\":80,\"y\":30,\"name\":\"connPointsRight\",\"radius\":5,\"fill\":\"red\",\"stroke\":\"black\",\"visible\":true},\"className\":\"Circle\"}]},{\"attrs\":{\"x\":271,\"y\":187,\"name\":\"type5\",\"draggable\":true,\"id\":\"1146221144451\"},\"className\":\"Group\",\"children\":[{\"attrs\":{\"width\":80,\"name\":\"type5\",\"height\":60},\"className\":\"Image\"},{\"attrs\":{\"x\":60,\"y\":30,\"points\":[0,0,20,0],\"stroke\":\"black\",\"strokeWidth\":5,\"name\":\"lineRight\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"y\":30,\"points\":[0,0,20,0],\"stroke\":\"black\",\"strokeWidth\":5,\"name\":\"lineLeft\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"y\":30,\"radius\":5,\"fill\":\"red\",\"stroke\":\"black\",\"name\":\"connPointsLeft\",\"visible\":true},\"className\":\"Circle\"},{\"attrs\":{\"x\":80,\"y\":30,\"name\":\"connPointsRight\",\"radius\":5,\"fill\":\"red\",\"stroke\":\"black\",\"visible\":true},\"className\":\"Circle\"}]}]}', '1');
INSERT INTO `t_guijson` VALUES ('159', '{\"attrs\":{\"x\":100,\"y\":100,\"id\":\"painting\",\"width\":3000,\"height\":2000,\"fill\":\"#ff33ee\",\"draggable\":true,\"visible\":false},\"className\":\"Layer\",\"children\":[{\"attrs\":{\"x\":115,\"y\":-8,\"name\":\"type0\",\"draggable\":true,\"id\":\"114621231140235\",\"visible\":true},\"className\":\"Group\",\"children\":[{\"attrs\":{\"width\":80,\"name\":\"type0\",\"height\":60},\"className\":\"Image\"},{\"attrs\":{\"x\":60,\"y\":30,\"points\":[0,0,20,0],\"stroke\":\"black\",\"strokeWidth\":5,\"name\":\"lineRight\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"x\":80,\"y\":30,\"name\":\"connPointsRight\",\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"visible\":true},\"className\":\"Circle\"}]},{\"attrs\":{\"x\":195,\"y\":-8,\"name\":\"type2\",\"draggable\":true,\"id\":\"114621231141733\",\"visible\":true},\"className\":\"Group\",\"children\":[{\"attrs\":{\"width\":80,\"name\":\"type2\",\"height\":60},\"className\":\"Image\"},{\"attrs\":{\"x\":60,\"y\":30,\"points\":[0,0,20,0],\"stroke\":\"black\",\"strokeWidth\":5,\"name\":\"lineRight\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"y\":30,\"points\":[0,0,20,0],\"stroke\":\"black\",\"strokeWidth\":5,\"name\":\"lineLeft\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"y\":30,\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"name\":\"connPointsLeft\",\"visible\":true},\"className\":\"Circle\"},{\"attrs\":{\"x\":80,\"y\":30,\"name\":\"connPointsRight\",\"radius\":5,\"fill\":\"red\",\"stroke\":\"black\",\"visible\":true},\"className\":\"Circle\"}]},{\"attrs\":{\"x\":364,\"y\":9,\"name\":\"type5\",\"draggable\":true,\"id\":\"114621231145281\",\"visible\":true},\"className\":\"Group\",\"children\":[{\"attrs\":{\"width\":80,\"name\":\"type5\",\"height\":60},\"className\":\"Image\"},{\"attrs\":{\"x\":60,\"y\":30,\"points\":[0,0,20,0],\"stroke\":\"black\",\"strokeWidth\":5,\"name\":\"lineRight\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"y\":30,\"points\":[0,0,20,0],\"stroke\":\"black\",\"strokeWidth\":5,\"name\":\"lineLeft\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"y\":30,\"radius\":5,\"fill\":\"red\",\"stroke\":\"black\",\"name\":\"connPointsLeft\",\"visible\":true},\"className\":\"Circle\"},{\"attrs\":{\"x\":80,\"y\":30,\"name\":\"connPointsRight\",\"radius\":5,\"fill\":\"red\",\"stroke\":\"black\",\"visible\":true},\"className\":\"Circle\"}]}]}', '1');
INSERT INTO `t_guijson` VALUES ('160', '{\"attrs\":{\"x\":100,\"y\":100,\"id\":\"painting\",\"width\":3000,\"height\":2000,\"fill\":\"#ff33ee\",\"draggable\":true,\"visible\":true},\"className\":\"Layer\",\"children\":[{\"attrs\":{\"x\":52,\"y\":-58,\"name\":\"type0\",\"draggable\":true,\"id\":\"1146221204386\"},\"className\":\"Group\",\"children\":[{\"attrs\":{\"width\":80,\"name\":\"type0\",\"height\":60},\"className\":\"Image\"},{\"attrs\":{\"x\":60,\"y\":30,\"points\":[0,0,20,0],\"stroke\":\"black\",\"strokeWidth\":5,\"name\":\"lineRight\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"x\":80,\"y\":30,\"name\":\"connPointsRight\",\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"visible\":true},\"className\":\"Circle\"}]},{\"attrs\":{\"x\":132,\"y\":-58,\"name\":\"type2\",\"draggable\":true,\"id\":\"11462212044498\"},\"className\":\"Group\",\"children\":[{\"attrs\":{\"width\":80,\"name\":\"type2\",\"height\":60},\"className\":\"Image\"},{\"attrs\":{\"x\":60,\"y\":30,\"points\":[0,0,20,0],\"stroke\":\"black\",\"strokeWidth\":5,\"name\":\"lineRight\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"y\":30,\"points\":[0,0,20,0],\"stroke\":\"black\",\"strokeWidth\":5,\"name\":\"lineLeft\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"y\":30,\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"name\":\"connPointsLeft\",\"visible\":true},\"className\":\"Circle\"},{\"attrs\":{\"x\":80,\"y\":30,\"name\":\"connPointsRight\",\"radius\":5,\"fill\":\"red\",\"stroke\":\"black\",\"visible\":true},\"className\":\"Circle\"}]},{\"attrs\":{\"x\":283,\"y\":31,\"name\":\"type5\",\"draggable\":true,\"id\":\"11462212052366\"},\"className\":\"Group\",\"children\":[{\"attrs\":{\"width\":80,\"name\":\"type5\",\"height\":60},\"className\":\"Image\"},{\"attrs\":{\"x\":60,\"y\":30,\"points\":[0,0,20,0],\"stroke\":\"black\",\"strokeWidth\":5,\"name\":\"lineRight\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"y\":30,\"points\":[0,0,20,0],\"stroke\":\"black\",\"strokeWidth\":5,\"name\":\"lineLeft\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"y\":30,\"radius\":5,\"fill\":\"red\",\"stroke\":\"black\",\"name\":\"connPointsLeft\",\"visible\":true},\"className\":\"Circle\"},{\"attrs\":{\"x\":80,\"y\":30,\"name\":\"connPointsRight\",\"radius\":5,\"fill\":\"red\",\"stroke\":\"black\",\"visible\":true},\"className\":\"Circle\"}]}]}', '1');
INSERT INTO `t_guijson` VALUES ('161', '{\"attrs\":{\"x\":100,\"y\":100,\"id\":\"painting\",\"width\":3000,\"height\":2000,\"fill\":\"#ff33ee\",\"draggable\":true,\"visible\":false},\"className\":\"Layer\",\"children\":[{\"attrs\":{\"x\":52,\"y\":-58,\"name\":\"type0\",\"draggable\":true,\"id\":\"1146221204386\",\"visible\":true},\"className\":\"Group\",\"children\":[{\"attrs\":{\"width\":80,\"name\":\"type0\",\"height\":60},\"className\":\"Image\"},{\"attrs\":{\"x\":60,\"y\":30,\"points\":[0,0,20,0],\"stroke\":\"black\",\"strokeWidth\":5,\"name\":\"lineRight\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"x\":80,\"y\":30,\"name\":\"connPointsRight\",\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"visible\":true},\"className\":\"Circle\"}]},{\"attrs\":{\"x\":132,\"y\":-58,\"name\":\"type2\",\"draggable\":true,\"id\":\"11462212044498\",\"visible\":true},\"className\":\"Group\",\"children\":[{\"attrs\":{\"width\":80,\"name\":\"type2\",\"height\":60},\"className\":\"Image\"},{\"attrs\":{\"x\":60,\"y\":30,\"points\":[0,0,20,0],\"stroke\":\"black\",\"strokeWidth\":5,\"name\":\"lineRight\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"y\":30,\"points\":[0,0,20,0],\"stroke\":\"black\",\"strokeWidth\":5,\"name\":\"lineLeft\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"y\":30,\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"name\":\"connPointsLeft\",\"visible\":true},\"className\":\"Circle\"},{\"attrs\":{\"x\":80,\"y\":30,\"name\":\"connPointsRight\",\"radius\":5,\"fill\":\"red\",\"stroke\":\"black\",\"visible\":true},\"className\":\"Circle\"}]},{\"attrs\":{\"x\":283,\"y\":31,\"name\":\"type5\",\"draggable\":true,\"id\":\"11462212052366\",\"visible\":true},\"className\":\"Group\",\"children\":[{\"attrs\":{\"width\":80,\"name\":\"type5\",\"height\":60},\"className\":\"Image\"},{\"attrs\":{\"x\":60,\"y\":30,\"points\":[0,0,20,0],\"stroke\":\"black\",\"strokeWidth\":5,\"name\":\"lineRight\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"y\":30,\"points\":[0,0,20,0],\"stroke\":\"black\",\"strokeWidth\":5,\"name\":\"lineLeft\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"y\":30,\"radius\":5,\"fill\":\"red\",\"stroke\":\"black\",\"name\":\"connPointsLeft\",\"visible\":true},\"className\":\"Circle\"},{\"attrs\":{\"x\":80,\"y\":30,\"name\":\"connPointsRight\",\"radius\":5,\"fill\":\"red\",\"stroke\":\"black\",\"visible\":true},\"className\":\"Circle\"}]}]}', '1');
INSERT INTO `t_guijson` VALUES ('162', '{\"attrs\":{\"x\":100,\"y\":100,\"id\":\"painting\",\"width\":3000,\"height\":2000,\"fill\":\"#ff33ee\",\"draggable\":true,\"visible\":true},\"className\":\"Layer\",\"children\":[{\"attrs\":{\"x\":215,\"y\":-14,\"name\":\"type5\",\"draggable\":true,\"id\":\"11462212831431\"},\"className\":\"Group\",\"children\":[{\"attrs\":{\"width\":80,\"name\":\"type5\",\"height\":60},\"className\":\"Image\"},{\"attrs\":{\"x\":60,\"y\":30,\"points\":[0,0,20,0],\"stroke\":\"black\",\"strokeWidth\":5,\"name\":\"lineRight\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"y\":30,\"points\":[0,0,20,0],\"stroke\":\"black\",\"strokeWidth\":5,\"name\":\"lineLeft\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"y\":30,\"radius\":5,\"fill\":\"red\",\"stroke\":\"black\",\"name\":\"connPointsLeft\",\"visible\":true},\"className\":\"Circle\"},{\"attrs\":{\"x\":80,\"y\":30,\"name\":\"connPointsRight\",\"radius\":5,\"fill\":\"red\",\"stroke\":\"black\",\"visible\":true},\"className\":\"Circle\"}]}]}', '1');
INSERT INTO `t_guijson` VALUES ('163', '{\"attrs\":{\"x\":100,\"y\":100,\"id\":\"painting\",\"width\":3000,\"height\":2000,\"fill\":\"#ff33ee\",\"draggable\":true,\"visible\":false},\"className\":\"Layer\",\"children\":[{\"attrs\":{\"x\":215,\"y\":-14,\"name\":\"type5\",\"draggable\":true,\"id\":\"11462212831431\",\"visible\":true},\"className\":\"Group\",\"children\":[{\"attrs\":{\"width\":80,\"name\":\"type5\",\"height\":60},\"className\":\"Image\"},{\"attrs\":{\"x\":60,\"y\":30,\"points\":[0,0,20,0],\"stroke\":\"black\",\"strokeWidth\":5,\"name\":\"lineRight\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"y\":30,\"points\":[0,0,20,0],\"stroke\":\"black\",\"strokeWidth\":5,\"name\":\"lineLeft\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"y\":30,\"radius\":5,\"fill\":\"red\",\"stroke\":\"black\",\"name\":\"connPointsLeft\",\"visible\":true},\"className\":\"Circle\"},{\"attrs\":{\"x\":80,\"y\":30,\"name\":\"connPointsRight\",\"radius\":5,\"fill\":\"red\",\"stroke\":\"black\",\"visible\":true},\"className\":\"Circle\"}]}]}', '1');
INSERT INTO `t_guijson` VALUES ('164', '{\"attrs\":{\"x\":100,\"y\":100,\"id\":\"painting\",\"width\":3000,\"height\":2000,\"fill\":\"#ff33ee\",\"draggable\":true,\"visible\":true},\"className\":\"Layer\",\"children\":[{\"attrs\":{\"x\":187,\"y\":19,\"name\":\"type5\",\"draggable\":true,\"id\":\"11462213133814\",\"visible\":true},\"className\":\"Group\",\"children\":[{\"attrs\":{\"width\":80,\"name\":\"type5\",\"height\":60},\"className\":\"Image\"},{\"attrs\":{\"x\":60,\"y\":30,\"points\":[0,0,20,0],\"stroke\":\"black\",\"strokeWidth\":5,\"name\":\"lineRight\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"y\":30,\"points\":[0,0,20,0],\"stroke\":\"black\",\"strokeWidth\":5,\"name\":\"lineLeft\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"y\":30,\"radius\":5,\"fill\":\"red\",\"stroke\":\"black\",\"name\":\"connPointsLeft\",\"visible\":true},\"className\":\"Circle\"},{\"attrs\":{\"x\":80,\"y\":30,\"name\":\"connPointsRight\",\"radius\":5,\"fill\":\"red\",\"stroke\":\"black\",\"visible\":true},\"className\":\"Circle\"}]}]}', '1');
INSERT INTO `t_guijson` VALUES ('165', '{\"attrs\":{\"x\":100,\"y\":100,\"id\":\"painting\",\"width\":3000,\"height\":2000,\"fill\":\"#ff33ee\",\"draggable\":true,\"visible\":false},\"className\":\"Layer\",\"children\":[{\"attrs\":{\"x\":187,\"y\":19,\"name\":\"type5\",\"draggable\":true,\"id\":\"11462213133814\",\"visible\":true},\"className\":\"Group\",\"children\":[{\"attrs\":{\"width\":80,\"name\":\"type5\",\"height\":60},\"className\":\"Image\"},{\"attrs\":{\"x\":60,\"y\":30,\"points\":[0,0,20,0],\"stroke\":\"black\",\"strokeWidth\":5,\"name\":\"lineRight\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"y\":30,\"points\":[0,0,20,0],\"stroke\":\"black\",\"strokeWidth\":5,\"name\":\"lineLeft\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"y\":30,\"radius\":5,\"fill\":\"red\",\"stroke\":\"black\",\"name\":\"connPointsLeft\",\"visible\":true},\"className\":\"Circle\"},{\"attrs\":{\"x\":80,\"y\":30,\"name\":\"connPointsRight\",\"radius\":5,\"fill\":\"red\",\"stroke\":\"black\",\"visible\":true},\"className\":\"Circle\"}]}]}', '1');
INSERT INTO `t_guijson` VALUES ('166', '{\"attrs\":{\"x\":100,\"y\":100,\"id\":\"painting\",\"width\":3000,\"height\":2000,\"fill\":\"#ff33ee\",\"draggable\":true},\"className\":\"Layer\",\"children\":[]}', '1');
INSERT INTO `t_guijson` VALUES ('167', '{\"attrs\":{\"x\":100,\"y\":100,\"id\":\"painting\",\"width\":3000,\"height\":2000,\"fill\":\"#ff33ee\",\"draggable\":true},\"className\":\"Layer\",\"children\":[]}', '1');
INSERT INTO `t_guijson` VALUES ('168', '{\"attrs\":{\"x\":100,\"y\":100,\"id\":\"painting\",\"width\":3000,\"height\":2000,\"fill\":\"#ff33ee\",\"draggable\":true,\"visible\":false},\"className\":\"Layer\",\"children\":[{\"attrs\":{\"x\":70,\"name\":\"type0\",\"draggable\":true,\"id\":\"11462215048753\",\"visible\":true},\"className\":\"Group\",\"children\":[{\"attrs\":{\"width\":80,\"name\":\"type0\",\"height\":60},\"className\":\"Image\"},{\"attrs\":{\"x\":60,\"y\":30,\"points\":[0,0,20,0],\"stroke\":\"black\",\"strokeWidth\":5,\"name\":\"lineRight\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"x\":80,\"y\":30,\"name\":\"connPointsRight\",\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"visible\":true},\"className\":\"Circle\"}]},{\"attrs\":{\"x\":150,\"name\":\"type5\",\"draggable\":true,\"id\":\"1146221505034\",\"visible\":true},\"className\":\"Group\",\"children\":[{\"attrs\":{\"width\":80,\"name\":\"type5\",\"height\":60},\"className\":\"Image\"},{\"attrs\":{\"x\":60,\"y\":30,\"points\":[0,0,20,0],\"stroke\":\"black\",\"strokeWidth\":5,\"name\":\"lineRight\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"y\":30,\"points\":[0,0,20,0],\"stroke\":\"black\",\"strokeWidth\":5,\"name\":\"lineLeft\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"y\":30,\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"name\":\"connPointsLeft\",\"visible\":true},\"className\":\"Circle\"},{\"attrs\":{\"x\":80,\"y\":30,\"name\":\"connPointsRight\",\"radius\":5,\"fill\":\"red\",\"stroke\":\"black\",\"visible\":true},\"className\":\"Circle\"}]}]}', '1');
INSERT INTO `t_guijson` VALUES ('169', '{\"attrs\":{\"x\":100,\"y\":100,\"id\":\"painting\",\"width\":3000,\"height\":2000,\"fill\":\"#ff33ee\",\"draggable\":true,\"visible\":false},\"className\":\"Layer\",\"children\":[{\"attrs\":{\"x\":355,\"y\":2,\"name\":\"type2\",\"draggable\":true,\"id\":\"11462215058439\",\"visible\":true},\"className\":\"Group\",\"children\":[{\"attrs\":{\"width\":80,\"name\":\"type2\",\"height\":60},\"className\":\"Image\"},{\"attrs\":{\"x\":60,\"y\":30,\"points\":[0,0,20,0],\"stroke\":\"black\",\"strokeWidth\":5,\"name\":\"lineRight\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"y\":30,\"points\":[0,0,20,0],\"stroke\":\"black\",\"strokeWidth\":5,\"name\":\"lineLeft\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"y\":30,\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"name\":\"connPointsLeft\",\"visible\":true},\"className\":\"Circle\"},{\"attrs\":{\"x\":80,\"y\":30,\"name\":\"connPointsRight\",\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"visible\":true},\"className\":\"Circle\"}]},{\"attrs\":{\"x\":435,\"y\":2,\"name\":\"type1\",\"draggable\":true,\"id\":\"1146221523198\",\"visible\":true},\"className\":\"Group\",\"children\":[{\"attrs\":{\"width\":80,\"name\":\"type1\",\"height\":60},\"className\":\"Image\"},{\"attrs\":{\"y\":30,\"points\":[0,0,20,0],\"stroke\":\"black\",\"strokeWidth\":5,\"name\":\"lineLeft\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"y\":30,\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"name\":\"connPointsLeft\",\"visible\":true},\"className\":\"Circle\"}]},{\"attrs\":{\"x\":275,\"y\":2,\"name\":\"type2\",\"draggable\":true,\"id\":\"1146221524488\",\"visible\":true},\"className\":\"Group\",\"children\":[{\"attrs\":{\"width\":80,\"name\":\"type2\",\"height\":60},\"className\":\"Image\"},{\"attrs\":{\"x\":60,\"y\":30,\"points\":[0,0,20,0],\"stroke\":\"black\",\"strokeWidth\":5,\"name\":\"lineRight\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"y\":30,\"points\":[0,0,20,0],\"stroke\":\"black\",\"strokeWidth\":5,\"name\":\"lineLeft\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"y\":30,\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"name\":\"connPointsLeft\",\"visible\":true},\"className\":\"Circle\"},{\"attrs\":{\"x\":80,\"y\":30,\"name\":\"connPointsRight\",\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"visible\":true},\"className\":\"Circle\"}]},{\"attrs\":{\"x\":195,\"y\":2,\"name\":\"type5\",\"draggable\":true,\"id\":\"11462215210473\",\"visible\":true},\"className\":\"Group\",\"children\":[{\"attrs\":{\"width\":80,\"name\":\"type5\",\"height\":60},\"className\":\"Image\"},{\"attrs\":{\"x\":60,\"y\":30,\"points\":[0,0,20,0],\"stroke\":\"black\",\"strokeWidth\":5,\"name\":\"lineRight\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"y\":30,\"points\":[0,0,20,0],\"stroke\":\"black\",\"strokeWidth\":5,\"name\":\"lineLeft\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"y\":30,\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"name\":\"connPointsLeft\",\"visible\":true},\"className\":\"Circle\"},{\"attrs\":{\"x\":80,\"y\":30,\"name\":\"connPointsRight\",\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"visible\":true},\"className\":\"Circle\"}]},{\"attrs\":{\"x\":115,\"y\":2,\"name\":\"type0\",\"draggable\":true,\"id\":\"11462221433979\",\"visible\":true},\"className\":\"Group\",\"children\":[{\"attrs\":{\"width\":80,\"name\":\"type0\",\"height\":60},\"className\":\"Image\"},{\"attrs\":{\"x\":60,\"y\":30,\"points\":[0,0,20,0],\"stroke\":\"black\",\"strokeWidth\":5,\"name\":\"lineRight\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"x\":80,\"y\":30,\"name\":\"connPointsRight\",\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"visible\":true},\"className\":\"Circle\"}]}]}', '1');
INSERT INTO `t_guijson` VALUES ('170', '{\"attrs\":{\"x\":100,\"y\":100,\"id\":\"painting\",\"width\":3000,\"height\":2000,\"fill\":\"#ff33ee\",\"draggable\":true,\"visible\":true},\"className\":\"Layer\",\"children\":[{\"attrs\":{\"x\":57,\"y\":26,\"name\":\"type0\",\"draggable\":true,\"id\":\"11462215215436\",\"visible\":true},\"className\":\"Group\",\"children\":[{\"attrs\":{\"width\":80,\"name\":\"type0\",\"height\":60},\"className\":\"Image\"},{\"attrs\":{\"x\":60,\"y\":30,\"points\":[0,0,20,0],\"stroke\":\"black\",\"strokeWidth\":5,\"name\":\"lineRight\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"x\":80,\"y\":30,\"name\":\"connPointsRight\",\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"visible\":true},\"className\":\"Circle\"}]},{\"attrs\":{\"x\":137,\"y\":26,\"name\":\"type2\",\"draggable\":true,\"id\":\"11462215216229\",\"visible\":true},\"className\":\"Group\",\"children\":[{\"attrs\":{\"width\":80,\"name\":\"type2\",\"height\":60},\"className\":\"Image\"},{\"attrs\":{\"x\":60,\"y\":30,\"points\":[0,0,20,0],\"stroke\":\"black\",\"strokeWidth\":5,\"name\":\"lineRight\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"y\":30,\"points\":[0,0,20,0],\"stroke\":\"black\",\"strokeWidth\":5,\"name\":\"lineLeft\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"y\":30,\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"name\":\"connPointsLeft\",\"visible\":true},\"className\":\"Circle\"},{\"attrs\":{\"x\":80,\"y\":30,\"name\":\"connPointsRight\",\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"visible\":true},\"className\":\"Circle\"}]},{\"attrs\":{\"x\":217,\"y\":26,\"name\":\"type1\",\"draggable\":true,\"id\":\"11462215217286\",\"visible\":true},\"className\":\"Group\",\"children\":[{\"attrs\":{\"width\":80,\"name\":\"type1\",\"height\":60},\"className\":\"Image\"},{\"attrs\":{\"y\":30,\"points\":[0,0,20,0],\"stroke\":\"black\",\"strokeWidth\":5,\"name\":\"lineLeft\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"y\":30,\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"name\":\"connPointsLeft\",\"visible\":true},\"className\":\"Circle\"}]},{\"attrs\":{\"x\":164,\"y\":124,\"name\":\"type2\",\"draggable\":true,\"id\":\"11462221441545\",\"visible\":true},\"className\":\"Group\",\"children\":[{\"attrs\":{\"width\":80,\"name\":\"type2\",\"height\":60},\"className\":\"Image\"},{\"attrs\":{\"x\":60,\"y\":30,\"points\":[0,0,20,0],\"stroke\":\"black\",\"strokeWidth\":5,\"name\":\"lineRight\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"y\":30,\"points\":[0,0,20,0],\"stroke\":\"black\",\"strokeWidth\":5,\"name\":\"lineLeft\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"y\":30,\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"name\":\"connPointsLeft\",\"visible\":true},\"className\":\"Circle\"},{\"attrs\":{\"x\":80,\"y\":30,\"name\":\"connPointsRight\",\"radius\":5,\"fill\":\"red\",\"stroke\":\"black\",\"visible\":true},\"className\":\"Circle\"}]},{\"attrs\":{\"x\":84,\"y\":124,\"name\":\"type0\",\"draggable\":true,\"id\":\"11462221442622\",\"visible\":true},\"className\":\"Group\",\"children\":[{\"attrs\":{\"width\":80,\"name\":\"type0\",\"height\":60},\"className\":\"Image\"},{\"attrs\":{\"x\":60,\"y\":30,\"points\":[0,0,20,0],\"stroke\":\"black\",\"strokeWidth\":5,\"name\":\"lineRight\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"x\":80,\"y\":30,\"name\":\"connPointsRight\",\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"visible\":true},\"className\":\"Circle\"}]}]}', '1');
INSERT INTO `t_guijson` VALUES ('171', '{\"attrs\":{\"x\":100,\"y\":100,\"id\":\"painting\",\"width\":3000,\"height\":2000,\"fill\":\"#ff33ee\",\"draggable\":true},\"className\":\"Layer\",\"children\":[]}', '1');
INSERT INTO `t_guijson` VALUES ('172', '{\"attrs\":{\"x\":100,\"y\":100,\"id\":\"painting\",\"width\":3000,\"height\":2000,\"fill\":\"#ff33ee\",\"draggable\":true},\"className\":\"Layer\",\"children\":[]}', '1');
INSERT INTO `t_guijson` VALUES ('173', '{\"attrs\":{\"x\":100,\"y\":100,\"id\":\"painting\",\"width\":3000,\"height\":2000,\"fill\":\"#ff33ee\",\"draggable\":true},\"className\":\"Layer\",\"children\":[]}', '1');

-- ----------------------------
-- Table structure for t_guipoint
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
) ENGINE=InnoDB AUTO_INCREMENT=276 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_guipoint
-- ----------------------------
INSERT INTO `t_guipoint` VALUES ('1', '113', '11463101743266', '2', 'test3', '-1', '2014-06-03 10:18:44');
INSERT INTO `t_guipoint` VALUES ('2', '113', '11463101744996', '2', 'test4', '-1', '2014-06-03 10:18:44');
INSERT INTO `t_guipoint` VALUES ('3', '113', '11463101747180', '2', 'test4', '-1', '2014-06-03 10:18:44');
INSERT INTO `t_guipoint` VALUES ('4', '113', '11463101743266', '2', 'test3', '-1', '2014-06-03 10:19:02');
INSERT INTO `t_guipoint` VALUES ('5', '113', '11463101744996', '2', 'test4', '-1', '2014-06-03 10:19:02');
INSERT INTO `t_guipoint` VALUES ('6', '113', '11463101747180', '2', 'test4', '-1', '2014-06-03 10:19:02');
INSERT INTO `t_guipoint` VALUES ('7', '114', '11463102247500', '2', 'test3', '-1', '2014-06-03 10:22:57');
INSERT INTO `t_guipoint` VALUES ('8', '114', '11463102248665', '2', 'test4', '-1', '2014-06-03 10:22:57');
INSERT INTO `t_guipoint` VALUES ('9', '114', '11463102253286', '2', 'test4', '-1', '2014-06-03 10:22:57');
INSERT INTO `t_guipoint` VALUES ('10', '114', '11463102314511', '2', 'test3', '-1', '2014-06-03 10:23:24');
INSERT INTO `t_guipoint` VALUES ('11', '114', '11463102317501', '2', 'test3', '-1', '2014-06-03 10:23:24');
INSERT INTO `t_guipoint` VALUES ('12', '114', '11463102319110', '2', 'test3', '-1', '2014-06-03 10:23:24');
INSERT INTO `t_guipoint` VALUES ('13', '113', '11463102247500', '2', 'test3', '1', '2014-06-03 10:23:03');
INSERT INTO `t_guipoint` VALUES ('14', '113', '11463102248665', '2', 'test4', '1', '2014-06-03 10:23:03');
INSERT INTO `t_guipoint` VALUES ('15', '113', '11463102253286', '2', 'test4', '1', '2014-06-03 10:23:03');
INSERT INTO `t_guipoint` VALUES ('16', '114', '11463102314511', '2', 'test3', '-1', '2014-06-03 10:24:03');
INSERT INTO `t_guipoint` VALUES ('17', '114', '11463102317501', '2', 'test3', '-1', '2014-06-03 10:24:03');
INSERT INTO `t_guipoint` VALUES ('18', '114', '11463102319110', '2', 'test3', '-1', '2014-06-03 10:24:03');
INSERT INTO `t_guipoint` VALUES ('19', '114', '11463102314511', '2', 'test3', '1', '2014-06-03 10:53:41');
INSERT INTO `t_guipoint` VALUES ('20', '114', '11463102317501', '2', 'test3', '1', '2014-06-03 10:53:41');
INSERT INTO `t_guipoint` VALUES ('21', '114', '11463102319110', '2', 'test3', '1', '2014-06-03 10:53:41');
INSERT INTO `t_guipoint` VALUES ('22', '114', '1146310530487', '2', 'test4', '1', '2014-06-03 10:53:41');
INSERT INTO `t_guipoint` VALUES ('23', '114', '1146310539166', '2', 'test3', '1', '2014-06-03 10:53:41');
INSERT INTO `t_guipoint` VALUES ('24', '114', '11463105313185', '2', 'test4', '1', '2014-06-03 10:53:41');
INSERT INTO `t_guipoint` VALUES ('25', '114', '11463105318183', '2', 'test2', '1', '2014-06-03 10:53:41');
INSERT INTO `t_guipoint` VALUES ('26', '114', '11463105327802', '2', 'test4', '1', '2014-06-03 10:53:41');
INSERT INTO `t_guipoint` VALUES ('27', '114', '11463105331541', '2', 'test4', '1', '2014-06-03 10:53:41');
INSERT INTO `t_guipoint` VALUES ('28', '115', '11461410521959', '2', 'test2', '-1', '2014-06-14 10:52:25');
INSERT INTO `t_guipoint` VALUES ('29', '115', '114614105220317', '2', 'test4', '-1', '2014-06-14 10:52:25');
INSERT INTO `t_guipoint` VALUES ('30', '115', '11461410521959', '2', 'test2', '1', '2014-06-14 10:52:56');
INSERT INTO `t_guipoint` VALUES ('31', '115', '114614105220317', '2', 'test4', '1', '2014-06-14 10:52:56');
INSERT INTO `t_guipoint` VALUES ('32', '115', '114614105229182', '2', 'test4', '1', '2014-06-14 10:52:56');
INSERT INTO `t_guipoint` VALUES ('33', '115', '114614105231477', '2', 'test3', '1', '2014-06-14 10:52:56');
INSERT INTO `t_guipoint` VALUES ('34', '115', '114614105243639', '2', 'test2', '1', '2014-06-14 10:52:56');
INSERT INTO `t_guipoint` VALUES ('35', '115', '114614105247385', '1', 'test1', '1', '2014-06-14 10:52:56');
INSERT INTO `t_guipoint` VALUES ('36', '121', '114616205319640', '2', 'type1', '1', '2014-06-16 21:10:19');
INSERT INTO `t_guipoint` VALUES ('37', '121', '114616205321394', '2', 'type2', '1', '2014-06-16 21:10:19');
INSERT INTO `t_guipoint` VALUES ('38', '121', '114616205329672', '2', 'type2', '1', '2014-06-16 21:10:19');
INSERT INTO `t_guipoint` VALUES ('39', '121', '114616205336123', '2', 'type3', '1', '2014-06-16 21:10:19');
INSERT INTO `t_guipoint` VALUES ('40', '121', '114616205345795', '2', 'type2', '1', '2014-06-16 21:10:19');
INSERT INTO `t_guipoint` VALUES ('41', '121', '114616205351705', '2', 'type3', '1', '2014-06-16 21:10:19');
INSERT INTO `t_guipoint` VALUES ('42', '121', '11461621108731', '2', 'type2', '1', '2014-06-16 21:10:19');
INSERT INTO `t_guipoint` VALUES ('43', '122', '11461622552281', '2', 'type2', '-1', '2014-06-16 22:08:24');
INSERT INTO `t_guipoint` VALUES ('44', '122', '11461622553793', '2', 'type0', '-1', '2014-06-16 22:08:24');
INSERT INTO `t_guipoint` VALUES ('45', '122', '11461622556895', '2', 'type3', '-1', '2014-06-16 22:08:24');
INSERT INTO `t_guipoint` VALUES ('46', '122', '11461622559968', '2', 'type3', '-1', '2014-06-16 22:08:24');
INSERT INTO `t_guipoint` VALUES ('47', '122', '11461622552281', '2', 'type2', '-1', '2014-06-16 22:14:33');
INSERT INTO `t_guipoint` VALUES ('48', '122', '11461622553793', '2', 'type0', '-1', '2014-06-16 22:14:33');
INSERT INTO `t_guipoint` VALUES ('49', '122', '11461622556895', '2', 'type3', '-1', '2014-06-16 22:14:33');
INSERT INTO `t_guipoint` VALUES ('50', '122', '11461622559968', '2', 'type3', '-1', '2014-06-16 22:14:33');
INSERT INTO `t_guipoint` VALUES ('51', '122', '11461622552281', '2', 'type2', '1', '2014-06-16 22:21:59');
INSERT INTO `t_guipoint` VALUES ('52', '122', '11461622553793', '2', 'type0', '1', '2014-06-16 22:21:59');
INSERT INTO `t_guipoint` VALUES ('53', '122', '11461622556895', '2', 'type3', '1', '2014-06-16 22:21:59');
INSERT INTO `t_guipoint` VALUES ('54', '122', '11461622559968', '2', 'type3', '1', '2014-06-16 22:21:59');
INSERT INTO `t_guipoint` VALUES ('55', '122', '114616221450545', '2', 'type2', '1', '2014-06-16 22:21:59');
INSERT INTO `t_guipoint` VALUES ('56', '122', '114616221841107', '2', 'type0', '1', '2014-06-16 22:21:59');
INSERT INTO `t_guipoint` VALUES ('57', '123', '114616224045383', '2', 'type0', '1', '2014-06-16 22:41:42');
INSERT INTO `t_guipoint` VALUES ('58', '123', '114616224046949', '2', 'type1', '1', '2014-06-16 22:41:42');
INSERT INTO `t_guipoint` VALUES ('59', '123', '114616224050399', '2', 'type2', '1', '2014-06-16 22:41:42');
INSERT INTO `t_guipoint` VALUES ('60', '123', '114616224051993', '2', 'type3', '1', '2014-06-16 22:41:42');
INSERT INTO `t_guipoint` VALUES ('61', '123', '114616224055453', '2', 'type4', '1', '2014-06-16 22:41:42');
INSERT INTO `t_guipoint` VALUES ('62', '123', '114616224110704', '2', 'type3', '1', '2014-06-16 22:41:42');
INSERT INTO `t_guipoint` VALUES ('63', '127', '114616233447300', '2', 'type0', '1', '2014-06-16 23:35:55');
INSERT INTO `t_guipoint` VALUES ('64', '127', '114616233449167', '2', 'type2', '1', '2014-06-16 23:35:55');
INSERT INTO `t_guipoint` VALUES ('65', '127', '114616233452643', '2', 'type2', '1', '2014-06-16 23:35:55');
INSERT INTO `t_guipoint` VALUES ('66', '127', '114616233456457', '2', 'type3', '1', '2014-06-16 23:35:55');
INSERT INTO `t_guipoint` VALUES ('67', '127', '1146162335045', '2', 'type3', '1', '2014-06-16 23:35:55');
INSERT INTO `t_guipoint` VALUES ('68', '127', '11461623356338', '2', 'type2', '1', '2014-06-16 23:35:55');
INSERT INTO `t_guipoint` VALUES ('69', '127', '11461623359978', '2', 'type3', '1', '2014-06-16 23:35:55');
INSERT INTO `t_guipoint` VALUES ('70', '127', '114616233512868', '2', 'type1', '1', '2014-06-16 23:35:55');
INSERT INTO `t_guipoint` VALUES ('71', '127', '114616233528553', '2', 'type1', '1', '2014-06-16 23:35:55');
INSERT INTO `t_guipoint` VALUES ('72', '132', '11462114434866', '2', 'type0', '-1', '2014-06-21 14:44:02');
INSERT INTO `t_guipoint` VALUES ('73', '132', '114621144349192', '2', 'type1', '-1', '2014-06-21 14:44:02');
INSERT INTO `t_guipoint` VALUES ('74', '132', '11462114434866', '2', 'type0', '-1', '2014-06-21 14:46:56');
INSERT INTO `t_guipoint` VALUES ('75', '132', '114621144349192', '2', 'type1', '-1', '2014-06-21 14:46:56');
INSERT INTO `t_guipoint` VALUES ('76', '132', '11462114434866', '2', 'type0', '1', '2014-06-21 14:47:04');
INSERT INTO `t_guipoint` VALUES ('77', '132', '114621144349192', '2', 'type1', '1', '2014-06-21 14:47:04');
INSERT INTO `t_guipoint` VALUES ('78', '136', '114621173137179', '2', 'type2', '-1', '2014-06-21 17:31:43');
INSERT INTO `t_guipoint` VALUES ('79', '136', '114621173138285', '2', 'type0', '-1', '2014-06-21 17:31:43');
INSERT INTO `t_guipoint` VALUES ('80', '136', '114621173137179', '2', 'type2', '1', '2014-06-21 17:31:49');
INSERT INTO `t_guipoint` VALUES ('81', '136', '114621173138285', '2', 'type0', '1', '2014-06-21 17:31:49');
INSERT INTO `t_guipoint` VALUES ('82', '136', '114621173145331', '2', 'type5', '1', '2014-06-21 17:31:49');
INSERT INTO `t_guipoint` VALUES ('83', '0', '114621173137179', '2', 'type2', '-1', '2014-06-21 17:34:45');
INSERT INTO `t_guipoint` VALUES ('84', '0', '114621173138285', '2', 'type0', '-1', '2014-06-21 17:34:45');
INSERT INTO `t_guipoint` VALUES ('85', '0', '114621173145331', '2', 'type5', '-1', '2014-06-21 17:34:45');
INSERT INTO `t_guipoint` VALUES ('86', '0', '114621173442462', '2', 'type5', '-1', '2014-06-21 17:34:45');
INSERT INTO `t_guipoint` VALUES ('87', '141', '114621173616635', '2', 'type0', '-1', '2014-06-21 17:36:27');
INSERT INTO `t_guipoint` VALUES ('88', '141', '114621173618266', '2', 'type2', '-1', '2014-06-21 17:36:27');
INSERT INTO `t_guipoint` VALUES ('89', '141', '114621173620911', '2', 'type4', '-1', '2014-06-21 17:36:27');
INSERT INTO `t_guipoint` VALUES ('90', '141', '114621173622154', '2', 'type5', '-1', '2014-06-21 17:36:27');
INSERT INTO `t_guipoint` VALUES ('91', '141', '114621173616635', '2', 'type0', '-1', '2014-06-21 17:40:43');
INSERT INTO `t_guipoint` VALUES ('92', '141', '114621173618266', '2', 'type2', '-1', '2014-06-21 17:40:43');
INSERT INTO `t_guipoint` VALUES ('93', '141', '114621173620911', '2', 'type4', '-1', '2014-06-21 17:40:43');
INSERT INTO `t_guipoint` VALUES ('94', '141', '114621173622154', '2', 'type5', '-1', '2014-06-21 17:40:43');
INSERT INTO `t_guipoint` VALUES ('95', '141', '114621174037844', '2', 'type5', '-1', '2014-06-21 17:40:43');
INSERT INTO `t_guipoint` VALUES ('96', '0', '114621174216614', '2', 'type1', '-1', '2014-06-21 17:42:22');
INSERT INTO `t_guipoint` VALUES ('97', '0', '114621174217801', '2', 'type0', '-1', '2014-06-21 17:42:22');
INSERT INTO `t_guipoint` VALUES ('98', '141', '114621174216614', '2', 'type1', '-1', '2014-06-21 17:42:27');
INSERT INTO `t_guipoint` VALUES ('99', '141', '114621174217801', '2', 'type0', '-1', '2014-06-21 17:42:27');
INSERT INTO `t_guipoint` VALUES ('100', '141', '114621174216614', '2', 'type1', '-1', '2014-06-21 17:42:30');
INSERT INTO `t_guipoint` VALUES ('101', '141', '114621174217801', '2', 'type0', '-1', '2014-06-21 17:42:30');
INSERT INTO `t_guipoint` VALUES ('102', '0', '11462117437840', '2', 'type2', '-1', '2014-06-21 17:43:12');
INSERT INTO `t_guipoint` VALUES ('103', '0', '11462117439157', '2', 'type0', '-1', '2014-06-21 17:43:12');
INSERT INTO `t_guipoint` VALUES ('104', '141', '11462117437840', '2', 'type2', '-1', '2014-06-21 17:43:17');
INSERT INTO `t_guipoint` VALUES ('105', '141', '11462117439157', '2', 'type0', '-1', '2014-06-21 17:43:17');
INSERT INTO `t_guipoint` VALUES ('106', '141', '11462117437840', '2', 'type2', '1', '2014-06-21 17:43:20');
INSERT INTO `t_guipoint` VALUES ('107', '141', '11462117439157', '2', 'type0', '1', '2014-06-21 17:43:20');
INSERT INTO `t_guipoint` VALUES ('108', '146', '114621174431283', '2', 'type5', '-1', '2014-06-21 17:44:32');
INSERT INTO `t_guipoint` VALUES ('109', '0', '114621174445543', '2', 'type2', '-1', '2014-06-21 17:44:50');
INSERT INTO `t_guipoint` VALUES ('110', '0', '114621174446465', '2', 'type3', '-1', '2014-06-21 17:44:50');
INSERT INTO `t_guipoint` VALUES ('111', '146', '114621174445543', '2', 'type2', '-1', '2014-06-21 17:45:03');
INSERT INTO `t_guipoint` VALUES ('112', '146', '114621174446465', '2', 'type3', '-1', '2014-06-21 17:45:03');
INSERT INTO `t_guipoint` VALUES ('113', '146', '114621174445543', '2', 'type2', '1', '2014-06-21 17:45:38');
INSERT INTO `t_guipoint` VALUES ('114', '146', '114621174446465', '2', 'type3', '1', '2014-06-21 17:45:38');
INSERT INTO `t_guipoint` VALUES ('115', '0', '114621174620743', '2', 'type2', '-1', '2014-06-21 17:46:22');
INSERT INTO `t_guipoint` VALUES ('116', '148', '114621174620743', '2', 'type2', '-1', '2014-06-21 17:46:27');
INSERT INTO `t_guipoint` VALUES ('117', '148', '114621174620743', '2', 'type2', '1', '2014-06-21 17:46:35');
INSERT INTO `t_guipoint` VALUES ('118', '0', '114621174740773', '2', 'type0', '-1', '2014-06-21 17:48:01');
INSERT INTO `t_guipoint` VALUES ('119', '0', '114621174740773', '2', 'type0', '-1', '2014-06-21 17:50:25');
INSERT INTO `t_guipoint` VALUES ('120', '153', '114621175346836', '2', 'type2', '1', '2014-06-21 17:53:48');
INSERT INTO `t_guipoint` VALUES ('121', '152', '114621175346836', '2', 'type2', '-1', '2014-06-21 17:54:13');
INSERT INTO `t_guipoint` VALUES ('122', '152', '114621175346836', '2', 'type2', '1', '2014-06-21 17:54:46');
INSERT INTO `t_guipoint` VALUES ('123', '155', '114621175531642', '2', 'type2', '1', '2014-06-21 17:55:33');
INSERT INTO `t_guipoint` VALUES ('124', '154', '114621175531642', '2', 'type2', '-1', '2014-06-21 17:55:52');
INSERT INTO `t_guipoint` VALUES ('125', '154', '114621175531642', '2', 'type2', '-1', '2014-06-21 17:58:34');
INSERT INTO `t_guipoint` VALUES ('126', '154', '11462117583245', '2', 'type5', '-1', '2014-06-21 17:58:34');
INSERT INTO `t_guipoint` VALUES ('127', '154', '114621175531642', '2', 'type2', '-1', '2014-06-21 18:01:18');
INSERT INTO `t_guipoint` VALUES ('128', '154', '11462117583245', '2', 'type5', '-1', '2014-06-21 18:01:18');
INSERT INTO `t_guipoint` VALUES ('129', '154', '114621175531642', '2', 'type2', '1', '2014-06-21 18:01:33');
INSERT INTO `t_guipoint` VALUES ('130', '154', '11462117583245', '2', 'type5', '1', '2014-06-21 18:01:33');
INSERT INTO `t_guipoint` VALUES ('131', '0', '11462118222934', '2', 'type2', '-1', '2014-06-21 18:02:43');
INSERT INTO `t_guipoint` VALUES ('132', '156', '11462118222934', '2', 'type2', '-1', '2014-06-21 18:03:05');
INSERT INTO `t_guipoint` VALUES ('133', '156', '11462118222934', '2', 'type2', '-1', '2014-06-21 23:05:43');
INSERT INTO `t_guipoint` VALUES ('134', '156', '11462118222934', '2', 'type2', '-1', '2014-06-21 23:06:08');
INSERT INTO `t_guipoint` VALUES ('135', '156', '11462118222934', '2', 'type2', '-1', '2014-06-21 23:07:31');
INSERT INTO `t_guipoint` VALUES ('136', '156', '11462118222934', '2', 'type2', '-1', '2014-06-21 23:07:31');
INSERT INTO `t_guipoint` VALUES ('137', '156', '11462118222934', '2', 'type2', '-1', '2014-06-21 23:07:43');
INSERT INTO `t_guipoint` VALUES ('138', '156', '11462118222934', '2', 'type2', '-1', '2014-06-21 23:08:32');
INSERT INTO `t_guipoint` VALUES ('139', '156', '11462118222934', '2', 'type2', '-1', '2014-06-21 23:08:59');
INSERT INTO `t_guipoint` VALUES ('140', '156', '11462118222934', '2', 'type2', '-1', '2014-06-21 23:09:51');
INSERT INTO `t_guipoint` VALUES ('141', '156', '11462118222934', '2', 'type2', '1', '2014-06-21 23:11:30');
INSERT INTO `t_guipoint` VALUES ('142', '159', '114621231150969', '2', 'type2', '-1', '2014-06-21 23:11:55');
INSERT INTO `t_guipoint` VALUES ('143', '158', '114621231140235', '2', 'type0', '-1', '2014-06-21 23:11:59');
INSERT INTO `t_guipoint` VALUES ('144', '158', '114621231141733', '2', 'type2', '-1', '2014-06-21 23:11:59');
INSERT INTO `t_guipoint` VALUES ('145', '158', '114621231145281', '2', 'type5', '-1', '2014-06-21 23:11:59');
INSERT INTO `t_guipoint` VALUES ('146', '158', '114621231140235', '2', 'type0', '-1', '2014-06-21 23:12:55');
INSERT INTO `t_guipoint` VALUES ('147', '158', '114621231141733', '2', 'type2', '-1', '2014-06-21 23:12:55');
INSERT INTO `t_guipoint` VALUES ('148', '158', '114621231145281', '2', 'type5', '-1', '2014-06-21 23:12:55');
INSERT INTO `t_guipoint` VALUES ('149', '159', '114621231150969', '2', 'type2', '-1', '2014-06-21 23:13:17');
INSERT INTO `t_guipoint` VALUES ('150', '159', '1146212313717', '2', 'type0', '-1', '2014-06-21 23:13:17');
INSERT INTO `t_guipoint` VALUES ('151', '159', '11462123137913', '2', 'type1', '-1', '2014-06-21 23:13:17');
INSERT INTO `t_guipoint` VALUES ('152', '159', '114621231140235', '2', 'type0', '1', '2014-06-21 23:13:21');
INSERT INTO `t_guipoint` VALUES ('153', '159', '114621231141733', '2', 'type2', '1', '2014-06-21 23:13:21');
INSERT INTO `t_guipoint` VALUES ('154', '159', '114621231145281', '2', 'type5', '1', '2014-06-21 23:13:21');
INSERT INTO `t_guipoint` VALUES ('155', '158', '114621231140235', '2', 'type0', '-1', '2014-06-22 01:14:30');
INSERT INTO `t_guipoint` VALUES ('156', '158', '114621231141733', '2', 'type2', '-1', '2014-06-22 01:14:30');
INSERT INTO `t_guipoint` VALUES ('157', '158', '114621231145281', '2', 'type5', '-1', '2014-06-22 01:14:30');
INSERT INTO `t_guipoint` VALUES ('158', '158', '114621231140235', '2', 'type0', '1', '2014-06-22 01:14:46');
INSERT INTO `t_guipoint` VALUES ('159', '158', '114621231141733', '2', 'type2', '1', '2014-06-22 01:14:46');
INSERT INTO `t_guipoint` VALUES ('160', '158', '114621231145281', '2', 'type5', '1', '2014-06-22 01:14:46');
INSERT INTO `t_guipoint` VALUES ('161', '158', '11462211442372', '2', 'type5', '1', '2014-06-22 01:14:46');
INSERT INTO `t_guipoint` VALUES ('162', '158', '1146221144451', '2', 'type5', '1', '2014-06-22 01:14:46');
INSERT INTO `t_guipoint` VALUES ('163', '160', '1146221204386', '2', 'type0', '-1', '2014-06-22 01:20:56');
INSERT INTO `t_guipoint` VALUES ('164', '160', '11462212044498', '2', 'type2', '-1', '2014-06-22 01:20:56');
INSERT INTO `t_guipoint` VALUES ('165', '160', '11462212052366', '2', 'type5', '-1', '2014-06-22 01:20:56');
INSERT INTO `t_guipoint` VALUES ('166', '161', '1146221213186', '2', 'type2', '-1', '2014-06-22 01:21:07');
INSERT INTO `t_guipoint` VALUES ('167', '161', '1146221214872', '2', 'type1', '-1', '2014-06-22 01:21:07');
INSERT INTO `t_guipoint` VALUES ('168', '160', '1146221204386', '2', 'type0', '1', '2014-06-22 01:21:12');
INSERT INTO `t_guipoint` VALUES ('169', '160', '11462212044498', '2', 'type2', '1', '2014-06-22 01:21:12');
INSERT INTO `t_guipoint` VALUES ('170', '160', '11462212052366', '2', 'type5', '1', '2014-06-22 01:21:12');
INSERT INTO `t_guipoint` VALUES ('171', '161', '1146221204386', '2', 'type0', '1', '2014-06-22 01:21:24');
INSERT INTO `t_guipoint` VALUES ('172', '161', '11462212044498', '2', 'type2', '1', '2014-06-22 01:21:24');
INSERT INTO `t_guipoint` VALUES ('173', '161', '11462212052366', '2', 'type5', '1', '2014-06-22 01:21:24');
INSERT INTO `t_guipoint` VALUES ('174', '0', '1146221204386', '2', 'type0', '-1', '2014-06-22 01:24:20');
INSERT INTO `t_guipoint` VALUES ('175', '0', '11462212044498', '2', 'type2', '-1', '2014-06-22 01:24:20');
INSERT INTO `t_guipoint` VALUES ('176', '0', '11462212052366', '2', 'type5', '-1', '2014-06-22 01:24:20');
INSERT INTO `t_guipoint` VALUES ('177', '163', '11462212845670', '2', 'type1', '-1', '2014-06-22 01:28:48');
INSERT INTO `t_guipoint` VALUES ('178', '162', '11462212831431', '2', 'type5', '1', '2014-06-22 01:28:51');
INSERT INTO `t_guipoint` VALUES ('179', '163', '11462212831431', '2', 'type5', '1', '2014-06-22 01:29:13');
INSERT INTO `t_guipoint` VALUES ('180', '165', '11462213139925', '2', 'type0', '-1', '2014-06-22 01:33:24');
INSERT INTO `t_guipoint` VALUES ('181', '165', '11462213139925', '2', 'type0', '-1', '2014-06-22 01:34:50');
INSERT INTO `t_guipoint` VALUES ('182', '164', '11462213133814', '2', 'type5', '-1', '2014-06-22 01:34:59');
INSERT INTO `t_guipoint` VALUES ('183', '164', '11462213133814', '2', 'type5', '1', '2014-06-22 01:35:59');
INSERT INTO `t_guipoint` VALUES ('184', '165', '11462213133814', '2', 'type5', '-1', '2014-06-22 01:36:39');
INSERT INTO `t_guipoint` VALUES ('185', '0', '11462213133814', '2', 'type5', '-1', '2014-06-22 01:37:39');
INSERT INTO `t_guipoint` VALUES ('186', '0', '11462213133814', '2', 'type5', '-1', '2014-06-22 01:38:01');
INSERT INTO `t_guipoint` VALUES ('187', '165', '11462213133814', '2', 'type5', '-1', '2014-06-22 01:38:23');
INSERT INTO `t_guipoint` VALUES ('188', '165', '11462213133814', '2', 'type5', '-1', '2014-06-22 01:44:49');
INSERT INTO `t_guipoint` VALUES ('189', '165', '11462213133814', '2', 'type5', '1', '2014-06-22 01:44:54');
INSERT INTO `t_guipoint` VALUES ('190', '0', '11462214721578', '2', 'type2', '-1', '2014-06-22 01:47:25');
INSERT INTO `t_guipoint` VALUES ('191', '0', '11462214722629', '2', 'type1', '-1', '2014-06-22 01:47:25');
INSERT INTO `t_guipoint` VALUES ('192', '0', '1146221476400', '2', 'type0', '1', '2014-06-22 01:47:30');
INSERT INTO `t_guipoint` VALUES ('193', '0', '1146221477329', '2', 'type2', '1', '2014-06-22 01:47:30');
INSERT INTO `t_guipoint` VALUES ('194', '0', '1146221478381', '2', 'type1', '1', '2014-06-22 01:47:30');
INSERT INTO `t_guipoint` VALUES ('195', '0', '11462214715941', '2', 'type5', '1', '2014-06-22 01:47:30');
INSERT INTO `t_guipoint` VALUES ('196', '169', '11462215058439', '2', 'type2', '-1', '2014-06-22 01:51:05');
INSERT INTO `t_guipoint` VALUES ('197', '168', '11462215048753', '2', 'type0', '-1', '2014-06-22 01:51:08');
INSERT INTO `t_guipoint` VALUES ('198', '168', '1146221505034', '2', 'type5', '-1', '2014-06-22 01:51:08');
INSERT INTO `t_guipoint` VALUES ('199', '169', '11462215058439', '2', 'type2', '-1', '2014-06-22 01:51:24');
INSERT INTO `t_guipoint` VALUES ('200', '168', '11462215048753', '2', 'type0', '-1', '2014-06-22 01:51:27');
INSERT INTO `t_guipoint` VALUES ('201', '168', '1146221505034', '2', 'type5', '-1', '2014-06-22 01:51:27');
INSERT INTO `t_guipoint` VALUES ('202', '168', '11462215048753', '2', 'type0', '-1', '2014-06-22 01:51:37');
INSERT INTO `t_guipoint` VALUES ('203', '168', '1146221505034', '2', 'type5', '-1', '2014-06-22 01:51:37');
INSERT INTO `t_guipoint` VALUES ('204', '168', '11462215048753', '2', 'type0', '-1', '2014-06-22 01:51:46');
INSERT INTO `t_guipoint` VALUES ('205', '168', '1146221505034', '2', 'type5', '-1', '2014-06-22 01:51:46');
INSERT INTO `t_guipoint` VALUES ('206', '168', '11462215048753', '2', 'type0', '-1', '2014-06-22 01:51:54');
INSERT INTO `t_guipoint` VALUES ('207', '168', '1146221505034', '2', 'type5', '-1', '2014-06-22 01:51:54');
INSERT INTO `t_guipoint` VALUES ('208', '170', '11462215215436', '2', 'type0', '-1', '2014-06-22 01:52:22');
INSERT INTO `t_guipoint` VALUES ('209', '170', '11462215216229', '2', 'type2', '-1', '2014-06-22 01:52:22');
INSERT INTO `t_guipoint` VALUES ('210', '170', '11462215217286', '2', 'type1', '-1', '2014-06-22 01:52:22');
INSERT INTO `t_guipoint` VALUES ('211', '169', '11462215058439', '2', 'type2', '-1', '2014-06-22 01:52:39');
INSERT INTO `t_guipoint` VALUES ('212', '169', '1146221523198', '2', 'type1', '-1', '2014-06-22 01:52:39');
INSERT INTO `t_guipoint` VALUES ('213', '169', '1146221524488', '2', 'type2', '-1', '2014-06-22 01:52:39');
INSERT INTO `t_guipoint` VALUES ('214', '169', '11462215210473', '2', 'type5', '-1', '2014-06-22 01:52:39');
INSERT INTO `t_guipoint` VALUES ('215', '168', '11462215048753', '2', 'type0', '-1', '2014-06-22 01:52:55');
INSERT INTO `t_guipoint` VALUES ('216', '168', '1146221505034', '2', 'type5', '-1', '2014-06-22 01:52:55');
INSERT INTO `t_guipoint` VALUES ('217', '168', '11462215048753', '2', 'type0', '-1', '2014-06-22 01:53:40');
INSERT INTO `t_guipoint` VALUES ('218', '168', '1146221505034', '2', 'type5', '-1', '2014-06-22 01:53:40');
INSERT INTO `t_guipoint` VALUES ('219', '169', '11462215058439', '2', 'type2', '-1', '2014-06-22 01:53:44');
INSERT INTO `t_guipoint` VALUES ('220', '169', '1146221523198', '2', 'type1', '-1', '2014-06-22 01:53:44');
INSERT INTO `t_guipoint` VALUES ('221', '169', '1146221524488', '2', 'type2', '-1', '2014-06-22 01:53:44');
INSERT INTO `t_guipoint` VALUES ('222', '169', '11462215210473', '2', 'type5', '-1', '2014-06-22 01:53:44');
INSERT INTO `t_guipoint` VALUES ('223', '169', '11462215058439', '2', 'type2', '-1', '2014-06-22 02:14:36');
INSERT INTO `t_guipoint` VALUES ('224', '169', '1146221523198', '2', 'type1', '-1', '2014-06-22 02:14:36');
INSERT INTO `t_guipoint` VALUES ('225', '169', '1146221524488', '2', 'type2', '-1', '2014-06-22 02:14:36');
INSERT INTO `t_guipoint` VALUES ('226', '169', '11462215210473', '2', 'type5', '-1', '2014-06-22 02:14:36');
INSERT INTO `t_guipoint` VALUES ('227', '169', '11462221433979', '2', 'type0', '-1', '2014-06-22 02:14:36');
INSERT INTO `t_guipoint` VALUES ('228', '170', '11462215215436', '2', 'type0', '-1', '2014-06-22 02:14:46');
INSERT INTO `t_guipoint` VALUES ('229', '170', '11462215216229', '2', 'type2', '-1', '2014-06-22 02:14:46');
INSERT INTO `t_guipoint` VALUES ('230', '170', '11462215217286', '2', 'type1', '-1', '2014-06-22 02:14:46');
INSERT INTO `t_guipoint` VALUES ('231', '170', '11462221441545', '2', 'type2', '-1', '2014-06-22 02:14:46');
INSERT INTO `t_guipoint` VALUES ('232', '170', '11462221442622', '2', 'type0', '-1', '2014-06-22 02:14:46');
INSERT INTO `t_guipoint` VALUES ('233', '169', '11462215058439', '2', 'type2', '-1', '2014-06-22 02:14:51');
INSERT INTO `t_guipoint` VALUES ('234', '169', '1146221523198', '2', 'type1', '-1', '2014-06-22 02:14:51');
INSERT INTO `t_guipoint` VALUES ('235', '169', '1146221524488', '2', 'type2', '-1', '2014-06-22 02:14:51');
INSERT INTO `t_guipoint` VALUES ('236', '169', '11462215210473', '2', 'type5', '-1', '2014-06-22 02:14:51');
INSERT INTO `t_guipoint` VALUES ('237', '169', '11462221433979', '2', 'type0', '-1', '2014-06-22 02:14:51');
INSERT INTO `t_guipoint` VALUES ('238', '168', '11462215048753', '2', 'type0', '-1', '2014-06-22 02:14:53');
INSERT INTO `t_guipoint` VALUES ('239', '168', '1146221505034', '2', 'type5', '-1', '2014-06-22 02:14:53');
INSERT INTO `t_guipoint` VALUES ('240', '170', '11462215215436', '2', 'type0', '-1', '2014-06-22 02:15:11');
INSERT INTO `t_guipoint` VALUES ('241', '170', '11462215216229', '2', 'type2', '-1', '2014-06-22 02:15:11');
INSERT INTO `t_guipoint` VALUES ('242', '170', '11462215217286', '2', 'type1', '-1', '2014-06-22 02:15:11');
INSERT INTO `t_guipoint` VALUES ('243', '170', '11462221441545', '2', 'type2', '-1', '2014-06-22 02:15:11');
INSERT INTO `t_guipoint` VALUES ('244', '170', '11462221442622', '2', 'type0', '-1', '2014-06-22 02:15:11');
INSERT INTO `t_guipoint` VALUES ('245', '168', '11462215048753', '2', 'type0', '-1', '2014-06-22 02:15:14');
INSERT INTO `t_guipoint` VALUES ('246', '168', '1146221505034', '2', 'type5', '-1', '2014-06-22 02:15:14');
INSERT INTO `t_guipoint` VALUES ('247', '169', '11462215058439', '2', 'type2', '-1', '2014-06-22 02:15:17');
INSERT INTO `t_guipoint` VALUES ('248', '169', '1146221523198', '2', 'type1', '-1', '2014-06-22 02:15:17');
INSERT INTO `t_guipoint` VALUES ('249', '169', '1146221524488', '2', 'type2', '-1', '2014-06-22 02:15:17');
INSERT INTO `t_guipoint` VALUES ('250', '169', '11462215210473', '2', 'type5', '-1', '2014-06-22 02:15:17');
INSERT INTO `t_guipoint` VALUES ('251', '169', '11462221433979', '2', 'type0', '-1', '2014-06-22 02:15:17');
INSERT INTO `t_guipoint` VALUES ('252', '170', '11462215215436', '2', 'type0', '-1', '2014-06-22 22:30:32');
INSERT INTO `t_guipoint` VALUES ('253', '170', '11462215216229', '2', 'type2', '-1', '2014-06-22 22:30:32');
INSERT INTO `t_guipoint` VALUES ('254', '170', '11462215217286', '2', 'type1', '-1', '2014-06-22 22:30:32');
INSERT INTO `t_guipoint` VALUES ('255', '170', '11462221441545', '2', 'type2', '-1', '2014-06-22 22:30:32');
INSERT INTO `t_guipoint` VALUES ('256', '170', '11462221442622', '2', 'type0', '-1', '2014-06-22 22:30:32');
INSERT INTO `t_guipoint` VALUES ('257', '170', '11462215215436', '2', 'type0', '-1', '2014-06-22 22:30:37');
INSERT INTO `t_guipoint` VALUES ('258', '170', '11462215216229', '2', 'type2', '-1', '2014-06-22 22:30:37');
INSERT INTO `t_guipoint` VALUES ('259', '170', '11462215217286', '2', 'type1', '-1', '2014-06-22 22:30:37');
INSERT INTO `t_guipoint` VALUES ('260', '170', '11462221441545', '2', 'type2', '-1', '2014-06-22 22:30:37');
INSERT INTO `t_guipoint` VALUES ('261', '170', '11462221442622', '2', 'type0', '-1', '2014-06-22 22:30:37');
INSERT INTO `t_guipoint` VALUES ('262', '169', '11462215058439', '2', 'type2', '1', '2014-06-22 22:30:40');
INSERT INTO `t_guipoint` VALUES ('263', '169', '1146221523198', '2', 'type1', '1', '2014-06-22 22:30:40');
INSERT INTO `t_guipoint` VALUES ('264', '169', '1146221524488', '2', 'type2', '1', '2014-06-22 22:30:40');
INSERT INTO `t_guipoint` VALUES ('265', '169', '11462215210473', '2', 'type5', '1', '2014-06-22 22:30:40');
INSERT INTO `t_guipoint` VALUES ('266', '169', '11462221433979', '2', 'type0', '1', '2014-06-22 22:30:40');
INSERT INTO `t_guipoint` VALUES ('267', '168', '11462215048753', '2', 'type0', '-1', '2014-06-22 22:30:43');
INSERT INTO `t_guipoint` VALUES ('268', '168', '1146221505034', '2', 'type5', '-1', '2014-06-22 22:30:43');
INSERT INTO `t_guipoint` VALUES ('269', '170', '11462215215436', '2', 'type0', '1', '2014-06-22 22:33:43');
INSERT INTO `t_guipoint` VALUES ('270', '170', '11462215216229', '2', 'type2', '1', '2014-06-22 22:33:43');
INSERT INTO `t_guipoint` VALUES ('271', '170', '11462215217286', '2', 'type1', '1', '2014-06-22 22:33:43');
INSERT INTO `t_guipoint` VALUES ('272', '170', '11462221441545', '2', 'type2', '1', '2014-06-22 22:33:43');
INSERT INTO `t_guipoint` VALUES ('273', '170', '11462221442622', '2', 'type0', '1', '2014-06-22 22:33:43');
INSERT INTO `t_guipoint` VALUES ('274', '168', '11462215048753', '2', 'type0', '1', '2014-06-22 22:36:04');
INSERT INTO `t_guipoint` VALUES ('275', '168', '1146221505034', '2', 'type5', '1', '2014-06-22 22:36:04');

-- ----------------------------
-- Table structure for t_guipointproper
-- ----------------------------
DROP TABLE IF EXISTS `t_guipointproper`;
CREATE TABLE `t_guipointproper` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `point_type` varchar(32) DEFAULT NULL,
  `par_id` int(11) DEFAULT NULL,
  `par_display` varchar(50) DEFAULT NULL,
  `par_name` varchar(50) DEFAULT NULL,
  `par_messID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_guipointproper
-- ----------------------------
INSERT INTO `t_guipointproper` VALUES ('1', 'type0', null, '斜边', 'XIEBIAN', '3');
INSERT INTO `t_guipointproper` VALUES ('2', 'type0', null, '直角边a', 'ZHIBIAN1', '3');

-- ----------------------------
-- Table structure for t_guipointvalue
-- ----------------------------
DROP TABLE IF EXISTS `t_guipointvalue`;
CREATE TABLE `t_guipointvalue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pro_id` int(11) DEFAULT NULL,
  `point_id` int(11) DEFAULT NULL,
  `point_name` varchar(15) DEFAULT NULL,
  `point_type` varchar(32) DEFAULT NULL,
  `proper_id` int(11) DEFAULT NULL,
  `par_value` double DEFAULT NULL,
  `par_ISOValue` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_guipointvalue
-- ----------------------------
INSERT INTO `t_guipointvalue` VALUES ('1', '122', '56', '114616221841107', 'type0', '1', '32', '0.32');
INSERT INTO `t_guipointvalue` VALUES ('2', '122', '56', '114616221841107', 'type0', '2', '321', '3.21');
INSERT INTO `t_guipointvalue` VALUES ('4', '122', '0', '11461622553793', 'type0', '1', '0', '0');
INSERT INTO `t_guipointvalue` VALUES ('5', '122', '0', '11461622553793', 'type0', '2', '0', '0');
INSERT INTO `t_guipointvalue` VALUES ('6', '127', '63', '114616233447300', 'type0', '1', '50', '0.5');
INSERT INTO `t_guipointvalue` VALUES ('7', '127', '63', '114616233447300', 'type0', '2', '20', '0.2');
INSERT INTO `t_guipointvalue` VALUES ('8', '0', '0', '114621142053913', 'type0', '1', '0', '0');
INSERT INTO `t_guipointvalue` VALUES ('9', '0', '0', '114621142053913', 'type0', '2', '0', '0');
INSERT INTO `t_guipointvalue` VALUES ('11', '132', '76', '11462114434866', 'type0', '1', '0', '0');
INSERT INTO `t_guipointvalue` VALUES ('12', '132', '76', '11462114434866', 'type0', '2', '0', '0');
INSERT INTO `t_guipointvalue` VALUES ('13', '173', '0', '11462223508842', 'type0', '1', '0', '0');
INSERT INTO `t_guipointvalue` VALUES ('14', '173', '0', '11462223508842', 'type0', '2', '0', '0');

-- ----------------------------
-- Table structure for t_guipro
-- ----------------------------
DROP TABLE IF EXISTS `t_guipro`;
CREATE TABLE `t_guipro` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `AuthorID` int(11) DEFAULT NULL,
  `AddTime` datetime DEFAULT NULL,
  `Description` varchar(250) DEFAULT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `parentPro` int(11) DEFAULT NULL,
  `subID` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=174 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_guipro
-- ----------------------------
INSERT INTO `t_guipro` VALUES ('112', '1', '2014-06-01 22:53:54', '', 'asdasds', '0', null, null);
INSERT INTO `t_guipro` VALUES ('113', '1', '2014-06-03 10:23:03', '', 'zzfasd', '0', null, null);
INSERT INTO `t_guipro` VALUES ('114', '1', '2014-06-03 10:53:41', '', 'zzfasd2', '0', null, null);
INSERT INTO `t_guipro` VALUES ('115', '1', '2014-06-14 10:52:56', '', 'icehome', '0', null, null);
INSERT INTO `t_guipro` VALUES ('116', '1', '2014-06-15 21:44:12', '', '111', '0', null, null);
INSERT INTO `t_guipro` VALUES ('117', '1', '2014-06-15 21:46:48', '', '222', '0', null, null);
INSERT INTO `t_guipro` VALUES ('118', '1', '2014-06-15 22:19:46', '', '32', '0', null, null);
INSERT INTO `t_guipro` VALUES ('119', '1', '2014-06-15 22:22:18', '', '青山区', '0', null, null);
INSERT INTO `t_guipro` VALUES ('120', '1', '2014-06-15 22:59:47', '', '312', '0', null, null);
INSERT INTO `t_guipro` VALUES ('121', '1', '2014-06-16 21:10:19', '', 'tstsd', '0', null, null);
INSERT INTO `t_guipro` VALUES ('122', '1', '2014-06-16 22:21:59', '', '征服点数', '0', null, null);
INSERT INTO `t_guipro` VALUES ('123', '1', '2014-06-16 22:41:42', '', '征服点数2', '0', null, null);
INSERT INTO `t_guipro` VALUES ('124', '1', '2014-06-16 22:43:55', '', '征服点数3', '0', null, null);
INSERT INTO `t_guipro` VALUES ('125', '1', '2014-06-16 22:48:58', '', '征服点数4', '0', null, null);
INSERT INTO `t_guipro` VALUES ('126', '1', '2014-06-16 23:28:45', '管道项目a', '管道项目a', '0', null, null);
INSERT INTO `t_guipro` VALUES ('127', '1', '2014-06-16 23:35:55', '西安管道项目', '管道项目b', '0', null, null);
INSERT INTO `t_guipro` VALUES ('128', '1', '2014-06-21 14:12:44', '', '333', '0', null, null);
INSERT INTO `t_guipro` VALUES ('129', '1', '2014-06-21 14:19:11', '', '6', '0', null, null);
INSERT INTO `t_guipro` VALUES ('130', '1', '2014-06-21 14:22:28', '', 'u', '0', null, null);
INSERT INTO `t_guipro` VALUES ('131', '1', '2014-06-21 14:34:38', '', 'u2', '0', null, null);
INSERT INTO `t_guipro` VALUES ('132', '1', '2014-06-21 14:47:04', '', '31', '0', null, null);
INSERT INTO `t_guipro` VALUES ('133', '1', '2014-06-21 14:51:38', '', '313', '0', null, null);
INSERT INTO `t_guipro` VALUES ('134', '1', '2014-06-21 14:52:56', '', '3136', '0', null, null);
INSERT INTO `t_guipro` VALUES ('135', '1', '2014-06-21 15:21:59', '', '564', '0', null, null);
INSERT INTO `t_guipro` VALUES ('136', '1', '2014-06-21 17:31:49', '', '123', '0', null, null);
INSERT INTO `t_guipro` VALUES ('137', '0', '2014-06-21 17:34:32', '', 'sub', '1', '0', '114621173145331');
INSERT INTO `t_guipro` VALUES ('138', '0', '2014-06-21 17:34:32', '', 'sub', '1', '0', '114621173145331');
INSERT INTO `t_guipro` VALUES ('139', '0', '2014-06-21 17:34:48', '', 'sub', '1', '0', '114621173442462');
INSERT INTO `t_guipro` VALUES ('140', '0', '2014-06-21 17:34:48', '', 'sub', '1', '0', '114621173442462');
INSERT INTO `t_guipro` VALUES ('141', '1', '2014-06-21 17:43:20', '', '1234', '0', null, null);
INSERT INTO `t_guipro` VALUES ('142', '0', '2014-06-21 17:36:32', '', 'sub', '1', '141', '114621173622154');
INSERT INTO `t_guipro` VALUES ('143', '0', '2014-06-21 17:36:32', '', 'sub', '1', '141', '114621173622154');
INSERT INTO `t_guipro` VALUES ('144', '0', '2014-06-21 17:40:48', '', 'sub', '1', '141', '114621174037844');
INSERT INTO `t_guipro` VALUES ('145', '0', '2014-06-21 17:43:03', '', 'sub', '1', '141', '11462117424942');
INSERT INTO `t_guipro` VALUES ('146', '1', '2014-06-21 17:45:38', '', 'testsub', '0', null, null);
INSERT INTO `t_guipro` VALUES ('147', '0', '2014-06-21 17:44:42', '', 'sub', '1', '146', '114621174431283');
INSERT INTO `t_guipro` VALUES ('148', '1', '2014-06-21 17:46:35', '', 'testsub2', '0', null, null);
INSERT INTO `t_guipro` VALUES ('149', '0', '2014-06-21 17:46:18', '', 'sub', '1', '148', '114621174616282');
INSERT INTO `t_guipro` VALUES ('150', '0', '2014-06-21 17:47:39', '', 'sub', '1', '148', '114621174736472');
INSERT INTO `t_guipro` VALUES ('151', '0', '2014-06-21 17:50:54', '', 'sub', '1', '148', '114621175050790');
INSERT INTO `t_guipro` VALUES ('152', '1', '2014-06-21 17:54:46', '', 'few', '0', null, null);
INSERT INTO `t_guipro` VALUES ('153', '0', '2014-06-21 17:53:48', '', 'sub', '1', '152', '11462117531999');
INSERT INTO `t_guipro` VALUES ('154', '1', '2014-06-21 18:01:33', '', 'adf', '0', null, null);
INSERT INTO `t_guipro` VALUES ('155', '0', '2014-06-21 17:55:33', '', 'sub', '1', '154', '114621175510593');
INSERT INTO `t_guipro` VALUES ('156', '1', '2014-06-21 23:11:30', '', '999', '0', null, null);
INSERT INTO `t_guipro` VALUES ('157', '0', '2014-06-21 18:02:16', '', 'sub', '1', '156', '114621182666');
INSERT INTO `t_guipro` VALUES ('158', '1', '2014-06-22 01:14:46', '', '9999', '0', null, null);
INSERT INTO `t_guipro` VALUES ('159', '0', '2014-06-21 23:13:21', '', 'sub', '1', '158', '114621231145281');
INSERT INTO `t_guipro` VALUES ('160', '1', '2014-06-22 01:21:12', '', '通天塔', '0', null, null);
INSERT INTO `t_guipro` VALUES ('161', '0', '2014-06-22 01:21:24', '', 'sub', '1', '160', '11462212052366');
INSERT INTO `t_guipro` VALUES ('162', '1', '2014-06-22 01:28:51', '', '通天塔2', '0', null, null);
INSERT INTO `t_guipro` VALUES ('163', '0', '2014-06-22 01:29:13', '', 'sub', '1', '162', '11462212831431');
INSERT INTO `t_guipro` VALUES ('164', '1', '2014-06-22 01:35:59', '', '通天塔3', '0', null, null);
INSERT INTO `t_guipro` VALUES ('165', '0', '2014-06-22 01:44:54', '', 'sub', '1', '164', '11462213133814');
INSERT INTO `t_guipro` VALUES ('166', '1', '2014-06-22 01:47:02', '', '通天塔4', '0', null, null);
INSERT INTO `t_guipro` VALUES ('167', '0', '2014-06-22 01:47:20', '', 'sub', '1', '0', '11462214715941');
INSERT INTO `t_guipro` VALUES ('168', '1', '2014-06-22 22:36:04', '', '通天塔5', '0', null, null);
INSERT INTO `t_guipro` VALUES ('169', '0', '2014-06-22 22:30:40', '', 'sub', '1', '0', '1146221505034');
INSERT INTO `t_guipro` VALUES ('170', '0', '2014-06-22 22:33:43', '', 'sub', '1', '0', '11462215210473');
INSERT INTO `t_guipro` VALUES ('171', '1', '2014-06-22 22:58:00', '', 'sd', '0', null, null);
INSERT INTO `t_guipro` VALUES ('172', '1', '2014-06-22 23:01:13', '', 'sd32', '0', null, null);
INSERT INTO `t_guipro` VALUES ('173', '1', '2014-06-22 23:06:05', '', 'sd329', '0', null, null);

-- ----------------------------
-- Table structure for t_mapline
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
INSERT INTO `t_mapline` VALUES ('101', 'PH66-04', 'PH1-002', '1');
INSERT INTO `t_mapline` VALUES ('101', 'PH66-02', 'PH1-002', '1');
INSERT INTO `t_mapline` VALUES ('101', 'PH66-05', 'PH1-002', '1');
INSERT INTO `t_mapline` VALUES ('101', 'PH66-08', 'PH1-002', '1');
INSERT INTO `t_mapline` VALUES ('101', 'PH66-03', 'PH1-002', '1');
INSERT INTO `t_mapline` VALUES ('101', 'PH56-10', 'PH1-002', '1');
INSERT INTO `t_mapline` VALUES ('101', 'PH56-11', 'PH1-002', '1');
INSERT INTO `t_mapline` VALUES ('101', 'PH56-09', 'PH1-002', '1');
INSERT INTO `t_mapline` VALUES ('101', 'PH56-06', 'PH35-07', '1');
INSERT INTO `t_mapline` VALUES ('101', 'PH56-03', 'PH35-07', '1');
INSERT INTO `t_mapline` VALUES ('101', 'PH56-08', 'PH35-07', '1');
INSERT INTO `t_mapline` VALUES ('101', 'PH66-01', 'PH35-07', '1');
INSERT INTO `t_mapline` VALUES ('101', 'PH56-06', 'PH35-07', '1');
INSERT INTO `t_mapline` VALUES ('101', 'PH77-16', 'PH35-07', '1');
INSERT INTO `t_mapline` VALUES ('101', 'PH88-02', 'PH35-07', '1');
INSERT INTO `t_mapline` VALUES ('101', 'PH88-04', 'PH35-07', '1');
INSERT INTO `t_mapline` VALUES ('101', 'PH88-03', 'PH35-07', '1');
INSERT INTO `t_mapline` VALUES ('101', 'PH88-07', 'PH35-07', '1');
INSERT INTO `t_mapline` VALUES ('101', 'PH1-002', 'JIQIZHAN', '2');
INSERT INTO `t_mapline` VALUES ('101', 'PH35-07', 'JIQIZHAN', '2');
INSERT INTO `t_mapline` VALUES ('102', 'PH66-04', 'PH1-002', '1');
INSERT INTO `t_mapline` VALUES ('102', 'PH66-02', 'PH1-002', '1');
INSERT INTO `t_mapline` VALUES ('102', 'PH66-05', 'PH1-002', '1');
INSERT INTO `t_mapline` VALUES ('102', 'PH66-08', 'PH1-002', '1');
INSERT INTO `t_mapline` VALUES ('102', 'PH66-03', 'PH1-002', '1');
INSERT INTO `t_mapline` VALUES ('102', 'PH56-10', 'PH1-002', '1');
INSERT INTO `t_mapline` VALUES ('102', 'PH56-11', 'PH1-002', '1');
INSERT INTO `t_mapline` VALUES ('102', 'PH56-09', 'PH1-002', '1');
INSERT INTO `t_mapline` VALUES ('102', 'PH56-06', 'PH35-07', '1');
INSERT INTO `t_mapline` VALUES ('102', 'PH56-03', 'PH35-07', '1');
INSERT INTO `t_mapline` VALUES ('102', 'PH56-08', 'PH35-07', '1');
INSERT INTO `t_mapline` VALUES ('102', 'PH66-01', 'PH35-07', '1');
INSERT INTO `t_mapline` VALUES ('102', 'PH56-06', 'PH35-07', '1');
INSERT INTO `t_mapline` VALUES ('102', 'PH77-16', 'PH35-07', '1');
INSERT INTO `t_mapline` VALUES ('102', 'PH88-02', 'PH35-07', '1');
INSERT INTO `t_mapline` VALUES ('102', 'PH88-04', 'PH35-07', '1');
INSERT INTO `t_mapline` VALUES ('102', 'PH88-03', 'PH35-07', '1');
INSERT INTO `t_mapline` VALUES ('102', 'PH88-07', 'PH35-07', '1');
INSERT INTO `t_mapline` VALUES ('102', 'PH1-002', 'JIQIZHAN', '2');
INSERT INTO `t_mapline` VALUES ('102', 'PH35-07', 'JIQIZHAN', '2');
INSERT INTO `t_mapline` VALUES ('103', 'PH66-04', 'PH1-002', '1');
INSERT INTO `t_mapline` VALUES ('103', 'PH66-02', 'PH1-002', '1');
INSERT INTO `t_mapline` VALUES ('103', 'PH66-05', 'PH1-002', '1');
INSERT INTO `t_mapline` VALUES ('103', 'PH66-08', 'PH1-002', '1');
INSERT INTO `t_mapline` VALUES ('103', 'PH66-03', 'PH1-002', '1');
INSERT INTO `t_mapline` VALUES ('103', 'PH56-10', 'PH1-002', '1');
INSERT INTO `t_mapline` VALUES ('103', 'PH56-11', 'PH1-002', '1');
INSERT INTO `t_mapline` VALUES ('103', 'PH56-09', 'PH1-002', '1');
INSERT INTO `t_mapline` VALUES ('103', 'PH56-06', 'PH35-07', '1');
INSERT INTO `t_mapline` VALUES ('103', 'PH56-03', 'PH35-07', '1');
INSERT INTO `t_mapline` VALUES ('103', 'PH56-08', 'PH35-07', '1');
INSERT INTO `t_mapline` VALUES ('103', 'PH66-01', 'PH35-07', '1');
INSERT INTO `t_mapline` VALUES ('103', 'PH56-06', 'PH35-07', '1');
INSERT INTO `t_mapline` VALUES ('103', 'PH77-16', 'PH35-07', '1');
INSERT INTO `t_mapline` VALUES ('103', 'PH88-02', 'PH35-07', '1');
INSERT INTO `t_mapline` VALUES ('103', 'PH88-04', 'PH35-07', '1');
INSERT INTO `t_mapline` VALUES ('103', 'PH88-03', 'PH35-07', '1');
INSERT INTO `t_mapline` VALUES ('103', 'PH88-07', 'PH35-07', '1');
INSERT INTO `t_mapline` VALUES ('103', 'PH1-002', 'JIQIZHAN', '2');
INSERT INTO `t_mapline` VALUES ('103', 'PH35-07', 'JIQIZHAN', '2');
INSERT INTO `t_mapline` VALUES ('104', 'PH66-04', 'PH1-002', '1');
INSERT INTO `t_mapline` VALUES ('104', 'PH66-02', 'PH1-002', '1');
INSERT INTO `t_mapline` VALUES ('104', 'PH66-05', 'PH1-002', '1');
INSERT INTO `t_mapline` VALUES ('104', 'PH66-08', 'PH1-002', '1');
INSERT INTO `t_mapline` VALUES ('104', 'PH66-03', 'PH1-002', '1');
INSERT INTO `t_mapline` VALUES ('104', 'PH56-10', 'PH1-002', '1');
INSERT INTO `t_mapline` VALUES ('104', 'PH56-11', 'PH1-002', '1');
INSERT INTO `t_mapline` VALUES ('104', 'PH56-09', 'PH1-002', '1');
INSERT INTO `t_mapline` VALUES ('104', 'PH56-06', 'PH35-07', '1');
INSERT INTO `t_mapline` VALUES ('104', 'PH56-03', 'PH35-07', '1');
INSERT INTO `t_mapline` VALUES ('104', 'PH56-08', 'PH35-07', '1');
INSERT INTO `t_mapline` VALUES ('104', 'PH66-01', 'PH35-07', '1');
INSERT INTO `t_mapline` VALUES ('104', 'PH56-06', 'PH35-07', '1');
INSERT INTO `t_mapline` VALUES ('104', 'PH77-16', 'PH35-07', '1');
INSERT INTO `t_mapline` VALUES ('104', 'PH88-02', 'PH35-07', '1');
INSERT INTO `t_mapline` VALUES ('104', 'PH88-04', 'PH35-07', '1');
INSERT INTO `t_mapline` VALUES ('104', 'PH88-03', 'PH35-07', '1');
INSERT INTO `t_mapline` VALUES ('104', 'PH88-07', 'PH35-07', '1');
INSERT INTO `t_mapline` VALUES ('104', 'PH1-002', 'JIQIZHAN', '2');
INSERT INTO `t_mapline` VALUES ('104', 'PH35-07', 'JIQIZHAN', '2');
INSERT INTO `t_mapline` VALUES ('105', 'PH66-04', 'PH1-002', '1');
INSERT INTO `t_mapline` VALUES ('105', 'PH66-02', 'PH1-002', '1');
INSERT INTO `t_mapline` VALUES ('105', 'PH66-05', 'PH1-002', '1');
INSERT INTO `t_mapline` VALUES ('105', 'PH66-08', 'PH1-002', '1');
INSERT INTO `t_mapline` VALUES ('105', 'PH66-03', 'PH1-002', '1');
INSERT INTO `t_mapline` VALUES ('105', 'PH56-10', 'PH1-002', '1');
INSERT INTO `t_mapline` VALUES ('105', 'PH56-11', 'PH1-002', '1');
INSERT INTO `t_mapline` VALUES ('105', 'PH56-09', 'PH1-002', '1');
INSERT INTO `t_mapline` VALUES ('105', 'PH56-06', 'PH35-07', '1');
INSERT INTO `t_mapline` VALUES ('105', 'PH56-03', 'PH35-07', '1');
INSERT INTO `t_mapline` VALUES ('105', 'PH56-08', 'PH35-07', '1');
INSERT INTO `t_mapline` VALUES ('105', 'PH66-01', 'PH35-07', '1');
INSERT INTO `t_mapline` VALUES ('105', 'PH56-06', 'PH35-07', '1');
INSERT INTO `t_mapline` VALUES ('105', 'PH77-16', 'PH35-07', '1');
INSERT INTO `t_mapline` VALUES ('105', 'PH88-02', 'PH35-07', '1');
INSERT INTO `t_mapline` VALUES ('105', 'PH88-04', 'PH35-07', '1');
INSERT INTO `t_mapline` VALUES ('105', 'PH88-03', 'PH35-07', '1');
INSERT INTO `t_mapline` VALUES ('105', 'PH88-07', 'PH35-07', '1');
INSERT INTO `t_mapline` VALUES ('105', 'PH1-002', 'JIQIZHAN', '2');
INSERT INTO `t_mapline` VALUES ('105', 'PH35-07', 'JIQIZHAN', '2');

-- ----------------------------
-- Table structure for t_mappoint
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
INSERT INTO `t_mappoint` VALUES ('101', 'PH35-07', 'fazu', '643830.9864', '3948698.53', '35.671684812614046', '118.5892320977849');
INSERT INTO `t_mappoint` VALUES ('101', 'PH77-16', 'jingkou', '643826.9864', '3948658.53', '35.67132487824821', '118.58918076788424');
INSERT INTO `t_mappoint` VALUES ('101', 'JIQIZHAN', 'jiqizhan', '643000.9864', '3948000.53', '35.665514552098855', '118.57994031031862');
INSERT INTO `t_mappoint` VALUES ('101', 'PH1-002', 'fazu', '642413.5666', '3947679.092', '35.662702481580894', '118.57339556775331');
INSERT INTO `t_mappoint` VALUES ('101', 'PH66-08', 'jingkou', '642877.5666', '3947678.192', '35.662627216009334', '118.57851997538629');
INSERT INTO `t_mappoint` VALUES ('101', 'PH88-07', 'jingkou', '644135.4246', '3949632.468', '35.680057845934535', '118.59276205159699');
INSERT INTO `t_mappoint` VALUES ('101', 'PH56-11', 'jingkou', '642883.1592', '3947125.296', '35.65764314219483', '118.57848364358466');
INSERT INTO `t_mappoint` VALUES ('101', 'PH66-04', 'jingkou', '642150.4345', '3947632.937', '35.66232446961591', '118.57048129542315');
INSERT INTO `t_mappoint` VALUES ('101', 'PH56-10', 'jingkou', '642497.1578', '3947153.18', '35.65795033440878', '118.57422571810082');
INSERT INTO `t_mappoint` VALUES ('101', 'PH66-03', 'jingkou', '642735.4336', '3947269.037', '35.65896008493791', '118.57687769199374');
INSERT INTO `t_mappoint` VALUES ('101', 'PH88-03', 'jingkou', '644458.4138', '3949409.207', '35.67799829573185', '118.59628990411746');
INSERT INTO `t_mappoint` VALUES ('101', 'PH56-03', 'jingkou', '642176.8753', '3946598.227', '35.65299475414599', '118.57059066061505');
INSERT INTO `t_mappoint` VALUES ('101', 'PH88-04', 'jingkou', '644586.7507', '3949695.279', '35.68055780691314', '118.59775896514007');
INSERT INTO `t_mappoint` VALUES ('101', 'PH66-05', 'jingkou', '642598.6307', '3947479.802', '35.66087951671918', '118.57540418634292');
INSERT INTO `t_mappoint` VALUES ('101', 'PH88-02', 'jingkou', '644008.5306', '3949266.397', '35.67677703191632', '118.59129477868382');
INSERT INTO `t_mappoint` VALUES ('101', 'PH56-04', 'jingkou', '642572.4831', '3946415.014', '35.65128632019088', '118.57492693710482');
INSERT INTO `t_mappoint` VALUES ('101', 'PH66-02', 'jingkou', '642370.2253', '3947415.113', '35.660329489014096', '118.57287021956822');
INSERT INTO `t_mappoint` VALUES ('101', 'PH56-06', 'jingkou', '642430.1129', '3946669.858', '35.65360381859533', '118.57339983132138');
INSERT INTO `t_mappoint` VALUES ('101', 'PH66-01', 'jingkou', '642111.7407', '3947240.585', '35.65879375845324', '118.5699847098955');
INSERT INTO `t_mappoint` VALUES ('101', 'PH56-09', 'jingkou', '642696.1411', '3946827.752', '35.6549884566997', '118.57636557213044');
INSERT INTO `t_mappoint` VALUES ('101', 'PH56-08', 'jingkou', '642192.5931', '3946984.241', '35.65647165576007', '118.57083237255222');
INSERT INTO `t_mappoint` VALUES ('102', 'PH35-07', 'fazu', '643830.9864', '3948698.53', '35.671684812614046', '118.5892320977849');
INSERT INTO `t_mappoint` VALUES ('102', 'PH77-16', 'jingkou', '643826.9864', '3948658.53', '35.67132487824821', '118.58918076788424');
INSERT INTO `t_mappoint` VALUES ('102', 'JIQIZHAN', 'jiqizhan', '643000.9864', '3948000.53', '35.665514552098855', '118.57994031031862');
INSERT INTO `t_mappoint` VALUES ('102', 'PH1-002', 'fazu', '642413.5666', '3947679.092', '35.662702481580894', '118.57339556775331');
INSERT INTO `t_mappoint` VALUES ('102', 'PH66-08', 'jingkou', '642877.5666', '3947678.192', '35.662627216009334', '118.57851997538629');
INSERT INTO `t_mappoint` VALUES ('102', 'PH88-07', 'jingkou', '644135.4246', '3949632.468', '35.680057845934535', '118.59276205159699');
INSERT INTO `t_mappoint` VALUES ('102', 'PH56-11', 'jingkou', '642883.1592', '3947125.296', '35.65764314219483', '118.57848364358466');
INSERT INTO `t_mappoint` VALUES ('102', 'PH66-04', 'jingkou', '642150.4345', '3947632.937', '35.66232446961591', '118.57048129542315');
INSERT INTO `t_mappoint` VALUES ('102', 'PH56-10', 'jingkou', '642497.1578', '3947153.18', '35.65795033440878', '118.57422571810082');
INSERT INTO `t_mappoint` VALUES ('102', 'PH66-03', 'jingkou', '642735.4336', '3947269.037', '35.65896008493791', '118.57687769199374');
INSERT INTO `t_mappoint` VALUES ('102', 'PH88-03', 'jingkou', '644458.4138', '3949409.207', '35.67799829573185', '118.59628990411746');
INSERT INTO `t_mappoint` VALUES ('102', 'PH56-03', 'jingkou', '642176.8753', '3946598.227', '35.65299475414599', '118.57059066061505');
INSERT INTO `t_mappoint` VALUES ('102', 'PH88-04', 'jingkou', '644586.7507', '3949695.279', '35.68055780691314', '118.59775896514007');
INSERT INTO `t_mappoint` VALUES ('102', 'PH66-05', 'jingkou', '642598.6307', '3947479.802', '35.66087951671918', '118.57540418634292');
INSERT INTO `t_mappoint` VALUES ('102', 'PH88-02', 'jingkou', '644008.5306', '3949266.397', '35.67677703191632', '118.59129477868382');
INSERT INTO `t_mappoint` VALUES ('102', 'PH56-04', 'jingkou', '642572.4831', '3946415.014', '35.65128632019088', '118.57492693710482');
INSERT INTO `t_mappoint` VALUES ('102', 'PH66-02', 'jingkou', '642370.2253', '3947415.113', '35.660329489014096', '118.57287021956822');
INSERT INTO `t_mappoint` VALUES ('102', 'PH56-06', 'jingkou', '642430.1129', '3946669.858', '35.65360381859533', '118.57339983132138');
INSERT INTO `t_mappoint` VALUES ('102', 'PH66-01', 'jingkou', '642111.7407', '3947240.585', '35.65879375845324', '118.5699847098955');
INSERT INTO `t_mappoint` VALUES ('102', 'PH56-09', 'jingkou', '642696.1411', '3946827.752', '35.6549884566997', '118.57636557213044');
INSERT INTO `t_mappoint` VALUES ('102', 'PH56-08', 'jingkou', '642192.5931', '3946984.241', '35.65647165576007', '118.57083237255222');
INSERT INTO `t_mappoint` VALUES ('103', 'PH35-07', 'fazu', '643830.9864', '3948698.53', '35.671684812614046', '118.5892320977849');
INSERT INTO `t_mappoint` VALUES ('103', 'PH77-16', 'jingkou', '643826.9864', '3948658.53', '35.67132487824821', '118.58918076788424');
INSERT INTO `t_mappoint` VALUES ('103', 'JIQIZHAN', 'jiqizhan', '643000.9864', '3948000.53', '35.665514552098855', '118.57994031031862');
INSERT INTO `t_mappoint` VALUES ('103', 'PH1-002', 'fazu', '642413.5666', '3947679.092', '35.662702481580894', '118.57339556775331');
INSERT INTO `t_mappoint` VALUES ('103', 'PH66-08', 'jingkou', '642877.5666', '3947678.192', '35.662627216009334', '118.57851997538629');
INSERT INTO `t_mappoint` VALUES ('103', 'PH88-07', 'jingkou', '644135.4246', '3949632.468', '35.680057845934535', '118.59276205159699');
INSERT INTO `t_mappoint` VALUES ('103', 'PH56-11', 'jingkou', '642883.1592', '3947125.296', '35.65764314219483', '118.57848364358466');
INSERT INTO `t_mappoint` VALUES ('103', 'PH66-04', 'jingkou', '642150.4345', '3947632.937', '35.66232446961591', '118.57048129542315');
INSERT INTO `t_mappoint` VALUES ('103', 'PH56-10', 'jingkou', '642497.1578', '3947153.18', '35.65795033440878', '118.57422571810082');
INSERT INTO `t_mappoint` VALUES ('103', 'PH66-03', 'jingkou', '642735.4336', '3947269.037', '35.65896008493791', '118.57687769199374');
INSERT INTO `t_mappoint` VALUES ('103', 'PH88-03', 'jingkou', '644458.4138', '3949409.207', '35.67799829573185', '118.59628990411746');
INSERT INTO `t_mappoint` VALUES ('103', 'PH56-03', 'jingkou', '642176.8753', '3946598.227', '35.65299475414599', '118.57059066061505');
INSERT INTO `t_mappoint` VALUES ('103', 'PH88-04', 'jingkou', '644586.7507', '3949695.279', '35.68055780691314', '118.59775896514007');
INSERT INTO `t_mappoint` VALUES ('103', 'PH66-05', 'jingkou', '642598.6307', '3947479.802', '35.66087951671918', '118.57540418634292');
INSERT INTO `t_mappoint` VALUES ('103', 'PH88-02', 'jingkou', '644008.5306', '3949266.397', '35.67677703191632', '118.59129477868382');
INSERT INTO `t_mappoint` VALUES ('103', 'PH56-04', 'jingkou', '642572.4831', '3946415.014', '35.65128632019088', '118.57492693710482');
INSERT INTO `t_mappoint` VALUES ('103', 'PH66-02', 'jingkou', '642370.2253', '3947415.113', '35.660329489014096', '118.57287021956822');
INSERT INTO `t_mappoint` VALUES ('103', 'PH56-06', 'jingkou', '642430.1129', '3946669.858', '35.65360381859533', '118.57339983132138');
INSERT INTO `t_mappoint` VALUES ('103', 'PH66-01', 'jingkou', '642111.7407', '3947240.585', '35.65879375845324', '118.5699847098955');
INSERT INTO `t_mappoint` VALUES ('103', 'PH56-09', 'jingkou', '642696.1411', '3946827.752', '35.6549884566997', '118.57636557213044');
INSERT INTO `t_mappoint` VALUES ('103', 'PH56-08', 'jingkou', '642192.5931', '3946984.241', '35.65647165576007', '118.57083237255222');
INSERT INTO `t_mappoint` VALUES ('104', 'PH35-07', 'fazu', '643830.9864', '3948698.53', '35.671684812614046', '118.5892320977849');
INSERT INTO `t_mappoint` VALUES ('104', 'PH77-16', 'jingkou', '643826.9864', '3948658.53', '35.67132487824821', '118.58918076788424');
INSERT INTO `t_mappoint` VALUES ('104', 'JIQIZHAN', 'jiqizhan', '643000.9864', '3948000.53', '35.665514552098855', '118.57994031031862');
INSERT INTO `t_mappoint` VALUES ('104', 'PH1-002', 'fazu', '642413.5666', '3947679.092', '35.662702481580894', '118.57339556775331');
INSERT INTO `t_mappoint` VALUES ('104', 'PH66-08', 'jingkou', '642877.5666', '3947678.192', '35.662627216009334', '118.57851997538629');
INSERT INTO `t_mappoint` VALUES ('104', 'PH88-07', 'jingkou', '644135.4246', '3949632.468', '35.680057845934535', '118.59276205159699');
INSERT INTO `t_mappoint` VALUES ('104', 'PH56-11', 'jingkou', '642883.1592', '3947125.296', '35.65764314219483', '118.57848364358466');
INSERT INTO `t_mappoint` VALUES ('104', 'PH66-04', 'jingkou', '642150.4345', '3947632.937', '35.66232446961591', '118.57048129542315');
INSERT INTO `t_mappoint` VALUES ('104', 'PH56-10', 'jingkou', '642497.1578', '3947153.18', '35.65795033440878', '118.57422571810082');
INSERT INTO `t_mappoint` VALUES ('104', 'PH66-03', 'jingkou', '642735.4336', '3947269.037', '35.65896008493791', '118.57687769199374');
INSERT INTO `t_mappoint` VALUES ('104', 'PH88-03', 'jingkou', '644458.4138', '3949409.207', '35.67799829573185', '118.59628990411746');
INSERT INTO `t_mappoint` VALUES ('104', 'PH56-03', 'jingkou', '642176.8753', '3946598.227', '35.65299475414599', '118.57059066061505');
INSERT INTO `t_mappoint` VALUES ('104', 'PH88-04', 'jingkou', '644586.7507', '3949695.279', '35.68055780691314', '118.59775896514007');
INSERT INTO `t_mappoint` VALUES ('104', 'PH66-05', 'jingkou', '642598.6307', '3947479.802', '35.66087951671918', '118.57540418634292');
INSERT INTO `t_mappoint` VALUES ('104', 'PH88-02', 'jingkou', '644008.5306', '3949266.397', '35.67677703191632', '118.59129477868382');
INSERT INTO `t_mappoint` VALUES ('104', 'PH56-04', 'jingkou', '642572.4831', '3946415.014', '35.65128632019088', '118.57492693710482');
INSERT INTO `t_mappoint` VALUES ('104', 'PH66-02', 'jingkou', '642370.2253', '3947415.113', '35.660329489014096', '118.57287021956822');
INSERT INTO `t_mappoint` VALUES ('104', 'PH56-06', 'jingkou', '642430.1129', '3946669.858', '35.65360381859533', '118.57339983132138');
INSERT INTO `t_mappoint` VALUES ('104', 'PH66-01', 'jingkou', '642111.7407', '3947240.585', '35.65879375845324', '118.5699847098955');
INSERT INTO `t_mappoint` VALUES ('104', 'PH56-09', 'jingkou', '642696.1411', '3946827.752', '35.6549884566997', '118.57636557213044');
INSERT INTO `t_mappoint` VALUES ('104', 'PH56-08', 'jingkou', '642192.5931', '3946984.241', '35.65647165576007', '118.57083237255222');
INSERT INTO `t_mappoint` VALUES ('105', 'PH35-07', 'fazu', '643830.9864', '3948698.53', '35.671684812614046', '118.5892320977849');
INSERT INTO `t_mappoint` VALUES ('105', 'PH77-16', 'jingkou', '643826.9864', '3948658.53', '35.67132487824821', '118.58918076788424');
INSERT INTO `t_mappoint` VALUES ('105', 'JIQIZHAN', 'jiqizhan', '643000.9864', '3948000.53', '35.665514552098855', '118.57994031031862');
INSERT INTO `t_mappoint` VALUES ('105', 'PH1-002', 'fazu', '642413.5666', '3947679.092', '35.662702481580894', '118.57339556775331');
INSERT INTO `t_mappoint` VALUES ('105', 'PH66-08', 'jingkou', '642877.5666', '3947678.192', '35.662627216009334', '118.57851997538629');
INSERT INTO `t_mappoint` VALUES ('105', 'PH88-07', 'jingkou', '644135.4246', '3949632.468', '35.680057845934535', '118.59276205159699');
INSERT INTO `t_mappoint` VALUES ('105', 'PH56-11', 'jingkou', '642883.1592', '3947125.296', '35.65764314219483', '118.57848364358466');
INSERT INTO `t_mappoint` VALUES ('105', 'PH66-04', 'jingkou', '642150.4345', '3947632.937', '35.66232446961591', '118.57048129542315');
INSERT INTO `t_mappoint` VALUES ('105', 'PH56-10', 'jingkou', '642497.1578', '3947153.18', '35.65795033440878', '118.57422571810082');
INSERT INTO `t_mappoint` VALUES ('105', 'PH66-03', 'jingkou', '642735.4336', '3947269.037', '35.65896008493791', '118.57687769199374');
INSERT INTO `t_mappoint` VALUES ('105', 'PH88-03', 'jingkou', '644458.4138', '3949409.207', '35.67799829573185', '118.59628990411746');
INSERT INTO `t_mappoint` VALUES ('105', 'PH56-03', 'jingkou', '642176.8753', '3946598.227', '35.65299475414599', '118.57059066061505');
INSERT INTO `t_mappoint` VALUES ('105', 'PH88-04', 'jingkou', '644586.7507', '3949695.279', '35.68055780691314', '118.59775896514007');
INSERT INTO `t_mappoint` VALUES ('105', 'PH66-05', 'jingkou', '642598.6307', '3947479.802', '35.66087951671918', '118.57540418634292');
INSERT INTO `t_mappoint` VALUES ('105', 'PH88-02', 'jingkou', '644008.5306', '3949266.397', '35.67677703191632', '118.59129477868382');
INSERT INTO `t_mappoint` VALUES ('105', 'PH56-04', 'jingkou', '642572.4831', '3946415.014', '35.65128632019088', '118.57492693710482');
INSERT INTO `t_mappoint` VALUES ('105', 'PH66-02', 'jingkou', '642370.2253', '3947415.113', '35.660329489014096', '118.57287021956822');
INSERT INTO `t_mappoint` VALUES ('105', 'PH56-06', 'jingkou', '642430.1129', '3946669.858', '35.65360381859533', '118.57339983132138');
INSERT INTO `t_mappoint` VALUES ('105', 'PH66-01', 'jingkou', '642111.7407', '3947240.585', '35.65879375845324', '118.5699847098955');
INSERT INTO `t_mappoint` VALUES ('105', 'PH56-09', 'jingkou', '642696.1411', '3946827.752', '35.6549884566997', '118.57636557213044');
INSERT INTO `t_mappoint` VALUES ('105', 'PH56-08', 'jingkou', '642192.5931', '3946984.241', '35.65647165576007', '118.57083237255222');

-- ----------------------------
-- Table structure for t_mappro
-- ----------------------------
DROP TABLE IF EXISTS `t_mappro`;
CREATE TABLE `t_mappro` (
  `ID` int(8) NOT NULL AUTO_INCREMENT,
  `ProName` varchar(25) DEFAULT NULL,
  `FilePath` varchar(255) DEFAULT NULL,
  `AddDate` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8;

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
INSERT INTO `t_mappro` VALUES ('96', '六月地图', '', '2014-06-16 23:41:12');
INSERT INTO `t_mappro` VALUES ('97', '六月地图2', '', '2014-06-16 23:44:46');
INSERT INTO `t_mappro` VALUES ('98', '六月地图3', '', '2014-06-16 23:46:16');
INSERT INTO `t_mappro` VALUES ('99', '六月地图3', '', '2014-06-16 23:46:19');
INSERT INTO `t_mappro` VALUES ('100', '123', '', '2014-06-16 23:55:00');
INSERT INTO `t_mappro` VALUES ('101', 'XXX', 'D:\\software\\tomcat7\\webapps\\OilManage\\upload\\1402934373570.csv', '2014-06-16 23:59:39');
INSERT INTO `t_mappro` VALUES ('102', '山中项目地图', 'D:\\software\\tomcat7\\webapps\\OilManage\\upload\\1402934466380.csv', '2014-06-17 00:01:08');
INSERT INTO `t_mappro` VALUES ('105', '测试地图', 'D:\\software\\tomcat7\\webapps\\OilManage\\upload\\1402934623449.csv', '2014-06-17 00:03:45');

-- ----------------------------
-- Table structure for t_measure
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
-- Table structure for t_parameters
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
-- Table structure for t_physical
-- ----------------------------
DROP TABLE IF EXISTS `t_physical`;
CREATE TABLE `t_physical` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CName` varchar(32) DEFAULT NULL,
  `EName` varchar(32) DEFAULT NULL,
  `Description` varchar(50) DEFAULT NULL,
  `ISOBasicUnit` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

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

-- ----------------------------
-- Table structure for t_physicalstyle
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
-- Table structure for t_projectinputs
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
-- Table structure for t_projectoutputs
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
-- Table structure for t_projects
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
-- Table structure for t_roles
-- ----------------------------
DROP TABLE IF EXISTS `t_roles`;
CREATE TABLE `t_roles` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RoleName` varchar(32) DEFAULT NULL,
  `RoleDescription` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_roles
-- ----------------------------

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `Username` varchar(32) DEFAULT NULL,
  `Password` varchar(32) DEFAULT NULL,
  `AddTime` datetime DEFAULT NULL,
  `LastLoginTime` datetime DEFAULT NULL,
  `LoginTimes` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', 'ice', 'ice', null, null, null);

-- ----------------------------
-- Table structure for t_userrole
-- ----------------------------
DROP TABLE IF EXISTS `t_userrole`;
CREATE TABLE `t_userrole` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_userrole
-- ----------------------------

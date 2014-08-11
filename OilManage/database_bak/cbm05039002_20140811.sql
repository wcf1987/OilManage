/*
Navicat MySQL Data Transfer

Source Server         : Oil
Source Server Version : 50616
Source Host           : localhost:3306
Source Database       : cbm05039002

Target Server Type    : MYSQL
Target Server Version : 50616
File Encoding         : 65001

Date: 2014-08-11 21:09:26
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_algorithmgraph
-- ----------------------------
DROP TABLE IF EXISTS `t_algorithmgraph`;
CREATE TABLE `t_algorithmgraph` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `CycleID` int(11) DEFAULT NULL,
  `graphType` int(11) DEFAULT NULL,
  `graphname` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_algorithmgraph
-- ----------------------------
INSERT INTO `t_algorithmgraph` VALUES ('1', '0', '0', null);
INSERT INTO `t_algorithmgraph` VALUES ('10', '24', '1', '身高排排坐');
INSERT INTO `t_algorithmgraph` VALUES ('11', '24', '0', 'sinX曲线');
INSERT INTO `t_algorithmgraph` VALUES ('12', '24', '2', '大柱子');
INSERT INTO `t_algorithmgraph` VALUES ('13', '24', '1', '身高二次试试');
INSERT INTO `t_algorithmgraph` VALUES ('14', '26', '0', '测试');
INSERT INTO `t_algorithmgraph` VALUES ('15', '27', '0', '测试321');

-- ----------------------------
-- Table structure for t_algorithminput
-- ----------------------------
DROP TABLE IF EXISTS `t_algorithminput`;
CREATE TABLE `t_algorithminput` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CycleID` int(11) DEFAULT NULL,
  `ParamID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_algorithminput
-- ----------------------------
INSERT INTO `t_algorithminput` VALUES ('13', '16', '4');
INSERT INTO `t_algorithminput` VALUES ('14', '16', '5');
INSERT INTO `t_algorithminput` VALUES ('18', '24', '19');
INSERT INTO `t_algorithminput` VALUES ('19', '24', '20');
INSERT INTO `t_algorithminput` VALUES ('20', '17', '8');
INSERT INTO `t_algorithminput` VALUES ('21', '17', '7');

-- ----------------------------
-- Table structure for t_algorithmoutput
-- ----------------------------
DROP TABLE IF EXISTS `t_algorithmoutput`;
CREATE TABLE `t_algorithmoutput` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CycleID` int(11) DEFAULT NULL,
  `ParamID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_algorithmoutput
-- ----------------------------
INSERT INTO `t_algorithmoutput` VALUES ('1', '12', '2');
INSERT INTO `t_algorithmoutput` VALUES ('2', '12', '3');
INSERT INTO `t_algorithmoutput` VALUES ('3', '13', '6');
INSERT INTO `t_algorithmoutput` VALUES ('4', '14', '6');
INSERT INTO `t_algorithmoutput` VALUES ('5', '15', '6');
INSERT INTO `t_algorithmoutput` VALUES ('6', '16', '6');
INSERT INTO `t_algorithmoutput` VALUES ('9', '18', '20');
INSERT INTO `t_algorithmoutput` VALUES ('11', '24', '9');
INSERT INTO `t_algorithmoutput` VALUES ('12', '17', '9');

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
  `alg_type` int(11) DEFAULT NULL,
  `structFileIn` varchar(255) DEFAULT NULL,
  `structFileOut` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_algorithmscycle
-- ----------------------------
INSERT INTO `t_algorithmscycle` VALUES ('0', '0', '0', '0', '1', '1', '2014-08-02 11:10:13', '2014-08-02 11:10:13', '井底流压计算', 'simulation.jar', 'cn.edu.cup.cbm.simulation.Test', '1', '井底流压计算输入表.xls', '井底流压计算结果.xls');
INSERT INTO `t_algorithmscycle` VALUES ('1', '0', '0', '0', '1', '1', '2014-08-02 11:10:13', '2014-08-02 11:10:13', '单气相管网水力计算', 'simulation.jar', 'cn.edu.cup.cbm.simulation.Test', '1', '单气相管网水力计算输入表.xls', '单气相管网水力计算结果.xls');
INSERT INTO `t_algorithmscycle` VALUES ('2', '0', '0', '0', '1', '1', '2014-08-02 11:10:13', '2014-08-02 11:10:13', '单气相管网热力计算', 'WellboreSimulation.jar', 'cn.edu.cup.cbm.wellbore.Test', '1', '单气相管网热力计算输入表.xls', '单气相管网热力计算结果.xls');
INSERT INTO `t_algorithmscycle` VALUES ('3', '0', '0', '0', '1', '1', '2014-08-02 11:10:13', '2014-08-02 11:10:13', '气固两相管网水力计算', 'WellboreSimulation.jar', 'cn.edu.cup.cbm.wellbore.Test', '1', '气固两相管网水力计算输入表.xls', '气固两相管网水力计算结果.xls');
INSERT INTO `t_algorithmscycle` VALUES ('4', '0', '0', '0', '1', '1', '2014-08-02 11:10:13', '2014-08-02 11:10:13', '气液两相管网水力计算', 'WellboreSimulation.jar', 'cn.edu.cup.cbm.wellbore.Test', '1', '气液两相管网水力计算输入表.xls', '气液两相管网水力计算结果.xls');
INSERT INTO `t_algorithmscycle` VALUES ('16', '0', '0', '0', '1', 'final', '2014-03-28 10:47:45', '2014-03-28 10:47:45', '相加测试final', 'D:\\software\\tomcat7\\webapps\\OilManage\\uploadAlgorithm\\1395974864047.alg', 'TestAlg', null, null, null);
INSERT INTO `t_algorithmscycle` VALUES ('17', '0', '0', '0', '1', '根据直角边算斜边', '2014-03-31 16:04:44', '2014-03-31 16:04:44', '勾股定理', 'D:\\software\\tomcat7\\webapps\\OilManage\\uploadAlgorithm\\1396253083568.alg', 'TestGG', null, null, null);
INSERT INTO `t_algorithmscycle` VALUES ('24', '0', '0', '0', '1', '列表算法测试', '2014-07-22 22:01:14', '2014-07-22 22:01:14', '列表算法测试', 'D:\\software\\tomcat7\\webapps\\OilManage\\uploadAlgorithm\\1406037670182.alg', 'TestList', null, null, null);
INSERT INTO `t_algorithmscycle` VALUES ('25', '0', '0', '0', '1', '1', '2014-08-02 11:10:13', '2014-08-02 11:10:13', '新算法设计测试_office', '', 'test', '1', 'E:\\\\work profit\\\\中科院可视化界面\\\\模拟程序参数表\\\\模拟程序参数表\\\\单气相管网水力计算.xls', null);

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_algrole
-- ----------------------------
INSERT INTO `t_algrole` VALUES ('1', '1', '17', '0', '0');

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
  `status` int(50) DEFAULT NULL,
  `info` varchar(500) DEFAULT NULL,
  `filein` varchar(255) DEFAULT NULL,
  `fileout` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_calchis
-- ----------------------------
INSERT INTO `t_calchis` VALUES ('1', null, '14', null, null, null, null, null, null);
INSERT INTO `t_calchis` VALUES ('3', '3', '14', '2014-03-27 10:54:13', '2014-03-27 10:54:20', '0', null, null, null);
INSERT INTO `t_calchis` VALUES ('4', '3', '14', '2014-03-27 10:54:16', '2014-03-27 10:54:42', '0', null, null, null);
INSERT INTO `t_calchis` VALUES ('5', '3', '14', '2014-03-28 10:41:05', '2014-03-28 10:41:25', '0', null, null, null);
INSERT INTO `t_calchis` VALUES ('6', '3', '14', '2014-03-28 10:50:04', '2014-03-28 10:50:26', '0', null, null, null);
INSERT INTO `t_calchis` VALUES ('7', '3', '14', '2014-03-28 10:51:58', '2014-03-28 10:52:14', '0', null, null, null);
INSERT INTO `t_calchis` VALUES ('8', '5', '16', '2014-03-28 10:52:44', '2014-03-28 10:52:44', '0', null, null, null);
INSERT INTO `t_calchis` VALUES ('9', '5', '16', '2014-03-28 10:53:25', '2014-03-28 10:53:25', '0', null, null, null);
INSERT INTO `t_calchis` VALUES ('10', '5', '16', '2014-03-28 11:09:55', '2014-03-28 11:09:55', '0', null, null, null);
INSERT INTO `t_calchis` VALUES ('11', '5', '16', '2014-03-28 11:10:03', '2014-03-28 11:10:03', '0', null, null, null);
INSERT INTO `t_calchis` VALUES ('12', '5', '16', '2014-03-28 11:16:15', '2014-03-28 11:16:15', '0', null, null, null);
INSERT INTO `t_calchis` VALUES ('13', '5', '16', '2014-03-28 11:16:20', '2014-03-28 11:16:20', '0', null, null, null);
INSERT INTO `t_calchis` VALUES ('14', '5', '16', '2014-03-31 15:46:09', '2014-03-31 15:46:10', null, null, null, null);
INSERT INTO `t_calchis` VALUES ('15', '5', '16', '2014-03-31 15:47:28', '2014-03-31 15:48:00', null, null, null, null);
INSERT INTO `t_calchis` VALUES ('16', '5', '16', '2014-03-31 15:57:20', '2014-03-31 15:57:25', null, null, null, null);
INSERT INTO `t_calchis` VALUES ('17', '6', '17', '2014-03-31 16:05:55', '2014-03-31 16:05:56', null, null, null, null);
INSERT INTO `t_calchis` VALUES ('18', '6', '17', '2014-03-31 16:08:01', '2014-03-31 16:08:02', null, null, null, null);
INSERT INTO `t_calchis` VALUES ('19', '6', '17', '2014-03-31 16:12:11', '2014-03-31 16:12:11', null, null, null, null);
INSERT INTO `t_calchis` VALUES ('20', '7', '24', '2014-07-22 22:24:30', '2014-07-22 22:24:42', null, null, null, null);
INSERT INTO `t_calchis` VALUES ('21', '7', '24', '2014-07-22 22:26:15', '2014-07-22 22:26:24', null, null, null, null);
INSERT INTO `t_calchis` VALUES ('22', '7', '24', '2014-07-22 22:26:51', '2014-07-22 22:26:53', null, null, null, null);
INSERT INTO `t_calchis` VALUES ('23', '7', '24', '2014-07-22 22:28:29', '2014-07-22 22:28:33', null, null, null, null);
INSERT INTO `t_calchis` VALUES ('24', '7', '24', '2014-07-22 22:38:36', '2014-07-22 22:38:35', null, null, null, null);
INSERT INTO `t_calchis` VALUES ('25', '7', '24', '2014-07-27 18:42:05', '2014-07-27 18:42:05', null, null, null, null);
INSERT INTO `t_calchis` VALUES ('26', '8', '24', '2014-07-28 21:39:56', '2014-07-28 21:39:56', null, null, null, null);
INSERT INTO `t_calchis` VALUES ('27', '8', '24', '2014-07-29 14:08:19', '2014-07-29 14:08:18', null, null, null, null);
INSERT INTO `t_calchis` VALUES ('28', '9', '16', '2014-07-29 14:45:14', '2014-07-29 14:45:14', null, null, null, null);
INSERT INTO `t_calchis` VALUES ('29', '9', '16', '2014-07-29 14:48:17', '2014-07-29 14:48:16', null, null, null, null);
INSERT INTO `t_calchis` VALUES ('30', '9', '17', '2014-07-29 15:19:23', '2014-07-29 15:19:22', null, null, null, null);
INSERT INTO `t_calchis` VALUES ('31', '9', '17', '2014-07-29 15:20:10', '2014-07-29 15:20:09', null, null, null, null);
INSERT INTO `t_calchis` VALUES ('32', '9', '17', '2014-07-29 15:20:33', '2014-07-29 15:20:32', null, null, null, null);
INSERT INTO `t_calchis` VALUES ('40', '19', '1', '2014-08-07 17:17:39', '2014-08-07 17:17:39', '2', '成功运行', null, null);
INSERT INTO `t_calchis` VALUES ('41', '19', '1', '2014-08-07 17:20:07', '2014-08-07 17:20:07', '2', '成功运行', null, null);
INSERT INTO `t_calchis` VALUES ('42', '20', '1', '2014-08-08 11:40:46', '2014-08-08 11:40:51', '0', '成功运行', null, null);
INSERT INTO `t_calchis` VALUES ('43', '21', '1', '2014-08-10 21:40:30', null, null, null, null, null);
INSERT INTO `t_calchis` VALUES ('44', '21', '1', '2014-08-10 21:42:19', null, null, null, null, null);
INSERT INTO `t_calchis` VALUES ('45', '22', '1', '2014-08-10 21:48:13', null, null, null, null, null);
INSERT INTO `t_calchis` VALUES ('46', '22', '1', '2014-08-10 21:50:14', null, null, null, null, null);
INSERT INTO `t_calchis` VALUES ('47', '33', '1', '2014-08-10 22:34:01', null, null, null, null, null);
INSERT INTO `t_calchis` VALUES ('48', '33', '1', '2014-08-10 22:35:21', null, null, null, null, null);
INSERT INTO `t_calchis` VALUES ('49', '36', '1', '2014-08-11 18:41:10', '2014-08-11 18:41:10', '0', null, null, null);
INSERT INTO `t_calchis` VALUES ('50', '36', '1', '2014-08-11 19:07:15', '2014-08-11 19:07:20', '3', '成功运行', null, null);
INSERT INTO `t_calchis` VALUES ('51', '44', '0', '2014-08-11 20:48:00', '2014-08-11 20:48:01', '0', '成功运行', null, null);

-- ----------------------------
-- Table structure for t_calchis_log
-- ----------------------------
DROP TABLE IF EXISTS `t_calchis_log`;
CREATE TABLE `t_calchis_log` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Pro_ID` int(11) DEFAULT NULL,
  `par_id` int(11) DEFAULT NULL,
  `info` varchar(500) DEFAULT NULL,
  `logtime` datetime DEFAULT NULL,
  `calchis_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_calchis_log
-- ----------------------------
INSERT INTO `t_calchis_log` VALUES ('103', '19', null, '开始运行算法1，已计算50%', '2014-08-07 17:10:26', '37');
INSERT INTO `t_calchis_log` VALUES ('104', '19', null, '正在运行，已计算50%', '2014-08-07 17:10:26', '37');
INSERT INTO `t_calchis_log` VALUES ('105', '19', null, '开始运行算法1，已计算50%', '2014-08-07 17:11:37', '38');
INSERT INTO `t_calchis_log` VALUES ('106', '19', null, '正在运行，已计算50%', '2014-08-07 17:11:37', '38');
INSERT INTO `t_calchis_log` VALUES ('107', '19', null, '开始运行算法1，已计算50%', '2014-08-07 17:13:26', '39');
INSERT INTO `t_calchis_log` VALUES ('108', '19', null, '正在运行，已计算50%', '2014-08-07 17:13:26', '39');
INSERT INTO `t_calchis_log` VALUES ('109', '19', null, '开始运行算法1，已计算50%', '2014-08-07 17:17:39', '40');
INSERT INTO `t_calchis_log` VALUES ('110', '19', null, '正在运行，已计算50%', '2014-08-07 17:17:39', '40');
INSERT INTO `t_calchis_log` VALUES ('111', '19', null, '开始运行算法1，已计算50%', '2014-08-07 17:20:07', '41');
INSERT INTO `t_calchis_log` VALUES ('112', '19', null, '正在运行，已计算50%', '2014-08-07 17:20:07', '41');
INSERT INTO `t_calchis_log` VALUES ('113', '20', null, '开始运行算法1，已计算50%', '2014-08-08 11:40:51', '42');
INSERT INTO `t_calchis_log` VALUES ('114', '20', null, '正在运行，已计算50%', '2014-08-08 11:40:51', '42');
INSERT INTO `t_calchis_log` VALUES ('115', '36', null, null, '2014-08-11 18:41:10', '49');
INSERT INTO `t_calchis_log` VALUES ('116', '36', null, '成功运行', '2014-08-11 19:07:20', '50');
INSERT INTO `t_calchis_log` VALUES ('117', '44', null, '成功运行', '2014-08-11 20:48:01', '51');

-- ----------------------------
-- Table structure for t_calcinputlist_his
-- ----------------------------
DROP TABLE IF EXISTS `t_calcinputlist_his`;
CREATE TABLE `t_calcinputlist_his` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `UUID` varchar(32) DEFAULT NULL,
  `Pro_ID` int(11) DEFAULT NULL,
  `Par_ID` int(11) DEFAULT NULL,
  `list_index` int(11) DEFAULT NULL,
  `list_value` double DEFAULT NULL,
  `list_ISOValue` double DEFAULT NULL,
  `Calc_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=146 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_calcinputlist_his
-- ----------------------------
INSERT INTO `t_calcinputlist_his` VALUES ('1', '9f6ca69bdd5d476ab13edca1b5f1317c', '7', '19', '0', '1', '1609.344', '22');
INSERT INTO `t_calcinputlist_his` VALUES ('2', '9f6ca69bdd5d476ab13edca1b5f1317c', '7', '19', '1', '3', '4828.032', '22');
INSERT INTO `t_calcinputlist_his` VALUES ('3', '9f6ca69bdd5d476ab13edca1b5f1317c', '7', '19', '2', '421', '677533.824', '22');
INSERT INTO `t_calcinputlist_his` VALUES ('4', '9f6ca69bdd5d476ab13edca1b5f1317c', '7', '19', '3', '2', '3218.688', '22');
INSERT INTO `t_calcinputlist_his` VALUES ('5', '9f6ca69bdd5d476ab13edca1b5f1317c', '7', '19', '4', '12', '19312.128', '22');
INSERT INTO `t_calcinputlist_his` VALUES ('6', '9f6ca69bdd5d476ab13edca1b5f1317c', '7', '19', '5', '32', '51499.008', '22');
INSERT INTO `t_calcinputlist_his` VALUES ('7', '3376575e3d0447cea6af05f34edd5549', '7', '20', '0', '1', '0.3048', '22');
INSERT INTO `t_calcinputlist_his` VALUES ('8', '3376575e3d0447cea6af05f34edd5549', '7', '20', '1', '3', '0.9144000000000001', '22');
INSERT INTO `t_calcinputlist_his` VALUES ('9', '3376575e3d0447cea6af05f34edd5549', '7', '20', '2', '421', '128.32080000000002', '22');
INSERT INTO `t_calcinputlist_his` VALUES ('10', '3376575e3d0447cea6af05f34edd5549', '7', '20', '3', '2', '0.6096', '22');
INSERT INTO `t_calcinputlist_his` VALUES ('11', '3376575e3d0447cea6af05f34edd5549', '7', '20', '4', '12', '3.6576000000000004', '22');
INSERT INTO `t_calcinputlist_his` VALUES ('12', '3376575e3d0447cea6af05f34edd5549', '7', '20', '5', '32', '9.7536', '22');
INSERT INTO `t_calcinputlist_his` VALUES ('13', 'adc983b0d08d4e67a1f2b49b549d9292', '7', '19', '0', '1', '1609.344', '22');
INSERT INTO `t_calcinputlist_his` VALUES ('14', 'adc983b0d08d4e67a1f2b49b549d9292', '7', '19', '1', '3', '4828.032', '22');
INSERT INTO `t_calcinputlist_his` VALUES ('15', 'adc983b0d08d4e67a1f2b49b549d9292', '7', '19', '2', '6', '9656.064', '22');
INSERT INTO `t_calcinputlist_his` VALUES ('16', 'adc983b0d08d4e67a1f2b49b549d9292', '7', '19', '3', '68', '109435.392', '22');
INSERT INTO `t_calcinputlist_his` VALUES ('17', 'adc983b0d08d4e67a1f2b49b549d9292', '7', '19', '4', '316', '508552.704', '22');
INSERT INTO `t_calcinputlist_his` VALUES ('18', 'c825274ea2614eee9fab5c465890101d', '7', '20', '0', '1', '0.3048', '22');
INSERT INTO `t_calcinputlist_his` VALUES ('19', 'c825274ea2614eee9fab5c465890101d', '7', '20', '1', '3', '0.9144000000000001', '22');
INSERT INTO `t_calcinputlist_his` VALUES ('20', 'c825274ea2614eee9fab5c465890101d', '7', '20', '2', '6', '1.8288000000000002', '22');
INSERT INTO `t_calcinputlist_his` VALUES ('21', 'c825274ea2614eee9fab5c465890101d', '7', '20', '3', '68', '20.7264', '22');
INSERT INTO `t_calcinputlist_his` VALUES ('22', 'c825274ea2614eee9fab5c465890101d', '7', '20', '4', '316', '96.3168', '22');
INSERT INTO `t_calcinputlist_his` VALUES ('23', 'efec2137b4474c2999fa7ed531d43476', '7', '19', '0', '1', '1609.344', '22');
INSERT INTO `t_calcinputlist_his` VALUES ('24', 'efec2137b4474c2999fa7ed531d43476', '7', '19', '1', '3', '4828.032', '22');
INSERT INTO `t_calcinputlist_his` VALUES ('25', 'efec2137b4474c2999fa7ed531d43476', '7', '19', '2', '6', '9656.064', '22');
INSERT INTO `t_calcinputlist_his` VALUES ('26', 'efec2137b4474c2999fa7ed531d43476', '7', '19', '3', '68', '109435.392', '22');
INSERT INTO `t_calcinputlist_his` VALUES ('27', 'efec2137b4474c2999fa7ed531d43476', '7', '19', '4', '316', '508552.704', '22');
INSERT INTO `t_calcinputlist_his` VALUES ('32', '9f6ca69bdd5d476ab13edca1b5f1317c', '7', '19', '0', '1', '1609.344', '23');
INSERT INTO `t_calcinputlist_his` VALUES ('33', '9f6ca69bdd5d476ab13edca1b5f1317c', '7', '19', '1', '3', '4828.032', '23');
INSERT INTO `t_calcinputlist_his` VALUES ('34', '9f6ca69bdd5d476ab13edca1b5f1317c', '7', '19', '2', '421', '677533.824', '23');
INSERT INTO `t_calcinputlist_his` VALUES ('35', '9f6ca69bdd5d476ab13edca1b5f1317c', '7', '19', '3', '2', '3218.688', '23');
INSERT INTO `t_calcinputlist_his` VALUES ('36', '9f6ca69bdd5d476ab13edca1b5f1317c', '7', '19', '4', '12', '19312.128', '23');
INSERT INTO `t_calcinputlist_his` VALUES ('37', '9f6ca69bdd5d476ab13edca1b5f1317c', '7', '19', '5', '32', '51499.008', '23');
INSERT INTO `t_calcinputlist_his` VALUES ('38', '3376575e3d0447cea6af05f34edd5549', '7', '20', '0', '1', '0.3048', '23');
INSERT INTO `t_calcinputlist_his` VALUES ('39', '3376575e3d0447cea6af05f34edd5549', '7', '20', '1', '3', '0.9144000000000001', '23');
INSERT INTO `t_calcinputlist_his` VALUES ('40', '3376575e3d0447cea6af05f34edd5549', '7', '20', '2', '421', '128.32080000000002', '23');
INSERT INTO `t_calcinputlist_his` VALUES ('41', '3376575e3d0447cea6af05f34edd5549', '7', '20', '3', '2', '0.6096', '23');
INSERT INTO `t_calcinputlist_his` VALUES ('42', '3376575e3d0447cea6af05f34edd5549', '7', '20', '4', '12', '3.6576000000000004', '23');
INSERT INTO `t_calcinputlist_his` VALUES ('43', '3376575e3d0447cea6af05f34edd5549', '7', '20', '5', '32', '9.7536', '23');
INSERT INTO `t_calcinputlist_his` VALUES ('44', 'adc983b0d08d4e67a1f2b49b549d9292', '7', '19', '0', '1', '1609.344', '23');
INSERT INTO `t_calcinputlist_his` VALUES ('45', 'adc983b0d08d4e67a1f2b49b549d9292', '7', '19', '1', '3', '4828.032', '23');
INSERT INTO `t_calcinputlist_his` VALUES ('46', 'adc983b0d08d4e67a1f2b49b549d9292', '7', '19', '2', '6', '9656.064', '23');
INSERT INTO `t_calcinputlist_his` VALUES ('47', 'adc983b0d08d4e67a1f2b49b549d9292', '7', '19', '3', '68', '109435.392', '23');
INSERT INTO `t_calcinputlist_his` VALUES ('48', 'adc983b0d08d4e67a1f2b49b549d9292', '7', '19', '4', '316', '508552.704', '23');
INSERT INTO `t_calcinputlist_his` VALUES ('49', 'c825274ea2614eee9fab5c465890101d', '7', '20', '0', '1', '0.3048', '23');
INSERT INTO `t_calcinputlist_his` VALUES ('50', 'c825274ea2614eee9fab5c465890101d', '7', '20', '1', '3', '0.9144000000000001', '23');
INSERT INTO `t_calcinputlist_his` VALUES ('51', 'c825274ea2614eee9fab5c465890101d', '7', '20', '2', '6', '1.8288000000000002', '23');
INSERT INTO `t_calcinputlist_his` VALUES ('52', 'c825274ea2614eee9fab5c465890101d', '7', '20', '3', '68', '20.7264', '23');
INSERT INTO `t_calcinputlist_his` VALUES ('53', 'c825274ea2614eee9fab5c465890101d', '7', '20', '4', '316', '96.3168', '23');
INSERT INTO `t_calcinputlist_his` VALUES ('54', 'efec2137b4474c2999fa7ed531d43476', '7', '19', '0', '1', '1609.344', '23');
INSERT INTO `t_calcinputlist_his` VALUES ('55', 'efec2137b4474c2999fa7ed531d43476', '7', '19', '1', '3', '4828.032', '23');
INSERT INTO `t_calcinputlist_his` VALUES ('56', 'efec2137b4474c2999fa7ed531d43476', '7', '19', '2', '6', '9656.064', '23');
INSERT INTO `t_calcinputlist_his` VALUES ('57', 'efec2137b4474c2999fa7ed531d43476', '7', '19', '3', '68', '109435.392', '23');
INSERT INTO `t_calcinputlist_his` VALUES ('58', 'efec2137b4474c2999fa7ed531d43476', '7', '19', '4', '316', '508552.704', '23');
INSERT INTO `t_calcinputlist_his` VALUES ('63', '9f6ca69bdd5d476ab13edca1b5f1317c', '7', '19', '0', '1', '1609.344', '24');
INSERT INTO `t_calcinputlist_his` VALUES ('64', '9f6ca69bdd5d476ab13edca1b5f1317c', '7', '19', '1', '3', '4828.032', '24');
INSERT INTO `t_calcinputlist_his` VALUES ('65', '9f6ca69bdd5d476ab13edca1b5f1317c', '7', '19', '2', '421', '677533.824', '24');
INSERT INTO `t_calcinputlist_his` VALUES ('66', '9f6ca69bdd5d476ab13edca1b5f1317c', '7', '19', '3', '2', '3218.688', '24');
INSERT INTO `t_calcinputlist_his` VALUES ('67', '9f6ca69bdd5d476ab13edca1b5f1317c', '7', '19', '4', '12', '19312.128', '24');
INSERT INTO `t_calcinputlist_his` VALUES ('68', '9f6ca69bdd5d476ab13edca1b5f1317c', '7', '19', '5', '32', '51499.008', '24');
INSERT INTO `t_calcinputlist_his` VALUES ('69', '3376575e3d0447cea6af05f34edd5549', '7', '20', '0', '1', '0.3048', '24');
INSERT INTO `t_calcinputlist_his` VALUES ('70', '3376575e3d0447cea6af05f34edd5549', '7', '20', '1', '3', '0.9144000000000001', '24');
INSERT INTO `t_calcinputlist_his` VALUES ('71', '3376575e3d0447cea6af05f34edd5549', '7', '20', '2', '421', '128.32080000000002', '24');
INSERT INTO `t_calcinputlist_his` VALUES ('72', '3376575e3d0447cea6af05f34edd5549', '7', '20', '3', '2', '0.6096', '24');
INSERT INTO `t_calcinputlist_his` VALUES ('73', '3376575e3d0447cea6af05f34edd5549', '7', '20', '4', '12', '3.6576000000000004', '24');
INSERT INTO `t_calcinputlist_his` VALUES ('74', '3376575e3d0447cea6af05f34edd5549', '7', '20', '5', '32', '9.7536', '24');
INSERT INTO `t_calcinputlist_his` VALUES ('75', 'adc983b0d08d4e67a1f2b49b549d9292', '7', '19', '0', '1', '1609.344', '24');
INSERT INTO `t_calcinputlist_his` VALUES ('76', 'adc983b0d08d4e67a1f2b49b549d9292', '7', '19', '1', '3', '4828.032', '24');
INSERT INTO `t_calcinputlist_his` VALUES ('77', 'adc983b0d08d4e67a1f2b49b549d9292', '7', '19', '2', '6', '9656.064', '24');
INSERT INTO `t_calcinputlist_his` VALUES ('78', 'adc983b0d08d4e67a1f2b49b549d9292', '7', '19', '3', '68', '109435.392', '24');
INSERT INTO `t_calcinputlist_his` VALUES ('79', 'adc983b0d08d4e67a1f2b49b549d9292', '7', '19', '4', '316', '508552.704', '24');
INSERT INTO `t_calcinputlist_his` VALUES ('80', 'c825274ea2614eee9fab5c465890101d', '7', '20', '0', '1', '0.3048', '24');
INSERT INTO `t_calcinputlist_his` VALUES ('81', 'c825274ea2614eee9fab5c465890101d', '7', '20', '1', '3', '0.9144000000000001', '24');
INSERT INTO `t_calcinputlist_his` VALUES ('82', 'c825274ea2614eee9fab5c465890101d', '7', '20', '2', '6', '1.8288000000000002', '24');
INSERT INTO `t_calcinputlist_his` VALUES ('83', 'c825274ea2614eee9fab5c465890101d', '7', '20', '3', '68', '20.7264', '24');
INSERT INTO `t_calcinputlist_his` VALUES ('84', 'c825274ea2614eee9fab5c465890101d', '7', '20', '4', '316', '96.3168', '24');
INSERT INTO `t_calcinputlist_his` VALUES ('85', 'e97e019d6409489ca2766f98f9d41205', '7', '19', '0', '1', '1609.344', '24');
INSERT INTO `t_calcinputlist_his` VALUES ('86', 'e97e019d6409489ca2766f98f9d41205', '7', '19', '1', '3', '4828.032', '24');
INSERT INTO `t_calcinputlist_his` VALUES ('87', 'e97e019d6409489ca2766f98f9d41205', '7', '19', '2', '6', '9656.064', '24');
INSERT INTO `t_calcinputlist_his` VALUES ('88', 'e97e019d6409489ca2766f98f9d41205', '7', '19', '3', '68', '109435.392', '24');
INSERT INTO `t_calcinputlist_his` VALUES ('89', 'e97e019d6409489ca2766f98f9d41205', '7', '19', '4', '316', '508552.704', '24');
INSERT INTO `t_calcinputlist_his` VALUES ('94', '9f6ca69bdd5d476ab13edca1b5f1317c', '7', '19', '0', '1', '1609.344', '25');
INSERT INTO `t_calcinputlist_his` VALUES ('95', '9f6ca69bdd5d476ab13edca1b5f1317c', '7', '19', '1', '3', '4828.032', '25');
INSERT INTO `t_calcinputlist_his` VALUES ('96', '9f6ca69bdd5d476ab13edca1b5f1317c', '7', '19', '2', '421', '677533.824', '25');
INSERT INTO `t_calcinputlist_his` VALUES ('97', '9f6ca69bdd5d476ab13edca1b5f1317c', '7', '19', '3', '2', '3218.688', '25');
INSERT INTO `t_calcinputlist_his` VALUES ('98', '9f6ca69bdd5d476ab13edca1b5f1317c', '7', '19', '4', '12', '19312.128', '25');
INSERT INTO `t_calcinputlist_his` VALUES ('99', '9f6ca69bdd5d476ab13edca1b5f1317c', '7', '19', '5', '32', '51499.008', '25');
INSERT INTO `t_calcinputlist_his` VALUES ('100', '3376575e3d0447cea6af05f34edd5549', '7', '20', '0', '1', '0.3048', '25');
INSERT INTO `t_calcinputlist_his` VALUES ('101', '3376575e3d0447cea6af05f34edd5549', '7', '20', '1', '3', '0.9144000000000001', '25');
INSERT INTO `t_calcinputlist_his` VALUES ('102', '3376575e3d0447cea6af05f34edd5549', '7', '20', '2', '421', '128.32080000000002', '25');
INSERT INTO `t_calcinputlist_his` VALUES ('103', '3376575e3d0447cea6af05f34edd5549', '7', '20', '3', '2', '0.6096', '25');
INSERT INTO `t_calcinputlist_his` VALUES ('104', '3376575e3d0447cea6af05f34edd5549', '7', '20', '4', '12', '3.6576000000000004', '25');
INSERT INTO `t_calcinputlist_his` VALUES ('105', '3376575e3d0447cea6af05f34edd5549', '7', '20', '5', '32', '9.7536', '25');
INSERT INTO `t_calcinputlist_his` VALUES ('106', 'adc983b0d08d4e67a1f2b49b549d9292', '7', '19', '0', '1', '1609.344', '25');
INSERT INTO `t_calcinputlist_his` VALUES ('107', 'adc983b0d08d4e67a1f2b49b549d9292', '7', '19', '1', '3', '4828.032', '25');
INSERT INTO `t_calcinputlist_his` VALUES ('108', 'adc983b0d08d4e67a1f2b49b549d9292', '7', '19', '2', '6', '9656.064', '25');
INSERT INTO `t_calcinputlist_his` VALUES ('109', 'adc983b0d08d4e67a1f2b49b549d9292', '7', '19', '3', '68', '109435.392', '25');
INSERT INTO `t_calcinputlist_his` VALUES ('110', 'adc983b0d08d4e67a1f2b49b549d9292', '7', '19', '4', '316', '508552.704', '25');
INSERT INTO `t_calcinputlist_his` VALUES ('111', 'c825274ea2614eee9fab5c465890101d', '7', '20', '0', '1', '0.3048', '25');
INSERT INTO `t_calcinputlist_his` VALUES ('112', 'c825274ea2614eee9fab5c465890101d', '7', '20', '1', '3', '0.9144000000000001', '25');
INSERT INTO `t_calcinputlist_his` VALUES ('113', 'c825274ea2614eee9fab5c465890101d', '7', '20', '2', '6', '1.8288000000000002', '25');
INSERT INTO `t_calcinputlist_his` VALUES ('114', 'c825274ea2614eee9fab5c465890101d', '7', '20', '3', '68', '20.7264', '25');
INSERT INTO `t_calcinputlist_his` VALUES ('115', 'c825274ea2614eee9fab5c465890101d', '7', '20', '4', '316', '96.3168', '25');
INSERT INTO `t_calcinputlist_his` VALUES ('116', '3a9c4638224a438d8013cb69e5de208b', '7', '19', '0', '1', '1609.344', '25');
INSERT INTO `t_calcinputlist_his` VALUES ('117', '3a9c4638224a438d8013cb69e5de208b', '7', '19', '1', '3', '4828.032', '25');
INSERT INTO `t_calcinputlist_his` VALUES ('118', '3a9c4638224a438d8013cb69e5de208b', '7', '19', '2', '6', '9656.064', '25');
INSERT INTO `t_calcinputlist_his` VALUES ('119', '3a9c4638224a438d8013cb69e5de208b', '7', '19', '3', '68', '109435.392', '25');
INSERT INTO `t_calcinputlist_his` VALUES ('120', '3a9c4638224a438d8013cb69e5de208b', '7', '19', '4', '316', '508552.704', '25');
INSERT INTO `t_calcinputlist_his` VALUES ('121', '3627e65576d4402485c831e09d3e800e', '8', '20', '0', '1', '0.3048', '26');
INSERT INTO `t_calcinputlist_his` VALUES ('122', '3627e65576d4402485c831e09d3e800e', '8', '20', '1', '2', '0.6096', '26');
INSERT INTO `t_calcinputlist_his` VALUES ('123', '3627e65576d4402485c831e09d3e800e', '8', '20', '2', '3', '0.9144000000000001', '26');
INSERT INTO `t_calcinputlist_his` VALUES ('124', '3627e65576d4402485c831e09d3e800e', '8', '20', '3', '4', '1.2192', '26');
INSERT INTO `t_calcinputlist_his` VALUES ('125', '3627e65576d4402485c831e09d3e800e', '8', '20', '4', '5', '1.524', '26');
INSERT INTO `t_calcinputlist_his` VALUES ('126', 'dede26581f714740b0a1db09d6ed74c0', '8', '19', '0', '1', '1609.344', '26');
INSERT INTO `t_calcinputlist_his` VALUES ('127', 'dede26581f714740b0a1db09d6ed74c0', '8', '19', '1', '2', '3218.688', '26');
INSERT INTO `t_calcinputlist_his` VALUES ('128', 'dede26581f714740b0a1db09d6ed74c0', '8', '19', '2', '3', '4828.032', '26');
INSERT INTO `t_calcinputlist_his` VALUES ('129', 'dede26581f714740b0a1db09d6ed74c0', '8', '19', '3', '4', '6437.376', '26');
INSERT INTO `t_calcinputlist_his` VALUES ('130', 'dede26581f714740b0a1db09d6ed74c0', '8', '19', '4', '5', '8046.72', '26');
INSERT INTO `t_calcinputlist_his` VALUES ('136', '3627e65576d4402485c831e09d3e800e', '8', '20', '0', '1', '0.3048', '27');
INSERT INTO `t_calcinputlist_his` VALUES ('137', '3627e65576d4402485c831e09d3e800e', '8', '20', '1', '2', '0.6096', '27');
INSERT INTO `t_calcinputlist_his` VALUES ('138', '3627e65576d4402485c831e09d3e800e', '8', '20', '2', '3', '0.9144000000000001', '27');
INSERT INTO `t_calcinputlist_his` VALUES ('139', '3627e65576d4402485c831e09d3e800e', '8', '20', '3', '4', '1.2192', '27');
INSERT INTO `t_calcinputlist_his` VALUES ('140', '3627e65576d4402485c831e09d3e800e', '8', '20', '4', '5', '1.524', '27');
INSERT INTO `t_calcinputlist_his` VALUES ('141', 'dede26581f714740b0a1db09d6ed74c0', '8', '19', '0', '1', '1609.344', '27');
INSERT INTO `t_calcinputlist_his` VALUES ('142', 'dede26581f714740b0a1db09d6ed74c0', '8', '19', '1', '2', '3218.688', '27');
INSERT INTO `t_calcinputlist_his` VALUES ('143', 'dede26581f714740b0a1db09d6ed74c0', '8', '19', '2', '3', '4828.032', '27');
INSERT INTO `t_calcinputlist_his` VALUES ('144', 'dede26581f714740b0a1db09d6ed74c0', '8', '19', '3', '4', '6437.376', '27');
INSERT INTO `t_calcinputlist_his` VALUES ('145', 'dede26581f714740b0a1db09d6ed74c0', '8', '19', '4', '5', '8046.72', '27');

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
  `par_type` int(11) DEFAULT NULL,
  `par_listUUID` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_calcinput_his
-- ----------------------------
INSERT INTO `t_calcinput_his` VALUES ('1', '2', '1', null, '0', null, null, null, '-1', null, null);
INSERT INTO `t_calcinput_his` VALUES ('2', '2', '3', null, '0', null, null, null, '-1', null, null);
INSERT INTO `t_calcinput_his` VALUES ('4', '2', '1', null, '0', null, null, null, '-1', null, null);
INSERT INTO `t_calcinput_his` VALUES ('5', '2', '3', null, '0', null, null, null, '-1', null, null);
INSERT INTO `t_calcinput_his` VALUES ('7', '2', '1', null, '0', null, null, null, '-1', null, null);
INSERT INTO `t_calcinput_his` VALUES ('8', '2', '3', null, '0', null, null, null, '-1', null, null);
INSERT INTO `t_calcinput_his` VALUES ('9', '3', '4', '加数1', '156', 'a', '2', '15.600000000000001', '3', null, null);
INSERT INTO `t_calcinput_his` VALUES ('10', '3', '5', '加数2', '1561', 'b', '3', '15.610000000000001', '3', null, null);
INSERT INTO `t_calcinput_his` VALUES ('12', '3', '4', '加数1', '156', 'a', '2', '15.600000000000001', '4', null, null);
INSERT INTO `t_calcinput_his` VALUES ('13', '3', '5', '加数2', '1561', 'b', '3', '15.610000000000001', '4', null, null);
INSERT INTO `t_calcinput_his` VALUES ('14', '3', '4', '加数1', '156', 'a', '2', '15.600000000000001', '5', null, null);
INSERT INTO `t_calcinput_his` VALUES ('15', '3', '5', '加数2', '1561', 'b', '3', '15.610000000000001', '5', null, null);
INSERT INTO `t_calcinput_his` VALUES ('17', '3', '4', '加数1', '156', 'a', '2', '15.600000000000001', '6', null, null);
INSERT INTO `t_calcinput_his` VALUES ('18', '3', '5', '加数2', '1561', 'b', '3', '15.610000000000001', '6', null, null);
INSERT INTO `t_calcinput_his` VALUES ('20', '3', '4', '加数1', '156', 'a', '2', '15.600000000000001', '7', null, null);
INSERT INTO `t_calcinput_his` VALUES ('21', '3', '5', '加数2', '1561', 'b', '3', '15.610000000000001', '7', null, null);
INSERT INTO `t_calcinput_his` VALUES ('23', '5', '4', '加数1', '99', 'a', '2', '9.9', '8', null, null);
INSERT INTO `t_calcinput_his` VALUES ('24', '5', '5', '加数2', '154.2', 'b', '3', '1.5419999999999998', '8', null, null);
INSERT INTO `t_calcinput_his` VALUES ('26', '5', '4', '加数1', '99', 'a', '2', '9.9', '9', null, null);
INSERT INTO `t_calcinput_his` VALUES ('27', '5', '5', '加数2', '154.2', 'b', '3', '1.5419999999999998', '9', null, null);
INSERT INTO `t_calcinput_his` VALUES ('29', '5', '4', '加数1', '99', 'a', '2', '9.9', '10', null, null);
INSERT INTO `t_calcinput_his` VALUES ('30', '5', '5', '加数2', '154.2', 'b', '3', '1.5419999999999998', '10', null, null);
INSERT INTO `t_calcinput_his` VALUES ('32', '5', '4', '加数1', '99', 'a', '2', '9.9', '11', null, null);
INSERT INTO `t_calcinput_his` VALUES ('33', '5', '5', '加数2', '154.2', 'b', '3', '1.5419999999999998', '11', null, null);
INSERT INTO `t_calcinput_his` VALUES ('35', '5', '4', '加数1', '99', 'a', '2', '9.9', '12', null, null);
INSERT INTO `t_calcinput_his` VALUES ('36', '5', '5', '加数2', '154.2', 'b', '3', '1.5419999999999998', '12', null, null);
INSERT INTO `t_calcinput_his` VALUES ('38', '5', '4', '加数1', '99', 'a', '2', '9.9', '13', null, null);
INSERT INTO `t_calcinput_his` VALUES ('39', '5', '5', '加数2', '154.2', 'b', '3', '1.5419999999999998', '13', null, null);
INSERT INTO `t_calcinput_his` VALUES ('40', '5', '4', '加数1', '13.54', 'a', '2', '9.9', '14', null, null);
INSERT INTO `t_calcinput_his` VALUES ('41', '5', '5', '加数2', '154.2', 'b', '3', '1.5419999999999998', '14', null, null);
INSERT INTO `t_calcinput_his` VALUES ('43', '5', '4', '加数1', '13.54', 'a', '2', '9.9', '15', null, null);
INSERT INTO `t_calcinput_his` VALUES ('44', '5', '5', '加数2', '154.2', 'b', '3', '1.5419999999999998', '15', null, null);
INSERT INTO `t_calcinput_his` VALUES ('46', '5', '4', '加数1', '12.15', 'a', '2', '1.215', '16', null, null);
INSERT INTO `t_calcinput_his` VALUES ('47', '5', '5', '加数2', '154.2', 'b', '3', '1.5419999999999998', '16', null, null);
INSERT INTO `t_calcinput_his` VALUES ('49', '6', '7', '直角边a', '50', 'ZHIBIAN1', '3', '0.5', '17', null, null);
INSERT INTO `t_calcinput_his` VALUES ('50', '6', '8', '直角边b', '1.2', 'ZHIBIAN2', '1', '1.2', '17', null, null);
INSERT INTO `t_calcinput_his` VALUES ('52', '6', '7', '直角边a', '3', 'ZHIBIAN1', '3', '3000', '18', null, null);
INSERT INTO `t_calcinput_his` VALUES ('53', '6', '8', '直角边b', '0.04', 'ZHIBIAN2', '1', '0.00004', '18', null, null);
INSERT INTO `t_calcinput_his` VALUES ('55', '6', '7', '直角边a', '3', 'ZHIBIAN1', '3', '0.03', '19', null, null);
INSERT INTO `t_calcinput_his` VALUES ('56', '6', '8', '直角边b', '0.04', 'ZHIBIAN2', '1', '0.04', '19', null, null);
INSERT INTO `t_calcinput_his` VALUES ('57', '7', '19', '列表测试1', '0', 'listin', '9', '0', '20', null, null);
INSERT INTO `t_calcinput_his` VALUES ('58', '7', '19', '列表测试1', '0', 'listin', '9', '0', '21', null, null);
INSERT INTO `t_calcinput_his` VALUES ('59', '7', '19', '列表测试1', '0', 'listin', '9', '0', '22', null, null);
INSERT INTO `t_calcinput_his` VALUES ('60', '7', '19', '列表测试1', '0', 'listin', '9', '0', '23', null, null);
INSERT INTO `t_calcinput_his` VALUES ('61', '7', '19', '列表测试1', '0', 'listin', '9', '0', '24', null, null);
INSERT INTO `t_calcinput_his` VALUES ('62', '7', '19', '列表测试1', '0', 'listin', '9', '0', '25', null, null);
INSERT INTO `t_calcinput_his` VALUES ('63', '8', '20', '列表测试2', '0', 'listout', '6', '0', '26', null, null);
INSERT INTO `t_calcinput_his` VALUES ('64', '8', '19', '列表测试1', '0', 'listin', '9', '0', '26', null, null);
INSERT INTO `t_calcinput_his` VALUES ('66', '8', '20', '列表测试2', '0', 'listout', '6', '0', '27', null, null);
INSERT INTO `t_calcinput_his` VALUES ('67', '8', '19', '列表测试1', '0', 'listin', '9', '0', '27', null, null);
INSERT INTO `t_calcinput_his` VALUES ('68', '8', '6', '相加结果', '1', 'c', '3', '0.01', '27', null, null);
INSERT INTO `t_calcinput_his` VALUES ('69', '8', '17', '32122速度', '1', '32123的', '9', '1609.344', '27', null, null);
INSERT INTO `t_calcinput_his` VALUES ('70', '8', '6', '相加结果', '2', 'c', '3', '0.02', '27', null, null);
INSERT INTO `t_calcinput_his` VALUES ('71', '8', '17', '32122速度', '2', '32123的', '9', '3218.688', '27', null, null);
INSERT INTO `t_calcinput_his` VALUES ('73', '9', '5', '加数2', '1', 'b', '3', '0.01', '28', null, null);
INSERT INTO `t_calcinput_his` VALUES ('74', '9', '4', '加数1', '2', 'a', '2', '0.2', '28', null, null);
INSERT INTO `t_calcinput_his` VALUES ('76', '9', '5', '加数2', '1', 'b', '3', '0.01', '29', null, null);
INSERT INTO `t_calcinput_his` VALUES ('77', '9', '4', '加数1', '2', 'a', '2', '0.2', '29', null, null);
INSERT INTO `t_calcinput_his` VALUES ('79', '9', '5', '加数2', '1', 'b', '3', '0.01', '30', null, null);
INSERT INTO `t_calcinput_his` VALUES ('80', '9', '4', '加数1', '2', 'a', '2', '0.2', '30', null, null);
INSERT INTO `t_calcinput_his` VALUES ('81', '9', '7', '直角边a', '3', 'ZHIBIAN1', '3', '0.03', '30', null, null);
INSERT INTO `t_calcinput_his` VALUES ('82', '9', '8', '直角边b', '4', 'ZHIBIAN2', '1', '4', '30', null, null);
INSERT INTO `t_calcinput_his` VALUES ('86', '9', '5', '加数2', '1', 'b', '3', '0.01', '31', null, null);
INSERT INTO `t_calcinput_his` VALUES ('87', '9', '4', '加数1', '2', 'a', '2', '0.2', '31', null, null);
INSERT INTO `t_calcinput_his` VALUES ('88', '9', '7', '直角边a', '3', 'ZHIBIAN1', '3', '0.03', '31', null, null);
INSERT INTO `t_calcinput_his` VALUES ('89', '9', '8', '直角边b', '4', 'ZHIBIAN2', '1', '4', '31', null, null);
INSERT INTO `t_calcinput_his` VALUES ('90', '9', '8', '直角边b', '4', 'ZHIBIAN2', '1', '4', '31', null, null);
INSERT INTO `t_calcinput_his` VALUES ('91', '9', '7', '直角边a', '3', 'ZHIBIAN1', '3', '0.03', '31', null, null);
INSERT INTO `t_calcinput_his` VALUES ('93', '9', '5', '加数2', '1', 'b', '3', '0.01', '32', null, null);
INSERT INTO `t_calcinput_his` VALUES ('94', '9', '4', '加数1', '2', 'a', '2', '0.2', '32', null, null);
INSERT INTO `t_calcinput_his` VALUES ('95', '9', '7', '直角边a', '3', 'ZHIBIAN1', '3', '0.03', '32', null, null);
INSERT INTO `t_calcinput_his` VALUES ('96', '9', '8', '直角边b', '4', 'ZHIBIAN2', '1', '4', '32', null, null);
INSERT INTO `t_calcinput_his` VALUES ('97', '9', '8', '直角边b', '4', 'ZHIBIAN2', '1', '4', '32', null, null);
INSERT INTO `t_calcinput_his` VALUES ('98', '9', '7', '直角边a', '3', 'ZHIBIAN1', '3', '0.03', '32', null, null);
INSERT INTO `t_calcinput_his` VALUES ('99', '9', '7', '直角边a', '3', 'ZHIBIAN1', '3', '0.03', '32', null, null);
INSERT INTO `t_calcinput_his` VALUES ('100', '9', '8', '直角边b', '0.04', 'ZHIBIAN2', '1', '0.04', '32', null, null);

-- ----------------------------
-- Table structure for t_calcoutputlist_his
-- ----------------------------
DROP TABLE IF EXISTS `t_calcoutputlist_his`;
CREATE TABLE `t_calcoutputlist_his` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `UUID` varchar(32) DEFAULT NULL,
  `Pro_ID` int(11) DEFAULT NULL,
  `Par_ID` int(11) DEFAULT NULL,
  `list_index` int(11) DEFAULT NULL,
  `list_value` double DEFAULT NULL,
  `list_ISOValue` double DEFAULT NULL,
  `Calc_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_calcoutputlist_his
-- ----------------------------
INSERT INTO `t_calcoutputlist_his` VALUES ('1', '413d52fe4d2d44fe8114b8e6ed7ba3e6', '7', '20', '0', '8497336.32', '2589988.110336', '22');
INSERT INTO `t_calcoutputlist_his` VALUES ('2', '413d52fe4d2d44fe8114b8e6ed7ba3e6', '7', '20', '1', '76476026.88000001', '23309892.993024003', '22');
INSERT INTO `t_calcoutputlist_his` VALUES ('3', '413d52fe4d2d44fe8114b8e6ed7ba3e6', '7', '20', '2', '305904107.52000004', '93239571.97209601', '22');
INSERT INTO `t_calcoutputlist_his` VALUES ('4', '413d52fe4d2d44fe8114b8e6ed7ba3e6', '7', '20', '3', '39291683143.68001', '11976105022.193666', '22');
INSERT INTO `t_calcoutputlist_his` VALUES ('5', '413d52fe4d2d44fe8114b8e6ed7ba3e6', '7', '20', '4', '848510015569.92', '258625852745.71164', '22');
INSERT INTO `t_calcoutputlist_his` VALUES ('6', 'aafc4af2f89b4c8ab975cbf86f0d1234', '7', '20', '0', '8497336.32', '2589988.110336', '22');
INSERT INTO `t_calcoutputlist_his` VALUES ('7', 'aafc4af2f89b4c8ab975cbf86f0d1234', '7', '20', '1', '76476026.88000001', '23309892.993024003', '22');
INSERT INTO `t_calcoutputlist_his` VALUES ('8', 'aafc4af2f89b4c8ab975cbf86f0d1234', '7', '20', '2', '305904107.52000004', '93239571.97209601', '22');
INSERT INTO `t_calcoutputlist_his` VALUES ('9', 'aafc4af2f89b4c8ab975cbf86f0d1234', '7', '20', '3', '39291683143.68001', '11976105022.193666', '22');
INSERT INTO `t_calcoutputlist_his` VALUES ('10', 'aafc4af2f89b4c8ab975cbf86f0d1234', '7', '20', '4', '848510015569.92', '258625852745.71164', '22');
INSERT INTO `t_calcoutputlist_his` VALUES ('11', 'bd9e1270d4bc4b28974408eb1cede496', '7', '20', '0', '8497336.32', '2589988.110336', '22');
INSERT INTO `t_calcoutputlist_his` VALUES ('12', 'bd9e1270d4bc4b28974408eb1cede496', '7', '20', '1', '76476026.88000001', '23309892.993024003', '22');
INSERT INTO `t_calcoutputlist_his` VALUES ('13', 'bd9e1270d4bc4b28974408eb1cede496', '7', '20', '2', '305904107.52000004', '93239571.97209601', '22');
INSERT INTO `t_calcoutputlist_his` VALUES ('14', 'bd9e1270d4bc4b28974408eb1cede496', '7', '20', '3', '39291683143.68001', '11976105022.193666', '22');
INSERT INTO `t_calcoutputlist_his` VALUES ('15', 'bd9e1270d4bc4b28974408eb1cede496', '7', '20', '4', '848510015569.92', '258625852745.71164', '22');
INSERT INTO `t_calcoutputlist_his` VALUES ('16', '413d52fe4d2d44fe8114b8e6ed7ba3e6', '7', '20', '0', '8497336.32', '2589988.110336', '23');
INSERT INTO `t_calcoutputlist_his` VALUES ('17', '413d52fe4d2d44fe8114b8e6ed7ba3e6', '7', '20', '1', '76476026.88000001', '23309892.993024003', '23');
INSERT INTO `t_calcoutputlist_his` VALUES ('18', '413d52fe4d2d44fe8114b8e6ed7ba3e6', '7', '20', '2', '305904107.52000004', '93239571.97209601', '23');
INSERT INTO `t_calcoutputlist_his` VALUES ('19', '413d52fe4d2d44fe8114b8e6ed7ba3e6', '7', '20', '3', '39291683143.68001', '11976105022.193666', '23');
INSERT INTO `t_calcoutputlist_his` VALUES ('20', '413d52fe4d2d44fe8114b8e6ed7ba3e6', '7', '20', '4', '848510015569.92', '258625852745.71164', '23');
INSERT INTO `t_calcoutputlist_his` VALUES ('21', 'aafc4af2f89b4c8ab975cbf86f0d1234', '7', '20', '0', '8497336.32', '2589988.110336', '23');
INSERT INTO `t_calcoutputlist_his` VALUES ('22', 'aafc4af2f89b4c8ab975cbf86f0d1234', '7', '20', '1', '76476026.88000001', '23309892.993024003', '23');
INSERT INTO `t_calcoutputlist_his` VALUES ('23', 'aafc4af2f89b4c8ab975cbf86f0d1234', '7', '20', '2', '305904107.52000004', '93239571.97209601', '23');
INSERT INTO `t_calcoutputlist_his` VALUES ('24', 'aafc4af2f89b4c8ab975cbf86f0d1234', '7', '20', '3', '39291683143.68001', '11976105022.193666', '23');
INSERT INTO `t_calcoutputlist_his` VALUES ('25', 'aafc4af2f89b4c8ab975cbf86f0d1234', '7', '20', '4', '848510015569.92', '258625852745.71164', '23');
INSERT INTO `t_calcoutputlist_his` VALUES ('26', 'bd9e1270d4bc4b28974408eb1cede496', '7', '20', '0', '8497336.32', '2589988.110336', '23');
INSERT INTO `t_calcoutputlist_his` VALUES ('27', 'bd9e1270d4bc4b28974408eb1cede496', '7', '20', '1', '76476026.88000001', '23309892.993024003', '23');
INSERT INTO `t_calcoutputlist_his` VALUES ('28', 'bd9e1270d4bc4b28974408eb1cede496', '7', '20', '2', '305904107.52000004', '93239571.97209601', '23');
INSERT INTO `t_calcoutputlist_his` VALUES ('29', 'bd9e1270d4bc4b28974408eb1cede496', '7', '20', '3', '39291683143.68001', '11976105022.193666', '23');
INSERT INTO `t_calcoutputlist_his` VALUES ('30', 'bd9e1270d4bc4b28974408eb1cede496', '7', '20', '4', '848510015569.92', '258625852745.71164', '23');
INSERT INTO `t_calcoutputlist_his` VALUES ('31', '91439d7db82c4bc2ad6442a3ef60a2b9', '7', '20', '0', '8497336.32', '2589988.110336', '23');
INSERT INTO `t_calcoutputlist_his` VALUES ('32', '91439d7db82c4bc2ad6442a3ef60a2b9', '7', '20', '1', '76476026.88000001', '23309892.993024003', '23');
INSERT INTO `t_calcoutputlist_his` VALUES ('33', '91439d7db82c4bc2ad6442a3ef60a2b9', '7', '20', '2', '305904107.52000004', '93239571.97209601', '23');
INSERT INTO `t_calcoutputlist_his` VALUES ('34', '91439d7db82c4bc2ad6442a3ef60a2b9', '7', '20', '3', '39291683143.68001', '11976105022.193666', '23');
INSERT INTO `t_calcoutputlist_his` VALUES ('35', '91439d7db82c4bc2ad6442a3ef60a2b9', '7', '20', '4', '848510015569.92', '258625852745.71164', '23');
INSERT INTO `t_calcoutputlist_his` VALUES ('47', '413d52fe4d2d44fe8114b8e6ed7ba3e6', '7', '20', '0', '8497336.32', '2589988.110336', '24');
INSERT INTO `t_calcoutputlist_his` VALUES ('48', '413d52fe4d2d44fe8114b8e6ed7ba3e6', '7', '20', '1', '76476026.88000001', '23309892.993024003', '24');
INSERT INTO `t_calcoutputlist_his` VALUES ('49', '413d52fe4d2d44fe8114b8e6ed7ba3e6', '7', '20', '2', '305904107.52000004', '93239571.97209601', '24');
INSERT INTO `t_calcoutputlist_his` VALUES ('50', '413d52fe4d2d44fe8114b8e6ed7ba3e6', '7', '20', '3', '39291683143.68001', '11976105022.193666', '24');
INSERT INTO `t_calcoutputlist_his` VALUES ('51', '413d52fe4d2d44fe8114b8e6ed7ba3e6', '7', '20', '4', '848510015569.92', '258625852745.71164', '24');
INSERT INTO `t_calcoutputlist_his` VALUES ('52', 'aafc4af2f89b4c8ab975cbf86f0d1234', '7', '20', '0', '8497336.32', '2589988.110336', '24');
INSERT INTO `t_calcoutputlist_his` VALUES ('53', 'aafc4af2f89b4c8ab975cbf86f0d1234', '7', '20', '1', '76476026.88000001', '23309892.993024003', '24');
INSERT INTO `t_calcoutputlist_his` VALUES ('54', 'aafc4af2f89b4c8ab975cbf86f0d1234', '7', '20', '2', '305904107.52000004', '93239571.97209601', '24');
INSERT INTO `t_calcoutputlist_his` VALUES ('55', 'aafc4af2f89b4c8ab975cbf86f0d1234', '7', '20', '3', '39291683143.68001', '11976105022.193666', '24');
INSERT INTO `t_calcoutputlist_his` VALUES ('56', 'aafc4af2f89b4c8ab975cbf86f0d1234', '7', '20', '4', '848510015569.92', '258625852745.71164', '24');
INSERT INTO `t_calcoutputlist_his` VALUES ('57', 'bd9e1270d4bc4b28974408eb1cede496', '7', '20', '0', '8497336.32', '2589988.110336', '24');
INSERT INTO `t_calcoutputlist_his` VALUES ('58', 'bd9e1270d4bc4b28974408eb1cede496', '7', '20', '1', '76476026.88000001', '23309892.993024003', '24');
INSERT INTO `t_calcoutputlist_his` VALUES ('59', 'bd9e1270d4bc4b28974408eb1cede496', '7', '20', '2', '305904107.52000004', '93239571.97209601', '24');
INSERT INTO `t_calcoutputlist_his` VALUES ('60', 'bd9e1270d4bc4b28974408eb1cede496', '7', '20', '3', '39291683143.68001', '11976105022.193666', '24');
INSERT INTO `t_calcoutputlist_his` VALUES ('61', 'bd9e1270d4bc4b28974408eb1cede496', '7', '20', '4', '848510015569.92', '258625852745.71164', '24');
INSERT INTO `t_calcoutputlist_his` VALUES ('62', '91439d7db82c4bc2ad6442a3ef60a2b9', '7', '20', '0', '8497336.32', '2589988.110336', '24');
INSERT INTO `t_calcoutputlist_his` VALUES ('63', '91439d7db82c4bc2ad6442a3ef60a2b9', '7', '20', '1', '76476026.88000001', '23309892.993024003', '24');
INSERT INTO `t_calcoutputlist_his` VALUES ('64', '91439d7db82c4bc2ad6442a3ef60a2b9', '7', '20', '2', '305904107.52000004', '93239571.97209601', '24');
INSERT INTO `t_calcoutputlist_his` VALUES ('65', '91439d7db82c4bc2ad6442a3ef60a2b9', '7', '20', '3', '39291683143.68001', '11976105022.193666', '24');
INSERT INTO `t_calcoutputlist_his` VALUES ('66', '91439d7db82c4bc2ad6442a3ef60a2b9', '7', '20', '4', '848510015569.92', '258625852745.71164', '24');
INSERT INTO `t_calcoutputlist_his` VALUES ('67', 'bc3ee7cb21ec479e99bddbce8afa9fab', '7', '20', '0', '8497336.32', '2589988.110336', '24');
INSERT INTO `t_calcoutputlist_his` VALUES ('68', 'bc3ee7cb21ec479e99bddbce8afa9fab', '7', '20', '1', '76476026.88000001', '23309892.993024003', '24');
INSERT INTO `t_calcoutputlist_his` VALUES ('69', 'bc3ee7cb21ec479e99bddbce8afa9fab', '7', '20', '2', '305904107.52000004', '93239571.97209601', '24');
INSERT INTO `t_calcoutputlist_his` VALUES ('70', 'bc3ee7cb21ec479e99bddbce8afa9fab', '7', '20', '3', '39291683143.68001', '11976105022.193666', '24');
INSERT INTO `t_calcoutputlist_his` VALUES ('71', 'bc3ee7cb21ec479e99bddbce8afa9fab', '7', '20', '4', '848510015569.92', '258625852745.71164', '24');
INSERT INTO `t_calcoutputlist_his` VALUES ('78', '413d52fe4d2d44fe8114b8e6ed7ba3e6', '7', '20', '0', '8497336.32', '2589988.110336', '25');
INSERT INTO `t_calcoutputlist_his` VALUES ('79', '413d52fe4d2d44fe8114b8e6ed7ba3e6', '7', '20', '1', '76476026.88000001', '23309892.993024003', '25');
INSERT INTO `t_calcoutputlist_his` VALUES ('80', '413d52fe4d2d44fe8114b8e6ed7ba3e6', '7', '20', '2', '305904107.52000004', '93239571.97209601', '25');
INSERT INTO `t_calcoutputlist_his` VALUES ('81', '413d52fe4d2d44fe8114b8e6ed7ba3e6', '7', '20', '3', '39291683143.68001', '11976105022.193666', '25');
INSERT INTO `t_calcoutputlist_his` VALUES ('82', '413d52fe4d2d44fe8114b8e6ed7ba3e6', '7', '20', '4', '848510015569.92', '258625852745.71164', '25');
INSERT INTO `t_calcoutputlist_his` VALUES ('83', 'aafc4af2f89b4c8ab975cbf86f0d1234', '7', '20', '0', '8497336.32', '2589988.110336', '25');
INSERT INTO `t_calcoutputlist_his` VALUES ('84', 'aafc4af2f89b4c8ab975cbf86f0d1234', '7', '20', '1', '76476026.88000001', '23309892.993024003', '25');
INSERT INTO `t_calcoutputlist_his` VALUES ('85', 'aafc4af2f89b4c8ab975cbf86f0d1234', '7', '20', '2', '305904107.52000004', '93239571.97209601', '25');
INSERT INTO `t_calcoutputlist_his` VALUES ('86', 'aafc4af2f89b4c8ab975cbf86f0d1234', '7', '20', '3', '39291683143.68001', '11976105022.193666', '25');
INSERT INTO `t_calcoutputlist_his` VALUES ('87', 'aafc4af2f89b4c8ab975cbf86f0d1234', '7', '20', '4', '848510015569.92', '258625852745.71164', '25');
INSERT INTO `t_calcoutputlist_his` VALUES ('88', 'bd9e1270d4bc4b28974408eb1cede496', '7', '20', '0', '8497336.32', '2589988.110336', '25');
INSERT INTO `t_calcoutputlist_his` VALUES ('89', 'bd9e1270d4bc4b28974408eb1cede496', '7', '20', '1', '76476026.88000001', '23309892.993024003', '25');
INSERT INTO `t_calcoutputlist_his` VALUES ('90', 'bd9e1270d4bc4b28974408eb1cede496', '7', '20', '2', '305904107.52000004', '93239571.97209601', '25');
INSERT INTO `t_calcoutputlist_his` VALUES ('91', 'bd9e1270d4bc4b28974408eb1cede496', '7', '20', '3', '39291683143.68001', '11976105022.193666', '25');
INSERT INTO `t_calcoutputlist_his` VALUES ('92', 'bd9e1270d4bc4b28974408eb1cede496', '7', '20', '4', '848510015569.92', '258625852745.71164', '25');
INSERT INTO `t_calcoutputlist_his` VALUES ('93', '91439d7db82c4bc2ad6442a3ef60a2b9', '7', '20', '0', '8497336.32', '2589988.110336', '25');
INSERT INTO `t_calcoutputlist_his` VALUES ('94', '91439d7db82c4bc2ad6442a3ef60a2b9', '7', '20', '1', '76476026.88000001', '23309892.993024003', '25');
INSERT INTO `t_calcoutputlist_his` VALUES ('95', '91439d7db82c4bc2ad6442a3ef60a2b9', '7', '20', '2', '305904107.52000004', '93239571.97209601', '25');
INSERT INTO `t_calcoutputlist_his` VALUES ('96', '91439d7db82c4bc2ad6442a3ef60a2b9', '7', '20', '3', '39291683143.68001', '11976105022.193666', '25');
INSERT INTO `t_calcoutputlist_his` VALUES ('97', '91439d7db82c4bc2ad6442a3ef60a2b9', '7', '20', '4', '848510015569.92', '258625852745.71164', '25');
INSERT INTO `t_calcoutputlist_his` VALUES ('98', 'bc3ee7cb21ec479e99bddbce8afa9fab', '7', '20', '0', '8497336.32', '2589988.110336', '25');
INSERT INTO `t_calcoutputlist_his` VALUES ('99', 'bc3ee7cb21ec479e99bddbce8afa9fab', '7', '20', '1', '76476026.88000001', '23309892.993024003', '25');
INSERT INTO `t_calcoutputlist_his` VALUES ('100', 'bc3ee7cb21ec479e99bddbce8afa9fab', '7', '20', '2', '305904107.52000004', '93239571.97209601', '25');
INSERT INTO `t_calcoutputlist_his` VALUES ('101', 'bc3ee7cb21ec479e99bddbce8afa9fab', '7', '20', '3', '39291683143.68001', '11976105022.193666', '25');
INSERT INTO `t_calcoutputlist_his` VALUES ('102', 'bc3ee7cb21ec479e99bddbce8afa9fab', '7', '20', '4', '848510015569.92', '258625852745.71164', '25');
INSERT INTO `t_calcoutputlist_his` VALUES ('103', 'be71391cd21b470b8227f827b02ccbb3', '7', '20', '0', '8497336.32', '2589988.110336', '25');
INSERT INTO `t_calcoutputlist_his` VALUES ('104', 'be71391cd21b470b8227f827b02ccbb3', '7', '20', '1', '76476026.88000001', '23309892.993024003', '25');
INSERT INTO `t_calcoutputlist_his` VALUES ('105', 'be71391cd21b470b8227f827b02ccbb3', '7', '20', '2', '305904107.52000004', '93239571.97209601', '25');
INSERT INTO `t_calcoutputlist_his` VALUES ('106', 'be71391cd21b470b8227f827b02ccbb3', '7', '20', '3', '39291683143.68001', '11976105022.193666', '25');
INSERT INTO `t_calcoutputlist_his` VALUES ('107', 'be71391cd21b470b8227f827b02ccbb3', '7', '20', '4', '848510015569.92', '258625852745.71164', '25');
INSERT INTO `t_calcoutputlist_his` VALUES ('108', '49fc49320a184907b64a5f2f23573644', '8', '20', '0', '8497336.32', '2589988.110336', '26');
INSERT INTO `t_calcoutputlist_his` VALUES ('109', '49fc49320a184907b64a5f2f23573644', '8', '20', '1', '33989345.28', '10359952.441344', '26');
INSERT INTO `t_calcoutputlist_his` VALUES ('110', '49fc49320a184907b64a5f2f23573644', '8', '20', '2', '76476026.88000001', '23309892.993024003', '26');
INSERT INTO `t_calcoutputlist_his` VALUES ('111', '49fc49320a184907b64a5f2f23573644', '8', '20', '3', '135957381.12', '41439809.765376', '26');
INSERT INTO `t_calcoutputlist_his` VALUES ('112', '49fc49320a184907b64a5f2f23573644', '8', '20', '4', '212433408', '64749702.7584', '26');
INSERT INTO `t_calcoutputlist_his` VALUES ('115', '49fc49320a184907b64a5f2f23573644', '8', '20', '0', '8497336.32', '2589988.110336', '27');
INSERT INTO `t_calcoutputlist_his` VALUES ('116', '49fc49320a184907b64a5f2f23573644', '8', '20', '1', '33989345.28', '10359952.441344', '27');
INSERT INTO `t_calcoutputlist_his` VALUES ('117', '49fc49320a184907b64a5f2f23573644', '8', '20', '2', '76476026.88000001', '23309892.993024003', '27');
INSERT INTO `t_calcoutputlist_his` VALUES ('118', '49fc49320a184907b64a5f2f23573644', '8', '20', '3', '135957381.12', '41439809.765376', '27');
INSERT INTO `t_calcoutputlist_his` VALUES ('119', '49fc49320a184907b64a5f2f23573644', '8', '20', '4', '212433408', '64749702.7584', '27');
INSERT INTO `t_calcoutputlist_his` VALUES ('120', '3e79b498e2b042edb95fc8ab3de2697a', '8', '20', '0', '8497336.32', '2589988.110336', '27');
INSERT INTO `t_calcoutputlist_his` VALUES ('121', '3e79b498e2b042edb95fc8ab3de2697a', '8', '20', '1', '33989345.28', '10359952.441344', '27');
INSERT INTO `t_calcoutputlist_his` VALUES ('122', '3e79b498e2b042edb95fc8ab3de2697a', '8', '20', '2', '76476026.88000001', '23309892.993024003', '27');
INSERT INTO `t_calcoutputlist_his` VALUES ('123', '3e79b498e2b042edb95fc8ab3de2697a', '8', '20', '3', '135957381.12', '41439809.765376', '27');
INSERT INTO `t_calcoutputlist_his` VALUES ('124', '3e79b498e2b042edb95fc8ab3de2697a', '8', '20', '4', '212433408', '64749702.7584', '27');

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
  `par_type` int(11) DEFAULT NULL,
  `par_listUUID` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_calcoutput_his
-- ----------------------------
INSERT INTO `t_calcoutput_his` VALUES ('1', '3', '6', '相加结果', '3121', 'c', '3', '31.21', '3', null, null);
INSERT INTO `t_calcoutput_his` VALUES ('2', '3', '6', '相加结果', '3121', 'c', '3', '31.21', '4', null, null);
INSERT INTO `t_calcoutput_his` VALUES ('3', '3', '6', '相加结果', '3121', 'c', '3', '31.21', '5', null, null);
INSERT INTO `t_calcoutput_his` VALUES ('4', '3', '6', '相加结果', '3121', 'c', '3', '31.21', '6', null, null);
INSERT INTO `t_calcoutput_his` VALUES ('5', '3', '6', '相加结果', '3121', 'c', '3', '31.21', '7', null, null);
INSERT INTO `t_calcoutput_his` VALUES ('6', '5', '6', '相加结果', '1144.2', 'c', '3', '11.442', '8', null, null);
INSERT INTO `t_calcoutput_his` VALUES ('7', '5', '6', '相加结果', '1144.2', 'c', '3', '11.442', '9', null, null);
INSERT INTO `t_calcoutput_his` VALUES ('8', '5', '6', '相加结果', '1144.2', 'c', '3', '11.442', '10', null, null);
INSERT INTO `t_calcoutput_his` VALUES ('9', '5', '6', '相加结果', '1144.2', 'c', '3', '11.442', '11', null, null);
INSERT INTO `t_calcoutput_his` VALUES ('10', '5', '6', '相加结果', '1144.2', 'c', '3', '11.442', '12', null, null);
INSERT INTO `t_calcoutput_his` VALUES ('11', '5', '6', '相加结果', '1144.2', 'c', '3', '11.442', '13', null, null);
INSERT INTO `t_calcoutput_his` VALUES ('12', '5', '6', '相加结果', '1144.2', 'c', '3', '11.442', '14', null, null);
INSERT INTO `t_calcoutput_his` VALUES ('13', '5', '6', '相加结果', '1144.2', 'c', '3', '11.442', '15', null, null);
INSERT INTO `t_calcoutput_his` VALUES ('14', '5', '6', '相加结果', '275.7', 'c', '3', '2.7569999999999997', '16', null, null);
INSERT INTO `t_calcoutput_his` VALUES ('15', '6', '9', '斜边', '130', 'XIEBIAN', '3', '1.3', '17', null, null);
INSERT INTO `t_calcoutput_his` VALUES ('16', '6', '9', '斜边', '300000.00000000006', 'XIEBIAN', '3', '3000.0000000000005', '18', null, null);
INSERT INTO `t_calcoutput_his` VALUES ('17', '6', '9', '斜边', '5', 'XIEBIAN', '3', '0.05', '19', null, null);
INSERT INTO `t_calcoutput_his` VALUES ('18', '7', '20', '列表测试2', '0', 'listout', '6', '0', '20', null, null);
INSERT INTO `t_calcoutput_his` VALUES ('19', '7', '20', '列表测试2', '0', 'listout', '6', '0', '20', null, null);
INSERT INTO `t_calcoutput_his` VALUES ('21', '7', '20', '列表测试2', '0', 'listout', '6', '0', '21', null, null);
INSERT INTO `t_calcoutput_his` VALUES ('22', '7', '20', '列表测试2', '0', 'listout', '6', '0', '21', null, null);
INSERT INTO `t_calcoutput_his` VALUES ('24', '7', '20', '列表测试2', '0', 'listout', '6', '0', '22', null, null);
INSERT INTO `t_calcoutput_his` VALUES ('25', '7', '20', '列表测试2', '0', 'listout', '6', '0', '22', null, null);
INSERT INTO `t_calcoutput_his` VALUES ('27', '7', '20', '列表测试2', '0', 'listout', '6', '0', '23', null, null);
INSERT INTO `t_calcoutput_his` VALUES ('28', '7', '20', '列表测试2', '0', 'listout', '6', '0', '23', null, null);
INSERT INTO `t_calcoutput_his` VALUES ('30', '7', '20', '列表测试2', '0', 'listout', '6', '0', '24', null, null);
INSERT INTO `t_calcoutput_his` VALUES ('31', '7', '20', '列表测试2', '0', 'listout', '6', '0', '24', null, null);
INSERT INTO `t_calcoutput_his` VALUES ('33', '7', '20', '列表测试2', '0', 'listout', '6', '0', '25', null, null);
INSERT INTO `t_calcoutput_his` VALUES ('34', '7', '20', '列表测试2', '0', 'listout', '6', '0', '25', null, null);
INSERT INTO `t_calcoutput_his` VALUES ('35', '8', '20', '列表测试2', '0', 'listout', '6', '0', '26', null, null);
INSERT INTO `t_calcoutput_his` VALUES ('36', '8', '20', '列表测试2', '0', 'listout', '6', '0', '26', null, null);
INSERT INTO `t_calcoutput_his` VALUES ('38', '8', '20', '列表测试2', '0', 'listout', '6', '0', '27', null, null);
INSERT INTO `t_calcoutput_his` VALUES ('39', '8', '20', '列表测试2', '0', 'listout', '6', '0', '27', null, null);
INSERT INTO `t_calcoutput_his` VALUES ('41', '9', '6', '相加结果', '21', 'c', '3', '0.21000000000000002', '28', null, null);
INSERT INTO `t_calcoutput_his` VALUES ('42', '9', '6', '相加结果', '21', 'c', '3', '0.21000000000000002', '29', null, null);
INSERT INTO `t_calcoutput_his` VALUES ('43', '9', '9', '斜边', '400.0112498418013', 'XIEBIAN', '3', '4.000112498418013', '30', null, null);
INSERT INTO `t_calcoutput_his` VALUES ('44', '9', '16', '32122', '0', '32123', '9', '0', '30', null, null);
INSERT INTO `t_calcoutput_his` VALUES ('45', '9', '18', '32122速度2', '0', '32123的1', '9', '0', '30', null, null);
INSERT INTO `t_calcoutput_his` VALUES ('46', '9', '9', '斜边', '400.0112498418013', 'XIEBIAN', '3', '4.000112498418013', '31', null, null);
INSERT INTO `t_calcoutput_his` VALUES ('47', '9', '9', '斜边', '5', 'XIEBIAN', '3', '0.05', '32', null, null);

-- ----------------------------
-- Table structure for t_graphdetail
-- ----------------------------
DROP TABLE IF EXISTS `t_graphdetail`;
CREATE TABLE `t_graphdetail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `graphid` int(11) DEFAULT NULL,
  `ParamID` int(11) DEFAULT NULL,
  `info1` varchar(32) DEFAULT NULL,
  `info2` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_graphdetail
-- ----------------------------
INSERT INTO `t_graphdetail` VALUES ('1', '0', '0', null, null);
INSERT INTO `t_graphdetail` VALUES ('2', '0', '0', null, null);
INSERT INTO `t_graphdetail` VALUES ('3', '24', '20', 'X', '');
INSERT INTO `t_graphdetail` VALUES ('4', '10', '24', '', '');
INSERT INTO `t_graphdetail` VALUES ('5', '10', '23', '', '');
INSERT INTO `t_graphdetail` VALUES ('6', '10', '22', '', '');
INSERT INTO `t_graphdetail` VALUES ('7', '10', '21', '', '');
INSERT INTO `t_graphdetail` VALUES ('10', '11', '27', 'X', '');
INSERT INTO `t_graphdetail` VALUES ('11', '11', '28', 'Y', '');
INSERT INTO `t_graphdetail` VALUES ('12', '11', '31', 'Y', '');
INSERT INTO `t_graphdetail` VALUES ('14', '12', '27', 'X', '');
INSERT INTO `t_graphdetail` VALUES ('17', '12', '31', 'Y', '');
INSERT INTO `t_graphdetail` VALUES ('18', '12', '28', 'Y', '');
INSERT INTO `t_graphdetail` VALUES ('19', '13', '24', '', '');
INSERT INTO `t_graphdetail` VALUES ('20', '13', '22', '', '');
INSERT INTO `t_graphdetail` VALUES ('21', '13', '23', '', '');
INSERT INTO `t_graphdetail` VALUES ('22', '14', '27', 'X', '');
INSERT INTO `t_graphdetail` VALUES ('23', '14', '28', 'Y', '');
INSERT INTO `t_graphdetail` VALUES ('24', '14', '31', 'Y', '');
INSERT INTO `t_graphdetail` VALUES ('25', '15', '31', 'Y', '');
INSERT INTO `t_graphdetail` VALUES ('26', '15', '28', 'Y', '');
INSERT INTO `t_graphdetail` VALUES ('27', '15', '27', 'X', '');

-- ----------------------------
-- Table structure for t_guiback
-- ----------------------------
DROP TABLE IF EXISTS `t_guiback`;
CREATE TABLE `t_guiback` (
  `jsonData` text,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_guiback
-- ----------------------------
INSERT INTO `t_guiback` VALUES ('{\"attrs\":{\"x\":100,\"y\":100,\"id\":\"painting\",\"width\":3000,\"height\":2000,\"fill\":\"#ff33ee\",\"draggable\":true},\"className\":\"Layer\",\"children\":[]}', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=172 DEFAULT CHARSET=utf8;

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
INSERT INTO `t_guiconnect` VALUES ('79', '174', '281', '11463015202529', '280', '114630152024293', '1', '2014-06-30 15:33:22');
INSERT INTO `t_guiconnect` VALUES ('80', '174', '283', '114630152033272', '281', '11463015202529', '1', '2014-06-30 15:33:22');
INSERT INTO `t_guiconnect` VALUES ('81', '174', '282', '114630152029853', '283', '114630152033272', '1', '2014-06-30 15:33:22');
INSERT INTO `t_guiconnect` VALUES ('82', '188', '284', '114630211221363', '286', '114630211223229', '-1', '2014-06-30 21:12:28');
INSERT INTO `t_guiconnect` VALUES ('83', '188', '287', '114630211221363', '289', '114630211223229', '-1', '2014-06-30 21:13:26');
INSERT INTO `t_guiconnect` VALUES ('84', '187', '290', '114630211212859', '291', '1146302112148', '-1', '2014-06-30 21:13:31');
INSERT INTO `t_guiconnect` VALUES ('85', '188', '292', '114630211221363', '294', '114630211223229', '-1', '2014-06-30 21:16:33');
INSERT INTO `t_guiconnect` VALUES ('86', '187', '296', '114630211212859', '297', '1146302112148', '-1', '2014-06-30 21:16:35');
INSERT INTO `t_guiconnect` VALUES ('87', '187', '298', '114630211212859', '299', '1146302112148', '-1', '2014-06-30 21:18:54');
INSERT INTO `t_guiconnect` VALUES ('88', '188', '300', '114630211221363', '302', '114630211223229', '-1', '2014-06-30 21:18:54');
INSERT INTO `t_guiconnect` VALUES ('89', '188', '304', '11463021184760', '303', '114630211623955', '-1', '2014-06-30 21:18:54');
INSERT INTO `t_guiconnect` VALUES ('90', '188', '305', '114630211221363', '307', '114630211223229', '-1', '2014-06-30 21:18:56');
INSERT INTO `t_guiconnect` VALUES ('91', '188', '309', '11463021184760', '308', '114630211623955', '-1', '2014-06-30 21:18:56');
INSERT INTO `t_guiconnect` VALUES ('92', '187', '310', '114630211212859', '311', '1146302112148', '-1', '2014-06-30 21:23:53');
INSERT INTO `t_guiconnect` VALUES ('93', '188', '312', '114630211221363', '314', '114630211223229', '-1', '2014-06-30 21:23:53');
INSERT INTO `t_guiconnect` VALUES ('94', '188', '316', '11463021184760', '315', '114630211623955', '-1', '2014-06-30 21:23:53');
INSERT INTO `t_guiconnect` VALUES ('95', '188', '317', '114630212159501', '316', '11463021184760', '-1', '2014-06-30 21:23:53');
INSERT INTO `t_guiconnect` VALUES ('96', '187', '318', '114630211212859', '319', '1146302112148', '-1', '2014-06-30 21:24:14');
INSERT INTO `t_guiconnect` VALUES ('97', '188', '320', '114630211221363', '322', '114630211223229', '-1', '2014-06-30 21:24:14');
INSERT INTO `t_guiconnect` VALUES ('98', '188', '324', '11463021184760', '323', '114630211623955', '-1', '2014-06-30 21:24:14');
INSERT INTO `t_guiconnect` VALUES ('99', '188', '325', '114630212159501', '324', '11463021184760', '-1', '2014-06-30 21:24:14');
INSERT INTO `t_guiconnect` VALUES ('100', '187', '326', '114630211212859', '327', '1146302112148', '-1', '2014-06-30 21:24:41');
INSERT INTO `t_guiconnect` VALUES ('101', '188', '328', '114630211221363', '330', '114630211223229', '-1', '2014-06-30 21:24:41');
INSERT INTO `t_guiconnect` VALUES ('102', '188', '332', '11463021184760', '331', '114630211623955', '-1', '2014-06-30 21:24:41');
INSERT INTO `t_guiconnect` VALUES ('103', '188', '333', '114630212159501', '332', '11463021184760', '-1', '2014-06-30 21:24:41');
INSERT INTO `t_guiconnect` VALUES ('104', '188', '334', '114630212432952', '333', '114630212159501', '-1', '2014-06-30 21:24:41');
INSERT INTO `t_guiconnect` VALUES ('105', '189', '337', '1146302125281', '336', '114630212525956', '1', '2014-06-30 21:25:32');
INSERT INTO `t_guiconnect` VALUES ('106', '187', '338', '114630211212859', '339', '1146302112148', '-1', '2014-06-30 21:25:32');
INSERT INTO `t_guiconnect` VALUES ('107', '188', '340', '114630211221363', '342', '114630211223229', '-1', '2014-06-30 21:25:32');
INSERT INTO `t_guiconnect` VALUES ('108', '188', '344', '11463021184760', '343', '114630211623955', '-1', '2014-06-30 21:25:32');
INSERT INTO `t_guiconnect` VALUES ('109', '188', '347', '11463021256207', '343', '114630211623955', '-1', '2014-06-30 21:25:32');
INSERT INTO `t_guiconnect` VALUES ('110', '188', '345', '114630212159501', '344', '11463021184760', '-1', '2014-06-30 21:25:32');
INSERT INTO `t_guiconnect` VALUES ('111', '188', '346', '114630212432952', '345', '114630212159501', '-1', '2014-06-30 21:25:32');
INSERT INTO `t_guiconnect` VALUES ('112', '188', '348', '114630212517612', '347', '11463021256207', '-1', '2014-06-30 21:25:32');
INSERT INTO `t_guiconnect` VALUES ('113', '190', '349', '114630212636363', '350', '114630212637218', '-1', '2014-06-30 21:26:43');
INSERT INTO `t_guiconnect` VALUES ('114', '187', '352', '114630211212859', '353', '1146302112148', '-1', '2014-06-30 21:26:43');
INSERT INTO `t_guiconnect` VALUES ('115', '187', '353', '1146302112148', '354', '114630212548505', '-1', '2014-06-30 21:26:43');
INSERT INTO `t_guiconnect` VALUES ('116', '187', '357', '11463021266478', '354', '114630212548505', '-1', '2014-06-30 21:26:43');
INSERT INTO `t_guiconnect` VALUES ('117', '187', '356', '11463021265452', '357', '11463021266478', '-1', '2014-06-30 21:26:43');
INSERT INTO `t_guiconnect` VALUES ('118', '187', '358', '114630212632247', '356', '11463021265452', '-1', '2014-06-30 21:26:43');
INSERT INTO `t_guiconnect` VALUES ('119', '188', '359', '114630211221363', '361', '114630211223229', '-1', '2014-06-30 21:26:43');
INSERT INTO `t_guiconnect` VALUES ('120', '188', '363', '11463021184760', '362', '114630211623955', '-1', '2014-06-30 21:26:43');
INSERT INTO `t_guiconnect` VALUES ('121', '188', '366', '11463021256207', '362', '114630211623955', '-1', '2014-06-30 21:26:43');
INSERT INTO `t_guiconnect` VALUES ('122', '188', '364', '114630212159501', '363', '11463021184760', '-1', '2014-06-30 21:26:43');
INSERT INTO `t_guiconnect` VALUES ('123', '188', '365', '114630212432952', '364', '114630212159501', '-1', '2014-06-30 21:26:43');
INSERT INTO `t_guiconnect` VALUES ('124', '188', '367', '114630212517612', '366', '11463021256207', '-1', '2014-06-30 21:26:43');
INSERT INTO `t_guiconnect` VALUES ('125', '190', '368', '114630212636363', '369', '114630212637218', '-1', '2014-06-30 21:27:26');
INSERT INTO `t_guiconnect` VALUES ('126', '187', '371', '114630211212859', '372', '1146302112148', '-1', '2014-06-30 21:27:26');
INSERT INTO `t_guiconnect` VALUES ('127', '187', '372', '1146302112148', '373', '114630212548505', '-1', '2014-06-30 21:27:26');
INSERT INTO `t_guiconnect` VALUES ('128', '187', '376', '11463021266478', '373', '114630212548505', '-1', '2014-06-30 21:27:26');
INSERT INTO `t_guiconnect` VALUES ('129', '187', '375', '11463021265452', '376', '11463021266478', '-1', '2014-06-30 21:27:26');
INSERT INTO `t_guiconnect` VALUES ('130', '187', '377', '114630212632247', '375', '11463021265452', '-1', '2014-06-30 21:27:26');
INSERT INTO `t_guiconnect` VALUES ('131', '188', '378', '114630211221363', '380', '114630211223229', '1', '2014-06-30 21:27:26');
INSERT INTO `t_guiconnect` VALUES ('132', '188', '382', '11463021184760', '381', '114630211623955', '1', '2014-06-30 21:27:26');
INSERT INTO `t_guiconnect` VALUES ('133', '188', '385', '11463021256207', '381', '114630211623955', '1', '2014-06-30 21:27:26');
INSERT INTO `t_guiconnect` VALUES ('134', '188', '383', '114630212159501', '382', '11463021184760', '1', '2014-06-30 21:27:26');
INSERT INTO `t_guiconnect` VALUES ('135', '188', '384', '114630212432952', '383', '114630212159501', '1', '2014-06-30 21:27:26');
INSERT INTO `t_guiconnect` VALUES ('136', '188', '386', '114630212517612', '385', '11463021256207', '1', '2014-06-30 21:27:26');
INSERT INTO `t_guiconnect` VALUES ('137', '190', '387', '114630212636363', '388', '114630212637218', '1', '2014-06-30 21:27:28');
INSERT INTO `t_guiconnect` VALUES ('138', '187', '390', '114630211212859', '391', '1146302112148', '-1', '2014-06-30 21:49:07');
INSERT INTO `t_guiconnect` VALUES ('139', '187', '390', '114630211212859', '406', '114630213724696', '-1', '2014-06-30 21:49:07');
INSERT INTO `t_guiconnect` VALUES ('140', '187', '391', '1146302112148', '392', '114630212548505', '-1', '2014-06-30 21:49:07');
INSERT INTO `t_guiconnect` VALUES ('141', '187', '395', '11463021266478', '392', '114630212548505', '-1', '2014-06-30 21:49:07');
INSERT INTO `t_guiconnect` VALUES ('142', '187', '394', '11463021265452', '395', '11463021266478', '-1', '2014-06-30 21:49:07');
INSERT INTO `t_guiconnect` VALUES ('143', '187', '396', '114630212632247', '394', '11463021265452', '-1', '2014-06-30 21:49:07');
INSERT INTO `t_guiconnect` VALUES ('144', '187', '397', '114630213629785', '396', '114630212632247', '-1', '2014-06-30 21:49:07');
INSERT INTO `t_guiconnect` VALUES ('145', '187', '398', '114630213633902', '397', '114630213629785', '-1', '2014-06-30 21:49:07');
INSERT INTO `t_guiconnect` VALUES ('146', '187', '399', '114630213641264', '398', '114630213633902', '-1', '2014-06-30 21:49:07');
INSERT INTO `t_guiconnect` VALUES ('147', '187', '400', '114630213644509', '399', '114630213641264', '-1', '2014-06-30 21:49:07');
INSERT INTO `t_guiconnect` VALUES ('148', '187', '401', '114630213648691', '400', '114630213644509', '-1', '2014-06-30 21:49:07');
INSERT INTO `t_guiconnect` VALUES ('149', '187', '402', '114630213653623', '401', '114630213648691', '-1', '2014-06-30 21:49:07');
INSERT INTO `t_guiconnect` VALUES ('150', '187', '403', '11463021370432', '402', '114630213653623', '-1', '2014-06-30 21:49:07');
INSERT INTO `t_guiconnect` VALUES ('151', '187', '404', '11463021375909', '403', '11463021370432', '-1', '2014-06-30 21:49:07');
INSERT INTO `t_guiconnect` VALUES ('152', '187', '405', '114630213714633', '404', '11463021375909', '-1', '2014-06-30 21:49:07');
INSERT INTO `t_guiconnect` VALUES ('153', '187', '406', '114630213724696', '405', '114630213714633', '-1', '2014-06-30 21:49:07');
INSERT INTO `t_guiconnect` VALUES ('154', '187', '407', '114630211212859', '408', '1146302112148', '1', '2014-07-28 14:21:30');
INSERT INTO `t_guiconnect` VALUES ('155', '187', '407', '114630211212859', '423', '114630213724696', '1', '2014-07-28 14:21:30');
INSERT INTO `t_guiconnect` VALUES ('156', '187', '408', '1146302112148', '409', '114630212548505', '1', '2014-07-28 14:21:30');
INSERT INTO `t_guiconnect` VALUES ('157', '187', '412', '11463021266478', '409', '114630212548505', '1', '2014-07-28 14:21:30');
INSERT INTO `t_guiconnect` VALUES ('158', '187', '411', '11463021265452', '412', '11463021266478', '1', '2014-07-28 14:21:30');
INSERT INTO `t_guiconnect` VALUES ('159', '187', '413', '114630212632247', '411', '11463021265452', '1', '2014-07-28 14:21:30');
INSERT INTO `t_guiconnect` VALUES ('160', '187', '414', '114630213629785', '413', '114630212632247', '1', '2014-07-28 14:21:30');
INSERT INTO `t_guiconnect` VALUES ('161', '187', '415', '114630213633902', '414', '114630213629785', '1', '2014-07-28 14:21:30');
INSERT INTO `t_guiconnect` VALUES ('162', '187', '416', '114630213641264', '415', '114630213633902', '1', '2014-07-28 14:21:30');
INSERT INTO `t_guiconnect` VALUES ('163', '187', '417', '114630213644509', '416', '114630213641264', '1', '2014-07-28 14:21:30');
INSERT INTO `t_guiconnect` VALUES ('164', '187', '418', '114630213648691', '417', '114630213644509', '1', '2014-07-28 14:21:30');
INSERT INTO `t_guiconnect` VALUES ('165', '187', '419', '114630213653623', '418', '114630213648691', '1', '2014-07-28 14:21:30');
INSERT INTO `t_guiconnect` VALUES ('166', '187', '420', '11463021370432', '419', '114630213653623', '1', '2014-07-28 14:21:30');
INSERT INTO `t_guiconnect` VALUES ('167', '187', '421', '11463021375909', '420', '11463021370432', '1', '2014-07-28 14:21:30');
INSERT INTO `t_guiconnect` VALUES ('168', '187', '422', '114630213714633', '421', '11463021375909', '1', '2014-07-28 14:21:30');
INSERT INTO `t_guiconnect` VALUES ('169', '187', '423', '114630213724696', '422', '114630213714633', '1', '2014-07-28 14:21:30');
INSERT INTO `t_guiconnect` VALUES ('170', '191', '425', '11481212020924', '424', '11481212019400', '1', '2014-08-01 21:20:32');
INSERT INTO `t_guiconnect` VALUES ('171', '191', '424', '11481212019400', '426', '11481212026368', '1', '2014-08-01 21:20:32');

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
INSERT INTO `t_guijson` VALUES ('178', '{\"attrs\":{\"x\":100,\"y\":100,\"id\":\"painting\",\"width\":3000,\"height\":2000,\"fill\":\"#ff33ee\",\"draggable\":true},\"className\":\"Layer\",\"children\":[]}', '1');
INSERT INTO `t_guijson` VALUES ('185', '{\"attrs\":{\"x\":100,\"y\":100,\"id\":\"painting\",\"width\":3000,\"height\":2000,\"fill\":\"#ff33ee\",\"draggable\":true},\"className\":\"Layer\",\"children\":[]}', '1');
INSERT INTO `t_guijson` VALUES ('186', '{\"attrs\":{\"x\":100,\"y\":100,\"id\":\"painting\",\"width\":3000,\"height\":2000,\"fill\":\"#ff33ee\",\"draggable\":true},\"className\":\"Layer\",\"children\":[]}', '1');
INSERT INTO `t_guijson` VALUES ('187', '{\"attrs\":{\"x\":100,\"y\":100,\"id\":\"painting\",\"width\":3000,\"height\":2000,\"fill\":\"#ff33ee\",\"draggable\":true,\"visible\":true,\"scaleX\":0.6400000000000003,\"scaleY\":0.6400000000000003},\"className\":\"Layer\",\"children\":[{\"attrs\":{\"x\":513,\"y\":136,\"name\":\"type1\",\"draggable\":true,\"id\":\"114630211212859\",\"visible\":true},\"className\":\"Group\",\"children\":[{\"attrs\":{\"width\":50,\"name\":\"type1\",\"height\":50},\"className\":\"Image\"},{\"attrs\":{\"y\":25,\"points\":[0,0,-60,0],\"stroke\":\"black\",\"strokeWidth\":5,\"name\":\"lineLeft\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"x\":-60,\"y\":25,\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"name\":\"connPointsLeft\",\"visible\":true},\"className\":\"Circle\"}]},{\"attrs\":{\"x\":347.6874999999997,\"y\":135.99999999999983,\"name\":\"type5\",\"draggable\":true,\"id\":\"1146302112148\",\"visible\":true},\"className\":\"Group\",\"children\":[{\"attrs\":{\"width\":50,\"name\":\"type5\",\"height\":50},\"className\":\"Image\"},{\"attrs\":{\"x\":50,\"y\":25,\"points\":[0,0,55.312500000000355,1.7763568394002505e-13],\"stroke\":\"black\",\"strokeWidth\":5,\"name\":\"lineRight\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"y\":25,\"points\":[0,0,-64.68749999999966,1.7763568394002505e-13],\"stroke\":\"black\",\"strokeWidth\":5,\"name\":\"lineLeft\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"x\":-64.68749999999966,\"y\":25.000000000000174,\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"name\":\"connPointsLeft\",\"visible\":true},\"className\":\"Circle\"},{\"attrs\":{\"x\":105.31250000000034,\"y\":25.000000000000174,\"name\":\"connPointsRight\",\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"visible\":true},\"className\":\"Circle\"}]},{\"attrs\":{\"x\":173,\"y\":136,\"name\":\"type2\",\"draggable\":true,\"id\":\"114630212548505\",\"visible\":true},\"className\":\"Group\",\"children\":[{\"attrs\":{\"width\":50,\"name\":\"type2\",\"height\":50},\"className\":\"Image\"},{\"attrs\":{\"x\":50,\"y\":25,\"points\":[0,0,60,0],\"stroke\":\"black\",\"strokeWidth\":5,\"name\":\"lineRight\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"y\":25,\"points\":[0,0,-60,0],\"stroke\":\"black\",\"strokeWidth\":5,\"name\":\"lineLeft\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"x\":-60,\"y\":25,\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"name\":\"connPointsLeft\",\"visible\":true},\"className\":\"Circle\"},{\"attrs\":{\"x\":110,\"y\":25,\"name\":\"connPointsRight\",\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"visible\":true},\"className\":\"Circle\"}]},{\"attrs\":{\"x\":3,\"y\":136,\"name\":\"type0\",\"draggable\":true,\"id\":\"114630212551784\",\"visible\":true},\"className\":\"Group\",\"children\":[{\"attrs\":{\"width\":50,\"name\":\"type0\",\"height\":50},\"className\":\"Image\"},{\"attrs\":{\"x\":50,\"y\":25,\"points\":[0,0,60,0],\"stroke\":\"black\",\"strokeWidth\":5,\"name\":\"lineRight\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"x\":110,\"y\":25,\"name\":\"connPointsRight\",\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"visible\":true},\"className\":\"Circle\"}]},{\"attrs\":{\"x\":343,\"y\":-34,\"name\":\"type5\",\"draggable\":true,\"id\":\"11463021265452\",\"visible\":true},\"className\":\"Group\",\"children\":[{\"attrs\":{\"width\":50,\"name\":\"type5\",\"height\":50},\"className\":\"Image\"},{\"attrs\":{\"x\":50,\"y\":25,\"points\":[0,0,60,0],\"stroke\":\"black\",\"strokeWidth\":5,\"name\":\"lineRight\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"y\":25,\"points\":[0,0,-60,0],\"stroke\":\"black\",\"strokeWidth\":5,\"name\":\"lineLeft\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"x\":-60,\"y\":25,\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"name\":\"connPointsLeft\",\"visible\":true},\"className\":\"Circle\"},{\"attrs\":{\"x\":110,\"y\":25,\"name\":\"connPointsRight\",\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"visible\":true},\"className\":\"Circle\"}]},{\"attrs\":{\"x\":258,\"y\":101,\"name\":\"type2\",\"draggable\":true,\"rotation\":270,\"id\":\"11463021266478\",\"visible\":true},\"className\":\"Group\",\"children\":[{\"attrs\":{\"width\":50,\"name\":\"type2\",\"height\":50},\"className\":\"Image\"},{\"attrs\":{\"x\":50,\"y\":25,\"points\":[0,0,60,0],\"stroke\":\"black\",\"strokeWidth\":5,\"name\":\"lineRight\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"y\":25,\"points\":[0,0,-60,0],\"stroke\":\"black\",\"strokeWidth\":5,\"name\":\"lineLeft\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"x\":-60,\"y\":25,\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"name\":\"connPointsLeft\",\"visible\":true},\"className\":\"Circle\"},{\"attrs\":{\"x\":110,\"y\":25,\"name\":\"connPointsRight\",\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"visible\":true},\"className\":\"Circle\"}]},{\"attrs\":{\"x\":513,\"y\":-34,\"name\":\"type2\",\"draggable\":true,\"id\":\"114630212632247\",\"visible\":true},\"className\":\"Group\",\"children\":[{\"attrs\":{\"width\":50,\"name\":\"type2\",\"height\":50},\"className\":\"Image\"},{\"attrs\":{\"x\":50,\"y\":25,\"points\":[0,0,60,0],\"stroke\":\"black\",\"strokeWidth\":5,\"name\":\"lineRight\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"y\":25,\"points\":[0,0,-60,0],\"stroke\":\"black\",\"strokeWidth\":5,\"name\":\"lineLeft\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"x\":-60,\"y\":25,\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"name\":\"connPointsLeft\",\"visible\":true},\"className\":\"Circle\"},{\"attrs\":{\"x\":110,\"y\":25,\"name\":\"connPointsRight\",\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"visible\":true},\"className\":\"Circle\"}]},{\"attrs\":{\"x\":683,\"y\":-34,\"name\":\"type3\",\"draggable\":true,\"id\":\"114630213629785\",\"visible\":true},\"className\":\"Group\",\"children\":[{\"attrs\":{\"width\":50,\"name\":\"type3\",\"height\":50},\"className\":\"Image\"},{\"attrs\":{\"x\":50,\"y\":25,\"points\":[0,0,60,0],\"stroke\":\"black\",\"strokeWidth\":5,\"name\":\"lineRight\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"y\":25,\"points\":[0,0,-60,0],\"stroke\":\"black\",\"strokeWidth\":5,\"name\":\"lineLeft\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"x\":-60,\"y\":25,\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"name\":\"connPointsLeft\",\"visible\":true},\"className\":\"Circle\"},{\"attrs\":{\"x\":110,\"y\":25,\"name\":\"connPointsRight\",\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"visible\":true},\"className\":\"Circle\"}]},{\"attrs\":{\"x\":818,\"y\":50.99999999999999,\"name\":\"type2\",\"draggable\":true,\"rotation\":90,\"id\":\"114630213633902\",\"visible\":true},\"className\":\"Group\",\"children\":[{\"attrs\":{\"width\":50,\"name\":\"type2\",\"height\":50},\"className\":\"Image\"},{\"attrs\":{\"x\":50,\"y\":25,\"points\":[0,0,60,0],\"stroke\":\"black\",\"strokeWidth\":5,\"name\":\"lineRight\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"y\":25,\"points\":[0,0,-60,0],\"stroke\":\"black\",\"strokeWidth\":5,\"name\":\"lineLeft\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"x\":-60,\"y\":25,\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"name\":\"connPointsLeft\",\"visible\":true},\"className\":\"Circle\"},{\"attrs\":{\"x\":110,\"y\":25,\"name\":\"connPointsRight\",\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"visible\":true},\"className\":\"Circle\"}]},{\"attrs\":{\"x\":853,\"y\":136,\"name\":\"type2\",\"draggable\":true,\"id\":\"114630213641264\",\"visible\":true},\"className\":\"Group\",\"children\":[{\"attrs\":{\"width\":50,\"name\":\"type2\",\"height\":50},\"className\":\"Image\"},{\"attrs\":{\"x\":50,\"y\":25,\"points\":[0,0,60,0],\"stroke\":\"black\",\"strokeWidth\":5,\"name\":\"lineRight\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"y\":25,\"points\":[0,0,-60,0],\"stroke\":\"black\",\"strokeWidth\":5,\"name\":\"lineLeft\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"x\":-60,\"y\":25,\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"name\":\"connPointsLeft\",\"visible\":true},\"className\":\"Circle\"},{\"attrs\":{\"x\":110,\"y\":25,\"name\":\"connPointsRight\",\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"visible\":true},\"className\":\"Circle\"}]},{\"attrs\":{\"x\":1022.9999999999999,\"y\":136,\"name\":\"type3\",\"draggable\":true,\"id\":\"114630213644509\",\"visible\":true},\"className\":\"Group\",\"children\":[{\"attrs\":{\"width\":50,\"name\":\"type3\",\"height\":50},\"className\":\"Image\"},{\"attrs\":{\"x\":50,\"y\":25,\"points\":[0,0,60,0],\"stroke\":\"black\",\"strokeWidth\":5,\"name\":\"lineRight\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"y\":25,\"points\":[0,0,-60,0],\"stroke\":\"black\",\"strokeWidth\":5,\"name\":\"lineLeft\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"x\":-60,\"y\":25,\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"name\":\"connPointsLeft\",\"visible\":true},\"className\":\"Circle\"},{\"attrs\":{\"x\":110,\"y\":25,\"name\":\"connPointsRight\",\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"visible\":true},\"className\":\"Circle\"}]},{\"attrs\":{\"x\":1158,\"y\":221.00000000000003,\"name\":\"type2\",\"draggable\":true,\"rotation\":90,\"id\":\"114630213648691\",\"visible\":true},\"className\":\"Group\",\"children\":[{\"attrs\":{\"width\":50,\"name\":\"type2\",\"height\":50},\"className\":\"Image\"},{\"attrs\":{\"x\":50,\"y\":25,\"points\":[0,0,60,0],\"stroke\":\"black\",\"strokeWidth\":5,\"name\":\"lineRight\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"y\":25,\"points\":[0,0,-60,0],\"stroke\":\"black\",\"strokeWidth\":5,\"name\":\"lineLeft\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"x\":-60,\"y\":25,\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"name\":\"connPointsLeft\",\"visible\":true},\"className\":\"Circle\"},{\"attrs\":{\"x\":110,\"y\":25,\"name\":\"connPointsRight\",\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"visible\":true},\"className\":\"Circle\"}]},{\"attrs\":{\"x\":1072.9999999999998,\"y\":356.00000000000006,\"name\":\"type2\",\"draggable\":true,\"rotation\":-180,\"id\":\"114630213653623\",\"visible\":true},\"className\":\"Group\",\"children\":[{\"attrs\":{\"width\":50,\"name\":\"type2\",\"height\":50},\"className\":\"Image\"},{\"attrs\":{\"x\":50,\"y\":25,\"points\":[0,0,60,0],\"stroke\":\"black\",\"strokeWidth\":5,\"name\":\"lineRight\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"y\":25,\"points\":[0,0,-60,0],\"stroke\":\"black\",\"strokeWidth\":5,\"name\":\"lineLeft\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"x\":-60,\"y\":25,\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"name\":\"connPointsLeft\",\"visible\":true},\"className\":\"Circle\"},{\"attrs\":{\"x\":110,\"y\":25,\"name\":\"connPointsRight\",\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"visible\":true},\"className\":\"Circle\"}]},{\"attrs\":{\"x\":902.9999999999998,\"y\":356.0000000000001,\"name\":\"type3\",\"draggable\":true,\"rotation\":180,\"id\":\"11463021370432\",\"visible\":true},\"className\":\"Group\",\"children\":[{\"attrs\":{\"width\":50,\"name\":\"type3\",\"height\":50},\"className\":\"Image\"},{\"attrs\":{\"x\":50,\"y\":25,\"points\":[0,0,60,0],\"stroke\":\"black\",\"strokeWidth\":5,\"name\":\"lineRight\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"y\":25,\"points\":[0,0,-60,0],\"stroke\":\"black\",\"strokeWidth\":5,\"name\":\"lineLeft\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"x\":-60,\"y\":25,\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"name\":\"connPointsLeft\",\"visible\":true},\"className\":\"Circle\"},{\"attrs\":{\"x\":110,\"y\":25,\"name\":\"connPointsRight\",\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"visible\":true},\"className\":\"Circle\"}]},{\"attrs\":{\"x\":732.9999999999998,\"y\":356.00000000000006,\"name\":\"type4\",\"draggable\":true,\"rotation\":180,\"id\":\"11463021375909\",\"visible\":true},\"className\":\"Group\",\"children\":[{\"attrs\":{\"width\":50,\"name\":\"type4\",\"height\":50},\"className\":\"Image\"},{\"attrs\":{\"x\":50,\"y\":25,\"points\":[0,0,60,0],\"stroke\":\"black\",\"strokeWidth\":5,\"name\":\"lineRight\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"y\":25,\"points\":[0,0,-60,0],\"stroke\":\"black\",\"strokeWidth\":5,\"name\":\"lineLeft\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"x\":-60,\"y\":25,\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"name\":\"connPointsLeft\",\"visible\":true},\"className\":\"Circle\"},{\"attrs\":{\"x\":110,\"y\":25,\"name\":\"connPointsRight\",\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"visible\":true},\"className\":\"Circle\"}]},{\"attrs\":{\"x\":562.9999999999998,\"y\":356.00000000000006,\"name\":\"type3\",\"draggable\":true,\"rotation\":-180,\"id\":\"114630213714633\",\"visible\":true},\"className\":\"Group\",\"children\":[{\"attrs\":{\"width\":50,\"name\":\"type3\",\"height\":50},\"className\":\"Image\"},{\"attrs\":{\"x\":50,\"y\":25,\"points\":[0,0,60,0],\"stroke\":\"black\",\"strokeWidth\":5,\"name\":\"lineRight\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"y\":25,\"points\":[0,0,-60,0],\"stroke\":\"black\",\"strokeWidth\":5,\"name\":\"lineLeft\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"x\":-60,\"y\":25,\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"name\":\"connPointsLeft\",\"visible\":true},\"className\":\"Circle\"},{\"attrs\":{\"x\":110,\"y\":25,\"name\":\"connPointsRight\",\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"visible\":true},\"className\":\"Circle\"}]},{\"attrs\":{\"x\":427.9999999999998,\"y\":271.0000000000001,\"name\":\"type3\",\"draggable\":true,\"rotation\":270,\"id\":\"114630213724696\",\"visible\":true},\"className\":\"Group\",\"children\":[{\"attrs\":{\"width\":50,\"name\":\"type3\",\"height\":50},\"className\":\"Image\"},{\"attrs\":{\"x\":50,\"y\":25,\"points\":[0,0,60,0],\"stroke\":\"black\",\"strokeWidth\":5,\"name\":\"lineRight\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"y\":25,\"points\":[0,0,-60,0],\"stroke\":\"black\",\"strokeWidth\":5,\"name\":\"lineLeft\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"x\":-60,\"y\":25,\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"name\":\"connPointsLeft\",\"visible\":true},\"className\":\"Circle\"},{\"attrs\":{\"x\":110,\"y\":25,\"name\":\"connPointsRight\",\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"visible\":true},\"className\":\"Circle\"}]}]}', '0.6400000000000003');
INSERT INTO `t_guijson` VALUES ('188', '{\"attrs\":{\"x\":100,\"y\":100,\"id\":\"painting\",\"width\":3000,\"height\":2000,\"fill\":\"#ff33ee\",\"draggable\":true,\"visible\":true},\"className\":\"Layer\",\"children\":[{\"attrs\":{\"x\":769,\"y\":35,\"name\":\"type1\",\"draggable\":true,\"id\":\"114630211221363\",\"visible\":true},\"className\":\"Group\",\"children\":[{\"attrs\":{\"width\":50,\"name\":\"type1\",\"height\":50},\"className\":\"Image\"},{\"attrs\":{\"y\":25,\"points\":[0,0,-253,1],\"stroke\":\"black\",\"strokeWidth\":5,\"name\":\"lineLeft\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"x\":-253,\"y\":26,\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"name\":\"connPointsLeft\",\"visible\":true},\"className\":\"Circle\"}]},{\"attrs\":{\"x\":73,\"y\":33,\"name\":\"type0\",\"draggable\":true,\"id\":\"114630211222375\",\"visible\":true},\"className\":\"Group\",\"children\":[{\"attrs\":{\"width\":50,\"name\":\"type0\",\"height\":50},\"className\":\"Image\"},{\"attrs\":{\"x\":50,\"y\":25,\"points\":[0,0,60,0],\"stroke\":\"black\",\"strokeWidth\":5,\"name\":\"lineRight\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"x\":110,\"y\":25,\"name\":\"connPointsRight\",\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"visible\":true},\"className\":\"Circle\"}]},{\"attrs\":{\"x\":352,\"y\":36,\"name\":\"type3\",\"draggable\":true,\"id\":\"114630211223229\",\"visible\":true},\"className\":\"Group\",\"children\":[{\"attrs\":{\"width\":50,\"name\":\"type3\",\"height\":50},\"className\":\"Image\"},{\"attrs\":{\"x\":50,\"y\":25,\"points\":[0,0,114,0],\"stroke\":\"black\",\"strokeWidth\":5,\"name\":\"lineRight\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"y\":25,\"points\":[0,0,-169,-3],\"stroke\":\"black\",\"strokeWidth\":5,\"name\":\"lineLeft\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"x\":-169,\"y\":22,\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"name\":\"connPointsLeft\",\"visible\":true},\"className\":\"Circle\"},{\"attrs\":{\"x\":164,\"y\":25,\"name\":\"connPointsRight\",\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"visible\":true},\"className\":\"Circle\"}]},{\"attrs\":{\"x\":208,\"y\":118,\"name\":\"type3\",\"draggable\":true,\"rotation\":90,\"id\":\"114630211623955\",\"visible\":true},\"className\":\"Group\",\"children\":[{\"attrs\":{\"width\":50,\"name\":\"type3\",\"height\":50},\"className\":\"Image\"},{\"attrs\":{\"x\":50,\"y\":25,\"points\":[0,0,60,0],\"stroke\":\"black\",\"strokeWidth\":5,\"name\":\"lineRight\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"y\":25,\"points\":[0,0,-60,0],\"stroke\":\"black\",\"strokeWidth\":5,\"name\":\"lineLeft\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"x\":-60,\"y\":25,\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"name\":\"connPointsLeft\",\"visible\":true},\"className\":\"Circle\"},{\"attrs\":{\"x\":110,\"y\":25,\"name\":\"connPointsRight\",\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"visible\":true},\"className\":\"Circle\"}]},{\"attrs\":{\"x\":243,\"y\":203,\"name\":\"type4\",\"draggable\":true,\"id\":\"11463021184760\",\"visible\":true},\"className\":\"Group\",\"children\":[{\"attrs\":{\"width\":50,\"name\":\"type4\",\"height\":50},\"className\":\"Image\"},{\"attrs\":{\"x\":50,\"y\":25,\"points\":[0,0,60,0],\"stroke\":\"black\",\"strokeWidth\":5,\"name\":\"lineRight\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"y\":25,\"points\":[0,0,-60,0],\"stroke\":\"black\",\"strokeWidth\":5,\"name\":\"lineLeft\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"x\":-60,\"y\":25,\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"name\":\"connPointsLeft\",\"visible\":true},\"className\":\"Circle\"},{\"attrs\":{\"x\":110,\"y\":25,\"name\":\"connPointsRight\",\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"visible\":true},\"className\":\"Circle\"}]},{\"attrs\":{\"x\":413,\"y\":203,\"name\":\"type3\",\"draggable\":true,\"id\":\"114630212159501\",\"visible\":true},\"className\":\"Group\",\"children\":[{\"attrs\":{\"width\":50,\"name\":\"type3\",\"height\":50},\"className\":\"Image\"},{\"attrs\":{\"x\":50,\"y\":25,\"points\":[0,0,60,0],\"stroke\":\"black\",\"strokeWidth\":5,\"name\":\"lineRight\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"y\":25,\"points\":[0,0,-60,0],\"stroke\":\"black\",\"strokeWidth\":5,\"name\":\"lineLeft\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"x\":-60,\"y\":25,\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"name\":\"connPointsLeft\",\"visible\":true},\"className\":\"Circle\"},{\"attrs\":{\"x\":110,\"y\":25,\"name\":\"connPointsRight\",\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"visible\":true},\"className\":\"Circle\"}]},{\"attrs\":{\"x\":583,\"y\":203,\"name\":\"type1\",\"draggable\":true,\"id\":\"114630212432952\",\"visible\":true},\"className\":\"Group\",\"children\":[{\"attrs\":{\"width\":50,\"name\":\"type1\",\"height\":50},\"className\":\"Image\"},{\"attrs\":{\"y\":25,\"points\":[0,0,-60,0],\"stroke\":\"black\",\"strokeWidth\":5,\"name\":\"lineLeft\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"x\":-60,\"y\":25,\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"name\":\"connPointsLeft\",\"visible\":true},\"className\":\"Circle\"}]},{\"attrs\":{\"x\":208,\"y\":288,\"name\":\"type3\",\"draggable\":true,\"rotation\":90,\"id\":\"11463021256207\",\"visible\":true},\"className\":\"Group\",\"children\":[{\"attrs\":{\"width\":50,\"name\":\"type3\",\"height\":50},\"className\":\"Image\"},{\"attrs\":{\"x\":50,\"y\":25,\"points\":[0,0,60,0],\"stroke\":\"black\",\"strokeWidth\":5,\"name\":\"lineRight\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"y\":25,\"points\":[0,0,-60,0],\"stroke\":\"black\",\"strokeWidth\":5,\"name\":\"lineLeft\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"x\":-60,\"y\":25,\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"name\":\"connPointsLeft\",\"visible\":true},\"className\":\"Circle\"},{\"attrs\":{\"x\":110,\"y\":25,\"name\":\"connPointsRight\",\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"visible\":true},\"className\":\"Circle\"}]},{\"attrs\":{\"x\":243,\"y\":373,\"name\":\"type5\",\"draggable\":true,\"id\":\"114630212517612\",\"visible\":true},\"className\":\"Group\",\"children\":[{\"attrs\":{\"width\":50,\"name\":\"type5\",\"height\":50},\"className\":\"Image\"},{\"attrs\":{\"x\":50,\"y\":25,\"points\":[0,0,60,0],\"stroke\":\"black\",\"strokeWidth\":5,\"name\":\"lineRight\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"y\":25,\"points\":[0,0,-60,0],\"stroke\":\"black\",\"strokeWidth\":5,\"name\":\"lineLeft\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"x\":-60,\"y\":25,\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"name\":\"connPointsLeft\",\"visible\":true},\"className\":\"Circle\"},{\"attrs\":{\"x\":110,\"y\":25,\"name\":\"connPointsRight\",\"radius\":5,\"fill\":\"red\",\"stroke\":\"black\",\"visible\":true},\"className\":\"Circle\"}]}]}', '1');
INSERT INTO `t_guijson` VALUES ('189', '{\"attrs\":{\"x\":100,\"y\":-40,\"id\":\"painting\",\"width\":3000,\"height\":2000,\"fill\":\"#ff33ee\",\"draggable\":true,\"visible\":false},\"className\":\"Layer\",\"children\":[{\"attrs\":{\"x\":165,\"y\":139,\"name\":\"type0\",\"draggable\":true,\"id\":\"114630212525173\"},\"className\":\"Group\",\"children\":[{\"attrs\":{\"width\":50,\"name\":\"type0\",\"height\":50},\"className\":\"Image\"},{\"attrs\":{\"x\":50,\"y\":25,\"points\":[0,0,60,0],\"stroke\":\"black\",\"strokeWidth\":5,\"name\":\"lineRight\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"x\":110,\"y\":25,\"name\":\"connPointsRight\",\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"visible\":true},\"className\":\"Circle\"}]},{\"attrs\":{\"x\":335,\"y\":139,\"name\":\"type2\",\"draggable\":true,\"id\":\"114630212525956\"},\"className\":\"Group\",\"children\":[{\"attrs\":{\"width\":50,\"name\":\"type2\",\"height\":50},\"className\":\"Image\"},{\"attrs\":{\"x\":50,\"y\":25,\"points\":[0,0,60,0],\"stroke\":\"black\",\"strokeWidth\":5,\"name\":\"lineRight\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"y\":25,\"points\":[0,0,-60,0],\"stroke\":\"black\",\"strokeWidth\":5,\"name\":\"lineLeft\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"x\":-60,\"y\":25,\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"name\":\"connPointsLeft\",\"visible\":true},\"className\":\"Circle\"},{\"attrs\":{\"x\":110,\"y\":25,\"name\":\"connPointsRight\",\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"visible\":true},\"className\":\"Circle\"}]},{\"attrs\":{\"x\":505,\"y\":139,\"name\":\"type1\",\"draggable\":true,\"id\":\"1146302125281\"},\"className\":\"Group\",\"children\":[{\"attrs\":{\"width\":50,\"name\":\"type1\",\"height\":50},\"className\":\"Image\"},{\"attrs\":{\"y\":25,\"points\":[0,0,-60,0],\"stroke\":\"black\",\"strokeWidth\":5,\"name\":\"lineLeft\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"x\":-60,\"y\":25,\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"name\":\"connPointsLeft\",\"visible\":true},\"className\":\"Circle\"}]}]}', '1');
INSERT INTO `t_guijson` VALUES ('190', '{\"attrs\":{\"x\":100,\"y\":100,\"id\":\"painting\",\"width\":3000,\"height\":2000,\"fill\":\"#ff33ee\",\"draggable\":true,\"visible\":true},\"className\":\"Layer\",\"children\":[{\"attrs\":{\"x\":451,\"y\":10,\"name\":\"type1\",\"draggable\":true,\"id\":\"114630212636363\",\"visible\":true},\"className\":\"Group\",\"children\":[{\"attrs\":{\"width\":50,\"name\":\"type1\",\"height\":50},\"className\":\"Image\"},{\"attrs\":{\"y\":25,\"points\":[0,0,-60,0],\"stroke\":\"black\",\"strokeWidth\":5,\"name\":\"lineLeft\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"x\":-60,\"y\":25,\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"name\":\"connPointsLeft\",\"visible\":true},\"className\":\"Circle\"}]},{\"attrs\":{\"x\":288,\"y\":63,\"name\":\"type2\",\"draggable\":true,\"id\":\"114630212637218\",\"visible\":true},\"className\":\"Group\",\"children\":[{\"attrs\":{\"width\":50,\"name\":\"type2\",\"height\":50},\"className\":\"Image\"},{\"attrs\":{\"x\":50,\"y\":25,\"points\":[0,0,53,-53],\"stroke\":\"black\",\"strokeWidth\":5,\"name\":\"lineRight\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"y\":25,\"points\":[0,0,-67,-53],\"stroke\":\"black\",\"strokeWidth\":5,\"name\":\"lineLeft\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"x\":-67,\"y\":-28,\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"name\":\"connPointsLeft\",\"visible\":true},\"className\":\"Circle\"},{\"attrs\":{\"x\":103,\"y\":-28,\"name\":\"connPointsRight\",\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"visible\":true},\"className\":\"Circle\"}]},{\"attrs\":{\"x\":111,\"y\":10,\"name\":\"type0\",\"draggable\":true,\"id\":\"11463021263839\",\"visible\":true},\"className\":\"Group\",\"children\":[{\"attrs\":{\"width\":50,\"name\":\"type0\",\"height\":50},\"className\":\"Image\"},{\"attrs\":{\"x\":50,\"y\":25,\"points\":[0,0,60,0],\"stroke\":\"black\",\"strokeWidth\":5,\"name\":\"lineRight\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"x\":110,\"y\":25,\"name\":\"connPointsRight\",\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"visible\":true},\"className\":\"Circle\"}]}]}', '1');
INSERT INTO `t_guijson` VALUES ('191', '{\"attrs\":{\"x\":100,\"y\":100,\"id\":\"painting\",\"width\":3000,\"height\":2000,\"fill\":\"#ff33ee\",\"draggable\":true,\"visible\":true},\"className\":\"Layer\",\"children\":[{\"attrs\":{\"x\":378,\"y\":56,\"name\":\"type2\",\"draggable\":true,\"id\":\"11481212019400\"},\"className\":\"Group\",\"children\":[{\"attrs\":{\"width\":50,\"name\":\"type2\",\"height\":50},\"className\":\"Image\"},{\"attrs\":{\"x\":50,\"y\":25,\"points\":[0,0,60,0],\"stroke\":\"black\",\"strokeWidth\":5,\"name\":\"lineRight\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"y\":25,\"points\":[0,0,-60,0],\"stroke\":\"black\",\"strokeWidth\":5,\"name\":\"lineLeft\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"x\":-60,\"y\":25,\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"name\":\"connPointsLeft\",\"visible\":true},\"className\":\"Circle\"},{\"attrs\":{\"x\":110,\"y\":25,\"name\":\"connPointsRight\",\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"visible\":true},\"className\":\"Circle\"}]},{\"attrs\":{\"x\":548,\"y\":56,\"name\":\"type3\",\"draggable\":true,\"id\":\"11481212020924\"},\"className\":\"Group\",\"children\":[{\"attrs\":{\"width\":50,\"name\":\"type3\",\"height\":50},\"className\":\"Image\"},{\"attrs\":{\"x\":50,\"y\":25,\"points\":[0,0,60,0],\"stroke\":\"black\",\"strokeWidth\":5,\"name\":\"lineRight\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"y\":25,\"points\":[0,0,-60,0],\"stroke\":\"black\",\"strokeWidth\":5,\"name\":\"lineLeft\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"x\":-60,\"y\":25,\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"name\":\"connPointsLeft\",\"visible\":true},\"className\":\"Circle\"},{\"attrs\":{\"x\":110,\"y\":25,\"name\":\"connPointsRight\",\"radius\":5,\"fill\":\"red\",\"stroke\":\"black\",\"visible\":true},\"className\":\"Circle\"}]},{\"attrs\":{\"x\":208,\"y\":56,\"name\":\"type4\",\"draggable\":true,\"id\":\"11481212026368\"},\"className\":\"Group\",\"children\":[{\"attrs\":{\"width\":50,\"name\":\"type4\",\"height\":50},\"className\":\"Image\"},{\"attrs\":{\"x\":50,\"y\":25,\"points\":[0,0,60,0],\"stroke\":\"black\",\"strokeWidth\":5,\"name\":\"lineRight\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"y\":25,\"points\":[0,0,-60,0],\"stroke\":\"black\",\"strokeWidth\":5,\"name\":\"lineLeft\",\"closed\":true},\"className\":\"Line\"},{\"attrs\":{\"x\":-60,\"y\":25,\"radius\":5,\"fill\":\"red\",\"stroke\":\"black\",\"name\":\"connPointsLeft\",\"visible\":true},\"className\":\"Circle\"},{\"attrs\":{\"x\":110,\"y\":25,\"name\":\"connPointsRight\",\"radius\":5,\"fill\":\"yellow\",\"stroke\":\"black\",\"visible\":true},\"className\":\"Circle\"}]}]}', '1');
INSERT INTO `t_guijson` VALUES ('192', '{\"attrs\":{\"x\":100,\"y\":100,\"id\":\"painting\",\"width\":3000,\"height\":2000,\"fill\":\"#ff33ee\",\"draggable\":true},\"className\":\"Layer\",\"children\":[]}', '1');
INSERT INTO `t_guijson` VALUES ('193', '{\"attrs\":{\"x\":100,\"y\":100,\"id\":\"painting\",\"width\":3000,\"height\":2000,\"fill\":\"#ff33ee\",\"draggable\":true},\"className\":\"Layer\",\"children\":[]}', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=427 DEFAULT CHARSET=utf8;

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
INSERT INTO `t_guipoint` VALUES ('276', '175', '114630153311239', '2', 'type2', '1', '2014-06-30 15:33:22');
INSERT INTO `t_guipoint` VALUES ('277', '175', '114630153312922', '2', 'type1', '1', '2014-06-30 15:33:22');
INSERT INTO `t_guipoint` VALUES ('278', '175', '114630153313797', '2', 'type0', '1', '2014-06-30 15:33:22');
INSERT INTO `t_guipoint` VALUES ('279', '174', '114630152024100', '2', 'type0', '1', '2014-06-30 15:33:22');
INSERT INTO `t_guipoint` VALUES ('280', '174', '114630152024293', '2', 'type2', '1', '2014-06-30 15:33:22');
INSERT INTO `t_guipoint` VALUES ('281', '174', '11463015202529', '2', 'type3', '1', '2014-06-30 15:33:22');
INSERT INTO `t_guipoint` VALUES ('282', '174', '114630152029853', '2', 'type1', '1', '2014-06-30 15:33:22');
INSERT INTO `t_guipoint` VALUES ('283', '174', '114630152033272', '2', 'type5', '1', '2014-06-30 15:33:22');
INSERT INTO `t_guipoint` VALUES ('284', '188', '114630211221363', '2', 'type1', '-1', '2014-06-30 21:12:28');
INSERT INTO `t_guipoint` VALUES ('285', '188', '114630211222375', '2', 'type0', '-1', '2014-06-30 21:12:28');
INSERT INTO `t_guipoint` VALUES ('286', '188', '114630211223229', '2', 'type3', '-1', '2014-06-30 21:12:28');
INSERT INTO `t_guipoint` VALUES ('287', '188', '114630211221363', '2', 'type1', '-1', '2014-06-30 21:13:26');
INSERT INTO `t_guipoint` VALUES ('288', '188', '114630211222375', '2', 'type0', '-1', '2014-06-30 21:13:26');
INSERT INTO `t_guipoint` VALUES ('289', '188', '114630211223229', '2', 'type3', '-1', '2014-06-30 21:13:26');
INSERT INTO `t_guipoint` VALUES ('290', '187', '114630211212859', '2', 'type1', '-1', '2014-06-30 21:13:31');
INSERT INTO `t_guipoint` VALUES ('291', '187', '1146302112148', '2', 'type5', '-1', '2014-06-30 21:13:31');
INSERT INTO `t_guipoint` VALUES ('292', '188', '114630211221363', '2', 'type1', '-1', '2014-06-30 21:16:33');
INSERT INTO `t_guipoint` VALUES ('293', '188', '114630211222375', '2', 'type0', '-1', '2014-06-30 21:16:33');
INSERT INTO `t_guipoint` VALUES ('294', '188', '114630211223229', '2', 'type3', '-1', '2014-06-30 21:16:33');
INSERT INTO `t_guipoint` VALUES ('295', '188', '114630211623955', '2', 'type3', '-1', '2014-06-30 21:16:33');
INSERT INTO `t_guipoint` VALUES ('296', '187', '114630211212859', '2', 'type1', '-1', '2014-06-30 21:16:35');
INSERT INTO `t_guipoint` VALUES ('297', '187', '1146302112148', '2', 'type5', '-1', '2014-06-30 21:16:35');
INSERT INTO `t_guipoint` VALUES ('298', '187', '114630211212859', '2', 'type1', '-1', '2014-06-30 21:18:54');
INSERT INTO `t_guipoint` VALUES ('299', '187', '1146302112148', '2', 'type5', '-1', '2014-06-30 21:18:54');
INSERT INTO `t_guipoint` VALUES ('300', '188', '114630211221363', '2', 'type1', '-1', '2014-06-30 21:18:54');
INSERT INTO `t_guipoint` VALUES ('301', '188', '114630211222375', '2', 'type0', '-1', '2014-06-30 21:18:54');
INSERT INTO `t_guipoint` VALUES ('302', '188', '114630211223229', '2', 'type3', '-1', '2014-06-30 21:18:54');
INSERT INTO `t_guipoint` VALUES ('303', '188', '114630211623955', '2', 'type3', '-1', '2014-06-30 21:18:54');
INSERT INTO `t_guipoint` VALUES ('304', '188', '11463021184760', '2', 'type4', '-1', '2014-06-30 21:18:54');
INSERT INTO `t_guipoint` VALUES ('305', '188', '114630211221363', '2', 'type1', '-1', '2014-06-30 21:18:56');
INSERT INTO `t_guipoint` VALUES ('306', '188', '114630211222375', '2', 'type0', '-1', '2014-06-30 21:18:56');
INSERT INTO `t_guipoint` VALUES ('307', '188', '114630211223229', '2', 'type3', '-1', '2014-06-30 21:18:56');
INSERT INTO `t_guipoint` VALUES ('308', '188', '114630211623955', '2', 'type3', '-1', '2014-06-30 21:18:56');
INSERT INTO `t_guipoint` VALUES ('309', '188', '11463021184760', '2', 'type4', '-1', '2014-06-30 21:18:56');
INSERT INTO `t_guipoint` VALUES ('310', '187', '114630211212859', '2', 'type1', '-1', '2014-06-30 21:23:53');
INSERT INTO `t_guipoint` VALUES ('311', '187', '1146302112148', '2', 'type5', '-1', '2014-06-30 21:23:53');
INSERT INTO `t_guipoint` VALUES ('312', '188', '114630211221363', '2', 'type1', '-1', '2014-06-30 21:23:53');
INSERT INTO `t_guipoint` VALUES ('313', '188', '114630211222375', '2', 'type0', '-1', '2014-06-30 21:23:53');
INSERT INTO `t_guipoint` VALUES ('314', '188', '114630211223229', '2', 'type3', '-1', '2014-06-30 21:23:53');
INSERT INTO `t_guipoint` VALUES ('315', '188', '114630211623955', '2', 'type3', '-1', '2014-06-30 21:23:53');
INSERT INTO `t_guipoint` VALUES ('316', '188', '11463021184760', '2', 'type4', '-1', '2014-06-30 21:23:53');
INSERT INTO `t_guipoint` VALUES ('317', '188', '114630212159501', '2', 'type3', '-1', '2014-06-30 21:23:53');
INSERT INTO `t_guipoint` VALUES ('318', '187', '114630211212859', '2', 'type1', '-1', '2014-06-30 21:24:14');
INSERT INTO `t_guipoint` VALUES ('319', '187', '1146302112148', '2', 'type5', '-1', '2014-06-30 21:24:14');
INSERT INTO `t_guipoint` VALUES ('320', '188', '114630211221363', '2', 'type1', '-1', '2014-06-30 21:24:14');
INSERT INTO `t_guipoint` VALUES ('321', '188', '114630211222375', '2', 'type0', '-1', '2014-06-30 21:24:14');
INSERT INTO `t_guipoint` VALUES ('322', '188', '114630211223229', '2', 'type3', '-1', '2014-06-30 21:24:14');
INSERT INTO `t_guipoint` VALUES ('323', '188', '114630211623955', '2', 'type3', '-1', '2014-06-30 21:24:14');
INSERT INTO `t_guipoint` VALUES ('324', '188', '11463021184760', '2', 'type4', '-1', '2014-06-30 21:24:14');
INSERT INTO `t_guipoint` VALUES ('325', '188', '114630212159501', '2', 'type3', '-1', '2014-06-30 21:24:14');
INSERT INTO `t_guipoint` VALUES ('326', '187', '114630211212859', '2', 'type1', '-1', '2014-06-30 21:24:41');
INSERT INTO `t_guipoint` VALUES ('327', '187', '1146302112148', '2', 'type5', '-1', '2014-06-30 21:24:41');
INSERT INTO `t_guipoint` VALUES ('328', '188', '114630211221363', '2', 'type1', '-1', '2014-06-30 21:24:41');
INSERT INTO `t_guipoint` VALUES ('329', '188', '114630211222375', '2', 'type0', '-1', '2014-06-30 21:24:41');
INSERT INTO `t_guipoint` VALUES ('330', '188', '114630211223229', '2', 'type3', '-1', '2014-06-30 21:24:41');
INSERT INTO `t_guipoint` VALUES ('331', '188', '114630211623955', '2', 'type3', '-1', '2014-06-30 21:24:41');
INSERT INTO `t_guipoint` VALUES ('332', '188', '11463021184760', '2', 'type4', '-1', '2014-06-30 21:24:41');
INSERT INTO `t_guipoint` VALUES ('333', '188', '114630212159501', '2', 'type3', '-1', '2014-06-30 21:24:41');
INSERT INTO `t_guipoint` VALUES ('334', '188', '114630212432952', '2', 'type1', '-1', '2014-06-30 21:24:41');
INSERT INTO `t_guipoint` VALUES ('335', '189', '114630212525173', '2', 'type0', '1', '2014-06-30 21:25:32');
INSERT INTO `t_guipoint` VALUES ('336', '189', '114630212525956', '2', 'type2', '1', '2014-06-30 21:25:32');
INSERT INTO `t_guipoint` VALUES ('337', '189', '1146302125281', '2', 'type1', '1', '2014-06-30 21:25:32');
INSERT INTO `t_guipoint` VALUES ('338', '187', '114630211212859', '2', 'type1', '-1', '2014-06-30 21:25:32');
INSERT INTO `t_guipoint` VALUES ('339', '187', '1146302112148', '2', 'type5', '-1', '2014-06-30 21:25:32');
INSERT INTO `t_guipoint` VALUES ('340', '188', '114630211221363', '2', 'type1', '-1', '2014-06-30 21:25:32');
INSERT INTO `t_guipoint` VALUES ('341', '188', '114630211222375', '2', 'type0', '-1', '2014-06-30 21:25:32');
INSERT INTO `t_guipoint` VALUES ('342', '188', '114630211223229', '2', 'type3', '-1', '2014-06-30 21:25:32');
INSERT INTO `t_guipoint` VALUES ('343', '188', '114630211623955', '2', 'type3', '-1', '2014-06-30 21:25:32');
INSERT INTO `t_guipoint` VALUES ('344', '188', '11463021184760', '2', 'type4', '-1', '2014-06-30 21:25:32');
INSERT INTO `t_guipoint` VALUES ('345', '188', '114630212159501', '2', 'type3', '-1', '2014-06-30 21:25:32');
INSERT INTO `t_guipoint` VALUES ('346', '188', '114630212432952', '2', 'type1', '-1', '2014-06-30 21:25:32');
INSERT INTO `t_guipoint` VALUES ('347', '188', '11463021256207', '2', 'type3', '-1', '2014-06-30 21:25:32');
INSERT INTO `t_guipoint` VALUES ('348', '188', '114630212517612', '2', 'type5', '-1', '2014-06-30 21:25:32');
INSERT INTO `t_guipoint` VALUES ('349', '190', '114630212636363', '2', 'type1', '-1', '2014-06-30 21:26:43');
INSERT INTO `t_guipoint` VALUES ('350', '190', '114630212637218', '2', 'type2', '-1', '2014-06-30 21:26:43');
INSERT INTO `t_guipoint` VALUES ('351', '190', '11463021263839', '2', 'type0', '-1', '2014-06-30 21:26:43');
INSERT INTO `t_guipoint` VALUES ('352', '187', '114630211212859', '2', 'type1', '-1', '2014-06-30 21:26:43');
INSERT INTO `t_guipoint` VALUES ('353', '187', '1146302112148', '2', 'type5', '-1', '2014-06-30 21:26:43');
INSERT INTO `t_guipoint` VALUES ('354', '187', '114630212548505', '2', 'type2', '-1', '2014-06-30 21:26:43');
INSERT INTO `t_guipoint` VALUES ('355', '187', '114630212551784', '2', 'type0', '-1', '2014-06-30 21:26:43');
INSERT INTO `t_guipoint` VALUES ('356', '187', '11463021265452', '2', 'type5', '-1', '2014-06-30 21:26:43');
INSERT INTO `t_guipoint` VALUES ('357', '187', '11463021266478', '2', 'type2', '-1', '2014-06-30 21:26:43');
INSERT INTO `t_guipoint` VALUES ('358', '187', '114630212632247', '2', 'type2', '-1', '2014-06-30 21:26:43');
INSERT INTO `t_guipoint` VALUES ('359', '188', '114630211221363', '2', 'type1', '-1', '2014-06-30 21:26:43');
INSERT INTO `t_guipoint` VALUES ('360', '188', '114630211222375', '2', 'type0', '-1', '2014-06-30 21:26:43');
INSERT INTO `t_guipoint` VALUES ('361', '188', '114630211223229', '2', 'type3', '-1', '2014-06-30 21:26:43');
INSERT INTO `t_guipoint` VALUES ('362', '188', '114630211623955', '2', 'type3', '-1', '2014-06-30 21:26:43');
INSERT INTO `t_guipoint` VALUES ('363', '188', '11463021184760', '2', 'type4', '-1', '2014-06-30 21:26:43');
INSERT INTO `t_guipoint` VALUES ('364', '188', '114630212159501', '2', 'type3', '-1', '2014-06-30 21:26:43');
INSERT INTO `t_guipoint` VALUES ('365', '188', '114630212432952', '2', 'type1', '-1', '2014-06-30 21:26:43');
INSERT INTO `t_guipoint` VALUES ('366', '188', '11463021256207', '2', 'type3', '-1', '2014-06-30 21:26:43');
INSERT INTO `t_guipoint` VALUES ('367', '188', '114630212517612', '2', 'type5', '-1', '2014-06-30 21:26:43');
INSERT INTO `t_guipoint` VALUES ('368', '190', '114630212636363', '2', 'type1', '-1', '2014-06-30 21:27:26');
INSERT INTO `t_guipoint` VALUES ('369', '190', '114630212637218', '2', 'type2', '-1', '2014-06-30 21:27:26');
INSERT INTO `t_guipoint` VALUES ('370', '190', '11463021263839', '2', 'type0', '-1', '2014-06-30 21:27:26');
INSERT INTO `t_guipoint` VALUES ('371', '187', '114630211212859', '2', 'type1', '-1', '2014-06-30 21:27:26');
INSERT INTO `t_guipoint` VALUES ('372', '187', '1146302112148', '2', 'type5', '-1', '2014-06-30 21:27:26');
INSERT INTO `t_guipoint` VALUES ('373', '187', '114630212548505', '2', 'type2', '-1', '2014-06-30 21:27:26');
INSERT INTO `t_guipoint` VALUES ('374', '187', '114630212551784', '2', 'type0', '-1', '2014-06-30 21:27:26');
INSERT INTO `t_guipoint` VALUES ('375', '187', '11463021265452', '2', 'type5', '-1', '2014-06-30 21:27:26');
INSERT INTO `t_guipoint` VALUES ('376', '187', '11463021266478', '2', 'type2', '-1', '2014-06-30 21:27:26');
INSERT INTO `t_guipoint` VALUES ('377', '187', '114630212632247', '2', 'type2', '-1', '2014-06-30 21:27:26');
INSERT INTO `t_guipoint` VALUES ('378', '188', '114630211221363', '2', 'type1', '1', '2014-06-30 21:27:26');
INSERT INTO `t_guipoint` VALUES ('379', '188', '114630211222375', '2', 'type0', '1', '2014-06-30 21:27:26');
INSERT INTO `t_guipoint` VALUES ('380', '188', '114630211223229', '2', 'type3', '1', '2014-06-30 21:27:26');
INSERT INTO `t_guipoint` VALUES ('381', '188', '114630211623955', '2', 'type3', '1', '2014-06-30 21:27:26');
INSERT INTO `t_guipoint` VALUES ('382', '188', '11463021184760', '2', 'type4', '1', '2014-06-30 21:27:26');
INSERT INTO `t_guipoint` VALUES ('383', '188', '114630212159501', '2', 'type3', '1', '2014-06-30 21:27:26');
INSERT INTO `t_guipoint` VALUES ('384', '188', '114630212432952', '2', 'type1', '1', '2014-06-30 21:27:26');
INSERT INTO `t_guipoint` VALUES ('385', '188', '11463021256207', '2', 'type3', '1', '2014-06-30 21:27:26');
INSERT INTO `t_guipoint` VALUES ('386', '188', '114630212517612', '2', 'type5', '1', '2014-06-30 21:27:26');
INSERT INTO `t_guipoint` VALUES ('387', '190', '114630212636363', '2', 'type1', '1', '2014-06-30 21:27:28');
INSERT INTO `t_guipoint` VALUES ('388', '190', '114630212637218', '2', 'type2', '1', '2014-06-30 21:27:28');
INSERT INTO `t_guipoint` VALUES ('389', '190', '11463021263839', '2', 'type0', '1', '2014-06-30 21:27:28');
INSERT INTO `t_guipoint` VALUES ('390', '187', '114630211212859', '2', 'type1', '-1', '2014-06-30 21:49:07');
INSERT INTO `t_guipoint` VALUES ('391', '187', '1146302112148', '2', 'type5', '-1', '2014-06-30 21:49:07');
INSERT INTO `t_guipoint` VALUES ('392', '187', '114630212548505', '2', 'type2', '-1', '2014-06-30 21:49:07');
INSERT INTO `t_guipoint` VALUES ('393', '187', '114630212551784', '2', 'type0', '-1', '2014-06-30 21:49:07');
INSERT INTO `t_guipoint` VALUES ('394', '187', '11463021265452', '2', 'type5', '-1', '2014-06-30 21:49:07');
INSERT INTO `t_guipoint` VALUES ('395', '187', '11463021266478', '2', 'type2', '-1', '2014-06-30 21:49:07');
INSERT INTO `t_guipoint` VALUES ('396', '187', '114630212632247', '2', 'type2', '-1', '2014-06-30 21:49:07');
INSERT INTO `t_guipoint` VALUES ('397', '187', '114630213629785', '2', 'type3', '-1', '2014-06-30 21:49:07');
INSERT INTO `t_guipoint` VALUES ('398', '187', '114630213633902', '2', 'type2', '-1', '2014-06-30 21:49:07');
INSERT INTO `t_guipoint` VALUES ('399', '187', '114630213641264', '2', 'type2', '-1', '2014-06-30 21:49:07');
INSERT INTO `t_guipoint` VALUES ('400', '187', '114630213644509', '2', 'type3', '-1', '2014-06-30 21:49:07');
INSERT INTO `t_guipoint` VALUES ('401', '187', '114630213648691', '2', 'type2', '-1', '2014-06-30 21:49:07');
INSERT INTO `t_guipoint` VALUES ('402', '187', '114630213653623', '2', 'type2', '-1', '2014-06-30 21:49:07');
INSERT INTO `t_guipoint` VALUES ('403', '187', '11463021370432', '2', 'type3', '-1', '2014-06-30 21:49:07');
INSERT INTO `t_guipoint` VALUES ('404', '187', '11463021375909', '2', 'type4', '-1', '2014-06-30 21:49:07');
INSERT INTO `t_guipoint` VALUES ('405', '187', '114630213714633', '2', 'type3', '-1', '2014-06-30 21:49:07');
INSERT INTO `t_guipoint` VALUES ('406', '187', '114630213724696', '2', 'type3', '-1', '2014-06-30 21:49:07');
INSERT INTO `t_guipoint` VALUES ('407', '187', '114630211212859', '2', 'type1', '1', '2014-07-28 14:21:30');
INSERT INTO `t_guipoint` VALUES ('408', '187', '1146302112148', '2', 'type5', '1', '2014-07-28 14:21:30');
INSERT INTO `t_guipoint` VALUES ('409', '187', '114630212548505', '2', 'type2', '1', '2014-07-28 14:21:30');
INSERT INTO `t_guipoint` VALUES ('410', '187', '114630212551784', '2', 'type0', '1', '2014-07-28 14:21:30');
INSERT INTO `t_guipoint` VALUES ('411', '187', '11463021265452', '2', 'type5', '1', '2014-07-28 14:21:30');
INSERT INTO `t_guipoint` VALUES ('412', '187', '11463021266478', '2', 'type2', '1', '2014-07-28 14:21:30');
INSERT INTO `t_guipoint` VALUES ('413', '187', '114630212632247', '2', 'type2', '1', '2014-07-28 14:21:30');
INSERT INTO `t_guipoint` VALUES ('414', '187', '114630213629785', '2', 'type3', '1', '2014-07-28 14:21:30');
INSERT INTO `t_guipoint` VALUES ('415', '187', '114630213633902', '2', 'type2', '1', '2014-07-28 14:21:30');
INSERT INTO `t_guipoint` VALUES ('416', '187', '114630213641264', '2', 'type2', '1', '2014-07-28 14:21:30');
INSERT INTO `t_guipoint` VALUES ('417', '187', '114630213644509', '2', 'type3', '1', '2014-07-28 14:21:30');
INSERT INTO `t_guipoint` VALUES ('418', '187', '114630213648691', '2', 'type2', '1', '2014-07-28 14:21:30');
INSERT INTO `t_guipoint` VALUES ('419', '187', '114630213653623', '2', 'type2', '1', '2014-07-28 14:21:30');
INSERT INTO `t_guipoint` VALUES ('420', '187', '11463021370432', '2', 'type3', '1', '2014-07-28 14:21:30');
INSERT INTO `t_guipoint` VALUES ('421', '187', '11463021375909', '2', 'type4', '1', '2014-07-28 14:21:30');
INSERT INTO `t_guipoint` VALUES ('422', '187', '114630213714633', '2', 'type3', '1', '2014-07-28 14:21:30');
INSERT INTO `t_guipoint` VALUES ('423', '187', '114630213724696', '2', 'type3', '1', '2014-07-28 14:21:30');
INSERT INTO `t_guipoint` VALUES ('424', '191', '11481212019400', '2', 'type2', '1', '2014-08-01 21:20:32');
INSERT INTO `t_guipoint` VALUES ('425', '191', '11481212020924', '2', 'type3', '1', '2014-08-01 21:20:32');
INSERT INTO `t_guipoint` VALUES ('426', '191', '11481212026368', '2', 'type4', '1', '2014-08-01 21:20:32');

-- ----------------------------
-- Table structure for t_guipointproper
-- ----------------------------
DROP TABLE IF EXISTS `t_guipointproper`;
CREATE TABLE `t_guipointproper` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `point_type` varchar(32) DEFAULT NULL,
  `point_type_id` int(11) DEFAULT NULL,
  `par_id` int(11) DEFAULT NULL,
  `par_display` varchar(50) DEFAULT NULL,
  `par_name` varchar(50) DEFAULT NULL,
  `par_messID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_guipointproper
-- ----------------------------
INSERT INTO `t_guipointproper` VALUES ('3', 'type1', null, null, '斜边', 'XIEBIAN', '3');
INSERT INTO `t_guipointproper` VALUES ('4', 'type1', '13', null, '直角边a', 'ZHIBIAN1', '3');
INSERT INTO `t_guipointproper` VALUES ('5', 'type1', '23', null, '加数2', 'b', '3');
INSERT INTO `t_guipointproper` VALUES ('6', 'type5', '24', null, '斜边', 'XIEBIAN', '3');

-- ----------------------------
-- Table structure for t_guipointtype
-- ----------------------------
DROP TABLE IF EXISTS `t_guipointtype`;
CREATE TABLE `t_guipointtype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_guipointtype
-- ----------------------------
INSERT INTO `t_guipointtype` VALUES ('27', 'type0', '', 'editor/icons/1406899088826.svg');
INSERT INTO `t_guipointtype` VALUES ('28', 'type1', '', 'editor/icons/1406899103379.svg');
INSERT INTO `t_guipointtype` VALUES ('29', 'type2', '', 'editor/icons/1406899118800.svg');
INSERT INTO `t_guipointtype` VALUES ('30', 'type3', '', 'editor/icons/1406899135068.svg');
INSERT INTO `t_guipointtype` VALUES ('31', 'type4', '', 'editor/icons/1406899150240.svg');
INSERT INTO `t_guipointtype` VALUES ('32', 'type5', '', 'editor/icons/1406899169303.svg');

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
) ENGINE=InnoDB AUTO_INCREMENT=194 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_guipro
-- ----------------------------
INSERT INTO `t_guipro` VALUES ('176', '0', '2014-06-30 15:38:27', '', 'sub114630153826113', '1', '175', '114630153826113');
INSERT INTO `t_guipro` VALUES ('177', '0', '2014-06-30 15:38:27', '', 'sub114630153826113', '1', '175', '114630153826113');
INSERT INTO `t_guipro` VALUES ('178', '1', '2014-06-30 15:39:15', '', '变形金刚4', '0', null, null);
INSERT INTO `t_guipro` VALUES ('179', '0', '2014-06-30 15:39:19', '', 'sub114630153917809', '1', '178', '114630153917809');
INSERT INTO `t_guipro` VALUES ('180', '0', '2014-06-30 15:39:19', '', 'sub114630153917809', '1', '178', '114630153917809');
INSERT INTO `t_guipro` VALUES ('181', '0', '2014-06-30 15:45:21', '', 'sub114630153917809', '1', '178', '114630153917809');
INSERT INTO `t_guipro` VALUES ('182', '0', '2014-06-30 15:45:21', '', 'sub114630153917809', '1', '178', '114630153917809');
INSERT INTO `t_guipro` VALUES ('183', '0', '2014-06-30 15:46:56', '', 'sub114630153917809', '1', '178', '114630153917809');
INSERT INTO `t_guipro` VALUES ('184', '0', '2014-06-30 15:47:30', '', 'sub114630153917809', '1', '178', '114630153917809');
INSERT INTO `t_guipro` VALUES ('185', '1', '2014-06-30 15:50:10', '', '变形金刚49', '0', null, null);
INSERT INTO `t_guipro` VALUES ('186', '0', '2014-06-30 16:02:12', '', 'sub1146301629697', '1', '185', '1146301629697');
INSERT INTO `t_guipro` VALUES ('187', '1', '2014-07-28 14:21:30', '', '啊啊谁说的', '0', null, null);
INSERT INTO `t_guipro` VALUES ('188', '0', '2014-06-30 21:27:26', '', 'sub1146302112148', '1', '187', '1146302112148');
INSERT INTO `t_guipro` VALUES ('189', '0', '2014-06-30 21:25:32', '', 'sub114630212517612', '1', '188', '114630212517612');
INSERT INTO `t_guipro` VALUES ('190', '0', '2014-06-30 21:27:28', '', 'sub11463021265452', '1', '187', '11463021265452');
INSERT INTO `t_guipro` VALUES ('191', '1', '2014-08-01 21:20:32', '', '想玩', '0', null, null);
INSERT INTO `t_guipro` VALUES ('192', '1', '2014-08-02 09:25:45', '', '爱的', '0', null, null);
INSERT INTO `t_guipro` VALUES ('193', '1', '2014-08-05 21:46:20', '', 'testa', '0', null, null);

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
INSERT INTO `t_measure` VALUES ('4', '1', 'Millimetre ', '毫米', 'mm', '0.001', '0', '1');
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
  `type` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_parameters
-- ----------------------------
INSERT INTO `t_parameters` VALUES ('1', '4', '管道长度', 'lineslength', '0');
INSERT INTO `t_parameters` VALUES ('2', '2', '管道长度3', 'lineslength3', '0');
INSERT INTO `t_parameters` VALUES ('3', '5', '管道长度2', 'lineslength2', '0');
INSERT INTO `t_parameters` VALUES ('4', '2', '加数1', 'a', '0');
INSERT INTO `t_parameters` VALUES ('5', '3', '加数2', 'b', '0');
INSERT INTO `t_parameters` VALUES ('6', '3', '相加结果', 'c', '0');
INSERT INTO `t_parameters` VALUES ('7', '3', '直角边a', 'ZHIBIAN1', '0');
INSERT INTO `t_parameters` VALUES ('8', '1', '直角边b', 'ZHIBIAN2', '0');
INSERT INTO `t_parameters` VALUES ('9', '3', '斜边', 'XIEBIAN', '0');
INSERT INTO `t_parameters` VALUES ('10', '9', '阿萨德', 'ADS', '0');
INSERT INTO `t_parameters` VALUES ('11', '9', '阿萨德2', 'ADS2', '0');
INSERT INTO `t_parameters` VALUES ('12', '9', '阿萨德22', 'ADS22', '0');
INSERT INTO `t_parameters` VALUES ('13', '9', '123', '123', '0');
INSERT INTO `t_parameters` VALUES ('14', '9', '321', '321', '0');
INSERT INTO `t_parameters` VALUES ('15', '9', '3212', '3212', '0');
INSERT INTO `t_parameters` VALUES ('16', '9', '32122', '32123', '0');
INSERT INTO `t_parameters` VALUES ('17', '9', '32122速度', '32123的', '0');
INSERT INTO `t_parameters` VALUES ('18', '9', '32122速度2', '32123的1', '1');
INSERT INTO `t_parameters` VALUES ('19', '9', '列表测试1', 'listin', '1');
INSERT INTO `t_parameters` VALUES ('20', '6', '列表测试2', 'listout', '1');

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
-- Table structure for t_projectdetail
-- ----------------------------
DROP TABLE IF EXISTS `t_projectdetail`;
CREATE TABLE `t_projectdetail` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `proID` int(11) DEFAULT NULL,
  `algID` int(11) DEFAULT NULL,
  `profile` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_projectdetail
-- ----------------------------
INSERT INTO `t_projectdetail` VALUES ('1', '11', '27', 'test2.xls');

-- ----------------------------
-- Table structure for t_projectinputlist
-- ----------------------------
DROP TABLE IF EXISTS `t_projectinputlist`;
CREATE TABLE `t_projectinputlist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `UUID` varchar(32) DEFAULT NULL,
  `Pro_ID` int(11) DEFAULT NULL,
  `Par_ID` int(11) DEFAULT NULL,
  `list_index` int(11) DEFAULT NULL,
  `list_value` double DEFAULT NULL,
  `list_ISOValue` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_projectinputlist
-- ----------------------------
INSERT INTO `t_projectinputlist` VALUES ('1', 'a2e37ffab73648d0945d6425133d90cc', '6', '18', '0', '1', '1609.344');
INSERT INTO `t_projectinputlist` VALUES ('2', 'a2e37ffab73648d0945d6425133d90cc', '6', '18', '1', '3', '4828.032');
INSERT INTO `t_projectinputlist` VALUES ('3', 'a2e37ffab73648d0945d6425133d90cc', '6', '18', '2', '6', '9656.064');
INSERT INTO `t_projectinputlist` VALUES ('4', 'a2e37ffab73648d0945d6425133d90cc', '6', '18', '3', '68', '109435.392');
INSERT INTO `t_projectinputlist` VALUES ('5', 'a2e37ffab73648d0945d6425133d90cc', '6', '18', '4', '316', '508552.704');
INSERT INTO `t_projectinputlist` VALUES ('6', '9f6ca69bdd5d476ab13edca1b5f1317c', '7', '19', '0', '1', '1609.344');
INSERT INTO `t_projectinputlist` VALUES ('7', '9f6ca69bdd5d476ab13edca1b5f1317c', '7', '19', '1', '3', '4828.032');
INSERT INTO `t_projectinputlist` VALUES ('8', '9f6ca69bdd5d476ab13edca1b5f1317c', '7', '19', '2', '421', '677533.824');
INSERT INTO `t_projectinputlist` VALUES ('9', '9f6ca69bdd5d476ab13edca1b5f1317c', '7', '19', '3', '2', '3218.688');
INSERT INTO `t_projectinputlist` VALUES ('10', '9f6ca69bdd5d476ab13edca1b5f1317c', '7', '19', '4', '12', '19312.128');
INSERT INTO `t_projectinputlist` VALUES ('11', '9f6ca69bdd5d476ab13edca1b5f1317c', '7', '19', '5', '32', '51499.008');
INSERT INTO `t_projectinputlist` VALUES ('12', '3376575e3d0447cea6af05f34edd5549', '7', '20', '0', '1', '0.3048');
INSERT INTO `t_projectinputlist` VALUES ('13', '3376575e3d0447cea6af05f34edd5549', '7', '20', '1', '3', '0.9144000000000001');
INSERT INTO `t_projectinputlist` VALUES ('14', '3376575e3d0447cea6af05f34edd5549', '7', '20', '2', '421', '128.32080000000002');
INSERT INTO `t_projectinputlist` VALUES ('15', '3376575e3d0447cea6af05f34edd5549', '7', '20', '3', '2', '0.6096');
INSERT INTO `t_projectinputlist` VALUES ('16', '3376575e3d0447cea6af05f34edd5549', '7', '20', '4', '12', '3.6576000000000004');
INSERT INTO `t_projectinputlist` VALUES ('17', '3376575e3d0447cea6af05f34edd5549', '7', '20', '5', '32', '9.7536');
INSERT INTO `t_projectinputlist` VALUES ('18', 'adc983b0d08d4e67a1f2b49b549d9292', '7', '19', '0', '1', '1609.344');
INSERT INTO `t_projectinputlist` VALUES ('19', 'adc983b0d08d4e67a1f2b49b549d9292', '7', '19', '1', '3', '4828.032');
INSERT INTO `t_projectinputlist` VALUES ('20', 'adc983b0d08d4e67a1f2b49b549d9292', '7', '19', '2', '6', '9656.064');
INSERT INTO `t_projectinputlist` VALUES ('21', 'adc983b0d08d4e67a1f2b49b549d9292', '7', '19', '3', '68', '109435.392');
INSERT INTO `t_projectinputlist` VALUES ('22', 'adc983b0d08d4e67a1f2b49b549d9292', '7', '19', '4', '316', '508552.704');
INSERT INTO `t_projectinputlist` VALUES ('23', 'c825274ea2614eee9fab5c465890101d', '7', '20', '0', '1', '0.3048');
INSERT INTO `t_projectinputlist` VALUES ('24', 'c825274ea2614eee9fab5c465890101d', '7', '20', '1', '3', '0.9144000000000001');
INSERT INTO `t_projectinputlist` VALUES ('25', 'c825274ea2614eee9fab5c465890101d', '7', '20', '2', '6', '1.8288000000000002');
INSERT INTO `t_projectinputlist` VALUES ('26', 'c825274ea2614eee9fab5c465890101d', '7', '20', '3', '68', '20.7264');
INSERT INTO `t_projectinputlist` VALUES ('27', 'c825274ea2614eee9fab5c465890101d', '7', '20', '4', '316', '96.3168');
INSERT INTO `t_projectinputlist` VALUES ('44', 'dc4e253c9fb54cf38e46f53bc789dbeb', '7', '19', '0', '1', '1609.344');
INSERT INTO `t_projectinputlist` VALUES ('45', 'dc4e253c9fb54cf38e46f53bc789dbeb', '7', '19', '1', '2', '3218.688');
INSERT INTO `t_projectinputlist` VALUES ('46', 'dc4e253c9fb54cf38e46f53bc789dbeb', '7', '19', '2', '3', '4828.032');
INSERT INTO `t_projectinputlist` VALUES ('47', 'dc4e253c9fb54cf38e46f53bc789dbeb', '7', '19', '3', '4', '6437.376');
INSERT INTO `t_projectinputlist` VALUES ('48', 'dc4e253c9fb54cf38e46f53bc789dbeb', '7', '19', '4', '5', '8046.72');
INSERT INTO `t_projectinputlist` VALUES ('49', '3627e65576d4402485c831e09d3e800e', '8', '20', '0', '1', '0.3048');
INSERT INTO `t_projectinputlist` VALUES ('50', '3627e65576d4402485c831e09d3e800e', '8', '20', '1', '2', '0.6096');
INSERT INTO `t_projectinputlist` VALUES ('51', '3627e65576d4402485c831e09d3e800e', '8', '20', '2', '3', '0.9144000000000001');
INSERT INTO `t_projectinputlist` VALUES ('52', '3627e65576d4402485c831e09d3e800e', '8', '20', '3', '4', '1.2192');
INSERT INTO `t_projectinputlist` VALUES ('53', '3627e65576d4402485c831e09d3e800e', '8', '20', '4', '5', '1.524');
INSERT INTO `t_projectinputlist` VALUES ('54', 'dede26581f714740b0a1db09d6ed74c0', '8', '19', '0', '1', '1609.344');
INSERT INTO `t_projectinputlist` VALUES ('55', 'dede26581f714740b0a1db09d6ed74c0', '8', '19', '1', '2', '3218.688');
INSERT INTO `t_projectinputlist` VALUES ('56', 'dede26581f714740b0a1db09d6ed74c0', '8', '19', '2', '3', '4828.032');
INSERT INTO `t_projectinputlist` VALUES ('57', 'dede26581f714740b0a1db09d6ed74c0', '8', '19', '3', '4', '6437.376');
INSERT INTO `t_projectinputlist` VALUES ('58', 'dede26581f714740b0a1db09d6ed74c0', '8', '19', '4', '5', '8046.72');

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
  `par_type` int(11) DEFAULT NULL,
  `par_listUUID` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_projectinputs
-- ----------------------------
INSERT INTO `t_projectinputs` VALUES ('-1', '1', '1', '管道长度', '0', 'lineslength', '4', null, null, null);
INSERT INTO `t_projectinputs` VALUES ('1', '1', '1', '管道长度', '0', 'lineslength', '4', null, null, null);
INSERT INTO `t_projectinputs` VALUES ('2', '1', '1', '管道长度', '0', 'lineslength', '4', null, null, null);
INSERT INTO `t_projectinputs` VALUES ('3', '1', '1', '管道长度', '0', 'lineslength', '4', null, null, null);
INSERT INTO `t_projectinputs` VALUES ('4', '1', '2', '管道长度3', '32', 'lineslength3', '2', null, null, null);
INSERT INTO `t_projectinputs` VALUES ('5', '1', '2', '管道长度3', '32', 'lineslength3', '2', null, null, null);
INSERT INTO `t_projectinputs` VALUES ('6', '2', '2', '管道长度3', '20', 'lineslength3', '2', '4', null, null);
INSERT INTO `t_projectinputs` VALUES ('7', '3', '4', '加数1', '156', 'a', '2', '15.600000000000001', null, null);
INSERT INTO `t_projectinputs` VALUES ('8', '3', '5', '加数2', '1561', 'b', '3', '15.610000000000001', null, null);
INSERT INTO `t_projectinputs` VALUES ('9', '4', '4', '加数1', '32', 'a', '2', '3.2', null, null);
INSERT INTO `t_projectinputs` VALUES ('10', '4', '5', '加数2', '4124', 'b', '3', '41.24', null, null);
INSERT INTO `t_projectinputs` VALUES ('11', '5', '4', '加数1', '12.15', 'a', '2', '1.215', null, null);
INSERT INTO `t_projectinputs` VALUES ('12', '5', '5', '加数2', '154.2', 'b', '3', '1.5419999999999998', null, null);
INSERT INTO `t_projectinputs` VALUES ('13', '6', '7', '直角边a', '3', 'ZHIBIAN1', '3', '0.03', null, null);
INSERT INTO `t_projectinputs` VALUES ('14', '6', '8', '直角边b', '0.04', 'ZHIBIAN2', '1', '0.04', null, null);
INSERT INTO `t_projectinputs` VALUES ('17', '6', '18', '32122速度2', '0', '32123的1', '9', '0', '1', 'a2e37ffab73648d0945d6425133d90cc');
INSERT INTO `t_projectinputs` VALUES ('18', '6', '4', '加数1', '5', 'a', '2', '0.5', '0', '0');
INSERT INTO `t_projectinputs` VALUES ('27', '7', '19', '列表测试1', '0', 'listin', '9', '0', '1', 'dc4e253c9fb54cf38e46f53bc789dbeb');
INSERT INTO `t_projectinputs` VALUES ('28', '8', '20', '列表测试2', '0', 'listout', '6', '0', '1', '3627e65576d4402485c831e09d3e800e');
INSERT INTO `t_projectinputs` VALUES ('29', '8', '19', '列表测试1', '0', 'listin', '9', '0', '1', 'dede26581f714740b0a1db09d6ed74c0');
INSERT INTO `t_projectinputs` VALUES ('31', '0', '4', '加数1', '1', 'a', '2', '0.1', '0', '0');
INSERT INTO `t_projectinputs` VALUES ('32', '0', '5', '加数2', '2', 'b', '3', '0.02', '0', '0');
INSERT INTO `t_projectinputs` VALUES ('35', '1', '1', '管道长度', '1', 'lineslength', '4', '0.001', '0', '0');
INSERT INTO `t_projectinputs` VALUES ('36', '1', '1', '管道长度', '1', 'lineslength', '4', '0.001', '0', '0');
INSERT INTO `t_projectinputs` VALUES ('37', '8', '6', '相加结果', '1', 'c', '3', '0.01', '0', '0');
INSERT INTO `t_projectinputs` VALUES ('38', '8', '17', '32122速度', '1', '32123的', '9', '1609.344', '0', '0');
INSERT INTO `t_projectinputs` VALUES ('39', '8', '6', '相加结果', '2', 'c', '3', '0.02', '0', '0');
INSERT INTO `t_projectinputs` VALUES ('40', '8', '17', '32122速度', '2', '32123的', '9', '3218.688', '0', '0');
INSERT INTO `t_projectinputs` VALUES ('45', '9', '5', '加数2', '1', 'b', '3', '0.01', '0', '0');
INSERT INTO `t_projectinputs` VALUES ('46', '9', '4', '加数1', '2', 'a', '2', '0.2', '0', '0');
INSERT INTO `t_projectinputs` VALUES ('47', '9', '7', '直角边a', '3', 'ZHIBIAN1', '3', '0.03', '0', '0');
INSERT INTO `t_projectinputs` VALUES ('48', '9', '8', '直角边b', '4', 'ZHIBIAN2', '1', '4', '0', '0');
INSERT INTO `t_projectinputs` VALUES ('49', '9', '8', '直角边b', '4', 'ZHIBIAN2', '1', '4', '0', '0');
INSERT INTO `t_projectinputs` VALUES ('50', '9', '7', '直角边a', '3', 'ZHIBIAN1', '3', '0.03', '0', '0');
INSERT INTO `t_projectinputs` VALUES ('51', '9', '7', '直角边a', '3', 'ZHIBIAN1', '3', '0.03', '0', '0');

-- ----------------------------
-- Table structure for t_projectoutputlist
-- ----------------------------
DROP TABLE IF EXISTS `t_projectoutputlist`;
CREATE TABLE `t_projectoutputlist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `UUID` varchar(32) DEFAULT NULL,
  `Pro_ID` int(11) DEFAULT NULL,
  `Par_ID` int(11) DEFAULT NULL,
  `list_index` int(11) DEFAULT NULL,
  `list_value` double DEFAULT NULL,
  `list_ISOValue` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_projectoutputlist
-- ----------------------------
INSERT INTO `t_projectoutputlist` VALUES ('1', '413d52fe4d2d44fe8114b8e6ed7ba3e6', '7', '20', '0', '8497336.32', '2589988.110336');
INSERT INTO `t_projectoutputlist` VALUES ('2', '413d52fe4d2d44fe8114b8e6ed7ba3e6', '7', '20', '1', '76476026.88000001', '23309892.993024003');
INSERT INTO `t_projectoutputlist` VALUES ('3', '413d52fe4d2d44fe8114b8e6ed7ba3e6', '7', '20', '2', '305904107.52000004', '93239571.97209601');
INSERT INTO `t_projectoutputlist` VALUES ('4', '413d52fe4d2d44fe8114b8e6ed7ba3e6', '7', '20', '3', '39291683143.68001', '11976105022.193666');
INSERT INTO `t_projectoutputlist` VALUES ('5', '413d52fe4d2d44fe8114b8e6ed7ba3e6', '7', '20', '4', '848510015569.92', '258625852745.71164');
INSERT INTO `t_projectoutputlist` VALUES ('6', 'aafc4af2f89b4c8ab975cbf86f0d1234', '7', '20', '0', '8497336.32', '2589988.110336');
INSERT INTO `t_projectoutputlist` VALUES ('7', 'aafc4af2f89b4c8ab975cbf86f0d1234', '7', '20', '1', '76476026.88000001', '23309892.993024003');
INSERT INTO `t_projectoutputlist` VALUES ('8', 'aafc4af2f89b4c8ab975cbf86f0d1234', '7', '20', '2', '305904107.52000004', '93239571.97209601');
INSERT INTO `t_projectoutputlist` VALUES ('9', 'aafc4af2f89b4c8ab975cbf86f0d1234', '7', '20', '3', '39291683143.68001', '11976105022.193666');
INSERT INTO `t_projectoutputlist` VALUES ('10', 'aafc4af2f89b4c8ab975cbf86f0d1234', '7', '20', '4', '848510015569.92', '258625852745.71164');
INSERT INTO `t_projectoutputlist` VALUES ('11', 'bd9e1270d4bc4b28974408eb1cede496', '7', '20', '0', '8497336.32', '2589988.110336');
INSERT INTO `t_projectoutputlist` VALUES ('12', 'bd9e1270d4bc4b28974408eb1cede496', '7', '20', '1', '76476026.88000001', '23309892.993024003');
INSERT INTO `t_projectoutputlist` VALUES ('13', 'bd9e1270d4bc4b28974408eb1cede496', '7', '20', '2', '305904107.52000004', '93239571.97209601');
INSERT INTO `t_projectoutputlist` VALUES ('14', 'bd9e1270d4bc4b28974408eb1cede496', '7', '20', '3', '39291683143.68001', '11976105022.193666');
INSERT INTO `t_projectoutputlist` VALUES ('15', 'bd9e1270d4bc4b28974408eb1cede496', '7', '20', '4', '848510015569.92', '258625852745.71164');
INSERT INTO `t_projectoutputlist` VALUES ('16', '91439d7db82c4bc2ad6442a3ef60a2b9', '7', '20', '0', '8497336.32', '2589988.110336');
INSERT INTO `t_projectoutputlist` VALUES ('17', '91439d7db82c4bc2ad6442a3ef60a2b9', '7', '20', '1', '76476026.88000001', '23309892.993024003');
INSERT INTO `t_projectoutputlist` VALUES ('18', '91439d7db82c4bc2ad6442a3ef60a2b9', '7', '20', '2', '305904107.52000004', '93239571.97209601');
INSERT INTO `t_projectoutputlist` VALUES ('19', '91439d7db82c4bc2ad6442a3ef60a2b9', '7', '20', '3', '39291683143.68001', '11976105022.193666');
INSERT INTO `t_projectoutputlist` VALUES ('20', '91439d7db82c4bc2ad6442a3ef60a2b9', '7', '20', '4', '848510015569.92', '258625852745.71164');
INSERT INTO `t_projectoutputlist` VALUES ('21', 'bc3ee7cb21ec479e99bddbce8afa9fab', '7', '20', '0', '8497336.32', '2589988.110336');
INSERT INTO `t_projectoutputlist` VALUES ('22', 'bc3ee7cb21ec479e99bddbce8afa9fab', '7', '20', '1', '76476026.88000001', '23309892.993024003');
INSERT INTO `t_projectoutputlist` VALUES ('23', 'bc3ee7cb21ec479e99bddbce8afa9fab', '7', '20', '2', '305904107.52000004', '93239571.97209601');
INSERT INTO `t_projectoutputlist` VALUES ('24', 'bc3ee7cb21ec479e99bddbce8afa9fab', '7', '20', '3', '39291683143.68001', '11976105022.193666');
INSERT INTO `t_projectoutputlist` VALUES ('25', 'bc3ee7cb21ec479e99bddbce8afa9fab', '7', '20', '4', '848510015569.92', '258625852745.71164');
INSERT INTO `t_projectoutputlist` VALUES ('26', 'be71391cd21b470b8227f827b02ccbb3', '7', '20', '0', '8497336.32', '2589988.110336');
INSERT INTO `t_projectoutputlist` VALUES ('27', 'be71391cd21b470b8227f827b02ccbb3', '7', '20', '1', '76476026.88000001', '23309892.993024003');
INSERT INTO `t_projectoutputlist` VALUES ('28', 'be71391cd21b470b8227f827b02ccbb3', '7', '20', '2', '305904107.52000004', '93239571.97209601');
INSERT INTO `t_projectoutputlist` VALUES ('29', 'be71391cd21b470b8227f827b02ccbb3', '7', '20', '3', '39291683143.68001', '11976105022.193666');
INSERT INTO `t_projectoutputlist` VALUES ('30', 'be71391cd21b470b8227f827b02ccbb3', '7', '20', '4', '848510015569.92', '258625852745.71164');
INSERT INTO `t_projectoutputlist` VALUES ('31', '49fc49320a184907b64a5f2f23573644', '8', '20', '0', '8497336.32', '2589988.110336');
INSERT INTO `t_projectoutputlist` VALUES ('32', '49fc49320a184907b64a5f2f23573644', '8', '20', '1', '33989345.28', '10359952.441344');
INSERT INTO `t_projectoutputlist` VALUES ('33', '49fc49320a184907b64a5f2f23573644', '8', '20', '2', '76476026.88000001', '23309892.993024003');
INSERT INTO `t_projectoutputlist` VALUES ('34', '49fc49320a184907b64a5f2f23573644', '8', '20', '3', '135957381.12', '41439809.765376');
INSERT INTO `t_projectoutputlist` VALUES ('35', '49fc49320a184907b64a5f2f23573644', '8', '20', '4', '212433408', '64749702.7584');
INSERT INTO `t_projectoutputlist` VALUES ('36', '3e79b498e2b042edb95fc8ab3de2697a', '8', '20', '0', '8497336.32', '2589988.110336');
INSERT INTO `t_projectoutputlist` VALUES ('37', '3e79b498e2b042edb95fc8ab3de2697a', '8', '20', '1', '33989345.28', '10359952.441344');
INSERT INTO `t_projectoutputlist` VALUES ('38', '3e79b498e2b042edb95fc8ab3de2697a', '8', '20', '2', '76476026.88000001', '23309892.993024003');
INSERT INTO `t_projectoutputlist` VALUES ('39', '3e79b498e2b042edb95fc8ab3de2697a', '8', '20', '3', '135957381.12', '41439809.765376');
INSERT INTO `t_projectoutputlist` VALUES ('40', '3e79b498e2b042edb95fc8ab3de2697a', '8', '20', '4', '212433408', '64749702.7584');

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
  `par_type` int(11) DEFAULT NULL,
  `par_listUUID` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_projectoutputs
-- ----------------------------
INSERT INTO `t_projectoutputs` VALUES ('10', '3', '6', '相加结果', '3121', 'c', '3', '31.21', null, null);
INSERT INTO `t_projectoutputs` VALUES ('19', '5', '6', '相加结果', '275.7', 'c', '3', '2.7569999999999997', null, null);
INSERT INTO `t_projectoutputs` VALUES ('30', '7', '20', '列表测试2', '0', 'listout', '6', '0', '1', '0');
INSERT INTO `t_projectoutputs` VALUES ('31', '7', '20', '列表测试2', '0', 'listout', '6', '0', '1', 'be71391cd21b470b8227f827b02ccbb3');
INSERT INTO `t_projectoutputs` VALUES ('34', '8', '20', '列表测试2', '0', 'listout', '6', '0', '1', '0');
INSERT INTO `t_projectoutputs` VALUES ('35', '8', '20', '列表测试2', '0', 'listout', '6', '0', '1', '3e79b498e2b042edb95fc8ab3de2697a');
INSERT INTO `t_projectoutputs` VALUES ('42', '9', '9', '斜边', '5', 'XIEBIAN', '3', '0.05', '0', '0');

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
  `Type` int(11) DEFAULT NULL,
  `ProfileIn` varchar(255) DEFAULT NULL,
  `ProfileOut` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0' COMMENT 'status==0   "未运行";\r\nstatus==1  "正在运行";\r\nstatus==2  "运行成功"\r\nstatus==3  "运行失败"\r\n		',
  `info` varchar(500) DEFAULT NULL,
  `LastCalcEndTime` datetime DEFAULT NULL,
  `runtime` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_projects
-- ----------------------------
INSERT INTO `t_projects` VALUES ('19', null, '1', '2014-08-07 15:51:19', null, null, 'test2', 'test4', '1', null, '1', 'f21f6938089e4b91b19c57598755314d.xls', '71ee7e07ef2e44e6ab33f0373a2f6602.xls', '2', '成功运行', '2014-08-07 17:20:07', '0');
INSERT INTO `t_projects` VALUES ('20', null, '1', '2014-08-08 11:38:18', null, null, '', 'run', '1', null, '1', '3dd5b03918ef41e4a3ece2c0092e9110.xls', 'd862419aed164078afa25cd1c347f82a.xls', '2', '成功运行', '2014-08-08 11:40:51', '0');
INSERT INTO `t_projects` VALUES ('21', null, '1', '2014-08-10 21:39:44', null, null, '我', '休息', '1', null, '1', 'f12d1d00ab364f3db0ee37ef5c3d8d01.xls', '086faf29562942d2aa78dc677369135d.xls', '2', '运行完毕', null, '0');
INSERT INTO `t_projects` VALUES ('22', null, '1', '2014-08-10 21:47:02', null, null, '请问', '请问', '1', null, '1', 'a34be0f8d98645d4bcd8f862eb71df04.xls', '31a2cb1a91934db69e74a5716e2128c9.xls', '2', '运行完毕', null, '0');
INSERT INTO `t_projects` VALUES ('23', null, '1', '2014-08-10 22:06:32', null, null, '321', 'ii', '1', null, '1', '37172fda2fa248148426c601fd7fac0a.xls', '9da84fcfc269494d913725e7362d8c91.xls', '0', '未运行', null, '0');
INSERT INTO `t_projects` VALUES ('24', null, '1', '2014-08-10 22:14:49', null, null, 'ff', 'final', '1', null, '1', '3b9b463f69b34da5a4b79553d46956e9.xls', 'b6a5d25034fd4966b6c3ca7313f8d0ed.xls', '0', '未运行', null, '0');
INSERT INTO `t_projects` VALUES ('25', null, '1', '2014-08-10 22:15:31', null, null, 'ff', 'final2', '1', null, '1', '5f606c99a8e444d08e657ae7e471c6e1.xls', '2d96cde51c4b44699c899def1a0be565.xls', '0', '未运行', null, '0');
INSERT INTO `t_projects` VALUES ('26', null, '1', '2014-08-10 22:17:45', null, null, 'wer', 'ewr', '1', null, '1', '1991685e592745ddb0ed9d61be6875cb.xls', '9479857e32724641a79cde6789ede109.xls', '0', '未运行', null, '0');
INSERT INTO `t_projects` VALUES ('27', null, '1', '2014-08-10 22:18:39', null, null, 'asd', 'asd', '1', null, '1', 'f6ef9753be134753a4f6eb105b974523.xls', 'b666b481b4154b3bb05701e4576be10d.xls', '0', '未运行', null, '0');
INSERT INTO `t_projects` VALUES ('28', null, '1', '2014-08-10 22:26:46', null, null, 'asd', 'asd1', '1', null, '1', '2cd0f411575a43409e2d5c53f90132dd.xls', '4f129a711ba147ed927fc2431483d14f.xls', '0', '未运行', null, '0');
INSERT INTO `t_projects` VALUES ('29', null, '1', '2014-08-10 22:28:05', null, null, 'asd', 'asd3', '1', null, '1', 'ae685eb11a7b464db712d5567165db65.xls', '8b3ca2e9e8b244328a793df02c76d2fe.xls', '0', '未运行', null, '0');
INSERT INTO `t_projects` VALUES ('30', null, '1', '2014-08-10 22:31:02', null, null, 'asd', 'asd3', '1', null, '1', '2277a244302c45419ebbcca8967379b0.xls', 'c0267e6e38bc47e0a4aebd5265f2ff78.xls', '0', '未运行', null, '0');
INSERT INTO `t_projects` VALUES ('31', null, '1', '2014-08-10 22:31:07', null, null, 'asd', 'asd4', '1', null, '1', '7eacd03c427542ec8c1324cab1930c46.xls', '9062722ed3334c51a99e61e39de3e168.xls', '0', '未运行', null, '0');
INSERT INTO `t_projects` VALUES ('32', null, '1', '2014-08-10 22:31:17', null, null, 'asd', 'as12', '1', null, '1', '2f9e9846612b40fbb4cea04466e067da.xls', '89757c6c246449d09886c222ea2d3ab4.xls', '0', '未运行', null, '0');
INSERT INTO `t_projects` VALUES ('33', null, '1', '2014-08-10 22:31:47', null, null, 'asd', 'as12', '1', null, '1', '5be9f33eca3b41b990b9ee6627ef1765.xls', '3bce21d1f2694e9995495de91944cbdf.xls', '2', '运行完毕', null, '0');
INSERT INTO `t_projects` VALUES ('34', null, '1', '2014-08-11 18:36:42', null, null, '', '64', '1', null, '1', '158d7d2bb11246c0863e497b08a94c94.xls', '80787ac5e6754bb396a1ed2f9c9ad784.xls', '0', '未运行', null, '0');
INSERT INTO `t_projects` VALUES ('35', null, '1', '2014-08-11 18:37:49', null, null, '', '649', '1', null, '1', '2a6cb0dca7c84489a9d8e48262e3b1ad.xls', '43e9f039b5334652a63b9cee45e40cd7.xls', '0', '未运行', null, '0');
INSERT INTO `t_projects` VALUES ('36', null, '1', '2014-08-11 18:40:35', null, null, '', '6494', '1', null, '1', 'ec9d764861994d2fb3ba5e96da007c62.xls', 'efada659b3654153a0919d3ee13ec192.xls', '2', '成功运行', '2014-08-11 19:07:20', '0');
INSERT INTO `t_projects` VALUES ('37', null, '1', '2014-08-11 19:53:13', null, null, '', '人员 ', '1', null, '1', '2e0e191423b64d4d90c7b837a1765ef6.xls', 'df2405e6ddc14a59a89f1a01b165738a.xls', '0', '未运行', null, '0');
INSERT INTO `t_projects` VALUES ('38', null, '1', '2014-08-11 20:41:21', null, null, '', '547', '0', null, '1', 'cea44537fb4b4f1bbe23f0650ac706e9.xls', 'dc862f21667d4dc1be6b9722b4f6f6ff.xls', '0', '未运行', null, '0');
INSERT INTO `t_projects` VALUES ('39', null, '1', '2014-08-11 20:43:43', null, null, '', '547', '0', null, '1', 'eb48b28d9caa4331928b50ff4c302b9e.xls', '54114dfbb9d0472095a91653fe487c6f.xls', '0', '未运行', null, '0');
INSERT INTO `t_projects` VALUES ('40', null, '1', '2014-08-11 20:44:27', null, null, '撒旦', '是', '0', null, '1', '62a1585295324671be3dccca05acf716.xls', '79e58139b98f4d79b4c493f0d41c34ad.xls', '0', '未运行', null, '0');
INSERT INTO `t_projects` VALUES ('41', null, '1', '2014-08-11 20:45:58', null, null, '撒旦', '是', '0', null, '1', 'f82502cc3afe4625b37b6113a8111276.xls', 'c9e9bcfd53b844ef93d2f7f725f86fb4.xls', '0', '未运行', null, '0');
INSERT INTO `t_projects` VALUES ('42', null, '1', '2014-08-11 20:46:21', null, null, '', '21', '0', null, '1', 'c1a7f73437d849d5bb3e4a8a5a2e4e8f.xls', '9f2aa05aea24489ca1ec8af585506309.xls', '0', '未运行', null, '0');
INSERT INTO `t_projects` VALUES ('43', null, '1', '2014-08-11 20:47:14', null, null, '', '21', '0', null, '1', '3560b5389cd649e283a4ffb73e8f1a33.xls', 'cb4f3f3ff9e4455d95dfc869a91af49f.xls', '0', '未运行', null, '0');
INSERT INTO `t_projects` VALUES ('44', null, '1', '2014-08-11 20:47:49', null, null, '', '213', '0', null, '1', '0e431020a3a14e63bbdbe72c9310f95b.xls', '51bc00ee47124d8b82bfcf78af96ea2f.xls', '2', '成功运行', '2014-08-11 20:48:01', '0');

-- ----------------------------
-- Table structure for t_roles
-- ----------------------------
DROP TABLE IF EXISTS `t_roles`;
CREATE TABLE `t_roles` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RoleName` varchar(32) DEFAULT NULL,
  `RoleDescription` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_roles
-- ----------------------------
INSERT INTO `t_roles` VALUES ('1', '一般工程用户', '一般工程用户');

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_userrole
-- ----------------------------
INSERT INTO `t_userrole` VALUES ('1', '1', '1');

/*
Navicat MySQL Data Transfer

Source Server         : Oil
Source Server Version : 50616
Source Host           : localhost:3306
Source Database       : cbm05039002

Target Server Type    : MYSQL
Target Server Version : 50616
File Encoding         : 65001

Date: 2014-08-26 23:14:27
*/

SET FOREIGN_KEY_CHECKS=0;

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
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_algorithmscycle
-- ----------------------------
INSERT INTO `t_algorithmscycle` VALUES ('0', '0', '0', '0', '1', '1', '2014-08-02 11:10:13', '2014-08-02 11:10:13', '井底流压计算', 'simulation.jar', 'cn.edu.cup.cbm.simulation.Test', '1', '井底流压计算输入表.xls', '井底流压计算结果.xls');
INSERT INTO `t_algorithmscycle` VALUES ('1', '0', '0', '0', '1', '1', '2014-08-02 11:10:13', '2014-08-02 11:10:13', '单气相管网水力计算', 'simulation.jar', 'cn.edu.cup.cbm.simulation.Test', '1', '单相管网水力计算(不考虑热力)输入表.xls', '单相管网水力计算结果(不考虑热力.xls');
INSERT INTO `t_algorithmscycle` VALUES ('2', '0', '0', '0', '1', '1', '2014-08-02 11:10:13', '2014-08-02 11:10:13', '单气相管网热力计算', 'simulation.jar', 'cn.edu.cup.cbm.simulation.Test', '1', '单相管网水力计算(考虑热力)输入表.xls', '单相管网水力计算结果(考虑热力).xls');
INSERT INTO `t_algorithmscycle` VALUES ('3', '0', '0', '0', '1', '1', '2014-08-02 11:10:13', '2014-08-02 11:10:13', '气固两相管网水力计算', 'simulation.jar', 'cn.edu.cup.cbm.simulation.Test', '1', '气固两相管网水力计算输入表.xls', '气固两相管网水力计算结果.xls');
INSERT INTO `t_algorithmscycle` VALUES ('4', '0', '0', '0', '1', '1', '2014-08-02 11:10:13', '2014-08-02 11:10:13', '气液两相管网水力计算', 'simulation.jar', 'cn.edu.cup.cbm.simulation.Test', '1', '气液两相管网水力计算输入表.xls', '气液两相管网水力计算结果.xls');
INSERT INTO `t_algorithmscycle` VALUES ('5', '0', '0', '0', '1', '1', '2014-03-28 10:47:45', '2014-08-25 10:47:45', '自动计算', 'simulation.jar', 'cn.edu.cup.cbm.simulation.Test', '1', null, null);
INSERT INTO `t_algorithmscycle` VALUES ('6', '0', '0', '0', '1', '1', '2014-03-31 16:04:44', '2014-08-25 16:04:44', '系统扩建设计', '', '', '2', '系统扩建设计输入表.xls', '系统扩建设计结果.xls');
INSERT INTO `t_algorithmscycle` VALUES ('7', '0', '0', '0', '1', '1', '2014-07-22 22:01:14', '2014-08-25 22:01:14', '整体设计', '', '', '2', '整体设计输入表.xls', '整体设计结果.xls');
INSERT INTO `t_algorithmscycle` VALUES ('8', '0', '0', '0', '1', '1', '2014-08-02 11:10:13', '2014-08-25 21:10:13', '布局设计', '', '', '2', '布局设计输入表.xls', '布局设计结果.xls');
INSERT INTO `t_algorithmscycle` VALUES ('9', null, null, null, null, null, '2014-08-25 21:27:08', '2014-08-25 21:27:12', '参数设计', null, null, '2', '参数设计输入表.xls', '参数设计结果.xls');


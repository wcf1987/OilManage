/*
Navicat MySQL Data Transfer

Source Server         : Oil
Source Server Version : 50616
Source Host           : localhost:3306
Source Database       : cbm05039002

Target Server Type    : MYSQL
Target Server Version : 50616
File Encoding         : 65001

Date: 2014-08-10 21:52:01
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
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_algorithmscycle
-- ----------------------------
INSERT INTO `t_algorithmscycle` VALUES ('1', '0', '0', '0', '1', '1', '2014-08-02 11:10:13', '2014-08-02 11:10:13', '单气相管网水力计算', 'simulation.jar', 'cn.edu.cup.cbm.simulation.Test', '1', '单气相管网水力计算输入表.xls', '单气相管网水力计算结果.xls');
INSERT INTO `t_algorithmscycle` VALUES ('2', '0', '0', '0', '1', '1', '2014-08-02 11:10:13', '2014-08-02 11:10:13', '单气相管网热力计算', 'WellboreSimulation.jar', 'cn.edu.cup.cbm.wellbore.Test', '1', '单气相管网热力计算输入表.xls', '单气相管网热力计算结果.xls');
INSERT INTO `t_algorithmscycle` VALUES ('3', '0', '0', '0', '1', '1', '2014-08-02 11:10:13', '2014-08-02 11:10:13', '气固两相管网水力计算', 'WellboreSimulation.jar', 'cn.edu.cup.cbm.wellbore.Test', '1', '气固两相管网水力计算输入表.xls', '气固两相管网水力计算结果.xls');
INSERT INTO `t_algorithmscycle` VALUES ('4', '0', '0', '0', '1', '1', '2014-08-02 11:10:13', '2014-08-02 11:10:13', '气液两相管网水力计算', 'WellboreSimulation.jar', 'cn.edu.cup.cbm.wellbore.Test', '1', '气液两相管网水力计算输入表.xls', '气液两相管网水力计算结果.xls');
INSERT INTO `t_algorithmscycle` VALUES ('16', '0', '0', '0', '1', 'final', '2014-03-28 10:47:45', '2014-03-28 10:47:45', '相加测试final', 'D:\\software\\tomcat7\\webapps\\OilManage\\uploadAlgorithm\\1395974864047.alg', 'TestAlg', null, null, null);
INSERT INTO `t_algorithmscycle` VALUES ('17', '0', '0', '0', '1', '根据直角边算斜边', '2014-03-31 16:04:44', '2014-03-31 16:04:44', '勾股定理', 'D:\\software\\tomcat7\\webapps\\OilManage\\uploadAlgorithm\\1396253083568.alg', 'TestGG', null, null, null);
INSERT INTO `t_algorithmscycle` VALUES ('24', '0', '0', '0', '1', '列表算法测试', '2014-07-22 22:01:14', '2014-07-22 22:01:14', '列表算法测试', 'D:\\software\\tomcat7\\webapps\\OilManage\\uploadAlgorithm\\1406037670182.alg', 'TestList', null, null, null);
INSERT INTO `t_algorithmscycle` VALUES ('25', '0', '0', '0', '1', '1', '2014-08-02 11:10:13', '2014-08-02 11:10:13', '新算法设计测试_office', '', 'test', '1', 'E:\\\\work profit\\\\中科院可视化界面\\\\模拟程序参数表\\\\模拟程序参数表\\\\单气相管网水力计算.xls', null);
INSERT INTO `t_algorithmscycle` VALUES ('26', '0', '0', '0', '1', '1', '2014-08-02 11:10:13', '2014-08-02 11:10:13', '井底流压计算', 'WellboreSimulation.jar', 'cn.edu.cup.cbm.wellbore.Test', '1', '井底流压计算输入表.xls', '井底流压计算结果.xls');

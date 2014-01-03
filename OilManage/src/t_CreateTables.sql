/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50508
Source Host           : localhost:3306
Source Database       : oil

Target Server Type    : MYSQL
Target Server Version : 50508
File Encoding         : 65001

Date: 2013-12-23 16:21:09
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_mappro`
-- ----------------------------
DROP TABLE IF EXISTS `t_mappro`;
CREATE TABLE `t_mappro` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `proname` varchar(25) DEFAULT NULL,
  `filepath` varchar(255) DEFAULT NULL,
  `adddate` datetime DEFAULT NULL,
  UNIQUE KEY `idpk` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8;

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
INSERT INTO `t_mappro` VALUES ('16', 'asd', 'adfsa', '2013-12-23 15:50:41');
INSERT INTO `t_mappro` VALUES ('17', 'asd', 'adfsa', '2013-12-23 15:50:44');
INSERT INTO `t_mappro` VALUES ('18', 'asd', 'adfsa', '2013-12-23 15:50:47');
INSERT INTO `t_mappro` VALUES ('92', 'asd', 'adfsa', '2013-12-23 15:50:25');


CREATE TABLE `t_mapline` (
`proid`  int(11) NULL DEFAULT NULL ,
`start`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`end`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`type`  int(11) NULL DEFAULT NULL 
);

CREATE TABLE `t_mappoint` (
`proid`  int(11) NULL DEFAULT NULL ,
`pointName`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`type`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`GeodeticCoordinatesX`  double NULL DEFAULT NULL ,
`GeodeticCoordinatesY`  double NULL DEFAULT NULL ,
`latitude`  double NULL DEFAULT NULL ,
`Longitude`  double NULL DEFAULT NULL 
)
/*
Navicat MySQL Data Transfer

Source Server         : Oil
Source Server Version : 50616
Source Host           : localhost:3306
Source Database       : cbm05039002

Target Server Type    : MYSQL
Target Server Version : 50616
File Encoding         : 65001

Date: 2014-11-01 22:46:57
*/

SET FOREIGN_KEY_CHECKS=0;

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
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_guipointtype
-- ----------------------------
INSERT INTO `t_guipointtype` VALUES ('48', '气井', null, 'editor/icons/qijing.svg');
INSERT INTO `t_guipointtype` VALUES ('56', '分输点', null, 'editor/icons/waifenshudian.svg');
INSERT INTO `t_guipointtype` VALUES ('57', '气源', null, 'editor/icons/waiyuanjiedian.svg');
INSERT INTO `t_guipointtype` VALUES ('58', '撬装液化点', null, 'editor/icons/qiaozhuangyehuadian.svg');
INSERT INTO `t_guipointtype` VALUES ('60', '管道', null, 'editor/icons/guandao.svg');
INSERT INTO `t_guipointtype` VALUES ('61', '集气增压站', null, 'editor/icons/jiqizengyazhan.svg');
INSERT INTO `t_guipointtype` VALUES ('62', '主动增压点', null, 'editor/icons/zhudongzengyadian.svg');
INSERT INTO `t_guipointtype` VALUES ('63', '中央处理厂', null, 'editor/icons/zhongyangchulichang.svg');
INSERT INTO `t_guipointtype` VALUES ('64', '阀组', null, 'editor/icons/fazu.svg');
INSERT INTO `t_guipointtype` VALUES ('65', '过滤器', null, 'editor/icons/guolvqi.svg');
INSERT INTO `t_guipointtype` VALUES ('66', '阀', null, 'editor/icons/fa.svg');
INSERT INTO `t_guipointtype` VALUES ('67', '其他', null, 'editor/icons/qita.png');

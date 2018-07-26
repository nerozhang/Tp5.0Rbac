/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50640
Source Host           : localhost:3306
Source Database       : yunos

Target Server Type    : MYSQL
Target Server Version : 50640
File Encoding         : 65001

Date: 2018-07-26 15:49:44
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `yunos_account`
-- ----------------------------
DROP TABLE IF EXISTS `yunos_account`;
CREATE TABLE `yunos_account` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `account` varchar(50) DEFAULT '' COMMENT '账号',
  `passwd` varchar(32) DEFAULT '' COMMENT '密码',
  `salt` char(5) DEFAULT '' COMMENT '加盐',
  `role` int(11) unsigned DEFAULT '0' COMMENT '角色',
  `create_time` int(11) DEFAULT '0',
  `update_time` int(11) DEFAULT '0',
  `role_name` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yunos_account
-- ----------------------------
INSERT INTO `yunos_account` VALUES ('1', 'admin', 'e10adc3949ba59abbe56e057f20f883e', '', '1', '1492427086', '1532575757', '系统管理员');
INSERT INTO `yunos_account` VALUES ('3', ' manager ', '4297f44b13955235245b2497399d7a93', '', '3', '1532575924', '1532575924', '经理');
INSERT INTO `yunos_account` VALUES ('4', 'qq', '4297f44b13955235245b2497399d7a93', '', '1', '1532576177', '1532576177', '系统管理员');

-- ----------------------------
-- Table structure for `yunos_category`
-- ----------------------------
DROP TABLE IF EXISTS `yunos_category`;
CREATE TABLE `yunos_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT '' COMMENT '栏目名称',
  `parent_id` int(10) unsigned DEFAULT '0' COMMENT '父栏目id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yunos_category
-- ----------------------------

-- ----------------------------
-- Table structure for `yunos_privilege`
-- ----------------------------
DROP TABLE IF EXISTS `yunos_privilege`;
CREATE TABLE `yunos_privilege` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT '' COMMENT '权限名称',
  `module_name` varchar(50) DEFAULT '' COMMENT '模块名称',
  `controller_name` varchar(50) DEFAULT '' COMMENT '控制器名称',
  `action_name` varchar(50) DEFAULT '' COMMENT '方法名称',
  `parent_id` int(10) unsigned DEFAULT '0' COMMENT '父id',
  `create_time` int(11) DEFAULT '0',
  `update_time` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yunos_privilege
-- ----------------------------
INSERT INTO `yunos_privilege` VALUES ('1', '管理员模块', 'null', 'null', 'null', '0', '1492425460', '1492425460');
INSERT INTO `yunos_privilege` VALUES ('2', '权限列表 ', 'admin', 'privilege', 'index', '1', '1492425524', '1492425524');
INSERT INTO `yunos_privilege` VALUES ('4', '添加权限', 'admin', 'privilege', 'add,addview', '2', '1492425900', '1493004468');
INSERT INTO `yunos_privilege` VALUES ('9', '添加角色', 'admin', 'role', 'add,addview', '8', '1492845371', '1493004482');
INSERT INTO `yunos_privilege` VALUES ('6', '修改权限', 'admin', 'privilege', 'save,saveview', '2', '1492425959', '1493004474');
INSERT INTO `yunos_privilege` VALUES ('7', '删除权限', 'admin', 'privilege', 'del', '2', '1492425992', '1492425992');
INSERT INTO `yunos_privilege` VALUES ('8', '角色列表', 'admin', 'role', 'index', '1', '1492426044', '1492426044');
INSERT INTO `yunos_privilege` VALUES ('10', '修改角色', 'admin', 'role', 'save,saveview', '8', '1492845432', '1493004489');
INSERT INTO `yunos_privilege` VALUES ('11', '删除角色', 'admin', 'role', 'del', '8', '1492845503', '1492845576');
INSERT INTO `yunos_privilege` VALUES ('12', '帐号列表', 'admin', 'account', 'index', '1', '1492845535', '1492845535');
INSERT INTO `yunos_privilege` VALUES ('13', '添加帐号', 'admin', 'account', 'add,addview', '12', '1492845612', '1493004496');
INSERT INTO `yunos_privilege` VALUES ('14', '修改帐号', 'admin', 'account', 'save,saveview', '12', '1492845655', '1493004502');
INSERT INTO `yunos_privilege` VALUES ('15', '删除帐号', 'admin', 'account', 'del', '12', '1492845684', '1532571590');

-- ----------------------------
-- Table structure for `yunos_role`
-- ----------------------------
DROP TABLE IF EXISTS `yunos_role`;
CREATE TABLE `yunos_role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `privilege_list` varchar(200) DEFAULT ',' COMMENT '权限列表',
  `name` varchar(50) DEFAULT '' COMMENT '角色名称',
  `sort` smallint(6) unsigned DEFAULT '0' COMMENT '排序',
  `is_on` bit(1) DEFAULT b'0' COMMENT '是否启用',
  `create_time` int(11) DEFAULT '0',
  `update_time` int(11) DEFAULT '0',
  `privilege_text` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yunos_role
-- ----------------------------
INSERT INTO `yunos_role` VALUES ('1', '*', '系统管理员', '0', '', '1492587124', '1492587124', '系统管理员');
INSERT INTO `yunos_role` VALUES ('3', '1,2,4,6,8,10,12,14', '经理', '0', '', '1492845735', '1532576113', '管理员模块,权限列表 ,添加权限,修改权限,角色列表,修改角色,帐号列表,修改帐号');

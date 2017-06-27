/*
Navicat MySQL Data Transfer

Source Server         : localhost33306
Source Server Version : 50705
Source Host           : localhost:33306
Source Database       : weshop

Target Server Type    : MYSQL
Target Server Version : 50705
File Encoding         : 65001

Date: 2017-06-26 01:29:35
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(255) DEFAULT NULL COMMENT '登录名',
  `password` varchar(255) DEFAULT NULL COMMENT '密码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------

-- ----------------------------
-- Table structure for w_goods
-- ----------------------------
DROP TABLE IF EXISTS `w_goods`;
CREATE TABLE `w_goods` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `shortName` varchar(255) DEFAULT NULL,
  `longName` varchar(255) DEFAULT NULL,
  `summary` varchar(255) DEFAULT NULL COMMENT '简介',
  `image` varchar(255) DEFAULT NULL,
  `price` varchar(50) DEFAULT NULL,
  `goodsType` int(2) DEFAULT NULL,
  `totalNum` int(8) DEFAULT NULL,
  `sellNum` int(8) DEFAULT NULL,
  `detail` varchar(2000) DEFAULT NULL,
  `creator` varchar(50) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of w_goods
-- ----------------------------
INSERT INTO `w_goods` VALUES ('4', '眼镜一', '长标签眼镜一', '17年新款', 'https://ss2.baidu.com/6ONYsjip0QIZ8tyhnq/it/u=1254743606,2634171638&fm=80&w=179&h=119&img.JPEG', '99.00', '0', '100', '0', '一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述', 'zhao', '2017-06-25 16:21:09');
INSERT INTO `w_goods` VALUES ('6', '眼镜一', '长标签眼镜一', '17年新款', 'https://ss2.baidu.com/6ONYsjip0QIZ8tyhnq/it/u=1254743606,2634171638&fm=80&w=179&h=119&img.JPEG', '99.00', '0', '100', '0', '一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述', 'zhao', '2017-06-25 16:21:09');
INSERT INTO `w_goods` VALUES ('10', '我的测试', '阿斯顿发生撒的发生的发生大', '春节特价', 'http://highness.qiniudn.com/628787bd98f04241b3e6c096f854d187.jpg', '55.00', '1', '12', '1', '舒服舒服撒撒个舒服舒服撒撒个舒服舒服撒撒个舒服舒服撒撒个舒服舒服撒撒个', 'zhao', '2017-06-25 16:21:09');

-- ----------------------------
-- Table structure for w_goods_image
-- ----------------------------
DROP TABLE IF EXISTS `w_goods_image`;
CREATE TABLE `w_goods_image` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `goodsId` bigint(20) DEFAULT NULL,
  `imageId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of w_goods_image
-- ----------------------------
INSERT INTO `w_goods_image` VALUES ('1', '1', '1');
INSERT INTO `w_goods_image` VALUES ('4', '1', '2');
INSERT INTO `w_goods_image` VALUES ('7', '1', '5');
INSERT INTO `w_goods_image` VALUES ('8', '10', '6');
INSERT INTO `w_goods_image` VALUES ('9', '10', '7');
INSERT INTO `w_goods_image` VALUES ('10', '10', '8');

-- ----------------------------
-- Table structure for w_home_image
-- ----------------------------
DROP TABLE IF EXISTS `w_home_image`;
CREATE TABLE `w_home_image` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) DEFAULT NULL,
  `creator` varchar(50) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of w_home_image
-- ----------------------------
INSERT INTO `w_home_image` VALUES ('1', 'https://ss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=3818837221,2015780441&fm=80&w=179&h=119&img.JPEG', 'zhao', '2017-06-25 16:07:52');
INSERT INTO `w_home_image` VALUES ('2', 'https://ss2.baidu.com/6ONYsjip0QIZ8tyhnq/it/u=3964623887,2044262732&fm=80&w=179&h=119&img.JPEG', 'zhao', '2017-06-25 16:04:01');
INSERT INTO `w_home_image` VALUES ('7', 'http://highness.qiniudn.com/ef4f396cd5654ed2aab4aab94ff3e12d.png', 'zhao', '2017-06-25 16:04:01');
INSERT INTO `w_home_image` VALUES ('8', 'http://highness.qiniudn.com/9d37f9dca2d44fe5a242d1a727726a75.png', 'zhao', '2017-06-25 16:04:01');
INSERT INTO `w_home_image` VALUES ('9', 'http://highness.qiniudn.com/f0174a55e17643d78982b35fc0af30b2.png', 'zhao', '2017-06-25 16:04:01');
INSERT INTO `w_home_image` VALUES ('10', 'http://highness.qiniudn.com/c05371d332bc467eb1f57dfd59cfafbc.png', 'zhao', '2017-06-25 16:04:01');
INSERT INTO `w_home_image` VALUES ('11', 'http://highness.qiniudn.com/5ddda665fc3342e0bbe7989a82372d64.png', 'zhao', '2017-06-25 16:04:01');
INSERT INTO `w_home_image` VALUES ('12', 'http://highness.qiniudn.com/b3f177c691d7452b95c41604ce0875f7.jpg', 'zhao', '2017-06-25 16:04:01');
INSERT INTO `w_home_image` VALUES ('13', 'http://highness.qiniudn.com/c5f8e1170c344d8288552fe79319f128.jpg', 'zhao', '2017-06-25 16:04:01');
INSERT INTO `w_home_image` VALUES ('14', 'http://highness.qiniudn.com/53064709ad4c4d3891d5edf60b0658ed.jpg', 'zhao', '2017-06-25 16:04:01');

-- ----------------------------
-- Table structure for w_image
-- ----------------------------
DROP TABLE IF EXISTS `w_image`;
CREATE TABLE `w_image` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of w_image
-- ----------------------------
INSERT INTO `w_image` VALUES ('1', 'http://fanyi.baidu.com/static/translation/img/header/logo_cbfea26.png');
INSERT INTO `w_image` VALUES ('2', 'http://highness.qiniudn.com/fde9032f48444f2db476b6356a98ce82.jpg');
INSERT INTO `w_image` VALUES ('3', 'http://highness.qiniudn.com/fde9032f48444f2db476b6356a98ce82.jpg');
INSERT INTO `w_image` VALUES ('4', 'http://highness.qiniudn.com/c05371d332bc467eb1f57dfd59cfafbc.png');
INSERT INTO `w_image` VALUES ('5', 'http://highness.qiniudn.com/5ddda665fc3342e0bbe7989a82372d64.png');
INSERT INTO `w_image` VALUES ('6', 'http://highness.qiniudn.com/b3f177c691d7452b95c41604ce0875f7.jpg');
INSERT INTO `w_image` VALUES ('7', 'http://highness.qiniudn.com/c5f8e1170c344d8288552fe79319f128.jpg');
INSERT INTO `w_image` VALUES ('8', 'http://highness.qiniudn.com/53064709ad4c4d3891d5edf60b0658ed.jpg');

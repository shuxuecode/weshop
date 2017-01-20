/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50514
Source Host           : localhost:3306
Source Database       : weshop

Target Server Type    : MYSQL
Target Server Version : 50514
File Encoding         : 65001

Date: 2017-01-20 21:19:57
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of w_goods
-- ----------------------------
INSERT INTO `w_goods` VALUES ('1', '眼镜一', '长标签眼镜一', '17年新款', 'https://ss2.baidu.com/6ONYsjip0QIZ8tyhnq/it/u=1254743606,2634171638&fm=80&w=179&h=119&img.JPEG', '99.00', '1', '100', '0', '一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述');
INSERT INTO `w_goods` VALUES ('2', '眼镜一', '长标签眼镜一', '17年新款', 'https://ss2.baidu.com/6ONYsjip0QIZ8tyhnq/it/u=1254743606,2634171638&fm=80&w=179&h=119&img.JPEG', '99.00', '1', '100', '0', '一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述');
INSERT INTO `w_goods` VALUES ('3', '眼镜一', '长标签眼镜一', '17年新款', 'https://ss2.baidu.com/6ONYsjip0QIZ8tyhnq/it/u=1254743606,2634171638&fm=80&w=179&h=119&img.JPEG', '99.00', '1', '100', '0', '一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述');
INSERT INTO `w_goods` VALUES ('4', '眼镜一', '长标签眼镜一', '17年新款', 'https://ss2.baidu.com/6ONYsjip0QIZ8tyhnq/it/u=1254743606,2634171638&fm=80&w=179&h=119&img.JPEG', '99.00', '0', '100', '0', '一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述');
INSERT INTO `w_goods` VALUES ('5', '眼镜一', '长标签眼镜一', '17年新款', 'https://ss2.baidu.com/6ONYsjip0QIZ8tyhnq/it/u=1254743606,2634171638&fm=80&w=179&h=119&img.JPEG', '99.00', '0', '100', '0', '一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述');
INSERT INTO `w_goods` VALUES ('6', '眼镜一', '长标签眼镜一', '17年新款', 'https://ss2.baidu.com/6ONYsjip0QIZ8tyhnq/it/u=1254743606,2634171638&fm=80&w=179&h=119&img.JPEG', '99.00', '0', '100', '0', '一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述一大段文字描述');

-- ----------------------------
-- Table structure for w_goods_image
-- ----------------------------
DROP TABLE IF EXISTS `w_goods_image`;
CREATE TABLE `w_goods_image` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `goodsId` bigint(20) DEFAULT NULL,
  `imageId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of w_goods_image
-- ----------------------------
INSERT INTO `w_goods_image` VALUES ('1', '1', '1');
INSERT INTO `w_goods_image` VALUES ('2', '1', '2');
INSERT INTO `w_goods_image` VALUES ('3', '1', '3');

-- ----------------------------
-- Table structure for w_home_image
-- ----------------------------
DROP TABLE IF EXISTS `w_home_image`;
CREATE TABLE `w_home_image` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of w_home_image
-- ----------------------------
INSERT INTO `w_home_image` VALUES ('1', 'https://ss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=3818837221,2015780441&fm=80&w=179&h=119&img.JPEG');
INSERT INTO `w_home_image` VALUES ('2', 'https://ss2.baidu.com/6ONYsjip0QIZ8tyhnq/it/u=3964623887,2044262732&fm=80&w=179&h=119&img.JPEG');
INSERT INTO `w_home_image` VALUES ('3', 'https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=421253067,3227492398&fm=80&w=179&h=119&img.JPEG');

-- ----------------------------
-- Table structure for w_image
-- ----------------------------
DROP TABLE IF EXISTS `w_image`;
CREATE TABLE `w_image` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of w_image
-- ----------------------------
INSERT INTO `w_image` VALUES ('1', 'http://fanyi.baidu.com/static/translation/img/header/logo_cbfea26.png');
INSERT INTO `w_image` VALUES ('2', 'http://highness.qiniudn.com/fde9032f48444f2db476b6356a98ce82.jpg');
INSERT INTO `w_image` VALUES ('3', 'http://highness.qiniudn.com/fde9032f48444f2db476b6356a98ce82.jpg');

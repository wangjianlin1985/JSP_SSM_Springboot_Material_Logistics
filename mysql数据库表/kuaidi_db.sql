/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50051
Source Host           : localhost:3306
Source Database       : kuaidi_db

Target Server Type    : MYSQL
Target Server Version : 50051
File Encoding         : 65001

Date: 2018-07-05 17:31:26
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `username` varchar(20) NOT NULL default '',
  `password` varchar(32) default NULL,
  PRIMARY KEY  (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('a', 'a');

-- ----------------------------
-- Table structure for `t_cangku`
-- ----------------------------
DROP TABLE IF EXISTS `t_cangku`;
CREATE TABLE `t_cangku` (
  `cangkuId` int(11) NOT NULL auto_increment COMMENT '仓库id',
  `diqu` varchar(20) NOT NULL COMMENT '所在地区',
  `cangkuName` varchar(20) NOT NULL COMMENT '仓库名称',
  `mianji` varchar(20) NOT NULL COMMENT '仓库面积',
  `tdl` varchar(20) NOT NULL COMMENT '仓库吞吐量',
  `lianxiren` varchar(20) NOT NULL COMMENT '联系人',
  `telephone` varchar(20) NOT NULL COMMENT '联系电话',
  `address` varchar(80) NOT NULL COMMENT '仓库地址',
  `cangkuMemo` varchar(800) default NULL COMMENT '仓库备注',
  PRIMARY KEY  (`cangkuId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_cangku
-- ----------------------------
INSERT INTO `t_cangku` VALUES ('1', '四川成都', '成都跳蹬河营业点', '100平米', '2000件/天', '李明', '028-83948983', '成都跳蹬河长青路13号', '一天处理很多快件');
INSERT INTO `t_cangku` VALUES ('2', '四川成都', '成都双流机场营业点', '200平米', '4000件/天', '王冕', '15938049834', '成都双流机场13号', '测试仓库');

-- ----------------------------
-- Table structure for `t_chuku`
-- ----------------------------
DROP TABLE IF EXISTS `t_chuku`;
CREATE TABLE `t_chuku` (
  `chukuId` int(11) NOT NULL auto_increment COMMENT '出库id',
  `wuziObj` varchar(20) NOT NULL COMMENT '出库物资',
  `wuziClassObj` int(11) NOT NULL COMMENT '物资种类',
  `zhongliang` varchar(20) NOT NULL COMMENT '重量',
  `cangkuObj` int(11) NOT NULL COMMENT '出库仓库',
  `chukuTime` varchar(20) default NULL COMMENT '出库时间',
  `okFlag` varchar(20) NOT NULL COMMENT '是否完好',
  `workManObj` varchar(30) NOT NULL COMMENT '工作人员',
  `chukuMemo` varchar(800) default NULL COMMENT '出库备注',
  PRIMARY KEY  (`chukuId`),
  KEY `wuziObj` (`wuziObj`),
  KEY `wuziClassObj` (`wuziClassObj`),
  KEY `cangkuObj` (`cangkuObj`),
  KEY `workManObj` (`workManObj`),
  CONSTRAINT `t_chuku_ibfk_1` FOREIGN KEY (`wuziObj`) REFERENCES `t_wuzi` (`wuliuNo`),
  CONSTRAINT `t_chuku_ibfk_2` FOREIGN KEY (`wuziClassObj`) REFERENCES `t_wuziclass` (`wuziClassId`),
  CONSTRAINT `t_chuku_ibfk_3` FOREIGN KEY (`cangkuObj`) REFERENCES `t_cangku` (`cangkuId`),
  CONSTRAINT `t_chuku_ibfk_4` FOREIGN KEY (`workManObj`) REFERENCES `t_workman` (`workUserName`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_chuku
-- ----------------------------
INSERT INTO `t_chuku` VALUES ('1', '239582140124914', '1', '50克', '1', '2018-03-12 21:40:38', '是', 'work1', '出库发送下一站成都转运中心');
INSERT INTO `t_chuku` VALUES ('2', '239582140124914', '1', '50克', '1', '2018-03-20 23:14:40', '是', 'work1', '出库了！');
INSERT INTO `t_chuku` VALUES ('3', '239582140124914', '1', '50克', '2', '2018-03-20 23:59:06', '是', 'work1', '离开成都，发往江西南昌。');
INSERT INTO `t_chuku` VALUES ('4', '239582140124915', '1', '100克', '1', '2018-03-20 23:49:18', '是', 'work1', '发往双流营业点');

-- ----------------------------
-- Table structure for `t_ruku`
-- ----------------------------
DROP TABLE IF EXISTS `t_ruku`;
CREATE TABLE `t_ruku` (
  `rukuId` int(11) NOT NULL auto_increment COMMENT '入库id',
  `wuziObj` varchar(20) NOT NULL COMMENT '入库物资',
  `wuziClassObj` int(11) NOT NULL COMMENT '物资种类',
  `zhongliang` varchar(20) NOT NULL COMMENT '重量',
  `cangkuObj` int(11) NOT NULL COMMENT '入库仓库',
  `rukuTime` varchar(20) default NULL COMMENT '入库时间',
  `okFlag` varchar(20) NOT NULL COMMENT '是否完好',
  `workManObj` varchar(30) NOT NULL COMMENT '工作人员',
  `rukuMemo` varchar(800) default NULL COMMENT '入库备注',
  PRIMARY KEY  (`rukuId`),
  KEY `wuziObj` (`wuziObj`),
  KEY `wuziClassObj` (`wuziClassObj`),
  KEY `cangkuObj` (`cangkuObj`),
  KEY `workManObj` (`workManObj`),
  CONSTRAINT `t_ruku_ibfk_1` FOREIGN KEY (`wuziObj`) REFERENCES `t_wuzi` (`wuliuNo`),
  CONSTRAINT `t_ruku_ibfk_2` FOREIGN KEY (`wuziClassObj`) REFERENCES `t_wuziclass` (`wuziClassId`),
  CONSTRAINT `t_ruku_ibfk_3` FOREIGN KEY (`cangkuObj`) REFERENCES `t_cangku` (`cangkuId`),
  CONSTRAINT `t_ruku_ibfk_4` FOREIGN KEY (`workManObj`) REFERENCES `t_workman` (`workUserName`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_ruku
-- ----------------------------
INSERT INTO `t_ruku` VALUES ('3', '239582140124914', '1', '50克', '1', '2018-03-20 22:27:15', '是', 'work1', '测试入库');
INSERT INTO `t_ruku` VALUES ('4', '239582140124914', '1', '50克', '2', '2018-03-20 23:46:06', '是', 'work1', '来自跳蹬河营业点');
INSERT INTO `t_ruku` VALUES ('5', '239582140124915', '1', '100克', '1', '2018-03-20 23:47:21', '是', 'work1', '测试');

-- ----------------------------
-- Table structure for `t_userinfo`
-- ----------------------------
DROP TABLE IF EXISTS `t_userinfo`;
CREATE TABLE `t_userinfo` (
  `user_name` varchar(30) NOT NULL COMMENT 'user_name',
  `password` varchar(30) NOT NULL COMMENT '登录密码',
  `name` varchar(20) NOT NULL COMMENT '姓名',
  `gender` varchar(4) NOT NULL COMMENT '性别',
  `birthDate` varchar(20) default NULL COMMENT '出生日期',
  `userPhoto` varchar(60) NOT NULL COMMENT '用户照片',
  `telephone` varchar(20) NOT NULL COMMENT '联系电话',
  `email` varchar(50) NOT NULL COMMENT '邮箱',
  `address` varchar(80) default NULL COMMENT '家庭地址',
  `regTime` varchar(20) default NULL COMMENT '注册时间',
  PRIMARY KEY  (`user_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_userinfo
-- ----------------------------
INSERT INTO `t_userinfo` VALUES ('user1', '123', '双鱼林', '男', '2018-03-06', 'upload/33c02b03-0cfd-4276-aa76-a9af4ea1d46b.jpg', '13589834234', 'dashen@163.com', '四川成都红星路13号', '2018-03-12 21:28:18');
INSERT INTO `t_userinfo` VALUES ('user2', '123', '李明娥', '女', '2018-03-06', 'upload/1aeb2beb-9f10-426c-a48f-54d315e07130.jpg', '13598080834', 'minge@163.com', '江西南昌', '2018-03-12 21:28:36');

-- ----------------------------
-- Table structure for `t_workman`
-- ----------------------------
DROP TABLE IF EXISTS `t_workman`;
CREATE TABLE `t_workman` (
  `workUserName` varchar(30) NOT NULL COMMENT 'workUserName',
  `password` varchar(30) NOT NULL COMMENT '登录密码',
  `name` varchar(20) NOT NULL COMMENT '姓名',
  `gender` varchar(4) NOT NULL COMMENT '性别',
  `birthDate` varchar(20) default NULL COMMENT '出生日期',
  `workManPhoto` varchar(60) NOT NULL COMMENT '工作人员照片',
  `telephone` varchar(20) NOT NULL COMMENT '联系电话',
  `address` varchar(80) default NULL COMMENT '家庭地址',
  `workManMemo` varchar(800) default NULL COMMENT '备注信息',
  PRIMARY KEY  (`workUserName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_workman
-- ----------------------------
INSERT INTO `t_workman` VALUES ('work1', '123', '王佳俊', '男', '2018-03-06', 'upload/5429ea35-0d3a-407f-b32c-2a584fcfb163.jpg', '13598084324', '四川南充', '工作认真负责');
INSERT INTO `t_workman` VALUES ('work2', '123', '李广宁', '男', '2018-03-08', 'upload/dfbe8980-589e-4450-a602-fae7dbc7fb2f.jpg', '15329829834', '四川遂宁', '测试人员');

-- ----------------------------
-- Table structure for `t_wuzi`
-- ----------------------------
DROP TABLE IF EXISTS `t_wuzi`;
CREATE TABLE `t_wuzi` (
  `wuliuNo` varchar(20) NOT NULL COMMENT 'wuliuNo',
  `wuziClassObj` int(11) NOT NULL COMMENT '物资分类',
  `wuziName` varchar(20) NOT NULL COMMENT '物资名称',
  `zhongliang` varchar(20) NOT NULL COMMENT '物资重量',
  `wuziDesc` varchar(8000) NOT NULL COMMENT '物资详情',
  `userObj` varchar(30) NOT NULL COMMENT '寄件人',
  `sendTelephone` varchar(30) NOT NULL COMMENT '寄件人电话',
  `sendAddress` varchar(80) NOT NULL COMMENT '寄件人地址',
  `receiveUserObj` varchar(30) NOT NULL COMMENT '收件人',
  `receiveTelephone` varchar(20) NOT NULL COMMENT '收件人电话',
  `receiveAddress` varchar(80) NOT NULL COMMENT '收件人地址',
  `yunfei` float NOT NULL COMMENT '运费',
  `wldt` varchar(800) NOT NULL COMMENT '物流动态',
  `wuziMemo` varchar(800) default NULL COMMENT '备注信息',
  PRIMARY KEY  (`wuliuNo`),
  KEY `wuziClassObj` (`wuziClassObj`),
  KEY `userObj` (`userObj`),
  KEY `receiveUserObj` (`receiveUserObj`),
  CONSTRAINT `t_wuzi_ibfk_1` FOREIGN KEY (`wuziClassObj`) REFERENCES `t_wuziclass` (`wuziClassId`),
  CONSTRAINT `t_wuzi_ibfk_2` FOREIGN KEY (`userObj`) REFERENCES `t_userinfo` (`user_name`),
  CONSTRAINT `t_wuzi_ibfk_3` FOREIGN KEY (`receiveUserObj`) REFERENCES `t_userinfo` (`user_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_wuzi
-- ----------------------------
INSERT INTO `t_wuzi` VALUES ('239582140124914', '1', '金士顿内存条', '50克', '<p>需要寄送一个全新的金士顿内存条</p>', 'user1', '13589083984', '江西南昌', 'user2', '13085083984', '南昌长安路12号', '15', '2018-03-20 20:00 快递公司开始揽件\r\n2018-03-20 22:27:26入库： 成都跳蹬河营业点\r\n2018-03-20 23:16:20出库于： 成都跳蹬河营业点\r\n2018-03-20 23:46:31入库： 成都双流机场营业点 来自跳蹬河营业点\r\n2018-03-20 23:49:01出库于： 成都双流机场营业点 离开成都，发往江西南昌。', 'test');
INSERT INTO `t_wuzi` VALUES ('239582140124915', '1', '笔记本硬盘500G', '100克', '<p>没坏道，稳定静音！</p>', 'user2', '13589083984', '成都红星路', 'user1', '13985082343', '陕西西安', '15', '2017-03-20 20:18 物流公司开始揽件\r\n2018-03-20 23:47:27入库： 成都跳蹬河营业点 测试\r\n2018-03-20 23:49:37出库于： 成都跳蹬河营业点 发往双流营业点', '');

-- ----------------------------
-- Table structure for `t_wuziclass`
-- ----------------------------
DROP TABLE IF EXISTS `t_wuziclass`;
CREATE TABLE `t_wuziclass` (
  `wuziClassId` int(11) NOT NULL auto_increment COMMENT '物资种类id',
  `wuziClassName` varchar(20) NOT NULL COMMENT '物资种类名称',
  PRIMARY KEY  (`wuziClassId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_wuziclass
-- ----------------------------
INSERT INTO `t_wuziclass` VALUES ('1', '电子产品');
INSERT INTO `t_wuziclass` VALUES ('2', '生活用品');

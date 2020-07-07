/*
Navicat MySQL Data Transfer

Source Server         : 192.168.1.136
Source Server Version : 50710
Source Host           : 192.168.1.136:3306
Source Database       : store

Target Server Type    : MYSQL
Target Server Version : 50710
File Encoding         : 65001

Date: 2020-07-07 19:42:00
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for business_card
-- ----------------------------
DROP TABLE IF EXISTS `business_card`;
CREATE TABLE `business_card` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `NO` varchar(255) DEFAULT NULL COMMENT '会员卡编号',
  `NAME` varchar(255) DEFAULT NULL COMMENT '卡名称',
  `AMOUNT` decimal(10,2) DEFAULT NULL COMMENT '金额',
  `GIVE_AMOUNT` decimal(10,2) DEFAULT NULL COMMENT '赠送金额',
  `GOOD_DISCOUNT` decimal(10,2) DEFAULT NULL COMMENT '商品折扣',
  `PROJECT_DISCOUNT` decimal(10,2) DEFAULT NULL COMMENT '项目折扣',
  `CREATE_ID` varchar(32) DEFAULT NULL COMMENT '创建人ID',
  `CREATE_NAME` varchar(255) DEFAULT NULL COMMENT '创建人',
  `DEPT_ID` varchar(32) DEFAULT NULL COMMENT '冗余字段方便查询',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `PUSH_MONEY` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='卡项';

-- ----------------------------
-- Records of business_card
-- ----------------------------
INSERT INTO `business_card` VALUES ('1', '101', '9折优惠卡', '2000.00', '0.00', '10.00', '10.00', '1', 'admin', '24c43877d7cc4e1a4b7957a4324843a3', '2020-04-28 10:56:43', '1.00');

-- ----------------------------
-- Table structure for business_category
-- ----------------------------
DROP TABLE IF EXISTS `business_category`;
CREATE TABLE `business_category` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) DEFAULT NULL COMMENT '名称',
  `CREATE_ID` varchar(32) DEFAULT NULL COMMENT '创建人ID',
  `CREATE_NAME` varchar(255) DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `CATEGORY_TYPE` tinyint(2) DEFAULT NULL COMMENT '1项目 2卖品',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COMMENT='项目，卖品分类';

-- ----------------------------
-- Records of business_category
-- ----------------------------
INSERT INTO `business_category` VALUES ('12', '河南足浴修脚', '1', '王旭磊', '2020-07-02 16:50:38', '1');
INSERT INTO `business_category` VALUES ('13', '舍艺修复', '1', '王旭磊', '2020-07-02 17:00:16', '2');

-- ----------------------------
-- Table structure for business_detail_tech
-- ----------------------------
DROP TABLE IF EXISTS `business_detail_tech`;
CREATE TABLE `business_detail_tech` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `SELL_DETAIL_ID` bigint(20) DEFAULT NULL COMMENT '销售详情id',
  `TECH_ID` varchar(32) DEFAULT NULL COMMENT '技术id',
  `TECH_NAME` varchar(255) DEFAULT NULL COMMENT '技术姓名',
  `PUSH_MONEY` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8mb4 COMMENT='销售详情与服务技术关系表';

-- ----------------------------
-- Records of business_detail_tech
-- ----------------------------
INSERT INTO `business_detail_tech` VALUES ('1', null, null, null, null);
INSERT INTO `business_detail_tech` VALUES ('2', '1', '1', 'admin', '1.00');
INSERT INTO `business_detail_tech` VALUES ('3', '30', '34b4d059536bc3fb4a88bf7e75b44a55', '13837520190', '1.00');
INSERT INTO `business_detail_tech` VALUES ('4', '30', '8f5fc1547d5edef18e64708220b94b54', '13837520193', '1.00');
INSERT INTO `business_detail_tech` VALUES ('5', '30', 'd04db334a48790cdd73550bffe285534', '1383752194', '1.00');
INSERT INTO `business_detail_tech` VALUES ('6', '31', '34b4d059536bc3fb4a88bf7e75b44a55', '13837520190', '1.00');
INSERT INTO `business_detail_tech` VALUES ('7', '31', '0385bc1f4be4fe302e933bf0ddc9f4fe', '13837520191', '1.00');
INSERT INTO `business_detail_tech` VALUES ('8', '32', 'd04db334a48790cdd73550bffe285534', '1383752194', '1.00');
INSERT INTO `business_detail_tech` VALUES ('9', null, '34b4d059536bc3fb4a88bf7e75b44a55', '13837520190', '1.00');
INSERT INTO `business_detail_tech` VALUES ('10', null, '8f5fc1547d5edef18e64708220b94b54', '13837520193', '1.00');
INSERT INTO `business_detail_tech` VALUES ('11', null, '34b4d059536bc3fb4a88bf7e75b44a55', '13837520190', '1.00');
INSERT INTO `business_detail_tech` VALUES ('12', '36', '34b4d059536bc3fb4a88bf7e75b44a55', '技师1', '88.00');
INSERT INTO `business_detail_tech` VALUES ('13', '37', '34b4d059536bc3fb4a88bf7e75b44a55', '技师1', '20.00');
INSERT INTO `business_detail_tech` VALUES ('14', '38', 'c10fed62df031e34a657f1d8df4e925b', '技师5', '88.00');
INSERT INTO `business_detail_tech` VALUES ('15', '1', '34b4d059536bc3fb4a88bf7e75b44a55', '技师1', '20.00');
INSERT INTO `business_detail_tech` VALUES ('16', '2', '34b4d059536bc3fb4a88bf7e75b44a55', '技师1', '2.00');
INSERT INTO `business_detail_tech` VALUES ('17', '2', '0385bc1f4be4fe302e933bf0ddc9f4fe', '技师2', '2.00');
INSERT INTO `business_detail_tech` VALUES ('18', '3', '8f5fc1547d5edef18e64708220b94b54', '技师3', '20.00');
INSERT INTO `business_detail_tech` VALUES ('19', '3', '34b4d059536bc3fb4a88bf7e75b44a55', '技师1', '20.00');
INSERT INTO `business_detail_tech` VALUES ('20', '4', '34b4d059536bc3fb4a88bf7e75b44a55', '技师1', '20.00');
INSERT INTO `business_detail_tech` VALUES ('21', '5', '34b4d059536bc3fb4a88bf7e75b44a55', '技师1', '88.00');
INSERT INTO `business_detail_tech` VALUES ('22', '6', '34b4d059536bc3fb4a88bf7e75b44a55', '技师1', '8.00');
INSERT INTO `business_detail_tech` VALUES ('23', '6', '0385bc1f4be4fe302e933bf0ddc9f4fe', '技师2', '8.00');
INSERT INTO `business_detail_tech` VALUES ('24', '6', '8f5fc1547d5edef18e64708220b94b54', '技师3', '8.00');
INSERT INTO `business_detail_tech` VALUES ('25', '6', 'd04db334a48790cdd73550bffe285534', '技师4', '8.00');
INSERT INTO `business_detail_tech` VALUES ('26', '6', 'c10fed62df031e34a657f1d8df4e925b', '技师5', '8.00');
INSERT INTO `business_detail_tech` VALUES ('27', '7', '34b4d059536bc3fb4a88bf7e75b44a55', '技师1', '0.20');
INSERT INTO `business_detail_tech` VALUES ('28', '7', '0385bc1f4be4fe302e933bf0ddc9f4fe', '技师2', '0.20');
INSERT INTO `business_detail_tech` VALUES ('29', '7', '8f5fc1547d5edef18e64708220b94b54', '技师3', '0.20');
INSERT INTO `business_detail_tech` VALUES ('30', '7', 'd04db334a48790cdd73550bffe285534', '技师4', '0.20');
INSERT INTO `business_detail_tech` VALUES ('31', '7', 'c10fed62df031e34a657f1d8df4e925b', '技师5', '0.20');
INSERT INTO `business_detail_tech` VALUES ('32', '8', '34b4d059536bc3fb4a88bf7e75b44a55', '技师1', '40.00');
INSERT INTO `business_detail_tech` VALUES ('33', '9', '34b4d059536bc3fb4a88bf7e75b44a55', '技师1', '40.00');
INSERT INTO `business_detail_tech` VALUES ('34', '10', '34b4d059536bc3fb4a88bf7e75b44a55', '技师1', '40.00');
INSERT INTO `business_detail_tech` VALUES ('35', '11', '34b4d059536bc3fb4a88bf7e75b44a55', '技师1', '20.00');
INSERT INTO `business_detail_tech` VALUES ('38', '13', '34b4d059536bc3fb4a88bf7e75b44a55', '技师1', '7.98');
INSERT INTO `business_detail_tech` VALUES ('39', '13', '0385bc1f4be4fe302e933bf0ddc9f4fe', '技师2', '7.98');
INSERT INTO `business_detail_tech` VALUES ('40', '13', '8f5fc1547d5edef18e64708220b94b54', '技师3', '7.98');
INSERT INTO `business_detail_tech` VALUES ('41', '13', 'd04db334a48790cdd73550bffe285534', '技师4', '7.98');
INSERT INTO `business_detail_tech` VALUES ('42', '13', 'c10fed62df031e34a657f1d8df4e925b', '技师5', '7.98');
INSERT INTO `business_detail_tech` VALUES ('43', '14', '34b4d059536bc3fb4a88bf7e75b44a55', '技师1', '7.98');
INSERT INTO `business_detail_tech` VALUES ('44', '14', '0385bc1f4be4fe302e933bf0ddc9f4fe', '技师2', '7.98');
INSERT INTO `business_detail_tech` VALUES ('45', '14', '8f5fc1547d5edef18e64708220b94b54', '技师3', '7.98');
INSERT INTO `business_detail_tech` VALUES ('46', '14', 'd04db334a48790cdd73550bffe285534', '技师4', '7.98');
INSERT INTO `business_detail_tech` VALUES ('47', '14', 'c10fed62df031e34a657f1d8df4e925b', '技师5', '7.98');
INSERT INTO `business_detail_tech` VALUES ('48', '15', '34b4d059536bc3fb4a88bf7e75b44a55', '技师1', '20.00');
INSERT INTO `business_detail_tech` VALUES ('49', '16', '34b4d059536bc3fb4a88bf7e75b44a55', '技师1', '20.00');
INSERT INTO `business_detail_tech` VALUES ('50', '16', '0385bc1f4be4fe302e933bf0ddc9f4fe', '技师2', '20.00');
INSERT INTO `business_detail_tech` VALUES ('51', '17', 'c10fed62df031e34a657f1d8df4e925b', '技师5', '40.00');
INSERT INTO `business_detail_tech` VALUES ('52', '18', '34b4d059536bc3fb4a88bf7e75b44a55', '技师1', '20.00');
INSERT INTO `business_detail_tech` VALUES ('53', '18', '0385bc1f4be4fe302e933bf0ddc9f4fe', '技师2', '20.00');
INSERT INTO `business_detail_tech` VALUES ('54', '19', '34b4d059536bc3fb4a88bf7e75b44a55', '技师1', '40.00');
INSERT INTO `business_detail_tech` VALUES ('55', '20', '0385bc1f4be4fe302e933bf0ddc9f4fe', '技师2', '25.00');
INSERT INTO `business_detail_tech` VALUES ('56', '21', '8f5fc1547d5edef18e64708220b94b54', '技师3', '20.00');
INSERT INTO `business_detail_tech` VALUES ('57', '21', 'd04db334a48790cdd73550bffe285534', '技师4', '20.00');
INSERT INTO `business_detail_tech` VALUES ('58', '22', '34b4d059536bc3fb4a88bf7e75b44a55', '技师1', '40.00');
INSERT INTO `business_detail_tech` VALUES ('59', '23', '34b4d059536bc3fb4a88bf7e75b44a55', '技师1', '13.30');
INSERT INTO `business_detail_tech` VALUES ('60', '23', '0385bc1f4be4fe302e933bf0ddc9f4fe', '技师2', '13.30');
INSERT INTO `business_detail_tech` VALUES ('61', '23', '8f5fc1547d5edef18e64708220b94b54', '技师3', '13.30');
INSERT INTO `business_detail_tech` VALUES ('62', '24', '34b4d059536bc3fb4a88bf7e75b44a55', '技师1', '40.00');
INSERT INTO `business_detail_tech` VALUES ('63', '25', 'c10fed62df031e34a657f1d8df4e925b', '技师5', '40.00');
INSERT INTO `business_detail_tech` VALUES ('64', '26', '0385bc1f4be4fe302e933bf0ddc9f4fe', '技师2', '40.00');
INSERT INTO `business_detail_tech` VALUES ('65', '27', '34b4d059536bc3fb4a88bf7e75b44a55', '技师1', '20.00');
INSERT INTO `business_detail_tech` VALUES ('66', '28', 'c10fed62df031e34a657f1d8df4e925b', '技师5', '40.00');
INSERT INTO `business_detail_tech` VALUES ('67', '29', '34b4d059536bc3fb4a88bf7e75b44a55', '技师1', '40.00');
INSERT INTO `business_detail_tech` VALUES ('68', '30', '34b4d059536bc3fb4a88bf7e75b44a55', '技师1', '20.00');
INSERT INTO `business_detail_tech` VALUES ('69', '31', '34b4d059536bc3fb4a88bf7e75b44a55', '技师1', '20.00');
INSERT INTO `business_detail_tech` VALUES ('70', '32', '34b4d059536bc3fb4a88bf7e75b44a55', '技师1', '1.00');
INSERT INTO `business_detail_tech` VALUES ('71', '33', '0385bc1f4be4fe302e933bf0ddc9f4fe', '技师2', '20.00');
INSERT INTO `business_detail_tech` VALUES ('72', '34', 'c10fed62df031e34a657f1d8df4e925b', '技师5', '20.00');
INSERT INTO `business_detail_tech` VALUES ('73', '35', '8f5fc1547d5edef18e64708220b94b54', '技师3', '10.00');
INSERT INTO `business_detail_tech` VALUES ('74', '35', 'd04db334a48790cdd73550bffe285534', '技师4', '10.00');
INSERT INTO `business_detail_tech` VALUES ('75', '36', '8f5fc1547d5edef18e64708220b94b54', '技师3', '10.00');
INSERT INTO `business_detail_tech` VALUES ('76', '36', 'd04db334a48790cdd73550bffe285534', '技师4', '10.00');
INSERT INTO `business_detail_tech` VALUES ('77', '37', 'd04db334a48790cdd73550bffe285534', '技师4', '20.00');
INSERT INTO `business_detail_tech` VALUES ('78', '38', '34b4d059536bc3fb4a88bf7e75b44a55', '技师1', '20.00');
INSERT INTO `business_detail_tech` VALUES ('79', '39', '34b4d059536bc3fb4a88bf7e75b44a55', '技师1', '20.00');
INSERT INTO `business_detail_tech` VALUES ('80', '40', '34b4d059536bc3fb4a88bf7e75b44a55', '技师1', '19.95');
INSERT INTO `business_detail_tech` VALUES ('81', '40', '0385bc1f4be4fe302e933bf0ddc9f4fe', '技师2', '19.95');
INSERT INTO `business_detail_tech` VALUES ('82', '41', '34b4d059536bc3fb4a88bf7e75b44a55', '技师1', '0.10');
INSERT INTO `business_detail_tech` VALUES ('83', '42', '34b4d059536bc3fb4a88bf7e75b44a55', '技师1', '19.95');
INSERT INTO `business_detail_tech` VALUES ('84', '42', '0385bc1f4be4fe302e933bf0ddc9f4fe', '技师2', '19.95');
INSERT INTO `business_detail_tech` VALUES ('85', '43', '34b4d059536bc3fb4a88bf7e75b44a55', '技师1', '19.95');
INSERT INTO `business_detail_tech` VALUES ('86', '43', '0385bc1f4be4fe302e933bf0ddc9f4fe', '技师2', '19.95');
INSERT INTO `business_detail_tech` VALUES ('87', '44', '34b4d059536bc3fb4a88bf7e75b44a55', '技师1', '19.95');
INSERT INTO `business_detail_tech` VALUES ('88', '44', '0385bc1f4be4fe302e933bf0ddc9f4fe', '技师2', '19.95');
INSERT INTO `business_detail_tech` VALUES ('89', '45', '0385bc1f4be4fe302e933bf0ddc9f4fe', '技师2', '25.00');
INSERT INTO `business_detail_tech` VALUES ('90', '46', '34b4d059536bc3fb4a88bf7e75b44a55', '技师1', '10.00');
INSERT INTO `business_detail_tech` VALUES ('91', '46', '0385bc1f4be4fe302e933bf0ddc9f4fe', '技师2', '10.00');
INSERT INTO `business_detail_tech` VALUES ('92', '47', '34b4d059536bc3fb4a88bf7e75b44a55', '技师1', '0.56');
INSERT INTO `business_detail_tech` VALUES ('93', '47', '0385bc1f4be4fe302e933bf0ddc9f4fe', '技师2', '0.56');
INSERT INTO `business_detail_tech` VALUES ('94', '48', '0385bc1f4be4fe302e933bf0ddc9f4fe', '技师2', '20.00');
INSERT INTO `business_detail_tech` VALUES ('95', '49', '0385bc1f4be4fe302e933bf0ddc9f4fe', '技师2', '25.00');

-- ----------------------------
-- Table structure for business_inventory
-- ----------------------------
DROP TABLE IF EXISTS `business_inventory`;
CREATE TABLE `business_inventory` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `PRODUCT_ID` bigint(20) DEFAULT NULL,
  `COUNT` bigint(20) DEFAULT NULL,
  `DEPT_ID` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='库存表';

-- ----------------------------
-- Records of business_inventory
-- ----------------------------
INSERT INTO `business_inventory` VALUES ('2', '31', '3', '0404039033a71cb92dbf65dcc184ec90');

-- ----------------------------
-- Table structure for business_member
-- ----------------------------
DROP TABLE IF EXISTS `business_member`;
CREATE TABLE `business_member` (
  `ID` varchar(255) NOT NULL COMMENT 'ID',
  `NAME` varchar(255) DEFAULT NULL COMMENT '姓名',
  `SEX` varchar(255) DEFAULT NULL COMMENT '性别',
  `BIRTHDAY` datetime DEFAULT NULL COMMENT '出生年月',
  `PHONE_NUMBER` varchar(18) DEFAULT NULL COMMENT '手机号',
  `ADDRESS` varchar(255) DEFAULT NULL COMMENT '家庭住址',
  `COME_FROM` varchar(255) DEFAULT NULL COMMENT '客户来源',
  `DEPT_ID` varchar(32) DEFAULT NULL COMMENT '所属门店',
  `INVITER` varchar(255) DEFAULT NULL COMMENT '邀请人',
  `INVITER_ID` varchar(32) DEFAULT NULL COMMENT '邀请人ID',
  `MEMBER_STATUS` tinyint(2) DEFAULT NULL COMMENT '会员状态(1,正常2,冻结)',
  `REMARK` varchar(255) DEFAULT NULL COMMENT '备注',
  `AVATAR` text COMMENT '头像',
  `USER_ID` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `SMS_ALERT` varchar(255) DEFAULT NULL COMMENT '短信提醒',
  `OPEN_ID` varchar(255) DEFAULT NULL COMMENT 'openId',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会员表';

-- ----------------------------
-- Records of business_member
-- ----------------------------
INSERT INTO `business_member` VALUES ('40e39c19bf9ca2d874d37bf8a1ea493b', null, null, null, null, null, null, null, null, null, '1', null, null, null, null, null, '2020-06-29 17:05:46');
INSERT INTO `business_member` VALUES ('ce961d0c2c21a9b2cc5ce2582d381ac5', '测试会员', '1', null, '13837520190', '', '6bf2f9bf0e35e5578ddecc7f2d763ed1', '0404039033a71cb92dbf65dcc184ec90', null, null, '1', '', '', null, 'on', null, '2020-06-29 16:55:01');

-- ----------------------------
-- Table structure for business_membercard
-- ----------------------------
DROP TABLE IF EXISTS `business_membercard`;
CREATE TABLE `business_membercard` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `MEMBER_ID` varchar(32) DEFAULT NULL COMMENT '会员id',
  `NAME` varchar(255) DEFAULT NULL COMMENT '卡名称',
  `AMOUNT` decimal(10,2) DEFAULT NULL COMMENT '余额',
  `GOOD_DISCOUNT` decimal(10,2) DEFAULT NULL COMMENT '商品折扣',
  `PROJECT_DISCOUNT` decimal(10,2) DEFAULT NULL COMMENT '项目折扣',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `BUILD_CARD_AMOUNT` decimal(10,2) DEFAULT NULL COMMENT '续卡金额',
  `PUSH_MONEY` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COMMENT='会员卡关联表';

-- ----------------------------
-- Records of business_membercard
-- ----------------------------
INSERT INTO `business_membercard` VALUES ('4', 'ce961d0c2c21a9b2cc5ce2582d381ac5', '9折优惠卡', '0.00', '10.00', '10.00', '2020-07-07 10:57:44', '2000.00', '1.00');
INSERT INTO `business_membercard` VALUES ('5', 'ce961d0c2c21a9b2cc5ce2582d381ac5', '9折优惠卡', '2112.00', '10.00', '10.00', '2020-07-07 11:19:16', '2000.00', '1.00');
INSERT INTO `business_membercard` VALUES ('6', 'ce961d0c2c21a9b2cc5ce2582d381ac5', '9折优惠卡', '2230.00', '10.00', '10.00', '2020-07-07 15:50:23', '2000.00', '1.00');

-- ----------------------------
-- Table structure for business_product
-- ----------------------------
DROP TABLE IF EXISTS `business_product`;
CREATE TABLE `business_product` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `PRODUCT_NO` varchar(255) DEFAULT NULL COMMENT '项目编号',
  `CATEGORY_ID` bigint(20) DEFAULT NULL COMMENT '所属分类',
  `CATEGORY_NAME` varchar(255) DEFAULT NULL COMMENT '所属分类',
  `NAME` varchar(255) DEFAULT NULL COMMENT '名称',
  `AMOUNT` decimal(10,2) DEFAULT NULL COMMENT '金额',
  `IMAGES` text COMMENT '图片',
  `REMARK` varchar(1000) DEFAULT NULL COMMENT '备注',
  `CREATE_ID` varchar(32) DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `CREATE_NAME` varchar(255) DEFAULT NULL,
  `PRODUCT_TYPE` tinyint(2) DEFAULT NULL COMMENT '1项目 2卖品',
  `UNIT` varchar(255) DEFAULT NULL COMMENT '单位',
  `MEMBER_AMOUNT` decimal(10,2) DEFAULT NULL COMMENT '会员价',
  `COMMON_PUSH_MONEY` decimal(10,2) DEFAULT NULL,
  `HIGH_PUSH_MONEY` decimal(10,2) DEFAULT NULL,
  `TOP_PUSH_MONEY` decimal(10,2) DEFAULT NULL,
  `PUSH_PERCENT` varchar(255) DEFAULT NULL COMMENT '提成比例',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COMMENT='商品，项目表';

-- ----------------------------
-- Records of business_product
-- ----------------------------
INSERT INTO `business_product` VALUES ('28', '101', '12', '河南足浴修脚', '舍艺修脚', '50.00', '', '', '1', '2020-07-02 16:51:10', '王旭磊', '1', null, '45.00', '20.00', '25.00', '30.00', null);
INSERT INTO `business_product` VALUES ('29', '102', '12', '河南足浴修脚', '经典足浴', '89.00', '', '', '1', '2020-07-02 16:51:33', '王旭磊', '1', null, '79.00', '30.00', '35.00', '40.00', null);
INSERT INTO `business_product` VALUES ('30', '103', '12', '河南足浴修脚', '特色足浴', '119.00', '', '', '1', '2020-07-02 16:54:54', '王旭磊', '1', null, '109.00', '88.00', null, null, null);
INSERT INTO `business_product` VALUES ('31', '504', '13', '舍艺修复', '亮嘉抗菌套盒', '499.00', '', '', '1', '2020-07-02 17:02:14', '王旭磊', '2', '盒', '399.00', '200.00', null, null, '10');
INSERT INTO `business_product` VALUES ('32', '505', '13', '舍艺修复', '嵌嘉抗菌套盒', '499.00', '', '', '1', '2020-07-02 17:03:21', '王旭磊', '2', '盒', '399.00', '200.00', null, null, null);

-- ----------------------------
-- Table structure for business_receipt
-- ----------------------------
DROP TABLE IF EXISTS `business_receipt`;
CREATE TABLE `business_receipt` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `TRADE_NO` varchar(255) DEFAULT NULL COMMENT '交易单号',
  `TRM_NO` varchar(255) DEFAULT NULL COMMENT '设备号',
  `AMOUNT` varchar(255) DEFAULT NULL COMMENT '金额',
  `SELL_ID` bigint(20) DEFAULT NULL COMMENT '销售单号',
  `CREATE_TIME` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_ID` varchar(32) DEFAULT NULL,
  `CREATE_NAME` varchar(255) DEFAULT NULL,
  `DEPT_ID` varchar(32) DEFAULT NULL,
  `RECEIPT_STATUS` tinyint(2) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COMMENT='条码支付';

-- ----------------------------
-- Records of business_receipt
-- ----------------------------
INSERT INTO `business_receipt` VALUES ('7', 'c68889e90dd3e46fbcd480698c6375fd', 'XB938277', '1', null, '2020-07-07 19:35:39', '1', '王旭磊', '0404039033a71cb92dbf65dcc184ec90', '1');

-- ----------------------------
-- Table structure for business_sell
-- ----------------------------
DROP TABLE IF EXISTS `business_sell`;
CREATE TABLE `business_sell` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `MEMBER_ID` varchar(32) DEFAULT NULL COMMENT '会员ID',
  `MEMBER_NAME` varchar(255) DEFAULT NULL COMMENT '会员名称',
  `SELL_AMOUNT` decimal(10,2) DEFAULT NULL COMMENT '消费金额',
  `REAL_AMOUNT` decimal(10,2) DEFAULT NULL COMMENT '实际入账',
  `SELL_TYPE` tinyint(2) DEFAULT NULL COMMENT '1开卡 2续卡 3项目/卖品',
  `DEPT_ID` varchar(32) DEFAULT NULL COMMENT '机构id',
  `CREATE_ID` varchar(32) DEFAULT NULL COMMENT '创建人姓名',
  `CREATE_NAME` varchar(255) DEFAULT NULL COMMENT '创建人姓名',
  `CREATE_TIME` datetime DEFAULT NULL,
  `STATUS` tinyint(2) DEFAULT NULL COMMENT '1正常 2撤销',
  `REMARK` text,
  `MODIFY_NAME` varchar(255) DEFAULT NULL,
  `MODIFY_ID` varchar(32) DEFAULT NULL,
  `MODIFY_TIME` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COMMENT='销售表';

-- ----------------------------
-- Records of business_sell
-- ----------------------------
INSERT INTO `business_sell` VALUES ('30', 'ce961d0c2c21a9b2cc5ce2582d381ac5', '测试会员', '2000.00', '2000.00', '1', '0404039033a71cb92dbf65dcc184ec90', '1', '王旭磊', '2020-07-06 19:10:31', '1', null, null, null, null);
INSERT INTO `business_sell` VALUES ('31', 'ce961d0c2c21a9b2cc5ce2582d381ac5', '测试会员', '2000.00', '2000.00', '2', '0404039033a71cb92dbf65dcc184ec90', '1', '王旭磊', '2020-07-06 19:10:38', '1', null, null, null, null);
INSERT INTO `business_sell` VALUES ('32', 'ce961d0c2c21a9b2cc5ce2582d381ac5', '测试会员', '100.00', '100.00', '2', '0404039033a71cb92dbf65dcc184ec90', '1', '王旭磊', '2020-07-06 19:19:02', '1', null, null, null, null);
INSERT INTO `business_sell` VALUES ('33', 'ce961d0c2c21a9b2cc5ce2582d381ac5', '测试会员', '2000.00', '2000.00', '2', '0404039033a71cb92dbf65dcc184ec90', '1', '王旭磊', '2020-07-06 19:20:44', '1', null, null, null, null);
INSERT INTO `business_sell` VALUES ('34', 'ce961d0c2c21a9b2cc5ce2582d381ac5', '测试会员', '2000.00', '2000.00', '1', '0404039033a71cb92dbf65dcc184ec90', '1', '王旭磊', '2020-07-06 19:22:59', '1', null, null, null, null);
INSERT INTO `business_sell` VALUES ('35', 'ce961d0c2c21a9b2cc5ce2582d381ac5', '测试会员', '2000.00', '2000.00', '2', '0404039033a71cb92dbf65dcc184ec90', '1', '王旭磊', '2020-07-06 19:24:48', '1', null, null, null, null);
INSERT INTO `business_sell` VALUES ('36', 'ce961d0c2c21a9b2cc5ce2582d381ac5', '测试会员', '2000.00', '2000.00', '2', '0404039033a71cb92dbf65dcc184ec90', '1', '王旭磊', '2020-07-06 19:30:15', '1', null, null, null, null);
INSERT INTO `business_sell` VALUES ('37', 'ce961d0c2c21a9b2cc5ce2582d381ac5', '测试会员', '2000.00', '2000.00', '2', '0404039033a71cb92dbf65dcc184ec90', '1', '王旭磊', '2020-07-06 19:35:21', '1', null, null, null, null);
INSERT INTO `business_sell` VALUES ('38', 'ce961d0c2c21a9b2cc5ce2582d381ac5', '测试会员', '2000.00', '2000.00', '1', '0404039033a71cb92dbf65dcc184ec90', '1', '王旭磊', '2020-07-06 19:36:30', '1', null, null, null, null);
INSERT INTO `business_sell` VALUES ('39', 'ce961d0c2c21a9b2cc5ce2582d381ac5', '测试会员', '45.00', '45.00', '3', '0404039033a71cb92dbf65dcc184ec90', '1', '王旭磊', '2020-07-07 09:32:28', '1', null, null, null, null);
INSERT INTO `business_sell` VALUES ('40', 'ce961d0c2c21a9b2cc5ce2582d381ac5', '测试会员', '399.00', '399.00', '3', '0404039033a71cb92dbf65dcc184ec90', '1', '王旭磊', '2020-07-07 09:32:35', '1', null, null, null, null);
INSERT INTO `business_sell` VALUES ('41', 'ce961d0c2c21a9b2cc5ce2582d381ac5', '测试会员', '10.00', '10.00', '1', '0404039033a71cb92dbf65dcc184ec90', '1', '王旭磊', '2020-07-07 10:57:44', '1', null, null, null, null);
INSERT INTO `business_sell` VALUES ('42', 'ce961d0c2c21a9b2cc5ce2582d381ac5', '测试会员', '399.00', '399.00', '3', '0404039033a71cb92dbf65dcc184ec90', '1', '王旭磊', '2020-07-07 11:16:08', '1', null, null, null, null);
INSERT INTO `business_sell` VALUES ('43', 'ce961d0c2c21a9b2cc5ce2582d381ac5', '测试会员', '843.00', '843.00', '3', '0404039033a71cb92dbf65dcc184ec90', '1', '王旭磊', '2020-07-07 11:18:27', '1', null, null, null, null);
INSERT INTO `business_sell` VALUES ('44', 'ce961d0c2c21a9b2cc5ce2582d381ac5', '测试会员', '2000.00', '2000.00', '1', '0404039033a71cb92dbf65dcc184ec90', '1', '王旭磊', '2020-07-07 11:19:16', '1', null, null, null, null);
INSERT INTO `business_sell` VALUES ('45', 'ce961d0c2c21a9b2cc5ce2582d381ac5', '测试会员', '112.00', '112.00', '2', '0404039033a71cb92dbf65dcc184ec90', '1', '王旭磊', '2020-07-07 11:19:27', '1', null, null, null, null);
INSERT INTO `business_sell` VALUES ('46', 'ce961d0c2c21a9b2cc5ce2582d381ac5', '测试会员', '2000.00', '2000.00', '1', '0404039033a71cb92dbf65dcc184ec90', '1', '王旭磊', '2020-07-07 15:50:23', '1', null, null, null, null);
INSERT INTO `business_sell` VALUES ('47', 'ce961d0c2c21a9b2cc5ce2582d381ac5', '测试会员', '45.00', '45.00', '3', '0404039033a71cb92dbf65dcc184ec90', '1', '王旭磊', '2020-07-07 19:28:05', '1', null, null, null, null);

-- ----------------------------
-- Table structure for business_selldetail
-- ----------------------------
DROP TABLE IF EXISTS `business_selldetail`;
CREATE TABLE `business_selldetail` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) DEFAULT NULL COMMENT '商品/项目名',
  `SELL_ID` bigint(20) DEFAULT NULL,
  `PRODUCT_ID` bigint(20) DEFAULT NULL COMMENT '商品ID',
  `CARD_ID` bigint(20) DEFAULT NULL COMMENT '卡项ID',
  `MEMBER_CARD_ID` bigint(20) DEFAULT NULL,
  `SELL_TYPE` tinyint(2) DEFAULT NULL COMMENT '1开卡 2续卡 3项目 4卖品',
  `AMOUNT` decimal(10,2) DEFAULT NULL COMMENT '金额',
  `DISCOUNT` decimal(10,2) DEFAULT NULL,
  `REAL_AMOUNT` decimal(10,2) DEFAULT NULL COMMENT '实际金额',
  `CREATE_TIME` datetime DEFAULT NULL,
  `GIVE_AMOUNT` decimal(10,2) DEFAULT NULL,
  `MEMBER_CARD_AMOUNT` varchar(255) DEFAULT NULL COMMENT '开卡时用户余额',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COMMENT='销售详情';

-- ----------------------------
-- Records of business_selldetail
-- ----------------------------
INSERT INTO `business_selldetail` VALUES ('30', '9折优惠卡', '30', null, '1', '1', '1', '2000.00', null, '2000.00', '2020-07-06 19:10:31', '0.00', '2000');
INSERT INTO `business_selldetail` VALUES ('31', '9折优惠卡', '31', null, '1', '1', '2', '2000.00', null, '2000.00', '2020-07-06 19:10:38', '0.00', '4000.00');
INSERT INTO `business_selldetail` VALUES ('32', '9折优惠卡', '32', null, '1', '1', '2', '100.00', null, '100.00', '2020-07-06 19:19:02', '0.00', '4100.00');
INSERT INTO `business_selldetail` VALUES ('33', '9折优惠卡', '33', null, '1', '1', '2', '2000.00', null, '2000.00', '2020-07-06 19:20:44', '0.00', '6100.00');
INSERT INTO `business_selldetail` VALUES ('34', '9折优惠卡', '34', null, '1', '2', '1', '2000.00', null, '2000.00', '2020-07-06 19:22:59', '250.00', '2250');
INSERT INTO `business_selldetail` VALUES ('35', '9折优惠卡', '35', null, '1', '1', '2', '2000.00', null, '2000.00', '2020-07-06 19:30:09', '0.00', '8100.00');
INSERT INTO `business_selldetail` VALUES ('36', '9折优惠卡', '36', null, '1', '1', '2', '2000.00', null, '2000.00', '2020-07-06 19:34:26', '0.00', '10100.00');
INSERT INTO `business_selldetail` VALUES ('37', '9折优惠卡', '37', null, '1', '1', '2', '2000.00', null, '2000.00', '2020-07-06 19:35:21', '123.00', '12100.00');
INSERT INTO `business_selldetail` VALUES ('38', '9折优惠卡', '38', null, '1', '3', '1', '2000.00', null, '2000.00', '2020-07-06 19:37:55', '0.00', '2000');
INSERT INTO `business_selldetail` VALUES ('39', '舍艺修脚', '39', '28', null, '1', '3', '45.00', '10.00', '45.00', '2020-07-07 09:32:28', null, '12055.00');
INSERT INTO `business_selldetail` VALUES ('40', '亮嘉抗菌套盒', '40', '31', null, '1', '3', '399.00', '10.00', '399.00', '2020-07-07 09:32:35', null, '11656.00');
INSERT INTO `business_selldetail` VALUES ('41', '9折优惠卡', '41', null, '1', '4', '1', '10.00', null, '10.00', '2020-07-07 10:57:44', '0.00', '10');
INSERT INTO `business_selldetail` VALUES ('42', '亮嘉抗菌套盒', '42', '31', null, '4', '3', '399.00', '10.00', '399.00', '2020-07-07 11:16:08', null, '0.00');
INSERT INTO `business_selldetail` VALUES ('43', '亮嘉抗菌套盒', '43', '31', null, '4', '3', '399.00', '10.00', '399.00', '2020-07-07 11:18:27', null, '0.00');
INSERT INTO `business_selldetail` VALUES ('44', '亮嘉抗菌套盒', '43', '31', null, '4', '3', '399.00', '10.00', '399.00', '2020-07-07 11:18:27', null, '0.00');
INSERT INTO `business_selldetail` VALUES ('45', '舍艺修脚', '43', '28', null, '4', '3', '45.00', '10.00', '45.00', '2020-07-07 11:18:27', null, '0.00');
INSERT INTO `business_selldetail` VALUES ('46', '9折优惠卡', '44', null, '1', '5', '1', '2000.00', null, '2000.00', '2020-07-07 11:19:16', '0.00', '2000');
INSERT INTO `business_selldetail` VALUES ('47', '9折优惠卡', '45', null, '5', '5', '2', '112.00', null, '112.00', '2020-07-07 11:19:27', '2.00', '2112.00');
INSERT INTO `business_selldetail` VALUES ('48', '9折优惠卡', '46', null, '1', '6', '1', '2000.00', null, '2000.00', '2020-07-07 15:50:23', '230.00', '2230');
INSERT INTO `business_selldetail` VALUES ('49', '舍艺修脚', '47', '28', null, '4', '3', '45.00', '10.00', '45.00', '2020-07-07 19:28:05', null, '0.00');

-- ----------------------------
-- Table structure for business_sellpay
-- ----------------------------
DROP TABLE IF EXISTS `business_sellpay`;
CREATE TABLE `business_sellpay` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `SELL_ID` bigint(20) DEFAULT NULL COMMENT '销售单id',
  `PAY_NAME` varchar(255) DEFAULT NULL COMMENT '支付方式名称',
  `PAY_TYPE` tinyint(2) DEFAULT NULL COMMENT '0.卡金1.现金 2银联 3支付宝 4微信 5其他 6优惠 ',
  `AMOUNT` decimal(10,2) DEFAULT NULL COMMENT '金额',
  `CREATE_TIME` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=449 DEFAULT CHARSET=utf8mb4 COMMENT='销售单付款方式';

-- ----------------------------
-- Records of business_sellpay
-- ----------------------------
INSERT INTO `business_sellpay` VALUES ('429', '30', '现金', '1', '2000.00', '2020-07-06 19:10:31');
INSERT INTO `business_sellpay` VALUES ('430', '31', '现金', '1', '2000.00', '2020-07-06 19:10:38');
INSERT INTO `business_sellpay` VALUES ('431', '32', '现金', '1', '100.00', '2020-07-06 19:19:02');
INSERT INTO `business_sellpay` VALUES ('432', '33', '现金', '1', '2000.00', '2020-07-06 19:20:44');
INSERT INTO `business_sellpay` VALUES ('433', '34', '现金', '1', '2000.00', '2020-07-06 19:23:00');
INSERT INTO `business_sellpay` VALUES ('434', '35', '现金', '1', '2000.00', '2020-07-06 19:30:09');
INSERT INTO `business_sellpay` VALUES ('435', '36', '现金', '1', '2000.00', '2020-07-06 19:34:26');
INSERT INTO `business_sellpay` VALUES ('436', '37', '现金', '1', '2000.00', '2020-07-06 19:35:21');
INSERT INTO `business_sellpay` VALUES ('437', '38', '现金', '1', '2000.00', '2020-07-06 19:37:55');
INSERT INTO `business_sellpay` VALUES ('438', '39', '卡金', '0', '45.00', '2020-07-07 09:32:28');
INSERT INTO `business_sellpay` VALUES ('439', '40', '卡金', '0', '399.00', '2020-07-07 09:32:35');
INSERT INTO `business_sellpay` VALUES ('440', '41', '现金', '1', '10.00', '2020-07-07 10:57:44');
INSERT INTO `business_sellpay` VALUES ('441', '42', '卡金', '0', '10.00', '2020-07-07 11:16:09');
INSERT INTO `business_sellpay` VALUES ('442', '42', '现金', '1', '389.00', '2020-07-07 11:16:09');
INSERT INTO `business_sellpay` VALUES ('443', '43', '现金', '1', '843.00', '2020-07-07 11:18:27');
INSERT INTO `business_sellpay` VALUES ('444', '44', '现金', '1', '2000.00', '2020-07-07 11:19:16');
INSERT INTO `business_sellpay` VALUES ('445', '45', '现金', '1', '112.00', '2020-07-07 11:19:27');
INSERT INTO `business_sellpay` VALUES ('446', '46', '现金', '1', '2000.00', '2020-07-07 15:50:23');
INSERT INTO `business_sellpay` VALUES ('447', '47', '条码支付', '1', '0.01', '2020-07-07 19:28:05');
INSERT INTO `business_sellpay` VALUES ('448', '47', '现金', '2', '44.99', '2020-07-07 19:28:05');

-- ----------------------------
-- Table structure for business_stock
-- ----------------------------
DROP TABLE IF EXISTS `business_stock`;
CREATE TABLE `business_stock` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) DEFAULT NULL,
  `STOCK_NO` varchar(32) DEFAULT NULL COMMENT '出库编号',
  `DEPT_ID` varchar(32) DEFAULT NULL COMMENT '门店',
  `DEPT_NAME` varchar(255) DEFAULT NULL COMMENT '门店名称',
  `CREATE_ID` varchar(32) DEFAULT NULL,
  `CREATE_NAME` varchar(255) DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `REMARK` text,
  `CHECK_ID` varchar(32) DEFAULT NULL COMMENT '审核人ID',
  `CHECK_NAME` varchar(255) DEFAULT NULL COMMENT '审核人姓名',
  `CHECK_TIME` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '审核时间',
  `STOCK_STATUS` tinyint(2) DEFAULT NULL COMMENT '1待审核 2审核成功 3作废',
  `STOCK_TYPE` tinyint(2) DEFAULT NULL COMMENT '类型 1入库 2出库',
  `STOCK_MONEY` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COMMENT='入库单';

-- ----------------------------
-- Records of business_stock
-- ----------------------------
INSERT INTO `business_stock` VALUES ('2', null, 'SHEYI202007061021', '0404039033a71cb92dbf65dcc184ec90', '总部', '1', '王旭磊', '2020-07-06 10:21:54', '', '1', '王旭磊', '2020-07-06 10:21:54', '2', '1', null);
INSERT INTO `business_stock` VALUES ('3', null, 'SHEYI202007061022', '0404039033a71cb92dbf65dcc184ec90', '总部', '1', '王旭磊', '2020-07-06 10:22:14', null, null, null, null, '2', '2', null);
INSERT INTO `business_stock` VALUES ('4', null, 'SHEYI202007061023', '0404039033a71cb92dbf65dcc184ec90', '总部', '1', '王旭磊', '2020-07-06 10:23:35', null, null, null, null, '2', '2', null);
INSERT INTO `business_stock` VALUES ('5', null, 'SHEYI202007061059', '0404039033a71cb92dbf65dcc184ec90', '总部', '1', '王旭磊', '2020-07-06 10:59:17', null, null, null, null, '2', '2', null);
INSERT INTO `business_stock` VALUES ('6', null, 'SHEYI202007070932', '0404039033a71cb92dbf65dcc184ec90', '总部', '1', '王旭磊', '2020-07-07 09:32:35', null, null, null, null, '2', '2', null);
INSERT INTO `business_stock` VALUES ('7', null, 'SHEYI202007071116', '0404039033a71cb92dbf65dcc184ec90', '总部', '1', '王旭磊', '2020-07-07 11:16:08', null, null, null, null, '2', '2', null);
INSERT INTO `business_stock` VALUES ('8', null, 'SHEYI202007071118', '0404039033a71cb92dbf65dcc184ec90', '总部', '1', '王旭磊', '2020-07-07 11:18:27', null, null, null, null, '2', '2', null);

-- ----------------------------
-- Table structure for business_stock_detail
-- ----------------------------
DROP TABLE IF EXISTS `business_stock_detail`;
CREATE TABLE `business_stock_detail` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `PRODUCT_ID` bigint(20) DEFAULT NULL,
  `PRODUCT_NAME` varchar(255) DEFAULT NULL,
  `COUNT` bigint(20) DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '入库时间',
  `STOCK_ID` bigint(20) DEFAULT NULL,
  `DEPT_ID` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COMMENT='入库单详情';

-- ----------------------------
-- Records of business_stock_detail
-- ----------------------------
INSERT INTO `business_stock_detail` VALUES ('2', '31', '亮嘉抗菌套盒', '10', '2020-07-06 10:21:50', '2', '0404039033a71cb92dbf65dcc184ec90');
INSERT INTO `business_stock_detail` VALUES ('3', '31', '亮嘉抗菌套盒', '1', '2020-07-06 10:22:14', '3', '0404039033a71cb92dbf65dcc184ec90');
INSERT INTO `business_stock_detail` VALUES ('4', '31', '亮嘉抗菌套盒', '1', '2020-07-06 10:23:35', '4', '0404039033a71cb92dbf65dcc184ec90');
INSERT INTO `business_stock_detail` VALUES ('5', '31', '亮嘉抗菌套盒', '1', '2020-07-06 10:59:17', '5', '0404039033a71cb92dbf65dcc184ec90');
INSERT INTO `business_stock_detail` VALUES ('6', '31', '亮嘉抗菌套盒', '1', '2020-07-07 09:32:35', '6', '0404039033a71cb92dbf65dcc184ec90');
INSERT INTO `business_stock_detail` VALUES ('7', '31', '亮嘉抗菌套盒', '1', '2020-07-07 11:16:09', '7', '0404039033a71cb92dbf65dcc184ec90');
INSERT INTO `business_stock_detail` VALUES ('8', '31', '亮嘉抗菌套盒', '1', '2020-07-07 11:18:27', '8', '0404039033a71cb92dbf65dcc184ec90');
INSERT INTO `business_stock_detail` VALUES ('9', '31', '亮嘉抗菌套盒', '1', '2020-07-07 11:18:27', '8', '0404039033a71cb92dbf65dcc184ec90');

-- ----------------------------
-- Table structure for business_wxmenu
-- ----------------------------
DROP TABLE IF EXISTS `business_wxmenu`;
CREATE TABLE `business_wxmenu` (
  `BUTTON_ID` varchar(32) CHARACTER SET utf8 NOT NULL,
  `PARENT_ID` varchar(1000) CHARACTER SET utf8 DEFAULT NULL COMMENT '父级ID 如果是菜单则为 appId 子菜单则为底部菜单id',
  `BUTTON_INDEX` int(10) DEFAULT NULL COMMENT 'button索引',
  `TYPE` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '菜单类型',
  `NAME` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '菜单名称',
  `URL` varchar(1000) CHARACTER SET utf8 DEFAULT NULL COMMENT 'url',
  `MEDIA_ID` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '素材ID',
  `PAGEPATH` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '小程序地址',
  `APPID` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '小程序ID',
  `KEY` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '点击事件',
  `TIER` tinyint(2) DEFAULT NULL COMMENT '层级 1底部菜单 2子菜单',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `MATERIAL_TITLE` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '素材标题',
  `MATERIAL_URL` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '素材URL',
  `CONTENT` text COMMENT '自定义内容',
  PRIMARY KEY (`BUTTON_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='微信菜单';

-- ----------------------------
-- Records of business_wxmenu
-- ----------------------------
INSERT INTO `business_wxmenu` VALUES ('092e41e7b1fdae020c2d52d94747853e', 'wxe5c669f557bf72e5,efedd537af7b01f135ee5f29ca8b64f3', '3', 'view', 'openid获取', 'http://zhq.ngrock.buyerhou.top/weixin', '', '', '', '', '2', '2020-01-12 17:51:13', '', '', '');
INSERT INTO `business_wxmenu` VALUES ('0f0ba7717576e71d089b33b927257a11', 'wxe5c669f557bf72e5,efedd537af7b01f135ee5f29ca8b64f3', '1', 'view', '跳转网页', 'https://www.baidu.com/', '', '', '', '', '2', '2020-01-12 17:44:47', '', '', '');
INSERT INTO `business_wxmenu` VALUES ('1bac7d6627157621c6e1c33dcf8e8f7e', 'wxe5c669f557bf72e5,efedd537af7b01f135ee5f29ca8b64f3', '0', 'text', '普通文本', '', '', '', '', 'text:1bac7d6627157621c6e1c33dcf8e8f7e', '2', '2020-01-12 17:43:35', '', '', 'hello world ✨');
INSERT INTO `business_wxmenu` VALUES ('6c83308c11e3a3dc493361257056d9c5', 'wxecc8dd965063ae7c', '2', 'view', '菜单名称', '', null, null, null, null, '1', '2020-05-11 12:21:55', null, null, null);
INSERT INTO `business_wxmenu` VALUES ('a6b8c7da546762612ab8f5f7ed4e0aee', 'wxecc8dd965063ae7c', '1', 'view', '菜单名称', '', null, null, null, null, '1', '2020-05-11 12:21:26', null, null, null);
INSERT INTO `business_wxmenu` VALUES ('d12f80e308b5a15beead4d225e08350c', 'wxe5c669f557bf72e5,efedd537af7b01f135ee5f29ca8b64f3', '2', 'click', '自定义事件', '', '', '', '', 'Hello', '2', '2020-01-12 17:48:30', '', '', '');
INSERT INTO `business_wxmenu` VALUES ('dbd9f151a83da907f948793155e4ec57', 'wxecc8dd965063ae7c', '0', 'view', '菜单名称', '', null, null, null, null, '1', '2020-04-25 17:07:19', null, null, null);
INSERT INTO `business_wxmenu` VALUES ('efedd537af7b01f135ee5f29ca8b64f3', 'wxe5c669f557bf72e5', '0', 'view', '接口测试', '', '', '', '', '', '1', '2020-01-12 17:43:29', '', '', '');

-- ----------------------------
-- Table structure for t_dept
-- ----------------------------
DROP TABLE IF EXISTS `t_dept`;
CREATE TABLE `t_dept` (
  `DEPT_ID` varchar(32) NOT NULL COMMENT '部门ID',
  `PARENT_ID` varchar(32) DEFAULT NULL COMMENT '上级部门ID',
  `PARENT_IDS` varchar(1000) DEFAULT NULL COMMENT '父级ID集合',
  `DEPT_NAME` varchar(100) DEFAULT NULL COMMENT '部门名称',
  `ORDER_NUM` bigint(20) DEFAULT NULL COMMENT '排序',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `MODIFY_TIME` datetime DEFAULT NULL COMMENT '修改时间',
  `TRM_NO` varchar(32) DEFAULT NULL COMMENT '设备号',
  PRIMARY KEY (`DEPT_ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='部门表';

-- ----------------------------
-- Records of t_dept
-- ----------------------------
INSERT INTO `t_dept` VALUES ('0404039033a71cb92dbf65dcc184ec90', '0', '0', '总部', '0', '2020-05-14 14:49:31', '2020-05-18 14:05:46', null);
INSERT INTO `t_dept` VALUES ('1ab16bfd67022983ef2893c3df75b72f', '0', '0', '测试部门', '99', '2020-05-20 10:20:03', '2020-05-20 10:21:02', null);
INSERT INTO `t_dept` VALUES ('24c43877d7cc4e1a4b7957a4324843a3', '0', '0', '榆林路店', '1', '2020-05-14 14:47:09', '2020-05-18 14:05:59', null);
INSERT INTO `t_dept` VALUES ('546cda3823ba8202b5a9f93bfcee2d62', '0', '0', '奥兰花园', '4', '2020-05-18 14:12:19', '2020-05-18 14:12:31', null);
INSERT INTO `t_dept` VALUES ('7afdb43dc4c76173a361f3807d524785', '0', '0', '帝湖店', '6', '2020-05-19 18:09:01', '2020-05-19 18:10:30', null);
INSERT INTO `t_dept` VALUES ('7f66bdc6629d237cf71fdfad60277c6d', '0', '0', '福建宁德', '5', '2020-05-18 14:13:08', '2020-05-18 14:13:29', null);
INSERT INTO `t_dept` VALUES ('b19c6c7d44ebdc04c97b903801909ad4', '0', '0', '广东区域', '7', '2020-05-19 18:09:17', '2020-05-19 18:10:36', null);
INSERT INTO `t_dept` VALUES ('d19fad32052db9300e3721f0d1e25138', '0', '0', '宏名路店', '2', '2020-05-18 14:07:48', '2020-05-18 14:10:16', null);
INSERT INTO `t_dept` VALUES ('ed0423c7cbdb6cec29da3afa787a34dc', '0', '0', '兴荣街店', '3', '2020-05-18 14:10:19', '2020-05-18 14:10:43', null);

-- ----------------------------
-- Table structure for t_dict
-- ----------------------------
DROP TABLE IF EXISTS `t_dict`;
CREATE TABLE `t_dict` (
  `DICT_ID` varchar(32) NOT NULL COMMENT '字典id',
  `DICT_TYPE_ID` varchar(32) NOT NULL COMMENT '所属字典类型的id',
  `CODE` varchar(50) NOT NULL COMMENT '字典编码',
  `NAME` varchar(255) NOT NULL COMMENT '字典名称',
  `ORDER_NUM` int(11) DEFAULT NULL COMMENT '排序',
  `DESCRIPTION` varchar(1000) DEFAULT NULL COMMENT '字典的描述',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`DICT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='基础字典';

-- ----------------------------
-- Records of t_dict
-- ----------------------------
INSERT INTO `t_dict` VALUES ('0369561f271f318c15ade1bb00d5bbd2', 'ff04d0a19011c2625522797f6667ea93', '08', '个', null, null, '2020-06-18 11:22:02');
INSERT INTO `t_dict` VALUES ('0c6fa308e608d160ecfc5e1bd7c80915', '100edb6ca33a00a5bf28d6592738523c', '01', 'java', null, null, '2020-01-14 15:59:25');
INSERT INTO `t_dict` VALUES ('14cf6666e3b857186d22e45bd00a03fc', 'bab335395f4601b68977eb37e0f20431', '01', '支付宝支付', '1', '支付宝支付', '2019-12-17 09:56:35');
INSERT INTO `t_dict` VALUES ('55485a41d28b9336adbcb53d0151a086', 'ff04d0a19011c2625522797f6667ea93', '02', '支', null, null, '2020-06-18 11:20:25');
INSERT INTO `t_dict` VALUES ('6bf2f9bf0e35e5578ddecc7f2d763ed1', '072bc1f49bd310dfbe5773062e83684f', '01', '上门客人', '1', '上门客人', '2019-12-27 03:23:29');
INSERT INTO `t_dict` VALUES ('6eeec0f4605568709c42a5b032008997', 'ff04d0a19011c2625522797f6667ea93', '05', '包', null, null, '2020-06-18 11:21:13');
INSERT INTO `t_dict` VALUES ('80849d8869ccc24dbc6f4a1b0ad2869b', '072bc1f49bd310dfbe5773062e83684f', '05', '美团', '5', '美团', '2019-12-27 03:25:59');
INSERT INTO `t_dict` VALUES ('817e3f4683aac952d3a14689da4df0b7', '072bc1f49bd310dfbe5773062e83684f', '06', '支付宝', '6', '支付宝', '2019-12-27 03:26:18');
INSERT INTO `t_dict` VALUES ('92e3119ad443a02c7a468a99a6aa35a1', '072bc1f49bd310dfbe5773062e83684f', '04', '大众点评', '4', '大众点评', '2019-12-27 03:25:49');
INSERT INTO `t_dict` VALUES ('94d43fe61b6e36c967616db8aae356df', '072bc1f49bd310dfbe5773062e83684f', '03', '客带客', '3', '客带客', '2019-12-27 03:25:37');
INSERT INTO `t_dict` VALUES ('9ecc805f6e4d0fdc518e60f05820af24', 'ff04d0a19011c2625522797f6667ea93', '06', '箱', null, null, '2020-06-18 11:21:23');
INSERT INTO `t_dict` VALUES ('a81fc6c07ced3203b2e8913f5000a121', 'ff04d0a19011c2625522797f6667ea93', '01', '瓶', null, null, '2020-06-18 11:20:09');
INSERT INTO `t_dict` VALUES ('c0496bd8a0786fd45e19763d9b7a11dc', 'ff04d0a19011c2625522797f6667ea93', '03', '套', null, null, '2020-06-18 11:20:34');
INSERT INTO `t_dict` VALUES ('c4405fe3289b8807c7fd186f1ea772f0', '072bc1f49bd310dfbe5773062e83684f', '02', '员工带客', '2', '员工带客', '2019-12-27 03:24:07');
INSERT INTO `t_dict` VALUES ('c6a924d457da38a163a6a4d7650286de', '100edb6ca33a00a5bf28d6592738523c', '02', 'springboot', null, null, '2020-01-14 15:59:33');
INSERT INTO `t_dict` VALUES ('c7d49be5970734983c2e8d7ac3b7b849', 'bab335395f4601b68977eb37e0f20431', '02', '微信支付', '2', '微信支付', '2019-12-17 01:55:09');
INSERT INTO `t_dict` VALUES ('d888ad6d6986f78a34c937dc7bffacff', 'ff04d0a19011c2625522797f6667ea93', '07', '张', null, null, '2020-06-18 11:21:47');
INSERT INTO `t_dict` VALUES ('e7917bee074d6e314e636643fc8e0c87', 'ff04d0a19011c2625522797f6667ea93', '04', '盒', null, null, '2020-06-18 11:21:04');

-- ----------------------------
-- Table structure for t_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `t_dict_type`;
CREATE TABLE `t_dict_type` (
  `DICT_TYPE_ID` varchar(32) NOT NULL COMMENT '字典类型id',
  `CODE` varchar(255) NOT NULL COMMENT '字典类型编码',
  `NAME` varchar(255) NOT NULL COMMENT '字典类型名称',
  `DESCRIPTION` varchar(1000) DEFAULT NULL COMMENT '字典描述',
  `ORDER_NUM` int(11) DEFAULT NULL COMMENT '排序',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`DICT_TYPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='字典类型表';

-- ----------------------------
-- Records of t_dict_type
-- ----------------------------
INSERT INTO `t_dict_type` VALUES ('072bc1f49bd310dfbe5773062e83684f', 'MEMBER_SOURCE', '客户来源', '客户来源', '2', '2019-12-27 03:18:09');
INSERT INTO `t_dict_type` VALUES ('100edb6ca33a00a5bf28d6592738523c', 'ARTICLE_TYPE', '文章类型', '文章类型', '3', '2020-01-14 15:58:51');
INSERT INTO `t_dict_type` VALUES ('bab335395f4601b68977eb37e0f20431', 'PAY_AWAY', '支付方式', '支付方式', '1', '2019-12-16 17:18:28');
INSERT INTO `t_dict_type` VALUES ('ff04d0a19011c2625522797f6667ea93', 'COUNT', '单位', '单位', '4', '2020-06-18 11:19:21');

-- ----------------------------
-- Table structure for t_file_info
-- ----------------------------
DROP TABLE IF EXISTS `t_file_info`;
CREATE TABLE `t_file_info` (
  `FILE_ID` varchar(50) NOT NULL COMMENT '主键id',
  `PARENT_ID` varchar(50) DEFAULT NULL,
  `FILE_BUCKET` varchar(100) DEFAULT NULL COMMENT '文件仓库（oss仓库）',
  `FILE_NAME` varchar(100) NOT NULL COMMENT '文件名称',
  `FILE_SUFFIX` varchar(50) DEFAULT NULL COMMENT '文件后缀',
  `FILE_SIZE_KB` bigint(20) DEFAULT NULL COMMENT '文件大小kb',
  `FINAL_NAME` varchar(100) NOT NULL COMMENT '文件唯一标识id',
  `FILE_PATH` varchar(1000) DEFAULT NULL COMMENT '存储路径',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `UPDATE_TIME` datetime DEFAULT NULL COMMENT '修改时间',
  `CREATE_USER` varchar(32) DEFAULT NULL COMMENT '创建用户',
  `UPDATE_USER` varchar(32) DEFAULT NULL COMMENT '修改用户',
  `FILE_TYPE` tinyint(2) DEFAULT NULL COMMENT '0文件夹 1文件',
  `FILE_SYS_PATH` varchar(1000) DEFAULT NULL COMMENT '存放的系统路径',
  PRIMARY KEY (`FILE_ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='文件信息表';

-- ----------------------------
-- Records of t_file_info
-- ----------------------------
INSERT INTO `t_file_info` VALUES ('1ddb874bb598ed1e80c5ed1fef2f5df9', '/', null, 'u=2796867326,2006542518&fm=26&gp=0.jpg', 'jpg', '13', '1ddb874bb598ed1e80c5ed1fef2f5df9.jpg', '/upload//1ddb874bb598ed1e80c5ed1fef2f5df9.jpg', '2020-05-06 15:17:00', null, '1', null, '1', 'd:\\sweet\\1ddb874bb598ed1e80c5ed1fef2f5df9.jpg');
INSERT INTO `t_file_info` VALUES ('3e68156a4c011e9d22674a2d4b5fd996', 'cf03621340c8cdad5b6adc040992de30', null, 'ningshoutang.png', 'png', '474', '3e68156a4c011e9d22674a2d4b5fd996.png', '/upload/avatar/3e68156a4c011e9d22674a2d4b5fd996.png', '2020-01-15 16:45:35', null, '1', null, '1', 'd:\\sweet\\avatar\\3e68156a4c011e9d22674a2d4b5fd996.png');
INSERT INTO `t_file_info` VALUES ('cf03621340c8cdad5b6adc040992de30', '/', null, 'avatar', 'dir', null, 'avatar', null, '2020-01-15 16:44:15', null, null, null, '0', 'd:\\sweet\\avatar');
INSERT INTO `t_file_info` VALUES ('f6559da69635590ae2883fc874521ec4', 'cf03621340c8cdad5b6adc040992de30', null, 'message.png', 'png', '2', 'f6559da69635590ae2883fc874521ec4.png', '/upload/avatar/f6559da69635590ae2883fc874521ec4.png', '2020-01-15 16:47:44', null, '1', null, '1', 'd:\\sweet\\avatar\\f6559da69635590ae2883fc874521ec4.png');
INSERT INTO `t_file_info` VALUES ('fc57a67e8032058b0f174a05fab98d16', '/', null, 'u=2796867326,2006542518&fm=26&gp=0.jpg', 'jpg', '13', 'fc57a67e8032058b0f174a05fab98d16.jpg', '/upload//fc57a67e8032058b0f174a05fab98d16.jpg', '2020-05-06 11:30:02', null, '1', null, '1', 'd:\\sweet\\fc57a67e8032058b0f174a05fab98d16.jpg');

-- ----------------------------
-- Table structure for t_menu
-- ----------------------------
DROP TABLE IF EXISTS `t_menu`;
CREATE TABLE `t_menu` (
  `MENU_ID` varchar(32) NOT NULL COMMENT '菜单/按钮ID',
  `PARENT_ID` varchar(32) NOT NULL COMMENT '上级菜单ID',
  `MENU_NAME` varchar(50) NOT NULL COMMENT '菜单/按钮名称',
  `URL` varchar(50) DEFAULT NULL COMMENT '菜单URL',
  `PERMS` text COMMENT '权限标识',
  `ICON` varchar(50) DEFAULT NULL COMMENT '图标',
  `TYPE` char(2) NOT NULL COMMENT '类型 0菜单 1按钮',
  `ORDER_NUM` bigint(20) DEFAULT NULL COMMENT '排序',
  `CREATE_TIME` datetime NOT NULL COMMENT '创建时间',
  `MODIFY_TIME` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`MENU_ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='菜单表';

-- ----------------------------
-- Records of t_menu
-- ----------------------------
INSERT INTO `t_menu` VALUES ('0718706302ad70da58dae8bee3181dda', '881bac77e0690244cba83867665ffb5a', '文件管理', '/admin/file', null, '', '0', '3', '2019-12-05 15:59:09', '2019-12-05 16:04:20');
INSERT INTO `t_menu` VALUES ('0bf58ce456662b9f186683e41df1d92d', '5ad3caa634c441a58118ec2ffb424ee7', '机构管理', '/admin/dept', '', '', '0', '2', '2019-12-02 11:05:45', '2020-05-17 16:01:29');
INSERT INTO `t_menu` VALUES ('0c6bce3dd7d7a352acfbfcba16617709', '5ad3caa634c441a58118ec2ffb424ee7', '菜单管理', '/admin/menu', null, null, '0', '1', '2019-12-02 11:02:38', null);
INSERT INTO `t_menu` VALUES ('16446826125a42216f692db7db5fd91c', '5ad3caa634c441a58118ec2ffb424ee7', '用户管理', '/admin/user', null, null, '0', '3', '2019-12-02 11:09:16', null);
INSERT INTO `t_menu` VALUES ('1649ebe3eeb624b25e5914d8b1ce904b', '5ad3caa634c441a58118ec2ffb424ee7', '角色管理', '/admin/role', null, null, '0', '4', '2019-12-02 11:09:38', null);
INSERT INTO `t_menu` VALUES ('178e8858bf5c3734d45bbf617901da2d', 'a7476671cdf861b5c04c5d4b6fd6de80', '会员卡列表', '/admin/membercard/membercard_list', '', '', '0', '1', '2020-05-16 11:25:56', null);
INSERT INTO `t_menu` VALUES ('1b5ac3fe6a43c8d520d127f04259e567', 'a039a84bcc967f998e750d30437b6e7f', '项目管理', '/admin/product/product_list?type=1', '', '', '0', '3', '2020-05-06 10:14:53', '2020-05-14 19:24:43');
INSERT INTO `t_menu` VALUES ('1f4efbedfbed0c9b1c8d6f56ea789f91', '881bac77e0690244cba83867665ffb5a', '代码生成', '/admin/gen', null, null, '0', '1', '2019-12-02 11:34:42', null);
INSERT INTO `t_menu` VALUES ('28262761df6c62538117ce82b02e7d32', 'ac5f717804db3df56fcbed9323311c86', '库存查询', '/admin/inventory/inventory_list', '', '', '0', '2', '2020-06-22 17:43:54', null);
INSERT INTO `t_menu` VALUES ('390a0bed6a293e5554c04cf045331cce', '4b0a170b42f9b74a020c979f27a138cc', '员工业绩', '/admin/sell/userSell_list', '', '', '0', '2', '2020-05-13 17:36:50', null);
INSERT INTO `t_menu` VALUES ('393f9ed5e481494bcb8a14599272c68e', '5ad3caa634c441a58118ec2ffb424ee7', '数据字典', '/admin/dictType/dictType_list', '', '', '0', '6', '2019-12-16 05:01:32', '2019-12-16 10:00:25');
INSERT INTO `t_menu` VALUES ('4b0a170b42f9b74a020c979f27a138cc', '0', '营业分析', '', '', 'layui-icon-dollar', '0', '3', '2020-05-11 12:09:04', '2020-05-16 11:55:39');
INSERT INTO `t_menu` VALUES ('4bb61a4d6eaa1bef8594622308a5eb00', 'a039a84bcc967f998e750d30437b6e7f', '分类设置', '/admin/category/category_list', '', '', '0', '2', '2020-05-06 09:51:15', '2020-05-06 10:09:35');
INSERT INTO `t_menu` VALUES ('5ad3caa634c441a58118ec2ffb424ee7', '0', '系统管理', '', '', 'layui-icon-set', '0', '8', '2019-12-02 10:40:33', '2020-05-16 11:29:05');
INSERT INTO `t_menu` VALUES ('5bdf16dec627126d7502d7777d2fdc21', 'ff58b3cd3cbe6fb5db195d5d541cf82d', '销售数据', '/admin/sell/sell_full', '', '', '0', '3', '2020-05-15 11:00:12', '2020-05-16 11:30:55');
INSERT INTO `t_menu` VALUES ('63859eed0d24ebb808fc8b1964bd5228', '0', '会员管理', '', '', 'layui-icon-username', '0', '1', '2020-04-25 16:33:50', '2020-05-15 18:10:36');
INSERT INTO `t_menu` VALUES ('756ede8d51459b9a012dfdf65226ad13', '0', '收银台', '/admin/cashier', '', 'layui-icon-rmb', '0', '0', '2020-04-27 10:48:35', null);
INSERT INTO `t_menu` VALUES ('76d58f0cc138486d45e9f81c826d2a1c', '4b0a170b42f9b74a020c979f27a138cc', '条码支付', '/admin/receipt/receipt_list', '', '', '0', '4', '2020-07-07 18:58:28', null);
INSERT INTO `t_menu` VALUES ('7f98845df2d985a2d95fc9a03100e056', 'ac5f717804db3df56fcbed9323311c86', '卖品入库', '/admin/stock/stock_list?type=1', '', '', '0', '1', '2020-06-18 15:49:21', '2020-06-24 15:56:14');
INSERT INTO `t_menu` VALUES ('875654754a1588f9e1e40db515f392d8', '4b0a170b42f9b74a020c979f27a138cc', '统计报表', '/admin/statistical/statistical_list', '', '', '0', '3', '2020-07-06 12:01:51', '2020-07-06 12:15:50');
INSERT INTO `t_menu` VALUES ('87fcc24a466040df3f5ce6bc0a20c141', 'ac5f717804db3df56fcbed9323311c86', '出库查询', '/admin/stock/stock_list?type=2', '', '', '0', '3', '2020-06-24 15:55:29', '2020-06-24 15:55:50');
INSERT INTO `t_menu` VALUES ('881bac77e0690244cba83867665ffb5a', '0', '开发工具', '', '', 'layui-icon-util', '0', '9', '2019-12-02 11:34:22', '2020-05-16 11:29:14');
INSERT INTO `t_menu` VALUES ('8c7fb301d2aab801523166b601998378', '5ad3caa634c441a58118ec2ffb424ee7', '在线用户', '/admin/online', null, null, '0', '5', '2019-12-06 18:26:56', null);
INSERT INTO `t_menu` VALUES ('936afba574ceacb79d5a4a2112dbfdd2', 'ac5f717804db3df56fcbed9323311c86', '审核入库', '', 'check:stock', '', '1', '4', '2020-06-28 09:40:37', '2020-06-28 09:41:08');
INSERT INTO `t_menu` VALUES ('9eb38e58ce3af6e3831fa824aa2cf65c', '0', '微信营销', '', '', 'layui-icon-login-wechat', '0', '6', '2019-12-04 16:10:39', '2020-05-16 11:28:53');
INSERT INTO `t_menu` VALUES ('9f4de05ec9078bb28d64d12c3cf6b51f', 'a039a84bcc967f998e750d30437b6e7f', '卖品管理', '/admin/product/product_list?type=2', '', '', '0', '4', '2020-05-13 10:37:18', null);
INSERT INTO `t_menu` VALUES ('a039a84bcc967f998e750d30437b6e7f', '0', '项目设置', '', '', 'layui-icon-component', '0', '4', '2020-04-27 11:34:16', '2020-05-16 11:28:37');
INSERT INTO `t_menu` VALUES ('a7476671cdf861b5c04c5d4b6fd6de80', '0', '会员卡管理', '', '', 'layui-icon-layer', '0', '2', '2020-05-16 11:25:22', '2020-05-16 11:55:14');
INSERT INTO `t_menu` VALUES ('abaa6ba76d8d62210fae4a9d7732a9d2', '4b0a170b42f9b74a020c979f27a138cc', '营业数据', '/admin/sell/sell_list', '', 'layui-icon-dollar', '0', '1', '2020-05-11 12:09:50', '2020-05-12 16:02:17');
INSERT INTO `t_menu` VALUES ('ac5f717804db3df56fcbed9323311c86', '0', '库存管理', '', '', 'layui-icon-template-1', '0', '6', '2020-06-18 15:30:52', '2020-06-18 15:32:50');
INSERT INTO `t_menu` VALUES ('ad30e1e6db74ac19d0f628f5df8c1c68', '881bac77e0690244cba83867665ffb5a', '接口文档', '/swagger-ui.html', null, null, '0', '2', '2019-12-05 11:08:22', null);
INSERT INTO `t_menu` VALUES ('bf898831f47af15bde3a03ae6924c549', '63859eed0d24ebb808fc8b1964bd5228', '会员列表', '/admin/member/member_list', '', '', '0', '0', '2020-04-25 16:34:27', '2020-04-25 16:35:36');
INSERT INTO `t_menu` VALUES ('cac6db11171c192afc8d981243195801', 'f13e529e880299ec77034821009595bb', '员工资料', '/admin/user/tech_list', '', '', '0', '1', '2020-07-01 17:58:15', null);
INSERT INTO `t_menu` VALUES ('d560a968eb643c75ae50cb400c2eaa55', 'a039a84bcc967f998e750d30437b6e7f', '卡项设置', '/admin/card/card_list', '', '', '0', '0', '2020-04-28 10:43:16', null);
INSERT INTO `t_menu` VALUES ('ef092fbc62b691e3e3fc71ab795d804c', '9eb38e58ce3af6e3831fa824aa2cf65c', '公众号管理', '/admin/wxmenu', '', '', '0', '1', '2019-12-04 16:17:11', '2020-01-09 01:45:29');
INSERT INTO `t_menu` VALUES ('f13e529e880299ec77034821009595bb', '0', '员工管理', '', '', 'layui-icon-user', '0', '7', '2020-07-01 17:49:27', null);
INSERT INTO `t_menu` VALUES ('ff58b3cd3cbe6fb5db195d5d541cf82d', '0', '大屏展示', '', '', 'layui-icon-chart-screen', '0', '4', '2020-05-16 11:29:51', '2020-05-16 11:55:58');

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role` (
  `ROLE_ID` varchar(32) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL COMMENT '角色名称',
  `MEMO` varchar(255) DEFAULT NULL COMMENT '角色描述',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`ROLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES ('03813f0a83f7c1b2a377963e54a5c0ee', '收银', '收银', '2020-04-27 11:46:46');
INSERT INTO `t_role` VALUES ('1', 'admin', '超级管理员', '2019-12-02 10:23:49');
INSERT INTO `t_role` VALUES ('c461de8f2c2fde0cf8c21f11183a48f1', '总部管理员', '总部管理员', '2020-05-15 18:08:49');

-- ----------------------------
-- Table structure for t_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `t_role_menu`;
CREATE TABLE `t_role_menu` (
  `ID` varchar(32) NOT NULL,
  `RID` varchar(32) DEFAULT NULL COMMENT '角色ID',
  `MID` varchar(32) DEFAULT NULL COMMENT '菜单ID',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='菜单角色表';

-- ----------------------------
-- Records of t_role_menu
-- ----------------------------
INSERT INTO `t_role_menu` VALUES ('024f0e9780e5a27863f99085b882a107', '1', '0718706302ad70da58dae8bee3181dda');
INSERT INTO `t_role_menu` VALUES ('0404ab9f48f6fafb2cd853d8067d5006', '03813f0a83f7c1b2a377963e54a5c0ee', '4bb61a4d6eaa1bef8594622308a5eb00');
INSERT INTO `t_role_menu` VALUES ('054d95485cc965233a420a7c9496608c', '03813f0a83f7c1b2a377963e54a5c0ee', '178e8858bf5c3734d45bbf617901da2d');
INSERT INTO `t_role_menu` VALUES ('06efc55f097a974d289d380b79ca2853', '1', '936afba574ceacb79d5a4a2112dbfdd2');
INSERT INTO `t_role_menu` VALUES ('077228804b36d484008fc600ccdd88b3', '1', '178e8858bf5c3734d45bbf617901da2d');
INSERT INTO `t_role_menu` VALUES ('0e4fff3246b7902c5b8dfcef8fe3615a', '1', '5bdf16dec627126d7502d7777d2fdc21');
INSERT INTO `t_role_menu` VALUES ('1118c579bd4302ccc2ba403ecb113499', '1', '393f9ed5e481494bcb8a14599272c68e');
INSERT INTO `t_role_menu` VALUES ('1a935f4076bea7320a9360886c42b137', 'c461de8f2c2fde0cf8c21f11183a48f1', 'a7476671cdf861b5c04c5d4b6fd6de80');
INSERT INTO `t_role_menu` VALUES ('1e13723756f57da26dc9caa16d3c1ec6', 'c461de8f2c2fde0cf8c21f11183a48f1', 'ff58b3cd3cbe6fb5db195d5d541cf82d');
INSERT INTO `t_role_menu` VALUES ('2a2a52f782296115a688f6e57816fe55', '1', '0c6bce3dd7d7a352acfbfcba16617709');
INSERT INTO `t_role_menu` VALUES ('2ce43c5f9cdfef93ffd9c4656d8b63c5', '1', '4b0a170b42f9b74a020c979f27a138cc');
INSERT INTO `t_role_menu` VALUES ('2fcd63fc8632db92acac6232fab550e3', '03813f0a83f7c1b2a377963e54a5c0ee', '4b0a170b42f9b74a020c979f27a138cc');
INSERT INTO `t_role_menu` VALUES ('332b36c4a19edd775d7bf948175c624c', '1', 'ad30e1e6db74ac19d0f628f5df8c1c68');
INSERT INTO `t_role_menu` VALUES ('36ed809ca7c367cb1e2cf05f999a8d2b', '03813f0a83f7c1b2a377963e54a5c0ee', '5bdf16dec627126d7502d7777d2fdc21');
INSERT INTO `t_role_menu` VALUES ('3a49ff7246d7a6a755947ac7c7075b9f', '03813f0a83f7c1b2a377963e54a5c0ee', '9f4de05ec9078bb28d64d12c3cf6b51f');
INSERT INTO `t_role_menu` VALUES ('3aa41e44bbc6fe1ce2deafc17d62ce05', '1', '87fcc24a466040df3f5ce6bc0a20c141');
INSERT INTO `t_role_menu` VALUES ('44d0e552e14848202a958c03e5e25a27', '1', '4bb61a4d6eaa1bef8594622308a5eb00');
INSERT INTO `t_role_menu` VALUES ('4c92018e18078f1df7546a9fe126b89c', '1', '9f4de05ec9078bb28d64d12c3cf6b51f');
INSERT INTO `t_role_menu` VALUES ('517bc0c9e3b7c61175579a48bf213049', 'c461de8f2c2fde0cf8c21f11183a48f1', '1649ebe3eeb624b25e5914d8b1ce904b');
INSERT INTO `t_role_menu` VALUES ('51de2f6e3348e26c6a6065f4826410f0', 'c461de8f2c2fde0cf8c21f11183a48f1', '0bf58ce456662b9f186683e41df1d92d');
INSERT INTO `t_role_menu` VALUES ('65338d79222a03815fe74b7323f43e22', '03813f0a83f7c1b2a377963e54a5c0ee', 'ff58b3cd3cbe6fb5db195d5d541cf82d');
INSERT INTO `t_role_menu` VALUES ('65f869d943c9ac785e5463d8b584f1e3', '1', 'a7476671cdf861b5c04c5d4b6fd6de80');
INSERT INTO `t_role_menu` VALUES ('69a2e4c2e9518748fbc0c7867b7d5179', '1', 'a039a84bcc967f998e750d30437b6e7f');
INSERT INTO `t_role_menu` VALUES ('6a295648ae924309aa0eb771e67724b7', 'c461de8f2c2fde0cf8c21f11183a48f1', '16446826125a42216f692db7db5fd91c');
INSERT INTO `t_role_menu` VALUES ('6d02a4e340307fec5ebecc41f47b9432', 'c461de8f2c2fde0cf8c21f11183a48f1', '5bdf16dec627126d7502d7777d2fdc21');
INSERT INTO `t_role_menu` VALUES ('6e7fc1ee612f2a1844c7798b8aa9e801', 'c461de8f2c2fde0cf8c21f11183a48f1', '4b0a170b42f9b74a020c979f27a138cc');
INSERT INTO `t_role_menu` VALUES ('704ff5b0232113cf8e61e68d057e138b', 'c461de8f2c2fde0cf8c21f11183a48f1', '390a0bed6a293e5554c04cf045331cce');
INSERT INTO `t_role_menu` VALUES ('748b6a5b98ed10b47b4a0cc0a045a8c3', 'c461de8f2c2fde0cf8c21f11183a48f1', '5ad3caa634c441a58118ec2ffb424ee7');
INSERT INTO `t_role_menu` VALUES ('795b372afa8ee933fde8301ebdabec63', '1', '0bf58ce456662b9f186683e41df1d92d');
INSERT INTO `t_role_menu` VALUES ('79f1df8e7b99e46038d2b7eb1fd06d4a', 'c461de8f2c2fde0cf8c21f11183a48f1', 'bf898831f47af15bde3a03ae6924c549');
INSERT INTO `t_role_menu` VALUES ('7ca93fac64e99cccd23b6fa7d9a4b039', '1', '28262761df6c62538117ce82b02e7d32');
INSERT INTO `t_role_menu` VALUES ('7d69e6dce3d85d227ca5bccfb8cfb5c2', '03813f0a83f7c1b2a377963e54a5c0ee', '756ede8d51459b9a012dfdf65226ad13');
INSERT INTO `t_role_menu` VALUES ('7de1e45dc298607a6a4a73da3e9c511b', '1', '1b5ac3fe6a43c8d520d127f04259e567');
INSERT INTO `t_role_menu` VALUES ('8181705e5018ef848d0e7d3587cacdc5', '1', '1649ebe3eeb624b25e5914d8b1ce904b');
INSERT INTO `t_role_menu` VALUES ('863c11984f256ba9947e0351b956969c', '1', '76d58f0cc138486d45e9f81c826d2a1c');
INSERT INTO `t_role_menu` VALUES ('89ab6ca19cea91ee3c8c1a2b5c5ed329', '03813f0a83f7c1b2a377963e54a5c0ee', 'bf898831f47af15bde3a03ae6924c549');
INSERT INTO `t_role_menu` VALUES ('906afe70ae172d477651cb1986c6f5f8', '1', 'abaa6ba76d8d62210fae4a9d7732a9d2');
INSERT INTO `t_role_menu` VALUES ('92c6d4fd0d5a90e6e736ecf8972e197d', '1', '881bac77e0690244cba83867665ffb5a');
INSERT INTO `t_role_menu` VALUES ('96a0d109fc072fe1783b3e12a1c077b1', 'c461de8f2c2fde0cf8c21f11183a48f1', '8c7fb301d2aab801523166b601998378');
INSERT INTO `t_role_menu` VALUES ('9d2066cb6250a133b25bd35fe19963a7', '1', '16446826125a42216f692db7db5fd91c');
INSERT INTO `t_role_menu` VALUES ('a18ce01c32c4840480ea47736e913251', '03813f0a83f7c1b2a377963e54a5c0ee', 'a7476671cdf861b5c04c5d4b6fd6de80');
INSERT INTO `t_role_menu` VALUES ('a304c2c4d3963ccce9f6a858fbd42d36', '1', 'cac6db11171c192afc8d981243195801');
INSERT INTO `t_role_menu` VALUES ('adcb6c511261f278063e2dc0dc1290af', '03813f0a83f7c1b2a377963e54a5c0ee', 'd560a968eb643c75ae50cb400c2eaa55');
INSERT INTO `t_role_menu` VALUES ('ae3f5fc9749a69f050785202bd893fa2', '1', 'ff58b3cd3cbe6fb5db195d5d541cf82d');
INSERT INTO `t_role_menu` VALUES ('b1da26c37dbaefeb2806a7fe96903bd7', '1', 'ac5f717804db3df56fcbed9323311c86');
INSERT INTO `t_role_menu` VALUES ('b4e699990e7db6a69c46a37500c61857', '1', 'bf898831f47af15bde3a03ae6924c549');
INSERT INTO `t_role_menu` VALUES ('b753216d846cedd89acbcf8783766187', 'c461de8f2c2fde0cf8c21f11183a48f1', '4bb61a4d6eaa1bef8594622308a5eb00');
INSERT INTO `t_role_menu` VALUES ('bb991671dbf975a14367e43efe049697', '1', 'd560a968eb643c75ae50cb400c2eaa55');
INSERT INTO `t_role_menu` VALUES ('bf216e21ff59eb969e0fd7ea406fa0d6', '1', '1f4efbedfbed0c9b1c8d6f56ea789f91');
INSERT INTO `t_role_menu` VALUES ('c106715397a3d183ccfb48ffaf6eac79', 'c461de8f2c2fde0cf8c21f11183a48f1', '63859eed0d24ebb808fc8b1964bd5228');
INSERT INTO `t_role_menu` VALUES ('c22e10fbd972ce8ea7e89050426a9505', 'c461de8f2c2fde0cf8c21f11183a48f1', '9f4de05ec9078bb28d64d12c3cf6b51f');
INSERT INTO `t_role_menu` VALUES ('c383db1bdcaf1ab1c5c52e89690b2d68', 'c461de8f2c2fde0cf8c21f11183a48f1', '393f9ed5e481494bcb8a14599272c68e');
INSERT INTO `t_role_menu` VALUES ('c3cc2ae5f518799417a83fb700587bf2', '1', '5ad3caa634c441a58118ec2ffb424ee7');
INSERT INTO `t_role_menu` VALUES ('c4db015d93cf543eba834c21c775cb20', '1', 'ef092fbc62b691e3e3fc71ab795d804c');
INSERT INTO `t_role_menu` VALUES ('c78038f781abcf9cce4bb0e5dd52fab5', 'c461de8f2c2fde0cf8c21f11183a48f1', '1b5ac3fe6a43c8d520d127f04259e567');
INSERT INTO `t_role_menu` VALUES ('c7da07b3570b9f31b9c44084070c4630', '1', '8c7fb301d2aab801523166b601998378');
INSERT INTO `t_role_menu` VALUES ('cbaadaf738bf0d3417e961c74fc3563b', '1', '390a0bed6a293e5554c04cf045331cce');
INSERT INTO `t_role_menu` VALUES ('ccd8cd2a7cceda9545e2e69b46949172', '1', '9eb38e58ce3af6e3831fa824aa2cf65c');
INSERT INTO `t_role_menu` VALUES ('cf1001597ba66dd48c905336cd4d3c35', '03813f0a83f7c1b2a377963e54a5c0ee', 'abaa6ba76d8d62210fae4a9d7732a9d2');
INSERT INTO `t_role_menu` VALUES ('d98d684954ccb56794153f1832bacb95', '03813f0a83f7c1b2a377963e54a5c0ee', '1b5ac3fe6a43c8d520d127f04259e567');
INSERT INTO `t_role_menu` VALUES ('daf4500f1910b2c7092d79cb8f6ad324', '1', '756ede8d51459b9a012dfdf65226ad13');
INSERT INTO `t_role_menu` VALUES ('dbc4254a5977fcef424b8c28fed0d173', 'c461de8f2c2fde0cf8c21f11183a48f1', 'd560a968eb643c75ae50cb400c2eaa55');
INSERT INTO `t_role_menu` VALUES ('e14ff8d826a04e7d7db64af7d0605c54', '1', '7f98845df2d985a2d95fc9a03100e056');
INSERT INTO `t_role_menu` VALUES ('e39877673bd7b8c5a9f163b5c2b914ba', '03813f0a83f7c1b2a377963e54a5c0ee', 'a039a84bcc967f998e750d30437b6e7f');
INSERT INTO `t_role_menu` VALUES ('e552999eddfa3993493f6b8398cf5433', '1', 'f13e529e880299ec77034821009595bb');
INSERT INTO `t_role_menu` VALUES ('e9882b12c57f07dc3956b69cdf795c3e', 'c461de8f2c2fde0cf8c21f11183a48f1', 'a039a84bcc967f998e750d30437b6e7f');
INSERT INTO `t_role_menu` VALUES ('f3aa0cec8df3e0a9abb7c227b1367459', '1', '63859eed0d24ebb808fc8b1964bd5228');
INSERT INTO `t_role_menu` VALUES ('f6884ababc779b9d48fb351d8842ebb0', '1', '875654754a1588f9e1e40db515f392d8');
INSERT INTO `t_role_menu` VALUES ('f68a7ae7409514f7616ec32869d28f44', 'c461de8f2c2fde0cf8c21f11183a48f1', '178e8858bf5c3734d45bbf617901da2d');
INSERT INTO `t_role_menu` VALUES ('f94d4a3aa9d93fc4065c442cda67ad8c', 'c461de8f2c2fde0cf8c21f11183a48f1', 'abaa6ba76d8d62210fae4a9d7732a9d2');
INSERT INTO `t_role_menu` VALUES ('fd65d02ba396920efaafa2109477c02a', '03813f0a83f7c1b2a377963e54a5c0ee', '63859eed0d24ebb808fc8b1964bd5228');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `USER_ID` varchar(32) NOT NULL,
  `USER_NAME` varchar(255) DEFAULT '' COMMENT '用户名',
  `REAL_NAME` varchar(255) DEFAULT NULL COMMENT '真实姓名',
  `PASSWORD` varchar(255) DEFAULT NULL COMMENT '密码',
  `BIRTHDAY` datetime DEFAULT NULL COMMENT '出生日期',
  `ACCOUNT_STATUS` tinyint(2) DEFAULT NULL COMMENT '用户状态',
  `AVATAR` varchar(1000) DEFAULT NULL COMMENT '头像',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `DEPT_ID` varchar(32) DEFAULT NULL COMMENT '部门Id',
  `USER_TYPE` tinyint(2) DEFAULT NULL COMMENT '1 系统人员 2 用户',
  `USER_GRADE` tinyint(2) DEFAULT NULL COMMENT '员工级别 1普通技师 2高级技师',
  `USER_NO` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('0385bc1f4be4fe302e933bf0ddc9f4fe', '13837520191', '技师2', '1d6e24bb5c35caf0b7cba196bd7f3a44', null, '1', '', '2020-07-02 17:44:29', '0404039033a71cb92dbf65dcc184ec90', '2', '2', '02');
INSERT INTO `t_user` VALUES ('1', 'admin', '王旭磊', 'c7242b2bc2435c1ead6b89f85d9e6a96', '2019-12-02 00:00:00', '1', '', '2019-12-03 15:14:39', '0404039033a71cb92dbf65dcc184ec90', '1', null, null);
INSERT INTO `t_user` VALUES ('34b4d059536bc3fb4a88bf7e75b44a55', '13837520190', '技师1', '3731c6e752c855f2037a611bb354ae04', null, '1', '', '2020-07-02 15:02:58', '0404039033a71cb92dbf65dcc184ec90', '2', '1', '01');
INSERT INTO `t_user` VALUES ('8f5fc1547d5edef18e64708220b94b54', '13837520193', '技师3', 'ec97a1357392c9e990ec54512ebb8e1a', null, '1', '', '2020-07-02 17:44:48', '0404039033a71cb92dbf65dcc184ec90', '2', '1', '03');
INSERT INTO `t_user` VALUES ('c10fed62df031e34a657f1d8df4e925b', '13837520194', '技师5', 'ec3ed3c076bd549571a227e7d7940fad', null, '1', '', '2020-07-02 17:45:31', '0404039033a71cb92dbf65dcc184ec90', '2', '1', '05');
INSERT INTO `t_user` VALUES ('d04db334a48790cdd73550bffe285534', '1383752194', '技师4', 'c7ed8c1acdd3e7a6fc660f67f0d37320', null, '1', '', '2020-07-02 17:45:09', '0404039033a71cb92dbf65dcc184ec90', '2', '1', '04');

-- ----------------------------
-- Table structure for t_user_role
-- ----------------------------
DROP TABLE IF EXISTS `t_user_role`;
CREATE TABLE `t_user_role` (
  `ID` varchar(32) NOT NULL,
  `UID` varchar(32) DEFAULT NULL,
  `RID` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户角色表';

-- ----------------------------
-- Records of t_user_role
-- ----------------------------
INSERT INTO `t_user_role` VALUES ('261544e80c1ba1d4c9f815b03c2a4b37', '3ef838d7e188b7904c90533f8d689d55', '03813f0a83f7c1b2a377963e54a5c0ee');
INSERT INTO `t_user_role` VALUES ('271ef4ac657df36d0c5ea87614a2321e', '81844a4c1e403583669d3850fd3c6ed7', '03813f0a83f7c1b2a377963e54a5c0ee');
INSERT INTO `t_user_role` VALUES ('57b87ce6bb34bdbed10958e0ef3951bd', '321ab468ac1c054232570c5c5538ce38', '03813f0a83f7c1b2a377963e54a5c0ee');
INSERT INTO `t_user_role` VALUES ('64ed626f534e9395bdb7e44b43972314', '74994e768f39d387e6193e06e476d680', '03813f0a83f7c1b2a377963e54a5c0ee');
INSERT INTO `t_user_role` VALUES ('819d20e1417b3c11be5135a984f9881a', 'c0169915834b22bdd118b77f49f494ab', '1');
INSERT INTO `t_user_role` VALUES ('cee1c2257dae81619ba120820578be14', '1', '1');
INSERT INTO `t_user_role` VALUES ('ea58b254f0c5a7d0f0568d54259edbdf', '0103b0811c5fcf5759ea2c66369e5863', '03813f0a83f7c1b2a377963e54a5c0ee');
INSERT INTO `t_user_role` VALUES ('ec791a8809f1bb9a164cf01ad9d73b23', 'c3a001656a3907c2ed8ea308643f436d', '03813f0a83f7c1b2a377963e54a5c0ee');

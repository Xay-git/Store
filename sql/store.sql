/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50710
Source Host           : localhost:3306
Source Database       : store

Target Server Type    : MYSQL
Target Server Version : 50710
File Encoding         : 65001

Date: 2020-04-25 17:54:50
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for business_member
-- ----------------------------
DROP TABLE IF EXISTS `business_member`;
CREATE TABLE `business_member` (
  `ID` varchar(255) NOT NULL COMMENT 'ID',
  `NAME` varchar(255) DEFAULT NULL COMMENT '姓名',
  `BALANCE` decimal(20,2) DEFAULT '0.00' COMMENT '余额',
  `SEX` varchar(255) DEFAULT NULL COMMENT '性别',
  `BIRTHDAY` datetime DEFAULT NULL COMMENT '出生年月',
  `PHONE_NUMBER` varchar(18) DEFAULT NULL COMMENT '手机号',
  `ADDRESS` varchar(255) DEFAULT NULL COMMENT '家庭住址',
  `COME_FROM` varchar(255) DEFAULT NULL COMMENT '客户来源',
  `DEPT_ID` bigint(20) DEFAULT NULL COMMENT '所属门店',
  `INVITER` varchar(255) DEFAULT NULL COMMENT '邀请人',
  `MEMBER_STATUS` varchar(255) DEFAULT NULL COMMENT '会员状态(1,正常2,冻结)',
  `REMARK` varchar(255) DEFAULT NULL COMMENT '备注',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `AVATAR` text COMMENT '头像',
  `INVITER_ID` varchar(32) DEFAULT NULL COMMENT '邀请人ID',
  `USER_ID` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `SMS_ALERT` varchar(255) DEFAULT NULL COMMENT '短信提醒',
  `OPEN_ID` varchar(255) DEFAULT NULL COMMENT 'openId',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会员表';

-- ----------------------------
-- Records of business_member
-- ----------------------------

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
  PRIMARY KEY (`DEPT_ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='部门表';

-- ----------------------------
-- Records of t_dept
-- ----------------------------
INSERT INTO `t_dept` VALUES ('24c43877d7cc4e1a4b7957a4324843a3', '0', '0', '总店', '1', '2020-01-15 09:58:38', '2020-04-25 16:22:13');

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
INSERT INTO `t_dict` VALUES ('0c6fa308e608d160ecfc5e1bd7c80915', '100edb6ca33a00a5bf28d6592738523c', '01', 'java', null, null, '2020-01-14 15:59:25');
INSERT INTO `t_dict` VALUES ('14cf6666e3b857186d22e45bd00a03fc', 'bab335395f4601b68977eb37e0f20431', '01', '支付宝支付', '1', '支付宝支付', '2019-12-17 09:56:35');
INSERT INTO `t_dict` VALUES ('6bf2f9bf0e35e5578ddecc7f2d763ed1', '072bc1f49bd310dfbe5773062e83684f', '01', '上门客人', '1', '上门客人', '2019-12-27 03:23:29');
INSERT INTO `t_dict` VALUES ('80849d8869ccc24dbc6f4a1b0ad2869b', '072bc1f49bd310dfbe5773062e83684f', '05', '美团', '5', '美团', '2019-12-27 03:25:59');
INSERT INTO `t_dict` VALUES ('817e3f4683aac952d3a14689da4df0b7', '072bc1f49bd310dfbe5773062e83684f', '06', '支付宝', '6', '支付宝', '2019-12-27 03:26:18');
INSERT INTO `t_dict` VALUES ('92e3119ad443a02c7a468a99a6aa35a1', '072bc1f49bd310dfbe5773062e83684f', '04', '大众点评', '4', '大众点评', '2019-12-27 03:25:49');
INSERT INTO `t_dict` VALUES ('94d43fe61b6e36c967616db8aae356df', '072bc1f49bd310dfbe5773062e83684f', '03', '客带客', '3', '客带客', '2019-12-27 03:25:37');
INSERT INTO `t_dict` VALUES ('c4405fe3289b8807c7fd186f1ea772f0', '072bc1f49bd310dfbe5773062e83684f', '02', '员工带客', '2', '员工带客', '2019-12-27 03:24:07');
INSERT INTO `t_dict` VALUES ('c6a924d457da38a163a6a4d7650286de', '100edb6ca33a00a5bf28d6592738523c', '02', 'springboot', null, null, '2020-01-14 15:59:33');
INSERT INTO `t_dict` VALUES ('c7d49be5970734983c2e8d7ac3b7b849', 'bab335395f4601b68977eb37e0f20431', '02', '微信支付', '2', '微信支付', '2019-12-17 01:55:09');

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
INSERT INTO `t_file_info` VALUES ('3e68156a4c011e9d22674a2d4b5fd996', 'cf03621340c8cdad5b6adc040992de30', null, 'ningshoutang.png', 'png', '474', '3e68156a4c011e9d22674a2d4b5fd996.png', '/upload/avatar/3e68156a4c011e9d22674a2d4b5fd996.png', '2020-01-15 16:45:35', null, '1', null, '1', 'd:\\sweet\\avatar\\3e68156a4c011e9d22674a2d4b5fd996.png');
INSERT INTO `t_file_info` VALUES ('cf03621340c8cdad5b6adc040992de30', '/', null, 'avatar', 'dir', null, 'avatar', null, '2020-01-15 16:44:15', null, null, null, '0', 'd:\\sweet\\avatar');
INSERT INTO `t_file_info` VALUES ('f6559da69635590ae2883fc874521ec4', 'cf03621340c8cdad5b6adc040992de30', null, 'message.png', 'png', '2', 'f6559da69635590ae2883fc874521ec4.png', '/upload/avatar/f6559da69635590ae2883fc874521ec4.png', '2020-01-15 16:47:44', null, '1', null, '1', 'd:\\sweet\\avatar\\f6559da69635590ae2883fc874521ec4.png');

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
INSERT INTO `t_menu` VALUES ('0bf58ce456662b9f186683e41df1d92d', '5ad3caa634c441a58118ec2ffb424ee7', '部门管理', '/admin/dept', null, null, '0', '2', '2019-12-02 11:05:45', null);
INSERT INTO `t_menu` VALUES ('0c6bce3dd7d7a352acfbfcba16617709', '5ad3caa634c441a58118ec2ffb424ee7', '菜单管理', '/admin/menu', null, null, '0', '1', '2019-12-02 11:02:38', null);
INSERT INTO `t_menu` VALUES ('16446826125a42216f692db7db5fd91c', '5ad3caa634c441a58118ec2ffb424ee7', '用户管理', '/admin/user', null, null, '0', '3', '2019-12-02 11:09:16', null);
INSERT INTO `t_menu` VALUES ('1649ebe3eeb624b25e5914d8b1ce904b', '5ad3caa634c441a58118ec2ffb424ee7', '角色管理', '/admin/role', null, null, '0', '4', '2019-12-02 11:09:38', null);
INSERT INTO `t_menu` VALUES ('1f4efbedfbed0c9b1c8d6f56ea789f91', '881bac77e0690244cba83867665ffb5a', '代码生成', '/admin/gen', null, null, '0', '1', '2019-12-02 11:34:42', null);
INSERT INTO `t_menu` VALUES ('393f9ed5e481494bcb8a14599272c68e', '5ad3caa634c441a58118ec2ffb424ee7', '数据字典', '/admin/dictType/dictType_list', '', '', '0', '6', '2019-12-16 05:01:32', '2019-12-16 10:00:25');
INSERT INTO `t_menu` VALUES ('5ad3caa634c441a58118ec2ffb424ee7', '0', '系统管理', null, null, 'layui-icon-set', '0', '1', '2019-12-02 10:40:33', '2019-12-03 15:19:55');
INSERT INTO `t_menu` VALUES ('63859eed0d24ebb808fc8b1964bd5228', '0', '会员管理', '', '', 'layui-icon-username', '0', '0', '2020-04-25 16:33:50', '2020-04-25 16:35:56');
INSERT INTO `t_menu` VALUES ('881bac77e0690244cba83867665ffb5a', '0', '开发工具', null, null, 'layui-icon-util', '0', '2', '2019-12-02 11:34:22', null);
INSERT INTO `t_menu` VALUES ('8c7fb301d2aab801523166b601998378', '5ad3caa634c441a58118ec2ffb424ee7', '在线用户', '/admin/online', null, null, '0', '5', '2019-12-06 18:26:56', null);
INSERT INTO `t_menu` VALUES ('9eb38e58ce3af6e3831fa824aa2cf65c', '0', '微信营销', null, null, 'layui-icon-login-wechat', '0', '3', '2019-12-04 16:10:39', null);
INSERT INTO `t_menu` VALUES ('ad30e1e6db74ac19d0f628f5df8c1c68', '881bac77e0690244cba83867665ffb5a', '接口文档', '/swagger-ui.html', null, null, '0', '2', '2019-12-05 11:08:22', null);
INSERT INTO `t_menu` VALUES ('bf898831f47af15bde3a03ae6924c549', '63859eed0d24ebb808fc8b1964bd5228', '会员列表', '/admin/member/member_list', '', '', '0', '0', '2020-04-25 16:34:27', '2020-04-25 16:35:36');
INSERT INTO `t_menu` VALUES ('ef092fbc62b691e3e3fc71ab795d804c', '9eb38e58ce3af6e3831fa824aa2cf65c', '公众号管理', '/admin/wxmenu', '', '', '0', '1', '2019-12-04 16:17:11', '2020-01-09 01:45:29');

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
INSERT INTO `t_role` VALUES ('1', 'admin', '超级管理员', '2019-12-02 10:23:49');
INSERT INTO `t_role` VALUES ('2', 'test', '测试角色', '2019-12-02 10:23:52');

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
INSERT INTO `t_role_menu` VALUES ('00dad75b806281604c1395128311d85e', '1', '0718706302ad70da58dae8bee3181dda');
INSERT INTO `t_role_menu` VALUES ('26a951c4ea58a1a182718f9397220d9a', '1', '881bac77e0690244cba83867665ffb5a');
INSERT INTO `t_role_menu` VALUES ('2a30905af1a6f374fef70d81f7104d0f', '1', '0c6bce3dd7d7a352acfbfcba16617709');
INSERT INTO `t_role_menu` VALUES ('301ec417323616126e8521cf7a7069dd', '1', '9eb38e58ce3af6e3831fa824aa2cf65c');
INSERT INTO `t_role_menu` VALUES ('488466138b623750cde08ed51d0c701f', '1', '1f4efbedfbed0c9b1c8d6f56ea789f91');
INSERT INTO `t_role_menu` VALUES ('599809e5e09ee2575606da55a6c4a763', '1', 'bf898831f47af15bde3a03ae6924c549');
INSERT INTO `t_role_menu` VALUES ('752a2265fdce4b9b693521fbd9214648', '2', '5ad3caa634c441a58118ec2ffb424ee7');
INSERT INTO `t_role_menu` VALUES ('79f7e5bf1e0b2eec4d36b3b76a1ddbc6', '1', '1649ebe3eeb624b25e5914d8b1ce904b');
INSERT INTO `t_role_menu` VALUES ('9a15e1655a08ceb3cf24bde19d1131ca', '1', 'ad30e1e6db74ac19d0f628f5df8c1c68');
INSERT INTO `t_role_menu` VALUES ('a1b39d90156c4a7cc8eac567cd304bd6', '1', 'ef092fbc62b691e3e3fc71ab795d804c');
INSERT INTO `t_role_menu` VALUES ('b361a087d2a74eab8d02d1b06f4d5486', '1', '8c7fb301d2aab801523166b601998378');
INSERT INTO `t_role_menu` VALUES ('bf6e51432877014a3fb5be391a0410f4', '2', '16446826125a42216f692db7db5fd91c');
INSERT INTO `t_role_menu` VALUES ('c8786e7e7094aa3368567141ecac3018', '1', '5ad3caa634c441a58118ec2ffb424ee7');
INSERT INTO `t_role_menu` VALUES ('d6242e17c2239260e343a07172402a1f', '1', '393f9ed5e481494bcb8a14599272c68e');
INSERT INTO `t_role_menu` VALUES ('d6b49053bb354f83f179a910d182ae40', '1', '63859eed0d24ebb808fc8b1964bd5228');
INSERT INTO `t_role_menu` VALUES ('eab73f5f5a634fa60c03d5f9f81706d7', '1', '16446826125a42216f692db7db5fd91c');
INSERT INTO `t_role_menu` VALUES ('f2a55f247a8d9de461fd31632786bf47', '1', '0bf58ce456662b9f186683e41df1d92d');
INSERT INTO `t_role_menu` VALUES ('f3e4f62c85e884f516d6945ae3c52005', '2', '1649ebe3eeb624b25e5914d8b1ce904b');

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
  PRIMARY KEY (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', 'admin', '王旭磊', 'c7242b2bc2435c1ead6b89f85d9e6a96', '2019-12-02 00:00:00', '1', '', '2019-12-03 15:14:39', '24c43877d7cc4e1a4b7957a4324843a3', '1');
INSERT INTO `t_user` VALUES ('9270c3ce9a5dca2ebcf412fd8cb88566', 'test', '测试', '9428ddf84c99cdfd521d326455de18b2', '2020-01-15 00:00:00', '1', '', '2020-01-15 17:20:57', '24c43877d7cc4e1a4b7957a4324843a3', '1');

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
INSERT INTO `t_user_role` VALUES ('2c19bb75708a81bdacd1c9da9aaf3159', '9270c3ce9a5dca2ebcf412fd8cb88566', '2');
INSERT INTO `t_user_role` VALUES ('3bcd3ea138497c203a4325b090303277', 'd220e9c5e748136fedfe14babb3c4ab5', '2');
INSERT INTO `t_user_role` VALUES ('819d20e1417b3c11be5135a984f9881a', 'c0169915834b22bdd118b77f49f494ab', '1');
INSERT INTO `t_user_role` VALUES ('b2a2f3a90c68dd120007fd9d2d9c33bd', 'f8afb945878ef6548cb71bb782eb842c', '2');
INSERT INTO `t_user_role` VALUES ('b69dcc236cf975a4c832b7ebceffd889', '383fdad03d7d1573e45ce5de7e49ef99', '2');
INSERT INTO `t_user_role` VALUES ('c70316f22294e7869fa9f9bc3c098950', '7f50d476d439534feef16728613e2396', '2');
INSERT INTO `t_user_role` VALUES ('cc4796dc8c6a59cd98d65b5bf03f5b3d', '1', '1');

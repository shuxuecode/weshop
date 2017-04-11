-- MySQL dump 10.13  Distrib 5.1.30, for unknown-linux-gnu (x86_64)
--
-- Host: 10.50.141.51    Database: LTJipziUmrLnmvJKbwpd
-- ------------------------------------------------------
-- Server version	5.5.35-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `applyarticlesversion`
--

DROP TABLE IF EXISTS `applyarticlesversion`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `applyarticlesversion` (
  `id` varchar(36) NOT NULL,
  `applyId` varchar(36) DEFAULT NULL,
  `modifyUser` varchar(100) DEFAULT NULL,
  `modifyTime` varchar(19) DEFAULT NULL,
  `audit` varchar(10) DEFAULT NULL,
  `auditAdvise` varchar(1000) DEFAULT NULL,
  `remark` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Reference_9` (`applyId`),
  CONSTRAINT `FK_Reference_9` FOREIGN KEY (`applyId`) REFERENCES `articlesapply` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `applyarticlesversion`
--

LOCK TABLES `applyarticlesversion` WRITE;
/*!40000 ALTER TABLE `applyarticlesversion` DISABLE KEYS */;
/*!40000 ALTER TABLE `applyarticlesversion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `articlesapply`
--

DROP TABLE IF EXISTS `articlesapply`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `articlesapply` (
  `id` varchar(36) NOT NULL,
  `msgId` varchar(36) DEFAULT NULL,
  `applyUser` varchar(36) DEFAULT NULL,
  `applyReason` varchar(1000) DEFAULT NULL,
  `applyTime` varchar(36) DEFAULT NULL,
  `owner` varchar(36) DEFAULT NULL,
  `statusId` int(1) DEFAULT NULL,
  `remark` varchar(1000) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `FK_Reference_7` (`msgId`),
  KEY `FK_Reference_8` (`statusId`),
  CONSTRAINT `FK_Reference_7` FOREIGN KEY (`msgId`) REFERENCES `message` (`id`),
  CONSTRAINT `FK_Reference_8` FOREIGN KEY (`statusId`) REFERENCES `currentstatus` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `articlesapply`
--

LOCK TABLES `articlesapply` WRITE;
/*!40000 ALTER TABLE `articlesapply` DISABLE KEYS */;
INSERT INTO `articlesapply` VALUES ('06747cfa-b2a5-43de-a255-0d4b8ce2d5ac','0245aeb3-e70d-4a7a-a0dd-b59897a72201','0001',NULL,'2014-07-24 13:51:56','0001',0,NULL),('1bb7b793-7e32-4dff-8e8a-050f0c6d7e06','2ced3e03-5944-4577-bf58-ee667cb9ec4b','64e8cb04-c3f6-4a0e-9b04-127fed60a31c',NULL,'2014-08-29 16:15:31','64e8cb04-c3f6-4a0e-9b04-127fed60a31c',0,NULL),('396f0113-6777-44f7-a763-bfee22393c0c','dc07ab98-6ce5-49e6-ad09-276ac52ba332','0001',NULL,'2014-07-12 13:44:27','0001',3,NULL),('8888','1002','0001',NULL,NULL,'0002',0,'0'),('9999','1001','0001',NULL,NULL,'0001',3,'0'),('a3ed8c0a-55c0-4e35-a6f3-f42974d4ee77','c0020c3d-d902-4170-8123-20c9711df7e1','0001',NULL,'2014-07-23 10:42:13','0003',0,NULL),('a4dc7a74-f11a-4968-9ef0-6e12d55d4e32','a7db1365-67f2-4600-af99-21ada6875aa9','0001',NULL,'2014-07-24 12:49:01','0001',0,NULL),('b5fbc98a-7000-4455-b3f3-1d4737eb8fef','9c872ee4-3a61-4e83-8fc4-eebdd7007997','0001',NULL,'2014-07-11 15:50:29','0002',0,NULL),('dd243617-e29f-4c95-bb51-fc57536b370c','d553497b-bccb-4568-9967-2e5f28629be8','0001',NULL,'2014-07-24 13:03:44','0001',0,NULL),('f64ff806-bfaa-4da4-869f-136d158995fe','502d40a6-ac2c-4351-b32d-f6dff035436f','0002',NULL,'2014-07-24 13:16:30','0002',0,NULL),('fdae16e3-1802-4d2c-a683-d3b44d34701f','40cb44bd-7bc2-49f1-8cd3-1f04bbb9e98e','0001',NULL,'2014-07-05 11:56:01','0001',3,NULL);
/*!40000 ALTER TABLE `articlesapply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currentstatus`
--

DROP TABLE IF EXISTS `currentstatus`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `currentstatus` (
  `id` int(1) NOT NULL,
  `currentStatus` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `currentstatus`
--

LOCK TABLES `currentstatus` WRITE;
/*!40000 ALTER TABLE `currentstatus` DISABLE KEYS */;
INSERT INTO `currentstatus` VALUES (0,'待审批'),(1,'审批中'),(2,'已审批'),(3,'驳回');
/*!40000 ALTER TABLE `currentstatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `message` (
  `id` varchar(36) NOT NULL,
  `createTime` varchar(19) DEFAULT NULL,
  `msgType` varchar(20) DEFAULT NULL,
  `content` varchar(1000) DEFAULT NULL,
  `picUrl` varchar(1000) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `url` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
INSERT INTO `message` VALUES ('0245aeb3-e70d-4a7a-a0dd-b59897a72201','2014-07-24 13:51:56','00000','123123			 		',NULL,'123333333',NULL,NULL),('1001','2014-07-05 08:42:31','消息类型','消息内容',NULL,'消息标题',NULL,NULL),('1002','2014-07-05 08:42:31','消息类型二','消息内容二',NULL,'消息标题二',NULL,NULL),('2ced3e03-5944-4577-bf58-ee667cb9ec4b','2014-08-29 16:15:31','ioio','			 ioioiioioio\r\ngkjkyu\r\n]		',NULL,'uiou',NULL,NULL),('3a57e4b0-79c2-4916-b377-a20b98bc68f4','2014-07-05 11:41:00','11','测试新增	',NULL,'123',NULL,NULL),('40cb44bd-7bc2-49f1-8cd3-1f04bbb9e98e','2014-07-05 11:56:01','1','			 	asfasfsdf	',NULL,'123',NULL,NULL),('502d40a6-ac2c-4351-b32d-f6dff035436f','2014-07-24 13:16:30','22','		123123123	 		',NULL,'072412',NULL,NULL),('9c872ee4-3a61-4e83-8fc4-eebdd7007997','2014-07-11 15:50:29','nono','消息msg	',NULL,'0711ceshi',NULL,NULL),('a7db1365-67f2-4600-af99-21ada6875aa9','2014-07-24 12:49:01','1123','	0724		 		',NULL,'0724',NULL,NULL),('c0020c3d-d902-4170-8123-20c9711df7e1','2014-07-23 10:42:13','123','0723ceshi			 		',NULL,'0723ceshi',NULL,NULL),('d553497b-bccb-4568-9967-2e5f28629be8','2014-07-24 13:03:44','123','123			 		',NULL,'07240',NULL,NULL),('dc07ab98-6ce5-49e6-ad09-276ac52ba332','2014-07-12 13:44:27','11','2323			 		',NULL,'0712ceshi',NULL,NULL),('efeb30ad-85be-4dd0-9ee8-655c50db6459','2014-07-05 11:43:40','11','测试二		',NULL,'121',NULL,NULL);
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tprivilege`
--

DROP TABLE IF EXISTS `tprivilege`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `tprivilege` (
  `id` varchar(36) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL,
  `pid` varchar(36) DEFAULT NULL,
  `createTime` varchar(19) DEFAULT NULL,
  `isCancel` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tprivilege_pid_fk` (`pid`),
  CONSTRAINT `tprivilege_pid_fk` FOREIGN KEY (`pid`) REFERENCES `tprivilege` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `tprivilege`
--

LOCK TABLES `tprivilege` WRITE;
/*!40000 ALTER TABLE `tprivilege` DISABLE KEYS */;
INSERT INTO `tprivilege` VALUES ('0','用户管理模块','user/toUserManager',NULL,NULL,NULL),('044bf184-430e-4eaf-8dea-dd3ec7917b2d','跳转到首页模块(第一项模块)','sys/toSystemManager',NULL,'2014-08-26 14:57:17',NULL),('087b6e90-ce8b-4fc2-b1ef-a285018f1098','添加角色','user/addRole','0','2014-08-26 14:46:04',NULL),('0c3664d1-a695-4833-a0a7-a4b7d8caf1ca','账户管理模块','account/toAccountManager',NULL,'2014-08-26 11:53:59',NULL),('1','跳转到用户列表页面','user/touserShow','0',NULL,NULL),('15f7bbef-5c95-47cc-85b3-cc8871341ac8','驳回申请','msg/refuse','d287722d-6b9f-4724-ba4d-13829e1ab279','2014-08-26 14:50:25',NULL),('197823a9-304a-4984-83bc-1280e4a214fd','跳转到角色管理','account/toroleShow','0c3664d1-a695-4833-a0a7-a4b7d8caf1ca','2014-08-26 12:00:39',NULL),('1a99aec8-e18f-45e8-9949-870a19b72a6b','跳转到修改单条图文页面','msg/updateNewsitem','d287722d-6b9f-4724-ba4d-13829e1ab279','2014-08-26 14:52:04',NULL),('2','获取角色Tree','user/getRoleTree','0',NULL,NULL),('250286e5-9819-4e2d-8e72-b8915639d0bf','获取公共号服务器配置信息页面','account/getInterface','0c3664d1-a695-4833-a0a7-a4b7d8caf1ca','2014-08-26 12:02:31',NULL),('25cfa6ff-8ca9-4a5f-aebe-c167d32353c0','添加二维码','qrcode/addqrcode','3bb3e0a7-74ba-4cc1-b62d-597016afa3b6','2014-08-26 14:56:45',NULL),('2dd8854a-2844-4dd5-8d7d-7830426fb17b','删除菜单','menu/delmenu','3','2014-08-26 14:43:45',NULL),('2fc37774-04b8-45b5-9d49-02934258730d','跳转到智能回复','msg/toSmart','d287722d-6b9f-4724-ba4d-13829e1ab279','2014-08-27 13:37:10',NULL),('3','菜单管理模块','menu/toMenuManager',NULL,NULL,NULL),('35f35f20-746f-4199-bbb6-c3e1c4afd41d','删除二维码','qrcode/delqrcode','3bb3e0a7-74ba-4cc1-b62d-597016afa3b6','2014-08-26 14:56:33',NULL),('36897372-25a5-4e71-b7b3-7f67b8737ff4','根据角色——获取角色权限列表','user/getRolePrivilegeTree','0','2014-08-26 14:46:56',NULL),('37b92e2c-354e-4618-9abc-328f3cba6ece','跳转到关注用户列表','qrcode/touserinfoList','3bb3e0a7-74ba-4cc1-b62d-597016afa3b6','2014-08-26 14:56:07',NULL),('37e1f8e3-a9b3-423a-8c31-08b526f72818','提交申请','msg/msgSubmit','d287722d-6b9f-4724-ba4d-13829e1ab279','2014-08-26 14:50:11',NULL),('3a4b138b-5a7f-4cc4-9bb6-06f361f34fa0','跳转到群发消息预览页面','msg/massShow','d287722d-6b9f-4724-ba4d-13829e1ab279','2014-08-26 14:55:08',NULL),('3bb3e0a7-74ba-4cc1-b62d-597016afa3b6','二维码模块','qrcode/toQrcodeManager',NULL,'2014-08-26 14:55:32',NULL),('3dc7d7cb-ed37-49f1-9aa0-8dc949b8eeb1','修改用户角色','user/updUserRole','0','2014-08-26 17:39:03',NULL),('3ed0b0b4-2838-45d7-ae06-5c43a4d905a1','添加群发消息','msg/addmass','d287722d-6b9f-4724-ba4d-13829e1ab279','2014-08-26 14:54:27',NULL),('4','跳转到我的菜单','menu/toMyMenu','3',NULL,NULL),('4277abc4-c434-4481-ab59-1d50be2497f0','添加自动回复消息','msg/addAutoresponse','d287722d-6b9f-4724-ba4d-13829e1ab279','2014-08-26 14:53:20',NULL),('42dd6a5a-f9ae-4b96-ac35-8784c27e85e6','获取公共号信息页面','account/getInformation','0c3664d1-a695-4833-a0a7-a4b7d8caf1ca','2014-08-26 12:01:46',NULL),('4b6ad3cc-88b6-452b-9033-64cf71d324da','根据消息类别(文本/图文)获取消息模板列表','msg/getTemplateByMsgtype','d287722d-6b9f-4724-ba4d-13829e1ab279','2014-08-26 14:53:10',NULL),('4c464e9a-b864-424e-a27b-0322b0885f79','获取用户列表','user/getUserList','0','2014-08-26 14:45:34',NULL),('4e5ae7f3-00cf-48af-a16e-4ddd1f90f897','跳转到公共号信息页面','sys/toaccountInformation','044bf184-430e-4eaf-8dea-dd3ec7917b2d','2014-08-26 14:57:32',NULL),('4f3b1683-a9a0-4384-8830-b925d787a206','修改角色','user/updRole','0','2014-08-26 14:46:15',NULL),('5','显示主菜单页面','menu/toMainMenuTable','3',NULL,NULL),('5275b735-1355-464d-b7ec-33e82914f9c5','账户列表','account/datagrid','0c3664d1-a695-4833-a0a7-a4b7d8caf1ca','2014-08-26 12:01:33',NULL),('56fba4be-edfd-455b-ba57-63a475d64b1a','跳转到在线用户展示页面','sys/toonlineList','044bf184-430e-4eaf-8dea-dd3ec7917b2d','2014-08-26 14:57:44',NULL),('6','显示子菜单页面','menu/tosubMenuTable','3',NULL,NULL),('61a252ba-14cf-42c8-b8c0-2d16af1e14f1','跳转到图文消息列表','msg/tonewsTemplateList','d287722d-6b9f-4724-ba4d-13829e1ab279','2014-08-26 14:49:49',NULL),('61d4960f-4fef-4215-8363-19f30da9435b','跳转到分组','msg/togroupList','d287722d-6b9f-4724-ba4d-13829e1ab279','2014-08-26 14:49:27',NULL),('6613bd5f-a316-496e-9af5-044d01522a3c','关注者列表','qrcode/userinfoDatagrid','3bb3e0a7-74ba-4cc1-b62d-597016afa3b6','2014-08-26 14:56:57',NULL),('67867ff4-ec44-43be-b4c2-8b27f170737f','跳转到权限管理','account/toprivilegeShow','0c3664d1-a695-4833-a0a7-a4b7d8caf1ca','2014-08-26 12:01:17',NULL),('727702df-60ae-419b-a8e6-916a30fa3d7b','删除自动回复消息','msg/delAutoresponse','d287722d-6b9f-4724-ba4d-13829e1ab279','2014-08-26 14:53:32',NULL),('73429d73-a7a8-425a-8094-10fa1b7ae5c5','我的消息列表','msg/getMsgList','d287722d-6b9f-4724-ba4d-13829e1ab279','2014-08-26 14:50:00',NULL),('745f21cb-c578-4126-a9be-6d174213b43a','修改权限','user/updPrivilege','0','2014-08-26 14:47:39',NULL),('7ac85472-167f-42d5-9199-feafb52695f5','自动回复消息列表','msg/autoresponseDatagrid','d287722d-6b9f-4724-ba4d-13829e1ab279','2014-08-26 14:52:59',NULL),('7cd9b760-4d2f-429b-a519-1b24da1555a0','删除单条图文','msg/delNewsitem','d287722d-6b9f-4724-ba4d-13829e1ab279','2014-08-26 14:52:27',NULL),('7cec93be-dd4e-4464-8bfb-ebab47d02c04','删除图文消息','msg/delNewstemplate','d287722d-6b9f-4724-ba4d-13829e1ab279','2014-08-26 14:52:49',NULL),('7e24d530-26be-4a07-b36d-c80bac7ae19a','添加权限','user/addPrivilege','0','2014-08-26 14:47:29',NULL),('84b1ac15-f7b5-4ffd-8a07-552c0acb03af','文本消息列表','msg/texttemplateDatagrid','d287722d-6b9f-4724-ba4d-13829e1ab279','2014-08-26 14:50:48',NULL),('8548619f-b528-481b-85f7-871ddcc5d2b9','图文消息展示','msg/showMessage','d287722d-6b9f-4724-ba4d-13829e1ab279','2014-08-26 14:51:43',NULL),('8598e757-e82f-4c2e-afea-15cc9fe19481','修改公共号信息页面','account/updateInformation','0c3664d1-a695-4833-a0a7-a4b7d8caf1ca','2014-08-26 12:02:01',NULL),('87c0ac9f-66ba-4ef6-b593-8a7f411c3417','二维码列表','qrcode/qrcodeDatagrid','3bb3e0a7-74ba-4cc1-b62d-597016afa3b6','2014-08-26 14:56:18',NULL),('8c1f62cb-5043-4a47-bb25-ef1bbe123ed8','按分组群发消息','mass/groupsend','d287722d-6b9f-4724-ba4d-13829e1ab279','2014-08-28 10:31:38',NULL),('959de020-16b2-4a59-a9d0-795fd38c3a55','修改角色权限','user/updateRolePrivilege','0','2014-08-26 14:47:06',NULL),('96eb3efb-8080-43f3-8151-abc312a08b74','添加消息','msg/addMsg','d287722d-6b9f-4724-ba4d-13829e1ab279','2014-08-26 14:50:36',NULL),('99','菜单同步操作','menuController/sync','3',NULL,NULL),('9d9d6582-aa8d-4c70-b14f-57929e9079d7','保存公共号信息','account/saveInformation','0c3664d1-a695-4833-a0a7-a4b7d8caf1ca','2014-08-26 12:02:16',NULL),('a2ddd650-f071-4c0b-ab8d-8d52df4736e5','跳转到自动回复消息列表(关键字管理)','msg/toautoresponseList','d287722d-6b9f-4724-ba4d-13829e1ab279','2014-08-26 14:49:03',NULL),('a8b3e4b5-739b-4669-9292-bc5e4d8e19b5','获取权限树——父节点','user/getParentPrivilegeTree','0','2014-08-26 14:47:18',NULL),('afb5a576-ab30-4638-bb31-f01be34d76dd','跳转到群发消息列表','msg/tomassList','d287722d-6b9f-4724-ba4d-13829e1ab279','2014-08-26 14:49:15',NULL),('affec0ac-f1b6-4fc0-ace1-2e367e8fccea','跳转到二维码列表','qrcode/toqrcodeList','3bb3e0a7-74ba-4cc1-b62d-597016afa3b6','2014-08-26 14:55:54',NULL),('b311ca5c-1f1f-41c4-93d5-e4533bbd8a52','添加群发消息——图文','msg/addMassNews','d287722d-6b9f-4724-ba4d-13829e1ab279','2014-08-26 14:54:57',NULL),('b454c3b0-4e85-45d8-b038-6bea04636537','删除群发消息','msg/delmass','d287722d-6b9f-4724-ba4d-13829e1ab279','2014-08-26 14:54:37',NULL),('b616cef4-d369-4af1-a858-cbc6189d6dd2','添加单条图文','msg/addWxNewsitem','d287722d-6b9f-4724-ba4d-13829e1ab279','2014-08-26 14:51:54',NULL),('b9f512ab-8b93-42c6-855d-610a626b022c','删除权限','user/delPrivilege','0','2014-08-26 14:47:49',NULL),('ba0601fb-26c9-4439-aca7-5b8604c438d0','跳转到公共号管理','account/toaccountShow','0c3664d1-a695-4833-a0a7-a4b7d8caf1ca','2014-08-26 11:54:53',NULL),('c10a7857-2906-442e-bce2-38e95ab31db3','在线用户列表','sys/online','044bf184-430e-4eaf-8dea-dd3ec7917b2d','2014-08-26 14:57:55',NULL),('c4d5caf2-3b49-4614-92c0-3287b5694f3b','获取权限列表','user/getPrivilegeTree','0','2014-08-26 14:46:44',NULL),('c7f79fce-9905-4e64-b378-9038c20c83c0','添加图文消息','msg/addNewstemplate','d287722d-6b9f-4724-ba4d-13829e1ab279','2014-08-26 14:51:32',NULL),('d1c40a6e-0d80-43fe-a3cc-5bf96383cd5f','获取角色列表','user/getRoleList','0','2014-08-26 14:45:50',NULL),('d287722d-6b9f-4724-ba4d-13829e1ab279','消息管理模块','msg/toMsgManager',NULL,'2014-08-26 14:48:20',NULL),('d4250b49-1315-49d5-a859-6612b21b15ac','删除角色','user/delRole','0','2014-08-26 14:46:29',NULL),('da94fbd4-4888-4609-aa11-2f52b3a35836','加载我的菜单显示页面','menu/mymenu','3','2014-08-26 14:42:58',NULL),('dc266e27-9a70-4ef5-84a3-64e938f77125','修改单条图文','msg/updNewsitem','d287722d-6b9f-4724-ba4d-13829e1ab279','2014-08-26 14:52:37',NULL),('de401278-db80-45a1-a5a0-9db47fc72052','跳转到消息列表','msg/tomsgShow','d287722d-6b9f-4724-ba4d-13829e1ab279','2014-08-26 14:48:43',NULL),('e9bd9d29-fd9b-44b9-95ad-d091f49679a0','群发消息列表','msg/massDatagrid','d287722d-6b9f-4724-ba4d-13829e1ab279','2014-08-26 14:53:43',NULL),('edc36c19-a73b-4fd2-a143-e9e05bf0f577','添加菜单','menu/add','3','2014-08-26 14:43:32',NULL),('eeb501d8-f197-437d-b860-618d1d6c4ae9','删除文本消息','msg/delTexttemplate','d287722d-6b9f-4724-ba4d-13829e1ab279','2014-08-26 14:50:58',NULL),('f0c76abf-8ffa-49e8-84ab-5fb790f51955','修改我的菜单','menu/update','3','2014-08-26 14:43:19',NULL),('f148dc58-9a3e-4621-a51d-80e649919a49','添加文本消息','msg/addTexttemplate','d287722d-6b9f-4724-ba4d-13829e1ab279','2014-08-26 14:51:11',NULL),('f1e90b4e-8991-42dc-b390-0c92c4ef3332','跳转到文本消息列表','msg/totextTemplateList','d287722d-6b9f-4724-ba4d-13829e1ab279','2014-08-26 14:49:38',NULL),('f8cca798-0a8d-48a7-80f7-e99dfc197b1e','一条群发消息的内容列表','msg/articleDatagrid','d287722d-6b9f-4724-ba4d-13829e1ab279','2014-08-26 14:54:48',NULL),('f9aa1dc5-5263-4628-be12-13ffa3534ccf','按OpenId群发消息','mass/openidsend','d287722d-6b9f-4724-ba4d-13829e1ab279','2014-08-29 09:34:00',NULL),('fa346d76-85ed-49ec-8995-0717b93e60f1','图文消息列表','msg/newstemplateDatagrid','d287722d-6b9f-4724-ba4d-13829e1ab279','2014-08-26 14:51:21',NULL),('fd588079-f807-477a-8300-c003dd347d45','获取分组信息列表','msg/groupDatagrid','d287722d-6b9f-4724-ba4d-13829e1ab279','2014-08-27 09:30:50',NULL);
/*!40000 ALTER TABLE `tprivilege` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trole`
--

DROP TABLE IF EXISTS `trole`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `trole` (
  `id` varchar(36) NOT NULL,
  `roleName` varchar(100) DEFAULT NULL,
  `roleNumber` varchar(3) DEFAULT NULL,
  `isCancel` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `trole`
--

LOCK TABLES `trole` WRITE;
/*!40000 ALTER TABLE `trole` DISABLE KEYS */;
INSERT INTO `trole` VALUES ('8833bbaa-2547-4da6-ba4c-94796ec0c36a','体验用户','2',NULL),('super','超级管理员','1','0');
/*!40000 ALTER TABLE `trole` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trole_privilege`
--

DROP TABLE IF EXISTS `trole_privilege`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `trole_privilege` (
  `id` varchar(36) NOT NULL,
  `roleId` varchar(36) DEFAULT NULL,
  `privilegeId` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Reference_3` (`roleId`),
  KEY `FK_Reference_4` (`privilegeId`),
  CONSTRAINT `FK_Reference_3` FOREIGN KEY (`roleId`) REFERENCES `trole` (`id`),
  CONSTRAINT `FK_Reference_4` FOREIGN KEY (`privilegeId`) REFERENCES `tprivilege` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `trole_privilege`
--

LOCK TABLES `trole_privilege` WRITE;
/*!40000 ALTER TABLE `trole_privilege` DISABLE KEYS */;
INSERT INTO `trole_privilege` VALUES ('002c496e-cc68-4db7-908d-f1b87a93a928','super','f1e90b4e-8991-42dc-b390-0c92c4ef3332'),('03648958-9cde-43e5-b202-d92e5af36f17','super','da94fbd4-4888-4609-aa11-2f52b3a35836'),('0f1a70a5-a9bb-4cd5-bd61-41cd6f055f4f','super','1'),('14913b1e-3ac6-418b-8df8-816f08f2e13d','8833bbaa-2547-4da6-ba4c-94796ec0c36a','4e5ae7f3-00cf-48af-a16e-4ddd1f90f897'),('150778a8-9960-4b9f-97ba-0de42605966f','super','a2ddd650-f071-4c0b-ab8d-8d52df4736e5'),('15a9cb92-0425-4319-9620-66453fc7723f','super','8c1f62cb-5043-4a47-bb25-ef1bbe123ed8'),('16679a21-b745-427a-9d13-3f99a0b818c6','super','3dc7d7cb-ed37-49f1-9aa0-8dc949b8eeb1'),('16f8b955-b838-4ceb-b3f9-b8d48a15a375','super','727702df-60ae-419b-a8e6-916a30fa3d7b'),('19d2333e-2238-4f3b-a46f-607b6137dbb0','super','b9f512ab-8b93-42c6-855d-610a626b022c'),('1b1e8694-95f8-4d3b-8f13-4c3d9a5b46e9','super','7ac85472-167f-42d5-9199-feafb52695f5'),('1ca80981-6325-49bc-afcd-e7c026ab8dcf','super','b616cef4-d369-4af1-a858-cbc6189d6dd2'),('1da8c0d4-d208-43c5-b12b-2576dcf00e4b','super','087b6e90-ce8b-4fc2-b1ef-a285018f1098'),('2193bae3-1f80-4b53-b172-6ea90a7af06b','super','b454c3b0-4e85-45d8-b038-6bea04636537'),('267908b5-e998-45a5-8f39-51dac120dd80','super','6'),('269b8506-e1be-410d-b6a5-7e2f3356d07a','super','99'),('2bbbdb12-5304-4a05-b779-e03d9d98cdac','super','67867ff4-ec44-43be-b4c2-8b27f170737f'),('2ee7dd5a-e02e-45b1-9b7e-60fe7047579a','super','edc36c19-a73b-4fd2-a143-e9e05bf0f577'),('31ef4d28-b5d1-49e8-be2b-56692e5169ef','super','15f7bbef-5c95-47cc-85b3-cc8871341ac8'),('323a62f0-1bc5-4833-8efe-e4e4c9583ffc','super','4b6ad3cc-88b6-452b-9033-64cf71d324da'),('35c51a0a-bd09-4d29-ad41-2db40bf72c13','super','f0c76abf-8ffa-49e8-84ab-5fb790f51955'),('3994ec03-287e-4a72-9e14-94f42ce2a153','super','96eb3efb-8080-43f3-8151-abc312a08b74'),('3eddb1dd-d7cd-45c4-b1b0-6ee90f6853cc','super','197823a9-304a-4984-83bc-1280e4a214fd'),('413a3b9a-5d67-48ae-9348-b64603fd0638','super','affec0ac-f1b6-4fc0-ace1-2e367e8fccea'),('4748fbee-70b5-49e3-be36-2304168f8f70','super','745f21cb-c578-4126-a9be-6d174213b43a'),('489e8ad7-5db1-40b0-84d9-0c11259c835c','super','42dd6a5a-f9ae-4b96-ac35-8784c27e85e6'),('4b009d25-2199-4d53-aaaf-f8d7080b7053','super','4277abc4-c434-4481-ab59-1d50be2497f0'),('4be4c4da-981b-4815-9424-915f636df348','super','d1c40a6e-0d80-43fe-a3cc-5bf96383cd5f'),('4d8020cb-e1a0-4256-b90e-08f8e144ca2f','super','3ed0b0b4-2838-45d7-ae06-5c43a4d905a1'),('4ead7c54-a935-4451-bb1c-f74a0cafb105','super','3bb3e0a7-74ba-4cc1-b62d-597016afa3b6'),('4f152664-bb59-4ead-a7ff-e975c1e97a23','super','4e5ae7f3-00cf-48af-a16e-4ddd1f90f897'),('51040dfd-f5f0-436f-af1c-5f7d571cf1e4','super','5'),('5ae2a1fe-ee0a-4131-8a3d-656eb7667046','super','87c0ac9f-66ba-4ef6-b593-8a7f411c3417'),('5b1b3b13-288b-4c3c-a9b7-74143950100e','8833bbaa-2547-4da6-ba4c-94796ec0c36a','044bf184-430e-4eaf-8dea-dd3ec7917b2d'),('5e02d816-6613-4486-b5ce-71ad2bbf8e9e','8833bbaa-2547-4da6-ba4c-94796ec0c36a','250286e5-9819-4e2d-8e72-b8915639d0bf'),('5ede3009-55c3-4fae-9c10-b24ed6be0ca0','super','4f3b1683-a9a0-4384-8830-b925d787a206'),('60c7bd9e-4887-4270-8d7a-7e69bec56c09','super','3bb3e0a7-74ba-4cc1-b62d-597016afa3b6'),('60cd338a-fb96-4f4d-b7aa-c39f04b190ae','super','044bf184-430e-4eaf-8dea-dd3ec7917b2d'),('63f2c33d-e88d-4bb2-bcbf-cc21c8a3a46c','super','fd588079-f807-477a-8300-c003dd347d45'),('655ff44a-38e9-41d8-a76f-b3edc3095a1f','super','7cd9b760-4d2f-429b-a519-1b24da1555a0'),('6d234273-3f7d-47fc-b57c-c614edbcb40f','super','35f35f20-746f-4199-bbb6-c3e1c4afd41d'),('70e74c1a-4c87-49a4-bd94-c5d86b76dd02','super','6613bd5f-a316-496e-9af5-044d01522a3c'),('737d932c-57c8-4dde-b52a-edafe479fe1a','super','61a252ba-14cf-42c8-b8c0-2d16af1e14f1'),('748034b0-da17-47f2-b177-5ce650e3bc46','super','d287722d-6b9f-4724-ba4d-13829e1ab279'),('795b7ee9-53e3-49a0-8551-814554ba0566','super','37e1f8e3-a9b3-423a-8c31-08b526f72818'),('7b05a745-ef6c-4fd6-a6a1-b37040e0d053','super','d287722d-6b9f-4724-ba4d-13829e1ab279'),('7cf084d5-ed2a-4593-9b0e-e628f3b0a341','super','0c3664d1-a695-4833-a0a7-a4b7d8caf1ca'),('7dcd0ec6-95aa-4c64-b4b0-e1c3bed29532','super','c10a7857-2906-442e-bce2-38e95ab31db3'),('7de9113e-463a-411b-8b42-55bd79b0a947','super','3'),('7f73826b-38da-45a4-804a-42aaf4fb1705','super','0'),('81190a0c-54e7-4fb6-afd9-866dd75de7f6','super','0'),('856dd3fa-04ba-43a0-8dc4-ce18b5fec987','super','f8cca798-0a8d-48a7-80f7-e99dfc197b1e'),('8583dcf4-3ed1-41a4-8525-7bd770edfc50','super','f148dc58-9a3e-4621-a51d-80e649919a49'),('87858560-9656-44d6-ae0e-bc8deb88db02','8833bbaa-2547-4da6-ba4c-94796ec0c36a','8598e757-e82f-4c2e-afea-15cc9fe19481'),('8964156f-cf43-4ee5-bcfb-4bb62561462f','super','250286e5-9819-4e2d-8e72-b8915639d0bf'),('8dbb0368-dfc7-4736-ac1f-f3e0eb515958','super','84b1ac15-f7b5-4ffd-8a07-552c0acb03af'),('914fcc08-396d-4b77-ac1d-42fbc6812149','super','5275b735-1355-464d-b7ec-33e82914f9c5'),('91aa228d-5c98-40c3-9e43-ef69f37f8e4a','super','4c464e9a-b864-424e-a27b-0322b0885f79'),('933c3337-8177-4592-87e0-fc24e3a135be','super','c4d5caf2-3b49-4614-92c0-3287b5694f3b'),('972846a5-77e6-45fc-a9a0-683c19d8611c','super','ba0601fb-26c9-4439-aca7-5b8604c438d0'),('97c483a8-0e4c-4d73-b374-93a56b58dcd1','super','3a4b138b-5a7f-4cc4-9bb6-06f361f34fa0'),('a15de8ad-f041-4083-9878-daad418b21bb','super','f9aa1dc5-5263-4628-be12-13ffa3534ccf'),('a2e058d4-8697-431b-bd4a-1da52c380ace','super','7e24d530-26be-4a07-b36d-c80bac7ae19a'),('a321c3a4-df26-408b-9066-a213bcb5d14c','super','d4250b49-1315-49d5-a859-6612b21b15ac'),('a468a607-c2d1-408e-93e3-e95394c2d291','super','56fba4be-edfd-455b-ba57-63a475d64b1a'),('a703f282-cc35-4a06-87d3-13aac42f62cf','super','4'),('a8ee8fb0-6374-4b6c-844e-58ffd69d499c','super','3'),('aace2c3d-7573-4bef-9c7e-7b039b7be2ea','super','61d4960f-4fef-4215-8363-19f30da9435b'),('ab55c5a3-6cc9-464d-9649-f40e868f73f3','8833bbaa-2547-4da6-ba4c-94796ec0c36a','044bf184-430e-4eaf-8dea-dd3ec7917b2d'),('b7d599be-76f4-4913-a83e-3e40ea65475c','super','73429d73-a7a8-425a-8094-10fa1b7ae5c5'),('c04e16ac-671b-4429-8ab7-7b8bc099f93d','super','2fc37774-04b8-45b5-9d49-02934258730d'),('c22ee055-b028-4096-ae0a-ddcce396f9ad','super','b311ca5c-1f1f-41c4-93d5-e4533bbd8a52'),('c48ec050-93c3-45ee-a604-2bf646b3706b','8833bbaa-2547-4da6-ba4c-94796ec0c36a','c10a7857-2906-442e-bce2-38e95ab31db3'),('c65afdb2-8e85-4b03-81c7-09a3f57923c6','super','37b92e2c-354e-4618-9abc-328f3cba6ece'),('d0a6b44e-c7a6-407d-ac11-f4a218369303','super','8548619f-b528-481b-85f7-871ddcc5d2b9'),('d26787f8-2a0d-4170-90c3-edf68a850048','super','0c3664d1-a695-4833-a0a7-a4b7d8caf1ca'),('d72d1a8d-8c44-49e8-b21e-c073b1e0a0d9','super','044bf184-430e-4eaf-8dea-dd3ec7917b2d'),('d7305d7a-d0ae-4a5b-972f-9e98263d5aa4','super','2'),('d73a9770-a6de-4bbf-8f4e-58ccc2ef4421','super','e9bd9d29-fd9b-44b9-95ad-d091f49679a0'),('da33a86d-3360-4805-b743-21858f5dd293','super','9d9d6582-aa8d-4c70-b14f-57929e9079d7'),('deeaeff5-78a6-4b34-800a-d2fd6b049731','8833bbaa-2547-4da6-ba4c-94796ec0c36a','56fba4be-edfd-455b-ba57-63a475d64b1a'),('e3d251ed-98b7-43e4-9f1d-399bd92889ea','super','fa346d76-85ed-49ec-8995-0717b93e60f1'),('e7edee90-d117-44fe-9a76-a58e9550f851','super','dc266e27-9a70-4ef5-84a3-64e938f77125'),('e9685e4c-f84b-4950-90f7-4590e966f11e','8833bbaa-2547-4da6-ba4c-94796ec0c36a','0c3664d1-a695-4833-a0a7-a4b7d8caf1ca'),('e9bfa324-7512-482b-92f5-d020031a130a','super','1a99aec8-e18f-45e8-9949-870a19b72a6b'),('eb0669fc-9e14-4861-a725-560bf3339169','super','de401278-db80-45a1-a5a0-9db47fc72052'),('ecb4233a-3ad9-43b8-88f2-64f32e67f75c','super','8598e757-e82f-4c2e-afea-15cc9fe19481'),('ed6a7d09-a570-4ebf-98e8-7030ba9551bf','super','36897372-25a5-4e71-b7b3-7f67b8737ff4'),('edb5f7ff-e998-4b5d-9be6-cdf12889366c','super','afb5a576-ab30-4638-bb31-f01be34d76dd'),('f2b965be-fc5e-4ccc-b7d4-4ff6fb2dc166','super','959de020-16b2-4a59-a9d0-795fd38c3a55'),('f2d3833a-abb8-4d9e-9ecc-cfbafc0f655f','super','25cfa6ff-8ca9-4a5f-aebe-c167d32353c0'),('f376ae0e-e9e5-48b1-bbb1-55bbf910ab9d','8833bbaa-2547-4da6-ba4c-94796ec0c36a','9d9d6582-aa8d-4c70-b14f-57929e9079d7'),('f3992288-6194-4c20-99eb-6737ade25e5c','super','eeb501d8-f197-437d-b860-618d1d6c4ae9'),('f5d07257-76f5-4261-b508-60880be9bc6f','super','c7f79fce-9905-4e64-b378-9038c20c83c0'),('f8c52579-e696-43c4-aa7f-64c426e6fa15','8833bbaa-2547-4da6-ba4c-94796ec0c36a','42dd6a5a-f9ae-4b96-ac35-8784c27e85e6'),('f8d691ed-f4f4-4ffa-bffc-b095898148c5','super','7cec93be-dd4e-4464-8bfb-ebab47d02c04'),('fad86ec4-214d-434f-96a3-57586c9695d4','super','a8b3e4b5-739b-4669-9292-bc5e4d8e19b5'),('faf95b8c-2311-4fbb-b1f4-97e8b9ee26f0','super','2dd8854a-2844-4dd5-8d7d-7830426fb17b');
/*!40000 ALTER TABLE `trole_privilege` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tuser`
--

DROP TABLE IF EXISTS `tuser`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `tuser` (
  `id` varchar(36) NOT NULL,
  `userName` varchar(100) DEFAULT NULL,
  `passWord` varchar(100) DEFAULT NULL,
  `userNumber` varchar(5) DEFAULT NULL,
  `pid` varchar(36) DEFAULT NULL,
  `createTime` varchar(19) DEFAULT NULL,
  `isCancel` varchar(1) DEFAULT NULL,
  `remark` varchar(1000) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `FK_Reference_5` (`pid`),
  CONSTRAINT `FK_Reference_5` FOREIGN KEY (`pid`) REFERENCES `tuser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `tuser`
--

LOCK TABLES `tuser` WRITE;
/*!40000 ALTER TABLE `tuser` DISABLE KEYS */;
INSERT INTO `tuser` VALUES ('0001','zhao','202cb962ac59075b964b07152d234b70','0001','0002','2014-07-05 08:42:31','0',NULL),('0002','shu','202cb962ac59075b964b07152d234b70','0002','0003','2014-07-05 08:42:31','0',NULL),('0003','xue','202cb962ac59075b964b07152d234b70','0003',NULL,'2014-07-05 08:42:31','0',NULL),('4ee5d3d9-96e3-4104-9432-6eec84d56dd8','super','e10adc3949ba59abbe56e057f20f883e',NULL,NULL,NULL,NULL,NULL),('e63d756e-3393-4569-bc03-5094b8dbaea1','test','202cb962ac59075b964b07152d234b70',NULL,NULL,NULL,NULL,NULL),('f78ab03b-7a67-4951-97ee-aee3fd1f088e','ccc','9df62e693988eb4e1e1444ece0578579',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `tuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tuser_role`
--

DROP TABLE IF EXISTS `tuser_role`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `tuser_role` (
  `id` varchar(36) NOT NULL,
  `userId` varchar(36) DEFAULT NULL,
  `roleId` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Reference_1` (`userId`),
  KEY `FK_Reference_2` (`roleId`),
  CONSTRAINT `FK_Reference_1` FOREIGN KEY (`userId`) REFERENCES `tuser` (`id`),
  CONSTRAINT `FK_Reference_2` FOREIGN KEY (`roleId`) REFERENCES `trole` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `tuser_role`
--

LOCK TABLES `tuser_role` WRITE;
/*!40000 ALTER TABLE `tuser_role` DISABLE KEYS */;
INSERT INTO `tuser_role` VALUES ('06a0b0a6-c7fa-4b3b-a858-2ebf197f55f5','4ee5d3d9-96e3-4104-9432-6eec84d56dd8','super'),('b0995f61-10fc-4779-9cab-846b21101b35','e63d756e-3393-4569-bc03-5094b8dbaea1','super'),('f0184318-d418-4b37-a546-979ba4fffa31','f78ab03b-7a67-4951-97ee-aee3fd1f088e','super');
/*!40000 ALTER TABLE `tuser_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wx_account`
--

DROP TABLE IF EXISTS `wx_account`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `wx_account` (
  `id` varchar(36) NOT NULL,
  `wx_accountinfo_id` varchar(36) DEFAULT NULL,
  `accountname` varchar(50) DEFAULT NULL,
  `type` int(1) DEFAULT NULL,
  `wxId` varchar(20) DEFAULT NULL,
  `url` varchar(200) DEFAULT NULL,
  `token` varchar(20) DEFAULT NULL,
  `binding` varchar(50) DEFAULT NULL,
  `appid` varchar(100) DEFAULT NULL,
  `secret` varchar(100) DEFAULT NULL,
  `access_token` varchar(512) DEFAULT NULL,
  `expires_in` varchar(10) DEFAULT NULL,
  `deadline` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Reference_13` (`wx_accountinfo_id`),
  CONSTRAINT `FK_Reference_13` FOREIGN KEY (`wx_accountinfo_id`) REFERENCES `wx_accountinfo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `wx_account`
--

LOCK TABLES `wx_account` WRITE;
/*!40000 ALTER TABLE `wx_account` DISABLE KEYS */;
INSERT INTO `wx_account` VALUES ('0001','1','公共号名字',0,'gh_99f5ab1dca34','http://funimg.duapp.com/validate/123456','token','yes','wxcd5a533fd0f4ef5c','a768fb34f1d35f1b478cfb13efa6357f','B5uTkm9SoacVs7D9Z598fqum4TwGpXMSmmwZ1qt7bRcP7TtHLqGDKFlWT7lSb3NqgZfHodXaHKL_A4MPUU6xJA','7200','1409217852563'),('4ee5d3d9-96e3-4104-9432-6eec84d56dd8','90e5f1e0-3261-4528-83d2-ebe0c1856ff4','龙之庭·智享夕阳',0,'gh_99f5ab1dca35','http://funimg.duapp.com/wechatController/validate/gh_99f5ab1dca35','yBOXNNoU','yes','wxcd5a533fd0f4ef5c','a768fb34f1d35f1b478cfb13efa6357f','afPhiEv3fJ_0MgpIGY1NU8t7sLA-ALYOl6Ilq_6jJP4zWZSo9C8sEgkBXXTIXlGlv0gf8x-3rYicmhlHPL7IsQ','7200','1411314435214'),('e63d756e-3393-4569-bc03-5094b8dbaea1','b55a33d5-f8bc-419c-92db-9705fb69aff3','',1,'','http://funimg.duapp.com/wechatController/validate/','AIQK1POl',NULL,'','',NULL,NULL,NULL),('f78ab03b-7a67-4951-97ee-aee3fd1f088e','010aa07a-0336-4edd-ad29-a9ae5a7aa009',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `wx_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wx_accountinfo`
--

DROP TABLE IF EXISTS `wx_accountinfo`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `wx_accountinfo` (
  `id` varchar(36) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `registTime` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `wx_accountinfo`
--

LOCK TABLES `wx_accountinfo` WRITE;
/*!40000 ALTER TABLE `wx_accountinfo` DISABLE KEYS */;
INSERT INTO `wx_accountinfo` VALUES ('010aa07a-0336-4edd-ad29-a9ae5a7aa009','ccc','9df62e693988eb4e1e1444ece0578579','safsdfa',NULL,'2014-09-02 16:50:49'),('1','qq@qq.com','202cb962ac59075b964b07152d234b70','123@qq.com','12345678912',NULL),('90e5f1e0-3261-4528-83d2-ebe0c1856ff4','super','e10adc3949ba59abbe56e057f20f883e','super@163.com',NULL,'2014-08-30 10:20:33'),('b55a33d5-f8bc-419c-92db-9705fb69aff3','test','202cb962ac59075b964b07152d234b70','test@126.com',NULL,'2014-09-27 18:43:06');
/*!40000 ALTER TABLE `wx_accountinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wx_article`
--

DROP TABLE IF EXISTS `wx_article`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `wx_article` (
  `ID` varchar(36) NOT NULL,
  `addTime` varchar(255) DEFAULT NULL,
  `author` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `content_source_url` varchar(255) DEFAULT NULL,
  `digest` varchar(255) DEFAULT NULL,
  `show_cover_pic` varchar(255) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `thumb_media_id` varchar(255) DEFAULT NULL,
  `thumb_media_url` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `WX_MASS_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_1cxd7qk5fcft71qvhfmt06lpd` (`WX_MASS_ID`),
  CONSTRAINT `FK_1cxd7qk5fcft71qvhfmt06lpd` FOREIGN KEY (`WX_MASS_ID`) REFERENCES `wx_mass` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `wx_article`
--

LOCK TABLES `wx_article` WRITE;
/*!40000 ALTER TABLE `wx_article` DISABLE KEYS */;
INSERT INTO `wx_article` VALUES ('195b0786-96c1-42da-8399-92100afebd94','2014-08-24 17:25:42','131231','<p><strong><span style=\"color: rgb(255, 0, 0);\">sdfsdgsdfg</span></strong></p>','sdfsdfsdf','','0',3,NULL,'http://bcs.duapp.com/wechatimages%2Fnews%2F%E6%8B%8D%E3%80%8A%E8%BF%98%E7%8F%A0%E6%A0%BC%E6%A0%BC%E3%80%8B%E6%97%B6%E5%80%99%E7%9A%84%E4%B8%89%E4%B8%AA%E4%BA%BA%E7%9A%84%E7%BB%8F%E5%85%B8%E5%90%88%E7%85%A7.jpg','123123','6cc4b0e4-3816-4d6a-8afe-2473596b5732'),('23e86539-9057-4691-bf31-bc99ccc93d18','2014-08-28 11:04:57','','<p>1233333333</p>','','无','0',2,NULL,'http://bcs.duapp.com/wechatimages%2Fnews%2F56ZbdY.jpg','子标题','79587152-5a55-4fc6-b2f1-95809be19de5'),('41d92778-2162-4695-810f-f78c73b78707','2014-08-28 12:30:21','999','<p><span style=\"color: rgb(255, 192, 0);\"><em><strong>sdjfasjdfljslkdjflsdf</strong></em></span></p>','www.hao123.com','123','0',3,NULL,'http://bcs.duapp.com/wechatimages%2Fnews%2F6759281_980x1200_0.jpg','999','79587152-5a55-4fc6-b2f1-95809be19de5'),('7a2544aa-22da-4978-8395-593787edb940','2014-08-22 23:15:30','少的地方','<p>双方的士大夫</p>','','',NULL,1,NULL,'http://bcs.duapp.com/wechatimages%2Fnews%2Ff518651f8b40b3ac381717c5ea8082e0.jpg','撒啊方式','6cc4b0e4-3816-4d6a-8afe-2473596b5732'),('c58cd571-6890-434f-9ef4-86bdb2b46135','2014-08-22 23:16:48','飞','<p>双方的士大夫</p>','说法是否','',NULL,2,NULL,'http://bcs.duapp.com/wechatimages%2Fnews%2Fa128ca4ftw1dtyzjh0gtvj.jpg','水电费','6cc4b0e4-3816-4d6a-8afe-2473596b5732'),('d25cbe87-557c-4c88-91e6-b4e6903d2208','2014-08-28 11:04:15','作者','<p><span style=\"color: rgb(255, 0, 0);\">而欧文精神分裂件萨拉房间爱睡懒觉法轮功</span></p>','funimg.duapp.com','无','1',1,NULL,'http://bcs.duapp.com/wechatimages%2Fnews%2F62vANb.jpg','显示封面的标题','79587152-5a55-4fc6-b2f1-95809be19de5');
/*!40000 ALTER TABLE `wx_article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wx_autoresponse`
--

DROP TABLE IF EXISTS `wx_autoresponse`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `wx_autoresponse` (
  `id` varchar(36) NOT NULL,
  `accountId` varchar(255) DEFAULT NULL,
  `addTime` varchar(20) DEFAULT NULL,
  `keyword` varchar(255) DEFAULT NULL,
  `msgType` varchar(50) DEFAULT NULL,
  `resTemplateId` varchar(36) DEFAULT NULL,
  `templateName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `wx_autoresponse`
--

LOCK TABLES `wx_autoresponse` WRITE;
/*!40000 ALTER TABLE `wx_autoresponse` DISABLE KEYS */;
INSERT INTO `wx_autoresponse` VALUES ('08aaa6fb-b7a0-4b4b-9650-ae6de8aaae65','1','2014-08-09 09:22:23','net','news','6ca0d37f-8f33-4c2e-a629-c5df0aa4eeeb','网络测试'),('0cecc462-fbae-4ce0-8aa0-1fe43e0dcaa8','1','2014-08-09 10:55:55','color','text','54bde3c8-9dbe-4858-84cf-55cf3c3e9328','字体颜色测试'),('1','1','1','1','text','1','1'),('3a17f289-1955-485e-84d7-7e567efb63e9','1','2014-08-11 11:47:14','样式','news','76f5c01f-eda3-4182-ab17-c28761e99072','正文描述测试'),('682ea8a0-7126-4088-a18c-4b3d97149887','1','2014-08-11 14:38:28','2','news','e503ddc6-be5a-44e6-bb84-726ea7df3bc4','样式一'),('b0437b6d-cd67-4647-b3c0-ee985cf5ff5a','1','2014-08-11 14:43:41','3','news','a86ec510-f79e-4c5a-b69a-b48f0624903b','样式二'),('b714cad6-059c-470e-9c06-9182f4e8f3dd','1','2014-08-24 18:06:12','tutu','news','106fc023-800f-4e0d-a342-987ff99131a6','0824'),('c61fa58a-2d56-4522-b1e1-fd30c759d004','1','2014-08-08 16:53:53','123','text','59a18d30-512d-45ff-b057-4e65cacf1847','测试赛意思'),('c6df588d-bc81-4b5a-b772-77e547a4e131','1','2014-08-08 18:05:17','移动','text','79b45b54-33f9-4f24-99cc-36ed076d1b98','10086'),('d9307eb1-50fa-4d03-ba34-47d388912888','1','2014-08-08 16:48:21','你好','text','001','测试模板一'),('eaa29540-7923-4368-b3a9-8a7b64bdc934','1','2014-08-24 18:04:58','haha','text','b0c12bf0-f8b4-4152-b214-198670d85412','wang'),('f586128f-f2ba-4f3d-9cd3-426a7f50fca5','1','2014-08-08 21:16:50','0','text','d9da57ab-c839-469c-94e8-1f206f3a93ff','0'),('f8929eb1-cd95-4dee-ad99-aba36f0f486a','1','2014-08-09 09:17:09','news','news','3','三个图文');
/*!40000 ALTER TABLE `wx_autoresponse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wx_event`
--

DROP TABLE IF EXISTS `wx_event`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `wx_event` (
  `id` varchar(36) NOT NULL,
  `accountId` varchar(36) DEFAULT NULL,
  `FromUserName` varchar(255) DEFAULT NULL,
  `ToUserName` varchar(255) DEFAULT NULL,
  `CreateTime` varchar(50) DEFAULT NULL,
  `MsgType` varchar(50) DEFAULT NULL,
  `Event` varchar(50) DEFAULT NULL,
  `EventKey` varchar(255) DEFAULT NULL,
  `Ticket` varchar(1000) DEFAULT NULL,
  `Latitude` varchar(255) DEFAULT NULL,
  `Longitude` varchar(255) DEFAULT NULL,
  `PPrecision` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Precision(精度)关键词冲突';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `wx_event`
--

LOCK TABLES `wx_event` WRITE;
/*!40000 ALTER TABLE `wx_event` DISABLE KEYS */;
INSERT INTO `wx_event` VALUES ('03d72bc8-0d0c-429d-9d63-effb78a6b05d','4ee5d3d9-96e3-4104-9432-6eec84d56dd8','o12t0t4AGIpWgBNLHlOkN_InIkTg','gh_99f5ab1dca35','1410835989','event','subscribe','',NULL,NULL,NULL,NULL),('0690a7ab-8852-4187-b238-ec880f28ea97',NULL,'o12t0t_TYxQQ2mRxqf1vgGzOMQZk','gh_99f5ab1dca35','1408087414','event','unsubscribe',NULL,NULL,NULL,NULL,NULL),('0a6dfdbc-838e-498d-bdbb-32cdcc7dfd86',NULL,'o12t0t_TYxQQ2mRxqf1vgGzOMQZk','gh_99f5ab1dca35','1407568182','event','subscribe',NULL,NULL,NULL,NULL,NULL),('10c45e2b-a712-4863-89ff-7cb6ed211ba6',NULL,'oT6awt3ZjhpAxJEh8Zhsn-nxJK6o','gh_0f77095d39fc','1407550468','event','subscribe',NULL,NULL,NULL,NULL,NULL),('1877b48d-cae1-4a61-bf84-57df7f7d2cfa',NULL,'o12t0t_TYxQQ2mRxqf1vgGzOMQZk','gh_99f5ab1dca35','1409211476','event','unsubscribe',NULL,NULL,NULL,NULL,NULL),('1de8fd64-2eb2-4975-bda0-6aeaa709406e',NULL,'o12t0t7a7UmLVK8nwwc3vDXr2YX4','gh_99f5ab1dca35','1407721905','event','unsubscribe',NULL,NULL,NULL,NULL,NULL),('2231aab2-52ef-4879-8cc8-e71734fce2eb',NULL,'o12t0t_TYxQQ2mRxqf1vgGzOMQZk','gh_99f5ab1dca35','1409211495','event','subscribe','',NULL,NULL,NULL,NULL),('25d8e975-6cbb-4f51-9284-67bc9501254a',NULL,'oT6awt3ZjhpAxJEh8Zhsn-nxJK6o','gh_0f77095d39fc','1407550404','event','unsubscribe',NULL,NULL,NULL,NULL,NULL),('3c690db6-a3b9-42dd-9631-25d4c4014cd2',NULL,'oT6awt1PZkuSG3uNgh1luTuiv1nY','gh_0f77095d39fc','1409239178','event','unsubscribe',NULL,NULL,NULL,NULL,NULL),('48937156-55a4-41a8-81d4-ac685b2dd973',NULL,'oT6awt3ZjhpAxJEh8Zhsn-nxJK6o','gh_0f77095d39fc','1407387355','event','unsubscribe',NULL,NULL,NULL,NULL,NULL),('4afb478e-e99a-4ee0-9f33-b3515a940d68',NULL,'o12t0t_TYxQQ2mRxqf1vgGzOMQZk','gh_99f5ab1dca35','1408087433','event','subscribe','',NULL,NULL,NULL,NULL),('5fa0ce38-a38e-4073-b08d-077bd95cb372','4ee5d3d9-96e3-4104-9432-6eec84d56dd8','o12t0t56AYrBtC8EzxlnGnj5Dkwk','gh_99f5ab1dca35','1409539166','event','unsubscribe',NULL,NULL,NULL,NULL,NULL),('6075fda8-8179-4694-93d6-a92d50c1d043',NULL,'o12t0t_TYxQQ2mRxqf1vgGzOMQZk','gh_99f5ab1dca35','1408088841','event','subscribe','',NULL,NULL,NULL,NULL),('72aa22c2-91dd-48d8-bb84-b1c1fda9463e',NULL,'oT6awt1PZkuSG3uNgh1luTuiv1nY','gh_0f77095d39fc','1407503736','event','subscribe',NULL,NULL,NULL,NULL,NULL),('8d230a02-5657-49a5-847c-ee1be88f3993',NULL,'o12t0t_TYxQQ2mRxqf1vgGzOMQZk','gh_99f5ab1dca35','1408088819','event','unsubscribe',NULL,NULL,NULL,NULL,NULL),('99e1db44-d2b3-42fd-b11b-d9146b1e251d',NULL,'o12t0t6XTy4fIEgm560Asmzybl7c','gh_99f5ab1dca35','1408089062','event','unsubscribe',NULL,NULL,NULL,NULL,NULL),('ab2f833b-2ed9-456f-98bf-45ecabb3b926',NULL,'o12t0t4m6uLtbGg9ppsv88KbIcpg','gh_99f5ab1dca35','1408211571','event','subscribe','',NULL,NULL,NULL,NULL),('b3eac010-3877-4b03-9b46-0a42d9c688b0',NULL,'o12t0t6XTy4fIEgm560Asmzybl7c','gh_99f5ab1dca35','1408089100','event','subscribe','qrscene_10007','gQG68DoAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xL3dreGxndFRsX3ZPRFJsWTdKV0FUAAIEi7vtUwMEAAAAAA==',NULL,NULL,NULL),('b81a86a8-9243-4a2b-ad7b-9a460fe74573',NULL,'oT6awt5s9mVb_xiMeF2Pqjn-5fO8','gh_0f77095d39fc','1407551088','event','subscribe',NULL,NULL,NULL,NULL,NULL),('c0216987-5b33-45ad-80d6-abc959ad73ae','4ee5d3d9-96e3-4104-9432-6eec84d56dd8','o12t0t56AYrBtC8EzxlnGnj5Dkwk','gh_99f5ab1dca35','1409539059','event','subscribe','',NULL,NULL,NULL,NULL),('dc72cd07-749f-4552-b6f9-f1ed3719d250',NULL,'o12t0t7a7UmLVK8nwwc3vDXr2YX4','gh_99f5ab1dca35','1407721881','event','SCAN','8080','gQFN8DoAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xL0hrd0ZveDdsa2ZQb2NZb1JSV0FUAAIEpxnoUwMEAAAAAA==',NULL,NULL,NULL),('e0d60b97-454b-4e77-94ec-1013906d8bd7',NULL,'oT6awt5s9mVb_xiMeF2Pqjn-5fO8','gh_0f77095d39fc','1407551048','event','unsubscribe',NULL,NULL,NULL,NULL,NULL),('f4e59e0b-1665-4381-b684-ffb650ac67cf',NULL,'oT6awt3ZjhpAxJEh8Zhsn-nxJK6o','gh_0f77095d39fc','1407387406','event','subscribe',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `wx_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wx_group`
--

DROP TABLE IF EXISTS `wx_group`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `wx_group` (
  `id` varchar(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `groupId` varchar(255) DEFAULT NULL,
  `count` varchar(255) DEFAULT NULL,
  `accountid` varchar(36) DEFAULT NULL,
  `addTime` varchar(20) DEFAULT NULL,
  `modifyTime` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `wx_group`
--

LOCK TABLES `wx_group` WRITE;
/*!40000 ALTER TABLE `wx_group` DISABLE KEYS */;
INSERT INTO `wx_group` VALUES ('1','未分组','0','5','1','2014-08-16 12:12:12','2014-08-16 12:12:12'),('100','分组一','100','','1','2014-08-16 12:12:12','2014-08-16 12:12:12'),('2','黑名单','1','0','1','2014-08-16 12:12:12','2014-08-16 12:12:12'),('3','星标组','2','0','1','2014-08-16 12:12:12','2014-08-16 12:12:12');
/*!40000 ALTER TABLE `wx_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wx_mass`
--

DROP TABLE IF EXISTS `wx_mass`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `wx_mass` (
  `ID` varchar(36) NOT NULL,
  `accountId` varchar(255) DEFAULT NULL,
  `addTime` varchar(255) DEFAULT NULL,
  `massName` varchar(255) DEFAULT NULL,
  `msgid` int(11) DEFAULT NULL,
  `send` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `wx_mass`
--

LOCK TABLES `wx_mass` WRITE;
/*!40000 ALTER TABLE `wx_mass` DISABLE KEYS */;
INSERT INTO `wx_mass` VALUES ('6cc4b0e4-3816-4d6a-8afe-2473596b5732','1','2014-08-22 23:10:33','0822test',NULL,'no'),('79587152-5a55-4fc6-b2f1-95809be19de5','1','2014-08-28 10:53:41','0828test',NULL,'no'),('9ff63d61-cae5-425f-8052-525c66920abd','1','2014-08-29 16:18:18','uu',NULL,'no');
/*!40000 ALTER TABLE `wx_mass` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wx_menu`
--

DROP TABLE IF EXISTS `wx_menu`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `wx_menu` (
  `id` varchar(36) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `type` varchar(6) DEFAULT NULL,
  `menuKey` varchar(150) DEFAULT NULL,
  `menuType` int(2) DEFAULT NULL,
  `keyword` varchar(36) DEFAULT NULL,
  `website` varchar(36) DEFAULT NULL,
  `url` varchar(256) DEFAULT NULL,
  `orders` int(3) DEFAULT NULL,
  `pid` varchar(36) DEFAULT NULL,
  `accountId` varchar(36) DEFAULT NULL,
  `createTime` varchar(20) DEFAULT NULL,
  `modifyTime` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_wx_menu_pid` (`pid`),
  CONSTRAINT `FK_wx_menu_pid` FOREIGN KEY (`pid`) REFERENCES `wx_menu` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `wx_menu`
--

LOCK TABLES `wx_menu` WRITE;
/*!40000 ALTER TABLE `wx_menu` DISABLE KEYS */;
INSERT INTO `wx_menu` VALUES ('08f8a367-4a47-41ae-bd56-e15fc0fe0240','3333',NULL,NULL,1,'key',NULL,NULL,1,'b3138683-7181-4d2c-bf82-83ea3b2ca28e','0002','2014-07-29 16:23:36',NULL),('0a005725-4b66-4fd0-82e2-5f68b4600d51','菜单测二',NULL,NULL,1,'',NULL,NULL,1,NULL,'0002','2014-07-29 15:54:32',NULL),('0b6c1f9a-9ad1-4148-882a-8a4612cbda92','ss',NULL,'yeocxoIt',0,NULL,NULL,NULL,1,NULL,'f78ab03b-7a67-4951-97ee-aee3fd1f088e','2014-09-02 16:55:19',NULL),('21','手机','click',NULL,3,NULL,NULL,'www.baidu.com',1,NULL,'zhao1',NULL,NULL),('242b8a7a-bcd0-49e0-9f36-645cbca79e8e','微官网',NULL,'GB2vFCQ3',0,NULL,NULL,NULL,1,NULL,'4ee5d3d9-96e3-4104-9432-6eec84d56dd8','2014-09-16 17:08:20',NULL),('25bcca68-bc60-4d56-a9f2-1e85ab299277','t','click','4ttSVa4r',1,'08aaa6fb-b7a0-4b4b-9650-ae6de8aaae65',NULL,NULL,1,'c734ed1c-989d-4f62-8819-7aef56184dc1','e63d756e-3393-4569-bc03-5094b8dbaea1','2014-09-27 18:44:47',NULL),('2aab8f78-23c1-4d68-838b-cef3c2482130','参加活动',NULL,NULL,0,NULL,NULL,NULL,1,NULL,'54f77b2d-03e3-447d-a465-cd1a35e86265','2014-07-30 16:38:29',NULL),('3','服务','click','G100_asf23',NULL,NULL,NULL,NULL,3,NULL,'zhao1','2014-07-24 14:24:00',NULL),('31','刮刮卡','click',NULL,NULL,NULL,NULL,NULL,1,'3','zhao1',NULL,NULL),('32','投票','click',NULL,NULL,NULL,NULL,NULL,2,'3','zhao1',NULL,NULL),('3b4e2f72-bb7a-4ac7-afa9-870a80c7b3a9','手机测试',NULL,'pFQvKRln',0,NULL,NULL,NULL,1,NULL,'0001','2014-09-18 20:08:30',NULL),('3d8724af-eb6b-48a1-834f-55c303ce9ff4','1测试菜单一',NULL,NULL,0,NULL,NULL,NULL,1,'f7987935-3a05-47c9-b159-7a560f9e5457','0002','2014-07-29 16:22:56',NULL),('480f42ab-4aef-426c-984d-af2a56e6405e','违章查询',NULL,NULL,0,NULL,NULL,NULL,1,'98925d21-2a4e-4ff5-a93f-902de152a11e','54f77b2d-03e3-447d-a465-cd1a35e86265','2014-07-30 16:39:51',NULL),('4a6864f7-b573-46e2-89ac-89f5d8cc5e9d','新增测试',NULL,'XjnIXmDY',0,NULL,NULL,NULL,1,NULL,'0001','2014-08-28 15:34:23',NULL),('55','zhucaidan01','click','123',NULL,NULL,NULL,NULL,1,NULL,'zhou',NULL,NULL),('551','zicaidan111','click','hehe',NULL,NULL,NULL,NULL,1,'55','zhou',NULL,NULL),('552','zicaidan222222','view',NULL,NULL,NULL,NULL,'alibaba',2,'55','zhou',NULL,NULL),('553c78eb-c99a-44a1-9caa-93f86dabcd09','你好啊',NULL,NULL,3,NULL,NULL,'www.ykc.om',1,'0a005725-4b66-4fd0-82e2-5f68b4600d51','0002','2014-07-29 16:24:16',NULL),('57d3836c-433d-4e9d-a286-b174246c1899','酒后代驾',NULL,NULL,0,NULL,NULL,NULL,1,'98925d21-2a4e-4ff5-a93f-902de152a11e','54f77b2d-03e3-447d-a465-cd1a35e86265','2014-07-30 16:39:29',NULL),('66','zhucaidan02','view',NULL,NULL,NULL,NULL,'www.baidu.com',2,NULL,'zhou',NULL,NULL),('77','zhucaidan03','click','456',NULL,NULL,NULL,NULL,3,NULL,'zhou',NULL,NULL),('82a7f354-81bf-417d-a589-3cc248b2d4d6','rdgsdg','view','w60xLqPc',3,NULL,NULL,'http://123',1,NULL,'e63d756e-3393-4569-bc03-5094b8dbaea1','2014-09-27 18:45:37',NULL),('8dafbc41-bf68-4839-a04e-de2287cda670','预约检车',NULL,NULL,0,NULL,NULL,NULL,1,NULL,'54f77b2d-03e3-447d-a465-cd1a35e86265','2014-07-30 16:38:49',NULL),('8dbd3ef2-d29a-4c20-b5b0-e31c73ba4076','故障救援',NULL,NULL,0,NULL,NULL,NULL,1,'98925d21-2a4e-4ff5-a93f-902de152a11e','54f77b2d-03e3-447d-a465-cd1a35e86265','2014-07-30 16:39:44',NULL),('98925d21-2a4e-4ff5-a93f-902de152a11e','更多服务',NULL,NULL,0,NULL,NULL,NULL,1,NULL,'54f77b2d-03e3-447d-a465-cd1a35e86265','2014-07-30 16:39:09',NULL),('a2409775-c525-45c9-8f51-9342d32ded4b','联系',NULL,'SVW7PK8l',0,NULL,NULL,NULL,1,NULL,'4ee5d3d9-96e3-4104-9432-6eec84d56dd8','2014-09-16 17:08:35',NULL),('a2aec2e6-2120-4c93-a5e5-8bb5b2206cee','url','click','DGqJcNdp',1,'c6df588d-bc81-4b5a-b772-77e547a4e131',NULL,'http://funimg.duapp.com',1,NULL,'0001','2014-08-28 15:35:11','2014-08-30 00:47:36'),('a350d210-ef17-4318-8073-35988dcccfbf','跳转						    ','click','AuMtkJCS',1,'3a17f289-1955-485e-84d7-7e567efb63e9',NULL,'http://www.baidu.com',1,'4a6864f7-b573-46e2-89ac-89f5d8cc5e9d','0001','2014-08-28 15:34:46','2014-08-29 14:08:52'),('b3138683-7181-4d2c-bf82-83ea3b2ca28e','菜单测三',NULL,NULL,3,NULL,NULL,'www.123.com',1,NULL,'0002','2014-07-29 15:54:46',NULL),('c734ed1c-989d-4f62-8819-7aef56184dc1','1',NULL,'UlcRnKIG',0,NULL,NULL,NULL,1,NULL,'e63d756e-3393-4569-bc03-5094b8dbaea1','2014-09-27 18:44:33','2014-09-27 18:45:43'),('d8d7fa7c-31e9-4e6e-b402-cb7df3a4b3c8','客服电话',NULL,NULL,0,NULL,NULL,NULL,1,'98925d21-2a4e-4ff5-a93f-902de152a11e','54f77b2d-03e3-447d-a465-cd1a35e86265','2014-07-30 16:39:36',NULL),('ebc80f00-9625-43af-86d5-ac3a5dd1590e','水电费',NULL,NULL,3,NULL,NULL,'234',1,NULL,'4004','2014-07-31 14:21:44',NULL),('ec6108d7-f21c-44e2-aab3-bb1097b08634','活动',NULL,'ROKC5q8C',0,NULL,NULL,NULL,1,NULL,'4ee5d3d9-96e3-4104-9432-6eec84d56dd8','2014-09-16 17:08:30',NULL),('ef2f227e-acb2-42cf-b733-a02ee1751559','sdfasdfsadf',NULL,NULL,3,NULL,NULL,'asdffffffffffffffffff',1,NULL,'4004','2014-07-31 14:09:38',NULL),('f3abb335-ed4b-4ea2-a4ea-fa18d45aa9b8','哈哈',NULL,NULL,2,NULL,'',NULL,1,'0a005725-4b66-4fd0-82e2-5f68b4600d51','0002','2014-07-29 16:24:41',NULL),('f7987935-3a05-47c9-b159-7a560f9e5457','菜单测一',NULL,NULL,0,NULL,NULL,NULL,1,NULL,'0002','2014-07-29 15:54:11',NULL);
/*!40000 ALTER TABLE `wx_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wx_message`
--

DROP TABLE IF EXISTS `wx_message`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `wx_message` (
  `id` varchar(36) NOT NULL,
  `accountId` varchar(36) DEFAULT NULL,
  `FromUserName` varchar(255) DEFAULT NULL,
  `ToUserName` varchar(255) DEFAULT NULL,
  `CreateTime` varchar(50) DEFAULT NULL,
  `MsgType` varchar(50) DEFAULT NULL,
  `MsgId` varchar(255) DEFAULT NULL,
  `Content` varchar(1000) DEFAULT NULL,
  `PicUrl` varchar(1000) DEFAULT NULL,
  `MediaId` varchar(1000) DEFAULT NULL,
  `Format` varchar(255) DEFAULT NULL,
  `ThumbMediaId` varchar(1000) DEFAULT NULL,
  `Location_X` varchar(255) DEFAULT NULL,
  `Location_Y` varchar(255) DEFAULT NULL,
  `Scale` varchar(255) DEFAULT NULL,
  `Label` varchar(255) DEFAULT NULL,
  `Title` varchar(1000) DEFAULT NULL,
  `Description` varchar(1000) DEFAULT NULL,
  `Url` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `wx_message`
--

LOCK TABLES `wx_message` WRITE;
/*!40000 ALTER TABLE `wx_message` DISABLE KEYS */;
INSERT INTO `wx_message` VALUES ('015ce5be-c09c-4550-88cf-aeeaa4859a9e','gh_0f77095d39fc','oT6awt3ZjhpAxJEh8Zhsn-nxJK6o','gh_0f77095d39fc',NULL,'text','6045367907581585111','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('03f41a9c-330c-4cc6-84bf-410e16aa5a92','gh_99f5ab1dca35','o12t0t_TYxQQ2mRxqf1vgGzOMQZk','gh_99f5ab1dca35',NULL,'text','6047995267925465309','样式',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('06ccb05e-0ac4-4552-860d-6afcbde56c7b','gh_99f5ab1dca35','o12t0t_TYxQQ2mRxqf1vgGzOMQZk','gh_99f5ab1dca35',NULL,'text','6046194800455102837','3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('09a18c1b-3312-408c-8cc6-e34a1ae15d26','gh_0f77095d39fc','oT6awt3ZjhpAxJEh8Zhsn-nxJK6o','gh_0f77095d39fc',NULL,'text','6045126809592421630','12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('1','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'123',NULL,NULL,NULL),('12c1053b-64d0-40b4-b3a9-6995636ebc11','gh_0f77095d39fc','oT6awt3ZjhpAxJEh8Zhsn-nxJK6o','gh_0f77095d39fc',NULL,'text','6045133690130029967','你好',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('1976cf55-24e4-4168-b64c-e2e2e69b6f0a','gh_99f5ab1dca35','o12t0t_TYxQQ2mRxqf1vgGzOMQZk','gh_99f5ab1dca35',NULL,'text','6046149385470913682','样式',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('1e0cebb3-5bfb-4bc5-9f21-04d442aeac0c','gh_99f5ab1dca35','o12t0t_TYxQQ2mRxqf1vgGzOMQZk','gh_99f5ab1dca35',NULL,'text','6045459691032583049','你好',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('2','2','2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('24fbe01f-8350-42e3-b907-a05bfdd4a440','gh_0f77095d39fc','oT6awt1PZkuSG3uNgh1luTuiv1nY','gh_0f77095d39fc',NULL,'text','6045184662801899746','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('57bb5630-4749-4757-92a3-70748bfc0106','gh_99f5ab1dca35','o12t0t_TYxQQ2mRxqf1vgGzOMQZk','gh_99f5ab1dca35',NULL,'text','6046193499080012130','2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('5a27e009-d761-410f-bc8b-9863644b38fa','gh_99f5ab1dca35','o12t0t_TYxQQ2mRxqf1vgGzOMQZk','gh_99f5ab1dca35',NULL,'text','6051070511754058895','123',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('623ea2f6-0d3c-45d8-8fe6-c789710fd3e2','gh_0f77095d39fc','oT6awt3ZjhpAxJEh8Zhsn-nxJK6o','gh_0f77095d39fc',NULL,'text','6045368083675244254','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('6275682a-7267-44fb-8028-b922773552a3','gh_0f77095d39fc','oT6awt3ZjhpAxJEh8Zhsn-nxJK6o','gh_0f77095d39fc',NULL,'text','6044385253423988393','你好',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('6c023f6d-37b3-4f9e-b2d7-7adc99f14659','gh_0f77095d39fc','oT6awt3ZjhpAxJEh8Zhsn-nxJK6o','gh_0f77095d39fc',NULL,'text','6044386284216139442','怎么都不够？',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('739c4151-ff26-4fce-8a29-56d6fd771880','gh_0f77095d39fc','oT6awt3ZjhpAxJEh8Zhsn-nxJK6o','gh_0f77095d39fc',NULL,'image','6044386662173261494',NULL,'http://mmbiz.qpic.cn/mmbiz/MkA4JV8AuXOsjRp24WJxFZ0kaxSZFR3cFT8rs7vEBzz1VBlDgqnFcg3nrbpruiazicgm8UO0IXHJyUDNsZVIFUAQ/0','rVuT2r_z6ii0k1yaNb0WBai8qURcHILkbU2qiuICkSge4gia4GsoKuKd1DKTn59J',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('750a568c-f7ca-444e-84d5-847d651ca30d','gh_99f5ab1dca35','o12t0t_TYxQQ2mRxqf1vgGzOMQZk','gh_99f5ab1dca35',NULL,'text','6051070812401769620','haha',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('75d24469-b5dd-4ae3-bd0c-0101bd7398cf','gh_0f77095d39fc','oT6awtwauW4DvriQcov2KH1c8CgU','gh_0f77095d39fc',NULL,'text','6045040270296372907','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('794364db-3d00-4de3-ae97-a6dc22e7149a','gh_0f77095d39fc','oT6awt3ZjhpAxJEh8Zhsn-nxJK6o','gh_0f77095d39fc',NULL,'text','6044386065172807343','哈哈',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('80fa1fb0-403e-4d6c-9641-6b02b88c7106','gh_99f5ab1dca35','o12t0t2Vd9AG7luo3DCGqnf_cFGg','gh_99f5ab1dca35',NULL,'text','6046148809945295997','刮刮卡',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('81b511b6-a0df-46fe-9a29-9ba4108db40f','gh_0f77095d39fc','oT6awt3ZjhpAxJEh8Zhsn-nxJK6o','gh_0f77095d39fc',NULL,'text','6044385253423988393','你好',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('84791604-750e-4abd-a425-8586439641f7','gh_0f77095d39fc','oT6awt3ZjhpAxJEh8Zhsn-nxJK6o','gh_0f77095d39fc',NULL,'text','6045368491697137383','news',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('88cd6ac1-651a-4ea2-aa28-a300106516d2','gh_0f77095d39fc','oT6awt3ZjhpAxJEh8Zhsn-nxJK6o','gh_0f77095d39fc',NULL,'text','6045367929056421592','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('92386fbf-4bed-47fb-9fef-12be75db961b','gh_99f5ab1dca35','o12t0t_TYxQQ2mRxqf1vgGzOMQZk','gh_99f5ab1dca35',NULL,'text','6051071108754513047','tutu',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('94f78e3c-0f45-455f-b851-b7a83b4d8c65','gh_0f77095d39fc','oT6awt3ZjhpAxJEh8Zhsn-nxJK6o','gh_0f77095d39fc',NULL,'text','6045368032135636700','123',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('9c09dfb0-53da-44dd-b338-f953a83cf272','4ee5d3d9-96e3-4104-9432-6eec84d56dd8','o12t0t7a7UmLVK8nwwc3vDXr2YX4','gh_99f5ab1dca35',NULL,'text','6059204282164561889','net',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('aa0fb170-588f-495f-a970-eb4d62c036b3','gh_0f77095d39fc','oT6awt3ZjhpAxJEh8Zhsn-nxJK6o','gh_0f77095d39fc',NULL,'image','6044386413065158324',NULL,'http://mmbiz.qpic.cn/mmbiz/MkA4JV8AuXOsjRp24WJxFZ0kaxSZFR3ca9bUHgeUyibMSB9ic98aBLeib8Xpw4UMm0HDGDGerPb4wQbTcfAjesg2Q/0','aDZXBYuhIrP_DSY5FDaOSDGvbPZJL5bGPDvEIkRCrF3QwXs0jGcX-ttUZ_Q5VOJ9',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('ab3681fb-5f1f-40f2-829b-699caf536d32','gh_0f77095d39fc','oT6awt3ZjhpAxJEh8Zhsn-nxJK6o','gh_0f77095d39fc',NULL,'text','6044706486912959822','123',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('b07e0e46-cecd-4775-91fb-7d1d9ff91bf8','gh_0f77095d39fc','oT6awt3ZjhpAxJEh8Zhsn-nxJK6o','gh_0f77095d39fc',NULL,'text','6045133213388660100','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('b432556f-09e9-451f-ba63-4ca54ca133c6','gh_0f77095d39fc','oT6awt1PZkuSG3uNgh1luTuiv1nY','gh_0f77095d39fc',NULL,'text','6045185221147648247','恨死你了',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('b560b0d0-f3b7-4da4-87d8-57b34d0f7143','gh_0f77095d39fc','oT6awt3ZjhpAxJEh8Zhsn-nxJK6o','gh_0f77095d39fc',NULL,'text','6044385253423988393','你好',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('b6eb7c62-7f95-4347-937b-04e4acf2552e','gh_99f5ab1dca35','o12t0t_TYxQQ2mRxqf1vgGzOMQZk','gh_99f5ab1dca35',NULL,'image','6047995401069451486',NULL,'http://mmbiz.qpic.cn/mmbiz/MkA4JV8AuXNibAkPQJ2hdibMSdR4V9MmrMEtiaR8aPzv7fZ4buxsiby6jmwc1dB1ToxvSEhTia1I17WL94mlL2I0luw/0','C8GQ--l-0o4o2JHe9l3RGdloOaS0Rhk5UMD-f4j3XCj4s3FoIs4GFEbcjRMNtgZh',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('ba0cd454-cfa7-47c8-940f-2f042afb2d1a','gh_99f5ab1dca35','o12t0t_TYxQQ2mRxqf1vgGzOMQZk','gh_99f5ab1dca35',NULL,'text','6045459622313106307','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('c84de241-ea39-4fad-8541-3880763309fb','gh_0f77095d39fc','oT6awt3ZjhpAxJEh8Zhsn-nxJK6o','gh_0f77095d39fc',NULL,'text','6045133638590422412','123',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('c994b9bc-f280-45a5-9cbd-4832bc688d26','gh_0f77095d39fc','oT6awt3ZjhpAxJEh8Zhsn-nxJK6o','gh_0f77095d39fc',NULL,'text','6045133574165912970','移动',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('d7cf723c-1732-4e01-a4a8-c594c8f37a95','gh_0f77095d39fc','oT6awt3ZjhpAxJEh8Zhsn-nxJK6o','gh_0f77095d39fc',NULL,'text','6045369827431966461','net',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('dddcc76f-f6ce-48a4-ba01-523f91c9ad38','gh_0f77095d39fc','oT6awt3ZjhpAxJEh8Zhsn-nxJK6o','gh_0f77095d39fc',NULL,'text','6045367907581585111','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('dfcf47a0-b6fa-455b-a59f-9054cdd91e50','gh_99f5ab1dca35','o12t0t_TYxQQ2mRxqf1vgGzOMQZk','gh_99f5ab1dca35',NULL,'text','6047995242155661532','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('e4d4bae9-9d1f-488e-9281-2795487bc2ec','gh_0f77095d39fc','oT6awt3ZjhpAxJEh8Zhsn-nxJK6o','gh_0f77095d39fc',NULL,'text','6045393960853203150','color',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('fd814b7a-9fca-4f5d-bd44-fd1658c3bc88','gh_99f5ab1dca35','o12t0t_TYxQQ2mRxqf1vgGzOMQZk','gh_99f5ab1dca35',NULL,'text','6047995220680825050','123',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('fde87de7-6e99-41d2-8222-5a59521d9882','gh_0f77095d39fc','oT6awt3ZjhpAxJEh8Zhsn-nxJK6o','gh_0f77095d39fc',NULL,'text','6044385253423988393','你好',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `wx_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wx_newsitem`
--

DROP TABLE IF EXISTS `wx_newsitem`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `wx_newsitem` (
  `id` varchar(36) NOT NULL,
  `Title` varchar(255) DEFAULT NULL,
  `Author` varchar(255) DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `Content` varchar(255) DEFAULT NULL,
  `PicUrl` varchar(255) DEFAULT NULL,
  `Url` varchar(255) DEFAULT NULL,
  `sort` varchar(10) DEFAULT NULL,
  `templateId` varchar(36) DEFAULT NULL,
  `accountId` varchar(36) DEFAULT NULL,
  `addTime` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `wx_newsitem`
--

LOCK TABLES `wx_newsitem` WRITE;
/*!40000 ALTER TABLE `wx_newsitem` DISABLE KEYS */;
INSERT INTO `wx_newsitem` VALUES ('1','大标题','123','描述','wu ','http://bcs.duapp.com/wechatimages%2Fnews%2F003.jpg','http://su.bdimg.com/static/superplus/img/logo_white.png','2','1',NULL,NULL),('1caa896c-4d47-4937-9677-b327322574d9','1312','13','','12323','http://bcs.duapp.com/wechatimages%2Fnews%2F%E4%B8%BB%E6%B7%AB%EF%BC%8C%E6%88%91%E4%BC%91%E6%81%AF%E4%B8%8B%E5%93%88%EF%BC%81%20.jpg','','1','106fc023-800f-4e0d-a342-987ff99131a6','','2014-08-24 18:05:55'),('2','大标题yi','hehe1','无1','wu 1','http://bcs.duapp.com/wechatimages%2Fnews%2F%E7%8E%8B%E8%8F%B2.jpg','http://su.bdimg.com/static/superplus/img/logo_white.png','1','2',NULL,NULL),('3','子标题','','','','http://bcs.duapp.com/wechatimages%2Fnews%2Fu%3D3581319155%2C1816864993%26fm%3D21%26gp%3D0.jpg','http://su.bdimg.com/static/superplus/img/logo_white.png','1','2',NULL,NULL),('4','主要标题测试',NULL,NULL,NULL,'http://www.gexia.com/images/first10.jpg','http://su.bdimg.com/static/superplus/img/logo_white.png',NULL,'3',NULL,NULL),('5','淄博奥体',NULL,NULL,NULL,'http://www.gexia.com/images/first10.jpg','http://su.bdimg.com/static/superplus/img/logo_white.png',NULL,'3',NULL,NULL),('546c4121-6a02-437b-881f-a5e213a1647f','小标题测试','作者二','摘要摘要摘要摘要摘要摘要摘要摘要摘要摘要摘要','正文正文正文正文正文正文正文正文正文正文正文正文正文正文正文正文正文正文正文正文正文正文正文正文正文正文正文正文正文正文正文正文正文正文正文正文正文正文正文正文正文正文正文正文正文正文正文正文正文正文正文正文正文正文正文正文正文正文正文正文正文正文正文正文正文正文','http://bcs.duapp.com/wechatimages%2Fnews%2F%E6%9E%97%E8%82%AF%E5%85%AC%E5%9B%AD.jpg','www.baidu.com','2','0dfeae07-452b-4a38-a716-a84f30bc39b5','','2014-08-13 14:41:39'),('6','是否属于描','','','','http://bcs.duapp.com/wechatimages%2Fnews%2F62vANb.jpg','','4','3',NULL,NULL),('8fb5bfe3-f3fc-43fa-b79d-5562813c0703','123','','1','','http://bcs.duapp.com/wechatimages%2Fnews%2F62vANb.jpg','','1','491d465b-0317-4742-abec-2c3195c5c3e7','',NULL),('90c2d6c0-65db-4e93-99fb-73dc0766de3b','标题测试','作者','摘要摘要摘要摘要摘要摘要摘要摘要摘要摘要摘要','正文正文正文正文正文正文正文正文正文正文正文正文正文正文正文正文正文正文正文正文正文正文正文正文正文正文正文正文正文正文正文正文正文正文正文正文正文正文正文正文正文正文正文正文正文正文正文正文正文正文正文正文正文正文正文正文正文正文正文正文正文正文正文正文正文正文','http://bcs.duapp.com/wechatimages%2Fnews%2F%E5%91%A8%E6%9D%B0%E4%BC%A6.jpg','www.baidu.com','1','0dfeae07-452b-4a38-a716-a84f30bc39b5','','2014-08-13 14:37:49');
/*!40000 ALTER TABLE `wx_newsitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wx_newstemplate`
--

DROP TABLE IF EXISTS `wx_newstemplate`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `wx_newstemplate` (
  `id` varchar(36) NOT NULL,
  `addTime` varchar(20) DEFAULT NULL,
  `templateName` varchar(255) DEFAULT NULL,
  `accountId` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `wx_newstemplate`
--

LOCK TABLES `wx_newstemplate` WRITE;
/*!40000 ALTER TABLE `wx_newstemplate` DISABLE KEYS */;
INSERT INTO `wx_newstemplate` VALUES ('0dfeae07-452b-4a38-a716-a84f30bc39b5','2014-08-09 09:06:13','111',''),('1','2','单图文','4'),('106fc023-800f-4e0d-a342-987ff99131a6','2014-08-24 18:05:36','0824',''),('2','2','2个图文','2'),('3','3','三个图文','3'),('36972ef0-8935-4891-92ff-7d2b16b05da2','2014-08-09 09:04:00','123',''),('491d465b-0317-4742-abec-2c3195c5c3e7','2014-08-09 09:06:29','222','');
/*!40000 ALTER TABLE `wx_newstemplate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wx_qrcode`
--

DROP TABLE IF EXISTS `wx_qrcode`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `wx_qrcode` (
  `id` varchar(36) NOT NULL,
  `accountId` varchar(36) DEFAULT NULL,
  `createTime` varchar(20) DEFAULT NULL,
  `params` varchar(1000) DEFAULT NULL,
  `scence_id` int(9) DEFAULT NULL,
  `action_name` varchar(255) DEFAULT NULL,
  `ticket` varchar(1000) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `wx_qrcode`
--

LOCK TABLES `wx_qrcode` WRITE;
/*!40000 ALTER TABLE `wx_qrcode` DISABLE KEYS */;
INSERT INTO `wx_qrcode` VALUES ('032a5405-4a27-4991-aac0-521cabe70e2f','1','2014-08-15 10:08:02','0815Test',10005,'QR_LIMIT_SCENE','gQGN8DoAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xL2ZVeDVYMkxseFBPOWt1bkVPV0FUAAIEjWvtUwMEAAAAAA==','http://bcs.duapp.com/wechatimages%2Fqrcode%2F10005.jpg'),('1','1','1','***',8080,'QR_LIMIT_SCENE','gQFN8DoAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xL0hrd0ZveDdsa2ZQb2NZb1JSV0FUAAIEpxnoUwMEAAAAAA==','http://bcs.duapp.com/wechatimages%2Fqrcode%2Fqrcode.jpg'),('317f9d42-58b4-423f-bac4-bd88d2e35bae','1','2014-08-13 08:48:14','0813Test',10004,'QR_LIMIT_SCENE','gQEd8ToAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xL0dreEp5bTNsd1BPNWI0NWxDV0FUAAIE1LXqUwMEAAAAAA==','http://bcs.duapp.com/wechatimages%2Fqrcode%2F10004.jpg'),('62ee1a79-a8e4-4896-8b55-f14ea7bb7bda','1','2014-08-28 11:19:00','08281',10011,'QR_SCENE','gQGJ8ToAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xLzhVd2xORW5sUS1NNlhtVjBaV0FUAAIEpZ/_UwMEAAAAAA==','http://bcs.duapp.com/wechatimages%2Fqrcode%2F10011.jpg'),('6e976c24-ecda-4080-ae8d-bc35da9854ee','1','2014-08-12 14:19:14','爱上飞达水电费',10003,'QR_LIMIT_SCENE','gQEi8ToAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xL09FeFFULTNsdy1PNldLejZFR0FUAAIEaa3pUwMEAAAAAA==','http://bcs.duapp.com/wechatimages%2Fqrcode%2F10003.jpg'),('74a53d42-1893-40cf-ac6f-c900abf6b3d8','1','2014-08-28 09:36:10','0828',10010,'QR_LIMIT_SCENE','gQHD8ToAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xLzVreDJNMXpsNWZPY1czS0dObUFUAAIEi4f_UwMEAAAAAA==','http://bcs.duapp.com/wechatimages%2Fqrcode%2F10010.jpg'),('a78586e5-1a93-4fa7-91d0-9729a6e10205','1','2014-08-15 15:49:30','扫描新增用户测试',10007,'QR_LIMIT_SCENE','gQG68DoAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xL3dreGxndFRsX3ZPRFJsWTdKV0FUAAIEi7vtUwMEAAAAAA==','http://bcs.duapp.com/wechatimages%2Fqrcode%2F10007.jpg'),('bcbf0246-87a9-4964-a6c9-7ab91b50fdf9','1','2014-08-16 11:13:27','0816test',10008,'QR_LIMIT_SCENE','gQHk8DoAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xL1oweDFZOC1sNnZPVEdmUGFOV0FUAAIEWMzuUwMEAAAAAA==','http://bcs.duapp.com/wechatimages%2Fqrcode%2F10008.jpg'),('bd5a8694-2b2d-4831-9544-2e7920ff1f6a','1','2014-08-16 16:54:44','08161',10009,'QR_SCENE','gQHC7zoAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xL1hFd2pwaEhscXZQVE9jZ0pZMkFUAAIEVRzvUwMEAAAAAA==','http://bcs.duapp.com/wechatimages%2Fqrcode%2F10009.jpg'),('de2e7878-1d74-4858-986c-c8c94aa56c00','1','2014-08-12 12:56:21','zhao',10001,'QR_LIMIT_SCENE','gQHR8ToAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xL2RFeHEtNjdsNS1PZTlfQlVLbUFUAAIEupzpUwMEAAAAAA==','http://bcs.duapp.com/wechatimages%2Fqrcode%2F10001.jpg'),('ea99872d-c1a4-47f9-85da-ed515884f7a2','1','2014-08-15 15:32:08','8080',10006,'QR_LIMIT_SCENE','gQFH8DoAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xL1kwd0FDUVhsbXZQanZmZTFRR0FUAAIEerftUwMEAAAAAA==','http://bcs.duapp.com/wechatimages%2Fqrcode%2F10006.jpg'),('ee4f9c92-88fa-41ff-a6e9-6d74bc9bd6ac','1','2014-08-12 12:58:11','你好啊',10002,'QR_SCENE','gQGl8DoAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xL0wwd2c4YkxscnZQWHZydFpZR0FUAAIE557pUwMEAAAAAA==','http://bcs.duapp.com/wechatimages%2Fqrcode%2F10002.jpg'),('f21f7f03-1625-404e-8ef2-59724ee49e71','1','2014-08-12 12:44:14','test',10000,'QR_LIMIT_SCENE','gQEb8DoAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xL2hVd19CM1BsdHZQUEl4R3BmbUFUAAIEb5npUwMEAAAAAA==',NULL);
/*!40000 ALTER TABLE `wx_qrcode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wx_smart`
--

DROP TABLE IF EXISTS `wx_smart`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `wx_smart` (
  `id` varchar(36) NOT NULL,
  `accountId` varchar(36) DEFAULT NULL,
  `subscribe` varchar(36) DEFAULT NULL,
  `subscribe_key` varchar(36) DEFAULT NULL,
  `nomatch` varchar(36) DEFAULT NULL,
  `nomatch_key` varchar(36) DEFAULT NULL,
  `addTime` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `wx_smart`
--

LOCK TABLES `wx_smart` WRITE;
/*!40000 ALTER TABLE `wx_smart` DISABLE KEYS */;
INSERT INTO `wx_smart` VALUES ('25cb4d74-1d36-4696-8ebe-fea6d181a030','0001','yes','3a17f289-1955-485e-84d7-7e567efb63e9','no','','2014-08-27 15:39:27'),('68b98202-bb80-417f-9d66-3263d644fe43','4ee5d3d9-96e3-4104-9432-6eec84d56dd8','yes','3a17f289-1955-485e-84d7-7e567efb63e9','no','','2014-08-31 16:09:18');
/*!40000 ALTER TABLE `wx_smart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wx_texttemplate`
--

DROP TABLE IF EXISTS `wx_texttemplate`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `wx_texttemplate` (
  `id` varchar(36) NOT NULL,
  `addTime` varchar(20) DEFAULT NULL,
  `templateName` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `accountId` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `wx_texttemplate`
--

LOCK TABLES `wx_texttemplate` WRITE;
/*!40000 ALTER TABLE `wx_texttemplate` DISABLE KEYS */;
INSERT INTO `wx_texttemplate` VALUES ('001','2014-08-07 12:12:12','测试模板一','测试啊测试啊测试啊测试啊','123'),('2','22','22','22','22'),('59a18d30-512d-45ff-b057-4e65cacf1847','2014-08-08 16:53:29','测试赛意思','啊沙发上飞洒地方','123'),('b0c12bf0-f8b4-4152-b214-198670d85412','2014-08-24 18:04:45','wang','hahhahahhahah123','123');
/*!40000 ALTER TABLE `wx_texttemplate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wx_userinfo`
--

DROP TABLE IF EXISTS `wx_userinfo`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `wx_userinfo` (
  `id` varchar(36) NOT NULL,
  `subscribe` varchar(255) DEFAULT NULL,
  `openid` varchar(255) DEFAULT NULL,
  `nickname` varchar(255) DEFAULT NULL,
  `sex` int(5) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `province` varchar(255) DEFAULT NULL,
  `language` varchar(255) DEFAULT NULL,
  `headimgurl` varchar(1000) DEFAULT NULL,
  `subscribe_time` varchar(20) DEFAULT NULL,
  `unionid` varchar(255) DEFAULT NULL,
  `remark` varchar(1000) DEFAULT NULL,
  `accountid` varchar(36) DEFAULT NULL,
  `tag` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `wx_userinfo`
--

LOCK TABLES `wx_userinfo` WRITE;
/*!40000 ALTER TABLE `wx_userinfo` DISABLE KEYS */;
INSERT INTO `wx_userinfo` VALUES ('1bd8c13c-244f-11e4-9cc6-6cae8b4ff252','1','o12t0t_TYxQQ2mRxqf1vgGzOMQZk','学 无止境',1,'保定','中国','河北','zh_CN','http://wx.qlogo.cn/mmopen/PWtFBe0Gvf8jBeWT2vwOqeppbgg429tErIib9VxaotWU1qPyFXfUXoudvibV5K5HMicrWjjQqxlUTdqbelJbYN0bn1lT33ROPib3/0','1408087433',NULL,NULL,'1',NULL),('206776a3-acca-4ab0-bc9f-8215bc9decf1','1','o12t0t4m6uLtbGg9ppsv88KbIcpg','爱琳 | 中老年产业联盟',2,'','中国','上海','zh_CN','http://wx.qlogo.cn/mmopen/5GVzRu5ib7Qc5OHVibIxiaU3siaTGIqZ4q4icr6iaUKXm3xO98VH6VLrALWPrqc2nNYrJtdvW6XmiaxC3vsSuSrPwqPtQ/0','1408211571',NULL,'','1',NULL),('268b6fc9-faab-46be-9c99-9c70a6ebd07e','1','o12t0t6XTy4fIEgm560Asmzybl7c','听',1,'朝阳','中国','北京','zh_CN','http://wx.qlogo.cn/mmopen/ajNVdqHZLLCiaMb5dibPRN1CFI5qY0mqewRJvDKgZJXC73tmRT7otKVh5wSNvtsEHficbQ9luVl2o7lHXIR1agPCQ/0','1408089100',NULL,'','1','gQG68DoAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xL3dreGxndFRsX3ZPRFJsWTdKV0FUAAIEi7vtUwMEAAAAAA=='),('8ca226c8-1646-4158-b1c5-631b9e40018b','1','o12t0t_TYxQQ2mRxqf1vgGzOMQZk','学 无止境',1,'保定','中国','河北','zh_CN','http://wx.qlogo.cn/mmopen/PWtFBe0Gvf8jBeWT2vwOqeppbgg429tErIib9VxaotWU1qPyFXfUXoudvibV5K5HMicrWjjQqxlUTdqbelJbYN0bn1lT33ROPib3/0','1408088841',NULL,'','1',NULL),('9e90e090-0a09-422c-a22a-a4f077b9c630','1','o12t0t56AYrBtC8EzxlnGnj5Dkwk','nancy',0,'石家庄','中国','河北','zh_CN','http://wx.qlogo.cn/mmopen/eKt2DTM9GXZibicTXMnyPIQjf9Oc3m2nxrNKkPksXZsOsibQRxrHdqO7BOgZVFfrOldtWKicqTV6XpWBQOgSrxxTk3pWibdOSchVn/0','1409539059',NULL,'','4ee5d3d9-96e3-4104-9432-6eec84d56dd8',NULL),('f634bd90-e2eb-4164-9ed0-a54cbeb2e125','1','o12t0t4AGIpWgBNLHlOkN_InIkTg','木子/Ringla',0,'','','','zh_CN','http://wx.qlogo.cn/mmopen/PWtFBe0Gvf8jBeWT2vwOqehFdEzwHib7w7hicc7zs58D5sSHJEBf6QfttXOBgmZC3CEgFicvSUGMKJturWdWd7Kl403qFiajxXdL/0','1410835989',NULL,'','4ee5d3d9-96e3-4104-9432-6eec84d56dd8',NULL);
/*!40000 ALTER TABLE `wx_userinfo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-10-11  3:16:05

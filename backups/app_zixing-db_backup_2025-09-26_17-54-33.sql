-- MySQL dump 10.13  Distrib 8.0.43, for Linux (x86_64)
--
-- Host: localhost    Database: app_zixing
-- ------------------------------------------------------
-- Server version	8.0.43-0ubuntu0.24.04.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `dr_1_news`
--

DROP TABLE IF EXISTS `dr_1_news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dr_1_news` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `catid` smallint unsigned NOT NULL COMMENT '栏目id',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '主题',
  `thumb` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '缩略图',
  `keywords` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '关键字',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '描述',
  `hits` int unsigned DEFAULT NULL COMMENT '浏览数',
  `uid` int unsigned NOT NULL COMMENT '作者id',
  `author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '笔名',
  `status` tinyint NOT NULL COMMENT '状态(已废弃)',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '地址',
  `link_id` int NOT NULL DEFAULT '0' COMMENT '同步id',
  `tableid` smallint unsigned NOT NULL COMMENT '附表id',
  `inputip` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '客户端ip信息',
  `inputtime` int unsigned NOT NULL COMMENT '录入时间',
  `updatetime` int unsigned NOT NULL COMMENT '更新时间',
  `displayorder` int DEFAULT '0' COMMENT '排序值',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `catid` (`catid`),
  KEY `link_id` (`link_id`),
  KEY `status` (`status`),
  KEY `updatetime` (`updatetime`),
  KEY `hits` (`hits`),
  KEY `category` (`catid`,`status`),
  KEY `displayorder` (`displayorder`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='内容主表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dr_1_news`
--

LOCK TABLES `dr_1_news` WRITE;
/*!40000 ALTER TABLE `dr_1_news` DISABLE KEYS */;
/*!40000 ALTER TABLE `dr_1_news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dr_1_news_category`
--

DROP TABLE IF EXISTS `dr_1_news_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dr_1_news_category` (
  `id` mediumint unsigned NOT NULL AUTO_INCREMENT,
  `pid` mediumint unsigned NOT NULL DEFAULT '0' COMMENT '上级id',
  `pids` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '所有上级id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '栏目名称',
  `dirname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '栏目目录',
  `pdirname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '上级目录',
  `child` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否有下级',
  `disabled` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否禁用',
  `ismain` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '是否主栏目',
  `childids` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '下级所有id',
  `thumb` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '栏目图片',
  `show` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '是否显示',
  `setting` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '属性配置',
  `displayorder` mediumint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `show` (`show`),
  KEY `disabled` (`disabled`),
  KEY `ismain` (`ismain`),
  KEY `module` (`pid`,`displayorder`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='栏目表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dr_1_news_category`
--

LOCK TABLES `dr_1_news_category` WRITE;
/*!40000 ALTER TABLE `dr_1_news_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `dr_1_news_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dr_1_news_category_data`
--

DROP TABLE IF EXISTS `dr_1_news_category_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dr_1_news_category_data` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `uid` mediumint unsigned NOT NULL COMMENT '作者uid',
  `catid` int unsigned NOT NULL COMMENT '栏目id',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `catid` (`catid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='栏目模型表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dr_1_news_category_data`
--

LOCK TABLES `dr_1_news_category_data` WRITE;
/*!40000 ALTER TABLE `dr_1_news_category_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `dr_1_news_category_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dr_1_news_data_0`
--

DROP TABLE IF EXISTS `dr_1_news_data_0`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dr_1_news_data_0` (
  `id` int unsigned NOT NULL,
  `uid` mediumint unsigned NOT NULL COMMENT '作者uid',
  `catid` smallint unsigned NOT NULL COMMENT '栏目id',
  `content` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '内容',
  UNIQUE KEY `id` (`id`),
  KEY `uid` (`uid`),
  KEY `catid` (`catid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='内容附表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dr_1_news_data_0`
--

LOCK TABLES `dr_1_news_data_0` WRITE;
/*!40000 ALTER TABLE `dr_1_news_data_0` DISABLE KEYS */;
/*!40000 ALTER TABLE `dr_1_news_data_0` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dr_1_news_draft`
--

DROP TABLE IF EXISTS `dr_1_news_draft`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dr_1_news_draft` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `cid` int unsigned NOT NULL COMMENT '内容id',
  `uid` mediumint unsigned NOT NULL COMMENT '作者uid',
  `catid` mediumint unsigned NOT NULL COMMENT '栏目id',
  `content` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '具体内容',
  `inputtime` int unsigned NOT NULL COMMENT '录入时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `cid` (`cid`),
  KEY `catid` (`catid`),
  KEY `inputtime` (`inputtime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='内容草稿表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dr_1_news_draft`
--

LOCK TABLES `dr_1_news_draft` WRITE;
/*!40000 ALTER TABLE `dr_1_news_draft` DISABLE KEYS */;
/*!40000 ALTER TABLE `dr_1_news_draft` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dr_1_news_flag`
--

DROP TABLE IF EXISTS `dr_1_news_flag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dr_1_news_flag` (
  `flag` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '文档标记id',
  `id` int unsigned NOT NULL COMMENT '文档内容id',
  `uid` mediumint unsigned NOT NULL COMMENT '作者uid',
  `catid` mediumint unsigned NOT NULL COMMENT '栏目id',
  KEY `flag` (`flag`,`id`,`uid`),
  KEY `catid` (`catid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='标记表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dr_1_news_flag`
--

LOCK TABLES `dr_1_news_flag` WRITE;
/*!40000 ALTER TABLE `dr_1_news_flag` DISABLE KEYS */;
/*!40000 ALTER TABLE `dr_1_news_flag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dr_1_news_hits`
--

DROP TABLE IF EXISTS `dr_1_news_hits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dr_1_news_hits` (
  `id` int unsigned NOT NULL COMMENT '文章id',
  `hits` int unsigned NOT NULL COMMENT '总点击数',
  `day_hits` int unsigned NOT NULL COMMENT '本日点击',
  `week_hits` int unsigned NOT NULL COMMENT '本周点击',
  `month_hits` int unsigned NOT NULL COMMENT '本月点击',
  `year_hits` int unsigned NOT NULL COMMENT '年点击量',
  `day_time` int unsigned NOT NULL COMMENT '本日',
  `week_time` int unsigned NOT NULL COMMENT '本周',
  `month_time` int unsigned NOT NULL COMMENT '本月',
  `year_time` int unsigned NOT NULL COMMENT '年',
  UNIQUE KEY `id` (`id`),
  KEY `day_hits` (`day_hits`),
  KEY `week_hits` (`week_hits`),
  KEY `month_hits` (`month_hits`),
  KEY `year_hits` (`year_hits`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='时段点击量统计';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dr_1_news_hits`
--

LOCK TABLES `dr_1_news_hits` WRITE;
/*!40000 ALTER TABLE `dr_1_news_hits` DISABLE KEYS */;
/*!40000 ALTER TABLE `dr_1_news_hits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dr_1_news_index`
--

DROP TABLE IF EXISTS `dr_1_news_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dr_1_news_index` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `uid` mediumint unsigned NOT NULL COMMENT '作者uid',
  `catid` mediumint unsigned NOT NULL COMMENT '栏目id',
  `status` tinyint NOT NULL COMMENT '审核状态',
  `inputtime` int unsigned NOT NULL COMMENT '录入时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `catid` (`catid`),
  KEY `status` (`status`),
  KEY `inputtime` (`inputtime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='内容索引表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dr_1_news_index`
--

LOCK TABLES `dr_1_news_index` WRITE;
/*!40000 ALTER TABLE `dr_1_news_index` DISABLE KEYS */;
/*!40000 ALTER TABLE `dr_1_news_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dr_1_news_recycle`
--

DROP TABLE IF EXISTS `dr_1_news_recycle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dr_1_news_recycle` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `cid` int unsigned NOT NULL COMMENT '内容id',
  `uid` mediumint unsigned NOT NULL COMMENT '作者uid',
  `catid` tinyint unsigned NOT NULL COMMENT '栏目id',
  `content` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '具体内容',
  `result` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '删除理由',
  `inputtime` int unsigned NOT NULL COMMENT '录入时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `cid` (`cid`),
  KEY `catid` (`catid`),
  KEY `inputtime` (`inputtime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='内容回收站表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dr_1_news_recycle`
--

LOCK TABLES `dr_1_news_recycle` WRITE;
/*!40000 ALTER TABLE `dr_1_news_recycle` DISABLE KEYS */;
/*!40000 ALTER TABLE `dr_1_news_recycle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dr_1_news_search`
--

DROP TABLE IF EXISTS `dr_1_news_search`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dr_1_news_search` (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `catid` mediumint unsigned NOT NULL COMMENT '栏目id',
  `params` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '参数数组',
  `keyword` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '关键字',
  `contentid` int unsigned NOT NULL COMMENT '字段改成了结果数量值',
  `inputtime` int unsigned NOT NULL COMMENT '搜索时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `catid` (`catid`),
  KEY `keyword` (`keyword`),
  KEY `inputtime` (`inputtime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='搜索表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dr_1_news_search`
--

LOCK TABLES `dr_1_news_search` WRITE;
/*!40000 ALTER TABLE `dr_1_news_search` DISABLE KEYS */;
/*!40000 ALTER TABLE `dr_1_news_search` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dr_1_news_time`
--

DROP TABLE IF EXISTS `dr_1_news_time`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dr_1_news_time` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `uid` mediumint unsigned NOT NULL COMMENT '作者uid',
  `catid` mediumint unsigned NOT NULL COMMENT '栏目id',
  `content` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '具体内容',
  `result` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '处理结果',
  `posttime` int unsigned NOT NULL COMMENT '定时发布时间',
  `inputtime` int unsigned NOT NULL COMMENT '录入时间',
  `error` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `catid` (`catid`),
  KEY `posttime` (`posttime`),
  KEY `inputtime` (`inputtime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='内容定时发布表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dr_1_news_time`
--

LOCK TABLES `dr_1_news_time` WRITE;
/*!40000 ALTER TABLE `dr_1_news_time` DISABLE KEYS */;
/*!40000 ALTER TABLE `dr_1_news_time` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dr_1_news_verify`
--

DROP TABLE IF EXISTS `dr_1_news_verify`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dr_1_news_verify` (
  `id` int unsigned NOT NULL,
  `uid` mediumint unsigned NOT NULL COMMENT '作者uid',
  `vid` tinyint NOT NULL COMMENT '审核id号',
  `isnew` tinyint unsigned NOT NULL COMMENT '0修改1新增2删除',
  `islock` tinyint unsigned NOT NULL COMMENT '是否锁定',
  `author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '作者',
  `catid` mediumint unsigned NOT NULL COMMENT '栏目id',
  `status` tinyint NOT NULL COMMENT '审核状态',
  `content` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '具体内容',
  `backuid` mediumint unsigned NOT NULL COMMENT '操作人uid',
  `backinfo` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '操作退回信息',
  `inputtime` int unsigned NOT NULL COMMENT '录入时间',
  UNIQUE KEY `id` (`id`),
  KEY `uid` (`uid`),
  KEY `vid` (`vid`),
  KEY `catid` (`catid`),
  KEY `status` (`status`),
  KEY `inputtime` (`inputtime`),
  KEY `backuid` (`backuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='内容审核表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dr_1_news_verify`
--

LOCK TABLES `dr_1_news_verify` WRITE;
/*!40000 ALTER TABLE `dr_1_news_verify` DISABLE KEYS */;
/*!40000 ALTER TABLE `dr_1_news_verify` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dr_1_product`
--

DROP TABLE IF EXISTS `dr_1_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dr_1_product` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `catid` smallint unsigned NOT NULL COMMENT '栏目id',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '主题',
  `thumb` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '缩略图',
  `keywords` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '关键字',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '描述',
  `hits` int unsigned DEFAULT NULL COMMENT '浏览数',
  `uid` int unsigned NOT NULL COMMENT '作者id',
  `author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '笔名',
  `status` tinyint NOT NULL COMMENT '状态(已废弃)',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '地址',
  `link_id` int NOT NULL DEFAULT '0' COMMENT '同步id',
  `tableid` smallint unsigned NOT NULL COMMENT '附表id',
  `inputip` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '客户端ip信息',
  `inputtime` int unsigned NOT NULL COMMENT '录入时间',
  `updatetime` int unsigned NOT NULL COMMENT '更新时间',
  `displayorder` int DEFAULT '0' COMMENT '排序值',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `catid` (`catid`),
  KEY `link_id` (`link_id`),
  KEY `status` (`status`),
  KEY `updatetime` (`updatetime`),
  KEY `hits` (`hits`),
  KEY `category` (`catid`,`status`),
  KEY `displayorder` (`displayorder`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='内容主表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dr_1_product`
--

LOCK TABLES `dr_1_product` WRITE;
/*!40000 ALTER TABLE `dr_1_product` DISABLE KEYS */;
INSERT INTO `dr_1_product` VALUES (16,12,'平烘箱烫金机','89',NULL,'',1,1,'创始人',9,'/index.php?c=show&id=16',0,0,'123.128.231.164-1723',1758801264,1758801264,0),(17,12,'桥型烘箱烫金机','90',NULL,'',1,1,'创始人',9,'/index.php?c=show&id=17',0,0,'123.128.231.164-1723',1758801353,1758801353,0),(18,12,' 桥型传动轴传动烫金机','91',NULL,'',1,1,'创始人',9,'/index.php?c=show&id=18',0,0,'123.128.231.164-7180',1758801373,1758801373,0),(19,12,'烫金机','92',NULL,'',1,1,'创始人',9,'/index.php?c=show&id=19',0,0,'123.128.231.164-7180',1758801392,1758801392,0),(20,12,'烫金机','93',NULL,'',1,1,'创始人',9,'/index.php?c=show&id=20',0,0,'123.128.231.164-3620',1758801558,1758801558,0),(21,12,'烫金机','94',NULL,'',1,1,'创始人',9,'/index.php?c=show&id=21',0,0,'123.128.231.164-3620',1758801575,1758801575,0);
/*!40000 ALTER TABLE `dr_1_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dr_1_product_category`
--

DROP TABLE IF EXISTS `dr_1_product_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dr_1_product_category` (
  `id` mediumint unsigned NOT NULL AUTO_INCREMENT,
  `pid` mediumint unsigned NOT NULL DEFAULT '0' COMMENT '上级id',
  `pids` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '所有上级id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '栏目名称',
  `dirname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '栏目目录',
  `pdirname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '上级目录',
  `child` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否有下级',
  `disabled` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否禁用',
  `ismain` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '是否主栏目',
  `childids` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '下级所有id',
  `thumb` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '栏目图片',
  `show` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '是否显示',
  `setting` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '属性配置',
  `displayorder` mediumint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `show` (`show`),
  KEY `disabled` (`disabled`),
  KEY `ismain` (`ismain`),
  KEY `module` (`pid`,`displayorder`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='栏目表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dr_1_product_category`
--

LOCK TABLES `dr_1_product_category` WRITE;
/*!40000 ALTER TABLE `dr_1_product_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `dr_1_product_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dr_1_product_category_data`
--

DROP TABLE IF EXISTS `dr_1_product_category_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dr_1_product_category_data` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `uid` mediumint unsigned NOT NULL COMMENT '作者uid',
  `catid` int unsigned NOT NULL COMMENT '栏目id',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `catid` (`catid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='栏目模型表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dr_1_product_category_data`
--

LOCK TABLES `dr_1_product_category_data` WRITE;
/*!40000 ALTER TABLE `dr_1_product_category_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `dr_1_product_category_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dr_1_product_data_0`
--

DROP TABLE IF EXISTS `dr_1_product_data_0`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dr_1_product_data_0` (
  `id` int unsigned NOT NULL,
  `uid` mediumint unsigned NOT NULL COMMENT '作者uid',
  `catid` smallint unsigned NOT NULL COMMENT '栏目id',
  `content` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '内容',
  UNIQUE KEY `id` (`id`),
  KEY `uid` (`uid`),
  KEY `catid` (`catid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='内容附表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dr_1_product_data_0`
--

LOCK TABLES `dr_1_product_data_0` WRITE;
/*!40000 ALTER TABLE `dr_1_product_data_0` DISABLE KEYS */;
INSERT INTO `dr_1_product_data_0` VALUES (16,1,12,NULL),(17,1,12,NULL),(18,1,12,NULL),(19,1,12,NULL),(20,1,12,NULL),(21,1,12,NULL);
/*!40000 ALTER TABLE `dr_1_product_data_0` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dr_1_product_draft`
--

DROP TABLE IF EXISTS `dr_1_product_draft`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dr_1_product_draft` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `cid` int unsigned NOT NULL COMMENT '内容id',
  `uid` mediumint unsigned NOT NULL COMMENT '作者uid',
  `catid` mediumint unsigned NOT NULL COMMENT '栏目id',
  `content` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '具体内容',
  `inputtime` int unsigned NOT NULL COMMENT '录入时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `cid` (`cid`),
  KEY `catid` (`catid`),
  KEY `inputtime` (`inputtime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='内容草稿表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dr_1_product_draft`
--

LOCK TABLES `dr_1_product_draft` WRITE;
/*!40000 ALTER TABLE `dr_1_product_draft` DISABLE KEYS */;
/*!40000 ALTER TABLE `dr_1_product_draft` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dr_1_product_flag`
--

DROP TABLE IF EXISTS `dr_1_product_flag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dr_1_product_flag` (
  `flag` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '文档标记id',
  `id` int unsigned NOT NULL COMMENT '文档内容id',
  `uid` mediumint unsigned NOT NULL COMMENT '作者uid',
  `catid` mediumint unsigned NOT NULL COMMENT '栏目id',
  KEY `flag` (`flag`,`id`,`uid`),
  KEY `catid` (`catid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='标记表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dr_1_product_flag`
--

LOCK TABLES `dr_1_product_flag` WRITE;
/*!40000 ALTER TABLE `dr_1_product_flag` DISABLE KEYS */;
/*!40000 ALTER TABLE `dr_1_product_flag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dr_1_product_hits`
--

DROP TABLE IF EXISTS `dr_1_product_hits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dr_1_product_hits` (
  `id` int unsigned NOT NULL COMMENT '文章id',
  `hits` int unsigned NOT NULL COMMENT '总点击数',
  `day_hits` int unsigned NOT NULL COMMENT '本日点击',
  `week_hits` int unsigned NOT NULL COMMENT '本周点击',
  `month_hits` int unsigned NOT NULL COMMENT '本月点击',
  `year_hits` int unsigned NOT NULL COMMENT '年点击量',
  `day_time` int unsigned NOT NULL COMMENT '本日',
  `week_time` int unsigned NOT NULL COMMENT '本周',
  `month_time` int unsigned NOT NULL COMMENT '本月',
  `year_time` int unsigned NOT NULL COMMENT '年',
  UNIQUE KEY `id` (`id`),
  KEY `day_hits` (`day_hits`),
  KEY `week_hits` (`week_hits`),
  KEY `month_hits` (`month_hits`),
  KEY `year_hits` (`year_hits`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='时段点击量统计';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dr_1_product_hits`
--

LOCK TABLES `dr_1_product_hits` WRITE;
/*!40000 ALTER TABLE `dr_1_product_hits` DISABLE KEYS */;
INSERT INTO `dr_1_product_hits` VALUES (1,2,1,1,1,1,1743498641,1743498641,1743498641,1743498641),(10,2,1,1,1,1,1743561042,1743561042,1743561042,1743561042);
/*!40000 ALTER TABLE `dr_1_product_hits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dr_1_product_index`
--

DROP TABLE IF EXISTS `dr_1_product_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dr_1_product_index` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `uid` mediumint unsigned NOT NULL COMMENT '作者uid',
  `catid` mediumint unsigned NOT NULL COMMENT '栏目id',
  `status` tinyint NOT NULL COMMENT '审核状态',
  `inputtime` int unsigned NOT NULL COMMENT '录入时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `catid` (`catid`),
  KEY `status` (`status`),
  KEY `inputtime` (`inputtime`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='内容索引表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dr_1_product_index`
--

LOCK TABLES `dr_1_product_index` WRITE;
/*!40000 ALTER TABLE `dr_1_product_index` DISABLE KEYS */;
INSERT INTO `dr_1_product_index` VALUES (16,1,12,9,1758801264),(17,1,12,9,1758801353),(18,1,12,9,1758801373),(19,1,12,9,1758801392),(20,1,12,9,1758801558),(21,1,12,9,1758801575);
/*!40000 ALTER TABLE `dr_1_product_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dr_1_product_recycle`
--

DROP TABLE IF EXISTS `dr_1_product_recycle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dr_1_product_recycle` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `cid` int unsigned NOT NULL COMMENT '内容id',
  `uid` mediumint unsigned NOT NULL COMMENT '作者uid',
  `catid` tinyint unsigned NOT NULL COMMENT '栏目id',
  `content` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '具体内容',
  `result` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '删除理由',
  `inputtime` int unsigned NOT NULL COMMENT '录入时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `cid` (`cid`),
  KEY `catid` (`catid`),
  KEY `inputtime` (`inputtime`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='内容回收站表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dr_1_product_recycle`
--

LOCK TABLES `dr_1_product_recycle` WRITE;
/*!40000 ALTER TABLE `dr_1_product_recycle` DISABLE KEYS */;
INSERT INTO `dr_1_product_recycle` VALUES (1,7,1,5,'{\"1_product\":{\"id\":\"7\",\"catid\":\"5\",\"title\":\"DSJ 同心双轴搅拌釜\",\"thumb\":\"19\",\"keywords\":null,\"description\":\"\",\"hits\":\"1\",\"uid\":\"1\",\"author\":\"创始人\",\"status\":\"9\",\"url\":\"/index.php?c=show&id=7\",\"link_id\":\"0\",\"tableid\":\"0\",\"inputip\":\"222.135.74.179-33766\",\"inputtime\":\"1743418047\",\"updatetime\":\"1743418047\",\"displayorder\":\"0\"},\"1_product_data_0\":{\"id\":\"7\",\"uid\":\"1\",\"catid\":\"5\",\"content\":\"\"},\"1_product_category_data\":null}','',1743507351);
/*!40000 ALTER TABLE `dr_1_product_recycle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dr_1_product_search`
--

DROP TABLE IF EXISTS `dr_1_product_search`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dr_1_product_search` (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `catid` mediumint unsigned NOT NULL COMMENT '栏目id',
  `params` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '参数数组',
  `keyword` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '关键字',
  `contentid` int unsigned NOT NULL COMMENT '字段改成了结果数量值',
  `inputtime` int unsigned NOT NULL COMMENT '搜索时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `catid` (`catid`),
  KEY `keyword` (`keyword`),
  KEY `inputtime` (`inputtime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='搜索表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dr_1_product_search`
--

LOCK TABLES `dr_1_product_search` WRITE;
/*!40000 ALTER TABLE `dr_1_product_search` DISABLE KEYS */;
INSERT INTO `dr_1_product_search` VALUES ('7570fce05e5a585ef0ffa2da8916cc48',2,'{\"param\":{\"catid\":2},\"sql\":\"SELECT `dr_1_product`.`id` FROM `dr_1_product`  ORDER BY NULL \",\"where\":\"\"}','',6,1758871877),('8228f9e0847848bb550c15a63bf3bdc4',5,'{\"param\":{\"catid\":5},\"sql\":\"SELECT `dr_1_product`.`id` FROM `dr_1_product`  ORDER BY NULL \",\"where\":\"\"}','',6,1758871878),('90df29dcb37d481c6d6f67a392aa2429',4,'{\"param\":{\"catid\":4},\"sql\":\"SELECT `dr_1_product`.`id` FROM `dr_1_product`  ORDER BY NULL \",\"where\":\"\"}','',6,1758871878),('e224b0f2777213a8bacb89df1964b08a',3,'{\"param\":{\"catid\":3},\"sql\":\"SELECT `dr_1_product`.`id` FROM `dr_1_product`  ORDER BY NULL \",\"where\":\"\"}','',6,1758871877),('e4d3f0f554446440b4a963dbd0ee1193',9,'{\"param\":{\"catid\":9},\"sql\":\"SELECT `dr_1_product`.`id` FROM `dr_1_product` WHERE `dr_1_product`.`catid`IN (9,12,13,14,15,16,17,18,19,20,21,22,23) ORDER BY NULL \",\"where\":\"`dr_1_product`.`catid`IN (9,12,13,14,15,16,17,18,19,20,21,22,23)\"}','',6,1758871901);
/*!40000 ALTER TABLE `dr_1_product_search` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dr_1_product_time`
--

DROP TABLE IF EXISTS `dr_1_product_time`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dr_1_product_time` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `uid` mediumint unsigned NOT NULL COMMENT '作者uid',
  `catid` mediumint unsigned NOT NULL COMMENT '栏目id',
  `content` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '具体内容',
  `result` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '处理结果',
  `posttime` int unsigned NOT NULL COMMENT '定时发布时间',
  `inputtime` int unsigned NOT NULL COMMENT '录入时间',
  `error` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `catid` (`catid`),
  KEY `posttime` (`posttime`),
  KEY `inputtime` (`inputtime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='内容定时发布表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dr_1_product_time`
--

LOCK TABLES `dr_1_product_time` WRITE;
/*!40000 ALTER TABLE `dr_1_product_time` DISABLE KEYS */;
/*!40000 ALTER TABLE `dr_1_product_time` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dr_1_product_verify`
--

DROP TABLE IF EXISTS `dr_1_product_verify`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dr_1_product_verify` (
  `id` int unsigned NOT NULL,
  `uid` mediumint unsigned NOT NULL COMMENT '作者uid',
  `vid` tinyint NOT NULL COMMENT '审核id号',
  `isnew` tinyint unsigned NOT NULL COMMENT '0修改1新增2删除',
  `islock` tinyint unsigned NOT NULL COMMENT '是否锁定',
  `author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '作者',
  `catid` mediumint unsigned NOT NULL COMMENT '栏目id',
  `status` tinyint NOT NULL COMMENT '审核状态',
  `content` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '具体内容',
  `backuid` mediumint unsigned NOT NULL COMMENT '操作人uid',
  `backinfo` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '操作退回信息',
  `inputtime` int unsigned NOT NULL COMMENT '录入时间',
  UNIQUE KEY `id` (`id`),
  KEY `uid` (`uid`),
  KEY `vid` (`vid`),
  KEY `catid` (`catid`),
  KEY `status` (`status`),
  KEY `inputtime` (`inputtime`),
  KEY `backuid` (`backuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='内容审核表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dr_1_product_verify`
--

LOCK TABLES `dr_1_product_verify` WRITE;
/*!40000 ALTER TABLE `dr_1_product_verify` DISABLE KEYS */;
/*!40000 ALTER TABLE `dr_1_product_verify` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dr_1_share_category`
--

DROP TABLE IF EXISTS `dr_1_share_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dr_1_share_category` (
  `id` smallint unsigned NOT NULL AUTO_INCREMENT,
  `tid` tinyint(1) NOT NULL COMMENT '栏目类型，0单页，1模块，2外链',
  `pid` smallint unsigned NOT NULL DEFAULT '0' COMMENT '上级id',
  `mid` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '模块目录',
  `pids` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '所有上级id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '栏目名称',
  `dirname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '栏目目录',
  `pdirname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '上级目录',
  `child` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否有下级',
  `disabled` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否禁用',
  `ismain` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '是否主栏目',
  `childids` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '下级所有id',
  `thumb` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '栏目图片',
  `show` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '是否显示',
  `content` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '单页内容',
  `setting` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '属性配置',
  `displayorder` smallint NOT NULL DEFAULT '0',
  `atlas` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '图册',
  PRIMARY KEY (`id`),
  KEY `mid` (`mid`),
  KEY `tid` (`tid`),
  KEY `show` (`show`),
  KEY `disabled` (`disabled`),
  KEY `ismain` (`ismain`),
  KEY `dirname` (`dirname`),
  KEY `module` (`pid`,`displayorder`,`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='共享模块栏目表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dr_1_share_category`
--

LOCK TABLES `dr_1_share_category` WRITE;
/*!40000 ALTER TABLE `dr_1_share_category` DISABLE KEYS */;
INSERT INTO `dr_1_share_category` VALUES (1,1,0,'product','0','产品中心','product','',1,0,1,'1,9,12,13,14,15,16,17,18,19,20,21,22,23,10,11','',1,'','{\"disabled\":\"0\",\"linkurl\":\"\",\"getchild\":\"0\",\"notedit\":\"0\",\"urlrule\":null,\"seo\":{\"list_title\":\"[第{page}页{join}]{catpname}{join}{SITE_NAME}\",\"list_keywords\":\"\",\"list_description\":\"\"},\"template\":{\"pagesize\":\"20\",\"mpagesize\":\"20\",\"page\":\"page.html\",\"list\":\"list.html\",\"category\":\"category.html\",\"search\":\"search.html\",\"show\":\"show.html\"},\"cat_field\":null,\"module_field\":null}',0,NULL),(6,0,0,'','0','产品样品','cpyp','',0,0,1,'6','',1,'','{\"disabled\":\"0\",\"linkurl\":\"\",\"getchild\":\"1\",\"notedit\":0,\"urlrule\":\"0\",\"seo\":{\"list_title\":\"[第{page}页{join}]{name}{join}{SITE_NAME}\",\"list_keywords\":\"\",\"list_description\":\"\"},\"template\":{\"pagesize\":\"20\",\"mpagesize\":\"20\",\"page\":\"\",\"list\":\"list.html\",\"category\":\"category.html\",\"search\":\"search.html\",\"show\":\"show.html\"},\"cat_field\":null,\"module_field\":null}',0,'{\"file\":[\"73\",\"70\",\"72\",\"71\",\"69\",\"79\",\"80\",\"78\",\"76\",\"77\",\"75\",\"74\",\"83\",\"82\",\"81\",\"85\",\"84\",\"88\",\"87\",\"86\"],\"title\":[\"起皱1\",\"起皱2\",\"起皱3\",\"起皱4\",\"起皱5\",\"仿皮1\",\"仿皮2\",\"仿皮3\",\"仿皮4\",\"仿皮5\",\"仿皮6\",\"仿皮7\",\"烫金1\",\"烫金2\",\"烫金3\",\"平板压花1\",\"平板压花2\",\"滴塑1\",\"滴塑2\",\"滴塑3\"],\"description\":[\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\"]}'),(7,0,0,'','0','关于我们','about','',0,0,1,'7','',1,'&lt;p style=&quot;text-indent: 2em;&quot;&gt;无锡市前洲紫星染整机械厂（无锡埃尔德科技有限公司）座落在江南美丽富饶的太湖之滨，无锡市惠山区前洲(原无锡县)，历史悠久，山明水秀，经济发达，京沪高速铁路，新长铁路，沪宁高速公路横贯我镇，交通便利。&lt;/p&gt;&lt;p style=&quot;text-indent: 2em;&quot;&gt;我厂引进韩国生产工艺和技术，专业生产多功能新型烫金机，印花起绉设备和各种针纺，染整设备的专业厂家.本厂技术力量雄厚，产品质量过硬，产品遍及全国各省市.产品远销东南亚、欧美等，部分设备已通过欧洲CE认证。同时，我厂还生产PTFE膜设备和PE膜设备，如PTFE横向拉膜机，纵向拉膜机，高温覆合机等设备。本厂愿与客商结为亲密伙伴共同开发繁荣市场作新贡献。&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;https://zixing-app.wsw88.cn/uploadfile/ueditor/image/202509/1758808236173035.jpg&quot; title=&quot;about_us&quot; alt=&quot;about_us&quot; width=&quot;100%&quot; height=&quot;100%&quot; border=&quot;0&quot; vspace=&quot;0&quot;&gt;&lt;/p&gt;','{\"disabled\":\"0\",\"linkurl\":\"\",\"getchild\":\"0\",\"notedit\":0,\"urlrule\":\"0\",\"seo\":{\"list_title\":\"[第{page}页{join}]{catpname}{join}{SITE_NAME}\",\"list_keywords\":\"\",\"list_description\":\"\"},\"template\":{\"pagesize\":\"20\",\"mpagesize\":\"20\",\"page\":\"page.html\",\"list\":\"list.html\",\"category\":\"category.html\",\"search\":\"search.html\",\"show\":\"show.html\"},\"cat_field\":null,\"module_field\":null}',0,''),(8,0,0,'','0','联系我们','contact','',0,0,1,'8','',1,'&lt;p&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 20px;&quot;&gt;国内联系人&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;联系人：唐钱斌 / +86-13606178466&lt;/p&gt;&lt;p&gt;地址：无锡市前洲工业园兴洲路20号&lt;/p&gt;&lt;p&gt;电话：0510-83391048&lt;/p&gt;&lt;p&gt;传真：0510-83380848&lt;/p&gt;&lt;p&gt;邮箱：sales@zxrz.com&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;strong&gt;&lt;span style=&quot;text-decoration: none; font-size: 20px;&quot;&gt;国际联系人&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;text-decoration: none; font-size: 14px;&quot;&gt;联系人：唐钱斌 / +86-13606178466&lt;/span&gt;&lt;/p&gt;&lt;p&gt;地址：无锡市前洲工业园兴洲路20号&lt;/p&gt;&lt;p&gt;whatsapp：+86-13606178466&lt;/p&gt;&lt;p&gt;Skype：+86-13606178466&lt;/p&gt;&lt;p&gt;Wechat：+86-13606178466&lt;/p&gt;&lt;p&gt;邮箱：932748817@qq.com&lt;/p&gt;&lt;p&gt;sales@zxrz.com / qianbingood@163.com&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;text-decoration: none; font-size: 14px;&quot;&gt;&lt;/span&gt;&lt;br&gt;&lt;/p&gt;','{\"disabled\":\"0\",\"linkurl\":\"\",\"getchild\":\"0\",\"notedit\":0,\"urlrule\":\"0\",\"seo\":{\"list_title\":\"[第{page}页{join}]{catpname}{join}{SITE_NAME}\",\"list_keywords\":\"\",\"list_description\":\"\"},\"template\":{\"pagesize\":\"20\",\"mpagesize\":\"20\",\"page\":\"page.html\",\"list\":\"list.html\",\"category\":\"category.html\",\"search\":\"search.html\",\"show\":\"show.html\"},\"cat_field\":null,\"module_field\":null}',0,''),(9,1,1,'product','0,1','纺织后整理','fangzhihouzhengli','product/',1,0,1,'9,12,13,14,15,16,17,18,19,20,21,22,23','46',1,'&lt;p&gt;&lt;span style=&quot;color: rgba(0, 0, 0, 0.85); font-family: Inter, -apple-system, BlinkMacSystemFont, &amp;quot;Segoe UI&amp;quot;, &amp;quot;PingFang SC&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;Microsoft YaHei&amp;quot;, &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, sans-serif; font-size: 16px; text-wrap-mode: wrap; background-color: rgb(255, 255, 255);&quot;&gt;借助烫金机、滴塑机、压花机等专用设备，对纺织面料开展后续加工，从而赋予其特殊外观或功能的工艺过程。&lt;/span&gt;&lt;/p&gt;','{\"disabled\":\"0\",\"linkurl\":\"\",\"getchild\":\"0\",\"notedit\":\"0\",\"urlrule\":\"0\",\"seo\":{\"list_title\":\"[第{page}页{join}]{name}{join}{SITE_NAME}\",\"list_keywords\":\"\",\"list_description\":\"\"},\"template\":{\"pagesize\":\"20\",\"mpagesize\":\"20\",\"page\":\"\",\"list\":\"list.html\",\"category\":\"category.html\",\"search\":\"search.html\",\"show\":\"show.html\"},\"cat_field\":null,\"module_field\":null}',0,''),(10,1,1,'product','0,1','膜设备','moshebei','product/',0,0,1,'10','47',1,'','{\"disabled\":\"0\",\"linkurl\":\"\",\"getchild\":\"0\",\"notedit\":\"0\",\"urlrule\":\"0\",\"seo\":{\"list_title\":\"[第{page}页{join}]{name}{join}{SITE_NAME}\",\"list_keywords\":\"\",\"list_description\":\"\"},\"template\":{\"pagesize\":\"20\",\"mpagesize\":\"20\",\"page\":\"\",\"list\":\"list.html\",\"category\":\"category.html\",\"search\":\"search.html\",\"show\":\"show.html\"},\"cat_field\":null,\"module_field\":null}',0,''),(11,1,1,'product','0,1','非标设备','feibiaoshebei','product/',0,0,1,'11','48',1,'','{\"disabled\":\"0\",\"linkurl\":\"\",\"getchild\":\"0\",\"notedit\":\"0\",\"urlrule\":\"0\",\"seo\":{\"list_title\":\"[第{page}页{join}]{name}{join}{SITE_NAME}\",\"list_keywords\":\"\",\"list_description\":\"\"},\"template\":{\"pagesize\":\"20\",\"mpagesize\":\"20\",\"page\":\"\",\"list\":\"list.html\",\"category\":\"category.html\",\"search\":\"search.html\",\"show\":\"show.html\"},\"cat_field\":null,\"module_field\":null}',0,''),(12,1,9,'product','0,1,9','烫金机','tangjinji','product/fangzhihouzhengli/',0,0,1,'12','',1,'','{\"disabled\":\"0\",\"linkurl\":\"\",\"getchild\":0,\"notedit\":\"0\",\"urlrule\":0,\"seo\":{\"list_title\":\"[第{page}页{join}]{name}{join}{SITE_NAME}\",\"list_keywords\":\"\",\"list_description\":\"\"},\"template\":{\"pagesize\":\"20\",\"mpagesize\":\"20\",\"page\":\"\",\"list\":\"list.html\",\"category\":\"category.html\",\"search\":\"search.html\",\"show\":\"show.html\"},\"cat_field\":null,\"module_field\":null,\"html\":0,\"chtml\":0}',0,NULL),(13,1,9,'product','0,1,9','沙发仿皮生产线','shafafangpishengchanxian','product/fangzhihouzhengli/',0,0,1,'13','',1,'','{\"disabled\":\"0\",\"linkurl\":\"\",\"getchild\":0,\"notedit\":\"0\",\"urlrule\":0,\"seo\":{\"list_title\":\"[第{page}页{join}]{name}{join}{SITE_NAME}\",\"list_keywords\":\"\",\"list_description\":\"\"},\"template\":{\"pagesize\":\"20\",\"mpagesize\":\"20\",\"page\":\"\",\"list\":\"list.html\",\"category\":\"category.html\",\"search\":\"search.html\",\"show\":\"show.html\"},\"cat_field\":null,\"module_field\":null,\"html\":0,\"chtml\":0}',0,NULL),(14,1,9,'product','0,1,9','滴塑机','disuji','product/fangzhihouzhengli/',0,0,1,'14','',1,'','{\"disabled\":\"0\",\"linkurl\":\"\",\"getchild\":0,\"notedit\":\"0\",\"urlrule\":0,\"seo\":{\"list_title\":\"[第{page}页{join}]{name}{join}{SITE_NAME}\",\"list_keywords\":\"\",\"list_description\":\"\"},\"template\":{\"pagesize\":\"20\",\"mpagesize\":\"20\",\"page\":\"\",\"list\":\"list.html\",\"category\":\"category.html\",\"search\":\"search.html\",\"show\":\"show.html\"},\"cat_field\":null,\"module_field\":null,\"html\":0,\"chtml\":0}',0,NULL),(15,1,9,'product','0,1,9','三辊压花','sangunyahua','product/fangzhihouzhengli/',0,0,1,'15','',1,'','{\"disabled\":\"0\",\"linkurl\":\"\",\"getchild\":0,\"notedit\":\"0\",\"urlrule\":0,\"seo\":{\"list_title\":\"[第{page}页{join}]{name}{join}{SITE_NAME}\",\"list_keywords\":\"\",\"list_description\":\"\"},\"template\":{\"pagesize\":\"20\",\"mpagesize\":\"20\",\"page\":\"\",\"list\":\"list.html\",\"category\":\"category.html\",\"search\":\"search.html\",\"show\":\"show.html\"},\"cat_field\":null,\"module_field\":null,\"html\":0,\"chtml\":0}',0,NULL),(16,1,9,'product','0,1,9','平板压花','pingbanyahua','product/fangzhihouzhengli/',0,0,1,'16','',1,'','{\"disabled\":\"0\",\"linkurl\":\"\",\"getchild\":0,\"notedit\":\"0\",\"urlrule\":0,\"seo\":{\"list_title\":\"[第{page}页{join}]{name}{join}{SITE_NAME}\",\"list_keywords\":\"\",\"list_description\":\"\"},\"template\":{\"pagesize\":\"20\",\"mpagesize\":\"20\",\"page\":\"\",\"list\":\"list.html\",\"category\":\"category.html\",\"search\":\"search.html\",\"show\":\"show.html\"},\"cat_field\":null,\"module_field\":null,\"html\":0,\"chtml\":0}',0,NULL),(17,1,9,'product','0,1,9','热转移印花机','rezhuanyiyinhuaji','product/fangzhihouzhengli/',0,0,1,'17','',1,'','{\"disabled\":\"0\",\"linkurl\":\"\",\"getchild\":0,\"notedit\":\"0\",\"urlrule\":0,\"seo\":{\"list_title\":\"[第{page}页{join}]{name}{join}{SITE_NAME}\",\"list_keywords\":\"\",\"list_description\":\"\"},\"template\":{\"pagesize\":\"20\",\"mpagesize\":\"20\",\"page\":\"\",\"list\":\"list.html\",\"category\":\"category.html\",\"search\":\"search.html\",\"show\":\"show.html\"},\"cat_field\":null,\"module_field\":null,\"html\":0,\"chtml\":0}',0,NULL),(18,1,9,'product','0,1,9','复合机','fuheji','product/fangzhihouzhengli/',0,0,1,'18','',1,'','{\"disabled\":\"0\",\"linkurl\":\"\",\"getchild\":0,\"notedit\":\"0\",\"urlrule\":0,\"seo\":{\"list_title\":\"[第{page}页{join}]{name}{join}{SITE_NAME}\",\"list_keywords\":\"\",\"list_description\":\"\"},\"template\":{\"pagesize\":\"20\",\"mpagesize\":\"20\",\"page\":\"\",\"list\":\"list.html\",\"category\":\"category.html\",\"search\":\"search.html\",\"show\":\"show.html\"},\"cat_field\":null,\"module_field\":null,\"html\":0,\"chtml\":0}',0,NULL),(19,1,9,'product','0,1,9','套色印花机压金机','taoseyinhuajiyajinji','product/fangzhihouzhengli/',0,0,1,'19','',1,'','{\"disabled\":\"0\",\"linkurl\":\"\",\"getchild\":0,\"notedit\":\"0\",\"urlrule\":0,\"seo\":{\"list_title\":\"[第{page}页{join}]{name}{join}{SITE_NAME}\",\"list_keywords\":\"\",\"list_description\":\"\"},\"template\":{\"pagesize\":\"20\",\"mpagesize\":\"20\",\"page\":\"\",\"list\":\"list.html\",\"category\":\"category.html\",\"search\":\"search.html\",\"show\":\"show.html\"},\"cat_field\":null,\"module_field\":null,\"html\":0,\"chtml\":0}',0,NULL),(20,1,9,'product','0,1,9','金膜分离机','jinmofenliji','product/fangzhihouzhengli/',0,0,1,'20','',1,'','{\"disabled\":\"0\",\"linkurl\":\"\",\"getchild\":0,\"notedit\":\"0\",\"urlrule\":0,\"seo\":{\"list_title\":\"[第{page}页{join}]{name}{join}{SITE_NAME}\",\"list_keywords\":\"\",\"list_description\":\"\"},\"template\":{\"pagesize\":\"20\",\"mpagesize\":\"20\",\"page\":\"\",\"list\":\"list.html\",\"category\":\"category.html\",\"search\":\"search.html\",\"show\":\"show.html\"},\"cat_field\":null,\"module_field\":null,\"html\":0,\"chtml\":0}',0,NULL),(21,1,9,'product','0,1,9','滚涂机','guntuji','product/fangzhihouzhengli/',0,0,1,'21','',1,'','{\"disabled\":\"0\",\"linkurl\":\"\",\"getchild\":0,\"notedit\":\"0\",\"urlrule\":0,\"seo\":{\"list_title\":\"[第{page}页{join}]{name}{join}{SITE_NAME}\",\"list_keywords\":\"\",\"list_description\":\"\"},\"template\":{\"pagesize\":\"20\",\"mpagesize\":\"20\",\"page\":\"\",\"list\":\"list.html\",\"category\":\"category.html\",\"search\":\"search.html\",\"show\":\"show.html\"},\"cat_field\":null,\"module_field\":null,\"html\":0,\"chtml\":0}',0,NULL),(22,1,9,'product','0,1,9','针板进布','zhenbanjinbu','product/fangzhihouzhengli/',0,0,1,'22','',1,'','{\"disabled\":\"0\",\"linkurl\":\"\",\"getchild\":0,\"notedit\":\"0\",\"urlrule\":0,\"seo\":{\"list_title\":\"[第{page}页{join}]{name}{join}{SITE_NAME}\",\"list_keywords\":\"\",\"list_description\":\"\"},\"template\":{\"pagesize\":\"20\",\"mpagesize\":\"20\",\"page\":\"\",\"list\":\"list.html\",\"category\":\"category.html\",\"search\":\"search.html\",\"show\":\"show.html\"},\"cat_field\":null,\"module_field\":null,\"html\":0,\"chtml\":0}',0,NULL),(23,1,9,'product','0,1,9','大卷装','dajuanzhuang','product/fangzhihouzhengli/',0,0,1,'23','',1,'','{\"disabled\":\"0\",\"linkurl\":\"\",\"getchild\":0,\"notedit\":\"0\",\"urlrule\":0,\"seo\":{\"list_title\":\"[第{page}页{join}]{name}{join}{SITE_NAME}\",\"list_keywords\":\"\",\"list_description\":\"\"},\"template\":{\"pagesize\":\"20\",\"mpagesize\":\"20\",\"page\":\"\",\"list\":\"list.html\",\"category\":\"category.html\",\"search\":\"search.html\",\"show\":\"show.html\"},\"cat_field\":null,\"module_field\":null,\"html\":0,\"chtml\":0}',0,NULL),(24,0,0,'','0','资质荣誉','zizhirongyu','',0,0,1,'24','',1,'','{\"disabled\":\"0\",\"linkurl\":\"\",\"getchild\":\"0\",\"notedit\":0,\"urlrule\":\"0\",\"seo\":{\"list_title\":\"[第{page}页{join}]{catpname}{join}{SITE_NAME}\",\"list_keywords\":\"\",\"list_description\":\"\"},\"template\":{\"pagesize\":\"20\",\"mpagesize\":\"20\",\"page\":\"page.html\",\"list\":\"list.html\",\"category\":\"category.html\",\"search\":\"search.html\",\"show\":\"show.html\"},\"cat_field\":null,\"module_field\":null}',0,'{\"file\":[\"96\",\"97\"],\"title\":[\"企业营业执照\",\"商品注册认证\"],\"description\":[\"\",\"\"]}');
/*!40000 ALTER TABLE `dr_1_share_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dr_1_share_index`
--

DROP TABLE IF EXISTS `dr_1_share_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dr_1_share_index` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `mid` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '模块目录',
  PRIMARY KEY (`id`),
  KEY `mid` (`mid`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='共享模块内容索引表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dr_1_share_index`
--

LOCK TABLES `dr_1_share_index` WRITE;
/*!40000 ALTER TABLE `dr_1_share_index` DISABLE KEYS */;
INSERT INTO `dr_1_share_index` VALUES (1,'product'),(2,'product'),(3,'product'),(4,'product'),(5,'product'),(6,'product'),(7,'product'),(8,'product'),(9,'product'),(10,'product'),(11,'product'),(12,'product'),(13,'product'),(14,'product'),(15,'product'),(16,'product'),(17,'product'),(18,'product'),(19,'product'),(20,'product'),(21,'product');
/*!40000 ALTER TABLE `dr_1_share_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dr_admin`
--

DROP TABLE IF EXISTS `dr_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dr_admin` (
  `id` smallint unsigned NOT NULL AUTO_INCREMENT,
  `uid` int unsigned NOT NULL COMMENT '管理员uid',
  `setting` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '相关配置',
  `usermenu` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '自定义面板菜单，序列化数组格式',
  `history` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '历史菜单，序列化数组格式',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uid` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='管理员表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dr_admin`
--

LOCK TABLES `dr_admin` WRITE;
/*!40000 ALTER TABLE `dr_admin` DISABLE KEYS */;
INSERT INTO `dr_admin` VALUES (1,1,'','',NULL);
/*!40000 ALTER TABLE `dr_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dr_admin_login`
--

DROP TABLE IF EXISTS `dr_admin_login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dr_admin_login` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `uid` mediumint unsigned DEFAULT NULL COMMENT '会员uid',
  `loginip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '登录Ip',
  `logintime` int unsigned NOT NULL COMMENT '登录时间',
  `useragent` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '客户端信息',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `loginip` (`loginip`),
  KEY `logintime` (`logintime`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='登录日志记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dr_admin_login`
--

LOCK TABLES `dr_admin_login` WRITE;
/*!40000 ALTER TABLE `dr_admin_login` DISABLE KEYS */;
INSERT INTO `dr_admin_login` VALUES (1,1,'111.35.70.50',1742799214,'Mozilla/5.0 (Windows NT 10.0 Win64 x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36 Edg/134.0.0.0'),(2,1,'221.2.163.3',1742878592,'Mozilla/5.0 (Windows NT 10.0 Win64 x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36 Edg/134.0.0.0'),(3,1,'222.135.74.179',1742896765,'Mozilla/5.0 (Windows NT 10.0 Win64 x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36 Edg/134.0.0.0'),(4,1,'222.135.74.179',1742951535,'Mozilla/5.0 (Windows NT 10.0 Win64 x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36 Edg/134.0.0.0'),(5,1,'222.135.74.179',1742981756,'Mozilla/5.0 (Windows NT 10.0 Win64 x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36 Edg/134.0.0.0'),(6,1,'112.224.195.28',1743036086,'Mozilla/5.0 (Windows NT 10.0 Win64 x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36 Edg/134.0.0.0'),(7,1,'112.224.195.28',1743038605,'Mozilla/5.0 (Windows NT 10.0 Win64 x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36 Edg/134.0.0.0'),(8,1,'222.135.74.179',1743075816,'Mozilla/5.0 (Windows NT 10.0 Win64 x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36 Edg/134.0.0.0'),(9,1,'222.135.74.179',1743254027,'Mozilla/5.0 (Windows NT 10.0 Win64 x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36 Edg/134.0.0.0'),(10,1,'222.135.74.179',1743325479,'Mozilla/5.0 (Windows NT 10.0 Win64 x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36 Edg/134.0.0.0'),(11,1,'222.135.74.179',1743333671,'Mozilla/5.0 (Windows NT 10.0 Win64 x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36 Edg/134.0.0.0'),(12,1,'222.135.74.179',1743385809,'Mozilla/5.0 (Windows NT 10.0 Win64 x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36 Edg/134.0.0.0'),(13,1,'222.135.74.179',1743413697,'Mozilla/5.0 (Windows NT 10.0 Win64 x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36 Edg/134.0.0.0'),(14,1,'112.224.154.252',1743498381,'Mozilla/5.0 (Windows NT 10.0 Win64 x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36 Edg/134.0.0.0'),(15,1,'222.135.74.179',1743506311,'Mozilla/5.0 (Windows NT 10.0 Win64 x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36 Edg/134.0.0.0'),(16,1,'222.135.74.179',1743558948,'Mozilla/5.0 (Windows NT 10.0 Win64 x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36 Edg/134.0.0.0'),(17,1,'222.135.74.179',1743580654,'Mozilla/5.0 (Windows NT 10.0 Win64 x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36 Edg/134.0.0.0'),(18,1,'222.135.74.179',1743597798,'Mozilla/5.0 (Windows NT 10.0 Win64 x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36 Edg/134.0.0.0'),(19,1,'123.128.231.164',1758852642,'Mozilla/5.0 (Windows NT 10.0 Win64 x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36 Edg/141.0.0.0'),(20,1,'123.128.231.164',1758868369,'Mozilla/5.0 (Windows NT 10.0 Win64 x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36 Edg/141.0.0.0');
/*!40000 ALTER TABLE `dr_admin_login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dr_admin_menu`
--

DROP TABLE IF EXISTS `dr_admin_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dr_admin_menu` (
  `id` smallint unsigned NOT NULL AUTO_INCREMENT,
  `pid` smallint unsigned NOT NULL COMMENT '上级菜单id',
  `name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '菜单语言名称',
  `site` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '站点归属',
  `uri` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'uri字符串',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '外链地址',
  `mark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '菜单标识',
  `hidden` tinyint unsigned DEFAULT NULL COMMENT '是否隐藏',
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '图标标示',
  `displayorder` int DEFAULT NULL COMMENT '排序值',
  PRIMARY KEY (`id`),
  KEY `list` (`pid`),
  KEY `displayorder` (`displayorder`),
  KEY `mark` (`mark`),
  KEY `hidden` (`hidden`),
  KEY `uri` (`uri`)
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='后台菜单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dr_admin_menu`
--

LOCK TABLES `dr_admin_menu` WRITE;
/*!40000 ALTER TABLE `dr_admin_menu` DISABLE KEYS */;
INSERT INTO `dr_admin_menu` VALUES (1,0,'首页','','','','home',0,'fa fa-home',-2),(2,1,'我的面板','','','','home-my',0,'fa fa-home',0),(3,2,'后台首页','','home/main','','',0,'fa fa-home',0),(4,2,'资料修改','','api/my','','',0,'fa fa-user',0),(5,2,'系统更新','','cache/index','','',0,'fa fa-refresh',0),(6,2,'应用市场','','api/app','','',0,'fa fa-puzzle-piece',0),(7,0,'系统','','','','system',0,'fa fa-globe',-2),(8,7,'系统维护','','','','system-wh',0,'fa fa-cog',0),(9,8,'系统参数','','system/index','','',0,'fa fa-cog',0),(10,8,'系统缓存','','system_cache/index','','',0,'fa fa-clock-o',0),(11,8,'附件设置','','attachment/index','','',0,'fa fa-folder',0),(12,8,'存储策略','','attachment/remote_index','','',0,'fa fa-cloud',0),(13,8,'短信设置','','sms/index','','',0,'fa fa-envelope',0),(14,8,'邮件设置','','email/index','','',0,'fa fa-envelope-open',0),(15,8,'系统提醒','','notice/index','','',0,'fa fa-bell',0),(16,8,'系统体检','','check/index','','',0,'fa fa-wrench',0),(17,7,'日志管理','','','','system-log',0,'fa fa-calendar',0),(18,17,'系统日志','','error/index','','',0,'fa fa-shield',0),(19,17,'操作记录','','system_log/index','','',0,'fa fa-calendar',0),(20,17,'密码错误','','password_log/index','','',0,'fa fa-unlock-alt',0),(21,17,'短信错误','','sms_log/index','','',0,'fa fa-envelope',0),(22,17,'邮件错误','','email_log/index','','',0,'fa fa-envelope-open',0),(23,17,'慢查询日志','','sql_log/index','','',0,'fa fa-database',0),(24,0,'设置','','','','config',0,'fa fa-cogs',-2),(25,24,'网站设置','','','','config-web',0,'fa fa-cog',0),(27,25,'网站设置','','module/site_config/index','','',0,'fa fa-cog',0),(28,25,'网站信息','','module/site_param/index','','',0,'fa fa-edit',0),(29,25,'手机设置','','module/site_mobile/index','','',0,'fa fa-mobile',0),(30,25,'域名绑定','','module/site_domain/index','','',0,'fa fa-globe',0),(31,25,'图片设置','','module/site_image/index','','',0,'fa fa-photo',0),(32,24,'内容设置','','','','config-content',0,'fa fa-navicon',0),(33,32,'创建模块','','module/module_create/index','','',0,'fa fa-plus',-1),(34,32,'模块管理','','module/module/index','','',0,'fa fa-gears',-1),(35,32,'模块搜索','','module/module_search/index','','',0,'fa fa-search',-1),(36,24,'SEO设置','','','','config-seo',0,'fa fa-internet-explorer',0),(37,36,'站点SEO','','module/seo_site/index','','',0,'fa fa-cog',0),(38,36,'模块SEO','','module/seo_module/index','','',0,'fa fa-th-large',0),(39,36,'栏目SEO','','module/seo_category/index','','',0,'fa fa-reorder',0),(40,36,'URL规则','','module/urlrule/index','','',0,'fa fa-link',0),(41,36,'伪静态解析','','module/urlrule/rewrite_index','','',0,'bi bi-code-square',0),(42,0,'权限','','','','auth',0,'fa fa-user-circle',0),(43,42,'后台权限','','','','auth-admin',0,'fa fa-cog',0),(44,43,'后台菜单','','menu/index','','',0,'fa fa-list-alt',0),(45,43,'简化菜单','','min_menu/index','','',0,'fa fa-list',0),(46,43,'角色权限','','role/index','','',0,'fa fa-users',0),(47,43,'角色账号','','root/index','','',0,'fa fa-user',0),(48,0,'应用','','','','app',0,'fa fa-puzzle-piece',0),(49,48,'应用插件','','','','app-plugin',0,'fa fa-puzzle-piece',0),(50,49,'应用管理','','cloud/local','','',0,'fa fa-folder',0),(51,49,'联动菜单','','linkage/index','','',0,'fa fa-columns',0),(52,49,'任务队列','','cron/index','','',0,'fa fa-indent',0),(53,49,'附件管理','','attachments/index','','',0,'fa fa-folder',0),(54,49,'Ueditor编辑器','','ueditor/config/index','','',0,'fa fa-edit',0),(55,48,'模板调用工具','','','','app-mbdy',0,'fa fa-tag',0),(56,55,'字段调用标签','','mbdy/home/index','','',0,'fa fa-list',0),(57,55,'页面标签调用','','mbdy/page/index','','',0,'fa fa-list',0),(58,55,'循环标签调用','','mbdy/loop/index','','',0,'fa fa-list',0),(59,55,'内容搜索条件','','mbdy/search/index','','',0,'fa fa-search',0),(60,48,'API接口','','','','app-httpapi',0,'fa fa-plug',0),(61,60,'API接口密钥','','httpapi/auth/index','','',0,'fa fa-key',0),(62,60,'API接口数据','','httpapi/http/index','','',0,'fa fa-plug',0),(63,60,'网站栏目接口','','httpapi/category/index','','',0,'fa fa-reorder',0),(64,60,'模块内容接口','','httpapi/module/index','','',0,'fa fa-th-large',0),(65,60,'项目信息接口','','httpapi/site/index','','',0,'fa fa-cog',0),(66,48,'系统安全','','','','app-safe',0,'fa fa-shield',0),(67,66,'安全监测','','safe/home/index','','app-safe-1',0,'fa fa-shield',0),(68,66,'木马扫描','','safe/Mm/index','','app-safe-2',0,'fa fa-bug',0),(69,66,'文件检测','','safe/check_bom/index','','app-safe-5',0,'fa fa-code',0),(70,66,'后台域名','','safe/adomain/index','','app-safe-3',0,'fa fa-cog',0),(71,66,'账号安全','','safe/config/index','','app-safe-4',0,'fa fa-expeditedssl',0),(72,66,'站点安全','','safe/link/index','','app-safe-6',0,'fa fa-share-alt',0),(73,0,'服务','','','','cloud',0,'fa fa-cloud',99),(74,73,'项目服务','','','','cloud-dayrui',0,'fa fa-cloud',0),(75,74,'我的项目','','cloud/index','','',0,'fa fa-cog',0),(76,74,'服务工单','','cloud/service','','',0,'fa fa-user-md',0),(77,74,'应用商城','','cloud/app','','',0,'fa fa-puzzle-piece',0),(78,74,'模板商城','','cloud/template','','',0,'fa fa-html5',0),(79,74,'版本升级','','cloud/update','','',0,'fa fa-refresh',0),(80,74,'文件对比','','cloud/bf','','',0,'fa fa-code',0),(81,0,'内容','','','','content',0,'fa fa-th-large',-1),(82,81,'内容管理','','','','content-module',0,'fa fa-th-large',0),(83,82,'内容管理','','module/content/index','','',0,'fa fa-th-large',-99),(84,82,'共享栏目','','category/index','','',0,'fa fa-reorder',0),(85,81,'内容审核','','','','content-verify',0,'fa fa-edit',0),(86,82,'文章管理','','news/home/index','','module-news',0,'fa fa-sticky-note',-1),(87,85,'文章审核','','news/verify/index','','verify-module-news',0,'fa fa-sticky-note',-1),(88,82,'产品管理','','product/home/index','','module-product',0,'bi bi-archive-fill',-1),(89,85,'产品审核','','product/verify/index','','verify-module-product',0,'bi bi-archive-fill',-1);
/*!40000 ALTER TABLE `dr_admin_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dr_admin_min_menu`
--

DROP TABLE IF EXISTS `dr_admin_min_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dr_admin_min_menu` (
  `id` smallint unsigned NOT NULL AUTO_INCREMENT,
  `pid` smallint unsigned NOT NULL COMMENT '上级菜单id',
  `name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '菜单语言名称',
  `site` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '站点归属',
  `uri` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'uri字符串',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '外链地址',
  `mark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '菜单标识',
  `hidden` tinyint unsigned DEFAULT NULL COMMENT '是否隐藏',
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '图标标示',
  `displayorder` int DEFAULT NULL COMMENT '排序值',
  PRIMARY KEY (`id`),
  KEY `list` (`pid`),
  KEY `displayorder` (`displayorder`),
  KEY `mark` (`mark`),
  KEY `hidden` (`hidden`),
  KEY `uri` (`uri`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='后台简化菜单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dr_admin_min_menu`
--

LOCK TABLES `dr_admin_min_menu` WRITE;
/*!40000 ALTER TABLE `dr_admin_min_menu` DISABLE KEYS */;
INSERT INTO `dr_admin_min_menu` VALUES (1,0,'我的面板','','','','home',0,'fa fa-home',0),(2,1,'后台首页','','home/main','','1-0',0,'fa fa-home',0),(3,1,'资料修改','','api/my','','1-1',0,'fa fa-user',0),(4,0,'应用插件','','','','app-plugin',0,'fa fa-puzzle-piece',0),(5,4,'联动菜单','','linkage/index','','4-0',0,'fa fa-columns',0),(6,4,'附件管理','','attachments/index','','4-1',0,'fa fa-folder',0),(7,1,'网站设置','','module/site_param/index','','',0,'fa fa-cog',0),(8,1,'图片设置','','module/site_image/index','','',0,'fa fa-photo',0),(9,0,'SEO设置','','','','config-seo',0,'fa fa-internet-explorer',0),(10,9,'站点SEO','','module/seo_site/index','','',0,'fa fa-cog',0),(11,9,'模块SEO','','module/seo_module/index','','',0,'fa fa-gears',0),(12,9,'栏目SEO','','module/seo_category/index','','',0,'fa fa-reorder',0),(13,9,'URL规则','','module/urlrule/index','','',0,'fa fa-link',0),(14,0,'内容管理','','','','content-module',0,'fa fa-th-large',0),(15,14,'内容管理','','module/content/index','','',0,'fa fa-th-large',-99),(16,14,'共享栏目','','category/index','','',0,'fa fa-reorder',0),(17,14,'文章管理','','news/home/index','','module-news',0,'fa fa-sticky-note',-1),(18,14,'产品管理','','product/home/index','','module-product',0,'bi bi-archive-fill',-1);
/*!40000 ALTER TABLE `dr_admin_min_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dr_admin_notice`
--

DROP TABLE IF EXISTS `dr_admin_notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dr_admin_notice` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `site` int NOT NULL COMMENT '站点id',
  `type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '提醒类型：系统、内容、会员、应用',
  `msg` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '提醒内容说明',
  `uri` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '对应的URI',
  `to_rid` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '指定角色组',
  `to_uid` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '指定管理员',
  `status` tinyint(1) NOT NULL COMMENT '未处理0，1已查看，2处理中，3处理完成',
  `uid` int NOT NULL COMMENT '申请人',
  `username` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '申请人',
  `op_uid` int NOT NULL COMMENT '处理人',
  `op_username` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '处理人',
  `updatetime` int NOT NULL COMMENT '处理时间',
  `inputtime` int NOT NULL COMMENT '提醒时间',
  PRIMARY KEY (`id`),
  KEY `uri` (`uri`),
  KEY `site` (`site`),
  KEY `status` (`status`),
  KEY `uid` (`uid`),
  KEY `op_uid` (`op_uid`),
  KEY `to_uid` (`to_uid`),
  KEY `to_rid` (`to_rid`),
  KEY `updatetime` (`updatetime`),
  KEY `inputtime` (`inputtime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='后台提醒表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dr_admin_notice`
--

LOCK TABLES `dr_admin_notice` WRITE;
/*!40000 ALTER TABLE `dr_admin_notice` DISABLE KEYS */;
/*!40000 ALTER TABLE `dr_admin_notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dr_admin_role`
--

DROP TABLE IF EXISTS `dr_admin_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dr_admin_role` (
  `id` smallint NOT NULL AUTO_INCREMENT,
  `site` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '允许管理的站点，序列化数组格式',
  `name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '角色组语言名称',
  `system` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '系统权限',
  `module` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '模块权限',
  `application` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '应用权限',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='后台角色权限表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dr_admin_role`
--

LOCK TABLES `dr_admin_role` WRITE;
/*!40000 ALTER TABLE `dr_admin_role` DISABLE KEYS */;
INSERT INTO `dr_admin_role` VALUES (1,'','超级管理员','','',''),(2,'','编辑员','','','');
/*!40000 ALTER TABLE `dr_admin_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dr_admin_role_index`
--

DROP TABLE IF EXISTS `dr_admin_role_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dr_admin_role_index` (
  `id` smallint NOT NULL AUTO_INCREMENT,
  `uid` mediumint unsigned DEFAULT NULL COMMENT '会员uid',
  `roleid` mediumint unsigned DEFAULT NULL COMMENT '角色组id',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `roleid` (`roleid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='后台角色组分配表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dr_admin_role_index`
--

LOCK TABLES `dr_admin_role_index` WRITE;
/*!40000 ALTER TABLE `dr_admin_role_index` DISABLE KEYS */;
INSERT INTO `dr_admin_role_index` VALUES (1,1,1);
/*!40000 ALTER TABLE `dr_admin_role_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dr_admin_setting`
--

DROP TABLE IF EXISTS `dr_admin_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dr_admin_setting` (
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='系统属性参数表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dr_admin_setting`
--

LOCK TABLES `dr_admin_setting` WRITE;
/*!40000 ALTER TABLE `dr_admin_setting` DISABLE KEYS */;
/*!40000 ALTER TABLE `dr_admin_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dr_api_auth`
--

DROP TABLE IF EXISTS `dr_api_auth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dr_api_auth` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '名称',
  `secret` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '密钥',
  `disabled` tinyint unsigned NOT NULL COMMENT '禁用',
  `setting` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '存储数据',
  `inputtime` int unsigned NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `disabled` (`disabled`),
  KEY `inputtime` (`inputtime`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='api接口认证表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dr_api_auth`
--

LOCK TABLES `dr_api_auth` WRITE;
/*!40000 ALTER TABLE `dr_api_auth` DISABLE KEYS */;
INSERT INTO `dr_api_auth` VALUES (1,'app','PHPCMF4B867EBED0105',0,'{\"table\":\"\",\"ips\":\"\"}',1742799576);
/*!40000 ALTER TABLE `dr_api_auth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dr_api_config`
--

DROP TABLE IF EXISTS `dr_api_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dr_api_config` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='api属性配置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dr_api_config`
--

LOCK TABLES `dr_api_config` WRITE;
/*!40000 ALTER TABLE `dr_api_config` DISABLE KEYS */;
INSERT INTO `dr_api_config` VALUES (1,'site_1','{\"field\":{\"mobile_swiper\":{\"use\":\"1\",\"func\":\"\"},\"mobile_number\":{\"use\":\"1\",\"func\":\"\"}},\"call\":\"\",\"code\":\"\"}'),(2,'category','{\"share\":{\"field\":{\"id\":{\"func\":\"\"},\"tid\":{\"func\":\"\"},\"pid\":{\"func\":\"\"},\"mid\":{\"func\":\"\"},\"pids\":{\"func\":\"\"},\"name\":{\"use\":\"1\",\"func\":\"\"},\"dirname\":{\"func\":\"\"},\"pdirname\":{\"func\":\"\"},\"child\":{\"func\":\"\"},\"disabled\":{\"func\":\"\"},\"ismain\":{\"func\":\"\"},\"childids\":{\"func\":\"\"},\"thumb\":{\"func\":\"\"},\"show\":{\"func\":\"\"},\"content\":{\"use\":\"1\",\"func\":\"\"},\"setting\":{\"func\":\"\"},\"displayorder\":{\"func\":\"\"},\"atlas\":{\"use\":\"1\",\"func\":\"\"}},\"call\":\"\",\"code\":\"\"}}'),(3,'module_list','{\"product\":{\"field\":{\"catname\":{\"use\":\"1\",\"func\":\"\"},\"id\":{\"use\":\"1\",\"func\":\"\"},\"catid\":{\"func\":\"\"},\"title\":{\"use\":\"1\",\"func\":\"\"},\"thumb\":{\"use\":\"1\",\"func\":\"\"},\"keywords\":{\"func\":\"\"},\"description\":{\"func\":\"\"},\"hits\":{\"func\":\"\"},\"uid\":{\"func\":\"\"},\"author\":{\"func\":\"\"},\"status\":{\"func\":\"\"},\"url\":{\"func\":\"\"},\"link_id\":{\"func\":\"\"},\"tableid\":{\"func\":\"\"},\"inputip\":{\"func\":\"\"},\"inputtime\":{\"func\":\"\"},\"updatetime\":{\"func\":\"\"},\"displayorder\":{\"func\":\"\"}},\"call\":\"\",\"code\":\"\"}}'),(4,'module_show','{\"product\":{\"field\":{\"catname\":{\"func\":\"\"},\"id\":{\"func\":\"\"},\"catid\":{\"func\":\"\"},\"title\":{\"use\":\"1\",\"func\":\"\"},\"thumb\":{\"use\":\"1\",\"func\":\"\"},\"keywords\":{\"func\":\"\"},\"description\":{\"func\":\"\"},\"hits\":{\"func\":\"\"},\"uid\":{\"func\":\"\"},\"author\":{\"func\":\"\"},\"status\":{\"func\":\"\"},\"url\":{\"func\":\"\"},\"link_id\":{\"func\":\"\"},\"tableid\":{\"func\":\"\"},\"inputip\":{\"func\":\"\"},\"inputtime\":{\"use\":\"1\",\"func\":\"\"},\"updatetime\":{\"func\":\"\"},\"displayorder\":{\"func\":\"\"},\"content\":{\"use\":\"1\",\"func\":\"\"}},\"call\":\"\",\"code\":\"\"}}');
/*!40000 ALTER TABLE `dr_api_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dr_api_http`
--

DROP TABLE IF EXISTS `dr_api_http`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dr_api_http` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '名称',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '数据格式',
  `disabled` tinyint unsigned NOT NULL COMMENT '禁用',
  `inputtime` int unsigned NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `disabled` (`disabled`),
  KEY `inputtime` (`inputtime`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='api接口http数据表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dr_api_http`
--

LOCK TABLES `dr_api_http` WRITE;
/*!40000 ALTER TABLE `dr_api_http` DISABLE KEYS */;
INSERT INTO `dr_api_http` VALUES (1,'推荐产品','{\"type\":\"5\",\"data\":\"\",\"file\":\"\",\"list\":\"\",\"tpl\":\"{category module=share pid=1}\\r\\n{api::id=$t.id}\\r\\n{api::name=$t.name}\\r\\n{api::thumb=dr_thumb($t.thumb)}\\r\\n{api::content=$t.content}\\r\\n{/category}\",\"php\":\"\",\"sql\":\"\",\"call\":\"\"}',0,1742801548),(2,'工程案例','{\"type\":\"5\",\"data\":\"\",\"file\":\"\",\"list\":\"\",\"tpl\":\"<?php $mycat=dr_share_cat_value(6, \'atlas\');?>\\r\\n<?php if ($mycat) { $key=0;foreach ($mycat as $c) { ?>\\r\\n{api::title=$c.title}\\r\\n{api::thumb=dr_thumb($c.file)}\\r\\n<?php $key++;} } ?>\",\"php\":\"\",\"sql\":\"\",\"call\":\"\"}',0,1742805541);
/*!40000 ALTER TABLE `dr_api_http` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dr_app_login`
--

DROP TABLE IF EXISTS `dr_app_login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dr_app_login` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `uid` mediumint unsigned DEFAULT NULL COMMENT '会员uid',
  `is_login` int unsigned DEFAULT NULL COMMENT '是否首次登录',
  `is_repwd` int unsigned DEFAULT NULL COMMENT '是否重置密码',
  `updatetime` int unsigned NOT NULL COMMENT '修改密码时间',
  `logintime` int unsigned NOT NULL COMMENT '最近登录时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `logintime` (`logintime`),
  KEY `updatetime` (`updatetime`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='账号记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dr_app_login`
--

LOCK TABLES `dr_app_login` WRITE;
/*!40000 ALTER TABLE `dr_app_login` DISABLE KEYS */;
INSERT INTO `dr_app_login` VALUES (1,1,0,0,0,0);
/*!40000 ALTER TABLE `dr_app_login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dr_app_safe_mm`
--

DROP TABLE IF EXISTS `dr_app_safe_mm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dr_app_safe_mm` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `file` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '文件',
  `error` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '木马代码',
  `inputtime` int unsigned DEFAULT NULL COMMENT '扫描时间',
  `ts` int unsigned DEFAULT NULL COMMENT '是否通知',
  PRIMARY KEY (`id`),
  KEY `ts` (`ts`),
  KEY `inputtime` (`inputtime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='木马扫描记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dr_app_safe_mm`
--

LOCK TABLES `dr_app_safe_mm` WRITE;
/*!40000 ALTER TABLE `dr_app_safe_mm` DISABLE KEYS */;
/*!40000 ALTER TABLE `dr_app_safe_mm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dr_attachment`
--

DROP TABLE IF EXISTS `dr_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dr_attachment` (
  `id` mediumint unsigned NOT NULL AUTO_INCREMENT,
  `uid` mediumint unsigned NOT NULL COMMENT '会员id',
  `author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '会员',
  `siteid` mediumint unsigned NOT NULL COMMENT '站点id',
  `related` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '相关表标识',
  `tableid` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '附件副表id',
  `download` mediumint NOT NULL DEFAULT '0' COMMENT '无用保留',
  `filesize` int unsigned NOT NULL COMMENT '文件大小',
  `fileext` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '文件扩展名',
  `filemd5` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '文件md5值',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `author` (`author`),
  KEY `relatedtid` (`related`),
  KEY `fileext` (`fileext`),
  KEY `filemd5` (`filemd5`),
  KEY `siteid` (`siteid`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='附件表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dr_attachment`
--

LOCK TABLES `dr_attachment` WRITE;
/*!40000 ALTER TABLE `dr_attachment` DISABLE KEYS */;
INSERT INTO `dr_attachment` VALUES (1,1,'',1,'rand',1,0,5231,'png','4e3f3ce71266dee3bab210db9a0371dc'),(2,1,'',1,'rand',1,0,365478,'png','38fcce077e124dc16783e8b36497f032'),(3,1,'',1,'rand',1,0,414951,'png','bcf1a1365675c7a52543e37e9b933b4b'),(4,1,'',1,'rand',1,0,96056,'png','a724724334ec543a6be56a646338adb5'),(5,1,'',1,'rand',1,0,82159,'png','81d8bd1194ac4cb57c016edfeebb4e32'),(6,1,'',1,'rand',1,0,82611,'png','2da4c2b989e26bed5f2049b8a0248fa0'),(7,1,'',1,'rand',1,0,89698,'png','79a05cbedffa9ece93c69fe6f038ddf3'),(8,1,'',1,'rand',1,0,138163,'png','3b911c479618e1af604576d95df200c7'),(9,1,'',1,'rand',1,0,159333,'png','c447bcc000aaa629921e692aa742454f'),(10,1,'',1,'rand',1,0,162643,'png','fb7a0631467b89c3174ac5fbfc2a2f1e'),(11,1,'',1,'rand',1,0,168216,'png','320238c72af6739eaaf95dd7bb26c14e'),(12,1,'',1,'rand',1,0,30419,'jpeg','7d7821bf71b6d924cd1bb47b58af3e2f'),(13,1,'',1,'rand',1,0,22876,'jpeg','8479cd7d9372baa63366d0c8c3b4f872'),(14,1,'',1,'ueditor:4da2ef53dada73a4253c24a41ae7fc0b',1,0,18134,'jpeg','6bc3d48969be212104e0822290801cbc'),(15,1,'',1,'rand',1,0,45640,'jpeg','2ad64aab0fe9173953427b12e3866475'),(16,1,'',1,'rand',1,0,49142,'jpg','b52b24494b558c01a19c72813ec2299b'),(17,1,'',1,'ueditor:d0f16f9e0ffe000621f8455f6b246c09',1,0,20962,'jpeg','06baac7f867aa70f436cdc9cc6496f46'),(18,1,'',1,'ueditor:d0f16f9e0ffe000621f8455f6b246c09',1,0,19537,'jpeg','a829d7d43415148ea86368b2a2384b59'),(19,1,'',1,'rand',1,0,20127,'jpg','f07c67429f264ef0384698b38fa5d37d'),(20,1,'',1,'ueditor:45cad624d6a3e0bee4fc74c0d27104a2',1,0,116334,'png','75ca9a73fbce27eb93116d16342eb4ed'),(21,1,'',1,'ueditor:45cad624d6a3e0bee4fc74c0d27104a2',1,0,51577,'png','25f926d293d9d0759ab45031cf0c9627'),(22,1,'',1,'rand',1,0,248770,'jpg','5f4a07a6ae877cd2fb75e0635473fc69'),(23,1,'',1,'ueditor:d0f16f9e0ffe000621f8455f6b246c09',1,0,660893,'jpg','a115540d3b450b838087ed9ea35c6b16'),(24,1,'',1,'ueditor:d0f16f9e0ffe000621f8455f6b246c09',1,0,641933,'jpg','42d87dee904047400f40f854df45f60f'),(25,1,'',1,'rand',1,0,200680,'jpg','2a2871f2aa466aa3b178eff43334b25f'),(26,1,'',1,'rand',1,0,134416,'jpg','e9821ece997a3e15fd26b431978408a5'),(27,1,'',1,'rand',1,0,214014,'jpg','5ef31cf0883d876a80d0a1055519172a'),(28,1,'',1,'rand',1,0,121203,'jpg','97f78c8dd1e5a8762f0d9992e54cce3f'),(29,1,'',1,'rand',1,0,211157,'jpg','b4158f9e314977413cc0b602ddf6effb'),(30,1,'',1,'rand',1,0,538806,'jpg','218c5f24602eacea1cac5efea8a9e68f'),(31,1,'',1,'rand',1,0,170036,'jpg','1a5e767e07e2889182dd7324ec53347e'),(32,1,'',1,'ueditor:239f5cc0f214faf5c2423e2efe1ee22b',1,0,472188,'jpg','2b50fcdc04c2ca8153f76358ebd0a778'),(33,1,'',1,'ueditor:239f5cc0f214faf5c2423e2efe1ee22b',1,0,108702,'jpg','6f51d1dc6d00c9b3cb6eaf2c8810beb5'),(34,1,'',1,'ueditor:239f5cc0f214faf5c2423e2efe1ee22b',1,0,59388,'jpg','f35d37b6e4e934474c8bcbdf6798de80'),(35,1,'',1,'rand',1,0,138974,'jpg','e400ba7a7a1db028fbd56c85d4d82516'),(36,1,'',1,'rand',1,0,289963,'jpg','b74f951cf4110d08290e090ed2b3926d'),(37,1,'',1,'rand',1,0,210430,'jpg','cf4a4e74e25c2a8b874915befd0862c1'),(38,1,'',1,'rand',1,0,229246,'jpg','cdc15d3de5421c7f203d80ef7effac8a'),(39,1,'',1,'rand',1,0,277344,'jpg','cdff2b2b2a719ba8595d3d8aa37280cc'),(40,1,'',1,'ueditor:9dc14698fced077c03f660122689f28b',1,0,70941,'jpg','f8cee202202f4d7027a49eac13b80226'),(41,1,'',1,'ueditor:9dc14698fced077c03f660122689f28b',1,0,62890,'jpg','0d8fce0e090d6616fddd50bc0fc5a332'),(42,1,'',1,'ueditor:9dc14698fced077c03f660122689f28b',1,0,60597,'jpg','1ccb2e5ac9a0fccc78a54b8f8aed163f'),(43,1,'',1,'rand',1,0,227838,'jpg','31e5ba55016279152244f7d81218f29a'),(44,1,'',1,'ueditor:239f5cc0f214faf5c2423e2efe1ee22b',1,0,991228,'jpg','921d03d528fe8d6cc2551f5189cde4ec'),(45,1,'',1,'rand',1,0,5914,'png','1afb791d457064203ee9b2160a40b265'),(46,1,'',1,'rand',1,0,97904,'jpg','cad49e55d09320725c32c00671063293'),(47,1,'',1,'rand',1,0,100381,'jpg','5f0eebf01cc1caf3d588e57218162914'),(48,1,'',1,'rand',1,0,89070,'jpg','092dc30c5f10f0e0931a136cddd36313'),(49,1,'',1,'rand',1,0,196334,'jpg','4c91156540b76b5c58bdaefae59811a6'),(50,1,'',1,'rand',1,0,205276,'jpg','4b75b54782b6c3e481504148adf22508'),(51,1,'',1,'rand',1,0,201673,'jpg','d8b23c954c00064e642f871612dda268'),(52,1,'',1,'rand',1,0,196615,'jpg','56de0de2c0229a6b2c7a0e0a2c5b3527'),(53,1,'',1,'rand',1,0,198398,'jpg','779a9f844c2ac5de63ff61c4d6924782'),(54,1,'',1,'rand',1,0,207329,'jpg','9ae87c99dbcbaab81c7944b832111455'),(55,1,'',1,'rand',1,0,227792,'jpg','782e33c82e0900f6b4365c64e0e56e6b'),(56,1,'',1,'rand',1,0,131026,'jpg','4c4442abaf4fb4cfae714ea4e9493c47'),(57,1,'',1,'rand',1,0,221011,'jpg','61be079d48cb6a94785a3205fd907756'),(58,1,'',1,'rand',1,0,156146,'jpg','c1fdcbbcfc47b1b9e1d7f8f6a879c168'),(59,1,'',1,'rand',1,0,161776,'jpg','a2c0cf6ae2848160e4a5c22e1cea22a2'),(60,1,'',1,'rand',1,0,137807,'jpg','6cb8ad4551cb108b67fdd5f1fe84f4d5'),(61,1,'',1,'rand',1,0,168071,'jpg','b16c569c83160851f2c4883e74099064'),(62,1,'',1,'rand',1,0,161851,'jpg','1405da62fe61c8ae7857418dbc93d4ec'),(63,1,'',1,'rand',1,0,176456,'jpg','c593196018dc75d845e07f5fdcf07d11'),(64,1,'',1,'rand',1,0,167942,'jpg','835cd35d0be2e6f36bc41a74ce164d39'),(65,1,'',1,'rand',1,0,235610,'jpg','a295dfe24fd26564995396c31bdf9a6d'),(66,1,'',1,'rand',1,0,127809,'jpg','035a8c3ccaa9a9f657b484bf63aeb7c8'),(67,1,'',1,'rand',1,0,169315,'jpg','817fe245d1845ac63a22506f54238c6d'),(68,1,'',1,'rand',1,0,198891,'jpg','d8cceefcaa84f72f1495851cdcc5175d'),(69,1,'',1,'rand',1,0,161851,'jpg','1405da62fe61c8ae7857418dbc93d4ec'),(70,1,'',1,'rand',1,0,127809,'jpg','035a8c3ccaa9a9f657b484bf63aeb7c8'),(71,1,'',1,'rand',1,0,176456,'jpg','c593196018dc75d845e07f5fdcf07d11'),(72,1,'',1,'rand',1,0,167942,'jpg','835cd35d0be2e6f36bc41a74ce164d39'),(73,1,'',1,'rand',1,0,169315,'jpg','817fe245d1845ac63a22506f54238c6d'),(74,1,'',1,'rand',1,0,131026,'jpg','4c4442abaf4fb4cfae714ea4e9493c47'),(75,1,'',1,'rand',1,0,156146,'jpg','c1fdcbbcfc47b1b9e1d7f8f6a879c168'),(76,1,'',1,'rand',1,0,137807,'jpg','6cb8ad4551cb108b67fdd5f1fe84f4d5'),(77,1,'',1,'rand',1,0,161776,'jpg','a2c0cf6ae2848160e4a5c22e1cea22a2'),(78,1,'',1,'rand',1,0,168071,'jpg','b16c569c83160851f2c4883e74099064'),(79,1,'',1,'rand',1,0,235610,'jpg','a295dfe24fd26564995396c31bdf9a6d'),(80,1,'',1,'rand',1,0,198891,'jpg','d8cceefcaa84f72f1495851cdcc5175d'),(81,1,'',1,'rand',1,0,196615,'jpg','56de0de2c0229a6b2c7a0e0a2c5b3527'),(82,1,'',1,'rand',1,0,227792,'jpg','782e33c82e0900f6b4365c64e0e56e6b'),(83,1,'',1,'rand',1,0,207329,'jpg','9ae87c99dbcbaab81c7944b832111455'),(84,1,'',1,'rand',1,0,221011,'jpg','61be079d48cb6a94785a3205fd907756'),(85,1,'',1,'rand',1,0,198398,'jpg','779a9f844c2ac5de63ff61c4d6924782'),(86,1,'',1,'rand',1,0,196334,'jpg','4c91156540b76b5c58bdaefae59811a6'),(87,1,'',1,'rand',1,0,201673,'jpg','d8b23c954c00064e642f871612dda268'),(88,1,'',1,'rand',1,0,205276,'jpg','4b75b54782b6c3e481504148adf22508'),(89,1,'',1,'rand',1,0,169737,'jpg','c089e263dc7d38fec5ca227038df9573'),(90,1,'',1,'rand',1,0,187791,'jpg','b0f5df8e751bcbc4c5ac06b85afd3baf'),(91,1,'',1,'rand',1,0,170916,'jpg','91f26eaf0e36c8615e9cc19b758f6722'),(92,1,'',1,'rand',1,0,359000,'jpg','372d60f1b0a457a62e5cb675ee7685bc'),(93,1,'',1,'rand',1,0,367307,'jpg','487fb44d20bb55eea323af3d239c3469'),(94,1,'',1,'rand',1,0,348937,'jpg','971d3258380129cf28f4f6474f161fd1'),(95,1,'',1,'ueditor:4fd00c363949309387456a0c8f8534c4',1,0,215753,'jpg','16b768080b053c8823f373977e9d7ee1'),(96,1,'',1,'rand',1,0,135191,'jpg','296f7ec3841ac0b151d3573372073486'),(97,1,'',1,'rand',1,0,102271,'jpg','75ffdfcc6420fb633f8d7e65a5d77669'),(98,1,'',1,'rand',1,0,41556,'jpg','9047a96cbf64cf63a8e2656f26346e71'),(99,1,'',1,'rand',1,0,48596,'jpg','33dae8013b547467b5a105d842a6220a'),(100,1,'',1,'rand',1,0,50716,'jpg','3fd0cc49c1163e4476e7387a9fa2e6e0');
/*!40000 ALTER TABLE `dr_attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dr_attachment_data`
--

DROP TABLE IF EXISTS `dr_attachment_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dr_attachment_data` (
  `id` mediumint unsigned NOT NULL COMMENT '附件id',
  `uid` mediumint unsigned NOT NULL DEFAULT '0' COMMENT '会员id',
  `author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '会员',
  `related` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '相关表标识',
  `filename` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '原文件名',
  `fileext` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '文件扩展名',
  `filesize` int unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `attachment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '服务器路径',
  `remote` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '远程附件id',
  `attachinfo` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '附件信息',
  `inputtime` int unsigned NOT NULL COMMENT '入库时间',
  PRIMARY KEY (`id`),
  KEY `inputtime` (`inputtime`),
  KEY `fileext` (`fileext`),
  KEY `remote` (`remote`),
  KEY `author` (`author`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='附件已归档表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dr_attachment_data`
--

LOCK TABLES `dr_attachment_data` WRITE;
/*!40000 ALTER TABLE `dr_attachment_data` DISABLE KEYS */;
INSERT INTO `dr_attachment_data` VALUES (1,1,'','rand','logo','png',5231,'202503/e4c196f65374978.png',0,'{\"width\":114,\"height\":114}',1742799344),(2,1,'','rand','banner2','png',365478,'202503/f393f4d2cf73f7d.png',0,'{\"width\":750,\"height\":295}',1742799903),(3,1,'','rand','banner1','png',414951,'202503/9c6c617e2d827.png',0,'{\"width\":750,\"height\":295}',1742799903),(4,1,'','rand','卧式砂磨机','png',96056,'202503/0b47fdf60f34b03.png',0,'{\"width\":200,\"height\":200}',1742801116),(5,1,'','rand','篮式砂磨机','png',82159,'202503/2c5d044cbe58f55.png',0,'{\"width\":200,\"height\":200}',1742801208),(6,1,'','rand','分散机系列','png',82611,'202503/9d13a1d6d12b906.png',0,'{\"width\":200,\"height\":200}',1742801259),(7,1,'','rand','釜类','png',89698,'202503/989d98c5ced9bf7.png',0,'{\"width\":200,\"height\":200}',1742801294),(8,1,'','rand','涂料生产线生产现场 (2)','png',138163,'202503/9d759586119b069.png',0,'{\"width\":355,\"height\":209}',1742805425),(9,1,'','rand','涂料生产线生产现场 (3)','png',159333,'202503/0142018e59d9769.png',0,'{\"width\":355,\"height\":210}',1742805425),(10,1,'','rand','涂料生产线生产现场 (1)','png',162643,'202503/af02c43ad62e5ed.png',0,'{\"width\":355,\"height\":209}',1742805425),(11,1,'','rand','涂料生产线生产现场 (4)','png',168216,'202503/195bcdf4c685959.png',0,'{\"width\":355,\"height\":210}',1742805427),(12,1,'','rand','SWD大流量砂磨机','jpeg',30419,'202503/badc39dde094c0c.jpeg',0,'{\"width\":623,\"height\":414}',1742986756),(13,1,'','rand','SW卧式砂磨机','jpeg',22876,'202503/e7d3b1cf2a4d58d.jpeg',0,'{\"width\":469,\"height\":540}',1742988050),(14,1,'','ueditor:4da2ef53dada73a4253c24a41ae7fc0b','SW卧式砂磨机1.jpeg','jpeg',18134,'ueditor/image/202503/1742988194e59b86.jpeg',0,'',1742988194),(15,1,'','rand','LS纳米篮式砂磨机(环保型）','jpeg',45640,'202503/2956b4a9f04d57d.jpeg',0,'{\"width\":579,\"height\":784}',1742988339),(16,1,'','rand','SWD大流量砂磨机','jpg',49142,'202503/2df123793a5543a.jpg',0,'{\"width\":600,\"height\":600}',1743038651),(17,1,'','ueditor:d0f16f9e0ffe000621f8455f6b246c09','SWD大流量砂磨机.jpeg','jpeg',20962,'ueditor/image/202503/174338599756b40d.jpeg',0,'',1743385997),(18,1,'','ueditor:d0f16f9e0ffe000621f8455f6b246c09','SWD大流量砂磨机2.jpeg','jpeg',19537,'ueditor/image/202503/17433860061f13ad.jpeg',0,'',1743386006),(19,1,'','rand','产品占位图','jpg',20127,'202503/199a03d23faf6b1.jpg',0,'{\"width\":800,\"height\":800}',1743415926),(20,1,'','ueditor:45cad624d6a3e0bee4fc74c0d27104a2','image.png','png',116334,'ueditor/image/202503/1743418186e7af7f.png',0,'',1743418186),(21,1,'','ueditor:45cad624d6a3e0bee4fc74c0d27104a2','image.png','png',51577,'ueditor/image/202503/17434182210fbf0d.png',0,'',1743418221),(22,1,'','rand','大流量','jpg',248770,'202504/d6587ed58c32.jpg',0,'{\"width\":800,\"height\":800}',1743498463),(23,1,'','ueditor:d0f16f9e0ffe000621f8455f6b246c09','大流量内部2.jpg','jpg',660893,'ueditor/image/202504/1743506376c1fd28.jpg',0,'',1743506376),(24,1,'','ueditor:d0f16f9e0ffe000621f8455f6b246c09','大流量内部3.jpg','jpg',641933,'ueditor/image/202504/1743506381d9fd1f.jpg',0,'',1743506381),(25,1,'','rand','卧式砂磨机','jpg',200680,'202504/62f8e77805515a0.jpg',0,'{\"width\":800,\"height\":800}',1743506592),(26,1,'','rand','篮式砂磨机','jpg',134416,'202504/827e144071bf03f.jpg',0,'{\"width\":800,\"height\":800}',1743507251),(27,1,'','rand','FLZ真空脱泡分散机','jpg',214014,'202504/e5ed4f95daeaf5b.jpg',0,'{\"width\":800,\"height\":800}',1743507297),(28,1,'','rand','FLB双轴分散搅拌机2','jpg',121203,'202504/cc2b9949cdf2246.jpg',0,'{\"width\":800,\"height\":800}',1743507311),(29,1,'','rand','FL高速分散机','jpg',211157,'202504/722204423c6630f.jpg',0,'{\"width\":800,\"height\":800}',1743507327),(30,1,'','rand','DSJ同心双轴搅拌釜','jpg',538806,'202504/6c6e5da754459c1.jpg',0,'{\"width\":800,\"height\":800}',1743507368),(31,1,'','rand','FYFD电加热釜','jpg',170036,'202504/53360274fae5719.jpg',0,'{\"width\":800,\"height\":800}',1743559079),(32,1,'','ueditor:239f5cc0f214faf5c2423e2efe1ee22b','FYFD电加热釜使用现场.jpg','jpg',472188,'ueditor/image/202504/1743559100d4a591.jpg',0,'',1743559099),(33,1,'','ueditor:239f5cc0f214faf5c2423e2efe1ee22b','FYFD电加热釜使用现场.jpg','jpg',108702,'ueditor/image/202504/174355917492d66c.jpg',0,'',1743559174),(34,1,'','ueditor:239f5cc0f214faf5c2423e2efe1ee22b','FYFD电加热釜2.bak.jpg','jpg',59388,'ueditor/image/202504/17435591813f0ad1.jpg',0,'',1743559180),(35,1,'','rand','SF 多功能砂磨分散搅拌机','jpg',138974,'202504/8590c9271bd571d.jpg',0,'{\"width\":800,\"height\":800}',1743560412),(36,1,'','rand','SW卧式砂磨机','jpg',289963,'202504/4ce83f7552d155.jpg',0,'{\"width\":800,\"height\":800}',1743560481),(37,1,'','rand','篮式','jpg',210430,'202504/780018f57f56c.jpg',0,'{\"width\":800,\"height\":800}',1743560615),(38,1,'','rand','棒销','jpg',229246,'202504/dfbf91920e9a854.jpg',0,'{\"width\":800,\"height\":800}',1743581754),(39,1,'','rand','纳米','jpg',277344,'202504/7b401fe40cc7f23.jpg',0,'{\"width\":800,\"height\":800}',1743584032),(40,1,'','ueditor:9dc14698fced077c03f660122689f28b','纳米内部1.jpg','jpg',70941,'ueditor/image/202504/17435840513b3386.jpg',0,'',1743584051),(41,1,'','ueditor:9dc14698fced077c03f660122689f28b','纳米内部2.jpg','jpg',62890,'ueditor/image/202504/1743584059858190.jpg',0,'',1743584059),(42,1,'','ueditor:9dc14698fced077c03f660122689f28b','纳米内部3.jpg','jpg',60597,'ueditor/image/202504/1743584065d38b9a.jpg',0,'',1743584065),(43,1,'','rand','多功能纳米','jpg',227838,'202504/789816099444f5b.jpg',0,'{\"width\":800,\"height\":800}',1743586519),(44,1,'','ueditor:239f5cc0f214faf5c2423e2efe1ee22b','多功能内部.jpg','jpg',991228,'ueditor/image/202504/17435865334643b3.jpg',0,'',1743586533),(45,1,'','rand','logo','png',5914,'202509/cc351636a0e79b1.png',0,'{\"width\":71,\"height\":59}',1758793847),(46,1,'','rand','20170408092114106','jpg',97904,'202509/8809434d025ddd8.jpg',0,'{\"width\":800,\"height\":523}',1758799125),(47,1,'','rand','20170407171318644','jpg',100381,'202509/23bd13d89315a94.jpg',0,'{\"width\":800,\"height\":523}',1758799241),(48,1,'','rand','20170420140051338','jpg',89070,'202509/741fb5e5891ce48.jpg',0,'{\"width\":800,\"height\":523}',1758799258),(49,1,'','rand','滴塑3','jpg',196334,'202509/ddc7ecb887694d0.jpg',0,'{\"width\":500,\"height\":415}',1758799866),(50,1,'','rand','滴塑1','jpg',205276,'202509/41ba763f7262.jpg',0,'{\"width\":500,\"height\":415}',1758799866),(51,1,'','rand','滴塑2','jpg',201673,'202509/a07f246b7b88d7e.jpg',0,'{\"width\":500,\"height\":415}',1758799866),(52,1,'','rand','烫金3','jpg',196615,'202509/91c189b189926c2.jpg',0,'{\"width\":500,\"height\":415}',1758799867),(53,1,'','rand','平板压花1','jpg',198398,'202509/fe19fd5a628ffd6.jpg',0,'{\"width\":500,\"height\":415}',1758799867),(54,1,'','rand','烫金1','jpg',207329,'202509/977cdf31e464065.jpg',0,'{\"width\":500,\"height\":415}',1758799867),(55,1,'','rand','烫金2','jpg',227792,'202509/a34b7881fc4c.jpg',0,'{\"width\":500,\"height\":415}',1758799867),(56,1,'','rand','仿皮7','jpg',131026,'202509/2f56f59032f8b84.jpg',0,'{\"width\":500,\"height\":415}',1758799867),(57,1,'','rand','平板压花2','jpg',221011,'202509/8321a7cfa5b602a.jpg',0,'{\"width\":500,\"height\":415}',1758799867),(58,1,'','rand','仿皮6','jpg',156146,'202509/2c1fd47c0a48c73.jpg',0,'{\"width\":500,\"height\":415}',1758799867),(59,1,'','rand','仿皮5','jpg',161776,'202509/cbf4aba85221a17.jpg',0,'{\"width\":500,\"height\":415}',1758799867),(60,1,'','rand','仿皮4','jpg',137807,'202509/9568ec4f37bc992.jpg',0,'{\"width\":500,\"height\":415}',1758799867),(61,1,'','rand','仿皮3','jpg',168071,'202509/399e816ca5a801d.jpg',0,'{\"width\":500,\"height\":415}',1758799867),(62,1,'','rand','起皱5','jpg',161851,'202509/8f129a5aa80d23.jpg',0,'{\"width\":500,\"height\":415}',1758799867),(63,1,'','rand','起皱4','jpg',176456,'202509/5c7917071564793.jpg',0,'{\"width\":500,\"height\":415}',1758799867),(64,1,'','rand','起皱3','jpg',167942,'202509/8d429e0f28857fd.jpg',0,'{\"width\":500,\"height\":415}',1758799867),(65,1,'','rand','仿皮1','jpg',235610,'202509/06e74d07eb806e9.jpg',0,'{\"width\":500,\"height\":415}',1758799867),(66,1,'','rand','起皱2','jpg',127809,'202509/4003974ba85a81f.jpg',0,'{\"width\":500,\"height\":415}',1758799867),(67,1,'','rand','起皱1','jpg',169315,'202509/842608fd0156d53.jpg',0,'{\"width\":500,\"height\":415}',1758799867),(68,1,'','rand','仿皮2','jpg',198891,'202509/081d8d91ed8b476.jpg',0,'{\"width\":500,\"height\":415}',1758799867),(69,1,'','rand','起皱5','jpg',161851,'202509/0e18323bfbc2726.jpg',0,'{\"width\":500,\"height\":415}',1758799920),(70,1,'','rand','起皱2','jpg',127809,'202509/eaa11d0524d5e5d.jpg',0,'{\"width\":500,\"height\":415}',1758799920),(71,1,'','rand','起皱4','jpg',176456,'202509/a8b7dac5c95b4e1.jpg',0,'{\"width\":500,\"height\":415}',1758799920),(72,1,'','rand','起皱3','jpg',167942,'202509/c1fd39312d89e9a.jpg',0,'{\"width\":500,\"height\":415}',1758799920),(73,1,'','rand','起皱1','jpg',169315,'202509/1f91b0f85972bf9.jpg',0,'{\"width\":500,\"height\":415}',1758799920),(74,1,'','rand','仿皮7','jpg',131026,'202509/f5a5c3f67915c24.jpg',0,'{\"width\":500,\"height\":415}',1758799952),(75,1,'','rand','仿皮6','jpg',156146,'202509/c9a15e5c86c6560.jpg',0,'{\"width\":500,\"height\":415}',1758799952),(76,1,'','rand','仿皮4','jpg',137807,'202509/fc3b0a6965ce027.jpg',0,'{\"width\":500,\"height\":415}',1758799952),(77,1,'','rand','仿皮5','jpg',161776,'202509/5b109cec393d28a.jpg',0,'{\"width\":500,\"height\":415}',1758799952),(78,1,'','rand','仿皮3','jpg',168071,'202509/d1b01d0e877a79c.jpg',0,'{\"width\":500,\"height\":415}',1758799952),(79,1,'','rand','仿皮1','jpg',235610,'202509/140bb371d37e56f.jpg',0,'{\"width\":500,\"height\":415}',1758799952),(80,1,'','rand','仿皮2','jpg',198891,'202509/c7353e920d3e.jpg',0,'{\"width\":500,\"height\":415}',1758799952),(81,1,'','rand','烫金3','jpg',196615,'202509/a6baaa7af859bdb.jpg',0,'{\"width\":500,\"height\":415}',1758800017),(82,1,'','rand','烫金2','jpg',227792,'202509/7e7be1fa0986cdf.jpg',0,'{\"width\":500,\"height\":415}',1758800017),(83,1,'','rand','烫金1','jpg',207329,'202509/4df65ab6e905b8.jpg',0,'{\"width\":500,\"height\":415}',1758800017),(84,1,'','rand','平板压花2','jpg',221011,'202509/d16dcc40ba18fe6.jpg',0,'{\"width\":500,\"height\":415}',1758800039),(85,1,'','rand','平板压花1','jpg',198398,'202509/6b0de75468ad723.jpg',0,'{\"width\":500,\"height\":415}',1758800039),(86,1,'','rand','滴塑3','jpg',196334,'202509/f39f12d53b3912f.jpg',0,'{\"width\":500,\"height\":415}',1758800059),(87,1,'','rand','滴塑2','jpg',201673,'202509/640f3da30b1ce74.jpg',0,'{\"width\":500,\"height\":415}',1758800059),(88,1,'','rand','滴塑1','jpg',205276,'202509/c4dd5bf85ca2761.jpg',0,'{\"width\":500,\"height\":415}',1758800059),(89,1,'','rand','20170408093006853','jpg',169737,'202509/a7b1b41b07d9cff.jpg',0,'{\"width\":800,\"height\":523}',1758801332),(90,1,'','rand','20170408093206670','jpg',187791,'202509/f65141c69efdbeb.jpg',0,'{\"width\":800,\"height\":523}',1758801364),(91,1,'','rand','20170408093107206','jpg',170916,'202509/ec5febb6c69de9.jpg',0,'{\"width\":800,\"height\":523}',1758801387),(92,1,'','rand','20171122132433372','jpg',359000,'202509/ed11c2405690293.jpg',0,'{\"width\":800,\"height\":523}',1758801552),(93,1,'','rand','20171122132416394','jpg',367307,'202509/f5a7c4ec14807e0.jpg',0,'{\"width\":800,\"height\":523}',1758801570),(94,1,'','rand','20171122132401226','jpg',348937,'202509/7b93ac13414c097.jpg',0,'{\"width\":800,\"height\":523}',1758801586),(95,1,'','ueditor:4fd00c363949309387456a0c8f8534c4','about_us.jpg','jpg',215753,'ueditor/image/202509/1758808236173035.jpg',0,'',1758808236),(96,1,'','rand','yyzz','jpg',135191,'202509/6abbb4cbf7df0f.jpg',0,'{\"width\":585,\"height\":589}',1758811826),(97,1,'','rand','sbzc','jpg',102271,'202509/780331bc0f1ec14.jpg',0,'{\"width\":585,\"height\":589}',1758855149),(98,1,'','rand','微信图片_20250926080953_76_346','jpg',41556,'202509/f0f76e4349021ec.jpg',0,'{\"width\":750,\"height\":341}',1758855510),(99,1,'','rand','微信图片_20250926080952_75_346','jpg',48596,'202509/c115d7d85c2d202.jpg',0,'{\"width\":750,\"height\":341}',1758855510),(100,1,'','rand','微信图片_20250926080951_74_346','jpg',50716,'202509/d019e2b18904fd2.jpg',0,'{\"width\":750,\"height\":341}',1758855511);
/*!40000 ALTER TABLE `dr_attachment_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dr_attachment_remote`
--

DROP TABLE IF EXISTS `dr_attachment_remote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dr_attachment_remote` (
  `id` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint NOT NULL COMMENT '类型',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '名称',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '访问地址',
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '参数值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='远程附件表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dr_attachment_remote`
--

LOCK TABLES `dr_attachment_remote` WRITE;
/*!40000 ALTER TABLE `dr_attachment_remote` DISABLE KEYS */;
/*!40000 ALTER TABLE `dr_attachment_remote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dr_attachment_unused`
--

DROP TABLE IF EXISTS `dr_attachment_unused`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dr_attachment_unused` (
  `id` mediumint unsigned NOT NULL COMMENT '附件id',
  `uid` mediumint unsigned NOT NULL DEFAULT '0' COMMENT '会员id',
  `author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '会员',
  `siteid` mediumint unsigned NOT NULL COMMENT '站点id',
  `filename` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '原文件名',
  `fileext` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '文件扩展名',
  `filesize` int unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `attachment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '服务器路径',
  `remote` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '远程附件id',
  `attachinfo` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '附件信息',
  `inputtime` int unsigned NOT NULL COMMENT '入库时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `inputtime` (`inputtime`),
  KEY `fileext` (`fileext`),
  KEY `remote` (`remote`),
  KEY `author` (`author`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='未使用的附件表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dr_attachment_unused`
--

LOCK TABLES `dr_attachment_unused` WRITE;
/*!40000 ALTER TABLE `dr_attachment_unused` DISABLE KEYS */;
/*!40000 ALTER TABLE `dr_attachment_unused` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dr_cron`
--

DROP TABLE IF EXISTS `dr_cron`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dr_cron` (
  `id` int NOT NULL AUTO_INCREMENT,
  `site` int NOT NULL COMMENT '站点',
  `type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '类型',
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '参数值',
  `status` tinyint unsigned NOT NULL COMMENT '状态',
  `error` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '错误信息',
  `updatetime` int unsigned NOT NULL COMMENT '执行时间',
  `inputtime` int unsigned NOT NULL COMMENT '写入时间',
  PRIMARY KEY (`id`),
  KEY `site` (`site`),
  KEY `type` (`type`),
  KEY `status` (`status`),
  KEY `updatetime` (`updatetime`),
  KEY `inputtime` (`inputtime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='任务管理';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dr_cron`
--

LOCK TABLES `dr_cron` WRITE;
/*!40000 ALTER TABLE `dr_cron` DISABLE KEYS */;
/*!40000 ALTER TABLE `dr_cron` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dr_field`
--

DROP TABLE IF EXISTS `dr_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dr_field` (
  `id` smallint unsigned NOT NULL AUTO_INCREMENT,
  `name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '字段别名语言',
  `fieldname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '字段名称',
  `fieldtype` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '字段类型',
  `relatedid` smallint unsigned NOT NULL COMMENT '相关id',
  `relatedname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '相关表',
  `isedit` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '是否可修改',
  `ismain` tinyint unsigned NOT NULL COMMENT '是否主表',
  `issystem` tinyint unsigned NOT NULL COMMENT '是否系统表',
  `ismember` tinyint unsigned NOT NULL COMMENT '是否会员可见',
  `issearch` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '是否可搜索',
  `disabled` tinyint unsigned NOT NULL COMMENT '禁用？',
  `setting` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '配置信息',
  `displayorder` int NOT NULL COMMENT '排序',
  PRIMARY KEY (`id`),
  KEY `list` (`relatedid`,`disabled`,`issystem`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='字段表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dr_field`
--

LOCK TABLES `dr_field` WRITE;
/*!40000 ALTER TABLE `dr_field` DISABLE KEYS */;
INSERT INTO `dr_field` VALUES (3,'移动端轮播图','mobile_swiper','Files',1,'site',1,1,0,1,0,0,'{\"option\":{\"size\":\"1\",\"count\":\"5\",\"ext\":\"jpg,gif,png\",\"attachment\":\"0\",\"image_reduce\":\"\",\"is_ext_tips\":\"0\",\"css\":\"\"},\"validate\":{\"xss\":\"1\",\"required\":\"0\",\"pattern\":\"\",\"errortips\":\"\",\"check\":\"\",\"filter\":\"\",\"tips\":\"\",\"formattr\":\"\"},\"is_right\":\"0\"}',0),(4,'联手机号码','mobile_number','Text',1,'site',1,1,0,1,0,0,'{\"option\":{\"fieldtype\":\"\",\"fieldlength\":\"\",\"value\":\"\",\"width\":\"\",\"css\":\"\"},\"validate\":{\"xss\":\"1\",\"required\":\"0\",\"pattern\":\"\",\"errortips\":\"\",\"check\":\"\",\"filter\":\"\",\"tips\":\"\",\"formattr\":\"\"},\"is_right\":\"0\"}',0),(5,'主题','title','Text',1,'module',1,1,1,1,1,0,'{\"option\":{\"width\":400,\"fieldtype\":\"VARCHAR\",\"fieldlength\":\"255\"},\"validate\":{\"xss\":1,\"required\":1,\"formattr\":\"onblur=\\\"check_title();get_keywords(\'keywords\');\\\"\"}}',0),(6,'缩略图','thumb','File',1,'module',1,1,1,1,1,0,'{\"option\":{\"ext\":\"jpg,gif,png\",\"size\":10,\"width\":400,\"fieldtype\":\"VARCHAR\",\"fieldlength\":\"255\"}}',0),(7,'关键字','keywords','Text',1,'module',1,1,1,1,1,0,'{\"option\":{\"width\":400,\"fieldtype\":\"VARCHAR\",\"fieldlength\":\"255\"},\"validate\":{\"xss\":1,\"formattr\":\" data-role=\\\"tagsinput\\\"\"}}',0),(8,'描述','description','Textarea',1,'module',1,1,1,1,1,0,'{\"option\":{\"width\":500,\"height\":60,\"fieldtype\":\"VARCHAR\",\"fieldlength\":\"255\"},\"validate\":{\"xss\":1,\"filter\":\"dr_filter_description\"}}',0),(9,'笔名','author','Text',1,'module',1,1,1,1,1,0,'{\"is_right\":1,\"option\":{\"width\":200,\"fieldtype\":\"VARCHAR\",\"fieldlength\":\"255\",\"value\":\"{name}\"},\"validate\":{\"xss\":1}}',0),(10,'内容','content','Ueditor',1,'module',1,0,1,1,1,0,'{\"option\":{\"mode\":1,\"show_bottom_boot\":1,\"div2p\":1,\"width\":\"100%\",\"height\":400},\"validate\":{\"xss\":1,\"required\":1}}',0),(11,'产品名称','title','Text',2,'module',1,1,1,1,0,0,'{\"option\":{\"fieldtype\":\"VARCHAR\",\"fieldlength\":\"255\",\"value\":\"\",\"width\":\"400\",\"css\":\"\"},\"validate\":{\"xss\":\"1\",\"required\":\"1\",\"pattern\":\"\",\"errortips\":\"\",\"check\":\"\",\"filter\":\"\",\"tips\":\"\",\"formattr\":\"onblur=\\\"check_title();get_keywords(\'keywords\');\\\"\"},\"is_right\":\"0\"}',1),(12,'产品主图','thumb','File',2,'module',1,1,1,1,0,0,'{\"option\":{\"fieldtype\":\"VARCHAR\",\"fieldlength\":\"255\",\"input\":\"1\",\"ext\":\"jpg,gif,png,jpeg\",\"size\":\"10\",\"attachment\":\"0\",\"image_reduce\":\"\",\"is_ext_tips\":\"0\",\"css\":\"\"},\"validate\":{\"required\":\"0\",\"pattern\":\"\",\"errortips\":\"\",\"check\":\"\",\"filter\":\"\",\"tips\":\"\",\"formattr\":\"\"},\"is_right\":\"0\"}',2),(13,'关键字','keywords','Text',2,'module',1,1,1,1,1,1,'{\"option\":{\"width\":400,\"fieldtype\":\"VARCHAR\",\"fieldlength\":\"255\"},\"validate\":{\"xss\":1,\"formattr\":\" data-role=\\\"tagsinput\\\"\"}}',999),(14,'描述','description','Textarea',2,'module',1,1,1,1,1,0,'{\"option\":{\"width\":500,\"height\":60,\"fieldtype\":\"VARCHAR\",\"fieldlength\":\"255\"},\"validate\":{\"xss\":1,\"filter\":\"dr_filter_description\"}}',999),(15,'笔名','author','Text',2,'module',1,1,1,1,1,0,'{\"is_right\":1,\"option\":{\"width\":200,\"fieldtype\":\"VARCHAR\",\"fieldlength\":\"255\",\"value\":\"{name}\"},\"validate\":{\"xss\":1}}',999),(16,'产品介绍','content','Ueditor',2,'module',1,0,1,0,0,1,'{\"option\":{\"enter\":\"0\",\"down_img\":\"1\",\"show_bottom_boot\":\"1\",\"tool_select_3\":\"1\",\"tool_select_4\":\"1\",\"autofloat\":\"1\",\"remove_style\":\"0\",\"div2p\":\"1\",\"duiqi\":\"1\",\"autoheight\":\"1\",\"page\":\"0\",\"mode\":\"1\",\"tool\":\"\'bold\', \'italic\', \'underline\'\",\"ym\":\"1\",\"mode2\":\"1\",\"tool2\":\"\'bold\', \'italic\', \'underline\'\",\"mode3\":\"1\",\"tool3\":\"\'bold\', \'italic\', \'underline\'\",\"attachment\":\"0\",\"image_endstr\":\"\",\"value\":\"\",\"width\":\"100%\",\"height\":\"300\",\"css\":\"\"},\"validate\":{\"xss\":0,\"required\":\"1\",\"pattern\":\"\",\"errortips\":\"\",\"check\":\"\",\"filter\":\"\",\"tips\":\"\",\"formattr\":\"\"},\"is_right\":\"0\"}',10),(17,'缩略图','thumb','File',0,'category-share',1,1,1,1,1,0,'{\"option\":{\"ext\":\"jpg,gif,png,jpeg\",\"size\":10,\"input\":1,\"attachment\":0}}',0),(18,'栏目内容','content','Ueditor',0,'category-share',1,1,1,1,1,0,'{\"option\":{\"mode\":1,\"show_bottom_boot\":1,\"div2p\":1,\"width\":\"100%\",\"height\":400},\"validate\":{\"xss\":1,\"required\":1}}',0),(19,'图册','atlas','Files',0,'category-share',1,1,0,1,0,0,'{\"option\":{\"input\":\"1\",\"name\":\"1\",\"size\":\"2\",\"count\":\"99999\",\"ext\":\"jpg,gif,png\",\"attachment\":\"0\",\"image_reduce\":\"\",\"is_ext_tips\":\"0\",\"css\":\"\"},\"validate\":{\"required\":\"0\",\"pattern\":\"\",\"errortips\":\"\",\"check\":\"\",\"filter\":\"\",\"tips\":\"\",\"formattr\":\"\"},\"is_right\":\"0\"}',0);
/*!40000 ALTER TABLE `dr_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dr_linkage`
--

DROP TABLE IF EXISTS `dr_linkage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dr_linkage` (
  `id` smallint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '菜单名称',
  `type` tinyint unsigned NOT NULL,
  `code` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `module` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='联动菜单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dr_linkage`
--

LOCK TABLES `dr_linkage` WRITE;
/*!40000 ALTER TABLE `dr_linkage` DISABLE KEYS */;
INSERT INTO `dr_linkage` VALUES (1,'中国地区',0,'address');
/*!40000 ALTER TABLE `dr_linkage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dr_linkage_data_1`
--

DROP TABLE IF EXISTS `dr_linkage_data_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dr_linkage_data_1` (
  `id` mediumint unsigned NOT NULL AUTO_INCREMENT,
  `site` mediumint unsigned NOT NULL COMMENT '站点id',
  `pid` mediumint unsigned NOT NULL DEFAULT '0' COMMENT '上级id',
  `pids` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '所有上级id',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '栏目名称',
  `cname` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '别名',
  `child` tinyint unsigned DEFAULT '0' COMMENT '是否有下级',
  `hidden` tinyint unsigned DEFAULT '0' COMMENT '前端隐藏',
  `childids` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '下级所有id',
  `displayorder` mediumint DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `cname` (`cname`),
  KEY `hidden` (`hidden`),
  KEY `list` (`site`,`displayorder`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='联动菜单数据表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dr_linkage_data_1`
--

LOCK TABLES `dr_linkage_data_1` WRITE;
/*!40000 ALTER TABLE `dr_linkage_data_1` DISABLE KEYS */;
INSERT INTO `dr_linkage_data_1` VALUES (1,1,0,'0','北京','bj',0,0,'1',0),(2,1,0,'0','成都','cd',0,0,'2',0);
/*!40000 ALTER TABLE `dr_linkage_data_1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dr_mail_smtp`
--

DROP TABLE IF EXISTS `dr_mail_smtp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dr_mail_smtp` (
  `id` smallint unsigned NOT NULL AUTO_INCREMENT,
  `host` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `pass` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `port` mediumint unsigned NOT NULL,
  `displayorder` smallint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `displayorder` (`displayorder`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='邮件账户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dr_mail_smtp`
--

LOCK TABLES `dr_mail_smtp` WRITE;
/*!40000 ALTER TABLE `dr_mail_smtp` DISABLE KEYS */;
/*!40000 ALTER TABLE `dr_mail_smtp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dr_member`
--

DROP TABLE IF EXISTS `dr_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dr_member` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '邮箱地址',
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '手机号码',
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '加密密码',
  `login_attr` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '登录附加验证字符',
  `salt` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '随机加密码',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '姓名',
  `money` decimal(10,2) unsigned NOT NULL COMMENT 'RMB',
  `freeze` decimal(10,2) unsigned NOT NULL COMMENT '冻结RMB',
  `spend` decimal(10,2) unsigned NOT NULL COMMENT '消费RMB总额',
  `score` int unsigned NOT NULL COMMENT '积分',
  `experience` int unsigned NOT NULL COMMENT '经验值',
  `regip` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '注册ip',
  `regtime` int unsigned NOT NULL COMMENT '注册时间',
  `randcode` mediumint unsigned NOT NULL COMMENT '随机验证码',
  PRIMARY KEY (`id`),
  KEY `username` (`username`),
  KEY `email` (`email`),
  KEY `phone` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='会员表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dr_member`
--

LOCK TABLES `dr_member` WRITE;
/*!40000 ALTER TABLE `dr_member` DISABLE KEYS */;
INSERT INTO `dr_member` VALUES (1,'lanmo-app@13aq.com','','孙柄晨','7569a4a58f7e68185b0c0e989caca8dc','','168908dd32','创始人',1000000.00,0.00,0.00,1000000,1000000,'',1742799074,0);
/*!40000 ALTER TABLE `dr_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dr_member_data`
--

DROP TABLE IF EXISTS `dr_member_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dr_member_data` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `is_admin` tinyint unsigned DEFAULT '0' COMMENT '是否是管理员',
  `is_lock` tinyint unsigned DEFAULT '0' COMMENT '账号锁定标识',
  `is_verify` tinyint unsigned DEFAULT '0' COMMENT '审核标识',
  `is_mobile` tinyint unsigned DEFAULT '0' COMMENT '手机认证标识',
  `is_email` tinyint unsigned DEFAULT '0' COMMENT '邮箱认证标识',
  `is_avatar` tinyint unsigned DEFAULT '0' COMMENT '头像上传标识',
  `is_complete` tinyint unsigned DEFAULT '0' COMMENT '完善资料标识',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='会员表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dr_member_data`
--

LOCK TABLES `dr_member_data` WRITE;
/*!40000 ALTER TABLE `dr_member_data` DISABLE KEYS */;
INSERT INTO `dr_member_data` VALUES (1,1,0,1,1,0,0,1);
/*!40000 ALTER TABLE `dr_member_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dr_member_setting`
--

DROP TABLE IF EXISTS `dr_member_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dr_member_setting` (
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户属性参数表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dr_member_setting`
--

LOCK TABLES `dr_member_setting` WRITE;
/*!40000 ALTER TABLE `dr_member_setting` DISABLE KEYS */;
INSERT INTO `dr_member_setting` VALUES ('config','{\"pwdlen\":\"0\",\"user2pwd\":null,\"pwdpreg\":\"\"}');
/*!40000 ALTER TABLE `dr_member_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dr_module`
--

DROP TABLE IF EXISTS `dr_module`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dr_module` (
  `id` smallint unsigned NOT NULL AUTO_INCREMENT,
  `site` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '站点划分',
  `dirname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '目录名称',
  `share` tinyint unsigned DEFAULT NULL COMMENT '是否共享模块',
  `setting` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '配置信息',
  `comment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '评论信息',
  `disabled` tinyint(1) NOT NULL DEFAULT '0' COMMENT '禁用？',
  `displayorder` smallint DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `dirname` (`dirname`),
  KEY `disabled` (`disabled`),
  KEY `displayorder` (`displayorder`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='模块表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dr_module`
--

LOCK TABLES `dr_module` WRITE;
/*!40000 ALTER TABLE `dr_module` DISABLE KEYS */;
INSERT INTO `dr_module` VALUES (1,'{\"1\":{\"html\":0,\"theme\":\"default\",\"domain\":\"\",\"template\":\"default\"}}','news',1,'{\"order\":\"updatetime DESC\",\"verify_msg\":\"\",\"delete_msg\":\"\",\"list_field\":{\"title\":{\"use\":\"1\",\"order\":\"1\",\"name\":\"主题\",\"width\":\"\",\"func\":\"title\"},\"catid\":{\"use\":\"1\",\"order\":\"2\",\"name\":\"栏目\",\"width\":\"130\",\"func\":\"catid\"},\"author\":{\"use\":\"1\",\"order\":\"3\",\"name\":\"笔名\",\"width\":\"120\",\"func\":\"author\"},\"updatetime\":{\"use\":\"1\",\"order\":\"4\",\"name\":\"更新时间\",\"width\":\"160\",\"func\":\"datetime\"}},\"comment_list_field\":{\"content\":{\"use\":\"1\",\"order\":\"1\",\"name\":\"评论\",\"width\":\"\",\"func\":\"comment\"},\"author\":{\"use\":\"1\",\"order\":\"3\",\"name\":\"作者\",\"width\":\"100\",\"func\":\"author\"},\"inputtime\":{\"use\":\"1\",\"order\":\"4\",\"name\":\"评论时间\",\"width\":\"160\",\"func\":\"datetime\"}},\"flag\":null,\"param\":null,\"search\":{\"use\":\"1\",\"field\":\"title,keywords\",\"total\":\"500\",\"length\":\"4\",\"param_join\":\"-\",\"param_rule\":\"0\",\"param_field\":\"\",\"param_join_field\":[\"\",\"\",\"\",\"\",\"\",\"\",\"\"],\"param_join_default_value\":\"0\"}}','',0,0),(2,'{\"1\":{\"html\":0,\"theme\":\"default\",\"domain\":\"\",\"template\":\"default\"}}','product',1,'{\"module_category_hide\":\"0\",\"sync_category\":\"0\",\"pcatpost\":\"0\",\"updatetime_select\":\"0\",\"merge\":\"0\",\"right_field\":\"0\",\"desc_auto\":\"0\",\"kws_limit\":\"10\",\"desc_limit\":\"100\",\"update_psize\":\"100\",\"desc_clear\":\"0\",\"hits_min\":\"\",\"hits_max\":\"\",\"verify_num\":\"10\",\"verify_msg\":\"\",\"delete_msg\":\"\",\"is_hide_search_bar\":\"0\",\"order\":\"updatetime DESC\",\"search_time\":\"updatetime\",\"search_first_field\":\"title\",\"is_op_more\":\"0\",\"list_field\":{\"title\":{\"use\":\"1\",\"name\":\"产品名称\",\"width\":\"\",\"func\":\"title\"},\"catid\":{\"use\":\"1\",\"name\":\"栏目\",\"width\":\"130\",\"func\":\"catid\"},\"author\":{\"use\":\"1\",\"name\":\"笔名\",\"width\":\"120\",\"func\":\"author\"},\"updatetime\":{\"use\":\"1\",\"name\":\"更新时间\",\"width\":\"160\",\"func\":\"datetime\"}},\"flag\":null,\"param\":null,\"search\":{\"use\":\"1\",\"field\":\"title,keywords\",\"total\":\"500\",\"length\":\"4\",\"param_join\":\"-\",\"param_rule\":\"0\",\"param_field\":\"\",\"param_join_field\":[\"\",\"\",\"\",\"\",\"\",\"\",\"\"],\"param_join_default_value\":\"0\"}}','',0,0);
/*!40000 ALTER TABLE `dr_module` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dr_site`
--

DROP TABLE IF EXISTS `dr_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dr_site` (
  `id` smallint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '站点名称',
  `domain` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '站点域名',
  `setting` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '站点配置',
  `disabled` tinyint(1) NOT NULL DEFAULT '0' COMMENT '禁用？',
  `displayorder` smallint DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `disabled` (`disabled`),
  KEY `displayorder` (`displayorder`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='站点表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dr_site`
--

LOCK TABLES `dr_site` WRITE;
/*!40000 ALTER TABLE `dr_site` DISABLE KEYS */;
INSERT INTO `dr_site` VALUES (1,'紫星','zixing-app.wsw88.cn','{\"config\":{\"logo\":\"45\",\"SITE_NAME\":\"紫星\",\"SITE_ICP\":\"\",\"SITE_TONGJI\":\"\",\"mobile_swiper\":{\"id\":[\"98\",\"99\",\"100\"]},\"mobile_number\":\"0510-83391048\",\"SITE_CLOSE\":\"0\",\"SITE_INDEX_HTML\":\"0\",\"SITE_CLOSE_MSG\":\"网站升级中....\",\"SITE_LANGUAGE\":\"zh-cn\",\"SITE_TEMPLATE\":\"default\",\"SITE_TIMEZONE\":\"8\",\"SITE_TIME_FORMAT\":\"\",\"SITE_THEME\":\"default\"},\"param\":{\"mobile_swiper\":\"{\\\"file\\\":[\\\"98\\\",\\\"99\\\",\\\"100\\\"],\\\"title\\\":[\\\"\\\",\\\"\\\",\\\"\\\"],\\\"description\\\":[\\\"\\\",\\\"\\\",\\\"\\\"]}\",\"mobile_number\":\"0510-83391048\"}}',0,0);
/*!40000 ALTER TABLE `dr_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dr_urlrule`
--

DROP TABLE IF EXISTS `dr_urlrule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dr_urlrule` (
  `id` smallint unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint unsigned NOT NULL COMMENT '规则类型',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '规则名称',
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '详细规则',
  PRIMARY KEY (`id`),
  KEY `type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='URL规则表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dr_urlrule`
--

LOCK TABLES `dr_urlrule` WRITE;
/*!40000 ALTER TABLE `dr_urlrule` DISABLE KEYS */;
/*!40000 ALTER TABLE `dr_urlrule` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-09-26 17:54:33

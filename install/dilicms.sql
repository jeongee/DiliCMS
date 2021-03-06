﻿# --------------------------------------------------------
# Host:                         127.0.0.1
# Database:                     dilicms
# Server version:               5.1.41
# Server OS:                    Win32
# HeidiSQL version:             5.0.0.3272
# Date/time:                    2011-06-29 17:34:20
# --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
# Dumping database structure for dilicms


# Dumping structure for table dilicms.dili_admins
DROP TABLE IF EXISTS `dili_admins`;
CREATE TABLE IF NOT EXISTS `dili_admins` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(16) NOT NULL,
  `password` varchar(32) NOT NULL,
  `email` varchar(100) NOT NULL,
  `role` smallint(5) unsigned DEFAULT NULL,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `username` (`username`),
  KEY `group` (`role`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;


# Dumping structure for table dilicms.dili_attachments
DROP TABLE IF EXISTS `dili_attachments`;
CREATE TABLE IF NOT EXISTS `dili_attachments` (
  `aid` int(10) NOT NULL AUTO_INCREMENT,
  `uid` smallint(10) NOT NULL DEFAULT '0',
  `model` mediumint(10) DEFAULT '0',
  `from` tinyint(1) DEFAULT '0' COMMENT '0:content model,1:cate model',
  `content` int(10) DEFAULT '0',
  `name` varchar(30) DEFAULT NULL,
  `folder` varchar(15) DEFAULT NULL,
  `realname` varchar(50) DEFAULT NULL,
  `type` varchar(10) DEFAULT NULL,
  `image` tinyint(1) DEFAULT '0',
  `posttime` int(11) DEFAULT '0',
  PRIMARY KEY (`aid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Dumping data for table dilicms.dili_attachments: 0 rows
DELETE FROM `dili_attachments`;
/*!40000 ALTER TABLE `dili_attachments` DISABLE KEYS */;
/*!40000 ALTER TABLE `dili_attachments` ENABLE KEYS */;


# Dumping structure for table dilicms.dili_backend_settings
DROP TABLE IF EXISTS `dili_backend_settings`;
CREATE TABLE IF NOT EXISTS `dili_backend_settings` (
  `backend_theme` varchar(15) DEFAULT NULL,
  `backend_lang` varchar(10) DEFAULT NULL,
  `backend_root_access` tinyint(1) unsigned DEFAULT '1',
  `backend_access_point` varchar(20) DEFAULT 'admin',
  `backend_title` varchar(100) DEFAULT 'DiliCMS后台管理',
  `backend_logo` varchar(100) DEFAULT 'images/logo.gif'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Dumping data for table dilicms.dili_backend_settings: 1 rows
DELETE FROM `dili_backend_settings`;
/*!40000 ALTER TABLE `dili_backend_settings` DISABLE KEYS */;
INSERT INTO `dili_backend_settings` (`backend_theme`, `backend_lang`, `backend_root_access`, `backend_access_point`, `backend_title`, `backend_logo`) VALUES ('default', 'zh-cn', 1, 'admin', 'DiliCMS后台管理', 'images/logo.gif');
/*!40000 ALTER TABLE `dili_backend_settings` ENABLE KEYS */;


# Dumping structure for table dilicms.dili_cate_fields
DROP TABLE IF EXISTS `dili_cate_fields`;
CREATE TABLE IF NOT EXISTS `dili_cate_fields` (
  `id` mediumint(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `description` varchar(40) DEFAULT NULL,
  `model` smallint(10) unsigned DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `length` smallint(10) unsigned DEFAULT NULL,
  `values` tinytext,
  `width` smallint(10) DEFAULT NULL,
  `height` smallint(10) DEFAULT NULL,
  `rules` tinytext,
  `ruledescription` tinytext,
  `searchable` tinyint(1) unsigned DEFAULT NULL,
  `listable` tinyint(1) unsigned DEFAULT NULL,
  `order` int(5) unsigned DEFAULT NULL,
  `editable` tinyint(1) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`,`model`),
  KEY `model` (`model`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/*!40000 ALTER TABLE `dili_cate_fields` ENABLE KEYS */;


# Dumping structure for table dilicms.dili_cate_models
DROP TABLE IF EXISTS `dili_cate_models`;
CREATE TABLE IF NOT EXISTS `dili_cate_models` (
  `id` mediumint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `description` varchar(40) NOT NULL,
  `perpage` varchar(2) NOT NULL,
  `level` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `hasattach` tinyint(1) NOT NULL DEFAULT '0',
  `built_in` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;



# Dumping structure for table dilicms.dili_menus
DROP TABLE IF EXISTS `dili_menus`;
CREATE TABLE IF NOT EXISTS `dili_menus` (
  `menu_id` tinyint(10) unsigned NOT NULL AUTO_INCREMENT,
  `class_name` varchar(20) NOT NULL,
  `method_name` varchar(30) NOT NULL,
  `menu_name` varchar(20) NOT NULL,
  `menu_level` tinyint(2) unsigned DEFAULT '0',
  `menu_parent` tinyint(10) unsigned DEFAULT '0',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

# Dumping data for table dilicms.dili_menus: 20 rows
DELETE FROM `dili_menus`;
/*!40000 ALTER TABLE `dili_menus` DISABLE KEYS */;
INSERT INTO `dili_menus` (`menu_id`, `class_name`, `method_name`, `menu_name`, `menu_level`, `menu_parent`) VALUES (1, 'system', 'home', '系统', 0, 0), (2, 'system', 'home', '后台首页', 1, 1), (3, 'system', 'home', '后台首页', 2, 2), (4, 'setting', 'site', '系统设置', 1, 1), (5, 'setting', 'site', '站点设置', 2, 4), (6, 'setting', 'backend', '后台设置', 2, 4), (7, 'system', 'password', '修改密码', 2, 4), (8, 'system', 'cache', '更新缓存', 2, 4), (9, 'model', 'view', '模型管理', 1, 1), (10, 'model', 'view', '内容模型管理', 2, 9), (11, 'category', 'view', '分类模型管理', 2, 9), (12, 'plugin', 'view', '插件管理', 1, 1), (13, 'plugin', 'view', '插件管理', 2, 12), (14, 'role', 'view', '权限管理', 1, 1), (15, 'role', 'view', '用户组管理', 2, 14), (16, 'user', 'view', '用户管理', 2, 14), (17, 'content', 'view', '内容管理', 0, 0), (18, 'content', 'view', '内容管理', 1, 17), (19, 'category_content', 'view', '分类管理', 1, 17), (20, 'module', 'run', '工具', 0, 0);
/*!40000 ALTER TABLE `dili_menus` ENABLE KEYS */;


# Dumping structure for table dilicms.dili_models
DROP TABLE IF EXISTS `dili_models`;
CREATE TABLE IF NOT EXISTS `dili_models` (
  `id` smallint(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `description` varchar(50) NOT NULL,
  `perpage` varchar(2) NOT NULL DEFAULT '10',
  `hasattach` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `built_in` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

# Dumping structure for table dilicms.dili_model_fields
DROP TABLE IF EXISTS `dili_model_fields`;
CREATE TABLE IF NOT EXISTS `dili_model_fields` (
  `id` mediumint(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `description` varchar(40) NOT NULL,
  `model` smallint(10) unsigned NOT NULL DEFAULT '0',
  `type` varchar(20) DEFAULT NULL,
  `length` smallint(10) unsigned DEFAULT NULL,
  `values` tinytext NOT NULL,
  `width` smallint(10) unsigned NOT NULL,
  `height` smallint(10) unsigned NOT NULL,
  `rules` tinytext NOT NULL,
  `ruledescription` tinytext NOT NULL,
  `searchable` tinyint(1) unsigned NOT NULL,
  `listable` tinyint(1) unsigned NOT NULL,
  `order` int(5) unsigned DEFAULT NULL,
  `editable` tinyint(1) unsigned DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`,`model`),
  KEY `model` (`model`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;



# Dumping structure for table dilicms.dili_plugins
DROP TABLE IF EXISTS `dili_plugins`;
CREATE TABLE IF NOT EXISTS `dili_plugins` (
  `id` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `version` varchar(5) NOT NULL,
  `title` varchar(50) NOT NULL,
  `description` varchar(200) NOT NULL,
  `author` varchar(20) NOT NULL,
  `link` varchar(100) NOT NULL,
  `copyrights` varchar(100) NOT NULL,
  `access` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `active` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;



# Dumping structure for table dilicms.dili_rights
DROP TABLE IF EXISTS `dili_rights`;
CREATE TABLE IF NOT EXISTS `dili_rights` (
  `right_id` tinyint(10) unsigned NOT NULL AUTO_INCREMENT,
  `right_name` varchar(30) DEFAULT NULL,
  `right_class` varchar(30) DEFAULT NULL,
  `right_method` varchar(30) DEFAULT NULL,
  `right_detail` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`right_id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;

# Dumping data for table dilicms.dili_rights: 49 rows
DELETE FROM `dili_rights`;
/*!40000 ALTER TABLE `dili_rights` DISABLE KEYS */;
INSERT INTO `dili_rights` (`right_id`, `right_name`, `right_class`, `right_method`, `right_detail`) VALUES (1, '密码修改', 'system', 'password', NULL), (2, '更新缓存', 'system', 'cache', NULL), (3, ' 站点设置', 'setting', 'site', NULL), (4, '后台设置', 'setting', 'backend', NULL), (5, '插件管理[列表]', 'plugin', 'view', NULL), (6, '添加插件', 'plugin', 'add', NULL), (7, '修改插件', 'plugin', 'edit', NULL), (8, '卸载插件', 'plugin', 'del', NULL), (9, '导出插件', 'plugin', 'export', NULL), (10, '导入插件', 'plugin', 'import', NULL), (11, '激活插件', 'plugin', 'active', NULL), (12, '禁用插件', 'plugin', 'deactive', NULL), (13, '运行插件', 'module', 'run', NULL), (14, '内容模型管理[列表]', 'model', 'view', NULL), (15, '添加内容模型', 'model', 'add', NULL), (16, '修改内容模型', 'model', 'edit', NULL), (17, '删除内容模型', 'model', 'del', NULL), (18, '内容模型字段管理[列表]', 'model', 'fields', NULL), (19, '添加内容模型字段', 'model', 'add_filed', NULL), (20, '修改内容模型字段', 'model', 'edit_field', NULL), (21, '删除内容模型字段', 'model', 'del_field', NULL), (22, '分类模型管理[列表]', 'category', 'view', NULL), (23, '添加分类模型', 'category', 'add', NULL), (24, '修改分类模型', 'category', 'edit', NULL), (25, '删除分类模型', 'category', 'del', NULL), (26, '分类模型字段管理[列表]', 'category', 'fields', NULL), (27, '添加分类模型字段', 'category', 'add_filed', NULL), (28, '修改分类模型字段', 'category', 'edit_field', NULL), (29, '删除分类模型字段', 'category', 'del_field', NULL), (30, '内容管理[列表]', 'content', 'view', NULL), (31, '添加内容[表单]', 'content', 'form', 'add'), (32, '修改内容[表单]', 'content', 'form', 'edit'), (33, '添加内容[动作]', 'content', 'save', 'add'), (34, '修改内容[动作]', 'content', 'save', 'edit'), (35, '删除内容', 'content', 'del', NULL), (36, '分类管理[列表]', 'category_content', 'view', NULL), (37, '添加分类[表单]', 'category_content', 'form', 'add'), (38, '修改分类[表单]', 'category_content', 'form', 'edit'), (39, '添加分类[动作]', 'category_content', 'save', 'add'), (40, '修改分类[动作]', 'category_content', 'save', 'edit'), (41, '删除分类', 'category_content', 'del', NULL), (42, '用户组管理[列表]', 'role', 'view', NULL), (43, '添加用户组', 'role', 'add', NULL), (44, '修改用户组', 'role', 'edit', NULL), (45, '删除用户组', 'role', 'del', NULL), (46, '用户管理[列表]', 'user', 'view', NULL), (47, '添加用户', 'user', 'add', NULL), (48, '修改用户', 'user', 'edit', NULL), (49, '删除用户', 'user', 'del', NULL);
/*!40000 ALTER TABLE `dili_rights` ENABLE KEYS */;


# Dumping structure for table dilicms.dili_roles
DROP TABLE IF EXISTS `dili_roles`;
CREATE TABLE IF NOT EXISTS `dili_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `rights` varchar(255) NOT NULL,
  `models` varchar(255) NOT NULL,
  `category_models` varchar(255) NOT NULL,
  `plugins` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

# Dumping data for table dilicms.dili_roles: 2 rows
DELETE FROM `dili_roles`;
/*!40000 ALTER TABLE `dili_roles` DISABLE KEYS */;
INSERT INTO `dili_roles` (`id`, `name`, `rights`, `models`, `category_models`, `plugins`) VALUES (1, 'root', '', '', '', '');
/*!40000 ALTER TABLE `dili_roles` ENABLE KEYS */;


# Dumping structure for table dilicms.dili_sessions
DROP TABLE IF EXISTS `dili_sessions`;
CREATE TABLE IF NOT EXISTS `dili_sessions` (
  `session_id` varchar(40) NOT NULL DEFAULT '0',
  `ip_address` varchar(16) NOT NULL DEFAULT '0',
  `user_agent` varchar(50) NOT NULL,
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `user_data` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dumping structure for table dilicms.dili_site_settings
DROP TABLE IF EXISTS `dili_site_settings`;
CREATE TABLE IF NOT EXISTS `dili_site_settings` (
  `site_name` varchar(50) DEFAULT NULL,
  `site_domain` varchar(50) DEFAULT NULL,
  `site_logo` varchar(50) DEFAULT NULL,
  `site_icp` varchar(50) DEFAULT NULL,
  `site_terms` text,
  `site_stats` varchar(200) DEFAULT NULL,
  `site_footer` varchar(500) DEFAULT NULL,
  `site_status` tinyint(1) DEFAULT '1',
  `site_close_reason` varchar(200) DEFAULT NULL,
  `site_keyword` varchar(200) DEFAULT NULL,
  `site_description` varchar(200) DEFAULT NULL,
  `site_theme` varchar(20) DEFAULT NULL,
  `attachment_dir` varchar(20) DEFAULT NULL,
  `attachment_type` varchar(50) DEFAULT NULL,
  `attachment_maxupload` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Dumping data for table dilicms.dili_site_settings: 1 rows
DELETE FROM `dili_site_settings`;
/*!40000 ALTER TABLE `dili_site_settings` DISABLE KEYS */;
INSERT INTO `dili_site_settings` (`site_name`, `site_domain`, `site_logo`, `site_icp`, `site_terms`, `site_stats`, `site_footer`, `site_status`, `site_close_reason`, `site_keyword`, `site_description`, `site_theme`, `attachment_dir`, `attachment_type`, `attachment_maxupload`) VALUES ('DiliCMS', 'http://www.dilicms.com', 'images/logo.gif', '', '', '', '', 1, '网站维护升级中......', 'DiliCMS', 'DiliCMS', 'default', 'attachments', '*.jpg;*.gif;*.png', '2097152');
/*!40000 ALTER TABLE `dili_site_settings` ENABLE KEYS */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 80021
Source Host           : localhost:3306
Source Database       : goadmindb

Target Server Type    : MYSQL
Target Server Version : 80021
File Encoding         : 65001

Date: 2020-08-16 23:25:02
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for rcm_attachment
-- ----------------------------
DROP TABLE IF EXISTS `rcm_attachment`;
CREATE TABLE `rcm_attachment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sys_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '系统编号',
  `file_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '附件名称',
  `file_format` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '附件格式',
  `file_size` varchar(50) DEFAULT NULL COMMENT '文件大小',
  `remark` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '备注信息',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `create_by` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `update_by` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='附件表';

-- ----------------------------
-- Table structure for rcm_comment
-- ----------------------------
DROP TABLE IF EXISTS `rcm_comment`;
CREATE TABLE `rcm_comment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `content` varchar(300) DEFAULT NULL,
  `create_by` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `update_by` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='评论表';

-- ----------------------------
-- Table structure for rcm_contacts
-- ----------------------------
DROP TABLE IF EXISTS `rcm_contacts`;
CREATE TABLE `rcm_contacts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sys_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '系统编号',
  `name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '联系人姓名',
  `sex` varchar(255) DEFAULT NULL COMMENT '尊称',
  `role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '角色',
  `birthdate` date DEFAULT NULL COMMENT '生日',
  `post` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '部门职务',
  `phone` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '手机号码',
  `tel` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '固定电话',
  `fax` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '传真号码',
  `email` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '电子邮箱',
  `weixin` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '微信账号',
  `qq` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'QQ号码',
  `location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '所在地区',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '详细地址',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '备注信息',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `create_by` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `update_by` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_unique_rcc_code` (`sys_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='联系人表';

-- ----------------------------
-- Table structure for rcm_cost
-- ----------------------------
DROP TABLE IF EXISTS `rcm_cost`;
CREATE TABLE `rcm_cost` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sys_code` varchar(50) DEFAULT NULL COMMENT '费用编号',
  `name` varchar(128) DEFAULT NULL COMMENT '费用名称',
  `cost_type` varchar(255) DEFAULT NULL COMMENT '费用类型',
  `amt` decimal(10,0) DEFAULT NULL COMMENT '费用金额',
  `remark` varchar(300) DEFAULT NULL COMMENT '费用描述',
  `cost_time` datetime DEFAULT NULL COMMENT '发生时间',
  `cust_id` int DEFAULT NULL COMMENT '关联客户',
  `contact_id` int DEFAULT NULL COMMENT '联系人',
  `project_type` varchar(255) DEFAULT NULL COMMENT '商机/订单',
  `project_id` int DEFAULT NULL,
  `follow_id` int DEFAULT NULL COMMENT '跟进记录',
  `user_id` int DEFAULT NULL COMMENT '负责人员',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `create_by` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `update_by` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='费用单';

-- ----------------------------
-- Table structure for rcm_cost_attachment
-- ----------------------------
DROP TABLE IF EXISTS `rcm_cost_attachment`;
CREATE TABLE `rcm_cost_attachment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cost_id` int DEFAULT NULL,
  `attachment_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for rcm_cust
-- ----------------------------
DROP TABLE IF EXISTS `rcm_cust`;
CREATE TABLE `rcm_cust` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sys_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '系统编号',
  `cust_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '客户名称',
  `simple_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '助记名称',
  `industry_type` varchar(255) NOT NULL COMMENT '所属行业',
  `cust_type` varchar(255) NOT NULL COMMENT '客户类型',
  `cust_status` varchar(255) NOT NULL COMMENT '客户状态',
  `cust_level` varchar(255) NOT NULL COMMENT '客户星级',
  `origin` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '客户来源',
  `location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '所在地区',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '详细地址',
  `enterprise_size` varchar(255) DEFAULT NULL COMMENT '企业规模',
  `parent_cust` int DEFAULT NULL COMMENT '上级客户',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '备注信息',
  `create_by` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `update_by` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_unique_rc_code` (`sys_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='客户表';

-- ----------------------------
-- Table structure for rcm_cust_concert
-- ----------------------------
DROP TABLE IF EXISTS `rcm_cust_concert`;
CREATE TABLE `rcm_cust_concert` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cust_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `create_by` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `update_by` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='客户与协作人关系表';

-- ----------------------------
-- Table structure for rcm_cust_contacts
-- ----------------------------
DROP TABLE IF EXISTS `rcm_cust_contacts`;
CREATE TABLE `rcm_cust_contacts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cust_id` int DEFAULT NULL,
  `contacts_id` int DEFAULT NULL,
  `first_choice` bit(1) DEFAULT NULL COMMENT '是否为首选联系人',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `create_by` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `update_by` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='客户与联系人关系表';

-- ----------------------------
-- Table structure for rcm_cust_follow
-- ----------------------------
DROP TABLE IF EXISTS `rcm_cust_follow`;
CREATE TABLE `rcm_cust_follow` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cust_id` int DEFAULT NULL,
  `follow_id` int DEFAULT NULL,
  `create_by` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `update_by` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='客户与跟进表的关系';

-- ----------------------------
-- Table structure for rcm_cust_opportunity
-- ----------------------------
DROP TABLE IF EXISTS `rcm_cust_opportunity`;
CREATE TABLE `rcm_cust_opportunity` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cust_id` int DEFAULT NULL,
  `opportunity_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `create_by` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `update_by` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='客户与商机关系表';

-- ----------------------------
-- Table structure for rcm_cust_task
-- ----------------------------
DROP TABLE IF EXISTS `rcm_cust_task`;
CREATE TABLE `rcm_cust_task` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cust_id` int DEFAULT NULL,
  `task_id` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `create_by` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `update_by` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='客户与任务关系表';

-- ----------------------------
-- Table structure for rcm_follow
-- ----------------------------
DROP TABLE IF EXISTS `rcm_follow`;
CREATE TABLE `rcm_follow` (
  `id` int NOT NULL AUTO_INCREMENT,
  `follow_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '跟进类型',
  `follow_time` datetime DEFAULT NULL COMMENT '跟进时间',
  `content` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '跟进内容',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '状态',
  `contacts_id` int DEFAULT NULL COMMENT '联系人',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `create_by` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `update_by` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='跟进记录表';

-- ----------------------------
-- Table structure for rcm_hk
-- ----------------------------
DROP TABLE IF EXISTS `rcm_hk`;
CREATE TABLE `rcm_hk` (
  `id` int NOT NULL,
  `sys_code` varchar(50) DEFAULT NULL COMMENT '系统编号',
  `hk_date` date DEFAULT NULL COMMENT '回款日期',
  `cust_id` int DEFAULT NULL COMMENT '关联客户',
  `order_id` int DEFAULT NULL COMMENT '关联订单',
  `period` int DEFAULT NULL COMMENT '回款期次',
  `pay_type` varchar(255) DEFAULT NULL COMMENT '付款方式',
  `rm_type` varchar(255) DEFAULT NULL COMMENT '回款类型',
  `accept_user_id` int DEFAULT NULL COMMENT '收款人员',
  `remark` varchar(300) DEFAULT NULL COMMENT '备注信息',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `create_by` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `update_by` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='回款表';

-- ----------------------------
-- Table structure for rcm_hk_plan
-- ----------------------------
DROP TABLE IF EXISTS `rcm_hk_plan`;
CREATE TABLE `rcm_hk_plan` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cust_id` int DEFAULT NULL COMMENT '客户ID',
  `order_id` int DEFAULT NULL COMMENT '订单ID',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `create_by` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `update_by` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for rcm_hk_plan_detail
-- ----------------------------
DROP TABLE IF EXISTS `rcm_hk_plan_detail`;
CREATE TABLE `rcm_hk_plan_detail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `plan_id` int DEFAULT NULL,
  `period` int DEFAULT NULL COMMENT '期次',
  `hk_date` date DEFAULT NULL COMMENT '计划回款日期',
  `hk_ratio` float DEFAULT NULL COMMENT '计划回款占比(%)',
  `amt` decimal(10,4) DEFAULT NULL COMMENT '计划回款金额(元)',
  `remark` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '备注',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `create_by` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `update_by` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='回款计划明细表';

-- ----------------------------
-- Table structure for rcm_invoice
-- ----------------------------
DROP TABLE IF EXISTS `rcm_invoice`;
CREATE TABLE `rcm_invoice` (
  `id` int NOT NULL AUTO_INCREMENT,
  `create_date` date DEFAULT NULL COMMENT '开票日期',
  `amt` decimal(10,4) DEFAULT NULL COMMENT '开票金额',
  `cust_id` int DEFAULT NULL COMMENT '关联客户',
  `order_id` int DEFAULT NULL COMMENT '关联订单',
  `bill_type` varchar(255) DEFAULT NULL COMMENT '票据类型',
  `bill_content` varchar(255) DEFAULT NULL COMMENT '票据内容',
  `bill_code` varchar(128) DEFAULT NULL COMMENT '发票号码',
  `user_id` int DEFAULT NULL COMMENT '经手人员',
  `remark` varchar(300) DEFAULT NULL COMMENT '备注信息',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='发票表';

-- ----------------------------
-- Table structure for rcm_leads
-- ----------------------------
DROP TABLE IF EXISTS `rcm_leads`;
CREATE TABLE `rcm_leads` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sys_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '系统编号',
  `cust_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '客户名称',
  `contacts_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '联系人姓名',
  `contacts_sex` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '尊称',
  `contacts_role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '角色',
  `contacts_post` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '部门职务',
  `contacts_phone` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '手机号码',
  `contacts_tel` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '固定电话',
  `conatcts_fax` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '传真号码',
  `contacts_email` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '电子邮箱',
  `contacts_weixin` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '微信账号',
  `contacts_qq` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'QQ号码',
  `leads_origin` varchar(255) DEFAULT NULL COMMENT '线索来源',
  `leads_status` varchar(255) NOT NULL COMMENT '线索状态',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `create_by` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `update_by` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_unique_rl_code` (`sys_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='销售线索表';

-- ----------------------------
-- Table structure for rcm_leads_follow
-- ----------------------------
DROP TABLE IF EXISTS `rcm_leads_follow`;
CREATE TABLE `rcm_leads_follow` (
  `id` int NOT NULL AUTO_INCREMENT,
  `leads_id` int DEFAULT NULL,
  `follow_id` int DEFAULT NULL,
  `create_by` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `update_by` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='销售线索与跟进关系表';

-- ----------------------------
-- Table structure for rcm_leads_task
-- ----------------------------
DROP TABLE IF EXISTS `rcm_leads_task`;
CREATE TABLE `rcm_leads_task` (
  `id` int NOT NULL AUTO_INCREMENT,
  `leads_id` int DEFAULT NULL,
  `task_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `create_by` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `update_by` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='销售线索的任务';

-- ----------------------------
-- Table structure for rcm_opportunity
-- ----------------------------
DROP TABLE IF EXISTS `rcm_opportunity`;
CREATE TABLE `rcm_opportunity` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sys_code` varchar(50) DEFAULT NULL COMMENT '系统编号',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '商机标题',
  `expect_sale_amt` decimal(10,4) DEFAULT NULL COMMENT '预计销售金额',
  `expect_signing_date` date DEFAULT NULL COMMENT ' 预计签单日期',
  `sale_period` varchar(255) DEFAULT NULL COMMENT '销售阶段',
  `opp_type` varchar(255) DEFAULT NULL COMMENT '商机类型',
  `achieve_rate` varchar(255) DEFAULT NULL COMMENT '成交机率',
  `origin` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '商机来源',
  `get_date` date DEFAULT NULL COMMENT '获取日期',
  `remark` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '备注信息',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `create_by` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `update_by` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='商机表';

-- ----------------------------
-- Table structure for rcm_opportunity_concert
-- ----------------------------
DROP TABLE IF EXISTS `rcm_opportunity_concert`;
CREATE TABLE `rcm_opportunity_concert` (
  `id` int NOT NULL AUTO_INCREMENT,
  `opportunity_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `create_by` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `update_by` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='商机协作表';

-- ----------------------------
-- Table structure for rcm_opportunity_contacts
-- ----------------------------
DROP TABLE IF EXISTS `rcm_opportunity_contacts`;
CREATE TABLE `rcm_opportunity_contacts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `opportunity_id` int DEFAULT NULL,
  `contacts_id` int DEFAULT NULL,
  `main_choice` bit(1) DEFAULT NULL COMMENT '是否为主要联系人',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `create_by` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `update_by` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='商机与联系人关系表';

-- ----------------------------
-- Table structure for rcm_opportunity_follow
-- ----------------------------
DROP TABLE IF EXISTS `rcm_opportunity_follow`;
CREATE TABLE `rcm_opportunity_follow` (
  `id` int NOT NULL AUTO_INCREMENT,
  `opportunity_id` int DEFAULT NULL,
  `follow_id` int DEFAULT NULL,
  `create_by` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `update_by` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='商机与跟进的关系表';

-- ----------------------------
-- Table structure for rcm_opportunity_order
-- ----------------------------
DROP TABLE IF EXISTS `rcm_opportunity_order`;
CREATE TABLE `rcm_opportunity_order` (
  `id` int NOT NULL,
  `opportunity_id` int DEFAULT NULL,
  `order_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `create_by` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `update_by` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='商机与订单关系表';

-- ----------------------------
-- Table structure for rcm_opportunity_quotation
-- ----------------------------
DROP TABLE IF EXISTS `rcm_opportunity_quotation`;
CREATE TABLE `rcm_opportunity_quotation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `opportunity_id` int DEFAULT NULL COMMENT '商机ID',
  `product_id` int DEFAULT NULL COMMENT '产品ID',
  `product_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '产品编号',
  `product_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '产品名称',
  `standard_price` decimal(10,4) DEFAULT NULL COMMENT '标准单价',
  `sale_price` decimal(10,4) DEFAULT NULL COMMENT '销售单价(元)',
  `qty` int DEFAULT NULL COMMENT '数量',
  `discount` int DEFAULT NULL COMMENT '折扣(%)',
  `product_specs_label` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '产品规格',
  `remark` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '备注',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `create_by` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `update_by` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='商机的产品报价单';

-- ----------------------------
-- Table structure for rcm_opportunity_task
-- ----------------------------
DROP TABLE IF EXISTS `rcm_opportunity_task`;
CREATE TABLE `rcm_opportunity_task` (
  `id` int NOT NULL AUTO_INCREMENT,
  `opportunity_id` int DEFAULT NULL,
  `task_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `create_by` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `update_by` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='商机与任务的关系表';

-- ----------------------------
-- Table structure for rcm_order
-- ----------------------------
DROP TABLE IF EXISTS `rcm_order`;
CREATE TABLE `rcm_order` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sys_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '系统编码',
  `title` varchar(128) DEFAULT NULL COMMENT '订单标题',
  `cust_id` int DEFAULT NULL COMMENT '关联客户',
  `cust_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '关联客户名称',
  `total_amt` decimal(10,4) DEFAULT NULL COMMENT '订单总金额',
  `order_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '订单类型值',
  `order_type_label` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '订单类型标签',
  `order_date` date DEFAULT NULL COMMENT '签单日期',
  `start_date` date DEFAULT NULL COMMENT '开始日期',
  `expire_date` date DEFAULT NULL COMMENT '到期日期',
  `cust_signer` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '客户签约人',
  `we_signer` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '我方签约人',
  `pay_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '付款方式值',
  `pay_type_label` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '付款方式标签',
  `remark` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '备注信息',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `create_by` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `update_by` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='订单表';

-- ----------------------------
-- Table structure for rcm_order_attachment
-- ----------------------------
DROP TABLE IF EXISTS `rcm_order_attachment`;
CREATE TABLE `rcm_order_attachment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_id` int DEFAULT NULL,
  `attachment_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `create_by` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `update_by` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='订单与附件关系表';

-- ----------------------------
-- Table structure for rcm_order_concert
-- ----------------------------
DROP TABLE IF EXISTS `rcm_order_concert`;
CREATE TABLE `rcm_order_concert` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `create_by` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `update_by` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='订单与协作关系表';

-- ----------------------------
-- Table structure for rcm_order_product
-- ----------------------------
DROP TABLE IF EXISTS `rcm_order_product`;
CREATE TABLE `rcm_order_product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_id` int DEFAULT NULL COMMENT '订单ID',
  `product_id` int DEFAULT NULL COMMENT '产品ID',
  `product_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '产品编号',
  `product_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '产品名称',
  `standard_price` decimal(10,4) DEFAULT NULL COMMENT '标准单价',
  `sale_price` decimal(10,4) DEFAULT NULL COMMENT '销售单价(元)',
  `qty` int DEFAULT NULL COMMENT '数量',
  `discount` int DEFAULT NULL COMMENT '折扣(%)',
  `product_specs_label` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '产品规格',
  `remark` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '备注',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `create_by` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `update_by` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='订单的产品表';

-- ----------------------------
-- Table structure for rcm_order_task
-- ----------------------------
DROP TABLE IF EXISTS `rcm_order_task`;
CREATE TABLE `rcm_order_task` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_id` int DEFAULT NULL,
  `task_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `create_by` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `update_by` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='订单与任务关系表';

-- ----------------------------
-- Table structure for rcm_reimbursement
-- ----------------------------
DROP TABLE IF EXISTS `rcm_reimbursement`;
CREATE TABLE `rcm_reimbursement` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `dept_id` int DEFAULT NULL,
  `remark` varchar(300) DEFAULT NULL,
  `create_by` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `update_by` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='报销单';

-- ----------------------------
-- Table structure for rcm_reimbursement_cost
-- ----------------------------
DROP TABLE IF EXISTS `rcm_reimbursement_cost`;
CREATE TABLE `rcm_reimbursement_cost` (
  `id` int NOT NULL,
  `reimbursement_id` int DEFAULT NULL,
  `cost_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='报销与费用关系表';

-- ----------------------------
-- Table structure for rcm_task
-- ----------------------------
DROP TABLE IF EXISTS `rcm_task`;
CREATE TABLE `rcm_task` (
  `id` int NOT NULL AUTO_INCREMENT,
  `task_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '任务类型',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务标题',
  `start_time` datetime NOT NULL COMMENT '开始时间',
  `finish_time` datetime NOT NULL COMMENT '结束时间',
  `important_type` varchar(255) DEFAULT NULL COMMENT '紧要程度',
  `content` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '任务描述',
  `tag` varchar(255) DEFAULT NULL COMMENT '任务标记',
  `remind_times` varchar(255) DEFAULT NULL COMMENT '任务提醒',
  `remind_type` varchar(255) DEFAULT NULL COMMENT '提醒方式',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `create_by` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `update_by` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='普通任务表';

-- ----------------------------
-- Table structure for rcm_task_attachment
-- ----------------------------
DROP TABLE IF EXISTS `rcm_task_attachment`;
CREATE TABLE `rcm_task_attachment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `task_id` int DEFAULT NULL,
  `attachment_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `create_by` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `update_by` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='任务的附件表';

-- ----------------------------
-- Table structure for rcm_task_comment
-- ----------------------------
DROP TABLE IF EXISTS `rcm_task_comment`;
CREATE TABLE `rcm_task_comment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `task_id` int DEFAULT NULL,
  `comment_id` int DEFAULT NULL,
  `create_by` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `update_by` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='任务与评论关系表';

-- ----------------------------
-- Table structure for rcm_task_partner
-- ----------------------------
DROP TABLE IF EXISTS `rcm_task_partner`;
CREATE TABLE `rcm_task_partner` (
  `id` int NOT NULL AUTO_INCREMENT,
  `task_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `create_by` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `update_by` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='任务参与人员表';

-- ----------------------------
-- Table structure for rcm_user_cust
-- ----------------------------
DROP TABLE IF EXISTS `rcm_user_cust`;
CREATE TABLE `rcm_user_cust` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `cust_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `create_by` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `update_by` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户与客户关系表';

-- ----------------------------
-- Table structure for rcm_user_leads
-- ----------------------------
DROP TABLE IF EXISTS `rcm_user_leads`;
CREATE TABLE `rcm_user_leads` (
  `id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `leads_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `create_by` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `update_by` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户与销售线索关系表';

-- ----------------------------
-- Table structure for rcm_user_opportunity
-- ----------------------------
DROP TABLE IF EXISTS `rcm_user_opportunity`;
CREATE TABLE `rcm_user_opportunity` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `opportunity_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `create_by` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `update_by` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户与商机关系表';

-- ----------------------------
-- Table structure for rcm_user_order
-- ----------------------------
DROP TABLE IF EXISTS `rcm_user_order`;
CREATE TABLE `rcm_user_order` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `order_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `create_by` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `update_by` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户与订单关系表';

-- ----------------------------
-- Table structure for rcm_user_task
-- ----------------------------
DROP TABLE IF EXISTS `rcm_user_task`;
CREATE TABLE `rcm_user_task` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL COMMENT '用户ID',
  `task_id` int DEFAULT NULL COMMENT '任务ID',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `create_by` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `update_by` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户与任务关系表';

-- ----------------------------
-- Table structure for sto_category
-- ----------------------------
DROP TABLE IF EXISTS `sto_category`;
CREATE TABLE `sto_category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sys_code` varchar(50) DEFAULT NULL COMMENT '系统编号',
  `category_name` varchar(128) DEFAULT NULL COMMENT '分类名称',
  `parent_id` int DEFAULT NULL COMMENT '上级ID',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `create_by` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `update_by` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='产品分类表';
BEGIN;
-- ----------------------------
-- Table structure for sto_category_product
-- ----------------------------
DROP TABLE IF EXISTS `sto_category_product`;
CREATE TABLE `sto_category_product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category_id` int DEFAULT NULL COMMENT '产品分类ID',
  `product_id` int DEFAULT NULL COMMENT '产品ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='产品与分类关系表';

-- ----------------------------
-- Table structure for sto_product
-- ----------------------------
DROP TABLE IF EXISTS `sto_product`;
CREATE TABLE `sto_product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sys_code` varchar(50) DEFAULT NULL COMMENT '产品编号',
  `product_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '产品名称',
  `standard_price` decimal(10,4) DEFAULT NULL COMMENT '标准单价',
  `product_specs` varchar(255) DEFAULT NULL COMMENT '产品规格',
  `remark` varchar(300) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `create_by` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `update_by` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='产品表';

COMMIT;


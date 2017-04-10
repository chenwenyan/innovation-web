/*
SQLyog Ultimate v12.08 (64 bit)
MySQL - 5.6.19-log : Database - innovation-web
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`innovation-web` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `innovation-web`;

/*Table structure for table `t_article` */

DROP TABLE IF EXISTS `t_article`;

CREATE TABLE `t_article` (
  `id` int(30) NOT NULL AUTO_INCREMENT COMMENT '文章id',
  `title` varchar(250) NOT NULL COMMENT '标题',
  `content` text NOT NULL COMMENT '内容',
  `type_id` int(30) NOT NULL COMMENT '类别',
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `last_modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最近修改时间',
  `creator_id` int(11) DEFAULT NULL COMMENT '创建者id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

/*Table structure for table `t_project` */

DROP TABLE IF EXISTS `t_project`;

CREATE TABLE `t_project` (
  `id` int(30) NOT NULL AUTO_INCREMENT COMMENT '项目id',
  `name` varchar(500) NOT NULL COMMENT '项目名称',
  `charger` varchar(30) NOT NULL COMMENT '负责人',
  `teacher` varchar(30) NOT NULL COMMENT '指导老师',
  `school_Id` varchar(100) NOT NULL COMMENT '学院id',
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `last_modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最近修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `t_school` */

DROP TABLE IF EXISTS `t_school`;

CREATE TABLE `t_school` (
  `id` int(30) NOT NULL AUTO_INCREMENT COMMENT '学院id',
  `name` varchar(100) NOT NULL COMMENT '学院名称',
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `last_modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最近修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `t_type` */

DROP TABLE IF EXISTS `t_type`;

CREATE TABLE `t_type` (
  `id` int(30) NOT NULL AUTO_INCREMENT COMMENT '类别id',
  `name` varchar(30) NOT NULL COMMENT '类别名称',
  `assistant_code` varchar(30) NOT NULL COMMENT '助记码',
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `last_modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最近修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Table structure for table `t_user` */

DROP TABLE IF EXISTS `t_user`;

CREATE TABLE `t_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `username` varchar(30) NOT NULL COMMENT '用户名',
  `password` varchar(30) NOT NULL COMMENT '密码',
  `type` int(5) NOT NULL DEFAULT '2' COMMENT '用户身份：1超级管理员 2管理员',
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `last_modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最近修改时间',
  `status` int(5) NOT NULL DEFAULT '1' COMMENT '状态：1正常 2停用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

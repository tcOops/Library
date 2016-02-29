# Host: localhost  (Version: 5.6.24)
# Date: 2016-02-29 19:21:38
# Generator: MySQL-Front 5.3  (Build 4.214)

/*!40101 SET NAMES utf8 */;

#
# Structure for table "admin"
#

CREATE TABLE `admin` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) DEFAULT NULL,
  `alias` varchar(60) DEFAULT NULL,
  `password` varchar(60) DEFAULT NULL,
  `generate_date` date DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

#
# Structure for table "authority"
#

CREATE TABLE `authority` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `role_id` int(4) NOT NULL,
  `TSLT` varchar(20) DEFAULT '0000000000000',
  `DQLT` varchar(20) DEFAULT '0000000000000',
  `YQWH` varchar(20) DEFAULT '0000000000000',
  `CZRZ` varchar(20) DEFAULT '0000000000000',
  `JYPH` varchar(20) DEFAULT '0000000000000',
  `BJTJ` varchar(20) DEFAULT '0000000000000',
  `SJBM` varchar(20) DEFAULT '0000000000000',
  `SJDC` varchar(20) DEFAULT '0000000000000',
  `SJQD` varchar(20) DEFAULT '0000000000000',
  `DZGL` varchar(20) DEFAULT '0000000000000',
  `DZJS` varchar(20) DEFAULT '0000000000000',
  `CBS` varchar(20) DEFAULT '0000000000000',
  `ZTFL` varchar(20) DEFAULT '0000000000000',
  `ZCHGL` varchar(20) DEFAULT '0000000000000',
  `GCD` varchar(20) DEFAULT '0000000000000',
  `SHLB` varchar(20) DEFAULT '0000000000000',
  `NJGL` varchar(20) DEFAULT '0000000000000',
  `BJGL` varchar(20) DEFAULT '0000000000000',
  `YHGL` varchar(20) DEFAULT '0000000000000',
  `YHJS` varchar(20) DEFAULT '0000000000000',
  `QXSZ` varchar(20) DEFAULT '0000000000000',
  `MMXG` varchar(20) DEFAULT '0000000000000',
  `GGGL` varchar(20) DEFAULT '0000000000000',
  `XCHGL` varchar(20) DEFAULT '0000000000000',
  `SJBF` varchar(20) DEFAULT '0000000000000',
  `BFRZ` varchar(20) DEFAULT '0000000000000',
  `LJFWQ` varchar(20) DEFAULT '0000000000000',
  `XTCZRZ` varchar(20) DEFAULT '0000000000000',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Structure for table "book"
#

CREATE TABLE `book` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `ISBN` varchar(60) NOT NULL DEFAULT '',
  `signal_code` varchar(60) DEFAULT NULL,
  `sn_code` varchar(50) DEFAULT NULL,
  `name` varchar(200) NOT NULL DEFAULT '',
  `author` varchar(60) NOT NULL DEFAULT '',
  `publisher_name` varchar(200) DEFAULT NULL,
  `publisher_id` int(10) NOT NULL DEFAULT '0',
  `publish_date` varchar(50) DEFAULT NULL,
  `price` varchar(15) DEFAULT '25',
  `language` varchar(50) DEFAULT NULL,
  `status` varchar(60) DEFAULT NULL,
  `location_id` int(10) DEFAULT '0',
  `location_name` varchar(50) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT '0',
  `serial_code` varchar(50) DEFAULT NULL,
  `oper_id` int(4) DEFAULT '0',
  `op_time` varchar(50) DEFAULT NULL,
  `index_id` varchar(50) DEFAULT NULL,
  `page_number` int(8) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101893 DEFAULT CHARSET=utf8;

#
# Structure for table "bookstorelocation"
#

CREATE TABLE `bookstorelocation` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `location` varchar(200) DEFAULT NULL,
  `door_ip` varchar(60) DEFAULT NULL,
  `door_port` int(6) DEFAULT NULL,
  `RFID_ip` varchar(60) DEFAULT NULL,
  `RFID_port` int(6) DEFAULT NULL,
  `code` varchar(20) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT NULL,
  `sn_code` varchar(20) DEFAULT '00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

#
# Structure for table "circulation"
#

CREATE TABLE `circulation` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `reader_name` varchar(30) NOT NULL DEFAULT '0',
  `book_id` varchar(50) NOT NULL DEFAULT '''''' COMMENT '书的卡号',
  `signal_code` varchar(60) DEFAULT NULL COMMENT '读者卡号',
  `action_time` varchar(50) DEFAULT NULL,
  `action_type` varchar(60) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT NULL,
  `book_name` varchar(150) DEFAULT '""',
  `location_id` bigint(10) DEFAULT '0',
  `location_name` varchar(200) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=454 DEFAULT CHARSET=utf8;

#
# Structure for table "class"
#

CREATE TABLE `class` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) DEFAULT NULL,
  `grade_id` int(4) DEFAULT NULL,
  `code_number` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

#
# Structure for table "damage_log"
#

CREATE TABLE `damage_log` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `damage_type` varchar(50) DEFAULT NULL,
  `compensate_type` varchar(50) DEFAULT NULL,
  `compensate_cnt` double DEFAULT NULL,
  `remark` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Structure for table "doorrecord"
#

CREATE TABLE `doorrecord` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `action` varchar(60) DEFAULT NULL,
  `action_date` varchar(255) DEFAULT NULL,
  `door_ip` varchar(60) DEFAULT NULL,
  `generate_date` varchar(255) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT NULL,
  `signal_code` varchar(60) DEFAULT NULL,
  `is_demo` tinyint(1) DEFAULT '0' COMMENT '用于演示',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1397 DEFAULT CHARSET=utf8;

#
# Structure for table "grade"
#

CREATE TABLE `grade` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) DEFAULT NULL,
  `school_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

#
# Structure for table "publisher"
#

CREATE TABLE `publisher` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `location` varchar(200) DEFAULT NULL,
  `shortcut` varchar(60) DEFAULT NULL,
  `generate_date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Structure for table "reader"
#

CREATE TABLE `reader` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) DEFAULT NULL,
  `sex` varchar(20) DEFAULT NULL,
  `class_id` varchar(15) DEFAULT NULL,
  `student_code` varchar(60) DEFAULT NULL,
  `student_card_number` varchar(60) DEFAULT NULL,
  `password` varchar(60) DEFAULT NULL,
  `role` varchar(50) DEFAULT '学生',
  `reader_status` varchar(60) DEFAULT NULL,
  `generate_date` date DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3277 DEFAULT CHARSET=utf8;

#
# Structure for table "rfidrecord"
#

CREATE TABLE `rfidrecord` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `action_date` varchar(30) DEFAULT NULL,
  `signal_code` varchar(60) DEFAULT NULL,
  `ip` varchar(60) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT NULL,
  `is_demo` tinyint(1) DEFAULT '0' COMMENT '用于演示',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2566 DEFAULT CHARSET=utf8;

#
# Structure for table "school"
#

CREATE TABLE `school` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `contacter` varchar(60) DEFAULT NULL,
  `phone_number` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

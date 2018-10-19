/*
Navicat MySQL Data Transfer

Source Server         : 本地mysql
Source Server Version : 50520
Source Host           : localhost:3306
Source Database       : weibo

Target Server Type    : MYSQL
Target Server Version : 50520
File Encoding         : 65001

Date: 2018-03-20 13:57:36
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `comment`
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `c_id` int(10) NOT NULL AUTO_INCREMENT,
  `c_comment` text,
  `c_user` varchar(20) DEFAULT NULL,
  `c_message_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`c_id`),
  KEY `c_message_id` (`c_message_id`),
  CONSTRAINT `c_message_id` FOREIGN KEY (`c_message_id`) REFERENCES `message` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('1', '第一条评论', '2671268148@qq.com', '9');
INSERT INTO `comment` VALUES ('2', '这是什么', '2671268148@qq.com', '9');
INSERT INTO `comment` VALUES ('6', '124578895623', '2671268148@qq.com', '13');
INSERT INTO `comment` VALUES ('10', '老马在重庆是一位名人。1988年从部队转业后，他到观音桥街道当了一名调解员。30年来，他成功调解矛盾纠纷2000多起，写了160多本、500多万字的工作笔记，总结形成“老马工作法”，推广到全国。\r\n\r\n“老马工作室”微信公号由几个年轻人运营，他们把老马的工作笔记整理后传播到网上。熟悉老马的人知道他有“三不”：不上网、不娱乐、不轻易交友。他说这样有四个好处：有时间、平静、纯洁、坚持。\r\n\r\n2016年，是重庆本土互联网企业“猪八戒网”创办的第十个年头。就在习近平考察重庆的前四天，2016年1月1日，公司启用了全新的域名zbj.com。在猪八戒网，买卖的不是实体商品，而是人才服务。它实现了有技能的知识分子与有需求的雇主企业之间的联接。', '222@qq.com', '15');
INSERT INTO `comment` VALUES ('11', 'hello', '222@qq.com', '36');
INSERT INTO `comment` VALUES ('12', '这是第二个评论', '333@qq.com', '36');
INSERT INTO `comment` VALUES ('13', '1234', '2671268148@qq.com', '38');
INSERT INTO `comment` VALUES ('14', '测试', '2671268148@qq.com', '38');
INSERT INTO `comment` VALUES ('15', '评论', '2671268148@qq.com', '42');

-- ----------------------------
-- Table structure for `fans`
-- ----------------------------
DROP TABLE IF EXISTS `fans`;
CREATE TABLE `fans` (
  `f_id` int(10) NOT NULL AUTO_INCREMENT,
  `f_u_id` int(10) DEFAULT NULL,
  `f_name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`f_id`),
  KEY `f_u_id` (`f_u_id`),
  CONSTRAINT `f_u_id` FOREIGN KEY (`f_u_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fans
-- ----------------------------
INSERT INTO `fans` VALUES ('1', '4', '12');
INSERT INTO `fans` VALUES ('2', '19', '2671268148@qq.com');
INSERT INTO `fans` VALUES ('3', '19', '2671268148@qq.com');
INSERT INTO `fans` VALUES ('4', '18', '2671268148@qq.com');
INSERT INTO `fans` VALUES ('5', '15', '2671268148@qq.com');
INSERT INTO `fans` VALUES ('6', '14', '123456789@qq.com');
INSERT INTO `fans` VALUES ('7', '18', '2671268148@qq.com');
INSERT INTO `fans` VALUES ('8', '19', '2671268148@qq.com');
INSERT INTO `fans` VALUES ('9', '3', '2671268148@qq.com');

-- ----------------------------
-- Table structure for `love`
-- ----------------------------
DROP TABLE IF EXISTS `love`;
CREATE TABLE `love` (
  `l_id` int(10) NOT NULL AUTO_INCREMENT,
  `u_id` int(10) DEFAULT NULL,
  `u_name_ed` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`l_id`),
  KEY `u_id` (`u_id`),
  CONSTRAINT `u_id` FOREIGN KEY (`u_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of love
-- ----------------------------
INSERT INTO `love` VALUES ('2', '4', '123');
INSERT INTO `love` VALUES ('3', '4', '2');
INSERT INTO `love` VALUES ('6', '14', '333@qq.com');
INSERT INTO `love` VALUES ('8', '14', '222@qq.com');
INSERT INTO `love` VALUES ('9', '14', '123456789@qq.com');
INSERT INTO `love` VALUES ('10', '15', '2671268148@qq.com');
INSERT INTO `love` VALUES ('11', '14', '222@qq.com');
INSERT INTO `love` VALUES ('13', '14', '李四');

-- ----------------------------
-- Table structure for `message`
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text,
  `user_id` int(10) DEFAULT NULL,
  `publish_time` varchar(30) DEFAULT NULL,
  `message_image` text,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES ('1', 'hfihiwqriqwhrq', '3', null, '/images/mmexport1517323669985.jpg');
INSERT INTO `message` VALUES ('3', '你好吗', '14', null, '/images/mmexport1517323669985.jpg');
INSERT INTO `message` VALUES ('4', 'hfihiwqriqwhrq', '14', null, '/images/mmexport1517323669985.jpg');
INSERT INTO `message` VALUES ('6', 'fetwt', '14', null, '/images/mmexport1517323669985.jpg');
INSERT INTO `message` VALUES ('7', '如果你能像看别人缺点一样，如此准确般的发现自己的缺点，那么你的生命将会不平凡', '14', null, '/images/mmexport1517323669985.jpg');
INSERT INTO `message` VALUES ('8', 'fetwt', '14', null, '/images/mmexport1517323669985.jpg');
INSERT INTO `message` VALUES ('9', 'hello，这是测试', '7', null, '/images/mmexport1517323669985.jpg');
INSERT INTO `message` VALUES ('10', '真的累', '8', null, '/images/mmexport1517323669985.jpg');
INSERT INTO `message` VALUES ('12', '这是我第一条动态', '15', null, '/images/mmexport1517323669985.jpg');
INSERT INTO `message` VALUES ('13', '如果你能像看别人缺点一样，如此准确般的发现自己的缺点，那么你的生命将会不平凡', '15', null, '/images/mmexport1517323669985.jpg');
INSERT INTO `message` VALUES ('14', 'hfihiwqriqwhrq', '14', null, '/images/mmexport1517323669985.jpg');
INSERT INTO `message` VALUES ('15', 'hfihiwqriqwhrq', '15', null, '/images/mmexport1517323669985.jpg');
INSERT INTO `message` VALUES ('18', '这是我第一条动态', '14', null, '/images/mmexport1517323669985.jpg');
INSERT INTO `message` VALUES ('19', '刚发的', '14', null, '/images/mmexport1517323669985.jpg');
INSERT INTO `message` VALUES ('20', '这是我第一条动态', '14', null, '/images/mmexport1517323669985.jpg');
INSERT INTO `message` VALUES ('21', '这是我第一条动态', '14', null, '/images/mmexport1517323669985.jpg');
INSERT INTO `message` VALUES ('24', '生活像一杯苦咖啡，尝遍了所有的酸甜苦辣才能有所收获，即使结局不尽人意，笑着也要走完', '14', null, '/images/index.jpg');
INSERT INTO `message` VALUES ('25', '生活像一杯苦咖啡，尝遍了所有的酸甜苦辣才能有所收获，即使结局不尽人意，笑着也要走完', '14', null, '/images/index.jpg');
INSERT INTO `message` VALUES ('26', '生活像一杯苦咖啡，尝遍了所有的酸甜苦辣才能有所收获，即使结局不尽人意，笑着也要走完', '14', null, '/images/mmexport1517323669985.jpg');
INSERT INTO `message` VALUES ('29', '这是我第一条动态', '14', null, '/images/index.jpg');
INSERT INTO `message` VALUES ('32', 'hfihiwqriqwhrq', '14', null, '/images/mmexport1517323669985.jpg');
INSERT INTO `message` VALUES ('33', '111111111111111111111111111111111111111', '18', null, '/images/index.jpg');
INSERT INTO `message` VALUES ('34', '老马在重庆是一位名人。1988年从部队转业后，他到观音桥街道当了一名调解员。30年来，他成功调解矛盾纠纷2000多起，写了160多本、500多万字的工作笔记，总结形成“老马工作法”，推广到全国。\r\n\r\n“老马工作室”微信公号由几个年轻人运营，他们把老马的工作笔记整理后传播到网上。熟悉老马的人知道他有“三不”：不上网、不娱乐、不轻易交友', '18', null, '/images/index.jpg');
INSERT INTO `message` VALUES ('36', '老马在重庆是一位名人。1988年从部队转业后，他到观音桥街道当了一名调解员。30年来，他成功调解矛盾纠纷2000多起，写了160多本、500多万字的工作笔记，总结形成“老马工作法”，推广到全国。“老马工作室”微信公号由几个年轻人运营，他们把老马的工作笔记整理后传播到网上。熟悉老马的人知道他有“三不”：不上网、不娱乐、不轻易交友', '18', null, '/images/index.jpg');
INSERT INTO `message` VALUES ('37', '科技日报北京3月10日电（记者付毅飞）全国政协委员、中国航天科技集团十一院研究员周伟江10日向科技日报记者透露，我国计划于2020年发射的火星探测器，已完成气动外形设计，以及气动力、气动热设计工作。', '19', null, '/images/index.jpg');
INSERT INTO `message` VALUES ('38', '老马在重庆是一位名人。1988年从部队转业后，他到观音桥街道当了一名调解员。30年来，他成功调解矛盾纠纷2000多起，写了160多本、500多万字的工作笔记，总结形成“老马工作法”，推广到全国。“老马工作室”微信公号由几个年轻人运营，他们把老马的工作笔记整理后传播到网上。熟悉老马的人知道他有“三不”：不上网、不娱乐、不轻易交友', '19', null, '/images/index.jpg');
INSERT INTO `message` VALUES ('39', '科技日报北京3月10日电（记者付毅飞）全国政协委员、中国航天科技集团十一院研究员周伟江10日向科技日报记者透露，我国计划于2020年发射的火星探测器，已完成气动外形设计，以及气动力、气动热设计工作。', '14', null, '/images/index.jpg');
INSERT INTO `message` VALUES ('40', '科技日报北京3月10日电（记者付毅飞）全国政协委员、中国航天科技集团十一院研究员周伟江10日向科技日报记者', '14', null, '/images/index.jpg');
INSERT INTO `message` VALUES ('41', '科技日报北京3月10日电（记者付毅飞）全国政协委员、中国航天科技集团十一院研究员周伟江10日向科技日报记者', '14', null, '/images/index.jpg');
INSERT INTO `message` VALUES ('42', '这是一条测试动态', '14', null, '/images/index.jpg');
INSERT INTO `message` VALUES ('46', '123', '14', '2018-03-17 13:40:07', '/images/index.jpg');
INSERT INTO `message` VALUES ('47', '123', '14', '2018-03-17 13:42:10', '/images/index.jpg');
INSERT INTO `message` VALUES ('48', '超市发', '14', '2018-03-17 14:01:55', '/images/tx_zbj.jpg');
INSERT INTO `message` VALUES ('49', '没有照片的额动态', '14', '2018-03-17 14:03:33', '/images/tx_zbj.jpg');
INSERT INTO `message` VALUES ('50', '第二', '14', '2018-03-17 14:04:24', '/images/tx_zbj.jpg');
INSERT INTO `message` VALUES ('51', '我断网', '14', '2018-03-17 14:05:39', '/images/index.jpg');
INSERT INTO `message` VALUES ('52', '答复', '14', '2018-03-17 14:10:01', '/images/tx_zbj.jpg');
INSERT INTO `message` VALUES ('53', '儿时', '14', '2018-03-17 14:10:23', '/images/mmexport1517323669985.jpg');
INSERT INTO `message` VALUES ('54', '儿时', '14', '2018-03-17 14:11:23', '/images/mmexport1517323669985.jpg');
INSERT INTO `message` VALUES ('55', '儿时', '14', '2018-03-17 14:11:26', '/images/mmexport1517323669985.jpg');
INSERT INTO `message` VALUES ('56', '儿时', '14', '2018-03-17 14:12:16', '/images/mmexport1517323669985.jpg');
INSERT INTO `message` VALUES ('57', '儿时', '14', '2018-03-17 14:13:13', '/images/mmexport1517323669985.jpg');
INSERT INTO `message` VALUES ('60', '没有照片的额动态', '14', null, '/images/tx_zbj.jpg');
INSERT INTO `message` VALUES ('61', '大范围', '14', '2018-03-17 18:06:32', '/images/7_170428154911_12.png');
INSERT INTO `message` VALUES ('62', '这是一条动态', '14', '2018-03-17 18:10:00', '/images/index.jpg');
INSERT INTO `message` VALUES ('64', '鼎泰信息', '14', '2018-03-17 18:17:53', '/images/index.jpg');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) DEFAULT NULL,
  `pwd` varchar(20) DEFAULT NULL,
  `user_image` text,
  `introduce` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('3', '李四', '25584', '/images/thum_u=2496832209,1700004856&fm=27&gp=0.jpg', '计算机科学与工程学院');
INSERT INTO `user` VALUES ('4', 'wangjun', 'faf', '/images/thum_u=380692490,1660465104&fm=27&gp=0.jpg', '计算机科学与工程学院');
INSERT INTO `user` VALUES ('7', 'daf', 'dsgds', '/images/thum_7_170428154911_12.png', '计算机科学与工程学院');
INSERT INTO `user` VALUES ('8', 'fsgs', 'ggdr', '/images/thum_u=380692490,1660465104&fm=27&gp=0.jpg', '计算机科学与工程学院');
INSERT INTO `user` VALUES ('9', 'safa', 'dssg', '/images/thum_7_170428154911_12.png', '计算机科学与工程学院');
INSERT INTO `user` VALUES ('10', 'sdfs', 'dsgsg', '/images/thum_u=380692490,1660465104&fm=27&gp=0.jpg', '计算机科学与工程学院');
INSERT INTO `user` VALUES ('11', 'dsfsg', 'dggd', '/images/thum_7_170428154911_12.png', '计算机科学与工程学院');
INSERT INTO `user` VALUES ('12', 'dfsf', 'dsgsg', '/images/thum_u=380692490,1660465104&fm=27&gp=0.jpg', '计算机科学与工程学院');
INSERT INTO `user` VALUES ('13', '26245@4', '12', '/images/thum_u=380692490,1660465104&fm=27&gp=0.jpg', '计算机科学与工程学院');
INSERT INTO `user` VALUES ('14', '2671268148@qq.com', '123456', '/images/thum_index.jpg', '上海市软件行业协会（SSIA）成立于1986年6月，是国内最早成立的软件行业协会之一。协会由在本市从事软件业的软件企业、软件机构及相关单位自愿组成的跨部门、跨所有制的非营利的行业性社团法人。业务主管单位是上海市科学技术委员会，行业业务指导单位为上海市经济和信息化委员会，登记管理机关是上海市社会团体管理局，本协会同时接受上海市科学技术委员会和上海市社会团体管理局的业务指导和监督管理。');
INSERT INTO `user` VALUES ('15', '123456789@qq.com', '123', '/images/thum_index.jpg', '计算机科学与工程学院');
INSERT INTO `user` VALUES ('16', '123456@qq.com', '123', '/images/thum_u=2496832209,1700004856&fm=27&gp=0.jpg', '计算机科学与工程学院');
INSERT INTO `user` VALUES ('17', '111@qq.com', '111', '/images/thum_u=380692490,1660465104&fm=27&gp=0.jpg', '计算机科学与工程学院');
INSERT INTO `user` VALUES ('18', '222@qq.com', '222', '/images/thum_u=380692490,1660465104&fm=27&gp=0.jpg', '计算机科学与工程学院');
INSERT INTO `user` VALUES ('19', '333@qq.com', '333', '/images/thum_index.jpg', '计算机科学与工程学院');
INSERT INTO `user` VALUES ('20', '111@qq.com', '123', '/images/frist.png', '计算机科学与工程学院');
INSERT INTO `user` VALUES ('21', '王军', '123', '/images/frist.png', '计算机科学与工程学院');
INSERT INTO `user` VALUES ('22', '计算机协会', '123', '/images/thum_u=3266577828,3682809668&fm=27&gp=0.jpg', '计算机科学与工程学院');
INSERT INTO `user` VALUES ('23', '软件协会', '123', '/images/frist.png', '上海市软件行业协会（SSIA）成立于1986年6月，是国内最早成立的软件行业协会之一。协会由在本市从事软件业的软件企业、软件机构及相关单位自愿组成的跨部门、跨所有制的非营利的行业性社团法人。业务主管单位是上海市科学技术委员会，行业业务指导单位为上海市经济和信息化委员会，登记管理机关是上海市社会团体管理局，本协会同时接受上海市科学技术委员会和上海市社会团体管理局的业务指导和监督管理。');
INSERT INTO `user` VALUES ('24', '123', '123', '/images/thum_index.jpg', '这是123');
INSERT INTO `user` VALUES ('25', '456', '456', '/images/frist.png', '这是456');
INSERT INTO `user` VALUES ('26', '1245', '1245', '/images/frist.png', '这是1245');
INSERT INTO `user` VALUES ('27', '计算机', '123', '/images/frist.png', '这是计算机协会');

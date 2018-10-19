/*
Navicat MySQL Data Transfer

Source Server         : ����mysql
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
INSERT INTO `comment` VALUES ('1', '��һ������', '2671268148@qq.com', '9');
INSERT INTO `comment` VALUES ('2', '����ʲô', '2671268148@qq.com', '9');
INSERT INTO `comment` VALUES ('6', '124578895623', '2671268148@qq.com', '13');
INSERT INTO `comment` VALUES ('10', '������������һλ���ˡ�1988��Ӳ���תҵ�����������Žֵ�����һ������Ա��30���������ɹ�����ì�ܾ���2000����д��160�౾��500�����ֵĹ����ʼǣ��ܽ��γɡ��������������ƹ㵽ȫ����\r\n\r\n���������ҡ�΢�Ź����ɼ�����������Ӫ�����ǰ�����Ĺ����ʼ�����󴫲������ϡ���Ϥ�������֪�����С����������������������֡������׽��ѡ���˵�������ĸ��ô�����ʱ�䡢ƽ�������ࡢ��֡�\r\n\r\n2016�꣬�����챾����������ҵ����˽���������ĵ�ʮ����ͷ������ϰ��ƽ���������ǰ���죬2016��1��1�գ���˾������ȫ�µ�����zbj.com������˽����������Ĳ���ʵ����Ʒ�������˲ŷ�����ʵ�����м��ܵ�֪ʶ������������Ĺ�����ҵ֮������ӡ�', '222@qq.com', '15');
INSERT INTO `comment` VALUES ('11', 'hello', '222@qq.com', '36');
INSERT INTO `comment` VALUES ('12', '���ǵڶ�������', '333@qq.com', '36');
INSERT INTO `comment` VALUES ('13', '1234', '2671268148@qq.com', '38');
INSERT INTO `comment` VALUES ('14', '����', '2671268148@qq.com', '38');
INSERT INTO `comment` VALUES ('15', '����', '2671268148@qq.com', '42');

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
INSERT INTO `love` VALUES ('13', '14', '����');

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
INSERT INTO `message` VALUES ('3', '�����', '14', null, '/images/mmexport1517323669985.jpg');
INSERT INTO `message` VALUES ('4', 'hfihiwqriqwhrq', '14', null, '/images/mmexport1517323669985.jpg');
INSERT INTO `message` VALUES ('6', 'fetwt', '14', null, '/images/mmexport1517323669985.jpg');
INSERT INTO `message` VALUES ('7', '��������񿴱���ȱ��һ�������׼ȷ��ķ����Լ���ȱ�㣬��ô����������᲻ƽ��', '14', null, '/images/mmexport1517323669985.jpg');
INSERT INTO `message` VALUES ('8', 'fetwt', '14', null, '/images/mmexport1517323669985.jpg');
INSERT INTO `message` VALUES ('9', 'hello�����ǲ���', '7', null, '/images/mmexport1517323669985.jpg');
INSERT INTO `message` VALUES ('10', '�����', '8', null, '/images/mmexport1517323669985.jpg');
INSERT INTO `message` VALUES ('12', '�����ҵ�һ����̬', '15', null, '/images/mmexport1517323669985.jpg');
INSERT INTO `message` VALUES ('13', '��������񿴱���ȱ��һ�������׼ȷ��ķ����Լ���ȱ�㣬��ô����������᲻ƽ��', '15', null, '/images/mmexport1517323669985.jpg');
INSERT INTO `message` VALUES ('14', 'hfihiwqriqwhrq', '14', null, '/images/mmexport1517323669985.jpg');
INSERT INTO `message` VALUES ('15', 'hfihiwqriqwhrq', '15', null, '/images/mmexport1517323669985.jpg');
INSERT INTO `message` VALUES ('18', '�����ҵ�һ����̬', '14', null, '/images/mmexport1517323669985.jpg');
INSERT INTO `message` VALUES ('19', '�շ���', '14', null, '/images/mmexport1517323669985.jpg');
INSERT INTO `message` VALUES ('20', '�����ҵ�һ����̬', '14', null, '/images/mmexport1517323669985.jpg');
INSERT INTO `message` VALUES ('21', '�����ҵ�һ����̬', '14', null, '/images/mmexport1517323669985.jpg');
INSERT INTO `message` VALUES ('24', '������һ���࿧�ȣ����������е�����������������ջ񣬼�ʹ��ֲ������⣬Ц��ҲҪ����', '14', null, '/images/index.jpg');
INSERT INTO `message` VALUES ('25', '������һ���࿧�ȣ����������е�����������������ջ񣬼�ʹ��ֲ������⣬Ц��ҲҪ����', '14', null, '/images/index.jpg');
INSERT INTO `message` VALUES ('26', '������һ���࿧�ȣ����������е�����������������ջ񣬼�ʹ��ֲ������⣬Ц��ҲҪ����', '14', null, '/images/mmexport1517323669985.jpg');
INSERT INTO `message` VALUES ('29', '�����ҵ�һ����̬', '14', null, '/images/index.jpg');
INSERT INTO `message` VALUES ('32', 'hfihiwqriqwhrq', '14', null, '/images/mmexport1517323669985.jpg');
INSERT INTO `message` VALUES ('33', '111111111111111111111111111111111111111', '18', null, '/images/index.jpg');
INSERT INTO `message` VALUES ('34', '������������һλ���ˡ�1988��Ӳ���תҵ�����������Žֵ�����һ������Ա��30���������ɹ�����ì�ܾ���2000����д��160�౾��500�����ֵĹ����ʼǣ��ܽ��γɡ��������������ƹ㵽ȫ����\r\n\r\n���������ҡ�΢�Ź����ɼ�����������Ӫ�����ǰ�����Ĺ����ʼ�����󴫲������ϡ���Ϥ�������֪�����С����������������������֡������׽���', '18', null, '/images/index.jpg');
INSERT INTO `message` VALUES ('36', '������������һλ���ˡ�1988��Ӳ���תҵ�����������Žֵ�����һ������Ա��30���������ɹ�����ì�ܾ���2000����д��160�౾��500�����ֵĹ����ʼǣ��ܽ��γɡ��������������ƹ㵽ȫ�������������ҡ�΢�Ź����ɼ�����������Ӫ�����ǰ�����Ĺ����ʼ�����󴫲������ϡ���Ϥ�������֪�����С����������������������֡������׽���', '18', null, '/images/index.jpg');
INSERT INTO `message` VALUES ('37', '�Ƽ��ձ�����3��10�յ磨���߸���ɣ�ȫ����ЭίԱ���й�����Ƽ�����ʮһԺ�о�Ա��ΰ��10����Ƽ��ձ�����͸¶���ҹ��ƻ���2020�귢��Ļ���̽���������������������ƣ��Լ�����������������ƹ�����', '19', null, '/images/index.jpg');
INSERT INTO `message` VALUES ('38', '������������һλ���ˡ�1988��Ӳ���תҵ�����������Žֵ�����һ������Ա��30���������ɹ�����ì�ܾ���2000����д��160�౾��500�����ֵĹ����ʼǣ��ܽ��γɡ��������������ƹ㵽ȫ�������������ҡ�΢�Ź����ɼ�����������Ӫ�����ǰ�����Ĺ����ʼ�����󴫲������ϡ���Ϥ�������֪�����С����������������������֡������׽���', '19', null, '/images/index.jpg');
INSERT INTO `message` VALUES ('39', '�Ƽ��ձ�����3��10�յ磨���߸���ɣ�ȫ����ЭίԱ���й�����Ƽ�����ʮһԺ�о�Ա��ΰ��10����Ƽ��ձ�����͸¶���ҹ��ƻ���2020�귢��Ļ���̽���������������������ƣ��Լ�����������������ƹ�����', '14', null, '/images/index.jpg');
INSERT INTO `message` VALUES ('40', '�Ƽ��ձ�����3��10�յ磨���߸���ɣ�ȫ����ЭίԱ���й�����Ƽ�����ʮһԺ�о�Ա��ΰ��10����Ƽ��ձ�����', '14', null, '/images/index.jpg');
INSERT INTO `message` VALUES ('41', '�Ƽ��ձ�����3��10�յ磨���߸���ɣ�ȫ����ЭίԱ���й�����Ƽ�����ʮһԺ�о�Ա��ΰ��10����Ƽ��ձ�����', '14', null, '/images/index.jpg');
INSERT INTO `message` VALUES ('42', '����һ�����Զ�̬', '14', null, '/images/index.jpg');
INSERT INTO `message` VALUES ('46', '123', '14', '2018-03-17 13:40:07', '/images/index.jpg');
INSERT INTO `message` VALUES ('47', '123', '14', '2018-03-17 13:42:10', '/images/index.jpg');
INSERT INTO `message` VALUES ('48', '���з�', '14', '2018-03-17 14:01:55', '/images/tx_zbj.jpg');
INSERT INTO `message` VALUES ('49', 'û����Ƭ�Ķ̬', '14', '2018-03-17 14:03:33', '/images/tx_zbj.jpg');
INSERT INTO `message` VALUES ('50', '�ڶ�', '14', '2018-03-17 14:04:24', '/images/tx_zbj.jpg');
INSERT INTO `message` VALUES ('51', '�Ҷ���', '14', '2018-03-17 14:05:39', '/images/index.jpg');
INSERT INTO `message` VALUES ('52', '��', '14', '2018-03-17 14:10:01', '/images/tx_zbj.jpg');
INSERT INTO `message` VALUES ('53', '��ʱ', '14', '2018-03-17 14:10:23', '/images/mmexport1517323669985.jpg');
INSERT INTO `message` VALUES ('54', '��ʱ', '14', '2018-03-17 14:11:23', '/images/mmexport1517323669985.jpg');
INSERT INTO `message` VALUES ('55', '��ʱ', '14', '2018-03-17 14:11:26', '/images/mmexport1517323669985.jpg');
INSERT INTO `message` VALUES ('56', '��ʱ', '14', '2018-03-17 14:12:16', '/images/mmexport1517323669985.jpg');
INSERT INTO `message` VALUES ('57', '��ʱ', '14', '2018-03-17 14:13:13', '/images/mmexport1517323669985.jpg');
INSERT INTO `message` VALUES ('60', 'û����Ƭ�Ķ̬', '14', null, '/images/tx_zbj.jpg');
INSERT INTO `message` VALUES ('61', '��Χ', '14', '2018-03-17 18:06:32', '/images/7_170428154911_12.png');
INSERT INTO `message` VALUES ('62', '����һ����̬', '14', '2018-03-17 18:10:00', '/images/index.jpg');
INSERT INTO `message` VALUES ('64', '��̩��Ϣ', '14', '2018-03-17 18:17:53', '/images/index.jpg');

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
INSERT INTO `user` VALUES ('3', '����', '25584', '/images/thum_u=2496832209,1700004856&fm=27&gp=0.jpg', '�������ѧ�빤��ѧԺ');
INSERT INTO `user` VALUES ('4', 'wangjun', 'faf', '/images/thum_u=380692490,1660465104&fm=27&gp=0.jpg', '�������ѧ�빤��ѧԺ');
INSERT INTO `user` VALUES ('7', 'daf', 'dsgds', '/images/thum_7_170428154911_12.png', '�������ѧ�빤��ѧԺ');
INSERT INTO `user` VALUES ('8', 'fsgs', 'ggdr', '/images/thum_u=380692490,1660465104&fm=27&gp=0.jpg', '�������ѧ�빤��ѧԺ');
INSERT INTO `user` VALUES ('9', 'safa', 'dssg', '/images/thum_7_170428154911_12.png', '�������ѧ�빤��ѧԺ');
INSERT INTO `user` VALUES ('10', 'sdfs', 'dsgsg', '/images/thum_u=380692490,1660465104&fm=27&gp=0.jpg', '�������ѧ�빤��ѧԺ');
INSERT INTO `user` VALUES ('11', 'dsfsg', 'dggd', '/images/thum_7_170428154911_12.png', '�������ѧ�빤��ѧԺ');
INSERT INTO `user` VALUES ('12', 'dfsf', 'dsgsg', '/images/thum_u=380692490,1660465104&fm=27&gp=0.jpg', '�������ѧ�빤��ѧԺ');
INSERT INTO `user` VALUES ('13', '26245@4', '12', '/images/thum_u=380692490,1660465104&fm=27&gp=0.jpg', '�������ѧ�빤��ѧԺ');
INSERT INTO `user` VALUES ('14', '2671268148@qq.com', '123456', '/images/thum_index.jpg', '�Ϻ��������ҵЭ�ᣨSSIA��������1986��6�£��ǹ�����������������ҵЭ��֮һ��Э�����ڱ��д������ҵ�������ҵ�������������ص�λ��Ը��ɵĿ粿�š��������Ƶķ�Ӫ������ҵ�����ŷ��ˡ�ҵ�����ܵ�λ���Ϻ��п�ѧ����ίԱ�ᣬ��ҵҵ��ָ����λΪ�Ϻ��о��ú���Ϣ��ίԱ�ᣬ�Ǽǹ���������Ϻ�������������֣���Э��ͬʱ�����Ϻ��п�ѧ����ίԱ����Ϻ�������������ֵ�ҵ��ָ���ͼල����');
INSERT INTO `user` VALUES ('15', '123456789@qq.com', '123', '/images/thum_index.jpg', '�������ѧ�빤��ѧԺ');
INSERT INTO `user` VALUES ('16', '123456@qq.com', '123', '/images/thum_u=2496832209,1700004856&fm=27&gp=0.jpg', '�������ѧ�빤��ѧԺ');
INSERT INTO `user` VALUES ('17', '111@qq.com', '111', '/images/thum_u=380692490,1660465104&fm=27&gp=0.jpg', '�������ѧ�빤��ѧԺ');
INSERT INTO `user` VALUES ('18', '222@qq.com', '222', '/images/thum_u=380692490,1660465104&fm=27&gp=0.jpg', '�������ѧ�빤��ѧԺ');
INSERT INTO `user` VALUES ('19', '333@qq.com', '333', '/images/thum_index.jpg', '�������ѧ�빤��ѧԺ');
INSERT INTO `user` VALUES ('20', '111@qq.com', '123', '/images/frist.png', '�������ѧ�빤��ѧԺ');
INSERT INTO `user` VALUES ('21', '����', '123', '/images/frist.png', '�������ѧ�빤��ѧԺ');
INSERT INTO `user` VALUES ('22', '�����Э��', '123', '/images/thum_u=3266577828,3682809668&fm=27&gp=0.jpg', '�������ѧ�빤��ѧԺ');
INSERT INTO `user` VALUES ('23', '���Э��', '123', '/images/frist.png', '�Ϻ��������ҵЭ�ᣨSSIA��������1986��6�£��ǹ�����������������ҵЭ��֮һ��Э�����ڱ��д������ҵ�������ҵ�������������ص�λ��Ը��ɵĿ粿�š��������Ƶķ�Ӫ������ҵ�����ŷ��ˡ�ҵ�����ܵ�λ���Ϻ��п�ѧ����ίԱ�ᣬ��ҵҵ��ָ����λΪ�Ϻ��о��ú���Ϣ��ίԱ�ᣬ�Ǽǹ���������Ϻ�������������֣���Э��ͬʱ�����Ϻ��п�ѧ����ίԱ����Ϻ�������������ֵ�ҵ��ָ���ͼල����');
INSERT INTO `user` VALUES ('24', '123', '123', '/images/thum_index.jpg', '����123');
INSERT INTO `user` VALUES ('25', '456', '456', '/images/frist.png', '����456');
INSERT INTO `user` VALUES ('26', '1245', '1245', '/images/frist.png', '����1245');
INSERT INTO `user` VALUES ('27', '�����', '123', '/images/frist.png', '���Ǽ����Э��');

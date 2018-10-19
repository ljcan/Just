#建立数据库
create database just;
use just;
 #等级
 create table grade(
 	id int not null auto_increment primary key,
 	g_common_manager varchar(20) not null,
 	g_vip_manager varchar(20) not null,
 	g_super_manager varchar(20) not null
 	)charset utf8;
#管理员
create table manager(
 	id int not null auto_increment primary key,
 	m_username varchar(20) not null,
 	m_password varchar(20) not null,
 	m_sex varchar(10) not null,
 	m_age varchar(10) not null,
 	m_time Date not null,
 	m_phone varchar(20) not null,
 	grade_id int,
 	foreign key(grade_id) references grade(id)
 	)charset utf8;
 #多对多
 #义工
 create table volunteer(
 	id int not null auto_increment primary key,
 	v_username varchar(20) not null,
 	v_password varchar(20) not null,
 	v_sex varchar(10) not null,
 	v_phone varchar(20) not null,
 	v_number varchar(20) not null,
 	v_time Date not null comment '注册时间',
 	v_worktime int not null comment '已做的工时',
 	v_address varchar(20) not null,
 	v_identity_card varchar(30) not null,
 	finish int not null default 0 comment '是否完成工时，0代表没有完成，1代表完成，默认没有完成',
 	message_id int
 	)charset utf8;
 	#任务表
 create table message(
 	id int not null auto_increment primary key,
 	m_address varchar(20) not null,
 	m_number varchar(20) not null,
 	m_time Date comment '任务开始时间',
 	m_publishtime Date comment '任务发布时间',
 	m_long int comment '时长',
 	volunteer_id int
 	)charset utf8;
 	#关联表
 create table volun_msg(
 	id int not null auto_increment primary key,
 	message_id int,
 	volunteer_id int,
 	foreign key(message_id) references message(id),
 	foreign key(volunteer_id) references volunteer(id)
 	)charset utf8;
 	#公司联系人
 create table contact_user(
 	id int not null auto_increment primary key,
 	con_name varchar(20) not null,
 	con_age int not null,
 	con_sex varchar(10) not null,
 	con_phone varchar(20),
 	company_id int,
 	foreign key(company_id) references company(id)
 	)charset utf8;
 	#公司
 create table company(
 	id int not null auto_increment primary key,
 	c_name varchar(20) not null,
 	c_address varchar(20) not null,
 	c_phone varchar(20) not null,
 	c_time Date comment '注册时间',
 	remark varchar(50) comment '备注'
 	)charset utf8;
 	
 	
 	#左外连接查询
 	select * from volunteer a left join volun_msg b 
 	on a.id=b.volunteer_id
 	left join message c
 	on c.id=b.message_id
 	where a.id=1;
 	
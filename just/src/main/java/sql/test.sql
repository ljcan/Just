#�������ݿ�
create database just;
use just;
 #�ȼ�
 create table grade(
 	id int not null auto_increment primary key,
 	g_common_manager varchar(20) not null,
 	g_vip_manager varchar(20) not null,
 	g_super_manager varchar(20) not null
 	)charset utf8;
#����Ա
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
 #��Զ�
 #�幤
 create table volunteer(
 	id int not null auto_increment primary key,
 	v_username varchar(20) not null,
 	v_password varchar(20) not null,
 	v_sex varchar(10) not null,
 	v_phone varchar(20) not null,
 	v_number varchar(20) not null,
 	v_time Date not null comment 'ע��ʱ��',
 	v_worktime int not null comment '�����Ĺ�ʱ',
 	v_address varchar(20) not null,
 	v_identity_card varchar(30) not null,
 	finish int not null default 0 comment '�Ƿ���ɹ�ʱ��0����û����ɣ�1������ɣ�Ĭ��û�����',
 	message_id int
 	)charset utf8;
 	#�����
 create table message(
 	id int not null auto_increment primary key,
 	m_address varchar(20) not null,
 	m_number varchar(20) not null,
 	m_time Date comment '����ʼʱ��',
 	m_publishtime Date comment '���񷢲�ʱ��',
 	m_long int comment 'ʱ��',
 	volunteer_id int
 	)charset utf8;
 	#������
 create table volun_msg(
 	id int not null auto_increment primary key,
 	message_id int,
 	volunteer_id int,
 	foreign key(message_id) references message(id),
 	foreign key(volunteer_id) references volunteer(id)
 	)charset utf8;
 	#��˾��ϵ��
 create table contact_user(
 	id int not null auto_increment primary key,
 	con_name varchar(20) not null,
 	con_age int not null,
 	con_sex varchar(10) not null,
 	con_phone varchar(20),
 	company_id int,
 	foreign key(company_id) references company(id)
 	)charset utf8;
 	#��˾
 create table company(
 	id int not null auto_increment primary key,
 	c_name varchar(20) not null,
 	c_address varchar(20) not null,
 	c_phone varchar(20) not null,
 	c_time Date comment 'ע��ʱ��',
 	remark varchar(50) comment '��ע'
 	)charset utf8;
 	
 	
 	#�������Ӳ�ѯ
 	select * from volunteer a left join volun_msg b 
 	on a.id=b.volunteer_id
 	left join message c
 	on c.id=b.message_id
 	where a.id=1;
 	
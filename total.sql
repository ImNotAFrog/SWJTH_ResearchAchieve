--create database ResearchAchieveManager;
use ResearchAchieveManager;
/*���ܣ������û���*/
create table AppUser(
	username varchar(200) primary key,--�û���
	password varchar(200),--����
	position varchar(200), --ְ��
	positionLevel varchar(200), --ְ��
	title varchar(200), --ְ��
	department varchar(200)--��������
	)
/*���ܣ����������*/
create table Journal(
	ID int identity(1,1) primary key,--���	
	name varchar(200),--����
	level varchar(200), --����
	number varchar(200) --����
	)
/*���ܣ����������׼��*/
create table Laws(
	ID int identity(1,1) primary key,--���
	name varchar(200),--����
	level varchar(200), --����
	chiefEditor varchar(200), --����
	editors varchar(200), --�α�
	score float, --��ֵ
	attachment varchar(200) --����
	)
/*���ܣ�����ר�������������*/
create table Patent(
	ID int identity(1,1) primary key,--���
	name varchar(200),--����
	category varchar(200), --����
	patentHolder varchar(200), --ר��Ȩ��
	score float,--��ֵ
	attachment varchar(200) --����
	)
/*����������Ϣ��*/
create table PersonalInfo(
	username varchar(200) primary key,--�û���
	name varchar(200),--����
	sex varchar(200), --�Ա�
	ethnic varchar(200), --����	
	bornDate date,--��������
	inWorkDate date, --�μӹ�������
	inArmyDate date,--��������
	inPartyDate date,--�뵳����
	origin varchar(200), --����
	birthPlace varchar(200), --������	
	title varchar(200),--רҵ����ְ��
	work varchar(200), --���¸�λ
	healthCondition varchar(200),--����״��
	fullTimeEdu varchar(200), --ȫ���ƽ���
	onTheJobEdu varchar(200), --��ְ����	
	fullTimeSchool varchar(200),--ȫ���ƽ�����ҵԺУ��רҵ
	onTheJobSchool varchar(200), --��ְ������ҵԺУ��רҵ
	currentPosition varchar(200),--�ֲ�ְ��
	policeRank varchar(200), --�־���
	policeRankDate date, --�־���ʱ��	
	positionLevel varchar(200),--�ּ����ȼ�
	positionLevelDate date, --�ּ����ȼ�ʱ��
	resume text,--������������
	achievement_id varchar(200), --�ɹ����
	teachingSituation text, --��ѧ���	
	rewards text,--�����ܽ�
	)
/*���ܣ�������ѧ�ĸ���Ŀ��*/
create table TeachingReform(
	ID int identity(1,1) primary key,--���
	name varchar(200),--����
	groupLeader varchar(200), --�鳤
	members varchar(200), --��Ա
	score float,--��ֵ
	attachment varchar(200) --����
	)
/*���ܣ������̲�������*/
create table Textbook(
	ID int identity(1,1) primary key,--���
	name varchar(200),--����
	subject varchar(200), --����
	authorSituation varchar(200), --�������
	publishSituation varchar(200), --�������
	score float,--��ֵ
	attachment varchar(200) --����
	)
/*���ܣ��������ı�*/
create table Thesis(
	ID int identity(1,1) primary key,--���
	name varchar(200),--����
	level varchar(200), --����
	journal_id varchar(200), --������ID
	score float,--��ֵ
	attachment varchar(200) --����
	)
/*���ܣ����������*/
create table Topic(
	ID int identity(1,1) primary key,--���	
	name varchar(200),--����
	level varchar(200), --����
	subject varchar(200), --����
	groupLeader varchar(200), --�鳤
	members varchar(200), --��Ա
	score float,--��ֵ
	attachment varchar(200) --����
	)
/*���ܣ������û��ɹ���*/
create table UserAchievement(
	ID int identity(1,1) primary key,--�ɹ�ID
	username varchar(200),--�û���
	category varchar(200), --�ɹ�����
	)
/*���ܣ������û����ͱ�*/
create table UserType(
	username varchar(200) primary key,--�û���
	category varchar(200), --����
	)
/*���ܣ�����ѧ������-������*/
create table activities(
	ID int identity(1,1) primary key,--���
	Organizer varchar(200),--���쵥λ
	name varchar(200), --��ѵ��ѧϰ�����ֻ����
	attendee varchar(200), --�μ���
	activitiestime date, --�ʱ��
	activitiesplace varchar(200), --��ص�
	main_results text --��Ҫ�ɹ�
	)
/*���ܣ�����ѧ������-���б�*/
create table Investigation(
	ID int identity(1,1) primary key,--���
	ResearchGroup varchar(200),--������
	content varchar(200), --��������
	researchers varchar(200), --������Ա
	persontime varchar(200), --�˴�
	Researchtime date, --����ʱ��
	Researchplace varchar(200), --���еص�
	remark text --��ע
	)
/*���ܣ�����ѧ������-Ͷ���*/
create table contribute(
	ID int identity(1,1) primary key,--���
	Organizer varchar(200),--���쵥λ
	name varchar(200), --���Ļ����
	participants varchar(200), --�μ���
	contributetime date, --Ͷ��ʱ��
	awards text --�����
	)
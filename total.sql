--create database ResearchAchieveManager;
use ResearchAchieveManager;
/*功能：创建用户表*/
create table AppUser(
	username varchar(200) primary key,--用户名
	name varchar(50), --姓名
	password varchar(200),--密码
	position varchar(200), --职务
	positionLevel varchar(200), --职级
	title varchar(200), --职称
	department varchar(200),--所属部门
	subDepartment varchar(50) --子部门
	)
/*功能：创建刊物表*/
create table Journal(
	ID int identity(1,1) primary key,--序号	
	name varchar(200),--名称
	level varchar(200), --级别
	number varchar(200) --刊号

	)
/*功能：创建法规标准表*/
create table Laws(
	ID int identity(1,1) primary key,--序号
	name varchar(200),--名称
	category varchar(100), --类别
	lawNumber varchar(50), --编号
	wordsCount varchar(50), --字数
	level varchar(200), --级别
	authorSituation varchar(200), --作者情况
	score float, --分值
	attachment varchar(200), --附件
	owner varchar(50), --所有者
	checked int	
	)
/*功能：创建专利、软件著作表*/
create table Patent(
	ID int identity(1,1) primary key,--序号
	name varchar(200),--名称
	category varchar(200), --类型
	patentHolder varchar(200), --专利权人
	patentDate date, --授权日期
	patentNum varchar(50), --专利编号
	score float,--分值
	attachment varchar(200), --附件
	owner varchar(50), --成果申请人
	checked int	
	)
/*创建个人信息表*/
create table PersonalInfo(
	username varchar(200) primary key,--用户名
	name varchar(200),--姓名
	sex varchar(200), --性别
	ethnic varchar(200), --民族	
	bornDate date,--出生日期
	inWorkDate date, --参加工作年月
	inArmyDate date,--入伍年月
	inPartyDate date,--入党年月
	origin varchar(200), --籍贯
	birthPlace varchar(200), --出生地	
	title varchar(200),--专业技术职务
	work varchar(200), --从事岗位
	healthCondition varchar(200),--健康状况
	fullTimeEdu varchar(200), --全日制教育
	onTheJobEdu varchar(200), --在职教育	
	fullTimeSchool varchar(200),--全日制教育毕业院校及专业
	onTheJobSchool varchar(200), --在职教育毕业院校及专业
	currentPosition varchar(200),--现部职别
	policeRank varchar(200), --现警衔
	policeRankDate date, --现警衔时间	
	positionLevel varchar(200),--现技术等级
	positionLevelDate date, --现技术等级时间
	resume text,--入伍后基本简历
	achievement_id varchar(200), --成果序号
	teachingSituation text, --教学情况	
	rewards text,--立功受奖
	
	)
/*功能：创建教学改革项目表*/
create table eduProject(
	ID int identity(1,1) primary key,--序号
	name varchar(200),--名称
	subject varchar(100), --项目从属
	level varchar(50), --项目级别
	authorSituation varchar(200), --组长或成员
	score float,--分值
	state varchar(50), --项目情况
	attachment varchar(200), --附件
	owner varchar(50), --所有者
	checked int	

	)
/*功能：创建教材著作表*/
create table Textbook(
	ID int identity(1,1) primary key,--序号
	name varchar(200),--名称
	level varchar(200), --级别
	authorSituation varchar(200), --作者情况
	publishDate date, --出版时间
	ISBN varchar(50), --ISBN
	publishingHouse varchar(200), --出版社
	score float,--分值
	attachment varchar(200), --附件
	owner varchar(50), --所有者
	checked int	
	)
/*功能：创建论文表*/
create table Thesis(
	ID int identity(1,1) primary key,--序号
	name varchar(200),--名称
	journa_level varchar(200), --级别
	journa_name varchar(200), --刊物名称
	journal_id varchar(200), --发表刊物ID
	score float,--分值
	attachment varchar(200), --附件
	owner varchar(50), --所有者
	checked int	
	)
/*功能：创建用户成果表*/
create table UserAchievement(
	ID int key,--成果ID
	name varchar(50), --成果名
	username varchar(200),--用户名
	category varchar(200), --成果类型
	checked int
	)
/*功能：创建用户类型表*/
create table UserType(
	username varchar(200) primary key,--用户名
	category varchar(200), --类型
	)
/*功能：创建学术会议-外出活动表*/
create table activities(
	ID int identity(1,1) primary key,--序号
	Organizer varchar(200),--主办单位
	name varchar(200), --培训、学习、研讨活动名称
	attendee varchar(200), --参加者
	activitiestime date, --活动时间
	activitiesplace varchar(200), --活动地点
	main_results text --主要成果
	)
/*功能：创建学术会议-调研表*/
create table Investigation(
	ID int identity(1,1) primary key,--序号
	ResearchGroup varchar(200),--调研组
	content varchar(200), --调研内容
	researchers varchar(200), --调研人员
	persontime varchar(200), --人次
	Researchtime date, --调研时间
	Researchplace varchar(200), --调研地点
	remark text --备注
	)
/*功能：创建学术会议-投稿表*/
create table contribute(
	ID int identity(1,1) primary key,--序号
	Organizer varchar(200),--主办单位
	name varchar(200), --征文活动名称
	participants varchar(200), --参加人
	contributetime date, --投稿时间
	awards text --获奖情况
	)
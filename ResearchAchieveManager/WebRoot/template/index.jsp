<%@ page language="java" import="java.util.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%@include file="head.jsp"%>
<head>
<title>科研成果管理系统</title>
<link rel="stylesheet" type="text/css" href="<%=projectPath%>/assets/css/index_main.css">
</head>
<%@page pageEncoding="UTF-8"%>
<body style="position:relative;">
	<div class="news">
		<div class="icon">
			
		</div>
		<div class="content-title">
			<label class="pull-left">新闻/<span class="en-title">News</span></label>
			<a href="#">更多&nbsp;&nbsp;&gt;</a>
		</div>
		<div class="clear-fix">
			
		</div>
		<!--轮播图模块-->
		<div class="slide-box">
			<div class="slide">
				<img src="<%=projectPath%>/assets/img/slide-2.png">
				<div class="slide-info">
					<div class="info-title"></div>
					<div class="date">2017.12.17</div>
					<div class="content">《公安消防部队高等专科学校科研成果管理系统》学术先进集体、先进个人评比模块试运行</div>
					<a class="detail" href="#">查看详情</a>
				</div>
			</div>
			<div class="banner-dots">
				<span class=""></span>
				<span class="active"></span>
				<span class="">
			</div>

			<!--前后的箭头-->
			<a class="anchor" href="" id ="prev"></a>
			<a class="anchor" href="" id="next"></a>
		</div>
	</div>

	<!--News 新闻区域结束-->

	<!--通知公告开始-->
		<div class="announce">
			<div class="icon">
			
		</div>
		<div class="content-title">
			<label class="pull-left">通知公告/<span class="en-title">Announcement</span></label>
			<a href="#">更多&nbsp;&nbsp;&gt;</a>
		</div>
		</div>
		<div  style= "postion:fixed;bottom:0;">
		<jsp:include page="copyright.jsp" flush="false"/>
		</div>
 </body>
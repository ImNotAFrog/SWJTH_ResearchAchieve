<%@ page language="java" import="java.util.*,com.SWJTHC.model.AppUser" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'JavaBean.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  Model1:Jsp+JavaBean
  Model2:MVC: JSP+Servlet+JDBC
  <body>
  <jsp:useBean id="user" class="com.SWJTHC.model.AppUser" scope="page"></jsp:useBean>
  <jsp:setProperty property="username" name="user" value="123456"/>
     用户名称:
  <jsp:getProperty property="username" name="user"/>
  </body>
</html>

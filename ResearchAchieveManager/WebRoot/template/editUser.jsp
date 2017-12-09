<%@ page language="java" import="java.util.*,com.SWJTHC.Dao.UserDao,com.SWJTHC.model.AppUser" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
AppUser u = new AppUser();;
	if(request.getSession().getAttribute("username")!=null){
		u = (UserDao.getUserByUsername(request.getSession().getAttribute("username").toString())).get(0);
	}
%>
 <%@include file="head.jsp"%> 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    

    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

	<link rel="stylesheet" type="text/css" href="<%=projectPath%>/bootstrap/css/bootstrap.css">
	<script type="text/javascript" src="<%=projectPath %>/bootstrap/js/bootstrap.js"></script>
  </head>
  <body>
    This is my JSP page. <br>
  </body>
</html>

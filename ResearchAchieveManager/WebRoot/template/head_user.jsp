<%@ page language="java" import="java.util.*,com.SWJTHC.model.*,com.SWJTHC.Dao.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String projectPath = request.getContextPath();
	AppUser u = new AppUser();
	String role =null;
	try{
		role= request.getSession().getAttribute("role").toString();
	}catch(Exception e){
	}
	if(request.getSession().getAttribute("username")!=null){
		u = (UserDao.getUserByUsername(request.getSession().getAttribute("username").toString())).get(0);
	}
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="<%=projectPath%>/assets/css/reset.css">
<link rel="stylesheet" type="text/css" href="<%=projectPath%>/assets/css/user_header.css">
<link rel="stylesheet" type="text/css" href="<%=projectPath%>/bootstrap/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="<%=projectPath%>/assets/js/jquery-ui/jquery-ui.min.css">
<script type="text/javascript" src="<%=projectPath%>/assets/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="<%=projectPath%>/bootstrap/js/bootstrap.js"></script>
<script type="text/javascript" src="<%=projectPath%>/assets/js/jquery-ui/jquery-ui.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<div id="header">
		<div class="container">
			
			<a class="logo" href="<%=projectPath%>/template/index.jsp" target="_self" title="进入主页">
				<img src="<%=projectPath%>/assets/img/logo-2.png" height="75px">
			</a>

			<h3>科研成果管理平台</h3>
			<a id="logout" href="javascript:confirmLogout()">安全退出</a>
			<div class="image">
				<a href="<%=projectPath%>/template/<%=role%>.jsp" title="进入个人主页"><img src="<%=projectPath%>/assets/img/head.jpg"></a>
			</div>
			<p class="name ellipsis" >欢迎，<%if(u.getRole().equals("admin")){%>管理员<%}%> <%=u.getName()%></p>
		</div>
		<div class="clearfix">
			
		</div>
	</div>
	<script type="text/javascript">  
    function confirmLogout(){  
            if(confirm("确认退出?")){  
            window.location="<%=projectPath %>/services/LogoutServlet";
            }  
    }  
</script>
</html>
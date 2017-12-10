<%@ page language="java" import="java.util.*,com.SWJTHC.model.AppUser,com.SWJTHC.Dao.UserDao" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String projectPath = request.getContextPath();
	AppUser u = new AppUser();
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
<script type="text/javascript" src="<%=projectPath%>/assets/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="<%=projectPath%>/bootstrap/js/bootstrap.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<div id="header">
		<div class="container">
			
			<a class="logo" href="<%=projectPath%>/template/index.jsp" target="_self" title="进入主页">
				<img src="<%=projectPath%>/assets/img/logo2.jpg">
			</a>

			<h3>科研成果管理平台</h3>
			<a id="logout" href="javascript:confirmLogout()">安全退出</a>
			<div class="image">
				<a href="<%=projectPath%>/template/teacher.jsp" title="进入个人主页"><img src="<%=projectPath%>/assets/img/head.jpg"></a>
			</div>
			<p class="name ellipsis" >欢迎，<%=u.getName()%></p>
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
<%@ page language="java" import="java.util.*,java.net.*" contentType="text/html;charset=UTF-8" %>
<% String projectPath = request.getContextPath();
	boolean isLogin = false;
 %>
<html>
<link rel="stylesheet" type="text/css" href="../assets/css/reset.css">
<link rel="stylesheet" type="text/css" href="../assets/css/main.css">
<div id="header">
		<div class="container">
			
			<a href="<%=projectPath%>/template/index.jsp">
				<img src="../assets/img/logo2.jpg">
			</a>

			<div class="navbar">
				<ul>
					<li class="active"><a href="">主页</a></li>
					<li><a href="">新闻</a></li>
					<li><a href="">通知公告</a></li>
					<li><a href="">资料下载</a></li>
				</ul>
			</div>
			<div id="search">
				<form method="post" action="">
					<input type="text" name="q" placeholder="文章标题">
					<input type="submit" value="">
				</form>
			</div>
			<%
				    	//判断session是否登录
		    try{
		    	String username =request.getSession().getAttribute("username").toString();
		    	if(username!=null&&username.length()>0){
		    		isLogin = true;
			    	}
		    	}catch(Exception e){
		    	}
		    if(!isLogin){
			%>			
			<div class="header_login">
				<a id="js-signin" href="login.jsp">登录</a>
			</div>
			<%}else{
			 %>
			 <div class="header_login">
			 	<a id="js-signin" href="<%=projectPath%>/template/teacher.jsp">个人信息</a>
				<a id="js-signin" href="javascript:confirmLogout()">退出</a>
			 </div>
			 <%}
			  %>
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
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" import="java.util.*,java.net.*" contentType="text/html;charset=UTF-8" %>

<html lang="en">
    <head>
		<style type="text/css">
		div#bg-div{ 
		position:fixed; 
		top:0; 
		left:0; 
		bottom:0; 
		right:0; 
		z-index:-1; 
		} 
		div#bg-div > img { 
		height:100%; 
		width:100%; 
		border:0; 
		} 
		</style>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>用户登录</title>

        <!-- CSS -->
        <link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css">
<!-- 	<link rel="stylesheet" type="text/css" href="../assets/css/main.css"> -->
        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->

        <!-- Favicon and touch icons -->
        <link rel="shortcut icon" href="../assets/ico/favicon.png">

    </head>
<%@include file="head.jsp"%>
    <body>
    <%
    	//判断session是否登录
	    try{
	    	String username =request.getSession().getAttribute("username").toString();
	    	if(username!=null&&username.length()>0){
	    		response.sendRedirect(projectPath+"/template/"+role+".jsp");
		    	}
	    	}catch(Exception e){
	    	}
	    //判断cookie是否存在
	    String usernameCookie="";
	    String passwordCookie="";
	    
	    Cookie[] cookies = request.getCookies();
		if(cookies!=null&&cookies.length>0){
			for(int i=0;i<cookies.length;i++){			
				if(cookies[i].getName().equals("username")){
					usernameCookie = URLDecoder.decode(cookies[i].getValue(), "utf-8");							
				}
				if(cookies[i].getName().equals("password")){
					passwordCookie= URLDecoder.decode(cookies[i].getValue(), "utf-8");					
				}										
			}

		}			
		
	    
	    
     %>
<!-- 		<div id="bg-div"><img src="../assets/img/backgrounds/1.jpg" /></div>  -->
        <!-- Top content -->
       <div id="loginpage">
		<div class="content-wrap">
			<div class="login-window">
				<h4>欢迎登录</h4>
				<form class="window-content" name="loginForm" action="<%=projectPath%>/services/LoginServlet" method="post" >
					<input type="text" name="form-username" placeholder="请输入用户名" />
					<input type="password" name="form-password" placeholder="请输入密码" />
					<input type="submit" name="Submit" value="登录">
				</form>
			</div>
		</div>
	</div>	


        <!-- Javascript -->
        
        <!--[if lt IE 10]>
            <script src="assets/js/placeholder.js"></script>
        <![endif]-->

    </body>
	<jsp:include page="copyright.jsp" flush="false"/>
</html>
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
        <link rel="stylesheet" href="./bootstrap/css/bootstrap.min.css">

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->

        <!-- Favicon and touch icons -->
        <link rel="shortcut icon" href="./assets/ico/favicon.png">

    </head>

    <body>
    <%
    	//判断session是否登录
	    try{
	    	String username =request.getSession().getAttribute("username").toString();
	    	if(username!=null&&username.length()>0){
	    		response.sendRedirect("MyJsp.jsp");
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
		<div id="bg-div"><img src="./assets/img/backgrounds/1.jpg" /></div> 
        <!-- Top content -->
		<div class="container">
			<div class="row">
				<div class="col-sm-6 col-sm-offset-3" style="border-radius: 5px 5px 0px 0px;background:#eee;margin-top:20px;padding: 0px 25px 0px 10px;">
					<div class="col-sm-8">			
					<h3 class="pull-left" style="font-weight:bold">用户登录</h3>							
					</div>
					
					<div class="col-sm-8 ">
						<p class="pull-left" style="color:#999;">请输入用户名和密码登录:</p>							
					</div>
				</div>
				<div class="col-sm-6 col-sm-offset-3" style="border-radius: 0px 0px 5px 5px;background:#ccc;padding: 10px 25px 20px 25px;">
					
					<form name="loginForm" action="services/LoginServlet" method="post" >
						<div class="form-group">
							
							<div class="input-group">
							  <div class="input-group-addon">用户名:</div>
							  <input type="text" name="form-username" class="form-control" placeholder="用户名"  id="form-username" value="<%=usernameCookie %>">
							</div>
						</div>
						<div class="form-group">
							<div class="input-group">
								  <div class="input-group-addon">密码:</div>
								  <input type="password" name="form-password" class="form-control" placeholder="密码"  id="form-password" value="<%=passwordCookie %>">
								 
							</div>
						</div>
						<div class="form-group">
							<label>
								<input type ="checkBox" name = "rememberMe" checked="true">7天之内记住我
							</label>
							<label>
								<input type ="checkBox" name = "autoLogin" checked="true">7天之内自动登录
							</label>
						</div>
						<div class="form-group">
							<button type="submit" class="btn btn-success form-control">登录</button>
						</div>	
						<div class="form-group">
							<a href="register.jsp" class="btn btn-info form-control">注册</a>						
						</div>				

							
					</form>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-6 col-sm-offset-3 ">
					<h6 style="color:#fff;">使用其他方式登录:</h6>
					<div >
						<button class="col-sm-3 btn btn-primary" href="#">Facebook</button>
						<button class="col-sm-3 col-sm-offset-1 btn btn-info" href="#">Twitter</button>
						<button class="col-sm-3 col-sm-offset-1 btn btn-danger" href="#">Google+</button>
					</div>
				</div>
			</div>
		</div>


        <!-- Javascript -->
        <script src="./assets/js/jquery-1.11.1.min.js"></script>
        <script src="./bootstrap/js/bootstrap.min.js"></script>
        
        <!--[if lt IE 10]>
            <script src="assets/js/placeholder.js"></script>
        <![endif]-->

    </body>

</html>
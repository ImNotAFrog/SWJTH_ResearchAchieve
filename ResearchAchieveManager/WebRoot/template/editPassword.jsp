<%@ page language="java" import="java.util.*,com.SWJTHC.model.AppUser,com.SWJTHC.enums.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
 <head>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">    
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<title>修改密码</title>
<link rel="stylesheet" type="text/css" href="../assets/css/user_edit.css">

 </head>
   <%@include file="head.jsp"%> 
  <body>
 <div class="container">
	    <div class="row">	    	
	        <div class="col-md-6 col-md-offset-3 userinfo-edit">
	        	<label>修改密码</label>
	        	<i class="mr_left_bg"></i>
	        	<i class="mr_right_bg"></i>
			    <form action="<%=projectPath%>/services/EditPasswordServlet"  method="post" class="form-horizontal" onsubmit="return checkPassword()">
			    	<div class="form-group">
					    <label for="username" class="col-md-2 control-label">用户:</label>					   
					    <div class="col-md-6">
					    	 <input class="form-control" id="username" name="username" value="<%=u.getUsername() %>"  readonly="readonly"/>
					    </div>
				    </div>
			     	<div class="form-group">
					    <label for="name" class="col-md-2 control-label">原密码</label>
					    <div class="col-md-6">
					    	<input id="oldPassword" name="oldPassword" class="form-control" type="password" autocomplete="off" value=""/>
					    </div>
				    </div>
					<div class="form-group">
					    <label for="name" class="col-md-2 control-label">新密码</label>
					    <div class="col-md-6">
					    	<input id="newPassword" name="newPassword" class="form-control" type="password" autocomplete="off" value=""/>
					    </div>
				    </div>
				    <div class="form-group">
					    <label for="name" class="col-md-2 control-label">确认新密码</label>
					    <div class="col-md-6">
					    	<input id="confirmPassword" name="confirmPassword" class="form-control" type="password" autocomplete="off" value=""/>
					    </div>
				    </div>
				    <!-- <button type="submit" class="btn btn-primary submit">Submit</button> -->
				    <div class="submit">
				    	<input type="submit" name="Submit" class="save" value="修改">
				    	<a href="<%=projectPath%>/template/<%=role %>.jsp" class="cancel">取消</a>
					</div>
				    <span id="error" style="color:red"></span>
				</form>


	        </div>
	    </div>
	</div>
  </body>
  <script type="text/javascript">
 	var checkPassword = function(){

 		var error = document.getElementById("error");

 		var oldPassword=document.getElementById("oldPassword").value;
  		var newPassword=document.getElementById("newPassword").value;
  		var confirmPassword = document.getElementById("confirmPassword").value;
  		if(newPassword == oldPassword){
  			error.innerText = "您输入的新密码和旧密码相同";
  			return false;
  		}
  		else if(newPassword != confirmPassword){
  			error.innerText = "您输入的新密码不一致";
  			return false;
  		}
  		return true;
  	}
  
  </script>
  <%@include file="copyright.jsp"%>
</html>

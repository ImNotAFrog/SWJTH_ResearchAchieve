<%@ page language="java" import="java.util.*,com.SWJTHC.model.AppUser,com.SWJTHC.enums.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
 <head>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">    
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<title>用户基本信息编辑</title>
<link rel="stylesheet" type="text/css" href="../assets/css/user_edit.css">

 </head>
   <%@include file="head_user.jsp"%> 
  <body>
 <div class="container">
	    <div class="row">	    	
	        <div class="col-md-6 col-md-offset-3 userinfo-edit">
	        	<label>用户基本信息编辑表：</label>
	        	<i class="mr_left_bg"></i>
	        	<i class="mr_right_bg"></i>
			    <form action="<%=projectPath%>/services/UserServlet"  class="form-horizontal" onsumbmit="return checkform()">
			    	<div class="form-group">
					    <label for="username" class="col-md-2 control-label">用户:</label>					   
					    <div class="col-md-6">
					    	 <input class="form-control" id="username" name="username" value="<%=u.getUsername() %>"  readonly="readonly"/>
					    </div>
				    </div>
			     	<div class="form-group">
					    <label for="name" class="col-md-2 control-label">姓名:</label>
					    <div class="col-md-6">
					    	<input id="name" name="name" class="form-control" type="text" autocomplete="off" value="<%=u.getName()%>"/>
					    </div>
				    </div>
				    <div class="form-group">
					    <label for="position" class="col-md-2 control-label">职务:</label>
					    <div class="col-md-6">
					    	<select name="position" id="position" class="form-control">
					    	<%
					    	Position p[] = Position.values();
					    	for(int i=0;i<p.length;i++){
					    		%>
					    		<option value="<%=p[i]%>" <%if(p[i].equals(u.getPosition())){%> selected="true"<%} %>><%=p[i].getName()%></option>
					    		<%
					    	}
					    	 %>
				           </select>
					    </div>
				    </div>
				    
				    <div class="form-group">
					    <label for="title" class="col-md-2 control-label">职称:</label>
					    <div class="col-md-6">
					    	<select name="title" id="title" class="form-control">
					        <%
						    	Title t[] = Title.values();
						    	for(int i=0;i<t.length;i++){
						    		%>
						    		<option value="<%=t[i]%>" <%if(t[i].equals(u.getTitle())){%> selected="true"<%} %>><%=t[i].getName()%></option>
						    		<%
						    	}
					    	 %>
				           </select>
					    </div>
				    </div>
				    <div class="form-group">
					    <label for="title" class="col-md-2 control-label">职级:</label>
					    <div class="col-md-6">
					    	<select name="positionLevel" id="positionLevel" class="form-control">
					        <%
						    	PositionLevel pl[] = PositionLevel.values();
						    	for(int i=0;i<pl.length;i++){
						    		%>
						    		<option value="<%=pl[i]%>" <%if(pl[i].equals(u.getPositionLevel())){%> selected="true"<%} %>><%=pl[i].getName()%></option>
						    		<%
						    	}
					    	 %>
				           </select>
					    </div>
				    </div>
				    <div class="form-group">
					    <label for="department" class="col-md-2 control-label">所属部门:</label>
					    <div class="col-md-6">
					    	<select name="department" id="department" class="form-control"  onChange="getSubDepartment()" value="<%=u.getDepartment()%>">
					          <%
						    	Department d[] = Department.values();
						    	for(int i=0;i<d.length;i++){
						    		%>
						    		<option value="<%=d[i]%>" <%if(d[i].equals(u.getDepartment())){%> selected="true"<%} %>><%=d[i].getName()%></option>
						    		<%
						    	}
					    	 %>
				           </select>
					    </div>
				    </div>
				    <div class="form-group">
					    <label for="subDepartment" class="col-md-2 control-label">所属科室:</label>
					    <div class="col-md-6">
					    	<select name="subDepartment" id="subDepartment" class="form-control">
					         
				           </select>
					    </div>
				    </div>
				
			
				    <!-- <button type="submit" class="btn btn-primary submit">Submit</button> -->
				    <div class="submit">
				    	<input type="submit" name="Submit" class="save" value="保存">
				    	<a href="<%=projectPath%>/template/teacher.jsp" class="cancel">取消</a>
					</div>
				    <span id="error" style="color:red"></span>
				</form>


	        </div>
	    </div>
	</div>
  </body>
  <script type="text/javascript">
  	var s = "<%=u.getSubDepartment()%>";
	window.onload=function(){ 
		getSubDepartment();
	}
	var getSubDepartment=function(){
	  	var value = document.getElementById("department").value;
	  	var sub =  document.getElementById("subDepartment");
	  	$.ajax({ 
	    type : "POST", 
	    contentType : "application/json", 
	    url : "../services/UserServlet?department=" + value, 
	    dataType : 'json', 
	    success : function(result){ 
	    	//var obj = JSON.parse(result); 
	    	sub.options.length=0
	        for(var i in result){
	        	var o =new Option(result[i],i);
	        	if(s==i){
	        		o.selected=true;
	        	}
	        	sub.add(o);	        	
	        }
	    } 
	}); 
  }
  function checkform(){
  		var error = document.getElementById("error");
  		var username = document.getElementById("username");
  		var name = document.getElementById("name");
  		var position = document.getElementById("position");
  		var title = document.getElementById("title");
  		var positionLevel = document.getElementById("positionLevel");
  		var 
  		if(username.value ==""){
  			error.innerText = "用户名不能为空";
  			return false;
  		}else if(name.value == ""){
  			error.innerText = "姓名不能为空";
  			return false;
  		}
  		// }else if(position.value == ""){
  		// 	error.innerText ="职务不能为空";
  		// 	return false;
  		// }else if(title.value == ""){
  		// 	error.innerText ="职称不能为空";
  		// 	return false;
  		// }else if(positionLevel.value == ""){
  		// 	error.innerText ="职级不能为空";
  		// 	return false;
  		// }
  		return true;
  }
  </script>
</html>

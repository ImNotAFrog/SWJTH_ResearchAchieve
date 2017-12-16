<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@include file="../head_user.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'departRankingLookup.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="<%=projectPath%>/assets/css/uploadForm.css" rel="stylesheet">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<% String department = request.getParameter("department");
		
		List<UserAchievement> all = UserAchievementDao.getAchievementList();
		List<UserAchievement> depAchieve = new ArrayList();
		for(int i=0;i<all.size();i++){
		if(all.get(i).getSubDepartment().getName().equals(department)&&all.get(i).getChecked()==1){
			depAchieve.add(all.get(i));
		}
	}
	 %>
  </head>
  
  <body>
<div class="container upload">
	    <div class="row">
	        <div class="col-md-10 col-md-offset-1">
			
				<div class="re-item">
				<table id="wating" class="table table-striped table-bordered table-hover" search="true">
			       <thead>
			      	<tr>			      	
			          <th>姓名</th>
			          <th>成果名称</th>
			      	  <th>类型</th>
			          <th>得分</th>
			          <th>状态</th>
			          <th>日期</th>
			        </tr>
			      </thead>
			      <tbody>
			      <%for(int i=0;i<depAchieve.size();i++){%>
			      	<tr class="success">
			      	  <th><%=depAchieve.get(i).getUsername() %></th>
			          <th><%=depAchieve.get(i).getName() %></th>
			      	  <th><%=depAchieve.get(i).getCategory() %></th>
			          <th><%=depAchieve.get(i).getScore() %></th>
			          <th>已通过</th>
			          <th><%=depAchieve.get(i).getAchievementDate() %></th>
			        </tr>		      	
			      <%} %>
			      </tbody>
			      </table>
			      <div class="col-md-offset-5">
			      	<button type="button"class="btn btn-default" onclick="window.history.back(-1);">返回</button>
			      </div>						      
				</div>
			</div>
		</div>
	</div>
  </body>
</html>

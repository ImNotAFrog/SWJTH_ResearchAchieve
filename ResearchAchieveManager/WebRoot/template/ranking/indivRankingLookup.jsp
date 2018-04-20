<%@ page language="java" import="java.util.*,com.SWJTHC.Dao.*,com.SWJTHC.model.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@include file="../head.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'indivRankingLookup.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="<%=projectPath%>/assets/css/uploadForm.css" rel="stylesheet">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<% String chosenUser = request.getParameter("chosenUser");
		
		List<UserAchievement> all = UserAchievementDao.getAchievementList();
		List<UserAchievement> userAchieve = new ArrayList();
		java.sql.Date start = java.sql.Date.valueOf(request.getParameter("startDate"));
		java.sql.Date end = java.sql.Date.valueOf(request.getParameter("endDate"));
		for(int i=0;i<all.size();i++){
		if(all.get(i).getUsername().equals(chosenUser)&&all.get(i).getChecked()==2&&all.get(i).getAchievementDate().after(start)&&all.get(i).getAchievementDate().before(end)){
			userAchieve.add(all.get(i));
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
			       <%for(int i=0;i<userAchieve.size();i++){%>
			      	<tr class="success">
			      	  <th><%=userAchieve.get(i).getUsername() %></th>
			          <th><%=userAchieve.get(i).getName() %></th>
         				<%if(userAchieve.get(i).getCategory().equals("thesis")){
						%><td>论文</td><%
						}else if(userAchieve.get(i).getCategory().equals("eduProject")){
						%><td>课题项目</td><%
						}else if (userAchieve.get(i).getCategory().equals("textbook")){
						%><td>教材、论著</td><%
						}else if (userAchieve.get(i).getCategory().equals("patent")){
						%><td>专利</td><%
						}else if (userAchieve.get(i).getCategory().equals("laws")){
						%><td>法律、法规</td><%
						}else{
						%><td>教改项目</td><%
						}%>							
			      	  <th><%=userAchieve.get(i).getScore() %></th>					          	
			          	<% switch(userAchieve.get(i).getChecked()){
			          		case -1:
			          		%><td>未通过</td><%
			          		break;
			          		case 0:
			          		%><td>待审核</td><%
			          		break;
			          		case 2:
			          		%><td>已通过</td><%
			          		break;
			          		default:
			          		%><td>异常</td><%
			          		break;
			          	}%>	
			          <th><%=userAchieve.get(i).getAchievementDate() %></th>
			        </tr>		      	
			      <%} %>
			      </tbody>
			      </table>
			      <div class="col-md-offset-5">
			      	<button type="button"class="btn btn-default" onclick="window.history.back(-1);">返回</button>
			      	<button type="button"class="btn btn-default" onclick="window.open('<%=projectPath%>/services/RankExportServlet?startDate=<%=start %>&endDate=<%=end %>&state=indivLookup&chosenUser=<%=chosenUser%>');">导出</button>
			      </div>						      
				</div>
			</div>
		</div>
	</div>
  </body>
  <%@include file="../copyright.jsp"%>
</html>

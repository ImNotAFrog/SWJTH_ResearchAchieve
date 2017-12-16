<%@ page language="java" import="java.util.*,com.SWJTHC.model.*,com.SWJTHC.Dao.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@include file="../head_user.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<% 	List<UserAchievement> all = UserAchievementDao.getAchievementList();
	List<UserAchievement> approval=new ArrayList();
	Map<String,Integer> achieveNum = new HashMap<String, Integer>();
	java.sql.Date start = java.sql.Date.valueOf("2015-1-1");
	java.sql.Date end = java.sql.Date.valueOf("2017-11-1");
	for(int i=0;i<all.size();i++){
	
		if(all.get(i).getChecked()==1&&all.get(i).getAchievementDate().after(start)&&all.get(i).getAchievementDate().before(end)){
			System.out.println(all.get(i).getUsername()+all.get(i).getName()+all.get(i).getAchievementDate());
			approval.add(all.get(i));
		}
	}
	List<UserAchievement> sumed = new ArrayList();
	for(int i=0;i<approval.size();i++){
	
		int place=-1;
		String name1 = approval.get(i).getUsername();
		for(int j=0;j<sumed.size();j++){
			if(name1.equals(sumed.get(j).getUsername())){
				place=j;
				break;
			}
		}
		if(place==-1){
			sumed.add(approval.get(i));
			achieveNum.put(approval.get(i).getName(),1);
		}else{
			double sum = sumed.get(place).getScore()+approval.get(i).getScore();
			
			sumed.get(place).setScore(sum);
			int n = achieveNum.get(sumed.get(place).getName());
			achieveNum.put(sumed.get(place).getName(),n+1);
			
		}
	} 
	Collections.sort(sumed, new IndivComparator());
 %>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'indivRanking.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link href="<%=projectPath%>/assets/css/uploadForm.css" rel="stylesheet">

  </head>
  
  <body>
  <div class="container upload">
	    <div class="row">
	        <div class="col-md-10 col-md-offset-1">
			
				<!--教学改革项目-->
				<div class="re-item">
				<table id="wating" class="table table-striped table-bordered table-hover" search="true">
			      <thead>
			      	<tr>			      	
			          <th>排名</th>
			          <th>姓名</th>
			      	  <th>成果总量</th>
			          <th>总分</th>
			          <th>所属部门</th>
			          <th>所属子部门</th>
			        </tr>
			      </thead>
			      <tbody>
			      <%for(int i=0;i<sumed.size();i++){%>
			      	<tr>
			      	<td><%=i+1 %></td>
			      	<td><%=sumed.get(i).getUsername() %></td>
			      	<td><%=achieveNum.get(sumed.get(i).getName()) %></td>
			        <td><%=sumed.get(i).getScore()%></td>
			        <td><%=sumed.get(i).getDepartment().getName()%></td>
			        <td><%=sumed.get(i).getSubDepartment().getName()%></td>	
			        </tr>		      	
			      <%} %>
			      </tbody>
			      </table>
			      <div class="col-md-offset-5">
			      	<button type="button"class="btn btn-default" onclick="window.location.href='<%=projectPath%>/template/<%=role%>.jsp';">返回</button>
			      </div>						      
				</div>
			</div>
		</div>
	</div>
  </body>
</html>

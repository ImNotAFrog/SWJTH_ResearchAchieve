<%@page import="com.SWJTHC.enums.Department"%>
<%@ page language="java" import="java.util.*,com.SWJTHC.model.*,com.SWJTHC.Dao.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@include file="../head.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<% 	List<UserAchievement> all = UserAchievementDao.getAchievementList();
	List<UserAchievement> approval=new ArrayList();
	Map<String,Integer> achieveNum = new HashMap<String, Integer>();
	
	String s = request.getParameter("startDate");
	String e = request.getParameter("endDate");
	java.sql.Date start = java.sql.Date.valueOf(s);
	java.sql.Date end = java.sql.Date.valueOf(e);
	for(int i=0;i<all.size();i++){
		if(all.get(i).getChecked()==2&&all.get(i).getAchievementDate().after(start)&&all.get(i).getAchievementDate().before(end)){
			approval.add(all.get(i));
		}
	}
	List<UserAchievement> trainDep = new ArrayList();
	for(int i=0;i<approval.size();i++){
		if(approval.get(i).getDepartment().toString().equals(request.getParameter("department"))){
			trainDep.add(approval.get(i));
		}
	}
	Map<String , List<UserAchievement>> subDeps = new HashMap<String, List<UserAchievement>>();
	for(int i=0;i<trainDep.size();i++){
		if(subDeps.containsKey(trainDep.get(i).getSubDepartment().getName())){
			List<UserAchievement> l = subDeps.get(trainDep.get(i).getSubDepartment().getName());
			l.add(trainDep.get(i));
			subDeps.put(trainDep.get(i).getSubDepartment().getName(),l);
			
			int n = achieveNum.get(trainDep.get(i).getSubDepartment().getName());
			achieveNum.put(trainDep.get(i).getSubDepartment().getName(),n+1);
			
		}else{
			List<UserAchievement> l = new ArrayList();
			l.add(trainDep.get(i));
			subDeps.put(trainDep.get(i).getSubDepartment().getName(), l);
			achieveNum.put(trainDep.get(i).getSubDepartment().getName(),1);
		}
	}
	Iterator iter = subDeps.entrySet().iterator();
	while(iter.hasNext()){
		Map.Entry entry = (Map.Entry)iter.next();
		String key = (String)entry.getKey();
		List<UserAchievement> val = (List<UserAchievement>)entry.getValue();
		

		List<UserAchievement> newl =new ArrayList();
		for(int i=0;i<val.size();i++){
			int place=-1;
			String achieveName = val.get(i).getName();
					
			for(int j=0;j<newl.size();j++){		
				if(achieveName.equals(newl.get(j).getName())){
					place=j;
					break;
				}
			}			
			if(place==-1){
				newl.add(val.get(i));
			}else{
				double sum = newl.get(place).getScore()+val.get(i).getScore();			
				newl.get(place).setScore(sum);	
			}
		}
		for(int i=0;i<newl.size();i++){
 			
 			if(newl.get(i).getScore()>newl.get(i).getMaxScore()){
 				newl.get(i).setScore(newl.get(i).getMaxScore());
 			}
		}
		
		entry.setValue(newl);	
	}
	List<UserAchievement> result =new ArrayList();
	Iterator iter2 = subDeps.entrySet().iterator();
	while(iter2.hasNext()){
		Map.Entry entry = (Map.Entry)iter2.next();
		String key = (String)entry.getKey();
		List<UserAchievement> val = (List<UserAchievement>)entry.getValue();
		UserAchievement ua = val.get(0);
		
		for(int i=1;i<val.size();i++){
			double temp = ua.getScore()+val.get(i).getScore();
			ua.setScore(temp);
		}
		
		result.add(ua);
	}
	Collections.sort(result, new IndivComparator());
	
%>
  <head>
    <base href="<%=basePath%>">
    
    <title>集体成果评比排名</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link href="<%=projectPath%>/assets/css/uploadForm.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="<%=projectPath%>/assets/css/bootstrap-table.min.css">

  </head>
  
  <body>
 <div class="container upload">
	    <div class="row">
	        <div class="col-md-10 col-md-offset-1">
			
				<!--教学改革项目-->
				<div class="re-item">
				<table id="wating" class="table table-striped table-bordered table-hover" data-toggle="table" data-pagination="true" data-height="516" data-search="true">
			      <thead>
			      	<tr>			      	
			          <th>排名</th>
			          <th>部门名称</th>
			      	  <th>成果总量</th>
			          <th>总分</th>
			          <th>操作</th>
			        </tr>
			      </thead>
			      <tbody>
			      <%for(int i=0;i<result.size();i++){%>
			      	<tr onclick="window.location.href='<%=projectPath%>/template/ranking/departRankingLookup.jsp?department=<%=result.get(i).getSubDepartment().getName()%>';">
			      	<td><%=i+1 %></td>
			          <td><%=result.get(i).getSubDepartment().getName() %></td>
			      	  <td><%=achieveNum.get(result.get(i).getSubDepartment().getName()) %></td>
			          <td><%=result.get(i).getScore()%></td>
			          <td><button type="button" class="btn btn-xs btn-info" onclick="window.location.href='<%=projectPath%>/template/ranking/departRankingLookup.jsp?department=<%=result.get(i).getSubDepartment().getName()%>&startDate=<%=s%>&endDate=<%=e %>'">详情</button></td>					        			      	
			        </tr>			        
			      <%} %>
			      </tbody>
			      </table>
			      <div class="col-md-offset-5">
			      	<button type="button"class="btn btn-default" onclick="window.location.href='<%=projectPath%>/template/<%=role%>.jsp';">返回</button>
			      	<button type="button"class="btn btn-default" onclick="window.open('<%=projectPath%>/services/RankExportServlet?startDate=<%=start %>&endDate=<%=end %>&state=departRank&department=<%=request.getParameter("department") %>');">导出</button>
			      </div>						      
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="<%=projectPath %>/assets/js/bootstrap-table.min.js"></script>
  </body>
    <%@include file="../copyright.jsp"%>
</html>

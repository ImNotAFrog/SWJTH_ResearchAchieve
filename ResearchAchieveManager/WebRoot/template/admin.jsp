<%@page import="java.util.*,com.SWJTHC.model.*,com.SWJTHC.Dao.*" pageEncoding="UTF-8"%>

<html>
<head>
	<meta charset="utf-8">
	<title>管理员主页</title>
	<meta content="width=device-width, initial-scale=1.0" name="viewport">
	<link rel="stylesheet" type="text/css" href="../assets/css/teacher_main.css">
</head>
<%@include file="head_user.jsp"%>
<% 	List<UserAchievement> l = UserAchievementDao.getAchievementByUsername(u.getUsername());
	List<UserAchievement> all = UserAchievementDao.getAchievementList();
	List<UserAchievement> approval=new ArrayList();
	List<UserAchievement> pending=new ArrayList();
	List<UserAchievement> denied=new ArrayList();
	for(int i=0;i<all.size();i++){
		switch(all.get(i).getChecked()){
			case -1:
				denied.add(all.get(i));
			break;
			case 0:
				pending.add(all.get(i));
			break;
			case 1:
				approval.add(all.get(i));
			break;
		}
	}
 %>
<body>
	<div class="content">
		<div class="container clearfix">
			<div class="left">
				<ul>
					<li>
						<a class="active" href="#">
						
						<span>个人信息</span>
						<span class="icon">&gt;</span>
						</a>
					</li>
					<li>
						<a href="#">
							<span>已通过成果</span>
							<span class="icon">&gt;</span>
						</a>
					</li>
					<li>
						<a href="#">
							<span>待审核成果</span>
							<span class="icon">&gt;</span>
						</a>
					</li>
					<li>
						<a href="#">
							<span>未通过成果</span>
							<span class="icon">&gt;</span>
						</a>
					</li>
					<li>
						<a href="#">
							<span>成果评比</span>
							<span class="icon">&gt;</span>
						</a>
					</li>
				</ul>
			</div>
			<div class="right-fix">
				<div class="right">
					<div id="detail" class="content-item">
						<div class="common-title">个人信息
								<a href="<%=projectPath %>/template/editPassword.jsp" class="pull-right edit">
									修改密码
								</a>
								<a href="<%=projectPath %>/template/editUser.jsp" class="pull-right edit">
									编辑
								</a>
						</div>
						<!-- <div class="line"></div> -->
						<%if(u.getUsername()!=null){%>
						<div class="info-box clearfix">
							<label class="pull-left">账号</label>
							<div class="pull-left"> <%=u.getUsername() %></div>
						</div>
						<%}%>
						<%if(u.getName()!=null){%>
						<div class="info-box clearfix">
							<label class="pull-left">姓名</label>
							<div class="pull-left"><%=u.getName() %></div>
						</div>
						<%}%>
						<%if(u.getPosition()!=null){%>
						<div class="info-box clearfix">
							<label class="pull-left">职务</label>
							<div class="pull-left"><%=u.getPosition().getName() %></div>
						</div>
						<%}%>
						<%if(u.getTitle()!=null){%>
						<div class="info-box clearfix">
							<label class="pull-left">职称</label>
							<div class="pull-left"> <%=u.getTitle().getName() %></div>
						</div>
						<%}%>
						<%if(u.getPositionLevel()!=null){%>
						<div class="info-box clearfix">
							<label class="pull-left">职级</label>
							<div class="pull-left"> <%=u.getPositionLevel().getName() %></div>
						</div>
						<%}%>
						<%if(u.getDepartment()!=null){%>
						<div class="info-box clearfix">
							<label class="pull-left">所属部门</label>
							<div class="pull-left"> <%=u.getDepartment().getName() %></div>
						</div>
						<%}%>
						<%if(u.getSubDepartment()!=null){%>
						<div class="info-box clearfix">
							<label class="pull-left">所属科室</label>
							<div class="pull-left"> <%=u.getSubDepartment().getName() %></div>
						</div>
						<%}%>
					</div>					
					<div id="approval" class="content-item">
						<div class="list">
							<div class="common-title">成果列表</div>
							<div class="approval">
								<p class="state">已通过</p>
								<table id="approval" class="table table-striped table-bordered">
							      <thead>
							          <th>成果名称</th>
							          <th>类型</th>
							          <th>提交人</th>
							          <th>成果得分</th>
							        </tr>
							      </thead>
							      <tbody>
							         <% for(int i=0;i<approval.size();i++){
								      %>
								      <tr class="success" onclick="window.location.href='<%=projectPath%>/template/upload/<%=approval.get(i).getCategory()%>Upload.jsp?AchievementId=<%=approval.get(i).getID()%>'">					          	
								          	<td><%=approval.get(i).getName()%></td>
											<%if(approval.get(i).getCategory().equals("thesis")){
											%><td>论文</td><%
											}else if(approval.get(i).getCategory().equals("eduProject")){
											%><td>课题项目</td><%
											}else if (approval.get(i).getCategory().equals("textbook")){
											%><td>教材、论著</td><%
											}else if (approval.get(i).getCategory().equals("patent")){
											%><td>专利</td><%
											}else if (approval.get(i).getCategory().equals("laws")){
											%><td>法律、法规</td><%
											}else{
											%><td>教改项目</td><%
											}%>						          	
								          	<td><%=approval.get(i).getUsername()%></td>		
								          	<td><%=approval.get(i).getScore()%></td>						        	
								      </tr>
								      <%
								      	}
								       %>		
							       </tbody>
							    </table>
							</div>
						</div>
					</div>	
					<div id="pending" class="content-item">
						<div class="list">
							<div class="common-title">成果列表</div>
							<div class="pending">
								<p class="state">待审核</p>
								<table id="pending" class="table table-striped table-bordered">
							      <thead>
							          <th>成果名称</th>
							          <th>类型</th>
							          <th>提交人</th>
							          <th>自评得分</th>
							        </tr>
							      </thead>
							      <tbody>
							        <% for(int i=0;i<pending.size();i++){
								      %>
								      <tr class="warning" onclick="window.location.href='<%=projectPath%>/template/upload/<%=pending.get(i).getCategory()%>Upload.jsp?AchievementId=<%=pending.get(i).getID()%>'">					          	
								          	<td><%=pending.get(i).getName()%></td>
											<%if(pending.get(i).getCategory().equals("thesis")){
											%><td>论文</td><%
											}else if(pending.get(i).getCategory().equals("eduProject")){
											%><td>课题项目</td><%
											}else if (pending.get(i).getCategory().equals("textbook")){
											%><td>教材、论著</td><%
											}else if (pending.get(i).getCategory().equals("patent")){
											%><td>专利</td><%
											}else if (pending.get(i).getCategory().equals("laws")){
											%><td>法律、法规</td><%
											}else{
											%><td>教改项目</td><%
											}%>						          	
								          	<td><%=pending.get(i).getUsername()%></td>		
								          	<td><%=pending.get(i).getScore()%></td>					        	
								      </tr>
								      <%
								      	}
								       %>	
							       </tbody>
							    </table>
							</div>
						</div>
					</div>	
					<div id="denied" class="content-item">
						<div class="list">
							<div class="common-title">成果列表</div>
							<div class="denied">
								<p class="state">未通过</p>
								<table id="denied" class="table table-striped table-bordered">
							      <thead>
							          <th>成果名称</th>
							          <th>类型</th>
							          <th>提交人</th>
							          <th>自评得分</th>
							        </tr>
							      </thead>
							      <tbody>
							        <% for(int i=0;i<denied.size();i++){
								      %>
								      <tr class="danger" onclick="window.location.href='<%=projectPath%>/template/upload/<%=denied.get(i).getCategory()%>Upload.jsp?AchievementId=<%=denied.get(i).getID()%>'">					          	
								          	<td><%=denied.get(i).getName()%></td>
											<%if(denied.get(i).getCategory().equals("thesis")){
											%><td>论文</td><%
											}else if(denied.get(i).getCategory().equals("eduProject")){
											%><td>课题项目</td><%
											}else if (denied.get(i).getCategory().equals("textbook")){
											%><td>教材、论著</td><%
											}else if (denied.get(i).getCategory().equals("patent")){
											%><td>专利</td><%
											}else if (denied.get(i).getCategory().equals("laws")){
											%><td>法律、法规</td><%
											}else{
											%><td>教改项目</td><%
											}%>						          	
								          	<td><%=denied.get(i).getUsername()%></td>		
								          	<td><%=denied.get(i).getScore()%></td>				        	
								      </tr>
								      <%
								      	}
								       %>	
							       </tbody>
							    </table>
							</div>
						</div>
					</div>	
					<div id="ranking"  class="content-item">
						<div class="common-title">科研成果评比情况
						</div>
						<div class="nav">
								<h4>请选择查看类型</h4>
								<ul>
									<li class="load-item  clearfix">
										<button type="button" class="btn btn-info btn-lg" onclick="window.location.href='<%=projectPath%>/template/ranking/indivRanking.jsp';">查看个人成果评比排名列表</button>
									</li>
									<li class="load-item  clearfix">
										<button type="button" class="btn btn-info btn-lg" onclick="window.location.href='<%=projectPath%>/template/ranking/departRanking.jsp';">查看成果评比排名列表</button>
									</li>
								</ul>
						</div>
					</div>
			</div>
		</div>
		</div>
	</div>
	<!--内容区域结束-->
	<script type="text/javascript" src="<%=projectPath %>/assets/js/main.js"></script>
</body>

</html>

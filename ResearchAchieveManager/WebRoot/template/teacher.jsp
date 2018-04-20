<%@page import="java.util.*,com.SWJTHC.model.*,com.SWJTHC.Dao.*" pageEncoding="UTF-8"%>

<html>
<head>
	<meta charset="utf-8">
	<title>教师主页</title>
	<meta content="width=device-width, initial-scale=1.0" name="viewport">
	<link rel="stylesheet" type="text/css" href="../assets/css/teacher_main.css">
</head>
<%@include file="head.jsp"%>

<% List<UserAchievement> l = UserAchievementDao.getAchievementByUserId(u.getUsername());
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
						<span>我的科研成果</span>
						<span class="icon">&gt;</span>
						</a>
					</li>
					<li>
						<a href="#">
							<span>上传成果</span>
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
						<div class = "detail">
							<div class="line"></div> 
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
					</div>
					<div id="research" class="content-item">
						<div class="common-title">成果列表
						</div>
						<div class="line"></div> 
						<!--待审核-->
						<div class="examing">
							<table id="wating" class="table table-striped table-bordered table-hover" data-toggle="table" data-pagination="true" data-height="516" data-search="true">
						      <thead>
						      	<tr>
						          <th>成果名称</th>
						      	  <th>成果编号</th>
						          <th>类型</th>
						          <th>审核状态</th>
						          <th>操作</th>
						        </tr>
						      </thead>
						      <tbody>
						      <% for(int i=0;i<l.size();i++){
						      %>
						      <tr class="<% switch(l.get(i).getChecked()){
						          		case -1:
						          		%>danger<%
						          		break;
						          		case 0:
						          		break;
						          		case 1:
						          		%>warning<%
						          		break;
						          		case 2:
						          		%>success<%
						          		break;
						          		default:
						          		%>warning<%
						          		break;
						          	}%>">					          	
						          	<td><%=l.get(i).getName()%></td>
									<td><%=l.get(i).getID()%></td>
									<%if(l.get(i).getCategory().equals("thesis")){
									%><td>论文</td><%
									}else if(l.get(i).getCategory().equals("eduProject")){
									%><td>课题项目</td><%
									}else if (l.get(i).getCategory().equals("textbook")){
									%><td>教材、论著</td><%
									}else if (l.get(i).getCategory().equals("patent")){
									%><td>专利</td><%
									}else if (l.get(i).getCategory().equals("laws")){
									%><td>法律、法规</td><%
									}else{
									%><td>教改项目</td><%
									}%>						          	
						          	<%  String state = "";
						          		switch(l.get(i).getChecked()){
						          		case -1:
						          		state = "EDIT";
						          		%><td>未通过</td><%
						          		break;
						          		case 0:
						          		state = "EDIT";
						          		%><td>待审核</td><%
						          		break;
						          		case 1:
						          		state = "VIEW";
						          		%><td>已上报</td><%
						          		break;
						          		case 2:
						          		state = "VIEW";
						          		%><td>已通过</td><%
						          		break;
						          		default:
						          		%><td>异常</td><%
						          		break;
						          	}%>	
						          	<td><button type="button" class="btn btn-xs btn-info" onclick="window.location.href='<%=projectPath%>/template/upload/<%=l.get(i).getCategory()%>Upload.jsp?AchievementId=<%=l.get(i).getID()%>&state=<%=state%>'">查看</button></td>					        	
						      </tr>
						      <%
						      	}
						       %>						       
						       </tbody>
						    </table>
						</div>						
					
					</div>
					<div id="loadup"  class="content-item">
						<div class="common-title">上传科研成果
						</div>
						<div class="line"></div> 
						<div class="nav">
								<h4>请选择科研成果类型</h4>
								<ul>
									<li class="load-item  clearfix">
										<img src="../assets/img/project.png">
										<dic class="item-info" onclick="goToUpload('eduProjectUpload.jsp');">
											<div>课题项目类</div>
											<div>Poject</div>
										</dic>
									</li>
									<li class="load-item  clearfix" >
										<img src="../assets/img/paper.png">
										<dic class="item-info"  onclick="goToUpload('thesisUpload.jsp');">
											<div>论文类</div>
											<div>Thesis</div>
										</dic>
									</li>
									<li class="load-item  clearfix">
										<img src="../assets/img/paper.png">
										<dic class="item-info" onclick="goToUpload('textbookUpload.jsp');">
											<div>论著、教材类</div>
											<div>TextBook</div>
										</dic>
									</li>
									<li class="load-item  clearfix">
										<img src="../assets/img/patent.png">
										<dic class="item-info" onclick="goToUpload('patentUpload.jsp');">
											<div>专利</div>
											<div>Patent</div>
										</dic>
<!-- 									</li> -->
<!-- 									<li class="load-item  clearfix"> -->
<!-- 										<img src="../assets/img/paper.png"> -->
<!-- 										<dic class="item-info" onclick="window.location.href='<%=projectPath%>/template/upload/lawsUpload.jsp';"> -->
<!-- 											<div>法律法规类</div> -->
<!-- 											<div>Laws and Regulations</div> -->
<!-- 										</dic> -->
<!-- 									</li> -->
									<li class="load-item  clearfix">
										<img src="../assets/img/project.png">
										<dic class="item-info" onclick="goToUpload('eduReformProjectUpload.jsp')">
											<div>教学改革项目类</div>
											<div>Edu-Reform Project</div>
										</dic>
									</li>
								</ul>
						</div>

				</div>
			</div>
			
		</div>
	</div>
	<!--内容区域结束-->
	<script type="text/javascript" src="<%=projectPath %>/assets/js/main.js"></script>
	<script type="text/javascript">
	var goToUpload = function(page){
		<%if(u.getName()==null){%>
			alert("请先完善个人资料");
			window.location.href="<%=projectPath %>/template/editUser.jsp";
		<%}else{%>
			window.location.href="<%=projectPath%>/template/upload/"+page+"?state=NEW";
		<%}%>
	}
	var openAchievement = function(row,$element,filed){
		console.log("aaa");
		window.location.href='<%=projectPath%>/template/upload/'+row.category+'Upload.jsp?AchievementId='+row.ID;
	}
	</script>

</body>
	<%@include file="copyright.jsp"%>
</html>

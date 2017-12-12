<%@page import="java.util.*,com.SWJTHC.model.*,com.SWJTHC.Dao.*" pageEncoding="UTF-8"%>

<html>
<head>
	<meta charset="utf-8">
	<title>教师主页</title>
	<meta content="width=device-width, initial-scale=1.0" name="viewport">
	<link rel="stylesheet" type="text/css" href="../assets/css/teacher_main.css">
</head>
<%@include file="head_user.jsp"%>
<% List<UserAchievement> l = UserAchievementDao.getAchievementByUsername(u.getUsername());
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
					<!-- <li>
						<a href="">
							<span>ä¸ä¼ ææ</span>
							<span class="icon">&gt;</span>
						</a>
					</li> -->
				</ul>
			</div>
			<div class="right-fix">
				<div class="right">
					<div id="detail" class="content-item">
						<div class="common-title">个人信息
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
					<div id="research" class="content-item">
						<div class="common-title">成果列表
						</div>
						<!--待审核-->
						<div class="examing">
							<!-- <ul>
								<li>
									<a href="#">
										<p>项目编号：ky0001</p>
										<span>[1]“移动交互环境下的大媒体内容分析与检索”项目  2017.01-2021.12 国家级 国家级自然
    									科学基金重点项目</span>
										<span>项目提交审核时间:2017-01-21</span>
									</a>
								</li>
							</ul> -->
							<table id="wating" class="table table-striped table-bordered table-hover" search="true">
						      <thead>
						      	<tr>
						          <th>项目名称</th>
						      	  <th>项目类型编号</th>
						          <th>类型</th>
						          <th>审核状态</th>
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
						          		%>success<%
						          		break;
						          		default:
						          		%>warning<%
						          		break;
						          	}%>" onclick="window.location.href='<%=projectPath%>/template/upload/<%=l.get(i).getCategory()%>Upload.jsp?AchievementId=<%=l.get(i).getID()%>'">					          	
						          	<td><%=l.get(i).getName()%></td>
									<td><%=l.get(i).getID()%></td>
									<%if(l.get(i).getCategory().equals("thesis")){
									%><td>论文</td><%
									}else if(l.get(i).getCategory().equals("eduProject")){
									%><td>教学项目</td><%
									}else if (l.get(i).getCategory().equals("textbook")){
									%><td>教材、论著</td><%
									}else if (l.get(i).getCategory().equals("patent")){
									%><td>专利</td><%
									}else if (l.get(i).getCategory().equals("laws")){
									%><td>法律、法规</td><%
									}else{
									%><td></td><%
									}%>						          	
						          	<% switch(l.get(i).getChecked()){
						          		case -1:
						          		%><td>未通过</td><%
						          		break;
						          		case 0:
						          		%><td>待审核</td><%
						          		break;
						          		case 1:
						          		%><td>已通过</td><%
						          		break;
						          		default:
						          		%><td>异常</td><%
						          		break;
						          	}%>						        	
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
						<div class="nav">
								<h4>请选择科研成果类型</h4>
								<ul>
									<li class="load-item  clearfix">
										<img src="../assets/img/project.png">
										<dic class="item-info" onclick="window.location.href='<%=projectPath%>/template/upload/eduProjectUpload.jsp';">
											<div>课题项目类</div>
											<div>Poject</div>
										</dic>
									</li>
									<li class="load-item  clearfix" >
										<img src="../assets/img/paper.png">
										<dic class="item-info"  onclick="window.location.href='<%=projectPath%>/template/upload/thesisUpload.jsp';">
											<div>论文类</div>
											<div>Thesis</div>
										</dic>
									</li>
									<li class="load-item  clearfix">
										<img src="../assets/img/project.png">
										<dic class="item-info" onclick="window.location.href='<%=projectPath%>/template/upload/textbookUpload.jsp';">
											<div>论著、教材类</div>
											<div>TextBook</div>
										</dic>
									</li>
									<li class="load-item  clearfix">
										<img src="../assets/img/patent.png">
										<dic class="item-info" onclick="window.location.href='<%=projectPath%>/template/upload/patentUpload.jsp';">
											<div>专利</div>
											<div>Patent</div>
										</dic>
									</li>
									<li class="load-item  clearfix">
										<img src="../assets/img/patent.png">
										<dic class="item-info" onclick="window.location.href='<%=projectPath%>/template/upload/lawsUpload.jsp';">
											<div>法律法规类</div>
											<div>Laws and Regulations</div>
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
</body>

</html>

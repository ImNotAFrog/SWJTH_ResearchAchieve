<%@page import="java.util.*,com.SWJTHC.model.AppUser,com.SWJTHC.Dao.UserDao" pageEncoding="UTF-8"%>
<html>
<head>
	<meta charset="utf-8">
	<title>教师主页</title>
	<meta content="width=device-width, initial-scale=1.0" name="viewport">
	<link rel="stylesheet" type="text/css" href="../assets/css/teacher_main.css">
</head>
<%@include file="head_user.jsp"%>
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
						我的科研成果
						<p>待审核</p>
						<p>已通过审核</p>
					</div>
					<div id="loadup"  class="content-item">
						<div class="common-title">上传科研成果
						</div>
						<div class="nav">
								<ul>
									<li class="load-item  clearfix">
										<img src="../assets/img/project.png">
										<dic class="item-info">
											<div>科研项目类</div>
											<div>Research Project</div>
										</dic>
									</li>
									<li class="load-item  clearfix">
										<img src="../assets/img/paper.png">
										<dic class="item-info">
											<div>课题类</div>
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
										<dic class="item-info">
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

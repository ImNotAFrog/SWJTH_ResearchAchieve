<%@page pageEncoding="UTF-8"%>
<% String projectPath=request.getContextPath(); %>
<html>
<head>
	<meta charset="utf-8">
	<title>教师主页</title>
	<meta content="width=device-width, initial-scale=1.0" name="viewport">
	<link rel="stylesheet" type="text/css" href="../assets/css/reset.css">
	<link rel="stylesheet" type="text/css" href="../assets/css/teacher.css">
</head>
<body>
	<!--å¤´é¨åºå-->
	<div id="header">
		<div class="container">
			
			<a class="logo" href="/" target="_self" title="é¦é¡µ">
				<img src="../assets/img/logo2.jpg">
			</a>

			<h3>科研成果管理平台</h3>
			<a id="logout" href="">安全退出</a>
			<div class="image">
				<a href="/user/12"><img src="../assets/img/head.jpg"></a>
			</div>
			<p class="name ellipsis">pardon110</p>
		</div>
		<div class="clearfix">
			
		</div>
	</div>
	<!--å¤´é¨åºåç»æ-->

	<!--åå®¹åºå¼å§-->
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
								<a href="" class="pull-right edit">
									编辑
								</a>
						</div>
						<!-- <div class="line"></div> -->
						<div class="info-box clearfix">
							<label class="pull-left">账号</label>
							<div class="pull-left"> 18280339406</div>
						</div>
						<div class="info-box clearfix">
							<label class="pull-left">昵称</label>
							<div class="pull-left">woodyCheers</div>
						</div>
						<div class="info-box clearfix">
							<label class="pull-left">职位</label>
							<div class="pull-left">讲师</div>
						</div>
						<div class="info-box clearfix">
							<label class="pull-left">性别</label>
							<div class="pull-left"> 男</div>
						</div>
					</div>
					<div id="research" class="content-item">
						我的科研成果
						<p>待审核</p>
						<p>已通过审核</p>
					</div>
					<div id="loadup"  class="content-item">
						<div class="common-title">上传科研成果
							
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
											<div>论文类</div>
											<div>Paper</div>
										</dic>
									</li>
									<li class="load-item  clearfix">
										<img src="../assets/img/project.png">
										<dic class="item-info">
											<div>教材类</div>
											<div>Research Project</div>
										</dic>
									</li>
									<li class="load-item  clearfix">
										<img src="../assets/img/patent.png">
										<dic class="item-info">
											<div>专利</div>
											<div>Patent</div>
										</dic>
									</li>
								</ul>
						</div>
						<div class="re-content">
							<div class="project">
								<h3>填写项目信息</h3>
								<form method="post" action="">
									<div class="form-item">
										<label>项目名称:</label>
										<div class="moco-control-input">
                              				  <input type="text" name="projectName" id="project" autocomplete="off" data-validate="require-nick" class="moco-form-control" value="woodyCheers" placeholder="请输入项目名称...">
                               				 <div class="rlf-tip-wrap errorHint color-red"></div>
                           				 </div>
									</div>
									<div class="form-item">
										<label>项目类型:</label>
										<div class="moco-control-input">
                              				  <select class="moco-form-control rlf-select" name="job" hidefocus="true" id="job" data-validate="require-select">
                                   	 				<option value="">请选择项目类型</option>
                                                    <option value="13">重点项目</option>
                                                    <option value="18">一般项目</option>
                                                    <option value="1">页面重构设计</option>
                                                                           
                                                </select>
                               				 <div class="rlf-tip-wrap errorHint color-red"></div>
                           				 </div>
									</div>
									<div class="form-item">
										<label>立项时间:</label>
										<div class="moco-control-short">
                              				 <!-- <input type="date" value="2015-09-24"/> -->
                              				  <input type="text" name="start-year" id="start-year" autocomplete="off" class="moco-form-year" >
                              					年
                              				<input type="text" name="start-month" id="start-month" autocomplete="off"  class="moco-form-month" >
                              					月
                              			</div>
                              			<label>验收时间:</label>
										<div class="moco-control-short">
                              				 <!-- <input type="date" value="2015-09-24"/> -->
                              				  <input type="text" name="end-year" id="end-year" autocomplete="off" class="moco-form-year" >
                              					年
                              				<input type="text" name="end-month" id="end-month" autocomplete="off" class="moco-form-month" >
                              					月
                               				 <div class="rlf-tip-wrap errorHint color-red"></div>
                           				 </div>
									</div>
									<div class="form-item">
										<label>我在项目中的角色:</label>
										<div class="moco-control-input">
                              				  <select class="moco-form-control rlf-select" name="position" hidefocus="true" id="job" data-validate="require-select">
                                   	 				<option value="">请选择角色</option>
                                                    <option value="13">项目负责人</option>
                                                    <option value="18">项目参与者</option>               
                                                </select>
                               				 <div class="rlf-tip-wrap errorHint color-red"></div>
                           				 </div>
									</div>
									<div class="form-item">
										<label>上传项目材料:&nbsp;&nbsp; <span>(项目立项书、合同、结项书等）</span></label>
										<div class="moco-control-input" style="position: relative;top:12px;">
                              				  <input type="file" name="attachment" id="attachment" autocomplete="off" class="moco-control-file" >
                               				 <div class="rlf-tip-wrap errorHint color-red"></div>
                           				 </div>
									</div>
								</form>
								
							</div>
							科研成果上传表单
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

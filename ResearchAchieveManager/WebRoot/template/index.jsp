<%@ page language="java" import="java.util.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%@include file="head.jsp"%>
<head>
<title>科研成果管理系统</title>
<link rel="stylesheet" type="text/css" href="<%=projectPath%>/assets/css/index.css">
<link rel="stylesheet" type="text/css" href="<%=projectPath%>/assets/css/reset.css">
</head>
<%@page pageEncoding="UTF-8"%>
<body style="position:relative;">
	<nav>
		<div class="wrap">
			<div class="nav-wrap">
				<ul>
					<li>
						<a  class="live" href="">
							首页
						</a>
					</li><!--
				 --><li>
					 	<a href="">
					 		新闻资讯
					 	</a>
				 	</li><!--
				 --><li>
					 	<a href="">
					 		通知公告
					 	</a>
					 </li><!--
				 --><li>
				 		<a href="">
				 			资料下载
				 		</a>
				 	</li>
				</ul>
			</div>
			<div class="research-wrap">
				<div class="research">
					<input type="text" name="">
					<a href="">
						<img src="<%=projectPath%>/assets/img/index/find.png">
					</a>
				</div>
			</div>
		</div>
	</nav>
	<!-- 首页 -->
	<div id="index">
		<!--轮播图-->
		<div class="slider">
			<img id="show" src="<%=projectPath%>/assets/img/index/demo.png" />
			<ul class="select-slider">
				<li>
					<img src="<%=projectPath%>/assets/img/index/select.png" />
				</li>
				<li>
					<img src="<%=projectPath%>/assets/img/index/unselect.png" />
				</li>
				<li>
					<img src="<%=projectPath%>/assets/img/index/unselect.png" />
				</li>
				<li>
					<img src="<%=projectPath%>/assets/img/index/unselect.png" />
				</li>
			</ul>
			<img id="prev" src="<%=projectPath%>/assets/img/index/prev.png">
			<img id="next" src="<%=projectPath%>/assets/img/index/next.png">
		</div>
		<!--内容部分-->
		<div class="news">
			<div class="news-header">
				<div class="news-header-wrap">
					<span>新闻资讯/News</span>
					<a href="">
						<span>更多></span>
					</a>
				</div>
			</div>
			<div class="news-left-side">
				<ul class="show-block">
					<li>
						<a href="">
							<img src="<%=projectPath%>/assets/img/index/newsImg.png" alt="新闻资讯图片" />
							<p>
								携笔从戎&nbsp;&nbsp;|&nbsp;&nbsp;公安消防部队高等专科学校2017年度接收普通高等学校毕业生简章。
							</p>
						</a>					
					</li>
					<li>
						<a href="">
							<img src="<%=projectPath%>/assets/img/index/newsImg.png" alt="新闻资讯图片" />
							<p>
								携笔从戎&nbsp;&nbsp;|&nbsp;&nbsp;公安消防部队高等专科学校2017年度接收普通高等学校毕业生简章。
							</p>
						</a>					
					</li>
					<li>
						<a href="">
							<img src="<%=projectPath%>/assets/img/index/newsImg.png" alt="新闻资讯图片" />
							<p>
								携笔从戎&nbsp;&nbsp;|&nbsp;&nbsp;公安消防部队高等专科学校2017年度接收普通高等学校毕业生简章。
							</p>
						</a>					
					</li>
				</ul>
			</div>
			<div class="news-right-side">
				<ul>
					<li>
						<a href="">
							<img src="<%=projectPath%>/assets/img/index/triangle.png">
							<span>
								新闻资讯新闻资讯新闻资讯新闻资讯
							</span>
						</a>
					</li>
					<li>
						<a href="">
							<img src="<%=projectPath%>/assets/img/index/triangle.png">
							<span>
								新闻资讯新闻资讯新闻资讯新闻资讯
							</span>
						</a>
					</li>
					<li>
						<a href="">
							<img src="<%=projectPath%>/assets/img/index/triangle.png">
							<span>
								新闻资讯新闻资讯新闻资讯新闻资讯
							</span>
						</a>
					</li>
					<li>
						<a href="">
							<img src="<%=projectPath%>/assets/img/index/triangle.png">
							<span>
								新闻资讯新闻资讯新闻资讯新闻资讯
							</span>
						</a>
					</li>
					<li>
						<a href="">
							<img src="<%=projectPath%>/assets/img/index/triangle.png">
							<span>
								新闻资讯新闻资讯新闻资讯新闻资讯
							</span>
						</a>
					</li>
				</ul>
			</div>
		</div>

		<div class="announcement">
			<div class="announcement-header">
				<div class="announcement-header-wrap">
					<span>通知公告/Announcement</span>
					<a href="">
						<span>更多></span>
					</a>
				</div>
			
			</div>
			<div class="announcement-left-side">
				<ul>
					<li>
						<a href="">
							<img src="<%=projectPath%>/assets/img/index/date.png">
							<span>
								通知公告通知公告通知公告通知公告通知公告通知公告通知公告
							</span>
						</a>
					</li>
					<li>
						<a href="">
							<img src="<%=projectPath%>/assets/img/index/date.png">
							<span>
								通知公告通知公告通知公告通知公告通知公告通知公告通知公告
							</span>
						</a>
					</li>
					<li>
						<a href="">
							<img src="<%=projectPath%>/assets/img/index/date.png">
							<span>
								通知公告通知公告通知公告通知公告通知公告通知公告通知公告
							</span>
						</a>
					</li>
					<li>
						<a href="">
							<img src="<%=projectPath%>/assets/img/index/date.png">
							<span>
								通知公告通知公告通知公告通知公告通知公告通知公告通知公告
							</span>
						</a>
					</li>
					<li>
						<a href="">
							<img src="<%=projectPath%>/assets/img/index/date.png">
							<span>
								通知公告通知公告通知公告通知公告通知公告通知公告通知公告
							</span>
						</a>
					</li>
				</ul>
			</div>
			<div class="announcement-right-side">
				<ul>
					<li>
						<a href="">
							<img src="<%=projectPath%>/assets/img/index/date.png">
							<span>
								通知公告通知公告通知公告通知公告通知公告通知公告通知公告
							</span>
						</a>
					</li>
					<li>
						<a href="">
							<img src="<%=projectPath%>/assets/img/index/date.png">
							<span>
								通知公告通知公告通知公告通知公告通知公告通知公告通知公告
							</span>
						</a>
					</li>
					<li>
						<a href="">
							<img src="<%=projectPath%>/assets/img/index/date.png">
							<span>
								通知公告通知公告通知公告通知公告通知公告通知公告通知公告
							</span>
						</a>
					</li>
					<li>
						<a href="">
							<img src="<%=projectPath%>/assets/img/index/date.png">
							<span>
								通知公告通知公告通知公告通知公告通知公告通知公告通知公告
							</span>
						</a>
					</li>
					<li>
						<a href="">
							<img src="<%=projectPath%>/assets/img/index/date.png">
							<span>
								通知公告通知公告通知公告通知公告通知公告通知公告通知公告
							</span>
						</a>
					</li>
				</ul>
			</div>
		</div>
	</div>
	<!-- 登录 -->
	<!-- 新闻资讯 -->
	<div id="newspage">
		<div class="news-content-wrap">
			<div class="newsInfo">
				<h4>
					新闻资讯
				</h4>
				<div class="newsInfo-content"></div>
			</div>
		</div>
	</div>	
<script type="text/javascript" src="<%=projectPath%>/assets/js/index.js"></script>
<%@include file="copyright.jsp"%>
 </body>
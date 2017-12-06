<%@page pageEncoding="UTF-8"%>

<%@include file="head.jsp"%>
	<div class="news">
		<div class="icon">
			
		</div>
		<div class="content-title">
			<h2>新闻/<span class="en-title">News</span></h2>
			<a href="#">更多&nbsp;&nbsp;&gt;</a>
		</div>
		<div class="clear-fix">
			
		</div>
		<!--轮播图模块-->
		<div class="slide-box">
			<div class="slide">
				<img src="images/slide2.jpg">
				<div class="slide-info">
					<div class="info-title">我校11项成果获四川省第十七次社会科学优秀成果奖</div>
					<div class="date">2017.05.11</div>
					<div class="content">5 月23日，德阳市副市长李成金一行来校调研，副校长杨晓波会见来宾。双方就校地产学研合作进行了重点研讨。 德阳市政府</div>
					<a class="detail" href="#">查看详情</a>
				</div>
			</div>
			<div class="banner-dots">
				<span class=""></span>
				<span class="active"></span>
				<span class="">
			</div>

			<!--前后的箭头-->
			<a class="anchor" href="" id ="prev"></a>
			<a class="anchor" href="" id="next"></a>
		</div>
	</div>

	<!--News 新闻区域结束-->

	<!--通知公告开始-->
		<div class="announce">
			<div class="icon">
			
		</div>
		<div class="content-title">
			<h2>通知公告/<span class="en-title">Announcement
			</span></h2>
		</div>
		</div>
<jsp:include page="copyright.jsp" flush="false"/> 
<jsp:forward page="Forward.jsp">
	<jsp:param name="username" value="admin"/>
</jsp:forward>
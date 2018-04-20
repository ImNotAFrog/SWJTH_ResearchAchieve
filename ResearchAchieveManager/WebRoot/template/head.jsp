<%@ page language="java" import="java.util.*,java.net.*,com.SWJTHC.model.AppUser,com.SWJTHC.Dao.UserDao" contentType="text/html;charset=UTF-8" %>
<% String projectPath = request.getContextPath();
	boolean isLogin = false;
	String role =null;	
	AppUser u = new AppUser();
	try{
		role= request.getSession().getAttribute("role").toString();
	}catch(Exception e){
	}
	if(request.getSession().getAttribute("username")!=null){
		u = (UserDao.getUserByUsername(request.getSession().getAttribute("username").toString())).get(0);
	}
 %>
<html>
<link rel="stylesheet" type="text/css" href="<%=projectPath%>/assets/css/reset.css">
<link rel="stylesheet" type="text/css" href="<%=projectPath%>/assets/css/index.css">
<link rel="stylesheet" type="text/css" href="<%=projectPath%>/assets/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="<%=projectPath%>/assets/js/jquery-ui/jquery-ui.min.css">
<div class="header">
		<div class="wrap">
			<div class="img-contain">
				<a href="<%=projectPath%>/template/login.jsp">
					<img src="<%=projectPath%>/assets/img/index/logo.png">
				</a>
			</div>
			<%
				    	//判断session是否登录
	    	try{
		    	String username =request.getSession().getAttribute("username").toString();
		    	if(username!=null&&username.length()>0){
		    		isLogin = true;
			    	}
	    	}catch(Exception e){
	    	}
		    if(!isLogin){
			%>		
			<div class="unlogin">
				<a class="text-link" id="js-signin" href="<%=projectPath%>/template/login.jsp">
					<span class="login">
						登录
					</span>
				</a>
			</div>	
			<%}else{
			 %>
			 <div class="logined">
				<div class="portrait-wrap">
					<img class="portrait" src="<%=projectPath%>/assets/img/login/portrait.png" />
				</div>
				<div class="user-center">
					<div class="user-center-wrap">
						<div class="user-header">
							<img src="<%=projectPath%>/assets/img/login/portrait.png">
							<span><%=u.getName() %></span>	
						</div>
						<div class="user-body">
							<a href="<%=projectPath%>/template/<%=role%>.jsp">个人信息</a>
							<a href="javascript:confirmLogout()">安全退出</a>
						</div>
					</div>
				</div>
			</div>
			 <%}
			  %>
		</div>

</div>

<script src="<%=projectPath %>/assets/js/jquery-1.11.1.js"></script>   
<script src="<%=projectPath %>/assets/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=projectPath%>/assets/js/jquery-ui/jquery-ui.min.js"></script>
<script type="text/javascript" src="<%=projectPath%>/assets/js/header.js"></script>
<script type="text/javascript">  
    function confirmLogout(){  
            if(confirm("确认退出?")){  
            window.location="<%=projectPath %>/services/LogoutServlet";
            }  
    }  
    jQuery(function($){ 
          $.datepicker.regional['zh-CN'] = {
              clearText: '清除', 
              clearStatus: '清除已选日期', 
              closeText: '关闭', 
              closeStatus: '不改变当前选择', 
              prevText: '< 上月', 
              prevStatus: '显示上月', 
              prevBigText: '<<', 
              prevBigStatus: '显示上一年', 
              nextText: '下月>', 
              nextStatus: '显示下月', 
              nextBigText: '>>', 
              nextBigStatus: '显示下一年', 
              currentText: '今天', 
              currentStatus: '显示本月', 
              monthNames: ['一月','二月','三月','四月','五月','六月', '七月','八月','九月','十月','十一月','十二月'], 
              monthNamesShort: ['一月','二月','三月','四月','五月','六月', '七月','八月','九月','十月','十一月','十二月'], 
              monthStatus: '选择月份', 
              yearStatus: '选择年份', 
              weekHeader: '周', 
              weekStatus: '年内周次', 
              dayNames: ['星期日','星期一','星期二','星期三','星期四','星期五','星期六'], 
              dayNamesShort: ['周日','周一','周二','周三','周四','周五','周六'], 
              dayNamesMin: ['日','一','二','三','四','五','六'], 
              dayStatus: '设置 DD 为一周起始', 
              dateStatus: '选择 m月 d日, DD', 
              dateFormat: 'yy-mm-dd', 
              firstDay: 1, 
              initStatus: '请选择日期', 
              isRTL: false}; 
          $.datepicker.setDefaults($.datepicker.regional['zh-CN']); 
      });
</script>
</html>
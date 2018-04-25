<%@page import="java.util.*,com.SWJTHC.model.*,com.SWJTHC.Dao.*,com.SWJTHC.enums.Department" pageEncoding="UTF-8"%>

<html>
<%@include file="head.jsp"%>
<head>
	<meta charset="utf-8">
	<title>管理员主页</title>
	<meta content="width=device-width, initial-scale=1.0" name="viewport">
	<link rel="stylesheet" type="text/css" href="../assets/css/teacher_main.css">
	<link rel="stylesheet" type="text/css" href="../assets/css/bootstrap-table.min.css">
	<link rel="shortcut icon " type="images/x-icon" href="<%=projectPath%>/assets/img/logo-2.png">
</head>

<% 	
	List<UserAchievement> l = UserAchievementDao.getAchievementByUsername(u.getUsername());
	List<UserAchievement> all = UserAchievementDao.getAchievementList();
	List<UserAchievement> approval=new ArrayList();
	List<UserAchievement> pending=new ArrayList();
	List<UserAchievement> uploaded=new ArrayList();
	List<UserAchievement> denied=new ArrayList();
	for(int i=0;i<all.size();i++){
		if(all.get(i).getDepartment().equals(u.getDepartment())&&all.get(i).getSubDepartment().equals(u.getSubDepartment())){		
			switch(all.get(i).getChecked()){
				case -1:
					denied.add(all.get(i));
				break;
				case 0:
					pending.add(all.get(i));
				break;
				case 1:
					uploaded.add(all.get(i));
				break;
				case 2:
					approval.add(all.get(i));
				break;
			}
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
							<span>已上报成果</span>
							<span class="icon">&gt;</span>
						</a>
					</li>
					<li>
						<a href="#">
							<span>未通过成果</span>
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
								<p class="state">按类别查看</p>
								<select hidefocus="true" id="approvalFilter" onchange="filterByCategory(this)">
									<option value="">所有</option>
									<option value="论文">论文</option>
									<option value="教改项目">教改项目</option>
									<option value="课题项目">课题项目</option>
									<option value="专利">专利</option>
									<option value="教材、著作">教材、著作</option>
								</select>
								<table id="approvalTable" class="table table-striped table-bordered" data-toggle="table" data-pagination="true" data-height="516" data-search="true">
							      <thead>
							          <th>成果名称</th>
							          <th>类型</th>
							          <th>提交人</th>
							          <th>成果得分</th>						          
							          <th>操作</th>
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
								          	<td><button type="button" class="btn btn-xs btn-info" onclick="window.location.href='<%=projectPath%>/template/upload/<%=approval.get(i).getCategory()%>Upload.jsp?AchievementId=<%=approval.get(i).getID()%>&state=VIEW'">详情</button></td>						        	
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
								<p class="state">按类别查看</p>
								<select hidefocus="true" id="pendingFilter" onchange="filterByCategory(this)">
									<option value="">所有</option>
									<option value="论文">论文</option>
									<option value="教改项目">教改项目</option>
									<option value="课题项目">课题项目</option>
									<option value="专利">专利</option>
									<option value="教材、著作">教材、著作</option>
								</select>
								<table id="pendingTable" class="table table-striped table-bordered" data-toggle="table" data-pagination="true" data-height="516" data-search="true">
							      <thead>
							          <th>成果名称</th>
							          <th>类型</th>
							          <th>提交人</th>
							          <th>自评得分</th>
							          <th>操作</th>
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
								          	<td><button type="button" class="btn btn-xs btn-info" onclick="window.location.href='<%=projectPath%>/template/upload/<%=pending.get(i).getCategory()%>Upload.jsp?AchievementId=<%=pending.get(i).getID()%>&state=EXAMING'">详情</button></td>				        	
								      </tr>
								      <%
								      	}
								       %>	
							       </tbody>
							    </table>
							</div>
						</div>
					</div>
					<div id="uploaded" class="content-item">
						<div class="list">
							<div class="common-title">成果列表</div>
							<div class="uploaded">
								<p class="state">按类别查看</p>
								<select hidefocus="true" id="uploadedFilter" onchange="filterByCategory(this)">
									<option value="">所有</option>
									<option value="论文">论文</option>
									<option value="教改项目">教改项目</option>
									<option value="课题项目">课题项目</option>
									<option value="专利">专利</option>
									<option value="教材、著作">教材、著作</option>
								</select>
								<table id="uploadedTable" class="table table-striped table-bordered" data-toggle="table" data-pagination="true" data-height="516" data-search="true">
							      <thead>
							          <th>成果名称</th>
							          <th>类型</th>
							          <th>提交人</th>
							          <th>自评得分</th>
							          <th>操作</th>
							        </tr>
							      </thead>
							      <tbody>
							        <% for(int i=0;i<uploaded.size();i++){
								      %>
								      <tr class="warning" onclick="window.location.href='<%=projectPath%>/template/upload/<%=uploaded.get(i).getCategory()%>Upload.jsp?AchievementId=<%=uploaded.get(i).getID()%>'">					          	
								          	<td><%=uploaded.get(i).getName()%></td>
											<%if(uploaded.get(i).getCategory().equals("thesis")){
											%><td>论文</td><%
											}else if(uploaded.get(i).getCategory().equals("eduProject")){
											%><td>课题项目</td><%
											}else if (uploaded.get(i).getCategory().equals("textbook")){
											%><td>教材、论著</td><%
											}else if (uploaded.get(i).getCategory().equals("patent")){
											%><td>专利</td><%
											}else if (uploaded.get(i).getCategory().equals("laws")){
											%><td>法律、法规</td><%
											}else{
											%><td>教改项目</td><%
											}%>						          	
								          	<td><%=uploaded.get(i).getUsername()%></td>		
								          	<td><%=uploaded.get(i).getScore()%></td>	
								          	<td><button type="button" class="btn btn-xs btn-info" onclick="window.location.href='<%=projectPath%>/template/upload/<%=uploaded.get(i).getCategory()%>Upload.jsp?AchievementId=<%=uploaded.get(i).getID()%>&state=REVIEW'">详情</button></td>				        	
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
								<p class="state">按类别查看</p>
								<select hidefocus="true" id="deniedFilter" onchange="filterByCategory(this)">
									<option value="">所有</option>
									<option value="论文">论文</option>
									<option value="教改项目">教改项目</option>
									<option value="课题项目">课题项目</option>
									<option value="专利">专利</option>
									<option value="教材、著作">教材、著作</option>
								</select>
								<table id="deniedTable" class="table table-striped table-bordered" data-toggle="table" data-pagination="true" data-height="516" data-search="true">
							      <thead>
							          <th>成果名称</th>
							          <th>类型</th>
							          <th>提交人</th>
							          <th>自评得分</th>
							          <th>操作</th>
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
								          	<td><button type="button" class="btn btn-xs btn-info" onclick="window.location.href='<%=projectPath%>/template/upload/<%=denied.get(i).getCategory()%>Upload.jsp?AchievementId=<%=denied.get(i).getID()%>&state=REVIEW'">详情</button></td>			        	
								      </tr>
								      <%
								      	}
								       %>	
							       </tbody>
							    </table>
							</div>
						</div>
					</div>	
					
			</div>
		</div>
		</div>
	</div>
	<!--内容区域结束-->
	<script type="text/javascript" src="<%=projectPath %>/assets/js/main.js"></script>
	<script type="text/javascript" src="<%=projectPath %>/assets/js/bootstrap-table.min.js"></script>
	<script>
	function goPersonalRank(){
		var startDate=document.getElementById("startDate");
		var endDate=document.getElementById("endDate");
		window.location.href="<%=projectPath%>/template/ranking/indivRanking.jsp?startDate="+startDate.value+"&endDate="+endDate.value;
	}
	function goDepartmentRank(){
		var startDate=document.getElementById("startDate");
		var endDate=document.getElementById("endDate");
		var department=document.getElementById("department");
		window.location.href="<%=projectPath%>/template/ranking/departRanking.jsp?startDate="+startDate.value+"&endDate="+endDate.value+"&department="+department.value;
	}
	$(function(){
		
		  var approvalFilter = document.getElementById("approvalFilter"); 
		  var pendingFilter = document.getElementById("pendingFilter"); 
		  var deniedFilter = document.getElementById("deniedFilter"); 
		  pendingFilter.selectedIndex = getCookie('pendingFilter');
		  approvalFilter.selectedIndex = getCookie('approvalFilter');
		  deniedFilter.selectedIndex = getCookie('deniedFilter');
		  if(getCookie('approvalFilter')=='0'){
		  	$('#deniedTable').bootstrapTable('filterBy', {});
		  }else{
		  	$('#approvalTable').bootstrapTable('filterBy', { 1:approvalFilter.value});
		  }
		  
  		  if(getCookie('pendingFilter')=='0'){
		  	$('#deniedTable').bootstrapTable('filterBy', {});
		  }else{
		  	$('#pendingTable').bootstrapTable('filterBy', { 1:pendingFilter.value});
		  }
		  
   		  if(getCookie('deniedFilter')=='0'){
		 	 $('#deniedTable').bootstrapTable('filterBy', {});
		  }else{
		  	$('#deniedTable').bootstrapTable('filterBy', { 1:deniedFilter.value});
		  }	
		   $( "#startDate" ).datepicker({
   		  	  dateFormat: "yy-mm-dd",
              showOtherMonths: true,
              selectOtherMonths: true,
              showButtonPanel: true,
              showOn: "both",
              buttonImageOnly: true,
              buttonText: "",
              changeMonth: true,
              changeYear: true
          });	 
           $( "#endDate" ).datepicker({
   		  	  dateFormat: "yy-mm-dd",
              showOtherMonths: true,
              selectOtherMonths: true,
              showButtonPanel: true,
              showOn: "both",
              buttonImageOnly: true,
              buttonText: "",
              changeMonth: true,
              changeYear: true
          });  
          
	});
	$(function(){
		<%if(u.getName()==null){%>
				alert("请先完善个人资料");
				window.location.href="<%=projectPath %>/template/editUser.jsp";
			<%}%>
		}
	)
	function filterByCategory(ele){
		var tableName=ele.id.replace('Filter','');
		if(ele.value==""){
			$('#'+tableName+'Table').bootstrapTable('filterBy', {});
		}else{
		 $('#'+tableName+'Table').bootstrapTable('filterBy', { 1:ele.value});
		 }
		 addCookie(ele.id,ele.selectedIndex,1);
	}
	
	 function getCookie(NameOfCookie)
	    {
	        var arrStr = document.cookie.split("; ");
	        for(var i = 0;i < arrStr.length;i ++){
	            var temp = arrStr[i].split("=");
	            //alert(temp);
	            if(temp[0] == NameOfCookie) 
	                return unescape(temp[1]);
	        }
	        return "0";
	    }

	function addCookie(NameOfCookie,objValue,expiredays)
    {
        
        //var tmp = typeof(oldCookie);
        //alert(tmp);
        //需要设置过期时长，否则关闭浏览器就会清除cookie
        var exp = new Date();
        exp.setTime(exp.getTime() + expiredays*24*60*60*1000);
        var expires = "expires="+exp.toUTCString();
        //alert(expires);
        document.cookie = NameOfCookie+"="+objValue+";"+ expires;
    }

	</script>
</body>
<%@include file="copyright.jsp"%>
</html>

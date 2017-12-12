<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
   <%@include file="../head_user.jsp"%> 
   <% Patent p = new Patent();
   if(request.getParameter("AchievementId")!=null){
   	p=PatentDao.getPatentById(Integer.parseInt(request.getParameter("AchievementId")));
   } %>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'patentUpload.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

	<link href="<%=projectPath%>/assets/css/uploadForm.css" rel="stylesheet">

  </head>
  
  <body>
<!--用户 基本信息的编辑-->
	<div class="container upload">
	    <div class="row">
	        <div class="col-md-8 col-md-offset-2">
						<!--专利和软件著作权-->
							<div class="re-item">
								
									<h3>请填写专利或软件著作权信息</h3>
									<a href="<%=projectPath%>/template/teacher.jsp" class="moco-modal-close"></a>
									<form method="post" action="<%=projectPath%>/services/PatentUpload" onsubmit="confirmSubmit()">
									<%if(request.getParameter("AchievementId")!=null){%>
									<input name="ID" type="hidden" value="<%=request.getParameter("AchievementId")%>" />
									<%}%>
										<div class="form-item">
											<label for="patentName">名称:</label>
											<div class="moco-control-input">
	                              				  <input type="text" name="patentName" id="patentName" autocomplete="off" class="moco-form-control" value="<%=p.getName() %>" placeholder="请输入专利、软件著作名称...">
	                               				 <div class="rlf-tip-wrap errorHint color-red"></div>
	                           				 </div>
										</div>
										<div class="form-item">
											<label>类型:</label>
											<div class="moco-control-input">
                              				  <select class="moco-form-control rlf-select" name="category" hidefocus="true" id="category" data-validate="require-select">
                                   	 				<option value="1" <%if(p.getCategory().equals("1")){%>selected="true"<%}%>>发明专利</option>
                                                    <option value="2" <%if(p.getCategory().equals("2")){%>selected="true"<%}%>>实用新型专利</option>
                                                    <option value="3" <%if(p.getCategory().equals("3")){%>selected="true"<%}%>>外观设计专利</option> 
                                                    <option value="4" <%if(p.getCategory().equals("4")){%>selected="true"<%}%>>计算机软件著作权</option>                                                                               
                                                </select>
                               				 <div class="rlf-tip-wrap errorHint color-red"></div>
                           					 </div>
										</div>
										<div class="form-item">
											<label for="patentName">专利编号:</label>
											<div class="moco-control-input">
	                              				  <input type="text" name="patentNum" id="patentNum" autocomplete="off" class="moco-form-control" value="<%=p.getPatentNum() %>" placeholder="请输入专利编号...">
	                               				 <div class="rlf-tip-wrap errorHint color-red"></div>
	                           				 </div>
										</div>
										<div class="form-item">
											<label for="patentHolder">专利发明人:</label>
											<div class="moco-control-input">
	                              				  <input type="text" name="patentHolder" id="patentHolder" autocomplete="off" class="moco-form-control" value="<%=p.getPatentHolder() %>" placeholder="请输入专利发明人...">
	                               				 <div class="rlf-tip-wrap errorHint color-red"></div>
	                           				 </div>
										</div>
										<div class="form-item">
											<label for="patentName">授权公告日期:</label>
											<div class="moco-control-input">
	                              				  <input type="text" name="patentDate" id="patentDate" autocomplete="off" class="moco-form-control" value="<%if(p.getPatentDate()!=null){%><%=p.getPatentDate()%><%}%>">
	                               				 <div class="rlf-tip-wrap errorHint color-red"></div>
	                           				 </div>
										</div>
										<!--附件-->
										<div class="form-item">
										<label>上传附件:&nbsp;&nbsp; </label>
										<div class="moco-control-input" style="position: relative;top:12px;">
                              				  <input type="file" name="attachment" id="attachment" autocomplete="off" class="moco-control-file" >
                               				 <div class="rlf-tip-wrap errorHint color-red"></div>
                           					 </div>
										</div>
										<%if(request.getParameter("AchievementId")!=null&&p.getChecked()!=1){%>						
										<button type="submit" class="btn btn-primary submit" style="opacity: 0.75">提交更新</button>
										<button class="btn btn-default btn-warning" type="reset">撤销修改</button>
										<button class="btn btn-default btn-danger" type="button" onclick="deleteAchievement(<%=p.getID()%>)">删除</button>		
										<%}else if(request.getParameter("AchievementId")==null){%>
										<button type="submit" class="btn btn-primary submit" style="opacity: 0.75">提交</button>
										<button class="btn btn-default btn-warning" type="reset">重置</button>
										<%}%>						
										<button type="button"class="btn btn-default" onclick="window.history.back(-1);">返回</button>
									</form>
								
							</div>
	        </div>
	    </div>
	</div>
  </body>
	<script>
	  $(function() {
	    $( "#patentDate" ).datepicker({dateFormat: "yy-mm-dd"});
	  });
	  function confirmSubmit(){
		if(!confirm("提交后成果将置为待审核状态，确认提交?")){  
			return false;
		}
	}
	function deleteAchievement(ID){
		if(confirm("确认删除成果?")){
		 $.ajax({
                url: "<%=projectPath%>/services/PatentUpload?deleteAchievement="+ID,
                 dataType: 'json',
                 method: 'GET',
                 success: function(data) {
                    if (data.result == 1) {
                         alert("删除成功！");
                         window.location="<%=projectPath%>/template/teacher.jsp";
                    }
                },
                 error: function(xhr) {
                     // 导致出错的原因较多，以后再研究
                     alert('error:' + JSON.stringify(xhr));
                 }
             })
		}	 
	}
	</script>
</html>

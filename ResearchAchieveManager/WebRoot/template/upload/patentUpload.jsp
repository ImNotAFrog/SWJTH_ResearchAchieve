<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
   <%@include file="../head_user.jsp"%> 
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
									<form method="post" action="<%=projectPath%>/services/PatentUpload">
										<div class="form-item">
											<label for="patentName">名称:</label>
											<div class="moco-control-input">
	                              				  <input type="text" name="patentName" id="patentName" autocomplete="off" class="moco-form-control" value="" placeholder="请输入专利、软件著作名称...">
	                               				 <div class="rlf-tip-wrap errorHint color-red"></div>
	                           				 </div>
										</div>
										<div class="form-item">
											<label>类型:</label>
											<div class="moco-control-input">
                              				  <select class="moco-form-control rlf-select" name="category" hidefocus="true" id="category" data-validate="require-select">
                                   	 				<option value="1">发明专利</option>
                                                    <option value="2">实用新型专利</option>
                                                    <option value="3">外观设计专利</option> 
                                                    <option value="4">计算机软件著作权</option>                                                                               
                                                </select>
                               				 <div class="rlf-tip-wrap errorHint color-red"></div>
                           					 </div>
										</div>
										<div class="form-item">
											<label for="patentName">专利编号:</label>
											<div class="moco-control-input">
	                              				  <input type="text" name="patentNum" id="patentNum" autocomplete="off" class="moco-form-control" value="" placeholder="请输入专利、软件著作名称...">
	                               				 <div class="rlf-tip-wrap errorHint color-red"></div>
	                           				 </div>
										</div>
										<div class="form-item">
											<label for="patentHolder">专利发明人:</label>
											<div class="moco-control-input">
	                              				  <input type="text" name="patentHolder" id="patentHolder" autocomplete="off" class="moco-form-control" value="" placeholder="请输入专利权利人...">
	                               				 <div class="rlf-tip-wrap errorHint color-red"></div>
	                           				 </div>
										</div>
										<div class="form-item">
											<label for="patentName">授权公告日期:</label>
											<div class="moco-control-input">
	                              				  <input type="text" name="patentDate" id="patentDate" autocomplete="off" class="moco-form-control" value="" placeholder="请输入专利、软件著作名称...">
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
										<button type="submit" class="btn btn-primary submit" style="opacity: 0.75">提交</button>
										<button class="btn btn-default reset" type="reset"> reset </button>
									</form>
								
							</div>
	        </div>
	    </div>
	</div>
  </body>
	<script>
	  $(function() {
	    $( "#patentDate" ).datepicker();
	  });
	</script>
</html>

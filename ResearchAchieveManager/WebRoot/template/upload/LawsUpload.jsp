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
    
    <title>My JSP 'laswsUpload.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="<%=projectPath%>/assets/css/uploadForm.css" rel="stylesheet">

  </head>
  
  <body>
<div class="container upload">
	    <div class="row">
	        <div class="col-md-8 col-md-offset-2">
				
				<!--法规-->
							<div class="re-item">
								
									<h3>请填写法规信息</h3>
									<a href="<%=projectPath%>/template/teacher.jsp" class="moco-modal-close"></a>
									<form method="post" action="<%=projectPath%>/services/LawsUpload">
										<div class="form-item">
											<label for="lawName">法规名称:</label>
											<div class="moco-control-input">
	                              				  <input type="text" name="lawName" id="lawName" autocomplete="off" class="moco-form-control" value="" placeholder="请输入法规名称...">
	                               				 <div class="rlf-tip-wrap errorHint color-red"></div>
	                           				 </div>
										</div>
										<div class="form-item">
											<label for="lawNumber">法规编号:</label>
											<div class="moco-control-input">
	                              				  <input type="text" name="lawNumber" id="lawNumber" autocomplete="off" class="moco-form-control" value="" placeholder="请输入法规编号...">
	                               				 <div class="rlf-tip-wrap errorHint color-red"></div>
	                           				 </div>
										</div>
										<div class="form-item">
											<label>级别:</label>
											<div class="moco-control-input">
                              				  <select class="moco-form-control rlf-select" name="lawLevel" hidefocus="true" id="lawLevel" data-validate="require-select">
                                   	 				<option value="3">省级</option>
                                                    <option value="2">国家普通</option>
                                                    <option value="1">国家核心</option>                              
                                                </select>
                               				 <div class="rlf-tip-wrap errorHint color-red"></div>
                           					 </div>
										</div>
										<div class="form-item">
											<label>类别:</label>
											<div class="moco-control-input">
                              				  <select class="moco-form-control rlf-select" name="category" hidefocus="true" id="category" data-validate="require-select">
                                   	 				<option value="3">标准规范</option>
                                                    <option value="2">法规、规章</option>
                                                    <option value="1">法律</option>                              
                                                </select>
                               				 <div class="rlf-tip-wrap errorHint color-red"></div>
                           					 </div>
										</div>
										<div class="form-item">
											<label for="chiefEditor">主编:</label>
											<div class="moco-control-input">
	                              				  <input type="text" name="chiefEditor" id="chiefEditor" autocomplete="off" class="moco-form-control" value="" placeholder="请输入主编名字...">
	                               				 <div class="rlf-tip-wrap errorHint color-red"></div>
	                           				 </div>
										</div>
										<div class="form-item">
											<label for="editors">参编:</label>
											<div class="moco-control-input">
	                              				  <input type="text" name="editors" id="editors" autocomplete="off" class="moco-form-control" value="" placeholder="请输入参编名字... ，以逗号隔开">
	                               				 <div class="rlf-tip-wrap errorHint color-red"></div>
	                           				 </div>
										</div>
										<div class="form-item">
											<label for="wordsCount">字数:</label>
											<div class="moco-control-input">
	                              				  <input type="text" name="wordsCount" id="wordsCount" autocomplete="off" class="moco-form-control" value="" placeholder="请输入总字数...">
	                               				 <div class="rlf-tip-wrap errorHint color-red"></div>
	                           				 </div>
										</div>
										<div class="form-item">
											<label>上传附件:&nbsp;&nbsp; </label>
											<div class="moco-control-input" style="position: relative;top:12px;">
	                              				  <input type="file" name="attachment" id="attachment" autocomplete="off" class="moco-control-file" >
	                               				 <div class="rlf-tip-wrap errorHint color-red"></div>
	                           				 </div>
										</div>

										<button type="submit" class="btn btn-primary submit" style="opacity: 0.75">提交</button>
										<button class="btn btn-default btn-danger" type="reset">重置</button>
										<button class="btn btn-default" onclick="window.history.back(-1);">返回</button>
									</form>
								
							</div>
	        </div>
	    </div>
  </body>
</html>

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
    
    <title>My JSP 'TextbookUpload.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="<%=projectPath%>/assets/css/uploadForm.css" rel="stylesheet">
  </head>
<!--用户 基本信息的编辑-->
	<div class="container upload">
	    <div class="row">
	        <div class="col-md-8 col-md-offset-2">
			
				<!--教材著作表-->
							<div class="re-item">
								
									<h3>请填写教材著作信息</h3>
									<a href="<%=projectPath%>/template/teacher.jsp" class="moco-modal-close"></a>
									<form method="post" action="<%=projectPath%>/services/TextbookUpload">
										<div class="form-item">
											<label for="textName">名称:</label>
											<div class="moco-control-input">
	                              				  <input type="text" name="textbookName" id="textbookName" autocomplete="off" class="moco-form-control" value="" placeholder="请输入教材名称...">
	                               				 <div class="rlf-tip-wrap errorHint color-red"></div>
	                           				 </div>
										</div>
										
										<div class="form-item">
											<label for="subject">主体与级别:</label>
											<div class="moco-control-input">
	                              				  <select class="moco-form-control rlf-select" name="level" hidefocus="true" id="level" data-validate="require-select">
	                                	 				<option value="1">1.公安消防部队高等专科学校正式出版</option>
	                                                 <option value="2">2.公安消防部队高等专科学校内部印刷</option>
	                                                 <option value="3">3.外单位正式出版</option>                               
	                                             </select>
	                               				 <div class="rlf-tip-wrap errorHint color-red"></div>
	                           				 </div>
										</div>
										<div class="form-item">
			                            	<label for="" class="moco-control-label">作者参与情况：</label>
			                            	<div class="moco-control-input">
				                                <select class="moco-form-control rlf-select" name="authorSituation" hidefocus="true" id="authorSituation" data-validate="require-select">
                                	 				<option value="1">1.主编</option>
	                                                 <option value="2">2.副主编</option>
	                                                 <option value="3">3.参编</option>                               
	                                             </select>
                            				</div>
                        				</div>
                        				<div class="form-item" style="margin-top: 12px;">
			                            	<label for="" class="moco-control-label">出版社：</label>
			                            	<div class="moco-control-input">
				                               <input type="text" name="publishingHouse" id="publishingHouse" autocomplete="off" class="moco-form-control" value="" placeholder="请输入出版社名称...">
				                           
                            				</div>
                        				</div>
                        				<div class="form-item" style="margin-top: 12px;">
			                            	<label for="" class="moco-control-label">ISBN：</label>
			                            	<div class="moco-control-input">
				                                <input type="text" name="ISBN" id="ISBN" autocomplete="off" class="moco-form-control" value="" placeholder="请输入书号...">
				                           
                            				</div>
                        				</div>
                        				<div class="form-item" style="margin-top: 12px;">
			                            	<label for="" class="moco-control-label">出版时间：</label>
			                            	<div class="moco-control-input">
				                                <input type="text" name="publishDate" id="publishDate" autocomplete="off" class="moco-form-control" value="">
				                           
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
	  <script>
  $(function() {
    $( "#publishDate" ).datepicker();
  });
  </script>
</html>

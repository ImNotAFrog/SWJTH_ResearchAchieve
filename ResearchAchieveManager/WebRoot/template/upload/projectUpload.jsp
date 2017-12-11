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
    
    <title>My JSP 'projectUpload.jsp' starting page</title>
    
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
			
				<!--教学改革项目-->
				<div class="re-item">
					
					<h3>请填写教学改革项目信息</h3>
					<a href="<%=projectPath%>/template/teacher.jsp" class="moco-modal-close"></a>
					<form method="post" action="<%=projectPath%>/services/ProjectUpload">
						<div class="form-item">
							<label for="projectName">项目名称:</label>
							<div class="moco-control-input">
                           				  <input type="text" name="projectName" id="projectName" autocomplete="off" class="moco-form-control" value="" placeholder="请输入项目名称...">
                            				 <div class="rlf-tip-wrap errorHint color-red"></div>
                        				 </div>
						</div>
						
						<div class="form-item">
							<label for="groupLeader">组长:</label>
							<div class="moco-control-input">
                           				  <input type="text" name="groupLeader" id="groupLeader" autocomplete="off" class="moco-form-control" value="" placeholder="请输入组长...">
                            				 <div class="rlf-tip-wrap errorHint color-red"></div>
                        				 </div>
						</div>
						<div class="form-item">
							<label for="members">成员:</label>
							<div class="moco-control-input">
                           				  <input type="text" name="members" id="members" autocomplete="off" class="moco-form-control" value="" placeholder="请输入成员...">
                            				 <div class="rlf-tip-wrap errorHint color-red"></div>
                        				 </div>
						</div>
						<div class="form-item">
							<label for="projectLevel">项目级别:</label>
							<div class="moco-control-input">
                           				  <select class="moco-form-control rlf-select" name="projectLevel" hidefocus="true" id="projectLevel" data-validate="require-select">
	                           	 				<option value="1">公安消防部队高等专科学校：国家级</option>
	                                            <option value="2">公安消防部队高等专科学校：省部级</option>
	                                            <option value="3">公安消防部队高等专科学校：校级</option> 
	                                            <option value="4">外单位项目：国家级</option>   
	                                            <option value="5">外单位项目：省部级</option>   
	                                            <option value="6">外单位项目：校级</option>                                                                               
	                                        </select>
                     				 <div class="rlf-tip-wrap errorHint color-red"></div>
               				 </div>
						</div>
						<div class="form-item">
							<label for="subject">项目主体名称:</label>
							<div class="moco-control-input">
                           				  <input type="text" name="subject" id="subject" autocomplete="off" class="moco-form-control" value="" placeholder="如：消防局科研项目...">
                            				 <div class="rlf-tip-wrap errorHint color-red"></div>
                        				 </div>
						</div>
						<div class="form-item">
							<label for="state">项目状态:</label>
							<div class="moco-control-input">
								<select class="moco-form-control rlf-select" name="state" hidefocus="true" id="state" data-validate="require-select">
	               	 				<option value="通过验收">通过验收</option>
	                                <option value="立项在研">立项在研</option>                                                                           
	                            </select>	                          
               				 <div class="rlf-tip-wrap errorHint color-red"></div>
           				 </div>
						</div>
						<div class="form-item">
							<label for="stateDate">时间:</label>
							<div class="moco-control-input">
	                            <input type="text" name="stateDate" id="stateDate" autocomplete="off" class="moco-form-control" value="" >
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
  <script type="text/javascript">
   $(function() {
    $( "#stateDate" ).datepicker();
  });
  </script>   
</html>

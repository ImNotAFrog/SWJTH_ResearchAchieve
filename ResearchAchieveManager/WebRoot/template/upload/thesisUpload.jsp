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
    
    <title>My JSP 'thesisUpload.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="<%=projectPath%>/assets/css/reset.css">
	<link href="<%=projectPath%>/assets/css/uploadForm.css" rel="stylesheet">
  </head>

  <body>
<div class="container upload">
	    <div class="row">
	        <div class="col-md-8 col-md-offset-2">
			
				<!--论文-->
				<div class="re-item">
					
						<h3>请填写论文信息</h3>
						<a href="<%=projectPath%>/template/teacher.jsp" class="moco-modal-close"></a>
						<form method="post" action="<%=projectPath%>/services/ThesisUpload">
							<div class="form-item">
								<label for="thesisName">论文名称:</label>
								<div class="moco-control-input">
                            				  <input type="text" name="thesisName" id="thesisName" autocomplete="off" class="moco-form-control" value="" placeholder="请论文名称...">
                             				 <div class="rlf-tip-wrap errorHint color-red"></div>
                         				 </div>
							</div>
							<div class="form-item">
								<label>刊物级别:</label>
								<div class="moco-control-input">
                           				  <select class="moco-form-control rlf-select" name="journalLevel" hidefocus="true" id="journalLevel" data-validate="require-select">
                                	 				<option value="1">1.《Science》、《Nature》及其子刊《Cell》</option>
                                                 <option value="2">2.SCI收录</option>
                                                 <option value="3">3.EI（JA）、SSCI、A&HCI收录</option>   
                                                 <option value="4">4.EI（CA）、CPCI</option>   
                                                 <option value="5">5.EI（JA）、SSCI、A&HCI收录</option>   
                                                 <option value="6">6.核心刊物正刊(含北大核心期刊、CSCD、CSSCI、RCCSE)</option>   
                                                 <option value="7">7.《武警学院学报》、《消防技术与产品信息》、全国性或行业性学会论文集（一等奖）、国际会议论文集</option>   
                                                 <option value="8">8.专业期刊（正刊）、全国性或行业性学会论文集（二等奖）、《消防科学与技术》增刊、《武警学院学报》增刊、《消防技术与产品信息》增刊</option>
                                                 <option value="9">9.一般期刊、其它增刊、其它论文集、校刊</option>                                
                                             </select>
                            				 <div class="rlf-tip-wrap errorHint color-red"></div>
                        					 </div>
							</div>
							<div class="form-item">
								<label for="chiefEditor">发表刊物:</label>
								<div class="moco-control-input">
                            				  <input type="text" name="journalName" id="journalName" autocomplete="off" class="moco-form-control" value="" placeholder="请输入发表刊物...">
                             				 <div class="rlf-tip-wrap errorHint color-red"></div>
                         				 </div>
							</div>
							<div class="form-item">
								<label for="chiefEditor">刊号:</label>
								<div class="moco-control-input">
                            				  <input type="text" name="journalNum" id="journalNum" autocomplete="off" class="moco-form-control" value="" placeholder="请输入发表刊物...">
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
	</div>
  </body>
</html>

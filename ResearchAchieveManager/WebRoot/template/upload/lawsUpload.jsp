<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
   <%@include file="../head_user.jsp"%> 
   <% Laws l = new Laws();
   if(request.getParameter("AchievementId")!=null){
   	l=LawsDao.getLawById(Integer.parseInt(request.getParameter("AchievementId")));
   } %>
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
									<form method="post" action="<%=projectPath%>/services/LawsUpload" onsubmit="confirmSubmit()">
										<%if(request.getParameter("AchievementId")!=null){%>
										<input name="ID" type="hidden" value="<%=request.getParameter("AchievementId")%>" />
										<%}%>
										<div class="form-item">
											<label for="lawName">法规名称:</label>
											<div class="moco-control-input">
	                              				  <input type="text" name="lawName" id="lawName" autocomplete="off" class="moco-form-control" value="<%=l.getName() %>" placeholder="请输入法规名称...">
	                               				 <div class="rlf-tip-wrap errorHint color-red"></div>
	                           				 </div>
										</div>
										<div class="form-item">
											<label for="lawNumber">法规编号:</label>
											<div class="moco-control-input">
	                              				  <input type="text" name="lawNumber" id="lawNumber" autocomplete="off" class="moco-form-control" value="<%=l.getLawNumber() %>" placeholder="请输入法规编号...">
	                               				 <div class="rlf-tip-wrap errorHint color-red"></div>
	                           				 </div>
										</div>
										<div class="form-item">
											<label>级别:</label>
											<div class="moco-control-input">
                              				  <select class="moco-form-control rlf-select" name="lawLevel" hidefocus="true" id="lawLevel" data-validate="require-select">
                                   	 				<option value="3"<%if(l.getLevel().equals("3")){%>selected="true"<%}%>>省级</option>
                                                    <option value="2"<%if(l.getLevel().equals("2")){%>selected="true"<%}%>>国家普通</option>
                                                    <option value="1"<%if(l.getLevel().equals("1")){%>selected="true"<%}%>>国家核心</option>                              
                                                </select>
                               				 <div class="rlf-tip-wrap errorHint color-red"></div>
                           					 </div>
										</div>
										<div class="form-item">
											<label>类别:</label>
											<div class="moco-control-input">
                              				  <select class="moco-form-control rlf-select" name="category" hidefocus="true" id="category" data-validate="require-select">
                                   	 				<option value="3"<%if(l.getCategory().equals("3")){%>selected="true"<%}%>>标准规范</option>
                                                    <option value="2"<%if(l.getCategory().equals("2")){%>selected="true"<%}%>>法规、规章</option>
                                                    <option value="1"<%if(l.getCategory().equals("1")){%>selected="true"<%}%>>法律</option>                              
                                                </select>
                               				 <div class="rlf-tip-wrap errorHint color-red"></div>
                           					 </div>
										</div>
										<div class="form-item">
											<label for="" class="moco-control-label">作者参与情况：</label>
			                            	<div class="moco-control-input">
				                                <select class="moco-form-control rlf-select" name="authorSituation" hidefocus="true" id="authorSituation" data-validate="require-select">
                                	 				 <option value="1"<%if(l.getAuthorSituation().equals("1")){%>selected="true"<%}%>>1.主编</option>
	                                                 <option value="2"<%if(l.getAuthorSituation().equals("2")){%>selected="true"<%}%>>2.参编</option>                               
	                                             </select>
	                                             <div class="rlf-tip-wrap errorHint color-red"></div>
                            				</div>
										</div>
										<div class="form-item">
											<label for="wordsCount">字数:</label>
											<div class="moco-control-input">
	                              				  <input type="text" name="wordsCount" id="wordsCount" autocomplete="off" class="moco-form-control" value="<%=l.getWordsCount() %>" placeholder="请输入总字数...">
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
										<%if(request.getParameter("AchievementId")!=null&&l.getChecked()!=1){%>						
										<button type="submit" class="btn btn-primary submit" style="opacity: 0.75">提交更新</button>
										<button class="btn btn-default btn-warning" type="reset">撤销修改</button>	
										<button class="btn btn-default btn-danger" type="button" onclick="deleteAchievement(<%=l.getID()%>)">删除</button>				
										<%}else if(request.getParameter("AchievementId")==null){%>
										<button type="submit" class="btn btn-primary submit" style="opacity: 0.75">提交</button>
										<button class="btn btn-default btn-warning" type="reset">重置</button>
										<%}%>						
										<button type="button"class="btn btn-default" onclick="window.history.back(-1);">返回</button>
									</form>
								
							</div>
	        </div>
	    </div>
  </body>
   <script type="text/javascript">
	function confirmSubmit(){
		if(!confirm("提交后成果将置为待审核状态，确认提交?")){  
			return false;
		}
	}
	function deleteAchievement(ID){
		if(confirm("确认删除成果?")){
		 $.ajax({
                url: "<%=projectPath%>/services/LawsUpload?deleteAchievement="+ID,
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

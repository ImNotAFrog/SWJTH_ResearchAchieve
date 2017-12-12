<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
   <%@include file="../head_user.jsp"%> 
   <% Textbook t = new Textbook();
   if(request.getParameter("AchievementId")!=null){
   	t=TextbookDao.getTextbookById(Integer.parseInt(request.getParameter("AchievementId")));
   } %>
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
									<form method="post" action="<%=projectPath%>/services/TextbookUpload" onsubmit="confirmSubmit()">
									<%if(request.getParameter("AchievementId")!=null){%>
									<input name="ID" type="hidden" value="<%=request.getParameter("AchievementId")%>" />
									<%}%>
										<div class="form-item">
											<label for="textName">名称:</label>
											<div class="moco-control-input">
	                              				  <input type="text" name="textbookName" id="textbookName" autocomplete="off" class="moco-form-control" value="<%=t.getName() %>" placeholder="请输入教材名称..." required>
	                               				 <div class="rlf-tip-wrap errorHint color-red"></div>
	                           				 </div>
										</div>
										
										<div class="form-item">
											<label for="subject">主体与级别:</label>
											<div class="moco-control-input">
	                              				  <select class="moco-form-control rlf-select" name="level" hidefocus="true" id="level" data-validate="require-select">
	                                	 			 <option value="1" <%if(t.getLevel().equals("1")){%>selected="true"<%}%>>1.公安消防部队高等专科学校正式出版</option>
	                                                 <option value="2" <%if(t.getLevel().equals("2")){%>selected="true"<%}%>>2.公安消防部队高等专科学校内部印刷</option>
	                                                 <option value="3" <%if(t.getLevel().equals("3")){%>selected="true"<%}%>>3.外单位正式出版</option>                               
	                                             </select>
	                               				 <div class="rlf-tip-wrap errorHint color-red"></div>
	                           				 </div>
										</div>
										<div class="form-item">
			                            	<label for="" class="moco-control-label">作者参与情况：</label>
			                            	<div class="moco-control-input">
				                                <select class="moco-form-control rlf-select" name="authorSituation" hidefocus="true" id="authorSituation" data-validate="require-select">
                                	 				 <option value="1"<%if(t.getAuthorSituation().equals("1")){%>selected="true"<%}%>>1.主编</option>
	                                                 <option value="2"<%if(t.getAuthorSituation().equals("2")){%>selected="true"<%}%>>2.副主编</option>
	                                                 <option value="3"<%if(t.getAuthorSituation().equals("3")){%>selected="true"<%}%>>3.参编</option>                               
	                                             </select>
	                                             <div class="rlf-tip-wrap errorHint color-red"></div>
                            				</div>
                        				</div>
                        				<div class="form-item" style="margin-top: 12px;">
			                            	<label for="" class="moco-control-label">出版社：</label>
			                            	<div class="moco-control-input">
				                                <input type="text" name="publishingHouse" id="publishingHouse" autocomplete="off" class="moco-form-control" value="<%=t.getPublishingHouse() %>" placeholder="请输入出版社名称...">
				                           		<div class="rlf-tip-wrap errorHint color-red"></div>
                            				</div>
                        				</div>
                        				<div class="form-item" style="margin-top: 12px;">
			                            	<label for="" class="moco-control-label">ISBN：</label>
			                            	<div class="moco-control-input">
				                                <input type="text" name="ISBN" id="ISBN" autocomplete="off" class="moco-form-control" value="<%=t.getISBN() %>" placeholder="请输入书号...">
				                           		<div class="rlf-tip-wrap errorHint color-red"></div>
                            				</div>
                        				</div>
                        				<div class="form-item" style="margin-top: 12px;">
			                            	<label for="" class="moco-control-label">出版时间：</label>
			                            	<div class="moco-control-input">
				                                <input type="text" name="publishDate" id="publishDate" autocomplete="off" class="moco-form-control" value="<%if(t.getPublishDate()!=null){%><%=t.getPublishDate()%><%}%>">
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
									<%if(request.getParameter("AchievementId")!=null&&t.getChecked()!=1){%>						
									<button type="submit" class="btn btn-primary submit" style="opacity: 0.75">提交更新</button>
									<button class="btn btn-default btn-warning" type="reset">撤销修改</button>	
									<button class="btn btn-default btn-danger" type="button" onclick="deleteAchievement(<%=t.getID()%>)">删除</button>				
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
	  <script>
  $(function() {
    $( "#publishDate" ).datepicker({dateFormat: "yy-mm-dd"});
  });
  function confirmSubmit(){
		if(!confirm("提交后成果将置为待审核状态，确认提交?")){  
			return false;
		}
	}
	function deleteAchievement(ID){
		if(confirm("确认删除成果?")){
		 $.ajax({
                url: "<%=projectPath%>/services/TextbookUpload?deleteAchievement="+ID,
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

<%@page import="com.SWJTHC.Dao.EduProjectDao"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
   <%@include file="../head_user.jsp"%> 
   <% EduProject p = new EduProject();
   if(request.getParameter("AchievementId")!=null){
   	p=EduProjectDao.getEduProjectById(Integer.parseInt(request.getParameter("AchievementId")));
   } %>
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
					<form method="post" action="<%=projectPath%>/services/ProjectUpload" onsubmit="confirmSubmit()">
					  <%if(request.getParameter("AchievementId")!=null){%>
						<input name="ID" type="hidden" value="<%=request.getParameter("AchievementId")%>" />
						<%}%>
						<div class="form-item">
							<label for="projectName">项目名称:</label>
							<div class="moco-control-input">
                           				  <input type="text" name="projectName" id="projectName" autocomplete="off" class="moco-form-control" value="<%=p.getName() %>" placeholder="请输入项目名称...">
                            				 <div class="rlf-tip-wrap errorHint color-red"></div>
                        				 </div>
						</div>
						
						<div class="form-item">
							<label for="" class="moco-control-label">作者参与情况：</label>
                           	<div class="moco-control-input">
                                <select class="moco-form-control rlf-select" name="authorSituation" hidefocus="true" id="authorSituation" data-validate="require-select">
                            		<option value="1"<%if(p.getAuthorSituation().equals("1")){%>selected="true"<%}%>>1.组长</option>
                                    <option value="2"<%if(p.getAuthorSituation().equals("2")){%>selected="true"<%}%>>2.研究人员</option>                             
                                </select>
                                <div class="rlf-tip-wrap errorHint color-red"></div>
                        	</div>
						</div>
						
						<div class="form-item">
							<label for="projectLevel">项目级别:</label>
							<div class="moco-control-input">
                           				  <select class="moco-form-control rlf-select" name="projectLevel" hidefocus="true" id="projectLevel" data-validate="require-select">
	                           	 				<option value="1"<%if(p.getLevel().equals("1")){%>selected="true"<%}%>>公安消防部队高等专科学校：国家级</option>
	                                            <option value="2"<%if(p.getLevel().equals("2")){%>selected="true"<%}%>>公安消防部队高等专科学校：省部级</option>
	                                            <option value="3"<%if(p.getLevel().equals("3")){%>selected="true"<%}%>>公安消防部队高等专科学校：校级</option> 
	                                            <option value="4"<%if(p.getLevel().equals("4")){%>selected="true"<%}%>>外单位项目：国家级</option>   
	                                            <option value="5"<%if(p.getLevel().equals("5")){%>selected="true"<%}%>>外单位项目：省部级</option>   
	                                            <option value="6"<%if(p.getLevel().equals("6")){%>selected="true"<%}%>>外单位项目：校级</option>                                                                               
	                                        </select>
                     				 <div class="rlf-tip-wrap errorHint color-red"></div>
               				 </div>
						</div>
						<div class="form-item">
							<label for="subject">项目主体名称:</label>
							<div class="moco-control-input">
                           				  <input type="text" name="subject" id="subject" autocomplete="off" class="moco-form-control" value="<%=p.getSubject() %>" placeholder="如：消防局科研项目...">
                            				 <div class="rlf-tip-wrap errorHint color-red"></div>
                        				 </div>
						</div>
						<div class="form-item">
							<label for="state">项目状态:</label>
							<div class="moco-control-input">
								<select class="moco-form-control rlf-select" name="state" hidefocus="true" id="state" data-validate="require-select">
	               	 				<option value="通过验收"<%if(!p.getState().equals("")&&p.getState().substring(10).equals("通过验收")){%>selected="true"<%}%>>通过验收</option>
	                                <option value="立项在研"<%if(!p.getState().equals("")&&p.getState().substring(10).equals("立项在研")){%>selected="true"<%}%>>立项在研</option>                                                                           
	                            </select>	                          
               				 <div class="rlf-tip-wrap errorHint color-red"></div>
           				 </div>
						</div>
						<div class="form-item">
							<label for="stateDate">时间:</label>
							<div class="moco-control-input">
	                            <input type="text" name="stateDate" id="stateDate" autocomplete="off" class="moco-form-control" value="<%if(!p.getState().equals("")){%><%=p.getState().substring(0,10)%><%}%>" >
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
  <script type="text/javascript">
   $(function() {
    $( "#stateDate" ).datepicker({dateFormat: "yy-mm-dd"});
  });
	function confirmSubmit(){
		if(!confirm("提交后成果将置为待审核状态，确认提交?")){  
			return false;
		}
	}
	function deleteAchievement(ID){
		if(confirm("确认删除成果?")){
		 $.ajax({
                url: "<%=projectPath%>/services/ProjectUpload?deleteAchievement="+ID,
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

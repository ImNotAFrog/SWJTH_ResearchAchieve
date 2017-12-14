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
    
    <%if(request.getParameter("AchievementId")!=null){%>
    <title>教研、科研项目成果编辑</title>
    <%}else{ %>
    <title>教研、科研项目成果上传</title>
    <%} %>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="<%=projectPath%>/assets/css/uploadForm.css" rel="stylesheet">
		<link rel="stylesheet" href="<%=projectPath%>/assets/css/bootstrap-responsive.min.css">
        <link rel="stylesheet" href="<%=projectPath%>/assets/css/bootstrap-image-gallery.min.css">
        <link rel="stylesheet" href="<%=projectPath%>/assets/css/jquery.fileupload-ui.css">

  </head>
  
  <body <% if(request.getParameter("AchievementId")!=null){%>onload="load()"<%}%>>
<!--用户 基本信息的编辑-->
	<div class="container upload">
	    <div class="row">
	        <div class="col-md-9 col-md-offset-2">
			
				<!--教学改革项目-->
				<div class="re-item">
					
					<h3>请填写教学改革项目信息</h3>
					<a href="<%=projectPath%>/template/teacher.jsp" class="moco-modal-close"></a>
					<form id="fileupload" method="post">
					<%if(request.getParameter("AchievementId")!=null){%>
					<input id="ID" name="ID" type="hidden" value="<%=request.getParameter("AchievementId")%>" />
					<input id="type" name="type" type="hidden" value="ProjectUpload" />
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
						<label>成果附件:&nbsp;&nbsp; </label>
						<input name="attachment" id="attachment" type="hidden" value="<%=p.getAttachment()%>" />						
								<iframe id="id_iframe" name="nm_iframe" style="display:none;"></iframe> 
								<%if(p.getChecked()!=1){ %> 
						<div class="row fileupload-buttonbar col-md-8">
		                    <div class="span7">
		                        <!-- The fileinput-button span is used to style the file input field as button -->
		                        <span class="btn btn-success fileinput-button">
		                            <i class="icon-plus icon-white"></i>
		                            <span>添加附件...</span>
		                            <input type="file" name="files[]" multiple>
		                        </span>
		                        <button type="submit" class="btn btn-primary start">
		                            <i class="icon-upload icon-white" onclick="return uploadFile()"></i>
		                            <span>上传所有</span>
		                        </button>
		                        <button type="reset" class="btn btn-warning cancel">
		                            <i class="icon-ban-circle icon-white"></i>
		                            <span>取消上传</span>
		                        </button>
		                    </div>
		                    <!-- The global progress information -->
		                    <div class="span5 fileupload-progress fade">
		                        <!-- The global progress bar -->
		                        <div class="progress progress-success progress-striped active" role="progressbar" aria-valuemin="0" aria-valuemax="100">
		                            <div class="bar" style="width:0%;"></div>
		                        </div>
		                        <!-- The extended global progress information -->
		                        <div class="progress-extended">&nbsp;</div>
		                    </div>
		                </div>
		                <%} %>
		                <!-- The loading indicator is shown during file processing -->
		                <div class="fileupload-loading col-md-10 col-md-offset-1"></div>
		                <br>
		                <!-- The table listing the files available for upload/download -->				               
		                <table id="attachUrls" role="presentation" class="table table-striped" style="width:80%">
		                <thead>
		                	<tr>
		                		<td></td>
		                		<td><label>附件名</label></td>
		                		<td ><label>文件大小</label></td>
		                		<td></td>
		                		<td></td>
		                	</tr>
		                </thead>
		                <tbody id="fileBody" class="files"></tbody>
		                </table>
						</div>
						<div class="col-md-offset-2">
						<%if(request.getParameter("AchievementId")!=null&&p.getChecked()!=1){%>						
						<button id="btnSubmit" type="submit" class="btn btn-primary submit" style="opacity: 0.75" onclick="confirmSubmit()">提交更新</button>
						<button class="btn btn-default btn-warning" type="reset">撤销修改</button>	
						<button class="btn btn-default btn-danger" type="button" onclick="deleteAchievement(<%=p.getID()%>)">删除成果</button>				
						<%}else if(request.getParameter("AchievementId")==null){%>
						<button type="submit" class="btn btn-primary submit" style="opacity: 0.75" onclick="confirmSubmit()">提交</button>
						<button class="btn btn-default btn-warning" type="reset">重置</button>
						<%}%>						
						<button type="button"class="btn btn-default" onclick="window.location.href='<%=projectPath%>/template/teacher.jsp';">返回</button>
						</div>
					</form>
					
				</div>
	        </div>
	    </div>
	</div>
  </body>
  <script>
  function confirmSubmit(){
		if(confirm("提交后成果将置为待审核状态，确认提交?")){  
			var form = document.getElementById("fileupload");
			form.setAttribute("action", "<%=projectPath%>/services/ProjectUpload");
			form.removeAttribute("enctype");
			form.removeAttribute("target");
			form.submit();			
		}else{
			return false;
		}
	}
	function uploadFile(){	
		var form = document.getElementById("fileupload");
			form.setAttribute("action", "<%=projectPath%>/services/FileUploadServlet");
			form.setAttribute("enctype","multipart/form-data");
			form.setAttribute("target","nm_iframe");
			form.submit();
			
			var intervalId = window.setInterval(function() { 
				updateTable(intervalId);				
			}, 2000); 
	}
	function updateTable(intervalId){
		try{
			
			var attach = document.getElementById("attachment");
			var attchUrls = document.getElementById("attachUrls");
			attach.value ="";	
			
			for(var i=1;i<attchUrls.rows.length;i++){
				var href =attchUrls.rows[i].cells[0].children[0].href;
				attach.value = attach.value + href.substring(href.indexOf("getfile=")+8)+";"
			}
			window.clearInterval(intervalId);
			
		}catch(e){
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
	
	var load = function()
	{		
		var list = "<%=p.getAttachment()%>".split(";");
		for(var i=0;i<list.length;i++){
			if(list[i]!=""){
				$.ajax({
           url: "<%=projectPath%>/services/FileUploadServlet?getlist="+list[i],
           dataType: 'json',
           method: 'GET',
           success: function(data) {
           		var tbody = document.getElementById("fileBody");
           		var num=tbody.rows.length;
           		var colsNum=5;
           		var rownum=num;
				tbody.insertRow(rownum);
				tbody.rows[rownum].setAttribute("class","template-upload fade in");
				for(var i=0;i<colsNum; i++)
				{
					tbody.rows[rownum].insertCell(i);//插入列
				}
              	tbody.rows[rownum].cells[0].setAttribute("class","preview");
              	tbody.rows[rownum].cells[0].innerHTML="<a href="+data[0].url+" title="+data[0].name+"  download="+data[0].name+"><img src="+data[0].thumbnail_url+"></a>";
              	tbody.rows[rownum].cells[1].setAttribute("class","name");
				tbody.rows[rownum].cells[1].innerHTML="<a href="+data[0].url+" title="+data[0].name+" download="+data[0].name+">"+data[0].name+"</a>";	
				tbody.rows[rownum].cells[2].setAttribute("class","size");
				tbody.rows[rownum].cells[2].innerHTML="<span>"+formateFileSize(data[0].size)+"</span>";
				tbody.rows[rownum].cells[3].setAttribute("colspan","2");
				tbody.rows[rownum].cells[3].innerHTML="";
				if(<%=p.getChecked()%>!=1){
					tbody.rows[rownum].cells[4].setAttribute("class","delete");
					tbody.rows[rownum].cells[4].innerHTML="<button class=\"btn btn-danger\" data-type="+data[0].delete_type+" data-url="+data[0].delete_url+"><i class=\"icon-trash icon-white\"></i><span>删除附件</span></button>";
				}			
				

          },
           error: function(xhr) {
               // 导致出错的原因较多，以后再研究
               alert('error:' + JSON.stringify(xhr));
           }
       });
			}			
		}	   
	} 
	var formateFileSize = function(size){
		if(size<1024){
			return size.toFixed(2)+"B";
		}else if(size<(1024*1024)){
			return (size/1024).toFixed(2)+"KB"; 
		}else if(size<(1024*1024*1024)){
			return (size/1024/1024).toFixed(2)+"MB"; 
		}
	}
 </script>
 <script id="template-upload" type="text/x-tmpl">
            {% for (var i=0, file; file=o.files[i]; i++) { %}
        	<tr class="template-upload fade">
            <td class="preview"><span class="fade"></span></td>
            <td class="name"><span>{%=file.name%}</span></td>
            <td class="size"><span>{%=o.formatFileSize(file.size)%}</span></td>
            {% if (file.error) { %}
            <td class="error" colspan="2"><span class="label label-important">Error</span> {%=file.error%}</td>
            {% } else if (o.files.valid && !i) { %}
            <td>
                <div class="progress progress-success progress-striped active" role="progressbar" aria-valuemin="0" aria-valuemax="100" aria-valuenow="0"><div class="bar" style="width:0%;"></div></div>
            </td>
            <td class="start">{% if (!o.options.autoUpload) { %}
                <button class="btn btn-primary" onclick="return uploadFile()">
                    <i class="icon-upload icon-white"></i>
                    <span>Start</span>
                </button>
                {% } %}</td>
            {% } else { %}
            {% } %}
            <td class="cancel">{% if (!i) { %}
                <button class="btn btn-warning">
                    <i class="icon-ban-circle icon-white"></i>
                    <span>Cancel</span>
                </button>
                {% } %}</td>
        </tr>
        {% } %}
    </script>
    <!-- The template to display files available for download -->
    <script id="template-download" type="text/x-tmpl">
        {% for (var i=0, file; file=o.files[i]; i++) { %}
        <tr class="template-download fade">
            {% if (file.error) { %}
            <td></td>
            <td class="name"><span>{%=file.name%}</span></td>
            <td class="size"><span>{%=o.formatFileSize(file.size)%}</span></td>
            <td class="error" colspan="2"><span class="label label-important">Error</span> {%=file.error%}</td>
            {% } else { %}
            <td class="preview">{% if (file.thumbnail_url) { %}
                <a href="{%=file.url%}" title="{%=file.name%}"  download="{%=file.name%}"><img src="{%=file.thumbnail_url%}"></a>
                {% } %}</td>
            <td class="name">
                <a href="{%=file.url%}" title="{%=file.name%}" download="{%=file.name%}">{%=file.name%}</a>
            </td>
            <td class="size"><span>{%=o.formatFileSize(file.size)%}</span></td>
            <td colspan="2"></td>
            {% } %}
            <td class="delete">
                <%if(p.getChecked()!=1){%>
				<button class="btn btn-danger" data-type="{%=file.delete_type%}" data-url="{%=file.delete_url%}"{% if (file.delete_with_credentials) { %} data-xhr-fields='{"withCredentials":true}'{% } %}>
                        <i class="icon-trash icon-white"></i>
                    <span>删除附件</span>
                </button>
				<%}%>
            </td>
        </tr>
        {% } %}
    </script>
   <script src="<%=projectPath%>/assets/js/fileupload/jquery.ui.widget.js"></script>
    <script src="<%=projectPath%>/assets/js/fileupload/tmpl.min.js"></script>
    <script src="<%=projectPath%>/assets/js/fileupload/load-image.min.js"></script>
    <script src="<%=projectPath%>/assets/js/fileupload/jquery.iframe-transport.js"></script>
    <script src="<%=projectPath%>/assets/js/fileupload/jquery.fileupload.js"></script>
    <script src="<%=projectPath%>/assets/js/fileupload/jquery.fileupload-fp.js"></script>
    <script src="<%=projectPath%>/assets/js/fileupload/jquery.fileupload-ui.js"></script>
    <script src="<%=projectPath%>/assets/js/fileupload/locale.js"></script>
  <script type="text/javascript">
   $(function() {
    	$( "#stateDate" ).datepicker({dateFormat: "yy-mm-dd"});
	});
   $(function () {
	    'use strict';
	
	    // Initialize the jQuery File Upload widget:
	    $('#fileupload').fileupload();
	
	    // Enable iframe cross-domain access via redirect option:
	    $('#fileupload').fileupload(
	        'option',
	        'redirect',
	        window.location.href.replace(
	            /\/[^\/]*$/,
	            '/cors/result.html?%s'
	        )
	    );
	}); 
  </script>   
</html>

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
   } 
   String username = request.getSession().getAttribute("username").toString(); 
   String owner = l.getOwner();
   %>
  <head>
    <base href="<%=basePath%>">
    <%if(request.getParameter("AchievementId")!=null&&(request.getSession().getAttribute("role").equals("admin"))){%>
    <title>法律、法规成果查看</title>
    <%}else if(request.getParameter("AchievementId")!=null){ %>
    <title>法律、法规成果编辑</title>
    <%}else{ %>
    <title>法律、法规成果上传</title>
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
<div class="container upload">
	    <div class="row">
	        <div class="col-md-9 col-md-offset-2">
				
				<!--法规-->
							<div class="re-item">
								
									<h3>法规信息</h3>
									<a href="<%=projectPath%>/template/<%=role%>.jsp" class="moco-modal-close"></a>
									<form id="fileupload" method="post" target="nm_iframe" onchange="confirmFlag=0;">
										<input id="owner" name="owner" type="hidden" value="<%=l.getOwner()%>" />
										<input id="type" name="type" type="hidden" value="LawsUpload" />
										<input name="checked" id="checked" type="hidden" value="<%=l.getChecked()%>" />
										<%if(request.getParameter("AchievementId")!=null){%>
										<input id="ID" name="ID" type="hidden" value="<%=request.getParameter("AchievementId")%>" />
										<%}%>
										<div class="form-item">
											<label for="lawName">法规名称:</label>
											<div class="moco-control-input">
	                              				  <input type="text" name="lawName" id="lawName" autocomplete="off" class="moco-form-control" value="<%=l.getName() %>" placeholder="请输入法规名称..."<%if((role.equals("admin")&&!owner.equals("")&&!owner.equals(username))||l.getChecked()==1){%>readonly="readonly"<%}%>>
	                               				 <div class="rlf-tip-wrap errorHint color-red"></div>
	                           				 </div>
										</div>
										<div class="form-item">
											<label for="lawNumber">法规编号:</label>
											<div class="moco-control-input">
	                              				  <input type="text" name="lawNumber" id="lawNumber" autocomplete="off" class="moco-form-control" value="<%=l.getLawNumber() %>" placeholder="请输入法规编号..." <%if((role.equals("admin")&&!owner.equals("")&&!owner.equals(username))||l.getChecked()==1){%>readonly="readonly"<%}%>>
	                               				 <div class="rlf-tip-wrap errorHint color-red"></div>
	                           				 </div>
										</div>
										<div class="form-item">
											<label>级别:</label>
											<div class="moco-control-input">
                              				  <select class="moco-form-control rlf-select" name="lawLevel" hidefocus="true" id="lawLevel" data-validate="require-select" <%if((role.equals("admin")&&!owner.equals("")&&!owner.equals(username))||l.getChecked()==1){%> disabled="true"<%}%>>
                                   	 				<option value="1"<%if(l.getLevel().equals("1")){%>selected="true"<%}%>>法律、行政法规、国家标准</option>
                                                    <option value="2"<%if(l.getLevel().equals("2")){%>selected="true"<%}%>>部门规章、行业标准规范</option>
                                                    <option value="3"<%if(l.getLevel().equals("3")){%>selected="true"<%}%>>地方性法规、政府规章、地方性标准规范</option>                              
                                                </select>
                               				 <div class="rlf-tip-wrap errorHint color-red"></div>
                           					 </div>
										</div>
										<div class="form-item">
											<label for="" class="moco-control-label">作者参与情况：</label>
			                            	<div class="moco-control-input">
				                                <select class="moco-form-control rlf-select" name="authorSituation" hidefocus="true" id="authorSituation" data-validate="require-select" <%if((role.equals("admin")&&!owner.equals("")&&!owner.equals(username))||l.getChecked()==1){%> disabled="true"<%}%>>
                                	 				 <option value="1"<%if(l.getAuthorSituation().equals("1")){%>selected="true"<%}%>>1.主编</option>
	                                                 <option value="2"<%if(l.getAuthorSituation().equals("2")){%>selected="true"<%}%>>2.参编</option>                               
	                                             </select>
	                                             <div class="rlf-tip-wrap errorHint color-red"></div>
                            				</div>
										</div>
										<div class="form-item">
											<label for="wordsCount">字数:</label>
											<div class="moco-control-input">
	                              				  <input type="text" name="wordsCount" id="wordsCount" autocomplete="off" class="moco-form-control" value="<%=l.getWordsCount() %>" placeholder="请输入总字数..." <%if((role.equals("admin")&&!owner.equals("")&&!owner.equals(username))||l.getChecked()==1){%>readonly="readonly"<%}%>>
	                               				 <div class="rlf-tip-wrap errorHint color-red"></div>
	                           				 </div>
										</div>
										<%if(request.getParameter("AchievementId")!=null){%>
											<div class="form-item">
												<label for="chiefEditor">成果得分:</label>
												<div class="moco-control-input">
				                            				  <input type="text" name="score" id="score" autocomplete="off" class="moco-form-control" value="<%=l.getScore()%>" <%if(!role.equals("admin")||l.getChecked()==1){%>readonly="readonly"<%}%>>
				                             				 <div class="rlf-tip-wrap errorHint color-red"></div>
				                         				 </div>
										</div>
										<%}%>
										<div class="form-item">
											<label>成果附件:&nbsp;&nbsp; </label>
											<input name="attachment" id="attachment" type="hidden" value="<%=l.getAttachment()%>" />						
			  								<iframe id="id_iframe" name="nm_iframe" style="display:none;"></iframe> 
			  								<%if(l.getChecked()!=1&&((role.equals("admin")&&owner.equals(username))||owner.equals("")||role.equals("teacher"))){%>
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
										<div id="countdown" class="col-md-offset-2 col-md-10" style="color:#F00"></div>
										<div class="col-md-offset-2">
										<%if(request.getParameter("AchievementId")!=null&&l.getChecked()!=1&&role.equals("admin")&&!owner.equals(username)){%>			
										<button id="btnSubmit" type="submit" class="btn btn-primary submit" style="opacity: 0.75" onclick="return confirmSubmit()">修改分数</button>
										<button id="btnSubmit" type="submit" class="btn btn-primary submit" style="opacity: 0.75" onclick="return confirmPass()">通过</button>
										<button id="btnSubmit" type="submit" class="btn btn-danger submit" style="opacity: 0.75" onclick="return confirmUnpass()">不通过</button>
										<%}else if(request.getParameter("AchievementId")!=null&&l.getChecked()!=1&&(role.equals("teacher")||owner.equals(username))){%>						
										<button id="btnSubmit" type="submit" class="btn btn-primary submit" style="opacity: 0.75" onclick="return confirmSubmit()">提交更新</button>
										<button class="btn btn-default btn-warning" type="reset">撤销修改</button>	
										<button class="btn btn-default btn-danger" type="button" onclick="deleteAchievement(<%=l.getID()%>)">删除成果</button>				
										<%}else if(request.getParameter("AchievementId")==null){%>
										<button id="btnSubmit" type="submit" class="btn btn-primary submit" style="opacity: 0.75" onclick="return confirmSubmit()">提交</button>
										<button class="btn btn-default btn-warning" type="reset">重置</button>
										<%}%>						
										<button type="button"class="btn btn-default" onclick="window.location.href='<%=projectPath%>/template/<%=role%>.jsp';">返回</button>
										</div>
									</form>
								
							</div>
	        </div>
	    </div>
<script>
   	function confirmPass(){
		/*校验一些输入表单是否为空*/
  		
  		var score = document.getElementById("score");

  		if(score.value == ""){
  			thesisName.nextElementSibling.innerText = "分数不能为空.";
  			return false;
  		}else{
			if(confirm("提交后成果将无法修改，确认通过?")){  
				var form = document.getElementById("fileupload");
				var checked = document.getElementById("checked");
				checked.value=1;
				form.setAttribute("action", "<%=projectPath%>/services/LawsUpload");
				form.removeAttribute("enctype");
				form.removeAttribute("target");
				form.submit();			
			}else{
				return false;
			}
		}
	}
	function confirmUnpass(){
		/*校验一些输入表单是否为空*/
  		
  		var score = document.getElementById("score");

  		if(score.value == ""){
  			thesisName.nextElementSibling.innerText = "分数不能为空.";
  			return false;
  		}else{
			if(confirm("确认将成果设置为不通过?")){  
				var form = document.getElementById("fileupload");
				var checked = document.getElementById("checked");
				checked.value=-1;
				form.setAttribute("action", "<%=projectPath%>/services/LawsUpload");
				form.removeAttribute("enctype");
				form.removeAttribute("target");
				form.submit();			
			}else{
				return false;
			}
		}
	}
	var confirmFlag=0;
	var timer;
	
	var maxtime = 2;
  function confirmSubmit(){

  	/*校验一些输入表单是否为空*/
  		var error = document.getElementById("error");
  		var lawName = document.getElementById("lawName");
  		var lawNumber = document.getElementById("lawNumber");
  		var wordsCount = document.getElementById("wordsCount");

  		if(lawName.value == ""){
  			lawName.nextElementSibling.innerText = "法规名称不能为空.";
  			return false;
  		}else if(lawNumber.value ==""){
  			lawNumber.nextElementSibling.innerText = "法规编号不能为空.";
  			return false;
  		}else if(wordsCount.value ==""){
  			wordsCount.nextElementSibling.innerText = "字数不能为空.";
  			return false;
  		}else if(confirmFlag==0){
  			document.getElementById("countdown").innerHTML="请确认您填写的信息无误后再次点提交 - "+(maxtime+1);     
			timer = setInterval("CountDown()",1000);  
			document.getElementById("btnSubmit").disabled=true; 
			confirmFlag=1;
			return false;
		}else if(window.confirmFlag==1){
				var form = document.getElementById("fileupload");
				form.setAttribute("action", "<%=projectPath%>/services/LawsUpload");
				form.removeAttribute("enctype");
				form.removeAttribute("target");
				form.submit();			
		}
		return false;
	}
	function CountDown(){     
	        if(maxtime>=0){    
	            document.getElementById("countdown").innerHTML="请确认您填写的信息无误后再次点提交 - "+maxtime;     
	            if(maxtime !=0){   
	                --maxtime;     
	            }else{   
	            	document.getElementById("countdown").innerHTML="";       
	            	document.getElementById("btnSubmit").disabled=false; 
	                clearInterval(timer);  
	                maxtime=2;   
	            }     
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
                url: "<%=projectPath%>/services/LawsUpload?deleteAchievement="+ID,
                 dataType: 'json',
                 method: 'GET',
                 success: function(data) {
                    if (data.result == 1) {
                         alert("删除成功！");
                         window.location="<%=projectPath%>/template/<%=role%>.jsp";
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
		var list = "<%=l.getAttachment()%>".split(";");
		for(var i=0;i<list.length;i++){
			if(list[i]!=""){
				$.ajax({
           url: "<%=projectPath%>/services/FileUploadServlet?getlist="+list[i]+"&owner=<%=l.getOwner()%>",
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
				if(<%=l.getChecked()%>!=1&&<%=owner.equals(username)%>){
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
                    <span>开始上传</span>
                </button>
                {% } %}</td>
            {% } else { %}
            {% } %}
            <td class="cancel">{% if (!i) { %}
                <button class="btn btn-warning">
                    <i class="icon-ban-circle icon-white"></i>
                    <span>取消</span>
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
                <a href="{%=file.url%}" title="{%=file.name%}" onclick="window.open({%=file.url%});" target="_blank"><img src="{%=file.thumbnail_url%}"></a>
                {% } %}</td>
            <td class="name">
                <a href="{%=file.url%}" title="{%=file.name%}" download="{%=file.name%}">{%=file.name%}</a>
            </td>
            <td class="size"><span>{%=o.formatFileSize(file.size)%}</span></td>
            <td colspan="2"></td>
            {% } %}
            <td class="delete">
                <%if(l.getChecked()!=1){%>
				<button class="btn btn-danger" data-type="{%=file.delete_type%}" data-url="{%=file.delete_url%}"{% if (file.delete_with_credentials) { %} data-xhr-fields='{"withCredentials":true}'{% } %}>
                        <i class="icon-trash icon-white"></i>
                    <span>删除附件</span>
                </button>
				<%}%>
            </td>
        </tr>
        {% } %}
    </script>
  </body>

   <script src="<%=projectPath%>/assets/js/fileupload/jquery.ui.widget.js"></script>
    <script src="<%=projectPath%>/assets/js/fileupload/tmpl.min.js"></script>
    <script src="<%=projectPath%>/assets/js/fileupload/load-image.min.js"></script>
    <script src="<%=projectPath%>/assets/js/fileupload/jquery.iframe-transport.js"></script>
    <script src="<%=projectPath%>/assets/js/fileupload/jquery.fileupload.js"></script>
    <script src="<%=projectPath%>/assets/js/fileupload/jquery.fileupload-fp.js"></script>
    <script src="<%=projectPath%>/assets/js/fileupload/jquery.fileupload-ui.js"></script>
    <script src="<%=projectPath%>/assets/js/fileupload/locale.js"></script>
    <script type="text/javascript">
    <%if((role.equals("admin")&&owner.equals(username))||owner.equals("")||!role.equals("admin")){%>
     <%if(l.getChecked()!=1){%>
     $(function() {
    $( "#patentDate" ).datepicker({
   		  	  dateFormat: "yy-mm-dd",
              showOtherMonths: true,
              selectOtherMonths: true,
              showButtonPanel: true,
              showOn: "both",
              buttonImageOnly: true,
              buttonText: "",
              changeMonth: true,
              changeYear: true
          });
  	});
  	<%}%>
  	<%}%>
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

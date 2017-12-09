<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<html>
<head>
<title>加入验证的用户注册页面</title>
<style type="text/css">
		div#bg-div{ 
		position:fixed; 
		top:0; 
		left:0; 
		bottom:0; 
		right:0; 
		z-index:-1; 
		} 
		div#bg-div > img { 
		height:100%; 
		width:100%; 
		border:0; 
		} 
		</style>
<script language="javascript">
function check(){
	

	if(form1.name.value==""){
		alert("姓名不能为空！");
		form1.name.focus();
		return false;
	}
	if(form1.pw.value==""){
		alert("密码不能为空！");
		form1.pw.focus();
		return false;
	}
	if (form1.pw.value.length<6){
		alert("密码太短，长度不能小于6！");
		form1.pw.focus();
		return false;
	}
	if(form1.pw.value!=form1.pw2.value){
		alert("密码与确认密码不一致！");
		form1.pw.focus();
		return false;
	}
	if(form1.telephone.value==""){
		alert("电话号码不能为空");
		form1.telephone.focus();
		return false;
	}
	for(i=0;i<form1.telephone.value.length;i++){
		if(form1.telephone.value.charAt(i)<'0' ||
			 form1.telephone.value.charAt(i)>'9'){
			alert("电话号码格式不正确！");
			form1.telephone.focus();
			return false;
		}
	}
	if(form1.email.value==""){
		alert("电子邮箱不能为空");
		form1.email.focus();
		return false;
	}
	if((form1.email.value.indexOf('@',0)==-1) ||
		(form1.email.value.indexOf('.',0)==-1)){
		alert("电子邮箱格式不正确！");
		form1.email.focus();
		return false;
	}
	var request = createXmlHttpRequest();
	var url = "/JavaEEProject/servlet/RegisterServlet";
	var hobby="";
	var checkBox = document.getElementsByName("hobby");
	for(var i =0;i<checkBox.length;i++){
		if(checkBox[i].checked){
			hobby+=checkBox[i].value+";";
		}
	}
	request.open("POST",url,true);
	request.setRequestHeader("Content-type","application/x-www-form-urlencoded;charset=utf-8");
	request.send("name="+form1.name.value
				+"&pwd="+form1.pw.value
				+"&sex="+form1.sex.value
				+"&career="+form1.career.value
				+"&telephone="+form1.telephone.value
				+"&email="+form1.email.value
				+"&hobby="+hobby
				+"&introduction="+form1.intro.value
				);
	request.onreadystatechange = function(){
		if(request.readyState==4){
			if(request.status==200){
				var res=request.responseText;
				if(res==1){
					alert("注册成功！");
					window.location = "/JavaEEProject/login.jsp";
				}
			}else{
				alert(request.status);
			}			
		}
	}
	
	return false;
}

function createXmlHttpRequest(){
	var XMLHttpRequest1;
	if(window.XMLHttpRequest){
		XMLHttpRequest1 = new XMLHttpRequest();
	}else if(window.ActiveXObject){
		try{
			XMLHttpRequest1 = new ActiveXObject("Msxml2.XMLHTTP");
		}catch(e){
			XMLHttpRequest1 = new ActiveXObject("Microsoft.XMLHTTP");
		}
	}
	return XMLHttpRequest1;
}
</script>
<script type="javascript" src="./bootstrap/js/bootstrap.min.js"></script>
<script type="javascript" src="./bootstrap/js/npm.js"></script>
 <link href="./bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
</head>
<body>
<div id="bg-div"><img src="./assets/img/backgrounds/1.jpg" /></div> 
<div class="col-md-4 col-md-offset-4"style="border-radius: 5px 5px 0px 0px;background:#eee;margin-top:20px;padding: 0px 25px 0px 10px;">
<form method="post" name="form1" onSubmit="return check()"target="id_iframe">
<h2>用户注册</h2>
<div class="form-group">
<label>姓名</label>
<input class="form-control" type="text" name="name"/>
</div>
<div class="form-group">
<label>密码</label>
<input class="form-control" type="password" name="pw">
</div>
<div class="form-group">
    <label for="re-password">确认密码</label>
    <input type="password" class="form-control" name="pw2" placeholder="确认密码">
  </div>
  <div class="form-group">
    <label for="sex">性别</label>
    <input type="radio" name="sex" id="male" value="男" checked>男

    <input type="radio" name="sex" id="famale" value="女">女

  </div>
  <div class="form-group">
	<label for="password">职业</label>

	<select class="form-control" size="1" name="career">
				<option value="教育工作者">教育工作者</option>
				<option value="公司职员" selected>公司职员</option>
				<option value="自由职业者">自由职业者</option>
				<option value="其他">其他</option>
			</select>
</div>
  <div class="form-group">
    <label>电话号码</label>
    <input type="text" class="form-control" name="telephone">
  </div>
  <div class="form-group">
    <label>电子邮箱</label>
    <input type="text" class="form-control" name="email">
  </div>

  <div class="form-group">
	   <label>兴趣爱好</label>
   <div class="checkbox">
    <label>
      <input type="checkbox" name="hobby" value="体育">体育
    </label>
    <label>
      <input type="checkbox" name="hobby" value="看书">看书
    </label>
    <label>
      <input type="checkbox" name="hobby" value="旅游">旅游
    </label>
    <label>
      <input type="checkbox" name="hobby" value="美食">美食
    </label>	
  </div>
  </div>
	<div class="form-group">  
		<label>自我简介</label>
		<textarea class="form-control" style="resize: none;" name="intro" rows="5">
		</textarea>
	</div>
  <div class="form-group">  
	 <button type="submit" class="btn btn-primary"> 注册 </button>
	 <button type="reset" class="btn btn-danger"> 重置 </button>
	</div>
</form>
</div>
<iframe id="id_iframe" name="nm_iframe" style="display:none;"></iframe> 
</body>
</html>
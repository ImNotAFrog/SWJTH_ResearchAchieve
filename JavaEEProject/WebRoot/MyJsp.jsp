<%@page pageEncoding="UTF-8"%>

<%@include file="head.jsp"%>
<br>
欢迎进入首页
<br>
<jsp:include page="copyright.jsp" flush="false"/> 
<jsp:forward page="Forward.jsp">
	<jsp:param name="username" value="admin"/>
</jsp:forward>
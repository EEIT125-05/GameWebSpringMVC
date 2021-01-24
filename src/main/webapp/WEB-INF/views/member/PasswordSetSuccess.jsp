<%@page import="com.web.game.member.model.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../Link.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	response.setContentType("text/html;charset=UTF-8");
response.setHeader("Cache-Control", "no-cache"); // HTTP 1.1
response.setHeader("Pragma", "no-cache"); // HTTP 1.0
response.setDateHeader("Expires", -1); // Prevents caching at the proxy server
%>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<title>密碼修改成功</title>
<style>
input {
	border-radius: 10px;
}
</style>
<script>
	
</script>
</head>
<%@ include file="../Header.jsp"%>
<body>
	<hr>
	<form action="<c:url value='/member/PasswordSetSuccess'/>">
		<div align='center' style='margin-bottom: 312;'
			class="dark-matter com">
<!-- 			<div align='center' -->
<!-- 				style="width: 450; height: 400; padding-top: 25; padding-left: 25;"> -->
				<H1>密碼修改成功</H1>
				<H3 align='center' style="padding-top: 40;">
					<button id="submit" type="submit" name="submit" class="button">回首頁</button>
				</H3>

<!-- 			</div> -->
		</div>
	</form>
	<%@ include file="../Foot.jsp"%>
</body>
</html>
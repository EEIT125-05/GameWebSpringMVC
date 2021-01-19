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
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>管理員登入</title>
<style>
input {
	border-radius: 10px;
}
</style>
</head>
<body>
	<h1 align='center'>GameBar管理員登入</h1>
	<hr>
	<%@ include file="../Header.jsp"%>
	<div align='center'>
		<form action="<c:url value='/member/GameBarSignin'/>" method="post">

			<div align='center'
				style='border: 3px solid gray; width: 450; height: 300;border-radius: 5px;'>
				<h3 style='padding-top: 30px;'>
					帳號:<input type="text" name="sAccount" minlength="6" maxlength="20"
						placeholder="請輸入帳號" required="required">
				</h3>
				<h3 style='padding-top: 30px;'>
					密碼:<input type="password" name="sPassword" placeholder="請輸入密碼"
						minlength="8" maxlength="16" required="required">
				</h3>
		 <input id="Signin" name="Signin" type="submit" value="登入"
			style='width: 350; height: 50; font-size: 30;margin-top:30;background-color:red '>
	</div>
	</div>
	</form>
	<%@ include file="../Foot.jsp"%>
</body>
</html>
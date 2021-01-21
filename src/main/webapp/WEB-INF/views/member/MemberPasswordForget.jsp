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
<title>忘記密碼</title>
<style>
input {
	border-radius: 10px;
}
</style>
</head>
<%@ include file="../Header.jsp"%>
<body>
	<h1 align='center'>忘記密碼</h1>
	<hr>
	<form action="<c:url value='/member/JavaMail'/>" method="post">
		<div align='center' style='padding-bottom:240;'>
			<div align='center'
				style="border: 3px solid gray; width: 450; height: 250;padding-top:15;background-color: #272727;color: white;">
				<H3 align='center'>
					請輸入使用的信箱<input type="email" name="mail" style="width: 400;padding-top:15;"
						pattern="^[a-z0-9]+([._\\-]*[a-z0-9])*@([a-z0-9]+[-a-z0-9]*[a-z0-9]+[.]){1,63}[a-z0-9]+$">
				</H3>
				<h6 style='color: red;'>${showError}</h6>
				<h6 style='color: green;'>${message}</h6>
				<BR>
				<H3>
					<button type="submit">
						<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30"
							fill="currentColor" class="bi bi-envelope-fill"
							viewBox="0 0 16 16"> <path
							d="M.05 3.555A2 2 0 0 1 2 2h12a2 2 0 0 1 1.95 1.555L8 8.414.05 3.555zM0 4.697v7.104l5.803-3.558L0 4.697zM6.761 8.83l-6.57 4.027A2 2 0 0 0 2 14h12a2 2 0 0 0 1.808-1.144l-6.57-4.027L8 9.586l-1.239-.757zm3.436-.586L16 11.801V4.697l-5.803 3.546z" />
						</svg>
						寄信送出更改密碼
					</button>
				</H3>
			</div>
		</div>
	</form>
	<%@ include file="../Foot.jsp"%>
</body>
</html>
<%@page import="com.web.game.member.model.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../Link.jsp" %>
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
<title>會員登入</title>
</head>
<body>
	<%@ include file="../Header.jsp" %>

	<form action="<c:url value='/member/SignIn'/>" method="post">

		<div>
			<h2>登入GameDB會員</h2>
			<h3>
				帳號:<input type="text" name="sAccount" minlength="6" maxlength="20"
					placeholder="請輸入帳號" required="required">
			</h3>
			<h3>
				密碼:<input type="password" name="sPassword" placeholder="請輸入密碼"
					minlength="8" maxlength="16" required="required">
			</h3>
			<label style="color: red">${showError}</label>
			<br> <label><input type="checkbox">記住我的帳號密碼</label><br>
			<input name="Signin" type="submit" value="Signin">
			<div>
				<a href="">忘記帳號</a><a href="">忘記密碼</a>
			</div>
		</div>

	</form>

	<%@ include file="../Foot.jsp" %>
</body>
</html>
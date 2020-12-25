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
</head>
<body>
	<%@ include file="../Header.jsp"%>

	<form action="<c:url value='######'/>" method="post">
		<div>
			<H3>
				設定的帳號:<input type="text" name="sAccount">
			</H3>
			<H3>
				設定的信箱:<input type="text" name="sEmail">
			</H3>
			<H3>
				<button id="button">找回密碼</button>
			</H3>
		</div>
	</form>
	<%@ include file="../Foot.jsp"%>
</body>
</html>
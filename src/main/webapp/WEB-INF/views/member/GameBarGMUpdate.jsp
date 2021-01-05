<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../Link.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
	response.setContentType("text/html;charset=UTF-8");
response.setHeader("Cache-Control", "no-cache"); // HTTP 1.1
response.setHeader("Pragma", "no-cache"); // HTTP 1.0
response.setDateHeader("Expires", -1); // Prevents caching at the proxy server
request.setCharacterEncoding("UTF-8");
%>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<title>會員資料更新</title>
<%-- <script src="<c:url value='../js/MemberUpdate.js'/>"></script> --%>

</head>
<body>
	<H1 align='center'>會員後台管理</H1>
	<hr>
	<%@ include file="../Header.jsp"%>
	<div align='center'>
		<form action="<c:url value='/member/${sAccount}'/>" method="post">
			<div align='left'
				style="border: 3px solid gray; width: 600; height: 500">
				<h3>
					<input name="iNo" type="hidden" value="${user.iNo}" readonly>
				</h3>
				<h3>
					會員帳號:${user.sAccount}<input type="hidden" name="sAccount"
						value="${user.sAccount}" readonly>
				</h3>
				<h3>
					會員密碼:<input type="password" name="sPassword"
						value="${user.sPassword}" readonly>
				</h3>
				<h3>
					更改暱稱:${user.sNickname}<input type="hidden" id="Nickname"
						name="sNickname" value="${user.sNickname}">
				</h3>
				<h3>
					更改真實姓名:<input type="text" id="Ename" name="sEname"
						pattern="^[\u4e00-\u9fa5]+$" minlength="2" maxlength="4"
						value="${user.sEname}">
				</h3>
				<h3>
					居住城市:${user.sAddress}<input type="hidden" id="Address"
						name="sAddress" value="${user.sAddress}">
				</h3>
				<h3>
					更改信箱:<input type="text" id="Email" name="sEmail"
						pattern="^[a-z0-9]+([._\\-]*[a-z0-9])*@([a-z0-9]+[-a-z0-9]*[a-z0-9]+[.]){1,63}[a-z0-9]+$"
						value="${user.sEmail}">
				</h3>
				<h3>
					更改手機號碼:<input type="text" id="Phone" name="sPhone" maxlength="10"
						pattern="[0]{1}[9]{1}\d{8}" value="${user.sPhone}">
				</h3>
				<h3>
					性別:${user.sGender}<input type="hidden" name="sGender"
						value="${user.sGender}" readonly>
				</h3>
				<h3>
					生日年月日:${user.sBirthday}<input type="hidden" name="sBirthday"
						value="${user.sBirthday}" readonly>
				</h3>
				<h3>
					建立日期:${user.registerDate}<input type="hidden" name="registerDate"
						value="${user.registerDate}" readonly>
				</h3>
				<td><input id="submit" name="submit" type="submit" value="修改"></td>
			</div>
	</div>
	</form>
	<%@ include file="../Foot.jsp"%>
</body>
</html>
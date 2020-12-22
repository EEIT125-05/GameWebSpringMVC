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
%>

<head>
<meta charset="UTF-8">
<!--     <meta name="viewport" content="width=device-width, initial-scale=1.0"> -->
<title>會員資料</title>

</head>
<body>
	<%@ include file="../Header.jsp"%>

	<div>
		<form action="<c:url value='/member/Delete'/>" method="post"
			modelAttribute="user">
			<input type="hidden" name="iNo" value="${user.iNo}"> 
			<input type="hidden" name="sAccount" value="${user.sAccount}">
			<input type="submit" name="submit" value="刪除會員">
		</form>
	</div>

	<div>
		<form action="<c:url value='/member/Update'/>" method="post"
			modelAttribute="user">
			<h2>會員資料</h2>
			<input type="hidden" name="iNo" ${user.iNo} readonly>
			<h3>
				設定的帳號:<input name="sAccount" value="${user.sAccount}" readonly>
				<input type="hidden" name="sPassword" value="${user.sPassword}"
					readonly>
			</h3>
			<h3>
				使用的暱稱:<input name="sNickname" value="${user.sNickname}" readonly>
			</h3>
			<h3>
				使用的信箱:<input name="sEmail" value="${user.sEmail}" readonly>
			</h3>
			<h3>
				真實姓名:<input name="sEname" value="${user.sEname}" readonly>
			</h3>
			<h3>
				手機號碼:<input name="sPhone" value="${user.sPhone}" readonly>
			</h3>
			<h3>
				聯絡地址:<input name="sAddress" value="${user.sAddress}" readonly>
			</h3>
			<h3>
				性別:<input name="sGender" value="${user.sGender}" readonly>
			</h3>
			<h3>
				生年月日:<input name="sBirthday" value="${user.sBirthday}" readonly>
			</h3>
			<h3>
				建立日期:<input name="registerDate" value="${user.registerDate}"
					readonly>
			</h3>
			<input type="submit" name="submit" value="修改會員資料">
		</form>
	</div>
	<%@ include file="../Foot.jsp"%>
</body>
</html>

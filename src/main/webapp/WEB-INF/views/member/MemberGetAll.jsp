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
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style>
table, th, td {
	border: 3px solid gray;
}
</style>
<title>管理會員資料</title>
</head>
<body>
	<%@ include file="../Header.jsp"%>

	<%-- 	<form action="<c:url value='/member/Allmember'/>" method="post"> --%>
	<c:choose>
		<c:when test="${empty users}">沒有任何會員資料<br>
		</c:when>

		<c:otherwise>
			<table style="text-align:center;">
				<tr>
					<th width='30'>帳號</th>
					<th width='30'>暱稱</th>
					<th width='30'>姓名</th>
					<th width='30'>信箱</th>
					<th width='30'>手機號碼</th>
					<th width='30'>性別</th>
					<th width='30'>生日</th>
					<th width='30'>建立日期</th>
					<th width='30'>資料維護</th>
				</tr>
				<c:forEach var='user' items='${users}'>
					<tr>
						<td>${user.sAccount}</td>
						<td>${user.sNickname}</td>
						<td>${user.sEname}</td>
						<td>${user.sEmail}</td>
						<td>${user.sPhone}</td>
						<td>${user.sGender}</td>
						<td>${user.sBirthday}</td>
						<td>${user.registerDate}</td>
						<td><a href="<c:url value='/member/Delete'/>">刪除</td>
					</tr>
				</c:forEach>
			</table>
		</c:otherwise>
	</c:choose>
	<!-- 	</form> -->
	<%@ include file="../Foot.jsp"%>
</body>
</html>
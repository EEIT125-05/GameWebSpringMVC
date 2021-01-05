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
<style>
table, th, td {
	border: 3px solid gray;
}
</style>
<title>管理會員資料</title>
</head>
<%@ include file="../Header.jsp"%>
<body>
	<H1 align='center'>會員後台管理</H1>
	<hr>
	<form>
		<input type='hidden' name='_method' value='DELETE'>
	</form>
	<div align='center'>
		<c:choose>
			<c:when test="${empty users}">沒有任何會員資料<br>
			</c:when>

			<c:otherwise>
				<table style="text-align: center;">
					<tr>
						<th width='30'>編號</th>
						<th width='30'>照片</th>
						<th width='30'>帳號</th>
						<th width='30'>暱稱</th>
						<th width='30'>姓名</th>
						<th width='30'>信箱</th>
						<th width='30'>手機號碼</th>
						<th width='30'>性別</th>
						<th width='30'>生日</th>
						<th width='30'>建立日期</th>
						<th width='30'>狀態</th>
						<th width='30'>資料維護</th>
					</tr>
					<c:forEach var='user' items='${users}'>
						<tr>
							<td>${user.iNo}</td>
							<td><img width='60' height='72'
								src='/member/picture/${user.sAccount}' /></td>
							<%-- 							<td><a href="<c:url value='/member/${user.iNo}'/>" --%>
							<%-- 								method="post">${user.iNo}</a></td> --%>
							<td><a href="<c:url value='/member/Update/${user.sAccount}'/>">
									<input type="button" value="${user.sAccount}"></a></td>
							<%-- 							<td>${user.sAccount}</td> --%>
							<td>${user.sNickname}</td>
							<td>${user.sEname}</td>
							<td>${user.sEmail}</td>
							<td>${user.sPhone}</td>
							<td>${user.sGender}</td>
							<td>${user.sBirthday}</td>
							<td>${user.registerDate}</td>
							<td><a
								href="<c:url value='/member/Change/${user.sAccount}'/>">
								<input type="button" value="${user.status}"></a></td>
							<td><a class='deletelink'
								href="<c:url value='/member/delete/${user.iNo}'/>">刪除</a></td>
						</tr>
					</c:forEach>
				</table>
			</c:otherwise>
		</c:choose>
	</div>
	<script>
		$(document).ready(function() {
			$('.deletelink').click(function() {
				if (confirm('確定刪除此筆紀錄? ')) {
					var href = $(this).attr('href');
					$('form').attr('action', href).submit();
				}
				return false;
			});
		})

// 		window.onload = function() {
// 			var Status = document.getElementById("Status");
// 			Status.onclick = function() {
// 				var status = document.getElementById("Status").value.trim();
// 				var xhr = new XMLHttpRequest();
// 				xhr.open("POST", "<c:url value='/member/${user.sAccount}' />",
// 						true);
// 				xhr.setRequestHeader("Content-Type",
// 						"application/x-www-form-urlencoded");
// 				xhr.send("status=" + status);
// 				xhr.onreadystatechange = function() {
// 					if (xhr.readyState == 4 && xhr.status == 200) {
// 						if (Status.getAttribute('value') == 'true') {
// 							Status.setAttribute('value', 'false')
// 						} else if (Status.getAttribute('value') == 'false') {
// 							Status.setAttribute('value', 'true')
// 						}
// 					}
// 				}
// 			}
// 		}
		// 			var xhr = new XMLHttpRequest();
		// 			xhr.open("POST", "<c:url value='/member/${user.sAccount}' />",true);
		// 			xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
		// 			xhr.send("Status=" + Status);
		// 			xhr.onreadystatechange = function() {
		// 				if (xhr.readyState == 4 && xhr.status == 200) {
		// 					console.log("2222222222222222222222222222");
		// 					var result = JSON.parse(xhr.responseText);
		// 					console.log("xxxxxxxxxxxxxxxxx");

		// 		}
	</script>
</body>
<%@ include file="../Foot.jsp"%>
</html>
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
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>會員資料</title>
<style>
input {
	border-radius: 10px;
}
</style>
</head>
<body>
	<H1 align='center'>會員資料管理</H1>
	<hr>
	<%@ include file="../Header.jsp"%>
	<div align='center'>
		<div align='left'
			style="border: 3px solid gray; width: 500; height: 700;border-radius: 5px;">
			<form action="<c:url value='/member/Update'/>" method="post">
				<div align='center' style="padding-top: 15">
					<div>
						<!-- 						style="border: 1px solid gray; width: 202; height: 202"> -->
						<img style="width: 250; height: 175;"
							src="<c:url value='/member/picture?sAccount=${user.sAccount}'/>">
					</div>
				</div>
				<hr>
				<input type="hidden" name="iNo" ${user.iNo} readonly>
				<h3>
					設定的帳號:${user.sAccount}<input type="hidden" name="sAccount"
						value="${user.sAccount}" readonly> <input type="hidden"
						name="sPassword" value="${user.sPassword}" readonly>
				</h3>
				<h3>
					使用的信箱:${user.sEmail}<input type="hidden" name="sEmail"
						value="${user.sEmail}" readonly>
				</h3>
				<h3>
					真實姓名:${user.sEname}<input type="hidden" name="sEname"
						value="${user.sEname}" readonly>
				</h3>
				<h3>
					使用的暱稱:${user.sNickname}<input type="hidden" name="sNickname"
						value="${user.sNickname}" readonly>
				</h3>
				<h3>
					手機號碼:${user.sPhone}<input type="hidden" name="sPhone"
						value="${user.sPhone}" readonly>
				</h3>
				<h3>
					居住城市:${user.sAddress}<input type="hidden" name="sAddress"
						value="${user.sAddress}" readonly>
				</h3>
				<h3>
					性別:${user.sGender}<input type="hidden" name="sGender"
						value="${user.sGender}" readonly>
				</h3>
				<h3>
					生年月日:${user.sBirthday}<input type="hidden" name="sBirthday"
						value="${user.sBirthday}" readonly>
				</h3>
				<h3>
					建立日期:${user.registerDate}<input type="hidden" name="registerDate"
						value="${user.registerDate}" readonly>
				</h3>
				<H3 align='center'>
					<input type="submit" name="submit" value="修改會員資料" style="background-color: yellow;">
				</H3>
			</form>
		</div>
	</div>

	<%@ include file="../Foot.jsp"%>
</body>
</html>

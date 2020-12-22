<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../Link.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<title>刪除帳號</title>

</head>
<body>
	<%@ include file="../Header.jsp"%>
	<form action="<c:url value='/member/Membercheckdelete' />"
		method="post" modelAttribute="user">
		<div>
			要刪除的帳號: ${user.sAccount}
			<input name="iNo" type="hidden" value="${user.iNo}"> 
			<input name="submit" type="submit" value="確定刪除">
		</div>
	</form>
	<%@ include file="../Foot.jsp"%>
</body>
</html>
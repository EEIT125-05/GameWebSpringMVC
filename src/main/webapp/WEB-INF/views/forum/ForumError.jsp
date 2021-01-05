<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../Link.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GameBar</title>
</head>
<body>
<%@ include file="../Header.jsp" %>

<p>發生錯誤,請重新操作!</p>
<p>${errorMessage}</p>

<a href="<c:url value='/forum/Index'/>">回首頁</a>



<%@ include file="../Foot.jsp" %>
</body>
</html>
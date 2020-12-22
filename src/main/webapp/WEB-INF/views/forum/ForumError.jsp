<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../Link.jsp" %>
<%
request.setCharacterEncoding("UTF-8");
response.setContentType("text/html;charset=UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ForumError</title>
</head>
<body>
<%@ include file="../Header.jsp" %>

<p>發生錯誤,請重新操作!</p>
<p>${updateMessage}</p>

<a href="<c:url value='/forum/Index'/>">回首頁</a>



<%@ include file="../Foot.jsp" %>
</body>
</html>
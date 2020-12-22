<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../Link.jsp" %>
<%
request.setCharacterEncoding("UTF-8");
response.setContentType("text/html;charset=UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<title>ContestThanks</title>
</head>
<body>
<%@ include file="../Header.jsp" %>

<p>比賽${sContestConfirm}完成</p>
<a href="<c:url value='/contest/Index'/>">回首頁</a>

<%@ include file="../Foot.jsp" %>
</body>
</html>
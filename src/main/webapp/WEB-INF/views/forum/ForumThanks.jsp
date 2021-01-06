<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../Link.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GameBar</title>
</head>
<body>
<%@ include file="../Header.jsp" %>

<p>貼文${sForumConfirm}完成</p>
<a href="<c:url value='/forum/Index'/>">回首頁</a>

<%@ include file="../Foot.jsp" %>
</body>
</html>
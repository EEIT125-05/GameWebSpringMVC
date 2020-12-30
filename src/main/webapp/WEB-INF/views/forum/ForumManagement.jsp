<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<%@ include file="../Link.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ForumManagement</title>

</head>
<body>
<%@ include file="../Header.jsp" %>

<p>貼文管理</p>
<form action="<c:url value='/forum/Update'/>" method="get">
	<c:forEach var="forum" items="${lForumList}">
	<div>
		標題: <c:out value="${forum.sTitle}"/>
		<button type="submit" name="updateNo" value="${forum.iNo}">更改</button>
		<button type="submit" name="deleteNo" value="${forum.iNo}">刪除</button>
	</div>
	</c:forEach>
</form>

<%@ include file="../Foot.jsp" %>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ include file="../Link.jsp" %>
<%
request.setCharacterEncoding("UTF-8");
response.setContentType("text/html;charset=UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ForumConfirm</title>
</head>
<body>
<%@ include file="../Header.jsp" %>

<p>貼文資料確認</p>

<form action="<c:url value='/forum/Confrim'/>" method="post">

	<p>分類: ${fForumBean.sCategory} 標題: ${fForumBean.sTitle}</p>

	<c:set var="text" value="${fForumBean.sText}" />
			<%
				request.setAttribute("vEnter", "\n");  
			%>
	<span>內文:</span><br><span>${fn:replace(text,vEnter,"<br>")}</span>
	<hr>
	<input type="submit" name="confirm" value="確認${sForumConfirm}"/>
	
<%-- 	<c:if test="${sessionScope.ForumConfirm == 'create'}"> --%>
<!-- 		<button type="submit" name="confirm" value="create">確認新增</button> -->
<%-- 	</c:if> --%>
<%-- 	<c:if test="${sessionScope.ForumConfirm == 'update'}"> --%>
<!-- 		<button type="submit" name="confirm" value="update">確認更改</button> -->
<%-- 	</c:if> --%>
<%-- 	<c:if test="${sessionScope.ForumConfirm == 'delete'}"> --%>
<!-- 		<button type="submit" name="confirm" value="delete">確認刪除</button> -->
<%-- 	</c:if> --%>
</form>


<%@ include file="../Foot.jsp" %>
</body>
</html>
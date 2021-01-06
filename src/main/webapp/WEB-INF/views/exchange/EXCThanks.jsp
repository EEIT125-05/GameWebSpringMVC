<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../Link.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>message</title>
</head>
<body>
	<%@ include file="../Header.jsp"%>

	<div class="container">

	<h1>${action }成功</h1>
	<c:choose>
		<c:when test="${action=='刪除' }">

			<form action="<c:url value="/exchange/management"/>" method="get">
				<button type="submit" value="manager" name="decisions">返回刪除</button>
			</form>

		</c:when>
		<c:when test="${action=='更新' }">
			<form action="<c:url value="/exchange/management"/>" method="get">
				<button type="submit" value="manager" name="decisions">返回管理</button>
			</form>

		</c:when>
		<c:when test="${action=='新增' }">

			<form action="<c:url value="/exchange/Index"/>" method="GET">
				<button type="submit" value="insert" name="decisions">返回主頁</button>
			</form>

		</c:when>
		<c:otherwise>
		<form action="<c:url value="/exchange/management"/>" method="get">
				<button type="submit" value="manager" name="decisions">返回管理</button>
			</form>
		</c:otherwise>
	</c:choose>
</div>
	<%@ include file="../Foot.jsp"%>
</body>
</html>
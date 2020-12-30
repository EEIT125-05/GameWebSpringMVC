<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ include file="../Link.jsp"%>
<%
	request.setCharacterEncoding("UTF-8");
response.setContentType("text/html;charset=UTF-8");
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>WithIndex</title>
<link rel="stylesheet" href="../css/WithGame.css">
<!-- <script src="../js/ContestIndex.js"></script> -->
</head>
<body>
	<%@ include file="../Header.jsp"%>



	<%-- 	<form action="<c:url value='/withplay/WithController'/>" method="get"> --%>
	<!--用get方式送資料,方便以後製作超連結 -->
	<form action='${pageContext.request.contextPath}/withplay/select'>
		<label>依暱稱搜尋: </label> <input type="text" name="sNickname"> <input
			type="Submit" value="搜尋">
	</form>

	<c:forEach var="With" items="${With}">
		<div class="div1">
			<figure class="fi1">
				<a href=""> <img class="img1"
					src='${pageContext.request.contextPath}/withplay/picture/${With.iId}'>
				</a>
				<figcaption>${With.sNickname}</figcaption>
				<figcaption>${With.sGame}</figcaption>
			</figure>
		</div>
	</c:forEach>
	<%-- 	</form> --%>

	<%@ include file="../Foot.jsp"%>

</body>
</html>
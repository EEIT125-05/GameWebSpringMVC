<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="../Link.jsp" %>
<%
request.setCharacterEncoding("UTF-8");
response.setContentType("text/html;charset=UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ContestConfirm</title>
</head>
<body>
<%@ include file="../Header.jsp" %>

<p>比賽資料確認</p>

<form action="<c:url value='/contest/Confirm'/>" method="post">
	<p>比賽名稱: ${cContestBean.sName}</p>
	<p>比賽遊戲: ${cContestBean.sGame}</p>
	<p>報名時間: ${cContestBean.dSignStart}~${cContestBean.dSignEnd}</p>
	<fmt:formatDate var="sTime" value="${cContestBean.tTime}" pattern="yyyy-MM-dd HH:mm"/>
	<p>比賽時間: ${sTime} </p>
	<p>比賽地點: ${cContestBean.sLocation}</p>
	<p>參加人數: ${cContestBean.iPeople}</p>

	<c:set var="rule" value="${cContestBean.sRule}" />
			<%
				request.setAttribute("vEnter", "\n");  
			%>
	<span>比賽規則:</span><br><span>${fn:replace(rule,vEnter,"<br>")}</span>
	<br>
	<hr>
		<c:if test="${sContestConfirm == '報名' }">
			<p>遊戲ID: ${pParticipateBean.sGameId}</p>
			<hr>
		</c:if>
		<input type="submit" name="confirm" value="確認${sContestConfirm}"/>
		
<%-- 	<button type="submit" name="confirm" value="${sContestConfirm}">確認${sContestConfirm}</button> --%>
<%-- 	<c:if test="${sessionScope.ContestConfirm == 'create'}"> --%>
<!-- 		<button type="submit" name="confirm" value="create">確認新增</button> -->
<%-- 	</c:if> --%>
<%-- 	<c:if test="${sessionScope.ContestConfirm == 'update'}"> --%>
<!-- 		<button type="submit" name="confirm" value="update">確認更新</button> -->
<%-- 	</c:if> --%>
<%-- 	<c:if test="${sessionScope.ContestConfirm == 'delete'}"> --%>
<!-- 		<button type="submit" name="confirm" value="delete">確認刪除</button> -->
<%-- 	</c:if> --%>
<%-- 	<c:if test="${sessionScope.ContestConfirm == 'participate'}"> --%>
<%-- 		<c:set var="gameId" value="${param.gameID}" scope="session"/> --%>
<%-- 		<p>遊戲ID: <c:out value="${param.gameID}"/></p> --%>
<!-- 		<button type="submit" name="confirm" value="participate">確認報名</button> -->
<%-- 	</c:if> --%>

</form>

<%@ include file="../Foot.jsp" %>
</body>
</html>
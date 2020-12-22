<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ include file="../Link.jsp" %>
<%
request.setCharacterEncoding("UTF-8");
response.setContentType("text/html;charset=UTF-8");
%> 
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ContestManagement</title>
</head>

<body>
<%@ include file="../Header.jsp" %>

<p>比賽管理</p>
	<c:if test="${empty lContestList}">
		<p>目前無資料</p>
	</c:if>
	
	<form action="<c:url value='/contest/Update'/>" method="get">
<!-- 	<input type="hidden" name="_method" value="put" /> -->
	<c:forEach var="cContest" items="${lContestList}">
	<label style="border:2px solid red;margin:10px;padding:2px">
		比賽名稱: ${cContest.sName}<br>
		比賽遊戲: ${cContest.sGame}<br> 
		報名日期: ${cContest.dSignStart}~${cContest.dSignEnd}<br>
		比賽時間: ${cContest.tTime}<br>
		報名人數: ${fn:length(cContest.lParticipateBeans)}/${cContest.iPeople}<br>
		
		<c:set var="now" value="<%=new java.util.Date()%>" />
		<fmt:formatDate var="today" pattern="yyyy-MM-dd" value="${now}" />
		
		<c:choose>
			<c:when test="${cContest.dSignEnd < today}">
				<button type="submit" name="updateNo" value="${cContest.iNo}" disabled>更改</button>
			</c:when>
			<c:otherwise>
				<button type="submit" name="updateNo" value="${cContest.iNo}">更改</button>
			</c:otherwise>
		</c:choose>
		<button type="submit" name="deleteNo" value="${cContest.iNo}">刪除</button>
		<c:if test="${cContest.dSignEnd < today}">
			<button type="submit" name="scheduleNo" value="${cContest.iNo}">管理賽程</button>
		</c:if>

	</label>
	</c:forEach>
	</form>

<%@ include file="../Foot.jsp" %>
</body>
</html>
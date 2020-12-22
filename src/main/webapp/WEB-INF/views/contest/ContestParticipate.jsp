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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ContestParticipate</title>
</head>
<body>
<%@ include file="../Header.jsp" %>

<form action="<c:url value='/contest/Information'/>" method="get">
	<c:if test="${empty lParticipateList}">
			目前無資料
	</c:if>
	<c:forEach var="participate" items="${lParticipateList}">
	<button type="submit" name="contestNo" value="${participate.cContestBean.iNo}" 
			style="border:2px solid red;background-color:transparent;margin:10px;padding:2px;text-align:left">
		比賽名稱: ${participate.cContestBean.sName}<br>
		比賽遊戲: ${participate.cContestBean.sGame}<br> 
		報名日期: ${participate.cContestBean.dSignStart}~${participate.cContestBean.dSignEnd}<br>
		比賽時間: ${participate.cContestBean.tTime}
	</button>
	</c:forEach>
</form>






<%@ include file="../Foot.jsp" %>
</body>
</html>
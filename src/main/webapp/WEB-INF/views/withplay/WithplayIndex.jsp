<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
<!-- <script src="../js/ContestIndex.js"></script> -->
</head>
<body>
	<%@ include file="../Header.jsp"%>
	<%-- 
<c:set var = "user" scope = "session" value = "jack"/>
 --%>


	<p>首頁</p>

	<form action="<c:url value='/withplay/edit'/>" method="get">
		
		<label>依暱稱搜尋: </label>
		<input type="text" name="sNickname">
		<input type="Submit" value="搜尋">
	</form>
	<form action="<c:url value='/withplay/WithController'/>" method="get">
		<!--用get方式送資料,方便以後製作超連結 -->

		<c:if test="${empty lContestList}">
			<p>目前無資料</p>
		</c:if>

		<c:forEach var="cContest" items="${lContestList}">
			<button type="submit" name="contestId" value="${cContest.iNo}"
				style="border: 2px solid red; background-color: transparent; margin: 10px; padding: 2px; text-align: left">
				比賽名稱: ${cContest.sName} <br> 比賽遊戲: ${cContest.sGame} <br>
				報名日期: ${cContest.dSignStart}~${cContest.dSignEnd} <br> 比賽時間:
				${cContest.tTime} <br> 參加人數:
				${fn:length(cContest.sParticipateBeans)}/${cContest.iPeople}
			</button>
		</c:forEach>
	</form>

	<%@ include file="../Foot.jsp"%>
	
</body>
</html>
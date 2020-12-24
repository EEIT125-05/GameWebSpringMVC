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
<title>ContestIndex</title>
<script src="${pageContext.request.contextPath}/js/ContestIndex.js"></script>
</head>
<body>
<%@ include file="../Header.jsp" %>

	<p>首頁</p>
	
	<form>
		<label>依名稱搜尋: </label> 
			<input id="sSearch" type="text" name="sSearch">
        <label>進階條件: </label>
		<label>遊戲</label>
			<select id="sGame" name="sGame">
		    	<option value="">全部</option>
				<c:forEach var="sGame" items="${lGameList}">
	            	<option value="${sGame}">${sGame}</option>
				</c:forEach>
            </select>
		<label>時程</label>
			<select id="sSignDate" name="sSignDate">
		    	<option value="">全部</option>
		    	<option value="and dSignStart > getdate()">未開始報名</option>
		    	<option value="and dSignStart <= getdate() and dateadd(day,-1,getdate()) <= dSignEnd">已開始報名</option>
		    	<option value="and dSignEnd < dateadd(day,-1,getdate())">已截止報名</option>
	        </select>			
		<label>報名狀況</label>
			<select id="sSign" name="sSign">
		    	<option value="">全部</option>
		    	<option value="nofull">未額滿</option>
		    	<option value="full">已額滿</option>
	        </select>			
		<input type="button" id="submit" name="select" value="查詢">
	</form>	
<%-- 	<form action="<c:url value='/contest/Information'/>" id="point" method="get" > --%>
	<div id="point">
						<!--用get方式送資料,方便以後製作超連結 -->
		
		<c:if test="${empty lContestList}">
			<p>目前無資料</p>
		</c:if>
	
		<c:forEach var="cContest" items="${lContestList}">
			<button type="submit" name="contestNo" value="${cContest.iNo}" 
				style="border:2px solid red;background-color:transparent;margin:10px;padding:2px;text-align:left">
				比賽名稱: ${cContest.sName}
				<br>
				 比賽遊戲: ${cContest.sGame}
				<br> 
				報名日期: ${cContest.dSignStart}~${cContest.dSignEnd}
				<br> 
				<fmt:formatDate var="sTime" value="${cContest.tTime}" pattern="yyyy-MM-dd HH:mm"/>
				比賽時間: ${sTime}
				<br>
				參加人數: ${fn:length(cContest.lParticipateBeans)}/${cContest.iPeople}											
			</button>
		</c:forEach>
	</div>
<!-- 	</form> -->

<%@ include file="../Foot.jsp" %>
</body>
</html>
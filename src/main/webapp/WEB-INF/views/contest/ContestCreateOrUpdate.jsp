<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
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
<title>ContestCreate</title>
<style>
.error{
	color:red;
}
</style>
<%-- <script src="<c:url value='/js/ContestCreate.js'/>"></script> --%>

</head>
<body>
<%@ include file="../Header.jsp" %>
	
	<p>舉辦比賽資料</p>
	
		<form:form method="POST" modelAttribute="cContestBean">
			<div>
            <label for="sName">比賽名稱: </label> 
            <form:input type="text" id="sName" path="sName"/>
            <form:errors path="sName" class="error"/>
            <label class="error"></label>
        </div>
        <div>
            <label>比賽項目: </label>
            <form:select id="" path="sGame">
            	<form:options items="${lGameList}"/>
            </form:select>
            <form:errors path="sGame"/>
            <label></label>
        </div>
        <div>
        	<c:set var="sSignStart" value="${cContestBean.dSignStart}"/>
        	<c:set var="sSignEnd" value="${cContestBean.dSignEnd}"/>
        	<fmt:formatDate var="sTime0" value="${cContestBean.tTime}" pattern="yyyy-MM-dd HH:mm"/>
        	<c:set var="sTime" value="${fn:replace(sTime0, ' ', 'T')}" />
        	
	        <c:if test="${cContestBean.dSignStart == '1000-01-01'}">
	        	<c:set var="sSignStart" value=""/>
	        </c:if>
	        <c:if test="${cContestBean.dSignEnd == '1000-01-01'}">
	        	<c:set var="sSignEnd" value=""/>
	        </c:if>
	        <c:if test="${sTime == '1970-01-01T00:00'}">
	        	<c:set var="sTime" value=""/>
	        </c:if>

            <label>報名日期: </label> <input type="date" id="sSignStart" name="sSignStart" value="${sSignStart}"/> <label>~</label>
            <input type="date" id="sSignEnd" name="sSignEnd" value="${sSignEnd}"/>
            <form:errors path="dSignStart" class="error"/>
            <label class="error"></label>
        </div>
        <div>
            <label>比賽時間: </label> 
            <input type="datetime-local" id="sTime" name="sTime" value="${sTime}"/>
            <form:errors path="tTime" class="error"/>
            <label class="error"></label>
        </div>
        <div>
            <label>比賽地點: </label> <form:input type="text" id="sLocation" path="sLocation"/>
            <form:errors path="sLocation" class="error"/>
            <label class="error"></label>
        </div>
        <div>
            <label>人數限制: </label> <form:input type="number" min="2" max="100"
                 id="iPeople" path="iPeople"/>
                 <form:errors path="iPeople" class="error"/>
            <label class="error"></label>
        </div>
        <div>
            <label>比賽規則: </label>
            <form:textarea id="sRule" path="sRule" rows="10" cols="40"/>
            <form:errors path="sRule" class="error"/>
            <label class="error"></label>
        </div>
        <hr>
        <div>
            <input type="submit" id="submit"  name="sContestConfirm" value="${sContestConfirm}"/>
        </div>
		</form:form>
		

<%@ include file="../Foot.jsp" %>
</body>
</html>
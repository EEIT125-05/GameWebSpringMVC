<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
<title>ForumDetail</title>
</head>
<body>
<%@ include file="../Header.jsp" %>

<form action="<c:url value="/forum/Reply"/>" method="post">

	<span>分類: ${fForumBean.sCategory} 標題: ${fForumBean.sTitle}</span><br>
	<span>發文時間: ${fForumBean.dDate} ${fForumBean.tTime}</span><br>
	<c:set var="text" value="${fForumBean.sText}" />
			<%
				request.setAttribute("vEnter", "\n");  
			%>
	<span>內文:</span><br><span>${fn:replace(text,vEnter,"<br>")}</span>
	<hr>
	<div  style="position:relative">
		<c:forEach var="reply" items="${fForumBean.sReplyBeans}">
			<jsp:useBean id="nowDate" class="java.util.Date"/>
			<fmt:formatDate var="dateString" value="${nowDate}" pattern="yyyy-MM-dd"/>
<%-- 			<fmt:formatDate var="timeString" value="${nowDate}" pattern="HH:mm:ss"/> 先留著 要做XX分內可以拿來用--%>
			<fmt:parseDate var="Date" value="${dateString}" pattern="yyyy-MM-dd"/>
			<fmt:parseDate var="replyDate" value="${reply.dDate}" pattern="yyyy-MM-dd"/>
			<c:choose>
				<c:when test="${Date.time - replyDate.time == 0}">
					<c:set var="timeString" value="今日 ${reply.tTime}"/>			
				</c:when>
				<c:when test="${Date.time - replyDate.time == 86400000}">
					<c:set var="timeString" value="昨日 ${reply.tTime}"/>			
				</c:when>
				<c:otherwise>
					<c:set var="timeString" value="${reply.dDate} ${reply.tTime}"/>							
				</c:otherwise>
			</c:choose>
			<label>${reply.sAuthor}</label>
			<label> : ${reply.sText}</label>
			<label style="position:absolute;right:0">${timeString}</label>
			<br>
		</c:forEach>
	</div>
	
	<hr>
	
	<label>回覆: </label>
	<input type="text" id="reply" name="sText" required>
	<button type="submit" id="replySubmit" name="forumNo" value="${fForumBean.iNo}">送出</button>
	<label></label>
</form>
<a href="<c:url value='/forum/Index'/>">回首頁</a>

<%@ include file="../Foot.jsp" %>
</body>
</html>
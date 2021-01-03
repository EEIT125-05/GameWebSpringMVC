<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="UTF-8"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix='form' uri="http://www.springframework.org/tags/form"%>
<%@ include file="../Link.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form method="get" action="<c:url value="/exchange/ApplyForSubmit"/>">
${changeHistoryBean.no }
${changeHistoryBean.partyA.sAccount }
${changeHistoryBean.supportgamebean.gamename }
${changeHistoryBean.partyB.sAccount }
${changeHistoryBean.mygamebean.gamename }
<a href="<c:url value="ApplyForSubmit?no=${changeHistoryBean.no }"/>" >確認</a>
<a href="<c:url value="ApplyForReject?no=${changeHistoryBean.no }"/>" >駁回</a>

</form>

</body>
</html>
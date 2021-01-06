<%@ page language="java" contentType="text/html; charset=UTF-8"
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
<%@ include file="../Header.jsp"%>
<form method="post" action="<c:url value="/exchange/ApplyForSubmit"/>">
<div class="container">
<fieldset>
			<legend>交換申請</legend>
<div>
<label>您的帳號</label>
<input type="text" value="${changeHistoryBean.partyA.sAccount }" readonly />
</div>
<div>
<label>您的遊戲</label>
<input type="text" value="${changeHistoryBean.supportgamebean.gamename }" readonly />
</div>
<div>
<label>對方帳號</label>
<input type="text" value="${changeHistoryBean.partyB.sAccount }" readonly />
</div>
<div>
<label>對方遊戲</label>
<input type="text" value="${changeHistoryBean.mygamebean.gamename }" readonly />
</div>
<div>
<a class="btn btn-primary" href="<c:url value="ApplyForSubmit?no=${changeHistoryBean.no }" />" >確認</a>
<a class="btn btn-primary" href="<c:url value="ApplyForReject?no=${changeHistoryBean.no }" />" >駁回</a>
</div>
</fieldset>
</div>
</form>

<%@ include file="../Foot.jsp"%>
</body>
</html>
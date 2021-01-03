<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="../Link.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>GameBar</title>
</head>
<body>
<%@ include file="../Header.jsp" %>

<div class="container">

<h1 class="mt-4 mb-3">比賽資料確認
      <small>XXXXX</small>
    </h1>

    <ol class="breadcrumb">
      <li class="breadcrumb-item">
        <a href="<c:url value='/'/>">Home</a>
      </li>
      <li class="breadcrumb-item active">賽事</li>
    </ol>
    

	<form action="<c:url value='/contest/Confirm'/>" method="post">
		<p>比賽名稱: ${cContestBean.sName}</p>
		<p>比賽遊戲: ${cContestBean.sGame}</p>
		<p>報名時間: ${cContestBean.dSignStart}~${cContestBean.dSignEnd}</p>
		<fmt:formatDate var="sTime" value="${cContestBean.tTime}" pattern="yyyy-MM-dd HH:mm"/>
		<p>比賽時間: ${sTime} </p>
		<p>比賽地點: ${cContestBean.sLocation}</p>
		<p>參加人數: ${cContestBean.iPeople}</p>
		<c:choose>
			<c:when	test="${cContestBean.sImage == 'contestDefault.jpg'}">
				<label style="vertical-align:top">宣傳圖片(預設): </label>
			</c:when>
			<c:otherwise>
				<label style="vertical-align:top">宣傳圖片: </label>
			</c:otherwise>
		</c:choose>
		<c:choose>
<%-- 			<c:when	test="${sContestConfirm == '刪除' }"> --%>
<%-- 				<img src="<c:url value='/contest/ImageLoading?iNo=${cContestBean.iNo}'/>" style="width:560px;height:320px"/> --%>
<%-- 			</c:when> --%>
<%-- 			<c:otherwise> --%>
				<img src="<c:url value='/contest/ConfirmImage'/>" style="width:560px;height:320px"/>
<%-- 			</c:otherwise> --%>
		</c:choose>
		<br>
		<span>比賽規則:</span><br><span id="rule">${cContestBean.sRule}</span>
		<br>
		<hr>
			<c:if test="${sContestConfirm == '報名' }">
				<p>遊戲ID: ${pParticipateBean.sGameId}</p>
				<hr>
			</c:if>
			<input type="submit" name="confirm" value="確認${sContestConfirm}"/>

	</form>
</div>
<%@ include file="../Foot.jsp" %>

<script>
	$("#rule").on("click","a",function(){
		this.target = "_blank";
	});
</script>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ include file="../Link.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>GameBar</title>
</head>
<body>
<%@ include file="../Header.jsp"%>

<div class="container">

	<h1 class="mt-4 mb-3">
		比賽詳細資料 <small>XXXXX</small>
	</h1>

	<ol class="breadcrumb">
		<li class="breadcrumb-item"><a href="<c:url value='/'/>">Home</a>
		</li>
		<li class="breadcrumb-item active">賽事</li>
	</ol>

	<form action="<c:url value='/contest/Join'/>" method="post">
		<p>比賽名稱: ${cContestBean.sName}</p>
		<p>比賽遊戲: ${cContestBean.sGame}</p>
		<p>主辦者: ${cContestBean.sHost}</p>
		<p>報名日期: ${cContestBean.dSignStart} ~ ${cContestBean.dSignEnd}</p>
		<fmt:formatDate var="sTime" value="${cContestBean.tTime}" pattern="yyyy-MM-dd HH:mm"/>
		<p>比賽時間: ${sTime}</p>
		<p>比賽地點: ${cContestBean.sLocation}</p>
		<p>參加人數:
			${fn:length(cContestBean.lParticipateBeans)}/${cContestBean.iPeople}</p>
		<span>比賽規則:</span> <br> <span id="rule">${cContestBean.sRule}</span>
		<hr>
		<c:set var="now" value="<%=new java.util.Date()%>" />
		<fmt:formatDate var="today" pattern="yyyy-MM-dd" value="${now}" />

		<c:choose>
			<c:when test="${cContestBean.dSignStart > today}">
				<input type="text" name="gameID" disabled value="未開始報名">
				<br>
				<input type="checkbox" name="checkBox" required disabled>
				<label>我同意遵守比賽規則</label>
				<br>
				<button type="submit" name="join" value="join" disabled>報名比賽</button>
			</c:when>
			<c:otherwise>
				<c:choose>
					<c:when test="${cContestBean.dSignEnd < today}">
						<input type="text" name="gameID" disabled value="已截止報名">
						<br>
						<input type="checkbox" name="checkBox" required disabled>
						<label>我同意遵守比賽規則</label>
						<br>
						<button type="submit" name="join" value="join" disabled>報名比賽</button>
					</c:when>
					<c:otherwise>
						<c:choose>
							<c:when
								test="${fn:length(cContestBean.lParticipateBeans) == cContestBean.iPeople}">
								<input type="text" name="gameID" disabled value="參加人數已額滿">
								<br>
								<input type="checkbox" name="checkBox" required disabled>
								<label>我同意遵守比賽規則</label>
								<br>
								<button type="submit" name="join" value="join" disabled>報名比賽</button>
							</c:when>
							<c:otherwise>
								遊戲ID: <input type="text" name="sGameId" required>
								<br>
								<input type="checkbox" id="checkBox" name="checkBox" required>
								<label for="checkBox">我同意遵守比賽規則</label>
								<br>
								<button type="submit" id="join" name="join" value="join">報名比賽</button>
							</c:otherwise>
						</c:choose>
					</c:otherwise>
				</c:choose>
			</c:otherwise>
		</c:choose>

	</form>

</div>
<%@ include file="../Foot.jsp"%>

<script>
	$("#rule").on("click","a",function(){
		this.target = "_blank";
	});
	
	$(function(){
		$("#join").on("click", function(){
			return confirmJoin();
		});
	});

	function confirmJoin(){
	  var result = confirm("確認參加?");
	  if (result) {
	      return true;
	  }
	  return false;
	}
</script>

</body>
</html>
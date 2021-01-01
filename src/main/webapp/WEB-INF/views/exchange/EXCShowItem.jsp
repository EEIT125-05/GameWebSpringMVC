<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../Link.jsp"%>

<%
	// request.getSession(true).setAttribute("account", "admin1234");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>管理頁面</title>
</head>
<body>
	<%@ include file="../Header.jsp"%>

	<h1>管理 / ${user.sAccount }</h1>

	<h4>我要換/共${fn:length(MemberSupport)}筆</h4>
	<c:choose> 	
		<c:when test="${empty MemberSupport}">
	查無資料<br>
		</c:when>
		<c:when test="${not empty MemberSupport }">

			<table border="1">
				<tr>
					<th>編號</th>
					<th>遊戲名稱</th>
					<th>數量</th>
					<th>商品位置</th>
					<th>運送方式</th>
					<th>主機平台</th>
					<th>是否含特典</th>
					<th>備註</th>
					<th>商品狀況</th>
					<th>刪除</th>
					<th>修改</th>
					<th>狀態</th>
				</tr>

				<c:forEach var='s' varStatus='vs' items='${MemberSupport }'>

					<tr>
						<td>${vs.count}</td>
						<td>${s.gamename}</td>
						<td>${s.qty}</td>
						<td>${s.gamelocation}</td>
						<td>${s.delivery}</td>
						<td>${s.console}</td>
						<td>${s.dlc}</td>
						<td>${s.remark}</td>
						<td>${s.condition}</td>

						<c:choose>
							<c:when test="${s.status == 0}">
								<td><a
									href="<c:url value="/exchange/deleteSupport?deleteindex=${s.no}"/>">刪除</a></td>
								<td><a
									href="<c:url value="/exchange/update?updateindex=${vs.index}"/>">修改</a></td>
							</c:when>
							<c:when test="${s.status == 1}">
								<td>刪除</td>
								<td>修改</td>
							</c:when>
						</c:choose>

						<td><c:choose>
								<c:when test="${s.status == 0}">
    							未換出
    							</c:when>
								<c:when test="${s.status == 1}">
    							已換出
    							</c:when>
								<c:when test="${s.status == 2}">
    							待換中
    							</c:when>
							</c:choose></td>
						
						<c:if test="${s.status == 2}">
<%-- 							<a href="<c:url value="/exchange/update?updateindex=${vs.index}"/>">審核</a> --%>
						</c:if>

					</tr>

				</c:forEach>
				</c:when>
				</c:choose>

			</table>

<br>
<h4>我要徵 /共${fn:length(MemberDemand)}筆</h4>
			<c:choose>
				<c:when test="${empty MemberDemand}">
		查無資料<br>
				</c:when>
				<c:when test="${not empty MemberDemand }">

					<table border="1">
						<tr>
							<th>編號</th>
							<th>遊戲名稱</th>
							<th>商品位置</th>
							<th>主機平台</th>
							<th>備註</th>
							<th>刪除</th>
							<th>狀態</th>
						</tr>

						<c:forEach var='d' varStatus='vs1' items='${MemberDemand }'>

							<tr>
								<td>${vs1.count}</td>
								<td>${d.gamename}</td>
								<td>${d.area}</td>
								<td>${d.console}</td>
								<td>${d.remark}</td>

								<c:choose>
									<c:when test="${d.status == 0}">
										<td><a
											href="<c:url value="/exchange/deleteDemand?deleteindex=${d.no}"/>">刪除</a></td>
									</c:when>
									<c:when test="${d.status == 1}">
										<td>刪除</td>
									</c:when>
								</c:choose>

								<td><c:choose>
										<c:when test="${d.status == 0}">
    							未徵得
    							</c:when>
										<c:when test="${d.status == 1}">
    							已徵得
    							</c:when>
									</c:choose></td>

							</tr>

						</c:forEach>
						</c:when>
						</c:choose>

					</table>

					<br>
<h4>我的遊戲庫 /共${fn:length(MemberGames)}款</h4>
			<c:choose>
				<c:when test="${empty MemberGames}">
		目前遊戲庫無任何遊戲<br>
				</c:when>
				<c:when test="${not empty MemberGames }">
					<table border="1">
						<tr>
							<th>編號</th>
							<th>遊戲名稱</th>
							<th>主機平台</th>
						</tr>

						<c:forEach var='g' varStatus='vs2' items='${MemberGames }'>
							<c:if test = "${g.status==0 }">
							<tr>
								<td>${vs2.count}</td>
								<td>${g.gamename}</td>
								<td>${g.console}</td>

							</tr>
						</c:if>
						</c:forEach>
						</c:when>
						</c:choose>

					</table>

					<br>

					<a href="<c:url value="/exchange/Index"/>">返回主頁</a>

					<%@ include file="../Foot.jsp"%>
</body>
</html>
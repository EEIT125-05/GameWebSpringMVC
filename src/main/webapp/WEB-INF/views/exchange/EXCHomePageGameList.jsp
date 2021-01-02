<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ include file="../Link.jsp"%>
<%-- <% request.getSession(true).setAttribute("account", "admin1234"); %> --%>
<%
response.setContentType("text/html;charset=UTF-8");
request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>交換主選單</title>

<style>
#expgul {
	list-style-type: none
}

#expgul>li {
	font-size: 1.5em;
}

#exdivout {
	float: left;
	margin: 0 25px;
	margin-top: 10px;
	background-color: blue;
	width: 600px;
	display: inline-flex;
	padding-top: 15px;
	padding-left: 15px;
	border: 2px solid black;
	background-color: white;
	border-radius: 15px;
	height: 350px;
}

#exdivin {
	display: inline-flex;
	height: 200px;
	margin-top: 20px;
}

#eximg {
	width: 250px;
	height: 250px;
	float: left;
	border-radius: 20px;
	border: 3px solid black;
}
</style>
</head>
<body>
	<%@ include file="../Header.jsp" %>
	<form action="<c:url value="/exchange/Search"/>" method="get">
		<div>
		<h2 style="display: inline-flex"></h2>
		<label class="t1">請輸入想要搜尋的遊戲</label> <input type="text"
			name="gamename"> <input type="submit" name="change"
			value="Search"> <br>
		<c:choose>
			<c:when test="${change == 'Search'}">
				<c:if test='${empty AllSupport}'>
			查無資料<br>
				</c:if>

				<c:forEach var='g' items='${AllSupport }'>
					<c:if
						test="${fn:contains(g.gamename,gamename) and g.status ==0}">
						<div id="exdivout">
							<div id="exdivin">
								<img id="eximg" src="${pageContext.request.contextPath }/${g.image }" alt="路徑失聯">
							</div>
							<ul id="expgul">
								<li>遊戲名稱:${g.gamename}</li>
								<li>遊戲數量:${g.qty}</li>
								<li>遊戲所在地:${g.gamelocation}</li>
								<li>運送方式:${g.delivery}</li>
								<li>主機平台:${g.console}</li>
								<li>玩家名稱:${g.gamer}</li>
								<li>是否含特點:${g.dlc}</li>
								<li>備註:${g.remark}</li>
							</ul>
							<a href="<c:url value="/exchange/applyFor?gamer=${g.gamer }&no=${g.no }"/>">申請交換</a>
							
						</div>
					</c:if>
				</c:forEach>

			</c:when>
			<c:otherwise>

				<c:forEach var='g' items='${AllSupport }'>
					<c:if test="${ g.status ==0}">
						<div id="exdivout">
							<div id="exdivin">
								<img id="eximg" src="${pageContext.request.contextPath }/${g.image }" alt="路徑失聯">
							</div>
							<ul id="expgul">
								<li>遊戲名稱:${g.gamename}</li>
								<li>遊戲數量:${g.qty}</li>
								<li>遊戲所在地:${g.gamelocation}</li>
								<li>運送方式:${g.delivery}</li>
								<li>主機平台:${g.console}</li>
								<li>玩家名稱:${g.gamer}</li>
								<li>是否含特點:${g.dlc}</li>
								<li>備註:${g.remark}</li>
							</ul>
							<a href="<c:url value="/exchange/applyFor?gamer=${g.gamer }&no=${g.no }"/>">申請交換</a>
						</div>
					</c:if>
				</c:forEach>

			</c:otherwise>
		</c:choose>
		</div>
	</form>
	<%@ include file="../Foot.jsp"%>
</body>
</html>
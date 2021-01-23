<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../Link.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
	response.setContentType("text/html;charset=UTF-8");
response.setHeader("Cache-Control", "no-cache"); // HTTP 1.1
response.setHeader("Pragma", "no-cache"); // HTTP 1.0
response.setDateHeader("Expires", -1); // Prevents caching at the proxy server
%>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Google會員資料</title>
<style>
input {
	border-radius: 10px;
}

#DIV1 {
	margin-left: 50;
}

#DIV2 {
	margin-left: 100;
	padding-left: 65px;
}

#DIV3 {
	padding: 25px;
	float: left;
}

#DIV4 {
	background-color: skyblue;
	width: 500px;
	height: 300px;
	margin: 25px;
	border: 3px solid gray;
	float: right;
}

table {
	margin: 15px;
}

.b {
	color: black;
	font-size: 22;
	font-weight: 900;
}

.a {
	width: 450px;
	height: 80px;
	border: 2px solid black;
	background-color: #272727;
	margin: auto;
	margin-bottom: 100px;
	font-size: 50;
	font-weight: 900;
}

.a:hover {
	background-color: white;
	color: black;
}

.b:hover {
	color:white;
}

.leftBar {
	width: 450px;
	height: 80px;
	border: 2px solid black;
	background-color: #fff;
	margin: auto;
	margin-bottom: 100px;
	font-size: 1.5em;
	font-weight: bold;
	border: 1px solid rgba(0, 0, 0, .125);
	border-radius: .25rem;
}

.leftBar:hover {
	background-color: white;
	color: black;
}

.row {
	flex-grow: 1; /*可佔滿垂直剩餘的空間*/
}

.detail {
	width: 1000px;
	height: 500px;
	border: 5px solid gray;
	background-color: #fff;
}
</style>
</head>
<body>

	<hr>
	<%@ include file="../Header.jsp"%>
	<div class="row">
		<div id="DIV1" class="col-md-2">
			<H1>相關記錄</H1>
			<table>
				<tr>
					<td class="leftBar"><a href="<c:url value='/member/Data'/>">會員資料</a></td>
				</tr>
				<tr>
					<td class="leftBar"><a href="####">商城記錄</a></td>
				</tr>
				<tr>
					<td class="leftBar"><a
						href="<c:url value="/forum/gotoMemberData"/>">討論區記錄</a></td>
				</tr>
				<tr>
					<td class="leftBar"><a href="####">陪玩記錄</a></td>
				</tr>
				<tr>
					<td class="leftBar"><a
						href="<c:url value="/contest/gotoMemberData"/>">賽事記錄</a></td>
				</tr>
				<tr>
					<td class="leftBar"><a
						href="<c:url value="/exchange/gotoMemberData"/>">交換記錄</a></td>
				</tr>
			</table>
		</div>
		<div class="col-md-9">
			<form action="<c:url value='/member/GoogleUpdate'/>" method="post">
				<div class="detail">
					<H1 align='center'>Google會員資料</H1>
					<div id="DIV3">
						<img style="width: 350; height: 300;"
							src="<c:url value='/member/picture?sAccount=${user.sAccount}'/>">
					</div>

					<div id="DIV4">
						<input type="hidden" name="iNo" ${user.iNo} readonly>
						<table>
							<tr class="b">
								<td>會員帳號</td>
								<td>:${user.sAccount}<input type="hidden" name="sAccount"
									value="${user.sAccount}" readonly> <input type="hidden"
									name="sPassword" value="${user.sPassword}" readonly> <input
									type="hidden" name="sPassword" value="${user.sPassword}"
									readonly></td>
							</tr>
							<tr class="b">
								<input type="hidden" name="sEmail" value="${user.sEmail}"
									readonly>
							</tr>
							<tr class="b">
								<td>真實姓名</td>
								<td>:${user.sEname}<input type="hidden" name="sEname"
									value="${user.sEname}" readonly></td>
							</tr>
							<tr class="b">
								<c:choose>
									<c:when test="${empty user.sPhone}">
										<input type="hidden" name="sPhone" value="${user.sPhone}">
									</c:when>
									<c:otherwise>
										<td>手機號碼</td>
										<td>:${user.sPhone}<input type="hidden" name="sPhone"
											value="${user.sPhone}"></td>
									</c:otherwise>
								</c:choose>
							</tr>
							<tr class="b">
								<c:choose>
									<c:when test="${empty user.sNickname}">
										<input type="hidden" name="sNickname"
											value="${user.sNickname}">
									</c:when>
									<c:otherwise>
										<td>暱稱</td>
										<td>:${user.sNickname}<input type="hidden"
											name="sNickname" value="${user.sNickname}" readonly></td>
									</c:otherwise>
								</c:choose>
							</tr>
							<tr class="b">
								<input type="hidden" name="sAddress" value="${user.sAddress}">
							</tr>
							<tr class="b">
								<c:choose>
									<c:when test="${empty user.sGender}">
										<input type="hidden" name="sGender" value="${user.sGender}">
									</c:when>
									<c:otherwise>
										<td>性別</td>
										<td>:${user.sGender}<input type="hidden" name="sGender"
											value="${user.sGender}"></td>
									</c:otherwise>
								</c:choose>
							</tr>
							<tr class="b">
								<c:choose>
									<c:when test="${empty user.sAddress}">
										<input type="hidden" name="sAddress" value="${user.sAddress}"
											readonly>
									</c:when>
									<c:otherwise>
										<td>居住城市</td>
										<td>:${user.sAddress}<input type="hidden" name="sAddress"
											value="${user.sAddress}" readonly></td>
									</c:otherwise>
								</c:choose>
							</tr>
							<tr class="b">
								<c:choose>
									<c:when test="${empty user.sBirthday}">
										<input type="hidden" name="sBirthday"
											value="${user.sBirthday}">
									</c:when>
									<c:otherwise>
										<td>生日</td>
										<td>:${user.sBirthday}<input type="hidden"
											name="sBirthday" value="${user.sBirthday}"></td>
									</c:otherwise>

								</c:choose>
							</tr>
							<tr class="b">
								<td>建立日期</td>
								<td>:${user.registerDate}<input type="hidden"
									name="registerDate" value="${user.registerDate}"></td>
							</tr>
						</table>
					</div>
					<H3 align='center' style='padding-top: 20;'>
						<button type="submit" name="submit" class="btn btn-primary">
							<svg xmlns="http://www.w3.org/2000/svg" width="40" height="40"
								fill="currentColor" class="bi bi-pencil-square"
								viewBox="0 0 16 16"> <path
								d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456l-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z" />
							<path fill-rule="evenodd"
								d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z" />
							</svg>
							修改會員資料
						</button>
					</H3>
				</div>
			</form>
		</div>
	</div>

	<%@ include file="../Foot.jsp"%>
</body>
</html>

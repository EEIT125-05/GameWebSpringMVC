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
request.setCharacterEncoding("UTF-8");
%>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<title>會員資料更新</title>
<%-- <script src="<c:url value='../js/MemberUpdate.js'/>"></script> --%>
<style>
input {
	border-radius: 10px;
}

#DIV1 {
	margin-left: 50;
}

#DIV2 {
	margin-left: 50;
	padding-left: 50px;
	padding-bottom: 30px;
}

#DIV3 {
	padding: 15px;
	float: left;
}

#DIV4 {
	background-color: skyblue;
	width: 500px;
	height: 450px;
	margin: 15px;
	border: 3px solid gray;
	float: right;
}

table {
	margin: 15px;
}

.b {
	color: black;
	font-size: 25;
	font-weight: 900;
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
	width: 1050px;
	height: 500px;
	border: 5px solid gray;
	background-color: #fff;
}
</style>
</head>
<body>
	<H1 align='center'>會員後台管理</H1>
	<hr>
	<%@ include file="../Header.jsp"%>
	<div class="row" align='center'>
		<form action="<c:url value='/member/GameBar/${sAccount}'/>"
			method="post">
			<div id="DIV2" class="col-md-9">
				<div class="detail" style='margin-bottom: 30;'>
					<div id="DIV3">
						<img style="width: 450; height: 400;"
							src="<c:url value='/member/picture?sAccount=${OneMember.sAccount}'/>"><br>
					</div>
					<div id="DIV4">
						<table>
							<tr class="b">
								<td><input name="iNo" type="hidden"
									value="${OneMember.iNo}" readonly></td>
							</tr>
							<tr>
								<H4>${OneMember.sAccount}基本資料</H4>
								<input type="hidden" name="sAccount"
									value="${OneMember.sAccount}" readonly>
							</tr>
<!-- 							<tr class="b"> -->
<!-- 								<td>會員帳號</td> -->
<%-- 								<td>:${OneMember.sEmail}<input type="hidden" id="Email" --%>
<!-- 									name="sEmail" -->
<!-- 									pattern="^[a-z0-9]+([._\\-]*[a-z0-9])*@([a-z0-9]+[-a-z0-9]*[a-z0-9]+[.]){1,63}[a-z0-9]+$" -->
<%-- 									onblur="checkEmail();" value="${OneMember.sEmail}"></td> --%>
<!-- 							</tr> -->
							<tr class="b">
								<td><input type="hidden" name="sPassword"
									value="${OneMember.sPassword}" readonly></td>
							</tr>
							<tr class="b">
								<td>會員暱稱</td>
								<td>:${OneMember.sNickname}<input type="hidden"
									id="Nickname" name="sNickname" value="${OneMember.sNickname}"></td>
							</tr>
							<tr class="b">
								<td>會員真實姓名</td>
								<td>:${OneMember.sEname}<input type="hidden" id="Ename"
									name="sEname" pattern="^[\u4e00-\u9fa5]+$" minlength="2"
									maxlength="4" value="${OneMember.sEname}"></td>
							</tr>
							<tr class="b">
								<td>會員手機號碼</td>
								<td>:${OneMember.sPhone}<input type="hidden" id="Phone"
									name="sPhone" maxlength="10" pattern="[0]{1}[9]{1}\d{8}"
									value="${OneMember.sPhone}"></td>
							</tr>
							<tr class="b">
								<td>會員居住城市</td>
								<td>:${OneMember.sAddress}</td>
							</tr>
							<tr class="b">
								<td>會員性別</td>
								<td>:${OneMember.sGender}<input type="hidden"
									name="sGender" value="${OneMember.sGender}" readonly></td>
							</tr>
							<tr class="b">
								<td>會員生日</td>
								<td>:${OneMember.sBirthday}<input type="hidden"
									name="sBirthday" value="${OneMember.sBirthday}" readonly></td>
							</tr>
							<tr class="b">
								<td>會員建立日期</td>
								<td>:${OneMember.registerDate}<input type="hidden"
									name="registerDate" value="${OneMember.registerDate}" readonly></td>
							</tr>
						</table>


						<h3 align='center' style='padding-top: 20;'>
							<!-- 					<button id="submit" name="submit" type="submit"> -->
							<!-- 						<svg xmlns="http://www.w3.org/2000/svg" width="35" height="35" -->
							<!-- 							fill="currentColor" class="bi bi-cloud-arrow-up-fill" -->
							<!-- 							viewBox="0 0 16 16"> <path -->
							<!-- 							d="M8 2a5.53 5.53 0 0 0-3.594 1.342c-.766.66-1.321 1.52-1.464 2.383C1.266 6.095 0 7.555 0 9.318 0 11.366 1.708 13 3.781 13h8.906C14.502 13 16 11.57 16 9.773c0-1.636-1.242-2.969-2.834-3.194C12.923 3.999 10.69 2 8 2zm2.354 5.146a.5.5 0 0 1-.708.708L8.5 6.707V10.5a.5.5 0 0 1-1 0V6.707L6.354 7.854a.5.5 0 1 1-.708-.708l2-2a.5.5 0 0 1 .708 0l2 2z" /> -->
							<!-- 						</svg> -->
							<!-- 						修改 -->
							<!-- 					</button> -->
							<a href="<c:url value='/member/Data'/>"><button type="button"
									class="btn btn-primary">
									<svg xmlns="http://www.w3.org/2000/svg" width="35" height="35"
										fill="currentColor" class="bi bi-backspace-fill"
										viewBox="0 0 16 16"> <path
										d="M15.683 3a2 2 0 0 0-2-2h-7.08a2 2 0 0 0-1.519.698L.241 7.35a1 1 0 0 0 0 1.302l4.843 5.65A2 2 0 0 0 6.603 15h7.08a2 2 0 0 0 2-2V3zM5.829 5.854a.5.5 0 1 1 .707-.708l2.147 2.147 2.146-2.147a.5.5 0 1 1 .707.708L9.39 8l2.146 2.146a.5.5 0 0 1-.707.708L8.683 8.707l-2.147 2.147a.5.5 0 0 1-.707-.708L7.976 8 5.829 5.854z" />
									</svg>
									回上一頁
								</button></a>
						</h3>
					</div>
				</div>
			</div>
		</form>
	</div>
	<%@ include file="../Foot.jsp"%>
</body>
</html>
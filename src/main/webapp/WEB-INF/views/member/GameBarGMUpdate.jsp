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

#DIV2 {
	background-color: #272727;
	color: white;
	width: 650px;
	line-height: 50px;
	margin-left: 100;
	padding: 20px;
	border: 5px gray solid;
}

.b {
	background-color: #272727;
	color: white;
	font-size: 30;
	font-weight: 900;
}

.b:hover {
	color: #00FFFF;
}

button {
	background-color: white;
	color: black;
	font-weight: 900;
}

button:hover {
	background-color: #00FFFF;
	color: black;
	font-weight: 900;
}
</style>
</head>
<body>
	<H1 align='center'>會員後台管理</H1>
	<hr>
	<%@ include file="../Header.jsp"%>
	<form action="<c:url value='/member/GameBar/${sAccount}'/>"
		method="post">
		<div align='center'>
			<div id="DIV2" style='margin-bottom: 30;'>
				<table>
					<tr class="b">
						<td><input name="iNo" type="hidden" value="${OneMember.iNo}"
							readonly></td>
					</tr>
					<H2>
						會員帳號${OneMember.sAccount}基本資料<input type="hidden" name="sAccount"
							value="${OneMember.sAccount}" readonly>
					</H2>
					<div>
						<img style="width: 250; height: 175;"
							src="<c:url value='/member/picture?sAccount=${OneMember.sAccount}'/>"><br>
					</div>
					<hr style="color: white; border: 1px solid;">
					<tr class="b">
						<td>會員信箱</td>
						<td>:${OneMember.sEmail}<input type="hidden" id="Email"
							name="sEmail"
							pattern="^[a-z0-9]+([._\\-]*[a-z0-9])*@([a-z0-9]+[-a-z0-9]*[a-z0-9]+[.]){1,63}[a-z0-9]+$"
							onblur="checkEmail();" value="${OneMember.sEmail}"></td>
					</tr>
					<tr class="b">
						<td><input type="hidden" name="sPassword"
							value="${OneMember.sPassword}" readonly></td>
					</tr>
					<tr class="b">
						<td>會員暱稱</td>
						<td>:<input type="text" id="Nickname" name="sNickname"
							value="${OneMember.sNickname}"></td>
					</tr>
					<tr class="b">
						<td>會員真實姓名</td>
						<td>:<input type="text" id="Ename" name="sEname"
							pattern="^[\u4e00-\u9fa5]+$" minlength="2" maxlength="4"
							value="${OneMember.sEname}"></td>
					</tr>
					<tr class="b">
						<td>會員手機號碼</td>
						<td>:<input type="text" id="Phone" name="sPhone"
							maxlength="10" pattern="[0]{1}[9]{1}\d{8}"
							value="${OneMember.sPhone}"></td>
					</tr>
					<tr class="b">
						<td>會員居住城市</td>
						<td>:<select id="Address" name="sAddress">
								<option>${user.sAddress}</option>
								<option>臺北市</option>
								<option>新北市</option>
								<option>桃園市</option>
								<option>臺中市</option>
								<option>臺南市</option>
								<option>高雄市</option>
								<option>基隆市</option>
								<option>新竹市</option>
								<option>嘉義市</option>
								<option>新竹縣</option>
								<option>苗栗縣</option>
								<option>彰化縣</option>
								<option>南投縣</option>
								<option>雲林縣</option>
								<option>嘉義縣</option>
								<option>屏東縣</option>
								<option>宜蘭縣</option>
								<option>花蓮縣</option>
								<option>臺東縣</option>
								<option>澎湖縣</option>
								<option>金門縣</option>
								<option>連江縣</option>
						</select></td>
					</tr>
					<tr class="b">
						<td>會員性別</td>
						<td>:${OneMember.sGender}<input type="hidden" name="sGender"
							value="${OneMember.sGender}" readonly></td>
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
					<button id="submit" name="submit" type="submit">
						<svg xmlns="http://www.w3.org/2000/svg" width="35" height="35"
							fill="currentColor" class="bi bi-cloud-arrow-up-fill"
							viewBox="0 0 16 16"> <path
							d="M8 2a5.53 5.53 0 0 0-3.594 1.342c-.766.66-1.321 1.52-1.464 2.383C1.266 6.095 0 7.555 0 9.318 0 11.366 1.708 13 3.781 13h8.906C14.502 13 16 11.57 16 9.773c0-1.636-1.242-2.969-2.834-3.194C12.923 3.999 10.69 2 8 2zm2.354 5.146a.5.5 0 0 1-.708.708L8.5 6.707V10.5a.5.5 0 0 1-1 0V6.707L6.354 7.854a.5.5 0 1 1-.708-.708l2-2a.5.5 0 0 1 .708 0l2 2z" />
						</svg>
						修改
					</button>
					<a href="<c:url value='/member/Data'/>"><button type="button">
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
	</form>
	<%@ include file="../Foot.jsp"%>
</body>
</html>
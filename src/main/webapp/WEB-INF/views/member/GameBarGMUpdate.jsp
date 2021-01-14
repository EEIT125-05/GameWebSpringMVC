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
</style>
</head>
<body>
	<H1 align='center'>會員後台管理</H1>
	<hr>
	<%@ include file="../Header.jsp"%>
	<form action="<c:url value='/member/GameBar/${sAccount}'/>" method="post">
		<div align='center'>
			<div align='left'
				style="border: 3px solid gray; width: 600; height: 550; border-radius: 5px;">
				<h3>
					<input name="iNo" type="hidden" value="${OneMember.iNo}" readonly>
				</h3>
				<h3>
					會員帳號:${OneMember.sAccount}<input type="hidden" name="sAccount"
						value="${OneMember.sAccount}" readonly>
				</h3>
				<h3>
					會員信箱:${OneMember.sEmail}<input type="hidden" id="Email" name="sEmail"
						pattern="^[a-z0-9]+([._\\-]*[a-z0-9])*@([a-z0-9]+[-a-z0-9]*[a-z0-9]+[.]){1,63}[a-z0-9]+$"
						onblur="checkEmail();" value="${OneMember.sEmail}">
				</h3>
				<h3>
					會員密碼:<input type="password" name="sPassword"
						value="${OneMember.sPassword}" readonly>
				</h3>
				<h3>
					更改暱稱:<input type="text" id="Nickname" name="sNickname"
						value="${OneMember.sNickname}">
				</h3>
				<h3>
					更改真實姓名:<input type="text" id="Ename" name="sEname"
						pattern="^[\u4e00-\u9fa5]+$" minlength="2" maxlength="4"
						value="${OneMember.sEname}">
				</h3>
				<h3>
					更改手機號碼:<input type="text" id="Phone" name="sPhone" maxlength="10"
						pattern="[0]{1}[9]{1}\d{8}" value="${OneMember.sPhone}">
				</h3>
				<h3>
					居住城市:<select id="Address" name="sAddress">
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
					</select>
				</h3>
				<h3>
					性別:${OneMember.sGender}<input type="hidden" name="sGender"
						value="${OneMember.sGender}" readonly>
				</h3>
				<h3>
					生日年月日:${OneMember.sBirthday}<input type="hidden" name="sBirthday"
						value="${OneMember.sBirthday}" readonly>
				</h3>
				<h3>
					建立日期:${OneMember.registerDate}<input type="hidden"
						name="registerDate" value="${OneMember.registerDate}" readonly>

					<h3 align='center'>
						<input id="submit" name="submit" type="submit" value="修改"
							style='background-color: Orange;'> <a
							href="<c:url value='/member/Data'/>"><input type="button"
							value="回上一頁" style='background-color: Orange;'></a>
					</h3>
			</div>
		</div>
	</form>
	<%@ include file="../Foot.jsp"%>
</body>
</html>
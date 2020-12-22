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
<title>會員資料更新[]</title>
<script src="./js/MemberUpdate.js"></script>

</head>
<body>
	<%@ include file="../Header.jsp"%>

	<form action="<c:url value='/member/MemberData'/>" method="post" modelAttribute="user">

		<div>
			<h3>
				<input name="iNo" type="hidden" value="${user.iNo}" readonly>
			</h3>
			<h3>
				會員帳號:<input name="sAccount" value="${user.sAccount}"
					readonly>
			</h3>
			<h3>
				更改密碼:<input id="password" type="text" minlength="8" required
					maxlength="16" onblur="checkPassword();" value="${user.sPassword}">
			</h3>
			<h3>
				再次確認密碼:<input id="passwordConfirm" type="text" name="sPassword"
					minlength="8" required maxlength="16" onblur="checkPassword();"
					onkeyup="value=value.replace(/[\W]/g,'')"><span
					id="idpasswordConfirm"></span>
			</h3>
			<h3>
				更改暱稱:<input type="text" id="Nickname" name="sNickname"
					onblur="checkNickname();" required
					onkeyup="this.value=this.value.replace(/\s+/g,'')" maxlength="10"
					onkeyup="value=this.value.replace( /^[\u4E00-\u9FA5a-zA-Z0-9_]$/)"
					value="${user.sNickname}"><span id="idnickname"></span>
			</h3>
			<h3>
				更改真實姓名:<input type="text" id="Ename" name="sEname" required
					onblur="checkName();"
					onkeyup="this.value=this.value.replace(/\s+/g,'')"
					pattern="^[\u4e00-\u9fa5]+$" minlength="2" maxlength="4"
					value="${user.sEname}"><span id="idname"></span>
			</h3>
			<h3>
				聯絡地址:<input type="text" id="Address" name="sAddress" required
					onkeyup="this.value=this.value.replace(/\s+/g,'')"
					onblur="checkAddress();" maxlength="30" value="${user.sAddress}"><span
					id="idaddress"></span>
			</h3>
			<h3>
				更改信箱:<input type="email" id="Email" name="sEmail" required
					maxlength="30" onkeyup="this.value=this.value.replace(/\s+/g,'')"
					pattern="^[a-z0-9]+([._\\-]*[a-z0-9])*@([a-z0-9]+[-a-z0-9]*[a-z0-9]+[.]){1,63}[a-z0-9]+$"
					onblur="checkEmail();" value="${user.sEmail}"><span
					id="idemail"></span>
			</h3>
			<h3>
				更改手機號碼:<input type="text" id="Phone" name="sPhone" maxlength="10"
					required onkeyup="this.value=this.value.replace(/\s+/g,'')"
					pattern="[0]{1}[9]{1}\d{8}" onblur="checkPhone();"
					value="${user.sPhone}"><span id="idphone"></span>
			</h3>
			<h3>
				性別:<input name="sGender" value="${user.sGender}"
					readonly>
			</h3>
			<h3>
				生日年月日:<input name="sBirthday" value="${user.sBirthday}" readonly>
			</h3>
			<h3>
				建立日期:<input name="registerDate" value="${user.registerDate}" readonly>
			</h3>
			<input id="submit" name="submit" type="submit" value="修改">
		</div>
	</form>

	<%@ include file="../Foot.jsp"%>
</body>
</html>
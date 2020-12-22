<%@page import="javax.security.auth.login.AccountException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
<title>會員註冊</title>
<script src="./js/MemberLogin.js"></script>
</head>
<body>
	<%@ include file="../Header.jsp"%>

	<form action="<c:url value='/member/MemberCheck'/>" method="post" modelAttribute="user">
		<div class="a">
			<h2>註冊成為會員</h2>
			<h3>
				設定的帳號:<input type="text" id="Account" name="sAccount" minlength="6"
					maxlength="20" required onblur="checkAccount();"> <span
					id="idaccount" /></span>
			</h3>
			<h3>
				設定的密碼:<input type="password" id="Password" name="sPassword"
					minlength="8" maxlength="16" required onblur="checkPassword();"><span
					id="idpassword"></span>
			</h3>
			<h3>
				使用的暱稱:<input type="text" id="Nickname" name="sNickname" required
					maxlength="10" onblur="checkNickname();"><span
					id="idnickname"></span>
			</h3>
			<h3>
				真實姓名:<input type="text" id="Ename" name="sEname" required
					onblur="checkName();" pattern="^[\u4e00-\u9fa5]+$" minlength="2"
					maxlength="4"><span id="idname"></span>
			</h3>
			<h3>
				聯絡地址:<input type="text" id="Address" name="sAddress" required
					onkeyup="this.value=this.value.replace(/\s+/g,'')"
					onblur="checkAddress();" maxlength="30" >
					<spanid="idaddress"></span>
			</h3>
			<h3>
				使用的信箱:<input type="email" id="Email" name="sEmail" maxlength="30"
					required onkeyup="this.value=this.value.replace(/\s+/g,'')"
					onblur="checkEmail();"
					pattern="^[a-z0-9]+([._\\-]*[a-z0-9])*@([a-z0-9]+[-a-z0-9]*[a-z0-9]+[.]){1,63}[a-z0-9]+$"><span
					id="idemail"></span>
			</h3>
			<h3>
				手機號碼:<input type="text" id="Phone" name="sPhone" maxlength="10"
					required onblur="checkPhone();"
					onkeyup="this.value=this.value.replace(/\s+/g,'')"
					pattern="[0]{1}[9]{1}\d{8}" /><span id="idphone"></span>
			</h3>
			<h3>
				性別:<label><input type="radio" name="sGender" value="male"
					required>男</label> <label><input type="radio"
					name="sGender" value="female" required>女</label></span>
			</h3>
			<h3>
				生年月日:<input type="date" id="Birthday" name="sBirthday" required>
			</h3>
			<h3>
				<input type="hidden"  name="registerDate">
			</h3>
			<button id="submit" type="submit" name="submit" value="註冊">註冊</button>
		</div>
	</form>

	<%@ include file="../Foot.jsp"%>
</body>
</html>
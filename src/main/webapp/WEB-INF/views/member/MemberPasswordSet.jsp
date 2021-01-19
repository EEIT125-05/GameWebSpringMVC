<%@page import="com.web.game.member.model.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../Link.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	response.setContentType("text/html;charset=UTF-8");
response.setHeader("Cache-Control", "no-cache"); // HTTP 1.1
response.setHeader("Pragma", "no-cache"); // HTTP 1.0
response.setDateHeader("Expires", -1); // Prevents caching at the proxy server
%>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<title>更改密碼</title>
<style>
input {
	border-radius: 10px;
}
</style>
<script>
	function checksPassword() {
		let password = document.getElementById("Password").value.trim();
		let passLen = password.length;
		let idpassword = document.getElementById("idpassword");
		if (password == "") {
			idpassword.innerHTML = "<font color='red'>請輸入密碼</font>";
			document.getElementById("submit").disabled = true;
		} else if (passLen >= 8) {
			idpassword.innerHTML = "<font color='green'>OK</font>";
		} else {
			idpassword.innerHTML = "<font color='red'>請輸入至少8個字元</font>";
			document.getElementById("submit").disabled = true;
		}
		check();
	}
	function checkPassword() {
		let password = document.getElementById("Password");
		let passwordConfirm = document.getElementById("passwordConfirm");
		let c = document.getElementById("idpasswordConfirm");
		if (passwordConfirm.value == "") {
			c.innerHTML = ("<font color='red'>請輸入密碼</font>");
			document.getElementById("submit").disabled = true;
		} else {
			if (password.value == passwordConfirm.value) {
				c.innerHTML = "<font color='green'>OK</font>";
				document.getElementById("submit").disabled = false;
			} else {
				c.innerHTML = "<font color='red'>密碼不相同</font>";
				document.getElementById("submit").disabled = true;
			}
		}
		check();
	}
	window.onload = function() {
		var btn = document.getElementById("btn");
		var psw = document.getElementById("Password");
		var pswC = document.getElementById("passwordConfirm");

		btn.onclick = function() {
			if (psw.getAttribute('type') == 'password') {
				psw.setAttribute('type', 'text');
				btn.value = "visibility_off";
			} else if (psw.getAttribute('type') == 'text') {
				psw.setAttribute('type', 'password');
				btn.value = "visibility";
			}
			if (pswC.getAttribute('type') == 'password') {
				pswC.setAttribute('type', 'text');
				btn.value = "visibility_off";
			} else if (pswC.getAttribute('type') == 'text') {
				pswC.setAttribute('type', 'password');
				btn.value = "visibility";
			}

		}

	}
</script>
</head>
<%@ include file="../Header.jsp"%>
<body>
	<h1 align='center'>忘記密碼</h1>
	<hr>
	<form action="<c:url value='/member/PasswordChange'/>" method="post">
		<div align='center' style='padding-bottom:84;'>
			<div align='left'
				style="border: 3px solid gray; width: 450; height:400;padding-top:25;padding-left:25;background-color: #272727;color: white;">
				<h3>
					<input type="hidden" name="iNo" value="${m.iNo}">
				</h3>
				<h3>
					輸入新密碼:<input id="Password" type="password"
						minlength="8" required maxlength="16" onblur="checksPassword();"><input
						id="btn" type="button" class="material-icons"
						style="font-size: 25px" value="visibility"><br>
					<span id="idpassword"></span>
				</h3>
				<h3>
					再次確認密碼:<input id="passwordConfirm" type="password" name="sPassword"
						minlength="8" required maxlength="16" onblur="checkPassword();"><br><span
						id="idpasswordConfirm"></span>
				</h3>
				<H3 align='center' style="padding-top: 40;">
					<input id="submit" type="submit" name="submit" value="更改密碼" disabled>
				</H3>
			</div>
		</div>
	</form>
	<%@ include file="../Foot.jsp"%>
</body>
</html>
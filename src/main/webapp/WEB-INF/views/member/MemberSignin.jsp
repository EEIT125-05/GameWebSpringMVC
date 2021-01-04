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
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>會員登入</title>
<script type="text/javascript">
	function changeimg() {
		var myimg = document.getElementById("code");
		now = new Date();
		myimg.src = "image.jsp?change" + now.getTime();
	}

	var code;
	function createCode() {
		code = new Array();
		var codeLength = 5;
		var checkCode = document.getElementById("checkCode");
		checkCode.value = "";
		selectChar = new Array(2, 3, 4, 5, 6, 7, 8, 9, 'A', 'B', 'C', 'D', 'E',
				'F', 'G', 'H', 'J', 'K', 'L', 'M', 'N', 'P', 'Q', 'R', 'S',
				'T', 'U', 'V', 'W', 'X', 'Y', 'Z');
		for (var i = 0; i < codeLength; i++) {
			var charIndex = Math.floor(Math.random() * 32);
			code += selectChar[charIndex];
		}
		if (code.length != codeLength) {
			createCode();
		}
		checkCode.value = code;
	}
	function validate() {
		var inputCode = document.getElementById("input1").value.toUpperCase();
		if (inputCode.length <= 0) {
			alert("請輸入驗證碼!");
			return false;
		} else if (inputCode != code) {
			alert("驗證碼輸入錯誤!");
			createCode();
			return false;
		} else {
			alert("成功!");
			document.getElementById("Signin").disabled = false;
			return true;
		}

	}
</script>
</head>
<body onLoad="createCode();">
	<h1 align='center'>登入GameBar會員</h1>
	<hr>
	<%@ include file="../Header.jsp"%>
	<div align='center'>
		<form action="<c:url value='/member/SignIn'/>" method="post">

			<div align='center'
				style='border: 3px solid gray; width: 450; height: 500;'>
				<h3 style='padding-top: 30px;'>
					帳號:<input type="text" name="sAccount" minlength="6" maxlength="20"
						placeholder="請輸入帳號" required="required">
				</h3>
				<h3 style='padding-top: 30px;'>
					密碼:<input type="password" name="sPassword" placeholder="請輸入密碼"
						minlength="8" maxlength="16" required="required">
				</h3>
				<h4 style='padding-top: 30px;'>
					驗證碼:<input type="text" id="input1" style="width: 100px" /><input
						type="button" id="checkCode" class="code" style="width: 90px"
						onClick="createCode()" /><a href="#" onClick="createCode()">換一個</a>
				</h4>
				<input id="Button1" onClick="validate();" type="button"
					value="驗證碼確認" />
		</form>
		<br> <label style='padding-top: 30px;'><input
			type="checkbox" name="rememberMe">記住我的帳號密碼</label> <br> <input
			id="Signin" name="Signin" type="submit" value="登入" style='width:350; height:50; font-size:30;'>
		<div style='padding-top: 30px;'>
			<a href="<c:url value='/member/Forget'/>">忘記密碼</a>
		</div>
	</div>
	</div>
	</form>
	<%@ include file="../Foot.jsp"%>
</body>
</html>
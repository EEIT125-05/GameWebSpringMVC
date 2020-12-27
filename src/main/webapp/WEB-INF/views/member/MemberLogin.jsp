<%@page import="javax.security.auth.login.AccountException"%>
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
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<title>會員註冊</title>
<%-- <script src="<c:url value='/js/MemberLogin.js'/>"></script> --%>
<script>
	let accountflag = false;
	let passwordflag = false;
	let nicknameflag = false;
	let nameflag = false;
	let addressflag = false;
	let emailflag = false;
	let phoneflag = false;

	function checkAccount() {
		let sAccount = document.getElementById("sAccount").value.trim();
		let accLen = sAccount.length;
		let idaccount = document.getElementById("idaccount");
		let accError = false;
		if (sAccount == "") {
			document.getElementById("accountCheck").disabled = true;
			idaccount.innerHTML = "<font color='red'>請輸入帳號</font>";
			accountflag = false;
		} else if (accLen <= 5) {
			idaccount.innerHTML = "<font color='red'>請輸入至少6個字元</font>";
			document.getElementById("accountCheck").disabled = true;
			accountflag = false;
		} else if (accLen >= 6) {
			document.getElementById("accountCheck").disabled = false;
			for (let idaccount = 0; idaccount < accLen; idaccount++) {
				let ACCOUNT = sAccount.charCodeAt(idaccount);
				if (ACCOUNT >= 0x4e00 && ACCOUNT <= 0x9fff) {
					accError = true;
					if (accError) {
						break;
					}
				}
			}
			if (accError) {
				document.getElementById("accountCheck").disabled = true;
				idaccount.innerHTML = "<font color='red'>不能輸入中文</font>";
				accountflag = false;
			} else {
				idaccount.innerHTML = "<font color='blue'>請驗證帳號</font>";
				accountflag = false;
			}
		}
	}

	window.onload = function() {
		var Check = document.getElementById("accountCheck");
		var idaccount = document.getElementById("idaccount");
		var emailCheck = document.getElementById("emailCheck");
		var PhoneCheck = document.getElementById("PhoneCheck");
		Check.onclick = function() {
			var sAccount = document.getElementById("sAccount").value.trim();
			var xhr = new XMLHttpRequest();
			xhr.open("POST", "<c:url value='/member/MemberLogin' />", true);
			xhr.setRequestHeader("Content-Type",
					"application/x-www-form-urlencoded");
			xhr.send("sAccount=" + sAccount);
			xhr.onreadystatechange = function() {
				if (xhr.readyState == 4 && xhr.status == 200) {
					console.log("sAccount=" + sAccount);
					var result = JSON.parse(xhr.responseText);
					if (result.sAccount.length == 0) {
						idaccount.innerHTML = "<font color='green'>帳號可用</font>";
						accountflag = true;
					} else {
						idaccount.innerHTML = "<font color='red'>帳號已被使用，請重新輸入帳號</font>";
						accountflag = false;
					}
				}
			}
			check();
		}
		
		emailCheck.onclick = function() {
			var sEmail = document.getElementById("sEmail").value.trim();
			var xhr = new XMLHttpRequest();
			xhr.open("POST", "<c:url value='/member/MemberemailCheck' />", true);
			xhr.setRequestHeader("Content-Type",
					"application/x-www-form-urlencoded");
			xhr.send("sEmail=" + sEmail);
			xhr.onreadystatechange = function() {
				if (xhr.readyState == 4 && xhr.status == 200) {
					console.log("sEmail=" + sEmail);
					var result = JSON.parse(xhr.responseText);
					if (result.sEmail.length == 0) {
						idemail.innerHTML = "<font color='green'>信箱可用</font>";
						emailflag = true;
					} else {
						idemail.innerHTML = "<font color='red'>信箱已被使用，請重新輸入信箱</font>";
						emailflag = false;
					}
				}
			}
			check();
		}
		
		PhoneCheck.onclick = function() {
			var sPhone = document.getElementById("sPhone").value.trim();
			var xhr = new XMLHttpRequest();
			xhr.open("POST", "<c:url value='/member/MemberPhoneCheck' />", true);
			xhr.setRequestHeader("Content-Type",
					"application/x-www-form-urlencoded");
			xhr.send("sPhone=" + sPhone);
			xhr.onreadystatechange = function() {
				if (xhr.readyState == 4 && xhr.status == 200) {
					console.log("sPhone=" + sPhone);
					var result = JSON.parse(xhr.responseText);
					if (result.sPhone.length == 0) {
						idphone.innerHTML = "<font color='green'>電話可用</font>";
						phoneflag = true;
					} else {
						idphone.innerHTML = "<font color='red'>電話已被使用，請重新輸入電話</font>";
						phoneflag = false;
					}
				}
			}
			check();
		}
		
		var btn = document.getElementById("btn");
		var psw = document.getElementById("Password");
		
		btn.onclick = function(){
			if(psw.getAttribute('type') == 'password'){
				psw.setAttribute('type','text');
				btn.value="visibility_off";
			}else if(psw.getAttribute('type') == 'text'){
				psw.setAttribute('type','password');
				btn.value="visibility";
			}
		}
	}

	function checkPassword() {
		let password = document.getElementById("Password").value.trim();
		let passLen = password.length;
		let idpassword = document.getElementById("idpassword");
		if (password == "") {
			idpassword.innerHTML = "<font color='red'>請輸入密碼</font>";
			passwordflag = false;
		} else if (passLen >= 8) {
			idpassword.innerHTML = "<font color='green'>OK</font>";
			passwordflag = true;
		} else {
			idpassword.innerHTML = "<font color='red'>請輸入至少8個字元</font>";
			passwordflag = false;
		}
		check();
	}

	function checkNickname() {
		let nickname = document.getElementById("Nickname").value.trim();
		let idnickname = document.getElementById("idnickname");
		if (nickname == "") {
			idnickname.innerHTML = "<font color='red'>請輸入暱稱</font>";
			nicknameflag = false;
		} else {
			idnickname.innerHTML = "<font color='green'>OK</font>";
			nicknameflag = true;
		}
		check();
	}

	function checkEmail() {
		let email = document.getElementById("sEmail").value.trim();
		let emailLen = email.length;
		let idemail = document.getElementById("idemail");
		if (email == "") {
			idemail.innerHTML = "<font color='red'>請輸入信箱</font>";
			emailflag = false;
		}else{
			idemail.innerHTML = "<font color='blue'>確認信箱驗證</font>";
			emailflag = false;
		}
	}

	function checkName() {
		let ename = document.getElementById("Ename").value.trim();
		let enameLen = ename.length;
		let idname = document.getElementById("idname");
		let nameCheck = false;
		if (ename == "") {
			idname.innerHTML = "<font color='red'>請輸入姓名</font>";
		} else if (enameLen >= 2) {
			for (let idname = 0; idname < enameLen; idname++) {
				let ENAME = ename.charAt(idname);
				if (ENAME.charCodeAt(idname) < 0x4E00
						|| ENAME.charCodeAt(idname) > 0x9FA5) {
					nameCheck = true;
					if (nameCheck)
						break;
				}
			}
			if (nameCheck) {
				idname.innerHTML = "<font color='red'>請輸入中文</font>";
				nameflag = false;
			} else {
				idname.innerHTML = "<font color='green'>OK</font>";
				nameflag = true;
			}
		} else {
			idname.innerHTML = "<font color='red'>至少兩個字</font>";
			nameflag = false;
		}
		check();
	}

	function checkPhone() {
		let phone = document.getElementById("sPhone").value.trim();
		let phoneLen = phone.length;
		let idphone = document.getElementById("idphone");
		let phoneCheck = false;
		let reg = /^[0]{1}[9]{1}\d{8}$/;
		if (phone == "") {
			idphone.innerHTML = "<font color='red'>請輸入手機號碼</font>";
			phoneflag = false;
		} else if (phoneLen >= 10) {
			if (reg.test(phone)) {
				phoneCheck = true;
			}
			if (phoneCheck) {
				idphone.innerHTML = "<font color='green'>請檢查號碼</font>";
				phoneflag = false;
			} else {
				idphone.innerHTML = "<font color='red'>請輸入09開頭電話號碼</font>";
				phoneflag = false;
			}
		} else {
			idphone.innerHTML = "<font color='red'>請輸入10位號碼</font>";
			phoneflag = false;
		}
		check();
	}

	function checkAddress() {
		let address = document.getElementById("Address").value.trim();
		let idaddress = document.getElementById("idaddress");
		if (address == "") {
			idaddress.innerHTML = "<font color='red'>請輸入地址</font>";
		} else {
			idaddress.innerHTML = "<font color='green'>OK</font>";
		}
		check();
	}

	function check() {
		if (accountflag && passwordflag && nicknameflag && nameflag
				&& emailflag && phoneflag) {
			document.getElementById("submit").disabled = false;
		} else {
			document.getElementById("submit").disabled = true;
		}
	}
</script>
</head>
<body>
	<%@ include file="../Header.jsp"%>

	<form action="<c:url value='/member/MemberCheck'/>" method="post"
		modelAttribute="user">
		<div class="a">
			<h2>註冊成為會員</h2>
			<h3>
				設定的帳號:<input type="text" id="sAccount" name="sAccount" minlength="6"
					maxlength="20" required onblur="checkAccount();"> <input
					type="button" id='accountCheck' value="檢查" disabled> <span
					id="idaccount" /></span>
			</h3>
			<h3>
				設定的密碼:<input type="password" id="Password" name="sPassword"
					minlength="8" maxlength="16" required onblur="checkPassword();">
				<input id="btn" type="button" class="material-icons"
					style="font-size: 25px" value="visibility"> <span
					id="idpassword"></span>
			</h3>
			<h3>
				使用的暱稱:<input type="text" id="Nickname" name="sNickname" required
					maxlength="10" onblur="checkNickname();"> <span
					id="idnickname"></span>
			</h3>
			<h3>
				真實姓名:<input type="text" id="Ename" name="sEname" required
					onblur="checkName();" pattern="^[\u4e00-\u9fa5]+$" minlength="2"
					maxlength="4"><span id="idname"></span>
			</h3>
			<h3>
				聯絡地址:<input type="text" id="Address" name="sAddress"
					onblur="checkAddress();"> <span id="idaddress"></span>
			</h3>
			<h3>
				使用的信箱:<input type="email" id="sEmail" name="sEmail" maxlength="30"
					required onblur="checkEmail();"
					pattern="^[a-z0-9]+([._\\-]*[a-z0-9])*@([a-z0-9]+[-a-z0-9]*[a-z0-9]+[.]){1,63}[a-z0-9]+$">
				<input type="button" id='emailCheck' value="檢查"> 
				<span id="idemail"></span>
			</h3>
			<h3>
				手機號碼:<input type="text" id="sPhone" name="sPhone" maxlength="10"
					required onblur="checkPhone();" pattern="[0]{1}[9]{1}\d{8}" />
					<input type="button" id='PhoneCheck' value="檢查">
					<span id="idphone"></span>
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
				<input type="hidden" name="registerDate">
			</h3>
			<button id="submit" type="submit" name="submit" value="註冊" disabled>註冊</button>
		</div>
	</form>

	<%@ include file="../Foot.jsp"%>
</body>
</html>
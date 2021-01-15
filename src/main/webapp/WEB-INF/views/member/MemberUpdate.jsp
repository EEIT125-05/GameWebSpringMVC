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
<style>
input {
	border-radius: 10px;
}
</style>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<title>會員資料更新</title>
<%-- <script src="<c:url value='../js/MemberUpdate.js'/>"></script> --%>
<script>
	let passwordflag = false;
	let nicknameflag = true;
	let nameflag = true;
	let addressflag = true;
	let emailflag = true;
	let phoneflag = true;

	function checkPassword() {
		let password = document.getElementById("Password");
		let passwordConfirm = document.getElementById("passwordConfirm");
		let c = document.getElementById("idpasswordConfirm");
		if (passwordConfirm.value == "") {
			c.innerHTML = ("<font color='red'>請輸入密碼</font>");
			passwordflag = false;
		} else {
			if (password.value == passwordConfirm.value) {
				c.innerHTML = "<font color='green'>OK</font>";
				passwordflag = true;
			} else {
				c.innerHTML = "<font color='red'>密碼不相同</font>";
				passwordflag = false;
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

	function checkNickname() {
		let nickname = document.getElementById("Nickname").value;
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
		let email = document.getElementById("Email").value;
		let idemail = document.getElementById("idemail");
		if (email == "") {
			idemail.innerHTML = "<font color='red'>請輸入信箱</font>";
			emailflag = false;
		} else {
			idemail.innerHTML = "";
			emailflag = true;
		}
		check();
	}

	function checkName() {
		let ename = document.getElementById("Ename").value;
		let enameLen = ename.length;
		let idname = document.getElementById("idname");
		let nameError = false;
		if (ename == "") {
			idname.innerHTML = "<font color='red'>請輸入姓名</font>";
			nameflag = false;
		} else if (enameLen >= 2) {
			for (let idname = 0; idname < enameLen; idname++) {
				if (ename.charCodeAt(idname) < 0x4E00
						|| ename.charCodeAt(idname) > 0x9FA5) {
					nameError = true;
					if (nameError) {
						break;
					}
				}
			}
			if (nameError) {
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
		let phone = document.getElementById("Phone").value;
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
				idphone.innerHTML = "<font color='green'>OK</font>";
				phoneflag = true;
			} else {
				idphone.innerHTML = "<font color='red'>格式錯誤請輸入正確電話號碼</font>";
				phoneflag = false;
			}
		} else {
			idphone.innerHTML = "<font color='red'>至少輸入10位號碼</font>";
			phoneflag = false;
		}
		check();
	}

	function checkAddress() {
		let address = document.getElementById("Address").value;
		let idaddress = document.getElementById("idaddress");
		if (address == "") {
			idaddress.innerHTML = "<font color='red'>請輸入地址</font>";
			addressflag = false;
		} else {
			idaddress.innerHTML = "<font color='green'>OK</font>";
			addressflag = true;
		}
		check();
	}

	function check() {
		if (passwordflag && nicknameflag && nameflag && addressflag
				&& emailflag && phoneflag) {
			document.getElementById("submit").disabled = false;
		} else {
			document.getElementById("submit").disabled = true;
		}
	}
</script>
</head>
<body>
	<H1 align='center'>會員修改資料</H1>
	<hr>
	<%@ include file="../Header.jsp"%>

	<form action="<c:url value='/member/MemberData'/>" method="post" enctype="multipart/form-data">
		<div align='center'>
			<div align='left'
				style="border: 3px solid gray; width: 550; height: 850;border-radius: 5px;">
				<div align='center' style="padding-top: 15">
					<div>
						<img style="width: 250; height: 175;"
							src="<c:url value='/member/picture/${user.sAccount}'/>">
							<input type="file" name="productImage" />
					</div>
				</div>
				<hr>
				<h3>
					<input name="iNo" type="hidden" value="${user.iNo}" readonly>
				</h3>
				<h3>
					會員帳號:${user.sAccount}<input type="hidden" name="sAccount"
						value="${user.sAccount}" readonly>
				</h3>
				<h3>
					更改密碼:<input id="Password" type="password" minlength="8" required
						maxlength="16" onblur="checkPassword();" value="${user.sPassword}"><input
						id="btn" type="button" class="material-icons"
						style="font-size: 25px" value="visibility">
				</h3>
				<h3>
					再次確認密碼:<input id="passwordConfirm" type="password" name="sPassword"
						minlength="8" required maxlength="16" onblur="checkPassword();"><span
						id="idpasswordConfirm"></span>
				</h3>
				<h3>
					更改暱稱:<input type="text" id="Nickname" name="sNickname"
						onblur="checkNickname();" required maxlength="10"
						value="${user.sNickname}"><span id="idnickname"></span>
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
					更改真實姓名:${user.sEname}<input type="hidden" id="Ename" name="sEname"
						required onblur="checkName();" pattern="^[\u4e00-\u9fa5]+$"
						minlength="2" maxlength="4" value="${user.sEname}" readonly><span
						id="idname"></span>
				</h3>
				<h3>
					更改信箱:${user.sEmail}<input type="hidden" id="Email" name="sEmail"
						required
						pattern="^[a-z0-9]+([._\\-]*[a-z0-9])*@([a-z0-9]+[-a-z0-9]*[a-z0-9]+[.]){1,63}[a-z0-9]+$"
						onblur="checkEmail();" value="${user.sEmail}"><span
						id="idemail"></span>
				</h3>
				<h3>
					更改手機號碼:${user.sPhone}<input type="hidden" id="Phone" name="sPhone"
						maxlength="10" pattern="[0]{1}[9]{1}\d{8}" onblur="checkPhone();"
						value="${user.sPhone}"><span id="idphone"></span>
				</h3>
				<h3>
					性別:${user.sGender}<input type="hidden" name="sGender"
						value="${user.sGender}" readonly>
				</h3>
				<h3>
					生日年月日:${user.sBirthday}<input type="hidden" name="sBirthday"
						value="${user.sBirthday}" readonly>
				</h3>
				<h3>
					建立日期:${user.registerDate}<input type="hidden" name="registerDate"
						value="${user.registerDate}" readonly>
				</h3>
				<H3 align='center'>
					<input id="submit" name="submit" type="submit"
						value="修改" disabled style='background-color: Orange;'> <a
						href="<c:url value='/member/Data'/>"><input type="button" value="回上一頁"
						style='background-color: Orange;'></a>
				</H3>
			</div>
		</div>
	</form>

	<%@ include file="../Foot.jsp"%>
</body>
</html>
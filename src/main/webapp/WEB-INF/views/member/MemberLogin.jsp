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
<style>
.h3 {
	padding-left: 10px;
}

input {
	border-radius: 10px;
}

.b {
	background-color: #272727;
	color: white;
	font-size: 30;
	font-weight: 900;
}
</style>
<title>會員註冊</title>
<%-- <script src="<c:url value='/js/MemberLogin.js'/>"></script> --%>
<script>
	window.onload = function() {
		var sGender = document.getElementById('sGender').checked = false;
		var btn = document.getElementById("btn");
		var psw = document.getElementById("sPassword");
		btn.onclick = function() {
			if (psw.getAttribute('type') == 'password') {
				psw.setAttribute('type', 'text');
				btn.value = "visibility_off";
			} else if (psw.getAttribute('type') == 'text') {
				psw.setAttribute('type', 'password');
				btn.value = "visibility";
			}
		}
	}
	let accountflag = false;
	let passwordflag = false;
	let nicknameflag = false;
	let nameflag = false;
	let addressflag = false;
	let emailflag = false;
	let phoneflag = false;

	function checkAccount() {
		var sAccount = document.getElementById("sAccount").value.trim();
		var accLen = sAccount.length;
		var idaccount = document.getElementById("idaccount");
		var regular = /[a-zA-Z]{1}[a-zA-Z0-9]{5,19}/;
		if (sAccount == "") {
			idaccount.innerHTML = "<font color='red'>請輸入帳號</font>";
		} else if (accLen <= 5) {
			idaccount.innerHTML = "<font color='red'>請輸入至少6個字元</font>";
		} else if (!sAccount.match(regular)) {
			idaccount.innerHTML = "<font color='red'>格式錯誤</font>";
		} else {
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
		}
	}

	function checkEmail() {
		var sEmail = document.getElementById("sEmail").value.trim();
		var emailLen = sEmail.length;
		var idemail = document.getElementById("idemail");
		var regular = /^[a-z0-9]+([._\\-]*[a-z0-9])*@([a-z0-9]+[-a-z0-9]*[a-z0-9]+[.]){1,63}[a-z0-9]+$/;
		if (sEmail == "") {
			idemail.innerHTML = "<font color='red'>請輸入信箱</font>";
		} else if (!sEmail.match(regular)) {
			idemail.innerHTML = "<font color='red'>信箱格式錯誤</font>";
		} else {
			var xhr = new XMLHttpRequest();
			xhr
					.open("POST", "<c:url value='/member/MemberemailCheck' />",
							true);
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
		}
	}

	function checkPhone() {
		var sPhone = document.getElementById("sPhone").value.trim();
		var phoneLen = sPhone.length;
		var idphone = document.getElementById("idphone");
		var phoneCheck = false;
		var regular = /^[0]{1}[9]{1}\d{8}$/;
		if (sPhone == "") {
			idphone.innerHTML = "<font color='red'>請輸入手機號碼</font>";
		} else if (phoneLen < 10) {
			idphone.innerHTML = "<font color='red'>請輸入10位號碼</font>";
		} else if (!sPhone.match(regular)) {
			idphone.innerHTML = "<font color='red'>請輸入09開頭電話號碼</font>";
		} else {
			var xhr = new XMLHttpRequest();
			xhr
					.open("POST", "<c:url value='/member/MemberPhoneCheck' />",
							true);
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
		}

	}

	function checkPassword() {
		var sPassword = document.getElementById("sPassword").value.trim();
		var passLen = sPassword.length;
		var idpassword = document.getElementById("idpassword");
		var regular = /[a-zA-Z0-9]{8,16}/;
		if (sPassword == "") {
			idpassword.innerHTML = "<font color='red'>請輸入密碼</font>";
			passwordflag = false;
		} else if (passLen < 8) {
			idpassword.innerHTML = "<font color='red'>請輸入至少8個字元</font>";
		} else if (!sPassword.match(regular)) {
			idpassword.innerHTML = "<font color='red'>請輸入正確字元</font>";
		} else {
			idpassword.innerHTML = "<font color='green'>OK</font>";
		}
	}

	function checkNickname() {
		let nickname = document.getElementById("sNickname").value.trim();
		let idnickname = document.getElementById("idnickname");
		if (nickname == "") {
			idnickname.innerHTML = "<font color='red'>請輸入暱稱</font>";
			nicknameflag = false;
		} else {
			idnickname.innerHTML = "<font color='green'>OK</font>";
			nicknameflag = true;
		}
	}

	function checkName() {
		let ename = document.getElementById("sEname").value.trim();
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

	function checkAddress() {
		let address = document.getElementById("Address").value.trim();
		let idaddress = document.getElementById("idaddress");
		if (address == "請挑選") {
			idaddress.innerHTML = "<font color='red'>請選擇地址</font>";
			let addressflag = false;
		} else if (address !== "請挑選") {
			idaddress.innerHTML = "<font color='green'>OK</font>";
			let addressflag = true;
		} else {
			let addressflag = false;
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

	function OneLogin() {
		var sAccount = document.getElementById("sAccount");
		var sEmail = document.getElementById("sEmail");
		var sPhone = document.getElementById("sPhone");
		var sPassword = document.getElementById("sPassword");
		var sEname = document.getElementById("sEname");
		var sNickname = document.getElementById("sNickname");
		var sAddress = document.getElementById("sAddress").options[5].selected = true;
		// 		var sGender = document.getElementById("sGender");
		var sGender = document.getElementById('sGender').checked = true;
		var sBirthday = document.getElementById("sBirthday");

		sAccount.value = "year780818";
		sEmail.value = "year780818@gmail.com";
		sPhone.value = "0956175060";
		sPassword.value = "year780818";
		sEname.value = "顏廷亙";
		sNickname.value = "奶茶糾齁拎";
		sAddress;
		sGender;
		sBirthday.value = "1989-08-18";
		document.getElementById("submit").disabled = false;
	}
</script>
</head>
<body>
	<h1 align='center'>註冊成為GameBar會員</h1>
	<hr>
	<%@ include file="../Header.jsp"%>
	<form action="<c:url value='/member/MemberCheck'/>" method="post">
		<div align='center'>
			<div align='left'
				style="border: 3px solid gray; width: 650; height: 900; border-radius: 5px; padding-left: 20; background-color: #272727; color: white;">
				<table>
					<tr class="b">
						<td>設定的帳號</td>
						<td>: <input pattern="[a-zA-Z]{1}[a-zA-Z0-9]{5,19}"
							type="text" id="sAccount" name="sAccount" minlength="6"
							maxlength="20" required onblur="checkAccount();"> <input
							type="button" id='accountCheck' value="檢查" disabled> <br>
						</td>
					</tr>
					<tr class="b">
						<td></td>
						<td><span id="idaccount"></span></td>
					</tr>
					<tr class="b">
						<td>使用的信箱</td>
						<td>: <input type="email" id="sEmail" name="sEmail"
							maxlength="30" required onblur="checkEmail();"
							pattern="^[a-z0-9]+([._\\-]*[a-z0-9])*@([a-z0-9]+[-a-z0-9]*[a-z0-9]+[.]){1,63}[a-z0-9]+$">
							<input type="button" id='emailCheck' value="檢查" disabled>
							<br>
						</td>
					</tr>
					<tr class="b">
						<td></td>
						<td><span id="idemail"></span></td>
					</tr>
					<tr class="b">
						<td>手機號碼</td>
						<td>: <input type="text" id="sPhone" name="sPhone"
							maxlength="10" required onblur="checkPhone();"
							pattern="[0]{1}[9]{1}\d{8}" /> <input type="button"
							id='PhoneCheck' value="檢查" disabled> <br>
						</td>
					</tr>
					<tr class="b">
						<td></td>
						<td><span id="idphone"></span></td>
					</tr>
					<tr class="b">
						<td>設定的密碼</td>
						<td>: <input pattern="[a-z0-9]{8,16}" type="password"
							id="sPassword" name="sPassword" minlength="8" maxlength="16"
							required onblur="checkPassword();"> <input id="btn"
							type="button" class="material-icons" style="font-size: 25px"
							value="visibility"> <br>
						</td>
					</tr>
					<tr class="b">
						<td></td>
						<td><span id="idpassword"></span></td>
					</tr>
					<tr class="b">
						<td>真實姓名</td>
						<td>: <input type="text" id="sEname" name="sEname" required
							onblur="checkName();" pattern="^[\u4e00-\u9fa5{2,4}]+$"
							minlength="2" maxlength="4"> <br>
						</td>
					</tr>
					<tr class="b">
						<td></td>
						<td><span id="idname"></span></td>
					</tr>
					<tr class="b">
						<td>使用的暱稱</td>
						<td>: <input type="text" id="sNickname" name="sNickname"
							required maxlength="10" onblur="checkNickname();"><br>
						</td>
					</tr>
					<tr class="b">
						<td></td>
						<td><span id="idnickname"></span></td>
					</tr>
					<tr class="b">
						<td>居住城市</td>
						<td>: <select id="sAddress" name="sAddress"
							onblur="checkAddress();">
								<option>請挑選</option>
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
						</select><br>
						</td>
					</tr>
					<tr class="b">
						<td></td>
						<td><span id="idaddress"></span></td>
					</tr>
					<tr class="b">
						<td>性別</td>
						<td>: <input id="sGender" type="radio" name="sGender"
							value="男" checked required>男 <input id="sGender"
							type="radio" name="sGender" value="女" required>女
						</td>
					</tr>
					<tr class="b">
						<td>生年月日</td>
						<td>: <input type="date" id="sBirthday" name="sBirthday"
							required></td>
					</tr>
				</table>
				<!-- 				<h3> -->
				<!-- 					請選擇上傳照片:<input type="file" name="productImage" required /> -->
				<!-- 				</h3> -->
				<h3>
					<input type="hidden" name="registerDate">
				</h3>
				<h6 align='center' style='color: red;'>${showError}</h6>
				<h3 align='center'>
					<button id="submit" type="submit" name="submit" disabled
						style='width: 350; height: 50; font-size: 30; margin-top: 15;'>
						<svg xmlns="http://www.w3.org/2000/svg" width="40" height="40"
							fill="currentColor" class="bi bi-file-person" viewBox="0 0 16 16">
						<path
							d="M12 1a1 1 0 0 1 1 1v10.755S12 11 8 11s-5 1.755-5 1.755V2a1 1 0 0 1 1-1h8zM4 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H4z" />
						<path d="M8 10a3 3 0 1 0 0-6 3 3 0 0 0 0 6z" /> </svg>
						確認資料
					</button>
				</h3>
				<h3 align='center'>
					<button type="button" onclick="OneLogin();"
						style="width: 350; height: 50; font-size: 30; background-color: white;">
						<svg xmlns="http://www.w3.org/2000/svg" width="40" height="40"
							fill="currentColor" class="bi bi-hand-index" viewBox="0 0 16 16">
						<path
							d="M6.75 1a.75.75 0 0 1 .75.75V8a.5.5 0 0 0 1 0V5.467l.086-.004c.317-.012.637-.008.816.027.134.027.294.096.448.182.077.042.15.147.15.314V8a.5.5 0 1 0 1 0V6.435a4.9 4.9 0 0 1 .106-.01c.316-.024.584-.01.708.04.118.046.3.207.486.43.081.096.15.19.2.259V8.5a.5.5 0 0 0 1 0v-1h.342a1 1 0 0 1 .995 1.1l-.271 2.715a2.5 2.5 0 0 1-.317.991l-1.395 2.442a.5.5 0 0 1-.434.252H6.035a.5.5 0 0 1-.416-.223l-1.433-2.15a1.5 1.5 0 0 1-.243-.666l-.345-3.105a.5.5 0 0 1 .399-.546L5 8.11V9a.5.5 0 0 0 1 0V1.75A.75.75 0 0 1 6.75 1zM8.5 4.466V1.75a1.75 1.75 0 1 0-3.5 0v5.34l-1.2.24a1.5 1.5 0 0 0-1.196 1.636l.345 3.106a2.5 2.5 0 0 0 .405 1.11l1.433 2.15A1.5 1.5 0 0 0 6.035 16h6.385a1.5 1.5 0 0 0 1.302-.756l1.395-2.441a3.5 3.5 0 0 0 .444-1.389l.271-2.715a2 2 0 0 0-1.99-2.199h-.581a5.114 5.114 0 0 0-.195-.248c-.191-.229-.51-.568-.88-.716-.364-.146-.846-.132-1.158-.108l-.132.012a1.26 1.26 0 0 0-.56-.642 2.632 2.632 0 0 0-.738-.288c-.31-.062-.739-.058-1.05-.046l-.048.002zm2.094 2.025z" />
						</svg>
						一鍵輸入
					</button>

				</h3>
			</div>
		</div>
	</form>

	<%@ include file="../Foot.jsp"%>
</body>
</html>
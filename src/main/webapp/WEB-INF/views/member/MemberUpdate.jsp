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

#DIV1 {
	margin-left: 50;
}

#DIV2 {
	margin-left: 50;
	padding-bottom: 50px;
}

#DIV3 {
	padding-top: 15px;
	padding-left: 30px;
	float: left;
}

#DIV4 {
	background-color: gray;
	width: 450px;
	height: 300px;
	margin-top: 15px;
	margin-right: 30px;
	border: 3px solid gray;
	float: right;
}

table {
	margin: 15px;
}

.b {
	color: white;
	font-size: 20;
	font-weight: 900;
}

.b:hover {
	color: #00FFFF;
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
	width: 1000px;
	height: 500px;
	border: 5px solid gray;
	background-color: #fff;
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
	// 	let passwordflag = false;
	// 	let nicknameflag = true;
	// 	let nameflag = true;
	// 	let addressflag = true;
	// 	let emailflag = true;
	// 	let phoneflag = true;

	function checkPassword() {
		let password = document.getElementById("Password");
		let passwordConfirm = document.getElementById("passwordConfirm");
		let c = document.getElementById("idpasswordConfirm");
		if (passwordConfirm.value == "") {
			c.innerHTML = ("<font color='red'>請輸入密碼</font>");
		} else {
			if (password.value == passwordConfirm.value) {
				c.innerHTML = "<font color='green'>OK</font>";
			} else {
				c.innerHTML = "<font color='red'>密碼不相同</font>";
			}
		}

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

	// 	function checkEmail() {
	// 		let email = document.getElementById("Email").value;
	// 		let idemail = document.getElementById("idemail");
	// 		if (email == "") {
	// 			idemail.innerHTML = "<font color='red'>請輸入信箱</font>";
	// 			emailflag = false;
	// 		} else {
	// 			idemail.innerHTML = "";
	// 			emailflag = true;
	// 		}
	// 		check();
	// 	}

	// 	function checkName() {
	// 		let ename = document.getElementById("Ename").value;
	// 		let enameLen = ename.length;
	// 		let idname = document.getElementById("idname");
	// 		let nameError = false;
	// 		if (ename == "") {
	// 			idname.innerHTML = "<font color='red'>請輸入姓名</font>";
	// 			nameflag = false;
	// 		} else if (enameLen >= 2) {
	// 			for (let idname = 0; idname < enameLen; idname++) {
	// 				if (ename.charCodeAt(idname) < 0x4E00
	// 						|| ename.charCodeAt(idname) > 0x9FA5) {
	// 					nameError = true;
	// 					if (nameError) {
	// 						break;
	// 					}
	// 				}
	// 			}
	// 			if (nameError) {
	// 				idname.innerHTML = "<font color='red'>請輸入中文</font>";
	// 				nameflag = false;
	// 			} else {
	// 				idname.innerHTML = "<font color='green'>OK</font>";
	// 				nameflag = true;
	// 			}
	// 		} else {
	// 			idname.innerHTML = "<font color='red'>至少兩個字</font>";
	// 			nameflag = false;
	// 		}
	// 		check();
	// 	}

	// 	function checkPhone() {
	// 		var sPhone = document.getElementById("sPhone").value.trim();
	// 		var phoneLen = sPhone.length;
	// 		var idphone = document.getElementById("idphone");
	// 		var phoneCheck = false;
	// 		var regular = /^[0]{1}[9]{1}\d{8}$/;
	// 		if (sPhone == "") {
	// 			idphone.innerHTML = "<font color='red'>請輸入手機號碼</font>";
	// 		} else if (phoneLen < 10) {
	// 			idphone.innerHTML = "<font color='red'>請輸入10位號碼</font>";
	// 		} else if (!sPhone.match(regular)) {
	// 			idphone.innerHTML = "<font color='red'>請輸入09開頭電話號碼</font>";
	// 		} else {
	// 			var xhr = new XMLHttpRequest();
	// 			xhr.open("POST", "<c:url value='/member/MemberPhoneCheck' />",
	// 							true);
	// 			xhr.setRequestHeader("Content-Type",
	// 					"application/x-www-form-urlencoded");
	// 			xhr.send("sPhone=" + sPhone);
	// 			xhr.onreadystatechange = function() {
	// 				if (xhr.readyState == 4 && xhr.status == 200) {
	// 					console.log("sPhone=" + sPhone);
	// 					var result = JSON.parse(xhr.responseText);
	// 					if (result.sPhone.length == 0) {
	// 						idphone.innerHTML = "<font color='green'>電話可用</font>";
	// 						phoneflag = true;
	// 					} else {
	// 						idphone.innerHTML = "<font color='red'>電話已被使用，請重新輸入電話</font>";
	// 						phoneflag = false;
	// 					}
	// 				}
	// 			}
	// 		}
	// 	}

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

	// 	function check() {
	// 		if (passwordflag && nicknameflag && nameflag && addressflag
	// 				&& emailflag && phoneflag) {
	// 			document.getElementById("submit").disabled = false;
	// 		} else {
	// 			document.getElementById("submit").disabled = true;
	// 		}
	// 	}
</script>
</head>
<body>
	<%@ include file="../Header.jsp"%>

	<div class="row">
		<div id="DIV1" class="col-md-2">
			<H1>相關記錄</H1>
			<table>
				<tr>
					<td class="leftBar"><a href="<c:url value='/member/Data'/>">會員資料</a></td>
				</tr>
				<tr>
					<td class="leftBar"><a href="####">商城記錄</a></td>
				</tr>
				<tr>
					<td class="leftBar"><a
						href="<c:url value="/forum/gotoMemberData"/>">討論區記錄</a></td>
				</tr>
				<tr>
					<td class="leftBar"><a href="####">陪玩記錄</a></td>
				</tr>
				<tr>
					<td class="leftBar"><a
						href="<c:url value="/contest/gotoMemberData"/>">賽事記錄</a></td>
				</tr>
				<tr>
					<td class="leftBar"><a
						href="<c:url value="/exchange/gotoMemberData"/>">交換記錄</a></td>
				</tr>
			</table>
		</div>
		<div id="DIV2" class="col-md-9">
			<div class="detail" style="margin-top: 25">
				<h1 align='center'>修改${user.sAccount }的會員資料</h1>
				<form action="<c:url value='/member/MemberData'/>" method="post"
					enctype="multipart/form-data">
					<div id="DIV3">
						<img style="width: 400; height: 300;"
							src="<c:url value='/member/picture?sAccount=${user.sAccount}'/>"><br>
						<h6>
							點選換照片<input type="file" name="productImage" />
						</h6>
					</div>
					<div id="DIV4">
						<input name="iNo" type="hidden" value="${user.iNo}" readonly>
						<table>
							<tr class="b">
								<td>我的帳號</td>
								<td>:${user.sAccount}<input type="hidden" name="sAccount"
									value="${user.sAccount}" readonly></td>
							<tr class="b">
								<td>更改密碼</td>
								<td>:<input id="Password" type="password" name="sPassword"
									minlength="8" required maxlength="16" onblur="checkPassword();"
									value="${user.sPassword}"><input id="btn" type="button"
									class="material-icons btn btn-primary" style="font-size: 25px"
									value="visibility"></td>
							<tr class="b">
								<td>再次確認密碼</td>
								<td>:<input id="passwordConfirm" type="password"
									name="password" minlength="8" maxlength="16"
									onblur="checkPassword();"><span id="idpasswordConfirm"></span>
								</td>
							<tr class="b">
								<td></td>
								<td style='color: red;'>${showError}</td>
							</tr>
							<tr class="b">
								<td>我的暱稱</td>
								<td>:<input type="text" id="Nickname" name="sNickname"
									onblur="checkNickname();" required maxlength="10"
									value="${user.sNickname}"><span id="idnickname"></span></td>
							<tr class="b">
								<td>我的城市</td>
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
								<td></td>
								<td><input type="hidden" id="Ename" name="sEname" required
									onblur="checkName();" pattern="^[\u4e00-\u9fa5]+$"
									minlength="2" maxlength="4" value="${user.sEname}" readonly><span
									id="idname"></span></td>
							</tr>
							<tr class="b">
								<td></td>
								<td><input type="hidden" id="Email" name="sEmail" required
									pattern="^[a-z0-9]+([._\\-]*[a-z0-9])*@([a-z0-9]+[-a-z0-9]*[a-z0-9]+[.]){1,63}[a-z0-9]+$"
									onblur="checkEmail();" value="${user.sEmail}"><span
									id="idemail"></span></td>
							</tr>
							<tr class="b">
								<td></td>
								<td><input type="hidden" id="Phone" name="sPhone"
									maxlength="10" pattern="[0]{1}[9]{1}\d{8}"
									onblur="checkPhone();" value="${user.sPhone}"><span
									id="idphone"></span></td>
							</tr>
							<tr class="b">
								<td></td>
								<td><input type="hidden" name="sGender"
									value="${user.sGender}" readonly></td>
							</tr>
							<tr class="b">
								<td></td>
								<td><input type="hidden" name="sBirthday"
									value="${user.sBirthday}" readonly></td>
							</tr>
							<tr class="b">
								<td></td>
								<td><input type="hidden" name="registerDate"
									value="${user.registerDate}" readonly></td>
							</tr>
						</table>

						<H2 align='center'>
							<button id="submit" name="submit" type="submit"
								class="btn btn-primary"
								style="margin-bottom:20px ; font-weight: 900; border-radius: 10px;">
								<svg xmlns="http://www.w3.org/2000/svg" width="35" height="35"
									fill="currentColor" class="bi bi-cloud-arrow-up-fill"
									viewBox="0 0 16 16"> <path
									d="M8 2a5.53 5.53 0 0 0-3.594 1.342c-.766.66-1.321 1.52-1.464 2.383C1.266 6.095 0 7.555 0 9.318 0 11.366 1.708 13 3.781 13h8.906C14.502 13 16 11.57 16 9.773c0-1.636-1.242-2.969-2.834-3.194C12.923 3.999 10.69 2 8 2zm2.354 5.146a.5.5 0 0 1-.708.708L8.5 6.707V10.5a.5.5 0 0 1-1 0V6.707L6.354 7.854a.5.5 0 1 1-.708-.708l2-2a.5.5 0 0 1 .708 0l2 2z" />
								</svg>
								修改
							</button>
							<a href="<c:url value='/member/Data'/>"><button type="button"
									class="btn btn-primary"
									style="margin-bottom:20px ; font-weight: 900; border-radius: 10px;">
									<svg xmlns="http://www.w3.org/2000/svg" width="35" height="35"
										fill="currentColor" class="bi bi-backspace-fill"
										viewBox="0 0 16 16"> <path
										d="M15.683 3a2 2 0 0 0-2-2h-7.08a2 2 0 0 0-1.519.698L.241 7.35a1 1 0 0 0 0 1.302l4.843 5.65A2 2 0 0 0 6.603 15h7.08a2 2 0 0 0 2-2V3zM5.829 5.854a.5.5 0 1 1 .707-.708l2.147 2.147 2.146-2.147a.5.5 0 1 1 .707.708L9.39 8l2.146 2.146a.5.5 0 0 1-.707.708L8.683 8.707l-2.147 2.147a.5.5 0 0 1-.707-.708L7.976 8 5.829 5.854z" />
									</svg>
									回上一頁
								</button></a>
						</H2>
					</div>
				</form>
			</div>
		</div>
	</div>

	<%@ include file="../Foot.jsp"%>
</body>
</html>
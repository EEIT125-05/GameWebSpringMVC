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
	// 	let passwordflag = false;
	// 	let nicknameflag = true;
	// 	let nameflag = true;
	// 	let addressflag = true;
	// 	let emailflag = true;
	// 	let phoneflag = true;

	// 	window.onload = function() {
	// 		var btn = document.getElementById("btn");
	// 		var psw = document.getElementById("Password");
	// 		var pswC = document.getElementById("passwordConfirm");

	// 		btn.onclick = function() {
	// 			if (psw.getAttribute('type') == 'password') {
	// 				psw.setAttribute('type', 'text');
	// 				btn.value = "visibility_off";
	// 			} else if (psw.getAttribute('type') == 'text') {
	// 				psw.setAttribute('type', 'password');
	// 				btn.value = "visibility";
	// 			}
	// 			if (pswC.getAttribute('type') == 'password') {
	// 				pswC.setAttribute('type', 'text');
	// 				btn.value = "visibility_off";
	// 			} else if (pswC.getAttribute('type') == 'text') {
	// 				pswC.setAttribute('type', 'password');
	// 				btn.value = "visibility";
	// 			}

	// 		}

	// 	}

	// 	function checkNickname() {
	// 		let nickname = document.getElementById("Nickname").value;
	// 		let idnickname = document.getElementById("idnickname");
	// 		if (nickname == "") {
	// 			idnickname.innerHTML = "<font color='red'>請輸入暱稱</font>";
	// 			nicknameflag = false;
	// 		} else {
	// 			idnickname.innerHTML = "<font color='green'>OK</font>";
	// 			nicknameflag = true;
	// 		}
	// 		// 		check();
	// 	}

	function checkPhone() {
		let phone = document.getElementById("sPhone").value;
		let phoneLen = phone.length;
		let idphone = document.getElementById("idphone");
		let phoneCheck = false;
		let reg = /^[0]{1}[9]{1}\d{8}$/;
		document.getElementById("submit").disabled = true;
		if (phone == "") {
			// 			idphone.innerHTML = "<font color='red'>請輸入手機號碼</font>";
			document.getElementById("PhoneCheck").disabled = true;
			phoneflag = false;
		} else if (phoneLen >= 10) {
			if (reg.test(phone)) {
				document.getElementById("PhoneCheck").disabled = false;
				phoneCheck = true;
			}
			if (phoneCheck) {
				idphone.innerHTML = "<font color='blue'>必須檢查號碼才能新增資料</font>";
				// 				phoneflag = true;
			} else {
				idphone.innerHTML = "<font color='red'>請輸入09開頭電話號碼</font>";
				// 				phoneflag = false;
			}
		} else {
			idphone.innerHTML = "<font color='red'>至少輸入10位號碼</font>";
			// 			phoneflag = false;
		}
		// 		check();
	}

	window.onload = function() {
// 		var submit = document.getElementById("submit");
		document.getElementById("submit").disabled = false;
		var PhoneCheck = document.getElementById("PhoneCheck");
		PhoneCheck.onclick = function() {
			var sPhone = document.getElementById("sPhone").value.trim();
			var xhr = new XMLHttpRequest();
			xhr.open("POST", "<c:url value='/member/MemberPhoneCheck' />",
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
						document.getElementById("submit").disabled = false;
					} else {
						idphone.innerHTML = "<font color='red'>電話已被使用，請重新輸入電話</font>";
						document.getElementById("submit").disabled = true;
					}
				}
			}
		}
	}

	// 	function checkAddress() {
	// 		let address = document.getElementById("Address").value;
	// 		let idaddress = document.getElementById("idaddress");
	// 		if (address == "") {
	// 			idaddress.innerHTML = "<font color='red'>請輸入地址</font>";
	// 			addressflag = false;
	// 		} else {
	// 			idaddress.innerHTML = "<font color='green'>OK</font>";
	// 			addressflag = true;
	// 		}
	// 		// 		check();
	// 	}

	// 	function check() {
	// 		if ( nicknameflag && nameflag && addressflag
	// 				&& emailflag && phoneflag) {
	// 			document.getElementById("submit").disabled = false;
	// 		} else {
	// 			document.getElementById("submit").disabled = true;
	// 		}
	// 	}
</script>
</head>
<body>
	<H1 align='center'>會員修改資料</H1>
	<hr>
	<%@ include file="../Header.jsp"%>

	<form action="<c:url value='/member/GoogleData'/>" method="post"
		enctype="multipart/form-data">
		<div align='center'>
			<div align='left'
				style="border: 3px solid gray; width: 600; height: 800; border-radius: 5px;">
				<div align='center' style="padding-top: 15">
					<div>
						<img style="width: 250; height: 175;"
							src="<c:url value='/member/picture/${user.sAccount}'/>"><br>
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
					姓名:${user.sEname}<input type="hidden" id="Ename" name="sEname"
						required onblur="checkName();" pattern="^[\u4e00-\u9fa5]+$"
						minlength="2" maxlength="4" value="${user.sEname}" readonly><span
						id="idname"></span><input type="hidden" name="sPassword"
						value="${user.sPassword}" readonly>
				</h3>
				<h3>
					信箱:${user.sEmail}<input type="hidden" id="Email" name="sEmail"
						required
						pattern="^[a-z0-9]+([._\\-]*[a-z0-9])*@([a-z0-9]+[-a-z0-9]*[a-z0-9]+[.]){1,63}[a-z0-9]+$"
						onblur="checkEmail();" value="${user.sEmail}"><span
						id="idemail"></span>
				</h3>
				<h3>
					<c:choose>
						<c:when test="${empty user.sPhone}">
					新增手機號碼:<input type="text" id="sPhone" name="sPhone" maxlength="10"
								pattern="[0]{1}[9]{1}\d{8}" onblur="checkPhone();"
								value="${user.sPhone}">
							<input type="button" id='PhoneCheck' value="檢查" disabled>
							<span id="idphone"></span>
						</c:when>
						<c:otherwise>
						手機號碼:${user.sPhone}<input type="hidden" name="sPhone"
								value="${user.sPhone}">
						</c:otherwise>
					</c:choose>
				</h3>
				<h3>
					<c:choose>
						<c:when test="${empty user.sNickname}">新增暱稱:<input
								type="text" id="Nickname" name="sNickname" maxlength="10"
								value="${user.sNickname}">
							<span id="idnickname"></span>
						</c:when>
						<c:otherwise>
						修改暱稱:<input type="text" name="sNickname" value="${user.sNickname}">
						</c:otherwise>
					</c:choose>
				</h3>
				<h3>
					<c:choose>
						<c:when test="${empty user.sAddress}">新增居住城市:<select
								id="Address" name="sAddress">
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
						</c:when>
						<c:otherwise>
							更改居住城市:<select id="Address" name="sAddress">
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
							<%-- 							<input type="hidden" name="sAddress" value="${user.sAddress}"> --%>
						</c:otherwise>
					</c:choose>

				</h3>
				<h3>
					<c:choose>
						<c:when test="${empty user.sGender}">
							新增性別:<label><input type="radio" name="sGender" value="男"
								value="${user.sGender}" required>男</label>
							<label><input type="radio" name="sGender" value="女"
								value="${user.sGender}" required>女</label>
						</c:when>
						<c:otherwise>
							性別:${user.sGender}<input type="hidden" name="sGender"
								value="${user.sGender}">
						</c:otherwise>

					</c:choose>
				</h3>
				<h3>
					<c:choose>
						<c:when test="${empty user.sBirthday}">新增生日:<input
								type="date" name="sBirthday" value="${user.sBirthday}">
						</c:when>
						<c:otherwise>
							生年月日:${user.sBirthday}<input type="hidden" id="Birthday"
								name="sBirthday" value="${user.sBirthday}">
						</c:otherwise>
					</c:choose>
				</h3>
				<h3>
					建立日期:${user.registerDate}<input type="hidden" name="registerDate"
						value="${user.registerDate}">
				</h3>
				<H3 align='center'>
					<input id="submit" name="submit" type="submit" value="新增/修改"
						style='background-color: skyblue' disabled> <a
						href="<c:url value='/member/Data'/>"><input
						type="button" value="回上一頁" style='background-color: skyblue'></a>
				</H3>
			</div>
		</div>
	</form>

	<%@ include file="../Foot.jsp"%>
</body>
</html>
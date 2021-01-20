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
	width: 350px;
	line-height: 50px;
	padding: 10px;
	border: 5px gray solid;
	margin-left: 50;
	float: left;
}

#DIV2 {
	background-color: #272727;
	color: white;
	width: 650px;
	line-height: 50px;
	margin-left: 100;
	padding: 20px;
	border: 5px gray solid;
}

.a {
	width: 450px;
	height: 80px;
	border: 2px solid black;
	background-color: #272727;
	margin: auto;
	margin-bottom: 100px;
	font-size: 50;
	font-weight: 900;
}

.a:hover {
	background-color: white;
	color: black;
}

.b {
	background-color: #272727;
	color: white;
	font-size: 30;
	font-weight: 900;
}
.b:hover {
	color: #00FFFF;
}
button{
	background-color: white;
	color:black;
	font-weight: 900;
}
button:hover{
	background-color: #00FFFF;
	color:black;
	font-weight: 900;
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

	window.onload = function() {
		document.getElementById("submit").disabled = false;
	}
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
		var sPhone = document.getElementById("sPhone").value.trim();
		var phoneLen = sPhone.length;
		var idphone = document.getElementById("idphone");
		var phoneCheck = false;
		var regular = /^[0]{1}[9]{1}\d{8}$/;
		if (sPhone == "") {
			idphone.innerHTML = "<font color='red'>請輸入手機號碼</font>";
			document.getElementById("submit").disabled = true;
		} else if (phoneLen < 10) {
			idphone.innerHTML = "<font color='red'>請輸入10位號碼</font>";
			document.getElementById("submit").disabled = true;
		} else if (!sPhone.match(regular)) {
			idphone.innerHTML = "<font color='red'>請輸入09開頭電話號碼</font>";
			document.getElementById("submit").disabled = true;
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
	<div id="DIV1">
		<H1>相關記錄</H1>
		<table>
			<tr>
				<td class="a"><a href="####">商城記錄</a></td>
			</tr>
			<tr>
				<td class="a"><a href="####">討論區記錄</a></td>
			</tr>
			<tr>
				<td class="a"><a href="####">陪玩記錄</a></td>
			</tr>
			<tr>
				<td class="a"><a href="####">賽事記錄</a></td>
			</tr>
			<tr>
				<td class="a"><a href="####">交換記錄</a></td>
			</tr>
		</table>
	</div>
	<form action="<c:url value='/member/GoogleData'/>" method="post"
		enctype="multipart/form-data">
		<div align='center'>
			<div id="DIV2" style='margin-bottom: 30;'>
				<div align='center' style="padding-top: 15">
					<div>
						<img style="width: 250; height: 175;"
							src="<c:url value='/member/picture?sAccount=${user.sAccount}'/>"><br>
						點選換照片<input type="file" name="productImage" />
					</div>
				</div>
				<hr style="color: white; border: 1px solid;">
				<h3>
					<input name="iNo" type="hidden" value="${user.iNo}" readonly>
				</h3>
				<table>
					<tr class="b">
						<td>Google會員帳號</td>
						<td>:${user.sAccount}<input type="hidden" name="sAccount"
							value="${user.sAccount}" readonly></td>
					</tr>
					<tr class="b">
						<td>姓名</td>
						<td>:${user.sEname}<input type="hidden" id="Ename"
							name="sEname" required onblur="checkName();"
							pattern="^[\u4e00-\u9fa5]+$" minlength="2" maxlength="4"
							value="${user.sEname}" readonly></td>
						<span id="idname"></span>
						<input type="hidden" name="sPassword" value="${user.sPassword}"
							readonly>
					</tr>
					<tr class="b">
						<input type="hidden" id="Email" name="sEmail" required
							value="${user.sEmail}">
						<span id="idemail"></span>
					</tr>
					<tr class="b">
						<c:choose>
							<c:when test="${empty user.sPhone}">
								<td>新增手機號碼</td>
								<td>:<input type="text" id="sPhone" name="sPhone"
									maxlength="10" pattern="[0]{1}[9]{1}\d{8}"
									onblur="checkPhone();" value="${user.sPhone}"></td>
								<tr class="b">
									<td></td>
									<td><span id="idphone"></span></td>
								</tr>
							</c:when>
							<c:otherwise>
								<td>手機號碼</td>
								<td>:${user.sPhone}<input type="hidden" name="sPhone"
									value="${user.sPhone}"></td>
							</c:otherwise>
						</c:choose>
					</tr>
					<tr class="b">
						<c:choose>
							<c:when test="${empty user.sNickname}">
								<td>新增暱稱</td>
								<td>:<input type="text" id="Nickname" name="sNickname"
									maxlength="10" value="${user.sNickname}"></td>
								<span id="idnickname"></span>
							</c:when>
							<c:otherwise>
								<td>修改暱稱</td>
								<td>:<input type="text" name="sNickname"
									value="${user.sNickname}"></td>
							</c:otherwise>
						</c:choose>
					</tr>
					<tr class="b">
						<c:choose>
							<c:when test="${empty user.sAddress}">
								<td>新增居住城市</td>
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
							</c:when>
							<c:otherwise>
								<td>更改居住城市</td>
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
								<%-- 							<input type="hidden" name="sAddress" value="${user.sAddress}"> --%>
							</c:otherwise>
						</c:choose>

					</tr>
					<tr class="b">
						<c:choose>
							<c:when test="${empty user.sGender}">
								<td>新增性別</td>
								<td>:<label><input type="radio" name="sGender"
										value="男" value="${user.sGender}" required>男</label> <label><input
										type="radio" name="sGender" value="女" value="${user.sGender}"
										required>女</label></td>
							</c:when>
							<c:otherwise>
								<td>性別</td>
								<td>:${user.sGender}<input type="hidden" name="sGender"
									value="${user.sGender}"></td>
							</c:otherwise>

						</c:choose>
					</tr>
					<tr class="b">
						<c:choose>
							<c:when test="${empty user.sBirthday}">
								<td>新增生日</td>
								<td>:<input type="date" name="sBirthday"
									value="${user.sBirthday}"></td>
							</c:when>
							<c:otherwise>
								<td>生年月日</td>
								<td>:${user.sBirthday}<input type="hidden" id="Birthday"
									name="sBirthday" value="${user.sBirthday}"></td>
							</c:otherwise>
						</c:choose>
					</tr>
					<tr class="b">
						<td>建立日期</td>
						<td>:${user.registerDate}<input type="hidden"
							name="registerDate" value="${user.registerDate}"></td>
					</tr>
				</table>
				<H3 align='center' style='padding-top: 20;'>
					<button id="submit" name="submit" type="submit" disabled>
						<svg xmlns="http://www.w3.org/2000/svg" width="35" height="35"
							fill="currentColor" class="bi bi-cloud-arrow-up-fill"
							viewBox="0 0 16 16"> <path
							d="M8 2a5.53 5.53 0 0 0-3.594 1.342c-.766.66-1.321 1.52-1.464 2.383C1.266 6.095 0 7.555 0 9.318 0 11.366 1.708 13 3.781 13h8.906C14.502 13 16 11.57 16 9.773c0-1.636-1.242-2.969-2.834-3.194C12.923 3.999 10.69 2 8 2zm2.354 5.146a.5.5 0 0 1-.708.708L8.5 6.707V10.5a.5.5 0 0 1-1 0V6.707L6.354 7.854a.5.5 0 1 1-.708-.708l2-2a.5.5 0 0 1 .708 0l2 2z" />
						</svg>
						新增/修改
					</button>
					<a href="<c:url value='/member/Data'/>"><button type="button">
							<svg xmlns="http://www.w3.org/2000/svg" width="35" height="35"
								fill="currentColor" class="bi bi-backspace-fill"
								viewBox="0 0 16 16"> <path
								d="M15.683 3a2 2 0 0 0-2-2h-7.08a2 2 0 0 0-1.519.698L.241 7.35a1 1 0 0 0 0 1.302l4.843 5.65A2 2 0 0 0 6.603 15h7.08a2 2 0 0 0 2-2V3zM5.829 5.854a.5.5 0 1 1 .707-.708l2.147 2.147 2.146-2.147a.5.5 0 1 1 .707.708L9.39 8l2.146 2.146a.5.5 0 0 1-.707.708L8.683 8.707l-2.147 2.147a.5.5 0 0 1-.707-.708L7.976 8 5.829 5.854z" />
							</svg>
							回上一頁
						</button></a>
				</H3>
			</div>
		</div>
	</form>

	<%@ include file="../Foot.jsp"%>
</body>
</html>
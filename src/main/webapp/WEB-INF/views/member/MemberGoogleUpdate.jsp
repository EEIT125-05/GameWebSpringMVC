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
	padding-left: 50px;
}

#DIV3 {
	padding: 25px;
	float: left;
}

#DIV4 {
	background-color: skyblue;
	width: 500px;
	height: 350px;
	margin: 25px;
	border: 3px solid gray;
	float: right;
}

table {
	margin: 15px;
}

.b {
	color: black;
	font-size: 20;
	font-weight: 900;
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

.b:hover {
	color:white;
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
	width: 1050px;
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

	window.onload = function() {
		document.getElementById("submit").disabled = false;
		var sGender = document.getElementById('sGender').checked = false;
	}

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

	function OneLogin() {
		var sPhone = document.getElementById("sPhone");
		var sNickname = document.getElementById("sNickname");
		var sAddress = document.getElementById("sAddress").options[5].selected = true;
// 		var sGender = document.getElementById('sGender').checked = true;
		var sBirthday = document.getElementById("sBirthday");

		sPhone.value = "0981562590";
		sNickname.value = "奶茶糾齁拎";
		sAddress;
// 		sGender;
		sBirthday.value = "2021-01-28";
	}
</script>
</head>
<body>

	<hr>
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
			<form action="<c:url value='/member/GoogleData'/>" method="post"
				enctype="multipart/form-data">
				<div class="detail" style='padding-left: 30px; margin-top: 30px;'>
					<H1 align='center'>Google會員修改資料</H1>
					<div id="DIV3">
						<img style="width: 350; height: 300;"
							src="<c:url value='/member/picture?sAccount=${user.sAccount}'/>"><br>
						<h6>
							點選換照片<input type="file" name="productImage" />
						</h6>
					</div>
					<div id="DIV4">
						<input name="iNo" type="hidden" value="${user.iNo}" readonly>
						<table>
							<tr class="b">
								<td>會員帳號</td>
								<td>:${user.sAccount}<input type="hidden" name="sAccount"
									value="${user.sAccount}" readonly></td>
							</tr>
							<tr class="b">
								<td></td>
								<td><input type="hidden" id="Ename" name="sEname" required
									onblur="checkName();" pattern="^[\u4e00-\u9fa5]+$"
									minlength="2" maxlength="4" value="${user.sEname}" readonly></td>
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
										<td>新增手機</td>
										<td>:<input type="text" id="sPhone" name="sPhone"
											maxlength="10" pattern="[0]{1}[9]{1}\d{8}"
											onblur="checkPhone();" value="${user.sPhone}"></td>
										<tr class="b">
											<td></td>
											<td><span id="idphone"></span></td>
										</tr>
									</c:when>
									<c:otherwise>
										<td></td>
										<td><input type="hidden" name="sPhone"
											value="${user.sPhone}"></td>
									</c:otherwise>
								</c:choose>
							</tr>
							<tr class="b">
								<c:choose>
									<c:when test="${empty user.sNickname}">
										<td>新增暱稱</td>
										<td>:<input type="text" id="sNickname" name="sNickname"
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
										<td>新增城市</td>
										<td>:<select id="sAddress" name="sAddress">
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
										<td>更改城市</td>
										<td>:<select id="sAddress" name="sAddress">
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
										<td>:<label><input type="radio" id="sGender"
												name="sGender" checked="checked" value="男" required>男</label>
											<label><input type="radio" name="sGender" value="女"
												id="sGender" required>女</label></td>
									</c:when>
									<c:otherwise>
										<td></td>
										<td><input type="hidden" name="sGender"
											value="${user.sGender}"></td>
									</c:otherwise>

								</c:choose>
							</tr>
							<tr class="b">
								<c:choose>
									<c:when test="${empty user.sBirthday}">
										<td>新增生日</td>
										<td>:<input type="date" id="sBirthday" name="sBirthday"
											value="${user.sBirthday}"></td>
									</c:when>
									<c:otherwise>
										<td></td>
										<td><input type="hidden" id="Birthday" name="sBirthday"
											value="${user.sBirthday}"></td>
									</c:otherwise>
								</c:choose>
							</tr>
							<tr class="b">
								<td></td>
								<td><input type="hidden" name="registerDate"
									value="${user.registerDate}"></td>
							</tr>
						</table>

						<H3 align='center' style='padding-top: 20;'>
							<button id="submit" name="submit" type="submit" disabled
								class="btn btn-primary" style="margin-top: 5;">
								<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25"
									fill="currentColor" class="bi bi-cloud-arrow-up-fill"
									viewBox="0 0 16 16"> <path
									d="M8 2a5.53 5.53 0 0 0-3.594 1.342c-.766.66-1.321 1.52-1.464 2.383C1.266 6.095 0 7.555 0 9.318 0 11.366 1.708 13 3.781 13h8.906C14.502 13 16 11.57 16 9.773c0-1.636-1.242-2.969-2.834-3.194C12.923 3.999 10.69 2 8 2zm2.354 5.146a.5.5 0 0 1-.708.708L8.5 6.707V10.5a.5.5 0 0 1-1 0V6.707L6.354 7.854a.5.5 0 1 1-.708-.708l2-2a.5.5 0 0 1 .708 0l2 2z" />
								</svg>
								新增/修改
							</button>
							<a href="<c:url value='/member/Data'/>"><button type="button"
									style="margin-top: 5;" class="btn btn-primary">
									<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25"
										fill="currentColor" class="bi bi-backspace-fill"
										viewBox="0 0 16 16"> <path
										d="M15.683 3a2 2 0 0 0-2-2h-7.08a2 2 0 0 0-1.519.698L.241 7.35a1 1 0 0 0 0 1.302l4.843 5.65A2 2 0 0 0 6.603 15h7.08a2 2 0 0 0 2-2V3zM5.829 5.854a.5.5 0 1 1 .707-.708l2.147 2.147 2.146-2.147a.5.5 0 1 1 .707.708L9.39 8l2.146 2.146a.5.5 0 0 1-.707.708L8.683 8.707l-2.147 2.147a.5.5 0 0 1-.707-.708L7.976 8 5.829 5.854z" />
									</svg>
									回上一頁
								</button></a>
							<button id="submit" name="submit" type="button"
								onclick="OneLogin();" class="btn btn-primary"
								style="margin-top: 5;">
								<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25"
									fill="currentColor" class="bi bi-hand-index"
									viewBox="0 0 16 16"> <path
									d="M6.75 1a.75.75 0 0 1 .75.75V8a.5.5 0 0 0 1 0V5.467l.086-.004c.317-.012.637-.008.816.027.134.027.294.096.448.182.077.042.15.147.15.314V8a.5.5 0 1 0 1 0V6.435a4.9 4.9 0 0 1 .106-.01c.316-.024.584-.01.708.04.118.046.3.207.486.43.081.096.15.19.2.259V8.5a.5.5 0 0 0 1 0v-1h.342a1 1 0 0 1 .995 1.1l-.271 2.715a2.5 2.5 0 0 1-.317.991l-1.395 2.442a.5.5 0 0 1-.434.252H6.035a.5.5 0 0 1-.416-.223l-1.433-2.15a1.5 1.5 0 0 1-.243-.666l-.345-3.105a.5.5 0 0 1 .399-.546L5 8.11V9a.5.5 0 0 0 1 0V1.75A.75.75 0 0 1 6.75 1zM8.5 4.466V1.75a1.75 1.75 0 1 0-3.5 0v5.34l-1.2.24a1.5 1.5 0 0 0-1.196 1.636l.345 3.106a2.5 2.5 0 0 0 .405 1.11l1.433 2.15A1.5 1.5 0 0 0 6.035 16h6.385a1.5 1.5 0 0 0 1.302-.756l1.395-2.441a3.5 3.5 0 0 0 .444-1.389l.271-2.715a2 2 0 0 0-1.99-2.199h-.581a5.114 5.114 0 0 0-.195-.248c-.191-.229-.51-.568-.88-.716-.364-.146-.846-.132-1.158-.108l-.132.012a1.26 1.26 0 0 0-.56-.642 2.632 2.632 0 0 0-.738-.288c-.31-.062-.739-.058-1.05-.046l-.048.002zm2.094 2.025z" />
								</svg>
								一鍵輸入
							</button>
						</H3>
					</div>
				</div>
			</form>
		</div>
	</div>
	<%@ include file="../Foot.jsp"%>
</body>
</html>
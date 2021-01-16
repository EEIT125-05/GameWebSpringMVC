<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../Link.jsp"%>
<%
	request.setCharacterEncoding("UTF-8");
response.setContentType("text/html;charset=UTF-8");
response.setContentType("text/html;charset=UTF-8");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", -1);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Google資料填寫</title>
<style>
input {
	border-radius: 10px;
}
</style>
<script>
	let phoneflag = false;
	
	function checkPhone() {
		let phone = document.getElementById("sPhone").value.trim();
		let phoneLen = phone.length;
		let idphone = document.getElementById("idphone");
		let phoneCheck = false;
		let reg = /^[0]{1}[9]{1}\d{8}$/;
		if (phone == "") {
			idphone.innerHTML = "<font color='red'>請輸入手機號碼</font>";
			document.getElementById("PhoneCheck").disabled = true;
			phoneflag = false;
		} else if (phoneLen >= 10) {
			if (reg.test(phone)) {
				document.getElementById("PhoneCheck").disabled = false;
			}
			if (phoneCheck) {
				idphone.innerHTML = "<font color='blue'>請檢查號碼</font>";
				phoneflag = false;
			} else {
				idphone.innerHTML = "<font color='red'>請輸入09開頭電話號碼</font>";
				phoneflag = false;
			}
		} else {
			idphone.innerHTML = "<font color='red'>請輸入10位號碼</font>";
			phoneflag = false;
		}

	}

	window.onload = function() {
		var PhoneCheck = document.getElementById("PhoneCheck");
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
						phoneCheck = true;
						phoneflag = true;
					} else {
						idphone.innerHTML = "<font color='red'>電話已被使用，請重新輸入電話</font>";
						phoneflag = false;
					}
				}
			}
			check();
		}
	}
	
	
	function check() {
		if (phoneflag) {
			document.getElementById("submit").disabled = false;
		} else {
			document.getElementById("submit").disabled = true;
		}
</script>
</head>

<body>
	<%@ include file="../Header.jsp"%>

	<h2 align='center'>請填入Google資料</h2>
	<hr>
	<form action="<c:url value='/member/MemberThanks'/>" method="post"
		enctype="multipart/form-data">
		<div align='center'>
			<div align='left'
				style="border: 3px solid gray; width: 650; height: 600; border-radius: 5px;">
				<h3>
					設定的帳號:${user.sAccount}<input type="hidden" name="sAccount"
						value='${param.sAccount}' />
				</h3>
				<h3>
					<input type="hidden" name="sEmail" value='${param.sEmail}' />
				</h3>
				<h3>
					真實姓名:${user.sEname}<input type="hidden" name="sEname"
						value='${user.sEname}' />
				</h3>
				<h3>
					手機號碼:<input type="text" id="sPhone" name="sPhone" maxlength="10"
						required onblur="checkPhone();" pattern="[0]{1}[9]{1}\d{8}" /> <input
						type="button" id='PhoneCheck' value="檢查" disabled> <span
						id="idphone"></span>
				</h3>
				<h3>
					使用的暱稱:<input type="text" id="Nickname" name="sNickname"
						maxlength="10" onblur="checkNickname();"> <span
						id="idnickname"></span>
				</h3>
				<h3>
					居住城市:${user.sAddress}<select id="Address" name="sAddress">
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
					</select><span id="idaddress"></span>
				</h3>
				<h3>
					性別:<label><input type="radio" name="sGender" value="男"
						required>男</label> <label><input type="radio"
						name="sGender" value="女" required>女</label></span>
				</h3>
				<h3>
					生年月日:<input type="date" id="Birthday" name="sBirthday">
				</h3>
				<h3>
					請選擇上傳照片:<input type="file" name="productImage" />
				</h3>
				<%-- 			<h3><img type="hidden" name="image" value='${param.image}'/></h3> --%>
				<h3>建立日期:${user.registerDate}</h3>
				<input type="hidden" name="status">
				<h3 align='center'>
					<button type="submit" name="confirm" value="確認"
						style='width: 400; height: 50; font-size: 30; margin-top: 15;'
						disabled>Google帳戶資料確認送出</button>
				</h3>
			</div>
		</div>
	</form>

	<%@ include file="../Foot.jsp"%>
</body>
</html>
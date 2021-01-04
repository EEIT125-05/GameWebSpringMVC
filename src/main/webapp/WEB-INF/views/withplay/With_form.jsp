<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ include file="../Link.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>New With Play</title>
<link rel="stylesheet" href="../css/WithGame.css">
<script>
	let Commentflag = false;
	let Idcodeflag = false;
	function checkComment() {
		let Comment = document.getElementById("Comment").value.trim();
		let CommentLen = Comment.length;
		let idname = document.getElementById("idname");

		let CommentCheck = false;
		if (Comment == "") {
			idname.innerHTML = "<font color='red'>請輸入自我介紹</font>";
		} else if (CommentLen >= 6) {
			for (let idname = 0; idname < CommentLen; idname++) {
				let ENAME = Comment.charAt(idname);
				if (ENAME.charCodeAt(idname) < 0x4E00
						|| ENAME.charCodeAt(idname) > 0x9FA5) {
					CommentCheck = true;
					if (CommentCheck)
						break;
				}
			}
			if (CommentCheck) {
				idname.innerHTML = "<font color='red'>請輸入中文</font>";
				nameflag = false;
			} else {
				idname.innerHTML = "<font color='green'>OK</font>";
				nameflag = true;
			}
		} else {
			idname.innerHTML = "<font color='red'>至少六個字</font>";
			Commentflag = false;
		}
		check();
	}
	
	function checkIdcode() {
		let iIdcode = document.getElementById("sIdcode").value.trim();
		let IdcodeLen = iIdcode.length;
		let Idcode = document.getElementById("Idcode");
		let IdcodeCheck = false;
		let reg = /^[a-zA-Z]{1}[1-2]{1}\d{8}$/;
		if (iIdcode == "") {
			Idcode.innerHTML = "<font color='red'>請輸入身份證字號</font>";
			Idcodeflag = false;
		} else if (IdcodeLen >= 10 && reg.test(iIdcode)) {
// 			if (reg.test(phone)) {
				IdcodeCheck = true;
// 			}
			if (IdcodeCheck) {
				Idcode.innerHTML = "<font color='green'>請檢查號碼</font>";
				
				Idcodeflag = false;
			} 
		} else {
			Idcode.innerHTML = "<font color='red'>請輸入正確格式</font>";
			Idcodeflag = false;
		}
// 		check();
	}
	
	window.onload = function() {
	var Check = document.getElementById("IdcodeCheck");
	let reg = /^[a-zA-Z]{1}[1-2]{1}\d{8}$/;
	Check.onclick = function() {
		var sIdcode = document.getElementById("sIdcode").value.trim();
		if(sIdcode != ""&& reg.test(sIdcode)){	
		var xhr = new XMLHttpRequest();
		xhr.open("POST", "<c:url value='/withplay/IDCheck' />", true);
		xhr.setRequestHeader("Content-Type",
				"application/x-www-form-urlencoded");
		xhr.send("sIdcode=" + sIdcode);
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				console.log("sIdcode=" + sIdcode);
				var result = JSON.parse(xhr.responseText);
				if (result.sIdcode.length == 0) {
					Idcode.innerHTML = "<font color='green'>身份證字號可用</font>";
					Idcodeflag = true;
				} else {
					Idcode.innerHTML = "<font color='red'>身份證字號已被使用，請重新輸入</font>";
					Idcodeflag = false;
				}
				}
			}
		}else{
			Idcode.innerHTML = "<font color='red'>請確認身份證字號格式</font>";
			Idcodeflag = false;
		}
	}
	
}

</script>
</head>
<body>
<%@ include file="../Header.jsp" %>
<div class="container">

<ol class="breadcrumb">
      <li class="breadcrumb-item">
        <a href="<c:url value='/'/>">Home</a>
      </li>
    </ol>
    
	<div align="center">
		<form:form method="post" modelAttribute="With"
			enctype='multipart/form-data'>
			<table cellpadding="5">
			
				<form:hidden path="iId" />
				<form:hidden path="sGender" items='${sGenderMap}' readonly="true" />

				<tr>
					<td>Account</td>
					<td><form:input path="sAccount" readonly="true"/>&nbsp;<form:errors path="sAccount"/></td>
					
				</tr>
				<tr>
					<td>Name</td>
					<td><form:input path="sName" readonly="true"/>&nbsp;<form:errors path="sName"/></td>
				</tr>
				<tr>
					<td>Nickname</td>
					<td><form:input path="sNickname" />&nbsp;<form:errors path="sNickname"/></td>
				</tr>
				<tr>
					<td>Idcode</td>
					<td><form:input path="sIdcode" maxlength="10" id="sIdcode"  onblur="checkIdcode();"/>&nbsp;
					<input type="button" id='IdcodeCheck' value="檢查"><span id="Idcode"></span>
					</td>
				</tr>
				<tr>
					<td>Game</td>
					<td><form:checkboxes path="sGame" items='${sGameMap}' />&nbsp;<form:errors path="sGame"/></td>

				</tr>
				<tr>
					<td>照片：<br>&nbsp;
					</td>
					<td><form:input path="mWithImage" type='file' /></td>

					
				</tr>
				<tr>
					<td>Price</td>
					<td><form:input path="iPrice" />&nbsp;<form:errors path="iPrice"/></td>
				</tr>
				<tr>
					<td>Comment</td>
					<td><form:textarea path="sComment" id="Comment"  onblur="checkComment();" rows="6" cols="30"
					 pattern="^[\u4e00-\u9fa5]+$" minlength="6"/><span id="idname"></span>&nbsp;</td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="submit"></td>
				</tr>
			</table>
		</form:form>

	</div>
		</div>
	
	<%@ include file="../Foot.jsp" %>
	
</body>
</html>
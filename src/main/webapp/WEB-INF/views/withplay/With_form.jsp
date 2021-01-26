<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../Link.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>New With Play</title>
<link rel="stylesheet" href="../css/WithGame.css">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>
	let Commentflag = false;
	let Idcodeflag = false;
	function checkComment() {
		let Comment = document.getElementById("Comment").value.trim();
		let CommentLen = Comment.length;
		let idname = document.getElementById("idname");

		let CommentCheck = false;
		if (Comment == "") {
			idname.innerHTML = "<font color='yellow'>請輸入自我介紹</font>";
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
				idname.innerHTML = "<font color='yellow'>請輸入中文</font>";
				nameflag = false;
			} else {
				idname.innerHTML = "<font color='yellow'>OK</font>";
				nameflag = true;
			}
		} else {
			idname.innerHTML = "<font color='yellow'>至少六個字</font>";
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
			Idcode.innerHTML = "<font color='yellow'>請輸入身份證字號</font>";
			Idcodeflag = false;
		} else if (IdcodeLen >= 10 && reg.test(iIdcode)) {
// 			if (reg.test(phone)) {
				IdcodeCheck = true;
// 			}
			if (IdcodeCheck) {
				Idcode.innerHTML = "<font color='yellow'>請檢查號碼</font>";
				
				Idcodeflag = false;
			} 
		} else {
			Idcode.innerHTML = "<font color='yellow'>請輸入正確格式</font>";
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
					Idcode.innerHTML = "<font color='yellow'>身份證字號可用</font>";
					Idcodeflag = true;
				} else {
					Idcode.innerHTML = "<font color='yellow' '>身份證字號已被使用，請重新輸入</font>";
					Idcodeflag = false;
				}
				}
			}
		}else{
			Idcode.innerHTML = "<font color='yellow'>請確認身份證字號格式</font>";
			Idcodeflag = false;
		}
	}
	
}
	
</script>
<style>
.com{
    max-width:850px; 
}
td{
	color:white;
	font: 1.2em "Helvetica Neue", Helvetica, Arial, sans-serif;
	font-weight:bold;
}
</style>
</head>
<body>
<%@ include file="../Header.jsp" %>
<div class="container">

<ol class="breadcrumb">
      <li class="breadcrumb-item">
        <a href="<c:url value='/'/>">Home</a>
      </li>
      <li class="breadcrumb-item active">成為陪玩主</li>
    </ol>
    
	<div align="center">
		<form:form method="post" modelAttribute="With"
			enctype='multipart/form-data' class="dark-matter com">
			<table >
				<tbody >
				<form:hidden path="iId" />
				<form:hidden path="sGender" items='${sGenderMap}' readonly="true" />

				<tr>
					<td>帳號</td>
					<td><form:input path="sAccount" readonly="true"/>&nbsp;<span style="color:red;"><form:errors path="sAccount"/></span></td>
					
					
				</tr>
				<tr>
					<td>姓名</td>
					<td><form:input path="sName" readonly="true"/>&nbsp;<form:errors path="sName"/></td>
				</tr>
				<tr>
					<td>暱稱</td>
					<td><form:input path="sNickname" /><span style="color:yellow;"><form:errors  path="sNickname"/></span></td>
					
				</tr>
				<tr>
					<td>身分證字號</td>
					<td><form:input path="sIdcode" maxlength="10" id="sIdcode"  onblur="checkIdcode();"/>
					<input type="button" id='IdcodeCheck' class="btn btn-warning btn-sm" value="檢查"><br><span id="Idcode"></span>
					</td>
				</tr>
				<tr>
					<td>遊戲選項</td>
					<td><span style="color:lightgrey;"><form:checkboxes path="sGame" items='${sGameMap}' /></span><br><span style="color:yellow;"><form:errors path="sGame"/></span></td>

				</tr>
				<tr>
					<td>照片<br>&nbsp;
					</td>
					<td >
					<form:input path="mWithImage" type='file' accept="image/*" id="fImage" style="width:346px;overflow:hidden;"/>
					<label id="previewLabel"></label><br>
            		<img id="imagePreview">
            		</td>
				</tr>
				
				<tr>
					<td>金額</td>
					<td><form:input path="iPrice"  placeholder="不得大於150元" />&nbsp;<span style="color:yellow;"><form:errors path="iPrice" placeholder="不得大於150元"/></span></td>
				</tr>
				<tr>
					<td>自我介紹</td>
					<td><form:textarea path="sComment" id="Comment"  onblur="checkComment();" rows="6" cols="30"
					 pattern="^[\u4e00-\u9fa5]+$" minlength="6" placeholder="輸入中文六個字以上"/><span id="idname"></span></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="submit" class="button"></td>
				</tr>
				<tbody/>
			</table>
				
		</form:form>

	</div>
		</div>
	
	<%@ include file="../Foot.jsp" %>
	<script>
		function checkSubmit() {
			swal.fire("成功", "", "success").then(function() {
				$('form').submit()
				console.log("success")
			})
		}

	$(function(){
		
		console.log("file: " + $("#fImage").val());
		
		$("#imagePreview").hide();
		$("#previewLabel").hide();
		
		$("#fImage").on("change",function(){

 
			console.log("file: " + $("#fImage").val());
            let fileReader = new FileReader();
            let imageFile = this.files[0];
            
            if(typeof(imageFile) == "object"){
	            fileReader.readAsDataURL(imageFile);
            }else{
	            $("#imagePreview").hide();
	    		$("#previewLabel").hide();
            }
            
            fileReader.onload = function(e) {
            	$("#previewLabel").show();
            	$("#imagePreview").show();
            	$("#imagePreview").attr('src',e.target.result)
            						.attr('style',"height:300px;width:346px;");
            }

		});
		
	});
	

</script>
</body>
</html>
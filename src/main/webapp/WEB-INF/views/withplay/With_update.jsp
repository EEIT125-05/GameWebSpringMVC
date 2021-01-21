<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ include file="../Link.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>With Play</title>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10.13.0/dist/sweetalert2.all.min.js"></script>
<script>
	let Commentflag = false;
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
				idname.innerHTML = "<font color='yellow'>OK</font>";
				nameflag = true;
			}
		} else {
			idname.innerHTML = "<font color='red'>至少六個字</font>";
			Commentflag = false;
		}
		check();
	}


</script>
<style>

.com{
    max-width:850px;
    
}
td{
	color:lightgrey;
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
      <li class="breadcrumb-item active">修改陪玩主個人資料</li>
    </ol>
    
	<div align="center">
		<form:form method="post" modelAttribute="With" action="${pageContext.request.contextPath}/withplay/edit"
			enctype='multipart/form-data' class="dark-matter com">
			<table cellpadding="5">
				<tbody >
				<form:hidden path="iId" />
				<form:hidden path="sGender" items='${sGenderMap}' readonly="true" />
				<form:hidden path="iCount"/>
				<form:hidden path="iStatus"  />

				<tr>
					<td>帳號</td>
					<td><form:input path="sAccount" readonly="true"/></td>
				</tr>
				<tr>
					<td>姓名</td>
					<td><form:input path="sName" readonly="true"/></td>
				</tr>
				<tr>
					<td>暱稱</td>
					<td><form:input path="sNickname" /></td>
					<form:errors path="sNickname" cssClass="error" />

				</tr>
				<tr>
					<td>身分證字號</td>
					<td><form:input path="sIdcode" readonly="true"/></td>
					<form:errors path="sIdcode" cssClass="error" />

				</tr>
				<tr>
					<td>遊戲選項</td>
					<td><form:checkboxes  path="sGame" items='${sGameMap}'/></td>
					<form:errors path="sGame" cssClass="error" />

				</tr>
				<tr>
					<td>照片：<br>
					</td>
					<td>
					<form:input path="mWithImage" type='file' accept="image/*" id="fImage" style="width:346px;overflow:hidden;"/>
					<label id="previewLabel"></label><br>
            		<img id="imagePreview">
            		</td>
				</tr>
				<tr>
					<td>金額</td>
					<td><form:input path="iPrice" placeholder="不得大於150元" /><form:errors path="iPrice"  /></td>
				</tr>
				<tr>
					<td>自我介紹</td>
					<td><form:textarea path="sComment" id="Comment"  onblur="checkComment();"  rows="6" cols="30"
					 pattern="^[\u4e00-\u9fa5]+$" minlength="6" placeholder="輸入中文六個字以上"/><span id="idname"></span></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><button type="button"
									class="button" onclick="checkSubmit()">送出</button></td>
				</tr>
				</tbody>
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
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
				idname.innerHTML = "<font color='green'>OK</font>";
				nameflag = true;
			}
		} else {
			idname.innerHTML = "<font color='red'>至少六個字</font>";
			Commentflag = false;
		}
		check();
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
		<form:form method="post" modelAttribute="With" action="${pageContext.request.contextPath}/withplay/edit"
			enctype='multipart/form-data' class="dark-matter">
			<table cellpadding="5">
				<form:hidden path="iId" />
				<form:hidden path="sGender" items='${sGenderMap}' readonly="true" />

				<tr>
					<td>Account</td>
					<td><form:input path="sAccount" readonly="true"/></td>
				</tr>
				<tr>
					<td>Name</td>
					<td><form:input path="sName" readonly="true"/></td>
				</tr>
				<tr>
					<td>Nickname</td>
					<td><form:input path="sNickname" /></td>
					<form:errors path="sNickname" cssClass="error" />

				</tr>
				<tr>
					<td>Idcode</td>
					<td><form:input path="sIdcode" readonly="true"/></td>
					<form:errors path="sIdcode" cssClass="error" />

				</tr>
				<tr>
					<td>Game</td>
					<td><form:checkboxes  path="sGame" items='${sGameMap}'/></td>
					<form:errors path="sGame" cssClass="error" />

				</tr>
				<tr>
					<td>照片：<br>&nbsp;
					</td>
					<td><form:input path="mWithImage" type='file' /><br>&nbsp;
				</tr>
				<tr>
					<td>Price</td>
					<td><form:input path="iPrice" /><form:errors path="iPrice"  /></td>
				</tr>
				<tr>
					<td>Comment</td>
					<td><form:textarea path="sComment" id="Comment"  onblur="checkComment();"  rows="6" cols="30"
					 pattern="^[\u4e00-\u9fa5]+$" minlength="6"/><span id="idname"></span></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="submit" class="btn btn-outline-primary"></td>
				</tr>
			</table>
		</form:form>

	</div>
		</div>
	
	<%@ include file="../Foot.jsp" %>
	
</body>
</html>
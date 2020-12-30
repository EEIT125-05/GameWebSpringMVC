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
					<td><form:input path="sIdcode" />&nbsp;<form:errors path="sIdcode"/></td>
				</tr>
				<tr>
					<td>Game</td>
					<td><form:checkboxes path="sGame" items='${sGameMap}' />&nbsp;<form:errors path="sGame"/></td>

				</tr>
				<tr>
					<td>Comment</td>
					<td><form:input path="sComment" />&nbsp;<form:errors path="sComment"/></td>
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
					<td colspan="2" align="center"><input type="submit"></td>
				</tr>
			</table>
		</form:form>

	</div>
		</div>
	
	<%@ include file="../Foot.jsp" %>
	
</body>
</html>
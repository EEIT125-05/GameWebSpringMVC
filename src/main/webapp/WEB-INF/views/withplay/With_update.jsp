<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>New With Play</title>
</head>
<body>
	<div align="center">
		<H1>New WithPlay</H1>
		<form:form method="post" modelAttribute="With"
			enctype='multipart/form-data'>
			<table cellpadding="5">
				<form:hidden path="iId" />

				<tr>
					<td>Account</td>
					<td><form:input path="sAccount" /></td>
				</tr>
				<tr>
					<td>Name</td>
					<td><form:input path="sName" /></td>
				</tr>
				<tr>
					<td>Nickname</td>
					<td><form:input path="sNickname" /></td>
					<form:errors path="sNickname" cssClass="error" />

				</tr>
				<tr>
					<td>Gender</td>
					<td><form:radiobuttons path="sGender" items='${sGenderMap}' /></td>
				</tr>
				<tr>
					<td>Idcode</td>
					<td><form:input path="sIdcode" /></td>
					<form:errors path="sIdcode" cssClass="error" />

				</tr>
				<tr>
					<td>Game</td>
					<td><form:input path="sGame" /></td>
					<form:errors path="sGame" cssClass="error" />

				</tr>
				<tr>
					<td>Comment</td>
					<td><form:input path="sComment" /></td>
					<form:errors path="sComment" cssClass="error" />

				</tr>
				<tr>
					<td>照片：<br>&nbsp;
					</td>
					<td><form:input path="mWithImage" type='file' /><br>&nbsp;
				</tr>
				<tr>
					<td>Price</td>
					<td><form:input path="iPrice" /></td>
					<form:errors path="iPrice" cssClass="error" />

				</tr>
				<tr>
					<td colspan="2" align="center"><input type="submit"></td>
				</tr>
			</table>
		</form:form>

	</div>
</body>
</html>
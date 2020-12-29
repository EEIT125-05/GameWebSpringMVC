<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ include file="../Link.jsp" %>
<%
request.setCharacterEncoding("UTF-8");
response.setContentType("text/html;charset=UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ForumCreate</title>
<style>
.error{
	color:red;
}
.ck-editor__editable_inline {
	/* 設定最低高度 */
    min-height: 500px;
}
</style>
<script src="<c:url value='/js/ForumCreate.js'/>"></script>
</head>
<body>
<%@ include file="../Header.jsp" %>

<c:set var="ForumConfirm" value="create" scope="session"/>
<h2>新增貼文資料</h2>

<form:form method="POST" modelAttribute="fForumBean">
	<div>
		<label>分類: </label>
		<form:select id="sCategory" path="sCategory">
			<form:option value="閒聊">閒聊</form:option>
			<form:option value="公告">公告</form:option>
			<form:option value="討論">討論</form:option>
			<form:option value="問題">問題</form:option>
			<form:option value="情報">情報</form:option>
			<form:option value="攻略">攻略</form:option>
		</form:select>
		<label>標題: </label>
		<form:input type="text" id="sTitle" path="sTitle" size="83"/>
		<br><label id="titleError" class="error"></label>
		<br><form:errors path="sTitle" class="error"/> 
	</div>
	<div>
		<label>內文: </label>
		<form:textarea id="sText" path="sText" name="sText" cols="100" rows="15" placeholder="請在這裡填寫內容"/>
		<br><label id="textError" class="error"></label>
		<br><form:errors path="sText" class="error"/> 
	</div>
	<div>
		<input type="submit" id="submit" name="sForumConfirm" value="${sForumConfirm}"/>
	</div>
</form:form>

<%@ include file="../Foot.jsp" %>

<script src="<c:url value='/ckeditor/ckeditor.js'/>"></script>
<script>CKEDITOR.replace("sText");</script>

</body>
</html>
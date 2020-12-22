<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../Link.jsp" %>
    <%
    request.setCharacterEncoding("UTF-8");
    response.setContentType("text/html;charset=UTF-8");
    response.setContentType("text/html;charset=UTF-8");
    response.setHeader("Pragma","no-cache");
    response.setDateHeader ("Expires", -1);
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>註冊資料確認</title>
</head>

<body>
<%@ include file="../Header.jsp" %>

<h2>註冊資料如下請確認</h2>
<form action="<c:url value='/member/MemberThanks'/>" method="post" modelAttribute="user">
	<div class="c">
		<h3>設定的帳號:<input name="sAccount" value='${param.sAccount}'/></h3>
			<h3>設定的密碼:<input name="sPassword" value='${param.sPassword}'/></h3>
			<h3>使用的暱稱:<input name="sNickname" value='${param.sNickname}'/></h3>
			<h3>使用的信箱:<input name="sEmail" value='${param.sEmail}'/></h3>
			<h3>真實姓名:<input name="sEname" value='${param.sEname}'/></h3>
			<h3>電話/手機號碼:<input name="sPhone" value='${param.sPhone}'/></h3>
			<h3>聯絡地址:<input name="sAddress" value='${param.sAddress}'/></h3>
			<h3>性別:<input name="sGender" value='${param.sGender}'/></h3>
			<h3>生日年月日:<input name="sBirthday" value='${param.sBirthday}'/></h3>
			<input type="hidden" name="registerDate" value='${param.registerDate}'><br>
			<button type="submit" name="confirm" value="確認" >確認</button>
	</div>
</form>

<%@ include file="../Foot.jsp" %>
</body>
</html>
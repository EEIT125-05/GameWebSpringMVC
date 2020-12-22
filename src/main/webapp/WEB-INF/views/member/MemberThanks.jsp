<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="false"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<%@ include file="../Link.jsp" %>

<%
	response.setContentType("text/html;charset=UTF-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>完成註冊</title>

</head>
<body>
<%@ include file="../Header.jsp" %>

			<h2>${user.sEname}(帳號:${user.sAccount})</h2><br>
			<h2>恭喜成功加入會員</h2><br>
			<a href="<c:url value='/member/Thanks'/>">回登入畫面</a>
	
<%@ include file="../Foot.jsp" %>	
</body>
</html>
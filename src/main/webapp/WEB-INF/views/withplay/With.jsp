<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
    href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
<title>With</title>
</head>
<body>
            <div  align="center" > 
                <h1>資料</h1>
	<table border="1" cellpadding="5"> 
	<tr>
	<th>帳號</th>
	<th>姓名</th>
	<th>暱稱</th>
	<th>ID</th>
	<th>性別</th>
	<th>遊戲</th>
	<th>照片</th>
	<th>自我介紹</th>
	<th>價格</th>
	<th>功能</th>
	</tr>
	<c:forEach items="${With}" var="With" varStatus="status">
	<tr>
		
		
		<td>${With.sAccount}</td>
		<td>${With.sName}</td>
		<td>${With.sNickname}</td>
		<td>${With.sIdcode}</td>
		<td>${With.sGender == 'F' ? "女" : "男" }</td>
		<td>${With.sGame}</td>
		<td><img width='200' height='200' src='${pageContext.request.contextPath}/withplay/picture/${With.sNickname}' /></td>
		<td>${With.sComment}</td>
		<td>${With.iPrice}</td>
		<td>
			<a href="${pageContext.request.contextPath}/withplay/edit/${With.sNickname}">Edit</a>
			&nbsp;&nbsp;
			<a href="delete?iId=${With.iId}">Delete</a>
		</td>
	</tr>
	</c:forEach>	
	</table>
            </div>
		<div  align="center"><a href="${pageContext.servletContext.contextPath}/withplay/Index">陪玩首頁</a></div>
</body>
</html>
    
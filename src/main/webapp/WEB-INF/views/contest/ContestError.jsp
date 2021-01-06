<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../Link.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>賽事 - GameBar</title>
</head>
<body>
<%@ include file="../Header.jsp" %>

<div class="container">

<h1 class="mt-4 mb-3">發生錯誤
<!--       <small>XXXXX</small> -->
    </h1>

    <ol class="breadcrumb">
      <li class="breadcrumb-item">
        <a href="<c:url value='/'/>">Home</a>
      </li>
      <li class="breadcrumb-item active">賽事</li>
    </ol>

<p>發生錯誤,請重新操作!</p>
<p>${errorMessage}</p>

<a class="btn btn-primary" href="<c:url value='/contest/Index'/>">回首頁</a>


</div>
<%@ include file="../Foot.jsp" %>
</body>
</html>
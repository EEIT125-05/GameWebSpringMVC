<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../Link.jsp" %>

<!DOCTYPE html>
<html>
<head>
<title>賽事 - GameBar</title>
</head>
<body>
<%@ include file="../Header.jsp" %>

<div class="container">

<h1 class="mt-4 mb-3">${sContestConfirm}成功
<!--       <small>XXXXX</small> -->
    </h1>

    <ol class="breadcrumb">
      <li class="breadcrumb-item">
        <a href="<c:url value='/'/>">Home</a>
      </li>
      <li class="breadcrumb-item active">賽事</li>
    </ol>

<p>比賽${sContestConfirm}完成</p>
<a class="btn btn-primary" href="<c:url value='/contest/Index'/>">回首頁</a>

</div>
<%@ include file="../Foot.jsp" %>
</body>
</html>
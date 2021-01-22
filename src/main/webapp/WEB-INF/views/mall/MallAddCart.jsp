<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
		<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
			<%@ include file="../Link.jsp" %>
				<sql:setDataSource var="ds" driver="com.microsoft.sqlserver.jdbc.SQLServerDriver"
					url="jdbc:sqlserver://localhost:1433;DatabaseName=GameSpringMVCDB" user="sa" password="sa123456" />

				<sql:query sql="select * from MalllistTable where no= '${todo}'" var="rs" dataSource="${ds}" />

				<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
				<html>

				<head>
					<link rel=stylesheet type="text/css" href="css/LeftMall.css">
					<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
					<title>商成</title>
					<style>
					</style>
				</head>

				<body>
					<%@ include file="../Header.jsp" %>

					<div class="container " >
							<form action="<c:url value="/mall/todo"/>" method="get">
							<c:forEach var="row" items="${rs.rows}">


								<h1 class="mt-4 mb-3">
									商城 <small>商品詳細資料</small>
								</h1>

								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a href="<c:url value='/'/>">Home</a>
									</li>
									<li class="breadcrumb-item active">商品簡介</li>
								</ol>
<div style="background-color:#ffffff">
								<div
									style=" 1100px;height: 500px; margin 0px 0px 20px 0px;">
									<div style=" width: 600px; height: 400px;float:left;">
										<img src="${pageContext.request.contextPath }/${row.origin}"
											style="width: 600px; height: 400px; " alt="路徑失聯" />
									</div>
									<div style=" width: 490px; height: 400px;float:right;">

										<p>商品名稱 : ${row.name}</p>
										<p>商品分類 : ${row.level}</p>
										<p>商品平台 : ${row.host}</p>
										<p>商品類型 : ${row.type}</p>
										<p>商品評分 : ${row.name}</p>
										<p>商品簡介 : ${row.item}</p>
										
										<p></p><input placeholder="請輸入需要購買數量" class="form-control"  type="text" name="qty" >
										<br><button class="btn btn-warning" type="submit" name="todo"
										value="${todo}">確認加入購物車</button>
									</p>
									<p><a class="btn btn-secondary" href="<c:url value='/mall/Addshop'/>">回到我的購物車</a>
									</p>


									</div>





</div>
					
							</c:forEach>
							</form>


						</div>
						<%@ include file="../Foot.jsp" %>
				</body>

				</html>

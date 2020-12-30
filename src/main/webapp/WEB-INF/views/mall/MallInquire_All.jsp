<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%@ include file="../Link.jsp" %>
<sql:setDataSource var="ds"
	driver="com.microsoft.sqlserver.jdbc.SQLServerDriver"
	url="jdbc:sqlserver://localhost:1433;DatabaseName=GameSpringMVCDB"
	user="sa" password="sa123456" />
<sql:query sql="select * from MalllistTable" var="rs" dataSource="${ds}" />

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 查詢所有商品 -->
<head>
  <link rel=stylesheet type="text/css" href="css/LeftMall.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Test Database Connection Pooling</title>
<style>
th {
	background-color: #9d8dea;
	color: white;
	border: 2px solid white;
}

td {
	background-color: rgb(251, 251, 147);
	border: 2px solid white;
}

table {
	border: 2px solid white;
}
</style>
</head>

<body>
	<%@ include file="../Header.jsp" %>

	<form action="<c:url value="/mall/update1"/>"  method="get">
		    <img src="images/目前所有商品.png" alt="">
		<table style="padding-left: 27px;">
			<tr>
				<th style="background-color: rgb(242, 189, 189);"><span
					style="color: black;">查詢：</span></th>
				<td><input type="text" name="search" id="search1"
					onblur=checkconsole() /> <input type="submit" id="submit"
					name="updateto" value="搜尋" disabled /> <a class="button"
					href="MallStrikeoutForm.jsp">刪除</a>
					<span id="search1span"></span>
				</div></td>
			</tr>
		</table>


		<table border="0.5">
			<th>商品編號</th>
			<th>商品名稱</th>
			<th>商品類型</th>
			<th>遊戲平台</th>
			<th>商品分類</th>
			<th>商品分級</th>
			<th>商品價錢</th>
			<th>付款方式</th>
			<th>交貨方式</th>
			<th>商品尺寸</th>
			<th>商品產地</th>
			<!-- 改成圖片 -->
			<th>商品貨號</th>
			<th>商品評價</th>




			<c:forEach var="row" items="${rs.rows}">
				<tr>
					<td>${row.no}</td>
					<td>${row.name}</td>
					<td>${row.type}</td>
					<td>${row.host}</td>
					<td>${row.number}</td>
					<td>${row.level}</td>
					<td>${row.money}</td>
					<td>${row.pay}</td>
					<td>${row.delivery}</td>
					<td>${row.size}</td>
					<td>${row.origin}</td>
					<td>${row.item}</td>
					<td>${row.contentment}</td>




				</tr>
			</c:forEach>
		</table>
		<script>
		
			let search1span = document.getElementById("search1span")
			let flag1 = false;
			function checkconsole() {//這
				flag1 = false
				if (search1.value == "") {
					search1span.innerHTML = "必填"
				
				} else if (search1.value == "請填欲修改之編號") {
					search1span.innerHTML = "必填"
				} else {
					search1span.innerHTML = ""
					flag1 = true;
				}
				checkall();

			}
			function checkall() {//這

				if (flag1) {
					document.getElementById("submit").disabled = false;
				} else {
					document.getElementById("submit").disabled = true;
				}
			}
		</script>
		</from>
		<%@ include file="../Foot.jsp" %>
</body>

</html>
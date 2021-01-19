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
table, th , td  {
  border: 1px solid grey;
  border-collapse: collapse;
  padding: 5px;
}
table tr:nth-child(odd) {
  background-color: #f1f1f1;
}
table tr:nth-child(even) {
  background-color: #ffffff;
}
mark.yellow {
	background: linear-gradient(transparent 40%,rgba(255,255,255,0) 40%, #FFF176 90%,transparent 95%);	
    padding: 2px 1px;
}
</style>


</head>

<body>
<%@ include file="../Header.jsp" %>
<div class="container">

<h1 class="mt-4 mb-3">商品
      <small>查詢</small>
    </h1>

    <ol class="breadcrumb">
      <li class="breadcrumb-item">
        <a href="<c:url value='/'/>">Home</a>
      </li>
      <li class="breadcrumb-item active">商品查詢</li>
    </ol>

	<form action="<c:url value="/mall/update1"/>"  method="get">
		  
		<table style="padding-left: 27px;">
			<tr>
				<th style="background-color: rgb(242, 189, 189);"><span
					style="color: black;">請輸入欲修改之編號：</span></th>
				<td><mark class="yellow"><input type="text" placeholder="No.?" name="search" id="search1"
					onblur=checkconsole() /></mark> <input class="btn btn-secondary" type="submit" id="submit"
					name="updateto" value="更改" disabled /> 
					<span id="search1span"></span>
				</div></td>
			</tr>
		</table>


		<table border="0.5">
			<th>No.</th>
			<th>名稱</th>
			<th>類型</th>
			<th>平台</th>
			<th>分類</th>
			<th>分級</th>
			<th>價錢</th>
			<th>付款方式</th>
			<th>交貨方式</th>
			<th>商品尺寸</th>
			<th>商品產地</th>
			<!-- 改成圖片 -->
			<th>商品簡介</th>
			<th>商品評價</th>




			<c:forEach var="row" items="${rs.rows}">
				<tr>
					<td><mark class="yellow">${row.no}</mark></td>
					<td>${row.name}</td>
					<td>${row.type}</td>
					<td>${row.host}</td>
					<td>${row.number}</td>
					<td>${row.level}</td>
					<td>${row.money}</td>
					<td>${row.pay}</td>
					<td>${row.delivery}</td>
					<td>${row.size}</td>
					<td><img 
					src="${pageContext.request.contextPath }/${row.origin}"
					style="width: 150; height: 220;" alt="" /></td>
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
		</div>
		<%@ include file="../Foot.jsp" %>
</body>

</html>
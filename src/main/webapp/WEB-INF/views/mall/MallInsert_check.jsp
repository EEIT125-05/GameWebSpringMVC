<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../Link.jsp" %>
<%
	response.setContentType("text/html;charset=UTF-8");
response.setHeader("Cache-Control", "no-cache"); // HTTP 1.1
response.setHeader("Pragma", "no-cache"); // HTTP 1.0
response.setDateHeader("Expires", -1); // Prevents caching at the proxy server
request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
	<link rel=stylesheet type="text/css" href="css/LeftMall.css">
<meta charset="UTF-8">
<title>Insert title here</title>
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


</style>
</head>
<body>
<%@ include file="../Header.jsp" %>
<div class="container">

<h1 class="mt-4 mb-3">商品
      <small>新增資料</small>
    </h1>

    <ol class="breadcrumb">
      <li class="breadcrumb-item">
        <a href="<c:url value='/'/>">Home</a>
      </li>
      <li class="breadcrumb-item active">商品新增確認</li>
    </ol>

<!-- 商品資料新增->確認中(按下去就新增)	 -->
	
	
	<form action="<c:url value="/mall/new_check"/>" method="get">
		<div class="main">
			<table cellspacing="2" cellpadding="1" border="1" width="100%">
				<tr bgcolor="#FFFFE1">
					<th style="font-family: Microsoft JhengHei;">商品編號:</th>
					<td>${reg_student.no}</td>
				</tr>
				<tr bgcolor="#FFFFE1">
					<th style="font-family: Microsoft JhengHei;">商品名稱:</th>
					<td>${reg_student.name}</td>
				</tr>
				<tr bgcolor="#FFFFE1">
					<th style="font-family: Microsoft JhengHei;">商品類型:</th>
					<td>${reg_student.type}</td>
				</tr>
				
				<tr bgcolor="#FFFFE1">
					<th style="font-family: Microsoft JhengHei;">遊戲平台:</th>
					<td>${reg_student.host}</td>
				</tr>
				<tr bgcolor="#FFFFE1">
					<th style="font-family: Microsoft JhengHei;">購買人次:</th>
					<td>${reg_student.number}</td>
				</tr>
				<tr bgcolor="#FFFFE1">
					<th style="font-family: Microsoft JhengHei;">商品分類:</th>
					<td>${reg_student.level}</td>
				</tr>
				<tr bgcolor="#FFFFE1">
					<th style="font-family: Microsoft JhengHei;">商品價錢:</th>
					<td>${reg_student.money}</td>
				</tr>

				<tr bgcolor="#FFFFE1">
					<th style="font-family: Microsoft JhengHei;">付款方式:</th>
					<td>${reg_student.pay}</td>
				</tr>
				<tr bgcolor="#FFFFE1">
					<th style="font-family: Microsoft JhengHei;">交貨方式:</th>
					<td>${reg_student.deilvery}</td>
				</tr>
				<tr bgcolor="#FFFFE1">
					<th style="font-family: Microsoft JhengHei;">商品尺寸:</th>
					<td>${reg_student.size}</td>
				</tr>
				<tr bgcolor="#FFFFE1">
					<th style="font-family: Microsoft JhengHei;">商品產地:</th>
					<td>${reg_student.origin}</td>
				</tr>
				<tr bgcolor="#FFFFE1">
					<th style="font-family: Microsoft JhengHei;">商品貨號:</th>
					<td>${reg_student.item}</td>
				</tr>
				<tr bgcolor="#FFFFE1">
					<th style="font-family: Microsoft JhengHei;">消費者滿意度:</t>
					<td>${reg_student.contentment}</td>
				</tr>
			</table><br>
			<center><button class="btn btn-danger" type="submit" name="confirm" value="確認">確認</button></center> 
		</div>
			
	</form>
	</div>
	<%@ include file="../Foot.jsp" %>
</body>
</html>
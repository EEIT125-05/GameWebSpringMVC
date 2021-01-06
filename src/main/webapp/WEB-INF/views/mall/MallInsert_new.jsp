<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../Link.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	response.setContentType("text/html;charset=UTF-8");
response.setHeader("Cache-Control", "no-cache");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", -1);
%>
<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel=stylesheet type="text/css" href="css/LeftMall.css">
<title>商品資料註冊</title>

</head>

<body>
	<%@ include file="../Header.jsp"%>
	<div class="container">

		<h1 class="mt-4 mb-3">
			商品 <small>新增資料</small>
		</h1>

		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="<c:url value='/'/>">Home</a>
			</li>
			<li class="breadcrumb-item active">商品新增</li>
		</ol>


		<form action="<c:url value="/mall/new"/>" method="get" class="dark-matter">
			<div>
				<table>

					<tr>
						<th style="font-family: Microsoft JhengHei;">商品名稱:</th>
						<td><input type="text" name="name" size="10" maxlength="10"></td>
					</tr>
					<tr>
						<th style="font-family: Microsoft JhengHei;">商品類型:</th>
						<td><input type="text" name="type" size="10" maxlength="10">
						</td>
					</tr>

					<tr>
						<th style="font-family: Microsoft JhengHei;">遊戲平台:</th>
						<td><input type="text" name="host" maxlength="10"></td>
					</tr>
					<tr>
						<th style="font-family: Microsoft JhengHei;">購買人次:</th>
						<td><input type="text" name="number" maxlength="10"></td>
					</tr>
					<tr>
						<th style="font-family: Microsoft JhengHei;">商品分類:</th>
						<td><input type="text" name="level" size="10" maxlength="10"></td>
					</tr>
					<tr>
						<th style="font-family: Microsoft JhengHei;">商品價錢:</th>
						<td><input type="text" name="money"></td>
					</tr>
					<tr>
						<th style="font-family: Microsoft JhengHei;">付款方式:</th>
						<td><input type="text" name="pay" maxlength="10"></td>
					</tr>
					<tr>
						<th style="font-family: Microsoft JhengHei;">交貨方式:</th>
						<td><input type="text" name="deilvery" maxlength="10"></td>
					</tr>
					<tr>
						<th style="font-family: Microsoft JhengHei;">商品尺寸:</th>
						<td><input type="text" name="size" maxlength="10"></td>
					</tr>
					<tr>
						<th style="font-family: Microsoft JhengHei;">商品圖片:</th>
						<td><input type="text" name="origin" maxlength="max"></td>
					</tr>
					<tr>
						<th style="font-family: Microsoft JhengHei;">商品簡介:</th>
						<td><input type="text" name="item" maxlength="10"></td>
					</tr>
					<tr>
						<th style="font-family: Microsoft JhengHei;">消費者滿意度:</th>
						<td><input type="text" name="contentment" maxlength="10"></td>
					</tr>

				</table>
			</div>
			<br>
			<center>

				<a class="InquireDelete" href="MallInquire.jsp">查詢</a>
				<Button class="SendOut" type="submit" name="submit" value="送出">送出</Button>
			</center>
	</div>

	</form>
	</div>
	</div>

	<%@ include file="../Foot.jsp"%>
</body>

</html>
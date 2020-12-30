<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../Link.jsp" %>
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
	<style>
		table {
			width: 80%;
			border-collapse: collapse;
			margin: auto;
		}

		table tr {
			border-bottom: solid 2px white;
		}

		table tr:last-child {
			border-bottom: none;
		}

		table th {
			position: relative;
			width: 30%;
			background-color: #7d7d7d;
			color: white;
			text-align: center;
			padding: 10px 0;
		}

		table th:after {
			display: block;
			content: "";
			width: 0px;
			height: 0px;
			position: absolute;
			top: calc(50% - 10px);
			right: -10px;
			border-left: 10px solid #7d7d7d;
			border-top: 10px solid transparent;
			border-bottom: 10px solid transparent;
		}

		table td {
			text-align: left;
			width: 70%;
			text-align: center;
			background-color: #eee;
			padding: 10px 0;
		}

		.main {
			margin: 20px auto;
			item-align: center;
			width: 80%;
		}

		

		.InquireDelete {
    display: inline-block;
    text-align: center;
    vertical-align: middle;
    padding: 5px 13px;
    border: 0px solid #b3b3b3;
    border-radius: 6px;
    background: #ffffff;
    background: -webkit-gradient(linear, left top, left bottom, from(#ffffff), to(#b3b3b3));
    background: -moz-linear-gradient(top, #ffffff, #b3b3b3);
    background: linear-gradient(to bottom, #ffffff, #b3b3b3);
    text-shadow: #ffffff 1px -1px 1px;
    font: normal normal bold 18px tahoma;
    color: #111111;
    text-decoration: none;
}
.InquireDelete:hover,
.InquireDelete:focus {
    border: 0px solid #ffffff;
    background: #ffffff;
    background: -webkit-gradient(linear, left top, left bottom, from(#ffffff), to(#d7d7d7));
    background: -moz-linear-gradient(top, #ffffff, #d7d7d7);
    background: linear-gradient(to bottom, #ffffff, #d7d7d7);
    color: #111111;
    text-decoration: none;
}
.InquireDelete:active {
    background: #b3b3b3;
    background: -webkit-gradient(linear, left top, left bottom, from(#b3b3b3), to(#b3b3b3));
    background: -moz-linear-gradient(top, #b3b3b3, #b3b3b3);
    background: linear-gradient(to bottom, #b3b3b3, #b3b3b3);
}
.InquireDelete:before{
    content:  "\0000a0";
    display: inline-block;
    height: 24px;
    width: 24px;
    line-height: 24px;
    margin: 0 4px -6px -4px;
    position: relative;
    top: 0px;
    left: 0px;
    background: url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAACXBIWXMAAA7EAAAOxAGVKw4bAAABKElEQVRIie3UPUoEQRAF4G+HiY1cI3M9gaCIgokXMBF/7qDgGQwEPYSKx1gxWDyBGGygYKRiYCyDwfZI7c+sziiY7IOmX1dX1+t5UzMtZH6PfSyMiXfyRIoKoRifxN/xEs4tYwtaKbEIm3HdhK/gCrfo5ZhNoyme0hPAKi6xjSW0cxxgF88NBY5wnYqfYwfdJKB8B2c4Negr9Wy5TMVvonpuEMWE9fBeiWhLN8Qf8AbHOEw3qTvW8JjmDBuYiTmxNYtwy5/w0pY9fVsKnGA+5g9bNGxFFV/Ub8VhW0YQBep80T1s4r7ibLnOokCdzvnA3Zh4rJWhqPo9NOUjdZpa9B2yEaJ+F1VxMT61aGpRI85/WLRekVQXc2n+uniOTuLtPxC4wKvwL/oEeBmOVSx9CxwAAAAASUVORK5CYII=") no-repeat left center transparent;
    background-size: 100% 100%;
}


		.SendOut {
			display: inline-block;
			text-align: center;
			vertical-align: middle;
			padding: 5px 13px;
			border: 0px solid #b3b3b3;
			border-radius: 6px;
			background: #ffffff;
			background: -webkit-gradient(linear, left top, left bottom, from(#ffffff), to(#b3b3b3));
			background: -moz-linear-gradient(top, #ffffff, #b3b3b3);
			background: linear-gradient(to bottom, #ffffff, #b3b3b3);
			text-shadow: #ffffff 1px -1px 1px;
			font: normal normal bold 18px tahoma;
			color: #111111;
			text-decoration: none;
		}

		.SendOut:hover,
		.SendOut:focus {
			border: 0px solid #ffffff;
			background: #ffffff;
			background: -webkit-gradient(linear, left top, left bottom, from(#ffffff), to(#d7d7d7));
			background: -moz-linear-gradient(top, #ffffff, #d7d7d7);
			background: linear-gradient(to bottom, #ffffff, #d7d7d7);
			color: #111111;
			text-decoration: none;
		}

		.SendOut:active {
			background: #b3b3b3;
			background: -webkit-gradient(linear, left top, left bottom, from(#b3b3b3), to(#b3b3b3));
			background: -moz-linear-gradient(top, #b3b3b3, #b3b3b3);
			background: linear-gradient(to bottom, #b3b3b3, #b3b3b3);
		}

		.SendOut:before {
			content: "\0000a0";
			display: inline-block;
			height: 24px;
			width: 24px;
			line-height: 24px;
			margin: 0 4px -6px -4px;
			position: relative;
			top: 0px;
			left: 0px;
			background: url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAACXBIWXMAAA7EAAAOxAGVKw4bAAABKElEQVRIie3UPUoEQRAF4G+HiY1cI3M9gaCIgokXMBF/7qDgGQwEPYSKx1gxWDyBGGygYKRiYCyDwfZI7c+sziiY7IOmX1dX1+t5UzMtZH6PfSyMiXfyRIoKoRifxN/xEs4tYwtaKbEIm3HdhK/gCrfo5ZhNoyme0hPAKi6xjSW0cxxgF88NBY5wnYqfYwfdJKB8B2c4Negr9Wy5TMVvonpuEMWE9fBeiWhLN8Qf8AbHOEw3qTvW8JjmDBuYiTmxNYtwy5/w0pY9fVsKnGA+5g9bNGxFFV/Ub8VhW0YQBep80T1s4r7ibLnOokCdzvnA3Zh4rJWhqPo9NOUjdZpa9B2yEaJ+F1VxMT61aGpRI85/WLRekVQXc2n+uniOTuLtPxC4wKvwL/oEeBmOVSx9CxwAAAAASUVORK5CYII=") no-repeat left center transparent;
			background-size: 100% 100%;
		}
	</style>
</head>

<body>
	<%@ include file="../Header.jsp" %>

	
	
	<img src="images/商品資料登錄.png" alt="">
	<form action="<c:url value="/mall/new"/>" method="get">
		<div>
			<table>
				<tr>
					<th style="font-family: Microsoft JhengHei;">商品編號:</th>
					<td><input type="text" name="no" maxlength="10"></td>
				</tr>
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
					<td><input type="text" name="level" maxlength="10"></td>
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
					<th style="font-family: Microsoft JhengHei;">商品貨號:</th>
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
		</center></div>
		
	</form>
	<%@ include file="../Foot.jsp" %>
</body>

</html>
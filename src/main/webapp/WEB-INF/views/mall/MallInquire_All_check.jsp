<%@page import="java.beans.Beans"%>
<%@ page import="com.web.game.mall.model.MallBean" language="java"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../Link.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	response.setContentType("text/html;charset=UTF-8");
response.setHeader("Cache-Control", "no-cache"); // HTTP 1.1
response.setHeader("Pragma", "no-cache"); // HTTP 1.0
response.setDateHeader("Expires", -1); // Prevents caching at the proxy server
%>

<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<link rel=stylesheet type="text/css" href="css/LeftMall.css">
	<title>新增輸入</title>
</head>

<body>
<%@ include file="../Header.jsp" %>
<div class="container">

<h1 class="mt-4 mb-3">商品
      <small>更改</small>
    </h1>

    <ol class="breadcrumb">
      <li class="breadcrumb-item">
        <a href="<c:url value='/'/>">Home</a>
      </li>
      <li class="breadcrumb-item active">商品更改</li>
    </ol>

	
	
		<div>
			<form action="<c:url value="/mall/update2"/>" method="get">
				商品編號:<input type="text" name="no" value="${good.no}"><br />
				商品名稱:<input type="text" name="name" value="${good.name}"><br />
				商品類型:<input type="text" name="type" value="${good.type}"><br />
				遊戲平台:<input type="text" name="host" value="${good.host}"><br />
				購買人次:<input type="text" name="number" value="${good.number}"><br />
				商品分級:<input type="text" name="level" value="${good.level}"><br />
				商品價錢:<input type="text" name="money" value="${good.money}"><br />
				付款方式:<input type="text" name="pay" value="${good.pay}"><br />
				交貨方式:<input type="text" name="deilvery" value="${good.deilvery}"><br />
				商品尺寸:<input type="text" name="size" value="${good.size}"><br />
				商品圖片:<input type="text" name="origin" value="${good.origin}"><br /><!-- 圖片 -->
				商品簡介:<input type="text" name="item" value="${good.item}"><br />
				商品分數:<input type="text" name="contentment" value="${good.contentment}"><br />
		
	
	
		<input type="submit" name="callreturn" value="送出" />
	</div>
	</form>
	</div>
<%@ include file="../Foot.jsp" %>
</body>
</html>
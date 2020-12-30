<%@page import="com.web.game.mall.shop.CartItem"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*, com.web.game.mall.*"%>
<%@ include file="../Link.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel=stylesheet type="text/css" href="css/LeftMall.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>E-BookShop Checkout</title>
</head>
<body>
	<%@ include file="../Header.jsp"%>




	<img src="images/你已訂購以下遊戲.png" alt="">
	<table border="1" cellspacing="0" cellpadding="5"
		style="border: 2px solid white; background-color: #B9B9FF;">
		<tr>
			<th style="background-color: #B9B9FF;">遊戲名稱</th>
			<th style="background-color: #B9B9FF;">價錢</th>
			<th style="background-color: #B9B9FF;">數量</th>
		</tr>
		<%
			// Scriptlet 1: Display the items in shopping cart
		List<CartItem> theCart = (List<CartItem>) session.getAttribute("cart");
		for (CartItem item : theCart) {
		%>
		<tr>
			<td style="background-color: #feeabb;"><%=item.getName()%></td>
			<td style="background-color: #feeabb;" align="right">$<%=item.getPrice()%></td>
			<td style="background-color: #feeabb;" align="right"><%=item.getQtyOrdered()%></td>
		</tr>
		<%
			} // for
		%>
		<tr>
			<th style="background-color: #feeabb;" align="right" colspan="2">Total</th>
			<th style="background-color: #feeabb;" align="right">$<%=request.getAttribute("totalPrice")%></th>
			<th style="background-color: #feeabb;" align="right"><%=request.getAttribute("totalQtyOrdered")%></th>
		</tr>
	</table>
	<br />
	<%
		request.getSession(true).removeAttribute("cart");
	%>
	<form action="<c:url value="/mall/gotoshop"/>" method="get">
		<button type="submit" name="" value="">返回</button>
	</form>
	<%@ include file="../Foot.jsp"%>
</body>
</html>
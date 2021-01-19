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
<style>
mark.yellow {
	background: linear-gradient(transparent 40%,rgba(255,255,255,0) 40%, #FFF176 90%,transparent 95%);	
    padding: 2px 1px;
}

</style>
</head>
<body>
	<%@ include file="../Header.jsp"%>
<div class="container">

		<h1 class="mt-4 mb-3">
			商城 <small>結算總額</small>
		</h1>

		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="<c:url value='/'/>">Home</a>
			</li>
			<li class="breadcrumb-item active">購物總額</li>
		</ol>



	
	<table border="1" cellspacing="0" cellpadding="5"
		>
		<tr>
			<th>遊戲名稱</th>
			<th>價錢</th>
			<th>數量</th>
			
			
		</tr>
		<%
			// Scriptlet 1: Display the items in shopping cart
		List<CartItem> theCart = (List<CartItem>) session.getAttribute("cart");
		for (CartItem item : theCart) {
		%>
		<tr>
			<td ><%=item.getName()%></td>
			<td align="right">$<%=item.getPrice()%></td>
			<td align="right"><%=item.getQtyOrdered()%></td>
			
			
			
		</tr>
		<%
			} // for
		%>
		<tr> 
 			<th align="right" colspan="2">總額</th>
 			<th  align="right"><mark class="yellow">$<%=request.getAttribute("totalPrice")%></mark></th> 
			
			
		</tr> 
	</table>
	<br />
	<%
		request.getSession(true).removeAttribute("cart");
	%>
	<form action="<c:url value="/mall/gotoshop"/>" method="get">
		<button class="btn btn-warning" type="submit" name="" value="">返回商城</button>
	</form>
	<%@ include file="../Foot.jsp"%>
</body>
</html>
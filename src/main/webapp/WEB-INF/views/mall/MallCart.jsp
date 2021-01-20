<%@page import="com.web.game.mall.shop.CartItem"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*, com.web.game.mall.*"%>
<%@ include file="../Link.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel=stylesheet type="text/css" href="css/LeftMall.css">
<style>

.qty {
  width: 40px;
  height: 35px;
  text-align: center;
  border: 0;
  border-top: 1px solid #aaa;
  border-bottom: 1px solid #aaa;
}


input.qtyplus {
  width: 25px;
  height: 35px;
  border: 1px solid #aaa;
  background: #f8f8f8;
}

input.qtyminus {
  width: 25px;
  height: 35px;
  border: 1px solid #aaa;
  background: #f8f8f8;
}


input.qtyplus {
  width: 25px;
  height: 35px;
  border: 1px solid #aaa;
  background: #f8f8f8;
}

input.qtyminus {
  width: 25px;
  height: 35px;
  border: 1px solid #aaa;
  background: #f8f8f8;
}
</style>
</head>
<body>
	<%@ include file="../Header.jsp"%>
<div class="container">

		<h1 class="mt-4 mb-3">
			商城 <small>我的購物車</small>
		</h1>

		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="<c:url value='/'/>">Home</a>
			</li>
			<li class="breadcrumb-item active">購物車</li>
		</ol>
	<%
		// Scriptlet 2: Check whether the shopping cart is empty.
	List<CartItem> theCart = (List<CartItem>) session.getAttribute("cart");
	if (theCart != null && theCart.size() > 0) {
	%>
	
	<table border="1" cellspacing="0" cellpadding="5">
		<tr>
			<th>商品名稱</th>
			<th>價錢</th>
			<th>數量</th>
			<th>合計</th>
			<th>&nbsp;</th>
		</tr>
		<%
			float totprice = 0;
		for (int i = 0; i < theCart.size(); ++i) {
			CartItem aCartItem = theCart.get(i);
		%>

		<tr>
			<form name="removeForm" action="<c:url value="/mall/todocart"/>"
				method="get">
				<input type="hidden" name="todocart" value="remove"> <input
					type="hidden" name="cartIndex" value="<%=i%>">
				<td><%=aCartItem.getName()%></td>
				<td align="right">$<%=aCartItem.getPrice()%></td>
				<td align="right">
				<label
					for=""></label><input type='button' value='-' class='qtyminus'
					field='quantity' />
				<!--
    -->
					<input type='text' name='quantity' value='<%=aCartItem.getQtyOrdered()%> ' class='qty' />
				<!--
-->
					<input type='button' value='+' class='qtyplus' field='quantity' />







				</td>
				<td align="right"><%=aCartItem.getPrice() * aCartItem.getQtyOrdered()%></td>
				<td><input type="submit" value="刪除"></td>
			</form>
		</tr>
		<%
			totprice = totprice + (aCartItem.getPrice() * aCartItem.getQtyOrdered());
		}
		%>
		<tr>
			<td></td>
			<td></td>
			<td></td>
			<td><%=totprice%></td>
			<td></td>
		</tr>
	</table>
	<br />

<%-- 	<form action="<c:url value="/mall/Shopping"/>" --%>
<!-- 				method="get"> -->
				<a href="<c:url value="/mall/Shopping?todocart=checkout"/>">結帳</a>
<!-- 		<button class="Checkout" type="submit" name="todocart" value="checkout">結帳</button> -->
				<a href="<c:url value="/mall/gotoshoppingnew"/>">繼續購物</a>

<!-- 		<button class="Continue" type="submit" name="todocart" value="gohome">繼續購物</button> -->
<!-- 	</form> -->

	<%
		} else { //if
	%>

	<a href="<c:url value="/mall/gotoshoppingnew"/>" class="btn btn-warning">返回商城</a>
	<script>
	$(function() {
		  // This button will increment the value
		  $('.qtyplus').click(function(e) {
		    // Stop acting like a button
		    e.preventDefault();
		    // Get the field name
		    fieldName = $(this).attr('field');
		    // Get its current value
		    var currentVal = parseInt($('input[name=' + fieldName + ']').val());
		    // If is not undefined
		    if (!isNaN(currentVal)) {
		      // Increment
		      $('input[name=' + fieldName + ']').val(currentVal + 1);
		    } else {
		      // Otherwise put a 0 there
		      $('input[name=' + fieldName + ']').val(0);
		    }
		  });
		  // This button will decrement the value till 0
		  $(".qtyminus").click(function(e) {
		    // Stop acting like a button
		    e.preventDefault();
		    // Get the field name
		    fieldName = $(this).attr('field');
		    // Get its current value
		    var currentVal = parseInt($('input[name=' + fieldName + ']').val());
		    // If it isn't undefined or its greater than 0
		    if (!isNaN(currentVal) && currentVal > 0) {
		      // Decrement one
		      $('input[name=' + fieldName + ']').val(currentVal - 1);
		    } else {
		      // Otherwise put a 0 there
		      $('input[name=' + fieldName + ']').val(0);
		    }
		  });
		});</script>
	<%
		}
	%></div>
	<%@ include file="../Foot.jsp"%>
	
	
</body>
</html>
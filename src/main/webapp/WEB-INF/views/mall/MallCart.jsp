<%@page import="com.web.game.mall.shop.CartItem"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.web.game.mall.*"%>
<%@ include file="../Link.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel=stylesheet type="text/css" href="css/LeftMall.css">
<style>
   .DeleteCart {
    display: inline-block;
    text-align: center;
    vertical-align: middle;
    padding: 5px 13px;
    border: 0px solid #a8900a;
    border-radius: 6px;
    background: #ffed10;
    background: -webkit-gradient(linear, left top, left bottom, from(#ffed10), to(#a8900a));
    background: -moz-linear-gradient(top, #ffed10, #a8900a);
    background: linear-gradient(to bottom, #ffed10, #a8900a);
    text-shadow: #786707 1px -1px 1px;
    font: normal normal bold 18px tahoma;
    color: #ffffff;
    text-decoration: none;
}
.DeleteCart:hover,
.DeleteCart:focus {
    border: 0px solid #f0ce0e;
    background: #ffff13;
    background: -webkit-gradient(linear, left top, left bottom, from(#ffff13), to(#caad0c));
    background: -moz-linear-gradient(top, #ffff13, #caad0c);
    background: linear-gradient(to bottom, #ffff13, #caad0c);
    color: #ffffff;
    text-decoration: none;
}
.DeleteCart:active {
    background: #a8900a;
    background: -webkit-gradient(linear, left top, left bottom, from(#a8900a), to(#a8900a));
    background: -moz-linear-gradient(top, #a8900a, #a8900a);
    background: linear-gradient(to bottom, #a8900a, #a8900a);
}
.DeleteCart:before{
    content:  "\0000a0";
    display: inline-block;
    height: 24px;
    width: 24px;
    line-height: 24px;
    margin: 0 4px -6px -4px;
    position: relative;
    top: 0px;
    left: 0px;
    background: url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAACXBIWXMAAA7EAAAOxAGVKw4bAAAEPUlEQVRIiW2WTWhcVRTHf+fORzKTmXxALGhBJdSFXVjEnRRdVLuotRSM1UW2ujAgFmygS1dF9924UAttwSC1QheCBLotUiqFBAolFmtNm+ZjMt+ZzDt/F+/Nm8nHhce97757/ufjnvM/z4DAAaP65UnMukfMmZb8BPKjSIfkDtIq8iXcF5DPm2y5/MOfB8FgiQIfVFQ7//6UiUvIz+LKIkdyTMI9niUHObi6kt/E/eLYT/ceDuA4EAYV8PzCmVCIOjPILyOVcEfdDkRRYo5BCPEMEEWo2yH2yuu4ZhuRX33p6v2ewZ5avfr1mVDwnTmMK0BJO9t4o4o6beQRQihxGQxCBssPE0ZGCbkhDCsBV0qBuZWZN1KjewpC0aIZM7uEQM0aatbiECSgloL3Yxs7FQjFMlYs9/YuFU0zCXYcosaF01Oge5JKqm2idjMJRUhnCwElc2/fBvYJAbWbqLaJpLrcj41fW1y21tyHweFn5NPeauBb6zFoApR95XVy732amGxJ/A0MWrd/JfP0774hIaCtdbzVQPJfJD7JutkRk85KwmubfdfHJrHxF8gcO07u7Q8OTMFnj/9hMhNQfQvVK7FceQJvN0GcNflUAKYFWW830mwRoHyB9jsfkz/zOZLifWnX+vBHn7H21imedGIZADIZbLiIQRY4FzA7gYFazRQcQM8fU1z+K167x8DJIylOTaD14B4vtjd2yYbCSE/diQAcNYE62/syRusrmBn/LvyGWg02Htyn9nCRbrPOk9u3MDO08WxfllluqKfsaAAOCYGiNLZKHt94iiQyuRzebiCPMEXsNBvk8jkkR5Xnu6yPXchgsbrJfTw0eFDVDei0yZZG6dar6X6nvkWuNEa0vU2oV/ph3QtGXAyrhoFl9oWI7RaqV8iVJ9ipVfoKqhWGRsfZrm6Sizr7CzGpfGAtgJYEWH7oQE+0vkJ+dJxOdbOvoFYhVx6nufofhWxIQ5rK7mz3lksBsYCBFYop8KDLvrZCvjxGJw2RETVqZEbKtFZXGMr2o9yT81aj97KQBc2b+CYMj2Q9U8GS9EuF1lfIjZQ5dPwUZLMYUHj5NTLDw3TWVsiFsIujiKKYaowuYj4bgpY9spuYTYfyBNpaT60xYOfO76wNT9Dp8WJC1XKnfuePOJ1T38Brm0m9cCMoLMdkN3d6Cu0mOw2Q3CDphQNIj/1kV5X7m+PXFpcDwMh3tx5KzBpgpbFeqfcLhz1ZssdqA9RuoPpW7/Ps+LXFR8Tq4zFSLFwVumgQc3uxnH7em+eDyuSO9/pHfOZivZC/3rvvXS1TX7wbGsOFGaTLyPst06PkUgZapojzvd8yq7hm60OZ64e/v5tmyoFNv/7VyVdB3w42/fjiPAGL1/G7upLfSJr+I/aMXR4kIwBeO38yEEVTyM8hxb8trsn4b0JryJeQL+Cax3159Me7vgcrAP4/6GKD+tpuUpsAAAAASUVORK5CYII=") no-repeat left center transparent;
    background-size: 100% 100%;
}
.Checkout {
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
.Checkout:hover,
.Checkout:focus {
    border: 0px solid #ffffff;
    background: #ffffff;
    background: -webkit-gradient(linear, left top, left bottom, from(#ffffff), to(#d7d7d7));
    background: -moz-linear-gradient(top, #ffffff, #d7d7d7);
    background: linear-gradient(to bottom, #ffffff, #d7d7d7);
    color: #111111;
    text-decoration: none;
}
.Checkout:active {
    background: #b3b3b3;
    background: -webkit-gradient(linear, left top, left bottom, from(#b3b3b3), to(#b3b3b3));
    background: -moz-linear-gradient(top, #b3b3b3, #b3b3b3);
    background: linear-gradient(to bottom, #b3b3b3, #b3b3b3);
}
.Checkout:before{
    content:  "\0000a0";
    display: inline-block;
    height: 24px;
    width: 24px;
    line-height: 24px;
    margin: 0 4px -6px -4px;
    position: relative;
    top: 0px;
    left: 0px;
    background: url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAACXBIWXMAAA7EAAAOxAGVKw4bAAAE+klEQVRIia2VXYxdVRXHf3uffc49H/djZjrcacMQptMWUEAN0QcLUVFI0DcSIZqGRCHRaIi+8eqbiR/woqjxQY3xxbQx0USMxGBNEGpRg9opzUQoXIbCfDD3zv0495x99ocPnal3hiv64EpO9lrJWeu/13/9994CkPwP9oP7lz+dRPLOeqp67XbrBVuOr0TKXTz57Qv63fLU7uqmAZ177HbpnG+Pcjccl+6rUnLSedjZ3iGOJCqQZ4G7J3LdQV9N1HO7q9zz17eqLwzG9slQiiJUQsU1SS0UOOcBKEt3fvL/af4kwDtsc6d6pay8VIFI67HEGkfgHXGm8EgkPHj2K7e+FIbiZ3c+fsFMFL+24T2Ag/RIAOv8cx76QLOsPIUxhIGgEp5QOaJQLOWF/XGWykXg69M2Kaa0tY+uJz619Gtj/X1ZLcAZS5IoAimQAlQgcA7SWPbmmurI3d9Z0f+NIncwLrQ77Tz3FcZQCwRm7AiV+HsgMQLmAFk5f6aRBQp4h6L2OviP9rWP3cDh9sx6HKp5GUiMda4elg/N18WvPvHdlfzdcqdRxGR85tSxW4w2XxL12S87FSmtDQtzIUeXZtGF3soH+Y/62/1v3fu9i1sHc/f8aQCcPnVizmj9jUYWPVxPI9mYjTHW0jyyyBuXXuHo7TfgjAcP47zY6m72v/jRJ178xTSAYLeLa9+Zh04cixRnWzONeyKJSBoZthgQRorkukWk7jHqDmgdbmCKEqVkmtWjBx64bWb4k+fXz03UAhB7AA7wPz91UxII90w6e+jmarBDMtfGjHpIb+hpeHFL8OZWn0ZQUW9EqFBgygopvUiz8N77b26t/PT8xgrg9+ruG3BVmc+FSfJeax0yTkFK9LhkO7c8d3lIogKSepPfr/bZeXuIsxYhBcYGhGkmZ+frT/7y87fM7Jbbd9C4cObB2MjmI+333IHAI1wLa3I6vznN63+5xOFGSFMZGllG48YmurSMRxUyCPEqw8qM9FDajjfzzwA/nFTMVTgXfbA+l97h3BCEoHvlHMassfCR99OqBXS2S15dW2fY3+FwKyIQgrIwlKXFEeKCDFGbpZZln5wY9LWDJrvdkZo58QGSbJnt1WeZP34X1bBH9/IfSALBh5dbjK4/Rnb0KPVGSKJi8s5LjNfWoOaQPsBbC0LeNo2iaLtfRkve4azBFmOs1ljrEEJQlJbrP3Qjix8/STp3nO7qn4mvWyY9vsD6M0+jN0vIBzhjKIZ5fZIZtRuoPNfKO4MphiAkThdYXRCEIaubGpV7lqNFxhtvEYQpwlUM1i7hlKIq+1i7QzkYkg/y7QndXFORC6RACImqZYAnqCUEYYz30E5TlJBI1aAa9TD5gLh1E5W2mMoyfLvLzpW3GHW3GeblswcpcoBpZjXtAe8tzhT4q0cDjyeUjpk4uBo7jbPVrtTBVIZx/+qVNNZ22C/845MC2puBac/XtatKrO7jTAneYqsxeDA+wHswxRCrR3hX4a3G2wprPbqyjLXfGmj/2Uef6lyaAPg3RUVv468ySJ6OmkecSmZQ8QwyzLh8fpW8tHT+8RqmUkT1NqpWJ6ovkPeGrrPyRmdjYL+5Mfa3PvpU53eT/MP+21Q+//17SBrZoq30cpCk7uW/vbl28U+vN631sZKkcRbK9921xKGFmF4PffGP/+yMB9XaY7999eA7ss+mPpf/L/9fXDJtrIBuoBEAAAAASUVORK5CYII=") no-repeat left center transparent;
    background-size: 100% 100%;
}
.Continue {
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
.Continue:hover,
.Continue:focus {
    border: 0px solid #ffffff;
    background: #ffffff;
    background: -webkit-gradient(linear, left top, left bottom, from(#ffffff), to(#d7d7d7));
    background: -moz-linear-gradient(top, #ffffff, #d7d7d7);
    background: linear-gradient(to bottom, #ffffff, #d7d7d7);
    color: #111111;
    text-decoration: none;
}
.Continue:active {
    background: #b3b3b3;
    background: -webkit-gradient(linear, left top, left bottom, from(#b3b3b3), to(#b3b3b3));
    background: -moz-linear-gradient(top, #b3b3b3, #b3b3b3);
    background: linear-gradient(to bottom, #b3b3b3, #b3b3b3);
}
.Continue:before{
    content:  "\0000a0";
    display: inline-block;
    height: 24px;
    width: 24px;
    line-height: 24px;
    margin: 0 4px -6px -4px;
    position: relative;
    top: 0px;
    left: 0px;
    background: url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAACXBIWXMAAA7EAAAOxAGVKw4bAAAEVklEQVRIiX2Uz48lUxTHP+dU9ZvXb17PjDc9Pd3BRpP2IyQWxEJCYoG/wMYKCxGxt7D1DyB+LITEFgsRhIUNIYyJ6BGGGMQwP7T+9fpV1b11z7Goeq9rzJibVO59lXrf7zmfc84VQOmstZvXWFlZyRcOHe7XdT0yYynGuBRCXIwhLlZlOFaneuTuPeDNU+snP+UqKwd46bWX7x0cnH/wn42tpb29YmkyKUdFUR4qiqpXlkGrKua3PPDQoW8//qQsx9u5OaqiOlwYhmefe/70o488/GerZ52ADdAcIM8PPDLXm3/qQD9izIH2QQtcCowSl4rFG+7ivsfu58t3XmXz7PeIZqzeuPbE6OjSQy++8tbq008+Glpxaw0UsBwghNCznWSbm5taloGirCiLiirU1Ab5YMDPJxPZ3BzX3/4Mkr3HxTPvE2PArB7+8/f5btR0zzlAWZb9w9et6bU33YL0BvjcEM+GaD7E6ROrnBMf/cJ48wdSLEFXOHj8YXZ3f6Qsyrw/P9D/1vKSGuzsjHtHVu4gu2aFaiKUYydsQyyFOjh1gFjVWIqkFLG6Ymvjd/Lyby5cvKgh2hTNlRHtjfd633xwkq3d7yh2tinGW4Rilxj3qMMeqS5Yu+tx+sNj1NUuZ9bfZvuvz1i5/U6SeT7Xm79i9PsZ7I7z4vy7bFzcIKU2AHcycyQZYsbC4QGh6rH+2euE7XWOHl1kdXUVN1eELqKuWdNF4909rWO0Xq+nZk5KRkoJPGEiCMK5X7/gp5Pvk6fzHD++wt1338PR0Qh317LYuzqisijyGAIhBMzB3DEzUjLMHDPn1xNvkFvNgf48w8GA0TUjRAQVabK4GqKyrKhjRQgRb+hg5p3dyTNBsh7i1uBTQUQQARHporkcUagqi7EixhoQHMEd3BsTHBBABDPF3BAgU0FVUZWrI6pjtFAFYkxNNKI4jfB0p62FKFjymaE076eiVx60ZFaHUFOnhKii4m0mUwMBaTVxHG+FGzyi0r2DLq+BmVlKCUsJcce1+aO7zD50p+FtM14goIIVk8n/1bhBZCmFhrchLrj5TMO53IRZSQR3t6+/+rwPDDrCNRBmGbh7yZT5TKRxkCkYmUatqGpzFMEdO/3jqSNAv+VeAlutkbYGUjb60sY7A97+mrakoiKoZoA2nYaxubmx3EY8AX6fRj9DJKphX03aRzvCjTjtYGWqsxZ2MyuLyTIwBs4BO3S6SVs0oUN2n6R0cLVGiCCqs9q4Y3VdD4ELwB8t/+ndpNqin3g7YKCt6vTRaa83sNpspru5m5mdA9ZbNNbJoEGkmu2qqIrYPmttEalegqmZXG1MmvMFVfk0JSb836CFUH0YQrkQY1xW1WXRbFFVjohoX1VzUc1VVUWzPNNMfzr9/Re/nTn1wq233Xnu2NLyHzHG8SXIO6tlsu8sojpcOKwHDy4MMs1GmmVLIiwDSyDLuF+bUjpx9uyZNzq8L7l/uud/AfeCVv4viJ6cAAAAAElFTkSuQmCC") no-repeat left center transparent;
    background-size: 100% 100%;
}
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
				<td><input class="btn btn-danger" type="submit" value="刪除"></td>
			</form>
		</tr>
		<%
			totprice = totprice + (aCartItem.getPrice() * aCartItem.getQtyOrdered());
		}
		%>
		<tr>
			<td align="right" colspan="5"><mark class="yellow">總額:<%=totprice%></mark></td>
			
			
		</tr>
	</table>
	<br />

<%-- 	<form action="<c:url value="/mall/Shopping"/>" --%>
<!-- 				method="get"> -->
				<a class="btn btn-warning" href="<c:url value="/mall/Shopping?todocart=checkout"/>">結帳</a>
<!-- 		<button class="Checkout" type="submit" name="todocart" value="checkout">結帳</button> -->
				<a class="btn btn-secondary" href="<c:url value="/mall/gotoshoppingnew"/>">繼續購物</a>



</style>
</head>
<body>
<%@ include file="../Header.jsp" %>

<%
      // Scriptlet 2: Check whether the shopping cart is empty.
      List<CartItem> theCart = (List<CartItem>) session.getAttribute("cart");
      if (theCart != null && theCart.size() > 0) {
      %>
      <img src="images/您購買的商品如下.png" alt="">
      <table border="1" cellspacing="0" cellpadding="5">
         <tr>
            <th>商品名稱</th>
            <th>價錢</th>
            <th>數量</th>
            <th>合計</th>
            <th>&nbsp;</th>
         </tr>
         <%
         float totprice =0;
         for (int i = 0; i < theCart.size(); ++i) {
            CartItem aCartItem = theCart.get(i);
         %>
         <tr>
            <form name="removeForm" action="<c:url value="/mall/todocart"/>"  method="get">
               <input type="hidden" name="todocart" value="remove">
               <input type="hidden" name="cartIndex" value="<%= i %>">
               <td><%= aCartItem.getName() %></td>
               <td align="right">$<%= aCartItem.getPrice() %></td>
               <td align="right"><%= aCartItem.getQtyOrdered() %></td>
               <td align="right"><%= aCartItem.getPrice()*aCartItem.getQtyOrdered() %></td>
               <td><input type="submit" value="刪除"></td>
            </form>
         </tr>
         <%
         totprice=totprice+(aCartItem.getPrice()*aCartItem.getQtyOrdered());
         } 
         %>
         <tr>
         	<td></td>
         	<td></td>
         	<td></td>
         	<td><%= totprice %></td>
         	<td></td>
         </tr>
       </table><br />
 
       <form action="<c:url value="/mall/todocart"/>" method="get">
         <button class="Checkout" type="submit" name="todocart" value="checkout">結帳</button> 
         <button class="Continue" type="submit" name="todocart" value="gohome">繼續購物</button> 
      </form>
      
<% 
}else{  //if
%>
<img src="images/目前購物車沒有商品.png" alt="">
<form name="checkoutForm" action="./MallMainPage.jsp" method="POST">
     <button class="Return" type="submit" name="" value="">返回</button> 
</form>	
<%
}
%>
<%@ include file="../Foot.jsp" %>	
</body>
</html>
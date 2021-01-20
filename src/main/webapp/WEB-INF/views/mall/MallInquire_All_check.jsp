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
				商品編號:<input class="input-group-text" type="text" name="no" value="${good.no}"><br />
				商品名稱:<input class="input-group-text" type="text" name="name" value="${good.name}"><br />
				
				
				<label>
						
					商品類型:<select value="${good.type}" name="type">
							<option value="動作冒險">動作冒險</option>
							<option value="射擊格鬥">射擊格鬥</option>
							<option value="運動競速">運動競速</option>
							<option value="角色扮演">角色扮演</option>
							<option value="策略模擬">策略模擬</option>
							<option value="音樂">音樂</option>
							<option value="其他類型">其他類型</option>
							<option value="遊戲預購">遊戲預購</option>
					</select>



					

				 </label>

				
				
				
			<br>	
				
				
				
				
				
				
				
				
				<label>
						
					遊戲平台:<select class="form-select" name="host" value="${good.host}">
						
								<option value="Xbox">Xbox</option>
								<option value="Switch">Switch</option>
								<option value="Ps5">Ps5</option>
								<option value="Web">Web</option> 
						</select>
						</label>
<br>
					<label>
				
				
				
				
				
				
				
				
				購買人次:<input class="input-group-text" type="text" name="number" value="${good.number}"><br />
				
				<label>
						
					商品分級:<select class="form-select" value="${good.level}" name="level">
								<option value="保護級">保護級</option>
								<option value="普遍級">普遍級</option>
								<option value="輔導級">輔導級</option>
								<option value="限制級">限制級</option>
						</select>
<br>		
					</label>
				
				
				
				
				
			
				商品價錢:<input class="input-group-text" type="text" name="money" value="${good.money}"><br />
				
				<label>
						
					付款方式:<select class="form-select" value="${good.pay}" name="pay">
								<option value="信用卡">信用卡</option>
								<option value="匯款">匯款</option>
								<option value="超商付款不取貨">超商付款不取貨</option>
								<option value="代碼繳費">代碼繳費</option>
								
								


						</select>
						
					</label>
<br>				
				
				
				
				
				<label>
					
					交貨方式:<select class="form-select" value="${good.deilvery}" name="deilvery">
							<option value="郵寄">郵寄</option>
							<option value="宅急便">宅急便</option>
							<option value="超商取貨">超商取貨</option>
							


					</select>
				</label>
				<br>
				商品尺寸:<input class="input-group-text" type="text" name="size" value="${good.size}"><br>
				商品圖片:<input class="input-group-text" type="text" name="origin" value="${good.origin}"><br><!-- 圖片 -->
				商品簡介:<input class="input-group-text" type="text" name="item" value="${good.item}"><br>
				
		        <label>
					消費者滿意度:<select class="form-select" value=""${good.contentment}"" name="contentment">
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
					</select>
					
		
		<br>
		</label>
	
	
		<input type="submit" name="callreturn" value="送出" />
	</div>
	</form>
	</div>
<%@ include file="../Foot.jsp" %>
</body>
</html>
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
<STYLE>
body {
　background-color: #ffffff;
background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='203' height='203' viewBox='0 0 200 200'%3E%3Cg %3E%3Cpolygon fill='%23867d1c' points='100 57.1 64 93.1 71.5 100.6 100 72.1'/%3E%3Cpolygon fill='%23a29822' points='100 57.1 100 72.1 128.6 100.6 136.1 93.1'/%3E%3Cpolygon fill='%23867d1c' points='100 163.2 100 178.2 170.7 107.5 170.8 92.4'/%3E%3Cpolygon fill='%23a29822' points='100 163.2 29.2 92.5 29.2 107.5 100 178.2'/%3E%3Cpath fill='%23bfb328' d='M100 21.8L29.2 92.5l70.7 70.7l70.7-70.7L100 21.8z M100 127.9L64.6 92.5L100 57.1l35.4 35.4L100 127.9z'/%3E%3Cpolygon fill='%23545454' points='0 157.1 0 172.1 28.6 200.6 36.1 193.1'/%3E%3Cpolygon fill='%23666666' points='70.7 200 70.8 192.4 63.2 200'/%3E%3Cpolygon fill='%23787878' points='27.8 200 63.2 200 70.7 192.5 0 121.8 0 157.2 35.3 192.5'/%3E%3Cpolygon fill='%23666666' points='200 157.1 164 193.1 171.5 200.6 200 172.1'/%3E%3Cpolygon fill='%23545454' points='136.7 200 129.2 192.5 129.2 200'/%3E%3Cpolygon fill='%23787878' points='172.1 200 164.6 192.5 200 157.1 200 157.2 200 121.8 200 121.8 129.2 192.5 136.7 200'/%3E%3Cpolygon fill='%23545454' points='129.2 0 129.2 7.5 200 78.2 200 63.2 136.7 0'/%3E%3Cpolygon fill='%23787878' points='200 27.8 200 27.9 172.1 0 136.7 0 200 63.2 200 63.2'/%3E%3Cpolygon fill='%23666666' points='63.2 0 0 63.2 0 78.2 70.7 7.5 70.7 0'/%3E%3Cpolygon fill='%23787878' points='0 63.2 63.2 0 27.8 0 0 27.8'/%3E%3C/g%3E%3C/svg%3E");
</STYLE>
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


		<form action="<c:url value="/mall/new"/>" method="get"
			class="dark-matter">
			
				<h1>商品資料註冊</h1>

                    <label>
						
						商品編號:<input type="text"   name="no" size="10" maxlength="10">
					
					</label>




					 <label>
						
						商品名稱:<input type="text" name="name" size="10" maxlength="10">
					
					 </label>
					 <label>
						
						商品類型:<select name="type">
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

					<label>
						
					遊戲平台:<select class="form-select" name="host">
								<option value="Xbox">Xbox</option>
								<option value="Switch">Switch</option>
								<option value="Ps5">Ps5</option>
								<option value="Web">Web</option> 
						</select>
						</label>

					<label>
						
					購買人次:<input type="text" name="number" maxlength="10">
					
					</label>
					<label>
						
					商品分級:<select class="form-select" name="level">
								<option value="保護級">保護級</option>
								<option value="普遍級">普遍級</option>
								<option value="輔導級">輔導級</option>
								<option value="限制級">限制級</option>
						</select>
						
					</label>
					<label>
						
						商品價錢:<input type="text" name="money">
						
					</label>
					<label>
						
					付款方式:<select class="form-select" name="pay">
								<option value="信用卡">信用卡</option>
								<option value="匯款">匯款</option>
								<option value="超商付款不取貨">超商付款不取貨</option>
								<option value="代碼繳費">代碼繳費</option>
								
								


						</select>
						
					</label>
					<label>
					
						交貨方式:<select class="form-select" name="deilvery">
								<option value="郵寄">郵寄</option>
								<option value="宅急便">宅急便</option>
								<option value="超商取貨">超商取貨</option>
								


						</select>
					</label>
					<label>
					商品尺寸:<input type="text" name="size" maxlength="10">
						
					</label>
					<label>
						商品圖片:<input type="text" name="origin" maxlength="max">
					</label>
					<label >
					商品簡介:<input type="text" name="item" maxlength="max">
					</label>

				<label>
						消費者滿意度:<select class="form-select" name="contentment">
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
								<option value="5">5</option>
						</select>
						
			
			<br>
			</label>
			<center>

				<Button class="btn btn-warning" href="MallInquire.jsp">查詢</Button>
				<Button class="btn btn-warning" type="submit" name="submit" value="送出">送出</Button>
			</center>
	</div>

	</form>
	</div>
	</div>

	<%@ include file="../Foot.jsp"%>
</body>

</html>
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
	<div class="container " >

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
						
						商品編號(預設):<input type="text"  placeholder="預設" value="111" name="no" size="10" maxlength="10">
					
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
					
					商品尺寸:<input type="file" class="custom-file-input" id="inputGroupFile03" name="size">
					       
				
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

				<Button  class="btn btn-warning" href="<c:url value="/mall/Inquire"/>">查詢</Button>
				<Button class="btn btn-warning" type="submit" name="submit" value="送出">送出</Button></div><br>
				<Button class="btn btn-warning" href="<c:url value="/mall/MALLbat"/>">返回後台管理頁面</Button>
			</center>
	</div>

	</form>
	</div>
	</div>

	<%@ include file="../Foot.jsp"%>
</body>

</html>
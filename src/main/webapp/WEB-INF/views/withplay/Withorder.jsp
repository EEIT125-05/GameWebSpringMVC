<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ include file="../Link.jsp"%>
<%
	request.setCharacterEncoding("UTF-8");
response.setContentType("text/html;charset=UTF-8");
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" href="../css/WithGame.css">
<title>With</title>
<!-- <script src="../js/With.js"></script> -->
</head>
<style>
.container {
	width: 1200px;
	padding-right: 0px;
	padding-left: 0px;
	margin-right: auto;
	margin-left: auto;
}
input[type=number]::-webkit-outer-spin-button,
input[type=number]::-webkit-inner-spin-button {
  -webkit-appearance: none;
  margin: 0;
}

</style>
<body >
	<%@ include file="../Header.jsp"%>
	<div class="container">
		<div style="background-color:lightgrey;border-radius: 15px;">
			<div
				style="background-color:lightgrey; margin: 25px; height: 700px;padding-top:20px;padding-bottom:20px">
				<h2 style="padding-top:15px">確認訂單</h2>
				<div style="height: 600px; width: 775px;float:left;">
				<hr>
					<div style="float:left;hegiht:300px;width:775px;padding-bottom:20px;display:  flex; align-items: center; justify-content:  center;">
						<div style="float:left;height: 200px; width: 200px;display: flex; align-items: center; justify-content:  center;" >
						<img width=150px height=150px src='${pageContext.request.contextPath}/withplay/picture/${With.iId}' />
						</div>
						<div style="display:inline;float:left;height: 200px; width: 565px;margin-top:20px;margin-bottom:20px;line-height:190px;">
							<p style="float:left;width:150px;font-size:150%;">${With.sNickname}</p>
							<p style="float:left;width:100px;font-size:150%;">${With.sGame}</p>
							<p style="float:right;width:150px;font-weight:bold;font-size:150%;">
								<span id="t4">${With.iPrice}元/局</span>
							</p>
							
						<div style="float:left;width:150px;height:200px;display: flex; align-items: center; justify-content:center;">
						<div style="display: flex; align-items: center; justify-content:center;">
						<input id="min" name="" type="button" value="-" style="color:black;border:none;border-radius:5px 0 0 5px;height:30px;width:40px;line-height:0.5;color:red;font-family:fantasy;fantasy;font-size:35px;">
						<input type=number id="quantity" style="height:30px;width:40px;border:none;line-height:1.5;text-align: center;font-weight:bold;font-size:20px;" value="1">
						<input id="add" name="" type="button" value="+" style="width:40px;height:30px;border:none;border-radius:0 5px 5px 0;line-height:0.5;color:red;font-family:fantasy;font-size:30px;">
						
						</div>
						</div>
						</div>
						
					</div>
					<div>
						<h3 style="font-weight:bold;">付款方式</h3>
					</div>
						<div>7</div>
				</div>
				<div style="height: 200px; width: 310px;float:right;padding:15px;margin-top:30px;background-color:#FFFFC9;border-radius:15px">
					<div>
						<div>
						<div style="height:30px;margin-bbottom:20px;">
						<span style="float:left;" id="t1" >總價（局 * 1）</span>
						<span style="float:right;" id="t2">${With.iPrice}元</span>
						</div>
						<hr>
						<div style="margin-top:20px; margin-bbottom:20px;height:40px;font-size:150%;">
						<span>實付</span>
						<span style="float:right;" id="t3">${With.iPrice}元</span>
						</div>
						</div>
					</div>
					<div style="padding-top:20px">
					<button type="button" class="btn btn-danger" style="width:274px;">送出訂單</button>
					</div>
				</div>
			</div>
		</div>
	
	</div>


	<div align="center">
		<a href="${pageContext.servletContext.contextPath}/withplay/Index">陪玩首頁</a>
	</div>

	<%@ include file="../Foot.jsp"%>
</body>
<script>
$(function(){
	var t = $("#quantity");
	var t1=$("#t1");
	var t2=$("#t2");
	var t3=$("#t3");
	var t4=$("#t4").html().split("元")[0];
	$("#add").click(function(){
		t.val(parseInt(t.val())+1).attr("value", t.val());
		t1.html("總價（局 * " + t.val() + "）");
		t2.html(parseInt(t.val())*parseInt(t4) + "元");
		t3.html(t2.html());
		$("#min").removeAttr("disabled");//當按加1時，解除$("#min")不可讀狀態
		if(parseInt(t.val())>=15){
			$("#add").attr("disabled","disabled")
		}

	})
	$("#min").click(function(){
               if (parseInt(t.val())>1||parseInt(t.val())>=15) {                     //判斷數量值大於1時才可以減少
                t.val(parseInt(t.val())-1).attr("value", t.val());
                t1.html("總價（局 * " + t.val() + "）");
        		t2.html(parseInt(t.val())*parseInt(t4) + "元");
        		t3.html(t2.html());
                $("#add").removeAttr("disabled");
                }else{
                $("#min").attr("disabled","disabled")        //當$("#min")為1時，$("#min")不可讀狀態
               }
	})

	

})
</script>
</html>

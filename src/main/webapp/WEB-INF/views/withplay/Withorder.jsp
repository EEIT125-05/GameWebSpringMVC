<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<%@ include file="../Link.jsp"%>
<%
	request.setCharacterEncoding("UTF-8");
response.setContentType("text/html;charset=UTF-8");
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10.13.0/dist/sweetalert2.all.min.js"></script>
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
		<div style="background-color:#FFFAF4;border-radius: 15px;">
			<div
				style="margin: 25px; height: 700px;padding-top:20px;padding-bottom:20px">
				<h2 style="padding-top:15px">確認訂單</h2>
				<div style="height: 600px; width: 775px;float:left;">
				<hr>
					<div style="float:left;hegiht:300px;width:775px;padding-bottom:20px;display:  flex; align-items: center; justify-content:  center;">
						<div style="float:left;height: 200px; width: 200px;display: flex; align-items: center; justify-content:  center;" >
						<img width=150px height=150px src='${pageContext.request.contextPath}/withplay/picture/${With.iId}' />
						</div>
						<div style="display:inline;float:left;height: 200px; width: 565px;margin-top:20px;margin-bottom:20px;line-height:190px;">
							<p style="float:left;width:150px;font-size:150%;">${With.sNickname}</p>
							<p style="float:left;width:100px;font-size:20px;"><span>${With.sGame}</span></p>
							<p style="float:right;width:150px;font-weight:bold;font-size:150%;">
								<span id="t4">${With.iPrice}元/局</span>
							</p>
							
						<div style="float:left;width:150px;height:200px;display: flex; align-items: center; justify-content:center;">
						<div style="display: flex; align-items: center; justify-content:center;">
						<input id="min" name="" type="button" value="-" style="color:black;border:none;border-radius:5px 0 0 5px;height:30px;width:40px;line-height:0.5;color:red;font-family:fantasy;fantasy;font-size:35px;">
						<input type=number id="quantity" style="height:30px;width:40px;border:none;line-height:1.5;text-align: center;font-weight:bold;font-size:20px;background-color:fefcfb;" value="1"
						>
						<input id="add" name="" type="button" value="+" style="width:40px;height:30px;border:none;border-radius:0 5px 5px 0;line-height:0.5;color:red;font-family:fantasy;font-size:30px;">
						
						</div>
						</div>
						</div>
						
					</div>
					<div>
						<h3 style="font-weight:bold;">付款方式</h3>
					</div>

						<div>
						<ul style="list-style-type:decimal;font-size:20px;font-weight:bold;color:#7D7D7D;">
						　<li>下單前建議先與陪玩師聯繫，彼此約定雙方適當時間，避免彼此產生交易糾紛。</li>
						　<li>完成訂單後，若該筆訂單尚未完成，將不予以重複下單。</li>

						　<li>若認為服務有疑慮，用戶可申請退款，若陪玩師未再24小回覆，退款則自動成立；若陪玩師否決退款，於7天內會完成該次訂單交易。。</li>

						　<li>若認為服務有疑慮，用戶可申請退款，若陪玩師未再24小時回覆，退款則自動成立；若陪玩師否決退款，於7天內會完成該次訂單交易。</li>

						</ul>
						
						</div>

						<div>7</div>


						　<li>若認為服務有疑慮，用戶可申請退款，若陪玩師未再24小時回覆，退款則自動成立；若陪玩師否決退款，於7天內會完成該次訂單交易。</li>
						</ul>
						
						</div>

						　<li>若認為服務有疑慮，用戶可申請退款，若陪玩師未再24小時回覆，退款則自動成立；若陪玩師否決退款，於7天內會完成該次訂單交易。</li>
						</ul>
						
						</div>

						　<li>若認為服務有疑慮，用戶可申請退款，若陪玩師未再24小時回覆，退款則自動成立；若陪玩師否決退款，於7天內會完成該次訂單交易。</li>
						</ul>
						
						</div>

				</div>
				<div style="height: 200px; width: 310px;float:right;padding:15px;margin-top:30px;background-color:fefcfb;border-radius:15px">
					<div>
						<div>
						<div style="height:30px;margin-bbottom:20px;">
						<span style="float:left;" id="t1" >總價（局 * 1）</span>
						<span style="float:right;" id="t2">${With.iPrice}元</span>
						</div>
						<hr>
						<div style="margin-top:20px; margin-bbottom:20px;height:40px;font-size:150%;">
						<span>實付</span>
						<span style="float:right;" id="iPrice" >${With.iPrice}元</span>
						</div>
						</div>
					</div>
					<form action="<c:url value='/withplay/Orderlist'/>" method="post">
				<input type="hidden" id="total" value="${With.iPrice}" name="total"/>
				<input type="hidden"  value="${user.iNo}" name="usAccount"/>
				<input type="hidden"  value="${With.iId}" name="wsAccount"/>
				<input type="hidden"  value="${With.sGame}" name="sGame"/>
					<div style="padding-top:20px">
<!-- 					<button type="submit" class="btn btn-danger" style="width:274px;">送出訂單</button> -->
					<button type="button" class="btn btn-danger" onclick="checkSubmit()" style="width:274px;">送出訂單</button>
					</div>
						</form>
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

function checkSubmit() {
	swal.fire("成功", "", "success").then(function() {
		$('form').submit()
		console.log("success")
	})
}

$('#quantity').change(function(){
	   //變更值(手動輸入)
	    if($(this).val() > 0){     
	    	if(parseInt($(this).val()) > 15){
		       $(this).val($(this).attr("value"));		     
		    }
		     else{
		      $(this).attr("value", $(this).val());
		      allchange();
		     }
	    }
	    else{
	     $(this).val($(this).attr("value"))
	    }
   	   
	  })

function allchange(){
	let t = $("#quantity");
	let t1=$("#t1");
	let t2=$("#t2");
	let t3=$("#iPrice");
	let t4=$("#t4").html().split("元")[0];
	let t5=$("#total");
	
	t1.html("總價（局 * " + t.val() + "）");
	t2.html(parseInt(t.val())*parseInt(t4) + "元");
	t3.html(t2.html());
	t5.val(parseInt(t.val())*parseInt(t4));
	t5.val(parseInt(t.val())*parseInt(t4)).attr("value",t5.val());
	if(t.val()==1){
		$("#min").attr("disabled","disabled");
	}
	
	else if(t.val()==15){
		$("#add").attr("disabled","disabled");
	}
	else{
		$("#min").removeAttr("disabled");
		$("#add").removeAttr("disabled");
	}
}

$(function(){

	$("#add").click(function(){
		if($("#quantity").val()<15){
			$("#quantity").val(parseInt($("#quantity").val())+1).attr("value",$("#quantity").val());
			allchange();
		}
	})
	$("#min").click(function(){
		if($("#quantity").val()>0){
			$("#quantity").val(parseInt($("#quantity").val())-1).attr("value",$("#quantity").val());
			allchange();
		}
	})

	
})


</script>
</html>

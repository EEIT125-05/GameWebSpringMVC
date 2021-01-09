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
</style>
<body >
	<%@ include file="../Header.jsp"%>
	<div class="container">
		<div style="background-color:lightgrey;border-radius: 15px;">
			<div
				style="background-color:lightgrey; margin: 25px; height: 700px;padding-top:20px;padding-bottom:20px">
				<h2 style="padding-top:15px">確認訂單</h2>
				<div style="background-color: rgb(180, 230, 173);  height: 600px; width: 775px;float:left;">
					<div style="float:left;hegiht:300px;width:775px;border:blue solid 5px;padding-top:20px;padding-bottom:20px;display:  flex; align-items: center; justify-content:  center;">
						<div style="float:left;height: 200px; width: 200px;display: flex; align-items: center; justify-content:  center;" >
						<img width=150px height=150px src='${pageContext.request.contextPath}/withplay/picture/${With.iId}' />
						</div>
						<div style="display:inline;float:left;border:red solid 5px;height: 200px; width: 565px;margin-top:20px;margin-bottom:20px;line-height:190px;">
							<p style="float:left;width:150px">1</p>
							<p style="float:left;width:100px">2</p>
							<p style="float:right;width:150px">50
								<span >幣/一小時</span>
							</p>
							
						<div style="float:left;width:150px;height:200px;display: flex; align-items: center; justify-content:  center;">
						<div style="border:black solid 1px;border-radius:5px;">
						<div style="float:left;"><i class="fa fa-minus-square-o fa-2x"></i></div>
						<input typer=number style="height:30;width:40px;float:left;border:none;border-radius:5px;">
						<div style="float:left;"><i class="fa fa-plus-square-o fa-2x" ></i></div>
						</div>
						</div>
						</div>
						
					</div>
					<div>
						<h3>付款方式</h3>
					</div>
						<div>7</div>
				</div>
				<div style=" border: rgb(212, 0, 255) solid 3px; height: 200px; width: 310px;float:right;padding:15px">
					<div>
						<div>
						<div style="height:30px;background-color:yellow;margin-bbottom:20px;">
						<span style="float:left;">2</span>
						<span style="float:right;">3</span>
						</div>
						<div style="margin-top:20px; margin-bbottom:20px;height:40px;">
						<span>44</span>
						<span style="float:right;">55</span>
						</div>
						</div>
					</div>
					<div style="padding-top:20px">
					<button type="button" class="btn btn-danger" style="width:274px;">送出訂單</button>
					</div>
				</div>
			</div>
		</div>
		<!-- 	<div align="center" > -->

		<!-- 		<table border="1" > -->
		<!-- 			<tr> -->
		<!-- 				<th>帳號</th> -->
		<!-- 				<th >姓名</th> -->
		<!-- 				<th >暱稱</th> -->
		<!-- 				<th>ID</th> -->
		<!-- 				<th>性別</th> -->
		<!-- 				<th >遊戲</th> -->
		<!-- 				<th>照片</th> -->
		<!-- 				<th >自我介紹</th> -->
		<!-- 				<th>價格</th> -->
		<!-- 				<th>功能</th> -->
		<!-- 			</tr> -->
		<%-- <%-- 			<c:forEach items="${With}" var="With" varStatus="status"> --%>
		<!-- 				<tr> -->

		<%-- 					<td>${With.sAccount}</td> --%>
		<%-- 					<td >${With.sName}</td> --%>
		<%-- 					<td>${With.sNickname}</td> --%>
		<%-- 					<td>${With.sIdcode}</td> --%>
		<%-- 					<td>${With.sGender == 'F' ? "女" : "男" }</td> --%>
		<%-- 					<td>${With.sGame}</td> --%>
		<!-- 					<td><img width='200' height='200' -->
		<%-- 						src='${pageContext.request.contextPath}/withplay/picture/${With.iId}' /></td> --%>
		<%-- 					<td style="word-break: break-all; width:400px" >${With.sComment}</td> --%>
		<%-- 					<td>${With.iPrice}</td> --%>
		<!-- 					<td><a -->
		<%-- 						href="${pageContext.request.contextPath}/withplay/edit/${With.iId}">Edit</a> --%>
		<!-- 						&nbsp;&nbsp;  -->
		<!-- 						<a class='deletelink' -->
		<%-- 						href="${pageContext.request.contextPath}/withplay/delete/${With.iId}">Delete</a> --%>
		<!-- 					</td> -->
		<!-- 				</tr> -->
		<%-- <%-- 			</c:forEach> --%>
		<!-- 		</table> -->
		<!-- 	</div> -->
	</div>


	<div align="center">
		<a href="${pageContext.servletContext.contextPath}/withplay/Index">陪玩首頁</a>
	</div>

	<%@ include file="../Foot.jsp"%>
</body>
<script>
	$(document).ready(function() {
		$('.deletelink').click(function() {
			if (confirm('確定刪除此筆紀錄? ')) {
				var href = $(this).attr('href');
				$('form').attr('action', href).submit();
			}
			return false;

		});
	});
</script>
</html>

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
				style="background-color:lightgrey; margin: 25px; height: 700px">
				<h2 style="padding-top:15px">確認訂單</h2>
				<div style="background-color: rgb(180, 230, 173);  height: 600px; width: 775px;float:left;">
					<div style="float:left;hegiht:200px;width:775px;border:blue solid 5px;">
						<div style="float:left;border:black solid 5px;height: 150px; width: 150px;margin-top:20px;margin-bottom:20px;" >p</div>
						<div style="display:inline;float:left;border:red solid 5px;height: 150px; width: 615px;margin-top:20px;margin-bottom:20px">
							<p style="float:left;width:150px">1</p>
							<p style="float:left;width:150px">2</p>
							<p style="float:right;width:150px">50
								<span >幣/一小時</span>
							</p>
							
						<div style="float:left;width:150px;">
						<div style="float:left;"><i class="fa fa-minus-square-o fa-2x"></i></div>
						<input style="height:30;width:40px">
						<div style="float:right;width:50px">
						</div>
						</div>
						</div>
						
<!-- 						<div > -->
<!-- 							<p>1</p> -->
<!-- 							<p>2</p> -->
<!-- 							<p> -->
<!-- 								<span>3</span> -->
<!-- 							</p> -->

<!-- 						</div> -->
					</div>
					<div>
						<h3>付款方式</h3>
					</div>
						<div>7</div>
				</div>
				<div style="background-color: rgb(173, 230, 227); border: rgb(212, 0, 255) solid 3px; height: 200px; width: 310px;float:right;">
					<div>
						<div>4</div>
						<div>
							<span>5</span> <span>6</span>
						</div>
					</div>
					<div>提交訂單</div>
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

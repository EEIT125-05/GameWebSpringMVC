<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
<title>WithIndex</title>
<link rel="stylesheet" href="../css/WithGame.css">


</head>
<body>
	<%@ include file="../Header.jsp"%>

	<div class="container">

		<h1 class="mt-4 mb-3">
			陪玩 <small>XXXXX</small>
		</h1>

		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="<c:url value='/'/>">Home</a>
			</li>
		</ol>


		<form action='${pageContext.request.contextPath}/withplay/select'>
			<div class="input-group">
			<label>依暱稱搜尋: </label> <input type="text" name="sNickname" class="form-control"> 
			<span class="input-group-append">
			<input type="Submit" value="搜尋" class="btn btn-secondary">
			</span>
			</div>
			
		</form>

		<c:if test="${empty With}">
			<p>目前無資料</p>
		</c:if>
		<div class="row">
			<c:forEach var="With" items="${With}">
				<div data-toggle="modal" data-target="#exampleModal${With.iId}"
					>
					<div class="col col-6 col-sm-4 col-md-4 col-lg-2">
						<div class="div1">
							<div class="fi1">
								<a href="#"> <img class="img1"
									src='${pageContext.request.contextPath}/withplay/picture/${With.iId}'>
								</a> <a>
									<div>${With.sNickname}</div>
									<div>${With.sGame}</div>
									<div>
									<p>
									<span>$</span>
									<span>${With.iPrice}</span>
									<span>/局</span>
									</p>
									</div>
								</a>

							</div>
						</div>
					</div>
					<div class="modal fade" id="exampleModal${With.iId}" tabindex="-1"
						role="dialog" aria-labelledby="exampleModalLongTitle"
						aria-hidden="true">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">
								  <div class="container-fluid">	
								      <div class="row">
									<a> <img class="img1"
										src='${pageContext.request.contextPath}/withplay/picture/${With.iId}'>
									</a>
									<div>${With.sGame}</div>
									<div>${With.sNickname}</div>

								</div>
								</div>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-dismiss="modal">Close</button>
									<button type="button" class="btn btn-primary">Save
										changes</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>

		</div>
	</div>
	<%@ include file="../Foot.jsp"%>
	<script>
		$(function() {
			$('#myModal').on('shown.bs.modal', function() {
				$('#myInput').trigger('focus')
			})
		});

		// 	$(".div1").each(function(){
		// 		$(this).click(function(){
		// 			console.log("123")
		// 			.ajax({

		// 			})
		// 		})
		// 	})

		// 	$(".div1").on("click",function(){	
		// 			console.log("123")
		// // 			.ajax({

		// // 			})

		// 	})

		// $(document).ready(function(){
		// // 	$(".div1").each(function(){
		// 		$(".div1").click(function(){
		// 			console.log("123")
		// 			console.log($("#point").text());

		// 			$.ajax({
		// 				type:"post",
		// 				url: "<c:url value='/withplay/IndexAjax'/>",
		// 				dataType:"json",
		// 				data:{"iId": $(this).find("img").attr("src").split("/")[4]},
		// 				success: function(result) {	
		// 					console.log("成功");
		// 					$("#point").empty();
		// 					if(result.length == 0){
		// 						$("#point").append("<p>無貼文符合您搜尋的條件</p>")							
		// 					}else{
		// 						$("#point").append("<table style=\"border:2px solid red\">"+
		// 									"<thead>"+
		// 									"<tr><th>分類</th><th>標題</th><th>樓主</th><th>發文時間</th><th>留言數</th>"+
		// 									"</tr>"+
		// 									"</thead>"+
		// 									"<tbody></tbody></table>");
		// 					}
		// 					console.log("123")

		// 					$.each(result ,function(key,value){
		// 						$("tbody").append("<tr><td>"+value.sName+"</td>"+
		// 								"<td>"+value.sIdcode+"</td><td>"+" "+value.sGame+"</td>"+
		// 								"<td>"+value.sComment+"</td></tr>");
		// 					});
		// 	            },
		// 	            error:function (err) {
		// 	                alert("發生錯誤!");
		// 	            }		
		// 			})
		// 		})						
		// // 	})	
		// })
	</script>
</body>
</html>
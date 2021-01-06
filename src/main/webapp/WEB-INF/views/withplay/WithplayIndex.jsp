<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
			陪玩 <small>Play</small>
		</h1>

		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="<c:url value='/'/>">Home</a>
			</li>
		</ol>


		<%-- 		<form action='${pageContext.request.contextPath}/withplay/select'> --%>
		<div class="input-group">
			<label>依暱稱搜尋: </label> <input type="text" name="sNickname"
				class="form-control" id="sNickname"> <span
				class="input-group-append"> <input type="button" value="搜尋"
				class="btn btn-secondary" id="submit">
			</span>
		</div>
		<label>進階條件: </label><br> <label>遊戲</label> <select id="sGame"
			class="form-control" name="sGame"
			style="width: 130px; display: inline">
			<option value="">全部</option>
			<c:forEach var="sGame" items="${GameList}">
				<option value="${sGame}">${sGame}</option>
			</c:forEach>
		</select>
		<%-- 		</form> --%>

		<c:if test="${empty Withlist}">
			<p>目前無資料</p>
		</c:if>
		<div class="row" id="point">
			<c:forEach var="With" items="${Withlist}">
				<div class="col col-6 col-sm-4 col-md-4 col-lg-2">
					<div data-toggle="modal" data-target="#exampleModal${With.iId}">
						<div class="div1">
							<div class="fi1">
								<a href="#"> <img class="img1"
									src='${pageContext.request.contextPath}/withplay/picture/${With.iId}'>
								</a>
								<!-- 								<a> -->
								<div>${With.sNickname}</div>
								<div>${With.sGame}</div>
								<div>
									<p>
										<span>$</span> <span>${With.iPrice}</span> <span>/局</span>
									</p>
								</div>
								<!-- 								</a> -->

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

											<form action="<c:url value='/withplay/Reply'/>" method="post">


												<hr>
												<div style="position: relative">
													<c:forEach var="reply" items="${With.sReplyBeans}">
														<jsp:useBean id="nowDate" class="java.util.Date" />
														<fmt:formatDate var="dateString" value="${nowDate}"
															pattern="yyyy-MM-dd" />
														<%-- 										<fmt:formatDate var="timeString" value="${nowDate}" pattern="HH:mm:ss"/> 先留著 要做XX分內可以拿來用 --%>
														<fmt:parseDate var="Date" value="${dateString}"
															pattern="yyyy-MM-dd" />
														<fmt:parseDate var="replyDate" value="${reply.dDate}"
															pattern="yyyy-MM-dd" />
														<c:choose>
															<c:when test="${Date.time - replyDate.time == 0}">
																<c:set var="timeString" value="今日 ${reply.tTime}" />
															</c:when>
															<c:when test="${Date.time - replyDate.time == 86400000}">
																<c:set var="timeString" value="昨日 ${reply.tTime}" />
															</c:when>
															<c:otherwise>
																<c:set var="timeString"
																	value="${reply.dDate} ${reply.tTime}" />
															</c:otherwise>
														</c:choose>
														<label>${reply.sAuthor}</label>
														<label> : ${reply.sText}</label>
														<label style="position: absolute; right: 0">${timeString}</label>
														<br>
													</c:forEach>
												</div>

												<hr>

												<div>
													回覆: <input type="text" id="Reply${With.iId}" name="sText" required>
													<button type="submit" id="replySubmit${With.iId}" name="withNo"
														value="${With.iId}">送出</button>
												</div>
											</form>


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

		$("#submit").on("click",function() {
			console.log("12346579");
			$("#point").empty();
							let xhr = new XMLHttpRequest();
							if (xhr != null) {

								xhr.onreadystatechange = function() {
									if (xhr.readyState === 4) {
										if (xhr.status === 200) {
											console.log(JSON.parse(xhr.responseText));
											let type = xhr.getResponseHeader("Content-Type");
											if (type.indexOf("application/json") === 0) {
												let obj = JSON.parse(xhr.responseText);
												if (obj.length == 0) {
													$("#point").append(
															"<p>無符合您搜尋的條件</p>");
												}
												$.each(obj,function(key,value) {
													
													$("#point").append(
																					"<div class='row' id='point'>"
																							+ "<div class='col col-6 col-sm-4 col-md-4 col-lg-2'>"
																							+ "<div data-toggle='modal' data-target='#exampleModal" + value.iId + "'>"
																							+ "<div class='div1'>"
																							+ "<div class='fi1'>"
																							+ "<a href='#'> <img class='img1' src='${pageContext.request.contextPath}/withplay/picture/"+value.iId+"'></a>"
																							+ "<a>"
																							+ "<div>"
																							+ value.sNickname
																							+ "</div>"
																							+ "<div>"
																							+ value.sGame
																							+ "</div>"
																							+ "<div>"
																							+ "<p>"
																							+ "<span>$</span>"
																							+ "<span>"
																							+ value.iPrice
																							+ "</span>"
																							+ "<span>/局</span>"
																							+ "</p>"
																							+ "</div>"
																							+ "</a>"

																							+ "</div>"
																							+ "</div>"
																							+ "</div>"
																							+ "<div class='modal fade' id='exampleModal" + value.iId + "' tabindex='-1' role='dialog' aria-labelledby='exampleModalLongTitle' aria-hidden='true'>"
																							+ "<div class='modal-dialog' role='document'>"
																							+ "<div class='modal-content'>"
																							+ "<div class='modal-header'>"
																							+ "<h5 class='modal-title' id='exampleModalLabel'>Modal title</h5>"
																							+ "<button type='button' class='close' data-dismiss='modal' aria-label='Close'> <span aria-hidden='true'>&times;</span> </button>"
																							+ "</div>"
																							+ "<div class='modal-body'>"
																							+ "<div class='container-fluid'>"
																							+ "<div class='row'>"
																							+ "<a> <img class='img1'"
																+"src='${pageContext.request.contextPath}/withplay/picture/"+value.iId+"'>"
																							+ "</a>"
																							+ "<div>"
																							+ value.sGame
																							+ "</div>"
																							+ "<div>"
																							+ value.sNickname
																							+ "</div>"
					
																							
																							+"<form action='<c:url value='/withplay/Reply'/>' method='post'>"


																							+"<hr>"
																							+"<div id='reply" + value.iId + "' style='position: relative'>"
																								
																							+"</div>"

																							+"<hr>"

																							+"<div>"
																								+"回覆: <input type='text' id='reply' name='sText' required>"
																								+"<button type='submit' id='replySubmit' name='withNo'"
																									+"value='" + value.iId + "'>送出</button>"
																							+"</div>"
																						+"</form>"
																							
																							
																							+ "</div>"
																							+ "</div>"
																							+ "</div>"
																							+ "<div class='modal-footer'>"
																							+ "<button type='button' class='btn btn-secondary'"
																+"data-dismiss='modal'>Close</button>"
																							+ "<button type='button' class='btn btn-primary'>Save"
																							+ "changes</button>"
																							+ "</div>"
																							+ "</div>"
																							+ "</div>"
																							+ "</div>"
																							+ "</div>"
																							+ "</div>" )
																							let author ="";
													let text = "";
													let date = "";
													let time = "";
													let id = value.iId			
													let d = new Date();
													$.each(value.sReplyBeans,function(key,value) {
														author = value.sAuthor;
														text = value.sText;
														date = $.format.date(new Date(value.dDate), 'yyyy-MM-dd');
														if(d.getTime() - value.dDate <= 86400000){
															date = "今日";
														}else if(d.getTime() - Date.parse(date) > 86400000 && d.getTime() - Date.parse(date) <= 86400000*2){
															date = "昨日";
														}
														time = value.tTime;
														
														$("#reply"+id).append("<label>" + author + "</label>"
																+"<label> : " + text + "</label>"
																+"<label style='position: absolute; right: 0'>" + date + " " + time + "</label>"
																+"<br>")
													});				
												});
											};
										} else {
											alert("發生錯誤: readyState="
													+ xhr.readyState
													+ "status=" + xhr.status);
										}
									}
								}

								xhr.open("POST",
										"<c:url value='/withplay/IndexAjax'/>",
										true);
								xhr.setRequestHeader("Content-Type",
										"application/x-www-form-urlencoded");
								xhr.send("sNickname=" + $("#sNickname").val()
										+ "&sGame=" + $("#sGame").val());

							} else {
								alert("您的瀏覽器不支援Ajax");
							}
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
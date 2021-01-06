<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../Link.jsp"%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>交換版首頁</title>
</head>
<body>
	<%@ include file="../Header.jsp"%>
	<form method='get' action='<c:url value="/exchange/preparehomepage"/>'>


		<div id="portfolio" class="section md-padding bg-grey">
			<div class="container">


				<h1 class="mt-4 mb-3">交換版</h1>

				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="<c:url value='/'/>">Home</a>
					</li>
					<li class="breadcrumb-item active">交換</li>
				</ol>

				<label>依名稱搜尋: </label>
				<div class="input-group">
					<input type="text" class="form-control" name="searchparams"
						value="${ searchparams}"> <input type="submit">
				</div>


				<c:choose>
					<c:when test="${search =='area'}">
						<label><input type="radio" name="search" value="gamename">遊戲名稱</label>
						<label><input type="radio" name="search" value="area"
							checked>地區</label>
					</c:when>
					<c:otherwise>
						<label><input type="radio" name="search" value="gamename"
							checked>遊戲名稱</label>
						<label><input type="radio" name="search" value="area">地區</label>
					</c:otherwise>
				</c:choose>

				<input type="hidden" id="search" value="${search}">
				<!-- 藏參數 -->
	</form>

	<div class="row" id="bigdiv">


		<c:forEach var='g' varStatus='vs' items='${list }'>

			<!-- Work -->
			<div class="col-md-4 col-xs-6 work">
				<img class="img-responsive" style="width: 345px; height: 345px"
					src="${pageContext.request.contextPath }/${g.image }" alt="">
				<div class="overlay"></div>
				<div class="work-content">
					<span>遊戲名稱:${g.gamename}</span> <span>遊戲數量:${g.qty}</span> <span>遊戲所在地:${g.gamelocation}</span>
					<span>運送方式:${g.delivery}</span> <span>主機平台:${g.console}</span> <span>玩家名稱:${g.gamer}</span>
					<span>是否含特點:${g.dlc}</span> <span>備註:${g.remark}</span>
					<div class="work-link" style="margin: auto;">

						<div data-toggle="modal" data-target="#exampleModal">
							<button type="button" class="btn btn-primary" data-toggle="modal"
								data-target="#exampleModalLong${g.no }" onclick="resetDisabled();"><i
							class="fa fa-exchange"></i></button>
						</div>


					</div>
				</div>
			</div>

			<div class="modal fade" id="exampleModalLong${g.no }" tabindex="-1"
				role="dialog" aria-labelledby="exampleModalLongTitle"
				aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLongTitle">交換申請</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>

						<form action="<c:url value="/exchange/applyFor"/>" method="post" name="apply" onsubmit="applyclick()">
							<div class="modal-body">


								<fieldset>
									<div>
										<label for="partyA">甲方　　</label> <input type="text"
											name="partyA" value="${g.gamer }"
											style="width: 260px;" class="fixedlen" id="partyA"  readonly/>

														<span id="console1span"></span>
									</div>
									<div>

										<label for="gamename">欲換遊戲</label> <input type="text"
											name="supportGame"
											value="${g.console }-${g.gamename}"
											style="width: 260px;" class="fixedlen" id="Supportgamebean" readonly />
										<input type="hidden" name="supportGameNo"
											value="${g.no }" />
														<span id="gamenamespan"></span>

									</div>
									<div>

										<label for="partyB">乙方　　</label> <input type="text"
											name="partyB" value="${user.sAccount }"
											style="width: 260px;" class="fixedlen" id="partyB" readonly/>
														<span id="qtyspan"></span>

									</div>
									<div>

										<label for="gamename">我的遊戲</label> <select
											style="width: 260px;" class="fixedlen" name="myGameNo"
											id="myGame${g.no }" onblur="resetSelect(${g.no });">
											<option>我的遊戲庫</option>
											<c:forEach var="M" items="${myGameBeans}">
												<option value="${M.no }">${M.console}-${M.gamename}</option>
											</c:forEach>
										</select> <span id="gamenamespan${g.no }"></span>

									</div>

								</fieldset>

							</div>
							<div class="modal-footer">
								<button type="botton" class="btn btn-secondary"
									data-dismiss="modal"  id="demo${vs.index }" onclick="applyclick();">返回</button>
								<button type="botton" class="btn btn-primary appforsubmit "  onclick="applyclick();">申請</button>
							</div>
						</form>
					</div>
				</div>
			</div>


		</c:forEach>
	</div>
	<div>
		<c:if test="${p > 1}">
			<c:forEach var="num" begin="1" end="${p }" step="1">
				<a class="page"><i>${num}</i></a>
			</c:forEach>
		</c:if>
	</div>
	</div>
	</div>

<!-- 	<button id="demo1" type="submit">!!!test</button> -->


	<%@ include file="../Foot.jsp"%>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script>

		function applyclick(){
			swal("Good job!",
					  "You clicked the button!",
					  "success").then(function(){
			apply.submit();
					  })
		}
	
		
// 		$("button").click(function(){
//     	$("form").submit();
//   		}); 
	
	
	
		function resetDisabled(){
			$(".appforsubmit").attr("disabled", true);
		}	
	
		function resetSelect(e){
			
			if ($("#myGame"+e).val() == "") {
					$("#gamenamespan"+e).html("<span>必填</span>")
					$(".appforsubmit").attr("disabled", true);
				} else if ($("#myGame"+e).val() == "我的遊戲庫") {
					$("#gamenamespan"+e).html("<span>必填</span>")
					$(".appforsubmit").attr("disabled", true);
				} else {
					$("#gamenamespan"+e).html("")
					$(".appforsubmit").attr("disabled", false);
				}
		}
		
		window.onload = function() {
			
			
			
			var pages = document.querySelectorAll(".page");
			var applyFors = document.querySelectorAll(".applyFor");
			var divout = document.getElementById("bigdiv")
			var search = document.getElementById("search").value
			var searchDOM = document.getElementById("search")
			var xhr = new XMLHttpRequest();

			for (i = 0; i < pages.length; i++) {
				pages[i].onclick = changepage
			}
			for (i = 0; i < applyFors.length; i++) {
				applyFors[i].onclick = checkMemberCheck
			}
			console.log("綁定完成")
			function changepage() {
				let i = (this.innerText)
				console.log(i)
				xhr.open('GET', '<c:url value="/exchange/changepage" />'
						+ '?page=' + i + '&search=' + search, true);
				xhr.send();
				xhr.onreadystatechange = function() {
					console.log("xhr.readyState" + xhr.readyState)
					if (xhr.readyState === 4 && xhr.status === 200) {
						var g = JSON.parse(xhr.responseText)
						console.log("!")
						divout.innerHTML = "";

						for (var i = 0; i < g.list.length; i++) {
							console.log("!!")
							divout.innerHTML += "<div class='col-md-4 col-xs-6 work'><img class='img-responsive' style='width:345px; height:345px' src='${pageContext.request.contextPath }/"+g.list[i].image+"' alt=''>"
									+ "<div class='overlay'></div><div class='work-content'><span>遊戲名稱:"
									+ g.list[i].gamename
									+ "</span>"
									+ "<span>遊戲數量:"
									+ g.list[i].qty
									+ "</span>"
									+ "<span>遊戲所在地:"
									+ g.list[i].gamelocation
									+ "</span>"
									+ "<span>運送方式:"
									+ g.list[i].delivery
									+ "</span>"
									+ "<span>主機平台:"
									+ g.list[i].console
									+ "</span>"
									+ "<span>玩家名稱:"
									+ g.list[i].gamer
									+ "</span>"
									+ "<span>是否含特點:"
									+ g.list[i].dlc
									+ "</span>"
									+ "<span>備註:"
									+ g.list[i].remark
									+ "</span>"
									+ "<div class='work-link' style='margin: auto;'><a class='applyFor' style='border-radius:30px' href=''<c:url value='/exchange/applyFor?gamer="
									+ g.list[i].gamer
									+ "&no="
									+ g.list[i].no
									+ "'/>'><i class='fa fa-exchange'></i></a>"
									+ "</div></div></div>"
						}
						divout.innerHTML += "<input type='hidden' id='search' value='"+g.searchparams+"'> "
					}
				}
			}
			}

			
	</script>
</body>
</html>
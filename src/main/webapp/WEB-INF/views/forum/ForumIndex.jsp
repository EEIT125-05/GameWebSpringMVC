<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ include file="../Link.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>討論區 - GameBar</title>
<%-- <script src="${pageContext.request.contextPath}/js/ForumIndex.js"></script> --%>
<style>
th, tr, td {
	border: 2px solid red;
}

.categoryChoose, .hotChoose{
	background-color:#343a40;
	color:white;
}
a.enterDetail{
	color: black;
	text-decoration:none;
}
a.update{
	height:38px; 
	margin-right:10px
}
a.delete{
	height:38px;
}
</style>

</head>
<body>
	<%@ include file="../Header.jsp"%>
<div class="container">
    <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel" style="height:300px;">
      <ol class="carousel-indicators">
        <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
      </ol>
      <div class="carousel-inner" role="listbox" style="height:300px;position:relative">
       
        <div class="carousel-item active" style="background-image: url('https://content.shopback.com/tw/wp-content/uploads/2020/04/10142030/Cover-nintendo-web.jpg');height:300px">
          <div class="carousel-caption d-none d-md-block">
            <h3></h3>
         
          </div>
        </div>
       
        <div class="carousel-item" style="background-image: url('https://static02-proxy.hket.com/res/v3/image/content/2605000/2607364/MARIO_1024.png')">
          <div class="carousel-caption d-none d-md-block">
            <h3></h3>
         
          </div>
        </div>
     
        <div class="carousel-item" style="background-image: url('https://uc.udn.com.tw/photo/2020/11/05/0/9020971.jpg')">
          <div class="carousel-caption d-none d-md-block">
            <h3></h3>
            <p></p>
          </div>
        </div>
        
<%--         <div class="systemLOGO" style="position:absolute;top:0;left:0"><img src="${pageContext.request.contextPath}/images/fourmLOGO.png" class="systemIMG"></div> --%>
       
        
      </div>
      <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
      </a>
      <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="sr-only">Next</span>

      </a>
    </div>
  

	<h1 class="mt-4 mb-3">
	討論區首頁
<%-- <img src="${pageContext.request.contextPath}/images/fourmLOGO.png" class="systemIMG" style="width:300px"> --%>
    </h1>
<%-- <div class="systemLOGO"><img src="${pageContext.request.contextPath}/images/fourmLOGO.png" class="systemIMG"></div> --%>
  
	<form>
	<input type="hidden" id="sAccount" value="${user.sAccount}">
<!-- 	ajax要用的 -->
  		<div style="float:left">
	  		<input type="hidden" id="category" value="${category}">
	  		<input type="hidden" id="search" value="${search}">
			<a class="btn btn-outline-dark category categoryChoose">全部</a>
			<a class="btn btn-outline-dark category">閒聊</a>
			<a class="btn btn-outline-dark category">公告</a>
			<a class="btn btn-outline-dark category">討論</a>
			<a class="btn btn-outline-dark category">問題</a>
			<a class="btn btn-outline-dark category">情報</a>
			<a class="btn btn-outline-dark category">攻略</a>
		</div>	
		<div class="input-group" style="margin-top:15px;width:400px">
			<h3> 標題:&nbsp;</h3>
			<input type="text" id="sSearch" class="form-control" name="sSearch">
			<span class="input-group-append">
				<input type="button" id="submit" class="btn btn-secondary"
					 name="select" value="搜尋">
			</span>
		</div>
  		
	</form>
	<a class="btn btn-outline-dark hot hotChoose" id="new">最新</a>
	<a class="btn btn-outline-dark hot" id="hot">熱門</a>
	<hr>
	<div id="point">
		<div class="alert alert-success" style="background-color:rgba(212, 237, 218, 0.8);color:black">
			<div class="row" style="font-size:1.2em;text-align:center">
				<div class="col-md-1" style="border-right:1px solid rgba(0, 0, 0, 0.1)">
					子版
				</div>
				<div class="col-md-8" style="border-right:1px solid rgba(0, 0, 0, 0.1)">
					標題
				</div>
				<div class="col-md-1" style="border-right:1px solid rgba(0, 0, 0, 0.1)">
					樓主
				</div>
				<div class="col-md-1" style="border-right:1px solid rgba(0, 0, 0, 0.1)">
					時間
				</div>
				<div class="col-md-1">
					留言數
				</div>
			</div>
		</div>
		<c:forEach var="forum" items="${lForumList}">
			<div class="alert alert-light" style="background-color:rgba(255, 255, 255, 0.8);color:black">
				<div class="row">
					<div class="col-md-1" style="border-right:1px solid rgba(0, 0, 0, 0.1);text-align:center">
						<h3>${forum[1]}</h3>
					</div>
					<div class="col-md-8" style="border-right:1px solid rgba(0, 0, 0, 0.1)">
						<a class="enterDetail" href="<c:url value='/forum/Detail/${forum[0]}'/>">
							<div>
								<h3>${forum[2]}</h3>
							</div>
						</a>
					</div>
					<div class="col-md-1" style="border-right:1px solid rgba(0, 0, 0, 0.1);padding:0;text-align:center">
						${forum[5]}
					</div>
					<div class="col-md-1" style="border-right:1px solid rgba(0, 0, 0, 0.1);padding:0;text-align:center">
						${forum[3]}<br>${forum[4]}
					</div>
					<div class="col-md-1" style="padding:0;text-align:center;font-size:1.2em">
						${forum[7]}
					</div>
				</div>
			</div>
			
			
			
			
<!-- 			<div class="row"> -->
<!-- 				<div class="col-md-10" style="border-right:1px solid rgba(0, 0, 0, 0.1);padding:0"> -->
<%-- 					<a class="enterDetail" href="<c:url value='/forum/Detail/${forum[0]}'/>"> --%>
<!-- 						<div> -->
<%-- 							<h3>[${forum[1]}]${forum[2]}</h3> --%>
<%-- 							<span>發文/更改時間: ${forum[3]} ${forum[4]}</span><br>  --%>
<%-- 							<span>樓主: ${forum[5]}</span><br>  --%>
<%-- 							<span>留言數: ${forum[7]}</span> --%>
<!-- 						</div> -->
<!-- 					</a> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 			<hr> -->
		</c:forEach>
	</div>
	</div>
	<%@ include file="../Foot.jsp"%>
	<script>
	$(function(){
		
		let category = "";
		let search = "";
		let scrollInt = 0;
		let hot = "";
		//返回首頁要帶進的category值
		if($("#category").val() != ""){
			$.each($(".category") ,function(key,value){
// 				console.log(value.innerHTML);
				if(value.innerHTML == $("#category").val()){
					$(".category").removeClass("categoryChoose");
					$(this).addClass("categoryChoose");
					$("#sSearch").val("").attr("placeholder","在" + $(this).text() + "中搜尋");
					category = "and sCategory = '" + $("#category").val() +"'";
					return false;
				}
			});
		}
		
		if($("#search").val() != ""){
			$("#sSearch").val($("#search").val());
			search = $("#search").val();
		}

		$("#submit").on("click",function(){
			search = $("#sSearch").val();
			scrollInt = 0;
			doAjax(category, search, hot, scrollInt);		
		});		
		
		$(".category").on("click", function(){
			$(".category").removeClass("categoryChoose");
			$(this).addClass("categoryChoose");
			category = "and sCategory = '" + $(this).text() +"'";
			search = "";
			scrollInt = 0;
			$("#sSearch").val("").attr("placeholder","在" + $(this).text() + "中搜尋");
			if($(this).text() == "全部"){
				category = "";
				$("#sSearch").val("").attr("placeholder","");
			}
// 			console.log(category);
			doAjax(category, search, hot, scrollInt);
		});
		
		$("#new").on("click",function(){
			$(".hot").removeClass("hotChoose");
			$(this).addClass("hotChoose");
			scrollInt = 0;
			hot = "";
			doAjax(category, search, hot, scrollInt);		
		});	
		
		$("#hot").on("click",function(){
			$(".hot").removeClass("hotChoose");
			$(this).addClass("hotChoose");
			scrollInt = 0;
			hot = "c desc,";		
			doAjax(category, search, hot, scrollInt);
		});
		
		function doAjax(category, search, hot, scrollInt){
			$.ajax({
				type:"post",
				url:"<c:url value='/forum/HotAjax'/>",
				dataType:"json",
				data:{"sCategory" : category,
					"sSearch" : search,
					"sHot" : hot,
					"scrollInt": scrollInt
				},
				success:function (result) {	
					$("#point").empty();
					if(result.length == 0){
						$("#point").append("<p>無貼文符合您搜尋的條件</p>")							
					}else{
						$("#point").append("<div class=\"alert alert-success\" style=\"background-color:rgba(212, 237, 218, 0.8);color:black\">"
						+"<div class=\"row\" style=\"font-size:1.2em;text-align:center\">"
						+"<div class=\"col-md-1\" style=\"border-right:1px solid rgba(0, 0, 0, 0.1)\">子版</div>"
						+"<div class=\"col-md-8\" style=\"border-right:1px solid rgba(0, 0, 0, 0.1)\">標題</div>"
						+"<div class=\"col-md-1\" style=\"border-right:1px solid rgba(0, 0, 0, 0.1)\">樓主</div>"
						+"<div class=\"col-md-1\" style=\"border-right:1px solid rgba(0, 0, 0, 0.1)\">時間</div>"
						+"<div class=\"col-md-1\">留言數</div>"
						+"</div>"
						+"</div>");
					}
					$.each(result ,function(key,value){
						$("#point").append("<div class=\"alert alert-light\" style=\"background-color:rgba(255, 255, 255, 0.8);color:black\">"
												+"<div class=\"row\">"
												+"<div class=\"col-md-1\" style=\"border-right:1px solid rgba(0, 0, 0, 0.1);text-align:center\">"
												+"<h3>" + value[1] + "</h3>"
												+"</div>"
												+"<div class=\"col-md-8\" style=\"border-right:1px solid rgba(0, 0, 0, 0.1)\">"
												+"<a class=\"enterDetail\" href=\"<c:url value='/forum/Detail/" + value[0] + "'/>\">"
												+"<div>"
												+"<h3>" + value[2] + "</h3>"
												+"</div>"
												+"</a>"
												+"</div>"
												+"<div class=\"col-md-1\" style=\"border-right:1px solid rgba(0, 0, 0, 0.1);padding:0;text-align:center\">"
												+ value[5]
												+"</div>"
												+"<div class=\"col-md-1\" style=\"border-right:1px solid rgba(0, 0, 0, 0.1);padding:0;text-align:center\">"
												+ $.format.date(new Date(value[3]), 'yyyy-MM-dd') + "<br>" + value[4]
												+"</div>"
												+"<div class=\"col-md-1\" style=\"padding:0;text-align:center;font-size:1.2em\">"
												+ value[7]
												+"</div>"
												+"</div>"
												+"</div>");
						
						
						
						
						
// 						$("#point").append("<div class=\"row\">"+
// 									"<div class=\"col-md-10\">"+
// 									"<a class=\"enterDetail\" href=\"<c:url value='/forum/Detail/" + value[0] + "'/>\">"+
// 									"<div>"+
// 									"<h3>[" + value[1] + "]" + value[2] + "</h3>"+
// 									"<span>發文/更改時間: " + $.format.date(new Date(value[3]), 'yyyy-MM-dd') + "&nbsp;" + value[4] + "</span><br>"+
// 									"<span>樓主: " + value[5] + "</span><br>"+
// 									"<span>留言數: " + value[7] + "</span>"+
// 									"</div>"+
// 									"</a>"+
// 									"</div>"+
// // 									button +
// 									"</div>"+
// 									"<hr>");
					});
	            },
	            error:function (err) {
	                alert("發生錯誤!");
	            }		
			});
		}
		
		let timer
		$(window).on("scroll",function(){
			window.clearTimeout(timer);
		    timer = window.setTimeout(function() {
					console.log($(this).scrollTop());	

				if($(window).scrollTop() > $(document).height() - 1100){
// 					console.log("pageHeight: " + $("body").height());
// 					console.log("documentHeight: " + $(document).height());
// 					console.log("下個觸發點: " + ($(document).height() - 1100));
					scrollInt += 1;
// 					console.log("scrollInt: " + scrollInt);
					
					$.ajax({
						type:"post",
						url:"<c:url value='/forum/HotAjax'/>",
						dataType:"json",
						data:{"sCategory" : category,
							"sSearch" : search,
							"sHot" : hot,
							"scrollInt": scrollInt
						},
						success:function (result) {	
							$.each(result ,function(key,value){
								$("#point").append("<div class=\"alert alert-light\" style=\"background-color:rgba(255, 255, 255, 0.8);color:black\">"
										+"<div class=\"row\">"
										+"<div class=\"col-md-1\" style=\"border-right:1px solid rgba(0, 0, 0, 0.1);text-align:center\">"
										+"<h3>" + value[1] + "</h3>"
										+"</div>"
										+"<div class=\"col-md-8\" style=\"border-right:1px solid rgba(0, 0, 0, 0.1)\">"
										+"<a class=\"enterDetail\" href=\"<c:url value='/forum/Detail/" + value[0] + "'/>\">"
										+"<div>"
										+"<h3>" + value[2] + "</h3>"
										+"</div>"
										+"</a>"
										+"</div>"
										+"<div class=\"col-md-1\" style=\"border-right:1px solid rgba(0, 0, 0, 0.1);padding:0;text-align:center\">"
										+ value[5]
										+"</div>"
										+"<div class=\"col-md-1\" style=\"border-right:1px solid rgba(0, 0, 0, 0.1);padding:0;text-align:center\">"
										+ $.format.date(new Date(value[3]), 'yyyy-MM-dd') + "<br>" + value[4]
										+"</div>"
										+"<div class=\"col-md-1\" style=\"padding:0;text-align:center;font-size:1.2em\">"
										+ value[7]
										+"</div>"
										+"</div>"
										+"</div>");
							});
			            },
			            error:function (err) {
			                alert("發生錯誤!");
			            }		
					});
					
					
				}
	     	}, 100);
		});
		
		
		$("#point").on("click",".enterDetail",function(){
			this.target = "_blank";
		});	
		
	});
	</script>
</body>
</html>
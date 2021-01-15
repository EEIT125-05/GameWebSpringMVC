<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="../Link.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>賽事 - GameBar</title>
<%-- <script src="${pageContext.request.contextPath}/js/ContestIndex.js"></script> --%>
<style>
	.fast{
		margin-bottom:8px;
	}

</style>
</head>


<body>
<%@ include file="../Header.jsp" %>

<div class="container">

<h1 class="mt-4 mb-3">
<!-- 賽事首頁 -->
<!--       <small>XXXXX</small> -->
    </h1>

    <ol class="breadcrumb">
      <li class="breadcrumb-item">
        <a href="<c:url value='/'/>">Home</a>
      </li>
      <li class="breadcrumb-item active">賽事</li>
    </ol>

		<input type="text" id="sSearch" class="form-control" name="sSearch" placeholder="依名稱、地點搜尋" style="width:25%;display:inline">
		<label>遊戲</label>
		<select id="sGame" class="form-control" name="sGame"
				style="width:130px;display:inline">
	    	<option value="">全部</option>
			<c:forEach var="sGame" items="${lGameList}">
            	<option value="${sGame}">${sGame}</option>
			</c:forEach>
           </select>
		<label>時程</label>
		<select id="sSignDate" class="form-control" name="sSignDate"
				style="width:130px;display:inline">
	    	<option value="">全部</option>
	    	<option value="and dSignStart > getdate()">未開始報名</option>
	    	<option value="and dSignStart <= getdate() and dateadd(day,-1,getdate()) <= dSignEnd">已開始報名</option>
	    	<option value="and dSignEnd < dateadd(day,-1,getdate())">已截止報名</option>
        </select>			
		<label>報名狀況</label>
		<select id="sSign" class="form-control" name="sSign"
				style="width:100px;display:inline">
	    	<option value="">全部</option>
	    	<option value="nofull">未額滿</option>
	    	<option value="full">已額滿</option>
        </select>			
	    <button id="submit" class="btn btn-secondary" name="select" style="margin-bottom:5px">查詢</button>
	    <br>
	    <label>快速選擇</label>
	    <button class="btn btn-primary fast game" value="英雄聯盟">英雄聯盟</button>
	    <button class="btn btn-primary fast game" value="魔物獵人">魔物獵人</button>
	    <button class="btn btn-primary fast game" value="鬥陣特攻">鬥陣特攻</button>
	    <button class="btn btn-primary fast game" value="傳說對決">傳說對決</button>
	    <button class="btn btn-primary fast game" value="絕地求生">絕地求生</button>
	    <button class="btn btn-primary fast game" value="跑跑卡丁車">跑跑卡丁車</button>
	    <button class="btn btn-primary fast game" value="爐石戰記">爐石戰記</button>
	    <button class="btn btn-primary fast game" value="星海爭霸">星海爭霸</button>
	    <br>
	    <button class="btn btn-primary fast compSystem" value="and iTeamMemberCount = 1">單人賽</button>
	    <button class="btn btn-primary fast compSystem" value="and iTeamMemberCount != 1">團體賽</button>
	    <button class="btn btn-primary fast compSystem" value="and sRematchMode = 'knockout'">淘汰賽</button>
	    <button class="btn btn-primary fast compSystem" value="and sRematchMode = 'ground'">循環賽</button>
	    <button class="btn btn-primary fast compSystem" value="and sRematchMode = 'free'">自由對戰</button>
	    <button class="btn btn-primary fast compSystem" value="and sPreliminary != 'none'">有預賽</button>
	    <button class="btn btn-primary fast compSystem" value="and sPreliminary = 'none'">無預賽</button>
	    
	    
	    
	    
		<hr>
		
	<div id="point">
	
		<c:if test="${empty lContestList}">
			<p>目前無資料</p>
		</c:if>
	
		<c:forEach var="cContest" items="${lContestList}">

				<div class="row">
					<div class="col-md-7">
						<a href="<c:url value='/contest/Information?contestNo=${cContest.iNo}'/>"> 
							<img class="img-fluid rounded mb-3 mb-md-0"
								src="<c:url value='/contest/ImageLoading?iNo=${cContest.iNo}'/>" alt="">
						</a>
					</div>
					<div class="col-md-5">
						<h3 style="display:inline">${cContest.sName}</h3>
							<jsp:useBean id="nowDate" class="java.util.Date"/>
							<fmt:formatDate var="today" pattern="yyyy-MM-dd" value="${nowDate}" />
							<c:choose>
								<c:when test="${cContest.dSignStart > today}">
									<span style="color:blue">(報名未開始)</span>
								</c:when>
								<c:otherwise>
									<c:choose>
										<c:when test="${cContest.dSignEnd < today}">
											<span style="color:red">(報名已截止)</span>
										</c:when>
										<c:otherwise>
											<span style="color:green">(報名開放中)</span>
										</c:otherwise>
									</c:choose>
								</c:otherwise>
							</c:choose>
						<hr>
						<p>比賽遊戲: ${cContest.sGame}</p>
						
				    	<c:choose>
				    		<c:when test="${cContest.iTeamMemberCount == 1}">
				    			<c:set var="iTeamMemberCount" value="個人"/>
				    		</c:when>
				    		<c:otherwise>
				    			<c:set var="iTeamMemberCount" value="團體"/>
				    		</c:otherwise>
				    	</c:choose>
						<c:if test="${cContest.sRematchMode == 'knockout'}">
			    			<c:set var="sRematchMode" value="淘汰賽"/>
				    	</c:if>
				    	<c:if test="${cContest.sRematchMode == 'ground'}">
			    			<c:set var="sRematchMode" value="循環賽"/>
				    	</c:if>
				    	<c:if test="${cContest.sRematchMode == 'free'}">
			    			<c:set var="sRematchMode" value="自由對戰"/>
				    	</c:if>
				    	<c:choose>
				    		<c:when test="${cContest.sPreliminary == 'none'}">
				    			<c:set var="sPreliminary" value="無預賽"/>
				    		</c:when>
				    		<c:otherwise>
				    			<c:set var="sPreliminary" value="有預賽"/>
				    		</c:otherwise>
				    	</c:choose>
				    	
						<p>賽制: ${iTeamMemberCount}-${sRematchMode}-${sPreliminary}</p>
						
						
						<p>報名日期: ${cContest.dSignStart}~${cContest.dSignEnd}</p>
						<fmt:formatDate var="sTime" value="${cContest.tTime}"
							pattern="yyyy-MM-dd HH:mm" />
						<p>比賽時間: ${sTime}</p>
						<p>比賽地點: ${cContest.sLocation}</p>
						<p>報名狀況:
							${fn:length(cContest.lParticipateBeans)}/${cContest.iPeople}</p>
						<a class="btn btn-primary"
							href="<c:url value='/contest/Information?contestNo=${cContest.iNo}'/>">詳細按鈕
							<span class="glyphicon glyphicon-chevron-right"></span>
						</a>
					</div>
				</div>

				<hr>

			</c:forEach>
	</div>
	
</div>
<%@ include file="../Foot.jsp" %>
<script>
$(function(){
	
	$("#point").on("click","a",function(){
		this.target = "_blank";
	});	
	
// 	$("#point").on("click","button",function(){
// 		let contestId = $(this).val();
// 		window.open("/GameWebSpringMVC/contest/Information?contestNo="+contestId,"_blank");
// 	});
	
	$("#submit").on("click",function(){
		$("#point").empty();
		scrollInt = 0;
		let xhr = new XMLHttpRequest();
		if(xhr != null){
			
			xhr.onreadystatechange = function(){
				if(xhr.readyState === 4){
					if(xhr.status === 200){
						console.log(JSON.parse(xhr.responseText));
						let type = xhr.getResponseHeader("Content-Type");
						if(type.indexOf("application/json") === 0){
							let obj = JSON.parse(xhr.responseText);
							if(obj.lContestList.length == 0){
								$("#point").append("<p>無比賽符合您搜尋的條件</p>");
							}
 							$.each(obj.lContestList,function(key, value){
 								
 								let subTitle;
 								let color;
 								let d = $.format.date(new Date(), 'yyyy-MM-dd');
 								let signStart = $.format.date(new Date(value.dSignStart), 'yyyy-MM-dd');
 								let signEnd = $.format.date(new Date(value.dSignEnd), 'yyyy-MM-dd');
//  								console.log("d: " + d);
//  								console.log("signStart: " + signStart);
//  								console.log("signEnd: " + signEnd);
 								if(d < signStart){
 									subTitle = "報名未開始";
 									color = "blue";
//  									console.log("報名未開始");
 								}else if(d >= signStart && d <= signEnd){
 									subTitle = "報名開放中";
 									color = "green";
//  									console.log("報名開放中");
 								}else{
 									subTitle = "報名已截止";
 									color = "red";
//  									console.log("報名已截止");
 								}
 								
 								let teamMemberCount;
 								let rematchMode;
 								let preliminary;
 								
 								if(value.iTeamMemberCount == 1){
 									teamMemberCount = "個人";
 								}else{
 									teamMemberCount = "團體";
 								}
 								
 								if(value.sRematchMode == "knockout"){
 									rematchMode = "淘汰賽";
 								}else if(value.sRematchMode == "ground"){
 									rematchMode = "循環賽";
 								}else if(value.sRematchMode == "free"){
 									rematchMode = "自由對戰";
 								}
 								
 								if(value.sPreliminary == "none"){
 									preliminary = "無預賽";
 								}else{
 									preliminary = "有預賽";
 								}
 								
 								
 								$("#point").append("<div class=\"row\">"
 												+"<div class=\"col-md-7\">"
 												+"<a href=\"<c:url value='/contest/Information?contestNo=" + value.iNo + "'/>\"> <img class=\"img-fluid rounded mb-3 mb-md-0\" "
 												+"src=\"<c:url value='/contest/ImageLoading?iNo=" + value.iNo + "'/>\" alt=\"\">"
 												+"</a>"
 												+"</div>"
 												+"<div class=\"col-md-5\">"
 												+"<h3 style=\"display:inline\">" + value.sName + "</h3><span style=\"color:" + color + "\">    (" + subTitle + ")</span>"
 												+"<hr>"
 												+"<p>比賽遊戲: " + value.sGame + "</p>"
 												+"<p>賽制: " + teamMemberCount + "-" + rematchMode + "-" + preliminary + "</p>"
 												+"<p>報名日期: " + $.format.date(new Date(value.dSignStart), 'yyyy-MM-dd') 
 															+ "~" + $.format.date(new Date(value.dSignEnd), 'yyyy-MM-dd') + "</p>"
 												+"<p>比賽時間: " + $.format.date(new Date(value.tTime), 'yyyy-MM-dd HH:mm') + "</p>"
 												+"<p>比賽地點: " + value.sLocation + "</p>"
 												+"<p>報名狀況: 	" + value.lParticipateBeans.length + "/" + value.iPeople + "</p>"
 												+"<a class=\"btn btn-primary\" href=\"<c:url value='/contest/Information?contestNo=" + value.iNo + "'/>\">詳細按鈕"
 												+"<span class=\"glyphicon glyphicon-chevron-right\"></span>"
 												+"</a>"
 												+"</div>"
 												+"</div>"
 												+"<hr>");
								});
						}
					}else{
						alert("發生錯誤: readyState= " +xhr.readyState + " status= "+ xhr.status);
					}
				}
			}
			
			xhr.open("POST", "<c:url value='/contest/IndexAjax'/>",true);
			xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
			xhr.send("sSearch=" + $("#sSearch").val() +
					"&sGame=" + $("#sGame").val() +
					"&sSignDate=" + $("#sSignDate").val()+
					"&sSign=" + $("#sSign").val()+
					"&sCompSystem=");
		}else{
			alert("您的瀏覽器不支援Ajax");
		}
	});
	
// 	console.log("pageHeight: " + $("body").height());
// 	console.log("windowHeight: " + $(window).height());
// 	console.log("documentHeight: " + $(document).height());
// 	console.log("觸發點: " + ($(document).height() - 1000));
	
	
	let timer
	let scrollInt = 0;
	let game = "";

	$("#sGame").on("change", function(){
		game = $(this).val();
	});
	
	$(".game").on("click", function(){
		game = $(this).val();
		compSystem = "";
		scrollInt = 0;
		$("#sSearch").val("");
		$("#sGame").val("");
		$("#sSignDate").val("");
		$("#sSign").val("");
		
		$("#point").empty();
		$.ajax({
			type:"post",
			url:"<c:url value='/contest/IndexAjax'/>",
			dataType:"json",
			data:{"scrollInt": scrollInt,
				"sSearch": $("#sSearch").val(),
				"sGame": game,
				"sSignDate": $("#sSignDate").val(),
				"sSign": $("#sSign").val(),
				"sCompSystem": compSystem
			},
			success: function(result){
				if(result.lContestList.length == 0){
					$("#point").append("<p>無比賽符合您搜尋的條件</p>");
				}
				$.each(result.lContestList,function(key, value){
					
					let subTitle;
					let color;
					let d = $.format.date(new Date(), 'yyyy-MM-dd');
					let signStart = $.format.date(new Date(value.dSignStart), 'yyyy-MM-dd');
					let signEnd = $.format.date(new Date(value.dSignEnd), 'yyyy-MM-dd');
// 					console.log("d: " + d);
// 					console.log("signStart: " + signStart);
// 					console.log("signEnd: " + signEnd);
					if(d < signStart){
						subTitle = "報名未開始";
						color = "blue";
// 						console.log("報名未開始");
					}else if(d >= signStart && d <= signEnd){
						subTitle = "報名開放中";
						color = "green";
// 						console.log("報名開放中");
					}else{
						subTitle = "報名已截止";
						color = "red";
// 						console.log("報名已截止");
					}
					
					let teamMemberCount;
					let rematchMode;
					let preliminary;
					
					if(value.iTeamMemberCount == 1){
						teamMemberCount = "個人";
					}else{
						teamMemberCount = "團體";
					}
					
					if(value.sRematchMode == "knockout"){
						rematchMode = "淘汰賽";
					}else if(value.sRematchMode == "ground"){
						rematchMode = "循環賽";
					}else if(value.sRematchMode == "free"){
						rematchMode = "自由對戰";
					}
					
					if(value.sPreliminary == "none"){
						preliminary = "無預賽";
					}else{
						preliminary = "有預賽";
					}
					
					
					$("#point").append("<div class=\"row\">"
									+"<div class=\"col-md-7\">"
									+"<a href=\"<c:url value='/contest/Information?contestNo=" + value.iNo + "'/>\"> <img class=\"img-fluid rounded mb-3 mb-md-0\" "
									+"src=\"<c:url value='/contest/ImageLoading?iNo=" + value.iNo + "'/>\" alt=\"\">"
									+"</a>"
									+"</div>"
									+"<div class=\"col-md-5\">"
									+"<h3 style=\"display:inline\">" + value.sName + "</h3><span style=\"color:" + color + "\">    (" + subTitle + ")</span>"
									+"<hr>"
									+"<p>比賽遊戲: " + value.sGame + "</p>"
									+"<p>賽制: " + teamMemberCount + "-" + rematchMode + "-" + preliminary + "</p>"
									+"<p>報名日期: " + $.format.date(new Date(value.dSignStart), 'yyyy-MM-dd') 
												+ "~" + $.format.date(new Date(value.dSignEnd), 'yyyy-MM-dd') + "</p>"
									+"<p>比賽時間: " + $.format.date(new Date(value.tTime), 'yyyy-MM-dd HH:mm') + "</p>"
									+"<p>比賽地點: " + value.sLocation + "</p>"
									+"<p>報名狀況: 	" + value.lParticipateBeans.length + "/" + value.iPeople + "</p>"
									+"<a class=\"btn btn-primary\" href=\"<c:url value='/contest/Information?contestNo=" + value.iNo + "'/>\">詳細按鈕"
									+"<span class=\"glyphicon glyphicon-chevron-right\"></span>"
									+"</a>"
									+"</div>"
									+"</div>"
									+"<hr>");
					});
			},
			error: function(err){
				alert("發生錯誤!");	
			}
		});
		
	});
	
	let compSystem = "";
	$(".compSystem").on("click", function(){
		compSystem = $(this).val();
		game = "";
		scrollInt = 0;
		$("#sSearch").val("");
		$("#sGame").val("");
		$("#sSignDate").val("");
		$("#sSign").val("");
		
		$("#point").empty();
		$.ajax({
			type:"post",
			url:"<c:url value='/contest/IndexAjax'/>",
			dataType:"json",
			data:{"scrollInt": scrollInt,
				"sSearch": $("#sSearch").val(),
				"sGame": game,
				"sSignDate": $("#sSignDate").val(),
				"sSign": $("#sSign").val(),
				"sCompSystem": compSystem
			},
			success: function(result){
				if(result.lContestList.length == 0){
					$("#point").append("<p>無比賽符合您搜尋的條件</p>");
				}
				$.each(result.lContestList,function(key, value){
					let subTitle;
					let color;
					let d = $.format.date(new Date(), 'yyyy-MM-dd');
					let signStart = $.format.date(new Date(value.dSignStart), 'yyyy-MM-dd');
					let signEnd = $.format.date(new Date(value.dSignEnd), 'yyyy-MM-dd');
// 					console.log("d: " + d);
// 					console.log("signStart: " + signStart);
// 					console.log("signEnd: " + signEnd);
					if(d < signStart){
						subTitle = "報名未開始";
						color = "blue";
// 						console.log("報名未開始");
					}else if(d >= signStart && d <= signEnd){
						subTitle = "報名開放中";
						color = "green";
// 						console.log("報名開放中");
					}else{
						subTitle = "報名已截止";
						color = "red";
// 						console.log("報名已截止");
					}
					
					let teamMemberCount;
					let rematchMode;
					let preliminary;
					
					if(value.iTeamMemberCount == 1){
						teamMemberCount = "個人";
					}else{
						teamMemberCount = "團體";
					}
					
					if(value.sRematchMode == "knockout"){
						rematchMode = "淘汰賽";
					}else if(value.sRematchMode == "ground"){
						rematchMode = "循環賽";
					}else if(value.sRematchMode == "free"){
						rematchMode = "自由對戰";
					}
					
					if(value.sPreliminary == "none"){
						preliminary = "無預賽";
					}else{
						preliminary = "有預賽";
					}
					
					
					$("#point").append("<div class=\"row\">"
									+"<div class=\"col-md-7\">"
									+"<a href=\"<c:url value='/contest/Information?contestNo=" + value.iNo + "'/>\"> <img class=\"img-fluid rounded mb-3 mb-md-0\" "
									+"src=\"<c:url value='/contest/ImageLoading?iNo=" + value.iNo + "'/>\" alt=\"\">"
									+"</a>"
									+"</div>"
									+"<div class=\"col-md-5\">"
									+"<h3 style=\"display:inline\">" + value.sName + "</h3><span style=\"color:" + color + "\">    (" + subTitle + ")</span>"
									+"<hr>"
									+"<p>比賽遊戲: " + value.sGame + "</p>"
									+"<p>賽制: " + teamMemberCount + "-" + rematchMode + "-" + preliminary + "</p>"
									+"<p>報名日期: " + $.format.date(new Date(value.dSignStart), 'yyyy-MM-dd') 
												+ "~" + $.format.date(new Date(value.dSignEnd), 'yyyy-MM-dd') + "</p>"
									+"<p>比賽時間: " + $.format.date(new Date(value.tTime), 'yyyy-MM-dd HH:mm') + "</p>"
									+"<p>比賽地點: " + value.sLocation + "</p>"
									+"<p>報名狀況: 	" + value.lParticipateBeans.length + "/" + value.iPeople + "</p>"
									+"<a class=\"btn btn-primary\" href=\"<c:url value='/contest/Information?contestNo=" + value.iNo + "'/>\">詳細按鈕"
									+"<span class=\"glyphicon glyphicon-chevron-right\"></span>"
									+"</a>"
									+"</div>"
									+"</div>"
									+"<hr>");
					});
			},
			error: function(err){
				alert("發生錯誤!");	
			}
		});
		
	});
	
	
	
	
	
	$(window).on("scroll",function(){
		window.clearTimeout(timer);
	    timer = window.setTimeout(function() {
// 				console.log($(this).scrollTop());	

			if($(window).scrollTop() > $(document).height() - 1000){
// 				console.log("pageHeight: " + $("body").height());
// 				console.log("documentHeight: " + $(document).height());
// 				console.log("下個觸發點: " + ($(document).height() - 1000));
				scrollInt += 1;
// 				console.log("scrollInt: " + scrollInt);
				
				$.ajax({
					type:"post",
					url:"<c:url value='/contest/IndexAjax'/>",
					dataType:"json",
					data:{"scrollInt": scrollInt,
						"sSearch": $("#sSearch").val(),
						"sGame": game,
						"sSignDate": $("#sSignDate").val(),
						"sSign": $("#sSign").val(),
						"sCompSystem": compSystem
					},
					success: function(result){ 
						$.each(result.lContestList,function(key, value){
							
							let subTitle;
							let color;
							let d = $.format.date(new Date(), 'yyyy-MM-dd');
							let signStart = $.format.date(new Date(value.dSignStart), 'yyyy-MM-dd');
							let signEnd = $.format.date(new Date(value.dSignEnd), 'yyyy-MM-dd');
// 							console.log("d: " + d);
// 							console.log("signStart: " + signStart);
// 							console.log("signEnd: " + signEnd);
							if(d < signStart){
								subTitle = "報名未開始";
								color = "blue";
// 								console.log("報名未開始");
							}else if(d >= signStart && d <= signEnd){
								subTitle = "報名開放中";
								color = "green";
// 								console.log("報名開放中");
							}else{
								subTitle = "報名已截止";
								color = "red";
// 								console.log("報名已截止");
							}
							
							let teamMemberCount;
							let rematchMode;
							let preliminary;
							
							if(value.iTeamMemberCount == 1){
								teamMemberCount = "個人";
							}else{
								teamMemberCount = "團體";
							}
							
							if(value.sRematchMode == "knockout"){
								rematchMode = "淘汰賽";
							}else if(value.sRematchMode == "ground"){
								rematchMode = "循環賽";
							}else if(value.sRematchMode == "free"){
								rematchMode = "自由對戰";
							}
							
							if(value.sPreliminary == "none"){
								preliminary = "無預賽";
							}else{
								preliminary = "有預賽";
							}
							
							
							$("#point").append("<div class=\"row\">"
											+"<div class=\"col-md-7\">"
											+"<a href=\"<c:url value='/contest/Information?contestNo=" + value.iNo + "'/>\"> <img class=\"img-fluid rounded mb-3 mb-md-0\" "
											+"src=\"<c:url value='/contest/ImageLoading?iNo=" + value.iNo + "'/>\" alt=\"\">"
											+"</a>"
											+"</div>"
											+"<div class=\"col-md-5\">"
											+"<h3 style=\"display:inline\">" + value.sName + "</h3><span style=\"color:" + color + "\">    (" + subTitle + ")</span>"
											+"<hr>"
											+"<p>比賽遊戲: " + value.sGame + "</p>"
											+"<p>賽制: " + teamMemberCount + "-" + rematchMode + "-" + preliminary + "</p>"
											+"<p>報名日期: " + $.format.date(new Date(value.dSignStart), 'yyyy-MM-dd') 
														+ "~" + $.format.date(new Date(value.dSignEnd), 'yyyy-MM-dd') + "</p>"
											+"<p>比賽時間: " + $.format.date(new Date(value.tTime), 'yyyy-MM-dd HH:mm') + "</p>"
											+"<p>比賽地點: " + value.sLocation + "</p>"
											+"<p>報名狀況: 	" + value.lParticipateBeans.length + "/" + value.iPeople + "</p>"
											+"<a class=\"btn btn-primary\" href=\"<c:url value='/contest/Information?contestNo=" + value.iNo + "'/>\">詳細按鈕"
											+"<span class=\"glyphicon glyphicon-chevron-right\"></span>"
											+"</a>"
											+"</div>"
											+"</div>"
											+"<hr>");
							});
					},
					error: function(err){
						alert("發生錯誤!");	
					}
				});
				
			}
     	}, 100);
	});
	
	
	
	
	
	
	
	
	
	

});
</script>
</body>
</html>
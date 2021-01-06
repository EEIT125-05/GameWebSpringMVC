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

</head>


<body>
<%@ include file="../Header.jsp" %>

<div class="container">

<h1 class="mt-4 mb-3">賽事首頁
<!--       <small>XXXXX</small> -->
    </h1>

    <ol class="breadcrumb">
      <li class="breadcrumb-item">
        <a href="<c:url value='/'/>">Home</a>
      </li>
      <li class="breadcrumb-item active">賽事</li>
    </ol>

		<label>依名稱搜尋: </label>
		<div class="input-group">
			<input type="text" id="sSearch" class="form-control" name="sSearch">
			<span class="input-group-append">
				<input type="button" id="submit" class="btn btn-secondary"
					 name="select" value="查詢">
			</span>
		</div>
		<label>進階條件: </label><br>
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
						<h3>${cContest.sName}</h3>
						<p>比賽遊戲: ${cContest.sGame}</p>
						<p>報名日期: ${cContest.dSignStart}~${cContest.dSignEnd}</p>
						<fmt:formatDate var="sTime" value="${cContest.tTime}"
							pattern="yyyy-MM-dd HH:mm" />
						<p>比賽時間: ${sTime}</p>
						<p>參加人數:
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
								$("#point").append("<div class=\"row\">"
													+"<div class=\"col-md-7\">"
													+"<a href=\"<c:url value='/contest/Information?contestNo=" + value.iNo + "'/>\"> <img class=\"img-fluid rounded mb-3 mb-md-0\" "
													+"src=\"<c:url value='/contest/ImageLoading?iNo=" + value.iNo + "'/>\" alt=\"\">"
													+"</a>"
													+"</div>"
													+"<div class=\"col-md-5\">"
													+"<h3>" + value.sName + "</h3>"
													+"<p>比賽遊戲: " + value.sGame + "</p>"
													+"<p>報名日期: " + $.format.date(new Date(value.dSignStart), 'yyyy-MM-dd') 
																+ "~" + $.format.date(new Date(value.dSignEnd), 'yyyy-MM-dd') + "</p>"
													+"<p>比賽時間: " + $.format.date(new Date(value.tTime), 'yyyy-MM-dd HH:mm') + "</p>"
													+"<p>參加人數: 	" + value.lParticipateBeans.length + "/" + value.iPeople + "</p>"
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
					"&sSign=" + $("#sSign").val());
		}else{
			alert("您的瀏覽器不支援Ajax");
		}
	});
	
	console.log("pageHeight: " + $("body").height());
	console.log("windowHeight: " + $(window).height());
	console.log("documentHeight: " + $(document).height());
	console.log("觸發點: " + ($(document).height() - 1000));
	
	
	let timer
	let scrollInt = 0;
	$(window).on("scroll",function(){
		window.clearTimeout(timer);
	    timer = window.setTimeout(function() {
				console.log($(this).scrollTop());	

			if($(window).scrollTop() > $(document).height() - 1000){
				console.log("pageHeight: " + $("body").height());
				console.log("documentHeight: " + $(document).height());
				console.log("下個觸發點: " + ($(document).height() - 1000));
				scrollInt += 1;
				console.log("scrollInt: " + scrollInt);
				
				$.ajax({
					type:"post",
					url:"<c:url value='/contest/IndexAjax'/>",
					dataType:"json",
					data:{"scrollInt": scrollInt,
						"sSearch": $("#sSearch").val(),
						"sGame": $("#sGame").val(),
						"sSignDate": $("#sSignDate").val(),
						"sSign": $("#sSign").val()
					},
					success: function(result){
						$.each(result.lContestList,function(key, value){
							$("#point").append("<div class=\"row\">"
												+"<div class=\"col-md-7\">"
												+"<a href=\"<c:url value='/contest/Information?contestNo=" + value.iNo + "'/>\"> <img class=\"img-fluid rounded mb-3 mb-md-0\" "
												+"src=\"<c:url value='/contest/ImageLoading?iNo=" + value.iNo + "'/>\" alt=\"\">"
												+"</a>"
												+"</div>"
												+"<div class=\"col-md-5\">"
												+"<h3>" + value.sName + "</h3>"
												+"<p>比賽遊戲: " + value.sGame + "</p>"
												+"<p>報名日期: " + $.format.date(new Date(value.dSignStart), 'yyyy-MM-dd') 
															+ "~" + $.format.date(new Date(value.dSignEnd), 'yyyy-MM-dd') + "</p>"
												+"<p>比賽時間: " + $.format.date(new Date(value.tTime), 'yyyy-MM-dd HH:mm') + "</p>"
												+"<p>參加人數: 	" + value.lParticipateBeans.length + "/" + value.iPeople + "</p>"
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
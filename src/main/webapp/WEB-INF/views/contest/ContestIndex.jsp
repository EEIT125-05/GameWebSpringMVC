<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="../Link.jsp" %>
<%
request.setCharacterEncoding("UTF-8");
response.setContentType("text/html;charset=UTF-8");
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ContestIndex</title>
<%-- <script src="${pageContext.request.contextPath}/js/ContestIndex.js"></script> --%>
</head>
<body>
<%@ include file="../Header.jsp" %>

		<label>依名稱搜尋: </label> 
			<input id="sSearch" type="text" name="sSearch">
        <label>進階條件: </label>
		<label>遊戲</label>
			<select id="sGame" name="sGame">
		    	<option value="">全部</option>
				<c:forEach var="sGame" items="${lGameList}">
	            	<option value="${sGame}">${sGame}</option>
				</c:forEach>
            </select>
		<label>時程</label>
			<select id="sSignDate" name="sSignDate">
		    	<option value="">全部</option>
		    	<option value="and dSignStart > getdate()">未開始報名</option>
		    	<option value="and dSignStart <= getdate() and dateadd(day,-1,getdate()) <= dSignEnd">已開始報名</option>
		    	<option value="and dSignEnd < dateadd(day,-1,getdate())">已截止報名</option>
	        </select>			
		<label>報名狀況</label>
			<select id="sSign" name="sSign">
		    	<option value="">全部</option>
		    	<option value="nofull">未額滿</option>
		    	<option value="full">已額滿</option>
	        </select>			
		<input type="button" id="submit" name="select" value="查詢">

 <h1 class="mt-4 mb-3">賽事
      <small>XXXXX</small>
    </h1>

    <ol class="breadcrumb">
      <li class="breadcrumb-item">
        <a href="<c:url value='/'/>">Home</a>
      </li>
      <li class="breadcrumb-item active">賽事</li>
    </ol>


	<div id="point">
	
	
		<c:if test="${empty lContestList}">
			<p>目前無資料</p>
		</c:if>
	
		<c:forEach var="cContest" items="${lContestList}">
		
		<div class="row">
      <div class="col-md-7">
        <a href="#">
          <img class="img-fluid rounded mb-3 mb-md-0" src="http://placehold.it/700x300" alt="">
        </a>
      </div>
      <div class="col-md-5">
        <h3>${cContest.sName}</h3>
        <p>比賽遊戲: ${cContest.sGame}</p>
        <p>報名日期: ${cContest.dSignStart}~${cContest.dSignEnd}</p>
        	<fmt:formatDate var="sTime" value="${cContest.tTime}" pattern="yyyy-MM-dd HH:mm"/>
        <p>比賽時間: ${sTime}</p>
        <p>參加人數: ${fn:length(cContest.lParticipateBeans)}/${cContest.iPeople}</p>
        <a class="btn btn-primary" href="<c:url value='/contest/Information?contestNo=${cContest.iNo}'/>">詳細按鈕
          <span class="glyphicon glyphicon-chevron-right"></span>
        </a>
      </div>
    </div>
    
    <hr>
		
		</c:forEach>
	</div>
	
	<ul class="pagination justify-content-center">
      <li class="page-item">
        <a class="page-link" href="#" aria-label="Previous">
          <span aria-hidden="true">&laquo;</span>
          <span class="sr-only">Previous</span>
        </a>
      </li>
      <li class="page-item">
        <a class="page-link" href="#">1</a>
      </li>
      <li class="page-item">
        <a class="page-link" href="#">2</a>
      </li>
      <li class="page-item">
        <a class="page-link" href="#">3</a>
      </li>
      <li class="page-item">
        <a class="page-link" href="#" aria-label="Next">
          <span aria-hidden="true">&raquo;</span>
          <span class="sr-only">Next</span>
        </a>
      </li>
    </ul>
	

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
								$("#point").append("<button type=\"submit\" name=\"contestNo\" value=" + value.iNo + 
										" style=\"border:2px solid red;background-color:transparent;margin:10px;padding:2px;text-align:left\">" + 
										"比賽名稱: " + value.sName + 
										" <br> " + 
										" 比賽遊戲: " + value.sGame + 
										" <br> " +  
										"報名日期: " + $.format.date(new Date(value.dSignStart), 'yyyy-MM-dd') + "~" + $.format.date(new Date(value.dSignEnd), 'yyyy-MM-dd') + 
										" <br> " + 
										"比賽時間: " + $.format.date(new Date(value.tTime), 'yyyy-MM-dd HH:mm') + 
										" <br> " +  
										"參加人數: " + value.lParticipateBeans.length + "/" + value.iPeople + 											
										"</button>");
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

});
</script>
</body>
</html>
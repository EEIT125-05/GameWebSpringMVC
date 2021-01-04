<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ include file="../Link.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ForumIndex</title>
<%-- <script src="${pageContext.request.contextPath}/js/ForumIndex.js"></script> --%>
<style>
th, tr, td {
	border: 2px solid red;
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
      <div class="carousel-inner" role="listbox" style="height:300px">
       
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
     
        <div class="carousel-item" style="background-image: url('http://placehold.it/900x300')">
          <div class="carousel-caption d-none d-md-block">
            <h3>111 </h3>
            <p>111111</p>
          </div>
        </div>
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
  

	<h1 class="mt-4 mb-3">討論區首頁
<!--       <small>XXXXX</small> -->
    </h1>
  
	<form>
  
<!-- 		<label>分類篩選: </label> <select id="sCategory" -->
<!-- 			name="sCategory"> -->
<!-- 			<option value="" selected>全部</option> -->
<!-- 			<option value="and sCategory = '閒聊'">閒聊</option> -->
<!-- 			<option value="and sCategory = '公告'">公告</option> -->
<!-- 			<option value="and sCategory = '討論'">討論</option> -->
<!-- 			<option value="and sCategory = '問題'">問題</option> -->
<!-- 			<option value="and sCategory = '情報'">情報</option> -->
<!-- 			<option value="and sCategory = '攻略'">攻略</option> -->
<!-- 		</select>  -->
		<a class="btn btn-primary"
							href="<c:url value='/contest/Information?contestNo=${cContest.iNo}'/>" style="margin-right:10px">全部
							<span class="glyphicon glyphicon-chevron-right"></span>
						</a><a class="btn btn-primary"
							href="<c:url value='/contest/Information?contestNo=${cContest.iNo}'/>" style="margin-right:10px">閒聊
							<span class="glyphicon glyphicon-chevron-right"></span>
						</a><a class="btn btn-primary"
							href="<c:url value='/contest/Information?contestNo=${cContest.iNo}'/>" style="margin-right:10px">公告
							<span class="glyphicon glyphicon-chevron-right"></span>
						</a><a class="btn btn-primary"
							href="<c:url value='/contest/Information?contestNo=${cContest.iNo}'/>" style="margin-right:10px">討論
							<span class="glyphicon glyphicon-chevron-right"></span>
						</a><a class="btn btn-primary"
							href="<c:url value='/contest/Information?contestNo=${cContest.iNo}'/>" style="margin-right:10px">問題
							<span class="glyphicon glyphicon-chevron-right"></span>
						</a><a class="btn btn-primary"
							href="<c:url value='/contest/Information?contestNo=${cContest.iNo}'/>" style="margin-right:10px">情報
							<span class="glyphicon glyphicon-chevron-right"></span>
						</a><a class="btn btn-primary"
							href="<c:url value='/contest/Information?contestNo=${cContest.iNo}'/>" style="margin-right:10px">攻略
							<span class="glyphicon glyphicon-chevron-right"></span>
						</a>
		<div class="input-group" style="margin-top:15px">
			<h4> 標題:&nbsp;</h4>
			<input type="text" id="sSearch" class="form-control" name="sSearch">
			<span class="input-group-append">
				<input type="button" id="submit" class="btn btn-secondary"
					 name="select" value="搜尋">
			</span>
		</div>
	</form>
	<a class="btn btn-primary"
							href="<c:url value='/contest/Information?contestNo=${cContest.iNo}'/>">熱門
							<span class="glyphicon glyphicon-chevron-right"></span>
						</a>
	<a class="btn btn-primary"
							href="<c:url value='/contest/Information?contestNo=${cContest.iNo}'/>">最新
							<span class="glyphicon glyphicon-chevron-right"></span>
						</a>
	<hr>
	<div id="point">
		<c:forEach var="forum" items="${lForumList}">
			<div class="row">
<%-- 				<a href="<c:url value='/forum/Detail/${forum.iNo}'/>" style="display:block"> --%>
					<div class="col-md-12">
						<h3>[${forum.sCategory}]${forum.sTitle}</h3>
						<span>發文/更改 時間: ${forum.dDate} ${forum.tTime}</span><br>
						<span>樓主:${forum.sAuthor}</span><br>
						<span>留言數: ${fn:length(forum.sReplyBeans)}</span>
					</div>
<!-- 				</a> -->
			</div>
			<hr>
		</c:forEach>
	</div>
	</div>
	<%@ include file="../Foot.jsp"%>
	<script>
	$(function(){
		$("#submit").on("click",function(){
			$.ajax({
				type:"post",
				url:"<c:url value='/forum/IndexAjax'/>",
				dataType:"json",
				data:{"sCategory" : $("#sCategory").val(),
					  "sSearch" : $("#sSearch").val()
				},
				success:function (result) {	
					$("#point").empty();
					if(result.length == 0){
						$("#point").append("<p>無貼文符合您搜尋的條件</p>")							
					}else{
						$("#point").append("<table style=\"border:2px solid red\">"+
									"<thead>"+
									"<tr><th>分類</th><th>標題</th><th>樓主</th><th>發文時間</th><th>留言數</th>"+
									"</tr>"+
									"</thead>"+
									"<tbody></tbody></table>");
					}
					$.each(result ,function(key,value){
						$("tbody").append("<tr><td>"+value.sCategory+"</td>"+
								"<td><a href=\"/GameWebSpringMVC/forum/Detail/"+value.iNo+"\">"+value.sTitle+"</a></td>"+
								"<td>"+value.sAuthor+"</td><td>"+$.format.date(new Date(value.dDate), 'yyyy-MM-dd')+" "+value.tTime+"</td>"+
								"<td>"+value.sReplyBeans.length+"</td></tr>");
					});
	            },
	            error:function (err) {
	                alert("發生錯誤!");
	            }		
			});							
		});		
		$("#point").on("click","a",function(){
			this.target = "_blank";
		});	
		
		$("#point").on("click","button",function(){
			let contestId = $(this).val();
			window.open("/GameWebSpringMVC/forum/Detail/"+contestId,"_blank");
		});
	});
	</script>
</body>
</html>
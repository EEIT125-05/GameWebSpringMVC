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

.categoryChoose{
	background-color:#0069d9;
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
     
        <div class="carousel-item" style="background-image: url('https://uc.udn.com.tw/photo/2020/11/05/0/9020971.jpg')">
          <div class="carousel-caption d-none d-md-block">
            <h3></h3>
            <p></p>
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
    </h1>
  
	<form>
  
		<a class="btn btn-primary category categoryChoose">全部</a>
		<a class="btn btn-primary category">閒聊</a>
		<a class="btn btn-primary category">公告</a>
		<a class="btn btn-primary category">討論</a>
		<a class="btn btn-primary category">問題</a>
		<a class="btn btn-primary category">情報</a>
		<a class="btn btn-primary category">攻略</a>
		
		<div class="input-group" style="margin-top:15px">
			<h3> 標題:&nbsp;</h3>
			<input type="text" id="sSearch" class="form-control" name="sSearch">
			<span class="input-group-append">
				<input type="button" id="submit" class="btn btn-secondary"
					 name="select" value="搜尋">
			</span>
		</div>
	</form>
	<a class="btn btn-primary">熱門</a>
	<a class="btn btn-primary">最新</a>
	<hr>
	<div id="point">
		<c:forEach var="forum" items="${lForumList}">
			<div class="row">
<%-- 				<a href="<c:url value='/forum/Detail/${forum.iNo}'/>" style="display:block"> --%>
					<div class="col-md-12">
						<h3>[${forum.sCategory}]${forum.sTitle}</h3>
						<span>發文/更改時間: ${forum.dDate} ${forum.tTime}</span><br>
						<span>樓主: ${forum.sAuthor}</span><br>
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
		let category = "";
		let search = "";
		
		$("#submit").on("click",function(){
			search = $("#sSearch").val();
			doAjax(category, search);		
		});		
		
		$(".category").on("click", function(){
			$(".category").removeClass("categoryChoose");
			$(this).addClass("categoryChoose");
			category = "and sCategory = '" + $(this).text() +"'";
			search = "";
			$("#sSearch").val("").attr("placeholder","在" + $(this).text() + "中搜尋");
			if($(this).text() == "全部"){
				category = "";
				$("#sSearch").val("").attr("placeholder","");
			}
// 			console.log(category);
			doAjax(category, search);
		});
		
		function doAjax(category, search){
			$.ajax({
				type:"post",
				url:"<c:url value='/forum/IndexAjax'/>",
				dataType:"json",
				data:{"sCategory" : category,
					"sSearch" : search
				},
				success:function (result) {	
					$("#point").empty();
					if(result.length == 0){
						$("#point").append("<p>無貼文符合您搜尋的條件</p>")							
					}
					$.each(result ,function(key,value){
						$("#point").append("<div class=\"row\">"+
									"<div class=\"col-md-12\">"+
									"<h3>[" + value.sCategory + "]" + value.sTitle + "</h3>"+
									"<span>發文/更改時間: " + $.format.date(new Date(value.dDate), 'yyyy-MM-dd') + "&nbsp;" + value.tTime + "</span><br>"+
									"<span>樓主: " + value.sAuthor + "</span><br>"+
									"<span>留言數: " + value.sReplyBeans.length + "</span>"+
									"</div>"+
									"</div>"+
									"<hr>");
					});
	            },
	            error:function (err) {
	                alert("發生錯誤!");
	            }		
			});
		}
		
		
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
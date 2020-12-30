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

	<p>論壇首頁</p>

	<form>
		<label>分類篩選: </label> <select id="sCategory"
			name="sCategory">
			<option value="" selected>全部</option>
			<option value="and sCategory = '閒聊'">閒聊</option>
			<option value="and sCategory = '公告'">公告</option>
			<option value="and sCategory = '討論'">討論</option>
			<option value="and sCategory = '問題'">問題</option>
			<option value="and sCategory = '情報'">情報</option>
			<option value="and sCategory = '攻略'">攻略</option>
		</select> <label> 依標題搜尋: </label> <input type="text" id="sSearch" name="sSearch">
		<input type="button" id="submit" name="select" value="查詢">
	</form>

	<div id="point">
		<c:forEach var="forum" items="${lForumList}">
			<div style="border: 2px solid red; margin: 10px">
				<div class="image"
					style="border: 2px solid blue; width: 200px; height: 100px; display: inline">

				</div>
				<div class="text"
					style="padding: 2px; text-align: left; border: 2px solid green;">
					分類: ${forum.sCategory} <br>
					 標題: ${forum.sTitle} <br>
					發文/更改 時間: ${forum.dDate} ${forum.tTime} <br>
					樓主:${forum.sAuthor} <br>
					 留言數: ${fn:length(forum.sReplyBeans)}
					<button type="submit" name="formNo" value="${forum.iNo}">詳細</button>
				</div>
				<%-- 					<a href="<c:url value='/forum/Detail/${forum.iNo}'/></a> --%>
			</div>
		</c:forEach>
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
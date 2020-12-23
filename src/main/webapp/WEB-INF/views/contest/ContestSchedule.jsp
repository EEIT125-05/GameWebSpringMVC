<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ include file="../Link.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Bar</title>
<style>
.player{
	border: 2px solid red;
	margin: 10px;
	padding: 2px;
	cursor: default;
}


*{
margin:0;
padding:0;
}

#contain{
    overflow: auto;
    border: 1px solid red;
}



.tree ul{
padding-top:20px;
position: relative;

}
.tree li{
float:left;
list-style: none;
text-align: center;
position: relative;
/* padding:20px 5px 0 5px; */
padding:20px 5px 0 5px;

}
/*利用::before,::after作分支線*/
.tree li::before,.tree li::after{
content:"";
position: absolute;
top:0;
right:50%;
width:50%;
height:20px;
border-top:2px solid black;
}
.tree li:after{
right:auto;
left:50%;
/* border-left:2px solid red; */
border-left:2px solid black;
}
.tree li:first-child::before,.tree li:last-child::after{
border:0 none;
}
.tree li:last-child::after{
border-left:2px solid black;
/* border-left:2px solid green; */
}



/*刪除僅只有一個分支的分支線*/
.tree li:only-child::before,.tree li:only-child::after{
border:none;
}
.tree li:only-child{
padding-top:0;
}


/*新增僅只有一個分支的下分支線*/
.tree ul ul::before{
content:"";
position: absolute;
top:0;
left:50%;
border-left:2px solid black;
/* border-left:2px solid blue; */
width:0;
height:20px;
}

.tree label{
display: inline-block;
border:2px solid black;
/* border:2px solid #ccc; */
padding: 5px 28px;
margin:0;
width:100px;
color:#666;
text-decoration: none;
/* padding:10px; */
}



</style>
</head>
<body>
	<%@ include file="../Header.jsp"%>

<div class="container">

<h1 class="mt-4 mb-3">比賽詳細資料/賽程安排
      <small>XXXXX</small>
    </h1>

    <ol class="breadcrumb">
      <li class="breadcrumb-item">
        <a href="<c:url value='/'/>">Home</a>
      </li>
      <li class="breadcrumb-item active">賽事</li>
    </ol>

		<p>比賽名稱: ${cContestBean.sName} 
<%-- 			<button type="submit" name="updateNo" value="${cContestBean.iNo}">更改</button> --%>
			<a href="<c:url value='/contest/Update/${cContestBean.iNo}'/>">更改</a>
			<a href="<c:url value='/contest/Delete/${cContestBean.iNo}'/>">刪除</a>
<%-- 			<button type="submit" name="deleteNo" value="${cContestBean.iNo}">刪除</button> --%>
			<span style="font-size:70%;color:red">(註:至比賽當日即無法更改比賽)</span>
		</p>
		<p>比賽遊戲: ${cContestBean.sGame}</p>
		<p>主辦者: ${cContestBean.sHost}</p>
		<p>報名日期: ${cContestBean.dSignStart} ~ ${cContestBean.dSignEnd}</p>
		<p>比賽時間: ${cContestBean.tTime}</p>
		<p>比賽地點: ${cContestBean.sLocation}</p>
		<p>參加人數:
			${fn:length(cContestBean.lParticipateBeans)}/${cContestBean.iPeople}</p>
		<c:set var="rule" value="${cContestBean.sRule}" />
		<%
			request.setAttribute("vEnter", "\n");
		%>
		<span>比賽規則:</span> <br> <span>${fn:replace(rule,vEnter,"<br>")}</span>
		<hr>


	<p>本場比賽共有${fn:length(cContestBean.lParticipateBeans)}人參賽</p>
	產生賽程表:
	<form>
		<div>
			<label for="" id="team">隊伍形式: </label>
			<label>
				<input type="radio" id="individual" class="team" name="team" value="no" checked>個人賽
			</label>
			<label>
				<input type="radio" id="group" class="team" name="team" value="yes" >團體賽	
			</label><br>
			<label id="teamCountSelect"></label>
		</div>
		<div>
			<label>是否有預賽: </label>
			<label>
				<input type="radio" id="Npreliminaries" 
				class="preliminaries" name="preliminaries" value="no" checked>無預賽
			</label>
			<label>
				<input type="radio" id="Ypreliminaries" 
				class="Preliminaries" name="preliminaries" value="yes">有預賽		
			</label><br>
			<label id="preliminariesCountSelect"></label>
		</div>
		<div>
			<label>賽制: </label>
			<label>
				<input type="radio" id="knockout" 
				class="competition" name="competition" value="no" checked>淘汰賽
			</label>
			<label>
				<input type="radio" id="ground" 
				class="competition" name="competition" value="yes" >循環賽
			</label><br>
		</div>
		<input type="button" id="build" value="產生">
	</form>
	<hr>
	

	<c:forEach var="participate" items="${cContestBean.lParticipateBeans}">
		<span class="playerNone" style="display:none">${participate.sPlayer} </span>
	</c:forEach>

<div id="show" style="display:none">
	<p>參賽人員:</p>
	<label id="playerCount"></label>
	<hr>	
	<span>賽程:</span>
	<form>
		<input type="button" value="自動安排">
		<input type="button" value="產生圖檔">
	</form>
	<div id="contain" class="tree"></div>

</div>


</div>
	<%@ include file="../Foot.jsp"%>

	<script src="../js/jquery-ui.js"></script>
	<script>
		$(function() {

			$("#group").on("focus",function(){    
				if($("#group:checked").length == 0){	
			        let showSelect = false;
			        $("#teamCountSelect").append("分<select id=\"teamCount\"></select>組");
			        for(let i=2; i<$(".playerNone").length; i++){
			        	if($(".playerNone").length % i == 0) {
			        		$("#teamCount").append("<option value=" + i + ">" + i + "</option>");
							showSelect = true;
						}
			        }
			        if(!showSelect) {
			        	$("#teamCountSelect").text("目前人數無法分組");
					}
				}
				if($("#Ypreliminaries:checked").length > 0){
					$("#preliminariesCountSelect").empty();
					preliminariesCount();
				}
			});
			
			$("#individual").on("focus",function(){
				$("#teamCountSelect").empty();
				if($("#Ypreliminaries:checked").length > 0){
					$("#preliminariesCountSelect").empty();
					preliminariesCount();
				}
			});
			
			$(document).on("change", "#teamCount", function(){
                if($("#Ypreliminaries:checked").length > 0){
                	$("#preliminariesCountSelect").empty();
                	preliminariesCount();
				}
            });
			
			$("#Ypreliminaries").on("focus", function(){
				if($("#Ypreliminaries:checked").length == 0){
					preliminariesCount();
				}
			});
			
			$("#Npreliminaries").on("focus",function(){
				$("#preliminariesCountSelect").empty();
			});
			
			$(document).on("change", "#preliminariesCount1", function(){
				$("#preliminariesCount2").empty();
				for(let i=2; i<=$(this).val(); i++){
					$("#preliminariesCount2").append("<option value=" + i + ">" + i + "</option>")
				}
            });
			 
			function preliminariesCount(){
			    let iPlayer = $(".playerNone").length;
		        $("#preliminariesCountSelect").append("<select id=\"preliminariesCount1\"></select>");
		        if($("#teamCount").val() != null) {
		        	iPlayer = $("#teamCount").val();
				}
				for(let i=2; i<=iPlayer; i++) {
					$("#preliminariesCount1").append("<option value=" + i + ">" + i + "</option>");
				}
				$("#preliminariesCountSelect").append("取<select id=\"preliminariesCount2\"><option value=\"2\">2</option></select>");
			}
			
			$("#build").on("click",function(){
				$(this).val("產生/重新整理");
				let iPlayer = $(".playerNone").length;
				$("#show").attr("style","display:block;");
				
				$("#playerCount").empty();
				$(".playerNone").each(function(){
					$("#playerCount").append("<label class=\"player\">" + $(this).text() + "</label>");
				});			
				
				$("#contain").empty();
				if($("#group:checked").length > 0) {
		        	iPlayer = $("#teamCount").val();
				}
// 				for (let i = 0; i < iPlayer; i++) {
// 					$("#contain").append("<label class=\"drop\" style=\"height:100;width:200;border:2px solid green;margin:10px\"></label>");
// 				}
				
				
				let a = 60;
		        $(".tree").width((110+(a-1)*120) + "px");
				
		        let iMax = a.toString(2).length;
		        let max = Math.pow(2,iMax);
		        if((max-a) == a){
		            iMax = a.toString(2).length - 1;
		        }
		        
		    	$("#contain").append("<ul class=\"layer1\">");
		        $(".layer1").append("<li id=\"text1\" class=\"text1\"><label>&nbsp");
// 		        $(".layer1").append("<li id=\"text1\" class=\"text1\"><label>第1層");

		        for(let i=1; i<=iMax; i++){
		            let j = i + 1;
		            let className;
		            if(i != a.toString(2).length){
		                className = "class=\"text" + j + "\"";
		            }else{
		                className = "class=\"buttom\"";
		            }
		            $(".text" + i).append("<ul class=\"layer" + j + "\">");
		            $(".layer" + j).append("<li " + className + "><label>&nbsp");
		            $(".layer" + j).append("<li " + className + "><label>&nbsp");
// 		            $(".layer" + j).append("<li " + className + "><label>第" + j + "層");
		        }
		        if((max-a) != a){
		            let n = 1;
		            let m = max/Math.pow(2,n+1)
		            for(let i=1; i<=(max-a); i++){
		                let j;
		                if(i > m){
		                    n ++;
		                    m = m + max/Math.pow(2,n+1);
		                }
		                if(i%2 == 0){
		                    j = max/Math.pow(2,n) - 1;
		                }else{
		                    j = i % (max/Math.pow(2,n+1));
		                }
		                console.log("j= " + j);
		                $(".buttom").eq(j).parent().prev().before("<ul>").before("<ul>").before("<ul>").before("<ul>");
		                $(".buttom").eq(j).parent().remove();
		            }
		        }
				
				drag($(".player"));
				drop($(".drop"));
				
			});

			function drag(object){
				object.draggable();
			}

			function drop(object){
				object.droppable({
				    accept:"*",
				    drop: function(ev,ui) {
						console.log("drop" + $(this).text() + ui.draggable.text());
						$(this).append("<label class=\"player\">" + ui.draggable.text() + "</label>");
						ui.draggable.css("visibility","hidden").removeClass("player");
						
					//	let 綠框內的個數 = $(".playerNone").length)/$(".drop").length;
						if($(this).children(".player").length == ($(".playerNone").length/$(".drop").length)){
							$(this).css("border-color","red").droppable("destroy");			
						}
				    },
				    out: function() {
				    	console.log("out");
				    }
				}); 
				
			}
			

		});
	</script>




</body>
</html>
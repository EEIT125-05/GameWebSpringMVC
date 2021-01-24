<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ include file="../Link.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>編輯賽程 - GameBar</title>

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
	
	body{
		padding-left:20px;
		padding-top:76px;
	}
	
	#tree{
  	    overflow: auto;  
/* 	    border: 1px solid red; */
		position: relative;
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
		text-decoration: none;
		width:96px;
		height:36px;
		margin:0;
	}
	

</style>

<script>

</script>

</head>
<body>
	<%@ include file="../Header.jsp"%>

<!-- <div class="container"> -->

<!-- <h1 class="mt-4 mb-3"> -->
<!-- 比賽詳細資料/賽程安排 -->
<!--       <small>XXXXX</small> -->
<!--     </h1> -->

<!--     <ol class="breadcrumb"> -->
<%-- 		<li class="breadcrumb-item"><a href="<c:url value='/'/>">Home</a> --%>
<!-- 		</li> -->
<%-- 		<li class="breadcrumb-item active"><a href="<c:url value='/contest/Index'/>">賽事</a></li> --%>
<%-- 		<li class="breadcrumb-item active"><a href="<c:url value='/contest/Information?contestNo=${cContestBean.iNo}'/>">詳細資料</a></li> --%>
<%-- 		<li class="breadcrumb-item active"><a href="<c:url value='/contest/ScheduleTest/${cContestBean.iNo}'/>">編輯賽程</a></li> --%>
<!-- 	</ol> -->
<input type="hidden" name="_method"  id='putOrDelete'   value="" >
 <input type="hidden" id="contestNo" value="${cContestBean.iNo}"> <!--截圖的ajax要用的 -->
 
	
	
	<div id="option">
		<div>
			<label>比賽: ${cContestBean.sName}</label><br>
			<label>本場比賽共有${fn:length(cContestBean.lParticipateBeans)}人參賽: </label><br>
			<c:forEach varStatus="vs" var="participate" items="${cContestBean.lParticipateBeans}">
				<label>${vs.count}. </label><label class="playerNone" style="margin-right:10px">${participate.sPlayer}</label>
			</c:forEach>
		</div>
		<div>
			<c:choose>
	    		<c:when test="${cContestBean.iTeamMemberCount == 1}">
	    			<label>隊伍組成: </label><label>個人</label><br>
	    		</c:when>
	    		<c:otherwise>
	    			<label>隊伍組成: </label><label>團體，每隊${cContestBean.iTeamMemberCount}人</label><br>
	    		</c:otherwise>
	    	</c:choose>
	    	<c:choose>
	    		<c:when test="${cContestBean.sPreliminary == 'none'}">
	    			<label>預賽: </label><label>無預賽</label><br>
	    		</c:when>
	    		<c:otherwise>
	    			<c:set var="sPreliminary" value="${fn:split(cContestBean.sPreliminary,'-')}"/>
	   				<label>預賽: </label><label>有預賽，${sPreliminary[0]}取${sPreliminary[1]}  剩餘取${sPreliminary[2]}</label><br>
	    		</c:otherwise>
	    	</c:choose>
	    		<input type="hidden" id="preliminary" value="${cContestBean.sPreliminary}">
	    	
	    	<c:if test="${cContestBean.sRematchMode == 'knockout'}">
	    		<label>比賽形式: </label><label>淘汰賽</label><br>
	    	</c:if>
	    	<c:if test="${cContestBean.sRematchMode == 'ground'}">
	    		<label>比賽形式: </label><label>循環賽</label><br>
	    	</c:if>
	    	<c:if test="${cContestBean.sRematchMode == 'free'}">
	    		<label>比賽形式: </label><label>自由對戰</label><br>
	    	</c:if>
	    		<input type="hidden" id="rematchMode" value="${cContestBean.sRematchMode}">
			<input class="btn btn-outline-dark" type="button" id="build" value="產生">
		</div>
		<hr>
	</div>

	<div id="showSchedule" style="display:none">
		<span>賽程:</span>
		<div id="hiddenDiv" style="overflow:auto">
				<label>複賽</label>
				<div id="tree" class="tree"></div>
				<br>
				<c:if test="${cContestBean.sPreliminary != 'none'}">
					<label>預賽</label>
				</c:if>
				<div id="drow" class="drow"></div>
		</div>
		<hr>	
		<p>參賽人員:</p>
		<label id="playerCount"></label>
		<br>
		<button class="btn btn-outline-dark" id="auto">自動安排</button>
	    <button class="btn btn-outline-dark" id="createImage">儲存賽程</button>
	
	</div>


<!-- </div> -->
	<%@ include file="../Foot.jsp"%>

	<script src="<c:url value='/js/jquery-ui.js'/>"></script>
	<script src="<c:url value='/js/html2canvas.js'/>"></script>
<script>
$(function(){
	$("#delete").on("click", function(){
		Swal.fire({
			showClass: {
			    popup: 'animate__animated animate__fadeInDown'
			  },
			  title: '確定刪除此筆紀錄?',
			  text: "刪除之後將不能復原",
			  icon: 'warning',
			  showCancelButton: true,
			  confirmButtonColor: '#d33',
			  cancelButtonColor: '#3085d6',
			  confirmButtonText: '刪除',
		      cancelButtonText: '取消',
				hideClass: {
				    popup: 'animate__animated animate__fadeOutUp'
				  }
			}).then((result) => {
			  if (result.isConfirmed) {
				  $.ajax({
						type: "delete",
						url: "<c:url value='/contest/Edit/" + $(this).val() + "'/>",
						dataType: "json",
						data: {},
						success: function(result){
							if(result.status == "success"){
								Swal.fire({
										      title:"刪除成功!",
											  icon:"success",
											  hideClass: {
											    popup: 'animate__animated animate__fadeOutUp'
											  }
										  }).then(function(){
											window.setTimeout(function(){$(location).attr("href", "<c:url value='/contest/Index'/>");},500);
											
										})
							}else if(result.status == "sqlError"){
								Swal.fire(
										  '資料庫發生錯誤!',
										  '請聯繫管理員',
										  'error'
										)
							}
						},
						error: function(err){
							Swal.fire(
									  '網頁發生錯誤!',
									  '請聯繫管理員',
									  'error'
									)
						}
						
					});		
			  }
			})

	});
	
	
	let preliminary = $("#preliminary").val();
	let rematchMode = $("#rematchMode").val();
	
	$("#build").on("click",function(){
		$(this).val("產生/重新整理");
		let iPlayer = $(".playerNone").length;
		$("#showSchedule").attr("style","display:block;");
		
		$("#playerCount").empty();
		$("#tree").empty();
		$("#drow").empty();
		$(".playerNone").each(function(){
			$("#playerCount").append("<label class=\"player\">" + $(this).text());
		});			
		
// 		if($("#group:checked").length > 0) {
//         	iPlayer = $("#teamCount").val();
// 		}


//--------------產生預賽(循環)-------------------------------------------------
        let mW = 400;
        let mH = 400;
        let mCount; //邊數
        let mCenter = mW / 2; //中心點
        let mRadius = mCenter - 100; //半徑(減去的值用於給繪製的文字留空間)
        let mAngle; //角度
        let mColorPolygon = '#000000'; //多邊形顏色
        let mColorText = '#000000';
		
		if(preliminary != "none"){
			let pre = preliminary.split("-"); //ex:4取3剩餘取1
	        $("#drow").css("width", (mW*Math.ceil(iPlayer/pre[0])+5) + "px")
	        			.css("position", "relative");
			
			let gCount = Math.ceil(iPlayer/pre[0]); //組數
	        for(let i=0; i<gCount; i++){
	        	if(i == gCount-1){
		        	mCount = iPlayer - pre[0] * i;
	        	}else{
		        	mCount = pre[0];
	        	}
	        	mAngle = Math.PI * 2 / mCount;
	            createGroup(i);
	        }
	
	        
//--------------預賽產出的複賽參賽者-------------------------------------------------
		
			iPlayer = gCount*pre[1];
			if(pre[2] != "0"){
				iPlayer = (gCount-1)*pre[1]+Number(pre[2]);
			}
		
		}
		console.log("淘汰賽數量: " + iPlayer);
		
		function createGroup(i){
        	let canvas = document.createElement("canvas");
            document.getElementById("drow").appendChild(canvas);
            // document.body.appendChild(canvas);
            canvas.height = mH;
            canvas.width = mW;
            canvas.style = "display:inline;";
            let ctx = canvas.getContext('2d');
            drowLine(ctx);
            let coordinate = setTextCoordinate(ctx);
            createDiv(coordinate, (mH*i));
        }
        
        function drowLine(ctx){
            //畫6條邊
            ctx.strokeStyle = mColorPolygon;
            ctx.beginPath(); //開始路徑
            for(let i=0; i<mCount; i++){
                let x1 = mCenter + mRadius * Math.cos(mAngle * i);
                let y1 = mCenter + mRadius * Math.sin(mAngle * i);    
                for (let j = 0; j < mCount; j++) {
                    let x = mCenter + mRadius * Math.cos(mAngle * j);
                    let y = mCenter + mRadius * Math.sin(mAngle * j);
                    // console.log('x:' +  x, 'y:' +  y);
                    ctx.moveTo(x1, y1);
                    ctx.lineTo(x, y);
                }
            }
            ctx.stroke();
        }   

        function setTextCoordinate(ctx){
            //文字座標
            let fontSize = mCenter / 12;
            ctx.font = fontSize +  'px Microsoft Yahei';
            ctx.fillStyle = mColorText;
            ctx.strokeStyle = mColorText;//換個顏色
            let coordinate = [];//儲存各方框座標
            for (let i = 0; i < mCount; i++) {
            	let x = mCenter +  mRadius * Math.cos(mAngle * i);
            	let y = mCenter +  mRadius * Math.sin(mAngle * i);
                if (mAngle * i >= 0 && mAngle * i <= Math.PI / 2) {
                    //******點在左上******
                    coordinate.push([x+30,y]);
                } else if (mAngle * i > Math.PI / 2 && mAngle * i <= Math.PI) {
                    //******點在右上******
                    coordinate.push([x-80,y]);
                } else if (mAngle * i > Math.PI && mAngle * i <= Math.PI * 3 / 2) {
                    //******點在右下******
                    coordinate.push([x-80,y-30]);
                } else {
                    //******點在左下******
                    coordinate.push([x+30,y-30]);
                }
            }
            return coordinate;
        }
        // console.log("各方框座標: " + coordinate);

        function createDiv(coordinate, groupLeft){
            //做div
            for(let i=0; i<mCount; i++){
                let div = document.createElement("div");
                div.style = "left:" + (coordinate[i][0]+groupLeft) + "px;top:" + coordinate[i][1] + "px;width:60px;border:2px solid green;position:absolute";
                div.className = "drop";
                document.getElementById("drow").appendChild(div);
                // document.body.appendChild(div);
            }
            //div高需要等所有div生成才另外計算
            $(".drop").css("height", (40*$(".playerNone").length/$(".drop").length) + "px");
        }
		
		
		
//--------------產生賽程表-----------------------------------------------------
		let a = Number(iPlayer);
        
        if(rematchMode == "knockout"){//複賽淘汰賽
	        $("#tree").width((a*96+(2*a)*10+20) + "px");
//		        $("#tree").width("1000vw");
//		        console.log("寬度: " + (a*100+(2*a-1)*10));
	        let pow = a.toString(2).length;
	        let max = Math.pow(2,pow);
	        if((max-a) == a){
	            pow = a.toString(2).length - 1;
	            max = Math.pow(2,pow);
	        }
//		        console.log("次方: " + pow);
//		        console.log("補滿2的次方: " + max);
//		        console.log("不要的場數: " + (max-a));

	        $("#tree").append("<ul class=\"layer1\">");
	        $(".layer1").append("<li class=\"text1\"><label>冠軍</label>");
	        
	        for(let i=1; i<=pow; i++){
	            let j = i + 1;
	            let className;
	            if(i != a.toString(2).length){
	                className = "class=\"text" + j + "\"";
	            }else{
	                className = "class=\"bottom\"";
	            }
	            $(".text" + i).append("<ul class=\"layer" + j + "\">");
	            $(".layer" + j).append("<li " + className + "><label>&nbsp;</label>");
	            $(".layer" + j).append("<li " + className + "><label>&nbsp;</label>");
	        }
	        for(let i=0; i<max; i++){
	            $(".bottom").eq(i).children().attr("id", "編號"+i);
//		            $(".bottom").eq(i).children().attr("id", "編號"+i).attr("class", "drop");
	        } 
	        if((max-a) == 0){
	            $(".text" + (pow+1)).attr("class", "bottom");
	        }
	     
	        for(let i=0; i<(max-a); i++){
	            let str = i.toString(2);
	            while(str.length < pow-1){
	                str = "0" + str;
	            }
//		            console.log("i= " + i);
//		            console.log("換成2進位: " + str);
	            // str = str.split("").reverse().join("");
	            // console.log("2進位反轉: " + str);
//		            console.log("拆開: " + str.split(""));
	            let eqNumber = 0;
	            for(let j=0; j<pow-1; j++){
	                eqNumber += str.split("")[j]*Math.pow(2,j+1);
	            }
//		            console.log("eq的值: " + eqNumber);
	            $("#編號" + eqNumber).parent().parent().prev().before("<ul>").before("<ul>").before("<ul>").before("<ul>").parent().attr("class", "bottom");
	            $("#編號" + eqNumber).parent().parent().remove();
	        }
			
	        //統一設定高度?
	        
	        //沒預賽統一給.bottom加上.drop
	        if(preliminary == "none"){
		        $(".bottom").find("label").attr("class", "drop")
		        							.css("border-color","green")
		        							.css("height", (40*$(".playerNone").length/$(".drop").length) + "px");
	        }
	        
        }else if(rematchMode == "ground"){//複賽循環賽
        	
        	$("#tree").width("500px");
        	if(preliminary == "none"){
	        	$("#drow").width("400px");
        	}
        	mCount = a
    		mAngle = Math.PI * 2 / mCount;
        	let canvas = document.createElement("canvas");
            document.getElementById("tree").appendChild(canvas);
            canvas.height = 400;
            canvas.width = 500;
            canvas.style = "display:inline;";
            let ctx = canvas.getContext('2d');
            drowLine(ctx);
            let coordinate = setTextCoordinate(ctx);
            
            for(let i=0; i<mCount; i++){
                let div = document.createElement("div");
                if(preliminary == "none"){
	                div.style = "left:" + (coordinate[i][0]-15) + "px;top:" + coordinate[i][1] + "px;width:80px;border:2px solid green;position:absolute";
	                div.className = "drop";
		        }else{
	                div.style = "left:" + (coordinate[i][0]-15) + "px;top:" + coordinate[i][1] + "px;width:80px;height:40px;border:2px solid black;position:absolute";
		        }
                document.getElementById("tree").appendChild(div);
            }
            //div高需要等所有div生成才另外計算
            $(".drop").css("height", (40*$(".playerNone").length/$(".drop").length) + "px");
        }else{//複賽自由對戰
        	$("#tree").width("250px").html("<p style=\"margin-left:20px\">自由對戰,預賽共有" + iPlayer + "人晉級</p>");
        }
        
        
//--------------產生賽程表-----------------------------------------------------				
        
		drag($(".player"));
		drop($(".drop"));
		
		
	});

	function drag(object){
		object.draggable(
				{revert: "invalid"}
		);
	}

	function drop(object){
		object.droppable({
		    accept:"*",
		    drop: function(ev,ui) {
//					console.log("drop" + $(this).text() + ui.draggable.text());
				$(this).append("<span class=\"player\" style=\"margin:0;padding:0;border-color:red\">" + ui.draggable.text() + "</span><br>&nbsp;");
				ui.draggable.css("visibility","hidden").removeClass("player");
//					$(".text3").find("label").text(ui.draggable.text()+"\n"+ui.draggable.text());
				
			//	let 綠框內的個數 = $(".playerNone").length)/$(".drop").length;
				console.log("分組: " + ($(".playerNone").length/$(".drop").length))
				if($(this).children(".player").length == ($(".playerNone").length/$(".drop").length)){
					$(this).css("border-color","transparent").droppable("destroy");			
				}
		    },
		    out: function() {
		    	console.log("out");
		    }
		}); 
	}
	
	$("#createImage").on("click", function(){
		window.pageYOffset = 0;
        document.documentElement.scrollTop = 0
        document.body.scrollTop = 0
        let treeImage64;
        let drowImage64;
//         document.getElementById('tree').parentNode.style.overflow = 'visible';
        html2canvas(document.getElementById("tree"), { useCORS: true, scale:2 }).then(function (canvas) {
// 	        document.body.appendChild(canvas);
// 			document.getElementById('tree').parentNode.style.overflow = 'hidden'; 
            treeImage64 = canvas.toDataURL("image/jpeg", 1.0);
//	        console.log("type: " + typeof(image64));
// 	        console.log("treeImage64: " + treeImage64);
	        
	        html2canvas(document.getElementById("drow"), { useCORS: true, scale:2 }).then(function (canvas) {
	    		if(canvas.height == 0){
	    			drowImage64 = "";
	    		}else{
		        	drowImage64 = canvas.toDataURL("image/jpeg", 1.0);
// 		        	console.log("drowImage64: " + drowImage64);
	    		}
	    	
	            let groupPlayer = [];
	     		let mCount; //邊數->每組人數
	     		let groupFirst = 0; //每組的第一個人的編號
	    		
	     		if(preliminary != "none"){//有預賽
	     			let pre = preliminary.split("-");
	     			perliminary = "true";
	     			let gCount = Math.ceil($(".drop").length/pre[0]); //組數
	     			console.log(gCount + "組")
	     	        for(let i=0; i<gCount; i++){
	     	        	if(i == gCount-1){
	     		        	mCount = $(".drop").length - pre[0] * i;
	    //						console.log(mCount + "人")
	     	        	}else{
	     		        	mCount = pre[0];
	    //						console.log(mCount + "人")
	     	        	}
	     	        	let players = [];
	     	        	for(let j=groupFirst; j<groupFirst+Number(mCount); j++){
	    //		        		console.log("groupFirst: " + groupFirst);
	    //		        		console.log("j: " + j);
	    //						console.log("-" + $(".drop").eq(j).find("label").text() + "-");
	     					let string = "";
	     					for(let k=0; k<$(".drop").eq(j).find("span").length; k++){
	     						string = string + ($(".drop").eq(j).find("span").eq(k).text());
	     					}
	     					groupPlayer.push(string);
	     	        	}
	    //		        	console.log("players: " + players);
	     	        	groupPlayer.push(players);
	     	        	groupFirst = groupFirst+Number(mCount);
	     	        }
	    //	        	console.log("groupPlayer: " + groupPlayer);
	     		}else{//沒預賽
	     			perliminary = "false";
	     			for(let i=0; i<$(".drop").length; i++){
	     				let string = "";
	     				for(let j=0; j<$(".drop").eq(i).find("span").length; j++){
	     					string = string + ($(".drop").eq(i).find("span").eq(j).text());
	     				}
	     				groupPlayer.push(string);
	     			}
	     		}

	    		$.ajax({
					type:"post",
					url:"<c:url value='/contest/ScheduleImage'/>",
					dataType:"json",
					data:{
						"treeImage64": treeImage64,
		 				"drowImage64": drowImage64,
						"contestNo": $("#contestNo").val(),
		 				"groupPlayer": JSON.stringify(groupPlayer)
					},
					success: function(result){
						if(result.status == "success"){
							Swal.fire({
								  title: "賽程儲存完成!",
								  icon: "success",
								  showClass: {
									    popup: 'animate__animated animate__fadeInDown'
									  },
								  hideClass: {
									    popup: 'animate__animated animate__fadeOutUp'
									  }
							}).then(function(){
										window.setTimeout(function(){$(location).attr("href", "<c:url value='/contest/Information?contestNo=" + $("#contestNo").val() + "'/>");},500);
							})
						}else if(result.status == "sqlError"){
							Swal.fire(
									  '資料庫發生錯誤!',
									  '請聯繫管理員',
									  'error'
									)
						}
						
					},
					error: function(err){
						Swal.fire({
							  title: '網頁發生錯誤!',
							  text: '請聯繫管理員',
							  icon: 'error',
							  showClass: {
								    popup: 'animate__animated animate__fadeInDown'
								  },
							  hideClass: {
								    popup: 'animate__animated animate__fadeOutUp'
								  }
						});
					}
				});
	        
	        });
	        
        });
        
	});
	
	
	$("#auto").on("click",function(){
		let playerList = [];
		$.each($(".playerNone"), function(key, value){
			console.log(value.innerHTML);
			playerList.push(value.innerHTML);
		});
		$.ajax({
			type:"post",
			url:"<c:url value='/contest/Random'/>",
			dataType:"json",
			data:{
				"playerList": playerList
			},
			success: function(result){
 				$(".drop").empty();
 				$(".player").remove();
 				let labelCount = ($(".playerNone").length/$(".drop").length);
 				for(let i=0; i<$(".drop").length; i++){
 					for(let j=i*labelCount; j<i*labelCount+labelCount ; j++){
 						$(".drop").eq(i).append("<span class=\"player\" style=\"margin:0;padding:0;border-color:red\">" + result[j] + "</span><br>");
 					}
 				}
					$(".drop").css("border-color","transparent").droppable("destroy");
			},
			error: function(err){
				alert("發生錯誤!");	
			}
		});
	});
	
	
});



</script>

</body>
</html>
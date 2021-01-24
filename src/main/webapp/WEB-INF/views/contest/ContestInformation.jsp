<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ include file="../Link.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${cContestBean.sName}</title>
<style>
.hiddenDiv label{
	margin:0
}
.itemChoose{
	background-color:#343a40;
	color:white;
}

.item{
	margin-top:10px
}

.tdPlayer:hover{
    color: #007bff;
    cursor: pointer;
}
.tdPlayer:active{
    color: #0000FF;
}

.tdPlayerR:hover{
    color: #007bff;
    cursor: pointer;
}
.tdPlayerR:active{
    color: #0000FF;
}

table, th, td {
  border: 1px solid black;
  text-align:center;
}
table {
	width: 100%;
    table-layout:fixed;
    word-wrap:break-word;
}
td{
	height:2em;
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
	border-left:2px solid black;
}
.tree li:first-child::before,.tree li:last-child::after{
	border:0 none;
}
.tree li:last-child::after{
	border-left:2px solid black;
}

.tree li:only-child::before,.tree li:only-child::after{
	border:none;
}
.tree li:only-child{
	padding-top:0;
}

.tree ul ul::before{
	content:"";
	position: absolute;
	top:0;
	left:50%;
	border-left:2px solid black;
	width:0;
	height:20px;
}

.tree label{
	display: inline-block;
	border:2px solid black;
	text-decoration: none;
	width:96px;
	height:36px;
	margin:0;
}

</style>

</head>
<body>
<%@ include file="../Header.jsp"%>

<div class="container">
	<input type="hidden" id="checkUser" value="${user}">
<!-- 			按報名鈕檢查使用者是否登入用的 -->
	<h1 class="mt-4 mb-3">
<!-- 		比賽詳細資料  -->
<!-- 		<small>XXXXX</small> -->
	</h1>

	<ol class="breadcrumb">
		<li class="breadcrumb-item"><a href="<c:url value='/'/>">Home</a></li>
		<li class="breadcrumb-item active"><a href="<c:url value='/contest/Index'/>">賽事</a></li>
		<li class="breadcrumb-item active">詳細資料</li>
	</ol>

		<img src="<c:url value='/contest/ImageLoading?iNo=${cContestBean.iNo}'/>" alt="" style="width:560px">
		<div>
			<label class="btn btn-outline-dark item itemChoose">總覽</label>
			<label class="btn btn-outline-dark item">參賽者</label>
			<label class="btn btn-outline-dark item">賽程</label>
			<c:choose>
	    		<c:when test="${cContestBean.sHost == user.sAccount}">
					<label class="btn btn-outline-dark item">更新戰績</label>
	    		</c:when>
	    		<c:otherwise>
					<label class="btn btn-outline-dark item">戰績</label>
	    		</c:otherwise>
	    	</c:choose>
	    	
			<c:set var="joinStatus" value="true"/>
			
<!-- 				團體賽要從參加組別拆自串比對-->
			<c:choose>
	    		<c:when test="${cContestBean.iTeamMemberCount != 1}">
	    			<c:forEach var="participate" items="${cContestBean.lParticipateBeans}">
	    				<c:forEach var="player" items="${fn:split(participate.sPlayer,',')}">
		    				<c:if test="${player == user.sAccount}">
								<c:set var="joinStatus" value="false"/>
							</c:if>
	    				</c:forEach>
	    			</c:forEach>
	    		</c:when>
	    		<c:otherwise>
					<c:forEach var="participate" items="${cContestBean.lParticipateBeans}">
						<c:if test="${participate.sPlayer == user.sAccount}">
							<c:set var="joinStatus" value="false"/>
						</c:if>
					</c:forEach>
	    		</c:otherwise>
	    	</c:choose>
			
			
			
			<jsp:useBean id="nowDate" class="java.util.Date"/>
			<fmt:formatDate var="today" pattern="yyyy-MM-dd" value="${nowDate}" />
			<c:choose>
				<c:when test="${joinStatus == 'false'}">
					<button class="btn btn-success joinItem" disabled>已報名</button>
					<c:choose>
						<c:when test="${cContestBean.dSignEnd < today}">
							<button class="btn btn-danger" disabled>退出比賽</button>
							<span style="font-size:70%;color:red">(註:報名截止後即無法退出比賽)</span>
						</c:when>
						<c:otherwise>
							<button id="quitContest" class="btn btn-danger" value="${cContestBean.iNo}">退出比賽</button>
							<span style="font-size:70%;color:red">(註:報名截止後即無法退出比賽)</span>
						</c:otherwise>
					</c:choose>
				</c:when>
				<c:otherwise>
					<c:choose>
					<c:when test="${cContestBean.dSignStart > today}">
						<button class="btn btn-success joinItem" disabled>未開始報名</button>
					</c:when>
					<c:otherwise>
						<c:choose>
							<c:when test="${cContestBean.dSignEnd < today}">
								<button class="btn btn-success joinItem" disabled>報名已截止</button>
							</c:when>
							<c:otherwise>
								<c:choose>
									<c:when
										test="${fn:length(cContestBean.lParticipateBeans) == cContestBean.iPeople}">
										<button class="btn btn-success joinItem" disabled>報名人數已滿</button>
									</c:when>
									<c:otherwise>
										<button class="btn btn-success joinItem">報名</button>
									</c:otherwise>
								</c:choose>
							</c:otherwise>
						</c:choose>
					</c:otherwise>
					</c:choose>
				</c:otherwise>
			</c:choose>
		</div>
		
		
<!-- 		<hr> -->
		<div id="總覽" class="hiddenDiv">
			<c:if test="${cContestBean.sHost == user.sAccount }">
            	<fmt:formatDate var="dTime" value="${cContestBean.tTime}" pattern="yyyy-MM-dd"/>
				<c:choose>
					<c:when test="${dTime <= today}">
						<span style="color:gray;margin:0 12px">更改</span>
					</c:when>
					<c:otherwise>
						<a class="btn btn-outline-dark" href="<c:url value='/contest/Update/${cContestBean.iNo}'/>">更改</a>
					</c:otherwise>
				</c:choose>
				<button class="btn btn-outline-dark" type="submit" id="delete" value="${cContestBean.iNo}">刪除</button>
				<span style="font-size:70%;color:red">(註:至比賽當日即無法更改比賽)</span>
			</c:if>
			
			<p><label>比賽名稱: </label><label>${cContestBean.sName}</label></p>
	    	<p><label>比賽遊戲: </label><label>${cContestBean.sGame}</label></p>
	    	<p><label style="width:67.47px;text-align:right">隊伍數: </label><label>${cContestBean.iPeople}</label></p>
	    	
	    	<c:choose>
	    		<c:when test="${cContestBean.iTeamMemberCount == 1}">
	    			<p><label>隊伍組成: </label><label>個人</label></p>
	    		</c:when>
	    		<c:otherwise>
	    			<p><label>隊伍組成: </label><label>團體，每隊${cContestBean.iTeamMemberCount}人</label></p>
	    		</c:otherwise>
	    	</c:choose>
	    		<input type="hidden" id="teamMemberCount" value="${cContestBean.iTeamMemberCount}">
	    	<c:choose>
	    		<c:when test="${cContestBean.sPreliminary == 'none'}">
	    			<p><label style="width:67.47px;text-align:right">預賽: </label><label>無預賽</label></p>
	    		</c:when>
	    		<c:otherwise>
	    			<c:set var="sPreliminary" value="${fn:split(cContestBean.sPreliminary,'-')}"/>
    			<p><label style="width:67.47px;text-align:right">預賽: </label><label>有預賽，${sPreliminary[0]}取${sPreliminary[1]}  剩餘取${sPreliminary[2]}</label></p>
	    		</c:otherwise>
	    	</c:choose>
	    	
	    	<c:if test="${cContestBean.sRematchMode == 'knockout'}">
	    		<p><label>比賽形式: </label><label>淘汰賽</label></p>
	    	</c:if>
	    	<c:if test="${cContestBean.sRematchMode == 'ground'}">
	    		<p><label>比賽形式: </label><label>循環賽</label></p>
	    	</c:if>
	    	<c:if test="${cContestBean.sRematchMode == 'free'}">
	    		<p><label>比賽形式: </label><label>自由對戰</label></p>
	    	</c:if>
	    	
	    	<p><label>報名時間: </label><label> ${cContestBean.dSignStart}~${cContestBean.dSignEnd}</label></p>
			<fmt:formatDate var="sTime" value="${cContestBean.tTime}" pattern="yyyy-MM-dd HH:mm"/>
	    	<p><label>比賽時間: </label><label>${sTime}</label></p>
	    	<p><label>比賽地點: </label><label>${cContestBean.sLocation}</label></p>
	    	<p><label>報名狀況: </label><label>${fn:length(cContestBean.lParticipateBeans)}/${cContestBean.iPeople}</label></p>
			<span>比賽規則:</span> 
			<br> 
			<span id="rule">${cContestBean.sRule}</span>
		</div>
		
		<div id="參賽者" class="hiddenDiv" style="display:none">
			<c:choose>
				<c:when test="${fn:length(cContestBean.lParticipateBeans) == 0}">
					<p>目前暫無參賽者</p>
				</c:when>
				<c:otherwise>
					<p>目前參賽者: </p>
					<c:forEach varStatus="vs" var="participate" items="${cContestBean.lParticipateBeans}">
						<div><label style="width:50px;text-align:right">${vs.count}.</label><label>${participate.sPlayer}</label></div>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</div>
		
		<div id="賽程" class="hiddenDiv" style="display:none">
			<c:choose>
				<c:when test="${cContestBean.sPreliminary == 'none' && cContestBean.sRematchMode == 'free'}">
					<p>本場賽事類型為 自由對戰-無預賽 ,故無賽程表</p>
				</c:when>
				<c:otherwise>
				
					<c:if test="${cContestBean.sHost == user.sAccount}">
						<c:choose>
							<c:when test="${dTime <= today}">
								<span style="color:gray">新增/更新賽程</span>
							</c:when>
							<c:otherwise>
								<a id="showOption" class="btn btn-outline-dark" href="<c:url value='/contest/Schedule/${cContestBean.iNo}'/>">編輯賽程</a>
							</c:otherwise>
						</c:choose>
						<span id="spanHidden" style="font-size:70%;color:red">(註:至比賽當日即無法更改賽程)</span>
					</c:if>
						
						<c:choose>
							<c:when test="${empty cContestBean.bRematchImage}">
								<p>目前暫無賽程表</p>
							</c:when>
							<c:otherwise>
								<p>複賽: </p>
								<div data-toggle="modal" data-target="#RematchImage">
									<a href="#">
									<img
										src="<c:url value='/contest/RematchImageLoading/${cContestBean.iNo}'/>"
										style="width: 560px; border: 2px solid black; border-radius: 10px" />
									</a>
									<div class="modal fade bs-example-modal-xl" id="RematchImage"
										tabindex="-1" role="dialog"
										aria-labelledby="exampleModalLongTitle" aria-hidden="true">
										<div class="modal-dialog modal-xl" role="document">
											<div class="modal-content">
												<div class="modal-header">
													<h5 class="modal-title" id="exampleModalLabel">賽程表:複賽</h5>
													<button type="button" class="close" data-dismiss="modal"
														aria-label="Close">
														<span aria-hidden="true">&times;</span>
													</button>
												</div>
												<div class="modal-body">
													<div class="container-fluid">
														<div class="row" style="overflow: auto">
															<img
																src="<c:url value='/contest/RematchImageLoading/${cContestBean.iNo}'/>"
																style="width: 1000px; border: 2px solid black; border-radius: 10px" />
														</div>
													</div>
												</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-secondary"
														data-dismiss="modal">Close</button>
												</div>
											</div>
										</div>
									</div>
								</div>
								<c:choose>
									<c:when test="${empty cContestBean.bPreliminariesImage}">
										<br>
										<p>預賽: 本場賽事並無預賽</p>
									</c:when>						
									<c:otherwise>
										<br>
										<p>預賽: </p>
										<div data-toggle="modal" data-target="#PreliminariesImage">
											<a href="#">
											<img
												src="<c:url value='/contest/PreliminariesImageLoading/${cContestBean.iNo}'/>"
												style="width: 560px; border: 2px solid black; border-radius: 10px" />
											</a>
											<div class="modal fade bs-example-modal-xl" id="PreliminariesImage"
												tabindex="-1" role="dialog"
												aria-labelledby="exampleModalLongTitle" aria-hidden="true">
												<div class="modal-dialog modal-xl" role="document">
													<div class="modal-content">
														<div class="modal-header">
															<h5 class="modal-title" id="exampleModalLabel">賽程表:預賽</h5>
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
														</div>
														<div class="modal-body">
															<div class="container-fluid">
																<div class="row" style="overflow: auto">
																	<img
																		src="<c:url value='/contest/PreliminariesImageLoading/${cContestBean.iNo}'/>"
																		style="width: 1000px; border: 2px solid black; border-radius: 10px" />
																</div>
															</div>
														</div>
														<div class="modal-footer">
															<button type="button" class="btn btn-secondary"
																data-dismiss="modal">Close</button>
														</div>
													</div>
												</div>
											</div>
										</div>							
									</c:otherwise>
								</c:choose>
							</c:otherwise>
						</c:choose>
				</c:otherwise>
			</c:choose>
		</div>

		<c:choose>
    		<c:when test="${cContestBean.sHost == user.sAccount}">
				<div id="更新戰績" class="hiddenDiv" style="display:none">
    		</c:when>
    		<c:otherwise>
				<div id="戰績" class="hiddenDiv" style="display:none">
    		</c:otherwise>
    	</c:choose>
    	
			<a class="btn btn-outline-dark" data-toggle="collapse" href="#preliminaryCollapse" role="button" aria-expanded="false" aria-controls="#preliminaryCollapse">預賽戰績</a>
			
			<div class="collapse" id="preliminaryCollapse" style="margin-top:20px;margin-bottom:20px">
	  			
	  			<c:choose>
					<c:when test="${empty lGroupRecords}"> 
						<p>複賽賽程尚未安排</p>
					</c:when>
					<c:otherwise>
	  			
		  			<div class="card card-body">	
		  			
		  			<c:if test="${cContestBean.sHost == user.sAccount}">
			  			<div style="margin-bottom:10px">
			  				<button id="savePreliminaryRecord" class="btn btn-success" value="${cContestBean.iNo}">更新戰績</button>
			  				<button id="createRematch" class="btn btn-success" value="${cContestBean.iNo}">產生複賽賽程</button>
			  			</div>
		  			</c:if>
		  			<c:forEach varStatus="vs" var="lRecords" items="${lGroupRecords }">
		  				
		  				<div>
		  					<a class="btn btn-primary" data-toggle="collapse" href="#preliminaryTable${vs.count}" role="button" aria-expanded="false" aria-controls="#preliminaryTable${vs.count}">第${vs.count}組</a>
		  				</div>
		  				<div id="preliminaryTable${vs.count}" class="collapse">
							<table>
								<thead>
									<tr>
										<th>組別</th>
										<th>參賽者1</th>
										<th>參賽者2</th>
										<th>勝方</th>
									</tr>
								</thead>
						        <tbody>
									<c:forEach var="record" items="${lRecords}">
										<tr>	
											<td>${record.iGroundNo}</td>
											<c:choose>
												<c:when test="${cContestBean.sHost == user.sAccount}">
													<td class="tdPlayer">${record.sPlayers1}</td>
													<td class="tdPlayer">${record.sPlayers2}</td>
													<td class="tdWinner">${record.sWinner}</td>
												</c:when>
												<c:otherwise>
													<td>${record.sPlayers1}</td>
													<td>${record.sPlayers2}</td>
													<td>${record.sWinner}</td>
												</c:otherwise>
											</c:choose>
										</tr>
									</c:forEach>
						        </tbody>
							</table>
		  				</div>
						<br>
					</c:forEach>
						
						
					</div>
				</c:otherwise>
				</c:choose>
			</div>
			
			
			<hr>
			<a class="btn btn-outline-dark" data-toggle="collapse" href="#rematchCollapse" role="button" aria-expanded="false" aria-controls="#rematchCollapse">複賽戰績</a>
			
			<div class="collapse" id="rematchCollapse" style="margin-top:20px;margin-bottom:20px">

	  			<c:choose>
					<c:when test="${empty lRematchRecords}"> 
						<p>複賽賽程尚未安排</p>
					</c:when>
					<c:otherwise>
						
			  			<div class="card card-body">	
			  			
				  			<c:if test="${cContestBean.sHost == user.sAccount}">
					  			<div style="margin-bottom:10px">
					  				<button id="saveRematchRecord" class="btn btn-success" value="${cContestBean.iNo}">更新戰績</button>
					  			</div>
				  			</c:if>
			  				
								<table>
									<thead>
										<tr>
											<th>場次</th>
											<th>參賽者1</th>
											<th>參賽者2</th>
											<th>勝方</th>
										</tr>
									</thead>
							        <tbody>
										<c:forEach var="record" items="${lRematchRecords}">
											<tr>	
												<c:choose>
													<c:when test="${cContestBean.sHost == user.sAccount}">
														<td>${record.iKnockoutNo}</td>
														<c:choose>
															<c:when test="${record.sPlayers1 != 'none'}">
																<td class="tdPlayerR">${record.sPlayers1}</td>
																<td class="tdPlayerR">${record.sPlayers2}</td>
															</c:when>
															<c:otherwise>
																<td>${record.sPlayers1}</td>
																<td>${record.sPlayers2}</td>
															</c:otherwise>
														</c:choose>
														<td class="tdWinnerR">${record.sWinner}</td>
													</c:when>
													<c:otherwise>
														<td>${record.iKnockoutNo}</td>
														<td>${record.sPlayers1}</td>
														<td>${record.sPlayers2}</td>
														<td>${record.sWinner}</td>
													</c:otherwise>
												</c:choose>
											</tr>
										</c:forEach>
							        </tbody>
								</table>
							<br>
							
						</div>
				
				</c:otherwise>
				</c:choose>
			
			
				
			</div>



		</div>
		
		
		<div id="tree" class="tree"></div>
</div>
<!-- 		畫圖用 不讓使用者看的 -->
<%@ include file="../Foot.jsp"%>

<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="<c:url value='/js/jquery-ui.js'/>"></script>
<script src="<c:url value='/js/html2canvas.js'/>"></script>
<script type="text/javascript">
	$(function(){
		
		$(".tdPlayer").on("click", function(){
// 			console.log($(this).text());
			let winner = $(this).text();
			let tdWinner = $(this).parent().find(".tdWinner");
			if(tdWinner.text() == winner){
				tdWinner.text("");
			}else{
				tdWinner.text(winner);
			}
			
		})
		
		$("#savePreliminaryRecord").on("click", function(){
			
			let winners = [];
			$.each($(".tdWinner"), function(key, value){
				winners.push(value.innerHTML);
			});
			
			$.ajax({
				type: "post",
				url: "<c:url value='/contest/SavePreliminaryRecord'/>",
				dataType: "json",
				data: {
						"contestNo": $(this).val(),
						"winners": winners
				},
				success: function(result){
					if(result.status == "success"){
						Swal.fire({
								      title:"儲存成功!",
									  icon:"success",
									  showClass: {
										    popup: 'animate__animated animate__fadeInDown'
										  },
									  hideClass: {
									    popup: 'animate__animated animate__fadeOutUp'
									  }
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
			
		});
		
		
		$("#createRematch").on("click", function(){
			
			let winners = [];
			let save = true;
			$.each($(".tdWinner"), function(key, value){
				winners.push(value.innerHTML);
				if(value.innerHTML == ""){
					save = false;
					Swal.fire(
							  '無法產生複賽賽程!',
							  '勝方不能有空白',
							  'error'
							)				
				}
			});
			
			if(save){
				//先儲存預賽戰績
				$.ajax({
					type: "post",
					url: "<c:url value='/contest/SavePreliminaryRecord'/>",
					dataType: "json",
					data: {
							"contestNo": $(this).val(),
							"winners": winners
					},
					success: function(result){
						if(result.status == "success"){
							//儲存成功算戰績
							$.ajax({
								type: "post",
								url: "<c:url value='/contest/CreateRematch'/>",
								dataType: "json",
								data: {
										"contestNo": $("#createRematch").val(),
										"winners": winners
								},
								success: function(result){
									let rematchMode = "${cContestBean.sRematchMode}";
									console.log("複賽: " + rematchMode);
									$.each(result.promoteList,function(key, value){
										console.log(value);
									});
									
									let a = result.promoteList.length;
						        	$("#tree").width((a*96+(2*a)*10+20) + "px");
							        let pow = a.toString(2).length;
							        let max = Math.pow(2,pow);
							        if((max-a) == a){
							            pow = a.toString(2).length - 1;
							            max = Math.pow(2,pow);
							        }

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
							        } 
							        if((max-a) == 0){
							            $(".text" + (pow+1)).attr("class", "bottom");
							        }
							     
							        for(let i=0; i<(max-a); i++){
							            let str = i.toString(2);
							            while(str.length < pow-1){
							                str = "0" + str;
							            }
							            let eqNumber = 0;
							            for(let j=0; j<pow-1; j++){
							                eqNumber += str.split("")[j]*Math.pow(2,j+1);
							            }
							            console.log("eq的值: " + eqNumber);
							            $("#編號" + eqNumber).parent().parent().prev().before("<ul>").before("<ul>").before("<ul>").before("<ul>").parent().attr("class", "bottom");
							            $("#編號" + eqNumber).parent().parent().remove();
							        }
										
									let labels = [];
									let count = 0;
									let bottomLabel = $(".bottom").find("label")
									console.log("幾個 " + bottomLabel.length);
							        for(let i=0; i<bottomLabel.length; i++){
							        	count++;
							        	labels.push(bottomLabel.eq(i));
							        	bottomLabel.eq(i).text(result.promoteList[i]);
							        }
// 						        	bottomLabel.closest("ul").prev().text("最近" + i);
									
									for(let i=pow+1; i>1; i--){
										let promoteUp = $(".layer" + i);
										for(let j=0; j<promoteUp.length; j++){
											count++;
											labels.push(promoteUp.eq(j).prev());
// 											promoteUp.eq(j).prev().addClass("順序" + count).text("最近" + i + "," + (j+1));
										}
									}
									
// 									for(let i=0; i<labels.length; i++){
// 										labels[i].text(i+1);
// 									}
									
									window.pageYOffset = 0;
							        document.documentElement.scrollTop = 0
							        document.body.scrollTop = 0
							        let treeImage64;
							        let drowImage64;
//							         document.getElementById('tree').parentNode.style.overflow = 'visible';
							        html2canvas(document.getElementById("tree"), { useCORS: true, scale:2 }).then(function (canvas) {
//							 			document.getElementById('tree').parentNode.style.overflow = 'hidden'; 
							            treeImage64 = canvas.toDataURL("image/jpeg", 1.0);
										
							    		$.ajax({
											type:"post",
											url:"<c:url value='/contest/UpdateRematchImage'/>",
											dataType:"json",
											data:{
												"treeImage64": treeImage64,
												"contestNo": $("#createRematch").val(),
											},
											success: function(result){
												if(result.status == "success"){
													Swal.fire({
														  title: "複賽賽程產生完成!",
														  icon: "success",
														  showClass: {
															    popup: 'animate__animated animate__fadeInDown'
															  },
														  hideClass: {
															    popup: 'animate__animated animate__fadeOutUp'
															  }
													}).then(function(){
																window.setTimeout(function(){location.reload();},500);
													})
												}else if(result.status == "sqlError"){
													Swal.fire(
															  '資料庫發生錯誤!',
															  '請聯繫管理員',
															  'error'
															)
												}
												
											},
											error: function(XMLHttpRequest, textStatus, errorThrown){
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
									
								},error: function(err){
									Swal.fire(
											  '網頁發生錯誤!',
											  '請聯繫管理員',
											  'error'
											)
								}
							});
							
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
			
		});
		
		$(".tdPlayerR").on("click", function(){
			let winner = $(this).text();
			let tdWinner = $(this).parent().find(".tdWinnerR");
			if(tdWinner.text() == winner){
				tdWinner.text("");
			}else{
				tdWinner.text(winner);
			}
			
		});
		
		$("#saveRematchRecord").on("click", function(){
			
			let winners = [];
			$.each($(".tdWinnerR"), function(key, value){
				winners.push(value.innerHTML);
			});
			
			$.ajax({
				type: "post",
				url: "<c:url value='/contest/SaveRematchRecord'/>",
				dataType: "json",
				data: {
						"contestNo": $(this).val(),
						"winners": winners
				},
				success: function(result){
					if(result.status == "success"){
						let successMessage = result.successMessage;
						//要更新賽程表
						let a = result.firstRound;
						console.log("a " + a);
			        	$("#tree").width((a*96+(2*a)*10+20) + "px");
				        let pow = a.toString(2).length;
				        let max = Math.pow(2,pow);
				        if((max-a) == a){
				            pow = a.toString(2).length - 1;
				            max = Math.pow(2,pow);
				        }

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
				        } 
				        if((max-a) == 0){
				            $(".text" + (pow+1)).attr("class", "bottom");
				        }
				     
				        for(let i=0; i<(max-a); i++){
				            let str = i.toString(2);
				            while(str.length < pow-1){
				                str = "0" + str;
				            }
				            let eqNumber = 0;
				            for(let j=0; j<pow-1; j++){
				                eqNumber += str.split("")[j]*Math.pow(2,j+1);
				            }
				            console.log("eq的值: " + eqNumber);
				            $("#編號" + eqNumber).parent().parent().prev().before("<ul>").before("<ul>").before("<ul>").before("<ul>").parent().attr("class", "bottom");
				            $("#編號" + eqNumber).parent().parent().remove();
				        }
							
						let labels = [];
						let count = 0;
						let bottomLabel = $(".bottom").find("label")
						console.log("幾個 " + bottomLabel.length);
				        for(let i=0; i<bottomLabel.length; i++){
				        	count++;
				        	labels.push(bottomLabel.eq(i));
				        }
						
						for(let i=pow+1; i>1; i--){
							let promoteUp = $(".layer" + i);
							for(let j=0; j<promoteUp.length; j++){
								count++;
								labels.push(promoteUp.eq(j).prev());
							}
						}
						
// 						for(let i=0; i<labels.length; i++){
// 							labels[i].text(i+1);
// 						}
						
						for(let i=0; i<result.winnerList.length; i++){
							labels[i].text(result.winnerList[i]);
						}
						
						window.pageYOffset = 0;
				        document.documentElement.scrollTop = 0
				        document.body.scrollTop = 0
				        let treeImage64;
				        let drowImage64;
				        html2canvas(document.getElementById("tree"), { useCORS: true, scale:2 }).then(function (canvas) {
				            treeImage64 = canvas.toDataURL("image/jpeg", 1.0);
							
				    		$.ajax({
								type:"post",
								url:"<c:url value='/contest/UpdateRematchImage'/>",
								dataType:"json",
								data:{
									"treeImage64": treeImage64,
									"contestNo": $("#createRematch").val(),
								},
								success: function(result){
									if(result.status == "success"){
										
										if(successMessage){
											Swal.fire({
											      title:"冠軍產生!",
												  text: '網頁將更新賽程表',
												  icon:"success",
												  showClass: {
													    popup: 'animate__animated animate__fadeInDown'
													  },
												  hideClass: {
												    popup: 'animate__animated animate__fadeOutUp'
												  }
											  }).then(function(){
					 									window.setTimeout(function(){location.reload();},500);
					 								});
										}else{
											Swal.fire({
											      title:"更新成功!",
												  text: '網頁將更新賽程表',
												  icon:"success",
												  showClass: {
													    popup: 'animate__animated animate__fadeInDown'
													  },
												  hideClass: {
												    popup: 'animate__animated animate__fadeOutUp'
												  }
											  }).then(function(){
				 									window.setTimeout(function(){location.reload();},500);
				 								});
										}
										
										
									
									
									
									
									}else if(result.status == "sqlError"){
										Swal.fire(
												  '資料庫發生錯誤!',
												  '請聯繫管理員',
												  'error'
												)
									}
									
								},
								error: function(XMLHttpRequest, textStatus, errorThrown){
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
			
			
		});
		
	});
</script>
<script>
	$(function(){
		$("#rule").on("click","a",function(){
			this.target = "_blank";
		});
		
		$('#largeImage').on('shown.bs.modal', function() {
//				$('#myInput').trigger('focus')
			console.log("大圖");
			
		})
		
		$(".item").on("click",function(){
			$(".item").removeClass("itemChoose");
			$(this).addClass("itemChoose");
			$(".joinItem").css("background", "#28a745");
			$(".hiddenDiv").css("display","none");
			$("#" + $(this).text()).css("display","block");
		});
		
		$(".joinItem").on("click",function(){
			
			if($("#checkUser").val() == ""){
				console.log("還沒登入 ");
				$(location).attr("href", "<c:url value='/member/Sign'/>");
			}
			
			$(".item").removeClass("itemChoose");
			$(this).css("background", "#218838");
			
			if($("#teamMemberCount").val() == "1"){
				(async () => {
					const { value: accept } = await Swal.fire({
					  title: "報名比賽",
					  input: "checkbox",
					  inputValue: 1,
					  inputPlaceholder: "我同意遵守比賽規則",
					  confirmButtonText: "報名&nbsp;<i class=\"fa fa-arrow-right\"></i>",
					  inputValidator: (result) => {
					    return !result && "您必須勾選才能報名"
					  },
					  showClass: {
						    popup: 'animate__animated animate__fadeInDown'
					  }
					})
	
					if (accept) {
						$.ajax({
							type: "post",
							url: "<c:url value='/contest/Join'/>",
							dataType: "json",
							data:{},
							success: function(result){
								if(result.status == "success"){
									Swal.fire({
										  title: "報名完成",
					 					  icon: "success",
					 					  hideClass: {
					 						    popup: 'animate__animated animate__fadeOutUp'
					 					  }
								  	}).then(function(){
										window.setTimeout(function(){location.reload();},500);
									})
								}else if(result.status == "sqlError"){
									Swal.fire({
										  title: '資料庫發生錯誤!',
										  text: '請聯繫管理員',
										  icon: 'error',
										  hideClass: {
											    popup: 'animate__animated animate__fadeOutUp'
											  }
									})
								}
							},
							error: function(err){
								Swal.fire({
									  title: '網頁發生錯誤!',
									  text: '請聯繫管理員',
									  icon: 'error',
									  hideClass: {
										    popup: 'animate__animated animate__fadeOutUp'
										  }
							})
							}
						});
					}
					})()
			}else{
				let memberCount = $("#teamMemberCount").val();
				let inputString = "";
				for(let i=1; i<=memberCount; i++){
					inputString = inputString + "<h2 class='swal2-title' style='display:inline'>"+i+".</h2>"+
		  			"<input type='text' class='swal2-input signPlayer' style='width:300px' required><br>";
				}
				
				
				(async () => {
				const { value: accept } = await Swal.fire({
					  title: "請輸入參賽者的GameBar帳號",
					  html: inputString,
					  input: "checkbox",
					  inputValue: 1,
					  inputPlaceholder: "我同意遵守比賽規則",
					  confirmButtonText: "報名&nbsp;<i class=\"fa fa-arrow-right\"></i>",
					  inputValidator: (result) => {
					    return !result && "您必須勾選才能報名"
					  },
					  showClass: {
						    popup: 'animate__animated animate__fadeInDown'
					  }
					})
					
					if (accept) {
						let players = [];
						let toAjax = true;
						$.each($(".signPlayer"), function(key, value){
							if(value.value == ""){
								console.log("空白")
								Swal.fire({
								title: '參賽資料錯誤!',
								  text: '不能空白,請重新輸入',
								  icon: 'error',
								  hideClass: {
									    popup: 'animate__animated animate__fadeOutUp'
									  }
								});
								toAjax = false;
								return false;
							}
							
							let i=0;
							let player = value.value;
							$.each($(".signPlayer"), function(key, value){
								if(player == value.value){
									i++;
								}
							});
							if(i>1){
								console.log("重複");
								Swal.fire({
									title: '參賽資料錯誤!',
									  text: '參賽者重複,請重新輸入',
									  icon: 'error',
									  hideClass: {
										    popup: 'animate__animated animate__fadeOutUp'
										  }
								});
								toAjax = false;
								return false;
							}
							players.push(value.value);
// 							console.log(value.value);
						});
// 						console.log(players);
						
						if(toAjax){
							$.ajax({
								type: "post",
								url: "<c:url value='/contest/MultiJoin'/>",
								dataType: "json",
								data:{"contestNo": $("#delete").val(),//借來用
									  "players":players
								},
								success: function(result){
									if(result.status == "success"){
										Swal.fire({
											  title: "報名完成",
						 					  icon: "success",
						 					  hideClass: {
						 						    popup: 'animate__animated animate__fadeOutUp'
						 					  }
									  	}).then(function(){
											window.setTimeout(function(){location.reload();},500);
										})
									}else if(result.status == "noUserError"){
										Swal.fire({
											  title: '參賽資料錯誤!',
											  text: '參賽帳號不是GameBar會員,請重新輸入',
											  icon: 'error',
											  hideClass: {
												    popup: 'animate__animated animate__fadeOutUp'
												  }
										});
									}else if(result.status == "playerError"){
										Swal.fire({
											  title: '參賽資料錯誤!',
											  text: '有參賽帳號已參加本場賽事,請重新輸入',
											  icon: 'error',
											  hideClass: {
												    popup: 'animate__animated animate__fadeOutUp'
												  }
										});
									}
											
								},
								error: function(XMLHttpRequest, textStatus, errorThrown){
									Swal.fire({
										  title: '網頁發生錯誤!',
										  text: '請聯繫管理員',
										  icon: 'error',
// 										  showClass: {
// 											    popup: 'animate__animated animate__fadeInDown'
// 											  },
										  hideClass: {
											    popup: 'animate__animated animate__fadeOutUp'
											  }
									});
								}
								
							});
						}
						
						
						
						
					}
				})()
				
			}
			
			
			
			
		});
		
		$("#quitContest").on("click", function(){
			console.log($(this).val());
			Swal.fire({
				showClass: {
				    popup: 'animate__animated animate__fadeInDown'
				  },
				  title: '確定退出比賽?',
				  icon: 'warning',
				  showCancelButton: true,
				  confirmButtonColor: '#d33',
				  cancelButtonColor: '#3085d6',
				  confirmButtonText: '退出比賽',
			      cancelButtonText: '取消',
					hideClass: {
					    popup: 'animate__animated animate__fadeOutUp'
					  }
				}).then((result) => {
				  if (result.isConfirmed) {
					  $.ajax({
							type: "delete",
							url: "<c:url value='/contest/Quit/" + $(this).val() + "'/>",
							dataType: "json",
							data: {},
							success: function(result){
								if(result.status == "success"){
									Swal.fire({
											      title:"退出成功!",
												  icon:"success",
												  hideClass: {
												    popup: 'animate__animated animate__fadeOutUp'
												  }
											  }).then(function(){
												window.setTimeout(function(){location.reload();},500);
												
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
				});

		});
		
		$("#showOption").on("click", function(){
			this.target = "_blank";
		});
		
	
	});
</script>

</body>
</html>
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
	background-color:#0069d9;
}

.item{
	margin-top:10px
}
/* table, th, td { */
/*   border: 1px solid black; */
/*   text-align:center; */
/* } */
/* table { */
/*   width: 50%; */
/*   table-layout:fixed; */
/*   word-wrap:break-word; */
/* } */

</style>

<script src='//cdn.datatables.net/1.10.23/js/jquery.dataTables.min.js'></script>
<link rel='stylesheet' href='https://cdn.datatables.net/1.10.23/css/jquery.dataTables.min.css'>
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
		<div >
			<label class="btn btn-primary item itemChoose">總覽</label>
			<label class="btn btn-primary item">參賽者</label>
			<label class="btn btn-primary item">賽程</label>
			<c:choose>
	    		<c:when test="${cContestBean.sHost == user.sAccount}">
					<label class="btn btn-primary item">更新戰績</label>
	    		</c:when>
	    		<c:otherwise>
					<label class="btn btn-primary item">戰績</label>
	    		</c:otherwise>
	    	</c:choose>
			<c:set var="joinStatus" value="true"/>
			
<!-- 				團體賽要從參加組別拆自串比對 -->
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
		
		<hr>
		<div id="總覽" class="hiddenDiv">
			<c:if test="${cContestBean.sHost == user.sAccount }">
            	<fmt:formatDate var="dTime" value="${cContestBean.tTime}" pattern="yyyy-MM-dd"/>
				<c:choose>
					<c:when test="${dTime <= today}">
						<span style="color:gray">更改</span>
					</c:when>
					<c:otherwise>
						<a class="btn btn-primary" href="<c:url value='/contest/Update/${cContestBean.iNo}'/>">更改</a>
					</c:otherwise>
				</c:choose>
				<button class="btn btn-primary" type="submit" id="delete" value="${cContestBean.iNo}">刪除</button>
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
								<a id="showOption" class="btn btn-primary" href="<c:url value='/contest/Schedule/${cContestBean.iNo}'/>">編輯賽程</a>
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
			
			<a class="btn btn-primary" data-toggle="collapse" href="#preliminaryCollapse" role="button" aria-expanded="false" aria-controls="collapseExample">預賽戰績</a>
			
			<div class="collapse show" id="preliminaryCollapse" style="margin-top:20px;margin-bottom:20px">
	  			<div class="card card-body">	
					<table border="1" id="preliminaryTable" style="text-align:center;">
		
						<thead>
						<tr>
							<th>組別</th>
							<th>參賽者1</th>
							<th>參賽者2</th>
							<th>勝方</th>
						</tr>
						</thead>
<!-- 						<thead class="downOption"> -->
<!-- 						<tr> -->
<!-- 							<th>組別2</th> -->
<!-- 							<th>參賽者12</th> -->
<!-- 							<th>參賽者22</th> -->
<!-- 							<th>勝方2</th> -->
<!-- 						</tr> -->
<!-- 						</thead> -->
						<tfoot>
				            <tr>
				                <th>組別</th>
				                <th>參賽者1</th>
				                <th>參賽者2</th>
				                <th>勝方</th>
				            </tr>
				        </tfoot>
				        <tbody>
							<c:forEach var="record" items="${lPreliminaryRecord}">
								<tr>	
									<td>${record.iGroundNo}</td>
									<td>${record.sPlayers1}</td>
									<td>${record.sPlayers2}</td>
<%-- 									<td><button class="btn btn-primary">${record.sPlayers1}</button></td> --%>
<%-- 									<td><button class="btn btn-primary">${record.sPlayers2}</button></td> --%>
									<td>${record.sWinner}</td>
								</tr>
							</c:forEach>
				        </tbody>
					</table>
				</div>
			</div>
			
			
			
			
			
<%-- 			<c:forEach var="recordListCount" begin="1" end="${fn:length(lGroupRecord)}"> --%>
<%-- 				<label>第${recordListCount}組:</label> --%>
<%-- 				<c:forEach var="record" items="${lGroupRecord[recordListCount-1]}"> --%>
<%-- 					<label>&nbsp;${record.sPlayers}</label> --%>
<%-- 				</c:forEach> --%>
				
<%-- 				<c:if test="${cContestBean.sHost == user.sAccount}"> --%>
<%-- 					<c:choose> --%>
<%-- 						<c:when test="${empty lGroupRecordDetail[recordListCount-1]}"> --%>
<%-- 							<button class="btn btn-primary savePreliminaryRecord" value="${recordListCount}">儲存第${recordListCount}組紀錄</button> --%>
<%-- 						</c:when> --%>
<%-- 						<c:otherwise> --%>
<%-- 							<button class="btn btn-primary savePreliminaryRecord" value="${recordListCount}" disabled>儲存第${recordListCount}組紀錄</button> --%>
<%-- 						</c:otherwise> --%>
<%-- 					</c:choose> --%>
<%-- 				</c:if> --%>
				
<!-- 				<br> -->
<%-- 				 <c:set var="count" value="0"/> --%>
<!-- <!-- 				 算win位置要用的計數器 --> 
<%-- 				<c:forEach var="recordCount" begin="1" end="${fn:length(lGroupRecord[recordListCount-1])}"> --%>
					
<%-- 					<c:forEach var="matchCount" begin="${recordCount+1}" end="${fn:length(lGroupRecord[recordListCount-1])}"> --%>
<!-- 						<label>對戰:</label><br> -->
<!-- 						<table> -->
<!-- 							<tr> -->
<!-- 								<th style="width:20%">勝方</th> -->
<%-- 								<c:choose> --%>
<%-- 									<c:when test="${empty lGroupRecordDetail[recordListCount-1]}"> --%>
<%-- 										<th style="width:40%" colspan="2" class="win group${recordListCount}"></th> --%>
<%-- 									</c:when> --%>
<%-- 									<c:otherwise> --%>
<%-- 										<th style="width:40%" colspan="2" class="win group${recordListCount}">${lGroupRecordDetail[recordListCount-1][count].sWin}</th> --%>
<%-- 										 <c:set var="count" value="${count+1}"/> --%>
<%-- 									</c:otherwise> --%>
<%-- 								</c:choose> --%>
<!-- 							</tr> -->
<!-- 							<tr> -->
<!-- 								<td style="width:20%">參賽者</td> -->
								
<%-- 								<c:choose> --%>
<%-- 									<c:when test="${cContestBean.sHost == user.sAccount}"> --%>
<%-- 										<c:choose> --%>
<%-- 											<c:when test="${empty lGroupRecordDetail[recordListCount-1]}"> --%>
<%-- 												<td style="width:40%"><button class="btn btn-primary choosePlayer">${lGroupRecord[recordListCount-1][recordCount-1].sPlayers}</button></td> --%>
<%-- 												<td style="width:40%"><button class="btn btn-primary choosePlayer">${lGroupRecord[recordListCount-1][matchCount-1].sPlayers}</button></td> --%>
<%-- 											</c:when> --%>
<%-- 											<c:otherwise> --%>
<%-- 												<td style="width:40%"><button class="btn btn-primary choosePlayer" disabled>${lGroupRecord[recordListCount-1][recordCount-1].sPlayers}</button></td> --%>
<%-- 												<td style="width:40%"><button class="btn btn-primary choosePlayer" disabled>${lGroupRecord[recordListCount-1][matchCount-1].sPlayers}</button></td> --%>
<%-- 											</c:otherwise> --%>
<%-- 										</c:choose> --%>
<%-- 									</c:when> --%>
<%-- 									<c:otherwise> --%>
<%-- 										<td style="width:40%">${lGroupRecord[recordListCount-1][recordCount-1].sPlayers}aaaaaaaaaaaaaaaaaaaaabbbbbbbbbbbbbbbbbbbbbbb</td> --%>
<%-- 										<td style="width:40%">${lGroupRecord[recordListCount-1][matchCount-1].sPlayers}aaaaaaaaaaaaaaaaaaaaabbbbbbbbbbbbbbbbbbbbbbb</td> --%>
<%-- 									</c:otherwise> --%>
<%-- 								</c:choose> --%>
<!-- 							</tr> -->
<!-- 						</table> -->
<%-- 					</c:forEach> --%>
<%-- 				</c:forEach> --%>
<!-- 				<hr> -->
<%-- 			</c:forEach> --%>



			<hr>
			<p>複賽戰績:</p>
			



		</div>
		
		
		
</div>
<%@ include file="../Foot.jsp"%>

<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript">
	$(function(){
		
		$('#preliminaryTable').DataTable({
			"fixedHeader": true,
			fixedColumns:   {
		        leftColumns: 5 //左側要固定的欄目數，如果右側需要固定可以用 rightColunms
		    },
			language: {
    		    "lengthMenu": "顯示_MENU_筆資料",
    		    "sProcessing": "處理中...",
    		    "sZeroRecords": "没有符合的資料",
    		    "sInfo": "目前有_MAX_筆資料",
    		    "sInfoEmpty": "目前共有 0 筆紀錄",
    		    "sInfoFiltered": " ",
    		    "sInfoPostFix": "",
    		    "sSearch": "尋找:",
    		    "sUrl": "",
    		    "sEmptyTable": "尚未有資料紀錄存在",
    		    "sLoadingRecords": "載入資料中...",
    		    "sInfoThousands": ",",
    		    "oPaginate": {
    		        "sFirst": "首頁",
    		        "sPrevious": "上一頁",
    		        "sNext": "下一頁",
    		        "sLast": "末頁"
    		    },
    		    "order": [[0, "desc"]],
    		    "oAria": {
    		        "sSortAscending": ": 以升序排列此列",
    		        "sSortDescending": ": 以降序排列此列"
    		    }
    		},
			initComplete: function () {
	            var api = this.api();
	            api.columns().indexes().flatten().each( function ( i ) {
	                var column = api.column( i );
	                var select = $('<select><option value=""></option></select>')
	                    .appendTo( $(column.footer()).empty() )
	                    .on( 'change', function () {
	                        var val = $.fn.dataTable.util.escapeRegex(
	                            $(this).val()
	                        );
	                        column
	                            .search( val ? '^'+val+'$' : '', true, false )
	                            .draw();
	                    } );
	                column.data().unique().sort().each( function ( d, j ) {
// 	                    select.append( '<option value="123">'+"123"+'</option>' )
						console.log("d " + d);
	                    select.append( '<option value="'+d+'">'+d+'</option>' )
	                } );
	            } );
	        }
		
		
		});
		
		
// 		var table = $('#preliminaryTable').DataTable();
		 
// 		table
// 		    .column( 1 )
// 		    .data()
// 		    .each( function ( value, index ) {
		    	
// 		        console.log( 'Data in index: '+index+' is: '+value.split(">")[1].split("<")[0] );
// 		    } );
		
		
		
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
		
// 		$(".choosePlayer").on("click", function(){
// 			$(this).parent().parent().prev().find(".win").text($(this).text());
// 		});
		
// 		$(".savePreliminaryRecord").on("click", function(){
			
// 			let win = [];
// 			let catchSpace = false;
// 			$.each($(".group" + $(this).val()), function(key, value){
// 				win.push(value.innerHTML);
// 				console.log(value.innerHTML);
// 				if(value.innerHTML == ""){
// 					catchSpace = true;
// 				}
// 			});
// 			if(catchSpace){
// 				Swal.fire({
// 					  title: "發生錯誤!",
// 					  text: "不能儲存空白勝方,請更改",
// 					  icon: 'error',
// 					showClass: {
// 					    popup: 'animate__animated animate__fadeInDown'
// 					  },
// 						hideClass: {
// 						    popup: 'animate__animated animate__fadeOutUp'
// 						  }
// 					})
// 			}else{
// 				Swal.fire({
// 					  title: '確定儲存戰績?',
// 					  text: "儲存之後將不能更改,請再三檢查",
// 					  icon: 'warning',
// 					  showCancelButton: true,
// 					  confirmButtonColor: '#d33',
// 					  cancelButtonColor: '#3085d6',
// 					  confirmButtonText: '儲存',
// 				      cancelButtonText: '取消',
// 					  showClass: {
// 					    popup: 'animate__animated animate__fadeInDown'
// 					  },
// 					  hideClass: {
// 						popup: 'animate__animated animate__fadeOutUp'
// 					  }
// 					}).then((result) => {
// 						  if (result.isConfirmed) {
// 							  $.ajax({
// 									type: "post",
// 									url: "<c:url value='/contest/SaveRecord'/>",
// 									dataType: "json",
// 									data: {
// 											"contestNo": $("#delete").val(),//借來用
// 											"groupNo": $(this).val(),
// 											"win": win
// 									},
// 									success: function(result){
// 										if(result.status == "success"){
// 											Swal.fire({
// 													      title:"儲存成功!",
// 														  icon:"success",
// 														  hideClass: {
// 														    popup: 'animate__animated animate__fadeOutUp'
// 														  }
// 													  }).then(function(){
// 														window.setTimeout(function(){location.reload();},500);
														
// 													})
// 										}else if(result.status == "sqlError"){
// 											Swal.fire(
// 													  '資料庫發生錯誤!',
// 													  '請聯繫管理員',
// 													  'error'
// 													)
// 										}
// 									},
// 									error: function(err){
// 										Swal.fire(
// 												  '網頁發生錯誤!',
// 												  '請聯繫管理員',
// 												  'error'
// 												)
// 									}
									
// 								});		
// 						  }
// 						});
// 			}
			
// 		});
		
		
		
		
		
	
	});
</script>

</body>
</html>
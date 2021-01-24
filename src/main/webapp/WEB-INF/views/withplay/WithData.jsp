<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="../css/WithGame.css">
<title>會員資料</title>
<%@ include file="../Link.jsp"%>

<script src='//cdn.datatables.net/1.10.23/js/jquery.dataTables.min.js'></script>
<link rel='stylesheet'
	href='https://cdn.datatables.net/1.10.23/css/jquery.dataTables.min.css'>
<style>
 #DIV1 { 
  	margin-left: 50;  
 } 

#DIV2 { 
 	margin-left: 100; 
 	padding-left:65px;
 } 

/* #DIV2 td{  */
/* 	font-size:1.5em;  */
/* }  */

.leftBar {
	width: 450px;
	height: 80px;
	border: 2px solid black;
	background-color: #fff;
	margin: auto;
	margin-bottom: 100px;
	font-size: 1.5em;
	font-weight: bold;
	border: 1px solid rgba(0,0,0,.125);
    border-radius: .25rem;
}

.leftBar:hover {
	background-color: white;
	color: black;
}


.row {
  flex-grow: 1; /*可佔滿垂直剩餘的空間*/
}

</style>
</head>
<body>
<!-- 	<H1 align='center'>會員資料管理</H1> -->
	<hr>
	<%@ include file="../Header.jsp"%>

	<div class="row">
		<div id="DIV1" class="col-md-2">
			<H1>相關記錄</H1>
			<table>
				<tr>
					<td class="leftBar"><a href="<c:url value='/member/Data'/>">會員資料</a></td>
				</tr>
				<tr>
					<td class="leftBar"><a href="####">商城記錄</a></td>
				</tr>
				<tr>
					<td class="leftBar"><a href="<c:url value="/forum/gotoMemberData"/>">討論區記錄</a></td>
				</tr>
				<tr>
					<td class="leftBar"><a href="<c:url value="/withplay/gotoMemberData"/>">陪玩記錄</a></td>
				</tr>
				<tr>
					<td class="leftBar"><a
						href="<c:url value="/contest/gotoMemberData"/>">賽事記錄</a></td>
				</tr>
				<tr>
					<td class="leftBar"><a
						href="<c:url value="/exchange/gotoMemberData"/>">交換記錄</a></td>
				</tr>
			</table>
		</div>
		<div id="DIV2" class="col-md-9">
			<div id="accordion">
				<h1 style="color:black">${user.sAccount }的陪玩記錄</h1>
				<div class="card">
					<div class="card-header" id="headingOne">
						<h5 class="mb-0">
							<button class="btn btn-link" data-toggle="collapse"
								data-target="#collapseOne" aria-expanded="true"
								aria-controls="collapseOne"> 我的訂單共${fn:length(WithOrder)}筆</button>
						</h5>
					</div>
	
					<div id="collapseOne" class="collapse show"
						aria-labelledby="headingOne" data-parent="#accordion">
						<div class="card-body">
							
							<c:choose>
								<c:when test="${empty WithOrder}">
									<span>查無資料</span>
								</c:when>
								<c:otherwise>
									
									<table border="1" id="table1" class="display" style="text-align:center;">
										<thead>
										<tr>
											<th>編號</th>
											<th>照片</th>
											<th>陪玩師</th>
											<th>訂單時間</th>
											<th>遊戲</th>
											<th >消費金額</th>
											<th>狀態</th>
										</tr>
										</thead>
										<c:forEach items="${WithOrder}" var="Order" varStatus="status">
											<tr>	
												<td>${status.count}</td>
												<td><img style="width:150px;height:150px;"class="img1" src='${pageContext.request.contextPath}/withplay/picture/${Order.with.iId}'>
															</td>
												<td >${Order.with.sNickname}</td>
												<td>${Order.dDate}</td>
												<td>${Order.sGame}</td>
												<td>${Order.iPrice}</td>
												<td>
													<c:choose>
													<c:when test="${Order.member.sAccount == user.sAccount&& Order.iStatus == 1 }">
													<span style="font-weight:bold;font-size:20px;">等待確認</span>						
													</c:when>
													<c:when test="${Order.member.sAccount == user.sAccount&& Order.iStatus == 2 }">
													<span style="font-weight:bold;font-size:20px;">確認成功</span>
													</c:when>
													<c:when test="${Order.member.sAccount == user.sAccount&& Order.iStatus == 3 }">
													<span style="font-weight:bold;font-size:20px;">該筆訂單未成立</span>
													</c:when>
													<c:when test="${Order.member.sAccount == user.sAccount&& Order.iStatus == 4 }">
													<span style="font-weight:bold;font-size:20px;">訂單完成</span>
													</c:when>
													<c:otherwise>
													</c:otherwise>						
													</c:choose>        	
												</td>
											</tr>
										</c:forEach>
									</table>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
				</div>
	
				<div class="card">
					<div class="card-header" id="headingFive">
						<h5 class="mb-0">
							<button class="btn btn-link collapsed" data-toggle="collapse"
								data-target="#collapseFive" aria-expanded="false"
								aria-controls="collapseFive">陪玩師目前訂單${fn:length(WithOrder2)}筆</button>
						</h5>
					</div>
					<div id="collapseFive" class="collapse"
						aria-labelledby="headingFive" data-parent="#accordion">
						<div class="card-body">
						
						<c:choose>
								<c:when test="${empty WithOrder2}">
									<span>查無資料</span>
								</c:when>
								<c:otherwise>
									
									<table border="1" id="table2" class="display" style="text-align:center;">
										<thead>
										<tr>
											<th>編號</th>
											<th>照片</th>
											<th>會員</th>
											<th>訂單時間</th>
											<th>遊戲</th>
											<th >消費金額</th>
											<th>狀態</th>
											<th>功能</th>
										</tr>
										</thead>
										<c:forEach items="${WithOrder2}" var="withOrder" varStatus="status">
											<tr>
												<td>${status.count}</td>
												<td><img style="width:150px;height:150px;"class="img1" src='${pageContext.request.contextPath}/withplay/picture/${withOrder.member.iNo}'>
															</td>
												<td >${withOrder.member.sNickname}</td>
												<td>${withOrder.dDate}</td>
												<td>${withOrder.sGame}</td>
												<td>${withOrder.iPrice}</td>
												<td>
													<c:choose>
													<c:when test="${withOrder.with.sAccount == user.sAccount && withOrder.iStatus == 1}">
													<span style="font-weight:bold;font-size:20px;">尚未回覆</span>
													</c:when>
													<c:when test="${withOrder.with.sAccount == user.sAccount && withOrder.iStatus == 2}">
													<span style="font-weight:bold;font-size:20px;">尚未執行</span>	
													<HR>				
													<button  class="btn btn-primary" onclick="Okfinish(${withOrder.iNo})" >完成訂單</button>
													</c:when>
													<c:when test="${withOrder.with.sAccount == user.sAccount && withOrder.iStatus == 3}">
												
													<span style="font-weight:bold;font-size:20px;">該筆訂單遭您拒絕</span>							
													</c:when>
													<c:when test="${withOrder.with.sAccount == user.sAccount && withOrder.iStatus == 4}">
													<span style="font-weight:bold;font-size:20px;">已完成該筆訂單</span>							
													</c:when>
													
													<c:otherwise>
													</c:otherwise>						
													</c:choose>        	
												</td>
												<td >
												<c:choose>	
												<c:when test="${ withOrder.iStatus == 1}">
												<button  class="btn btn-primary" onclick="Ok(${withOrder.iNo})" >接受</button>
												<HR>									
												<button  class="btn btn-danger"  onclick="Reject(${withOrder.iNo})" >拒絕</button>					
												</c:when>
												<c:otherwise>
												<button  class="btn btn-primary" disabled="disabled" onclick="Ok(${withOrder.iNo})" >接受</button>
												<HR>									
												<button  class="btn btn-danger" disabled="disabled" onclick="Reject(${withOrder.iNo})" >拒絕</button>	
												</c:otherwise>				
												</c:choose>
												</td>
											</tr>
										</c:forEach>
									
									
									
									</table>
								</c:otherwise>
							</c:choose>
						
						</div>
					</div>
				</div>
	
			</div>
	
		</div>
	</div>

	<%@ include file="../Foot.jsp"%>
</body>
<script>
function Ok(iNo){
	 Swal.fire({
		  title: '確定接受訂單?',
		  text: "接受訂單後，請務必配合會員時間進行遊戲",
		  icon: 'warning',
		  showCancelButton: true,
		  confirmButtonColor: '#3085d6',
		  cancelButtonColor: '#d33',
		  confirmButtonText: '確定',
		  cancelButtonText:'取消',
		  closeOnCancel: true
		}).then((result) => {
		  if (result.isConfirmed) {
		    window.location.href="<c:url value='WithorderOklist?iNO="+iNo+"'/>"
		  }
		return false;
		})
	}
	
function Okfinish(iNo){
	 Swal.fire({
		  title: '請再三確認該筆訂單完成',
		  text: "確認無誤，按下確認",
		  icon: 'warning',
		  showCancelButton: true,
		  confirmButtonColor: '#3085d6',
		  cancelButtonColor: '#d33',
		  confirmButtonText: '確認',
		  cancelButtonText:'取消',
		  closeOnCancel: true
		}).then((result) => {
		  if (result.isConfirmed) {
		    window.location.href="<c:url value='WithorderOklist?iNO="+iNo+"'/>"
		  }
		return false;
		})
	}

function Reject(iNo){
	 Swal.fire({
		  title: '確定拒絕訂單??',
		  text: "請再三思考是否拒絕此筆訂單",
		  icon: 'warning',
		  showCancelButton: true,
		  confirmButtonColor: '#3085d6',
		  cancelButtonColor: '#d33',
		  confirmButtonText: '拒絕訂單',
		  cancelButtonText:'取消',
		  closeOnCancel: true
		}).then((result) => {
		  if (result.isConfirmed) {
		    window.location.href="<c:url value='WithorderReject?iNO="+iNo+"'/>"
		  }
			return false;
		})
	}
	
$(document).ready(function() {
	
	$(function(){
		$('#table1').DataTable({
			language: {
  		    "lengthMenu": "顯示_MENU_筆資料",
  		    "sProcessing": "處理中...",
  		    "sZeroRecords": "没有匹配结果",
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
  		}
		});
		
	})
	
		$(function(){
		$('#table2').DataTable({
			language: {
  		    "lengthMenu": "顯示_MENU_筆資料",
  		    "sProcessing": "處理中...",
  		    "sZeroRecords": "没有匹配结果",
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
  		}
		});
		
	})
	
	
});
</script>
</html>

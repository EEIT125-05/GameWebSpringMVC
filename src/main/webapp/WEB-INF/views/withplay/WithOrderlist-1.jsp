<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../Link.jsp"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script src='//cdn.datatables.net/1.10.23/js/jquery.dataTables.min.js'></script>
<link rel='stylesheet' href='https://cdn.datatables.net/1.10.23/css/jquery.dataTables.min.css'>
<link rel="stylesheet" href="../css/WithGame.css">
<title>訂單管理</title>
<!-- <script src="../js/With.js"></script> -->

</head>
<body>
	<%@ include file="../Header.jsp"%>
<div class="container">

<ol class="breadcrumb">
      <li class="breadcrumb-item">
        <a href="<c:url value='/'/>">Home</a>
      </li>
      <li class="breadcrumb-item active">管理資料</li>
    </ol>

	<div align="center" >
		<form method='POST'>
			<input type='hidden' name='_method' value='DELETE'>
		</form>
		
			<h1>${user.sNickname}你好</h1>
		</div>	
	<p>
  <a class="btn btn-primary" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample"" >
    我的訂單共${fn:length(WithOrder)}筆
  </a>
<%--   <c:if test="${not empty MemberPending}"> --%>
<%--   	<span id="warningSpan" style="color:red;">您有${fn:length(MemberPending)}筆交換待確認！</span> --%>
<%--   </c:if> --%>
  
</p>


<div class="collapse show" id="collapseExample" >
  <div class="card card-body">	
	
		<table border="1" id="table1" class="display" style="text-align:center;">

			<thead>
			<tr>
				<th>編號</th>
				<th>照片</th>
				<th>陪玩主</th>
				<th>訂單時間</th>
				<th>遊戲</th>
				<th >消費金額</th>
				<th>狀態</th>
				<th >自我介紹</th>
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
						等待確認
						</c:when>
						<c:when test="${Order.member.sAccount == user.sAccount&& Order.iStatus == 2 }">
						確認成功
						</c:when>
						<c:otherwise>
						</c:otherwise>						
						</c:choose>        	
					</td>
					<td>${With.iPrice}</td>
				</tr>
			</c:forEach>
		</table>
		  </div>
  
  <br>
  
</div>

<p>
  <a class="btn btn-primary" data-toggle="collapse" href="#collapseExample2" role="button" aria-expanded="false" aria-controls="collapseExample2">
    	我要徵共${fn:length(WithOrder2)}筆
  </a>
</p>

<div class="collapse show" id="collapseExample2" >
  <div class="card card-body">	
	
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
						尚未回覆
						</c:when>
						<c:when test="${withOrder.with.sAccount == user.sAccount && withOrder.iStatus == 2}">
						成功
						<bR>
						尚未執行
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
					<button  class="btn btn-primary"  onclick="Reject(${withOrder.iNo})" >拒絕</button>					
					</c:when>
					<c:otherwise>
					<button  class="btn btn-primary" disabled="disabled" onclick="Ok(${withOrder.iNo})" >接受</button>
					<HR>									
					<button  class="btn btn-primary" disabled="disabled" onclick="Reject(${withOrder.iNo})" >拒絕</button>	
					</c:otherwise>				
					</c:choose>
					</td>
				</tr>
			</c:forEach>
		</table>
		  </div>
  
  <br>
  
</div>


	</div>
	<div align="center">
		<a href="${pageContext.servletContext.contextPath}/withplay/Index">陪玩首頁</a>
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

function Reject(iNo){
	 Swal.fire({
		  title: '確定刪除資料?',
		  text: "刪除後不可回復，請確定操作!",
		  icon: 'warning',
		  showCancelButton: true,
		  confirmButtonColor: '#3085d6',
		  cancelButtonColor: '#d33',
		  confirmButtonText: '刪除',
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
	

// 	$('.deletelink').click(function() {
// 		if (confirm('確定刪除此筆紀錄? ')) {
// 			var href = $(this).attr('href');
// 			$('form').attr('action', href).submit();
// 		}
// 		return false;

// 	});
	
});
</script>
</html>

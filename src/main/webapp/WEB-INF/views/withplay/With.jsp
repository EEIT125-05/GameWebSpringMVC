<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ include file="../Link.jsp"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src='//cdn.datatables.net/1.10.23/js/jquery.dataTables.min.js'></script>
<link rel='stylesheet' href='https://cdn.datatables.net/1.10.23/css/jquery.dataTables.min.css'>
<link rel="stylesheet" href="../css/WithGame.css">
<link rel="stylesheet" href="../css/WithGame.css">
<title>會員資料管理</title>
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
		<table border="1" id="table1" class="display">

			<thead>
			<tr>
				<th>帳號</th>
				<th >姓名</th>
				<th >暱稱</th>
				<th>ID</th>
				<th>性別</th>
				<th >遊戲</th>
				<th>照片</th>
				<th >自我介紹</th>
				<th>價格</th>
				<th>功能</th>
			</tr>
			</thead>
			<c:forEach items="${With}" var="With" varStatus="status">
				<tr>
					<td>${With.sAccount}</td>
					<td >${With.sName}</td>
					<td>${With.sNickname}</td>
					<td>${With.sIdcode}</td>
					<td>${With.sGender == 'F' ? "女" : "男" }</td>
					<td>${With.sGame}</td>
					<td><img style="width:150px;height:150px;"class="img1"
						src='${pageContext.request.contextPath}/withplay/picture/${With.iId}' /></td>
					<td style="word-break: break-all; width:300px" >${With.sComment}</td>
					<td>${With.iPrice}</td>
					<td><a class='btn btn-outline-dark'
						href="${pageContext.request.contextPath}/withplay/edit/${With.iId}">Edit</a>
						&nbsp;&nbsp; 
<!-- 						<a class='deletelink' -->
<%-- 						href="${pageContext.request.contextPath}/withplay/delete/${With.iId}">Delete</a> --%>
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<div align="center">
		<a href="${pageContext.servletContext.contextPath}/withplay/Index">陪玩首頁</a>
	</div>
</div>
	<%@ include file="../Foot.jsp"%>

</body>
<script>

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

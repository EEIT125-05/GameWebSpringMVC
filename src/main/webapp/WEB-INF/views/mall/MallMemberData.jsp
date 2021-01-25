<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<sql:setDataSource var="ds"
	driver="com.microsoft.sqlserver.jdbc.SQLServerDriver"
	url="jdbc:sqlserver://localhost:1433;DatabaseName=GameSpringMVCDB"
	user="sa" password="sa123456" />
<sql:query
	sql="select * from BusinessHistoryTable bh,BusinessDetailTable bd,MalllistTable mt WHERE bh.sAccount like '%${user.sAccount}%'and bd.fk_cartid=bh.iNO and mt.name=bd.sCartName order by fk_cartid "
	var="rs" dataSource="${ds}" />

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
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
	padding-left: 65px;
}

#DIV2 td {
	font-size: 1.5em;
}

.leftBar {
	width: 450px;
	height: 80px;
	border: 2px solid black;
	background-color: #fff;
	margin: auto;
	margin-bottom: 100px;
	font-size: 1.5em;
	font-weight: bold;
	border: 1px solid rgba(0, 0, 0, .125);
	border-radius: .25rem;
}

.row {
	flex-grow: 1; /*可佔滿垂直剩餘的空間*/
}
</style>
</head>
<body>
	<!-- 	<H1 align='center'>會員資料管理</H1> -->
	<!-- 	<hr> -->
	<%@ include file="../Header.jsp"%>

	<div class="row">
		<div id="DIV1" class="col-md-2">
			<H1>相關記錄</H1>
			<table>
				<tr>
					<td class="leftBar"><a href="<c:url value='/member/Data'/>">會員資料</a></td>
				</tr>
				<tr>
					<td class="leftBar"><a"<c:url value="/mall/gotoMemberData"/>">商城記錄</a></td>
				</tr>
				<tr>
					<td class="leftBar"><a
						href="<c:url value="/forum/gotoMemberData"/>">討論區記錄</a></td>
				</tr>
				<tr>
					<td class="leftBar"><a
						href="<c:url value="/withplay/gotoMemberData"/>">陪玩記錄</a></td>
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
				<h1 style="color: black">${user.sAccount }的訂單</h1>
				<div class="card">
					<div class="card-header" id="headingOne">
						<h5 class="mb-0">
							<button class="btn btn-link" data-toggle="collapse"
								data-target="#collapseOne" aria-expanded="true"
								aria-controls="collapseOne">我的訂單資料</button>
						</h5>
					</div>

					<div id="collapseOne" class="collapse show"
						aria-labelledby="headingOne" data-parent="#accordion">
						<div class="card-body">



							<table border="1" id="tableHost" class="table table-hover"
								style="font-size: 12px; border: 3px">
								<thead>
									<tr>
										<th>訂單編號</th>
										<th>會員</th>
										<th>商品</th>
										<th>數量</th>
										<th>價錢</th>
										<th>總額</th>
										<th>訂單時間</th>
									</tr>
								</thead>
								<c:forEach var="row" items="${rs.rows}">
									<tr>
										<td>${row.fk_cartid}</td>
										<td>${row.sAccount}</td>
										<td>${row.sCartName}</td>
										<td>${row.iQty}</td>
										<td>${row.money}</td>
										<td>${row.money*row.iQty}</td>

										<td>${row.tTime}</td>
										<%-- 					<td>${row.fMoney}</td> --%>

									</tr>

								</c:forEach>






							</table>
						</div>
						</table>
						
					</div>
				</div>
			</div>



		</div>

	</div>
	</div>

	<%@ include file="../Foot.jsp"%>
</body>
<script>
	$(function(){
		
		$("#DIV2").on("click","a",function(){
			this.target = "_blank";
		});	
		
		$(".delete").on("click", function(){
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
				});

		});
		
		
		$('#tableHost').DataTable({
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
		
	
		$('#tableParticipate').DataTable({
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
		
		
	});
</script>
</html>

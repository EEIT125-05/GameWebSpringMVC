<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../Link.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
response.setContentType("text/html;charset=UTF-8");
response.setHeader("Cache-Control", "no-cache"); // HTTP 1.1
response.setHeader("Pragma", "no-cache"); // HTTP 1.0
response.setDateHeader("Expires", -1); // Prevents caching at the proxy server
%>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>會員資料</title>

<script src='//cdn.datatables.net/1.10.23/js/jquery.dataTables.min.js'></script>
<link rel='stylesheet' href='https://cdn.datatables.net/1.10.23/css/jquery.dataTables.min.css'>
<style>
/* input { */
/* 	border-radius: 5px; */
/* } */

#DIV1 {
	width: 350px;
	line-height: 50px; 
	padding: 10px;
	border: 5px gray solid;
	margin-left: 50;
	float: left;
}

#DIV2 {
	background-color: #272727;
/* 	color: white; */
/* 	width: 600px; */
/* 	line-height: 50px; */
 	margin-left: 100;
 	padding: 20px;
 	border: 5px gray solid; 
 	float: left; 
}

.a {
	width: 450px;
	height: 80px;
	border: 2px solid black;
	background-color: #272727;
	margin: auto;
	margin-bottom: 100px;
	font-size: 50;
	font-weight: 900;
}

.a:hover {
	background-color: white;
	color: black;
}

.b {
	background-color: #272727;
/* 	color: white; */
	font-size: 30;
	font-weight: 900;
}

.b:hover {
	color: #00FFFF;
}
</style>
</head>
<body>
	<H1 align='center'>會員資料管理</H1>
	<hr>
	<%@ include file="../Header.jsp"%>
	<div id="DIV1">
		<H1>相關記錄</H1>
		<table>
			<tr>
				<td class="a"><a href="####">商城記錄</a></td>
			</tr>
			<tr>
				<td class="a"><a href="<c:url value="/forum/gotoMemberData"/>">討論區記錄</a></td>
			</tr>
			<tr>
				<td class="a"><a href="####">陪玩記錄</a></td>
			</tr>
			<tr>
				<td class="a"><a href="<c:url value="/contest/gotoMemberData"/>">賽事記錄</a></td>
			</tr>
			<tr>
				<td class="a"><a href="<c:url value="/exchange/gotoMemberData"/>">交換記錄</a></td>
			</tr>
		</table>
	</div>
	<div class="container" id="DIV2" style='margin-bottom: 30;'>
		<div id="accordion">
	<h1 class="text-warning">${user.sAccount }的遊戲庫</h1>
  <div class="card">
    <div class="card-header" id="headingOne">
      <h5 class="mb-0">
        <button class="btn btn-link" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
          	(我要換)交換紀錄/共${fn:length(ChangeHistoryList)}筆
        </button>
      </h5>
    </div>

    <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordion">
      <div class="card-body">
        <c:choose>
				<c:when test='${empty ChangeHistoryList}'>
			查無資料<br>
				</c:when>
				<c:when test="${not empty ChangeHistoryList}">
				<table border="1" id="tableChange" class="table table-hover" style="font-size: 12px; border:3px;">
				<thead>
				<tr>
					<th>編號　　</th>
					<th>甲方　　</th>
					<th>甲方遊戲</th>
					<th>乙方</th>
					<th>乙方遊戲</th>
					<th>時間　　</th>
				</tr>
				</thead>
				<c:forEach var='c' varStatus='vs' items='${ChangeHistoryList}'>
				<tr>
				<td>${vs.count }</td>
				<td>${c.partyA.sAccount }</td>
				<td>${c.supportgamebean.gamename }</td>
				<td>${c.partyB.sAccount }</td>
				<td>${c.mygamebean.gamename }</td>
				<td>${c.date }</td>
				</tr>
				</c:forEach>
				</table>
				</c:when>
</c:choose>
      </div>
    </div>
  </div>
  
  <div class="card">
    <div class="card-header" id="headingFive">
      <h5 class="mb-0">
        <button class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseFive" aria-expanded="false" aria-controls="collapseFive">
        	  (許願池)	交換紀錄/共${fn:length(WishHistoryList)}筆
        </button>
      </h5>
    </div>
    <div id="collapseFive" class="collapse" aria-labelledby="headingFive" data-parent="#accordion">
      <div class="card-body">

<c:choose>
				<c:when test='${empty WishHistoryList}'>
			查無資料<br>
				</c:when>
				<c:when test="${not empty WishHistoryList}">
				<table border="1" id="tableWish" class="table table-hover" style="font-size: 12px; border:3px;">
				<thead>
				<tr>
					<th>編號　　</th>
					<th>甲方　　</th>
					<th>甲方遊戲</th>
					<th>乙方</th>
					<th>乙方遊戲</th>
					<th>時間　　</th>
				</tr>
				</thead>
				<c:forEach var='w' varStatus='vs4' items='${WishHistoryList}'>
				<tr>
				<td>${vs4.count }</td>
				<td>${w.partyA.sAccount }</td>
				<td>${w.demandgamebean.gamename }</td>
				<td>${w.partyB.sAccount }</td>
				<td>${w.mygamebean.gamename }</td>
				<td>${w.date }</td>
				</tr>
				</c:forEach>
				</table>
				</c:when>
</c:choose>



      </div>
    </div>
  </div>
  
  
  
  <div class="card">
    <div class="card-header" id="headingTwo">
      <h5 class="mb-0">
        <button class="btn btn-link collapsed show" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
          	我要換/共${fn:length(MemberSupport)}筆
        </button>
        <c:if test="${not empty MemberPending}">
  		<span id="warningSpanSupport" style="color:red;">您有${fn:length(MemberPending)}筆交換待確認！</span>
 	 </c:if>
      </h5>
    </div>
    <div id="collapseTwo"  class="collapse" aria-labelledby="headingTwo" data-parent="#accordion">
      <div class="card-body">
      
      
      <c:choose> 	
		<c:when test="${empty MemberSupport}">
	查無資料<br>
		</c:when>
		<c:when test="${not empty MemberSupport }">

			<table border="1" id="tableSupport" class="table table-hover" style="font-size: 12px; border:3px">
				<thead>
				<tr>
					<th>編號</th>
					<th>遊戲名稱</th>
					<th>商品位置</th>
					<th>運送方式</th>
					<th>主機平台</th>
					<th>是否含特典</th>
					<th>備註</th>
					<th>商品狀況</th>
					<th>刪除</th>
					<th>修改</th>
					<th>狀態</th>
				</tr>
				</thead>
				<c:forEach var='s' varStatus='vs3' items='${MemberSupport }'>

					<tr>
						<td>${vs3.count}</td>
						<td>${s.gamename}</td>
						<td>${s.gamelocation}</td>
						<td>${s.delivery}</td>
						<td>${s.console}</td>
						<td>${s.dlc}</td>
						<td>${s.remark}</td>
						<td>${s.condition}</td>

						<c:choose>
							<c:when test="${s.status == 0}">
								<td><a class="btn btn-primary btn-sm"
								 onclick="deleteCheck('Support','${s.no}');">刪除</a></td>
								<td><a class="btn btn-primary btn-sm"
									href="<c:url value="/exchange/update?updateindex=${vs3.index}"/>">修改</a></td>
							</c:when>
							<c:when test="${s.status == 1 || s.status ==2 ||s.status ==3 || s.status ==4 || s.status ==5}">
								<td><a class="btn btn-primary disabled btn-sm">刪除</a></td>
								<td><a class="btn btn-primary disabled btn-sm">修改</a></td>
							</c:when>
						</c:choose>

						<td><c:choose>
								<c:when test="${s.status == 0}">
    							未換出
    							</c:when>
								<c:when test="${s.status == 1}">
    							已換出，與 ${s.changehistorybean.partyB.sAccount } 交換
    							</c:when>
								<c:when test="${s.status == 2}">
								<a class="btn btn-primary btn-sm" style="background-color: green;" href='<c:url value="showApplyFor?no=${s.changehistorybean.no }"/>' >待審核</a>

    							(來自${s.changehistorybean.partyB.sAccount }的交換請求)
    							</c:when>
    							<c:when test="${s.status == 3}">
    							已換出，與 ${s.mygamebean.changehistorybean.partyA.sAccount } 交換
    							</c:when>
    							<c:when test="${s.status == 4}">
    							已向 ${s.mygamebean.changehistorybean.partyA.sAccount } 提出交換申請
    							</c:when>
    							<c:when test="${s.status == 5}">
    							<span class="text-danger">已被管理員暫時下架</span>
    							</c:when>
							</c:choose></td>
					</tr>

				</c:forEach>
				</c:when>
				</c:choose>

			</table>
      
      
      </div>
    </div>
  </div>
  <div class="card">
    <div class="card-header" id="headingThree">
      <h5 class="mb-0">
        <button class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
          我要徵 /共${fn:length(MemberDemand)}筆
          <c:if test="${not empty MemberDemandPending}">
  				<span id="warningSpanDemand" style="color:red;">您有${fn:length(MemberDemandPending)}筆交換待確認！</span>
  			</c:if>
        </button>
      </h5>
    </div>
    <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordion">
      <div class="card-body">




<c:choose>
				<c:when test="${empty MemberDemand}">
		查無資料<br>
				</c:when>
				<c:when test="${not empty MemberDemand }">

					<table border="1" id="tableDemand" class="table table-hover" style="font-size: 12px; border:3px">
						<tr>
							<th>編號</th>
							<th>遊戲名稱</th>
							<th>商品位置</th>
							<th>主機平台</th>
							<th>備註</th>
							<th>刪除</th>
							<th>狀態</th>
						</tr>

						<c:forEach var='d' varStatus='vs1' items='${MemberDemand }'>

							<tr>
								<td>${vs1.count}</td>
								<td>${d.gamename}</td>
								<td>${d.area}</td>
								<td>${d.console}</td>
								<td>${d.remark}</td>

								<c:choose>
									<c:when test="${d.status == 0}">
										<td><a class="btn btn-primary btn-sm"
											onclick="deleteCheck('Demand','${d.no}');"/>刪除</a></td>
									</c:when>
									<c:when test="${d.status == 1 || d.status ==2 ||d.status ==5}">
										<td><a class="btn btn-primary disabled btn-sm">刪除</a></td>
									</c:when>
								</c:choose>

								<td><c:choose>
								<c:when test="${d.status == 0}">
    							未徵得
    							</c:when>
								<c:when test="${d.status == 1}">
    							已徵得
    							</c:when>
								<c:when test="${d.status == 2}">
    								<a class="btn btn-primary btn-sm" style="background-color: green;" href='<c:url value="showDemandApplyFor?no=${d.wishhistorybean.no }"/>' >待審核</a>
    							(來自${d.wishhistorybean.partyA.sAccount }的交換請求)
    							</c:when>
								<c:when test="${d.status == 5}">
    							<span class="text-danger">已被管理員暫時下架</span>
    							</c:when>
									</c:choose></td>

							</tr>

						</c:forEach>
						</c:when>
						</c:choose>
					</table>



        
        
      </div>
    </div>
  </div>
  <div class="card">
    <div class="card-header" id="headingFour">
      <h5 class="mb-0">
        <button class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
          我的遊戲庫 /共${fn:length(MemberGames)}筆
        </button>
      </h5>
    </div>
    <div id="collapseFour" class="collapse" aria-labelledby="headingFour" data-parent="#accordion">
      <div class="card-body">
       

<c:choose>
				<c:when test="${empty MemberGames}">
		目前遊戲庫無任何遊戲<br>
				</c:when>
				<c:when test="${not empty MemberGames }">
					<table border="1" id="tableMyGames" class="table table-hover" style="font-size: 12px; border:3px">
						<thead>
						<tr>
							<th>編號</th>
							<th>遊戲名稱</th>
							<th>主機平台</th>
							<th></th>
						</tr>
						</thead>

						<c:forEach var='g' varStatus='vs2' items='${MemberGames }'>
							<c:if test = "${g.status==0 || g.status==2}">
							<tr>
								<td>${vs2.count}</td>
								<td>${g.gamename}</td>
								<td>${g.console}</td>
								<c:choose>
							<c:when test="${g.status==2 }">
								<td>
								<c:choose>
									<c:when test="${g.changehistorybean.supportgamebean.gamename != null}">
										<a class="btn btn-primary btn-sm btn-danger"  onclick="applyFor('','${g.changehistorybean.no }')" >取消交換申請</a>
										待換中(您申請交換 <span style="color:green">${g.changehistorybean.supportgamebean.gamename }</span>
								 		等待 <span style="color:green">${g.changehistorybean.partyA.sAccount }</span> 的同意)
									</c:when>
									<c:when test="${g.wishhistorybean.demandgamebean.gamename !=null}">
										待換中(申請交換 <span style="color:green">${g.wishhistorybean.demandgamebean.gamename }</span>
										 等待 <span style="color:green">${g.wishhistorybean.partyB.sAccount }</span> 的同意)
									</c:when>
									<c:when test="${g.demandgamebean.wishhistorybean.mygamebean.gamename !=null}">
										<a class="btn btn-primary btn-sm btn-danger"   onclick="applyFor('Demand','${g.demandgamebean.wishhistorybean.no }')" >取消交換申請</a>
										待換中(您申請交換 <span style="color:green">${g.demandgamebean.wishhistorybean.mygamebean.gamename }</span>
										 等待 <span style="color:green">${g.demandgamebean.wishhistorybean.partyB.sAccount }</span> 的同意)
									</c:when>
								</c:choose>

<%-- 																<a class="btn btn-primary btn-sm" style="background-color: green;" href='<c:url value="showApplyFor?no=${s.changehistorybean.no }"/>' >待審核</a> --%>
<%-- 								待換中(申請交換 <span style="color:green">${g.changehistorybean.supportgamebean.gamename }${g.wishhistorybean.demandgamebean.gamename }${g.demandgamebean.wishhistorybean.mygamebean.gamename }</span> --%>
<%-- 								 等待 <span style="color:green">${g.changehistorybean.partyA.sAccount }${g.wishhistorybean.partyB.sAccount }${g.demandgamebean.wishhistorybean.partyB.sAccount }</span> 的同意) --%>
								
								</td>
							</c:when>
							<c:when test="${g.supportgamebean==null }">
								<td>	
								<a href="<c:url value="/exchange/myGameToSupportGame?no=${g.no }"/>">交換去</a>
								</td>
							</c:when>
							<c:otherwise>
							<td>
								已在交換清單中
							</td>
							</c:otherwise>
							</c:choose>
							</tr>
						</c:if>
						</c:forEach>
						</c:when>
						</c:choose>

					</table>

       
       
      </div>
    </div>
  </div>
  
</div>
		
		
		
	</div>
	<div style="clear: both;"></div>

	<%@ include file="../Foot.jsp"%>
</body>
<script>


function deleteCheck(a,b){
	
	Swal.fire({
		  title: "你確定要刪除這筆資料?",
		//   text: "You won't be able to revert this!",
		  icon: 'warning',
		  showCancelButton: true,
		  confirmButtonColor: '#3085d6',
		  cancelButtonColor: '#d33',
		  confirmButtonText: '確定',
		  cancelButtonText:'返回'
		}).then((result) => {
		  if (result.isConfirmed) {
			 	var xhr = new XMLHttpRequest();
			 	xhr.open('DELETE','<c:url value="/exchange/delete'+a+'" />'+'?deleteindex='+b,true);
			 	xhr.send();
			 	xhr.onload = function(){
			 		if(xhr.readyState===4 && xhr.status ===200){
			 			Swal.fire(
			 				      'OK',
			 				      '刪除成功',
			 				      'success'
			 				    ).then(function(){
			 				   location.href='./management'
			 				    })
			 			}
		  			}	
			 	}
			})
}

function applyFor(a,b){
	var str = "取消"
	var str1 = "您取消申請"
		
	Swal.fire({
  title: "你確定要"+str+"?",
//   text: "You won't be able to revert this!",
  icon: 'warning',
  showCancelButton: true,
  confirmButtonColor: '#3085d6',
  cancelButtonColor: '#d33',
  confirmButtonText: '確定',
  cancelButtonText:'返回'
}).then((result) => {
  if (result.isConfirmed) {
	 	var xhr = new XMLHttpRequest();
	 	xhr.open('GET','<c:url value="/exchange/'+a+'ApplyForReject" />?no='+b,true);
	 	xhr.send();
	 	xhr.onload = function(){
	 		if(xhr.readyState===4 && xhr.status ===200){
	 			Swal.fire(
	 				      'OK',
	 				      str1,
	 				      'success'
	 				    ).then(function(){
	 				   location.href='./management'
	 				    })
	 			}
  			}	
	 	}
	})
}


window.onload=function(){
		
		$(function(){
			$('#tableChange').DataTable({
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
			$('#tableWish').DataTable({
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
			$('#tableSupport').DataTable({
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
			$('#tableDemand').DataTable({
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
			$('#tableMyGames').DataTable({
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
}
</script>
</html>

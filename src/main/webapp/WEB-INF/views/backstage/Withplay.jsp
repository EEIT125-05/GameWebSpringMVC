<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %><!DOCTYPE html>
<%
	request.setCharacterEncoding("UTF-8");
response.setContentType("text/html;charset=UTF-8");
%>
<html>
<head>
<meta charset="UTF-8">
<title>後台管理</title>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/vendor/css/paper-dashboard.css" />
<%@ include file="../Link.jsp"%>
<script src='//cdn.datatables.net/1.10.23/js/jquery.dataTables.min.js'></script>
<link rel='stylesheet' href='https://cdn.datatables.net/1.10.23/css/jquery.dataTables.min.css'>

<style>


.checkinput[type=checkbox]{
	height: 0;
	width: 0;
	visibility: hidden;
}

.checklabel { 
	cursor: pointer;
	text-indent: -9999px;
 	width: 50px; 
 	height: 25px; 
	background: grey;
/*  	display: flex;   */
	border-radius: 100px;
 	position: relative; 
}

.checklabel:after {
	content: '';
  	position: absolute;  
 	top: 5px; 
 	left: 5px; 
	width: 15px;
	height: 15px;
	background: #fff;
	border-radius: 90px;
	transition: 0.3s;
}

.checkinput:checked + .checklabel {
	background: #db1f1f;
}

.checkinput:checked + .checklabel:after {
	left: calc(100% - 5px);
	transform: translateX(-100%);
}

.checklabel:active:after {
	width: 20px;
}r

</style>
</head>
<body class="">
<%@ include file="../Header.jsp"%>
  <div class="wrapper ">
  
  	<%@ include file="./SideBar.jsp"%>
  
  
    <div class="main-panel" style="height: 100vh;">
      <!-- Navbar -->
      <nav class="navbar navbar-expand-lg navbar-absolute fixed-top navbar-transparent">
        <div class="container-fluid">
          <div class="navbar-wrapper">
<!--             <div class="navbar-toggle"> -->
<!--               <button type="button" class="navbar-toggler"> -->
<!--                 <span class="navbar-toggler-bar bar1"></span> -->
<!--                 <span class="navbar-toggler-bar bar2"></span> -->
<!--                 <span class="navbar-toggler-bar bar3"></span> -->
<!--               </button> -->
<!--             </div> -->
            <a class="navbar-brand" href="javascript:;">陪玩系統後台</a>
          </div>
<!--           <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navigation" aria-controls="navigation-index" aria-expanded="false" aria-label="Toggle navigation"> -->
<!--             <span class="navbar-toggler-bar navbar-kebab"></span> -->
<!--             <span class="navbar-toggler-bar navbar-kebab"></span> -->
<!--             <span class="navbar-toggler-bar navbar-kebab"></span> -->
<!--           </button> -->
<!--           <div class="collapse navbar-collapse justify-content-end" id="navigation"> -->
<!--             <form> -->
<!--               <div class="input-group no-border"> -->
<!--                 <input type="text" value="" class="form-control" placeholder="Search..."> -->
<!--                 <div class="input-group-append"> -->
<!--                   <div class="input-group-text"> -->
<!--                     <i class="nc-icon nc-zoom-split"></i> -->
<!--                   </div> -->
<!--                 </div> -->
<!--               </div> -->
<!--             </form> -->
<!--             <ul class="navbar-nav"> -->
<!--               <li class="nav-item btn-rotate dropdown"> -->
<!--                 <a class="nav-link dropdown-toggle" href="http://example.com" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> -->
<!--                   <i class="nc-icon nc-bell-55"></i> -->
<!--                   <p> -->
<!--                     <span class="d-lg-none d-md-block">Some Actions</span> -->
<!--                   </p> -->
<!--                 </a> -->
<!--                 <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownMenuLink"> -->
<!--                   <a class="dropdown-item" href="#">Action</a> -->
<!--                   <a class="dropdown-item" href="#">Another action</a> -->
<!--                   <a class="dropdown-item" href="#">Something else here</a> -->
<!--                 </div> -->
<!--               </li> -->
<!--             </ul> -->
<!--           </div> -->
        </div>
      </nav>
      <!-- End Navbar -->
      <div class="content">
        <div class="row">
          <div class="col-md-12"><!-- 右邊的大區塊自己div東西都放這裡面 -->
            <h3 class="description">Your content here</h3>
		<div class="row">
				<div class="col-lg-3 col-md-6 col-sm-6">
					<div class="card card-stats">
						<div class="card-body ">
							<div class="row">
								<div class="col-5 col-md-4">
									<div class="icon-big text-center icon-warning">
										<i class="fa fa-exchange text-warning"></i>
									</div>
								</div>
								<div class="col-7 col-md-8">
									<div class="numbers">
										<p class="card-category">昨日陪玩單數</p>
										<p class="card-title">13單
										<p>
									</div>
								</div>
							</div>
						</div>
						<div class="card-footer ">
							<hr>
							<div class="stats">
								<i class="fa fa-refresh"></i> Update Now
								<!--安插日期-->
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-md-6 col-sm-6">
					<div class="card card-stats">
						<div class="card-body ">
							<div class="row">
								<div class="col-5 col-md-4">
									<div class="icon-big text-center icon-warning">
										<i class="nc-icon nc-controller-modern text-primary"></i>
									</div>
								</div>
								<div class="col-7 col-md-8">
									<div class="numbers">
										<p class="card-category">昨日金額</p>
										<p class="card-title">$700
										<p>
									</div>
								</div>
							</div>
						</div>
						<div class="card-footer ">
							<hr>
							<div class="stats">
								<i class="fa fa-refresh"></i> Update Now
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-md-6 col-sm-6">
					<div class="card card-stats">
						<div class="card-body ">
							<div class="row">
								<div class="col-5 col-md-4">
									<div class="icon-big text-center icon-warning">
										<i class="nc-icon nc-controller-modern text-danger"></i>
									</div>
								</div>
								<div class="col-7 col-md-8">
									<div class="numbers">
										<p class="card-category">陪玩師人數</p>
										<p class="card-title">9人
										<p>
									</div>
								</div>
							</div>
						</div>
						<div class="card-footer ">
							<hr>
							<div class="stats">
								<i class="fa fa-refresh"></i> Update Now
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-md-6 col-sm-6">
					<div class="card card-stats">
						<div class="card-body ">
							<div class="row">
								<div class="col-5 col-md-4">
									<div class="icon-big text-center icon-warning">
										<i class="nc-icon nc-single-02 text-primary"></i>
									</div>
								</div>
								<div class="col-7 col-md-8">
									<div class="numbers">
										<p class="card-category">評論總數</p>
										<p class="card-title">10則
										<p>
									</div>
								</div>
							</div>
						</div>
						<div class="card-footer ">
							<hr>
							<div class="stats">
								<i class="fa fa-refresh"></i> Update now
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<div class="row">
	         <div class="col-md-6">
	           <div class="card ">
	             <div class="card-header ">
	               <h5 class="card-title">男女陪玩師</h5>
<!-- 	               <p class="card-category"></p> -->
	             </div>
	             <div class="card-body ">
	               <canvas id="chartLocation"></canvas>
	             </div>
	             <div class="card-footer ">
	               <div class="legend">
	                 <!-- <i class="fa fa-circle text-primary"></i> Opened
	                 <i class="fa fa-circle text-warning"></i> Read
	                 <i class="fa fa-circle text-danger"></i> Deleted
	                 <i class="fa fa-circle text-gray"></i> Unopened -->
	               </div>
	               <hr>
	               <div class="stats">
	                   <i class="fa fa-refresh"></i>
	                   Last day
	               </div>
	             </div>
	           </div>
	         </div>
	         <div class="col-md-6">
	           <div class="card ">
	             <div class="card-header ">
	               <h5 class="card-title">熱門遊戲</h5>
<!-- 	               <p class="card-category">最缺遊戲</p> -->
	             </div>
	             <div class="card-body ">
	               <canvas id="chartGame"></canvas>
	             </div>
	             <div class="card-footer ">
	               <div class="legend">
	                 <!-- <i class="fa fa-circle text-primary"></i> Opened
	                 <i class="fa fa-circle text-warning"></i> Read
	                 <i class="fa fa-circle text-danger"></i> Deleted
	                 <i class="fa fa-circle text-gray"></i> Unopened -->
	               </div>
	               <hr>
	               <div class="stats">
	                   <i class="fa fa-refresh"></i>
	                   Last day
	               </div>
	             </div>
	           </div>
	         </div>
          </div>
	
			<div class="col-md-12">
            <div class="card card-chart">
              <div class="card-header">
                <h5 class="card-title">管理陪玩系統 </h5>
                <p class="card-category">刪除、停權功能</p>
              </div>
              <div class="card-body">
              
              
    <!-- 摺疊 -->          
              
              
                <div id="accordion">
  <div class="card">
    <div class="card-header" id="headingOne">
      <h5 class="mb-0">
        <button class="btn btn-link" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
          	管理留言紀錄
        </button>
      </h5>
    </div>

    <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordion">
      <div class="card-body">
      
      
      <table border="1" id="table3" class="display" style="text-align:center;">
				<thead>
				<tr>
<!-- 					<th>編號</th> -->
					<th>留言者</th>
					<th>陪玩師</th>
					<th>時間</th>
					<th>留言內容</th>
					<th>功能</th>
				</tr>
				</thead>
				<c:forEach items="${Withlist}" var="With"  > 
				<c:forEach var='Reply' varStatus='Status' items="${With.sReplyBeans}">
				<tr>
<%-- 				<td>${Status.count}</td> --%>
				<td>${Reply.sAuthor }</td>
				<td>${With.sNickname}</td>
				<td>${Reply.dDate}<br>${Reply.tTime}</td>
				<td style="word-break: break-all;width:600px">${Reply.sText}</td>
				<td><a class="btn btn-danger" onclick="deleteReply(${Reply.iNo});">刪除</a></td>
				</tr>
				</c:forEach>
				</c:forEach>
				</table>
      
        
      </div>
    </div>
  </div>
  <div class="card">
    <div class="card-header" id="headingTwo">
      <h5 class="mb-0">
        <button class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
          	管理訂單
        </button>
      </h5>
    </div>
    <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordion">
      <div class="card-body">        
        <c:choose>
		<c:when test="${empty WithOrder}">
			<span>查無資料</span>
		</c:when>
		<c:otherwise>        
        <table border="1" id="table2" class="display" style="text-align:center;">
				<thead>
					<tr>
						<th>編號</th>
						<th>下單會員</th>
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
							<td>${Order.member.sNickname}</td>
							<td >${Order.with.sNickname}</td>
							<td>${Order.dDate}</td>
							<td>${Order.sGame}</td>
							<td>${Order.iPrice}</td>
							<td>
								<c:choose>
								<c:when test="${Order.iStatus == 1 }">
								<span style="font-weight:bold;font-size:20px;">等待確認</span>						
								</c:when>
								<c:when test="${Order.iStatus == 2 }">
								<span style="font-weight:bold;font-size:20px;">確認成功，尚未成功</span>
								</c:when>
								<c:when test="${Order.iStatus == 3 }">
								<span style="font-weight:bold;font-size:20px;">訂單遭拒，請退款</span>
								</c:when>
								<c:when test="${Order.iStatus == 4 }">
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
  
  <div  class="card">
  	    <div class="card-header" id="headingThree">
  		<h5 class="mb-0">
        <button class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
          	管理陪玩師資料
        </button>
      </h5>
		<form method='POST'>
			<input type='hidden' name='_method' value='DELETE'>
		</form>
    	</div>
    <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordion">
      <div class="card-body">
		<table border="1" id="table1" class="display" style="text-align:center;">

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
			<c:forEach items="${Withlist}" var="With" varStatus="status" >
				<tr>
					<td>${With.sAccount}</td>
					<td >${With.sName}</td>
					<td>${With.sNickname}</td>
					<td>${With.sIdcode}</td>
					<td>${With.sGender == 'F' ? "女" : "男" }</td>
					<td>${With.sGame}</td>
					<td><img style="width:150px;height:150px;"class="img1"
						src='${pageContext.request.contextPath}/withplay/picture/${With.iId}' /></td>
					<td style="word-break: break-all; width:250px" >${With.sComment}</td>
					<td>${With.iPrice}</td>
					<td><a class='btn btn-outline-dark'
						href="${pageContext.request.contextPath}/withplay/edit/${With.iId}">Edit</a>
						<hr>
						<c:choose>
							<c:when test="${With.iStatus == 0}">
								<input type="checkbox" class="checkinput" id="switch${status.index }" onchange="updateStatus(${With.iId})"/><label class="checklabel" for="switch${status.index }">Toggle</label>
							</c:when>
							<c:when test="${With.iStatus == 1}">						
								<input type="checkbox" class="checkinput" id="switch${status.index }" checked onchange="updateStatus(${With.iId});"/><label class="checklabel" for="switch${status.index }">Toggle</label>
							</c:when>
						</c:choose>
<!-- 						<a class='deletelink' -->
<%-- 						href="${pageContext.request.contextPath}/withplay/delete/${With.iId}">Delete</a> --%>
					</td>
				</tr>
			</c:forEach>
		</table>
  
  

      
      
      
      </div>
    </div>
  </div>
</div> 
			
			
			
			
			

			</div>
        </div>
      </div>

    </div>
  </div>
  
  
<%-- <%@ include file="../Foot.jsp"%> --%>
</body>
<script>
function updateStatus(iNo){
	 var xhr = new XMLHttpRequest();
	 	xhr.open('PUT',"<c:url value='/withplay/Withstatus' />"+'?iNO='+iNo,true);
	 	xhr.send();
	 	xhr.onload = function(){
	 		if(xhr.readyState===4 && xhr.status ===200){
	 			Swal.fire(
	 				      'OK',
	 				      '修改成功',
	 				      'success'
	 				    )
	 			}
			}
}
function deleteReply(iNo){
	 var xhr = new XMLHttpRequest();
	 	xhr.open('PUT',"<c:url value='/withplay/deleteReply' />"+'?iNO='+iNo,true);
	 	xhr.send();
	 	xhr.onload = function(){
	 		if(xhr.readyState===4 && xhr.status ===200){
	 			Swal.fire(
	 				      'OK',
	 				      '刪除成功',
	 				      'success'
	 				    )
	 			}
			}
}
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
		$('#table3').DataTable({
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
	let ctx;
	ctx = document.getElementById('chartLocation').getContext("2d");

	    myChart = new Chart(ctx, {
	      type: 'pie',
	      data: {
	        labels: ['男生','女生'],
	        datasets: [{
	          label: "locations",
	          pointRadius: 0,
	          pointHoverRadius: 0,
	          backgroundColor: [
	            '#FF9797',
	            '#FFDC35',
	          ],
	          borderWidth: 0,
	          data: [4,5,]
	        }]
	      },

	      options: {

	        legend: {
	          display: true
	        },

	        pieceLabel: {
	          render: 'percentage',
	          fontColor: ['white'],
	          precision: 2
	        },

	        tooltips: {
	          enabled: true
	        },

	        scales: {
	          yAxes: [{

	            ticks: {
	              display: false
	            },
	            gridLines: {
	              drawBorder: false,
	              zeroLineColor: "transparent",
	              color: 'rgba(255,255,255,0.05)'
	            }

	          }],

	          xAxes: [{
	            barPercentage: 1.6,
	            gridLines: {
	              drawBorder: false,
	              color: 'rgba(255,255,255,0.1)',
	              zeroLineColor: "transparent"
	            },
	            ticks: {
	              display: false,
	            }
	          }]
	        },
	      }
	    });
	    ctx = document.getElementById('chartGame').getContext("2d");

	    myChart = new Chart(ctx, {
	      type: 'bar',
	      data: {
	        labels: ['英雄聯盟','魔物獵人','跑跑卡丁車','鬥陣特攻','絕地求生','爐石戰記','傳說對決'],
	        datasets: [{
	          label: "玩家選擇遊戲",
	          data: [12, 19, 10, 15, 12, 9, 12], 
	          backgroundColor: [
	            'rgba(255, 99, 132, 0.2)',
	            'rgba(54, 162, 235, 0.2)',
	            'rgba(255, 206, 86, 0.2)',
	            'rgba(75, 192, 192, 0.2)',
	            'rgba(153, 102, 255, 0.2)',
	            'rgba(255, 80, 64, 0.2)',
	            'rgba(255, 159, 64, 0.2)'
	          ],
	          borderColor: [
	            'rgba(255, 99, 132, 1)',
	            'rgba(54, 162, 235, 1)',
	            'rgba(255, 206, 86, 1)',
	            'rgba(75, 192, 192, 1)',
	            'rgba(153, 102, 255, 1)',
	            'rgba(255, 80, 64, 1)',
	            'rgba(255, 159, 64, 1)'
	          ],
	          borderWidth: 1
	        }]
	      },
	      options: {
	        scales: {
	          yAxes: [{
	            ticks: {
	              beginAtZero: true,
	              responsive: true //符合響應式
	            }
	          }]
	        }
	      }
	    });
	});
 </script>
		    
</html>
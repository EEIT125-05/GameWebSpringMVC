<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %><!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>後台管理</title>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/vendor/css/paper-dashboard.css" />
<%@ include file="../Link.jsp"%>
<script src='//cdn.datatables.net/1.10.23/js/jquery.dataTables.min.js'></script>
<link rel='stylesheet' href='https://cdn.datatables.net/1.10.23/css/jquery.dataTables.min.css'>
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
										<p class="card-title">63人
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
										<p class="card-category">留言總數</p>
										<p class="card-title">98人次
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
	               <h5 class="card-title">地區</h5>
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
                <h5 class="card-title">管理交換系統</h5>
                <p class="card-category">下架功能</p>
              </div>
              <div class="card-body">
              
              
    <!-- 摺疊 -->          
              
              
                <div id="accordion">
  <div class="card">
    <div class="card-header" id="headingOne">
      <h5 class="mb-0">
        <button class="btn btn-link" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
          	全站交換紀錄
        </button>
      </h5>
    </div>

    <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordion">
      <div class="card-body">
      
      
      <table border="1" id="tableChange" class="display" style="font-size: 12px; border:4px">
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
				
				<c:forEach var='c' varStatus='vs' items='${AllListMap.change }'>
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
        
        
        
        <table border="1" id="tableSupport" class="display" style="font-size: 12px; border:3px">
				<thead>
				<tr>
					<th>編號</th>
					<th>玩家</th>
					<th>遊戲名稱</th>
					<th>商品位置</th>
					<th>運送方式</th>
					<th>主機平台</th>
					<th>是否含特典</th>
					<th>備註</th>
					<th>商品狀況</th>
					<th>刪除</th>
					<th>暫時下架</th>
				</tr>
				</thead>
				<c:forEach var='s' varStatus='vs1' items='${AllListMap.support }'>

					<tr>
						<td>${vs1.count}</td>
						<td>${s.gamer}</td>
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
								<td><input type="checkbox" class="checkinput" id="switch${vs1.index }" onchange="updateStatus('support','${s.status }',${s.no });"/><label class="checklabel" for="switch${vs1.index }">Toggle</label></td>
							</c:when>
							<c:when test="${s.status == 5}">
								<td><a class="btn btn-primary btn-sm"
								 onclick="deleteCheck('Support','${s.no}');">刪除</a></td>
								<td><input type="checkbox" class="checkinput" id="switch${vs1.index }" checked onchange="updateStatus('support','${s.status }',${s.no });"/><label class="checklabel" for="switch${vs1.index }">Toggle</label></td>
							</c:when>
						</c:choose>


					</tr>

				</c:forEach>

			</table>         
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
    </div>
  </div>
</div> 
			
			
			
			
			

			</div>
        </div>
      </div>

    </div>
  </div>
  
  
<%@ include file="../Foot.jsp"%>
</body>
<script>
function updateStatus(a,b,c){
	 var xhr = new XMLHttpRequest();
	 	xhr.open('PUT','<c:url value="/exchange/updateStatus" />'+'?type='+a+'&status='+b+'&no='+c,true);
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
	let ctx;
	ctx = document.getElementById('chartLocation').getContext("2d");

	    myChart = new Chart(ctx, {
	      type: 'pie',
	      data: {
	        labels: ['北部','中部','南部','東部'],
	        datasets: [{
	          label: "locations",
	          pointRadius: 0,
	          pointHoverRadius: 0,
	          backgroundColor: [
	            '#FF9797',
	            '#FFDC35',
	            '#5A5AAD',
	            '#9AFF02'
	          ],
	          borderWidth: 0,
	          data: [16,8,9,10]
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
	      type: 'pie',
	      data: {
	        labels: ['英雄聯盟','魔物獵人','跑跑卡丁車','鬥陣特攻','絕地求生','爐石戰記','傳說對決'],
	        datasets: [{
	          label: "games",
	          pointRadius: 0,
	          pointHoverRadius: 0,
	          backgroundColor: [
	            '#B87070',
	            '#6FB7B7',
	            '#B766AD',
	            '#FFAD86',
	            '#79FF79',
	            '#9393FF',
	            '#FF60AF'
	          ],
	          borderWidth: 0,
	          data: [8,16,9,10,8,12,10]
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
	});
 </script>
		    
</html>
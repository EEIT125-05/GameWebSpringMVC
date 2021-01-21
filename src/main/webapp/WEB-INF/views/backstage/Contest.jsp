<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
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
  
  
    <div class="main-panel">
      <!-- Navbar -->
      <nav class="navbar navbar-expand-lg navbar-absolute fixed-top navbar-transparent">
        <div class="container-fluid">
          <div class="navbar-wrapper">
            <a class="navbar-brand" href="javascript:;">賽事系統後台</a>
          </div>
        </div>
      </nav>
      <!-- End Navbar -->
      <div class="content">
        <div class="row">
          <div class="col-md-12"><!-- 右邊的大區塊自己div東西都放這裡面 -->

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
										<p class="card-category">昨日新增賽事</p>
										<p class="card-title">13場
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
										<p class="card-category">昨日舉行賽事</p>
										<p class="card-title">6場
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
										<p class="card-category">總參賽人數</p>
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
										<p class="card-category">今日系統流量</p>
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
          
			<div class="row" id="accordion">
				<div class="card col-md-12">
					<div class="card-header" id="headingOne">
						<h5 class="mb-0">
							<button class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseAllContest" aria-expanded="false" aria-controls="collapseAllContest">所有比賽</button>
						</h5>
					</div>
	
					<div id="collapseAllContest" class="collapse"
						aria-labelledby="headingOne" data-parent="#accordion">
						<div class="card-body">
						
							<table border="1" id="tableAllContest" class="table table-hover" style="font-size: 12px; border:3px">
								<thead>
								<tr>
									<th>編號</th>
									<th>比賽名稱</th>
									<th>比賽遊戲</th>
									<th>主辦人</th>
									<th>比賽時間</th>
									<th>報名狀況</th>
									<th>刪除</th>
								</tr>
								</thead>
								<c:forEach var="contest" items="${allContest}">
									<tr>
										<td>${contest.iNo}</td>
										<td><a href="<c:url value='/contest/Information?contestNo=${contest.iNo}'/>">${contest.sName}</a></td>
										<td>${contest.sGame}</td>
										<td>${contest.sHost}</td>
										<fmt:formatDate var="sTime" value="${contest.tTime}" pattern="yyyy-MM-dd HH:mm"/>
										<td>${sTime}</td>
										<td>${fn:length(contest.lParticipateBeans)}/${contest.iPeople}</td>
										<td>
											<button class="btn btn-danger deleteContest" value="${contest.iNo}">刪除</button>
										</td>
									</tr>
								</c:forEach>
							</table>
						</div>
					</div>
				</div>
			</div>
			
			<div class="row" id="accordion">
				<div class="card col-md-12">
					<div class="card-header" id="headingTwo">
						<h5 class="mb-0">
							<button class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseAllParticipate" aria-expanded="false" aria-controls="collapseAllParticipate">所有參賽者</button>
						</h5>
					</div>
	
					<div id="collapseAllParticipate" class="collapse"
						aria-labelledby="headingOne" data-parent="#accordion">
						<div class="card-body">
						
							<table border="1" id="tableAllParticipate" class="table table-hover" style="font-size: 12px; border:3px">
								<thead>
								<tr>
									<th>編號</th>
									<th>比賽名稱</th>
									<th>比賽遊戲</th>
									<th>參賽者</th>
									<th>比賽時間</th>
									<th>報名狀況</th>
									<th>刪除</th>
								</tr>
								</thead>
								<c:forEach var="contest" items="${allContest}">
									<c:forEach var="participate" items="${contest.lParticipateBeans}">
								
										<tr>
											<td>${participate.iNo}</td>
											<td><a href="<c:url value='/contest/Information?contestNo=${contest.iNo}'/>">${contest.sName}</a></td>
											<td>${contest.sGame}</td>
											<td>${participate.sPlayer}</td>
											<fmt:formatDate var="sTime" value="${contest.tTime}" pattern="yyyy-MM-dd HH:mm"/>
											<td>${sTime}</td>
											<td>${fn:length(contest.lParticipateBeans)}/${contest.iPeople}</td>
											<td>
												<button class="btn btn-danger deleteParticipate" value="${contest.iNo}">刪除</button>
											</td>
										</tr>
									</c:forEach>
								</c:forEach>
							</table>
						</div>
					</div>
				</div>
			
			</div>
			
			
			
			
			

			</div>
        </div>
      </div>
<%@ include file="../Foot.jsp"%>
    </div>
  </div>
  
</body>
<script>
	$(function(){
		let ctx;
		let myChart
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
		    
		    ctx = document.getElementById('chartGame').getContext("2d");;
		    myChart = new Chart(ctx, {
		      type: 'bar', 
		      data: {
		        labels: ['英雄聯盟','魔物獵人','跑跑卡丁車','鬥陣特攻','絕地求生','爐石戰記','傳說對決'],
		        datasets: [{
		          label: '比賽數量',
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
		    
		    
		    $('#tableAllContest').DataTable({
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
		    
		    $('#tableAllParticipate').DataTable({
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
		    
		    $(".row").on("click","a",function(){
				this.target = "_blank";
			});	
		    
		    $(".row").on("click", ".deleteContest", function(){
		    	let tr = $(this).closest("tr");
				Swal.fire({
					showClass: {
					    popup: 'animate__animated animate__fadeInDown'
					  },
					  title: '確定刪除此賽事?',
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
													window.setTimeout(function(){tr.remove();},500);
													
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
		    
		    $(".row").on("click", ".deleteParticipate", function(){
		    	let tr = $(this).closest("tr");
				Swal.fire({
					showClass: {
					    popup: 'animate__animated animate__fadeInDown'
					  },
					  title: '確定刪除此位參賽者?',
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
								url: "<c:url value='/contest/DeleteParticipate/" + $(this).val() + "/" + $(this).parent().prev().prev().prev().text() + "'/>",
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
													window.setTimeout(function(){tr.remove();},500);
													
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
		    
		    
		    
		    
		    
		    
	});

</script>



</html>
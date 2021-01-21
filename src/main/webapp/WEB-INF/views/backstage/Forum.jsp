<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
            <a class="navbar-brand" href="javascript:;">討論區後台</a>
          </div>
        </div>
      </nav>
      <!-- End Navbar -->
      <div class="content">
        <div class="row">
          <div class="col-md-12"><!-- 右邊的大區塊自己div東西都放這裡面 -->

			<div class="row">
				<div class="col-lg-4 col-md-6 col-sm-6">
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
										<p class="card-category">昨日貼文新增數</p>
										<p class="card-title">53則
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
				<div class="col-lg-4 col-md-6 col-sm-6">
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
										<p class="card-category">昨日留言新增數</p>
										<p class="card-title">125筆
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
				<div class="col-lg-4 col-md-6 col-sm-6">
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
				<div class="col-md-12">
					<div class="card ">
						<div class="card-header ">
							<h5 class="card-title">上週系統流量</h5>
							<p class="card-category">2021/01/17-2021/01/23</p>
						</div>
						<div class="card-body ">
							<canvas id=chartWeek width="400" height="100"></canvas>
						</div>
						<div class="card-footer ">
							<hr>
							<div class="stats">
								<i class="fa fa-history"></i> Updated 3 days ago
							</div>
						</div>
					</div>
				</div>
			</div>



			<div class="row">
	         <div class="col-md-6">
	           <div class="card ">
	             <div class="card-header ">
	               <h5 class="card-title">子版</h5>
<!-- 	               <p class="card-category"></p> -->
	             </div>
	             <div class="card-body ">
	               <canvas id="chartCategory"></canvas>
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
	               <h5 class="card-title">熱門貼文</h5>
	             </div>
	             <div class="card-body ">
	               <canvas id="chartHot"></canvas>
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
							<button class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseAllContest" aria-expanded="false" aria-controls="collapseAllContest">所有貼文</button>
						</h5>
					</div>
	
					<div id="collapseAllContest" class="collapse"
						aria-labelledby="headingOne" data-parent="#accordion">
						<div class="card-body">
						
							<table border="1" id="tableAllForum" class="table table-hover" style="font-size: 12px; border:3px">
								<thead>
								<tr>
									<th>時間</th>
									<th>子版</th>
									<th>標題</th>
									<th>樓主</th>
									<th>留言數</th>
									<th>刪除</th>
								</tr>
								</thead>
								<c:forEach var="forum" items="${allForum}">
									<tr>
										<td> ${forum[3]} ${forum[4]}</td>
										<td>${forum[1]}</td>
										<td><a href="<c:url value='/forum/Detail/${forum[0]}'/>">${forum[2]}</a></td>
										<td>${forum[5]}</td>
										<td>${forum[6]}</td>
										<td>
											<button class="btn btn-danger deleteForum" value="${forum[0]}">刪除</button>
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
							<button class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseAllParticipate" aria-expanded="false" aria-controls="collapseAllParticipate">所有留言</button>
						</h5>
					</div>
	
					<div id="collapseAllParticipate" class="collapse"
						aria-labelledby="headingOne" data-parent="#accordion">
						<div class="card-body">
						
							<table border="1" id="tableAllReply" class="table table-hover" style="font-size: 12px; border:3px">
								<thead>
								<tr>
									<th>時間</th>
									<th>貼文編號</th>
									<th>留言</th>
									<th>會員</th>
									<th>刪除</th>
								</tr>
								</thead>
								<c:forEach var="reply" items="${allReply}">
									<tr>
										<td>${reply.dDate} ${reply.tTime}</td>
										<td><a href="<c:url value='/forum/Detail/${reply.iForumNo}'/>">${reply.iForumNo}</a></td>
										<td>${reply.sText}</td>
										<td>${reply.sAuthor}</td>
										<td>
											<button class="btn btn-danger deleteReply" value="${reply.iNo}">刪除</button>
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
<%@ include file="../Foot.jsp"%>
    </div>
  </div>
</body>
<script>
	$(function(){
		
	
		let ctx;
		let myChart
		
		ctx = document.getElementById('chartWeek').getContext("2d");

	    myChart = new Chart(ctx, {
	      type: 'line',

	      data: {
	        labels: ["1/17", "1/18", "1/19","1/20","1/21","1/22","1/23"],
	        datasets: [{
	            borderColor: "#484891",
	            backgroundColor: "#B8B8DC",
	            pointRadius: 0,
	            pointHoverRadius: 0,
	            borderWidth: 3,
	            data: [303,85,64,99,230,354,312]
	          }
	        ]
	      },
	      options: {
	        legend: {
	          display: false
	        },

	        tooltips: {
	          enabled: false
	        },

	        scales: {
	          yAxes: [{

	            ticks: {
	              fontColor: "#9f9f9f",
	              beginAtZero: false,
	              maxTicksLimit: 5,
	              //padding: 20
	            },
	            gridLines: {
	              drawBorder: false,
	              zeroLineColor: "#ccc",
	              color: 'rgba(255,255,255,0.05)'
	            }

	          }],

	          xAxes: [{
	            barPercentage: 1.6,
	            gridLines: {
	              drawBorder: false,
	              color: 'rgba(255,255,255,0.1)',
	              zeroLineColor: "transparent",
	              display: false,
	            },
	            ticks: {
	              padding: 20,
	              fontColor: "#9f9f9f"
	            }
	          }]
	        },
	      }
	    });
		
		ctx = document.getElementById('chartCategory').getContext("2d");
	    myChart = new Chart(ctx, {
	      type: 'pie',
	      data: {
	        labels: ['閒聊','公告','討論','問題','情報','攻略'],
	        datasets: [{
	          label: "categorys",
	          pointRadius: 0,
	          pointHoverRadius: 0,
	          backgroundColor: [
	            '#FF9797',
	            '#FFDC35',
	            '#5A5AAD',
	            '#9AFF02',
	            '#EA7500',
	            '#9393FF'
	          ],
	          borderWidth: 0,
	          data: [16,3,9,10,6,15]
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
	    
	    ctx = document.getElementById('chartHot').getContext("2d");;
	    myChart = new Chart(ctx, {
	      type: 'bar', 
	      data: {
	        labels: ['週五發售..','<魔物獵人..','頑皮狗釋..','<迪士尼..','英國男子..','從<X>到..','變種病毒..'],
	        datasets: [{
	          label: '瀏覽次數',
	          data: [120, 149, 81, 59, 102, 97, 76], 
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
	    
	    $('#tableAllForum').DataTable({
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
	    
	    $('#tableAllReply').DataTable({
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
	    
	    $(".row").on("click",".deleteForum", function(){
	    	let tr = $(this).closest("tr");
			Swal.fire({
				showClass: {
				    popup: 'animate__animated animate__fadeInDown'
				  },
				  title: '確定刪除此則貼文?',
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
							url: "<c:url value='/forum/Edit/" + $(this).val() + "'/>",
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
	    
	    $(".row").on("click", ".deleteReply", function(){
	    	let tr = $(this).closest("tr");
			Swal.fire({
				showClass: {
				    popup: 'animate__animated animate__fadeInDown'
				  },
				  title: '確定刪除此筆留言?',
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
							url: "<c:url value='/forum/EditReply/" + $(this).val() + "'/>",
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
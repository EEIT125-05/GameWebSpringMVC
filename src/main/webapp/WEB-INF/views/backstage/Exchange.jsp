<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
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
	display: flex; 
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
}

// centering
/* body { */
/* 	display: flex; */
/* 	justify-content: center; */
/* 	align-items: center; */
/* 	height: 100vh; */
/* } */

</style>
</head>
<body class="">
<%@ include file="../Header.jsp"%>
  <div class="wrapper ">
    
    <%@ include file="./SideBar.jsp"%>
    
    
    
    <div class="main-panel" >
<!--     <div class="test"> -->
      <!-- Navbar -->
      <nav class="navbar navbar-expand-lg navbar-absolute fixed-top navbar-transparent">
        <div class="container-fluid">
          <div class="navbar-wrapper">
            <div class="navbar-toggle">
              <button type="button" class="navbar-toggler">
                <span class="navbar-toggler-bar bar1"></span>
                <span class="navbar-toggler-bar bar2"></span>
                <span class="navbar-toggler-bar bar3"></span>
              </button>
            </div>
            <a class="navbar-brand" href="javascript:;">交換系統後台管理</a>
          </div>
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navigation" aria-controls="navigation-index" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-bar navbar-kebab"></span>
            <span class="navbar-toggler-bar navbar-kebab"></span>
            <span class="navbar-toggler-bar navbar-kebab"></span>
          </button>
          
        </div>
      </nav>
      <!-- End Navbar -->
      
      
      
      
      
      
      <div class="content">
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
                      <p class="card-category">昨日成交量</p>
                      <p class="card-title">11筆<p>
                    </div>
                  </div>
                </div>
              </div>
              <div class="card-footer ">
                <hr>
                <div class="stats">
                  <i class="fa fa-refresh"></i>
                  Update Now <!--安插日期-->
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
                      <p class="card-category">我要換遊戲</p>
                      <p class="card-title">245筆<p>
                    </div>
                  </div>
                </div>
              </div>
              <div class="card-footer ">
                <hr>
                <div class="stats">
                  <i class="fa fa-calendar-o"></i>
                  Last day
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
                      <p class="card-category">許願池遊戲</p>
                      <p class="card-title">178筆<p>
                    </div>
                  </div>
                </div>
              </div>
              <div class="card-footer ">
                <hr>
                <div class="stats">
                  <i class="fa fa-clock-o"></i>
                  In the last hour
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
                      <p class="card-category">今日交換系統流量</p>
                      <p class="card-title">65位<p>
                    </div>
                  </div>
                </div>
              </div>
              <div class="card-footer ">
                <hr>
                <div class="stats">
                  <i class="fa fa-refresh"></i>
                  Update now
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-md-12">
            <div class="card ">
              <div class="card-header ">
                <h5 class="card-title">每周成交量</h5>
                <p class="card-category">2020/12月-2021/01月</p>
              </div>
              <div class="card-body ">
                <canvas id=chartHours width="400" height="100"></canvas>
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
                <h5 class="card-title">我要換</h5>
                <p class="card-category">最多遊戲</p>
              </div>
              <div class="card-body ">
                <canvas id="chartEmail"></canvas>
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
                <h5 class="card-title">許願池</h5>
                <p class="card-category">最缺遊戲</p>
              </div>
              <div class="card-body ">
                <canvas id="chartEmail1"></canvas>
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
          	管理交換板
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
  <div class="card">
    <div class="card-header" id="headingThree">
      <h5 class="mb-0">
        <button class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
          	管理許願池
        </button>
      </h5>
    </div>
    <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordion">
      <div class="card-body">
      
      
        <table border="1" class="table table-hover" style="font-size: 12px; border:3px">
						<tr>
							<th>編號</th>
							<th>玩家</th>
							<th>遊戲名稱</th>
							<th>商品位置</th>
							<th>主機平台</th>
							<th>備註</th>
							<th>刪除</th>
							<th>暫時下架</th>
						</tr>

						<c:forEach var='d' varStatus='vs2' items='${AllListMap.demand }'>

							<tr>
								<td>${vs2.count}</td>
								<td>${d.gamer}</td>
								<td>${d.gamename}</td>
								<td>${d.area}</td>
								<td>${d.console}</td>
								<td>${d.remark}</td>

								<c:choose>
									<c:when test="${d.status == 0}">
										<td><a class="btn btn-primary btn-sm"
											onclick="deleteCheck('Demand','${d.no}');"/>刪除</a></td>
										<td><input type="checkbox" class="checkinput" id="switcha${vs2.index }" onchange="updateStatus('demand','${d.status }',${d.no });"/><label class="checklabel" for="switcha${vs2.index }">Toggle</label></td>
									</c:when>
									<c:when test="${d.status == 5}">
										<td><a class="btn btn-primary btn-sm"
											onclick="deleteCheck('Demand','${d.no}');"/>刪除</a></td>
										<td><input type="checkbox" class="checkinput" id="switcha${vs2.index }" checked onchange="updateStatus('demand','${d.status }',${d.no });"/><label class="checklabel" for="switcha${vs2.index }">Toggle</label></td>
										
									</c:when>
								</c:choose>

							</tr>

						</c:forEach>
					</table>
      
      
      
      </div>
    </div>
  </div>
</div>
                
    <!-- 摺疊 -->          
                
                
                
                
              </div>
              <div class="card-footer">
                <div class="chart-legend">
                </div>
                <hr />
                <div class="card-stats">
                  <i class="fa fa-refresh"></i>
                  Update now
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
				 				   window.location.reload(false)
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
 		
 		
 		
 		    chartColor = "#FFFFFF";

 		    ctx = document.getElementById('chartHours').getContext("2d");

 		    myChart = new Chart(ctx, {
 		      type: 'line',

 		      data: {
 		        labels: ["11/30-12/6", "12/7-13", "12/14-20","12/21-27","12/28-1/3","1/4-10","1/11-17","1/18-24"],
 		        datasets: [{
 		            borderColor: "#6bd098",
 		            backgroundColor: "#6bd098",
 		            pointRadius: 0,
 		            pointHoverRadius: 0,
 		            borderWidth: 3,
 		            data: [24,34,38,36,40,42,39,45]
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


 		    ctx = document.getElementById('chartEmail').getContext("2d");

 		    myChart = new Chart(ctx, {
 		      type: 'pie',
 		      data: {
 		        labels: ['GTA','芬尼克斯傳說','雙重鏡影','看門狗：自由軍團','Far Cry','荒野八人組','美俏女劍士 ORIGIN','大地王國：罪與罰 '],
 		        datasets: [{
 		          label: "Emails",
 		          pointRadius: 0,
 		          pointHoverRadius: 0,
 		          backgroundColor: [
 		            '#CE0000',
 		            '#FF0080',
 		            '#E800E8',
 		            '#921AFF',
 		            '#00DB00',
 		            '#0072E3',
 		            '#64A600',
 		            '#408080'
 		          ],
 		          borderWidth: 0,
 		          data: [6,8,9,10,8,9,5,10]
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

 		    ctx = document.getElementById('chartEmail1').getContext("2d");

 		    myChart = new Chart(ctx, {
 		      type: 'pie',
 		      data: {
 		        labels: ['刺客教條','戰神','對馬戰鬼','電馭叛客 2077','惡魔獵人','仁王','海賊王','七龍珠'],
 		        datasets: [{
 		          label: "Emails",
 		          pointRadius: 0,
 		          pointHoverRadius: 0,
 		          backgroundColor: [
 		            '#FF9797',
 		            '#FFC1E0',
 		            '#B7FF4A',
 		            '#ACD6FF',
 		            '#FF9D6F',
 		            '#EAC100',
 		            '#95CACA',
 		            '#C2C287'
 		          ],
 		          borderWidth: 0,
 		          data: [10,12,9,7,8,10,12,9]
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

 	}
 </script>
</html>
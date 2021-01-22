<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%@ include file="../Link.jsp" %>
<sql:setDataSource var="ds"
	driver="com.microsoft.sqlserver.jdbc.SQLServerDriver"
	url="jdbc:sqlserver://localhost:1433;DatabaseName=GameSpringMVCDB"
	user="sa" password="sa123456" />
<sql:query sql="select * from BusinessHistoryTable bh,BusinessDetailTable bd,MalllistTable mt WHERE bh.sAccount like '%${user.sAccount}%'and bd.fk_cartid=bh.iNO and mt.name=bd.sCartName order by fk_cartid " var="rs" dataSource="${ds}" />
<sql:query sql="select * from MalllistTable" var="qs" dataSource="${ds}" />        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>後台管理</title>
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

table, th , td  {
  border: 1px solid grey;
  border-collapse: collapse;
  padding: 5px;
}
table tr:nth-child(odd) {
  background-color: #f1f1f1;
}
table tr:nth-child(even) {
  background-color: #ffffff;
}
mark.yellow {
	background: linear-gradient(transparent 40%,rgba(255,255,255,0) 40%, #FFF176 90%,transparent 95%);	
    padding: 2px 1px;
}
</style>
</style>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/vendor/css/paper-dashboard.css" />
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
            <div class="navbar-toggle">
              <button type="button" class="navbar-toggler">
                <span class="navbar-toggler-bar bar1"></span>
                <span class="navbar-toggler-bar bar2"></span>
                <span class="navbar-toggler-bar bar3"></span>
              </button>
            </div>
            <b><a class="navbar-brand" href="javascript:;">後臺商城系統管理</a></b>
            <a class="btn btn-warning" href="<c:url value="/mall/New"/>">新增商品</a>
            <a class="btn btn-warning" href="<c:url value="/mall/Inquire"/>">查詢商品</a>
            <a class="btn btn-warning" href="<c:url value="/mall/Delete"/>">刪除商品</a>
            
          </div>
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navigation" aria-controls="navigation-index" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-bar navbar-kebab"></span>
            <span class="navbar-toggler-bar navbar-kebab"></span>
            <span class="navbar-toggler-bar navbar-kebab"></span>
          </button>
          <div class="collapse navbar-collapse justify-content-end" id="navigation">
            <form>
              <div class="input-group no-border">
                <input type="text" value="" class="form-control" placeholder="Search...">
                <div class="input-group-append">
                  <div class="input-group-text">
                    <i class="nc-icon nc-zoom-split"></i>
                  </div>
                </div>
              </div>
            </form>
            <ul class="navbar-nav">
              <li class="nav-item btn-rotate dropdown">
                <a class="nav-link dropdown-toggle" href="http://example.com" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                  <i class="nc-icon nc-bell-55"></i>
                  <p>
                    <span class="d-lg-none d-md-block">Some Actions</span>
                  </p>
                </a>
                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownMenuLink">
                  <a class="dropdown-item" href="#">Action</a>
                  <a class="dropdown-item" href="#">Another action</a>
                  <a class="dropdown-item" href="#">Something else here</a>
                </div>
              </li>
            </ul>
          </div>
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
                      <p class="card-category">商城遊戲</p>
                      <p class="card-title">154筆<p>
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
                      <p class="card-category">今日賣出數量</p>
                      <p class="card-title">491筆<p>
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
                      <p class="card-category">今日商城系統流量</p>
                      <p class="card-title">9265位<p>
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
        
<!--         第二層大區塊 -->
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
                <h5 class="card-title">商城</h5>
                <p class="card-category">遊戲種類</p>
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
                <h5 class="card-title">商城<h5>
                <p class="card-category">遊戲品項</p>
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
          
<!--          ---------------------------------------------------------------------- -->
        </div>
          <div class="col-md-12">
            <div class="card card-chart">
              <div class="card-header">
                <h5 class="card-title">管理商城系統</h5>
                <p class="card-category">查詢</p>
              </div>
              <div class="card-body">
              
              
    <!-- 摺疊 -->          
              
              
                <div id="accordion">
  <div class="card">
    <div class="card-header" id="headingOne">
      <h5 class="mb-0">
        <button class="btn btn-link" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
          	全站訂單紀錄
        </button>
      </h5>
    </div>

    <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordion">
      <div class="card-body">
      
      
      <table border="1" id="tableChange" class="display" style="font-size: 12px; border:4px">
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
          	管理所有商品
        </button>
      </h5>
    </div>
    <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordion">
      <div class="card-body">
        
        
        
        <table border="1" id="tableSupport" class="display" style="font-size: 12px; border:3px">
				<thead>
				<tr>
					<th>No.</th>
			<th>名稱</th>
			<th>類型</th>
			<th>平台</th>
			<th>分類</th>
			<th>分級</th>
			<th>價錢</th>
			<th>付款方式</th>
			<th>交貨方式</th>
			<th>商品尺寸</th>
			<th>商品圖片</th>
			<!-- 改成圖片 -->
			<th>商品簡介</th>
			<th>商品評價</th>
				</tr>
				</thead>
				<c:forEach var='row' items='${qs.rows}'>

					<tr>
					<td>${row.no}</td>
					<td>${row.name}</td>
					<td>${row.type}</td>
					<td>${row.host}</td>
					<td>${row.number}</td>
					<td>${row.level}</td>
					<td>${row.money}</td>
					<td>${row.pay}</td>
					<td>${row.deilvery}</td>
					<td>${row.size}</td>
					<td><img 
					src="${pageContext.request.contextPath }/${row.origin}"
					style="width: 150; height: 220;" alt="" /></td>
					<td>${row.item}</td>
					<td>${row.contentment}</td>

						

					</tr>

				</c:forEach>

			</table>
        
        
        
        
        
      </div>

          </div>
        </div>
      </div>
<!--       <footer class="footer" style="position: absolute; bottom: 0; width: -webkit-fill-available;"> -->
<!--         <div class="container-fluid"> -->
<!--           <div class="row"> -->
<!--             <nav class="footer-nav"> -->
<!--               <ul> -->
<!--                 <li><a href="https://www.creative-tim.com" target="_blank">Creative Tim</a></li> -->
<!--                 <li><a href="https://www.creative-tim.com/blog" target="_blank">Blog</a></li> -->
<!--                 <li><a href="https://www.creative-tim.com/license" target="_blank">Licenses</a></li> -->
<!--               </ul> -->
<!--             </nav> -->
<!--             <div class="credits ml-auto"> -->
<!--               <span class="copyright"> -->
<!--                 © 2020, made with <i class="fa fa-heart heart"></i> by Creative Tim -->
<!--               </span> -->
<!--             </div> -->
<!--           </div> -->
<!--         </div> -->
<!--       </footer> -->
    </div>
  </div>
  <script>
  
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
  
<%-- <%@ include file="../Foot.jsp"%> --%>
</body>
</html>
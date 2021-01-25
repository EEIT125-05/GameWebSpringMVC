<%@page import="com.web.game.member.model.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../Link.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	response.setContentType("text/html;charset=UTF-8");
response.setHeader("Cache-Control", "no-cache"); // HTTP 1.1
response.setHeader("Pragma", "no-cache"); // HTTP 1.0
response.setDateHeader("Expires", -1); // Prevents caching at the proxy server
%>
<html>
<head>
<meta charset="UTF-8">
<title>後台管理</title>
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/vendor/css/paper-dashboard.css" />
<!-- <script src='//cdn.datatables.net/1.10.23/js/jquery.dataTables.min.js'></script> -->
<link rel='stylesheet'
	href='https://cdn.datatables.net/1.10.23/css/jquery.dataTables.min.css'>
<script
	src="https://cdn.jsdelivr.net/npm/sweetalert2@10.13.0/dist/sweetalert2.all.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.js"
	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	crossorigin="anonymous"></script>
<script type="text/javascript" charset="utf8"
	src="https://cdn.datatables.net/1.10.23/js/jquery.dataTables.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
<style>
.checkinput[type=checkbox] {
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

.checkinput:checked+.checklabel {
	background: #db1f1f;
}

.checkinput:checked+.checklabel:after {
	left: calc(100% - 5px);
	transform: translateX(-100%);
}

.checklabel:active:after {
	width: 20px;
}
//
centering /* body { */
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



		<div class="main-panel" style="height: 100vh">
			<!-- Navbar -->
			<nav
				class="navbar navbar-expand-lg navbar-absolute fixed-top navbar-transparent">
			<div class="container-fluid">
				<div class="navbar-wrapper">
					<div class="navbar-toggle">
						<button type="button" class="navbar-toggler">
							<span class="navbar-toggler-bar bar1"></span> <span
								class="navbar-toggler-bar bar2"></span> <span
								class="navbar-toggler-bar bar3"></span>
						</button>
					</div>
					<a class="navbar-brand" href="javascript:;">會員後台管理${user.sAccount}</a>
				</div>
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navigation" aria-controls="navigation-index"
					aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-bar navbar-kebab"></span> <span
						class="navbar-toggler-bar navbar-kebab"></span> <span
						class="navbar-toggler-bar navbar-kebab"></span>
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
											<i class="nc-icon nc-single-02 text-primary"></i>
										</div>
									</div>
									<div class="col-7 col-md-8">
										<div class="numbers">
											<p class="card-category">本站會員人數</p>
											<p class="card-title">145人
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
											<p class="card-category">本站停權人數</p>
											<p class="card-title">4人
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
											<p class="card-category">上月增加會員人數</p>
											<p class="card-title">40人
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
											<p class="card-category">本月增加會員人數</p>
											<p class="card-title">43人
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
								<h5 class="card-title">每月新增會員</h5>
								<p class="card-category">2020/09月-2021/01月</p>
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
			</div>
			<div class="row">
				<div class="col-md-6">
					<div class="card ">
						<div class="card-header ">
							<h5 class="card-title">會員</h5>
							<p class="card-category">性別</p>
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
								<i class="fa fa-refresh"></i> Last day
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="card ">
						<div class="card-header ">
							<h5 class="card-title">會員年齡</h5>
							<p class="card-category">年齡範圍</p>
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
								<i class="fa fa-refresh"></i> Last day
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-12">
				<div class="card card-chart">
					<div class="card-header">
						<h5 class="card-title">會員管理系統</h5>
						<p class="card-category">管理功能</p>
					</div>
					<div class="card-body">

						<!-- 								摺疊 -->

						<div id="accordion">
							<div class="card">
								<div class="card-header" id="headingOne">
									<h5 class="mb-0">
										<button class="btn btn-link" data-toggle="collapse"
											data-target="#collapseOne" aria-expanded="true"
											aria-controls="collapseOne">會員資料明細</button>
									</h5>
								</div>

								<div id="collapseOne" class="collapse show"
									aria-labelledby="headingOne" data-parent="#accordion">
									<div class="card-body">

										<table id='tablee' style="text-align: center; width: 100%;">
											<thead>
												<tr style='height: 72;'>
													<!-- 																	<th width='40' type="">編號</th> -->
													<th width='30'>照片</th>
													<th width='30'>帳號</th>
													<th width='30'>暱稱</th>
													<th width='10'>姓名</th>
													<th width='30'>信箱</th>
													<!-- 																	<th width='30'>居住地</th> -->
													<!-- 																	<th width='30'>手機號碼</th> -->
													<th width='40'>性別</th>
													<!-- 																	<th width='30'>生日</th> -->
													<th width='30'>建立日期</th>
													<th width='30'>權限狀態</th>
													<!-- 							<th width='70'>資料維護</th> -->
												</tr>
											</thead>
											<tbody>
												<c:forEach var='user' items='${users}'>
													<tr>
														<%-- 																		<td>${user.iNo}</td> --%>
														<td><img width='60' height='80'
															src="<c:url value='/member/picture/getall/${user.sAccount}'/>"></td>
														<%-- 							<td><a href="<c:url value='/member/${user.iNo}'/>" --%>
														<%-- 								method="post">${user.iNo}</a></td> --%>
														<td><a
															href="<c:url value='/member/Update?sAccount=${user.sAccount}'/>">
																<input type="button" class="account"
																value="${user.sAccount}"
																style='background-color: skyblue; width: 100%; height: 100%;'>
														</a></td>
														<%-- 							<td>${user.sAccount}</td> --%>
														<td>${user.sNickname}</td>
														<td>${user.sEname}</td>
														<td>${user.sEmail}</td>
														<%-- 																		<td>${user.sAddress}</td> --%>
														<%-- 																		<td>${user.sPhone}</td> --%>
														<td>${user.sGender}</td>
														<%-- 																		<td>${user.sBirthday}</td> --%>
														<td>${user.registerDate}</td>
														<td>
															<!-- 																		onclick="abcc(this);" -->
															<button id="change${user.iNo}" class="change"
																type="button"
																style='background-color: orange; width: 100%; height: 100%;'
																value='${user.iNo}'>${user.status}</button>


														</td>
														<!-- 								<td><a class='deletelink' -->
														<%-- 									href="<c:url value='/member/delete/${user.iNo}'/>"><button --%>
														<!-- 											type="button" -->
														<!-- 											style='background-color: red; width: 100%; height: 100%;'>刪除</button></a></td> -->
													</tr>
												</c:forEach>
											</tbody>
										</table>

									</div>
								</div>
							</div>


							<!-- </div> -->
							<!--     摺疊           -->
							<!--               </div> -->
							<!--             </div> -->
							<!--           </div> -->
						</div>
					</div>
<%-- 					<%@ include file="../Foot.jsp"%> --%>
</body>
<script>
	window.onload = function() {

		ctx = document.getElementById('chartHours').getContext("2d");
		myChart = new Chart(ctx, {
			type : 'line',

			data : {
				labels : [ "9", "10", "11",
						"12", "1" ],
				datasets : [ {
					borderColor : "#6bd098",
					backgroundColor : "#6bd098",
					pointRadius : 0,
					pointHoverRadius : 0,
					borderWidth : 3,
					data : [ 4,29,29,40,43 ]
				} ]
			},
			options : {
				legend : {
					display : false
				},

				tooltips : {
					enabled : false
				},

				scales : {
					yAxes : [ {

						ticks : {
							fontColor : "#9f9f9f",
							beginAtZero : false,
							maxTicksLimit : 5,
						//padding: 20
						},
						gridLines : {
							drawBorder : false,
							zeroLineColor : "#ccc",
							color : 'rgba(255,255,255,0.05)'
						}

					} ],

					xAxes : [ {
						barPercentage : 1.6,
						gridLines : {
							drawBorder : false,
							color : 'rgba(255,255,255,0.1)',
							zeroLineColor : "transparent",
							display : false,
						},
						ticks : {
							padding : 20,
							fontColor : "#9f9f9f"
						}
					} ]
				},
			}
		});

		ctx = document.getElementById('chartEmail').getContext("2d");

		myChart = new Chart(ctx, {
			type : 'pie',
			data : {
				labels : [ '男', '女' ],
				datasets : [ {
					label : "Emails",
					pointRadius : 0,
					pointHoverRadius : 0,
					backgroundColor : [ '#2894FF', '#FF0080' ],
					borderWidth : 0,
					data : [ 110, 35 ]
				} ]
			},

			options : {

				legend : {
					display : true
				},

				pieceLabel : {
					render : 'percentage',
					fontColor : [ 'white' ],
					precision : 2
				},

				tooltips : {
					enabled : true
				},

				scales : {
					yAxes : [ {

						ticks : {
							display : false
						},
						gridLines : {
							drawBorder : false,
							zeroLineColor : "transparent",
							color : 'rgba(255,255,255,0.05)'
						}

					} ],

					xAxes : [ {
						barPercentage : 1.6,
						gridLines : {
							drawBorder : false,
							color : 'rgba(255,255,255,0.1)',
							zeroLineColor : "transparent"
						},
						ticks : {
							display : false,
						}
					} ]
				},
			}
		});

		ctx = document.getElementById('chartEmail1').getContext("2d");

		myChart = new Chart(ctx, {
			type : 'pie',
			data : {
				labels : [ '15~19歲', '20~24歲', '25~29歲', '30~34歲', '35~39歲' ],
				datasets : [ {
					label : "Emails",
					pointRadius : 0,
					pointHoverRadius : 0,
					backgroundColor : [ '#00FFFF', '#8600FF', '#28FF28',
							'#FF8040', '#842B00' ],
					borderWidth : 0,
					data : [ 19,32,45,33,16 ]
				} ]
			},

			options : {

				legend : {
					display : true
				},

				pieceLabel : {
					render : 'percentage',
					fontColor : [ 'white' ],
					precision : 2
				},

				tooltips : {
					enabled : true
				},

				scales : {
					yAxes : [ {

						ticks : {
							display : false
						},
						gridLines : {
							drawBorder : false,
							zeroLineColor : "transparent",
							color : 'rgba(255,255,255,0.05)'
						}

					} ],

					xAxes : [ {
						barPercentage : 1.6,
						gridLines : {
							drawBorder : false,
							color : 'rgba(255,255,255,0.1)',
							zeroLineColor : "transparent"
						},
						ticks : {
							display : false,
						}
					} ]
				},
			}
		});

		$().ready(function() {
			$('#tablee').DataTable({});
		});

		// 							$('.deletelink').click(function() {
		// 								if (confirm('確定刪除此筆紀錄? ')) {
		// 									var href = $(this).attr('href');
		// 									$('form').attr('action', href).submit();
		// 								}
		// 								return false;
		// 							});

		$(document).ready(function() {
							$(document).on("click",".change",
											function() {
												var id = $(this).val();
												// 				console.log("success2 " + $("#change" + id).val());
												var sAccount = $(this).parent().parent().find(".account").val();
												var xhr = new XMLHttpRequest();
												xhr.open("POST","<c:url value='/member/Change/" + sAccount + "'/>",
																true);
												xhr.setRequestHeader(
																"Content-Type",
																"application/x-www-form-urlencoded");
												xhr.send("sAccount="
																+ sAccount);
												xhr.onreadystatechange = function() {
													// 								console.log("sAccount=" + sAccount);
													if (xhr.readyState == 4
															&& xhr.status == 200) {
														let obj = JSON.parse(xhr.responseText);
														// 						console.log("success " + obj);
														// 						console.log("idvalue  " + $("#change" + id).val());
														$("#change" + id).text(obj);
													} else {
														console.log("xhr.readyState="
																		+ xhr.readyState);
														console.log("xhr.status="
																		+ xhr.status);
														console.log("修改失敗");
													}
												}
											})

						})
	}
</script>
</html>
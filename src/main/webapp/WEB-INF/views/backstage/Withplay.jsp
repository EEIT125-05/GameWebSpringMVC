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
			<div class="row">
				<div class="card">
				<div class="card-header" id="headingOne">
					<h5 class="mb-0">
						<button class="btn btn-link" data-toggle="collapse"
							data-target="#collapseOne" aria-expanded="true"
							aria-controls="collapseOne">管理所有比賽</button>
					</h5>
				</div>

				
			</div>
			
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
  
  
<%@ include file="../Foot.jsp"%>
</body>
</html>
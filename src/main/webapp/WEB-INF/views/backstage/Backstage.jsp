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
  <div class="wrappers">
    <div class="sidebar" data-color="white" data-active-color="danger">
      <div class="logo">
        <a href="https://www.creative-tim.com" class="simple-text logo-mini">
          <!-- <div class="logo-image-small">
            <img src="./assets/img/logo-small.png">
          </div> -->
          <!-- <p>CT</p> -->
        </a>
        <a href="https://www.creative-tim.com" class="simple-text logo-normal">
          Your Logo
          <!-- <div class="logo-image-big">
            <img src="../assets/img/logo-big.png">
          </div> -->
        </a>
      </div>
      <div class="sidebar-wrapper">
        <ul class="nav">
          <li class="active "> <!-- 自己的主頁加上.active -->
            <a href="javascript:;"><!-- 連結 -->
              <i class="nc-icon nc-bank"></i><!-- 左邊的小logo,也可到範例的icons.html找自己要的 -->
              <p>會員系統</p>
            </a>
          </li>
          <li>
            <a href="javascript:;">
              <i class="nc-icon nc-bank"></i>
              <p>商城系統</p>
            </a>
          </li>
          <li>
            <a href="<c:url value='/withplay/With'/>">
              <i class="nc-icon nc-bank"></i>
              <p>陪玩系統</p>
            </a>
          </li>
          <li>
            <a href="javascript:;">
              <i class="nc-icon nc-diamond"></i>
              <p>賽事系統</p>
            </a>
          </li>
          <li>
          <li>
            <a href="javascript:;">
              <i class="nc-icon nc-diamond"></i>
              <p>討論區</p>
            </a>
          </li>
          <li>
            <a href="<c:url value='/backstage/Exchange'/>">
              <i class="nc-icon nc-pin-3"></i>
              <p>交換系統</p>
            </a>
          </li>
        </ul>
      </div>
    </div>
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
            <a class="navbar-brand" href="javascript:;">Title</a>
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
          <div class="col-md-12"><!-- 右邊的大區塊自己div東西都放這裡面 -->
            <h3 class="description">Your content here</h3>

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
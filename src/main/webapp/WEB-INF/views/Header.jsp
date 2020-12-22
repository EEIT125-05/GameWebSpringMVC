<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

 <nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
      <a class="navbar-brand" href="<c:url value='/'/>">GameBar</a>
      <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
        
        <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownPages" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              會員管理
            </a>
           <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownBlog">
              <a class="dropdown-item" href="<c:url value='/member/Sign'/>">登入</a>
              <a class="dropdown-item" href="<c:url value='/member/Logout'/>">測試用登出</a>
              <a class="dropdown-item" href="<c:url value='/member/Login'/>">註冊</a>
              <a class="dropdown-item" href="<c:url value='/member/Data'/>">會員資料</a>
            </div>
          </li>
        
        <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownPortfolio" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              商城
            </a>
            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownPortfolio">
              <a class="dropdown-item" href=""></a>
            </div>
          </li>
          
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownPortfolio" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              討論區
            </a>
            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownPortfolio">
              <a class="dropdown-item" href="<c:url value='/forum/Index'/>">討論區</a>
              <a class="dropdown-item" href="<c:url value='/forum/Create'/>">新增貼文</a>
              <a class="dropdown-item" href="<c:url value='/forum/Management'/>">管理貼文</a>
            </div>
          </li>
          
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownPortfolio" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              陪玩
            </a>
            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownPortfolio">
              <a class="dropdown-item" href="">找人陪玩</a>
              <a class="dropdown-item" href="">當陪玩主</a>
              <a class="dropdown-item" href="">修改資料</a>
              <a class="dropdown-item" href="">管理</a>
            </div>
          </li>
          
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownPortfolio" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              賽事
            </a>
            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownPortfolio">
              <a class="dropdown-item" href="<c:url value='/contest/Index'/>">所有比賽</a>
              <a class="dropdown-item" href="<c:url value='/contest/Create'/>">新增比賽</a>
              <a class="dropdown-item" href="<c:url value='/contest/Management'/>">管理比賽</a>
              <a class="dropdown-item" href="<c:url value='/contest/Participate'/>">我的比賽</a>
            </div>
          </li>
          
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownBlog" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              遊戲交換
            </a>
            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownBlog">
              <a class="dropdown-item" href="<c:url value='/exchange/Index'/>">遊戲交換</a>
              <a class="dropdown-item" href="<c:url value="/exchange/insertSupportGame"/>">我要交換</a>
              <a class="dropdown-item" href="<c:url value="/exchange/management"/>">管理交換</a>
              <a class="dropdown-item" href="<c:url value="/exchange/changepage"/>">測試中</a>
              <a class="dropdown-item" href="<c:url value="/exchange/management"/>">兼修中</a>
              <a class="dropdown-item" href="<c:url value="/exchange/management"/>">兼修中</a>
              <a class="dropdown-item" href="<c:url value="/exchange/management"/>">兼修中</a>
            </div>
          </li>
          
        </ul>
      </div>
    </div>
  </nav>

  <header>
    <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
      <ol class="carousel-indicators">
        <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
      </ol>
      <div class="carousel-inner" role="listbox">
       
        <div class="carousel-item active" style="background-image: url('http://placehold.it/1900x1080')">
          <div class="carousel-caption d-none d-md-block">
            <h3></h3>
         
          </div>
        </div>
       
        <div class="carousel-item" style="background-image: url('http://placehold.it/1900x1080')">
          <div class="carousel-caption d-none d-md-block">
            <h3></h3>
         
          </div>
        </div>
     
        <div class="carousel-item" style="background-image: url('http://placehold.it/1900x1080')">
          <div class="carousel-caption d-none d-md-block">
            <h3>111 </h3>
            <p>111111</p>
          </div>
        </div>
      </div>
      <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
      </a>
      <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
      </a>
    </div>
  </header>


   
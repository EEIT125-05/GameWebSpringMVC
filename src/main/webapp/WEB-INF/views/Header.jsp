<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

 <nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
      <a class="navbar-brand" href="<c:url value='/'/>" style="color:white;font-weight:bold;padding:0"><img src="${pageContext.request.contextPath}/images/barLOGOsmall.png" style="height:45px"></a>
      <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
        
        <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" style="color:white;font-weight:bold" href="#" id="navbarDropdownPages" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
      <c:choose>
		<c:when test="${empty user}">
              	會員管理
		</c:when>
		<c:otherwise>
				${user.sAccount}
		</c:otherwise>
      </c:choose>        
            </a>
           <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownBlog">
              <c:choose>
				<c:when test="${empty user}">
	              <a class="dropdown-item" href="<c:url value='/member/Sign'/>">登入</a>
				</c:when>
				<c:otherwise>
	              <a class="dropdown-item" href="<c:url value='/member/Logout'/>">登出</a>
				</c:otherwise>
              </c:choose>
              <a class="dropdown-item" href="<c:url value='/member/Login'/>">註冊</a>
              <a class="dropdown-item" href="<c:url value='/member/Data'/>">會員資料</a>
              <c:if test="${user.sAccount == 'admin'}">
              	<a class="dropdown-item" href="<c:url value="/backstage/Member"/>">後台測試中</a>
              </c:if>
            </div>
          </li>
        
        <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" style="color:white;font-weight:bold" id="navbarDropdownPortfolio" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              商城
            </a>
            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownPortfolio">
              <a class="dropdown-item" href="<c:url value='/mall/Index'/>">商城</a>
              <a class="dropdown-item" href="<c:url value='/mall/MallDL'/>">訂單查詢</a>
              <a class="dropdown-item" href="<c:url value='/mall/Addshop'/>">我的購物車</a>   
<%--               <a class="dropdown-item" href="<c:url value='/mall/New'/>">新增商品</a> --%>
<%--               <a class="dropdown-item" href="<c:url value='/mall/Inquire'/>">查詢商品</a> --%>
<%--               <a class="dropdown-item" href="<c:url value='/mall/Delete'/>">刪除商品</a> --%>
            </div>
          </li>
          
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" style="color:white;font-weight:bold" id="navbarDropdownPortfolio" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              討論區
            </a>
            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownPortfolio">
              <a class="dropdown-item" href="<c:url value='/forum/Index'/>">討論區</a>
              <a class="dropdown-item" href="<c:url value='/forum/Create'/>">新增貼文</a>
<%--               <a class="dropdown-item" href="<c:url value='/forum/Management'/>">管理貼文</a> --%>
            </div>
          </li>
          
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" style="color:white;font-weight:bold" id="navbarDropdownPortfolio" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              陪玩
            </a>
            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownPortfolio">
              <c:choose>
	              <c:when test="${empty user}">
	              	<a class="dropdown-item" href="<c:url value='/withplay/Index'/>">找人陪玩</a>
	              </c:when>  
	              <c:otherwise> 
	              	<a class="dropdown-item" href="<c:url value='/withplay/Index'/>">找人陪玩</a>
		              <c:choose>
		              <c:when test="${empty withplayHost.sAccount}">
		              	<a class="dropdown-item" href="<c:url value='/withplay/new'/>">當陪玩主</a>
	             	<a class="dropdown-item" href="<c:url value='/withplay/Withorderlist'/>">我的訂單</a>
		              </c:when>  
		              <c:otherwise>              
		              	<a class="dropdown-item" href="<c:url value='/withplay/update'/>">修改資料</a>
		              	<a class="dropdown-item" href="<c:url value='/withplay/Withorderlist'/>">我的訂單</a>
	             		<a class="dropdown-item" href="<c:url value='/withplay/With'/>">管理</a>
		              </c:otherwise>              
		              </c:choose>              
	              </c:otherwise>
              </c:choose>
               
              
            </div>
          </li>
          
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" style="color:white;font-weight:bold" id="navbarDropdownPortfolio" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
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
            <a class="nav-link dropdown-toggle" href="#" style="color:white;font-weight:bold" id="navbarDropdownBlog" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              遊戲交換
            </a>
            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownBlog">
              <a class="dropdown-item" href="<c:url value='/exchange/Index'/>">交換版</a>
              <a class="dropdown-item" href="<c:url value="/exchange/wishBoard"/>">許願池</a>
              <a class="dropdown-item" href="<c:url value="/exchange/insertSupportGame"/>">我要換</a>
              <a class="dropdown-item" href="<c:url value="/exchange/insertDemandGame"/>">我要徵</a>
              <a class="dropdown-item" href="<c:url value="/exchange/insertMyGame"/>">新增我的遊戲庫</a>
              <a class="dropdown-item" href="<c:url value="/exchange/management"/>">我的遊戲庫</a>
              <a class="dropdown-item" href="<c:url value="/exchange/gotoMemberData"/>">我的交易紀錄(會員中心)</a>
              
            </div>
          </li>
          
        </ul>
      </div>
    </div>
  </nav>

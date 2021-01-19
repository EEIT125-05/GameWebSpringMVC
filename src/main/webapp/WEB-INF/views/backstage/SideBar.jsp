<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="sidebar" data-color="white" data-active-color="danger">
      <div class="logo">
        <a href="https://www.creative-tim.com" class="simple-text logo-mini">
          <!-- <div class="logo-image-small">
            <img src="./assets/img/logo-small.png">
          </div> -->
          <!-- <p>CT</p> -->
        </a>
        <a href="https://www.creative-tim.com" class="simple-text logo-normal">
         		 系統
          <!-- <div class="logo-image-big">
            <img src="../assets/img/logo-big.png">
          </div> -->
        </a>
      </div>
      <div class="sidebar-wrapper">
        <ul class="nav">
          <li> <!-- 自己的主頁加上.active -->
            <a href="<c:url value='/backstage/Member'/>"><!-- 連結 -->
              <i class="nc-icon nc-bank"></i><!-- 左邊的小logo,也可到範例的icons.html找自己要的 -->
              <p class="Member">會員系統</p>
            </a>
          </li>
          <li>
            <a href="<c:url value='/backstage/Mall'/>">
              <i class="nc-icon nc-bank"></i>
              <p class="Mall">商城系統</p>
            </a>
          </li>
          <li>
            <a href="<c:url value='/backstage/Withplay'/>">
              <i class="fa fa-spinner"></i>
              <p class="Withplay">陪玩系統</p>
            </a>
          </li>
          <li>
            <a href="<c:url value='/backstage/Contest'/>">
              <i class="nc-icon nc-diamond"></i>
              <p class="Contest">賽事系統</p>
            </a>
          </li>
          <li>
          <li>
            <a href="<c:url value='/backstage/Forum'/>">
              <i class="nc-icon nc-diamond"></i>
              <p class="Forum">討論區</p>
            </a>
          </li>
          <li>
            <a href="<c:url value='/backstage/Exchange'/>">
              <i class="fa fa-handshake-o"></i>
              <p class="Exchange">交換系統</p>
            </a>
          </li>
        </ul>
      </div>
    </div>
    
    
<script>
	$(function(){
		let path = "<%=request.getServletPath()%>";
 		let splitPath = path.split("/");
 		splitPath = splitPath[splitPath.length-1].split(".")[0];
 		
 		$("." + splitPath).closest("li").addClass("active");
	});

</script>
 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../Link.jsp" %>

<sql:setDataSource var="ds" driver="com.microsoft.sqlserver.jdbc.SQLServerDriver"
	url="jdbc:sqlserver://localhost:1433;DatabaseName=GameSpringMVCDB" user="sa"
	password="sa123456" />
<c:choose>
<c:when test="${param.gamename == ''}">
<sql:query sql="select * from MalllistTable" var="rs" dataSource="${ds}" /> 
</c:when>
<c:when test="${param.change == null}">
<sql:query sql="select * from MalllistTable" var="rs" dataSource="${ds}" /> 
</c:when>
<c:when test="${param.change == 'Search'}">
<sql:query sql="select * from MalllistTable WHERE name like '%${param.gamename}%'" var="rs" dataSource="${ds}"  />
</c:when>
</c:choose>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <link rel=stylesheet type="text/css" href="css/LeftMall.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>商城</title>
<style>
.flex12 {
  flex-wrap: wrap;
}
.td_1{
white-space:nowrap;
}

</style>
</head>
<body >
	<%@ include file="../Header.jsp"%>

	<form action="<c:url value="/mall/minipage"/>" method="get">
		<!-- <h2>遊戲商城</h2> -->

		<hr>



		<div class="container " style="background-color:#ffffff">
			<h1 class="mt-4 mb-3">
				商城 <small>首頁</small>
			</h1>




        
</style>
</head>
<body>
<%@ include file="../Header.jsp" %>

<form action="<c:url value="/mall/minipage"/>" method="get">
 <!-- <h2>遊戲商城</h2> -->
  <header>
    <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
      <ol class="carousel-indicators">
        <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
      </ol>
      <div class="carousel-inner" role="listbox">
       
        <div class="carousel-item active" style="background-image: url('https://www.gamewikia.com/uploads/2018/11/19/1.1-a90bdf82bd41365c4815d527fa0e0ac5.jpg')">
          <div class="carousel-caption d-none d-md-block">
            <h3></h3>
         
          </div>
        </div>
       
        <div class="carousel-item" style="background-image: url('https://i1.achangpro.com/img.kissjojo99.com/20180203171349_89.jpg')">
          <div class="carousel-caption d-none d-md-block">
            <h3></h3>
         
          </div>
        </div>
     
        <div class="carousel-item" style="background-image: url('https://ziweigame.com/wp-content/uploads/2020/11/%E8%8B%B1%E9%9B%84%E8%81%AF%E7%9B%9F%EF%BC%9A%E6%BF%80%E9%AC%A5%E5%B3%BD%E8%B0%B7-1024x576.jpg'); ">
          <div class="carousel-caption d-none d-md-block">
          
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
  <hr>
  
  <center>
  <h3>商品</h3>
  <span>1111111</span>
  
  
  </center>
  
  <div class="container ">
 <input type="text" name="gamename" size="10">
 <button class="search" type="submit" value="Search" name="change" >搜尋</button>
<a class="Shoptxt" href="<c:url value="/mall/gotoMyshop"/>">我的購物車</a>
</form>
<form action="<c:url value="/mall/todoadd"/>"  method="get">
		
		<div class="row">
			<c:forEach var="row" items="${rs.rows}">
<!-- 				 <div style="display:inline"> -->
				
				<div class="col-md-6 col-lg-4 mb-1" >
					<div class="portfolio-item mx-auto" data-toggle="modal"data-target="#portfolioModal${row.no }">
						<div
							class="portfolio-item-caption d-flex align-items-center justify-content-center ">
							<div
								class="portfolio-item-caption-content text-center text-white">
								<i class="fas fa-plus fa-3x"></i>
							</div>
						</div>
						<img  class="img-fluid" src="${pageContext.request.contextPath }/${row.origin}" style="width: 380; height: 250;" alt="" />
					    <center>
					    <span>${row.name}</span>
					    </center>
					</div>
				</div>




		<div class="row">
			<c:forEach var="row" items="${rs.rows}">
				<!-- 				 <div style="display:inline"> -->
			<div style=" width: 350px; height: 250px;margin-left: 20px; margin-bottom: 35px;">
				<div style=" width: 150px;height: 200; margin: 20px 20px 35px 15px ; float: left;">
					<img 
					src="${pageContext.request.contextPath }/${row.origin}"
					style="width: 150; height: 220;" alt="" />
				</div>
				<div style=" width: 125px;height: 200; margin: 20px 20px 10px 10px ; float: right;">
				<p>名稱: ${row.name}</p>
				<p>分類: ${row.level}</p>
				<p>平台: ${row.host}</p>
				<p>類型: ${row.type}</p>
				
				<b style="font-size: 15px;color: red;">$:${row.money}</b>
				
				<P><button class="btn btn-dark" type="submit" name="todo"
					value="${row.no}">加到購物車</button>

				<div class="portfolio-modal modal fade" id="portfolioModal${row.no }"
					tabindex="-1" role="dialog" aria-labelledby="portfolioModal1Label"
					aria-hidden="true">
					<div class="modal-dialog modal-xl" role="document">
						<div class="modal-content">
							<button class="close" type="button" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true"><i class="fas fa-times"></i></span>
							</button>
							<div class="modal-body text-center">
								<div class="container">
									<div class="row justify-content-center">
										<div class="col-lg-8">
											<h2
												class="portfolio-modal-title text-secondary text-uppercase mb-0"
												id="portfolioModal1Label">${row.name}</h2>
											<div class="divider-custom">
												<div class="divider-custom-line"></div>
												<div class="divider-custom-icon">
													<i class="fas fa-star"></i>
												</div>
												<div class="divider-custom-line"></div>
											</div>
											<img class="img-fluid rounded mb-5"
												src="${pageContext.request.contextPath }/${row.origin}"
												alt="" />
											<p class="mb-5">
											<table>
												<thead>
													<tr>
														<th class="td_1">名稱       </th>
														<th>${row.name}</th>
														
													</tr>
													
													<tr>
														<td class="td_1">簡介       </td>
														<td>${row.item}</td>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td class="td_1">類型       </td>
														<td>${row.type}</td>
													</tr>
													<tr>
														<td class="td_1">平台       </td>
														<td>${row.host}</td>
													</tr>
													<tr>
														<td class="td_1">分類       </td>
														<td>${row.level}</td>
													</tr>
													<tr>
														<td class="td_1">價錢       </td>
														<td  style="color: red;">${row.money}</td>
													</tr>
													
													<tr>
														<td class="td_1">評分       </td>
														<td>${row.contentment}</td>
													</tr>
												</tbody>
											</table>
											</p>
											<button  type="submit" name="todo" value="${row.no}">加到購物車</button> 
												<a class="Shoptext" href="./MallCart.jsp">我的購物車</a>
											</button>
										</div>
									</div>
								</div>
							</div>
						</div>

					</div>
				</div>

			</c:forEach>
	
			</div>
		</div>
	</form>
<%@ include file="../Foot.jsp" %>
</body>
</html>
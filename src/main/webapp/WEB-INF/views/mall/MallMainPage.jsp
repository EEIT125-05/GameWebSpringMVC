<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../Link.jsp"%>

<sql:setDataSource var="ds"
	driver="com.microsoft.sqlserver.jdbc.SQLServerDriver"
	url="jdbc:sqlserver://localhost:1433;DatabaseName=GameSpringMVCDB"
	user="sa" password="sa123456" />
<c:choose>

	<c:when test="${param.switchgame != null}">
		<sql:query
			sql="select * from MalllistTable WHERE host like '%Switch%'" var="rs"
			dataSource="${ds}" />
	</c:when>

	<c:when test="${param.ps5game != null}">
		<sql:query sql="select * from MalllistTable WHERE host like '%Ps5%'"
			var="rs" dataSource="${ds}" />
	</c:when>

	<c:when test="${param.xboxgame != null}">
		<sql:query sql="select * from MalllistTable WHERE host like '%Xbox%'"
			var="rs" dataSource="${ds}" />
	</c:when>
	<c:when test="${param.webgame != null}">
		<sql:query sql="select * from MalllistTable WHERE host like '%Web%'"
			var="rs" dataSource="${ds}" />
	</c:when>

	<c:when test="${param.gamename == ''}">
		<sql:query sql="select * from MalllistTable" var="rs"
			dataSource="${ds}" />
	</c:when>
	<c:when test="${param.change == null}">
		<sql:query sql="select * from MalllistTable" var="rs"
			dataSource="${ds}" />
	</c:when>
	<c:when test="${param.change == 'Search'}">
		<sql:query
			sql="select * from MalllistTable WHERE name like '%${param.gamename}%'"
			var="rs" dataSource="${ds}" />
	</c:when>




	<c:when test="${param.allgame == null}">
		<sql:query sql="select * from MalllistTable" var="rs"
			dataSource="${ds}" />
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

.td_1 {
	white-space: nowrap;
}

</style>
</head>
<body>
	<%@ include file="../Header.jsp"%>

	<form action="<c:url value="/mall/minipage"/>" method="get">
		<!-- <h2>遊戲商城</h2> -->

		<hr>



		<div class="container ">
			<h1 class="mt-4 mb-3">
				商城 <small>首頁</small>
			</h1>

			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="<c:url value='/'/>">Home</a>
				</li>
				<li class="breadcrumb-item active">Home</li>
			</ol>
			<input type="text" name="gamename" size="10">
			<button class="btn btn-secondary" type="submit" value="Search"
				name="change">搜尋</button>
			<a class="btn btn-secondary" href="<c:url value='/mall/Addshop'/>">我的購物車</a>
			<br> <br>

			<button class="btn btn-warning" type="submit" value="Search"
				name="allgame">全部</button>

			<button class="btn btn-warning" type="submit" value="Search"
				name="switchgame">Switch</button>
			<button class="btn btn-warning" type="submit" value="Search"
				name="ps5game">Ps5</button>
			<button class="btn btn-warning" type="submit" value="Search"
				name="xboxgame">Xbox</button>
			<button class="btn btn-warning" type="submit" value="Search"
				name="webgame">Web</button>

			<hr>
	</form>


	<form action="<c:url value="/mall/todoadd"/>" method="get">


		<div class="row">
			<c:forEach var="row" items="${rs.rows}">
				<!-- 				 <div style="display:inline"> -->

				<div class="col-md-6 col-lg-4 mb-1">
					<div class="portfolio-item mx-auto" data-toggle="modal"
						data-target="#portfolioModal${row.no }">
						<div
							class="portfolio-item-caption d-flex align-items-center justify-content-center ">
							<div
								class="portfolio-item-caption-content text-center text-white">
								<i class="fas fa-plus fa-3x"></i>
							</div>
						</div>
						<img class="img-fluid"
							src="${pageContext.request.contextPath }/${row.origin}"
							style="width: 380; height: 250;" alt="" />
						<center>
							<span>${row.name}</span>
						</center>
					</div>
				</div>





				<div class="portfolio-modal modal fade"
					id="portfolioModal${row.no }" tabindex="-1" role="dialog"
					aria-labelledby="portfolioModal1Label" aria-hidden="true">
					<div class="modal-dialog modal-xl" role="document">
						<div class="modal-content">

							<div class="modal-body text-center">
								<div class="container">
									<div class="row justify-content-center">
										<div class="col-lg-8">
											<h2
												class="portfolio-modal-title text-secondary text-uppercase mb-0"
												id="portfolioModal1Label">${row.name}</h2>
											<div class="divider-custom">
												<div class="divider-custom-line"></div>

												<div class="divider-custom-line"></div>
											</div>
											<img class="img-fluid rounded mb-5"
												src="${pageContext.request.contextPath }/${row.origin}"
												style="float:left;" alt="" />
											<p class="mb-5">
											<table>
												<thead>
													<tr>
														<th class="td_1">名稱</th>
														<th>${row.name}</th>

													</tr>

													<tr>
														<td class="td_1">簡介</td>
														<td>${row.item}</td>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td class="td_1">類型</td>
														<td>${row.type}</td>
													</tr>
													<tr>
														<td class="td_1">平台</td>
														<td>${row.host}</td>
													</tr>
													<tr>
														<td class="td_1">分類</td>
														<td>${row.level}</td>
													</tr>
													<tr>
														<td class="td_1">價錢</td>
														<td style="color: red;">${row.money}</td>
													</tr>

													<tr>
														<td class="td_1">評分</td>
														<td>${row.contentment}</td>
													</tr>
												</tbody>
											</table>
											</p>
											<button class="btn btn-danger" type="submit" name="todo"
												value="${row.no}">加到購物車</button>

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
	<%@ include file="../Foot.jsp"%>
</body>
</html>
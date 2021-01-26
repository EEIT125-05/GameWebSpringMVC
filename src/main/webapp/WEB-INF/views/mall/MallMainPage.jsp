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
<body >
	<%@ include file="../Header.jsp"%>

	<form action="<c:url value="/mall/minipage"/>" method="get">
		<!-- <h2>遊戲商城</h2> -->

		<hr>



		<div class="container " >
			<div class="systemLOGO"><img src="${pageContext.request.contextPath}/images/mallLOGO.png" class="systemIMG"></div>

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


		<div class="row" style="background-color:#ffffff">
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

				</button></P>
				
				</div>
			
			</div>

			</c:forEach>
</div>
		</div>
		</div>
	</form>
	<%@ include file="../Foot.jsp"%>
</body>
</html>
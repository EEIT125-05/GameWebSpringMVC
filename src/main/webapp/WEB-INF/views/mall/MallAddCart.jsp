<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../Link.jsp"%>
<sql:setDataSource var="ds"
	driver="com.microsoft.sqlserver.jdbc.SQLServerDriver"
	url="jdbc:sqlserver://localhost:1433;DatabaseName=GameSpringMVCDB"
	user="sa" password="sa123456" />

<sql:query sql="select * from MalllistTable where no= '${todo }'"
	var="rs" dataSource="${ds}" />

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel=stylesheet type="text/css" href="css/LeftMall.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>商成</title>
<style>
</style>
</head>
<body>
	<%@ include file="../Header.jsp"%>
	<center>
		
		<form action="<c:url value="/mall/todo"/>" method="get">
			<c:forEach var="row" items="${rs.rows}">
				<div>



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
							<tr>
								<td class="td_1"></td>
								<td><img
									src="${pageContext.request.contextPath }/${row.origin}"
									alt="路徑失聯" style="width: 600px; height: 400px;"></td>
							</tr>
							<tr>
								<td class="td_1"></td>
								<td><input type="text" name="qty">
						<button class="btn btn-warning"" type="submit" name="todo" value="${todo}">購買數量</button>
					
						
			<a class="btn btn-secondary" href="<c:url value='/mall/Addshop'/>">我的購物車</a>
						
						
						</td>
							</tr>
						</tbody>
					</table>
					<div>
					</div>
				</div>
			</c:forEach>
		</form>
	</center>
	<%@ include file="../Foot.jsp"%>
</body>
</html>
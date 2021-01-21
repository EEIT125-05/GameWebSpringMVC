<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%@ include file="../Link.jsp" %>
<sql:setDataSource var="ds"
	driver="com.microsoft.sqlserver.jdbc.SQLServerDriver"
	url="jdbc:sqlserver://localhost:1433;DatabaseName=GameSpringMVCDB"
	user="sa" password="sa123456" />
<sql:query sql="select * from BusinessHistoryTable bh,BusinessDetailTable bd,MalllistTable mt WHERE bh.sAccount like '%${user.sAccount}%'and bd.fk_cartid=bh.iNO and mt.name=bd.sCartName order by fk_cartid " var="rs" dataSource="${ds}" />
    
    
    
    
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="BIG5">
<title>訂單查詢</title>
<style>
table, th , td  {
  border: 1px solid grey;
  border-collapse: collapse;
  padding: 5px;
}
table tr:nth-child(odd) {
  background-color: #f1f1f1;
}
table tr:nth-child(even) {
  background-color: #ffffff;
}
</style>
</head>
<body>
<%@ include file="../Header.jsp" %>
<div class="container ">
  <h1 class="mt-4 mb-3">商城
      <small>訂單查詢</small>
    </h1>

    <ol class="breadcrumb">
      <li class="breadcrumb-item">
        <a href="<c:url value='/'/>">Home</a>
      </li>
      <li class="breadcrumb-item active">DL</li>
    </ol>
    
    <table border="0.5">
			<th>訂單編號</th>
			<th>會員</th>
			<th>商品</th>
			<th>數量</th>	
			<th>價錢</th>
			<th>總額</th>	
			<th>訂單時間</th>
<!-- 			<th>訂單總額</th> -->
			<c:forEach var="row" items="${rs.rows}">
				<tr>
					<td>${row.fk_cartid}</td>
					<td>${row.sAccount}</td>
					<td>${row.sCartName}</td>
					<td>${row.iQty}</td>
					<td>${row.money}</td>
					<td>${row.money*row.iQty}</td>
					
					<td>${row.tTime}</td>
<%-- 					<td>${row.fMoney}</td> --%>
					
				</tr>
				
			</c:forEach>
			
			
			
    
    
    
    </table>
</div>
<%@ include file="../Foot.jsp" %>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../Link.jsp" %>

<%// request.getSession(true).setAttribute("account", "admin1234"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>管理頁面</title>
</head>
<body>
<%@ include file="../Header.jsp" %>

<h2>管理</h2>



<c:choose>
<c:when test="${empty MemberSupport}">
	查無資料<br>
</c:when>
<c:when test="${not empty MemberSupport }">

  <table border="1" >
  	<tr>
    <th>編號</th>
    <th>遊戲名稱</th>
    <th>數量</th> 
    <th>商品位置</th> 
    <th>運送方式</th> 
    <th>主機平台</th> 
    <th>是否含特典</th> 
    <th>備註</th> 
    <th>商品狀況</th> 
    <th>刪除</th>
    <th>修改</th>
    </tr>

<c:forEach var='m' varStatus='vs' items='${MemberSupport }'>

    	<tr>
    <td>${vs.count}</td>
    <td>${m.gamename}</td>
    <td>${m.qty}</td>
    <td>${m.gamelocation}</td>
    <td>${m.delivery}</td>
    <td>${m.console}</td>
    <td>${m.dlc}</td>
    <td>${m.remark}</td>
    <td>${m.condition}</td>
    <td><a href="<c:url value="/exchange/delete?deleteindex=${m.no}"/>">刪除</a></td>
    <td><a href="<c:url value="/exchange/update?updateindex=${vs.index}"/>">修改</a></td>
    	</tr>

</c:forEach>
</c:when>
</c:choose>

</table>
  
  	<form action="<c:url value="/exchange/Index"/>" method="get">
	<input type="submit" value="返回主頁"  name="" >
	</form>
	
<%@ include file="../Foot.jsp" %>
</body>
</html>
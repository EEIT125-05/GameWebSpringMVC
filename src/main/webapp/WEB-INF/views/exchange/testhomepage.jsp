<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form method='get' action='<c:url value="/exchange/preparehomepage"/>' >
<input type="text" name="searchparams" value="${ searchparams}"> 
<input type="submit" > 
<label><input type="radio" name="search" value="gamename" checked>遊戲名稱</label>
<label><input type="radio" name="search" value="area">地區</label>
	${params }
	${search }
	${param }
	<c:forEach var='g' items='${list }'>
						<div id="exdivout">
							<div id="exdivin">
								<img id="eximg" src="${pageContext.request.contextPath }/${g.image }" alt="路徑失聯">
							</div>
							<ul id="expgul">
								<li>遊戲名稱:${g.gamename}</li>
								<li>遊戲數量:${g.qty}</li>
								<li>遊戲所在地:${g.gamelocation}</li>
								<li>運送方式:${g.delivery}</li>
								<li>主機平台:${g.console}</li>
								<li>玩家名稱:${g.gamer}</li>
								<li>是否含特點:${g.dlc}</li>
								<li>備註:${g.remark}</li>
							</ul>
						</div>
				</c:forEach>
<a href="<c:url value="/exchange/changepage?page=1&search=${search }"/>">1</a>
<a href="<c:url value="/exchange/changepage?page=2&search=${search }"/>">2</a>
<a href="<c:url value="/exchange/changepage?page=3&search=${search }"/>">3</a>
<a href="<c:url value="/exchange/changepage?page=4&search=${search }"/>">4</a>
<script>
window.onload=function(){
	var divout = dou
}
</script>
</form>
</body>
</html>
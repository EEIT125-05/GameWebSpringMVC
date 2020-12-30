<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../Link.jsp"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form method='get' action='<c:url value="/exchange/preparehomepage"/>'>
		<input type="text" name="searchparams" value="${ searchparams}">
		<input type="submit">

		<c:choose>
			<c:when test="${search =='area'}">
				<label><input type="radio" name="search" value="gamename">遊戲名稱</label>
				<label><input type="radio" name="search" value="area"
					checked>地區</label>
			</c:when>
			<c:otherwise>
				<label><input type="radio" name="search" value="gamename"
					checked>遊戲名稱</label>
				<label><input type="radio" name="search" value="area">地區</label>
			</c:otherwise>
		</c:choose>

		<input type="hidden" id="search" value="${search}">
		<!-- 藏參數 -->

		<div id="bigdiv">
			<c:forEach var='g' items='${list }'>
				<div id="exdivout">
					<div id="exdivin">
						<img id="eximg"
							src="${pageContext.request.contextPath }/${g.image }" alt="路徑失聯">
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
		</div>
		
		<c:if test="${p > 1}">
			<c:forEach var="num" begin="1" end="${p }" step="1">
				<a class="page">${num}</a>
			</c:forEach>
		</c:if>
		
	</form>
	<script>
		window.onload = function() {
			var pages = document.querySelectorAll(".page");
			var divout = document.getElementById("bigdiv")
			var search = document.getElementById("search").value
			var searchDOM = document.getElementById("search")
			var xhr = new XMLHttpRequest();

			for (i = 0; i < pages.length; i++) {
				pages[i].onclick = changepage
			}

			function changepage() {
				let i = (this.innerText)
				console.log(i)
				xhr.open('GET', '<c:url value="/exchange/changepage" />'
						+ '?page=' + i + '&search=' + search, true);
				xhr.send();
				xhr.onreadystatechange = function() {
					console.log("xhr.readyState" + xhr.readyState)
					if (xhr.readyState === 4 && xhr.status === 200) {
						var g = JSON.parse(xhr.responseText)
						console.log("!")
						divout.innerHTML = "";

						for (var i = 0; i < g.list.length; i++) {
							console.log("!!")
							divout.innerHTML += "<div id='exdivout'><div id='exdivin'><img id='eximg' src='${pageContext.request.contextPath }/"+g.list[i].image+"' alt='路徑失聯'></div><ul id='expgul'>"
									+ "<li>遊戲名稱:"
									+ g.list[i].gamename
									+ "</li>"
									+ "<li>遊戲數量:"
									+ g.list[i].qty
									+ "</li>"
									+ "<li>遊戲所在地:"
									+ g.list[i].gamelocation
									+ "</li>"
									+ "<li>運送方式:"
									+ g.list[i].delivery
									+ "</li>"
									+ "<li>主機平台:"
									+ g.list[i].console
									+ "</li>"
									+ "<li>玩家名稱:"
									+ g.list[i].gamer
									+ "</li>"
									+ "<li>是否含特點:"
									+ g.list[i].dlc
									+ "</li>"
									+ "<li>備註:"
									+ g.list[i].remark
									+ "</li>"
									+ "</ul></div>"
						}
						divout.innerHTML += "<input type='hidden' id='search' value='"+g.searchparams+"'> "
					}
				}
			}
		}
	</script>
</body>
</html>
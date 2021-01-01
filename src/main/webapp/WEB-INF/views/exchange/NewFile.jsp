<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<title>Insert title here</title>
</head>
<body>
${changehistorybean.no }
${changehistorybean.partyA.sAccount }
${changehistorybean.gamebean.gamename }
${changehistorybean.partyB.sAccount }
${changehistorybean.demandgamebean.gamename }
${HistotyList }
<c:choose>
				<c:when test='${empty HistotyList}'>
			查無資料<br>
				</c:when>

				<c:when test="${not empty HistotyList}">
				<c:forEach var='s' varStatus='vs' items='${HistotyList }'>
				${s.no }
				${s.partyA.sAccount }
				${s.gamebean.gamename }
				${s.partyB.sAccount }
				${s.demandgamebean.gamename }
				</c:forEach>
				</c:when>

</c:choose>


</body>
</html>
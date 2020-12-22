<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix='form' uri="http://www.springframework.org/tags/form" %>
<%@ include file="../Link.jsp" %>
<% 
response.setContentType("text/html;charset=UTF-8");
request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>確認更新</title>
</head>
<body>
<%@ include file="../Header.jsp" %>

 <form:form action="/exchange/InsertSupportGame" method="get" modelAttribute="gamebean"/>
        <div>
        	 <form:input id="gamename" class="fixedlen" type="text" path="gamename"  style="background-color: grey;"/>
            <label for="gamename">遊戲名稱</label>
            ${gamebean.gamename }
        </div>
        <div>
            <label for="qty">數量</label>
            ${gamebean.qty }
        </div>
        <div>
            <label for="gamelocation">商品位置</label>
           ${gamebean.gamelocation }
        </div>
        <div>
            <label for="delivery">取貨方式</label>
            ${gamebean.delivery }
        </div>
        <div>
            <label for="console">平台</label>
            ${gamebean.console }
        </div>
        <div>
            <label for="gamer">玩家名稱</label>
           ${gamebean.gamer }
        </div>
        <div>
            <label for="dlc">是否含特典</label>
            ${gamebean.dlc }
        </div>
        <div>
            <label for="remark">備註</label>
            ${gamebean.remark }
        </div>
        <div>
            <label for="condition">商品狀況</label>
            ${gamebean.condition }
        </div>
        <div>
        <input type="submit" value="送出"  >
    </div>
    </form>      
    
<%@ include file="../Foot.jsp" %>
</body>
</html>
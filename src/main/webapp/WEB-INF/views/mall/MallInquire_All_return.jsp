
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../Link.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% 
response.setContentType("text/html;charset=UTF-8");
response.setHeader("Cache-Control","no-cache"); // HTTP 1.1
response.setHeader("Pragma","no-cache"); // HTTP 1.0
response.setDateHeader ("Expires", -1); // Prevents caching at the proxy server
%><html>

<head>
    <link rel=stylesheet type="text/css" href="css/LeftMall.css">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>Insert title here</title>
</head>

<body>
<%@ include file="../Header.jsp" %>

<!--     <form action=".\RegisterServlet" method="post"> -->
    <form action="<c:url value="/mall/update3"/>" method="get">
       <img src="images/全部查詢.png" alt="">
       <td><input type="submit" name="all" id="all" value="繼續" /></td>
             
    </form>
<%@ include file="../Foot.jsp" %>
</body>

</html>
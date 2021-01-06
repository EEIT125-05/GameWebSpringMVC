<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../Link.jsp" %>
<!DOCTYPE html>
<html>

<head>
  <link rel=stylesheet type="text/css" href="css/LeftMall.css">
    <meta charset="UTF-8">
    <title>商品資料刪除</title>
    
    
</head>

<body>
<%@ include file="../Header.jsp" %>
<div class="container">

<h1 class="mt-4 mb-3">商品
      <small>刪除</small>
    </h1>

    <ol class="breadcrumb">
      <li class="breadcrumb-item">
        <a href="<c:url value='/'/>">Home</a>
      </li>
      <li class="breadcrumb-item active">商品刪除</li>
    </ol>

  
    <form action="<c:url value="/mall/delete"/>" method="get">
        <div >
            <table cellspacing="2" cellpadding="1" border="1" width="100%">

                <tr>
                    <th style="font-family:Microsoft JhengHei;">請輸入需要刪除之商品編號:</th>
                    <td><input type="text" name="no" size="10" maxlength="10"></td>
                </tr>

            </table>
        </div>
        <center>
            <input type="submit" name="strike" value="送出">
            <a class="InquireDelete" href="MallInquire.jsp" >查詢</a></div>
        </center>
    </form>
    </div>
<%@ include file="../Foot.jsp" %>
</body>

</html>
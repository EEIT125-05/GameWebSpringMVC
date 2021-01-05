<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ include file="../Link.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>GameBar</title>
</head>
<body>
<%@ include file="../Header.jsp" %>
<div class="container">
    <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel" style="height:300px;">
      <ol class="carousel-indicators">
        <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
      </ol>
      <div class="carousel-inner" role="listbox" style="height:300px">
       
        <div class="carousel-item active" style="background-image: url('https://content.shopback.com/tw/wp-content/uploads/2020/04/10142030/Cover-nintendo-web.jpg');height:300px">
          <div class="carousel-caption d-none d-md-block">
            <h3></h3>
         
          </div>
        </div>
       
        <div class="carousel-item" style="background-image: url('https://static02-proxy.hket.com/res/v3/image/content/2605000/2607364/MARIO_1024.png')">
          <div class="carousel-caption d-none d-md-block">
            <h3></h3>
         
          </div>
        </div>
     
        <div class="carousel-item" style="background-image: url('https://uc.udn.com.tw/photo/2020/11/05/0/9020971.jpg')">
          <div class="carousel-caption d-none d-md-block">
            <h3></h3>
            <p></p>
          </div>
        </div>
      </div>
      <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
      </a>
      <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="sr-only">Next</span>

      </a>
    </div>
  	<br>
	<form action="<c:url value='/forum/Index'/>" method="post">
  		<button type="submit" class="btn btn-primary" name="sCategory" value="">全部</button>
  		<button type="submit" class="btn btn-primary" name="sCategory" value="閒聊">閒聊</button>
  		<button type="submit" class="btn btn-primary" name="sCategory" value="公告">公告</button>
  		<button type="submit" class="btn btn-primary" name="sCategory" value="討論">討論</button>
  		<button type="submit" class="btn btn-primary" name="sCategory" value="問題">問題</button>
  		<button type="submit" class="btn btn-primary" name="sCategory" value="情報">情報</button>
  		<button type="submit" class="btn btn-primary" name="sCategory" value="攻略">攻略</button>
		
		<div class="input-group" style="margin-top:15px">
			<h3> 搜尋其他文章:&nbsp;</h3>
			<input type="text" id="sSearch" class="form-control" name="sSearch">
			<span class="input-group-append">
				<button type="submit" class="btn btn-secondary">搜尋</button>
			</span>
		</div>
	</form>
	<hr>
<h3>貼文資料確認</h3>

<form action="<c:url value='/forum/Confrim'/>" method="post">

	<p>分類: ${fForumBean.sCategory} 標題: ${fForumBean.sTitle}</p>

	<p>內文: </p>
	<div>${fForumBean.sText}</div>
	<hr>
	<input class="btn btn-primary" type="submit" name="confirm" value="確認${sForumConfirm}"/>

</form>

</div>>
<%@ include file="../Foot.jsp" %>
</body>
</html>
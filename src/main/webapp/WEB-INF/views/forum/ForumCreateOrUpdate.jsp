<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ include file="../Link.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>GameBar</title>
<style>
.error{
	color:red;
}
.dark-matter {
	margin-left:0;
	margin-right:0;
	max-width: none; 
}

.dark-matter select {
	width:10%
}
</style>
<script src="<c:url value='/js/ForumCreate.js'/>"></script>
</head>
<body>
<%@ include file="../Header.jsp" %>

<%-- <c:set var="ForumConfirm" value="create" scope="session"/> --%>
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
<h3>${sForumConfirm}貼文</h3>

<form:form class="dark-matter" method="POST" modelAttribute="fForumBean">
	<div>
		<label>分類: </label>
		<form:select id="sCategory" path="sCategory">
			<form:option value="閒聊">閒聊</form:option>
			<form:option value="公告">公告</form:option>
			<form:option value="討論">討論</form:option>
			<form:option value="問題">問題</form:option>
			<form:option value="情報">情報</form:option>
			<form:option value="攻略">攻略</form:option>
		</form:select>
		<label>標題: </label>
		<form:input type="text" id="sTitle" path="sTitle" size="83"/>
		<label id="titleError" class="error"></label>
		<form:errors path="sTitle" class="error"/> 
	</div>
	<div>
		<label>內文: </label>
		<form:textarea id="sText" path="sText" cols="100" rows="15"/>
		<br><label id="textError" class="error"></label>
		<br><form:errors path="sText" class="error"/> 
	</div>
	<div>
		<input type="submit" id="submitForm" name="sForumConfirm" value="${sForumConfirm}"/>
	</div>
</form:form>
</div>>
<%@ include file="../Foot.jsp" %>

<script src="<c:url value='/ckeditor/ckeditor.js'/>"></script>
<script>CKEDITOR.replace("sText");</script>

</body>
</html>
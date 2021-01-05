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
    margin-left: auto;  
    margin-right: auto;  
    max-width: 500px; 
    background: #555;
    padding: 20px 30px 20px 30px;
    font: 12px "Helvetica Neue", Helvetica, Arial, sans-serif;
    color: #D3D3D3;
    text-shadow: 1px 1px 1px #444;
    border: none;
    border-radius: 5px;
    -webkit-border-radius: 5px;
    -moz-border-radius: 5px;
}

.dark-matter h1 {
    padding: 0px 0px 10px 40px;
    display: block;
    border-bottom: 1px solid #444;
    margin: -10px -30px 30px -30px;
}

.dark-matter h1>span {
    display: block;
    font-size: 11px;
}

.dark-matter label {
     display: block; 
    margin: 0px 0px 5px;
}

.dark-matter label>span {
    float: left;
    width: 20%;
    text-align: right;
    padding-right: 10px;
    margin-top: 10px;
    font-weight: bold;
}

.dark-matter input[type="text"],
.dark-matter input[type="email"],
.dark-matter textarea,
.dark-matter select {
    border: none;
    color: #525252;
    height: 25px;
    line-height: 15px;
    margin-bottom: 16px;
    margin-right: 6px;
    margin-top: 2px;
    outline: 0 none;
    padding: 5px 0px 5px 5px;
    width: 70%;
    border-radius: 2px;
    -webkit-border-radius: 2px;
    -moz-border-radius: 2px;
    -moz-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
    background: #DFDFDF;
}

.dark-matter select {
    background: #DFDFDF url('down-arrow.png') no-repeat right;
    background: #DFDFDF url('down-arrow.png') no-repeat right;
    appearance: none;
    -webkit-appearance: none;
    -moz-appearance: none;
    text-indent: 0.01px;
    text-overflow: '';
    width: 70%;
    height: 35px;
    color: #525252;
    line-height: 25px;
}

.dark-matter textarea {
    height: 100px;
    padding: 5px 0px 0px 5px;
    width: 70%;
}

.dark-matter .button {
    background: #FFCC02;
    border: none;
    padding: 10px 25px 10px 25px;
    color: #585858;
    border-radius: 4px;
    -moz-border-radius: 4px;
    -webkit-border-radius: 4px;
    text-shadow: 1px 1px 1px #FFE477;
    font-weight: bold;
    box-shadow: 1px 1px 1px #3D3D3D;
    -webkit-box-shadow: 1px 1px 1px #3D3D3D;
    -moz-box-shadow: 1px 1px 1px #3D3D3D;
}

.dark-matter .button:hover {
    color: #333;
    background-color: #EBEBEB;
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
	<form>
  
		<a class="btn btn-primary category categoryChoose">全部</a>
		<a class="btn btn-primary category">閒聊</a>
		<a class="btn btn-primary category">公告</a>
		<a class="btn btn-primary category">討論</a>
		<a class="btn btn-primary category">問題</a>
		<a class="btn btn-primary category">情報</a>
		<a class="btn btn-primary category">攻略</a>
		
		<div class="input-group" style="margin-top:15px">
			<h3> 標題:&nbsp;</h3>
			<input type="text" id="sSearch" class="form-control" name="sSearch">
			<span class="input-group-append">
				<input type="button" id="submit" class="btn btn-secondary"
					 name="select" value="搜尋">
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
		<form:textarea id="sText" path="sText" cols="100" rows="15" placeholder="請在這裡填寫內容"/>
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
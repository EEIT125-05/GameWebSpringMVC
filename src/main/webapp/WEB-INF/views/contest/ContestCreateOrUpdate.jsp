<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ include file="../Link.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>賽事 - GameBar</title>
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
	width:20%
}

.dark-matter input[type="date"]{
 	width:30%; 
}

</style>
<script src="<c:url value='/js/ContestCreate.js'/>"></script>

</head>
<body>
<%@ include file="../Header.jsp" %>
	

<div class="container">

<h1 class="mt-4 mb-3">${sContestConfirm}比賽
<!--       <small>XXXXX</small> -->
    </h1>

    <ol class="breadcrumb">
      <li class="breadcrumb-item">
        <a href="<c:url value='/'/>">Home</a>
      </li>
      <li class="breadcrumb-item active">賽事</li>
    </ol>
	
		<form:form class="dark-matter" method="POST" modelAttribute="cContestBean" enctype="multipart/form-data">
			<div>
            <label for="sName">比賽名稱: </label> 
            <form:input type="text" id="sName" path="sName"/>
            <form:errors path="sName" class="error"/>
            <label class="error"></label>
        </div>
        <div>
            <label>比賽項目: </label>
            <form:select id="" path="sGame">
            	<form:options items="${lGameList}"/>
            </form:select>
            <form:errors path="sGame"/>
            <label></label>
        </div>
        <div>
        	<c:set var="sSignStart" value="${cContestBean.dSignStart}"/>
        	<c:set var="sSignEnd" value="${cContestBean.dSignEnd}"/>
        	<fmt:formatDate var="sTime0" value="${cContestBean.tTime}" pattern="yyyy-MM-dd HH:mm"/>
        	<c:set var="sTime" value="${fn:replace(sTime0, ' ', 'T')}" />
        	
	        <c:if test="${cContestBean.dSignStart == '1000-01-01'}">
	        	<c:set var="sSignStart" value=""/>
	        </c:if>
	        <c:if test="${cContestBean.dSignEnd == '1000-01-01'}">
	        	<c:set var="sSignEnd" value=""/>
	        </c:if>
	        <c:if test="${sTime == '1970-01-01T00:00'}">
	        	<c:set var="sTime" value=""/>
	        </c:if>

            <label>報名日期: </label> 
            <jsp:useBean id="date" class="java.util.Date"></jsp:useBean>
            <fmt:formatDate var="today" value="${date}" pattern="yyyy-MM-dd"/>
             <c:choose>
            	<c:when test="${sContestConfirm == '更新' && originSignStart <= today}">
		            <input type="date" id="sSignStart" name="sSignStart" value="${sSignStart}" readonly/> <label>~</label>
		            <input type="hidden" name="afterSignStart" value="true"/>
            	</c:when>
            	<c:otherwise>
		            <input type="date" id="sSignStart" name="sSignStart" value="${sSignStart}"/><label>~</label>
            	</c:otherwise>
            </c:choose>
            <c:choose>
            	<c:when test="${sContestConfirm == '更新' && originSignEnd <= today}">
		            <input type="date" id="sSignEnd" name="sSignEnd" value="${sSignEnd}" readonly/>
		            <input type="hidden" name="afterSignEnd" value="true"/>
            	</c:when>
            	<c:otherwise>
		            <input type="date" id="sSignEnd" name="sSignEnd" value="${sSignEnd}"/>
            	</c:otherwise>
            </c:choose>
            <form:errors path="dSignStart" class="error"/>
            <label class="error"></label>
        </div>
        <div>
            <label>比賽時間: </label> 
            <input type="datetime-local" id="sTime" name="sTime" value="${sTime}"/>
            <form:errors path="tTime" class="error"/>
            <label class="error"></label>
        </div>
        <div>
            <label for="sLocation">比賽地點: </label> <form:input type="text" id="sLocation" path="sLocation"/>
            <form:errors path="sLocation" class="error"/>
            <label class="error"></label>
        </div>
        <div>
            <label for="iPeople">人數限制: </label> <form:input type="number" min="2" max="100"
                 id="iPeople" path="iPeople"/>
                 <form:errors path="iPeople" class="error"/>
            <label class="error"></label>
        </div>
        <div>
            <label>宣傳圖片: </label>
            <form:input type="file" id="fImage" path="fImage" accept="image/*"/>
            <form:errors path="fImage" class="error"/>
            <label class="error"></label>
        </div>
        <div>
            <label style="width:70px" id="previewLabel"></label>
            <img id="imagePreview">
        </div>
        <div>
            <label for="sRule" style="vertical-align:top">比賽規則: </label>
            <form:textarea id="sRule" path="sRule" rows="10" cols="40"/><br>
            <form:errors path="sRule" class="error"/>
            <label class="error"></label>
        </div>
        <div>
            <input type="submit" id="submit"  name="sContestConfirm" value="${sContestConfirm}"/>
        </div>
		</form:form>
		
    
</div>
<%@ include file="../Foot.jsp" %>

<script src="<c:url value='/ckeditor/ckeditor.js'/>"></script>
<script>
	CKEDITOR.replace("sRule");

	$(function(){
		
		console.log("file: " + $("#fImage").val());
		
		$("#imagePreview").hide();
		$("#previewLabel").hide();
		
		$("#fImage").on("change",function(){
			console.log("file: " + $("#fImage").val());
            let fileReader = new FileReader();
            let imageFile = this.files[0];
            
            if(typeof(imageFile) == "object"){
	            fileReader.readAsDataURL(imageFile);
            }else{
	            $("#imagePreview").hide();
	    		$("#previewLabel").hide();
            }
            
            fileReader.onload = function(e) {
            	$("#previewLabel").show();
            	$("#imagePreview").show();
            	$("#imagePreview").attr('src',e.target.result)
            						.attr('style',"width:560px;margin-bottom:10px");
            }

		});
		
		
		
		
		
		
	});
	

</script>
</body>
</html>
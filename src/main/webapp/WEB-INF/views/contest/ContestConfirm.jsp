<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="../Link.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>賽事 - GameBar</title>
<style>
.example{ 
	background-color:rgba(0,0,0,0.8);
 	position:fixed; 
} 

</style>
</head>
<body>
<%@ include file="../Header.jsp" %>

<div class="example" style="display:none">
    <div class="sk-chase"  style="position:fixed; top:50%; left:50%;">
      <div class="sk-chase-dot"></div>
      <div class="sk-chase-dot"></div>
      <div class="sk-chase-dot"></div>
      <div class="sk-chase-dot"></div>
      <div class="sk-chase-dot"></div>
      <div class="sk-chase-dot"></div>
    </div>
  </div>


<div class="container">

<h1 class="mt-4 mb-3">比賽資料確認
<!--       <small>XXXXX</small> -->
    </h1>

    <ol class="breadcrumb">
      <li class="breadcrumb-item">
        <a href="<c:url value='/'/>">Home</a>
      </li>
      <li class="breadcrumb-item active">賽事</li>
    </ol>
    
		<p>比賽名稱: ${cContestBean.sName}</p>
		<p>比賽遊戲: ${cContestBean.sGame}</p>
		
		<c:choose>
    		<c:when test="${cContestBean.iTeamMemberCount == 1}">
    			<c:set var="iTeamMemberCount" value="個人"/>
    		</c:when>
    		<c:otherwise>
    			<c:set var="iTeamMemberCount" value="團體"/>
    		</c:otherwise>
    	</c:choose>
		<c:if test="${cContestBean.sRematchMode == 'knockout'}">
   			<c:set var="sRematchMode" value="淘汰賽"/>
    	</c:if>
    	<c:if test="${cContestBean.sRematchMode == 'ground'}">
   			<c:set var="sRematchMode" value="循環賽"/>
    	</c:if>
    	<c:if test="${cContestBean.sRematchMode == 'free'}">
   			<c:set var="sRematchMode" value="自由對戰"/>
    	</c:if>
    	<c:choose>
    		<c:when test="${cContestBean.sPreliminary == 'none'}">
    			<c:set var="sPreliminary" value="無預賽"/>
    		</c:when>
    		<c:otherwise>
    			<c:set var="sPreliminary" value="有預賽"/>
    		</c:otherwise>
    	</c:choose>
    	
		<p>賽制: ${iTeamMemberCount}-${sRematchMode}-${sPreliminary}</p>
		
		
		
		<p>報名時間: ${cContestBean.dSignStart}~${cContestBean.dSignEnd}</p>
		<fmt:formatDate var="sTime" value="${cContestBean.tTime}" pattern="yyyy-MM-dd HH:mm"/>
		<p>比賽時間: ${sTime} </p>
		<p>比賽地點: ${cContestBean.sLocation}</p>
		<p>參加人數: ${cContestBean.iPeople}</p>
		<c:choose>
			<c:when	test="${cContestBean.sImage == 'contestDefault.jpg'}">
				<label style="vertical-align:top">宣傳圖片(預設): </label>
			</c:when>
			<c:otherwise>
				<label style="vertical-align:top">宣傳圖片: </label>
			</c:otherwise>
		</c:choose>
		<img src="<c:url value='/contest/ConfirmImage'/>" style="width:560px"/>
		<br>
		<span>比賽規則:</span><br><span id="rule">${cContestBean.sRule}</span>
		<br>
		<hr>
			<c:if test="${sContestConfirm == '報名' }">
				<p>遊戲ID: ${pParticipateBean.sGameId}</p>
				<hr>
			</c:if>
			<input class="btn btn-outline-dark" type="submit" id="confirm" name="confirm" value="確認${sContestConfirm}"/>

</div>
<%@ include file="../Foot.jsp" %>


<script>
	$("#rule").on("click","a",function(){
		this.target = "_blank";
	});
	
	
	$("#confirm").on("click",function(){
		
		$.ajax({
			type: "post",
			url: "<c:url value='/contest/Confirm'/>",
			dataType: "json",
			data:{},
			beforeSend:function(){
				$(".example").show()
			},
			complete:function(){
				$(".example").hide()
			},
			success: function(result){
				if(result.status == "success"){
					Swal.fire({
							  title: result.successMessage + "!",
							  icon: "success",
							  showClass: {
								    popup: 'animate__animated animate__fadeInDown'
								  },
							  hideClass: {
								    popup: 'animate__animated animate__fadeOutUp'
								  }
					}).then(function(){
								window.setTimeout(function(){$(location).attr("href", "<c:url value='/contest/Index'/>");},500);
							})
				}else if(result.status == "sqlError"){
					Swal.fire({
							  title: '資料庫發生錯誤!',
							  text: '請聯繫管理員',
							  icon: 'error',
							  showClass: {
								    popup: 'animate__animated animate__fadeInDown'
								  },
							  hideClass: {
								    popup: 'animate__animated animate__fadeOutUp'
								  }
					})
				}
						
			},
			error: function(XMLHttpRequest, textStatus, errorThrown){
				Swal.fire({
					  title: '網頁發生錯誤!',
					  text: '請聯繫管理員',
					  icon: 'error',
					  showClass: {
						    popup: 'animate__animated animate__fadeInDown'
						  },
					  hideClass: {
						    popup: 'animate__animated animate__fadeOutUp'
						  }
				});
			}
			
		});
	});
	
	
</script>

</body>
</html>
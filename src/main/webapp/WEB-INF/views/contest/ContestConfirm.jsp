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
	label{
		margin:0
	}
</style>
</head>
<body>
<%@ include file="../Header.jsp" %>

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
    	
    	<p><label>比賽名稱: </label><label>${cContestBean.sName}</label></p>
    	<p><label>比賽遊戲: </label><label>${cContestBean.sGame}</label></p>
    	<p><label style="width:67.47px;text-align:right">隊伍數: </label><label>${cContestBean.iPeople}</label></p>
    	
    	<c:choose>
    		<c:when test="${cContestBean.iTeamMemberCount == 1}">
    			<p><label>隊伍組成: </label><label>個人賽</label></p>
    		</c:when>
    		<c:otherwise>
    			<p><label>隊伍組成: </label><label>團體賽，每隊${cContestBean.iTeamMemberCount}人</label></p>
    		</c:otherwise>
    	</c:choose>
    	
    	<c:choose>
    		<c:when test="${cContestBean.sPreliminary == 'none'}">
    			<p><label style="width:67.47px;text-align:right">預賽: </label><label>無預賽</label></p>
    		</c:when>
    		<c:otherwise>
    			<p><label style="width:67.47px;text-align:right">預賽: </label><label>有預賽，${cContestBean.sPreliminary}</label></p>
    		</c:otherwise>
    	</c:choose>
    	
    	<c:if test="${cContestBean.sRematchMode == 'knockout'}">
    		<p><label>比賽形式: </label><label>淘汰賽</label></p>
    	</c:if>
    	<c:if test="${cContestBean.sRematchMode == 'ground'}">
    		<p><label>比賽形式: </label><label>循環賽</label></p>
    	</c:if>
    	<c:if test="${cContestBean.sRematchMode == 'free'}">
    		<p><label>比賽形式: </label><label>自由對戰</label></p>
    	</c:if>
    	
    	<p><label>報名時間: </label><label> ${cContestBean.dSignStart}~${cContestBean.dSignEnd}</label></p>
		<fmt:formatDate var="sTime" value="${cContestBean.tTime}" pattern="yyyy-MM-dd HH:mm"/>
    	<p><label>比賽時間: </label><label>${sTime}</label></p>
    	<p><label>比賽地點: </label><label>${cContestBean.sLocation}</label></p>
    	
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
		<input class="btn btn-primary" type="submit" id="confirm" name="confirm" value="確認${sContestConfirm}"/>

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
								window.setTimeout(function(){$(location).attr("href", "<c:url value='/contest/Information?contestNo=" + result.contestNo + "'/>");},500);
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
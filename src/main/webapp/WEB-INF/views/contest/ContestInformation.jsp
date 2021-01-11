<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ include file="../Link.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${cContestBean.sName}</title>
<style>
.itemChoose{
	background-color:#0069d9;
}

.item{
	margin-top:10px
}

</style>
</head>
<body>
<%@ include file="../Header.jsp"%>

<div class="container">

	<h1 class="mt-4 mb-3">
<!-- 		比賽詳細資料  -->
<!-- 		<small>XXXXX</small> -->
	</h1>

<!-- 	<ol class="breadcrumb"> -->
<%-- 		<li class="breadcrumb-item"><a href="<c:url value='/'/>">Home</a> --%>
<!-- 		</li> -->
<!-- 		<li class="breadcrumb-item active">賽事</li> -->
<!-- 		<li class="breadcrumb-item active">詳細資料</li> -->
<!-- 	</ol> -->

		<img src="<c:url value='/contest/ImageLoading?iNo=${cContestBean.iNo}'/>" alt="" style="width:560px">
		<div >
			<label class="btn btn-primary item itemChoose">總覽</label>
			<label class="btn btn-primary item">參賽者</label>
			<label class="btn btn-primary item">賽程</label>
			<label class="btn btn-primary item">排名</label>
			<c:set var="joinStatus" value="true"/>
			<c:forEach var="participate" items="${cContestBean.lParticipateBeans}">
				<c:if test="${participate.sPlayer == user.sAccount}">
					<c:set var="joinStatus" value="false"/>
				</c:if>
			</c:forEach>
			<jsp:useBean id="nowDate" class="java.util.Date"/>
			<fmt:formatDate var="today" pattern="yyyy-MM-dd" value="${nowDate}" />
			<c:choose>
				<c:when test="${joinStatus == 'false'}">
					<button class="btn btn-success joinItem" disabled>已報名</button>
				</c:when>
				<c:otherwise>
					<c:choose>
					<c:when test="${cContestBean.dSignStart > today}">
						<button class="btn btn-success joinItem" disabled>未開始報名</button>
					</c:when>
					<c:otherwise>
						<c:choose>
							<c:when test="${cContestBean.dSignEnd < today}">
								<button class="btn btn-success joinItem" disabled>報名已截止</button>
							</c:when>
							<c:otherwise>
								<c:choose>
									<c:when
										test="${fn:length(cContestBean.lParticipateBeans) == cContestBean.iPeople}">
										<button class="btn btn-success joinItem" disabled>報名人數已滿</button>
									</c:when>
									<c:otherwise>
										<button class="btn btn-success joinItem">報名</button>
									</c:otherwise>
								</c:choose>
							</c:otherwise>
						</c:choose>
					</c:otherwise>
					</c:choose>
				</c:otherwise>
			</c:choose>
		</div>
		
		<div id="總覽" class="hiddenDiv">
		<p>比賽名稱: ${cContestBean.sName}</p>
		<p>比賽遊戲: ${cContestBean.sGame}</p>
		<p>主辦者: ${cContestBean.sHost}</p>
		<p>報名日期: ${cContestBean.dSignStart} ~ ${cContestBean.dSignEnd}</p>
		<fmt:formatDate var="sTime" value="${cContestBean.tTime}" pattern="yyyy-MM-dd HH:mm"/>
		<p>比賽時間: ${sTime}</p>
		<p>比賽地點: ${cContestBean.sLocation}</p>
		<p>參加人數:
			${fn:length(cContestBean.lParticipateBeans)}/${cContestBean.iPeople}</p>
		<span>比賽規則:</span> 
		<br> 
		<span id="rule">${cContestBean.sRule}</span>
		</div>

</div>
<%@ include file="../Foot.jsp"%>

<script>
	$(function(){
		$("#rule").on("click","a",function(){
			this.target = "_blank";
		});
		
		$("#join").on("click", function(){
			return confirmJoin();
		});

		function confirmJoin(){
		  var result = confirm("確認參加?");
		  if (result) {
		      return true;
		  }
		  return false;
		}
		
		$(".item").on("click",function(){
			$(".item").removeClass("itemChoose");
			$(this).addClass("itemChoose");
			$(".joinItem").css("background", "#28a745");
			$(".hiddenDiv").css("display","none");
			$("#" + $(this).text()).css("display","block");
		});
		
		$(".joinItem").on("click",function(){
			$(".item").removeClass("itemChoose");
			$(this).css("background", "#218838");
			
			(async () => {
				const { value: accept } = await Swal.fire({
				  title: "報名比賽",
				  input: "checkbox",
				  inputValue: 1,
				  inputPlaceholder: "我同意遵守比賽規則",
				  confirmButtonText: "報名&nbsp;<i class=\"fa fa-arrow-right\"></i>",
				  inputValidator: (result) => {
				    return !result && "您必須勾選才能報名"
				  },
				  showClass: {
					    popup: 'animate__animated animate__fadeInDown'
				  }
				})

				if (accept) {
					$.ajax({
						type: "post",
						url: "<c:url value='/contest/Join'/>",
						dataType: "json",
						data:{},
						success: function(result){
							if(result.status == "success"){
								Swal.fire({
									  title: "報名完成",
				 					  icon: "success",
				 					  hideClass: {
				 						    popup: 'animate__animated animate__fadeOutUp'
				 					  }
							  	})
							}else if(result.status == "sqlError"){
								Swal.fire({
									  title: '資料庫發生錯誤!',
									  text: '請聯繫管理員',
									  icon: 'error',
									  hideClass: {
										    popup: 'animate__animated animate__fadeOutUp'
										  }
								})
							}
						},
						error: function(err){
							Swal.fire({
								  title: '網頁發生錯誤!',
								  text: '請聯繫管理員',
								  icon: 'error',
								  hideClass: {
									    popup: 'animate__animated animate__fadeOutUp'
									  }
						})
						}
					});
					
					
				  
				}
				})()
		});
		
	
	
	});
</script>

</body>
</html>
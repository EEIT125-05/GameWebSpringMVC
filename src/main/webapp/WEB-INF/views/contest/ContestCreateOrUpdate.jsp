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
<script src="<c:url value='/ckeditor/ckeditor.js'/>"></script>
<script src="<c:url value='/js/ContestCreate.js'/>"></script>

</head>
<body>
<%@ include file="../Header.jsp" %>
	

<div class="container">

<h1 class="mt-4 mb-3">
<%-- ${sContestConfirm}比賽 --%>
<!--       <small>XXXXX</small> -->
    </h1>

    <ol class="breadcrumb">
      <li class="breadcrumb-item">
        <a href="<c:url value='/'/>">Home</a>
      </li>
      <li class="breadcrumb-item active"><a href="<c:url value='/contest/Index'/>">賽事</a></li>
		<li class="breadcrumb-item active">新增比賽<span style="color:red">*所有選項都必填</span></li>
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
            <form:select id="sGame" path="sGame">
            	<form:options items="${lGameList}"/>
            </form:select>
            <form:errors path="sGame"/>
            <label></label>
        </div>
        <div>
            <label style="width:82.14px;text-align:right" for="iPeople">隊伍數: </label> <form:input type="number" min="2" max="100"
                 id="iPeople" path="iPeople"/>
                 <form:errors path="iPeople" class="error"/>
            <label class="error"></label>
        </div>
        <div>
            <label>隊伍組成: </label>
            <c:choose>
            	<c:when test="${cContestBean.iTeamMemberCount == 1 || empty cContestBean.iTeamMemberCount}">
            		<label><input type="radio" name="sTeamMode" id="individual" value="individual" checked/>單人</label>
            		<label><input type="radio" name="sTeamMode" id="group" value="group"/>團體</label>
					<label id="teamCountSelect" style="margin:0"></label>
					<input type="hidden" id="iTeamMemberCount" name="iTeamMemberCount" value="1">
            	</c:when>
            	<c:otherwise>
		            <label><input type="radio" name="sTeamMode" id="individual" value="individual"/>單人</label>
		            <label><input type="radio" name="sTeamMode" id="group" value="group" checked/>團體</label>
					<label id="teamCountSelect" style="margin:0">
						<input type="number" min="2" max="100" id="teamMemberCount" style="width:60px;margin:0" value="${cContestBean.iTeamMemberCount}">人一組
					</label>
					<input type="hidden" id="iTeamMemberCount" name="iTeamMemberCount" value="${cContestBean.iTeamMemberCount}">
            	</c:otherwise>
            </c:choose>
        </div>
        <div>
            <label style="width:82.14px;text-align:right">預賽: </label>
            
             <c:choose>
            	<c:when test="${cContestBean.sPreliminary == 'none' || empty cContestBean.sPreliminary}">
		            <label><input type="radio" name="preliminaries" id="Npreliminaries" value="false" checked/>無預賽</label>
		            <label><input type="radio" name="preliminaries" id="Ypreliminaries" value="true"/>有預賽</label>
		            <label id="preliminariesCountSelect" style="margin:0"></label>
		            <input type="hidden" id="sPreliminary" name="sPreliminary" value="none">
            	</c:when>
            	<c:otherwise>
            		<c:set var="preliminaryString" value="${cContestBean.sPreliminary}"/>
            		<c:set var="preliminary1" value="${fn:substring(preliminaryString, 0, 1)}"/>
            		<c:set var="preliminary2" value="${fn:substring(preliminaryString, 2, 3)}"/>
            		<c:set var="preliminary3" value="${fn:substring(preliminaryString, 6, -1)}"/>
		            <label><input type="radio" name="preliminaries" id="Npreliminaries" value="false"/>無預賽</label>
		            <label><input type="radio" name="preliminaries" id="Ypreliminaries" value="true" checked/>有預賽</label>
		            <label id="preliminariesCountSelect" style="margin:0"></label>
		            <input type="hidden" id="sPreliminary" name="sPreliminary" value="${preliminary1}取${preliminary2}剩餘取${preliminary3}">
            	</c:otherwise>
            </c:choose>
            
        </div>
        <div>
            <label>比賽形式: </label>
            <form:radiobutton path="sRematchMode" id="knockout" value="knockout" label="淘汰賽"/>
            <form:radiobutton path="sRematchMode" id="ground" value="ground" label="循環賽"/>
            <form:radiobutton path="sRematchMode" id="free" value="free" label="自由對戰"/>
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
            <input type="submit" id="submit" class="button" name="sContestConfirm" value="${sContestConfirm}"/>
            <input type="button" id="oneKey" class="button" value="一鍵輸入"/>
        </div>
		</form:form>
		
    
</div>
<%@ include file="../Foot.jsp" %>

<script>
// 	CKEDITOR.replace("sRule");

	$(function(){
		
		if($("#iPeople").val() != ""){
			$("preliminariesCountSelect")
		}
		
		
		
		
		if($("#ground:checked").length > 0){
			$("#ground").attr("checked", "true");
		}else if($("#free:checked").length > 0){
			$("#free").attr("checked", "true");
		}else{
			$("#knockout").attr("checked", "true");
		}
		
		
		
		$("#group").on("focus",function(){
			if($("#iPeople").val() == ""){
				$("#teamCountSelect").html("<label style=\"color:red\">請先選擇隊伍數");
				$("#iTeamMemberCount").val("1");
			}else{
	        	$("#teamCountSelect").html("<input type=\"number\" min=\"2\" max=\"100\" id=\"teamMemberCount\" style=\"width:60px;margin:0\" value=\"2\">人一組");
				$("#iTeamMemberCount").val($("#teamMemberCount").val());
			}
// 			console.log("人數 " + $("#iTeamMemberCount").val())
		});
		
		$(document).on("change", "#teamMemberCount", function(){
			$("#iTeamMemberCount").val($("#teamMemberCount").val());
// 			console.log("人數 " + $("#iTeamMemberCount").val())
		});
		
		$("#individual").on("focus",function(){
			$("#teamCountSelect").empty();
			if($("#Ypreliminaries:checked").length > 0){
				if($("#iPeople").val() == ""){
					$("#preliminariesCountSelect").html("<label style=\"color:red\">請先選擇隊伍數");
				}else{
					$("#preliminariesCountSelect").empty();
					preliminariesCount();
				}
			}
			$("#iTeamMemberCount").val("1");
// 			console.log("人數 " + $("#iTeamMemberCount").val())
		});
		
		$("#iPeople").on("change", function(){
			console.log("change")
			if($("#Ypreliminaries:checked").length > 0){
				$("#preliminariesCountSelect").empty();
				preliminariesCount();
			}

		});
		
		$("#Ypreliminaries").on("focus", function(){
			if($("#Ypreliminaries:checked").length == 0){
				if($("#iPeople").val() == ""){
					$("#preliminariesCountSelect").append("<label style=\"color:red\">請先選擇隊伍數");
				}else{
					preliminariesCount();
				}
			}
		});
		
		$("#Npreliminaries").on("focus",function(){
			$("#preliminariesCountSelect").empty();
			$("#sPreliminary").val("none");
// 			console.log("字串 " + $("#sPreliminary").val());
		});
		
		$(document).on("change", "#preliminariesCount1", function(){
			$("#preliminariesCount2").empty();
			for(let i=1; i<=$(this).val(); i++){
				$("#preliminariesCount2").append("<option value=" + i + ">" + i + "</option>")
			}
			let iPlayer = $("#iPeople").val();
			if(iPlayer % $("#preliminariesCount1").val() != 0){
				$("#preliminariesCount3").empty();
				for(let i=1; i<=iPlayer - $("#preliminariesCount1").val()*Math.floor(iPlayer/$("#preliminariesCount1").val()); i++){
					$("#preliminariesCount3").append("<option value=" + i + ">" + i);
				}
			}else{
				$("#preliminariesCount3").empty().append("<option value=0>0");
			}
			
	    });
		
		function preliminariesCount(){
		    let iPlayer = $("#iPeople").val();
	        $("#preliminariesCountSelect").append("<select id=\"preliminariesCount1\" style=\"margin:0;width:50px\"></select>");
			for(let i=2; i<=iPlayer; i++) {
				$("#preliminariesCount1").append("<option value=" + i + ">" + i);
			}
			$("#preliminariesCountSelect").append("取<select id=\"preliminariesCount2\" style=\"margin:0;width:50px\"><option value=\"1\">1</option><option value=\"2\">2</option></select>剩餘取<select id=\"preliminariesCount3\" style=\"margin:0;;width:30px\"><option value=\"0\">0</option></select>");
			$("#sPreliminary").val($("#preliminariesCount1").val() + "取" + $("#preliminariesCount2").val() + "剩餘取" + $("#preliminariesCount3").val());
// 			console.log("字串 " + $("#sPreliminary").val());
		}
		
		$(document).on("change", "#preliminariesCount1,#preliminariesCount2,#preliminariesCount3", function(){
			$("#sPreliminary").val($("#preliminariesCount1").val() + "取" + $("#preliminariesCount2").val() + "剩餘取" + $("#preliminariesCount3").val());
// 			console.log("字串 " + $("#sPreliminary").val());
		})
		
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
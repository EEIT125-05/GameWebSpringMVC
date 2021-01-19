<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix='form' uri="http://www.springframework.org/tags/form"%>
<%@ include file="../Link.jsp"%>



<!DOCTYPE html>
<html>
<HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=UTF-8" />
<TITLE>我的遊戲</TITLE>
<style>
.com{
    max-width:1000px; 
}
legend {
	font-size: 30px;
}

fieldset {
	padding-top: 10px;
	padding-left: 20px;
	margin: auto;
	width: 800px;
	border-color: transparent;
	border-radius: 15px;
	margin: 20px;
}

#fixedlen {
	width: 300px;
}

div {
	margin-bottom: 5px;
}
</style>
</HEAD>
<BODY>
	<%@ include file="../Header.jsp"%>
<br>
	<form:form method="post" id="submitForm" modelAttribute="mygamebean" class="dark-matter com">
		<fieldset>
			<legend>新增我的遊戲庫</legend>
			<div>

				<label for="console">平台 </label>
				<form:select path="console" style="width: 260px;" class="fixedlen"
					id="console1">
					<form:option value="-1" label="請選擇平台" />
					<form:options items="${sessionScope.initOption.ConsoleList }" />
				</form:select>

				<span id="console1span"></span>
			</div>
			<div>

				<label for="gamename">遊戲名稱</label>
				<form:select path="gamename" style="width: 260px;" class="fixedlen"
					id="gamename">
					<form:option value="-1">請選擇遊戲</form:option>
					<form:options items="${sessionScope.initOption.GamenameList }" />
				</form:select>
				<span id="gamenamespan"></span>

			</div>
			<div>
				<label for="gamer">玩家名稱</label>
				<form:input id="gamer" class="fixedlen"
					style="background-color:gary" type="text" path="gamer" />
			</div>
			
			<div style="margin-top: 20px;">
				<button type="button"  class="button" name="submit" id="submitButton" onclick="checkSubmit();" disabled>送出</button>
				<button type="reset" class="button">清除</button>
			</div>
		</fieldset>
	</form:form>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10.13.0/dist/sweetalert2.all.min.js"></script>
	<script>
	
	function checkSubmit(){
		swal.fire("${action}成功",
				  "",
				  "success")
				  .then(function(){
					 $('#submitForm').submit()
					  console.log("success")
				  })
	}
	
	$("#gamer").attr("readonly", true);
	
// 	if(${noGames != null}){
// 		alert("您必須先新增遊戲至您的遊戲庫，才有辦法提出交換申請");
// 	}	
	
	
	$("#console1").on("blur", function() {
		flag1 = false
		if ($("#console1 :selected").text() == "") {
			$("#console1span").html("<span>必填</span>")
		} else if ($("#console1 :selected").text() == "請選擇平台") {
			$("#console1span").html("<span>必填</span>")
		} else {
			$("#console1span").html("")
			flag1 = true;
		}
		checkall();
	})

	$("#gamename").on("blur", function() {
		flag2 = false
		if ($("#gamename :selected").text() == "") {
			$("#gamenamespan").html("<span>必填</span>")
		} else if ($("#gamename :selected").text() == "請選擇遊戲") {
			$("#gamenamespan").html("<span>必填</span>")
		} else {
			$("#gamenamespan").html("")
			flag2 = true;
		}
		checkall();
	})
	

		function checkall() {
			if (flag1 && flag2 ) {

				$("#submitButton").attr("disabled", false);
			} else {
				$("#submitButton").attr("disabled", true);
			}
		}
	</script>

	<%@ include file="../Foot.jsp"%>
</BODY>
</html>
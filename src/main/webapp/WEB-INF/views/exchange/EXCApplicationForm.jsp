<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix='form' uri="http://www.springframework.org/tags/form"%>
<%@ include file="../Link.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>交換申請書</title>
</head>
<body>

<form method="post" action="<c:url value="/exchange/applyFor"/>">
		<fieldset>
			<legend></legend>
			<div>
<!-- 				禁止更改 -->
				<label for="partyA">甲方 </label>
				<input type="text" name="partyA" value="${partyA.sAccount }" style="width: 260px;" class="fixedlen"
					id="partyA" />

<!-- 				<span id="console1span"></span> -->
			</div>
			<div>

				<label for="gamename">欲換遊戲 </label>
				<input type="text" name="supportGame" value="${supportGame.gamename }" style="width: 260px;" class="fixedlen"
					id="Supportgamebean" />
					
<!-- 				<span id="gamenamespan"></span> -->

			</div>
			<div>

				<label for="partyB">乙方 </label>
				<input type="text" name="partyB" value="${partyB.sAccount }" style="width: 260px;" class="fixedlen"
					id="partyB" />
<!-- 				<span id="qtyspan"></span> -->

			</div>
			<div>

				<label for="gamename">提供遊戲</label>
          <select style="width: 260px;" class="fixedlen"  name="myGame" id="myGame" >
          <option >我的遊戲庫</option>
          <c:forEach var="row" items="${myGameBeans}">
          <option>${row}</option>
          </c:forEach>
          </select>
          <span id="gamenamespan"></span>

			</div>
			
			<div>
				<input type="submit" value="送出" id="submit" disabled>
				<input type="reset" value="清除">
			</div>

</fieldset>
</form>
<script>
$("#partyA").attr("readonly","true");
$("#partyB").attr("readonly","true");
$("#Supportgamebean").attr("readonly","true");
$("#myGame").on("blur", function() {
	console.log("!!!!")
	if ($("#myGame :selected").text() == "") {
		$("#gamenamespan").html("<span>必填</span>")
	} else if ($("#myGame :selected").text() == "我的遊戲庫") {
		$("#gamenamespan").html("<span>必填</span>")
	} else {
		$("#gamenamespan").html("")
		$("#submit").attr("disabled", false);
	}
})

</script>
</body>
</html>
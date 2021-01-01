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

<form:form method="post" modelAttribute="gamebean">
		<fieldset>
			<legend></legend>
			<div>
<!-- 				禁止更改 -->
				<label for="partyA">甲方 </label>
				<form:input type="text" path="partyA" style="width: 260px;" class="fixedlen"
					id="partyA" />

<!-- 				<span id="console1span"></span> -->
			</div>
			<div>

				<label for="gamename">甲方遊戲 </label>
				<form:input type="text" path="gamename" style="width: 260px;" class="fixedlen"
					id="gamename" />
					
<!-- 				<span id="gamenamespan"></span> -->

			</div>
			<div>

				<label for="partyB">乙方 </label>
				<form:input type="text" path="partyB" style="width: 260px;" class="fixedlen"
					id="partyB" />
<!-- 				<span id="qtyspan"></span> -->

			</div>
			<div>

				<label for="gamename">乙方遊戲 </label>
				<form:select path="gamelocation" style="width: 260px;"
					class="fixedlen" id="gamelocation">
					<form:option value="-1">我的遊戲庫</form:option>
					<form:options items="${sessionScope.initOption.AreaList }" />
				</form:select>
					
<!-- 				<span id="conditionspan"></span> -->

			</div>
			
			<div>
				<input type="submit" value="送出" id="submit">
				<input type="reset" value="清除">
			</div>

</fieldset>
</form:form>

</body>
</html>
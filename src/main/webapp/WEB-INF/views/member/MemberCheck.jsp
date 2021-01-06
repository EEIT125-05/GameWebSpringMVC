<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../Link.jsp"%>
<%
	request.setCharacterEncoding("UTF-8");
response.setContentType("text/html;charset=UTF-8");
response.setContentType("text/html;charset=UTF-8");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", -1);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>註冊資料確認</title>
</head>

<body>
	<%@ include file="../Header.jsp"%>

	<h2 align='center'>註冊資料如下請確認</h2>
	<hr>
	<form action="<c:url value='/member/MemberThanks'/>" method="post"
		enctype="multipart/form-data">
		<div align='center'>
			<div align='left'
				style="border: 3px solid gray; width: 650; height: 550">
				<h3>
					設定的帳號:${param.sAccount}<input type="hidden" name="sAccount"
						value='${param.sAccount}' />
				</h3>
				<h3>
					使用的信箱:${param.sEmail}<input type="hidden" name="sEmail"
						value='${param.sEmail}' />
				</h3>
				<h3>
					電話/手機號碼:${param.sPhone}<input type="hidden" name="sPhone"
						value='${param.sPhone}' />
				</h3>
				<h3>
					設定的密碼:${param.sPassword}<input type="hidden" name="sPassword"
						value='${param.sPassword}' />
				</h3>
				<h3>
					使用的暱稱:${param.sNickname}<input type="hidden" name="sNickname"
						value='${param.sNickname}' />
				</h3>
				<h3>
					真實姓名:${param.sEname}<input type="hidden" name="sEname"
						value='${param.sEname}' />
				</h3>
				<h3>
					居住城市:${param.sAddress}<input type="hidden" name="sAddress"
						value='${param.sAddress}' />
				</h3>
				<h3>
					性別:${param.sGender}<input type="hidden" name="sGender"
						value='${param.sGender}' />
				</h3>
				<h3>
					生日年月日:${param.sBirthday}<input type="hidden" name="sBirthday"
						value='${param.sBirthday}' />
				</h3>
				<h3>
					請選擇上傳照片:<input type="file" name="productImage" required />
				</h3>
				<%-- 			<h3><img type="hidden" name="image" value='${param.image}'/></h3> --%>
				<input type="hidden" name="registerDate"
					value='${param.registerDate}'> <input type="hidden"
					name="status">
				<h3 align='center'>
					<button type="submit" name="confirm" value="註冊"
						style='width: 350; height: 50; font-size: 30; margin-top: 15;'>註冊</button>
				</h3>
			</div>
		</div>
	</form>

	<%@ include file="../Foot.jsp"%>
</body>
</html>
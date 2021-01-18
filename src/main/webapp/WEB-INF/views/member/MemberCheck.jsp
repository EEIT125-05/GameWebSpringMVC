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
<style>
input {
	border-radius: 10px;
}

#DIV2 {
	background-color: #272727;
	color: white;
	width: 850px;
	line-height: 50px;
	margin-left: 200;
	padding: 20px;
	border: 5px gray solid;
}

.b {
	background-color: #272727;
	color: white;
	font-size: 30;
	font-weight: 900;
}

.b:hover {
	color: #00FFFF;
}

button {
	background-color: white;
	color: black;
	font-weight: 900;
}

button:hover {
	background-color: #00FFFF;
	color: black;
	font-weight: 900;
}
</style>
</head>

<body>
	<%@ include file="../Header.jsp"%>

	<h2 align='center'>註冊資料如下請確認</h2>
	<hr>
	<form action="<c:url value='/member/MemberThanks'/>" method="post"
		enctype="multipart/form-data">
		<div align='center'>
			<div id="DIV2" style='margin-bottom: 30;'>
				<table>
					<tr class="b">
						<td>註冊設定的帳號</td>
						<td>:${param.sAccount}<input type="hidden" name="sAccount"
							value='${param.sAccount}' /></td>
					</tr>
					<tr class="b">
						<td>註冊使用的信箱</td>
						<td>:${param.sEmail}<input type="hidden" name="sEmail"
							value='${param.sEmail}' /></td>
					</tr>
					<tr class="b">
						<td>註冊的手機號碼</td>
						<td>:${param.sPhone}<input type="hidden" name="sPhone"
							value='${param.sPhone}' /></td>
					</tr>
					<tr class="b">
						<td>註冊使用的密碼</td>
						<td>:${param.sPassword}<input type="hidden" name="sPassword"
							value='${param.sPassword}' /></td>
					</tr>
					<tr class="b">
						<td>註冊使用的暱稱</td>
						<td>:${param.sNickname}<input type="hidden" name="sNickname"
							value='${param.sNickname}' /></td>
					</tr>
					<tr class="b">
						<td>註冊的真實姓名</td>
						<td>:${param.sEname}<input type="hidden" name="sEname"
							value='${param.sEname}' /></td>
					</tr>
					<tr class="b">
						<td>註冊的居住城市</td>
						<td>:${param.sAddress}<input type="hidden" name="sAddress"
							value='${param.sAddress}' /></td>
					</tr>
					<tr class="b">
						<td>註冊的性別</td>
						<td>:${param.sGender}<input type="hidden" name="sGender"
							value='${param.sGender}' /></td>
					</tr>
					<tr class="b">
						<td>註冊的生日</td>
						<td>:${param.sBirthday}<input type="hidden" name="sBirthday"
							value='${param.sBirthday}' /></td>
					</tr>
					<tr class="b">
						<td>請選擇上傳照片</td>
						<td>:<input type="file" name="productImage" /></td>
					</tr>
				</table>
				<!-- 				<h3> -->
				<%-- 					已選擇的照片:${param.productImage}<img style="width: 250; height: 175;" --%>
				<%-- 						src='${param.productImage}' /> <input type="hidden" --%>
				<!-- 						name="productImage" /> -->
				<!-- 				</h3> -->
				<%-- 			<h3><img type="hidden" name="image" value='${param.image}'/></h3> --%>
				<input type="hidden" name="registerDate"
					value='${param.registerDate}'> <input type="hidden"
					name="status">
				<h3 align='center'>
					<button type="submit" name="confirm" value="註冊"
						style='width: 250; height: 50; font-size: 30; margin-top: 15;'>
						<svg xmlns="http://www.w3.org/2000/svg" width="35" height="35"
							fill="currentColor" class="bi bi-person-check-fill"
							viewBox="0 0 16 16"> <path fill-rule="evenodd"
							d="M15.854 5.146a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708 0l-1.5-1.5a.5.5 0 0 1 .708-.708L12.5 7.793l2.646-2.647a.5.5 0 0 1 .708 0z" />
						<path
							d="M1 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H1zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z" />
						</svg>
						確認資料送出
					</button>
					<a href="<c:url value='/member/Login'/>"><button type="button"
							style='width: 250; height: 50; font-size: 30; margin-top: 15;'>
							<svg xmlns="http://www.w3.org/2000/svg" width="35" height="35"
								fill="currentColor" class="bi bi-backspace-fill"
								viewBox="0 0 16 16"> <path
								d="M15.683 3a2 2 0 0 0-2-2h-7.08a2 2 0 0 0-1.519.698L.241 7.35a1 1 0 0 0 0 1.302l4.843 5.65A2 2 0 0 0 6.603 15h7.08a2 2 0 0 0 2-2V3zM5.829 5.854a.5.5 0 1 1 .707-.708l2.147 2.147 2.146-2.147a.5.5 0 1 1 .707.708L9.39 8l2.146 2.146a.5.5 0 0 1-.707.708L8.683 8.707l-2.147 2.147a.5.5 0 0 1-.707-.708L7.976 8 5.829 5.854z" />
							</svg>
							回註冊頁面
						</button></a>
				</h3>
			</div>
		</div>
	</form>

	<%@ include file="../Foot.jsp"%>
</body>
</html>
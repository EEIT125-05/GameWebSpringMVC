<%@page import="com.web.game.member.model.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../Link.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	response.setContentType("text/html;charset=UTF-8");
response.setHeader("Cache-Control", "no-cache"); // HTTP 1.1
response.setHeader("Pragma", "no-cache"); // HTTP 1.0
response.setDateHeader("Expires", -1); // Prevents caching at the proxy server
%>


<head>
<meta charset="UTF-8">
<!-- <script src="sweetalert2.min.js"></script> -->
<!-- <link rel="stylesheet" href="bower_components/sweetalert2/dist/sweetalert2.min.css"> -->
<!-- <script src="../sweetalert2.all.min.js"></script> -->
<script
	src="https://cdn.jsdelivr.net/npm/sweetalert2@10.13.0/dist/sweetalert2.all.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/core-js/2.4.1/core.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<style>
input {
	border-radius: 10px;
}
</style>
<title>會員登入</title>

<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script type="text/javascript">
	let CLIENT_ID = "1008807704595-38ht6cjuqr4a111jlemo1iifp2son1s5.apps.googleusercontent.com";
	//let API_KEY = '';//Javascript SDK無須 API 金鑰
	// Array of API discovery doc URLs for APIs
	let DISCOVERY_DOCS = [ "https://www.googleapis.com/discovery/v1/apis/people/v1/rest" ];
</script>
<script async defer src="https://apis.google.com/js/api.js"
	onload="this.onload=function(){};GoogleClientInit()"
	onreadystatechange="if (this.readyState === 'complete') this.onload()">
	
</script>
<script type="text/javascript">
	//jQuery處理button click event 當畫面DOM都載入時....
	$(function() {
		$("#btnSignIn").on("click", function() {
			$("#content").html("");//清空顯示結果
			GoogleLogin();//Google 登入
		});
		$("#btnDisconnect").on("click", function() {
			Google_disconnect();//和Google App斷連
		});
		// 		$("#Signin").on("click", function(){
		// 			MemberSignin();
		// 		});
	});

	// 		function MemberSignin(){
	// 			swal("恭喜登入成功", "You clicked the button!", "success");
	// 		}

	function GoogleClientInit() {
		//官網範例寫client:auth2，但本人實測由於待會要呼叫gapi.client.init而不是gapi.auth2.init，所以給client即可
		gapi.load('client', function() {
			gapi.client.init({
				//client_id 和 scope 兩者參數必填
				clientId : CLIENT_ID,
				//scope列表參考：https://developers.google.com/people/api/rest/v1/people/get
				//"profile"是簡寫，要用完整scope名稱也可以
				scope : "profile",//"https://www.googleapis.com/auth/userinfo.profile",
				discoveryDocs : DISCOVERY_DOCS
			});

		});//end gapi.load
	}//end GoogleClientInit function

	function GoogleLogin() {
		let auth2 = gapi.auth2.getAuthInstance();//取得GoogleAuth物件
		auth2
				.signIn()
				.then(
						function(GoogleUser) {
							console.log("Google登入成功");
							let user_id = GoogleUser.getId();//取得user id，不過要發送至Server端的話，為了資安請使用id_token，本人另一篇文章有範例：https://dotblogs.com.tw/shadow/2019/01/31/113026
							console.log("user_id=" + user_id);
							let AuthResponse = GoogleUser.getAuthResponse(true);//true會回傳包含access token ，false則不會
							let id_token = AuthResponse.id_token;//取得id_token
							//people.get方法參考：https://developers.google.com/people/api/rest/v1/people/get
							gapi.client.people.people
									.get(
											{
												'resourceName' : 'people/me',
												//通常你會想要知道的用戶個資↓
												'personFields' : 'names,phoneNumbers,emailAddresses,addresses,residences,genders,birthdays,occupations',
											})
									.then(
											function(res) {

												//success
												let str = JSON
														.stringify(res.result);//將物件列化成string，方便顯示結果在畫面上
												//顯示授權你網站存取的用戶個資
												// 												document.getElementById('content').innerHTML = str;
												console
														.log("res="
																+ res.result.names[0].displayName);
												console
														.log("res="
																+ res.result.emailAddresses[0].value);
												//↑通常metadata標記primary:true的個資就是你該抓的資料
												var googleEname = res.result.names[0].displayName;
												var googleEmail = res.result.emailAddresses[0].value;
												var xhr = new XMLHttpRequest();
												xhr
														.open(
																"POST",
																"<c:url value='/member/GoogleSignin' />",
																true);
												xhr
														.setRequestHeader(
																"Content-Type",
																"application/x-www-form-urlencoded");
												xhr.send("googleEname="
														+ googleEname
														+ "&googleEmail="
														+ googleEmail);
												xhr.onreadystatechange = function() {
													if (xhr.readyState == 4
															&& xhr.status == 200) {
														console
																.log("登入成功xhr.readyState="
																		+ xhr.readyState);
														console
																.log("登入成功xhr.status="
																		+ xhr.status);
														Swal
																.fire(
																		'OK',
																		"恭喜登入成功",
																		'success')
																.then(
																		function() {
																			$(
																					'#Google')
																					.submit();
																		})
														return true;
													} else {
														console
																.log("登入失敗xhr.readyState="
																		+ xhr.readyState);
														console
																.log("登入失敗xhr.status="
																		+ xhr.status);
														Swal
																.fire(
																		'註冊失敗',
																		"已有重複信箱",
																		'error')
																.then(
																		function() {
																			$(
																					'#Google')
																					.submit();
																		})
														return false;
													}
												}

												// 												xhr.onreadystatechange = function() {
												// 													if (xhr.readyState == 4 && xhr.status == 200) {
												// 														console.log("xhr.status="+xhr.status);
												// 														console.log("xhr.readyState="+xhr.readyState);
												// 														alert(登入成功);
												// 													}else{
												// 														console.log("xhr.status="+xhr.status);
												// 														console.log("xhr.readyState="+xhr.readyState);
												// 														alert(登入失敗);
												// 													}

												// 													}
												//請再自行Parse JSON，可以將JSON字串丟到線上parse工具查看：http://json.parser.online.fr/

												//最終，取得用戶個資後看要填在畫面表單上或是透過Ajax儲存到資料庫(記得是傳id_token給你的Web Server而不是明碼的user_id喔)，本範例就不贅述，請自行努力XD

											});

						}, function(error) {
							console.log("Google登入失敗");
							console.log(error);
						});

	}//end function GoogleLogin

	function Google_disconnect() {
		let auth2 = gapi.auth2.getAuthInstance(); //取得GoogleAuth物件

		auth2.disconnect().then(function() {
			console.log('User disconnect.');
		});
	}

	function GoogleClientInit() {
		gapi
				.load(
						'client',
						function() {
							gapi.client
									.init({
										//client_id 和 scope 兩者參數必填
										clientId : CLIENT_ID,
										//scope參考：https://developers.google.com/people/api/rest/v1/people/get
										//"profile"可以取得用戶的names和Primary Email，↓這裡可以省略profile不用填
										scope : "https://www.googleapis.com/auth/user.addresses.read https://www.googleapis.com/auth/user.birthday.read https://www.googleapis.com/auth/user.phonenumbers.read",
										discoveryDocs : DISCOVERY_DOCS
									});

						});//end gapi.load
	}//end GoogleClientInit function
</script>

<script type="text/javascript">
	function changeimg() {
		var myimg = document.getElementById("code");
		now = new Date();
		myimg.src = "image.jsp?change" + now.getTime();
	}

	var code;
	function createCode() {

		var btn = document.getElementById("btn");
		var psw = document.getElementById("Password");
		btn.onclick = function() {
			if (psw.getAttribute('type') == 'password') {
				psw.setAttribute('type', 'text');
				btn.value = "visibility_off";
			} else if (psw.getAttribute('type') == 'text') {
				psw.setAttribute('type', 'password');
				btn.value = "visibility";
			}
		}

		code = new Array();
		var codeLength = 5;
		var checkCode = document.getElementById("checkCode");
		checkCode.value = "";
		selectChar = new Array(2, 3, 4, 5, 6, 7, 8, 9, 'A', 'B', 'C', 'D', 'E',
				'F', 'G', 'H', 'J', 'K', 'L', 'M', 'N', 'P', 'Q', 'R', 'S',
				'T', 'U', 'V', 'W', 'X', 'Y', 'Z');
		for (var i = 0; i < codeLength; i++) {
			var charIndex = Math.floor(Math.random() * 32);
			code += selectChar[charIndex];
		}
		if (code.length != codeLength) {
			createCode();
		}
		checkCode.value = code;
	}

	function validate() {
		var inputCode = document.getElementById("input1").value.toUpperCase();
		var check = document.getElementById("check");
		if (inputCode.length <= 0) {
			check.innerHTML = "<font color='red'>請輸入驗證碼</font>";
			return false;
		} else if (inputCode != code) {
			check.innerHTML = "<font color='red'>驗證碼輸入錯誤</font>";
			createCode();
			return false;
		} else {
			check.innerHTML = "<font color='green'>驗證成功</font>";
			document.getElementById("submitSignin").disabled = false;
			return true;
		}
	}

	// 	function GameBarSubmit() {
	// 		console.log("????");
	// 		$('#GameBar').submit()
	// 	}
	function checkSubmit() {
		$('#submitSignin').submit()
	}
</script>

</head>
<body onLoad="createCode();">
	<h1 align='center'>登入GameBar會員</h1>
	<hr>
	<%@ include file="../Header.jsp"%>
	<div align='center' class="dark-matter com">
		<form action="<c:url value='/member/SignIn'/>" method="post"
			id="submitSignin">
			<h3 style='padding-top: 30px; padding-left: 30px;' align='left'>
				帳號:<input type="text" name="sAccount" minlength="6" maxlength="20"
					placeholder="請輸入帳號" required
					value="${requestScope.sAccount}${param.sAccount}">
			</h3>
			<h3 style='padding-top: 30px; padding-left: 30px;' align='left'>
				密碼:<input type="password" id="Password" name="sPassword"
					placeholder="請輸入密碼" minlength="8" maxlength="16" required
					value="${requestScope.password}${param.sPassword}"> <input
					id="btn" type="button" class="material-icons"
					style="font-size: 25px" value="visibility">
			</h3>
			<h6 style='color: red;'>${showError}</h6>
			<BR>
			<h4>
				<label style='padding-top: 10px; padding-right: 20px;'><input
					type="checkbox" name="rememberMe"
					<c:if test='${requestScope.rememberMe==true}'>
                  
                  checked='checked'
               </c:if>
					value="true">自動登入</label><a href="<c:url value='/member/Forget'/>">忘記密碼</a><br>
			</h4>
			<h4 style='padding-top: 10px;'>
				驗證碼:<input type="text" id="input1" style="width: 150px" /><input
					type="button" id="checkCode" class="code"
					style="width: 90px; margin: 0px 10px;" onClick="createCode()" />
				<!-- 						<input -->
				<!-- 						id="Button1" onClick="validate();" type="button" value="按這裡驗證" /> -->
				<br> <span id="check"></span>
			</h4>

			<button id="submitSignin" name="submit555" type="button"
				class="button"
				style='width: 350; height: 50; font-size: 30; margin-top: 15;'
				onclick="checkSubmit();">
				<svg xmlns="http://www.w3.org/2000/svg" width="40" height="40"
					fill="currentColor" class="bi bi-person-fill" viewBox="0 0 16 16">
				<path
					d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H3zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z" />
				</svg>
				會員登入
			</button>
		</form>
		<form action="<c:url value='/demo'/>" method="post"
			style="margin-top: 20px">
			<select name="demoAccount">
				<option value="aaa">廷亙</option>
				<option value="bbb">駿宏</option>
				<option value="Jack12345">昌孝1</option>
				<option value="bts520">昌孝2</option>
				<option value="Jack1234">嵩謙</option>
				<option value="henryxcccc">冠惟1</option>
				<option value="benchang">冠惟2</option>
			</select>
			<button type="submit">DEMO</button>
		</form>
		<div>
			<div>
				<form action="<c:url value='/member/GameBarGMSignin'/>"
					method="post" id="GameBar">
					<div style='padding-top: 10px;'>
						<button type="submit" class="button"
							style='width: 350; height: 50; font-size: 30; margin-top: 10;'>
							<!-- 							onclick="GameBarSubmit();" id="GameBar" -->

							<svg xmlns="http://www.w3.org/2000/svg" width="40" height="40"
								fill="currentColor" class="bi bi-person-fill"
								viewBox="0 0 16 16"> <path
								d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H3zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z" />
							</svg>
							管理者登入
						</button>
					</div>
				</form>
				<button type="button" id="btnSignIn" class="button"
					style='width: 350; height: 50; font-size: 30; margin-top: 10;'>
					<svg xmlns="http://www.w3.org/2000/svg" width="40" height="40"
						fill="currentColor" class="bi bi-person-fill" viewBox="0 0 16 16">
					<path
						d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H3zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z" />
					</svg>
					Google登入
				</button>
				<!-- 					<button type="button" id="btnDisconnect">斷連Google App</button> -->




			</div>
			<div id="content"></div>
		</div>

	</div>

	<form id="Google" action="<c:url value='/member/GameIndex'/>"></form>

	<%@ include file="../Foot.jsp"%>
</body>
</html>
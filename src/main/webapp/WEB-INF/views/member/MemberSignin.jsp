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
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<title>會員登入</title>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script type="text/javascript">
	let CLIENT_ID = "902560611308-r277psvbq0fmbljcbq59ckk3id22kfci.apps.googleusercontent.com";
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
	});

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
							console.log(`user_id:${user_id}`);
							let AuthResponse = GoogleUser.getAuthResponse(true);//true會回傳包含access token ，false則不會
							let id_token = AuthResponse.id_token;//取得id_token
							//people.get方法參考：https://developers.google.com/people/api/rest/v1/people/get
							gapi.client.people.people
									.get(
											{
												'resourceName' : 'people/me',
												'personFields' : 'names,phoneNumbers,emailAddresses,addresses,residences,genders,birthdays,occupations',
											})
									.then(
											function(res) {
												//通常你會想要知道的用戶個資↓
												//success
												let str = JSON
														.stringify(res.result);//將物件列化成string，方便顯示結果在畫面上
												//顯示授權你網站存取的用戶個資
												document
														.getElementById('content').innerHTML = str;
												//↑通常metadata標記primary:true的個資就是你該抓的資料

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
		if (inputCode.length <= 0) {
			alert("請輸入驗證碼!");
			return false;
		} else if (inputCode != code) {
			alert("驗證碼輸入錯誤!");
			createCode();
			return false;
		} else {
			alert("成功!");
			document.getElementById("Signin").disabled = false;
			return true;
		}
	}
</script>

</head>
<body onLoad="createCode();">
	<h1 align='center'>登入GameBar會員</h1>
	<hr>
	<%@ include file="../Header.jsp"%>
	<form action="<c:url value='/member/SignIn'/>" method="post">
		<div align='center'>
			<div align='center'
				style='border: 3px solid gray; width: 500; height: 500;'>
				<h3 style='padding-top: 30px;' align='left'>
					帳號:<input type="text" name="sAccount" minlength="6" maxlength="20"
						placeholder="請輸入帳號" required="required">
				</h3>
				<h6 style='color:red;'>${showError}</h6>
				<h3 style='padding-top: 30px;' align='left'>
					密碼:<input type="password" id="Password" name="sPassword"
						placeholder="請輸入密碼" minlength="8" maxlength="16" required>
					<input id="btn" type="button" class="material-icons"
						style="font-size: 25px" value="visibility">
				</h3>
				<h4>
					<label style='padding-top: 10px; padding-right: 20px;'><input
						type="checkbox" name="rememberMe" value="remeber">記住我的帳號密碼</label><a
						href="<c:url value='/member/Forget'/>">忘記密碼</a><br>
				</h4>
				<h4 style='padding-top: 10px;'>
					驗證碼:<input type="text" id="input1" style="width: 100px" /><input
						type="button" id="checkCode" class="code"
						style="width: 90px; margin: 0px 10px;" onClick="createCode()" /><input
						id="Button1" onClick="validate();" type="button" value="驗證" />
				</h4>

				<div id="content"></div>
				<button type="button" id="btnSignIn">Google登入</button>
				<button type="button" id="btnDisconnect">斷連Google App</button>
				<hr />


				<input id="Signin" name="Signin" type="submit" value="登入" disabled
					style='width: 350; height: 50; font-size: 30; margin-top: 15;'>

				<div style='padding-top: 10px;'>
					<a href="<c:url value='/member/GameBarGMSignin'/>"><input
						type="button" style='width: 350; height: 50; font-size: 30;'
						value="管理者登入"></a>
				</div>
			</div>
		</div>
	</form>
	<%@ include file="../Foot.jsp"%>
</body>
</html>

	let accountflag = false;
	let passwordflag = false;
	let nicknameflag = false;
	let nameflag = false;
	let addressflag = false;
	let emailflag = false;
	let phoneflag = false;

	
	function checkAccount() {
		let account = document.getElementById("Account").value;
		let accLen = account.length;
		let idaccount = document.getElementById("idaccount");
		let accError = false;
		if (account == "") {
			idaccount.innerHTML = "請輸入帳號";
			accountflag = false;
		}else if(account.indexOf(" ") != -1){
			idaccount.innerHTML = "不能輸入空白";
			accountflag = false;
		} else if (accLen >= 6) {
			for (let idaccount = 0; idaccount < accLen; idaccount++) {
				let ACCOUNT = account.charCodeAt(idaccount);
				if (ACCOUNT >= 0x4e00 && ACCOUNT <= 0x9fff) {
					accError = true;
					if (accError){
						break;						
					}
				}
			}
			if (accError) {
				idaccount.innerHTML = "不能輸入中文";
				accountflag = false;
			} else {
				 $.ajax({
			            type:"POST",
			            url:"./MemberCheckAccount",
			            dataType:"json",
			            data:{"userName":account},
			            success:function (result) {
			            	if(result.message == "OK"){
			            		idaccount.innerHTML = "OK";
			            		accountflag = true;
			            	}else{
			            		idaccount.innerHTML = "帳號已被使用";
			            		accountflag = false;
			            	}
			            },
			            error:function (err) {
			                alert("發生錯誤!");
			            }
			        });
				
			}
		} else {
			idaccount.innerHTML = "請輸入至少6個字元";
			accountflag = false;
		}
		check();
	}
	
	function checkPassword() {
		let password = document.getElementById("Password").value;
		let passLen = password.length;
		let idpassword = document.getElementById("idpassword");
		if (password == "") {
			idpassword.innerHTML = "請輸入密碼";
			passwordflag = false;
		} else if(password.indexOf(" ") != -1){
			idpassword.innerHTML = "不能輸入空白";
			passwordflag = false;
		} else if (passLen >= 8) {
			idpassword.innerHTML = "OK";
			passwordflag = true;
		} else {
			idpassword.innerHTML = "請輸入至少8個字元";
			passwordflag = false;
		}
		check();
	}

	function checkNickname() {
		let nickname = document.getElementById("Nickname").value;
		let idnickname = document.getElementById("idnickname");
		if (nickname == "") {
			idnickname.innerHTML = "請輸入暱稱";
			nicknameflag = false;
		} else {
			idnickname.innerHTML = "OK";
			nicknameflag = true;
		}
		check();
	}
	
	function checkEmail() {
		let email = document.getElementById("Email").value;
		let emailLen = email.length;
		let idemail = document.getElementById("idemail");
		if (email == "") {
			idemail.innerHTML = "請輸入信箱";
			emailflag = false;
		} else {
			idemail.innerHTML = "";
			emailflag = true;
		}
		check();
	}

	function checkName() {
		let ename = document.getElementById("Ename").value;
		let enameLen = ename.length;
		let idname = document.getElementById("idname");
		let nameCheck = false;
		if (ename == "") {
			idname.innerHTML = "請輸入姓名";
		} else if (enameLen >= 2) {
			for (let idname = 0; idname < enameLen; idname++) {
				let ENAME = ename.charAt(idname);
				if (ENAME.charCodeAt(idname) < 0x4E00
						|| ENAME.charCodeAt(idname) > 0x9FA5) {
					nameCheck = true;
					if (nameCheck)
						break;
				}
			}
			if (nameCheck) {
				idname.innerHTML = "請輸入中文";
				nameflag = false;
			} else {
				idname.innerHTML = "OK";
				nameflag = true;
			}
		} else {
			idname.innerHTML = "至少兩個字";
			nameflag = false;
		}
		check();
	}
	
	function checkPhone() {
		let phone = document.getElementById("Phone").value;
		let phoneLen = phone.length;
		let idphone = document.getElementById("idphone");
		let phoneCheck = false;
		let reg = /^[0]{1}[9]{1}\d{8}$/;
		if (phone == "") {
			idphone.innerHTML = "請輸入手機號碼";
			phoneflag = false;
		} else if (phoneLen >= 10) {
			if (reg.test(phone)) {
				phoneCheck = true;
			}
			if (phoneCheck) {
				idphone.innerHTML = "OK";
				phoneflag = true;
			} else {
				idphone.innerHTML = "格式錯誤請輸入正確電話號碼";
				phoneflag = false;
			}
		} else {
			idphone.innerHTML = "至少輸入10位號碼";
			phoneflag = false;
		}
		check();
	}
	
	function checkAddress() {
		let address = document.getElementById("Address").value;
		let idaddress = document.getElementById("idaddress");
		if (address == "") {
			idaddress.innerHTML = "請輸入地址";
			addressflag = false;
		} else {
			idaddress.innerHTML = "OK";
			addressflag = true;
		}
		check();
	}
	
	function check(){
		if(accountflag && passwordflag && nicknameflag && nameflag && addressflag && emailflag && phoneflag){
			document.getElementById("submit").disabled=false; 	
		}else{
			document.getElementById("submit").disabled=true; 	
		}
	}


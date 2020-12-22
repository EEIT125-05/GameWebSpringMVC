let passwordflag = false;
		let nicknameflag = true;
		let nameflag = true;
		let addressflag = true;
		let emailflag = true;
		let phoneflag = true;
	
		function checkPassword() {
			let password = document.getElementById("password");
			let passwordConfirm = document.getElementById("passwordConfirm");
			let c = document.getElementById("idpasswordConfirm");
			if (passwordConfirm.value == "") {
				c.innerHTML = ("請輸入密碼");
				passwordflag = false;
			} else {
				if (password.value == passwordConfirm.value) {
					c.innerHTML = "OK";
					passwordflag = true;
				} else {
					c.innerHTML = "密碼不相同";
					passwordflag = false;
				}
			}
			check()
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
			check()
		}
		
		function checkEmail() {
			let email = document.getElementById("Email").value;
			let idemail = document.getElementById("idemail");
			if (email == "") {
				idemail.innerHTML = "請輸入信箱";
				emailflag = false;
			} else {
				idemail.innerHTML = "";
				emailflag = true;
			}
			check()
		}
		
		function checkName() {
			let ename = document.getElementById("Ename").value;
			let enameLen = ename.length;
			let idname = document.getElementById("idname");
			let nameError = false;
			if (ename == "") {
				idname.innerHTML = "請輸入姓名";
				nameflag = false;
			} else if (enameLen >= 2) {
				for (let idname = 0; idname < enameLen; idname++) {
					if (ename.charCodeAt(idname) < 0x4E00
							|| ename.charCodeAt(idname) > 0x9FA5) {
						nameError = true;
						if (nameError) {
							break;
						}
					}
				}
				if (nameError) {
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
			check()
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
			check()
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
			check()
		}
		
		function check(){
			if(passwordflag && nicknameflag && nameflag && addressflag && emailflag && phoneflag){
				document.getElementById("submit").disabled=false; 	
			}else{
				document.getElementById("submit").disabled=true; 	
			}
		}

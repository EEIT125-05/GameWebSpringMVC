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
				c.innerHTML = ("<font color='red'>請輸入密碼</font>");
				passwordflag = false;
			} else {
				if (password.value == passwordConfirm.value) {
					c.innerHTML = "<font color='green'>OK</font>";
					passwordflag = true;
				} else {
					c.innerHTML = "<font color='red'>密碼不相同</font>";
					passwordflag = false;
				}
			}
			check()
		}

		function checkNickname() {
			let nickname = document.getElementById("Nickname").value;
			let idnickname = document.getElementById("idnickname");
			if (nickname == "") {
				idnickname.innerHTML = "<font color='red'>請輸入暱稱</font>";
				nicknameflag = false;
			} else {
				idnickname.innerHTML = "<font color='green'>OK</font>";
				nicknameflag = true;
			}
			check()
		}
		
		function checkEmail() {
			let email = document.getElementById("Email").value;
			let idemail = document.getElementById("idemail");
			if (email == "") {
				idemail.innerHTML = "<font color='red'>請輸入信箱</font>";
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
				idname.innerHTML = "<font color='red'>請輸入姓名</font>";
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
					idname.innerHTML = "<font color='red'>請輸入中文</font>";
					nameflag = false;
				} else {
					idname.innerHTML = "<font color='green'>OK</font>";
					nameflag = true;
				}
			} else {
				idname.innerHTML = "<font color='red'>至少兩個字</font>";
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
				idphone.innerHTML = "<font color='red'>請輸入手機號碼</font>";
				phoneflag = false;
			} else if (phoneLen >= 10) {
				if (reg.test(phone)) {
					phoneCheck = true;
				}
				if (phoneCheck) {
					idphone.innerHTML = "<font color='green'>OK</font>";
					phoneflag = true;
				} else {
					idphone.innerHTML = "<font color='red'>格式錯誤請輸入正確電話號碼</font>";
					phoneflag = false;
				}
			} else {
				idphone.innerHTML = "<font color='red'>至少輸入10位號碼</font>";
				phoneflag = false;
			}
			check()
		}
		
		function checkAddress() {
			let address = document.getElementById("Address").value;
			let idaddress = document.getElementById("idaddress");
			if (address == "") {
				idaddress.innerHTML = "<font color='red'>請輸入地址</font>";
				addressflag = false;
			} else {
				idaddress.innerHTML = "<font color='green'>OK</font>";
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

$(function(){
	$("#submit").attr("disabled","true");

    let flag1, flag2;
	let mode1, mode2;
	let today = $.format.date(new Date(), 'yyyy-MM-dd');
	if($("#sSignStart").val() != "" && $("#sSignStart").val() <= today){
				$("#sSignStart").attr("readonly", "true");
				mode1 = true;
	}
	if($("#sSignEnd").val() != "" && $("#sSignEnd").val() <= today){
				$("#sSignEnd").attr("readonly", "true");
				flag1 = true;
				mode2 = true;
	}
			
    let name, date2, location2, people, rule;
	if($("#sName").val() != ""){
		name = true;
	}
	
	if($("#sSignStart").val() != "" &&
		$("#sSignEnd").val() != "" &&
		$("#sTime").val() != ""){
		date2 = true;
	}
	
	if($("#sLocation").val() != ""){
		location2 = true;
	}
	
	if($("#iPeople").val() != ""){
		people = true;
	}
	
	if($("#sRule").val() != ""){
		rule = true;
	}
	
    $("#sName").blur(function(){
   	   let regu = "^[ ]+$";
   	   let re = new RegExp(regu);
        if($(this).val() == "" || re.test($(this).val())){
            $(this).next().text("名稱不能空白");
            name = false;
        }else if($(this).val().length > 20){
            $(this).next().text("名稱限制20字以內");
            name = false;
        }else{
            $(this).next().empty();
            name = true;
        }
        check();
    });

    
    $("#sSignStart").blur(function(){
        if($(this).val() == ""){
            $("#sSignEnd").next().text("日期不能空白");
            date2 = false;
        }
        date();
    });
    
    $("#sSignEnd").blur(function(){
        if($(this).val() == ""){
            $(this).next().text("日期不能空白");
            date2 = false;
        }
        date();
    });
    
    $("#sTime").blur(function(){
        if($(this).val() == ""){
            $(this).next().text("時間不能空白");
            date2 = false;
        }
        date();
    });
    
    function date(){
		let today = $.format.date(new Date(), 'yyyy-MM-dd');
		if(mode1 && !mode2){
			modeAfterSignStart();
		}else if(!mode2){
	        if($("#sSignStart").val() != "" && $("#sSignEnd").val() != ""){
	            if($("#sSignStart").val() < today){
					$("#sSignEnd").next().text("開始日期不能比今天早");
					flag1 = false;
				}else if($("#sSignStart").val() > $("#sSignEnd").val()){
	                $("#sSignEnd").next().text("結束日期不能比開始日期早");
	                flag1 = false;
	            }else{
	                $("#sSignEnd").next().empty();
	                flag1 = true;
	            } 
	        }
		}
        
		if(mode2){
			modeAfterSignEnd();
		}else{
	        if($("#sSignEnd").val() != "" && $("#sTime").val() != ""){
	        	let time = $.format.date(new Date($("#sTime").val().split("T")[0]), 'yyyy-MM-dd');
	            if($("#sSignEnd").val() >= time){
	                $("#sTime").next().text("比賽日期必須比報名結束日期晚");
	                flag2 = false;
	            }else{
	                $("#sTime").next().empty();
	                flag2 = true;
	            }
	        }
		}
        
        if(flag1 && flag2){
            date2 = true;
        }else{
            date2 = false;
        }
        check();
    }


	
	function modeAfterSignStart(){
		let today = $.format.date(new Date(), 'yyyy-MM-dd');
        if($("#sSignEnd").val() != ""){
            if($("#sSignEnd").val() < today){
				$("#sSignEnd").next().text("結束日期不能比今天早");
				flag1 = false;
			}else{
                $("#sSignEnd").next().empty();
                flag1 = true;
            } 
        }
	}
	
	function modeAfterSignEnd(){
		if($("#sTime").val() != ""){
			let today = $.format.date(new Date(), 'yyyy-MM-dd');
        	let time = $.format.date(new Date($("#sTime").val().split("T")[0]), 'yyyy-MM-dd');
            if(time <= today){
                $("#sTime").next().text("比賽日期必須比今天晚");
                flag2 = false;
            }else{
                $("#sTime").next().empty();
                flag2 = true;
            }
        }
	}

    
    $("#sLocation").blur(function(){
    	   let regu = "^[ ]+$";
       	   let re = new RegExp(regu);
        if($(this).val() == "" || re.test($(this).val())){
            $(this).next().text("地點不能空白");
            location2 = false;
        }else{
            $(this).next().empty();
            location2 = true;
        }
        check();
    });
    
    $("#iPeople").blur(function(){
        if($(this).val() <2 || $(this).val() > 100){
            $(this).next().text("只能輸入2~100");
            people = false;
        }else if($(this).val() == ""){
            $(this).next().text("人數不能空白");
            people = false;
        }else{
            $(this).next().empty();
            people = true;
        }
        check();
    });

    $("#sRule").blur(function(){
    	let regu = "^[ ]+$";
    	let re = new RegExp(regu);
        if($(this).val() == "" || re.test($(this).val())){
            $(this).next().text("規則不能空白");
            rule = false;
        }else{
            $(this).next().empty();
            rule = true;
        }
        check();
    });
    
	check();
    function check(){
        if(name && date2 && location2 && people && rule){
            $("#submit").removeAttr("disabled");
        }else{
            $("#submit").attr("disabled","true");
        }
    }
});
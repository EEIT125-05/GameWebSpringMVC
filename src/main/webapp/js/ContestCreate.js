$(function(){
	$("#submit").attr("disabled","true");
    let name = false;
    let date2 = false;
    let location2 = false;
    let people = false;
    let rule = false;
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
    
    let flag1 = false;
    let flag2 = false;
    function date(){
		let day = new Date().getDate();
		if(day < 10){
			day = "0" + day;
		}
		let d = new Date().getFullYear() + "-" +(new Date().getMonth()+1) + "-" + day;
		
        if($("#sSignStart").val() != ""  && $("#sSignEnd").val() != ""){
            if($("#sSignStart").val() < d){
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
        
        if($("#sSignEnd").val() != "" && $("#sTime").val() != ""){
        	time = $("#sTime").val().split("T")[0];
        	let d = new Date(time);
        	let month = d.getMonth()+1; 
        	let day = d.getDate()-1; 
        	if(month < 10){ 
        		month = "0" + month; 
        	} 
        	if(day < 10){ 
        		day = "0" + day; 
        	} 
        	time = d.getFullYear() + "-" + month + "-" + day;
            if($("#sSignEnd").val() > time){
                $("#sTime").next().text("比賽日期必須比報名結束日期晚");
                flag2 = false;
            }else{
                $("#sTime").next().empty();
                flag2 = true;
            }
        }
        
        if(flag1 && flag2){
            date2 = true;
        }else{
            date2 = false;
        }
        check();
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
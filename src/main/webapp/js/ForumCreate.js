$(function(){
	$("#submit").attr("disabled","true");
    let title = false;
	let text = true;
	if($("#sTitle").val() != ""){
		title = true;
	}
	
//	if($("#sText").val() != ""){
//		text = true;
//	}
    $("#sTitle").blur(function(){
		let regu = "^[ ]+$";
   	    let re = new RegExp(regu);
        if($(this).val() == "" || re.test($(this).val())){
            $("#titleError").text("標題不能空白");
            title = false;
        }else if($(this).val().length > 50){
			$("#titleError").text("標題限制50字以內");
            title = false;
		}else{
            $("#titleError").empty();
            title = true;
        }
        check();
    });

//	$("#sText").on("blur",function(){
//		let regu = "^[ ]+$";
//   	    let re = new RegExp(regu);
//        if($(this).val() == "" || re.test($(this).val())){
//            $("#textError").text("內文不能空白");
//            text = false;
//		}else{
//            $("#textError").empty();
//            text = true;
//        }
//        check();
//	});

	check();
    function check(){
        if(title && text){
            $("#submit").removeAttr("disabled");
        }else{
            $("#submit").attr("disabled","true");
        }
    }

});
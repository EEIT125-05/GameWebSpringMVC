$(function(){
    $("#password").on("blur",function(){
        check();
    });
    $("#passwordConfirm").on("blur",function(){
        check();
    });
});
function check(){
    if($("#password").val() != "" && $("#passwordConfirm").val() != ""){
        if($("#password").val() != $("#passwordConfirm").val()){
            $("#passwordConfirm").next().text("密碼不相同");
            $("#submit").attr("disabled","true");
        }else{
            $("#passwordConfirm").next().empty();
            $("#submit").removeAttr("disabled");
        }
    }
}
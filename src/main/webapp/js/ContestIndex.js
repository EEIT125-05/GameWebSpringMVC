$(function(){
	$("#submit").on("click",function(){
		$.ajax({
			type:"post",
			url:"/GameWebSpringMVC/contest/Ajax",
			dataType:"json",
			data:{"index":"dataToAjax",
				  "sSearch" : $("#sSearch").val(),
				  "sGame" : $("#sGame").val(),
				  "sSignDate" : $("#sSignDate").val(),
				  "sSign" : $("#sSign").val()				
			},
			success:function (result) {	
				console.log("ajax成功");
				$("#point").empty();
				if(result.lDataList.length == 0){
					$("#point").append("<p>無比賽符合您搜尋的條件</p>")							
				}
				$.each( result.lDataList ,function(key,value){
					$("#point").append("<button type=\"submit\" name=\"contestNo\" value=" + value.sNo + 
							" style=\"border:2px solid red;background-color:transparent;margin:10px;padding:2px;text-align:left\">" + 
							"比賽名稱: " + value.sName + 
							" <br> " + 
							" 比賽遊戲: " + value.sGame + 
							" <br> " +  
							"報名日期: " + value.sSignStart + "~" + value.sSignEnd + 
							" <br> " + 
							"比賽日期: " + value.sTime + 
							" <br> " +  
							"參加人數: " + value.sCount + "/" + value.sPeople + 											
							"</button>");
				});
            },
            error:function (err) {
                alert("發生錯誤!");
            }		
		});							
	});		
	$("#point").on("click","button",function(){
		let contestId = $(this).val();
		window.open("/GameWebSpringMVC/contest/Information?contestNo="+contestId,"_blank");
	});		
});
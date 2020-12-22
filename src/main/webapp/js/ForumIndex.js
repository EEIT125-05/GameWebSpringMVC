$(function(){
	$("#submit").on("click",function(){
		$.ajax({
			type:"post",
			url:"/GameWebSpringMVC/forum/IndexAjax",
			dataType:"json",
			data:{"index":"dataToAjax",
				  "sCategory" : $("#categorySelect").val(),
				  "sSearch" : $("#search").val()
			},
			success:function (result) {	
				$("#point").empty();
				if(result.lDataList.length == 0){
					$("#point").append("<p>無貼文符合您搜尋的條件</p>")							
				}else{
					$("#point").append("<table style=\"border:2px solid red\">"+
								"<thead>"+
								"<tr><th>分類</th><th>標題</th><th>樓主</th><th>發文時間</th><th>留言數</th>"+
								"</tr>"+
								"</thead>"+
								"<tbody></tbody></table>");
				}
				$.each(result.lDataList ,function(key,value){
					$("tbody").append("<tr><td>"+value.sCategory+"</td>"+
							"<td><a href=\"/GameWebSpringMVC/forum/Detail/"+value.sNo+"\">"+value.sTitle+"</a></td>"+
							"<td>"+value.sAuthor+"</td><td>"+value.sDate+" "+value.sTime+"</td>"+
							"<td>"+value.sReplyCount+"</td></tr>");
				});
            },
            error:function (err) {
                alert("發生錯誤!");
            }		
		});							
	});		
	$("#point").on("click","a",function(){
		this.target = "_blank";
	});	
	
	$("#point").on("click","button",function(){
		let contestId = $(this).val();
		window.open("/GameWebSpringMVC/forum/Detail/"+contestId,"_blank");
	});
});
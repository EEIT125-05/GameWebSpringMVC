<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../Link.jsp"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>交換版首頁</title>
	<%@ include file="../Header.jsp"%>
	<style>
		ul.pagination li a.active {
background-color: #4CAF50;
color: white;
}

ul.pagination li a:hover:not(.active) { background-color: #ddd; }
	
		ul.pagination {
		display: inline-block;
		padding: 0;
		margin: 0;
		}
		
		ul.pagination li { display: inline; }
		
		ul.pagination li a {
		color: black;
		float: left;
		padding: 8px 16px;
		text-decoration: none;
		}
	</style>
</head>
<body>
<%-- 	<form method='get' action='<c:url value="/exchange/preparehomepage"/>'> --%>


		<div id="portfolio" class="section md-padding bg-grey">
			<div class="container">


				<h1 class="mt-4 mb-3 ">許願池</h1>

				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="<c:url value='/'/>">Home</a>
					</li>
					<li class="breadcrumb-item active">交換</li>
				</ol>

				<label>依名稱搜尋: </label>
				<div class="input-group">
					<input type="text" class="form-control" name="searchparams" id="searchparams"
						value="${ searchparams}">
						<select id="search" >
						<option value="gamename">遊戲名稱</option> 
						<option value="area">地區</option> 
						</select>
						 <a class="btn btn-secondary" onclick="searchCondition();">搜尋</a>
				</div>
				
				<input type="hidden" id="search" value="${search}">
				<!-- 藏參數 -->
	
	<br>
	<div>
<%-- 	<a class="btn btn-secondary" href='<c:url value="/exchange/addDemandFilter?gamename=刺客"/>' onclick="changeCondition('刺客');">刺客</a> --%>
	<a class="btn btn-secondary" onclick="changeCondition('刺客','gamename');">刺客</a>
	<a class="btn btn-secondary" onclick="changeCondition('戰神','gamename');">戰神</a>
	<a class="btn btn-secondary" onclick="changeCondition('薩爾達','gamename');">薩爾達</a>
	<a class="btn btn-secondary" onclick="changeCondition('台北市','area');">台北市</a>
	<a class="btn btn-secondary" onclick="changeCondition('新北市','area');">新北市</a>
	</div>
	<br>
	<div class="row" id="bigdiv">


		<c:forEach var='g' varStatus='vs' items='${list }'>

			<!-- Work -->
			<div class="col-md-4 col-xs-6 work">
				<img class="img-responsive" style="width: 345px; height: 345px"
					src="${pageContext.request.contextPath }/images/${g.gamename}.jpg"
					alt="">
				<div class="overlay"></div>
				<div class="work-content">
					<span>遊戲名稱:${g.gamename}</span>
					<span>遊戲所在地:${g.area}</span>
					<span>遊戲平台:${g.console}</span>
					<span>玩家名稱:${g.gamer}</span>
					<span>備註:${g.remark}</span>
					<div class="work-link" style="margin: auto;">

						<div data-toggle="modal" data-target="#exampleModal">
							<button type="button" class="btn btn-primary" data-toggle="modal"
								data-target="#exampleModalLong${vs.index}"
								onclick="selectChange('${g.gamename }','${g.gamer}','${vs.index }');">
								<i class="fa fa-exchange"></i>
							</button>
						</div>


					</div>
				</div>
			</div>

			<div class="modal fade" id="exampleModalLong${vs.index}"
				tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle"
				aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLongTitle">交換申請</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>

						<div class="modal-body">


							<fieldset>
								<div>
									<label for="partyA">甲方　　 </label> <input type="text"
										name="partyA" value="${user.sAccount }" style="width: 260px;"
										class="fixedlen" id="partyA${vs.index }" readonly /> <span
										id="console1span"></span>
								</div>
								<div>

									<label for="gamename">您的遊戲</label> <input type="text"
										name="supportGame" value="${g.console }-${g.gamename}"
										style="width: 260px;" class="fixedlen" id="demandgamebean"
										readonly /> <input type="hidden" name="demandGameNo"
										id="demandGameNo${vs.index }" value="${g.no }" /> <span
										id="gamenamespan"></span>

								</div>
								<div>

									<label for="partyB">乙方　　 </label> <input type="text"
										name="partyB" value="${g.gamer }" style="width: 260px;"
										class="fixedlen" id="partyB${vs.index }" readonly /> <span
										id="qtyspan"></span>

								</div>
								<div>

									<label for="gamename">對方遊戲</label> <select
										style="width: 260px;" class="fixedlen" name="myGameNo"
										id="myGame${vs.index }" onblur="resetSelect(${vs.index });">
										
									</select> <span id="gamenamespan${vs.index }"></span>

								</div>

							</fieldset>

						</div>
						<div class="modal-footer">
						<div id="submit${vs.index }">
							<button type="botton" class="btn btn-secondary"
								data-dismiss="modal">返回</button>
							<a class="btn btn-primary appforsubmit "
								id="button${vs.index }"
								onclick="checksubmit(${vs.index });">申請</a>
						</div>
						</div>
					</div>
				</div>
			</div>


		</c:forEach>
	</div>
	<div id="pagediv" style="text-align: center;">
		<ul id="pageul" class='pagination'>
		</ul>
	
	</div>
	</div>
	</div>
<!-- 	</form> -->
	<%@ include file="../Foot.jsp"%>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script>
	
	window.onload=function(){
		changeCondition('all','all')
	}
	
	function searchCondition(){
		console.log("in")
		let gamename = document.getElementById("searchparams").value
		let search = document.getElementById("search").value
		changeCondition(gamename,search)
	}
	
	
	function changeCondition(a,b){
		console.log("a"+a)
		console.log("b"+b)
		var xhr3 =new XMLHttpRequest();
		let divout = document.getElementById("bigdiv")
		let pagediv = document.getElementById("pagediv")
		xhr3.open('GET','<c:url value="/exchange/addDemandFilter?str='+a+'&condition='+b+'"/>',true)
		xhr3.send();
		xhr3.onload=function(){
			if(xhr3.readyState ===4 && xhr3.status ===200){
				let t = JSON.parse(xhr3.responseText)
				console.log("success")
				console.log("totalPage"+!t.totalPage)
				console.log("totalPage"+t.totalPage)
				divout.innerHTML ="";
				for (let i = 0; i < t.list.length; i++) {
						console.log("!````!")
						divout.innerHTML += "<div class='col-md-4 col-xs-6 work animate__bounceIn'><img class='img-responsive' style='width:345px; height:345px' src='${pageContext.request.contextPath }/images/"+t.list[i].gamename+".jpg' alt=''>"
								+ "<div class='overlay'></div><div class='work-content'><span>遊戲名稱:"
								+ t.list[i].gamename
								+ "</span>"
								+ "<span>遊戲所在地:"
								+ t.list[i].area
								+ "</span>"
								+ "<span>主機平台:"
								+ t.list[i].console
								+ "</span>"
								+ "<span>玩家名稱:"
								+ t.list[i].gamer
								+ "</span>"
								+ "<span>備註:"
								+ t.list[i].remark
								+ "</span>"
								+ "<div class='work-link' style='margin: auto;'>"
								+ "<div data-toggle='modal' data-target='#exampleModal'>"
								+ "<button type='button' class='btn btn-primary' data-toggle='modal'"
								+ "data-target=\"#exampleModalLong"+i+"\" onclick=\"selectChange('"+t.list[i].gamename+"','"+t.list[i].gamer+"','"+i+"');\" >"
								+ "<i class='fa fa-exchange'></i></button>"
								+ "</div></div></div></div>"
								+ "<div class='modal fade' id='exampleModalLong"+i+"' tabindex='-1'"
								+ "role='dialog' aria-labelledby='exampleModalLongTitle' aria-hidden='true'>"
								+ "<div class='modal-dialog' role='document'>"
								+ "<div class='modal-content'>"
								+ "<div class='modal-header'>"
								+ "<h5 class='modal-title' id='exampleModalLongTitle'>交換申請</h5>"
								+ "<button type='button' class='close' data-dismiss='modal' aria-label='Close'>"
								+ "<span aria-hidden='true'>&times;</span></button></div>"
								+ "<div class='modal-body'><fieldset><div><label for='partyA'>甲方　　</label> <input type='text' name='partyA' value='"+t.mbUser.sAccount+"' style='width: 260px;'"
								+ " class='fixedlen' id='partyA"+i+"'  readonly/>"
								+ "<span id='console1span'></span></div><div><label for='gamename'>您的遊戲</label><input type='text' name='supportGame' value='"+t.list[i].console+"-"+t.list[i].gamename
								+ "'style='width: 260px;' class='fixedlen' id='demandgamebean' readonly />"
								+ "<input type='hidden' name='demandGameNo' id='demandGameNo"+i+"' value='"+t.list[i].no+"' /><span id='gamenamespan'></span>"		
								+ "</div><div><label for='partyB'>乙方　　</label> <input type='text'"	
								+ "name='partyB' value='"+t.list[i].gamer
								+ "'style='width: 260px;' class='fixedlen' id='partyB"+i+"' readonly/>"
								+ "<span id='qtyspan'></span></div><div>"
								+ "<label for='gamename'>對方遊戲</label> <select style='width: 260px;' class='fixedlen' name='myGameNo'"
								+ "id='myGame"+i+"' onblur='resetSelect("+i+");'>"
								+ "</select><span id='gamenamespan"+i+"'></span>"
								+ "</div></fieldset></div><div class='modal-footer'>"
								+ "<div id='submit"+i+"'>"
								+ "<button type='botton' class='btn btn-secondary'"
								+ " data-dismiss='modal' >返回</button>"
								+ "<a class='btn btn-primary appforsubmit ' id='button"+i+"' onclick='checksubmit("+i+");'>申請</a>"
								+ "</div>"
								+ "</div>"
								+ "</div></div></div>"
				}
				divout.innerHTML += "</div>"
// 				pagediv.innerHTML = ""
				$('#pageul').empty()
				if(!t.totalPage == false){
				for (let i = 1; i <= t.totalPage; i++) {
					console.log(i)
					$('#pageul').append("<li><a onclick='changeConditionByPage("+i+");'>"+i+"</a></li>")
				}
				}
			}
		}
		
		
	}
	
function changeConditionByPage(a){
		
		console.log("changePage")
		var xhr4 =new XMLHttpRequest();
		let divout = document.getElementById("bigdiv")
		let pagediv = document.getElementById("pagediv")
		xhr4.open('GET','<c:url value="/exchange/addDemandFilter?nowPage='+a+'"/>',true)
		xhr4.send();
		xhr4.onload=function(){
			if(xhr4.readyState ===4 && xhr4.status ===200){
				let t = JSON.parse(xhr4.responseText)
				console.log("success")
				divout.innerHTML ="";
				for (let i = 0; i < t.list.length; i++) {
						console.log("!````!")
						divout.innerHTML += "<div class='col-md-4 col-xs-6 work animate__bounceIn'><img class='img-responsive' style='width:345px; height:345px' src='${pageContext.request.contextPath }/images/"+t.list[i].gamename+".jpg' alt=''>"
								+ "<div class='overlay'></div><div class='work-content'><span>遊戲名稱:"
								+ t.list[i].gamename
								+ "</span>"
								+ "<span>遊戲所在地:"
								+ t.list[i].area
								+ "</span>"
								+ "<span>主機平台:"
								+ t.list[i].console
								+ "</span>"
								+ "<span>玩家名稱:"
								+ t.list[i].gamer
								+ "</span>"
								+ "<span>備註:"
								+ t.list[i].remark
								+ "</span>"
								+ "<div class='work-link' style='margin: auto;'>"
								+ "<div data-toggle='modal' data-target='#exampleModal'>"
								+ "<button type='button' class='btn btn-primary' data-toggle='modal'"
								+ "data-target=\"#exampleModalLong"+i+"\" onclick=\"selectChange('"+t.list[i].gamename+"','"+t.list[i].gamer+"','"+i+"');\" >"
								+ "<i class='fa fa-exchange'></i></button>"
								+ "</div></div></div></div>"
								+ "<div class='modal fade' id='exampleModalLong"+i+"' tabindex='-1'"
								+ "role='dialog' aria-labelledby='exampleModalLongTitle' aria-hidden='true'>"
								+ "<div class='modal-dialog' role='document'>"
								+ "<div class='modal-content'>"
								+ "<div class='modal-header'>"
								+ "<h5 class='modal-title' id='exampleModalLongTitle'>交換申請</h5>"
								+ "<button type='button' class='close' data-dismiss='modal' aria-label='Close'>"
								+ "<span aria-hidden='true'>&times;</span></button></div>"
								+ "<div class='modal-body'><fieldset><div><label for='partyA'>甲方　　</label> <input type='text' name='partyA' value='"+t.mbUser.sAccount+"' style='width: 260px;'"
								+ " class='fixedlen' id='partyA"+i+"'  readonly/>"
								+ "<span id='console1span'></span></div><div><label for='gamename'>您的遊戲</label><input type='text' name='supportGame' value='"+t.list[i].console+"-"+t.list[i].gamename
								+ "'style='width: 260px;' class='fixedlen' id='demandgamebean' readonly />"
								+ "<input type='hidden' name='demandGameNo' id='demandGameNo"+i+"' value='"+t.list[i].no+"' /><span id='gamenamespan'></span>"		
								+ "</div><div><label for='partyB'>乙方　　</label> <input type='text'"	
								+ "name='partyB' value='"+t.list[i].gamer
								+ "'style='width: 260px;' class='fixedlen' id='partyB"+i+"' readonly/>"
								+ "<span id='qtyspan'></span></div><div>"
								+ "<label for='gamename'>對方遊戲</label> <select style='width: 260px;' class='fixedlen' name='myGameNo'"
								+ "id='myGame"+i+"' onblur='resetSelect("+i+");'>"
								+ "</select><span id='gamenamespan"+i+"'></span>"
								+ "</div></fieldset></div><div class='modal-footer'>"
								+ "<div id='submit"+i+"'>"
								+ "<button type='botton' class='btn btn-secondary'"
								+ " data-dismiss='modal' >返回</button>"
								+ "<a class='btn btn-primary appforsubmit ' id='button"+i+"' onclick='checksubmit("+i+");'>申請</a>"
								+ "</div>"
								+ "</div>"
								+ "</div></div></div>"
					}
				divout.innerHTML += "</div>"
			}
			var $body = (window.opera) ? (document.compatMode == "CSS1Compat" ? $('html') : $('body')) : $('html,body');
			$body.animate({
				scrollTop: 0
			}, 600);
		}
		
	}
	
	
	
	
	
	function selectChange(gamename,gamer,no){
		console.log(gamename)
		console.log(gamer)
		let optstr ="";
		var xhr2 = new XMLHttpRequest();
		xhr2.open('GET','<c:url value="/exchange/memberSupportAjax"/>'+'?gamename='+gamename+'&gamer='+gamer,true)
		xhr2.send();
		xhr2.onload=function(){
			if (xhr2.readyState === 4 && xhr2.status === 200) {
			var s = JSON.parse(xhr2.responseText)
				console.log("success")
				console.log("result"+s.result)
				if(s.result === false){
					Swal.fire(
							  '您並沒有此款遊戲，如果您有此款遊戲請新增至遊戲庫內',
							  '',
							  'warning'
							)
					
					console.log(document.getElementById("gotomygame"+no)+"gotomygame")
					if(document.getElementById("gotomygame"+no) == null){
					$('#button'+no).remove();
					$('#submit'+no).append("<a class='btn btn-danger appforsubmit ' id='gotomygame"+no+"' href='<c:url value='/exchange/insertMyGame'/>'>新增遊戲</a>");
					}
					console.log("falseIn")
				}
				$("#myGame"+no).empty()
				optstr += "<option>對方的遊戲庫</option>"
				for (let i = 0; i < s.list.length; i++){
					optstr += "<option value='"+s.list[i].no+"'>"+s.list[i].console+"-"+s.list[i].gamename+"</option>"
				}
				$("#myGame"+no).append(optstr)
					
				
			}else{
				alert("失敗---readyState"+readyState+"status"+status)
			}
		}
		
	}
	
	function resetSelect(e){
		
		if ($("#myGame"+e).val() == "") {
				$("#gamenamespan"+e).html("<span>必填</span>")
				$(".appforsubmit").attr("disabled", true);
			} else if ($("#myGame"+e).val() == "對方的遊戲庫") {
				$("#gamenamespan"+e).html("<span>必填</span>")
				$(".appforsubmit").attr("disabled", true);
			} else {
				$("#gamenamespan"+e).html("")
				$(".appforsubmit").attr("disabled", false);
			}
	}
	
	function checksubmit(a){
		if($("#myGame"+a).val()!= "對方的遊戲庫"){
		var myGameval = $("#myGame"+a).val()
		var demandGameNoval = $("#demandGameNo"+a).val()
		var partyAval = $("#partyA"+a).val()
		var partyBval = $("#partyB"+a).val()
		console.log(myGameval+demandGameNoval+partyAval+partyBval)
		var xhr1 = new XMLHttpRequest();
		
		xhr1.open('POST', '<c:url value="/exchange/applyForWishAjax" />'
				+ '?PartyA=' + partyAval 
				+ '&PartyB='+ partyBval
				+'&myGameNo='+myGameval
				+ '&demandGameNo='+demandGameNoval
				, true);
		xhr1.send();
		xhr1.onload = function() {
			
			if (xhr1.readyState === 4 && xhr1.status === 200) {
				swal("申請成功",
	 					  "等待對方回覆!!",
	 					  "success").then(function(){
	 						 window.location.reload(false)
	 						  console.log("success")
	 					  })
			}else{
				alert("readyState"+xhr1.readyState+"status"+xhr1.status)
			}
		}
	}else{
		alert("請選擇遊戲")
		return;
	}
	}
	
	
	</script>
</body>
</html>
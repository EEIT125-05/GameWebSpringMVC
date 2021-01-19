<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../Link.jsp"%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>交換版首頁</title>
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
	<%@ include file="../Header.jsp"%>


		<div id="portfolio" class="section md-padding bg-grey">
			<div class="container">


				<h1 class="mt-4 mb-3">交換版</h1>

				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="<c:url value='/'/>">Home</a>
					</li>
					<li class="breadcrumb-item active">交換</li>
				</ol>

				<label>依名稱搜尋: </label>
				<div class="input-group">
					<input type="text" class="form-control" name="searchparams" id="searchparams"
						value="${ searchparams}" onchange="searchCondition();">
						<select id="search" >
						<option value="gamename">遊戲名稱</option> 
						<option value="gamelocation">地區</option> 
						</select>
						 <a class="btn btn-secondary" onclick="searchCondition();">搜尋</a>
				</div>


	<br>
	<div>
<%-- 	<a class="btn btn-secondary" href='<c:url value="/exchange/addDemandFilter?gamename=刺客"/>' onclick="changeCondition('刺客');">刺客</a> --%>
	<a class="btn btn-secondary" onclick="changeCondition('刺客','gamename');">刺客</a>
	<a class="btn btn-secondary" onclick="changeCondition('戰神','gamename');">戰神</a>
	<a class="btn btn-secondary" onclick="changeCondition('薩爾達','gamename');">薩爾達</a>
	<a class="btn btn-secondary" onclick="changeCondition('台北市','gamelocation');">台北市</a>
	<a class="btn btn-secondary" onclick="changeCondition('新北市','gamelocation');">新北市</a>
	</div>
	<br>
	<div class="row" id="bigdiv">


		<c:forEach var='g' varStatus='vs' items='${list }'>

			<!-- Work -->
			<div class="col-md-4 col-xs-6 work">
				<img class="img-responsive" style="width: 345px; height: 345px"
					src="${pageContext.request.contextPath }/${g.image }" alt="">
				<div class="overlay"></div>
				<div class="work-content">
					<span>遊戲名稱:${g.gamename}</span> <span>遊戲數量:${g.qty}</span> <span>遊戲所在地:${g.gamelocation}</span>
					<span>運送方式:${g.delivery}</span> <span>主機平台:${g.console}</span> <span>玩家名稱:${g.gamer}</span>
					<span>是否含特點:${g.dlc}</span> <span>備註:${g.remark}</span>
					<div class="work-link" style="margin: auto;">

						<div data-toggle="modal" data-target="#exampleModal">
							<button type="button" class="btn btn-primary" data-toggle="modal"
								data-target="#exampleModalLong${vs.index}" ><i
							class="fa fa-exchange"></i></button>
						</div>


					</div>
				</div>
			</div>

			<div class="modal fade" id="exampleModalLong${vs.index}" tabindex="-1"
				role="dialog" aria-labelledby="exampleModalLongTitle"
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
										<label for="partyA">甲方　　</label> <input type="text"
											name="partyA" value="${g.gamer }"
											style="width: 260px;" class="fixedlen" id="partyA${vs.index }"  readonly/>

														<span id="console1span"></span>
									</div>
									<div>

										<label for="gamename">欲換遊戲</label> <input type="text"
											name="supportGame"
											value="${g.console }-${g.gamename}"
											style="width: 260px;" class="fixedlen" id="Supportgamebean" readonly />
										<input type="hidden" name="supportGameNo" id="supportGameNo${vs.index }"
											value="${g.no }" />
														<span id="gamenamespan"></span>

									</div>
									<div>

										<label for="partyB">乙方　　</label> <input type="text"
											name="partyB" value="${user.sAccount }"
											style="width: 260px;" class="fixedlen" id="partyB${vs.index }" readonly/>
														<span id="qtyspan"></span>

									</div>
									<div>

										<label for="gamename">我的遊戲</label> <select
											style="width: 260px;" class="fixedlen" name="myGameNo"
											id="myGame${vs.index }" onblur="resetSelect(${vs.index });">
											<option>我的遊戲庫</option>
											<c:forEach var="M" items="${myGameBeans}">
												<option value="${M.no }">${M.console}-${M.gamename}</option>
											</c:forEach>
										</select> <span id="gamenamespan${vs.index }"></span>

									</div>

								</fieldset>

							</div>
							<div class="modal-footer">
								<button type="botton" class="btn btn-secondary"
									data-dismiss="modal" >返回</button>
								<a class="btn btn-primary appforsubmit " onclick="checksubmit(${vs.index });">申請</a>
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
	
	<%@ include file="../Foot.jsp"%>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script>

	var optstr ="";
	
	
	window.onload=function(){
		
		<c:forEach var="M" items="${myGameBeans}">
		optstr += "<option value='${M.no }'>${M.console}-${M.gamename}</option>"
		</c:forEach>
		
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
		xhr3.open('GET','<c:url value="/exchange/addSupportFilter?str='+a+'&condition='+b+'"/>',true)
		xhr3.send();
		xhr3.onload=function(){
			if(xhr3.readyState ===4 && xhr3.status ===200){
				let g = JSON.parse(xhr3.responseText)
				console.log("success")
				console.log("totalPage"+!g.totalPage)
				console.log("totalPage"+g.totalPage)
				divout.innerHTML ="";
				for (let i = 0; i < g.list.length; i++) {
						console.log("!````!")
						divout.innerHTML += "<div class='col-md-4 col-xs-6 work'><img class='img-responsive' style='width:345px; height:345px' src='${pageContext.request.contextPath }/"+g.list[i].image+"' alt=''>"
						+ "<div class='overlay'></div><div class='work-content'><span>遊戲名稱:"
						+ g.list[i].gamename
						+ "</span>"
						+ "<span>遊戲數量:"
						+ g.list[i].qty
						+ "</span>"
						+ "<span>遊戲所在地:"
						+ g.list[i].gamelocation
						+ "</span>"
						+ "<span>運送方式:"
						+ g.list[i].delivery
						+ "</span>"
						+ "<span>主機平台:"
						+ g.list[i].console
						+ "</span>"
						+ "<span>玩家名稱:"
						+ g.list[i].gamer
						+ "</span>"
						+ "<span>是否含特點:"
						+ g.list[i].dlc
						+ "</span>"
						+ "<span>備註:"
						+ g.list[i].remark
						+ "</span>"
						+ "<div class='work-link' style='margin: auto;'>"
						+ "<div data-toggle='modal' data-target='#exampleModal'>"
						+ "<button type='button' class='btn btn-primary' data-toggle='modal'"
						+ "data-target='#exampleModalLong"+i+"' >"
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
						+ "<div class='modal-body'><fieldset><div><label for='partyA'>甲方　　</label> <input type='text'name='partyA' value='"+g.list[i].gamer+"' style='width: 260px;'"
						+ " class='fixedlen' id='partyA"+i+"'  readonly/>"
						+ "<span id='console1span'></span></div><div><label for='gamename'>欲換遊戲</label><input type='text' name='supportGame' value='"+g.list[i].console+"-"+g.list[i].gamename
						+ "'style='width: 260px;' class='fixedlen' id='Supportgamebean' readonly />"
						+ "<input type='hidden' name='supportGameNo' id='supportGameNo"+i+"' value='"+g.list[i].no+"' /><span id='gamenamespan'></span>"		
						+ "</div><div><label for='partyB'>乙方　　</label> <input type='text'"	
						+ "name='partyB' value='"+g.mbUser.sAccount
						+ "'style='width: 260px;' class='fixedlen' id='partyB"+i+"' readonly/>"
						+ "<span id='qtyspan'></span></div><div>"
						+ "<label for='gamename'>我的遊戲</label> <select style='width: 260px;' class='fixedlen' name='myGameNo'"
						+ "id='myGame"+i+"' onblur='resetSelect("+i+");'>"
						+ "<option>我的遊戲庫</option>"
						+ optstr
						+ "</select><span id='gamenamespan"+i+"'></span>"
						+ "</div></fieldset></div><div class='modal-footer'><button type='botton' class='btn btn-secondary'"
						+ " data-dismiss='modal' >返回</button>"
						+ "<a class='btn btn-primary appforsubmit ' onclick='checksubmit("+i+");'>申請</a>"
						+ "</div>"
						+ "</div></div></div>"
					}
				divout.innerHTML += "</div>"
				$('#pageul').empty()
				if(!g.totalPage == false){
				for (let i = 1; i <= g.totalPage; i++) {
					console.log(i)
					$('#pageul').append("<li><a onclick='changeConditionByPage("+i+");'>"+i+"</a></li>")
				}
				}
			}
		}
	}
	
	function changeConditionByPage(a){
		console.log("a"+a)
		
		var xhr4 =new XMLHttpRequest();
		let divout = document.getElementById("bigdiv")
		let pagediv = document.getElementById("pagediv")
		xhr4.open('GET','<c:url value="/exchange/addSupportFilter?nowPage='+a+'"/>',true)
		xhr4.send();
		xhr4.onload=function(){
			if(xhr4.readyState ===4 && xhr4.status ===200){
				let g = JSON.parse(xhr4.responseText)
				console.log("success")
				console.log("totalPage"+!g.totalPage)
				console.log("totalPage"+g.totalPage)
				divout.innerHTML ="";
				for (let i = 0; i < g.list.length; i++) {
						console.log("!````!")
						divout.innerHTML += "<div class='col-md-4 col-xs-6 work'><img class='img-responsive' style='width:345px; height:345px' src='${pageContext.request.contextPath }/"+g.list[i].image+"' alt=''>"
						+ "<div class='overlay'></div><div class='work-content'><span>遊戲名稱:"
						+ g.list[i].gamename
						+ "</span>"
						+ "<span>遊戲數量:"
						+ g.list[i].qty
						+ "</span>"
						+ "<span>遊戲所在地:"
						+ g.list[i].gamelocation
						+ "</span>"
						+ "<span>運送方式:"
						+ g.list[i].delivery
						+ "</span>"
						+ "<span>主機平台:"
						+ g.list[i].console
						+ "</span>"
						+ "<span>玩家名稱:"
						+ g.list[i].gamer
						+ "</span>"
						+ "<span>是否含特點:"
						+ g.list[i].dlc
						+ "</span>"
						+ "<span>備註:"
						+ g.list[i].remark
						+ "</span>"
						+ "<div class='work-link' style='margin: auto;'>"
						+ "<div data-toggle='modal' data-target='#exampleModal'>"
						+ "<button type='button' class='btn btn-primary' data-toggle='modal'"
						+ "data-target='#exampleModalLong"+i+"' >"
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
						+ "<div class='modal-body'><fieldset><div><label for='partyA'>甲方　　</label> <input type='text'name='partyA' value='"+g.list[i].gamer+"' style='width: 260px;'"
						+ " class='fixedlen' id='partyA"+i+"'  readonly/>"
						+ "<span id='console1span'></span></div><div><label for='gamename'>欲換遊戲</label><input type='text' name='supportGame' value='"+g.list[i].console+"-"+g.list[i].gamename
						+ "'style='width: 260px;' class='fixedlen' id='Supportgamebean' readonly />"
						+ "<input type='hidden' name='supportGameNo' id='supportGameNo"+i+"' value='"+g.list[i].no+"' /><span id='gamenamespan'></span>"		
						+ "</div><div><label for='partyB'>乙方　　</label> <input type='text'"	
						+ "name='partyB' value='"+g.mbUser.sAccount
						+ "'style='width: 260px;' class='fixedlen' id='partyB"+i+"' readonly/>"
						+ "<span id='qtyspan'></span></div><div>"
						+ "<label for='gamename'>我的遊戲</label> <select style='width: 260px;' class='fixedlen' name='myGameNo'"
						+ "id='myGame"+i+"' onblur='resetSelect("+i+");'>"
						+ "<option>我的遊戲庫</option>"
						+ optstr
						+ "</select><span id='gamenamespan"+i+"'></span>"
						+ "</div></fieldset></div><div class='modal-footer'><button type='botton' class='btn btn-secondary'"
						+ " data-dismiss='modal' >返回</button>"
						+ "<a class='btn btn-primary appforsubmit ' onclick='checksubmit("+i+");'>申請</a>"
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
	
	
	
	
	function resetSelect(e){
			
			if ($("#myGame"+e).val() == "") {
					$("#gamenamespan"+e).html("<span>必填</span>")
					$(".appforsubmit").attr("disabled", true);
				} else if ($("#myGame"+e).val() == "我的遊戲庫") {
					$("#gamenamespan"+e).html("<span>必填</span>")
					$(".appforsubmit").attr("disabled", true);
				} else {
					$("#gamenamespan"+e).html("")
					$(".appforsubmit").attr("disabled", false);
				}
		}
		
		function checksubmit(a){
			if($("#myGame"+a).val()!= "我的遊戲庫"){
			var myGameval = $("#myGame"+a).val()
			var supportGameNoval = $("#supportGameNo"+a).val()
			var partyAval = $("#partyA"+a).val()
			var partyBval = $("#partyB"+a).val()
			console.log(myGameval+supportGameNoval+partyAval+partyBval)
			var xhr1 = new XMLHttpRequest();
			
			xhr1.open('POST', '<c:url value="/exchange/applyForAjax" />'
					+ '?partyA=' + partyAval 
					+ '&partyB='+ partyBval
					+'&myGameNo='+myGameval
					+ '&supportGameNo='+supportGameNoval
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
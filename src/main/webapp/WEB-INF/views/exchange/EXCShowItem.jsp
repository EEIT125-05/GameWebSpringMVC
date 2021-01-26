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
<title>管理頁面</title>
<style>
.spanStyle{
	color:green;
	font-size:18px
}
</style>
</head>
<body>
	<%@ include file="../Header.jsp"%>

<div class="container">

	<h1>管理 / ${user.sAccount } 你好</h1>


<!--  class="text-danger" -->
<p>
  <a class="btn btn-primary" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample" >
    交換池/共${fn:length(MemberSupport)}筆
  </a>
  <c:if test="${not empty MemberPending}">
  	<span id="warningSpanSupport"  style="color:red;font-size: 20px;font-weight:bold;">您有${fn:length(MemberPending)}筆交換待確認！</span>
  </c:if>
  
</p>

<div class="collapse show" id="collapseExample">
  <div class="card card-body">
  
  
    <c:choose> 	
		<c:when test="${empty MemberSupport}">
	查無資料<br>
		</c:when>
		<c:when test="${not empty MemberSupport }">

			<table border="1" class="table table-hover" style="font-size: 14px; border:3px;font-weight:bold;">
				<tr>
					<th>編號</th>
					<th>遊戲名稱</th>
					<th>商品位置</th>
					<th>運送方式</th>
					<th>主機平台</th>
					<th>是否含特典</th>
					<th>備註</th>
					<th>商品狀況</th>
					<th>刪除</th>
					<th>修改</th>
					<th>狀態</th>
				</tr>

				<c:forEach var='s' varStatus='vs' items='${MemberSupport }'>

					<tr>
						<td>${vs.count}</td>
						<td>${s.gamename}</td>
						<td>${s.gamelocation}</td>
						<td>${s.delivery}</td>
						<td>${s.console}</td>
						<td>${s.dlc}</td>
						<td>${s.remark}</td>
						<td>${s.condition}</td>

						<c:choose>
							<c:when test="${s.status == 0}">
								<td><a class="btn btn-primary btn-sm"
								 onclick="deleteCheck('Support','${s.no}');"><i class="fa fa-trash" aria-hidden="true"></i></a></td>
								<td><a class="btn btn-primary btn-sm"
									href="<c:url value="/exchange/update?updateindex=${vs.index}"/>"><i class="fa fa-pencil-square-o" aria-hidden="true"></a></td>
							</c:when>
							<c:when test="${s.status == 1 || s.status ==2 ||s.status ==3 || s.status ==4 || s.status ==5}">
								<td><a class="btn btn-primary disabled btn-sm"><i class="fa fa-trash" aria-hidden="true"></i></a></td>
								<td><a class="btn btn-primary disabled btn-sm"><i class="fa fa-pencil-square-o" aria-hidden="true"></a></td>
							</c:when>
						</c:choose>

						<td><c:choose>
								<c:when test="${s.status == 0}">
    							未換出
    							</c:when>
								<c:when test="${s.status == 1}">
    							已換出，與  <span class="spanStyle text-primary">${s.changehistorybean.partyB.sAccount }</span> 交換
    							</c:when>
								<c:when test="${s.status == 2}">
								<a class="btn btn-primary btn-sm" style="background-color: green;" href='<c:url value="showApplyFor?no=${s.changehistorybean.no }"/>' >待審核</a>

    							(來自 <span class="spanStyle">${s.changehistorybean.partyB.sAccount }</span>的交換請求)
    							</c:when>
    							<c:when test="${s.status == 3}">
    							已換出，與  <span class="spanStyle text-success">${s.mygamebean.changehistorybean.partyA.sAccount }</span> 交換
    							</c:when>
    							<c:when test="${s.status == 4}">
    							已向 <span class="spanStyle"> ${s.mygamebean.changehistorybean.partyA.sAccount }</span> 提出交換申請
    							</c:when>
    							<c:when test="${s.status == 5}">
    							<span class="spanStyle text-primary">已被管理員暫時下架</span>
    							</c:when>
							</c:choose></td>
					</tr>

				</c:forEach>
				</c:when>
				</c:choose>

			</table>
 
 
  </div>
  
  <br>
  
</div>
<p>
  <a class="btn btn-primary" data-toggle="collapse" href="#collapseExample1" role="button" aria-expanded="false" aria-controls="collapseExample1">
    	許願池 /共${fn:length(MemberDemand)}筆
  </a>
  <c:if test="${not empty MemberDemandPending}">
  	<span id="warningSpanDemand" style="color:red;font-size: 20px;font-weight:bold;">您有${fn:length(MemberDemandPending)}筆交換待確認！</span>
  </c:if>
</p>
<div class="collapse" id="collapseExample1">
  <div class="card card-body">
  
				<c:choose>
				<c:when test="${empty MemberDemand}">
		查無資料<br>
				</c:when>
				<c:when test="${not empty MemberDemand }">

					<table border="1" class="table table-hover" style="font-size: 14px; border:3px;font-weight:bold;">
						<tr>
							<th>編號</th>
							<th>遊戲名稱</th>
							<th>商品位置</th>
							<th>主機平台</th>
							<th>備註</th>
							<th>刪除</th>
							<th>狀態</th>
						</tr>

						<c:forEach var='d' varStatus='vs1' items='${MemberDemand }'>

							<tr>
								<td>${vs1.count}</td>
								<td>${d.gamename}</td>
								<td>${d.area}</td>
								<td>${d.console}</td>
								<td>${d.remark}</td>

								<c:choose>
									<c:when test="${d.status == 0}">
										<td><a class="btn btn-primary btn-sm"
											onclick="deleteCheck('Demand','${d.no}');"/><i class="fa fa-trash" aria-hidden="true"></i></a></td>
									</c:when>
									<c:when test="${d.status == 1 || d.status ==2 ||d.status ==5}">
										<td><a class="btn btn-primary disabled btn-sm"><i class="fa fa-trash" aria-hidden="true"></i></a></td>
									</c:when>
								</c:choose>

								<td><c:choose>
								<c:when test="${d.status == 0}">
    							未徵得
    							</c:when>
								<c:when test="${d.status == 1}">
    							已徵得
    							</c:when>
								<c:when test="${d.status == 2}">
    								<a class="btn btn-primary btn-sm" style="background-color: green;" href='<c:url value="showDemandApplyFor?no=${d.wishhistorybean.no }"/>' >待審核</a>
    							 <span class="spanStyle">(來自${d.wishhistorybean.partyA.sAccount }的交換請求)</span>
    							</c:when>
								<c:when test="${d.status == 5}">
    							<span class="spanStyle text-danger">已被管理員暫時下架</span>
    							</c:when>
									</c:choose></td>

							</tr>

						</c:forEach>
						</c:when>
						</c:choose>
					</table>
  </div>
  <br>
</div>
<p>
  <a class="btn btn-primary" data-toggle="collapse" href="#collapseExample2" role="button" aria-expanded="false" aria-controls="collapseExample2">
    我的遊戲庫 /共${fn:length(MemberGames)}筆
  </a>
</p>
<div class="collapse" id="collapseExample2">
  <div class="card card-body">
  <c:choose>
				<c:when test="${empty MemberGames}">
		目前遊戲庫無任何遊戲<br>
				</c:when>
				<c:when test="${not empty MemberGames }">
					<table border="1" class="table table-hover" style="font-size: 14px; border:3px;font-weight:bold;">
						<tr>
							<th>編號</th>
							<th>遊戲名稱</th>
							<th>主機平台</th>
							<th></th>
						</tr>

						<c:forEach var='g' varStatus='vs2' items='${MemberGames }'>
							<c:if test = "${g.status==0 || g.status==2}">
							<tr>
								<td>${vs2.count}</td>
								<td>${g.gamename}</td>
								<td>${g.console}</td>
								<c:choose>
							<c:when test="${g.status==2 }">
								<td>
								<c:choose>
									<c:when test="${g.changehistorybean.supportgamebean.gamename != null}">
										<a class="btn btn-primary btn-sm btn-danger"  onclick="applyFor('','${g.changehistorybean.no }')" >取消交換申請</a>
										待換中(您申請交換 <span class="spanStyle">${g.changehistorybean.supportgamebean.gamename }</span>
								 		等待 <span class="spanStyle">${g.changehistorybean.partyA.sAccount }</span> 的同意)
									</c:when>
									<c:when test="${g.wishhistorybean.demandgamebean.gamename !=null}">
										待換中(申請交換 <span class="spanStyle">${g.wishhistorybean.demandgamebean.gamename }</span>
										 等待 <span class="spanStyle">${g.wishhistorybean.partyB.sAccount }</span> 的同意)
									</c:when>
									<c:when test="${g.demandgamebean.wishhistorybean.mygamebean.gamename !=null}">
										<a class="btn btn-primary btn-sm btn-danger"   onclick="applyFor('Demand','${g.demandgamebean.wishhistorybean.no }')" >取消交換申請</a>
										待換中(您申請交換 <span class="spanStyle">${g.demandgamebean.wishhistorybean.mygamebean.gamename }</span>
										 等待 <span class="spanStyle">${g.demandgamebean.wishhistorybean.partyB.sAccount }</span> 的同意)
									</c:when>
								</c:choose>
								</td>
							</c:when>
						<c:when test="${g.supportgamebean==null }">
								<td>
								<a class="btn btn-primary btn-sm"
											onclick="deleteCheck('MyGame','${g.no}');"/><i class="fa fa-trash" aria-hidden="true"></i></a>	
								<a href="<c:url value="/exchange/myGameToSupportGame?no=${g.no }" />" class="btn btn-primary btn-sm btn-warning">交換去</a>
								</td>
						</c:when>
							<c:otherwise>
							<td>
								已在交換清單中
							</td>
							</c:otherwise>
							</c:choose>
							</tr>
						</c:if>
						</c:forEach>
						</c:when>
						</c:choose>

					</table>
  
  </div>
  <br>
</div>
<a class="btn btn-primary" style="background-color: red;" href="<c:url value="/exchange/Index"/>">返回主頁</a>
</div>
<%@ include file="../Foot.jsp"%>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10.13.0/dist/sweetalert2.all.min.js"></script>
<script>
if(${not empty MemberPending}){
let t = window.setInterval(change,1000)
let x = true;
function change(){
	let i = document.getElementById("warningSpanSupport")
	if(x==true){
		console.log("white")
	i.style.opacity="0.0"

	x =false
	}else{
		console.log("red")
	i.style.opacity="1.0"
	x= true
	}
}
}
if(${not empty MemberDemandPending}){
let y = window.setInterval(change,1000)
let x = true;
function change(){
	let i = document.getElementById("warningSpanDemand")
	if(x==true){
		console.log("white")
		i.style.opacity="0.0"
	x =false
	}else{
		console.log("red")
		i.style.opacity="1.0"
	x= true
	}
}
}

function deleteCheck(a,b){
	
	Swal.fire({
		  title: "你確定要刪除這筆資料?",
		//   text: "You won't be able to revert this!",
		  icon: 'warning',
		  showCancelButton: true,
		  confirmButtonColor: '#3085d6',
		  cancelButtonColor: '#d33',
		  confirmButtonText: '確定',
		  cancelButtonText:'返回'
		}).then((result) => {
		  if (result.isConfirmed) {
			 	var xhr = new XMLHttpRequest();
			 	xhr.open('DELETE','<c:url value="/exchange/delete'+a+'" />'+'?deleteindex='+b,true);
			 	xhr.send();
			 	xhr.onload = function(){
			 		if(xhr.readyState===4 && xhr.status ===200){
			 			Swal.fire(
			 				      'OK',
			 				      '刪除成功',
			 				      'success'
			 				    ).then(function(){
			 				   location.href='./management'
			 				    })
			 			}
		  			}	
			 	}
			})
}

function applyFor(a,b){
	var str = "取消"
	var str1 = "您取消申請"
		
	Swal.fire({
  title: "你確定要"+str+"?",
//   text: "You won't be able to revert this!",
  icon: 'warning',
  showCancelButton: true,
  confirmButtonColor: '#3085d6',
  cancelButtonColor: '#d33',
  confirmButtonText: '確定',
  cancelButtonText:'返回'
}).then((result) => {
  if (result.isConfirmed) {
	 	var xhr = new XMLHttpRequest();
	 	xhr.open('GET','<c:url value="/exchange/'+a+'ApplyForReject" />?no='+b,true);
	 	xhr.send();
	 	xhr.onload = function(){
	 		if(xhr.readyState===4 && xhr.status ===200){
	 			Swal.fire(
	 				      'OK',
	 				      str1,
	 				      'success'
	 				    ).then(function(){
	 				   location.href='./management'
	 				    })
	 			}
  			}	
	 	}
	})
}

</script>					
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix='form' uri="http://www.springframework.org/tags/form"%>
<%@ include file="../Link.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="../Header.jsp"%>
	<form method="post" action="<c:url value="/exchange/ApplyForSubmit"/>">
		<div class="container">
			<fieldset>
				<legend>交換申請</legend>
				<div>
					<label>您的帳號</label> <input type="text"
						value="${changeHistoryBean.partyA.sAccount }" readonly />
				</div>
				<div>
					<label>您的遊戲</label> <input type="text"
						value="${changeHistoryBean.supportgamebean.gamename }" readonly />
				</div>
				<div>
					<label>對方帳號</label> <input type="text"
						value="${changeHistoryBean.partyB.sAccount }" readonly />
				</div>
				<div>
					<label>對方遊戲</label> <input type="text"
						value="${changeHistoryBean.mygamebean.gamename }" readonly />
				</div>
				<div>
					<a class="btn btn-primary" onclick="applyFor('Submit');">確認</a> <a
						class="btn btn-primary" onclick="applyFor('Reject');" />駁回</a>
					<input type="hidden" id="ChangeHistoryNo"
						value="${changeHistoryBean.no }" />
				</div>
			</fieldset>
		</div>
	</form>
	<script
		src="https://cdn.jsdelivr.net/npm/sweetalert2@10.13.0/dist/sweetalert2.all.min.js"></script>
	<script>

	function test(){
		
		
		console.log("!@#")
	}
	
function applyFor(x){
	console.log(x)
	var str = ""
	var str1 = ""
	if (x==="Submit"){
		str = "交換"
		str1 = "趕快到您的遊戲庫確認吧!!"
	}else{
		str = "駁回"
		str1 = "您已駁回申請"
	}
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
	 	var no = document.getElementById("ChangeHistoryNo").value
	 	xhr.open('GET','<c:url value="/exchange/ApplyFor'+x+'" />'+'?no='+no,true);
	 	xhr.send();
	 	xhr.onload = function(){
	 		if(xhr.readyState===4 && xhr.status ===200){
	 			Swal.fire(
	 				      'OK',
	 				      str1,
	 				      'success'
	 				    ).then(function(){
// 	 				   location.href='./management'
	 				    })
	 			}
  			}	
	 	}
	})
}
</script>
	<%@ include file="../Foot.jsp"%>
</body>
</html>
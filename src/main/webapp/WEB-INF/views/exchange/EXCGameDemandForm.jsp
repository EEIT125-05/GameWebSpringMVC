<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../Link.jsp" %>
<% 
response.setContentType("text/html;charset=UTF-8");
request.setCharacterEncoding("UTF-8");
%>


    
<!DOCTYPE html>
<html>
 <HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=UTF-8"/>
<TITLE>許願池</TITLE>
      <style>
legend{
	font-size: 30px;
	}
fieldset{
	padding-top: 10px;
	padding-left: 20px;
	margin: auto;
	width: 400px;
	border-color: transparent;
	border-radius: 15px;
	margin: 20px;
	} 
#fixedlen{
	 width: 300px;
	}
div{
     margin-bottom: 5px;
}
</style>
</HEAD>
<BODY>
<%@ include file="../Header.jsp" %>

      <form action="GetGameinfoServlet" method="POST" enctype="multipart/form-data">
      <fieldset>
   		<legend>許願池</legend>
      <div>
        <label for="console">平台　　</label>
        <select style="width: 260px;" class="fixedlen" id="console1" name="console" onblur=checkconsole()>
        <option>請選擇平台</option>
        <c:forEach var="g" items="${sessionScope.initOption.ConsoleList}">
        <option>${g.sConsole}</option>
        </c:forEach>
        </select>
        <span id="console1span"></span>
      </div>
      <div>
          <label for="gamename">遊戲名稱</label>
          <select style="width: 260px;" class="fixedlen" id ="gamename" name="gamename" onblur=checkgamename()>
          <option >請選擇遊戲</option>
          <c:forEach var="g" items="${sessionScope.initOption.GamenameList }">
          <option>${g.sGame}</option>
          </c:forEach>
          </select>
          <span id="gamenamespan"></span>
      </div>
      <div>
          <label for="gamelocation">商品位置</label>
          <select style="width: 260px;" class="fixedlen" id="gamelocation" name="gamelocation" onblur=checkgamelocation()>
          <option>請選擇地區</option>
          <c:forEach var="g" items="${sessionScope.initOption.AreaList }">
          <option>${g.sArea}</option>
          </c:forEach>
          </select>
          <span id="gamelocationspan"></span>
      </div>
      <div>
          <label  for="gamer">玩家名稱</label>
          <input id="gamer" class="fixedlen" style="background-color:gary" type="text" name="gamer" value="${sessionScope.user.sAccount}" >
        </div>
      <div>
          <label  for="remark">備註　　</label>
          <input class="fixedlen" type="text" name="remark">
      </div>
      
      <div>
          <label for="image">圖片　　</label>
          <span id="imagespan"></span>
      </div>
      <div style="margin-top: 20px;">
      <input type="submit" name="submit" id="submit" value="送出" disabled>
      <input type="reset" value="清除">
 	  </div>
	</fieldset>
</form>

<script>
    let console1 = document.getElementById("console1");
    let console1span = document.getElementById("console1span")

    let gamename = document.getElementById("gamename");
    let gamenamespan = document.getElementById("gamenamespan")

    let qty = document.getElementById("qty");
    let qtyspan = document.getElementById("qtyspan")

    let condition = document.getElementById("condition");
    let conditionspan = document.getElementById("conditionspan")

    let gamelocation = document.getElementById("gamelocation");
    let gamelocationspan = document.getElementById("gamelocationspan")

    let delivery = document.getElementById("delivery");
    let deliveryspan= document.getElementById("deliveryspan")

    let image = document.getElementById("image");
    let imagespan= document.getElementById("imagespan")

    let flag1=false;let flag2=false;let flag3=false;let flag4=false;
    let flag5=false;

    function checkconsole(){
        flag1=false
        if(console1.value==""){
            console1span.innerHTML="必填"
        }else if(console1.value=="請選擇平台"){
            console1span.innerHTML="必填"
        }else{
            console1span.innerHTML=""
            flag1=true;
        }
        checkall();
    }
    function checkgamename(){
        flag2=false
        if(gamename.value==""){
            gamenamespan.innerHTML="必填"
        }else if(gamename.value=="請選擇遊戲"){
            gamenamespan.innerHTML="必填"
        }else{
            gamenamespan.innerHTML=""
            flag2=true;
        }
        checkall();
    }
    function checkgamelocation(){
        flag3=false
        if(gamelocation.value==""){
            gamelocationspan.innerHTML="必填"
        }else if(gamelocation.value=="請選擇地區"){
            gamelocationspan.innerHTML="必填"
        }else{
            gamelocationspan.innerHTML=""
            flag3=true;
        }
        checkall();
    }

    function checkall(){

        if(flag1 && flag2 && flag3){
            document.getElementById("submit").disabled=false;
        }else{
            document.getElementById("submit").disabled=true;
        }
    }


</script>

<%@ include file="../Foot.jsp" %>
</BODY>
</html>
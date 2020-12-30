<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../Link.jsp" %>

<sql:setDataSource var="ds" driver="com.microsoft.sqlserver.jdbc.SQLServerDriver"
	url="jdbc:sqlserver://localhost:1433;DatabaseName=GameSpringMVCDB" user="sa"
	password="sa123456" />
<c:choose>
<c:when test="${param.gamename == ''}">
<sql:query sql="select * from MalllistTable" var="rs" dataSource="${ds}" /> 
</c:when>
<c:when test="${param.change == null}">
<sql:query sql="select * from MalllistTable" var="rs" dataSource="${ds}" /> 
</c:when>
<c:when test="${param.change == 'Search'}">
<sql:query sql="select * from MalllistTable WHERE name like '%${param.gamename}%'" var="rs" dataSource="${ds}"  />
</c:when>
</c:choose>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <link rel=stylesheet type="text/css" href="css/LeftMall.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>商城</title>
<style>








.Newshop {
    display: inline-block;
    text-align: center;
    vertical-align: middle;
    padding: 5px 13px;
    border: 0px solid #a9a9b0;
    border-radius: 6px;
    background: #f2f2fc;
    background: -webkit-gradient(linear, left top, left bottom, from(#f2f2fc), to(#a9a9b0));
    background: -moz-linear-gradient(top, #f2f2fc, #a9a9b0);
    background: linear-gradient(to bottom, #f2f2fc, #a9a9b0);
    text-shadow: #ffffff 1px -1px 1px;
    font: normal normal bold 18px tahoma;
    color: #111111;
    text-decoration: none;
}
.Newshop:hover,
.Newshop:focus {
    border: 0px solid #f2f2fc;
    background: #ffffff;
    background: -webkit-gradient(linear, left top, left bottom, from(#ffffff), to(#cbcbd3));
    background: -moz-linear-gradient(top, #ffffff, #cbcbd3);
    background: linear-gradient(to bottom, #ffffff, #cbcbd3);
    color: #111111;
    text-decoration: none;
}
.Newshop:active {
    background: #a9a9b0;
    background: -webkit-gradient(linear, left top, left bottom, from(#a9a9b0), to(#a9a9b0));
    background: -moz-linear-gradient(top, #a9a9b0, #a9a9b0);
    background: linear-gradient(to bottom, #a9a9b0, #a9a9b0);
}
.Newshop:before{
    content:  "\0000a0";
    display: inline-block;
    height: 24px;
    width: 24px;
    line-height: 24px;
    margin: 0 4px -6px -4px;
    position: relative;
    top: 0px;
    left: 0px;
    background: url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAACXBIWXMAAA7EAAAOxAGVKw4bAAACxElEQVRIia2Wz0sbURCAv7yuEEM2bC7NWrpVcA+hF5HGGjDHpj+uxWPQ0v9AsEJ7UQMbBYUQeiwoeC7eS6+h1UMJSCkG46UEQgNaS2KsKL4esolx3U21dmBgd2fmm5m3b+etDxD8XQLAPeC2fV8FvgONK8S2EwiH+oEU8BGoAdKhNeCD7eN34bTZzg4E8BTYcYF66Y4dIxycixeAAljXADvVshmXKm5p9gbwlmYdzHYHL/8DvKUvnEt0F/jlFSCEkJZlycHBQWmaprQsSwohuiX4CdzprP4VEHKuXUsymQz1ep3d3V1KpRL1ep1MJuPlDqDZTAEQBPa8qkmn03J2dvbS87m5OTk/P9+tiz0g4AMe09zPbTFNk+HhYeLxOIlEguXlZdcyp6enyefzbGxsUCgUKJVKTpekD3hDc3u1ZWlpicPDQyqVCqenp92WAkVR6OvrIxAIMDMz4zS/VoB+t8D19XW2tra6wlsyNDREKpVyM/UrND/zC1IoFFhbW6Onp4dyudwVbhgGJycn5HI5N7Mf4C0uL2lkZEQuLCz8dc8vLi7KWCzmZc8JmnPkkmxvbxONRgGYnJxE0zTi8Tijo6NomsbExAQA0WiUYrHo1eCOAPJullqtRm9vL4qiMDY2hqqqmKaJaZqEQiESiQSKouD3+6nVal4JPkFzOLlOztXVVWkYhtR1XQohpKqqUlVVKYSQuq5LwzDkysqK1/IUAeVWR7ZnzvQDAwOYpsn+/j6RSIRwOEw4HCYSiRAMBkkmk1SrVTY3N92qTwOffZwfLl+AaKeHpmlMTU0RCARc+280GmSzWQ4ODpymb8AD4Decz6OHwJFHu9fRIyCGy7gGGAeObwA/Bp7bLNcTDeAR8OMf4BU79pK4Hfo68O6K3RzbvrqDIQDReslnjoRnnB9E48AT4D4Xf1u+0vzjeA+UO2LOOjl/AJiXaGstdhB/AAAAAElFTkSuQmCC") no-repeat left center transparent;
    background-size: 100% 100%;
}

/* == */
.Shoptext {
    display: inline-block;
    text-align: center;
    vertical-align: middle;
    padding: 5px 13px;
    border: 0px solid #a9a9b0;
    border-radius: 6px;
    background: #f2f2fc;
    background: -webkit-gradient(linear, left top, left bottom, from(#f2f2fc), to(#a9a9b0));
    background: -moz-linear-gradient(top, #f2f2fc, #a9a9b0);
    background: linear-gradient(to bottom, #f2f2fc, #a9a9b0);
    text-shadow: #ffffff 1px -1px 1px;
    font: normal normal bold 18px tahoma;
    color: #111111;
    text-decoration: none;
}
.Shoptext:hover,
.Shoptext:focus {
    border: 0px solid #f2f2fc;
    background: #ffffff;
    background: -webkit-gradient(linear, left top, left bottom, from(#ffffff), to(#cbcbd3));
    background: -moz-linear-gradient(top, #ffffff, #cbcbd3);
    background: linear-gradient(to bottom, #ffffff, #cbcbd3);
    color: #111111;
    text-decoration: none;
}
.Shoptext:active {
    background: #a9a9b0;
    background: -webkit-gradient(linear, left top, left bottom, from(#a9a9b0), to(#a9a9b0));
    background: -moz-linear-gradient(top, #a9a9b0, #a9a9b0);
    background: linear-gradient(to bottom, #a9a9b0, #a9a9b0);
}
.Shoptext:before{
    content:  "\0000a0";
    display: inline-block;
    height: 24px;
    width: 24px;
    line-height: 24px;
    margin: 0 4px -6px -4px;
    position: relative;
    top: 0px;
    left: 0px;
    background: url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAACXBIWXMAAA7EAAAOxAGVKw4bAAACXUlEQVRIibWWP0gbYRjGfzkvMZTQSCkES9MDQ2kIMQHb6VJCoUsoRZw6VacQEBxKd6fg2LleoHQJGYpClwQMFMRelkC3UFvEhlYcbCAURMWq93Xw1HDefZFIH3g4vvfP877fy/Hy+QCF/wjVcbYcBW8Bk8BTIGmfAbpAC/gEfAT+eORbXoVHgDfALiD6cNeOHbnqrbLA1hWEndyycy9B6eEkcDCA+BkPbI1ezXM8AvauIX7GPVsLAJ/9vQF8AeIAMzMzpFIpNjY2MAxDPlB3fAMeAvtnI3rd28Xo6KhIJBJidXVV+P3+QW/yClB8nP6q34ExZxvz8/NMTU2xs7MjbTcUCrG4uEilUuk1/wAeqMCEmzjA0tIS0WiUQqEgLTA9Pc3w8LDTPAZMKIDulbi+vk4sFiMQCEgLZLNZ1tbW3Fy6AtyXJZumSSaT8fQrioKmabTbbTd3TAVCsgLLy8vMzs7SbDZd/Zqmsb29jWW5boWQiv0reaHVaqHrOuVymaOjo0t+VVUpFote6fsqsCkrYFkW1WqVWq2GaZqyUDe0fcBj4LMsKp1OYxgG3W7X1b+wsECj0XBzZQACDLbc+vEnEFCAv8Dbfnedm5uj2WwyPj4OQDgcZmVlhVKp5JVi2NoA3ATaso7q9bqwLEvk83kBiGQyKY6Pj0Wn0xHBYNAZv2lrAhdr9Qlw6FUgEomIXC4nhoaGzm26rot4PO6MPbS1Lq1rgJfASZ/Zynhia0jxHOgMIN4BnrkJKi68C7yXjcwxknfAHTctH3LcA15w8aq4bdt/A185fVV8AH55CfwDnZk01iMWZM4AAAAASUVORK5CYII=") no-repeat left center transparent;
    background-size: 100% 100%;
}

.search {
    display: inline-block;
    text-align: center;
    vertical-align: middle;
    padding: 5px 13px;
    border: 0px solid #8484b3;
    border-radius: 6px;
    background: #d9d9ff;
    background: -webkit-gradient(linear, left top, left bottom, from(#d9d9ff), to(#8484b3));
    background: -moz-linear-gradient(top, #d9d9ff, #8484b3);
    background: linear-gradient(to bottom, #d9d9ff, #8484b3);
    text-shadow: #5f5f80 1px -1px 1px;
    font: normal normal bold 15px tahoma;
    color: #ffffff;
    text-decoration: none;
}
.search:hover,
.search:focus {
    border: 0px solid #bdbdff;
    background: #ffffff;
    background: -webkit-gradient(linear, left top, left bottom, from(#ffffff), to(#9e9ed7));
    background: -moz-linear-gradient(top, #ffffff, #9e9ed7);
    background: linear-gradient(to bottom, #ffffff, #9e9ed7);
    color: #ffffff;
    text-decoration: none;
}
.search:active {
    background: #8484b3;
    background: -webkit-gradient(linear, left top, left bottom, from(#8484b3), to(#8484b3));
    background: -moz-linear-gradient(top, #8484b3, #8484b3);
    background: linear-gradient(to bottom, #8484b3, #8484b3);
}
.search:after{
    content:  "\0000a0";
    display: inline-block;
    height: 24px;
    width: 24px;
    line-height: 24px;
    margin: 0 -4px -6px 4px;
    position: relative;
    top: 0px;
    left: 0px;
    background: url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAACXBIWXMAAA7EAAAOxAGVKw4bAAADJUlEQVRIibWVv28cVRDHP/N2fRe8R+4c5LNJiHHAEiksJw2IiB+WKIxBUUoo+ANOQjHIooLqWoSUCIsmUhSaNEkRoKNBtKlAZyyBECKHFLj4SLDvfD/3dt9QrJes16wFkjOrJ31X+2a+b2a+81YAwyO0OLjN+G4PA6czMIeJXTKsttU8LaIrqrIEOivgq7AhcAPk6kKp3P4vGUg6g43WfUIbXgT5xO+EuVbdZ9gKEUcYn3QpPp3DGeNXRd4+Uyp/l3XA2GKCmNmsb29eVOXT5vqAzVofGygiAoCqkis4zLzqUZh2txV56Uyp/FPSP433ENS2m6dRas1aP9f4vgeA6xiOn/IYdEP+bPRRFMcVnn3zKONPuLdRfWVhYirIIjCJFyPoit8Jc5vrfWT3WbxwgsXzJ1h66yRz80UEwY7gj9s9gBeBl2P/ZKwYJ2VqVWWpVfexgaKq5I8Ypp4aRzUq08m5AoqCQLcZ4O+EILwe+ydjxTglUZ0dtkJEou4MB5YH9/r/1L9R78X7AGXQDgGZyWowPJSpARDExxUXFUSioN98cZfZ547S7wb8fqcTNVyjA4gjoPgcMAsxQZSS6MbYpLygKCg07m7R6Qz45cd7WGuxVilPFylOeIgD7jEB4QcOUFF6im+4xwX3ccPID9hp97DWMvRHBEFIaC1bDzpRf+YMavBBv0z47xu0VGpy1YrWvXPObvEE0WjFWBXGJg1H5g0jG15bKE3VeaicfStJYBdK5fZI9R3nmHQmlvMUn3kMdksOiskJk897FBYdiq37zN+8Nrtz6aML9ko1efo9KkpPMgBfN+6cDdV+rnB21A4Z/DWKroqpHCYngYHr525dn3aGw2VQRFj1vPyaqVT33cpJgj39+Lb5mxmE4WtW9Q1gBggEakbMreUnT/28c+nD88BXCZfVgpdfk0o1kyDRi2xVxNheqdLtDt8DLmskawv6QSKTf1VRspYHYlOpWs/LrwHvi6hVxahyudsdvpvcnx6Q/7VMpUrBy38GrIro7nDyMVkqIkMJB2GpVPEikhWQHiI3U3sO76ev1eq+WJkqOkx7pD/9vwEBlm/nQbdtfQAAAABJRU5ErkJggg==") no-repeat left center transparent;
    background-size: 100% 100%;
}
.Shoptxt {
    display: inline-block;
    text-align: center;
    vertical-align: middle;
    padding: 5px 13px;
    border: 0px solid #8484b3;
    border-radius: 6px;
    background: #d9d9ff;
    background: -webkit-gradient(linear, left top, left bottom, from(#d9d9ff), to(#8484b3));
    background: -moz-linear-gradient(top, #d9d9ff, #8484b3);
    background: linear-gradient(to bottom, #d9d9ff, #8484b3);
    text-shadow: #5f5f80 1px -1px 1px;
    font: normal normal bold 15px tahoma;
    color: #ffffff;
    text-decoration: none;
}
.Shoptxt:hover,
.Shoptxt:focus {
    border: 0px solid #bdbdff;
    background: #ffffff;
    background: -webkit-gradient(linear, left top, left bottom, from(#ffffff), to(#9e9ed7));
    background: -moz-linear-gradient(top, #ffffff, #9e9ed7);
    background: linear-gradient(to bottom, #ffffff, #9e9ed7);
    color: #ffffff;
    text-decoration: none;
}
.Shoptxt:active {
    background: #8484b3;
    background: -webkit-gradient(linear, left top, left bottom, from(#8484b3), to(#8484b3));
    background: -moz-linear-gradient(top, #8484b3, #8484b3);
    background: linear-gradient(to bottom, #8484b3, #8484b3);
}
.Shoptxt:after{
    content:  "\0000a0";
    display: inline-block;
    height: 24px;
    width: 24px;
    line-height: 24px;
    margin: 0 -4px -6px 4px;
    position: relative;
    top: 0px;
    left: 0px;
    background: url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAACXBIWXMAAA7EAAAOxAGVKw4bAAADXklEQVRIibWVTWhcVRTHf+dlXhyT+UoJYZpiKdGKRilDqbaCXxUtEYnYtSs3AVdBXKuL7BSXIo0ggruqEKHqFKugpLGkViYYY+JHW2MzTdNkOs68mXmTee8eFzMTX8aJKZgcuLxz37n8z/3/7zn3CmCxi9YEN1vEzU74rQysnfSl4ZjU0EifZdsfWradbK7wXfdrY8yrM+nxrRhua6FAtif3HD1youehw/VAJMLSxxOHCj8vvAUs/98EBjizOvndm2vnLyQVPbDvheHH7Z4EQD+QbWyiyeS2fWn5CUBqaORE31NPnLVsm+Wz506KMAsSYpMpIKiqh0heoBfAKKsz6VOrTdygREHLeo5D1/67eHk4+fYtxxuo1rStBGFbzMF9d+Z+vFruBfh+wckxNHL3THq8AFhBiZpmKZr1ig6haJSqYwZGT/YjAqr1JFKf1DmIWKj2PvtwAhFh9J0riT9vuk0s067JTK0SynuO49rxGE61LsdfJY+Pvl0D4PPpW1xbW8cYeD99gya3suszt1iezqTfy2/sNvDdGHPfvIvnlJftWJT43t51EaFSNcwvVhARrixXyTs+viozl8uICCLCT39UKJb9c0HcYCc3B4DxK5Ws+j7nL17v1ID8qm3OQhVV5eKCA/BVECf079X1oKnVsn61StHrBFpBte3sh1+dAsh0ECeYYNN5qO9n/VIZR8L4BmLdHRxPxRERjt4XZe8em5AlDB/rQUTIFT1+WXKnMulTbhArmKC1Wa7XikWs7gi5okdfwuaxB2OgypF7I6gqAjx9OIGqkvmtxHrNfNmKs6VEQKNUI7z+wazXFe7Y1IwC5vlHejITU7kUwOJKNQ9MtOJsKRFwwY7HC55TimV+L70EMimiqNZvSAWm5ooFVY011ruKWW3FaXdVNG/XR01P3xc1XyOJqH011N3V34YtAJWlLA5hY/m1lU63+GImPT65rUSmwx6bu+eZiGeHGZz/7MDAsQdA/tlcONln3BsrFsawdtNh/v7nCHnu/sFLp8eA49tKJGoKnVWnPimXlq998ukY0iQNdjSSqRWKhxDgjugbIc9NdroOoibP7VSRGH/04OwZVKyE5ddea9BurbQpwEoNjcwOXjo9JmryYvxXGrEN6Xf10f+vKtox29VH/29nAZtRmrqcGAAAAABJRU5ErkJggg==") no-repeat left center transparent;
    background-size: 100% 100%;
}



        #mallpgul{
            list-style-type:none
            /* width: 400px;
            height: 300px; */
        }
        #mallpgul>li{
            font-size: 1.3em;
            color: rgb(98, 95, 89);
        }
        #malldivout{
            float: left;
           
            margin-top: 10px;
            background-color: blue;
            width: 550px;
            display: inline-flex;
            padding-top: 15px;
            padding-right:15px;
            margin-left: 10px;
            margin-bottom: 5px;

            
            background-color:rgb(255, 255, 255);
            border-radius: 15px;
            height: 300px;
        }
        #malldivin{  
            height: 200px;
            margin-top: 20px;
            text-align: center;
        }
        #mallimg{
            width:200 px;
            height: 200 px;
            border-radius: 20px;
            
        }
        
</style>
</head>
<body>
<%@ include file="../Header.jsp" %>

<form action="<c:url value="/mall/minipage"/>" method="get">
 <!-- <h2>遊戲商城</h2> -->
 <img src="images/遊戲商城.png" alt="">
 <input type="text" name="gamename" size="10">
 <button class="search" type="submit" value="Search" name="change" >搜尋</button>
<a class="Shoptxt" href="<c:url value="/mall/gotoMyshop"/>">我的購物車</a>
</form>
<form action="<c:url value="/mall/todoadd"/>"  method="get">
<c:forEach var="row" items="${rs.rows}">
   
    <div id="malldivout" > 
<div style="width: 400px;">   
    <ul id="mallpgul">
    	<li>商品名稱:${row.name}
    	<li>商品類型:${row.type}
    	<li>遊戲平台:${row.host}
    	<li>商品分類:${row.level}
    	<li>商品價錢:${row.money}
    	<li>商品貨號:${row.item}
    	<li>消費者滿意度:${row.contentment}
        
        <li> <button class="Newshop" type="submit" name="todo" value="${row.no}">加到購物車</button> 
            <a class="Shoptext" href="<c:url value="/mall/gotoMyshop"/>">我的購物車</a>
               <!-- <img src="images/我的購物車.png" alt=""> -->
	</ul></div> 
<div id="malldivin">
    <img id="mallimg" src="${row.origin}" alt="路徑失聯" style="width: 200px;height: 200px;">
    <br>   
    <input type="hidden" name="qty" value="">
    
</div>
    
</div>

</c:forEach>
</form>
<%@ include file="../Foot.jsp" %>
</body>
</html>
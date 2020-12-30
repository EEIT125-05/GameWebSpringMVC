<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@ include file="../Link.jsp" %>
<sql:setDataSource var="ds" driver="com.microsoft.sqlserver.jdbc.SQLServerDriver"
	url="jdbc:sqlserver://localhost:1433;DatabaseName=GameHibernateDB" user="sa"
	password="sa123456" />

<sql:query sql="select * from MalllistTable where no= '${todo }'" var="rs" dataSource="${ds}" /> 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <link rel=stylesheet type="text/css" href="css/LeftMall.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>商成</title>
<style>
    .Return {
    display: inline-block;
    text-align: center;
    vertical-align: middle;
    padding: 5px 13px;
    border: 0px solid #7e7ead;
    border-radius: 6px;
    background: #cfcfff;
    background: -webkit-gradient(linear, left top, left bottom, from(#cfcfff), to(#7e7ead));
    background: -moz-linear-gradient(top, #cfcfff, #7e7ead);
    background: linear-gradient(to bottom, #cfcfff, #7e7ead);
    text-shadow: #5a5a7c 1px -1px 1px;
    font: normal normal bold 18px tahoma;
    color: #ffffff;
    text-decoration: none;
}
.Return:hover,
.Return:focus {
    border: 0px solid #b4b4f7;
    background: #f8f8ff;
    background: -webkit-gradient(linear, left top, left bottom, from(#f8f8ff), to(#9797d0));
    background: -moz-linear-gradient(top, #f8f8ff, #9797d0);
    background: linear-gradient(to bottom, #f8f8ff, #9797d0);
    color: #ffffff;
    text-decoration: none;
}
.Return:active {
    background: #7e7ead;
    background: -webkit-gradient(linear, left top, left bottom, from(#7e7ead), to(#7e7ead));
    background: -moz-linear-gradient(top, #7e7ead, #7e7ead);
    background: linear-gradient(to bottom, #7e7ead, #7e7ead);
}
.Return:before{
    content:  "\0000a0";
    display: inline-block;
    height: 24px;
    width: 24px;
    line-height: 24px;
    margin: 0 4px -6px -4px;
    position: relative;
    top: 0px;
    left: 0px;
    background: url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAACXBIWXMAAA7EAAAOxAGVKw4bAAACzElEQVRIiZWVQWtUVxTHf//rCC4yFvMJXNiPMF20NMQnZicExF3IzlEEJ3RRQik4KOjGhVJFMUgsoTspWbgTM8YSu5l+g36FNpRMagXN+7t4986895qZiQce/O99nHPu+b17zhMQiLa5tXNX0EFqpD0MqKSTqbQ+RBvnwP0UKI+JOojfge1KoJI2gI0Q1iSteXCnUXLPBQ3Q9mL2TTfuhZj8s/Xm1tubwFw5ARaojGHkOFbvrq11gRtlp9l2W4rVJv4BCCrY/Z3WR3xQ8dwS/KYUz0bWMEEO5IYLNg/TuvxukrbNqXa7a9i2TYyFMRVE529/1zM8GGStpbj1C/B9s9d/V0M01SRVEoT9c60TwK+YBWAj7l+NgVcOiTG83pKG66G2kVQkiMGfAwuCKx/t9WMKgAOwnM/NrURH9OZNutKjiiKWipYw0NjPSicXl2d6/XWAQfZVOuHJf4//d1A4wyBr7QEb2KvN13+8i9ujXJUiTcNwF7MgcWVmq/9zKtX2rMSfkm4NXSVsnwauUVS0chRES8BGHvJ1Rh2dn3zd/wu4Q62J9s62QkGPZeD6NETDPtDBsVTXxOaSQoVDbZJUTIYGxY25Bn4LPE0vB+das5irwPHKsFN+GrMEPAKCS1jKGheToQGsCs4YHg+yVt4sPnLunF2JLyWWXf2K/wAPbX5IVblUYdKOqtHs9d/vZ62LgueGJ4OsFSA8dTgAC5u9Zq//BWNMkLhXdRxGAWCm6NRLwEvgMeTPlOsZ8QIwYRa5iEZdJ0TDboxJLka2i8Ai5pHsVabNorGIarPo1Y/3Mskri9m31w+hcejtOhKiaAF4YaszCck4RLtrazeB+Tqiyh8tpj5Frbmm6ITlxv8RVRMU/9PqNJn6R5ttt7tAl5olRCqdJmz2dj4I7WC2XfeoHGR08rFazNv+uorI3DfuAHOoWlHSit7TtM1H4KdPlpVnd1Dfe5wAAAAASUVORK5CYII=") no-repeat left center transparent;
    background-size: 100% 100%;
}
.MoneyPo {
    display: inline-block;
    text-align: center;
    vertical-align: middle;
    padding: 5px 13px;
    border: 0px solid #b3b3b3;
    border-radius: 6px;
    background: #ffffff;
    background: -webkit-gradient(linear, left top, left bottom, from(#ffffff), to(#b3b3b3));
    background: -moz-linear-gradient(top, #ffffff, #b3b3b3);
    background: linear-gradient(to bottom, #ffffff, #b3b3b3);
    text-shadow: #ffffff 1px -1px 1px;
    font: normal normal bold 18px tahoma;
    color: #111111;
    text-decoration: none;
}
.MoneyPo:hover,
.MoneyPo:focus {
    border: 0px solid #ffffff;
    background: #ffffff;
    background: -webkit-gradient(linear, left top, left bottom, from(#ffffff), to(#d7d7d7));
    background: -moz-linear-gradient(top, #ffffff, #d7d7d7);
    background: linear-gradient(to bottom, #ffffff, #d7d7d7);
    color: #111111;
    text-decoration: none;
}
.MoneyPo:active {
    background: #b3b3b3;
    background: -webkit-gradient(linear, left top, left bottom, from(#b3b3b3), to(#b3b3b3));
    background: -moz-linear-gradient(top, #b3b3b3, #b3b3b3);
    background: linear-gradient(to bottom, #b3b3b3, #b3b3b3);
}
.MoneyPo:before{
    content:  "\0000a0";
    display: inline-block;
    height: 24px;
    width: 24px;
    line-height: 24px;
    margin: 0 4px -6px -4px;
    position: relative;
    top: 0px;
    left: 0px;
    background: url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAACXBIWXMAAA7EAAAOxAGVKw4bAAAFdUlEQVRIibWUW2wc9RXGf2dndnb2Fq8va2dts3ZzWWNDnEtRkgYCTloobdKsBQgBUghVRW/pA5WqthJV+1JV6kMRAYRaqVGjgqiERKWNSBtHaQgiEHBoULw4cW62cVKvg72btTeevc3uvw+zuHZKU6lS/0/fmRl9853vf84ngIv/49ErqUP9wLOf/1oB8t/wCS2y84e1osq/BFcBly6KJgUbREApRb5Qxmu6ARARblhFzo9eI5O1uC1ST9eKFkQEpWo0IkaNjBr5EqwjjiClHF0/f/4QHa31+LwGU5NZ3LkKPfUNNJgmL775Eft++Siapi3u0reoqN6MdaUUiCAoBNiy/gt4LlmsM8M0r4xi1MjG5+boXdOOrms3WUSWW9yjS2qWOvTCvZtWcS6boS0YwNA0FAoFHLtyhW1bulDKIVeKGmakpvYz9UuwzoJHjq5M1mK0eIODly/jkgWVnEpPsz5fcsgXngoKNfCf1DsWoZAa0Q2ryKuHLvD09575tw+fBg4PHKap3k97pB6cocgIHLzJoiVYF5wLRhRuXYNqkbNnzy78dPHJzWXx+VY7hQIR+bUrsmOOW07RIosqlSqmKhEdG6XNH1hCni7kOWfNLlgpwgkRnr+VPUssUkrx21ffYWeojbXhJhZNCQArqaPF5+PF/cf5yQ8eGPIY7oddkR3259my1CJhEKUmjp28EI3Ou1nbFiZv2wyMf0Iyk6aiFF2hEF/r7CS6LMj2XAt7fvTK4bJd0ePx+HeBTYZHj+q6bhTypaxS6oJSagA4mkgkbAFcB17+xfLhjyYu/2rjl8zZYpHnRpJsfWgD7R1NFAs2uTmLgdcH+U40RjQY5GfvvVeqLvdX++5fY66KRQgu84IIFbvC1OR1zpwe460jQx/m5vI7NECUHnri8dWx/pV1dbz0cZJv7N1Ge7SJV35/jDOnx7inr4cv3h3jDwdP0re8lb99mtL2PhvXb+toxPAYzgYJiLioq/MS625F17XW4aGJEW3Xrl0SMs0Xvr+2t322VOK0v8jW7XcynJwgEDTZ2tfD1YkZVsYipLI5/OkSH6SmGDo7gYgL02tgmgaIUCyUuTKR5u2jSU4eH2beKv1FF5HmOxob7zI1ndHZWcKROgC6uts48LtzXByZ5Imn7kMByyMhUuPT1C/z8MzutZxKpnj7jUuks3mqVYXp0WlrCXB3dzM94W5+s38QHeiNhUK6CDR5vWSmUwiK1D8y9N2/hkK+zKn3L/KVB9cxMz1Hp9fLzGieo++O88A9nWzb3MFnQaOc7WPs6ixvHht2xlRE2sM+LwBhr5fi+evMTM8Rbqlj/8tHsO0Ku7+1nfn5AhcHx3my9y4aQibLgh5e+OPfKZYq+H1udM2FlS9TLFeIhAOs72nh/FgG3avrI42mWVXKCb5vru7mpX1H+PruLTy+5z7yVpFy2Wb/c39lT3QVmgjzVpnbVzTw5c0dKBRWvkzZruLzujF0jYpSvHaw1kHeti9dzGat2xsaAiC0Bvz8uKuXxJ/OMFqyUAKtLg97V8SI+P0AaC7hwJ+TeE03sc56mup9uHUXN6wSV6dyjIym0TRn33Rg5rWR88fbA4Gd68JhRIQ6w+DJnp6ar048L2AleD1ufvrtzWRmC4xeyTJzPY9d62B9TwsPf7WLD85MMjTyqbNo8Xg84BLZt6G5+bF14bDZGvATdBu4ayrsapVcqcw1a57kTNoevDZ14s6u8MYH713hi3U24PPqiAi2XWU6Y3EqmeLQW5c/zOaKO2RRArri8XiziGxUSq0CGkXEUEohIiWlVFpEJpRS7ycSicn+/v5W4BHNJZuCfqNd08TIF+ysVbAvAANKqSOJRMK+OZxuGVz/C/4n6FtBJcg9o50AAAAASUVORK5CYII=") no-repeat left center transparent;
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
            height: 400px;
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
        .MyShop {
    display: inline-block;
    text-align: center;
    vertical-align: middle;
    padding: 5px 13px;
    border: 0px solid #b3b3b3;
    border-radius: 6px;
    background: #ffffff;
    background: -webkit-gradient(linear, left top, left bottom, from(#ffffff), to(#b3b3b3));
    background: -moz-linear-gradient(top, #ffffff, #b3b3b3);
    background: linear-gradient(to bottom, #ffffff, #b3b3b3);
    text-shadow: #ffffff 1px -1px 1px;
    font: normal normal bold 18px tahoma;
    color: #111111;
    text-decoration: none;
}
.MyShop:hover,
.MyShop:focus {
    border: 0px solid #ffffff;
    background: #ffffff;
    background: -webkit-gradient(linear, left top, left bottom, from(#ffffff), to(#d7d7d7));
    background: -moz-linear-gradient(top, #ffffff, #d7d7d7);
    background: linear-gradient(to bottom, #ffffff, #d7d7d7);
    color: #111111;
    text-decoration: none;
}
.MyShop:active {
    background: #b3b3b3;
    background: -webkit-gradient(linear, left top, left bottom, from(#b3b3b3), to(#b3b3b3));
    background: -moz-linear-gradient(top, #b3b3b3, #b3b3b3);
    background: linear-gradient(to bottom, #b3b3b3, #b3b3b3);
}
.MyShop:after{
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

</style>
</head>
<body>
<%@ include file="../Header.jsp" %>

<form action="./MallCart.jsp" method="post">
<img src="images/遊戲商城.png" alt="">
<button class="MyShop" type="submit" name="gotomall" >我的購物車</button>
</form>
<form action="<c:url value="/mall/todo"/>"  method="get">
<c:forEach var="row" items="${rs.rows}">
    <div id="malldivout">     
    <ul id="mallpgul">
    	<li>商品名稱:${row.name}
    	<li>商品類型:${row.type}
    	<li>遊戲平台:${row.host}
    	<li>購買人次:${row.number}
    	<li>商品分類:${row.level}
    	<li>商品價錢:${row.money}
    	<li>付款方式:${row.pay}
    	<li>商品尺寸:${row.size}
    	<li>商品貨號:${row.item}
    	<li>商品評價分數:${row.contentment}
	</ul>
<div id="malldivin">
    <img id="mallimg" src="${row.origin}" alt="路徑失聯" style="width: 200px;height: 200px;">
    <hr>
    <input type="text" name="qty"  ><br>
    <button class="MoneyPo" type="submit" name="todo" value="${todo}" >購買數量</button>  

    
</div>
</div>
</c:forEach>
</form>
<%@ include file="../Foot.jsp" %>
</body>
</html>
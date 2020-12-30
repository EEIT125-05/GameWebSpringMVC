<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../Link.jsp" %>
<%
	response.setContentType("text/html;charset=UTF-8");
response.setHeader("Cache-Control", "no-cache"); // HTTP 1.1
response.setHeader("Pragma", "no-cache"); // HTTP 1.0
response.setDateHeader("Expires", -1); // Prevents caching at the proxy server
request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
	<link rel=stylesheet type="text/css" href="css/LeftMall.css">
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table {
	width: 80%;
	border-collapse: collapse;
	margin: auto;
}
table tr {
	border-bottom: solid 2px white;
}
table tr:last-child {
	border-bottom: none;
}
table th {
	position: relative;
	width: 30%;
	background-color: #7d7d7d;
	color: white;
	text-align: center;
	padding: 10px 0;
}
table th:after {
	display: block;
	content: "";
	width: 0px;
	height: 0px;
	position: absolute;
	top: calc(50% - 10px);
	right: -10px;
	border-left: 10px solid #7d7d7d;
	border-top: 10px solid transparent;
	border-bottom: 10px solid transparent;
}
table td {
	text-align: left;
	width: 70%;
	text-align: center;
	background-color: #eee;
	padding: 10px 0;
}
.main {
	
	item-align: center;
	width: 80%;
}
.button:hover, .button:focus {
	border: 1px solid##f4efeb;
	background: #ffffff;
	background: -webkit-gradient(linear, left top, left bottom, from(#ffffff),
		to(#cdc8c6));
	background: -moz-linear-gradient(top, #ffffff, #cdc8c6);
	background: linear-gradient(to bottom, #ffffff, #cdc8c6);
	color: #2b1f1f;
	text-decoration: none;
}
.button:active {
	background: #aba7a5;
	background: -webkit-gradient(linear, left top, left bottom, from(#aba7a5),
		to(#aba7a5));
	background: -moz-linear-gradient(top, #aba7a5, #aba7a5);
	background: linear-gradient(to bottom, #aba7a5, #aba7a5);
}
.button:before {
	content: "\0000a0";
	display: inline-block;
	height: 24px;
	width: 24px;
	line-height: 24px;
	margin: 0 4px -6px -4px;
	position: relative;
	top: -2px;
	left: 0px;
	background:
		url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAACXBIWXMAAA7EAAAOxAGVKw4bAAADlElEQVRIiYWVTWhjVRTHf/fel5c0aVLz2kxoS7uwii6mikVCVlMFF4O4EN24kREU3HQ13QiDoMiguJFRiii4FBwHHJCBgjILQZiNDFJ0oELnBVqCNtC0+Xj5uu9dF5PY15cXe+HC/379z/2fe865MN5kzFy4XQBeBW4DRghhgD1gOXL2PJ7YtgbcEkKcCCGMlNJIKUdGNuLIreEgOIfYAl5SSn2olCpFF4MgQGs94jijwoohDxuUgFRKvWPb9se2bT8mhBiz3u12A63175NuFiWM4hfS6fT1TCYTS+77Pp1O5z7w20hQWFxUQRQv27Z9zXEcRyk1Rm6Modls6iAIvgD6cZe0YlSNNtjA23Nzc5ey2WzMNmi3233P874eDAY/xpEDQTSUwhtsYL/ZbDYAUqnUmQ5wdHT0q+d5W0AjpFqGcVS3CeGvgHv9fn9HCPFyoVBgamoKpRRaa/b396v1ev1N4M/IuTN43LGPouZKsVj8IJVKlbXWN3u93r1EIlEuFotTJycn3u7u7vbx8fEV4I/hjUekYzhqQAKB4zjXV1ZWnnQcx7Esq1Sr1b71ff9Bp9NxXNfdarfbnwIu8CzwFLAA/APokBFDzCMHALOzs9MLCwskEgkWFxefCILgmuu6m+12+47Wugo8A3wElIUQaUAbY24AnxOJxNGDSEIZWKlUtrXWVWNM1XXd+67rfgM80Fp3gc+Au0KIt6SUTwshloUQjwOvh3jCPbYo2cArwOWhfAk8L4S4Pao/0Q78EnE18CiTo5PB0Jd3OA3bNaXUlmVZa3HZbIyh1+vtRMkBKSKTcUXvQjKZvJtOpy9OymbP81qdTuc54GF0/f+qqQRsIcRmPp+/aNs2xhiiCrrdLr7vfzckH6tpk1w02nApk8m8kcvlxogBtNY0m80drfWXMTwQKtdRFwXANNBvtVp/e563XCgUkPL0rO/7HBwc/FWv1zeBUake+9FU6LbhFEcIsaGUmjXG/NDv98vZbNZxHAfbtvF9n8PDw+NarXbVGLMN+IAI8fyH1XBghoZG2JmZmbk1PT39ou/7O4PB4GYQBOVCoZC3LIu9vb2HtVrtPa3195xmLyGeKD6baMBGqVQy6+vrZnV11eRyuQ3gcj6f/zmZTN7g9IM/t0+Kovn5+XkymQxLS0v0er33G43Gu8PqecSEzyUOT3JRNZFIvGaMyVYqleN6vf5Jq9X6CagSKmTnuMUA8l+L3YpKNwmMAgAAAABJRU5ErkJggg==")
		no-repeat left center transparent;
	background-size: 100% 100%;
}
.maindivMall{
    border-radius: 50px;
    margin: auto;
    width: 95%;
    height: 900px;
    background-color:cadetblue;
    position:relative;
}
.OK {
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
.OK:hover,
.OK:focus {
    border: 0px solid #ffffff;
    background: #ffffff;
    background: -webkit-gradient(linear, left top, left bottom, from(#ffffff), to(#d7d7d7));
    background: -moz-linear-gradient(top, #ffffff, #d7d7d7);
    background: linear-gradient(to bottom, #ffffff, #d7d7d7);
    color: #111111;
    text-decoration: none;
}
.OK:active {
    background: #b3b3b3;
    background: -webkit-gradient(linear, left top, left bottom, from(#b3b3b3), to(#b3b3b3));
    background: -moz-linear-gradient(top, #b3b3b3, #b3b3b3);
    background: linear-gradient(to bottom, #b3b3b3, #b3b3b3);
}
.OK:before{
    content:  "\0000a0";
    display: inline-block;
    height: 24px;
    width: 24px;
    line-height: 24px;
    margin: 0 4px -6px -4px;
    position: relative;
    top: 0px;
    left: 0px;
    background: url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAACXBIWXMAAA7EAAAOxAGVKw4bAAADE0lEQVRIiY2VTYgcVRSFv9MOErpKkayUiF0ZYdwKDrMxjAg64MKNKxHjwiAIQfAnCyFY7TQJ0YVLEfzbCSK4cTGR4EKHAWOIWQ6aRahyEV2FQbuHtonvuKiqnuqa6pm5UP1e1Xv3nL6n7jsloMMRYjhI7hdewmDpZpxmfx8lTyVBmEMURoMkxly0eFUQAxiGMl8izkdpNqzlhua8TlDF9H603utaXMZalYpFG6RiBG8Knov6+W4zt5ofIo/OYa1WwAXo3ghaBc7VK27Oqwr2xWjQ6wC/gxbLRzcNr5VJnwFLJd0t0GNRmoU2nLpeM+yG2JBM/zVcitNsM06zTZtLexUpoXg3oQUrLDQIpySCu8DY0C11P3nng8UOgP4NJ6cqmTHF3taoCPbJZO7ZhXBdYrV89O69k/Bwyf6y9nbecPBuDaOOdVgXJWuIyzYdCYrGKboIg3GQeD5K841mLgd00ZQs6mdXbL8lHGxKhmIowd+J0vz7OeqUxR7hJI/WeyuIs6DlgsE3EB9HaX71sNxWiUaD3us2Z5F+lP1R1M9v0VL+aNB7EOsN5GdAX0Rp9nlzzz6C0XryAPhPo2MIVGh9Demq7BwJwwnhZVunagqMgYfifrZTr6Deph0AizHotmCxqlFoBVih9IvqV6plm7+K3FnJ6zcBCHGaTbCfsv0p9i41i6BhF6Uf3TX+2uLZOM0mNA5a2zuYxrCQa03ijNEa3luT/APmW8R3UZrfbsuvqj3IrhkOkuPCv9Q8qYprtp+O+/l4Hji0SFSfDwfJgvBXdgk+K9GKpE/+ef/R1txqPveglW560dZaiY3lDcRWjeQV6b83dy+cqJvmDM6+LqrC6EXht6tWMf4N67TkY4afJT1S7vzQYWEbuNIm0ZyDliwZ/yrUxYDYAZ6M0my7qC5ZBv9kq1t+3e6An4j7+R8cxYuMX8DqFrIQgNMVOECUZtdtnWH66eQ44qU2iWastXZtCU8ECJ+P0myjsd6J+9k3wheKPUxktpp7OMiuh4NeIoiD2L7vvTzQ4kXD9V5H4nHMzjy/+h8K7YhEdxee2AAAAABJRU5ErkJggg==") no-repeat left center transparent;
    background-size: 100% 100%;
}


</style>
</head>
<body>
<%@ include file="../Header.jsp" %>

<!-- 商品資料新增->確認中(按下去就新增)	 -->
		<img src="images/商品資料如下請確認.png" alt="">
	
	<form action="<c:url value="/mall/new_check"/>" method="get">
		<div class="main">
			<table cellspacing="2" cellpadding="1" border="1" width="100%">
				<tr bgcolor="#FFFFE1">
					<th style="font-family: Microsoft JhengHei;">商品編號:</th>
					<td>${reg_student.no}</td>
				</tr>
				<tr bgcolor="#FFFFE1">
					<th style="font-family: Microsoft JhengHei;">商品名稱:</th>
					<td>${reg_student.name}</td>
				</tr>
				<tr bgcolor="#FFFFE1">
					<th style="font-family: Microsoft JhengHei;">商品類型:</th>
					<td>${reg_student.type}</td>
				</tr>
				
				<tr bgcolor="#FFFFE1">
					<th style="font-family: Microsoft JhengHei;">遊戲平台:</th>
					<td>${reg_student.host}</td>
				</tr>
				<tr bgcolor="#FFFFE1">
					<th style="font-family: Microsoft JhengHei;">購買人次:</th>
					<td>${reg_student.number}</td>
				</tr>
				<tr bgcolor="#FFFFE1">
					<th style="font-family: Microsoft JhengHei;">商品分類:</th>
					<td>${reg_student.level}</td>
				</tr>
				<tr bgcolor="#FFFFE1">
					<th style="font-family: Microsoft JhengHei;">商品價錢:</th>
					<td>${reg_student.money}</td>
				</tr>

				<tr bgcolor="#FFFFE1">
					<th style="font-family: Microsoft JhengHei;">付款方式:</th>
					<td>${reg_student.pay}</td>
				</tr>
				<tr bgcolor="#FFFFE1">
					<th style="font-family: Microsoft JhengHei;">交貨方式:</th>
					<td>${reg_student.deilvery}</td>
				</tr>
				<tr bgcolor="#FFFFE1">
					<th style="font-family: Microsoft JhengHei;">商品尺寸:</th>
					<td>${reg_student.size}</td>
				</tr>
				<tr bgcolor="#FFFFE1">
					<th style="font-family: Microsoft JhengHei;">商品產地:</th>
					<td>${reg_student.origin}</td>
				</tr>
				<tr bgcolor="#FFFFE1">
					<th style="font-family: Microsoft JhengHei;">商品貨號:</th>
					<td>${reg_student.item}</td>
				</tr>
				<tr bgcolor="#FFFFE1">
					<th style="font-family: Microsoft JhengHei;">消費者滿意度:</t>
					<td>${reg_student.contentment}</td>
				</tr>
			</table><br>
			<center><button class="OK" type="submit" name="confirm" value="確認">確認</button></center> 
		</div>
			
	</form>
	<%@ include file="../Foot.jsp" %>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../Link.jsp" %>
<%
response.setContentType("text/html;charset=UTF-8");
response.setHeader("Cache-Control","no-cache"); // HTTP 1.1
response.setHeader("Pragma","no-cache"); // HTTP 1.0
response.setDateHeader ("Expires", -1); // Prevents caching at the proxy server
request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>

<head>
  <meta charset="UTF-8">
  <link rel=stylesheet type="text/css" href="css/LeftMall.css">
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
      margin: 20px auto;
      item-align: center;
      width: 80%;
    }

    display: inline-block;
    text-align: center;
    vertical-align: middle;
    padding: 12px 24px;
    border: 1px solid #aba7a5;
    border-radius: 8px;
    background: #f4efeb;
    background: -webkit-gradient(linear, left top, left bottom, from(#f4efeb), to(#aba7a5));
    background: -moz-linear-gradient(top, #f4efeb, #aba7a5);
    background: linear-gradient(to bottom, #f4efeb, #aba7a5);
    -webkit-box-shadow: #ffffff 0px 0px 40px 0px;
    -moz-box-shadow: #ffffff 0px 0px 40px 0px;
    box-shadow: #ffffff 0px 0px 40px 0px;
    text-shadow: #ffffff 1px 1px 1px;
    font: normal normal bold 19px verdana;
    color: #2b1f1f;
    text-decoration: none;
    }

    .button:hover,
    .button:focus {
      border: 1px solid ##f4efeb;
      background: #ffffff;
      background: -webkit-gradient(linear, left top, left bottom, from(#ffffff), to(#cdc8c6));
      background: -moz-linear-gradient(top, #ffffff, #cdc8c6);
      background: linear-gradient(to bottom, #ffffff, #cdc8c6);
      color: #2b1f1f;
      text-decoration: none;
    }

    .button:active {
      background: #aba7a5;
      background: -webkit-gradient(linear, left top, left bottom, from(#aba7a5), to(#aba7a5));
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
      background: url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAACXBIWXMAAA7EAAAOxAGVKw4bAAADlElEQVRIiYWVTWhjVRTHf/fel5c0aVLz2kxoS7uwii6mikVCVlMFF4O4EN24kREU3HQ13QiDoMiguJFRiii4FBwHHJCBgjILQZiNDFJ0oELnBVqCNtC0+Xj5uu9dF5PY15cXe+HC/379z/2fe865MN5kzFy4XQBeBW4DRghhgD1gOXL2PJ7YtgbcEkKcCCGMlNJIKUdGNuLIreEgOIfYAl5SSn2olCpFF4MgQGs94jijwoohDxuUgFRKvWPb9se2bT8mhBiz3u12A63175NuFiWM4hfS6fT1TCYTS+77Pp1O5z7w20hQWFxUQRQv27Z9zXEcRyk1Rm6Modls6iAIvgD6cZe0YlSNNtjA23Nzc5ey2WzMNmi3233P874eDAY/xpEDQTSUwhtsYL/ZbDYAUqnUmQ5wdHT0q+d5W0AjpFqGcVS3CeGvgHv9fn9HCPFyoVBgamoKpRRaa/b396v1ev1N4M/IuTN43LGPouZKsVj8IJVKlbXWN3u93r1EIlEuFotTJycn3u7u7vbx8fEV4I/hjUekYzhqQAKB4zjXV1ZWnnQcx7Esq1Sr1b71ff9Bp9NxXNfdarfbnwIu8CzwFLAA/APokBFDzCMHALOzs9MLCwskEgkWFxefCILgmuu6m+12+47Wugo8A3wElIUQaUAbY24AnxOJxNGDSEIZWKlUtrXWVWNM1XXd+67rfgM80Fp3gc+Au0KIt6SUTwshloUQjwOvh3jCPbYo2cArwOWhfAk8L4S4Pao/0Q78EnE18CiTo5PB0Jd3OA3bNaXUlmVZa3HZbIyh1+vtRMkBKSKTcUXvQjKZvJtOpy9OymbP81qdTuc54GF0/f+qqQRsIcRmPp+/aNs2xhiiCrrdLr7vfzckH6tpk1w02nApk8m8kcvlxogBtNY0m80drfWXMTwQKtdRFwXANNBvtVp/e563XCgUkPL0rO/7HBwc/FWv1zeBUake+9FU6LbhFEcIsaGUmjXG/NDv98vZbNZxHAfbtvF9n8PDw+NarXbVGLMN+IAI8fyH1XBghoZG2JmZmbk1PT39ou/7O4PB4GYQBOVCoZC3LIu9vb2HtVrtPa3195xmLyGeKD6baMBGqVQy6+vrZnV11eRyuQ3gcj6f/zmZTN7g9IM/t0+Kovn5+XkymQxLS0v0er33G43Gu8PqecSEzyUOT3JRNZFIvGaMyVYqleN6vf5Jq9X6CagSKmTnuMUA8l+L3YpKNwmMAgAAAABJRU5ErkJggg==") no-repeat left center transparent;
      background-size: 100% 100%;
    }
    .InquireDelete {
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
.InquireDelete:hover,
.InquireDelete:focus {
    border: 0px solid #ffffff;
    background: #ffffff;
    background: -webkit-gradient(linear, left top, left bottom, from(#ffffff), to(#d7d7d7));
    background: -moz-linear-gradient(top, #ffffff, #d7d7d7);
    background: linear-gradient(to bottom, #ffffff, #d7d7d7);
    color: #111111;
    text-decoration: none;
}
.InquireDelete:active {
    background: #b3b3b3;
    background: -webkit-gradient(linear, left top, left bottom, from(#b3b3b3), to(#b3b3b3));
    background: -moz-linear-gradient(top, #b3b3b3, #b3b3b3);
    background: linear-gradient(to bottom, #b3b3b3, #b3b3b3);
}
.InquireDelete:before{
    content:  "\0000a0";
    display: inline-block;
    height: 24px;
    width: 24px;
    line-height: 24px;
    margin: 0 4px -6px -4px;
    position: relative;
    top: 0px;
    left: 0px;
    background: url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAACXBIWXMAAA7EAAAOxAGVKw4bAAADv0lEQVRIiaWVX4hUdRTHP9/fjpOKsXfmKUjv73rvqJFhJvUSIliJT+pDEhFRDxWCPkS9RoiUWAj11EMPGRVFGdJDUUSphWZZUYKxNNKM996VIFrcGYltWbd7etiZZfbuumh94Qfn/n7fc873nPv7I8BRQhxGDmwjcJ/QPQZrJatjKgzLJc6AjhWF/XhxNCu7z4F6CQrANbx3ZjwCeg6omjgBnMLsF0ljGFWwhknbZDwMjBi2r51nF3rxigHBBeBmE8TeVwVvGdyL8YykT1pZOt0jMiAEwMXerwAdEPYopm2tPD1X5gCFANcIQ0x6x9BKwYOtLB1LvN9kpn2IQMZSxFLMJkDvXqU4mud5sW7dOjc9ObnfTA8hu7OdZVPlFjkAk3YDGzB2tbL0cuKjLWZ8LWy5jM9MvGnYq8Axw/YsQXHiI9dsNgEOIpsG7e7FmzsSH1Vi788n3m+eKT2qx6H/I/HRY41Vq1xZDODi0B9PQr+3/534aG8SRh8zd8M4gIrBRkxTGGeAwomOwdZWlo6Uqu33tpDTDgqbXTDjU+BQEkbLW3n616BTRbAZ2UgrzwDcb2kK8CsLbN8+Wmk6OahyybKb8qt/TxaG1gLnBqtwYKsNLvcUzqq8EbvZbBZIR4HHyxyHURFaqBWL2fNhnJJsS3m6AhrDrMEiLbkG5vxQwSTQKc87w3426Y414epBlf+lXbeZMVKed6CvMAsLrDFA5kbsRqPhgB0SX5Q5rp2nV4TeNnFg/fr18w/KdQybuno3MwK/LK8NAaoFw2dBL/wzNcV4t3u2l92YuQwXteNVfkiO9xC3GlSDm+snO1c6RZ8zBGi8252oBcMngSO14WB5PQhOj3e7/WB9zLPXrEycueIlYKXgfqFXkE2Pd7vf9zlDvUw23u3+WRuuHUc6jGlrLQhOjHc7E731eSPx0TJTcRhpu9DOVp79XguC0xJv1IPaZFCv/dDpdDT4HgAQhz4EfSAsAj1v8H575vi71WFYddLtoAfM7ClgBPREO0/Heu4u8dEmzD4CXm/l2YvzEgAkYbQUsd+wJ2UKEGMGVbAVmC5JnACLDS6ocPtaoxfn+Mc+imV8A7Z9zotGCXHoq6AYrC40gexSpSjGmqOjxKGvg76VeLmVpUfKvkkYHTQxtVAF816la9mJ95tAnxvsaGfpd4OcxPtnQclC18N1H7RWlv1kxtMYH8ZhdMts8DCqGNplcH7RFl0PvPcModdktsXgoMQVQ3uEbTC463+1qG8nPqoYdgi0U1jFTKeB/e08bf8L4hS57IQ1al8AAAAASUVORK5CYII=") no-repeat left center transparent;
    background-size: 100% 100%;
}
  </style>
</head>

<body>
<%@ include file="../Header.jsp" %>

  <center>
    <img src="images/商品刪除資料如下請確認.png" alt="">
  </center>
  <form method="post">
    <div class="main">
      <table cellspacing="2" cellpadding="1" border="1" width="100%">
        <tr>
          <th style="font-family:Microsoft JhengHei;">商品編號:</th>
          <td>
            <%= request.getParameter("no") %> </td>
        </tr>
      </table>
    </div>
    <center>
      <a class="InquireDelete" href="/Mall/MallInquire.jsp">查詢</a></div>
    </center>
  </form>
  <%@ include file="../Foot.jsp" %>
</body>

</html>
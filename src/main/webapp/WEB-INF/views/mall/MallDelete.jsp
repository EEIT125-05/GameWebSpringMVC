<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../Link.jsp" %>
<!DOCTYPE html>
<html>

<head>
  <link rel=stylesheet type="text/css" href="css/LeftMall.css">
    <meta charset="UTF-8">
    <title>商品資料刪除</title>
    <style>
        table{
          width: 80%;
          border-collapse: collapse;
          margin: auto;
        }
        
        table tr{
          border-bottom: solid 2px white;
        }
        
        table tr:last-child{
          border-bottom: none;
        }
        
        table th{
          position: relative;
          width: 30%;
          background-color: #7d7d7d;
          color: white;
          text-align: center;
          padding: 10px 0;
        }
        
        table th:after{
          display: block;
          content: "";
          width: 0px;
          height: 0px;
          position: absolute;
          top:calc(50% - 10px);
          right:-10px;
          border-left: 10px solid #7d7d7d;
          border-top: 10px solid transparent;
          border-bottom: 10px solid transparent;
          
          
        }
        
        table td{
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

    <img src="images/商品刪除如下.png" alt="">
    <form action="<c:url value="/mall/delete"/>" method="get">
        <div >
            <table cellspacing="2" cellpadding="1" border="1" width="100%">

                <tr>
                    <th style="font-family:Microsoft JhengHei;">商品編號:</th>
                    <td><input type="text" name="no" size="10" maxlength="10"></td>
                </tr>

            </table>
        </div>
        <center>
            <input type="submit" name="strike" value="送出">
            <a class="InquireDelete" href="MallInquire.jsp" >查詢</a></div>
        </center>
    </form>
<%@ include file="../Foot.jsp" %>
</body>

</html>
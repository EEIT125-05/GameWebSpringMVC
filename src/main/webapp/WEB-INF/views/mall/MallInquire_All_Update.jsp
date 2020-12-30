<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%@ include file="../Link.jsp" %>
<%
response.setContentType("text/html;charset=UTF-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <link rel=stylesheet type="text/css" href="css/LeftMall.css">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>完成輸入</title>
    <style>
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
    background: url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAACXBIWXMAAA7EAAAOxAGVKw4bAAABKElEQVRIie3UPUoEQRAF4G+HiY1cI3M9gaCIgokXMBF/7qDgGQwEPYSKx1gxWDyBGGygYKRiYCyDwfZI7c+sziiY7IOmX1dX1+t5UzMtZH6PfSyMiXfyRIoKoRifxN/xEs4tYwtaKbEIm3HdhK/gCrfo5ZhNoyme0hPAKi6xjSW0cxxgF88NBY5wnYqfYwfdJKB8B2c4Negr9Wy5TMVvonpuEMWE9fBeiWhLN8Qf8AbHOEw3qTvW8JjmDBuYiTmxNYtwy5/w0pY9fVsKnGA+5g9bNGxFFV/Ub8VhW0YQBep80T1s4r7ibLnOokCdzvnA3Zh4rJWhqPo9NOUjdZpa9B2yEaJ+F1VxMT61aGpRI85/WLRekVQXc2n+uniOTuLtPxC4wKvwL/oEeBmOVSx9CxwAAAAASUVORK5CYII=") no-repeat left center transparent;
    background-size: 100% 100%;
}
.DeleteThank {
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
.DeleteThank:hover,
.DeleteThank:focus {
    border: 0px solid #ffffff;
    background: #ffffff;
    background: -webkit-gradient(linear, left top, left bottom, from(#ffffff), to(#d7d7d7));
    background: -moz-linear-gradient(top, #ffffff, #d7d7d7);
    background: linear-gradient(to bottom, #ffffff, #d7d7d7);
    color: #111111;
    text-decoration: none;
}
.DeleteThank:active {
    background: #b3b3b3;
    background: -webkit-gradient(linear, left top, left bottom, from(#b3b3b3), to(#b3b3b3));
    background: -moz-linear-gradient(top, #b3b3b3, #b3b3b3);
    background: linear-gradient(to bottom, #b3b3b3, #b3b3b3);
}
.DeleteThank:before{
    content:  "\0000a0";
    display: inline-block;
    height: 24px;
    width: 24px;
    line-height: 24px;
    margin: 0 4px -6px -4px;
    position: relative;
    top: 0px;
    left: 0px;
    background: url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAACXBIWXMAAA7EAAAOxAGVKw4bAAAEmElEQVRIidWUb2wTdRjHv/envd563V3/Ujq2XZvC2KVpRMJGIP4Zc5AJmJEsEjXGoGYjgQR8yQuCr0yMCSRGX/jWBBfjC0FR7MroNGTTkVDFsgUY2K1rkRuU29at13Z354t2hK4DX/Mkvze/33Ofz/N78vwOeN6DWL1xsqEh6HU6Bwhd1+Vs9uDHmUzyWYAzdrtX4PlvzQzjlVOptz5aWrr25Dm1Ci76m5uH3rZapRDQkKaonjaaPn85l1OeAve4eH5wf3t7WygUci4YxoHtsvzLRU2TawQnfb6gPxgc6rVYxLoTJ0Dv2gX/4KAwS1E920ymn4YWF7NVcIfD5+a4yO6WlnD9kSMwdXaiaW7OugD07piZGf7ZMDJVgjclKfKuwyGxfX2gWltBORygJQmNkYjwkKLeaGeY85cWF5UK3ONmmEiXzxe2HT0KSygEkqJANTVBJAjrg1zu1YF0+gsAIFcEpGFAJwhgYQGYmwMUBWZRBHfqFHZpmthIkrHPXK7AaYfD66KoSAfPh7m+PrAbNwKKUv5mYQFGGafXtGibpkVTZnPPpvFxgbLZQNpsQD4PmudBSRK80agwZxgHLcD7HTTdIhw/DqskAfk8oKrQ791DcXgYsaEheWZsbN8FQK4SDOdyyrZS6fy/LNsTTCQEsr4eJMcBqgqTzQZKkmCPxbjmUokXjh0D19pahhcK0O7fR2F4GFfGxuSpq1c7+w0jscKtGdNP3O5gs88XfZ2mxbq9e2H2+yuZBBZv38ZyPg8+HAaMcjNKioL86Cj+uHVLvnv9+p7Duv7nk7waAQB86nSKG1yuWDdJinXd3WCamspAopK+Ap+fR25kBGPJpDx1505n//JyYjWLWr0BAJfyeWW7rv/40GQ66B0f5+j6etAMA6hqeRUKKM7OYi4Ww7VUKvvP1FTH4TXgAECvtVk5WCqWSqpBUXhw7hys4TAojoNBENBUFUvpNMwmEwrF4jIN5J7GWbNFZ+x2j5Pno90sG16amEAJQLGyDJKEmeNgtlph4jhwGzbg98nJ5Gwm03FI05KrWWQNXBB8bpcr2m23h0sTE1WVEAAIkgRBEABBgABQyGaxY+tWcb3fH/saCD5TcEYQPG6v9+I+tztMxONV1zMA2EgSAlldE0EQ0GQZO3fuFL2bN0fPAuKagtM873U2NET2+XxhYmSkCmIAsLEsJlk2+zdNyzaTqbpMgoCWyWBHV5fokaTYABCoEdi93u8OBAIvmC9fXn1LWAUBCYtFvqvrr9zX9fa/CoWklWVhVMZ1RUJMT+Ol3l7RKUnf1wgYlnUwSvVf2QBQ5/EgwTDydD7feTifT3yoqslZVe24/uhR0lpfXyOhVBUWnhdqBPLNm+9FdV3Gli2P4UxjI+IMI99VlD39qvp4zg+VSklZUbriqVSSEYSyxDBArluHa/H4/Mzo6AePnU9W/DnDhDaGQkMvFwqeZVXFiKbJ0+l0Z3+xuOYjOguInvXrY21tbSJlteLG9PT85JUr+98BflsrHwDwpdn84g+bNk1cCARufGUyhZ6aWIkBIDDo88V/bWm58w3w2v/lP3/xH3OsyQOq+uDYAAAAAElFTkSuQmCC") no-repeat left center transparent;
    background-size: 100% 100%;
}




    </style>
</head>

<body>
<%@ include file="../Header.jsp" %>

<img src="images/輸入成功.png" alt=""><br>
<a class="InquireDelete" href="MallInquire.jsp">查詢</a>
<a class="DeleteThank" href="MallStrikeoutForm.jsp">刪除</a>
<%@ include file="../Foot.jsp" %>
</body>

</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ include file="../Link.jsp" %>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>賽事 - GameBar</title>
</head>

<body>
<%@ include file="../Header.jsp" %>

<div class="container">

<h1 class="mt-4 mb-3">比賽管理
<!--       <small>XXXXX</small> -->
    </h1>

    <ol class="breadcrumb">
      <li class="breadcrumb-item">
        <a href="<c:url value='/'/>">Home</a>
      </li>
      <li class="breadcrumb-item active">賽事</li>
    </ol>


	<div class="row">
	<c:if test="${empty lContestList}">
		<p>目前無資料</p>
	</c:if>
	
	<c:forEach var="cContest" items="${lContestList}">
	
      <div class="col-lg-4 col-sm-6 portfolio-item">
        <div class="card h-100">
          <a href="<c:url value='/contest/Schedule/${cContest.iNo}'/>"><img class="card-img-top" src="<c:url value='/contest/ImageLoading?iNo=${cContest.iNo}'/>" alt=""></a>
          <div class="card-body">
            <h4 class="card-title">
              <a href="<c:url value='/contest/Schedule/${cContest.iNo}'/>">${cContest.sName}</a>
            </h4>
            <fmt:formatDate var="sTime" value="${cContest.tTime}"
							pattern="yyyy-MM-dd HH:mm" />
            <p class="card-text">比賽日期: ${sTime}</p>
          </div>
        </div>
      </div>
	
	
	
	</c:forEach>
	</div>

</div>
<%@ include file="../Foot.jsp" %>
</body>
</html>
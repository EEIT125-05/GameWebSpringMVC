<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<%@ include file="../Link.jsp" %>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>GaneBar</title>
</head>
<body>
<%@ include file="../Header.jsp" %>

<div class="container">

<h1 class="mt-4 mb-3">參加的比賽
<!--       <small>XXXXX</small> -->
    </h1>

    <ol class="breadcrumb">
      <li class="breadcrumb-item">
        <a href="<c:url value='/'/>">Home</a>
      </li>
      <li class="breadcrumb-item active">賽事</li>
    </ol>

	<div class="row">
	<c:if test="${empty lParticipateList}">
			目前無資料
	</c:if>
	<c:forEach var="participate" items="${lParticipateList}">
	
	<div class="col-lg-4 col-sm-6 portfolio-item">
        <div class="card h-100">
          <a href="<c:url value='/contest/Information?contestNo=${participate.cContestBean.iNo}'/>"><img class="card-img-top" src="<c:url value='/contest/ImageLoading?iNo=${participate.cContestBean.iNo}'/>" alt=""></a>
          <div class="card-body">
            <h4 class="card-title">
              <a href="<c:url value='/contest/Information?contestNo=${participate.cContestBean.iNo}'/>">${participate.cContestBean.sName}</a>
            </h4>
            <fmt:formatDate var="sTime" value="${participate.cContestBean.tTime}"
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
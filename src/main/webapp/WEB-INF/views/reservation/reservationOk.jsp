<%@page import="com.spring.recopay.domain.ReservationDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>


<head>
<meta charset="UTF-8">
<meta name="description" content="">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

<!-- Title -->
<title>좌석 선택</title>

<!-- Favicon -->
<link rel="icon"
	href="<%=request.getContextPath()%>/resources/img/core-img/favicon.ico">

<!-- Stylesheet -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/style.css">

<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/calender/css/bootstrap.min.css">

<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/bootstrap.min.css">

<script
	src="${pageContext.request.contextPath }/js/bootstrap/bootstrap.min.js"></script>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<script src="${pageContext.request.contextPath }/js/reservation/selectseat.js"></script>

</head>

<body>

	<jsp:include page="/resources/jsp/header.jsp"></jsp:include>


	<div> 예매가 완료되었습니다. </div>

	<button type="button" onclick="location.href='<%=request.getContextPath() %>/reservation/mypage"> 예약 확인하기(MyPage) </button>
						
	<jsp:include page="/resources/jsp/footer.jsp"></jsp:include>


</body>

</html>
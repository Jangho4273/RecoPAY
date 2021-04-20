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
<style>
table { width: 100%;}
table, th, td {
	border: 1px solid black;
	border-collapse: collapse;
}

td, th {
	padding: 10px;	
}
</style>
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

<jsp:include page="/resources/jsp/header.jsp"></jsp:include>
	<!-- ##### Breadcumb Area Start ##### -->
	<section class="breadcumb-area bg-img bg-overlay"
		style="background-image: url(<%=request.getContextPath() %>/resources/img/bg-img/breadcumb.jpg);">
	</section>
	<div style="text-align:center;">
	<h3>마이페이지</h3>
	</div>
	<section class="elements-area mt-30 section-padding-100-0">
		<div class="container">
			<div class="row">

				<!-- Single Post Start -->
				<div class="single-blog-post mb-100 wow fadeInUp"
					data-wow-delay="100ms">
					
					
					
					<c:choose>
					<c:when test="${empty list || fn:length(list) == 0 }">
					</c:when>
					<c:otherwise>
					<table>
						<th>연극명</th>
						<th>극장명</th>
						<th>위치</th>
						<th>공연시간</th>
						<th>좌석위치</th>
					<c:forEach var="dto" items="${list }" varStatus="vs" >
						<tr>
							<td>${dto.prfName }</td>
							<td>${dto.thName }</td>
							<td>${dto.thLocation }</td>
							<td>${dto.prfTime }</td>
							<td>${dto.seatNum }</td>
						</tr>
					</c:forEach>
					</table>
					</c:otherwise>
					</c:choose>
					
					
				</div>
			</div>
		</div>
	</section>

	<jsp:include page="/resources/jsp/footer.jsp"></jsp:include>

</body>

</html>
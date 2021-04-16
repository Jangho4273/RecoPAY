<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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
	
<script src="${pageContext.request.contextPath }/js/selectseat.js"></script>

</head>

<body>

	<jsp:include page="/resources/jsp/header.jsp"></jsp:include>

	<!-- ##### Breadcumb Area Start ##### -->
	<section class="breadcumb-area bg-img bg-overlay"
		style="background-image: url(<%=request.getContextPath()%>/resources/img/bg-img/breadcumb.jpg);">
		<div class="bradcumbContent">
			<p>공연장 좌석 선택</p>
			<h2>어디 좌석 선택할래?</h2>
		</div>
	</section>
	<!-- ##### Breadcumb Area End ##### -->


	<!-- 좌석 시작 -->
	<div class="container">
		<p class="text-center" style="font-size: 40px;">== Stage 방향 ==</p>
		<div class="row">
			<div class="col-sm-3">
				<p class="text-center" style="font-size: 40px;">A</p>
				<div class="row">
					<c:forEach var="i" begin="0" end="98">
						<div class="seat" style="border: 1px solid; width: 30px"
							id="a${i }" onClick="reply_click(this.id)">A${i }</div>
					</c:forEach>
				</div>
			</div>
			<div class="col-sm-3">
				<p class="text-center" style="font-size: 40px;">B</p>
				<div class="row">
					<c:forEach var="i" begin="0" end="98">
						<div class="seat" style="border: 1px solid; width: 30px"
							id="b${i }" onClick="reply_click(this.id)">B${i }</div>
					</c:forEach>
				</div>
			</div>
			<div class="col-sm-3">
				<p class="text-center" style="font-size: 40px;">C</p>
				<div class="row">
					<c:forEach var="i" begin="0" end="98">
						<div class="seat" style="border: 1px solid; width: 30px"
							id="c${i }" onClick="reply_click(this.id)">C${i }</div>
					</c:forEach>
				</div>
			</div>
			<div class="col-sm-3">
				<p class="text-center" style="font-size: 40px;">D</p>
				<div class="row">
					<c:forEach var="i" begin="0" end="98">
						<div class="seat" style="border: 1px solid; width: 30px"
							id="d${i }" onClick="reply_click(this.id)">D${i }</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
	<!-- 좌석 끝 -->
	
	<br><br>
	
	<div>
		<p id="state"> </p><br>
		<p id="totalseat"> </p><br>
	</div>
		




	<jsp:include page="/resources/jsp/footer.jsp"></jsp:include>


</body>

</html>
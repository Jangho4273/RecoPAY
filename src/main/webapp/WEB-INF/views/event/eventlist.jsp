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
<title>Event List</title>

<!-- Favicon -->
<link rel="icon"
	href="<%=request.getContextPath()%>/resources/img/core-img/favicon.ico">

<!-- Stylesheet -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/style.css">


<link rel="stylesheet" type="text/css"
	href="https://uicdn.toast.com/tui.time-picker/latest/tui-time-picker.css">
<link rel="stylesheet" type="text/css"
	href="https://uicdn.toast.com/tui.date-picker/latest/tui-date-picker.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/calender/dist/tui-calendar.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/calender/css/default.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/calender/css/icons.css">

<!-- ##### Import ajax ##### -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="${pageContext.request.contextPath }/js/theatermap.js"></script>


</head>

<body>
	<jsp:include page="/resources/jsp/header.jsp"></jsp:include>
	<!-- ##### Breadcumb Area Start ##### -->
	<section class="breadcumb-area bg-img bg-overlay"
		style="background-image: url(<%=request.getContextPath()%>/resources/img/bg-img/breadcumb.jpg);">
		<div class="bradcumbContent">
			<p>이벤트 정보</p>
			<h2>공연 이벤트 정보</h2>
		</div>
	</section>

	<section class="contact-area section-padding-100-0">
		<div class="container">
			<div class="row">

				
				
				<br>
				<br>
				<br>


				<jsp:include page="/resources/jsp/footer.jsp"></jsp:include>
			</div>
		</div>
	</section>

</body>

</html>
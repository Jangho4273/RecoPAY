<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
	
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="description" content="">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

<!-- Title -->
<title>Theater</title>

<!-- Favicon -->
<link rel="icon" href="img/core-img/favicon.ico">

<!-- Stylesheet -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/style.css">

<!-- ##### Import ajax ##### -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- ##### Import javascript ##### -->
<script src="${pageContext.request.contextPath }/js/theater.js"></script>
</head>



<body>

	<jsp:include page="/resources/jsp/header.jsp"></jsp:include>
	<!-- ##### Breadcumb Area Start ##### -->
	<section class="breadcumb-area bg-img bg-overlay"
		style="background-image: url(<%=request.getContextPath() %>/resources/img/bg-img/breadcumb.jpg);">
	</section>

	<section class="elements-area mt-30 section-padding-100-0">
		<div class="container">
			<div class="row">

				<!-- Single Post Start -->
				<div class="single-blog-post mb-100 wow fadeInUp"
					data-wow-delay="100ms">

					<!-- Blog Content -->
					<div class="blog-content" style="width: 750px;">
						<c:choose>
							<c:when test="${empty list || fn:length(list) == 0 }">
							</c:when>
						<c:otherwise>
								<c:forEach var="dto" items="${list }" varStatus="vs">
								
									<!-- Post Title -->
									<a href="#" class="post-title" id="theater_name">${dto.name } </a>
									<!-- Post Meta -->
									<div class="post-meta d-flex mb-30">
										<p class="tags">
											<a href="${dto.url }" id="theater_homepage">${dto.url }</a>
										</p>
									</div>
										
									<p>공연장 수 - ${dto.totalno }</p>
									<br>
									<p>시설 특성 - ${dto.chartr }</p>
									<br>
									<p>개관 연도 - ${dto.opendate }</p>
									<br>
									<p>객석 수 - ${dto.totalseat }</p>
									<br>
									<p>전화번호 - ${dto.telno }</p>
									<br>
									<p>주소 - ${dto.location }</p>
									<br>
									
									<script type="text/javascript">
										lat = '${dto.lat }';
										lng = '${dto.lng }';
										id = '${dto.id }';
									</script>
								
									</c:forEach>
							</c:otherwise> 
						</c:choose>

						<div id="googleMap" style="width: 100%; height: 400px;"></div>
						<br>
						
						<button type="button" onclick="location.href='<%=request.getContextPath() %>/theater/map?lat=${list[0].lat }&lng=${list[0].lng }'">극장까지 가는 길 찾기</button>
						
						<br>
						<p style="font-weight: bold; font-size: x-large;">이 극장에서 상영중인
							작품들</p>

						<div class="img_container" id="poster_img"
							style="width: 700px; height: auto;">
							<p style="font-weight: bold; font-size: large; color: red;">
								상영중인 작품이 없습니다.</p>
						</div>
					</div>
				</div>


				<!-- ##### google map ##### -->
				<div id="googleMap" style="width: 100%; height: 400px;"></div>


				<!-- ##### Import google map ##### -->
				<script
					src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAz5nIT_54PG7ke2yMKUiqwKR86mVMwJgk&callback=initMap"></script>

			</div>
		</div>
	</section>

	<jsp:include page="/resources/jsp/footer.jsp"></jsp:include>

</body>

</html>
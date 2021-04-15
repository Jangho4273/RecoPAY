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

<script>
	$('#myModal').on('shown.bs.modal', function() {
		$('#myInput').trigger('focus')
	})
</script>


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

				<div style="width: 100%; margin-bottom: 70px">
					<ul class="list-group list-group-horizontal">
						<li
							class="list-group-item d-flex justify-content-between align-items-center">
							모든 이벤트 보기 <span class="badge rounded-pill bg-warning text-dark">16</span>
						</li>
						<li
							class="list-group-item d-flex justify-content-between align-items-center">
							진행중인 이벤트 <span class="badge rounded-pill bg-warning text-dark">6</span>
						</li>
						<li
							class="list-group-item d-flex justify-content-between align-items-center">
							종료된 이벤트 <span class="badge rounded-pill bg-warning text-dark">10</span>
						</li>
					</ul>
				</div>
				<br>
				<br>


				<c:choose>
					<c:when test="${empty list || fn:length(list) == 0 }">
						<script>
							alert('DB 배치파일 먼저 돌리고 하셈');
						</script>
					</c:when>
					<c:otherwise>
						<c:forEach var="dto" items="${list }" varStatus="vs">

							<div class="card" style="width: 18rem;">
								<img src="${dto.img }" class="card-img-top" alt="...">
								<div class="card-body">



									<h5 class="card-title">${dto.title }
										&nbsp;
										<c:if test="${dto.remainfromtoday < 0}">
											<span class="badge rounded-pill bg-danger">종료된 이벤트</span>
										</c:if>
										<c:if test="${dto.remainfromtoday > -1}">
											<span class="badge rounded-pill bg-warning text-dark">
												${dto.remainfromtoday }일 남음!!</span>
										</c:if>
									</h5>

									<p class="card-text">
										${dto.startdate } ~ ${dto.enddate } <br> ${dto.contents }
									</p>
									<div class="progress">
										<div class="progress-bar progress-bar-striped bg-warning"
											role="progressbar" style="width: ${dto.percentage}%"
											aria-valuenow="75" aria-valuemin="0" aria-valuemax="100">

											<c:if test="${dto.percentage > 100}">
												종료된 이벤트
											</c:if>
											<c:if test="${dto.percentage <= 100}">
												${dto.percentage}%
											</c:if>

										</div>
									</div>
									<br> <br>

									<!-- Button trigger modal -->
									<button type="button" class="btn btn-primary"
										data-toggle="modal" data-target="#exampleModal">이벤트
										보기</button>

									<!-- Modal -->
									<div class="modal fade" id="exampleModal" tabindex="-1"
										role="dialog" aria-labelledby="exampleModalLabel"
										aria-hidden="true">
										<div class="modal-dialog modal-dialog-centered"
											role="document">
											<div class="modal-content">
												<div class="modal-header">
													<h5 class="modal-title" id="exampleModalLabel">${dto.title }</h5>
													<button type="button" class="close" data-dismiss="modal"
														aria-label="Close">
														<span aria-hidden="true">&times;</span>
													</button>
												</div>
												<div class="modal-body">
													${dto.contents } <br>준비중입니다. 준비중입니다. 준비중입니다. 준비중입니다.
													준비중입니다. 준비중입니다. 준비중입니다. 준비중입니다. 준비중입니다. 준비중입니다. 준비중입니다.
												</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-secondary"
														data-dismiss="modal">닫기</button>
													<button type="button" class="btn btn-primary">쿠폰
														받기</button>
												</div>
											</div>
										</div>
									</div>

									<!-- Modal 끝 -->
								</div>
							</div>

						</c:forEach>
					</c:otherwise>
				</c:choose>
				<br> <br> <br>



				<jsp:include page="/resources/jsp/footer.jsp"></jsp:include>
			</div>
		</div>
	</section>

</body>

</html>
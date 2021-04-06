<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Title -->
    <title>Schedule</title>

    <!-- Favicon -->
    <link rel="icon" href="<%=request.getContextPath() %>/resources/img/core-img/favicon.ico">

    <!-- Stylesheet -->
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/style.css">
    
    
	<link rel="stylesheet" type="text/css" href="https://uicdn.toast.com/tui.time-picker/latest/tui-time-picker.css">
	<link rel="stylesheet" type="text/css" href="https://uicdn.toast.com/tui.date-picker/latest/tui-date-picker.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/calender/dist/tui-calendar.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/calender/css/default.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/calender/css/icons.css">

</head>

<body>

	<jsp:include page="/resources/jsp/header.jsp"></jsp:include>
	
    <!-- ##### Breadcumb Area Start ##### -->
    <section class="breadcumb-area bg-img bg-overlay" style="background-image: url(<%=request.getContextPath() %>/resources/img/bg-img/breadcumb.jpg);">
        <div class="bradcumbContent">
            <p>무엇을 볼 것이냐?</p>
            <h2>연 극 일 정</h2>
        </div>
    </section>
    <!-- ##### Breadcumb Area End ##### -->

    <!-- ##### Contact Area Start ##### -->
    <section class="contact-area section-padding-100-0">
        <div class="container">
            <div class="row">

                <div class="col-12 col-lg-3">
                    <div class="contact-content mb-100">
                        <!-- Title -->
                        <div class="contact-title mb-50">
                            <h5>Reservation</h5>
                        </div>

                        <!-- Single Contact Info -->
                        <div class="single-contact-info d-flex align-items-center">
                            <div class="icon mr-30">
                                <span class="icon-placeholder"></span>
                            </div>
                            <p><a href="<%=request.getContextPath() %>/reservation/schedule">연극 일정</a></p>
                        </div>

                        <!-- Single Contact Info -->
                        <div class="single-contact-info d-flex align-items-center">
                            <div class="icon mr-30">
                                <span class="icon-smartphone"></span>
                            </div>
                            <p><a href="<%=request.getContextPath() %>/reservation/select">연극 예매</a></p>
                        </div>

                        <!-- Single Contact Info -->
                        <div class="single-contact-info d-flex align-items-center">
                            <div class="icon mr-30">
                                <span class="icon-mail"></span>
                            </div>
                            <p><a href="<%=request.getContextPath() %>/reservation/ticketCheck">예매 확인 및 취소</a></p>
                        </div>

                    </div>
                </div>

                <div class="col-12 col-lg-9">
                    <!-- ##### Google Maps ##### -->
                    <div class="map-area mb-100">
						<div class="code-html">
							<div id="menu">
								<span id="menu-navi">
									<button type="button" class="btn btn-default btn-sm move-today"
										data-action="move-today">Today</button>
									<button type="button" class="btn btn-default btn-sm move-day"
										data-action="move-prev">
										<i class="calendar-icon ic-arrow-line-left"
											data-action="move-prev"></i>
									</button>
									<button type="button" class="btn btn-default btn-sm move-day"
										data-action="move-next">
										<i class="calendar-icon ic-arrow-line-right"
											data-action="move-next"></i>
									</button>
								</span> <span id="renderRange" class="render-range"></span>
							</div>

							<div id="calendar" style="position: relative;"></div>
						</div>

						<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
							integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
							crossorigin="anonymous"></script>
						<script
							src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
						<script
							src="https://uicdn.toast.com/tui.code-snippet/v1.5.2/tui-code-snippet.min.js"></script>
						<script
							src="https://uicdn.toast.com/tui.time-picker/v2.0.3/tui-time-picker.min.js"></script>
						<script
							src="https://uicdn.toast.com/tui.date-picker/v4.0.3/tui-date-picker.min.js"></script>
						<script
							src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.20.1/moment.min.js"></script>
						<script
							src="https://cdnjs.cloudflare.com/ajax/libs/chance/1.0.13/chance.min.js"></script>
						<script
							src="<%=request.getContextPath()%>/resources/calender/dist/tui-calendar.js"></script>
						<script
							src="<%=request.getContextPath()%>/resources/calender/js/data/calendars.js"></script>
						<%-- <script src="<%=request.getContextPath() %>/resources/calender/js/data/schedules.js"></script> --%>
						<script type="text/javascript" class="code-js">
							var cal = new tui.Calendar('#calendar', {
								defaultView : 'month' // monthly view option
							});
						</script>
						<script
							src="<%=request.getContextPath()%>/resources/calender/js/default.js"></script>
					</div>
                </div>

            </div>
        </div>
    </section>
    <!-- ##### Contact Area End ##### -->



	<jsp:include page="/resources/jsp/footer.jsp"></jsp:include>
	


</body>

</html>
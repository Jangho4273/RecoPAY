<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<title>One Music - Modern Music HTML5 Template</title>

<!-- Favicon -->
<link rel="icon" href="img/core-img/favicon.ico">

<!-- Stylesheet -->
<link rel="stylesheet" href="resources/style.css">

</head>
<!-- ##### Import ajax ##### -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	

<!-- ##### load openAPI ##### -->
<script>
	var api_key = "65a3a046ab4f4404a3af78bc321ccf5e";
	var mt10id = "FC001247";
	var eddate = getFormatDate(new Date());
	var test = "예술의전당";
	
	$(document)
			.ready(
					function() {
						
						var url = "http://www.kopis.or.kr/openApi/restful/prfplc/"
							+ mt10id + "?service=" + api_key;

						// 공연시설목록
						$.ajax({
							url : url,
							type : "GET",
							cache : false,
							success : function(data, status, xhr) {
								//alert(xhr.status);
								if (status == "success") {
									parseXML(data);
								} else {
									alert('openAPI loading 실패 - 문의해주세요.');
								}

							}
						});
					});
	
	function getPlayListXML() {
		
		
		// prfstate=01 -> 공연중
		var play_url = "http://www.kopis.or.kr/openApi/restful/pblprfr?service=" +
				api_key + "&stdate=20180101&eddate="+ eddate +"&cpage=10&rows=30&prfstate=01";
		
		var ppp = "http://www.kopis.or.kr/openApi/restful/pblprfr?service=65a3a046ab4f4404a3af78bc321ccf5e&stdate=20180101&eddate=20210501&cpage=10&rows=30&prfstate=01";
		
		
		$.ajax({
			url : ppp,
			type : "GET",
			cache : false,
			success : function(data, status, xhr) {
				if (status == "success") {
					parsePlayListXML(data);
				} else {
					alert('openAPI loading 실패 - 문의해주세요.');
				}
			}
		});
	}
	
	function parsePlayListXML(xmlDOM) {
			var img_url = "";
			var img = "";
			$(xmlDOM).find("db").each( function() {
					if($(this).find("fcltynm").text().trim() == test.trim()) { 
						img_url = $(this).find("poster").text();
						if(img_url == "") {
							// poster image가 없을 때 처리 
						} else {
							img += "<img src='" + img_url + "' style='width: 310px; height: 500px; max-height: 600px; margin-right:30px; margin-bottom:35px'>";
							document.getElementById("poster_img").innerHTML = img;
							img_url = "";
						}
					}
				});
	}
	

	function parseXML(xmlDOM) {

		$(xmlDOM).find("db").each(
				function() {
					
					$("#theater_name").html("극장명 : " + $(this).find("fcltynm").text());
					
					var hompage_url = $(this).find("relateurl").text();

					if (hompage_url == "") {
						$("#theater_homepage").html("● 홈페이지 제공 안함");
					} else {
						$("#theater_homepage").html("▷ " + hompage_url);
						document.getElementById("theater_homepage")
								.setAttribute("href", hompage_url);
					}

					$("#theater_num").html(
							"공연장 수 : " + $(this).find("mt13cnt").text());
					$("#theater_feature").html(
							"시설 특성 : " + $(this).find("fcltychartr").text());
					$("#theater_openyear").html(
							"개관 연도 : " + $(this).find("opende").text());
					$("#theater_seat_num").html(
							"객석 수 : " + $(this).find("seatscale").text());
					$("#theater_phone").html(
							"전화번호 : " + $(this).find("telno").text());
					$("#theater_addr").html(
							"주소 : " + $(this).find("adres").text());
					setMap($(this).find("la").text(),$(this).find("lo").text());
					
					getPlayListXML();
				});
	}
	
	// google map 초기화
	function initMap() {
		var mapProp = {
			center : new google.maps.LatLng(37.499558, 127.035861),
			zoom : 17
		}
		var map = new google.maps.Map(document.getElementById("googleMap"),mapProp);
	}
	
	
	function setMap(lat,lng) {
		
		var mapProp = {
				center : new google.maps.LatLng(lat, lng),
				zoom : 16
			}
		
		var map = new google.maps.Map(document.getElementById("googleMap"),mapProp);
		
		var marker = new google.maps.Marker({
			position: new google.maps.LatLng(lat, lng),
			map: map,
			animation: google.maps.Animation.BOUNCE
		});
	}
	
	function getFormatDate(date){
	    var year = date.getFullYear();             
	    var month = (1 + date.getMonth());          
	    month = month >= 10 ? month : '0' + month;  
	    var day = date.getDate();                   
	    day = day >= 10 ? day : '0' + day;          
	    return  year + '' + month + '' + day;     
	}


</script>


<body>
	<!-- Preloader -->
	<div class="preloader d-flex align-items-center justify-content-center">
		<div class="lds-ellipsis">
			<div></div>
			<div></div>
			<div></div>
			<div></div>
		</div>
	</div>

	<!-- ##### Header Area Start ##### -->
	<header class="header-area">
		<!-- Navbar Area -->
		<div class="oneMusic-main-menu">
			<div class="classy-nav-container breakpoint-off">
				<div class="container">
					<!-- Menu -->
					<nav class="classy-navbar justify-content-between" id="oneMusicNav">

						<!-- Nav brand -->
						<a href="index" class="nav-brand"><img
							src="img/core-img/logo.png" alt=""></a>

						<!-- Navbar Toggler -->
						<div class="classy-navbar-toggler">
							<span class="navbarToggler"><span></span><span></span><span></span></span>
						</div>

						<!-- Menu -->
						<div class="classy-menu">

							<!-- Close Button -->
							<div class="classycloseIcon">
								<div class="cross-wrap">
									<span class="top"></span><span class="bottom"></span>
								</div>
							</div>

							<!-- Nav Start -->
							<div class="classynav">
								<ul>
									<li><a href="index">Home</a></li>
									<li><a href="albums-store">Albums</a></li>
									<li><a href="#">Pages</a>
										<ul class="dropdown">
											<li><a href="index">Home</a></li>
											<li><a href="albums-store">Albums</a></li>
											<li><a href="event">Events</a></li>
											<li><a href="blog">News</a></li>
											<li><a href="contact">Contact</a></li>
											<li><a href="elements">Elements</a></li>
											<li><a href="login">Login</a></li>
											<li><a href="#">Dropdown</a>
												<ul class="dropdown">
													<li><a href="#">Even Dropdown</a></li>
													<li><a href="#">Even Dropdown</a></li>
													<li><a href="#">Even Dropdown</a></li>
													<li><a href="#">Even Dropdown</a>
														<ul class="dropdown">
															<li><a href="#">Deeply Dropdown</a></li>
															<li><a href="#">Deeply Dropdown</a></li>
															<li><a href="#">Deeply Dropdown</a></li>
															<li><a href="#">Deeply Dropdown</a></li>
															<li><a href="#">Deeply Dropdown</a></li>
														</ul></li>
													<li><a href="#">Even Dropdown</a></li>
												</ul></li>
										</ul></li>
									<li><a href="event">Events</a></li>
									<li><a href="blog">News</a></li>
									<li><a href="contact">Contact</a></li>
								</ul>

								<!-- Login/Register & Cart Button -->
								<div
									class="login-register-cart-button d-flex align-items-center">
									<!-- Login/Register -->
									<div class="login-register-btn mr-50">
										<a href="login" id="loginBtn">Login / Register</a>
									</div>

									<!-- Cart Button -->
									<div class="cart-btn">
										<p>
											<span class="icon-shopping-cart"></span> <span
												class="quantity">1</span>
										</p>
									</div>
								</div>
							</div>
							<!-- Nav End -->

						</div>
					</nav>
				</div>
			</div>
		</div>
	</header>
	<!-- ##### Header Area End ##### -->

	<!-- ##### Breadcumb Area Start ##### -->
	<div class="breadcumb-area bg-img bg-overlay"
		style="background-image: url(img/bg-img/breadcumb2.jpg);"></div>
	<!-- ##### Breadcumb Area End ##### -->

	<section class="elements-area mt-30 section-padding-100-0">
		<div class="container">
			<div class="row">


				<!-- ##### test output ##### -->

				<!-- Single Post Start -->
				<div class="single-blog-post mb-100 wow fadeInUp"
					data-wow-delay="100ms">

					<!-- Blog Content -->
					<div class="blog-content" style="width: 750px;">
						<!-- Post Title -->
						<a href="#" class="post-title" id="theater_name"> </a>
						<!-- Post Meta -->
						<div class="post-meta d-flex mb-30">
							<p class="tags">
								<a href="" id="theater_homepage"></a>
							</p>
						</div>
						<p id="theater_num">공연장 수</p>
						<br>
						<p id="theater_feature">시설 특성</p>
						<br>
						<p id="theater_openyear">개관 연도</p>
						<br>
						<p id="theater_seat_num">객석 수</p>
						<br>
						<p id="theater_phone">전화번호</p>
						<br>
						<p id="theater_addr">주소</p>
						<br>

						<div id="googleMap" style="width: 100%; height: 400px;"></div>
						<br><br>
						<p style="font-weight:bold; font-size: x-large;"> 이 극장에서 상영중인 작품들</p>
						<!--  @@@@ -->
						<div class="img_container" id="poster_img" style="width: 700px; height: auto;">
							<img id="poster_img" style="width: 310px; height: 500px; max-height: 600px; margin-right:30px; margin-bottom:35px">
						</div>
					</div>
				</div>


				<!-- ##### google map ##### -->
				<div id="googleMap" style="width: 100%; height: 400px;"></div>


				<!-- ##### Import google map ##### -->
				<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAz5nIT_54PG7ke2yMKUiqwKR86mVMwJgk&callback=initMap"></script>
				
			</div>
		</div>
	</section>

	<!-- ##### Footer Area Start ##### -->
	<footer class="footer-area">
		<div class="container">
			<div class="row d-flex flex-wrap align-items-center">
				<div class="col-12 col-md-6">
					<a href="#"><img src="img/core-img/logo.png" alt=""></a>
					<p class="copywrite-text">
						<a href="#"> <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
							Copyright &copy;<script>
								document.write(new Date().getFullYear());
							</script> All rights reserved | This template is made with <i
							class="fa fa-heart-o" aria-hidden="true"></i> by <a
							href="https://colorlib.com" target="_blank">Colorlib</a> <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
					</p>
				</div>

				<div class="col-12 col-md-6">
					<div class="footer-nav">
						<ul>
							<li><a href="#">Home</a></li>
							<li><a href="#">Albums</a></li>
							<li><a href="#">Events</a></li>
							<li><a href="#">News</a></li>
							<li><a href="#">Contact</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</footer>
	<!-- ##### Footer Area Start ##### -->

	<!-- ##### All Javascript Script ##### -->
	<!-- jQuery-2.2.4 js -->
	<script src="js/jquery/jquery-2.2.4.min.js"></script>
	<!-- Popper js -->
	<script src="js/bootstrap/popper.min.js"></script>
	<!-- Bootstrap js -->
	<script src="js/bootstrap/bootstrap.min.js"></script>
	<!-- All Plugins js -->
	<script src="js/plugins/plugins.js"></script>
	<!-- Active js -->
	<script src="js/active.js"></script>
</body>

</html>
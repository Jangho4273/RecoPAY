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
    <title>Reservation</title>

    <!-- Favicon -->
    <link rel="icon" href="<%=request.getContextPath() %>/resources/img/core-img/favicon.ico">

    <!-- Stylesheet -->
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/style.css">

</head>

<body>

	<jsp:include page="/resources/jsp/header.jsp"></jsp:include>
	
    <!-- ##### HEADER 공간 ##### -->
    <section class="breadcumb-area bg-img bg-overlay" style="background-image: url(<%=request.getContextPath() %>/resources/img/bg-img/breadcumb.jpg);">
        <div class="bradcumbContent">
            <p>예매하시겠습니까 고갱님?</p>
            <h2>예매</h2>
        </div>
    </section>
    <!-- ##### HEADER 공간 ##### -->
    
    <!-- ##### WHAT'S NEW 슬라이드 ##### -->
    <section class="latest-albums-area section-padding-100">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="section-heading style-2">
                        <h2>WHAT'S NEW</h2>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-12">
                    <div class="albums-slideshow owl-carousel">
                        <!-- Single Album -->
                        <div class="single-album">
                            <img src="img/bg-img/a1.jpg" alt="">
                            <div class="album-info">
                                <a href="#">
                                    <h5>The Cure</h5>
                                </a>
                                <p>Second Song</p>
                            </div>
                        </div>

                        <!-- Single Album -->
                        <div class="single-album">
                            <img src="img/bg-img/a2.jpg" alt="">
                            <div class="album-info">
                                <a href="#">
                                    <h5>Sam Smith</h5>
                                </a>
                                <p>Underground</p>
                            </div>
                        </div>

                        <!-- Single Album -->
                        <div class="single-album">
                            <img src="img/bg-img/a3.jpg" alt="">
                            <div class="album-info">
                                <a href="#">
                                    <h5>Will I am</h5>
                                </a>
                                <p>First</p>
                            </div>
                        </div>

                        <!-- Single Album -->
                        <div class="single-album">
                            <img src="img/bg-img/a4.jpg" alt="">
                            <div class="album-info">
                                <a href="#">
                                    <h5>The Cure</h5>
                                </a>
                                <p>Second Song</p>
                            </div>
                        </div>

                        <!-- Single Album -->
                        <div class="single-album">
                            <img src="img/bg-img/a5.jpg" alt="">
                            <div class="album-info">
                                <a href="#">
                                    <h5>DJ SMITH</h5>
                                </a>
                                <p>The Album</p>
                            </div>
                        </div>

                        <!-- Single Album -->
                        <div class="single-album">
                            <img src="img/bg-img/a6.jpg" alt="">
                            <div class="album-info">
                                <a href="#">
                                    <h5>The Ustopable</h5>
                                </a>
                                <p>Unplugged</p>
                            </div>
                        </div>

                        <!-- Single Album -->
                        <div class="single-album">
                            <img src="img/bg-img/a7.jpg" alt="">
                            <div class="album-info">
                                <a href="#">
                                    <h5>Beyonce</h5>
                                </a>
                                <p>Songs</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- ##### WHAT'S NEW 슬라이드 ##### -->
    
    <!-- ##### 연극 목록 ##### -->
    <section class="contact-area section-padding-100-0">
	    <!-- ##### Buy Now Area Start ##### -->
	    <section class="oneMusic-buy-now-area has-fluid bg-gray section-padding-100">
	        <div class="container-fluid">
	            <div class="row">
	                <div class="col-12">
	                    <div class="section-heading style-2">
	                        <h2>RECOPAY'S PICK</h2>
	                    </div>
	                </div>
	            </div>
	
	            <div class="row">
	
	                <!-- Single Album Area -->
	                <div class="col-12 col-sm-6 col-md-4 col-lg-2">
	                    <div class="single-album-area wow fadeInUp" data-wow-delay="100ms">
	                        <div class="album-thumb">
	                            <img src="<%=request.getContextPath() %>/img/bg-img/b1.jpg" alt="">
	                            <!-- Album Price -->
	                            <div class="album-price">
	                                <p>$0.90</p>
	                            </div>
	                            <!-- Play Icon -->
	                            <div class="play-icon">
	                                <a href="#" class="video--play--btn"><span class="icon-play-button"></span></a>
	                            </div>
	                        </div>
	                        <div class="album-info">
	                            <a href="#">
	                                <h5>Garage Band</h5>
	                            </a>
	                            <p>Radio Station</p>
	                        </div>
	                    </div>
	                </div>
	
	                <!-- Single Album Area -->
	                <div class="col-12 col-sm-6 col-md-4 col-lg-2">
	                    <div class="single-album-area wow fadeInUp" data-wow-delay="200ms">
	                        <div class="album-thumb">
	                            <img src="img/bg-img/b2.jpg" alt="">
	                        </div>
	                        <div class="album-info">
	                            <a href="#">
	                                <h5>Noises</h5>
	                            </a>
	                            <p>Buble Gum</p>
	                        </div>
	                    </div>
	                </div>
	
	                <!-- Single Album Area -->
	                <div class="col-12 col-sm-6 col-md-4 col-lg-2">
	                    <div class="single-album-area wow fadeInUp" data-wow-delay="300ms">
	                        <div class="album-thumb">
	                            <img src="img/bg-img/b3.jpg" alt="">
	                        </div>
	                        <div class="album-info">
	                            <a href="#">
	                                <h5>Jess Parker</h5>
	                            </a>
	                            <p>The Album</p>
	                        </div>
	                    </div>
	                </div>
	
	                <!-- Single Album Area -->
	                <div class="col-12 col-sm-6 col-md-4 col-lg-2">
	                    <div class="single-album-area wow fadeInUp" data-wow-delay="400ms">
	                        <div class="album-thumb">
	                            <img src="img/bg-img/b4.jpg" alt="">
	                        </div>
	                        <div class="album-info">
	                            <a href="#">
	                                <h5>Noises</h5>
	                            </a>
	                            <p>Buble Gum</p>
	                        </div>
	                    </div>
	                </div>
	
	                <!-- Single Album Area -->
	                <div class="col-12 col-sm-6 col-md-4 col-lg-2">
	                    <div class="single-album-area wow fadeInUp" data-wow-delay="500ms">
	                        <div class="album-thumb">
	                            <img src="img/bg-img/b1.jpg" alt="">
	                            <!-- Album Price -->
	                            <div class="album-price">
	                                <p>$0.90</p>
	                            </div>
	                            <!-- Play Icon -->
	                            <div class="play-icon">
	                                <a href="#" class="video--play--btn"><span class="icon-play-button"></span></a>
	                            </div>
	                        </div>
	                        <div class="album-info">
	                            <a href="#">
	                                <h5>Garage Band</h5>
	                            </a>
	                            <p>Radio Station</p>
	                        </div>
	                    </div>
	                </div>
	
	                <!-- Single Album Area -->
	                <div class="col-12 col-sm-6 col-md-4 col-lg-2">
	                    <div class="single-album-area wow fadeInUp" data-wow-delay="600ms">
	                        <div class="album-thumb">
	                            <img src="img/bg-img/b2.jpg" alt="">
	                        </div>
	                        <div class="album-info">
	                            <a href="#">
	                                <h5>Noises</h5>
	                            </a>
	                            <p>Buble Gum</p>
	                        </div>
	                    </div>
	                </div>
	
	                <!-- Single Album Area -->
	                <div class="col-12 col-sm-6 col-md-4 col-lg-2">
	                    <div class="single-album-area wow fadeInUp" data-wow-delay="100ms">
	                        <div class="album-thumb">
	                            <img src="img/bg-img/b3.jpg" alt="">
	                        </div>
	                        <div class="album-info">
	                            <a href="#">
	                                <h5>Jess Parker</h5>
	                            </a>
	                            <p>The Album</p>
	                        </div>
	                    </div>
	                </div>
	
	                <!-- Single Album Area -->
	                <div class="col-12 col-sm-6 col-md-4 col-lg-2">
	                    <div class="single-album-area wow fadeInUp" data-wow-delay="200ms">
	                        <div class="album-thumb">
	                            <img src="img/bg-img/b4.jpg" alt="">
	                        </div>
	                        <div class="album-info">
	                            <a href="#">
	                                <h5>Noises</h5>
	                            </a>
	                            <p>Buble Gum</p>
	                        </div>
	                    </div>
	                </div>
	
	                <!-- Single Album Area -->
	                <div class="col-12 col-sm-6 col-md-4 col-lg-2">
	                    <div class="single-album-area wow fadeInUp" data-wow-delay="300ms">
	                        <div class="album-thumb">
	                            <img src="img/bg-img/b1.jpg" alt="">
	                            <!-- Album Price -->
	                            <div class="album-price">
	                                <p>$0.90</p>
	                            </div>
	                            <!-- Play Icon -->
	                            <div class="play-icon">
	                                <a href="#" class="video--play--btn"><span class="icon-play-button"></span></a>
	                            </div>
	                        </div>
	                        <div class="album-info">
	                            <a href="#">
	                                <h5>Garage Band</h5>
	                            </a>
	                            <p>Radio Station</p>
	                        </div>
	                    </div>
	                </div>
	
	                <!-- Single Album Area -->
	                <div class="col-12 col-sm-6 col-md-4 col-lg-2">
	                    <div class="single-album-area wow fadeInUp" data-wow-delay="400ms">
	                        <div class="album-thumb">
	                            <img src="img/bg-img/b2.jpg" alt="">
	                        </div>
	                        <div class="album-info">
	                            <a href="#">
	                                <h5>Noises</h5>
	                            </a>
	                            <p>Buble Gum</p>
	                        </div>
	                    </div>
	                </div>
	
	                <!-- Single Album Area -->
	                <div class="col-12 col-sm-6 col-md-4 col-lg-2">
	                    <div class="single-album-area wow fadeInUp" data-wow-delay="500ms">
	                        <div class="album-thumb">
	                            <img src="img/bg-img/b3.jpg" alt="">
	                        </div>
	                        <div class="album-info">
	                            <a href="#">
	                                <h5>Jess Parker</h5>
	                            </a>
	                            <p>The Album</p>
	                        </div>
	                    </div>
	                </div>
	
	                <!-- Single Album Area -->
	                <div class="col-12 col-sm-6 col-md-4 col-lg-2">
	                    <div class="single-album-area wow fadeInUp" data-wow-delay="600ms">
	                        <div class="album-thumb">
	                            <img src="img/bg-img/b4.jpg" alt="">
	                        </div>
	                        <div class="album-info">
	                            <a href="#">
	                                <h5>Noises</h5>
	                            </a>
	                            <p>Buble Gum</p>
	                        </div>
	                    </div>
	                </div>
	
	            </div>
	
	            <div class="row">
	                <div class="col-12">
	                    <div class="load-more-btn text-center wow fadeInUp" data-wow-delay="300ms">
	                        <a href="#" class="btn oneMusic-btn">Load More <i class="fa fa-angle-double-right"></i></a>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </section>
	    <!-- ##### Buy Now Area End ##### -->

    </section>
    <!-- ##### 연극목록 ##### -->


	<jsp:include page="/resources/jsp/footer.jsp"></jsp:include>
	

</body>

</html>
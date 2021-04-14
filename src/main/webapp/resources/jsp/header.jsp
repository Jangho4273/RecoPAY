<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Header</title>
</head>
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
                        <a href="<%=request.getContextPath() %>/index" class="nav-brand"><img src="<%=request.getContextPath() %>/resources/img/core-img/logo.png" alt=""></a>

                        <!-- Navbar Toggler -->
                        <div class="classy-navbar-toggler">
                            <span class="navbarToggler"><span></span><span></span><span></span></span>
                        </div>

                        <!-- Menu -->
                        <div class="classy-menu">

                            <!-- Close Button -->
                            <div class="classycloseIcon">
                                <div class="cross-wrap"><span class="top"></span><span class="bottom"></span></div>
                            </div>

                            <!-- Nav Start -->
                            <div class="classynav">
                                <ul>
                                    <li><a href="<%=request.getContextPath() %>/index">Home</a></li>
                                    <li><a href="<%=request.getContextPath() %>/perform">연극</a>
                                    	<ul class="dropdown">
                                    		<li><a href="<%=request.getContextPath() %>/perform/intro">연극소개</a></li>
                                    		<li><a href="">장르</a></li>
                                    		<li><a href="">후기</a></li>
                                    	</ul>
                                    </li>
                                    <li><a href="schedule">예매</a>
                                    	<ul class="dropdown">
                                    		<li><a href="<%=request.getContextPath() %>/reservation/schedule">연극 일정</a></li>
                                    		<li><a href="<%=request.getContextPath() %>/reservation/select">연극 예매</a></li>
                                    		<li><a href="<%=request.getContextPath() %>/reservation/ticketCheck">예매 확인 및 취소</a></li>
                                    	</ul>
                                    </li>
                                    <li><a href="theater">극장</a>
                                   		<ul class="dropdown">
                                    		<li><a href="<%=request.getContextPath() %>/theater/list">공연장 정보</a></li>
                                    		<li><a href="<%=request.getContextPath() %>/theater/map">오시는 길</a></li>
                                    	</ul>
                                    </li>
                                    <li><a href="contact">Event</a>
                                    	<ul class="dropdown">
                                    		<li><a href="<%=request.getContextPath() %>/event/list">이벤트</a></li>
                                    	</ul>
                                    </li>
                                    <li><a href="contact">고객센터</a>
                                    	<ul class="dropdown">
                                    		<li><a href="">공지사항</a></li>
                                    		<li><a href="">1:1문의</a></li>
                                    		<li><a href="">자주하는 질문</a></li>
                                    	</ul>
                                    </li>
                                    <li><a href="contact">소개</a>
                                    	<ul class="dropdown">
                                    		<li><a href="">인사말</a></li>
                                    		<li><a href="">조직도</a></li>
                                    		<li><a href="">RecoPAY 소개</a></li>
                                    	</ul>
                                    </li>
                                </ul>

                                <!-- Login/Register & Cart Button -->
                                <div class="login-register-cart-button d-flex align-items-center">
                                    <!-- Login/Register -->
                                    <div class="login-register-btn mr-50">
                                        <a href="login" id="loginBtn">Login / Register</a>
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

        
    
</body>
</html>
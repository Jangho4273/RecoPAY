<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<style>
#zzzz {

    width:100px;

    background-color: #f8585b;

    border: none;

    color:#fff;

    padding: 15px 0;

    text-align: center;

    text-decoration: none;

    display: inline-block;

    font-size: 15px;

    margin: 4px;

    cursor: pointer;

}



출처: https://nimolove.tistory.com/44 [Chaeni_vlog 🌈]
</style>
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
                                    		<li><a href="<%=request.getContextPath() %>/perform/genre">추천</a></li>
                                    		<li><a href="<%=request.getContextPath() %>/perform/rest">후기</a></li>
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
								
								<sec:authorize access="isAuthenticated()">
								<!-- Login/Register & Cart Button -->
                                <div class="login-register-cart-button d-flex align-items-center">
                                    <!-- Login/Register -->
                                    <div class="login-register-btn mr-50">
                                    	<sec:authentication property="principal.username" var="user_id" />
                                    	${user_id } 님, 환영합니다.
										<form action="${pageContext.request.contextPath }/login/logout" method='post'>
										<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>
										<button id="zzzz" class="">Logout</button>
                                        </form>
                                    </div>
                                </div>
                                </sec:authorize>
								
								
								
									
								
								<sec:authorize access="isAnonymous()">
                                <!-- Login/Register & Cart Button -->
                                <div class="login-register-cart-button d-flex align-items-center">
                                    <!-- Login/Register -->
                                    <div class="login-register-btn mr-50">
                                        <a href="<%=request.getContextPath() %>/login/login" id="loginBtn">Login / Register</a>
                                    </div>
                                </div>
                                </sec:authorize>
                               
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
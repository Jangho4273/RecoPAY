d<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Title -->
    <title>RecoPay</title>

    <!-- Favicon -->
    <link rel="icon" href="<%=request.getContextPath() %>/img/core-img/favicon.ico">

    <!-- Stylesheet -->
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/style.css">

</head>

	<script type="text/javascript">
	function checkValue()
    {
        if(!document.userInfo.username.value){
            alert("아이디를 입력하세요.");
            return false;
        }
        
        if(!document.userInfo.password.value){
            alert("비밀번호를 입력하세요.");
            return false;
        }
        
        
        // 비밀번호와 비밀번호 확인에 입력된 값이 동일한지 확인
        if(document.userInfo.password.value != document.userInfo.passwordCheck.value ){
            alert("비밀번호를 동일하게 입력하세요.");
            return false;
        }
        
        if(!document.userInfo.user_name.value){
            alert("이름을 입력하세요.");
            return false;
        }
    }

		})
	</script>

<body>
<jsp:include page="/resources/jsp/header.jsp"></jsp:include>
    <!-- ##### Header Area End ##### -->

    <!-- ##### Breadcumb Area Start ##### -->
    <section class="breadcumb-area bg-img bg-overlay" style="background-image: url(img/bg-img/breadcumb3.jpg);">
        <div class="bradcumbContent">
            <h2>Join</h2>
        </div>
    </section>
    <!-- ##### Breadcumb Area End ##### -->

    <!-- ##### Login Area Start ##### -->
    <section class="login-area section-padding-100">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-12 col-lg-8">
                    <div class="login-content">
                        <h3>Welcome</h3>
                        <!-- Login Form -->
                        <div class="login-form">
                        
                            <form role ="form" autocomplete="off" method="post" action="${pageContext.request.contextPath}/login/join" name="userInfo">
                                <div class="form-group">
                                    <label for="username">ID</label>
                                    <input type="text" name='username' class="form-control" id="username" placeholder="Enter ID">
                                </div>
                                <div class="form-group">
                                    <label for="password">Password</label>
                                    <input type="password" name='password' class="form-control" id="password" placeholder="Password">
                            	</div>
                                <div class="form-group">
                                    <label for="passwordCheck">Password 확인</label>
                                    <input type="password" name='passwordCheck' class="form-control" id="passwordCheck" placeholder="Password">
                                </div>
                                <div class="form-group">
                                    <label for="name">Name</label>
                                    <input type="text" name='name' class="form-control" id="name" placeholder="Name">
                                </div>
                                <div class="form-group">
                                    <label for="emailbf">E-mail</label>
                                    <input type="email" name='emailbf' class="form-control" id="emailbf" placeholder="Email">
                                   <!--  <select id='emailaf' class="form-control">
                                    	<option value="">----선택----</option>
                                    	<option value="@naver.com">naver.com</option>
                                    	<option value="@gmail.com">gmail.com</option>
                                    	<option value="@daum.net">daum.net</option>
                                    </select>
                                    <script>
                                    	$("#emailbf").val( $("#emailbf").val() + $("#emailaf").val() );
                                    </script>-->
                                </div>
                                <div class="form-group">
                                    <label for="addr">Address</label>
                                    <input type="text" name='addr' class="form-control" id="addr" placeholder="Address">
                                </div>
                                <div class="form-group">
                                    <label for="call">정보 수신 여부</label>
                                    <input type="text" name='call' class="form-control" id="call" placeholder="change!!!!">
                                </div>
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
                                <button type="submit" class="btn oneMusic-btn mt-30">Join</button><br><br>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- ##### Login Area End ##### -->

    <!-- ##### Footer Area Start ##### -->
   <jsp:include page="/resources/jsp/footer.jsp"></jsp:include>
    <!-- ##### Footer Area Start ##### -->


</body>

</html>
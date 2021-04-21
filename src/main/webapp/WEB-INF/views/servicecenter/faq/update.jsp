<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
  
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Title -->
    <title>공지사항</title>

    <!-- Favicon -->
    <link rel="icon" href="<%=request.getContextPath() %>/resources/img/core-img/favicon.ico">

    <!-- Stylesheet -->
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/style.css">

</head>
<script>
function chkSubmit(){
	frm = document.forms['frm'];
	
	var title = frm['title'].value.trim();

	if(subject == ""){
		alert("제목은 반드시 작성해야 합니다");
        frm["title"].focus();
        return false;
	}
	return true;
}
</script>
<body>

	<jsp:include page="/resources/jsp/header.jsp"></jsp:include>
	
    <!-- ##### Breadcumb Area Start ##### -->
    <section class="breadcumb-area bg-img bg-overlay" style="background-image: url(<%=request.getContextPath() %>/resources/img/bg-img/bg-2.jpg);">
        <div class="bradcumbContent">
            <p>공지사항</p>
            <h2>환영합니다</h2>
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
                            <h5>SERVICECENTER</h5>
                        </div>

                        <!-- Single Contact Info -->
                        <div class="single-contact-info d-flex align-items-center">
                            <div class="icon mr-30">
                                <span class="icon-placeholder"></span>
                            </div>
                            <p><a href="<%=request.getContextPath() %>/servicecenter/notice">공지사항</a></p>
                        </div>

                        <!-- Single Contact Info -->
                        <div class="single-contact-info d-flex align-items-center">
                            <div class="icon mr-30">
                                <span class="icon-smartphone"></span>
                            </div>
                            <p><a href="<%=request.getContextPath() %>/servicecenter/qna">1대1 문의</a></p>
                        </div>

                        <!-- Single Contact Info -->
                        <div class="single-contact-info d-flex align-items-center">
                            <div class="icon mr-30">
                                <span class="icon-mail"></span>
                            </div>
                            <p><a href="<%=request.getContextPath() %>/servicecenter/faq">자주 묻는 질문</a></p>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- ##### Contact Area End ##### -->

  <!-- 게시판 글쓰기 수정 영역 시작 -->
	<div class="container">
		<div class="row">
		<body>
		<h2>수정</h2>
		<form name="frm" action="updateOk" method="post" onsubmit="return chkSubmit()">
			<input type="hidden" name="F_uid" value="${list[0].f_uid }"/>
			작성자: ${list[0].name }<br> <%-- 작성자 이름은 변경 불가 --%>
			제목:
			<input type="text" name="title" value="${list[0].title }"/><br>
			내용:<br>
			<textarea name="content">${list[0].content }</textarea>
			<br><br>
			<input type="submit" value="수정"/>
		</form>
		<button onclick="history.back();">이전으로</button>
		<button onclick="location.href='notice'">목록보기</button>
		<br>
		</body>
			
			</form>
		</div>
	</div>
	<!-- 게시판 글쓰기 수정 영역 끝 -->
	
	<!-- 부트스트랩 참조 영역 -->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>

	<jsp:include page="/resources/jsp/footer.jsp"></jsp:include>
	

</body>

</html>
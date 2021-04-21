<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


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
function chkDelete(uid){
	// 삭제 여부, 다시 확인 하고 진행하기
	var r = confirm("삭제하시겠습니까?");
	if(r){
		location.href = 'deleteOk?uid=' + uid;
	}
}
</script>
<body>

	<jsp:include page="/resources/jsp/header.jsp"></jsp:include>
	
    <!-- ##### Breadcumb Area Start ##### -->
    <section class="breadcumb-area bg-img bg-overlay" style="background-image: url(<%=request.getContextPath() %>/resources/img/bg-img/bg-4.jpg);">
        <div class="bradcumbContent">
            <p>공지사항</p>
            <h2>환영합니다</h2>
        </div>
    </section>
    <!-- ##### Breadcumb Area End ##### -->

    <!-- ##### Contact Area Start ##### -->
    <section class="contact-area section-padding-100-0 mb-50">
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
                
                <div class="col-12 col-lg-9">
	                <table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<th colspan="2" style="background-color: #eeeeee; text-align: center;">게시판 답글 달기</th>
						</tr>
					</thead>
					
					UID : ${list[0].q_uid }<br>
					작성자 : ${list[0].name }<br>
					제목 : ${list[0].title }<br>
					등록일 : ${list[0].uploadtime }<br>
					조회수 : ${list[0].viewcnt }<br>
					내용: ${list[0].content }<br>
					<hr>
					
					<button onclick="location.href='update?uid=${list[0].q_uid}'">수정하기</button>
					<button onclick="location.href = 'qna'">목록보기</button>
					<button onclick="chkDelete(${list[0].q_uid})">삭제하기</button>
					<button onclick="location.href = 'write'">신규등록</button>

					</table>
					
					<c:forEach var="dto" items="${commentlist }" varStatus="vs">
					<p> 댓글 내용 : ${dto.content }  , 작성자(${dto.writer }) </p><br>
					</c:forEach>
					<a href="qna" class="btn btn-primary">목록</a>

					<form name="commentInsertForm" method="post"
						action="/recopay/comment/insert">
						<div class="input-group">
							<input type="hidden" name="${_csrf.parameterName }"
								value="${_csrf.token }" /> <input type="hidden" name="q_uid"
								value="<%=request.getAttribute("uid")%>" /> <input type="text"
								class="form-control" id="content" name="content"
								placeholder="내용을 입력하세요."> <span class="input-group-btn">
								<button class="btn btn-default" type="submit"
									name="commentInsertBtn">등록</button>
							</span>
						</div>
					</form>

					<div class="container">
						<div class="commentList"></div>
					</div>
					
						 
					<%@ include file="comment.jsp" %>

					<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
					<script src="js/bootstrap.js"></script>
				</div>
            </div>
        </div>
    </section>
    <!-- ##### Contact Area End ##### -->

<%-- 	<!-- 게시판 글 보기 양식 영역 시작 -->
	<div class="container">
		<div class="row">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th colspan="2" style="background-color: #eeeeee; text-align: center;">게시판 답글 달기</th>
					</tr>
				</thead>
				
				<body>
				
				UID : ${list[0].q_uid }<br>
				작성자 : ${list[0].name }<br>
				제목 : ${list[0].title }<br>
				등록일 : ${list[0].uploadtime }<br>
				조회수 : ${list[0].viewcnt }<br>
				내용: ${list[0].content }<br>
				<hr>
				<div>
				
</div>
	
<hr>
<br>
<button onclick="location.href='update?uid=${list[0].q_uid}'">수정하기</button>
<button onclick="location.href = 'qna'">목록보기</button>
<button onclick="chkDelete(${list[0].q_uid})">삭제하기</button>
<button onclick="location.href = 'write'">신규등록</button>

			</table>
			<c:forEach var="dto" items="${commentlist }" varStatus="vs">
				<p> 댓글 내용 : ${dto.content }  , 작성자(${dto.writer }) </p><br>
			</c:forEach>
			</body>
			<a href="qna" class="btn btn-primary">목록</a>
			
	
		</div>
	</div>
	<!-- 게시판 글 보기 양식 영역 끝 -->
	
<!--  댓글  -->
    <div class="container">
        <form name="commentInsertForm" method="post" action="/recopay/comment/insert">
            <div class="input-group">
            <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>
               <input type="hidden" name="q_uid" value="<%= request.getAttribute("uid") %>"/>
               <input type="text" class="form-control" id="content" name="content" placeholder="내용을 입력하세요.">
               <span class="input-group-btn">
                    <button class="btn btn-default" type="submit" name="commentInsertBtn">등록</button>
               </span>
              </div>
        </form>
    </div>
    
	    <div class="container">
	        <div class="commentList"></div>
	    </div>
	</div>
	 
<%@ include file="comment.jsp" %>	 
	 
	</script>	
	<!-- 부트스트랩 참조 영역 -->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script> --%>
</body>
</html>

	<jsp:include page="/resources/jsp/footer.jsp"></jsp:include>
	

</body>

</html>

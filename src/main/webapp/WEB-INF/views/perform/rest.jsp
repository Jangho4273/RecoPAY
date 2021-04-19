<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Title -->
    <title>board</title>

    <!-- Favicon -->
    <link rel="icon" href="img/core-img/favicon.ico">

    <!-- Stylesheet -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/style.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://kit.fontawesome.com/bb29575d31.js"></script>
	<script src="${pageContext.request.contextPath }/js/board.js?ver=1"></script>
	
	<script type="text/javascript">
	
		$(document).on('hidden.bs.modal', function (event) {
	
			if ($('.modal:visible').length) {
	
				$('body').addClass('modal-open');
	
			}
	
		});
	
	</script>
<style>
/* 기본 버튼 */

		/* 글 목록 */
#list table { width: 100%;}
#list table, #list th, #list td {
	border: 1px solid black;
	border-collapse: collapse;
}

#list td, #list th {
	padding: 10px;	
}

#list .subject:hover {   /* 글 제목 위에 커서 올린 경우 */
	text-decoration: underline;
	color : orange;
	cursor: pointer;
}

.clear1 {
	clear: both;
}

.left1 {
	float:left;
}

.right1 {
	float:right;
}

/* 하단 버튼 */
.d01 {
	margin : 5px 0px;
}

/* 페이징 */
.center {
    text-align: center;
}

ul.pagination{
	list-style-type:none
}

ul.pagination li{
    display: inline-block;
}

ul.pagination a {
    color: black;
    float: left;
    padding: 4px 8px;
    text-decoration: none;
    transition: background-color .3s;
    /* border: 1px solid #ddd; */
    /* margin: 0 4px; */
    margin: 0px;
}

ul.pagination a.active {
    background-color: #4CAF50;
    color: white;
    border: 1px solid #4CAF50;
}

ul.pagination a:hover:not(.active) {background-color: #ddd;}

/* 모달 팝업 */
.modal {   /* 모달 전체 적용 */	
	background-color: rgba(0, 0, 0, 0.4);
	width: 100%;
	height: 100%;
	position : fixed;
	top: 0;
	left: 0;
	z-index: 1;
	padding-top: 40px;  /* 내부여백  */
	overflow: auto;
	
	display : none;  /* 기본적으로 안보이기 */  
}

.modal .modal-content {
	background-color: #fefefe;  /* 배경은 흰색 */
	width: 80%;   /* 화면대비 80% */
	height: 70%;
	margin: 5% auto 15% auto;  /* 위에서 5%,  아래에서 15%, 좌우 중앙정렬 */
	border: 1px solid #888;  /* 테두리 */
}

.modal .container {
	padding: 16px;
	position: relative;  /* 이래야 안에 있는 absolute 들이 동작 */
} 

.modal .close {  /* close 버튼 */
	font-size: 35px;	
	font-weight: bold;
	color: #000;
	position: absolute;
	right: 25px;
	top: 0px;
}

.modal .close:hover,
.modal .cloas:focus {
	color: red;
	cursor: pointer;
}


.modal input[type=text] {
	width: 100%;
	border: 1px solid #ccc;
	margin: 8px 0;
	padding: 12px 20px;
	display: inline-block;
	box-sizing: border-box;
}

.modal textarea {
	width: 100%;
	border: 1px solid #ccc;
	
	/*padding: 12px 20px;
	display: inline-block;
	
	margin: 8px 0;
	*/
}

.modal .fullbtn {
	width: 100%;
	cursor: pointer;
}
	
	
</style>
</head>

<body>
	<jsp:include page="/resources/jsp/header.jsp"></jsp:include>
	 <!-- ##### Breadcumb Area Start ##### -->
    <section class="breadcumb-area bg-img bg-overlay" style="background-image: url(<%=request.getContextPath() %>/resources/img/bg-img/breadcumb.jpg);">
       
    </section>

    <!-- ##### Buy Now Area Start ##### -->
    <section class="oneMusic-buy-now-area has-fluid bg-gray section-padding-100">
        <div class="container-fluid">
            <div class="row">
                <div class="col-12">
                    <div class="section-heading style-2">
                        <p>아아아아아앙아아아아아아아아아아앙아</p>
                        <h2>후 기</h2>
                    </div>
                </div>
            </div>
			<h2>후기 게시판</h2>
			<%-- 글 목록 --%>
			<div id="list">
				<%-- header --%>
				<div class="d01">
					<div class="left1" id="pageinfo"></div>
					<div class="right1" id="pageRows"></div>
				</div>
				<div class="clear1"></div>
				
				<%-- 목록 --%>
				<form id="frmList" name="frmList">
					<table>
						<thead>
							<th>#</th>
							<th>UID</th>
							<th>제목</th>
							<th>작성자</th>
							<th>조회수</th>
							<th>작성일</th>
							<th>평점</th>
							<th>연극명</th>
						</thead>
						<tbody>
						
						</tbody>
					</table>
				</form>
				
				<%-- bottom --%>
				<div class="d01">
					<div class="left1">
						<button type="button" id="btnDel" class="btn danger">글삭제</button>
					</div>
					<div class="right1">
						<button type="button" id="btnWrite" class="btn success">글작성</button>
					</div>
				</div>
        	</div>
        	
        	<div class="clear1"></div>

			<%-- 페이징 --%>
			<div class="center">
				<ul class="pagination" id="pagination" style="width:300px; margin:0 auto;"></ul>
			</div>
			
			<%--글 작성/보기/수정 대화상자 --%>
			<div id="dlg_write" class="modal">
				<form class="modal-content animate" id="frmWrite" name="frmWrite" method="post">
					<div class="container">
						<h3 class="title">새글 작성</h3>
						
						<span id="clo" class="close" title="Close Modal">&times;</span>
						
						<input type="hidden" name="uid" value="0"> <%-- 삭제나 수정을 위해 필요 --%>
					
						<div class="d01 btn_group_header">
							<div class="left1">
								<p id="viewcnt"></p>
							</div>
							<div class="right1">
								<p id="regdate"></p>
							</div>
							<div class="clear1"></div>
						</div>
						
						<label for="subject"><b>글제목</b></label>
						<input type="text" placeholder="글제목(필수)" name="subject" required>
					
						<sec:authentication property="principal.username" var="user_id" />
						<input type="hidden" name="name" value="${user_id }">
					      
						<label for="content"><b>내용</b></label>
						<textarea placeholder="글내용" name="content"></textarea>

						
						
						<label for="score"><b>평점</b></label> &nbsp; &nbsp; &nbsp; 
						<select name="score">
						    <option value="">평점입력</option>
						    <option value="1">1</option>
						    <option value="2">2</option>
						    <option value="3">3</option>
						    <option value="4">4</option>
						    <option value="5">5</option>
						</select> <br>
						<div id="scoretext"></div>
						<label for="prfname"><b>연극명</b></label>
						<input style="width:60%;" type="text"  placeholder="연극명" name="prfname" id="prfna">
						<input type="hidden" name="fprfid" id="fprfid">
						<button id="findperf" type="button">찾아보기</button>
						
						<div id="dlg_write1" class="modal" >
							<div class="modal-content animate" id="frm">
							<div class="container">
							<h3 class="title"></h3>
							<span id="clo1" class="close" title="Close Modal">&times;</span>
							
							연극명: <input type="text" id="prfname" style="width:70%;">
								
							<button id="searchprf" type="button">검색</button>
							<div id="pertexts">
							
							</div>
							</div>
							</div>
						</div>
						
						<div class="d01 btn_group_write">
							<button type="submit" class="btn success fullbtn">작성</button>
						</div>
						
						<div class="d01 btn_group_view">  			  
							<div class="left1">
								<button type="button" class="btn danger" id="viewDelete">삭제</button>
							</div>
							<div class="right1">
								<button type="button" class="btn info" id="viewUpdate">수정</button>
							</div>
							<div class="clear1"></div>
						</div>	
						
						<div class="d01 btn_group_update">  			  
							<div>
								<button type="button" class="btn info fullbtn" id="updateOk">수정완료</button>
							</div>
							<div class="clear1"></div>
						</div>	
					</div>
				</form>
			</div>
        </div>
    </section>
    <!-- ##### Buy Now Area End ##### -->


   
               

    <!-- ##### Miscellaneous Area End ##### -->
    
	<jsp:include page="/resources/jsp/footer.jsp"></jsp:include>
	
</body>

</html>
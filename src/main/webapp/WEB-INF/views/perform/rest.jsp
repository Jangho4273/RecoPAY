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
    <link rel="icon" href="<%=request.getContextPath()%>/img/core-img/favicon.ico">

    <!-- Stylesheet -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/rest.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://kit.fontawesome.com/bb29575d31.js"></script>
	<script src="${pageContext.request.contextPath }/js/board.js"></script>
	
	<script type="text/javascript">
	
		$(document).on('hidden.bs.modal', function (event) {
	
			if ($('.modal:visible').length) {
	
				$('body').addClass('modal-open');
	
			}
	
		});
	
	</script>

</head>

<body>
	<jsp:include page="/resources/jsp/header.jsp"></jsp:include>
	 <!-- ##### Breadcumb Area Start ##### -->
    <section class="breadcumb-area bg-img bg-overlay" style="background-image: url(<%=request.getContextPath() %>/img/bg-img/bg-1.jpg); z-index: 0">
       
    </section>

    <!-- ##### Buy Now Area Start ##### -->
    <section class="oneMusic-buy-now-area has-fluid bg-gray section-padding-100">
        <div class="container-fluid">
            <div class="row">
                <div class="col-12">
                    <div class="section-heading style-2">
                        <p>??????????????????????????????????????????????????????</p>
                        <h2>??? ???</h2>
                    </div>
                </div>
            </div>
			<h2>?????? ?????????</h2>
			<%-- ??? ?????? --%>
			<div id="list">
				<%-- header --%>
				<div class="d01">
					<div class="left1" id="pageinfo"></div>
					<div class="right1" id="pageRows"></div>
				</div>
				<div class="clear1"></div>
				
				<%-- ?????? --%>
				<form id="frmList" name="frmList">
					<table>
						<thead>
							<th>#</th>
							<th>UID</th>
							<th>??????</th>
							<th>?????????</th>
							<th>?????????</th>
							<th>?????????</th>
							<th>??????</th>
							<th>?????????</th>
						</thead>
						<tbody>
						
						</tbody>
					</table>
				</form>
				
				<%-- bottom --%>
				<div class="d01">
					<div class="left1">
						<button type="button" id="btnDel" class="btn danger">?????????</button>
					</div>
					<div class="right1">
						<button type="button" id="btnWrite" class="btn success">?????????</button>
					</div>
				</div>
        	</div>
        	
        	<div class="clear1"></div>

			<%-- ????????? --%>
			<div class="center">
				<ul class="pagination" id="pagination" style="width:300px; margin:0 auto;"></ul>
			</div>
			
			<%--??? ??????/??????/?????? ???????????? --%>
			<div id="dlg_write" class="modal">
				<form class="modal-content animate" id="frmWrite" name="frmWrite" method="post">
					<div class="container">
						<h3 class="title">?????? ??????</h3>
						
						<span id="clo" class="close" title="Close Modal">&times;</span>
						
						<input type="hidden" name="uid" value="0"> <%-- ????????? ????????? ?????? ?????? --%>
					
						<div class="d01 btn_group_header">
							<div class="left1">
								<p id="viewcnt"></p>
							</div>
							<div class="right1">
								<p id="regdate"></p>
							</div>
							<div class="clear1"></div>
						</div>
						
						<label for="subject"><b>?????????</b></label>
						<input type="text" placeholder="?????????(??????)" name="subject" required>
					
						<sec:authentication property="principal.username" var="user_id"/>
						<input type="hidden" name="name" value="${user_id }"/>				      
						
						<label for="content"><b>??????</b></label>
						<textarea placeholder="?????????" name="content" class="re_content"></textarea>

						
						
						<label for="score"><b>??????</b></label> &nbsp; &nbsp; &nbsp; 
						<select name="score">
						    <option value="">????????????</option>
						    <option value="1">1</option>
						    <option value="2">2</option>
						    <option value="3">3</option>
						    <option value="4">4</option>
						    <option value="5">5</option>
						</select> <br>
						<div id="scoretext"></div>
						<label for="prfname"><b>?????????</b></label>
						<input style="width:60%;" type="text"  placeholder="?????????" name="prfname" id="prfna">
						<input type="hidden" name="fprfid" id="fprfid">
						<button id="findperf" type="button" class="cusbtn">????????????</button>
						
						<div id="dlg_write1" class="modal" >
							<div class="modal-content animate" id="frm">
							<div class="container">
							<h3 class="title"></h3>
							<span id="clo1" class="close" title="Close Modal">&times;</span>
							
							?????????: <input type="text" id="prfname" style="width:70%;">
								
							<button id="searchprf" type="button" class="cusbtn">??????</button>
							<div id="pertexts">
							
							</div>
							</div>
							</div>
						</div>
						
						<div class="d01 btn_group_write">
							<button type="submit" class="btn success fullbtn">??????</button>
						</div>
						
						<div class="d01 btn_group_view">  			  
							<div class="left1">
								<button type="button" class="btn danger" id="viewDelete">??????</button>
							</div>
							<div class="right1">
								<button type="button" class="btn info" id="viewUpdate">??????</button>
							</div>
							<div class="clear1"></div>
						</div>	
						
						<div class="d01 btn_group_update">  			  
							<div>
								<button type="button" class="btn info fullbtn" id="updateOk">????????????</button>
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
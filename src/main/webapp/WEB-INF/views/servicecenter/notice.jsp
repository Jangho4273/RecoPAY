<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>공지사항</title>
</head>
<body>
	<h1 align="center">공지사항</h1>
	<hr>
	
	<!-- 작성 영역 -->
	<div class="outer">
		<div class="">
			<h2>공지사항 작성</h2>	
			 <form action="insertBoard.jbo" method="post" id="insertBoardFrm" enctype="multipart/form-data">
				<!-- 제목영역 -->
				<div>
					<!-- 제목 -->
					<div>
						<h3>제목 </h3>
						<input class="form-control col-lg-12 col-md-12 col-sm-8" id="bTitle" name="bTitle" type="text"  required  placeholder="제목을 입력하세요">
						<!-- 임시 게시글 작성자 -->
						<input type="hidden" name="bWriter" value="${ loginUser.mno }">
						<input type="hidden" name="bType" value="JOBNOTICE">
					</div>
					<br>
				</div>
				<!-- 내용 -->
				<h3>내용 </h3>
				
				<div class="contentArea">
					<textarea name="bContent" id="editor" required placeholder="내용을입력하세요(4자이상)" wrap="hard" style="width: 880px; height: 400px;"></textarea>
				</div>
				<div align="center">
					<input type="button" id="save" value="등록하기" class="btn">
					<button class="btn" onclick="location='jobNoticeList.jbo'">돌아가기</button>
				</div>
			</form>

		</div>
	</div>
	<c:if test="${ loginUser.isAdmin ne 'Y' }">
		<h1>잘못된 경로로 접근하셨습니다.</h1>
	</c:if>
	
	<script type="text/javascript">
	    $(function(){
	        $("#save").click(function(){ 
				var bTitle = $("#bTitle").val();        	
				
				if(bTitle==""){
					alert("제목을 입력해주세요");
					return;
				}
				
				$("#insertBoardFrm").submit();
			})
	    });
	    
	    //에디터 
	    var editorConfig = {
	   		uploadUrl: "${pageContext.request.contextPath }/fileupload.jbo",
	   	    filebrowserUploadUrl : "${pageContext.request.contextPath }/fileupload.jbo", //이미지만 업로드
	   	    extraPlugins : 'uploadimage',
	   };
	    CKEDITOR.editorConfig = function(config) {
    	  
    	  config.extraPlugins = 'inserthtml';
    	  config.toolbar = 'Basic';
    	}
	   	    
	   	    
	   CKEDITOR.on('dialogDefinition', function( ev ){
	   	   var dialogName = ev.data.name;
	   	   var dialogDefinition = ev.data.definition;
	
	   	   switch (dialogName) {
	   	       case 'image': //Image Properties dialog
	   	   //dialogDefinition.removeContents('info');
	   	   dialogDefinition.removeContents('Link');
	   	   dialogDefinition.removeContents('advanced');
	   	           break;
	   	       }
	   	});
	
   	  	 window.onload = function(){
   	        ck = CKEDITOR.replace("editor", editorConfig);
   	   	};
	</script>
</body>
</html>
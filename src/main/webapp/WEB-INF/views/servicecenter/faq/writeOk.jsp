<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  

<c:choose>
	<c:when test="${result == 0 }">
		<script>
			alert("등록 실패!!!!!!");
			history.back();
		</script>
	</c:when>
	<c:otherwise>
		<script>
			alert("등록 성공, 리스트 출력합니다");
			location.href = "/recopay/servicecenter/faq/faq";
		</script>
	</c:otherwise>
</c:choose>

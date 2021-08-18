<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 디테일</title>
</head>
<body>
	<h2>리뷰 디테일</h2>
	
	<c:set var="review" value="${reviewDetail }"/>
	<a href="/MovieProject/moviereview/movie_review_write.jsp"><input
		type="button" value="리뷰작성"></a>
	<table border="1">
		<tr>
			<td>${reviewDetail.uId }</td>
			<td><select>
					<option>평점</option>
					<option>2</option>
					<option>3</option>
					<option>4</option>
					<option>5</option>
			</select></td>
		</tr>
		<tr>
			<td>${reviewDetail.rContent }</td>
			<td><select
				onchange="if(this.value) location.href=(this.value);">
					<option value=""></option>
					<option value="/MovieProject/moviereview/movie_review_update.jsp">수정</option>
					
					<option value="/MovieProject/moviereviewdelete.do">삭제</option>
			</select></td>
		</tr>
		<tr>
			<td>${reviewDetail.rDate }</td>
		</tr>

	</table>
	<%-- 페이징 버튼 만들기 
	표현할 글이 있는 경우에만 버튼을 표시함--%>
	<c:if test="">

		<%-- 뒤로가기 버튼을 표시할지 말지 결정하는 부분 --%>
		<c:if test="${reviewPageDTO.startPage > 5}">
			<a href="/MyFirstWeb/boardselect.do?page=${reviewPageDTO.startPage - 5 }">
				[prev] </a>
		</c:if>

		<%-- 페이지 번호 10개 묶음을 깔아주는 부분 --%>
		<c:forEach var="pNo" begin="${reviewPageDTO.startPage}"
			end="${reviewPageDTO.endPage}">
			<a href="/MyFirstWeb/boardselect.do?page=${pNo}">[${pNo}]</a>
		</c:forEach>

		<%-- 다음으로 가기 버튼을 표시할지 말지 결정하는 부분 --%>
		<c:if test="${reviewPageDTO.endPage < reviewPageDTO.totalPages}">
			<a href="/MyFirstWeb/boardselect.do?page=${reviewPageDTO.startPage + 5}">
				[next] </a>
		</c:if>

	</c:if>
	<%-- 페이징 부분 끝 --%>
	<br >

</body>
</html>
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

	<a href="/MovieProject/moviereviewdetail.do"><input type="button"
		value="리뷰작성"></a>
	<c:set var="review" value="${reviewDetail }"></c:set>
	<table border="1">
		<thead>
			<tr>
				<th>리뷰번호</th>
				<th>회원아이디</th>
				<th>영화 제목</th>
				<th>평점</th>
				<th>리뷰내용</th>
				<th>작성일</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="review" items="${reviewList }">
				<tr>
					<td>${review.rNum }</td>
					<td>${review.uId }</td>
					<td>${review.mTitle }</td>
					<td>${review.rRate }</td>
					<td>${review.rContent }</td>
					<td>${review.rDate }</td>
					<td><select
						onchange="if(this.value) location.href=(this.value);">
							<option value=""></option>
							<option value="/MovieProject/moviereview/movie_review_update.jsp">수정</option>
							<option value="/MovieProject/moviereviewdelete.do">삭제</option>
					</select></td>
				</tr>
			</c:forEach>
		</tbody>
		<tr>


		</tr>
	</table>
	<%-- 페이징 버튼 만들기 
	표현할 글이 있는 경우에만 버튼을 표시함--%>
	<c:if test="${pageDTO.hasBoard()}">

		<%-- 뒤로가기 버튼을 표시할지 말지 결정하는 부분 --%>
		<c:if test="${pageDTO.startPage > 5">
			<a href="/MovieProject/moviereviewselect.do?page=${pageDTO.startPage - 5}"> [prev] </a>
		</c:if>

		<%-- 페이지 번호 10개 묶음을 깔아주는 부분 --%>
		<c:forEach var="pNo" begin="${pageDTO.startPage}"
			end="${pageDTO.endPage}">
			<a href="/MovieProject/moviereviewselect.do?page=${pNo}">[${pNo}]</a>
		</c:forEach>

		<%-- 다음으로 가기 버튼을 표시할지 말지 결정하는 부분 --%>
		<c:if test="${pageDTO.endPage < pageDTO.totalPages}">
			<a href="/MovieProject/moviereviewselect.do?page=${pageDTO.startPage + 10}">
				[next] </a>
		</c:if>

	</c:if>
	<%-- 페이징 부분 끝 --%>

	<br />


	<br>


</body>
</html>
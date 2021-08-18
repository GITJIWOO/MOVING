<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 목록</title>
</head>
<body>
	<h3>영화정보</h3>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>

<<<<<<< HEAD

	<a href="/MovieProject/moviereview/movie_review_detail.jsp"><input
		type="button" value="더보기"></a>
	<table border="1">
		<c:forEach var="review" items="${reviewList }">
			<tr>
				<td>${review.uId}</td>
				<td></td>
				<td><select>
						<option>평점</option>
						<option>2</option>
						<option>3</option>
						<option>4</option>
						<option>5</option>
				</select></td>
			</tr>
			<tr>
				<td>${review.rContent }</td>

			</tr>
			<tr>
				<td>${review.rDate }</td>
			</tr>
		</c:forEach>
=======
	<h1>리뷰 목록</h1>
	<a href="/MovieProject/moviereview/movie_review_detail.jsp"><input
		type="button" value="더보기"></a>
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
			<c:forEach var="review" items="${reviewList}">
			<tr>
				<td>${review.rNum}</td>
				<td>${review.uId}</td>
				<td>${review.mTitle}</td>
				<td>${review.rRate}</td>
				<td>${review.rContent}</td>
				<td>${review.rDate}</td>
			</tr>	
			</c:forEach>
		</tbody>
>>>>>>> 5444de73ed763cf939cd9b965a0d3a249c04e4da
	</table>



</body>
</html>
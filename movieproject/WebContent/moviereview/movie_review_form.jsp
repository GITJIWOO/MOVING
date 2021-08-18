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
	</table>



</body>
</html>
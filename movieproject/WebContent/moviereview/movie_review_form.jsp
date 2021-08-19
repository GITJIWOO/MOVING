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


	<h1>리뷰 목록</h1>
	<a href="/MovieProject/moviereviewdetail.do"><input
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

	</table>



</body>
</html>
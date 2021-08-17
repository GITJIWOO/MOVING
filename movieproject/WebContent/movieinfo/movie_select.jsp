<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 정보</title>
</head>
<body>
	<h1>영화 정보</h1>
	<table border="1">
		<tr>
			<th>영화 포스터</th>
			<th>영화 제목</th>
			<th>영화 등급</th>
			<th>영화 개봉일</th>
		</tr>
		<c:forEach var="movie" items="${movieList}">
			<tr>
				<td>
					<a href="/MovieProject/moviedetail.do?mId=${movie.mId}">
						${movie.mPoster }
					</a>
				</td>
				<td><a href="/MovieProject/moviedetail.do?mId=${movie.mId}">
						${movie.mTitle }
					</a>
				</td>
				<td>${movie.mGrade }</td>
				<td>${movie.mPremiere }</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>
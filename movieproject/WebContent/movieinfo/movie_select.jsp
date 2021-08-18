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
			<th>영화 제목</th>
			<th>영화 등급</th>
			<th>영화 개봉일</th>
		</tr>
		<c:forEach var="movie" items="${movieList}">
			<tr>
				<td><a href="/MovieProject/moviedetail.do?mid=${movie.mid}">
						${movie.mtitle }
					</a>
				</td>
				<td>${movie.mgrade }</td>
				<td>${movie.mpremiere }</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 상세 정보</title>
</head>
<body>
	<h1>영화 상세 정보</h1>
	<table border="1">
		<tr>
			<th>영화 번호</th>
			<td>${movie.mid }</td>
		</tr>
		<tr>
			<th>영화 제목</th>
			<td>${movie.mtitle }</td>
		</tr>
		<tr>
			<th>영화 등급</th>
			<td>${movie.mgrade }</td>
		</tr>
		<tr>
			<th>제작 국가</th>
			<td>${movie.mcountry }</td>
		</tr>
		<tr>
			<th>영화 개봉일</th>
			<td>${movie.mpremiere }</td>
		</tr>
		<tr>
			<th>영화 감독</th>
			<td>${movie.mdirector }</td>
		</tr>
		<tr>
			<th>영화 배우진</th>
			<td>${movie.mactor }</td>
		</tr>
		<tr>
			<th>영화 줄거리</th>
			<td>${movie.mplot }</td>
		</tr>
	</table>
	<form action="/MovieProject/movieselect.do" method="post">
		<input type="hidden" name="movielist">
		<input type="submit" value="영화 리스트로">
	</form>
	<form action="/MovieProject/movieupdate.do?mId=${movie.mid }" method="post">
		<input type="hidden" name="movieupdate">
		<input type="submit" value="영화 수정">
	</form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 정보 수정</title>
</head>
<body>
	<h1>영화 정보 수정</h1>
	<form action="/MovieProject/movieupdateok.do" method="post">
		<table border="1">
			<tr>
				<th>영화 번호</th>
				<td><input type="text" name="movieid" value="${movie.mid }" readonly /><br/></td>
			</tr>
			<tr>
				<th>영화 제목</th>
				<td><input type="text" name="movietitle" value="${movie.mtitle }"/><br/></td>
			</tr>
			<tr>
				<th>영화 등급</th>
				<td><input type="text" name="moviegrade" value="${movie.mgrade }"/><br/></td>
			</tr>
			<tr>
				<th>영화 제작 국가</th>
				<td><input type="text" name="moviecountry" value="${movie.mcountry }"/><br/></td>
			</tr>
			<tr>
				<th>영화 개봉일</th>
				<td><input type="date" name="moviepremiere" value="${movie.mpremiere }"/><br/></td>
			</tr>
			<tr>
				<th>영화 감독</th>
				<td><input type="text" name="moviedirector" value="${movie.mdirector }"/><br/></td>
			</tr>
			<tr>
				<th>출연진</th>
				<td><input type="text" name="movieactor" value="${movie.mactor }"/><br/></td>
			</tr>
			<tr>
				<th>영화 줄거리</th>
				<td><textarea rows="10" cols="50" name="plot">${movie.mplot }</textarea><br/></td>
			</tr>
			<tr>
				<td><input type="submit" value="올리기"></td>
				<td><input type="reset" value="초기화"></td>
			</tr>
		</table>
	</form>
	<form action="/MovieProject/movieselect.do" method="post">
		<input type="hidden">
		<input type="submit" value="돌아가기">
	</form>
</body>
</html>
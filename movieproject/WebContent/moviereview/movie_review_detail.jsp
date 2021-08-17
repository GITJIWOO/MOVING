<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 디테일</title>
</head>
<body>
	<h2>리뷰 디테일</h2>

	<a href="/MovieProject/moviereview/movie_review_write.jsp"><input
		type="button" value="리뷰작성"></a>
	<table border="1">
		<tr>
			<td>id</td>
			<td><select>
					<option>평점</option>
					<option>2</option>
					<option>3</option>
					<option>4</option>
					<option>5</option>
			</select></td>
		</tr>
		<tr>
			<td><textarea rows="10" cols="30">내용</textarea></td>
			<td><select
				onchange="if(this.value) location.href=(this.value);">
					<option value=""></option>
					<option value="/MovieProject/moviereview/movie_review_update.jsp">수정</option>
					<option value="삭제">삭제</option>
			</select></td>
		</tr>
		<tr>
			<td>작성날짜</td>
		</tr>

	</table>
	
</body>
</html>
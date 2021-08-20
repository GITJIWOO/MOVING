<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 쓰기</title>
</head>
<body>
	<h1>리뷰 남기기</h1>

	

	<form action="/MovieProject/moviereviewinsert.do" method="post">
		<table border="1">
			<tr>
				<td>리뷰내용</td>
				<td><input type="text" name="rContent" size="10"></td>
			</tr>
			<tr>
				<td>글쓴이</td>
				<td><input type="text" name="uId" size="10"></td>
			</tr>
			<tr>
				<td>영화제목</td>
				<td><input type="text" name="mTitle"></td>
			</tr>
			<tr>
				<td>평점</td>
				<td><select name="rRate">
						<option>평점</option>
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
				</select></td>

			</tr>
			
			
			<tr>
				<td>
				<input type="submit" value="등록"> 
				<input type="reset" value="초기화"> 
				<a href="/MovieProject/moviereviewselect.do"> <input
						type="button" value="목록으로">
				</a>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
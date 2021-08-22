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
		<input type="hidden" name="mId" value="${movie.mid }">
		<input type="hidden" name="uId" value="${uId}">
		<table border="1">
			
			<tr>
				<td>영화제목</td>
				<td><input type="text" name="mTitle" value="${movie.mtitle }" readonly></td>
			</tr>
			<tr>
				<td>글쓴이</td>
				<td><input type="text" name="uId" value="${uId }" readonly></td>
				
			</tr>
			<tr>
				<td>리뷰내용</td>
				<td><textarea rows="10" cols="30" name="rContent">${review.rContent}</textarea> </td>
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
				<a href="/MovieProject/moviedetail.do?mId=${movie.mid }"> 
					<input type="button" value="목록으로">
				</a>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>리뷰 수정ㅇ</title>
</head>
<body>
	<h3>리뷰 수정폼</h3>

	<form action="/MovieProject/moviereviewupdate.do" method="post">

	<input type="hidden" name="rNum" value="${review.rNum }">
		<table border="1">
			<tr>
			<td>글쓴이</td>
				<td><input type="text" name="uId" value="${review.uId}" readonly></td>
			</tr>
			<tr>
			<td>평점</td>
				<td><select name="rRate">
						<option>${review.rRate}</option>
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
				</select></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea rows="10" cols="30" name="rContent">${review.rContent}</textarea></td>
				

			</tr>
			<tr>
			<td>등록날짜</td>
				<td>${review.rDate }</td>
			</tr>
			<tr>
				<td><input type="submit" value="수정하기"> <input
					type="reset" value="초기화"> <a
					href="/MovieProject/moviereview/movie_review_form.jsp"> <input
						type="button" value="게시글 목록"></a></td>
			</tr>
		</table>
	</form>
</body>
</html>
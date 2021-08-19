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
<<<<<<< HEAD
	<form action="/MovieProject/moviereviewupdate.do" method="post">
	
	<input type="hidden" name="uId" value="${reviewDetail.uId }">
	<input type="hidden" name="uId" value="${reviewDetail.uId }">
	<input type="hidden" name="uId" value="${reviewDetail.uId }">
	<input type="hidden" name="uId" value="${reviewDetail.uId }">
=======
	<form action="/MovieProject/moviereviewselect.do" method="post">
>>>>>>> 5444de73ed763cf939cd9b965a0d3a249c04e4da
		<table border="1">
			<tr>
				<td>${reviewDetail.uId }</td>
			</tr>
			<tr>
				<td><select>
						<option>평점</option>
						<option>1</option>
						<option>2</option>
						<option>3</option>
				</select></td>
			</tr>
			<tr>
				<td><textarea rows="10" cols="30" name="rContent">${reviewDetail.bContent}</textarea></td>
				<td><select
					onchange="if(this.value) location.href=(this.value);">
						<option value=""></option>
						<option value="/MovieProject/moviereview/movie_review_ipdate.jsp">수정</option>
						<option value="/MovieProject/moviereviewdelete.do">삭제</option>
				</select></td>

			</tr>
			<tr>
				<td>작성날짜</td>
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
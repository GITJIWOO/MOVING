<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���� ������</title>
</head>
<body>
	<h3>���� ������</h3>

	<form action="/MovieProject/moviereviewupdate.do" method="post">

	<input type="hidden" name="rNum" value="${review.rNum }">
		<table border="1">
			<tr>
			<td>�۾���</td>
				<td><input type="text" name="uId" value="${review.uId}" readonly></td>
			</tr>
			<tr>
			<td>����</td>
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
				<td>����</td>
				<td><textarea rows="10" cols="30" name="rContent">${review.rContent}</textarea></td>
				

			</tr>
			<tr>
			<td>��ϳ�¥</td>
				<td>${review.rDate }</td>
			</tr>
			<tr>
				<td><input type="submit" value="�����ϱ�"> <input
					type="reset" value="�ʱ�ȭ"> <a
					href="/MovieProject/moviereview/movie_review_form.jsp"> <input
						type="button" value="�Խñ� ���"></a></td>
			</tr>
		</table>
	</form>
</body>
</html>
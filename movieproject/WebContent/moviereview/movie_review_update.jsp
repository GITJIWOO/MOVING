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
	<form action="/MovieProject/reviewupdateok.do" method="post">
		<table border="1">
			<tr>
				<td>id</td>
			</tr>
			<tr>
				<td><select>
						<option>����</option>
						<option>1</option>
						<option>2</option>
						<option>3</option>
				</select></td>
			</tr>
			<tr>
				<td><textarea rows="10" cols="30">����</textarea></td>
				<td><select
					onchange="if(this.value) location.href=(this.value);">
						<option value=""></option>
						<option value="/MovieProject/moviereview/movie_review_ipdate.jsp">����</option>
						<option value="����">����</option>
				</select></td>

			</tr>
			<tr>
				<td>�ۼ���¥</td>
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
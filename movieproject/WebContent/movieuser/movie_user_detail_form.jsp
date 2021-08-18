<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 내정보 확인 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>내 정보 조회</h1>
	<table border = "1">
		<tr>
			<th>ID</th>
			<td>${user.uId }</td>
		</tr>
		<tr>
			<th>NAME</th>
			<td>${user.uName }</td>
		</tr>
		<tr>
			<th>E-mail</th>
			<td>${user.uEmail }</td>
		</tr>
		<tr>
			<th>Age</th>
			<td>${user.uAge }</td>
		</tr>
	</table>
	<form action = "/MovieProject/getuser.do" method = "post">
		<input type = "hidden" name = "uId" value ="${user.uId }" />
		<input type = "submit" value = "회원 정보 변경" />
	</form>
	<form action = "/MovieProject/userdelete.do" method = "post">
		<input type = "hidden" name = "uId" value ="${user.uId }" />
		<input type = "submit" value = "회원 탈퇴" />
	</form>
</body>
</html>
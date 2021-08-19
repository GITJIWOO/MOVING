<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 페이지</title>
</head>
<body>
	<h1>회원가입</h1>
	<form action = "/MovieProject/userjoin.do" method = "post">
		<input type = "text" name = "uId" placeholder = "ID" required /><br>
		<input type = "password" name = "uPw" placeholder = "PASSWORD" required /><br>
		<input type = "text" name = "uName" placeholder = "NAME" required /><br>
		<input type = "email" name = "uEmail" placeholder = "E-MAIL" required /><br>
		<input type = "number" name = "uAge" placeholder = "AGE" min = "1" max = "100" required /><br>
		<input type = "submit" value = "회원가입" /><br>
		<a href = "/MovieProject/userlogin.do">
			<input type = "button" value = "로그인으로 이동" />
		</a>
	</form>
</body>
</html>
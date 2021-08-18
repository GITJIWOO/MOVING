<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>회원정보 수정창</h1>
	<form action="/MovieProject/getuser.do" method="post">
		<input type="text" name="uid" placeholder="아이디" value=${user.uId } required readonly /><br/>
		<input type="text" name="upw" placeholder="비밀번호" value=${user.uPw } required /><br/>
		<input type="text" name="uname" placeholder="성명" value=${user.uName } required /><br/>
		<input type="text" name="uemail" placeholder="이메일주소" value=${user.uEmail } required /><br/>
		<input type="text" name="uage" placeholder="나이" value=${user.uAge } required /><br/>
		<input type="submit" value="수정" />
		<input type="reset" value="초기화" /> 
	</form>
</body>
</html>
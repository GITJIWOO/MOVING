<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 창</title>
<style>
	h1 {
		background-color:grey;
		padding-top:30px;
		padding-bottom:10px;
	}
	form {
		text-align:center;
	}
</style>
</head>
<body>
	<c:if test = "${joinCheck == 1 }">
		<script>alert('회원가입이 완료되었습니다.');</script>
	</c:if>
	<c:if test = "${joinCheck == 0 }">
		<script>alert('중복된 아이디입니다.'); history.back();</script>
	</c:if>
<!-- dddd -->
	<h1 align="center">무비프로젝트</h1>
	<form action="/MovieProject/userlogin.do" method="post">
		<input type="text" name="id" placeholder="아이디" required/><br/>
		<input type="password" name="pw" placeholder="비밀번호" required/><br/><br/>
		<input type="submit" value="로그인" />
	</form>
	<form action="/MovieProject/userjoin.do" method="post">
		<input type="submit" value="회원가입" />
	</form>
</body>
</html>
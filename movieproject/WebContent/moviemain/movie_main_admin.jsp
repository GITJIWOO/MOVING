<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<link rel="stylesheet" href="../movieui/css/mstyles.css" />
</head>
<body>
	<div id="body">
		<div id="bodydetail2">
			<c:if test="${session_admin != null }">
				<h3>관리자님 환영합니다.</h3>
				<form action="/MovieProject/userlogout.do" method="post">
					<input type="hidden" name="session_admin" value="${session_admin}" />
					<input type="submit" value="로그아웃"/>
				</form>
			</c:if>
			<c:if test="${session_admin == null }">
				<h3>로그인을 해주세요.</h3>
				<form action="/MovieProject/movieuser/movie_user_login_form.jsp" method="post">
					<input type="submit" value="로그인"/>
				</form>
			</c:if>
		</div>
	</div>
	<div id="content">
	</div>
	<div id="footer">
		<p><b>Creators</b>&nbsp;&nbsp;김지우 , 최재인 , 이한빈 , 김영훈</p>
		<p><b>Contact </b>&nbsp;&nbsp;<a href="https://github.com/GITJIWOO">https://github.com/GITJIWOO</a></p>
		<hr>
		<p id="copyright"><b>ⓒ MOVING Corp.</b></p>
	</div>
</body>
</html>
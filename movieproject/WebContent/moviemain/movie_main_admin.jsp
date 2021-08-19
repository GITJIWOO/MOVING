<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<style>
	#body {
		/* border: 1px solid black; */
	}
	#bodydetail2 {
		text-align:right;
	}
	h3 {display:inline-block;}
	form { display:inline-block;}
	
</style>
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
	</div>
</body>
</html>
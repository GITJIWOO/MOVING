<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 화면</title>
</head>
<body>
	<h1>메인 화면</h1>
	<c:if test="${update_status == 1 }">
		<script>alert('업데이트가 완료되었습니다.');</script>
	</c:if>
	<c:if test="${update_status == 0 }">
		<script>alert('업데이트에 실패하였습니다.'); history.back();</script>
	</c:if>
	<c:if test="${session_id == null }">
		<h1>로그인을 해주세요.</h1>
	</c:if>
	<c:if test="${session_id != null && login_fail == null }">
	<form action = "/MovieProject/userdetail.do" action = "post">
		<input type = "hidden" name = "uId" value = "${session_id }" />
		<input type = "submit" value = "내 정보" />
	</form>
	<form action="/MovieProject/userlogout.do" method="post">
		<input type="submit" value="로그아웃" />
	</form>
		<h1>${session_id } 님 환영합니다!</h1>
	</c:if>
	<c:if test="${login_fail == 0 }">
		<script>alert('아이디가 일치하지 않습니다'); history.back(); </script>
		<!-- <script>
			if(confirm('삭제하시겠습니까?')) {
				document.write("네")
			} else {
				document.write("아니오")
			}
		</script>
		-->
	</c:if>
	<c:if test="${login_fail == -1 }">
		<script>alert('비밀번호가 일치하지 않습니다.'); history.back(); </script>
	</c:if>
	<form action="movieselect.do">
		<input type="hidden" name="movielist">
		<input type="submit" value="영화">
	</form>
</body>
</html>
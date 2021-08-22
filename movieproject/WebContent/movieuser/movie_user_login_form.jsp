<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../movieui/css/mstyles.css" />
<link rel="stylesheet" href="../MovieProject/movieui/css/mstyles.css" />
<title>로그인</title>
</head>
<body>
	<!-- CSS START -->
	<div class="main-bar">
      <div class="main-bar__column">
        <span
          ><a href="/MovieProject/moviemain.do"><img src="<%=request.getContextPath() %>/movieui/css/screen/images/logo.png" /></a
        ></span>
      </div>
      <div class="main-bar__column">
        <span>
          <a class="main-bar__movie" href="/MovieProject/movieselect.do">영화정보</a>
          <a class="main-bar__movie" href="#">다운로드</a>
        </span>
      </div>
      <div class="main-bar__column">
        <span><a class="main-bar__btn" href="/MovieProject/userjoin.do">로그인</a></span>
        <span>|</span>
        <span><a class="main-bar__btn" href="/MovieProject/requserjoin.do">회원가입</a></span>
      </div>
    </div>
	<!-- CSS END -->
	
	<c:if test = "${joinCheck == 1 }">
		<script>alert('회원가입이 완료되었습니다.');</script>
	</c:if>
	<c:if test = "${joinCheck == 0 }">
		<script>alert('중복된 아이디입니다.'); history.back();</script>
	</c:if>
	
    <!-- main 화면 body start-->
    <div class="main-body">
      <div class="main-sidebar"></div>
      <div class="main-contents">
        <header class="login-header">
          <h1 class="login-header__title">로그인</h1>
			<form class="login-form" action="/MovieProject/userlogin.do" method="post">
				<input type="text" name="id" placeholder="아이디" required/><br/>
				<input type="password" name="pw" placeholder="비밀번호" required/><br/>
				<input type="submit" value="로그인" />
			</form>
        </header>
      </div>
      <div class="main-sidebar"></div>
    </div>
    <!-- main 화면 body end-->
  </body>
</html>
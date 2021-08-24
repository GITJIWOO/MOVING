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
	<!--main 화면 header start-->
	<!-- 로그인 전에만 볼 수 있는 페이지 -->
	<div class="main-bar">
      <div class="main-bar__column">
        <span
          ><a href="/MovieProject/moviemain.do"><img src="/MovieProject/movieui/css/screen/images/logo.png" /></a
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
	<!-- main 화면 header end-->
	
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
    <!-- foot start -->
	<div id="footer">
		<p><b>Creators</b>&nbsp;&nbsp;김지우 , 최재인 , 이한빈 , 김영훈</p>
		<p><b>Contact </b>&nbsp;&nbsp;<a href="https://github.com/GITJIWOO">https://github.com/GITJIWOO</a></p>
		<hr>
		<p id="copyright"><b>ⓒ MOVING Corp.</b></p>
	</div>
	<!-- foot end -->
  </body>
</html>
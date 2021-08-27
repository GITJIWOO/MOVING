<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../movieui/css/mstyles.css" />
<link rel="stylesheet" href="../MovieProject/movieui/css/mstyles.css" />
<style>
.main-body{
	height: 100vh;
}
</style>
<title>Insert title here</title>
</head>
<body>
<!--main 화면 header start-->
<!-- 로그인 후에만 볼 수 있는 페이지 -->
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
        <span><a class="main-bar__btn">${session_id } 님 환영합니다!</a></span>
        <span>|</span>
        <form class="main-bar__btn"  action = "/MovieProject/userdetail.do" method = "post">
		<input type = "hidden" name = "uId" value = "${session_id }" />
		<input type = "submit" value = "마이페이지" />
		</form>        <span>|</span>
        <span><a class="main-bar__btn" href="/MovieProject/userlogout.do">로그아웃</a></span>
      </div>
    </div>
    <!-- main 화면 header end-->
    <!-- main 화면 body start-->
    <div class="main-body">
      <div class="main-sidebar"></div>
      <div class="main-contents">
        <header class="update-header">
          <h1 class="update-header__title">회원정보 수정</h1>
		<form class="update-form" action="/MovieProject/userupdate.do" method="post">
		<input type="text" name="uid" placeholder="아이디" value="${user.uId }" required readonly /><br/>
		<input type="password" name="upw" placeholder="비밀번호" value="${user.uPw }" required /><br/>
		<input type="text" name="uname" placeholder="성명" value="${user.uName }" required /><br/>
		<input type="text" name="uemail" placeholder="이메일주소" value="${user.uEmail }" required /><br/>
		<input type="text" name="uage" placeholder="나이" value="${user.uAge }" required /><br/>
		<input type="submit" value="수정" />
		<input type="reset" value="초기화" /> 
	</form>
</header>
      </div>
      <div class="main-sidebar"></div>
    </div>
    <!-- main 화면 body end-->
<!-- footer start -->
	<div class="footer">
      <div class="footer-info">
        <div>CREATORS&nbsp;&nbsp;김지우 , 최재인 , 이한빈 , 김영훈</div>
        <div>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;</div>
        <div>
          CONTACT&nbsp;&nbsp;<a href="https://github.com/GITJIWOO"
            >https://github.com/GITJIWOO</a
          >
        </div>
      </div>
      <div class="footer-copyright">
        <div>Copyright © MOVING All right reserved.</div>
      </div>
    </div>
	<!-- footer end -->
  </body>
</html>
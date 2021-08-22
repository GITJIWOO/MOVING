<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../movieui/css/mstyles.css" />
<link rel="stylesheet" href="../MovieProject/movieui/css/mstyles.css" />
<title>회원가입 페이지</title>
</head>
<body>
	<!--main 화면 header start-->
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
    <!-- main 화면 header end-->
    <!-- main 화면 body start-->
    <div class="main-body">
      <div class="main-sidebar"></div>
      <div class="main-contents">
        <header class="join-header">
          <h1 class="join-header__title">회원가입</h1>
			<form class="join-form" action = "/MovieProject/userjoin.do" method = "post">
				<input type = "text" name = "uId" placeholder = "ID" required /><br>
				<input type = "password" name = "uPw" placeholder = "PASSWORD" required /><br>
				<input type = "text" name = "uName" placeholder = "NAME" required /><br>
				<input type = "email" name = "uEmail" placeholder = "E-MAIL" required /><br>
				<input type = "number" name = "uAge" placeholder = "AGE" min = "1" max = "100" required /><br>
				<input type = "submit" value = "회원가입" /><br>
			</form>
		</header>
      </div>
      <div class="main-sidebar"></div>
    </div>
    <!-- main 화면 body end-->
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <link rel="stylesheet" href="../movieui/css/mstyles.css" />
<title>회원가입 페이지</title>

</head>
<body>
	<!--main 화면 header start-->
    <div class="main-bar">
      <div class="main-bar__column">
        <span
          ><a href="#"><img src="../movieui/css/screen/images/logo.png" /></a
        ></span>
      </div>
      <div class="main-bar__column">
        <span>
          <a class="main-bar__movie" href="#">영화정보</a>
          <a class="main-bar__movie" href="#">영화예매</a>
        </span>
      </div>
      <div class="main-bar__column">
        <span><a class="main-bar__btn" href="#">로그인</a></span>
        <span>|</span>
        <span><a class="main-bar__btn" href="#">회원가입</a></span>
      </div>
    </div>
    <!-- main 화면 header end-->
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../movieui/css/mstyles.css" />
<link rel="stylesheet" href="../MovieProject/movieui/css/mstyles.css" />
<title>Insert title here</title>
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
  </body>
</html>
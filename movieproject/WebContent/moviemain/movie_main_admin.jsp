<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We"
      crossorigin="anonymous"
    />
<link rel="stylesheet" href="../movieui/css/mstyles.css" />
<link rel="stylesheet" href="../MovieProject/movieui/css/mstyles.css" />
<script
  src="https://kit.fontawesome.com/62b1f47417.js"
  crossorigin="anonymous"
></script>
<style>
.main-body {
  height: 70vh;
}
.main-contents {
  display: flex;
}
.admin-info {
  display: flex;
  flex-direction: column;
  width: 100%;
  box-sizing: border-box;
  padding: 50px;
  margin-left: 35%;
}
.admin-info__left {
  margin: 15px 0;
}
.admin-info__right {
  display: flex;
  flex-direction: column;
  align-items: flex-start;
  padding-top: 10px;
}
.admin-header {
  font-size: 35px;
  padding-bottom: 30px;
}
.fas {
  background-color: #2b2b2b;
  display: flex;
  justify-content: center;
  align-items: center;
  height: 130px;
  width: 130px;
  border-radius: 50%;
  color: white;
}
.admin-contents input {
  padding: 10px 0;
  font-size: 15px;
  border-radius: 3px;
  border-style: none;
  width: 150px;
  font-size: 15px;
  font-weight: 600;
  background-color: black;
  color: white;
  cursor: pointer;
}
.admin-contents input:hover {
  color: black;
  background-color: #e0dfdf;
}

</style>
<title>관리자 페이지</title>
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
          <a class="main-bar__movie" href="/MovieProject/moviemain.do">홈</a>
          <a class="main-bar__movie" href="/MovieProject/movieselect.do">영화정보</a>
        </span>
      </div>
      <div class="main-bar__column">
        <span><a class="main-bar__btn">${session_id } 님 환영합니다!</a></span>
        <span>|</span>
        <span><a class="main-bar__btn" href="/MovieProject/movieadminmain.do">관리자페이지</a></span>
        <span>|</span>
        <span><a class="main-bar__btn" href="/MovieProject/userlogout.do">로그아웃</a></span>
      </div>
    </div>
    <!-- main 화면 header end-->
    <!-- main 화면 body start-->
    <div class="main-body">
      <div class="main-sidebar"></div>
      <div class="main-contents">
      <div class="admin-info">
          <div class="admin-info__left">
            <i class="fas fa-user-shield fa-4x"></i>
          </div>
          <div class="admin-info__right">
            <div class="admin-header">계정 | ${session_id }</div>
            <div class="admin-contents">
              <a href="/MovieProject/userselect.do">
                <input type="button" value="사용자정보 조회" />
              </a>
              <a href="/MovieProject/movieadditional.do">
                <input type="button" value="영화 등록" />
              </a>
            </div>
          </div>
        </div>
      </div>
      <div class="main-sidebar"></div>
    </div>      
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
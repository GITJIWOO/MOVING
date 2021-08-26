<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../movieui/css/mstyles.css" />
<link rel="stylesheet" href="../MovieProject/movieui/css/mstyles.css" />
<title>내 기록 관리</title>
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
          <a class="main-bar__movie" href="#">영화예매</a>
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
      	<div class="main-rvfv">
      		<form action="/MovieProject/userdetail.do" method="post" class="back">
      			<input type="hidden" name="uId" value="${session_id }">
      			<input type="submit" value="돌아가기">
      		</form>
      		<hr>
      		<div class="review">
      			<h1>내가 남긴 리뷰</h1>
      			<ul>
	   				<c:forEach var="review" items="${reviewList }">
	   					<li><a href="/MovieProject/moviedetail.do?mId=${review.mId}">${review.mTitle }</a></li>
	   					<li>${review.rRate }</li>
	   					<li>${review.rContent }</li>
	   					<li>${review.rDate }</li>
	   				</c:forEach>
   				</ul>
      		</div>
      		<div class="favorite">
      			<h1>내가 찜 한 영화</h1>
      			<ul>
      				<c:forEach var="movie" items="${faMovies }">
	      				<li><a href="/MovieProject/moviedetail.do?mId=${movie.mid}">${movie.mtitle }</a></li>
	      				<li>${movie.mgenre }</li>
	      				<li>${movie.mpremiere }</li>
      				</c:forEach>
      			</ul>
      		</div>
      	</div>
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
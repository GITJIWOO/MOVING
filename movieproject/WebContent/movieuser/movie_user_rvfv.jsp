<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../movieui/css/mstyles.css" />
<link rel="stylesheet" href="../MovieProject/movieui/css/mstyles.css" />
<style>
    .main-contents {
    	display: flex;
    	justify-content: center;
    	padding-top: 45px;
    }
    .main-rvfv {
    	width: 70%;
    }
    .
	.review {
		float: left;
		width: 45%;
		padding-right: 10px;
	}
	.favorite {
		float: right;
		width: 45%;
		padding-left: 10px;
	}
	h1 {
		font-size: 150%;
		font-weight: 30px;
		margin: 10px 0;
	}
	li {
		margin: 10px 0;
	}
</style>
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
      		<div class="user-info__btn">
	      		<form action="/MovieProject/userdetail.do" method="post" class="back">
	      			<input type="hidden" name="uId" value="${session_id }">
	      			<input type="submit" value="내 정보">
	      		</form>
      		</div>
      		<hr>
      		<div class="review">
      			<h1>내가 남긴 리뷰</h1>
      			<ul>
	   				<c:forEach var="review" items="${reviewList }">
	   					<li>제목 | <a href="/MovieProject/moviedetail.do?mId=${review.mId}">${review.mTitle }</a></li>
	   					<li>평점 | ${review.rRate }</li>
	   					<li>날짜 | ${review.rDate }</li>
	   					<li>내용 | ${review.rContent }</li>
	   					<hr>
	   				</c:forEach>
   				</ul>
      		</div>
      		<div class="favorite">
      			<h1>내가 찜 한 영화</h1>
      			<ul>
      				<c:forEach var="movie" items="${faMovies }">
	      				<li>제목 | <a href="/MovieProject/moviedetail.do?mId=${movie.mid}">${movie.mtitle }</a></li>
	      				<li>장르 | ${movie.mgenre }</li>
	      				<li>개봉일 | ${movie.mpremiere }</li>
	      				<hr>
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
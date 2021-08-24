<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
<link rel="stylesheet" href="../movieui/css/mstyles.css" />
<link rel="stylesheet" href="../MovieProject/movieui/css/mstyles.css" />
<meta charset="UTF-8">
<title>영화 상세 정보</title>
<style>
	.movie_detail {
		padding-left : 8%;
		padding-top : 9%;
		width : 60%;
	}
	.submenu {
		text-weight:bold;
	}
	.movie_img {
		
	}
	hr {
		width:10%;
	}
</style>
</head>
<body>
	<!-- Header start -->
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
	<!-- Header END -->
	
	<!-- BODY START -->
	<div class="main-body">
      <div class="main-sidebar"></div>
      <div class="main-contents">
	
	
	<div class="movie_detail">
		<h3>${movie.mtitle }</h3>
		<hr>
		<p>
			<b>개요</b>&nbsp;&nbsp;&nbsp;${movie.mgenre } | ${movie.mcountry } | ${movie.mtime } | ${movie.mpremiere }
		</p><br>
		<p>
			<b>감독</b>&nbsp;&nbsp;&nbsp;${movie.mdirector }
		</p><br>
		<p>
			<b>출연</b>&nbsp;&nbsp;&nbsp;${movie.mactor }
		</p><br>
		<p>
			<b>등급</b>&nbsp;&nbsp;&nbsp;${movie.mgrade }
		</p><br>
		
		<hr>
	</div>
	
	<div class="movie_img">
		<img src="/MovieProject/movieui/css/screen/images/movieimage.jpg" width="90%" height="10%"/>
	</div>
	
	<div class="movie_plot">
		<h3>줄거리</h3>
		<p>${movie.mplot }</p>
	</div>

	
	</div>
      <div class="main-sidebar"></div>
    </div>
	
	<!-- BODY END -->
	
	<!-- footer start -->
	<div id="footer">
		<p><b>Creators</b>&nbsp;&nbsp;김지우 , 최재인 , 이한빈 , 김영훈</p>
		<p><b>Contact </b>&nbsp;&nbsp;<a href="https://github.com/GITJIWOO">https://github.com/GITJIWOO</a></p>
		<hr>
		<p id="copyright"><b>ⓒ MOVING Corp.</b></p>
	</div>
	<!-- footer end -->
</body>
</html>
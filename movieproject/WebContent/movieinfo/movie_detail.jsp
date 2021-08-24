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
.main-contents{
	display:flex;
	flex-direction: column;
	
}
	.movie {
		display: flex;
	}
	.movie_detail {
		padding-left : 6%;
		padding-top : 10%;
		width : 70%;
		height : 70%;
		font-size: 130%;
	}
	.movie_img {
		text-align:center;
		padding-top: 5%;
		padding-right: 5%;
		width: 60%;
		height:60%;
	}
	hr {
		width:80%;
	}
	.main-body{
	height: 100vh;
}
	.movie_detail span {
		font-weight:bold;
	}
	.movie_title {
		font-size:45px;
		font-weight:700;
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
	
		<div class="movie">
			<div class="movie_detail">
			<h3 class="movie_title">${movie.mtitle }</h3>
			<hr>
			<p>
				<span>개요</span>&nbsp;&nbsp;&nbsp;${movie.mgenre } | ${movie.mcountry } | ${movie.mtime } | ${movie.mpremiere }
			</p><br>
			<p>
				<span>감독</span>&nbsp;&nbsp;&nbsp;${movie.mdirector }
			</p><br>
			<p>
				<span>출연</span>&nbsp;&nbsp;&nbsp;${movie.mactor }
			</p><br>
			<p>
				<span>등급</span>&nbsp;&nbsp;&nbsp;${movie.mgrade }
			</p><br>
			
			<hr>
			
			<h3>줄거리</h3>
			<p>${movie.mplot }</p>
				
			</div>
			<div class="movie_img">
				<img src="/MovieProject/movieui/css/screen/images/movieimage.jpg" width="240px" height="339px"/>
			</div>
		</div>
	
		<div class="review">
			<h1>리뷰 목록</h1>
			<form action="/MovieProject/moviereviewdetail.do" method="post">
				<input type="hidden" name="mId" value="${movie.mid }">
				<input type="submit" value="리뷰 더보기" class="btn btn-dark">
			</form>
	<table class="table table-hover">
		<thead>
			<tr>
				<th>리뷰번호</th>
				<th>회원아이디</th>
				<th>영화 제목</th>
				<th>평점</th>
				<th>리뷰내용</th>
				<th>작성일</th>
			</tr>
			
		</thead>
		<tbody>
			<c:forEach var="review" items="${reviewList}">
			<tr>
				<td>${review.rNum}</td>
				<td>${review.uId}</td>
				<td>${review.mTitle}</td>
				<td>${review.rRate}</td>
				<td>${review.rContent}</td>
				<td>${review.rDate}</td>
			</tr>	
			</c:forEach>
		</tbody>

	</table>
	
	
	<form action="/MovieProject/movieselect.do" method="post">
		<input type="hidden" name="movielist">
		<input type="submit" value="영화 리스트로" class="btn btn-dark">
	</form>
	<c:if test="${session_admin == 1}">
	<form action="/MovieProject/movieupdate.do?mId=${movie.mid }" method="post">
		<input type="hidden" name="movieupdate">
		<input type="submit" value="영화 수정" class="btn btn-dark">
	</form>
	</c:if>
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
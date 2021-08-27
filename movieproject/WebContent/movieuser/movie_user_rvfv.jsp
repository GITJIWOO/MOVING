<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We"
	crossorigin="anonymous">
<link rel="stylesheet" href="../movieui/css/mstyles.css" />
<link rel="stylesheet" href="../MovieProject/movieui/css/mstyles.css" />
<style>
    .main-contents {
    	display: flex;
    	justify-content: center;
    	padding-top: 45px;
    }
    .main-rvfv {
    	width: 80%;
    	font-size: 120%;
    }
	.review {
		float: left;
		width: 47%;
		padding-right: 10px;
	}
	.favorite {
		float: right;
		width: 47%;
		padding-left: 10px;
	}
	.title {
		font-size: 150%;
		margin: 10px 0;
		margin-bottom: 15px;
	}
	li {
		margin: 10px 0;
	}
	.user-info__btn {
    	display: flex;
		align-items: center;
		justify-content: center;
	}
	.button {
		float: right;
	}
	
</style>
<title>내 기록 관리</title>
</head>
<body>
	<!--main 화면 header start-->
	<!-- 로그인 전과 후, 관리자 모두 볼 수 있는 페이지 -->
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
      <c:if test="${session_id == null }">
      <div class="main-bar__column">
        <span><a class="main-bar__btn" href="/MovieProject/userjoin.do">로그인</a></span>
        <span>|</span>
        <span><a class="main-bar__btn" href="/MovieProject/requserjoin.do">회원가입</a></span>
      </div>
      </c:if>
      <c:if test="${session_id != null }">
      <div class="main-bar__column">
        <span><a class="main-bar__btn">${session_id } 님 환영합니다!</a></span>
        <span>|</span>
        <c:if test="${session_admin == 1 }">
        <span><a class="main-bar__btn" href="/MovieProject/userselect.do">관리자페이지</a></span>
        </c:if>
        <c:if test="${session_admin == 0 }">
        <form class="main-bar__btn"  action = "/MovieProject/userdetail.do" method = "post">
		<input type = "hidden" name = "uId" value = "${session_id }" />
		<input type = "submit" value = "마이페이지" />
		</form>
        </c:if>
        <span>|</span>
        <span><a class="main-bar__btn" href="/MovieProject/userlogout.do">로그아웃</a></span>
      </div>
      </c:if>
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
      		<div class="review">
      			<h1 class="title">내가 남긴 리뷰</h1>
      			<hr>
      			<ul>
	   				<c:forEach var="review" items="${reviewList }">
	   					<li>제목 | <a href="/MovieProject/moviedetail.do?mId=${review.mId}">${review.mTitle }</a>
							<form id="deleteForm"
								action="/MovieProject/moviereviewdelete.do" method="post" class="button">
								<input type="hidden" name="rNum" value="${review.rNum }">
								<input type="hidden" name="mId" value="${movie.mid }">
								<input type="button" value="삭제"
									onclick="Javascript:confirm_delete();"
									class="btn btn-outline-secondary btn-sm">
							</form>
						</li>
	   					<li>평점 | ${review.rRate }</li>
	   					<li>날짜 | ${review.rDate }</li>
	   					<li>내용 | ${review.rContent }</li>
	   					<hr>
	   				</c:forEach>
   				</ul>
      		</div>
      		<div class="favorite">
      			<h1 class="title">내가 찜 한 영화</h1>
      			<hr>
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
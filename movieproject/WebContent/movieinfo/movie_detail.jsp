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
.main-body {
  height: 150vh;
  position: relative;
}
.main-contents {
  display: flex;
  flex-direction: column;
}
.movie-info {
  margin: 30px;
}
.movie-info:first-child {
  margin: 40px;
}
.movie-info__upper {
  width: 70%;
  padding-bottom: 70px;
}

.movie__title {
  font-size: 37px;
  font-weight: 500;
  border-bottom: 2px solid rgba(0, 0, 0, 0.1);
  padding: 30px 0;
  margin-bottom: 30px;
}
.movie__detail-img {
  position: absolute;
  top: 160px;
  left: 70%;
}
.movie__detail-each {
  font-size: 20px;
  margin-bottom: 20px;
}
.movie__detail-head {
  font-weight: 700;
}
.movie-info__review {
  font-weight: 700;
  font-size: 25px;
  border-bottom: 2px solid rgba(0, 0, 0, 0.1);
  padding-bottom: 20px;
  margin: 20px 0;
}
.movie-review__btn {
  display: inline;
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
      
      
		<div class="movie-info">
			<div class="movie-info__upper">
				<div class="movie__detail">
	              	<div class="movie__title">${movie.mtitle }</div>
		              <div class="movie__detail-each">
		                <span class="movie__detail-head">개요&nbsp;</span>|
		                ${movie.mgenre } | ${movie.mcountry } | ${movie.mtime } |
		                ${movie.mpremiere }
		              </div>	
				
		              <div class="movie__detail-each">
		                <span class="movie__detail-head">감독&nbsp;</span>|
		                ${movie.mdirector }
		              </div>
				
		             <div class="movie__detail-each">
		                <span class="movie__detail-head">출연&nbsp;</span>|
		                ${movie.mactor }
		              </div>
				
		              <div class="movie__detail-each">
		                <span class="movie__detail-head">등급&nbsp;</span>|
		                ${movie.mgrade }
		              </div>
            		</div>
            	</div>
            <div class = "movie-info__lower">
	            <div class="movie__detail-each">
	              <span class="movie__detail-head">줄거리</span>${movie.mplot}  
	            </div>            			
		    </div>
		           	<div class="movie__detail">
		              <div class="movie__detail-img">
		                <img
		                  src="/MovieProject/movieui/css/screen/images/movieimage.jpg"
		                  width="240px"
		                  height="339px"
		                />
		              </div>
		            </div>
				</div>
        	<div class="movie-info">
          <h1 class="movie-info__review">리뷰 목록</h1>

          <form action="/MovieProject/moviereviewdetail.do" method="post">
            <input type="hidden" name="mId" value="${movie.mid }" />
            <input type="submit" value="리뷰 더보기" class="btn btn-dark" />
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
		
		<form class="movie-review__btn" action="/MovieProject/movieselect.do" method="post">
			<input type="hidden" name="movielist">
			<input type="submit" value="영화 리스트로" class="btn btn-dark">
		</form>
		<form class="movie-review__btn" action="/MovieProject/favoritemovieinsert.do" method="post">
			<input type="hidden" name="mid" value="${movie.mid }" />
			<input type="hidden" name="uid" value="${session_id }" />
			<input type="submit" value="찜하기" class="btn btn-dark">
		</form>
		<c:if test="${session_admin == 1}">
		<form class="movie-review__btn" action="/MovieProject/movieupdate.do?mId=${movie.mid }" method="post">
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
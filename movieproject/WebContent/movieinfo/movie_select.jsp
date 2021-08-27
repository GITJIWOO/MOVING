<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
    <link rel="stylesheet" href="../movieui/css/mstyles.css" />
    <link rel="stylesheet" href="../MovieProject/movieui/css/mstyles.css" />
    <style>
    	.main-body {
    		height: auto;
    	}
	    .main-contents {
	    	display: flex;
	    	justify-content: center;
	    	padding-top: 45px;
	    }
	    
	    .movie{
	    	position: relative;
	    	width: 80%;
	    }
	    
	    .search {
	    	margin-bottom: 30px;
	    	margin-left: 70%;
	    }
	    
	    .moviesearch {
	    	width: 300px;
	    	height: 40px;
	    }
	    
	    .movieinfo {
	    	width: 650px;
	    }
	    
	    .movieblock {
	    	position: relative;
	    	width: 650px;
	    	height: 240px;
	    	margin-top: 15px;
	    	margin-bottom: 15px;
	    }
	    
	    .movieimage {
	    	position: absolute;
	    	width: 170px;
	    	height: 240px;
	    }
	    
	    .clickimage {
	    	width: 170px;
	    	height: 240px;
	    }
	    
	    .moviecontent {
	    	position: absolute;
	    	width: 480px;
	    	height: 240px;
	    	left: 170px;
	    	padding: 10px;
	    }
	    
	    .page {
	    	display: flex;
 		   	justify-content: center;
	    	margin-top: 30px;
	    	margin-bottom: 20px;
	    }
	    
	    .movietitle {
	    	font-size: 30px;
	    	font-weight: bold;
	    	margin-top: 13px;
	    	margin-bottom: 17px;
	    }
	    
	    li {
	    	margin: 10px;
	    }
	    
	    .adminbutton {
	    	display: flex;
 		   	justify-content: center;
	    }
	    
	    hr {
	    	width: 600px;
	    }
	    .avg {
	    font-size: 20px;
	    
}
    </style>
<meta charset="UTF-8">
<title>영화 정보</title>
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
          <a class="main-bar__movie" href="/MovieProject/moviemain.do">홈</a>
          <a class="main-bar__movie" href="/MovieProject/movieselect.do">영화정보</a>
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
        <span><a class="main-bar__btn" href="/MovieProject/movieadminmain.do">관리자페이지</a></span>
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
		<div class="movie">
			<div class="adminbutton">
				<c:if test="${session_admin == 1}">
					<form action="/MovieProject/movieinfo/movie_insert_form.jsp">
						<button type="submit" class="btn btn-success">영화 등록</button>
					</form>
				</c:if>
			</div>
			<div class="search">
				<form action="/MovieProject/moviesearch.do" method="post" class="moviesearch">
					<div class="row">
						<div class="col-md-9">
							<input type="text" name="keyword" placeholder="검색어" class="form-control me-2">
						</div>
						<div class="col-md-3">
							<button type="submit" class="btn btn-secondary">검색</button>
						</div>
					</div>
				</form>
			</div>
			<div class="movieinfo">
				<c:forEach var="movie" items="${movieList}">
					<div class="movieblock">
						<div class="movieimage"><a href="/MovieProject/moviedetail.do?mId=${movie.mid}"><img src="${movie.mposter }" class="clickimage" width="170px" height="240px"></a></div>
						<div class="moviecontent">
							<ul>
								<li class="movietitle"><a href="/MovieProject/moviedetail.do?mId=${movie.mid}">
									${movie.mtitle }</a></li>
								<c:forEach var="rAR" items="${reviewAvgRateList }">
									<c:if test="${rAR.mId eq movie.mid }">
										<li class="avg">
										평점 |
			              				<c:choose>
			              				<c:when test="${1 >= rAR.rRate}">☆☆☆☆☆</c:when>
			              				<c:when test="${1.7 >= rAR.rRate}">★☆☆☆☆</c:when>
			              				<c:when test="${2.7 >= rAR.rRate}">★★☆☆☆</c:when>
			              				<c:when test="${3.7 >= rAR.rRate}">★★★☆☆</c:when>
			              				<c:when test="${4.7 >= rAR.rRate}">★★★★☆</c:when>
			              				<c:when test="${4.7 < rAR.rRate}">★★★★★</c:when>
			              				</c:choose>${rAR.rRate }
			              				</li>
									</c:if>
								</c:forEach>
								<li>${movie.mcountry }</li>
								<li>${movie.mgenre }</li>
								<li>${movie.mtime }</li>
								<li>${movie.mpremiere }</li>
								<li>감독 | ${movie.mdirector }</li>
								<li>출연 | ${movie.mactor }</li>
							</ul>
						</div>
					</div>
					<div class="moviehr"><hr></div>
				</c:forEach>
			</div>
			<div class="page">
				<!-- 페이징 버튼 -->
				<c:if test="${moviePageDTO.hasMovie()}">
					<c:if test="${keyword == null}">
						<!-- 뒤로가기 버튼 여부 -->
						<c:if test="${moviePageDTO.startPage > 10}">
							<form action="/MovieProject/movieselect.do?page=${moviePageDTO.startPage - 10}">
								<input type="hidden" name="page" value="${moviePageDTO.startPage - 10}">
								<button type="submit" class="btn btn-primary">이전</button>
							</form>
						</c:if>
						
						<!-- 페이지 (10개 까지) -->
						<c:forEach var="pNo" begin="${moviePageDTO.startPage}" end="${moviePageDTO.endPage}">
							<form action="/MovieProject/movieselect.do?page=${pNo }">
								<input type="hidden" name="page" value="${pNo}">
								<button type="submit" class="btn btn-info">${pNo }</button>
							</form>
						</c:forEach>
						
						<!-- 다음 페이지 여부-->
						<c:if test="${moviePageDTO.endPage < moviePageDTO.totalPages}">
							<form action="/MovieProject/movieselect.do?page=${moviePageDTO.startPage + 10}">
								<input type="hidden" name="page" value="${moviePageDTO.startPage + 10}">
								<button type="submit" class="btn btn-primary">다음</button>
							</form>
						</c:if>
					</c:if>
					
					
					
					<!-- 검색 페이징 처리 하기 -->
					<c:if test="${movieCount > 0 }">
						<!-- 뒤로가기 버튼 여부 -->
						<c:if test="${moviePageDTO.startPage > 10}">
							<form action="/MovieProject/moviesearch.do?page=${pNo - 10}">
								<input type="hidden" name="keyword" value="${keyword }">
								<input type="hidden" name="page" value="${moviePageDTO.startPage - 10}">
								<button type="submit" class="btn btn-primary">이전</button>
							</form>
						</c:if>
						
						<!-- 페이지 (10개 까지) -->
						<c:forEach var="pNo" begin="${moviePageDTO.startPage}" end="${moviePageDTO.endPage}">
							<form action="/MovieProject/moviesearch.do?page=${pNo }">
								<input type="hidden" name="keyword" value="${keyword }">
								<input type="hidden" name="page" value="${pNo}">
								<button type="submit" class="btn btn-info">${pNo }</button>
							</form>
						</c:forEach>
						
						<!-- 다음 페이지 여부-->
						<c:if test="${moviePageDTO.endPage < moviePageDTO.totalPages}">
							<form action="/MovieProject/moviesearch.do?page=${pNo + 10}">
								<input type="hidden" name="keyword" value="${keyword }">
								<input type="hidden" name="page" value="${moviePageDTO.startPage + 10}">
								<button type="submit" class="btn btn-primary">다음</button>
							</form>
						</c:if>
					</c:if>
				</c:if>
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
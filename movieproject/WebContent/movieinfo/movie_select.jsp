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
	    .main-contents {
	    	display: flex;
	    	justify-content: center;
	    	padding-top: 30px;
	    }
	    .movie{
	    	position: relative;
	    }
	    .search {
	    	margin-bottom: 30px;
	    	margin-left: 370px;
	    }
	    .movieinfo {
	    	border: 1px solid blue;
	    	width: 530px;
	    }
	    .movieblock {
	    	border: 1px solid black;
	    	width: 250px;
	    	height: 130px;
	    }
	    .page {
	    	margin-top: 30px;
	    }
    </style>
<meta charset="UTF-8">
<title>영화 정보</title>
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
          <a class="main-bar__movie" href="/MovieProject/moviedetail.do">영화정보</a>
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
		<div class="movie">
			<div class="search">
				<form action="/MovieProject/moviesearch.do" method="post">
					<input type="text" name="keyword" placeholder="검색어"/>
					<input class="" type="submit" value="검색"/>
				</form>
			</div>
			<div class="movieinfo">
				<c:forEach var="movie" items="${movieList}">
					<div class="movieblock">	
						<ul>
							<li><a href="/MovieProject/moviedetail.do?mId=${movie.mid}">
								${movie.mtitle }
							</a></li>
							<li>${movie.mcountry }</li>
							<li>${movie.mgenre }</li>
							<li>${movie.mtime }</li>
							<li>${movie.mpremiere }</li>
						</ul>
					</div>
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
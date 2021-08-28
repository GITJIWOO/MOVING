=<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
<meta charset="UTF-8">
<link rel="stylesheet" href="../movieui/css/mstyles.css" />
<link rel="stylesheet" href="../MovieProject/movieui/css/mstyles.css" />
<title>메인 화면</title>
<style>
	.main-body {
		height : 170vh;
	}
	h2 { 
		font-size: 50px;
		text-align:center;
		padding:50px;
	}
	 .carousel-fade .carousel-item, .carousel-item img {
     max-height: 120vh;
     min-height: 120vh;
     max-width: 100vh;
     min-width: 100vh
     display:flex;
      } 
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
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
	<c:if test="${update_status == 1 }">
		<script>alert('업데이트가 완료되었습니다.');</script>
	</c:if>
	<c:if test="${update_status == 0 }">
		<script>alert('업데이트에 실패하였습니다.'); history.back();</script>
	</c:if>
    <div class="main-body">
      <div class="main-sidebar"></div>
      <div class="main-contents">	
	<c:if test="${session_id != null && login_fail == null && session_admin == 0}">
	</c:if>
	<c:if test="${login_fail == 0 }">
		<script>alert('아이디가 일치하지 않습니다'); history.back(); </script>
	</c:if>
	<c:if test="${login_fail == -1 }">
		<script>alert('비밀번호가 일치하지 않습니다.'); history.back(); </script>
	</c:if>
	<div class="container">
		<div class="row">
			<div class="col-md-6">
	<!-- ------------- -->
			<h2>상영 중인 영화</h2>
	        <div id="carousel-example-generic" class="carousel slide">
	            <!-- Indicators -->
	            <ol class="carousel-indicators">
	              <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
	              <li data-target="#carousel-example-generic" data-slide-to="1"></li>
	              <li data-target="#carousel-example-generic" data-slide-to="2"></li>
	            </ol>
	                 <!-- Carousel items -->
	             <div class="carousel-inner">
	                <div class="carousel-item active">
	                   <a href="/MovieProject/moviedetail.do?mId=1"><img class="image" src="https://movie-phinf.pstatic.net/20111223_21/1324628831674hTrFY_JPEG/movie_image.jpg" alt="First slide"></a>
	                </div>
	                <div class="carousel-item">
	                   <a href="/MovieProject/moviedetail.do?mId=2"><img class="image" src="https://movie-phinf.pstatic.net/20180518_218/1526609377997LxLgL_JPEG/movie_image.jpg" alt="Second slide"></a>
	                </div>
	                <div class="carousel-item">
	                   <a href="/MovieProject/moviedetail.do?mId=3"><img class="image" src="https://movie-phinf.pstatic.net/20111222_81/1324541324870BNbuJ_JPEG/movie_image.jpg" alt="Third slide"></a>
	                </div>
	             </div>
	            <!-- Controls -->
	              <a class="carousel-control-prev" href="#carousel-example-generic" data-slide="prev">
	                <span class="carousel-control-prev-icon"></span>
	              </a>
	              <a class="carousel-control-next" href="#carousel-example-generic" data-slide="next">
	                <span class="carousel-control-next-icon"></span>
	              </a>
	          </div>
			
			
	<!-- ------------- -->		
			</div>
			<div class="col-md-6">
			<!-- ----------------- -->
			
			<h2>개봉 예정 영화</h2>
	        <div id="carousel-example-generic2" class="carousel slide">
	            <!-- Indicators -->
	            <ol class="carousel-indicators">
	              <li data-target="#carousel-example-generic2" data-slide-to="0" class="active"></li>
	              <li data-target="#carousel-example-generic2" data-slide-to="1"></li>
	              <li data-target="#carousel-example-generic2" data-slide-to="2"></li>
	            </ol>
	                 <!-- Carousel items -->
	             <div class="carousel-inner">
	                <div class="carousel-item active">
	                   <a href="/MovieProject/moviedetail.do?mId=1"><img class="image" src="https://movie-phinf.pstatic.net/20190128_22/1548638810964Go9Wy_JPEG/movie_image.jpg" alt="First slide"></a>
	                </div>
	                <div class="carousel-item">
	                   <a href="/MovieProject/moviedetail.do?mId=2"><img class="image" src="https://movie-phinf.pstatic.net/20111221_75/1324477552832sDC6E_JPEG/movie_image.jpg" alt="Second slide"></a>
	                </div>
	                <div class="carousel-item">
	                   <a href="/MovieProject/moviedetail.do?mId=3"><img class="image" src="https://movie-phinf.pstatic.net/20200114_147/1578963901287frmdl_JPEG/movie_image.jpg" alt="Third slide"></a>
	                </div>
	             </div>
	            <!-- Controls -->
	              <a class="carousel-control-prev" href="#carousel-example-generic2" data-slide="prev">
	                <span class="carousel-control-prev-icon"></span>
	              </a>
	              <a class="carousel-control-next" href="#carousel-example-generic2" data-slide="next">
	                <span class="carousel-control-next-icon"></span>
	              </a>
	          </div>
			
			<!-- ------------------ -->
			</div>
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
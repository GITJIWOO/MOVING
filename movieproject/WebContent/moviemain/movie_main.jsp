=<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../movieui/css/mstyles.css" />
<link rel="stylesheet" href="../MovieProject/movieui/css/mstyles.css" />
<title>메인 화면</title>
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
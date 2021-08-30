<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../movieui/css/mstyles.css" />
<link rel="stylesheet" href="../MovieProject/movieui/css/mstyles.css" />
<title>메인 화면</title>
<style>
.main-body {
  height: 700px;
}
.main-contents {
  background-color: #2b2b2b;
}
.main-image {
  display: flex;
  justify-content: center;
  align-items: center;
  position: relative;
}
.main-contents__title {
  top: 0;
  width: 98%;
  padding: 15px;
  font-size: 25px;
  font-weight: 600;
  color: white;
  background-color: black;
}
.main-image {
  transition: all 0.5s;
}
.img-btn {
  position: absolute;
  z-index: 100;
  color: rgba(255, 255, 255, 0.6);
  font-size: 45px;
  font-weight: 100;
}
.img-btn:first-child {
  left: 2%;
}
.img-btn:last-child {
  right: 2%;
}
.img-btn:hover {
  color: rgba(255, 255, 255, 1);
}
.move-moviedetail {
  position: absolute;
  z-index: 100;
  background-color: transparent;
  color: white;
  font-weight: 500;
  border: 1px solid rgba(255, 255, 255, 0.6);
  border-radius: 4px;
  cursor: pointer;
  width: 95px;
  height: 35px;
  bottom: 10%;
  left: 47%;
}
.move-moviedetail:hover {
  border: 1px solid rgba(255, 255, 255, 1);
  font-weight: 600;
}
</style>
<script
  src="https://kit.fontawesome.com/62b1f47417.js"
  crossorigin="anonymous"
></script>
<script>
  var num = 1;
  // 다음 버튼
  function nextPic() {
    num++;
    if (num > 3) {
      num = 1;
    }
    document.getElementById("poster").src =
      "<%=request.getContextPath() %>/movieui/css/screen/images/main" + num + ".jpg";
    return false;
  }
  function prevPic() {
    num--;
    if (num < 1) {
      num = 3;
    }
    document.getElementById("poster").src =
      "<%=request.getContextPath() %>/movieui/css/screen/images/main" + num + ".jpg";
    return false;
  }
  function movieDetail() {
    document.getElementById("posterbtn").href =
      "/MovieProject/moviedetail.do?mId=" + num;
  }
</script>
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
	
	<c:if test="${session_id != null && login_fail == null && session_admin == 0}">
	</c:if>
	<c:if test="${login_fail == 0 }">
		<script>alert('아이디가 일치하지 않습니다'); history.back(); </script>
	</c:if>
	<c:if test="${login_fail == -1 }">
		<script>alert('비밀번호가 일치하지 않습니다.'); history.back(); </script>
	</c:if>
    <!-- main 화면 body start-->

    <div class="main-body">
      <div class="main-sidebar"></div>
      <div class="main-contents">
        <div class="main-image">
          <a class="img-btn" href="#" onclick="return prevPic()">
            <i class="fas fa-chevron-left i-btn"></i>
          </a>
          <img
            width="1400px"
            height="700px"
            src="<%=request.getContextPath() %>/movieui/css/screen/images/main1.jpg"
            id="poster"
          />
          <a id="posterbtn" href="#">
            <button class="move-moviedetail" onclick="return movieDetail()">
              	자세히 보기
            </button>
          </a>
          <a class="img-btn" href="#" onclick="return nextPic()">
            <i class="fas fa-chevron-right i-btn"></i>
          </a>
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
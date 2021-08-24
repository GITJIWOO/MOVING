<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 내정보 확인 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../movieui/css/mstyles.css" />
<link rel="stylesheet" href="../MovieProject/movieui/css/mstyles.css" />
<style>
.main-body{
	height: 100vh;
}
table,
tbody,
tfoot,
thead,
tr,
th,
td{
  margin: 0;
  padding: 0;
  border: 0;
  font-size: 100%;
  font: inherit;
  vertical-align: baseline;
}
</style>
<title>회원정보</title>
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
    <div class="detail-header">
      <h1 class="detail-title">회원정보</h1>
      <table class="detail-table" border="1">
        <tr class="detail-table__row">
          <th class="detail-table__item">ID</th>
			<td class="detail-table__item">${user.uId }</td>
		</tr>
        <tr class="detail-table__row">
			<th class="detail-table__item">NAME</th>
			<td class="detail-table__item">${user.uName }</td>
		</tr>
        <tr class="detail-table__row">
			<th class="detail-table__item">E-mail</th>
			<td class="detail-table__item">${user.uEmail }</td>
		</tr>
        <tr class="detail-table__row">
			<th class="detail-table__item">Age</th>
			<td class="detail-table__item">${user.uAge }</td>
		</tr>
      </table>
      <div class="user-info__btn">
		<form action = "/MovieProject/getuser.do" method = "post">
			<input type = "hidden" name = "uId" value ="${user.uId }" />
			<input type = "submit" value = "회원 정보 변경" />
		</form>
      </div>
      <div class="user-info__btn">
		<form action = "/MovieProject/requserdelete.do" method = "post">
			<input type = "hidden" name = "uId" value ="${user.uId }" />
			<input type = "submit" value = "회원 탈퇴" />
        </form>
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
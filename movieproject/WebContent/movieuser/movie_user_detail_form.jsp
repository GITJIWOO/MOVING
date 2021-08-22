<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 내정보 확인 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../movieui/css/mstyles.css" />
<link rel="stylesheet" href="../MovieProject/movieui/css/mstyles.css" />
<title>Insert title here</title>
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
          <a class="main-bar__movie" href="/MovieProject/movieselect.do">영화정보</a>
          <a class="main-bar__movie" href="#">영화예매</a>
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
</body>
</html>
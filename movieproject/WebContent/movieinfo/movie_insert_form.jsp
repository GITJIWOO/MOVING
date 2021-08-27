<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
    <link rel="stylesheet" href="../movieui/css/mstyles.css" />
    <link rel="stylesheet" href="../MovieProject/movieui/css/mstyles.css" />
<meta charset="UTF-8">
<title>영화 정보 기입</title>
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
		<div class="movieinsert">
			<h1>영화 정보 기입</h1>
			<form action="http://localhost:8181/MovieProject/movieinsert.do" method="post">
				<table border="1"> 
					<tr>
						<th>영화 제목</th>
						<td><input type="text" name="movietitle" required="required"/><br/></td>
					</tr>
					<tr>
						<th>영화 등급</th>
						<td><input type="text" name="moviegrade" required="required"/><br/></td>
					</tr>
					<tr>
						<th>영화 제작 국가</th>
						<td><input type="text" name="moviecountry" required="required"/><br/></td>
					</tr>
					<tr>
						<th>영화 장르</th>
						<td>
							<input type="checkbox" name="moviegenre" value="액션" />액션&nbsp;
							<input type="checkbox" name="moviegenre" value="모험" />모험&nbsp;
							<input type="checkbox" name="moviegenre" value="애니메이션" />애니메이션&nbsp;
							<input type="checkbox" name="moviegenre" value="코미디" />코미디&nbsp;
							<input type="checkbox" name="moviegenre" value="범죄" />범죄&nbsp;<br/>
							<input type="checkbox" name="moviegenre" value="다큐" />다큐&nbsp;
							<input type="checkbox" name="moviegenre" value="드라마" />드라마&nbsp;
							<input type="checkbox" name="moviegenre" value="가족" />가족&nbsp;
							<input type="checkbox" name="moviegenre" value="판타지" />판타지&nbsp;
							<input type="checkbox" name="moviegenre" value="역사" />역사&nbsp;<br/>
							<input type="checkbox" name="moviegenre" value="공포" />공포&nbsp;
							<input type="checkbox" name="moviegenre" value="뮤지컬" />뮤지컬&nbsp;
							<input type="checkbox" name="moviegenre" value="미스터리" />미스터리&nbsp;
							<input type="checkbox" name="moviegenre" value="멜로" />멜로&nbsp;
							<input type="checkbox" name="moviegenre" value="SF" />SF&nbsp;<br/>
							<input type="checkbox" name="moviegenre" value="스포츠" />스포츠&nbsp;
							<input type="checkbox" name="moviegenre" value="스릴러" />스릴러&nbsp;
							<input type="checkbox" name="moviegenre" value="전쟁" />전쟁&nbsp;
							
						</td>
					</tr>
					<tr>
						<th>영화 런닝타임</th>
						<td><input type="text" name="movietime" required="required"/><br/></td>
					</tr>
					<tr>
						<th>영화 개봉일</th>
						<td><input type="date" name="movieprimere" required="required"/><br/></td>
					</tr>
					<tr>
						<th>영화 감독</th>
						<td><input type="text" name="moviedirector" required="required"/><br/></td>
					</tr>
					<tr>
						<th>출연진</th>
						<td><input type="text" name="movieactor" required="required"/><br/></td>
					</tr>
					<tr>
						<th>영화 줄거리</th>
						<td><textarea rows="10" cols="50" name="movieplot" required="required"></textarea><br/></td>
					</tr>
					<tr>
						<th>영화 티저주소</th>
						<td><input type="text" name="teaseraddress" required/><br/></td>
					</tr>
					<tr>
						<td><input type="submit" value="올리기"></td>
						<td><input type="reset" value="초기화"></td>
					</tr>
		
				</table>
			</form>
			<form action="/MovieProject/movieselect.do" method="post">
				<input type="hidden" name="movielist">
				<input type="submit" value="돌아가기">
			</form>
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
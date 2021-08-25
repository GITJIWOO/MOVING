<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
						<td><input type="text" name="moviegenre" required="required"/><br/></td>
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
						<td><input type="text" name="teaseraddress" required="required"/><br/></td>
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="../movieui/css/mstyles.css" />
    <link rel="stylesheet" href="../MovieProject/movieui/css/mstyles.css" />
    <style>
	    #content {
	    	display: flex;
	    	justify-content: center;
	    	padding-top: 120px;
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
          ><a href="/MovieProject/moviemain.do"><img src="../movieui/css/screen/images/logo.png" /></a
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
	<div id="content">
		<h1>영화 정보</h1>
		<table border="1">
			<tr>
				<th>영화 제목</th>
				<th>영화 등급</th>
				<th>영화 개봉일</th>
			</tr>
			<c:forEach var="movie" items="${movieList}">
				<tr>
					<td><a href="/MovieProject/moviedetail.do?mId=${movie.mid}">
							${movie.mtitle }
						</a>
					</td>
					<td>${movie.mgrade }</td>
					<td>${movie.mpremiere }</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>
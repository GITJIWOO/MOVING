<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We"
	crossorigin="anonymous">
<link rel="stylesheet" href="../movieui/css/mstyles.css" />
<link rel="stylesheet" href="../MovieProject/movieui/css/mstyles.css" />
<style>
#content {
	/* 	display: flex; */
	justify-content: center;
	text-align: center;
	margin: 20px auto 20px auto;
}
</style>
<meta charset="EUC-KR">
<title>리뷰 수정ㅇ</title>
</head>
<body>
	<!--main 화면 header start-->
	<div class="main-bar">
		<div class="main-bar__column">
			<span><a href="/MovieProject/moviemain.do"><img
					src="<%=request.getContextPath()%>/movieui/css/screen/images/logo.png" /></a></span>
		</div>
		<div class="main-bar__column">
			<span> <a class="main-bar__movie"
				href="/MovieProject/movieselect.do">영화정보</a> <a
				class="main-bar__movie" href="#">다운로드</a>
			</span>
		</div>
		<div class="main-bar__column">
			<span><a class="main-bar__btn"
				href="/MovieProject/userjoin.do">로그인</a></span> <span>|</span> <span><a
				class="main-bar__btn" href="/MovieProject/requserjoin.do">회원가입</a></span>
		</div>
	</div>
	<!-- main 화면 header end-->
	<!-- main 화면 body start-->
	<div class="main-body">
		<div class="main-sidebar"></div>
		<div class="main-contents">
			<div id="contents">


				<form action="/MovieProject/moviereviewupdate.do" method="post">
					<input type="hidden" name="rNum" value="${review.rNum }"> <input
						type="hidden" name="mId" value="${movie.mId }">
					<table class="table table-striped table-hover">
						<tr>
							<td>글쓴이</td>
							<td><input type="text" name="uId" value="${review.uId}"
								readonly></td>
						</tr>
						<tr>
							<td>평점</td>
							<td><select name="rRate">
									<option>${review.rRate}</option>
									<option value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
									<option value="5">5</option>
							</select></td>
						</tr>
						<tr>
							<td>내용</td>
							<td><textarea rows="10" cols="30" name="rContent">${review.rContent}</textarea></td>


						</tr>
						<!-- 						<tr> -->
						<!-- 							<td>등록날짜</td> -->
						<%-- 							<td>${review.rDate }</td> --%>
						<!-- 						</tr> -->
						<tr>
							<td><input type="submit" value="수정하기"> <input
								type="reset" value="초기화"> <a
								href="/MovieProject/moviedetail.do?mId=${review.mId }"> <input
									type="button" value="목록으로">
							</a></td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
		<div class="main-sidebar"></div>
	<!-- foot start -->
	<div id="footer">
		<p>
			<b>Creators</b>&nbsp;&nbsp;김지우 , 최재인 , 이한빈 , 김영훈
		</p>
		<p>
			<b>Contact </b>&nbsp;&nbsp;<a href="https://github.com/GITJIWOO">https://github.com/GITJIWOO</a>
		</p>
		<hr>
		<p id="copyright">
			<b>ⓒ MOVING Corp.</b>
		</p>
	</div>
	<!-- foot end -->
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%-- 관리자가 유저정보 확인 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We"
      crossorigin="anonymous"
    />
<link rel="stylesheet" href="../movieui/css/mstyles.css" />
<link rel="stylesheet" href="../MovieProject/movieui/css/mstyles.css" />
<style>
	.main-contents {
	  display: flex;
	  flex-direction: column;
	  align-items: center;
	}
	.info-header {
	  display: flex;
	  flex-direction: column;
	  align-items: center;
	}
	.info-header__title {
	  font-size: 30px;
	  font-weight: 500;
	  padding: 20px 0;
	  margin: 15px 0;
	  border-bottom: 1px solid rgba(0, 0, 0, 0.2);
	}
	.page-link{
		color: black;
	}
</style>
<title>사용자 정보 조회</title>
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
        <span><a class="main-bar__btn">${session_id } 님 환영합니다!</a></span>
        <span>|</span>
        <span><a class="main-bar__btn" href="/MovieProject/userselect.do">관리자페이지</a></span>
        <span>|</span>
        <span><a class="main-bar__btn" href="/MovieProject/userlogout.do">로그아웃</a></span>
      </div>
    </div>
    <!-- main 화면 header end-->
    <!-- main 화면 body start-->
    <div class="main-body">
      <div class="main-sidebar"></div>
      <div class="main-contents">
        <div class="info-header">
          <h1 class="info-header__title">사용자 정보 조회</h1>

            <table class="table table-hover">
              <thead class="info-form__content">
                <tr>
					<th class="info-form_each">ID</th>
					<th class="info-form_each">Password</th>
					<th class="info-form_each">Name</th>
					<th class="info-form_each">Email</th>
					<th class="info-form_each">Age</th>
				</tr>
			</thead>
              <tbody class="info-form__content">
				<c:forEach var = "user" items = "${userList }">
					<tr>
						<td class="info-form_each">${user.uId }</td>
						<td class="info-form_each">${user.uPw }</td>
						<td class="info-form_each">${user.uName }</td>
						<td class="info-form_each">${user.uEmail }</td>
						<td class="info-form_each">${user.uAge }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<%-- 페이징 시작 --%>

		<c:if test = "${userDTO.hasUser() }">
		<ul class = "pagination justify-content-center">
			<c:if test = "${userDTO.startPage > 10 }">
			<li class = "page-item">
				<a class="page-link" href = "/MovieProject/userselect.do?page=${userDTO.startPage - 10 }">«</a>
			</li>
			</c:if>
			
			<c:forEach var = "pageNum" begin = "${userDTO.startPage }" end = "${userDTO.endPage }">
				<c:if test = "${userDTO.currentPage == pageNum }">
				<li class = "page-item active">			
					<a class="page-link" href = "/MovieProject/userselect.do?page=${pageNum }">${pageNum }</a>
				</li>
				</c:if>
				
				<c:if test = "${userDTO.currentPage != pageNum }">			
				<li class = "page-item">			
					<a class="page-link" href = "/MovieProject/userselect.do?page=${pageNum }">${pageNum }</a>
				</li>	
				</c:if>		
			</c:forEach>
			
			<c:if test = "${userDTO.endPage < userDTO.totalPages }">
			<li class = "page-item">			
				<a class="page-link" href = "/MovieProject/userselect.do?page=${userDTO.startPage + 10 }">»</a>
			</li>
			</c:if>
		</ul>
		</c:if>

		<%-- 페이징 끝 --%>

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
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%-- 관리자가 유저정보 확인 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../movieui/css/mstyles.css" />
<link rel="stylesheet" href="../MovieProject/movieui/css/mstyles.css" />
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
        <div class="info-header">
          <h1 class="info-header__title">사용자 정보 조회</h1>
          <form class="info-form">
            <table class="info-form__title" border="1">
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
		<div class="info-page">
		<c:if test = "${userDTO.hasUser() }">
		
			<c:if test = "${userDTO.startPage > 10 }">
				<a class="info-page__each" class="info-page__each" href = "/MovieProject/userselect.do?page=${userDTO.startPage - 10 }">&lt;</a>
			</c:if>
			
			<c:forEach var = "pageNum" begin = "${userDTO.startPage }" end = "${userDTO.endPage }">
				<a class="info-page__each" href = "/MovieProject/userselect.do?page=${pageNum }">[${pageNum }]</a>
			</c:forEach>
			
			<c:if test = "${userDTO.endPage < userDTO.totalPages }">
				<a class="info-page__each" href = "/MovieProject/userselect.do?page=${userDTO.startPage + 10 }">&gt;</a>
			</c:if>	
		</c:if>
		</div>
		<%-- 페이징 끝 --%>
	</form>
	</div>
      </div>
      <div class="main-sidebar"></div>
    </div>
    <!-- main 화면 body end-->
</body>
</html>
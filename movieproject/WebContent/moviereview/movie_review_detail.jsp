<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
<link rel="stylesheet" href="../movieui/css/mstyles.css" />
<link rel="stylesheet" href="../MovieProject/movieui/css/mstyles.css" />
<style>
	 #content {
	    	display: flex;
	    	justify-content: center;
	    	padding: 400px 400px 400px 400px;
	    }
</style>
<meta charset="UTF-8">
<title>리뷰 디테일</title>
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
      <div id="contents">
      
      <form action="/MovieProject/moviereviewinsert.do" method="post">
		<input type="hidden" name="mId" value="${movie.mid }">
		<input type="hidden" name="uId" value="${uId}">
		<table class="table table-striped table-hover" >
			
			<c:if test="${uId != null }">
			<tr>
				<td>영화제목</td>
				<td><input type="text" name="mTitle" value="${movie.mtitle }" readonly>
				<td>글쓴이</td>
				<td><input type="text" name="uId" value="${uId }" readonly></td>
			</tr>
			<tr>
				<td>리뷰내용</td>
				<td><textarea rows="10" cols="30" name="rContent">${review.rContent}</textarea> </td>
			</tr>
			<tr>
				<td>평점</td>
				<td><select name="rRate">
						<option>평점</option>
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
				</select></td>

			</tr>
			
			
			<tr>
				<td>
				<input type="submit" value="등록">
				<input type="reset" value="초기화"> 
				<a href="/MovieProject/moviedetail.do?mId=${movie.mid }"> 
					<input type="button" value="목록으로">
				</a>
				</td>
			</tr>
			</c:if>
		</table>
      </form>
      
      
      <!-- 리뷰 디테일 목록 -->
<!-- 			<form action="/MovieProject/moviereviewwrite.do" method="post"> -->
<%-- 				<input type="hidden" name="mId" value="${movie.mid }"> --%>
<%-- 				<input type="hidden" name="uId" value="${uId }"> --%>
<!-- 				 <input  -->
<!-- 					type="submit" value="리뷰작성"> -->
<!-- 			</form> -->
		
			

			<c:set var="review" value="${reviewDetail }"></c:set>
			<table class="table table-striped table-hover">
				<thead>
					<tr>
						<th>리뷰번호</th>
						<th>회원아이디</th>
						<th>영화 제목</th>
						<th>평점</th>
						<th>리뷰내용</th>
						<th>작성일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="review" items="${reviewList }">
						<tr>
							<td>${review.rNum }</td>
							<td>${review.uId }</td>
							<td>${review.mTitle }</td>
							<td>${review.rRate }</td>
							<td>${review.rContent }</td>
							<td>${review.rDate }</td>
						<c:if test="${review.uId == uId }">
							<td><select onchange="ddd(this.value,'${review.rNum}')">
									<option value=""></option>
									<option value="/MovieProject/moviereviewupdateok.do">수정</option>
									<option value="/MovieProject/moviereviewdelete.do">삭제</option>
							</select></td>
						</c:if>
						</tr>
					</c:forEach>
				</tbody>
				<tr>

				</tr>
			</table>
			<a href="/MovieProject/moviedetail.do?mId=${movie.mid }"> 
				<input type="button" value="목록으로">
			</a>
			<%-- 페이징 버튼 만들기 
	표현할 글이 있는 경우에만 버튼을 표시함--%>
			<c:if test="${pageDTO.hasBoard()}">

				<%-- 맨 처음 --%>
				<c:if test="${pageDTO.startPage > 5}">
					<a href="/MovieProject/moviereviewdetail.do?page=1"> [first]</a>
				</c:if>

				<%-- 뒤로가기 버튼을 표시할지 말지 결정하는 부분 --%>
				<c:if test="${pageDTO.startPage > 5}">
					<a
						href="/MovieProject/moviereviewdetail.do?page=${pageDTO.startPage - 5}">
						[prev] </a>
				</c:if>

				<%-- 페이지 번호 10개 묶음을 깔아주는 부분 --%>
				<c:forEach var="pNo" begin="${pageDTO.startPage}"
					end="${pageDTO.endPage}">
					<a href="/MovieProject/moviereviewdetail.do?page=${pNo}">[${pNo}]</a>
				</c:forEach>

				<%-- 다음으로 가기 버튼을 표시할지 말지 결정하는 부분 --%>
				<c:if test="${pageDTO.endPage < pageDTO.totalPages}">
					<a
						href="/MovieProject/moviereviewdetail.do?page=${pageDTO.startPage + 5}">
						[next] </a>
				</c:if>

				<%-- 마지막 --%>
				<c:if test="${pageDTO.endPage < pageDTO.totalPages}">
					<a
						href="/MovieProject/moviereviewdetail.do?page=${pageDTO.endPage}">
						[last] </a>
				</c:if>
			</c:if>
			<%-- 페이징 부분 끝 --%>
			</div>
	<div class="main-sidebar"></div>
    </div>
    </div>
    <!-- main 화면 body end-->


	<script type="text/javascript">
		function ddd(locationParam, rnum) {
			location.href = locationParam + "?rNum=" + rnum;
		}
	</script>
</body>
</html>

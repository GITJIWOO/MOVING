<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%-- 관리자가 유저정보 확인 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 정보 조회</title>
</head>
<body>
	<h1>사용자 정보 조회</h1>
	<form>
		<table border = "1">
			<thead>
				<tr>
					<th>ID</th>
					<th>Password</th>
					<th>Name</th>
					<th>Email</th>
					<th>Age</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var = "user" items = "${userList }">
					<tr>
						<td>${user.uId }</td>
						<td>${user.uPw }</td>
						<td>${user.uName }</td>
						<td>${user.uEmail }</td>
						<td>${user.uAge }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<%-- 페이징 시작 --%>
		<c:if test = "${userDTO.hasUser() }">
		
			<c:if test = "${userDTO.startPage > 10 }">
				<a href = "/MovieProject/userselect.do?page=${userDTO.startPage - 10 }">[PREV]</a>
			</c:if>
			
			<c:forEach var = "pageNum" begin = "${userDTO.startPage }" end = "${userDTO.endPage }">
				<a href = "/MovieProject/userselect.do?page=${pageNum }">[${pageNum }]</a>
			</c:forEach>
			
			<c:if test = "${userDTO.endPage < userDTO.totalPages }">
				<a href = "/MovieProject/userselect.do?page=${userDTO.startPage + 10 }">[NEXT]</a>
			</c:if>
			
		</c:if>
		<%-- 페이징 끝 --%>
	</form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 정보 조회 페이지</title>
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
				<c:forEach var = "board" items = "${boardList }">
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</form>
</body>
</html>
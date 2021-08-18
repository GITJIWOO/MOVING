<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴 확인</title>
</head>
<body>
	<input type = "button" onClick = "alarm()" value = "uDelete" />
	<script type = "text/javascript">
		var msg = "정말 탈퇴하시겠습니까?";
		var check = confirm(msg);
		var ok = "/MovieProject/userdelete.do";
		var nope = "/MovieProject/moviemain.do";
		if(check == true){
			alert("탈퇴 완료되었습니다.");
			location.href = ok;
		}else{
			alert("메인화면으로 돌아갑니다.");
			location.href = nope;
		}
	</script>
</body>
</html>
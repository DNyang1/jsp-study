<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 폼 페이지에서 입력한 비밀번호 값이 숫자인지 검사하기-->
	<form name="loginForm" action="validation02_process.jsp" method="post">
		<p>아이디: <input type="text" name="id"></p>
		<p>비밀번호: <input type="password" name="passwd"></p>
		<button type="submit" onclick="checkLogin(event)">전송</button>
	
	</form>

	<script type="text/javascript">
		function checkLogin(e) {
			const form = document.loginForm;
			
			for (let ch of form.id.value) {
				if (ch < 'a' || ch > 'z') {
					alert("아이디 소문자만 입력 가능");
					form.id.select();
					e.preventDefault();
					return;
				}
				
			}
			
			if (isNaN(form.passwd.value)) {
				alert("아이디는 숫자만 입력 가능");
				form.id.select();
				e.preventDefault(); // 기본 동작 막기(여기서는 폼 제출을 차단)
				return;
			}
			
			// form.submit(); // 일반 button 인 경우 필요, submit 버튼에서는 불필요
		}
	</script>
	
</body>
</html>
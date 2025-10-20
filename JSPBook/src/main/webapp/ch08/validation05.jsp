<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Validation</title>
</head>
<body>
	<!-- 회원 가입 폼 페이지에 입력한 데이터 형식 유효성 검사하기 -->
	<form name="member" action="validation05_process.jsp" method="post">
		<p>아이디: <input type="text" name="id"></p>
		<p>비밀번호: <input type="password" name="passwd"></p>
		<p>이름: <input type="text" name="name"></p>
		<p>
			연락처: 
			<select name="phone1">
				<option value="010">010</option>
				<option value="011">011</option>
				<option value="016">016</option>
				<option value="017">017</option>
				<option value="019">019</option>
			</select> - 
			<input type="text" maxlength="4" size="4" name="phone2"> - 
			<input type="text" maxlength="4" size="4" name="phone3">
		</p>
		<p>이메일: <input type="text" name="email"></p>
		<button type="button" onclick="checkMember()">가입하기</button> 
	</form>
	
	<script type="text/javascript">
		function checkMember(e) {
			const regExpPhone = /^\d{3}=\d{3,4}-\d{4}$/;

			// 이메일 형태인지 검사
			const regExpEmail =
					/^[0-9a-zA-z]([-_.]?[0-9a-zA-z])*@[0-9a-zA-z]([-_.]?[0-9a-zA-z])*\.[a-zA-Z]{2,3} /;
//				^[0-9a-zA-z]: 첫 글자는 영문, 숫자여야 함
//				([-_.]?[0-9a-zA-z])*: - 또는_ 또는 . 가 있을수도 있고 그 뒤에 영문 숫자가 와야함 - 이 그룹이 0번 이상 반복
			// 즉, 마침표 등이 연속으로 나오거나 시작. 끝에 오지 못하게 어느정도 제어
			// @: 반드시 하나
			// 도메인 부분도 동일한 패턴
			// \.[a-zA-Z]{2,3}: 점(.) + 알파벳 2~3글자
			// 예: .kr .com 등
			
			const regExpPasswd = /^[0-9]{4,}$/ // 최소 자릿수 요구
			
			const form = document.member;
			// 영문 대소문자, 한글, 한글의 자음과 모음으로 시작하는지 검사
			const regExpId = /^[a-zA-Zㄱ-ㅎㅏ-ㅣ가-힣]/
			// 이름에 대해서는 한글만 입력하도록
			// const regExpName = /^[가-힣]*$/ // *은 0번이상 반복된다.(빈문자열도 허용)
			// const regExpName = /^[가-힣]+$/ // 최소 1글자
			const regExpName = /^[가-힣]{2,4}$/ // 2~4글자
			
			const id = form.id.value;
			const name = form.name.value;
			const phone = form.phone.value;
			const email = form.email.value;
			
			if (!regExpId.test(id)) {
				alert("아이디는 문자로 시작");
				return;
			}
			if (!regExpName.test(name)) {
				alert("이름은 한글 2~4으로 입력");
				return;
			}
			if (!regExpPasswd.test(passwd)) {
				alert("비밀번호는 숫자만 4글자이상");
				return;
			}
			if (!regExpPhone.test(phone)) {
				alert("연락처 입력을 확인해주시오")
				return;
			}
			
		}
	
	</script>
</body>
</html>
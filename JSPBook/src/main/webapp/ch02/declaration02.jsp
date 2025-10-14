<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 선언문 태그에 전역메소드 사용하기1 -->
	<!-- 선언문 태그 -->
	<%! 
		int sum(int a, int b) {
			return a + b;
		}
	%>
	
	<!-- 스크립틀릿 태그 -->
	<%
		// 3. 자바 주석(// 또는 /*  */ )
		// 자바 코드 내부(JSP 스크립틀릿이나 선언부 안)에서 사용하는 주석
		out.println("2 + 3 = " + sum(2, 3));	
	%>
	
	
</body>
</html>
<%@page import="java.time.LocalDate"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page info="Date 클래스를 이용한 날짜 출력하기" %>
<%@ page errorPage="page_errorPage_error.jsp" %>
<!-- (참고) 웹 컨테이너가 getServletInfo() 메소드를 생성 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Directives Tag</title>
</head>
<body>
	<!-- page 디렉티브 태그에 이동할 특정 오류 페이지 작성하기 -->
	<!-- 웹 서버가 제공하는 기본 오류페이지 확인하기 -->
	<%
		String str = null;
		out.println(str.toString());
	%>
</body>
</html>
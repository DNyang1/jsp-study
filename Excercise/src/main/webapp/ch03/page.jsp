<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ page import="java.util.Date" %>
	<%@ page import="java.lang.Math" %>

  <%
      Date today = new Date();
      double square = Math.pow(5, 2);
  %>

  <p><%= today %></p>
  <p><%= square %></p>
	
</body>
</html>
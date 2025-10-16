<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
</head>
<body>
<%
	String strNum = request.getParameter("num");
	int dan = Integer.parseInt(strNum);
	
    for (int i = 1; i <= 9; i++) {
        out.println(dan + " × " + i + " = " + (dan * i)+ "<br>");
    }
%>
</body>
</html>
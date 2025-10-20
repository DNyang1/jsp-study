<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>File Upload</title>
</head>
<body>
	<!-- 파일 업로드 및 정보 출력하기 -->
	<form action="<%= request.getContextPath() %>/fileupload02Process" 
		method="post" enctype="multipart/form-data">
		<p>이름: <input type="text" name="name"></p>
		<p>제목: <input type="text" name="subject"></p>
		<p>파일: <input type="file" name="uploadFile"></p>
		<button type="submit">파일 올리기</button>
	</form>
	
	
	
	
	
	
	
	
	
	
	
	
</body>
</html>
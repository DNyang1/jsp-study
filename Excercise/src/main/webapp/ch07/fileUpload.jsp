<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>File Upload</title>
</head>
<body>


	<form action="<%= request.getContextPath() %>/fileuploadProcess"
	 enctype="multipart/form-data" method="post">
		<p>
			파일 : <input type="file" name="uploadFile" multiple="multiple">
		</p>
		<button type="submit">업로드</button>
	</form>
	
	
	
	
	
	
	
</body>
</html>
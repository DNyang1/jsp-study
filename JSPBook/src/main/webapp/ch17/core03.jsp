<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL</title>
</head>
<body>
	<!-- 구구단 출력하기 -->
	<h3>구구단</h3>
	<table>
		<c:forEach var="i" begin="1" end="9">
			<tr>
				<c:forEach var="j" begin="1" end="9">
					<td style="width: 100px">${i} * ${j} = ${i*j}</td>
				</c:forEach>
			</tr>
		</c:forEach>		
	</table>
	<!-- (참고) varStatus 속성: 반복 상태를 담는 특별한 객체
			반복문 이 몇번째 반복인지, 마지막 반복인지, 인데스 정보등을 다루는~ -->
	<c:forEach var="i" begin="2" end="5" varStatus="loop">
		${i}번째 반복,
		index=${loop.index} 
		index=${loop.count}
		index=${loop.first}
		index=${loop.last}
		<br>
	</c:forEach>	
	
</body>
</html>
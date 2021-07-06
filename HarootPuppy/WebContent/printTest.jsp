<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>printTest.jsp</title>
</head>
<body>

	<c:forEach var="mem" items="${list }">
		<tr>
			<td>${mem.mem_code }</td>
			<td>${mem.mem_name }</td>
			<td>${mem.mem_id }</td>
			<td>
				<button type="button" class="btn btn-success">수정</button>
				<button type="button" class="btn btn-success">삭제</button>
			</td>
		</tr>
	</c:forEach>

</body>
</html>
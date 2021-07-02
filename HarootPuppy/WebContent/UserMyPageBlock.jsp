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
<title>UserMyPageBlock.jsp</title>
</head>
<body>
	<div id="bbsList">
		<div id="bbsList_title" style="text-align: center;">차단 목록</div>
		<table id="bbsList_list" class="table" style="text-align: center;">
			<tr>
				<td class="cate"><img src="images/user.jpg" width=50px /></td>
				<td class="num" style="width: 200px;">jinsu@gmail.com(진수123)</td>
				<td><button type="button" value="차단해제">차단해제</button></td>
			</tr>
		</table>
	</div>
</body>
</html>
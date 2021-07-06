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
<title>AdminUpdateForm.jsp</title>
<script type="text/javascript">

	function closeAdminUpdate()
	{
		window.close();
	}
	
</script>
</head>
<body>

<div>
	<h3>관리자정보 수정</h3>
	<hr>
</div>

<div>
<form>
	<table id="tbl_userUpdate" style="text-align: left;">
		<tr>
			<th>관리자 번호</th>
			<td>10000</td>
		</tr>
		<tr>
			<th>이름</th>
			<td>
				<input type="text">
			</td>
		</tr>
		<tr>
			<th>아이디</th>
			<td>
				<input type="text">
			</td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td>
				<input type="text">
			</td>
		</tr>
		<tr>
			<th>생일</th>
			<td>
				<input type="text">
			</td>
		</tr>
		<tr>
			<th>성별</th>
			<td>
				<input type="text">
			</td>
		</tr>
		<tr>
			<th>핸드폰번호</th>
			<td>
				<input type="text">
			</td>
		</tr>
		<tr>
			<th>주소</th>
			<td>
				<input type="text">
			</td>
		</tr>
		<tr>
			<th>관리자 등록날짜</th>
			<td>
				<input type="text">
			</td>
		</tr>
	</table>
</form>
</div>

<br><br>

<div>
	<button type="button" onclick="closeAdminUpdate()">취소</button>
	<button type="submit">수정</button>
</div>

</body>
</html>
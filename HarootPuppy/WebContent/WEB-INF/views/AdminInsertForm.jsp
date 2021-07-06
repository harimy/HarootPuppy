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
<title>AdminInsertForm.jsp</title>
</head>
<body>

<div>
	<!-- 메뉴영역 -->
	<div id="harootHeader">
		<c:import url="AdminMenu.jsp"></c:import>
	</div>

	<!-- content 영역 -->
	<div id="harootContent">
		<div>
			<form>
				<table>
					<tr>
						<th>아이디</th>
						<td>
							<input type="text">
						</td>
					</tr>
					<tr>
						<th>이름</th>
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
				</table>
			</form>
			<br><br>
			<button type="submit">등록</button>
			<button type="reset">초기화</button>
			<button type="button" onclick="location.href='AdminInfoList.jsp' ">목록으로</button>
		</div>
	</div>

	<!-- 하단 회사 설명 영역 -->
	<div id="harootFooter">
		<c:import url="MainFooter.jsp"></c:import>
	</div>
</div>

</body>
</html>
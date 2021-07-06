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
<title>UserInfoUpdateForm.jsp</title>
<script type="text/javascript">

	function closeUserUpdate()
	{
		window.close();
	}

</script>
</head>
<body>

<div>
	<h3>회원 세부정보 수정</h3>
	<hr>
</div>

<div>
<form>
	<table id="tbl_userUpdate" style="text-align: left;">
		<tr>
			<th>회원 번호</th>
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
			<th>계정 상태</th>
			<td>
				<!-- 드롭다운으로 수정 -->
				<select name="accoutState">
					<option value="1">정상</option>
					<option value="2">일시정지</option>
				</select>
			</td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td>
				<input type="text">
			</td>
		</tr>
		<tr>
			<th>닉네임</th>
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
				<select name="genderState">
					<option value="female">여성</option>
					<option value="male">남성</option>
				</select>
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
			<th>회원가입 날짜</th>
			<td>
				<input type="text" disabled="disabled">
			</td>
		</tr>
		<tr>
			<th>반려견</th>
			<td>
				<input type="text">
			</td>
		</tr>
		<tr>
			<th>산책서비스 동의 여부</th>
			<td>
				<select name="walkService">
					<option value="female">동의</option>
					<option value="male">비동의</option>
				</select>
			</td>
		</tr>
		<tr>
			<th>산책 횟수</th>
			<td>
				<input type="text">
			</td>
		</tr>
		<tr>
			<th>게시판 신고 누적 횟수</th>
			<td>
				<input type="text" value="">
			</td>
		</tr>
		<tr>
			<th>산책메이트 온라인 신고 누적 횟수</th>
			<td>
				<input type="text" value="">
			</td>
		</tr>
		<tr>
			<th>산책메이트 사용자 신고 누적 횟수</th>
			<td>
				<input type="text">
			</td>
		</tr>
	</table>
</form>
</div>

<br><br>

<div>
	<button type="button" onclick="closeUserUpdate()">취소</button>
	<button type="submit">수정</button>
</div>

<br><br>

</body>
</html>
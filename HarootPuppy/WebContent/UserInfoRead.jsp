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
<title>UserInfoRead.jsp</title>
<script type="text/javascript">

	function closeUserRead()
	{
		window.close();
	}

</script>
</head>
<body>
<div>
	<h3>회원 세부정보 조회</h3>
	<hr>
</div>

<div>
	<table id="tbl_userRead" style="text-align: left;">
		<tr>
			<th>회원 번호</th>
			<td>10000</td>
		</tr>
		<tr>
			<th>이름</th>
			<td>박진수</td>
		</tr>
		<tr>
			<th>아이디</th>
			<td>jinsooyeoyo</td>
		</tr>
		<tr>
			<th>계정 상태</th>
			<td>정상</td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td>1234****</td>
		</tr>
		<tr>
			<th>닉네임</th>
			<td>진수여요</td>
		</tr>
		<tr>
			<th>생일</th>
			<td>2001.01.01</td>
		</tr>
		<tr>
			<th>성별</th>
			<td>남성</td>
		</tr>
		<tr>
			<th>핸드폰번호</th>
			<td>010-1111-1111</td>
		</tr>
		<tr>
			<th>주소</th>
			<td>서울 마포구</td>
		</tr>
		<tr>
			<th>회원가입 날짜</th>
			<td>2020.08.08</td>
		</tr>
		<tr>
			<th>반려견</th>
			<td>A0001</td>
		</tr>
		<tr>
			<th>산책서비스 동의 여부</th>
			<td>ON</td>
		</tr>
		<tr>
			<th>산책 횟수</th>
			<td>20회</td>
		</tr>
		<tr>
			<th>게시판 신고 누적 횟수</th>
			<td>0건</td>
		</tr>
		<tr>
			<th>산책메이트 온라인 신고 누적 횟수</th>
			<td>0건</td>
		</tr>
		<tr>
			<th>산책메이트 사용자 신고 누적 횟수</th>
			<td>1건</td>
		</tr>
	</table>
	
	<br>
	
	<div>
	<button type="button" onclick="closeUserRead()">닫기</button>
	</div>
</div>


</body>
</html>
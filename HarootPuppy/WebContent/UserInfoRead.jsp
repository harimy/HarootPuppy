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
<!-- jQuery JS -->
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="<%=cp%>/js/jquery-ui.js"></script>
<!-- jQuery-UI CSS -->
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/jquery-ui.css">

<!--  부트스트랩 JS -->
<script type="text/javascript" src="<%=cp%>/js/bootstrap.js"></script>
<!-- 부트스트랩 CSS -->
<link rel="stylesheet" href="<%=cp%>/css/bootstrap.css">

<style type="text/css">

#tbl_userRead th{ text-align: center; }


#tbl_userRead .info 
{	
	width: 250px; 
	margin-bottom: 5px;
	
}

</style>


<script type="text/javascript">

	function closeUserRead()
	{
		window.close();
	}

</script>
</head>
<body>
	<div style="text-align: center;">
		<h3>회원 세부정보 조회</h3>
		<hr>
	</div>

	<div>
		<table id="tbl_userRead" style="text-align: left;">
			<tr>
				<th style="width: 230px;">회원식별번호</th>
				<td>
					<input type="text" class="info" value="${search.sid_code }" readonly="readonly"/>
				</td>
			</tr>
			<tr>
				<th>회원번호</th>
				<td>
					<input type="text" class="info" value="${search.mem_code }" readonly="readonly"/>
				</td>
			</tr>
			<tr>
				<th>아이디</th>
				<td>
					<input type="text" class="info" value="${search.mem_id }" readonly="readonly"/>
				</td>
			</tr>
			<tr>
				<th>이름</th>
				<td>
				<input type="text" class="info" value="${search.mem_name }" readonly="readonly"/>
				</td>
			</tr>
			<tr>
				<th>닉네임</th>
				<td>
					<input type="text" class="info" value="${search.mem_nickname }" readonly="readonly"/>
					
				</td>
			</tr>
			<tr>
				<th>성별</th>
				<td>
					<input type="text" class="info" value="${search.mem_gender }" readonly="readonly"/>
					 <%-- 
					 <select name="gender">
						<option value="F" ${"F"== search.mem_gender ? "selected='selected'"  : "" }>여자</option>		 
						<option value="M" ${"M"== search.mem_gender ? "selected='selected'"  : "" }>남자</option>		 
					 </select>
					 --%>
				</td>
			</tr>
			<tr>
				<th>생년월일</th>
				<td>
					<input type="text" class="info" value="${search.mem_birth }" readonly="readonly"/>
				</td>
			</tr>
			<tr>
				<th>핸드폰번호</th>
				<td>
					<input type="text" class="info" value="${search.mem_tel }" readonly="readonly"/>
				</td>
			</tr>
			<tr>
				<th>주소</th>
				<td>
					<input type="text" class="info" value="${search.mem_addr }" readonly="readonly"/>
				</td>
			</tr> 
			<tr>
				<th>회원가입날짜</th>
				<td>
					<input type="text" class="info" value="${search.mem_regdate }" readonly="readonly"/>
					
				</td>
			</tr>			 
			<tr>
				<th>반려견 아이디</th>
				<td>
				<c:forEach var="pet1" items="${petList }" >
					[${pet1.pet_code }] 
				
				</c:forEach>				
				</td>
			</tr>
			<tr>
				<th>반려견 닉네임</th>
				<td>
				<c:forEach var="pet2" items="${petList }" >
					[${pet2.pet_name }] 
				</c:forEach>				
				</td>
			</tr>
			<tr>
				<th>산책메이트 서비스 동의 여부</th>
				<td>
					<input type="text" class="info" value="${search.walk_agree_check }" readonly="readonly"/>
							
				</td>
			</tr>
			
			<tr>
				<td colspan="2">
					<button type="button" class="btn btn-warning" onclick="closeUserRead()" style="float: right;">닫기</button>
				</td>
			</tr>
		</table>

		<br>

	</div>

		<!-- <div style="width: 496px; text-align: right;">
			<button type="button" class="btn btn-secondary" onclick="closeUserRead()">닫기</button>
		</div> -->
</body>
</html>
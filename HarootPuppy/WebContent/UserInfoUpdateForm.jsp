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
	
	function modify()
	{
		opener.parent.location.reload();
		window.close();
	} 
	

	function goSubmit() 
	{
		<%-- 
		f = document.getElementById("adminMemberUdpateForm");
		f.target = "parentForm";
		f.action= "<%=cp%>/adminmemberupdate.action";
		f.submit();
		self.close();
		 --%>
		 
		f = document.getElementById("adminMemberUdpateForm");
		f.target = "parentForm";
		f.action= "<%=cp%>/adminmemberupdate.action";
		 
		if( $("#mem_name").val() == "")
		{
			alert("이름을 입력하세요.");
			$("#mem_name").focus();
			return;
		}
		if( $("#mem_nickname").val() == "")
		{
			alert("닉네임을 입력하세요.");
			$("#mem_nickname").focus();
			return;
		}
		if( $("#mem_tel").val() == "")
		{
			alert("핸드폰번호를 입력하세요.");
			$("#mem_tel").focus();
			return;
		}
		if( $("#mem_addr").val() == "")
		{
			alert("주소를 입력하세요.");
			$("#mem_addr").focus();
			return;
		}
		 
		 
		f.submit();
		self.close();
		
	}

</script>
</head>
<body>
	<div style="text-align: center;">
		<h3>회원 정보 수정</h3>
		<hr>
	</div>

	<div>
		<!-- <form action="adminmemberupdate.action" method="POST"> -->
		<form name="adminMemberUdpateForm" id="adminMemberUdpateForm" method="POST" style="margin-left: 20px;">
			<table id="tbl_userRead" style="text-align: left;">
				<tr> 
					<th style="width: 230px;">회원식별번호</th>
					<td>
						<input type="hidden" name="sid_code" value="${search.sid_code }">
						<input type="text" name="sid_code" class="info" value="${search.sid_code }" disabled="disabled"/>
					</td>
				</tr>
				<tr>
					<th>회원번호</th>
					<td>
						<!-- 히든타입으로 mem_code 전송, disabled는 값이 전송이 안된다  -->
						<input type="hidden" name="mem_code" value="${search.mem_code }">
						<input type="text" name="mem_code1" class="info" value="${search.mem_code }" disabled="disabled"/>
					</td>
				</tr>
				<tr>
					<th>아이디</th>
					<td>
						<input type="hidden" name="mem_id" value="${search.mem_id }">
						<input type="text" name="mem_id" class="info" value="${search.mem_id }" disabled="disabled"/>
					</td>
				</tr>
				<tr>
					<th>이름</th>
					<td>
					<input type="text" name="mem_name" id="mem_name" class="info" value="${search.mem_name }" />
					</td>
				</tr>
				<tr>
					<th>닉네임</th>
					<td>
						<input type="text" name="mem_nickname" id="mem_nickname" class="info" value="${search.mem_nickname }" />
						
					</td>
				</tr>
				<tr>
					<th>성별</th>
					<td style="margin-bottom: 5px;">
						<select name="mem_gender">
							<option value="F" ${"F"== search.mem_gender ? "selected='selected'"  : "" }>여자</option>		 
							<option value="M" ${"M"== search.mem_gender ? "selected='selected'"  : "" }>남자</option>		 
						</select>
					</td>
				</tr>
				<tr>
					<!--  -->
					<th>생년월일</th>
					<td>
						<input type="date" name="mem_birth" class="info" value="${search.mem_birth }" />
					</td>
				</tr>
				<tr>
					<th>핸드폰번호</th>
					<td>
						<input type="text" name="mem_tel" id="mem_tel" class="info" value="${search.mem_tel }" placeholder="xxx-xxxx-xxxx"/>
					</td>
				</tr>
				<tr>
					<th>주소</th>
					<td>
						<input type="text" name="mem_addr" id="mem_addr" class="info" value="${search.mem_addr }" />
					</td>
				</tr> 
				<tr>
					<th>회원가입날짜</th>
					<td>
						<input type="text" class="info" value="${search.mem_regdate }" disabled="disabled"/>
						
					</td>
				</tr>			 
				<tr>
					<th>반려견 아이디</th>
					<td>
					<c:forEach var="pet1" items="${petList }">
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
					 	<input type="text" class="info" value="${search.walk_agree_check }" disabled="disabled"/>
					</td>
				</tr>
			</table>
			<br><br>
		
			<div style="width: 496px; text-align: right; display: inline-block;">
				<button type="button" class="btn btn-warning" onclick="closeUserRead()" style="float: left; margin-left: 20px; ">닫기</button>
				<input type="button" class="btn btn-success" onclick="goSubmit()" value="수정" style="float: right; margin-right: 10px;">
				<button type="reset" class="btn btn-warning" style="float: right; ">초기화</button>
			</div>
			
			
			
		</form>	
	</div>

</body>
</html>
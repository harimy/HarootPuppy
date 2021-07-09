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

<style type="text/css">

#tbl_userRead th{ text-align: center; }

#tbl_userRead .info 
{	
	width: 250px; 
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

</script>
</head>
<body>
	<div style="text-align: center;">
		<h3>회원 정보 수정</h3>
		<hr>
	</div>

	<div>
		<form action="adminmemberupdate.action" method="POST">
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
						<!-- 히든타입으로 mem_code 전송 -->
						<input type="hidden" name="mem_code" value="${search.mem_code }">
						<input type="text" name="mem_code1" class="info" value="${search.mem_code }" disabled="disabled"/>
					</td>
				</tr>
				<tr>
					<th>아이디</th>
					<td>
						<input type="text" name="mem_id" class="info" value="${search.mem_id }" />
					</td>
				</tr>
				<tr>
					<th>이름</th>
					<td>
					<input type="text" name="mem_name" class="info" value="${search.mem_name }" />
					</td>
				</tr>
				<tr>
					<th>닉네임</th>
					<td>
						<input type="text" name="mem_nickname" class="info" value="${search.mem_nickname }" />
						
					</td>
				</tr>
				<tr>
					<th>성별</th>
					<td>
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
						<input type="text" name="mem_tel" class="info" value="${search.mem_tel }" placeholder="xxx-xxxx-xxxx"/>
					</td>
				</tr>
				<tr>
					<th>주소</th>
					<td>
						<input type="text" name="mem_addr" class="info" value="${search.mem_addr }" />
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
					<br><br>
					</td>
				</tr>
			</table>
		
			 <div style="width: 496px; text-align: right; display: inline-block;">
				<button type="button" class="" onclick="closeUserRead()" style="float: left;">취소</button>
				<button type="submit" class="" onclick="" style="float: right;">수정</button>
				<button type="reset" class="" style="float: right;">초기화</button>
			</div>
		</form>	
	</div>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RegisterForm.jsp</title>


<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="<%=cp%>/js/jquery-ui.js"></script>
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/menuStyle.css">
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/jquery-ui.css">
<script type="text/javascript">


	$(function()
	{
		
		// js 폴더, css 폴더 파일 확인 
		// jQuery-UI 캘린더를 불러오는 함수 처리 (datepicker())
		$("#birthday").datepicker(
		{
			dateFormat: "yy-mm-dd"
			, changeMonth: true
			, changeYear: true
		});
		
		
	});
	
</script>


<style type="text/css">

	#joinTbl 
	{
		width: 700px;
	}
	
	.span
	{
		font-size: small;
	}

	textarea
	{
		width:500px; 
		height:100px; 
	    resize:none;/* 크기고정 */ 
		/*   resize: horizontal; // 가로크기만 조절가능 
			resize: vertical;  세로크기만 조절가능  */
	}
	

	
</style>



</head>
<body>
<jsp:include page="Main.jsp" />
<!-----------------------------
  RegisterForm.jsp
  - 회원가입 페이지
------------------------------->

<div>
	<!-- 메뉴영역 -->
	<div>
		<%-- <c:import url="EmployeeMenu.jsp"></c:import> --%>
	</div>
	
	<div id="content">
		<h1>[ 회원가입 ]</h1>
		<hr />
	    <form action="" method="GET" name="joinForm">
	        <table id="joinTbl">
	            <tr>
	                <td>
	                    <label for="id">아이디</label>
	                </td>
	                <td>
	                    <input type="text" name="id" id="id" size="20px">
	                    <input type="button" class="check" value="중복확인">
	                </td>
	            </tr>
	            <tr>
	                <td>
	                    <label for="pwd">비밀번호</label>
	                </td>
	                <td>
	                    <input type="text" name="pwd" id="pwd" size="20px"> 
	                </td>
	            </tr>
	            <tr>
	                <td>
	                    <label for="pwdCheck">비밀번호 확인</label>
	                </td>
	                <td>
	                    <input type="text" name="pwdCheck" id="pwdCheck" size="20px">
	                </td>
	            </tr>
	            <tr>
	                <td>
	                    <label for="name">이름</label>
	                </td>
	                <td>
	                    <input type="text" name="name" id="name" size="20px"> 
	                </td>
	            </tr>
	            <tr>
	                <td>
	                    <label for="nickName">닉네임</label>
	                </td>
	                <td>
	                    <input type="text" name="nickName" id="nickName" size="20px">
	                    <input type="button" class="check" value="중복확인">
	                </td>
	            </tr>
	            <tr>
                   <td>생년월일</td>
                    <td><input type="text" id="birthday" name="birthday" placeholder="생년월일" /></td>
               </tr>
               <tr>
       		   	<td>
                    <label for="gender">성별</label>
               	</td>
               	<td>
                	<input type="radio" name="gender" value="여">여
               		<input type="radio" name="gender" value="남">남
               	</td>
                </tr>
	            <tr>
	                <td>
	                    <label for="phone">휴대폰번호</label>
	                </td>
	                <td>
	                    <select id="phone">
	                        <option value=""></option>
	                        <option value="010">010</option>
	                        <option value="011">011</option>
	                        <option value="019">019</option>
	                    </select>
	                    -
	                    <input type="text" name="phone" id="phone" size="10">-
	                    <input type="text" name="phone" id="phone" size="10">
	                    <input type="button" class="check" value="중복확인">
	                </td>
	            </tr>
	            <tr>
	                <td>
	                    <label for="home">주소 검색</label>
	                </td>
	                <td>
	                    <input type="text" name="dong" id="dong" size="35">
	                    <input type="button" id="address" value="주소 검색">
		                <br><br>
	                </td>
	            </tr>
	            
				<!-- 이용약관 영역 -->
				<tr>
					<td colspan="2">
					<span class="span">산책 메이트 서비스 이용 동의(선택)</span><br>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<textarea name="" id="" cols="30" rows="10">이용약관</textarea><br />
						<label>
							<input type="checkbox" name="agree1" value="agree1">
							<span class="span">위 사항에 동의합니다.</span>
						</label>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<span class="span">개인정보 이용 동의(필수)</span><br>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<textarea name="agree1" id="agree1" cols="30" rows="10">이용약관</textarea><br />
						<label>
							<input type="checkbox" name="agree2" value="agree2">
							<span class="span">위 사항에 동의합니다.</span>
						</label>
					<br /><br />
					</td>
				</tr>
				<tr>
					<td colspan="2">
				        <!-- 취소버튼 누르면 로그인 페이지로 간다. -->
				        <input type="button" id="login" value="취소">
				        <input type="button" id="join" value="회원가입">
					</td>
				</tr>
	        </table>
	    </form>
	</div>
	<br /><br />
	
	
	<!-- 회사 소개 및 어플리케이션 소개 영역 -->
	<div id="footer">
	
	</div>
</div>

</body>
</html>
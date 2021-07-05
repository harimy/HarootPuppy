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
		var checkNum1=0;
		var checkNum2=0;
		var checkNum3=0;
		
		// js 폴더, css 폴더 파일 확인 
		// jQuery-UI 캘린더를 불러오는 함수 처리 (datepicker())
		$("#birthday").datepicker(
		{
			dateFormat: "yy-mm-dd"
			, changeMonth: true
			, changeYear: true
		});
		
		$("#idCheck").click(function(){
			checkNum1 = checkNum1 + 1;
			alert(checkNum1);
			return checkNum1;
		});
		
		$("#join").click(function(){
			

			
/* 			$("#telCheck").click(function(){
				checkNum2 =checkNum3 + 1;
			});
			$("#nickCheck").click(function(){
				checkNum3 =checkNum3 + 1;
			}); */
			
			if ( checkNum1<=0 )
			{
				alert("아이디 중복검사를 하세요.");
				return;
			}
/* 			if ( checkNum2<=0 )
			{
				alert("닉네임 중복검사를 하세요.");
				return;
			}
			if ( checkNum2<=0 )
			{
				alert("전화번호 중복검사를 하세요.");
				return;
			} */
			
			// 데이터 검사(공란이 있는지 없는지에 대한 여부 확인)
			$("#errForm").css("display", "none");
			$("#errCheck").css("display", "none");
			$("#errOverlap").css("display", "none");
			
			// alert($('input:checkbox[name="agree2"]:checked').val());
	
			if ( $("#id").val()=="" || $("#pwd").val()==""|| $("#pwdCheck").val()=="" 
					|| $("#name").val()=="" || $("#nickName").val()=="" 
					|| $("#phone").val()=="" || $("#birthday").val()=="" 
					|| $("#address").val()==""
					|| $('input[name="gender"]:checked').val() == 'undefined' )
			{
				$("#errForm").css("display" ,"inline");
				return;
			} 

			if ( $("input:checkbox[name='agree2']").is(":checked") == false )
			{
				alert("된다노");
				$("#errCheck").css("display" ,"inline");
				return;
			}
			
			$("#joinForm").submit();

		});
		
		
		
	});
	
	$(function() {

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
	
	#errForm, #errCheck, #errOverlap, #errPwd, #errPwdCheck, #errNickName
	{
		color: red;
		font-size: small;
		display: none;
	}
	
</style>



</head>
<body>
<!-----------------------------
  RegisterForm.jsp
  - 회원가입 페이지
------------------------------->
<!-- 마이페이지 회원정보 수정으로 이 페이지를 로드 
RegisterForm의 Form이 채워지고 
헤더, 푸터를 포함하는 div는 display:none 상태여야 함.-->		

<div>
	<!-- 메뉴영역 -->
	<div>
			<c:import url="Main.jsp"></c:import>
	</div>
	
	<div id="content">
		<h1>[ 회원가입 ]</h1>
		<hr />
	    <form action="" method="GET" id="joinForm" name="joinForm">
	        <table id="joinTbl">
	            <tr>
	                <td>
	                    <label for="id">아이디</label>
	                </td>
	                <td>
	                    <input type="text" name="id" id="id" size="20px">
	                    <input type="button" id="idCheck" class="check" value="중복확인">
	                </td>
	            </tr>
	            <tr>
	                <td>
	                    <label for="pwd">비밀번호</label>
	                </td>
	                <td>
	                    <input type="text" name="pwd" id="pwd" size="20px"> 
	                    <span id="errPw">4자 이상~15자 이내</span>
	                </td>
	            </tr>
	            <tr>
	                <td>
	                    <label for="pwdCheck">비밀번호 확인</label>
	                </td>
	                <td>
	                    <input type="text" name="pwdCheck" id="pwdCheck" size="20px">
	                    <span id="errPwdCheck">일치하지 않습니다.</span>
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
	                    <input type="button" class="check" id="nickCheck" value="중복확인">
	                    <span id="errNickName">2자 이상 15자 이내, 특수문자 사용 불가</span>
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
                	<input type="radio" name="gender" id="woman" value="여">
                	<label for="woman">여</label>
               		<input type="radio" name="gender" id="man" value="남">
               		<label for="man">남</label>
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
	                    <input type="text" name="phone" id="phone1" size="10">-
	                    <input type="text" name="phone" id="phone2" size="10">
	                    <input type="button" id="telCheck" class="check" value="중복확인">
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
							<input type="checkbox" id="agree2" name="agree2" value="agree2">
							<span class="span">위 사항에 동의합니다.</span>
						</label>
					<br /><br />
					</td>
				</tr>
				<tr>
					<td colspan="2">
				        <!-- 취소버튼 누르면 로그인 페이지로 간다. -->
				        <input type="button" id="cancel" value="취소">
				        <input type="button" id="join" value="회원가입">
						<span id="errForm">필수 입력 항목을 입력하세요.</span>		
						<span id="errCheck">필수 동의 사항에 동의하세요.</span>						
						<span id="errOverlap">아이디/닉네임 중복여부를 확인하세요.</span>							
					</td>
				</tr>
	        </table>
	        
	    </form>
	</div>
	<br /><br />
	
	
	<!-- 회사 소개 및 어플리케이션 소개 영역 -->
	<div id="footer">
				<c:import url="MainFooter.jsp"></c:import>
	</div>
</div>

</body>
</html>
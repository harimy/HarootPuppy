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
<title>회원정보 수정</title>

<link rel="stylesheet" type="text/css" href="<%=cp %>/css/jquery-ui.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="<%=cp%>/js/jquery-ui.js"></script>
<script type="text/javascript">


	$(document).ready(function()
	{
		if($("#gender").val() == "m")
			$("#man").prop('checked', true);
		else
			$("#woman").prop('checked', true);
	
	});
	
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
		
		
		
		$("#join").click(function(){
			
			
			// 데이터 검사(공란이 있는지 없는지에 대한 여부 확인)
			$("#errForm").css("display", "none");
			$("#errCheck").css("display", "none");
			$("#errOverlap").css("display", "none");
			
			// alert($('input:checkbox[name="agree2"]:checked').val());
	
			if ( $("#mem_id").val()=="" || $("#mem_pw").val()==""|| $("#pwdCheck").val()=="" 
					|| $("#mem_name").val()=="" || $("#mem_nickName").val()=="" 
					|| $("#mem_tel").val()=="" || $("#mem_birth").val()=="" 
					|| $("#mem_addr").val()==""
					|| $('input[name="mem_gender"]:checked').val() == 'undefined' )
			{
				$("#errForm").css("display" ,"inline");
				return;
			} 

			
			$("#joinForm").submit();
			alert("회원가입이 완료되었습니다.");
		});
		
		
		
	});
	
	
	
	 function openAddressChild() 
	  {
		    var _width = '650';
		    var _height = '380';
		 
		    // 팝업을 가운데 위치시키기 위해 아래와 같이 값 구하기
		    var _left = Math.ceil(( window.screen.width - _width )/2);
		    var _top = Math.ceil(( window.screen.height - _height )/2); 
		 
		    var open = window.open('MemAddrSelect.jsp', 'popup-test', 'width='+ _width +', height='+ _height +', left=' + _left + ', top='+ _top );	 		
	 		
	  }

	
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
	MemberInformUpdate.jsp
	회원 정보 수정
------------------------------->


<div>	
	<div id="content">
		<h1>[ 회원정보 수정 ]</h1>
		<hr />
	    <form action="memberupdate.action" method="POST" id="updateForm" name="updateForm">
	        
	        <input type="hidden" id="mem_code" name="mem_code">
	        
	        <table id="joinTbl">
	            <tr>
	                <td>
	                    <label for="id">아이디</label>
	                </td>
	                <td>
	                    <input type="text" name="mem_id" id="mem_id" size="20px" disabled="disabled" placeholder="${mem_id}" value="${mem_id}"> 
	                    <input type="button" id="idCheck" class="check" value="중복확인">
	                </td>
	            </tr>
	            <tr>
	                <td>
	                    <label for="pwd">비밀번호</label>
	                </td>
	                <td>
	                    <input type="password" name="mem_pw" id="pwd" size="20px" > 
	                    <span id="errPw">4자 이상~15자 이내</span>
	                </td>
	            </tr>
	            <tr>
	                <td>
	                    <label for="pwdCheck">비밀번호 확인</label>
	                </td>
	                <td>
	                    <input type="password" name="pwdCheck" id="pwdCheck" size="20px">
	                    <span id="errPwdCheck">일치하지 않습니다.</span>
	                </td>
	            </tr>
	            <tr>
	                <td>
	                    <label for="name">이름</label>
	                </td>
	                <td>
	                    <input type="text" name="mem_name" id="name" size="20px" disabled="disabled" placeholder="${mem_name}" value="${mem_name}"> 
	                </td>
	            </tr>
	            <tr>
	                <td>
	                    <label for="nickName">닉네임</label>
	                </td>
	                <td>
	                    <input type="text" name="mem_nickname" id="nickname" size="20px">
	                    <input type="button" class="check" id="nickCheck" value="중복확인">
	                    <span id="errNickName">2자 이상 15자 이내, 특수문자 사용 불가</span>
	                </td>
	            </tr>
	            <tr>
                   <td>생년월일</td>
                    <td><input type="text" id="birthday" name="mem_birth" disabled="disabled" placeholder="생년월일" placeholder="${mem_birth}" value="${mem_birth}"/></td>
               </tr>
               <tr>
       		   	<td>
                    <label for="gender">성별</label>
               	</td>
               	<td>
                	<input type="radio" name="mem_gender" id="woman" value="F" disabled="disabled">
                	<label for="woman">여</label>
               		<input type="radio" name="mem_gender" id="man" value="M" disabled="disabled">
               		<input type="hidden" id="gender" value="${mem_gender}">
               		<label for="man">남</label>
               	</td>
                </tr>
	            <tr>
	                <td>
	                    <label for="phone">휴대폰번호</label>
	                </td>
	                <td>
	                    <select id="phone" name="mem_tel"> 
	                        <option value=""></option>
	                        <option value="010">010</option>
	                        <option value="011">011</option>
	                        <option value="019">019</option>
	                    </select>
	                    -
	                    <input type="text" name="mem_tel" id="phone1" size="10">-               
	                    <input type="text" name="mem_tel" id="phone2" size="10">
	                    <input type="button" id="telCheck" class="check" value="중복확인">
	                </td>
	            </tr>
	            <tr>
	                <td>
	                    <label for="home">주소 검색</label>
	                </td>
	                <td>
	                 	<input type="text" id="mem_addr" name="mem_addr" placeholder="주소를 입력하세요">
						<input type="button" onclick="openAddressChild()" value="주소 검색"><br>
						<div id="addrMap" style="width:300px; height:300px; margin-top:10px; display:none"></div>
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
							<input type="checkbox" id="walk_agree_check" name="walk_agree_check" value="N">
							<span class="span">위 사항에 동의합니다.</span>
						</label>
					</td>
				</tr>
				<tr>
					<td colspan="2">
				        <!-- 취소버튼 누르면 로그인 페이지로 간다. -->
				        <input type="button" id="cancel" value="취소">
				        <input type="button" id="join" value="회원가입">
						<span id="errForm">필수 입력 항목을 입력하세요.</span>		
						<span id="errOverlap">닉네임 중복여부를 확인하세요.</span>							
					</td>
				</tr>
	        </table>
	        
	    </form>
	</div>
	<br /><br />
	
</div>

</body>
</html>
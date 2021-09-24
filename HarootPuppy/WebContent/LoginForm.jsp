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
<title>LoginForm.jsp</title>

<!-- jQuery JS -->
<script type="text/javascript"
   src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javasc
ript" src="<%=cp%>/js/jquery-ui.js"></script>
<!-- jQuery-UI CSS -->
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/jquery-ui.css">

<!--  부트스트랩 JS -->
<script type="text/javascript" src="<%=cp%>/js/bootstrap.js"></script>
<!-- 부트스트랩 CSS -->
<link rel="stylesheet" href="<%=cp%>/css/bootstrap.css">

<script type="text/javascript">

$(function()
{
	$("#mem_pw").keydown(function(key) {
      if (key.keyCode == 13) {
      	
   		if ($('input[name="admin_check"]:checked').val() == 'admin' )
   		{
   			$("#mem_id").attr("name","admin_id");
   			$("#mem_pw").attr("name","admin_pw");
         	
   			// 관리자로 접속 시 form action 변경하는 코드
   			$("#loginForm").attr("action", "loginadmin.action");
         	}
   		
           $(loginForm).submit(); //자료를 선송
      	}
 	 })

	$("#loginBtn").click(function()                                                                                                               
	{
		if ($('input[name="admin_check"]:checked').val() == 'admin' )
		{
			$("#mem_id").attr("name","admin_id");
			$("#mem_pw").attr("name","admin_pw");
      		// form action 변경하는 코드
			$("#loginForm").attr("action", "loginadmin.action");
      	}
		
		//$("#loginForm").action = "${path}/login_check.do";  //밑에 form1 폼을 Controller의 login_check에 맵핑하도록 한다.
        $(loginForm).submit(); //자료를 선송
	});
	
	
	
	// 로그인 실패시 알림창 필요

});
</script>


<style type="text/css">
.login {
   font-size: 25pt;
   font-weight: bold;
}

.form-group {
   width: 500px;
}

.form-group2
{
   display:inline-block;
   foat:left;
   text-align: center;
}

.harootContent
{
   width:100%;
   text-align: center;
}


.btn {
   width: 100px;
   background-color: #D1D1CD;
   text-align: center;
   display: inline-block;
}

/*----------------------------------------------------  */
.input-box {
   position: relative;
   margin: 10px 0;
}

.input-box>input {
   background: transparent;
   border: none;
   border-bottom: solid 1px #ccc;
   padding: 20px 0px 5px 0px;
   font-size: 14pt;
   width: 100%;
}

input:placeholder {
   color: transparent;
}

input:placeholder-shown+label {
   color: #aaa;
   font-size: 14pt;
   /* top: 15px; */
}

input:focus+label, label {
   color: #8aa1a1;
   font-size: 10pt;
   /* pointer-events: none; */+
   /*  position: absolute; */   
   left: 0px;
   top: 0px;
   transition: all 0.2s ease;
   -webkit-transition: all 0.2s ease;
   -moz-transition: all 0.2s ease;
   -o-transition: all 0.2s ease;
}

.loginForm
{
	display: inline-block;
	margin-top: 200px;
}


input:focus, input:not (:placeholder-shown ) {
   border-bottom: solid 1px #8aa1a1;
   outline: none;
}
</style>


</head>
<body>

<!-----------------------------
  LoginForm.jsp
  - 로그인 폼 페이지
------------------------------->
	<div>
		<!-- 메뉴영역 -->
		<div id="harootHeader">
			<c:import url="Main.jsp"></c:import>
		</div>

		<!-- content 영역 -->
		
		<div id="harootContent" style="height: 700px; width: 100%; text-align: center;">
		<form role="form" action="loginmem.action" method="POST" class="loginForm" id="loginForm" name="loginForm">
		
				<div class= "form-group2" style="float: right;">
	               <label id="admincheck" > 관리자 
	               <input type="checkbox" id="admin_check" name="admin_check" value="admin">
	               </label>	       
	            
	            </div>	
	            
				<!-- 로그인 글씨 -->
				<div class="form-group login">
					로그인
				</div>
				
				<!-- 아이디 / 비밀번호 입력창 -->
				<div class="form-group id input-box">					
					<input id="mem_id" type="text" name="mem_id" placeholder="아이디를 입력해주세요" required>
					<label for="id">아이디</label>
				</div>
				
				<div class="form-group pw input-box">				
					<input id="mem_pw" type="password" name="mem_pw" placeholder="비밀번호를 입력해주세요" required> 
					<label for="password">비밀번호</label>
				</div>

				<br><br>

	            <!-- 로그인 / IdPw찾기 / 회원가입 버튼 -->
	            <div class="form-group2">
	            <input type="button" value="로그인" class="btn" id="loginBtn">
	            </div >
	
	            <div class="form-group2">
	               <input type="button" value="Id/Pw 찾기" class="btn"
	                  onclick="location.href='Id/pw찾는 페이지'">
	            </div>
	
	            <div class="form-group2">
	               <input type="button" value="회원가입" class="btn" onclick="location.href='registerform.action'">
	            </div>
	 
            
      </form>
      </div>
	
	



      <!-- 하단 회사 설명 영역 -->
      <div id="harootFooter">
         <c:import url="MainFooter.jsp"></c:import>
      </div>
   </div>

</body>
</html>
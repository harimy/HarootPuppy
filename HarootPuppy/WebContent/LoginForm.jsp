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
<script type="text/javascript" src="<%=cp%>/js/jquery-ui.js"></script>
<!-- jQuery-UI CSS -->
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/jquery-ui.css">

<!--  부트스트랩 JS -->
<script type="text/javascript" src="<%=cp%>/js/bootstrap.js"></script>
<!-- 부트스트랩 CSS -->
<link rel="stylesheet" href="<%=cp%>/css/bootstrap.css">


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

input::placeholder {
   color: transparent;
}

input:placeholder-shown+label {
   color: #aaa;
   font-size: 14pt;
   top: 15px;
}

input:focus+label, label {
   color: #8aa1a1;
   font-size: 10pt;
  /*  pointer-events: none; */
   /*  position: absolute; */   
   left: 0px;
   top: 0px;
   transition: all 0.2s ease;
   -webkit-transition: all 0.2s ease;
   -moz-transition: all 0.2s ease;
   -o-transition: all 0.2s ease;
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
      <div id="harootContent">

         <form action="login.action" method="post">

            <!-- 로그인 글씨 -->
            <div class="form-group login">로그인</div>

            <!-- 아이디 / 비밀번호 입력창 -->
            <div class="form-group id input-box">
               <input id="mem_id" type="text" name="mem_id"
                  placeholder="아이디를 입력해주세요" required="required"> <label
                  for="id">아이디</label>
            </div>

            <div class="form-group pw input-box">
               <input id="mem_pw" type="password" name="mem_pw"
                  placeholder="비밀번호를 입력해주세요" required="required"> <label
                  for="password">비밀번호</label>
            </div>




            <!-- 로그인 / IdPw찾기 / 회원가입 버튼 -->
            <div class="form-group2">
               <input type="button" value="로그인" class="btn"
                  onclick="location.href='로그인완료후페이지'">
            </div>

            <div class="form-group2">
               <input type="button" value="Id/Pw 찾기" class="btn"
                  onclick="location.href='Id/pw찾는 페이지'">
            </div>

            <div class="form-group2">
               <input type="button" value="회원가입" class="btn" onclick="회원가입페이지'">
            </div>

            <div class= "form-group2">
               <label id="admincheck" > 관리자 
               <input type="checkbox" id="admin_check" name="admin_check" value="admin">
               </label>
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
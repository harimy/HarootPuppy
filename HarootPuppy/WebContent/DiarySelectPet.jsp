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
<title>DiarySelectPet.jsp</title>

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
body {
   text-align: center;
}

/* div.Card 가운데 정렬 */
.card {
    border: none;
    width: 300px;
    display: inline-block;
}

.card-body {
   height: 50px;
}

.cardImage {
   border: 5px solid #ffc107;
   -webkit-border-radius: 50px;
   max-width: 200px;
   height: 200px;
   margin: 0px auto;
   cursor:pointer;
}

.cardImage:hover {
   color: #212529;
   background-color: #e0a800;
   border-color: #d39e00;
}

.card-img, .card-img-top {
   border-top-left-radius: 0px;
   border-top-right-radius: 0px;
}

.card-group {
   margin: 100px;
}

#cardContent {
   margin-left: 100px;
   margin-right: 100px;
}
</style>


<script type="text/javascript">

$(function() {
   $("#petAdd").click(function()
   {
      $("#selectPetForm").attr("action", "petinsertform.action");
      $("#selectPetForm").submit();   
   });
   
}); 


/*$(function()
   {
    $(".final_btn").click(function()
      {
       // alert($(this).val());
       $(location).attr("href", "diarymain.action?pet_code="+ $(this).val() );
       
      
      });
    
   });
*/

 

</script>

</head>
<body>
<!---------------------------------------
  DiarySelectPet.jsp
  - 반려견 다이어리 작성할 반려견 선택
---------------------------------------->
   <div>
      <!-- 메뉴영역 -->
      <div>
         <jsp:include page="Main.jsp" />
      </div>
      
      
   <form action="diarymain.action" id="selectPetForm" method="post">

      <!-- content 영역 -->
      <div>
         <h3>다이어리 작성할 반려견 선택</h3>
      </div>

      
      <div style="text-align: right; margin-right: 120px;">
         <button type="button" class="btn btn-warning"
         id="petAdd" name="petAdd" 
         onclick="">반려견 추가</button>
      </div>
      

      <div id="cardContent">
         <div class="card-group">
            
            <c:forEach var="list" items="${petList }" >
               <div class="card">
                  <img class="cardImage" src="<%=cp%>/images/puppy1.png"
                     onclick="location.href='diarymain.action?pet_code='+'${list.pet_code}'">
                  <div class="card-body">
                     <h5 class="card-title">${list.pet_name }</h5>
                     <button type="button" class="btn btn-warning">수정</button>
                     <button type="button" class="btn btn-info">삭제</button>
                  </div>
               </div>
            </c:forEach>
         </div>
      </div>   
            <!-- <c:forEach var="list" items="${petList }" >

                        <div class="card">
                        <img class="cardImage" src="${list.pet_photo }"> 
                        
                           <div class="card-body">
                              
                              <h5 class="card-title">${list.pet_name }</h5>

                              <button type="submit" class="btn btn-warning">수정</button>
                              <button type="button" class="btn btn-info">삭제</button>
                              
                              <button type="button" class="btn final_btn" 
                              value="${list.pet_code}">다이어리</button>
                              
                              <input type="hidden" value="${list.pet_code }" 
                              name="pet_code" >

                              
                              
                           </div>
                        </div>
               </c:forEach>
            -->
            


            <!--  
            <div class="card">
               <img class="cardImage" src="<%=cp%>/images/puppy1.png">
               <div class="card-body">
                  <h5 class="card-title">재롱이</h5>
                  <button type="button" class="btn btn-warning">수정</button>
                  <button type="button" class="btn btn-info">삭제</button>
               </div>
            </div>
            <div class="card">
               <img class="cardImage" src="<%=cp%>/images/puppy1.png">
               <div class="card-body">
                  <h5 class="card-title">호두</h5>
                  <button type="button" class="btn btn-warning">수정</button>
                  <button type="button" class="btn btn-info">삭제</button>
               </div>
            </div>
            -->
            
      
   </form>
      <!-- 하단 회사 설명 영역 -->
      <div>
         <c:import url="MainFooter.jsp"></c:import>
      </div>
   </div>
   


</body>
</html>
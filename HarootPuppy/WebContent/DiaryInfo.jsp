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
<title>DiaryInfo.jsp</title>

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
@mixin tablet-and-up {
    @media screen and (min-width: 769px) { @content; }
}
@mixin mobile-and-up {
    @media screen and (min-width: 601px) { @content; }
}
@mixin tablet-and-down  {
    @media screen and (max-width: 768px) { @content; }
}
@mixin mobile-only {
    @media screen and (max-width: 600px) { @content; }
}



.timeLineUl, .timeLineLi
{
  list-style: none;
  padding: 0;
}


.timeLineLi:before {
    content: "";
    width: 15px;
    height: 15px;
    background: white;
    border: 3px solid #fed22f;
    border-radius: 50%;
    position: absolute;
    left: -10px;
    top: 0px;
}

.timeContainer{
  display: flex;
  justify-content: center;
  align-items: center;
  padding: 0 1rem;
  /* background: linear-gradient(45deg, #209cff, #68e0cf); */
  
  padding: 3rem 0;
}
.timeWrapper{
  background: #eaf6ff;
  padding: 2rem;
  border-radius: 15px;
  width: 500px;
}

#h1Time{
  font-size: 1.1rem;
  font-family: sans-serif;
}

.sessions{
  margin-top: 2rem;
  border-radius: 12px;
  position: relative;
}
li.timeLineLi{
  border-left: 3px solid #fed22f;
  padding-bottom: 1.5rem;
  position: relative;
  padding-left: 20px;
  margin-left: 10px;
  &:last-child{
    border: 0px;
    padding-bottom: 0;
  }
  &:before{
    content: '';
    width: 15px;
    height: 15px;
    background: white;
    border: 1px solid #4e5ed3;
    box-shadow: 3px 3px 0px #bab5f8;
    box-shadow: 3px 3px 0px #bab5f8;
    border-radius: 50%;
    position: absolute;
    left: -10px;
    top: 0px;
  }
}
.time{
  color: #2a2839;
  font-family: 'Poppins', sans-serif;
  font-weight: 700;
  @include mobile-and-up{
    font-size: .9rem;
  }
  @include mobile-only{
    margin-bottom: .3rem;
    font-size: 0.85rem;
  }

}
.memo{
  color: #4f4f4f;
      font-family: sans-serif;
  line-height: 1.5;
  margin-top:0.4rem;
  @include mobile-only{
    font-size: .9rem;
  }
}  
  
  
}

.cardImage1 {
   border: 5px solid #ffc107;
   -webkit-border-radius: 50px;
   max-width: 200px;
   height: 200px;
   margin: 0px auto;
}

#print
{
text-align: right;
max-width: 30px;
   height: 30px;
   cursor:pointer;
}

.table
{
   width: 50%;
   margin: 0px auto;
}
</style>


</head>
<body>


<!-----------------------------
  DiaryInfo.jsp
  - 반려견 정보 보기 페이지
------------------------------->

   <div>
      <!-- 메뉴영역 -->
      <div id="harootHeader">
         <c:import url="Main.jsp"></c:import>
      </div>

      <!-- content 영역 -->
      <br><br><br><br>
      <div>
         <!-- 반려견 요약 정보 -->
         <div style="text-align: center;">

            <img id="print" src="<%=cp%>/images/icons/main/print.png" onclick="window.print()"><br>
            <%-- <img id="print" src="<%=cp%>${infoList.pet_photo }" onclick="window.print()"><br> --%>
            
          
           <!--  <h2>재롱이 정보</h2> -->
            <h2>${infoList.pet_name } 정보</h2>
            
            <img style="   border: 5px solid #ffc107;-webkit-border-radius: 50px;
            max-width: 200px; height: 200px; margin: 0px auto;" src="<%=cp%>/images/puppy1.png"><br>
            <br><br>
            <table class="table table-sm">
               <tr>
                  <th scope="col">#</th>
                  <th scope="col">내용</th>
                </tr>
               <tr>
                  <td>이름</td>
                  <td>${infoList.pet_name }</td>
               </tr>
               <tr>
                  <td>생일</td>
                  <td>${infoList.pet_birth }</td>
               </tr>
               <tr>
                  <td>성별</td>
                   <td>${infoList.desex_content }</td>
               </tr>
               <tr>
                  <td>성격 (1)</td>
                  <td>${infoList.pet_char1_content }<br></td>
               </tr>
               
               <tr>
                  <td>성격 (2)</td>
                  <td>${infoList.pet_char2_content }<br></td>
               </tr>
               
               <tr>
                  <td>성격 (3)</td>
                  <td>${infoList.pet_char3_content }<br></td>
               </tr>
               
               <tr>
                  <td>성격 (4)</td>
                  <td>${infoList.pet_char4_content }<br></td>
               </tr>
               
               <tr>
                  <td>반려견등록번호</td>
                  <td>${infoList.pet_regnum }</td>
               </tr>
               <tr>
                  <td>품종</td>
                  <td>${infoList.pet_type_name }</td>
               </tr>
               
               <tr>
                  <td>접종내역</td>
                  <td>
				  <c:forEach var="injectInfo" items="${injectInfo }">
                  	${injectInfo.inject_type_name }
                  </c:forEach>
                  </td>
               </tr>
               
               <tr>
                  <td>기저질환</td>
                  <td>
                  <c:forEach var="disInfo" items="${disInfo }">
                  	${disInfo.disease_content }
				  </c:forEach>
				  </td>
               </tr>
            </table>
            
       
        </div>    
        

         <!-- 타임라인 -->
         <div id="timeline">
         <c:import url="DiaryTimeLine.jsp"></c:import>
         </div>
         
      </div>

      <!-- 하단 회사 설명 영역 -->
      <div>
         <c:import url="MainFooter.jsp"></c:import>
      </div>
   </div>

</body>
</html>
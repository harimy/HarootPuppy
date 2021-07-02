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
<title>FaqList.jsp</title>
</head>
<body>
<jsp:include page="Main.jsp" />
<div style="text-align: center;">
	<h1>자주하는 질문</h1>
</div>

<div>
	<h4><a href="">Q. 강아지 정보를 수정하고 싶으면 어떻게 해야 하나요?</a></h4>
	<hr>
	<h4><a href="">Q. 산책점수를 높이려면 어떻게 해야 하나요?</a></h4>
	<hr>
	<h4><a href="">Q. 산책점수는 어떻게 쓰이나요?</a></h4>
	<hr>
	<h4><a href="">Q.  신고 받은 내용에 대해 문의하고 싶은게 있어요.</a></h4>
	<hr>
	
	<input type="text" name="searchValue" class="textField">
	<input type="button" value="검색" class="btn2" onclick="sendIt()"> 
	
	<div id="footer_number" style="text-align: center;">
         <p>1 Prev 21 22 23 24 25 26 27 28 29 30 Next 63</p>
         
      <%--    <p>
         <%
         if(dataCount != 0)
         {
         %>
         	<%=pageIndexList %>
         <%
         }
         else
         {
         %>
         	등록된 게시물이 존재하지 않습니다.
         <%
         }
         %>
         </p> --%>
         
	</div>
</div>

</body>
</html>
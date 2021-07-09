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

<div id="harootFooter">
	<c:import url="Main.jsp"></c:import>
</div>

<br>

<div style="text-align: center;">
	<h1>자주하는 질문</h1>
</div>

<br><br>

<div>
	<h4><a href="AskRead1.jsp">Q. 강아지 정보를 수정하고 싶으면 어떻게 해야 하나요?</a></h4>
	<hr>
	<h4><a href="AskRead2.jsp">Q. 산책점수를 높이려면 어떻게 해야 하나요?</a></h4>
	<hr>
	<h4><a href="AskRead3.jsp">Q. 산책점수는 어떻게 쓰이나요?</a></h4>
	<hr>
	<h4><a href="AskRead4.jsp">Q.  신고 받은 내용에 대해 문의하고 싶은게 있어요.</a></h4>
	<hr>
	
	<input type="text" name="searchValue" class="textField">
	<input type="button" value="검색" class="btn2" onclick="sendIt()"> 
	
</div>

<br><br>

<div id="harootFooter">
	<c:import url="MainFooter.jsp"></c:import>
</div>

</body>
</html>
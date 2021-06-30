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
<title>HarootMain.jsp</title>
<style type="text/css">
	/* body
	{
		width: 100%;
	} */
	
	#header
	{
		background-color: rgb(236,181,73);
	}
	#menu
	{
		background-color: rgb(236,181,73);
	}
	#footer
	{
		background-color: rgb(236,181,73);
	}
	
</style>
</head>
<body>

<div>
   <!-- 메뉴영역 -->
   <div id="header">
      <%-- <c:import url="EmployeeMenu.jsp"></c:import> --%>
      <c:import url="MainHeader.jsp"></c:import>
   </div>
   
   <div id="menu">
   		<c:import url="MainMenu.jsp"></c:import>
   </div>
   
   <!-- 본문 영역 -->
   <div id="content">
   		<c:import url="BoardList.jsp"></c:import>
   </div>
   
   <!-- 회사 소개 및 어플리케이션 소개 영역 -->
   <div id="footer">
   		<c:import url="MainFooter.jsp"></c:import>
   </div>
</div>

</body>
</html>
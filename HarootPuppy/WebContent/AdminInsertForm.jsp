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
<title>UserInfoRead.jsp</title>
<!-- jQuery JS -->
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="<%=cp%>/js/jquery-ui.js"></script>
<!-- jQuery-UI CSS -->
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/jquery-ui.css">

<!--  부트스트랩 JS -->
<script type="text/javascript" src="<%=cp%>/js/bootstrap.js"></script>
<!-- 부트스트랩 CSS -->
<link rel="stylesheet" href="<%=cp%>/css/bootstrap.css">

<style type="text/css">

#tbl_userRead th{ text-align: center; }


#tbl_userRead .info 
{	
	margin-bottom: 5px;
	margin-left: 5px;
	
}

</style>


<script type="text/javascript">

function closeWindow()
{
	window.close();
}


function goSubmit() 
{
	f = document.getElementById("adminInsertForm");
	f.target = "parentForm2";
	f.action= "<%=cp%>/admininsertadmin.action";
	f.submit();
	self.close();
	
}


</script>
</head>
<body>
	<div style="text-align: center;">
		<h3>관리자 등록</h3>
		<hr>
	</div>

	<div style="width: 300px; margin: 5px auto;">
		<form action="" method="GET" name="" id="adminInsertForm" style="width: 100%; margin-left: 10px;">
			<table id="tbl_userRead" style="text-align: left;">
				<tr>
					<th style="margin-right: 15px;">아이디</th>
					<td>
						<input type="text" name="admin_id" class="info" value=""/>
					</td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td>
					<input type="text" name="admin_pw" class="info" value="" />
					</td>
				</tr>
				<tr>
					<th>이름</th>
					<td>
						<input type="text" name="admin_name" class="info" value="" />
					</td>
				</tr>
				
				<tr>
					<td colspan="2">
						<br>
						<button type="button" class="btn btn-warning" onclick="closeWindow()" style="float: left; padding-bottom: 0px;padding-top: 0px;">닫기</button>
						<input type="button" class="btn btn-success" onclick="goSubmit()" value="추가" style="float: right; padding-bottom: 0px;padding-top: 0px;">
						<button type="reset" class="btn btn-warning" style="float: right; padding-bottom: 0px;padding-top: 0px;">초기화</button>
					
					</td>
				</tr>
				
			</table>
		</form>


	</div>

</body>
</html>
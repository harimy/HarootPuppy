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
<title>OfflineOpinion.jsp</title>
<link rel="stylesheet" href="css/bootstrap.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<style type="text/css">
	/*테이블 기본 서식*/
	#table
	{
		width: 500px;
		border: 1px solid black;
		border-collapse: collapse;
	}
	
	#table td
	{
		border: 1px solid black;
	}
	
	#table td
	{
		border: 1px solid black;
	}
	
	#table1
	{
		width: 720px;
	}
	
	#table1 th{text-align: center;}
	#table1 th:nth-child(1) {width: 50px;}
	#table1 th:nth-child(2) {width: 460px;}
	#table1 th:nth-child(3) {width: 60px;}
	#table1 th:nth-child(4) {width: 100px;}
	#table1 th:nth-child(5) {width: 50px;}
	
	#table1 td{text-align: center;}
	#table1 td:nth-child(2) {text-align: left; padding-left: 20px;}
	#table1 td:nth-child(5) {text-align: right;}
	
	#btnSet
	{
		margin-top: -10px;
	}
	
	#main
	{
		width: 700px;
		margin: 0px auto;
	}
	
	#tblAdd{width: 600px;}
	#tblAdd th{width: 150px; text-align: right; padding-left: 15px;}
	#tblAdd td{width: 450px;}
	
</style>

</head>
<body>

<div id="main">
	<h1>의견 제출하기</h1>
	<br>
	<form>
		<table class="table table-bordered" id="tblAdd">
			<tr>
				<th>글 제목</th>
				<td>
					<input type="text" class="form-control" placeholder="제목을 입력하세요">
				</td>
			</tr> 
			<tr>
				<th>첨부파일</th>
				<td>
					<input type="file" class="form-control" placeholder="파일을 선택하세요">
				</td>
			</tr> 
			<tr>
				<th>산책 날짜</th>
				<td>
					<input type="text" class="form-control">
				</td>
			</tr> 
			<tr>
				<th>산책 시간</th>
				<td>
					<input type="text" class="form-control">
				</td>
			</tr>
			<tr>
				<th>신고 유형</th>
				<td>
					<input type="text" class="form-control">
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>
					<textarea rows="15" cols="" class="form-control" placeholder="내용을 입력하세요"></textarea>
				</td>
			</tr> 
		</table>
	</form>
	
	<div>
		<button type="button">목록으로</button>
		<button type="button" >확인</button>
	</div>
</div>


</body>
</html>
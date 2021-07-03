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
<title>ReportedOfflineRead.jsp</title>
<style type="text/css">

.tdReport
{
	width: 100px;
}

.form-group
{
	display: inline-block;
}

.all
{
	width : 100%;
	text-align: center;
}

.btn2
{
	float:left;
}

.btn1
{
	float:right;
}


</style>
</head>
<body>
<jsp:include page="Main.jsp" />
<div>
<form>
	<div style="text-align: center; font-weight: bold;">
		<h1>무단결석 의견 게시판</h1>
	</div>
	
	<br><br>
	<div class="form-group all">		
		<div class="form-group">
		<table>
				<tr class="tdReport">
					<td>처리상태</td>
					<td>미처리</td>
				</tr>
				
				<tr class="tdReport">
					<td>신고접수번호</td>
					<td>001</td>
				</tr>
				
				<tr class="tdReport">
					<td>산책번호</td>
					<td>Walk001</td>
				</tr>
				
				<tr class="tdReport">
					<td>산책날짜</td>
					<td>2021-07-03</td>
				</tr>
				
				<tr class="tdReport">
					<td>작성일자</td>
					<td>2021-07-04</td>
				</tr>
				
				<tr class="tdReport">
					<td>신고자</td>
					<td>울집김치</td>
				</tr>
				
				<tr class="tdReport">
					<td>작성자</td>
					<td>콩이아빠</td>
				</tr>
				
				<tr class="tdReport">
					<td>글제목</td>
					<td>억울해요</td>
				</tr>	
		</table>
		</div>
		
		<!-- 글내용 -->
		<br><br>
		<div class="form-group">
			<textarea rows="30" cols="120" readonly="readonly">내용 불러오기</textarea>
		</div><br>
		
		<br>
		<div style="width: 817px; margin: 0px auto;">
			<!-- 버튼  -->
			<div class="form-group btn2">
				<button type="button" id="listBtn" class="listbtn btn2">목록으로</button>
			</div>
		
		<!-- 카테고리 (미처리 / 신고해제 / 신고확정)  -->
			<div class="form-group btn1">
				<select name="optionSelect">
					<option value="미처리">미처리</option>
					<option value="신고해제">신고해제</option>
					<option value="신고확정">신고확정</option>
				</select>
				<button type="button" id="submitBtn" class="listbtn btn1">확인</button>
			</div>
		</div>
		
	
	</div>
</form>
</div>

</body>
</html>
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
<title>NoticeRead.jsp</title>
<!-- 부트스트랩 css -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 제이쿼리 script -->
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<!-- 부트스트랩 script -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<!-- 부트스트랩 테마 css -->
<script src="<%=cp %>/js/bootstrap.min.js"></script>
<style type="text/css">

#noticeDiv
{
	width: 917px; 
	margin: 100px auto;
}
 
.noticeTh
{
	margin: 5px;
}

.btn:hover { background: rgb(244,188,23);}

</style>

<script type="text/javascript">


	$(function()
	{
		$("#deleteBtn").click(function()
		{

			if (confirm("삭제하시겠습니까?"))
			{
				// alert($(this).val());
				$(location).attr("href", "adminnoticedelete.action?notice_code=" + $(this).val());
			}
			
		});
		
		$("#updateBtn").click(function()
		{
			$(location).attr("href", "adminnoticeupdateform.action?notice_code=" + $(this).val());
		});
		
	});
		
</script>

</head>
<body>
<div>
	<!-- 메뉴영역 -->
	<div id="harootHeader">
		<c:import url="AdminMenu.jsp"></c:import>
	</div>
 	
 	<div style="width: 85%; margin: auto; text-align: center;">
		<h2>공지 관리</h2>
	</div>
	<div style="width: 85%; margin: auto;">
		<h3>${list.notice_title}</h3>
			
			<table>
				<tr>
					<th class="noticeTh" width="90px;">작성자</th>
					<td class="noticeTh" style="display: inline-block;">${list.notice_writer }</td>
				</tr>
				
				<tr>
					<th class="noticeTh">작성일자 </th>
					<td style="display: inline-block;">${list.notice_date }</td>
				</tr>
				
			
				<tr>
					<th class="noticeTh">카테고리 </th>
					<td style="display: inline-block;">${list.notice_cate_content }</td>
				</tr>
					
			</table>

	</div>
		
		<br>
		<div style="width: 85%; margin: auto;">
			<textarea rows="20" class="form-control" readonly="readonly" style="resize: none;">${list.notice_content }</textarea>
		</div><br>

			<div style="width: 85%; margin: auto; text-align: right;">
		<button type="button" id="updateBtn" class="btn btn-warning" value="${list.notice_code }">수정</button>
		<button type="button" id="deleteBtn" class="btn btn-danger" value="${list.notice_code }">삭제</button>
		<button type="button" id="listBtn" class="btn btn-success" onclick="location.href='adminnoticelist.action'">목록으로</button>
		</div>

		
		<br><br><br>
		<div style="width: 85%; margin: auto;" class="bbsArticle_bottomLine">
			<p><a href="">이전글 : 이전글입니다. </a></p>
			<hr>
		</div>
		<div style="width: 85%; margin: auto;" class="bbsArticle_noLine">
			<p><a href="">다음글 : 다음글입니다. </a></p>
		</div>
		<br><br>
		
</div>

</body>
</html>
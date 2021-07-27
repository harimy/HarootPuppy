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
	padding: 4px;
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
	<div id="noticeDiv">
		<div>
			
			 <table style="width: 100%;">
			 	<tr>
			 		<th style="width: 20%;" class="noticeTh">글제목</th>
			 		<th style="width: 80%;" class="noticeTh">${list.notice_title}</th>
			 	</tr>
			 	<tr>
			 		<th class="noticeTh">작성자</th>
			 		<th class="noticeTh">${list.notice_writer }</th>
			 	</tr>
			 	<tr>
			 		<th class="noticeTh">작성일자</th>
			 		<th class="noticeTh">${list.notice_date }</th>
			 	</tr>
			 	
			 	<tr>
		 			<%-- <textarea rows="25" cols="127" readonly="readonly" style="resize: none;" >
						줄바꿈 처리
						<c:out value="${list.notice_content }" />
						${list.notice_content }
					</textarea> --%>
					
					<td colspan="2" style="padding: 30px 10px 10px 10px; vertical-align: top; height:300px;">
						<%-- ${list.notice_content } --%>
						<c:out value="${list.notice_content }" />
					</td>
			 	</tr>
			 	
			 </table>
		</div>
		
		<div>
				
			
				
		</div>
		<br>
		
		<br>
		
		<div style="display: inline-block; float:right;">
			<button id="updateBtn" class="btn btn-secondary" value="${list.notice_code }">수정</button>
			<button id="deleteBtn" class="btn btn-secondary" value="${list.notice_code }">삭제</button>
		</div>
		
		<br><br><br>
		<div class="bbsArticle_bottomLine">
			<p><a href="">이전글 : 이전글입니다. </a></p>
			<hr>
		</div>
		<div class="bbsArticle_noLine">
			<p><a href="">다음글 : 다음글입니다. </a></p>
		</div>
		<br><br>
		<div>
			<button type="button" id="listBtn" class="listbtn btn btn-secondary" onclick="location.href='adminnoticelist.action'">
				목록으로
			</button>
			
		</div>
	</div>
	
	
</div>	

</body>
</html>
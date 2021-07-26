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
<title>NoticeUpdateForm.jsp</title>

<!-- jQuery JS -->
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="<%=cp%>/js/jquery-ui.js"></script>
<!-- jQuery-UI CSS -->
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/jquery-ui.css">

<!--  부트스트랩 JS -->
<script type="text/javascript" src="<%=cp%>/js/bootstrap.js"></script>
<!-- 부트스트랩 CSS -->
<link rel="stylesheet" href="<%=cp%>/css/bootstrap.css">

<script type="text/javascript">

	$(function()
	{
		$("#submitBtn").click(function()
		{
			// 데이터 검사(공란이 있는지 없는지에 대한 여부 확인)
			if ($("#notice_title").val() == "")
			{
				alert("제목을 입력하세요");
				$("#notice_title").focus();
				return;
			}
			if ($("#notice_content").val() == "")
			{
				alert("내용을 입력하세요");
				$("#notice_content").focus();
				return;
			}

			// 폼 submit 액션 처리 수행
			$("#noticeForm").submit();
		});

	});
	
</script>



</head>
<body>

<!-----------------------------------
  NoticeUpdateForm.jsp
  공지 입력 페이지
------------------------------------->
	<div>
		<!-- 메뉴영역 -->
		<div id="harootHeader">
			<c:import url="AdminMenu.jsp"></c:import>
		</div>

		<!-- content 영역 -->
		<div id="">

			<!-- 관리자 공지 게시글 쓰기 title -->
			<div class="">
				<h1 style="font-weight: bold; text-align: center">공지 수정</h1>
			</div>
			<br>

			<!-- 글쓰기 폼 -->
			<div style="width: 900px; margin: 0px auto;">
				<form id="noticeForm" action="adminnoticeupdate.action">
					<div>
						<table>
							<tr style="width: 100%">
								<td style="width: 30%;">제목</td>
								<td><input type="text" id="notice_title" name="notice_title" value="${list.notice_title }"></td>
								<td><input type="hidden" id="notice_code" name="notice_code" value="${list.notice_code }"></td>
							</tr>
							<tr>
								<td>카테고리 선택</td>
								<td>
									<select id="notice_head_code" name="notice_head_code">
											<option value="1" ${"1"== list.notice_head_code ? "selected='selected'"  : "" }>안내</option>
											<option value="2" ${"2"== list.notice_head_code ? "selected='selected'"  : "" }>필독</option>
											<option value="3" ${"3"== list.notice_head_code ? "selected='selected'"  : "" }>공지</option>
											
									</select>
								</td>
							</tr>
							<tr>
								<td>첨부파일</td>
								<td><input type="file" name="notice_photo" multiple></td>
							</tr>
						</table>
						<br>
						<textarea id="notice_content" name="notice_content"
							style="width: 800px; resize: none;" rows=20>
						
						${list.notice_content }
						
						</textarea>
						<br>
					</div>

					<div style="width: 800px; text-align: right;">
						<button type="reset" id="cancelBtn" class="btn">초기화</button>
						<button type="submit" id="submitBtn" class="btn">글 수정</button>
					</div>
				</form>
			</div>
			<!-- end writeNotice -->

		</div>
		<!-- end harootContent -->


	</div>


</body>
</html>
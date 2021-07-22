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
<title>AdminNotice.jsp</title>

<link rel="stylesheet" href="css/bootstrap.css">

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/css/dataTables.bootstrap4.min.css">



<style type="text/css">

	.titleNotice
	{
		text-align: center;
	}
	
	body
	{
		font-size: 14px !important;
	}
	
	a.link { text-decoration: none; color: black; }
    a.link:visited { text-decoration: none; }
    a.link:hover { text-decoration: none; font-weight: bold; }
    a.link:focus { text-decoration: none; }
    a.link:hover, a:active { text-decoration: none; }

</style>

<script type="text/javascript">
	
	$(document).ready(function()
	{
	
		$('#noticeTable').dataTable(
		{
			
		});
	});

</script>

</head>
<body>

<!-----------------------------
  NoticeList.jsp
  - 관리자 공지 페이지
------------------------------->
	<div>
		<!-- 메뉴영역 -->
		<div id="harootHeader">
			
			<c:import url="AdminMenu.jsp"></c:import>
		</div>
	
	
		<!-- content 영역 -->
		<div id="harootAdminNoticeList">
	
			<!-- 관리자 공지 title -->
			<div class="form-group titleNotice">
				<br><br><h1>공지 관리</h1>
			</div>
			<br>
	
			<!-- 게시판  -->
			<div id="bbsList1" style="width:900px; margin:30px auto; text-align: left; ">
				
				<table id="noticeTable" class="table table-striped table-condensed table-hover table-bordered" 
					style="text-align: center; width: 100%;">
					<thead>
						<tr id="title">
							<th class="cate" style="text-align: center;">카테고리</th>
							<th class="num" style="text-align: center;">공지번호</th>
							<th class="subject" style="text-align: center;">제목</th>
							<th class="name" style="text-align: center;">작성자</th>
							<th class="" style="text-align: center;">작성일</th>
							<!-- <th class="hitCount" style="text-align: center;">조회수</th>
							<th class="like" style="text-align: center;">좋아요</th> -->
						</tr>
					</thead>
					<!-- 
					<tr id="lists1">
						<td class="cate">공지</td>
						<td class="num">001</td>
						<td class="subject">리뷰관련건</td>
						<td class="name">관리자001</td>
						<td class="">2021-07-03</td>
						<td class="hitCount">10</td>
						<td class="like">1</td>
					</tr>
					 -->
					<tbody>
						<c:forEach var="list" items="${list }">
							<tr>
								<td>${list.notice_cate_content }</td>					
								<td>${list.notice_code }</td>					
								<td>
								
								<a href="NoticeRead.jsp" class="link">
								<%-- <a href="adminreportboardview.action?notice_code=${list.notice_code }" class="link"> --%>
								<span class="spanSt1">${list.notice_title }</span>
								</a>
											
								
								</td>
								<td>관리자</td>					
								<td>${list.notice_date }</td>					
								<%-- <td>${list.notice_view }</td>	 --%>		
								<%-- <td>${list.notice_like }</td> --%>					
							</tr>
						</c:forEach>
					</tbody>
				</table>
		
				<br>
				<div>
					<br>
					<!-- <div style="display: inline-block; width:360px;">
						<form action="" name="searchForm" method="post">
							<select name="searchKey" style="width: 70px; height: 28px;">
								<option value="subject">제목</option>
								<option value="name">작성자</option>
							</select> <input type="text" name="searchValue" class="textField">
							<input type="button" value="검색" class="btn btn-secondary" onclick="sendIt()">
						</form>
					</div> -->
					<!-- #leftHeader -->
		
					<div style="display: inline-block; float: right;">
						<input type="button" value="글쓰기" style="font-size: 9pt;" class="btn btn-secondary"
							onclick="location.href='adminnoticeinsertform.action'">
					</div>
		
				</div>
				
			</div>
			
		</div>
	
	
	</div>

	<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
	<script src="https://cdn.datatables.net/1.10.25/js/jquery.dataTables.min.js"></script>
	<script src="https://cdn.datatables.net/1.10.25/js/dataTables.bootstrap4.min.js"></script>


</body>
</html>
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
<title>AdminAskRead.jsp</title>

<!-- jQuery JS -->
<script type="text/javascript"
	src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="<%=cp%>/js/jquery-ui.js"></script>
<!-- jQuery-UI CSS -->
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/jquery-ui.css">

<!--  부트스트랩 JS -->
<script type="text/javascript" src="<%=cp%>/js/bootstrap.js"></script>
<!-- 부트스트랩 CSS -->
<link rel="stylesheet" href="<%=cp%>/css/bootstrap.css">

<style type="text/css">


#reply
{
	width: 863px;
	height: auto;
	resize: none;
}

.askth
{
	margin-right: 5px;

}



</style>

</head>
<body>

	<div>
		<!-- 메뉴영역 -->
		<div id="harootHeader">
			<c:import url="AdminMenu.jsp"></c:import>
		</div>
		
		<br /><br />
		
		<!-- 글 내용 영역 -->
		<div style="width: 85%; margin: auto;">
				<div>
					<h1>${askView.ask_title}</h1>
				</div>
			
			<table>
				<tr>
					<th class="askth" width="90px;">작성자</th>
					<td class="askth" style="display: inline-block;">${askView.mem_nickname }</td>
				</tr>
				
				<tr>
					<th class="askth">작성일자 </th>
					<td style="display: inline-block;">${askView.ask_date }</td>
				</tr>
				
			
				<tr>
					<th class="askth">카테고리 </th>
					<td style="display: inline-block;">${askView.ask_cate_content}</td>
				</tr>
			
				<tr>
					<th class="askth">읽음상태 </th>
					<td style="display: inline-block;">${askView.ask_read == null ? 'Ⅹ' : '○' }</td>
				</tr>
				<tr>
					<th class="askth">답변여부</th>
					<td style="display: inline-block;"> ${askView.ask_state_content }</td>
				</tr>
					
			</table>

		</div>
		
			<br>
			<div style="width: 85%; margin: auto;">
				<textarea rows="20" class="form-control" readonly="readonly" style="resize: none;">${askView.ask_content }</textarea>
			</div><br>
			<div style="width: 85%; margin: auto; text-align: right;">
				<button type="button" id="listBtn" class="btn btn-success"  onclick="location.href='adminasklist.action'">목록으로</button>
			</div>
			
			<!-- 코멘트 -->
			<%-- 
			<div style="width: 85%; margin: auto;">
				<div>
				<table>
				<c:forEach var="view" items="${commView }">
				<tr>
					<td>${view.board_comm_content }</td>
				</tr>
				</c:forEach>
				</table>
				</div>
			</div>  
			--%>
			<br>
			
			<div class="container" style="width: 87%; margin: auto;">
		        <label for="content">comment</label>
		        <form name="commentInsertForm">
		            <div class="input-group">
		               <input type="text" class="form-control" id="content" name="content" placeholder="내용을 입력하세요.">
		               <span class="input-group-btn">
		                    <button type="button" name="commentInsertBtn" class="btn btn-default" >등록</button>
		               </span>
		              </div>
		        </form>
		    </div>
		    
		    <div class="container">
		        <div class="listComm"></div>
		    </div>
		    
		    <!-- 댓글 자바스크립트 -->
	 	    <%-- <jsp:include page="BoardComment.jsp" /> --%>
	
			<br><br><br>
			<!-- 
			<div style="width: 85%; margin: auto;" class="bbsArticle_bottomLine" style="width: 80%;">
				<p><a href="">이전글 : </a></p>
				<hr>
			</div>
			<div style="width: 85%; margin: auto;" class="bbsArticle_noLine" style="width: 80%;">
				<p><a href="">다음글 :</a></p>
			</div>
			 -->
			
	</div>
	

</body>

</html>
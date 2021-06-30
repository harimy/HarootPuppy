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
<title>Sample.jsp</title>
<style type="text/css">

.container-fluid
{
  border:1px solid;
  background-color: #E6E6E6;
  padding: 50px;
}



</style>

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

<script type="text/javascript">

	function add_div()
	{
	    var div = document.createElement('div');
	
	    div.innerHTML = document.getElementById('privateBlock').innerHTML;
	
	    document.getElementById('here').appendChild(div);
	}



	function remove_div(obj)
	{
		document.getElementById('here').removeChild(obj.parentNode);
	}
	
	function add_private()
	{
		alert("즐찾추가하시겠습니까?");
	}

</script>


</head>
<body>
	<!-----------------------------
 TrainInsertForm.jsp
  - 다이어리 훈련 입력폼
  - 문제 : + - 버튼 추가 시 한번 눌러도 여러개가 들어가고 
  		   첫번째 - 버튼으로는 삭제가 되지 않음
------------------------------->

	<div>
		<!-- 메뉴영역 -->
		<div>
			 <c:import url="DiaryMain2.jsp"></c:import>
		</div>
		<br><br>
		
		
		<!-- content 영역 -->
		<div>
			<c:import url="DiaryInsertTimeForm.jsp"></c:import>
		</div>
		<br><br>
		
		<div class="container-fluid favorite" id="privateBlock">
			즐겨찾기&nbsp;
			<select name="favorite">
				<option value="mirivogi">미리보기</option>
			</select>
			<br><br>
			
				<button value="+" onclick="add_div()">+</button>
				<button value="addPrivate" onclick="add_private()">❤</button>
				
				<br>
				훈련이름 <input type="text"><br>
				훈련종류 
				<label><input type="radio" name="train" value="기본명령훈련" checked="checked">기본명령훈련</label>
				<label><input type="radio" name="train" value="행동교정훈련">행동교정훈련</label>
				<label><input type="radio" name="train" value="사회화훈련">사회화훈련</label>
				<label><input type="radio" name="train" value="배변훈련">배변훈련</label>

				<br>
				<button value="-" onclick="remove_div(this)">-</button>
			
			
			<div id="here"></div>

			<!-- 하단 회사 설명 영역 -->
			<!-- 시간 -->
			<div>
				<%-- <c:import url="하단메뉴.jsp"></c:import> --%>
			</div>
		</div>

		
	</div>

</body>
</html>
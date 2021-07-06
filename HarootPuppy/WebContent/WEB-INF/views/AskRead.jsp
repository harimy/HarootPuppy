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
<title>AskRead.jsp</title>
<style type="text/css">
	body
	{
		margin: 30px;
	}
</style>

</head>
<body>
<div>
	<form>
		<div>
			<h1>강아지 정보를 수정하고 싶으면 어떻게 해야 하나요?</h1>
		</div>
		<div>
		<table>
			<tr>
				<th>박날동실물영접소취</th>
				<td>21.06.26 13:34&nbsp;&nbsp;</td>
				<td>답변완료&nbsp;&nbsp;</td>
			</tr>
		</table>
		</div>
		
		<div>
			<textarea rows="30" style="width: 100%;" readonly="readonly">내용 불러오기</textarea>
		</div><br>
		<div style="text-align: right;">
			<button type="button" class="" value="">수정</button>
			<button type="button" class="" value="">삭제</button>
			<button type="button" class="" value="">목록으로</button>
		</div>
	</form>
</div>

</body>
</html>
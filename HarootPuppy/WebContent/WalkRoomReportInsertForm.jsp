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
<title>WalkRoomReportInsertForm.jsp</title>
<script type="text/javascript">
  
  function openChild() {
	  
	    var _width = '650';
	    var _height = '380';
	 
	    // 팝업을 가운데 위치시키기 위해 아래와 같이 값 구하기
	    var _left = Math.ceil(( window.screen.width - _width )/2);
	    var _top = Math.ceil(( window.screen.height - _height )/2); 
	 
	    window.open('WalkRoomReportInsertSuccess.jsp', 'popup-test', 'width='+ _width +', height='+ _height +', left=' + _left + ', top='+ _top );
	}
	 

</script>
</head>
<body style="text-align: center;">

<div>
	<h3><p>산책 메이트 방을 신고하시겠습니까?<br>
	신고 사유를 선택해주십시오.</</h3>
</div>

<div>
	<input type="radio" id="sexual" name="walkRoomReportInsert">
	<label for="sexual">불건전한 목적의 방</label>
	<br>
	<input type="radio" id="curse" name="walkRoomReportInsert">
	<label for="curse">비방 / 욕설<br></label>
	<input type="radio" id="etc" name="walkRoomReportInsert">
	<label for="etc">기타(직접 입력)</label><br>
	<textarea rows="10" cols="30"></textarea>
</div>
<br>
<div>
	<button type="button" onclick="openChild()">확인</button>
	<button type="button">취소</button>
</div>

</body>
</html>
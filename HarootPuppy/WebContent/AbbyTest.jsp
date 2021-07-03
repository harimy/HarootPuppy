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
<title>아별 테스트 페이지 (나중에 삭제 예정)</title>
<!-- jQuery JS -->
<script type="text/javascript"
	src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="<%=cp%>/js/jquery-ui.js"></script>

<style type="text/css">
.layer {
	display: none;
}
</style>

<script type="text/javascript">
	// 셀렉트박스 값 변경시 이벤트 처리
	$(window).load(function()
	{

		jQuery('#selectBox').change(function()
		{
			var state = jQuery('#selectBox option:selected').val();
			if (state == 'option2')
			{
				jQuery('.layer').show();
			} else
			{
				jQuery('.layer').hide();
			}
		});
		
		
			 
	   // 라디오버튼 클릭시 이벤트 발생
	   $("input:radio[name=medicineKind]").click(function(){
	
	       if($("input[name=medicineKind]:checked").val() == "1"){
	           
	           $('#amountSpn').html('개')
	           // radio 버튼의 value 값이 1이라면 활성화
	
	       }else if($("input[name=medicineKind]:checked").val() == "0"){
	      	 	$('#amountSpn').html('개')
	           // radio 버튼의 value 값이 0이라면 비활성화
	       }
	   });
	
		
	});
</script>

</head>

<body>


	<!-- 셀렉트박스 변경 이벤트 테스트 -->
	<!-- 
	<select id="selectBox" name="selectBox">
		<option value="" selected="selected">전체</option>
		<option value="option1">옵션1</option>
		<option value="option2">옵션2</option>
		<option value="option3">옵션3</option>
	</select>

	<div class="layer">보여라아아아아</div>
 	-->


	<!-- 라디오버튼 선택시 이벤트 테스트 -->

	<div style="width:200px;">
	  <input type="radio" name="radio" id="r1" value="1" checked><label for="r1">활성화</label>
	  <input type="radio" name="radio" id="r2" value="0"><label for="r2">비활성화</label>
	</div>
	<div style="width:200px;">
	  <input type="text" name="text">
	</div>



</body>
</html>
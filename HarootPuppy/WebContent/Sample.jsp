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
<title>Sample.jsp</title>

<!-- 제이쿼리 -->
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>

<!-- jQuery-UI CSS -->
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/jquery-ui.css">

<!-- 부트스트랩 -->
<script type="text/javascript" src="js/bootstrap.js"></script>

<!-- 부트스트랩 CSS -->
<link rel="stylesheet" href="<%=cp%>/css/bootstrap.css">

<script type="text/javascript">
	function ezBSAlert(options) {
		var deferredObject = $.Deferred();
		var defaults = {
			type : "alert", //alert, prompt,confirm 
			modalSize : 'modal-sm', //modal-sm, modal-lg
			okButtonText : 'Ok',
			cancelButtonText : 'Cancel',
			yesButtonText : 'Yes',
			noButtonText : 'No',
			headerText : 'Attention',
			messageText : 'Message',
			alertType : 'default', //default, primary, success, info, warning, danger
			inputFieldType : 'text', //could ask for number,email,etc
		}
		$.extend(defaults, options);

		var _show = function() {
			var headClass = "navbar-default";
			switch (defaults.alertType) {
			case "primary":
				headClass = "alert-primary";
				break;
			case "success":
				headClass = "alert-success";
				break;
			case "info":
				headClass = "alert-info";
				break;
			case "warning":
				headClass = "alert-warning";
				break;
			case "danger":
				headClass = "alert-danger";
				break;
			}
			$('BODY')
					.append(
							'<div id="ezAlerts" class="modal fade">'
									+ '<div class="modal-dialog" class="' + defaults.modalSize + '">'
									+ '<div class="modal-content">'
									+ '<div id="ezAlerts-header" class="modal-header ' + headClass + '">'
									+ '<button id="close-button" type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>'
									+ '<h4 id="ezAlerts-title" class="modal-title">Modal title</h4>'
									+ '</div>'
									+ '<div id="ezAlerts-body" class="modal-body">'
									+ '<div id="ezAlerts-message" ></div>'
									+ '</div>'
									+ '<div id="ezAlerts-footer" class="modal-footer">'
									+ '</div>' + '</div>' + '</div>' + '</div>');

			$('.modal-header').css({
				'padding' : '15px 15px',
				'-webkit-border-top-left-radius' : '5px',
				'-webkit-border-top-right-radius' : '5px',
				'-moz-border-radius-topleft' : '5px',
				'-moz-border-radius-topright' : '5px',
				'border-top-left-radius' : '5px',
				'border-top-right-radius' : '5px'
			});

			$('#ezAlerts-title').text(defaults.headerText);
			$('#ezAlerts-message').html(defaults.messageText);

			var keyb = "false", backd = "static";
			var calbackParam = "";
			switch (defaults.type) {
			case 'alert':
				keyb = "true";
				backd = "true";
				$('#ezAlerts-footer').html(
						'<button class="btn btn-' + defaults.alertType + '">'
								+ defaults.okButtonText + '</button>').on(
						'click', ".btn", function() {
							calbackParam = true;
							$('#ezAlerts').modal('hide');
						});
				break;
			case 'confirm':
				var btnhtml = '<button id="ezok-btn" class="btn btn-primary">'
						+ defaults.yesButtonText + '</button>';
				if (defaults.noButtonText && defaults.noButtonText.length > 0) {
					btnhtml += '<button id="ezclose-btn" class="btn btn-default">'
							+ defaults.noButtonText + '</button>';
				}
				$('#ezAlerts-footer').html(btnhtml).on('click', 'button',
						function(e) {
							if (e.target.id === 'ezok-btn') {
								calbackParam = true;
								$('#ezAlerts').modal('hide');
							} else if (e.target.id === 'ezclose-btn') {
								calbackParam = false;
								$('#ezAlerts').modal('hide');
							}
						});
				break;
			case 'prompt':
				$('#ezAlerts-message')
						.html(
								defaults.messageText
										+ '<br /><br /><div class="form-group"><input type="' + defaults.inputFieldType + '" class="form-control" id="prompt" /></div>');
				$('#ezAlerts-footer').html(
						'<button class="btn btn-primary">'
								+ defaults.okButtonText + '</button>').on(
						'click', ".btn", function() {
							calbackParam = $('#prompt').val();
							$('#ezAlerts').modal('hide');
						});
				break;
			}

			$('#ezAlerts').modal({
				show : false,
				backdrop : backd,
				keyboard : keyb
			}).on('hidden.bs.modal', function(e) {
				$('#ezAlerts').remove();
				deferredObject.resolve(calbackParam);
			}).on('shown.bs.modal', function(e) {
				if ($('#prompt').length > 0) {
					$('#prompt').focus();
				}
			}).modal('show');
		}

		_show();
		return deferredObject.promise();
	}

	$(document).ready(function() {
		$("#btnAlert").on("click", function() {
			var prom = ezBSAlert({
				messageText : "hello world",
				alertType : "danger"
			}).done(function(e) {
				$("body").append('<div>Callback from alert</div>');
			});
		});

		$("#btnConfirm").on("click", function() {
			ezBSAlert({
				type : "confirm",
				messageText : "hello world",
				alertType : "info"
			}).done(function(e) {
				$("body").append('<div>Callback from confirm ' + e + '</div>');
			});
		});

		$("#btnPrompt").on("click", function() {
			ezBSAlert({
				type : "prompt",
				messageText : "Enter Something",
				alertType : "primary"
			}).done(function(e) {
				ezBSAlert({
					messageText : "You entered: " + e,
					alertType : "success"
				});
			});
		});

	});
</script>
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/menuStyle.css">
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/jquery-ui.css">
<style type="text/css">
    /* 메뉴 수정 */
   .ab ul, ol, li { list-style:none; margin:0; padding:0; width: 100%}
   	
    ul.myMenu {text-align: center;}
    ul.myMenu > li { display:inline-block; width:300px; padding:5px 10px; background:rgb(244,188,23); text-align:center; position:relative; }
    ul.myMenu > li:hover { background:rgb(244,188,23); }
    ul.myMenu > li ul.submenu { display:none; position:absolute; top:30px; left:0; }
    ul.myMenu > li:hover ul.submenu { display:block; }
    ul.myMenu > li ul.submenu > li { display:inline-block; width:300px; padding:5px 10px; text-align:center; background-color: white;}
    ul.myMenu > li ul.submenu > li:hover { background-color: rgb(250, 223, 114);  }
    
    a.container:link, a.container:visited
	{
		display: block;
		font-weight: bold;
		background-color: rgb(244,188,23);
		text-align: center;
		padding: 4px;
		text-decoration: none;
		text-transform: uppercase;
		height: 30px;
		font-size: 14pt;
	}

	a.container:hover, a.container:active
	{
		background-color: rgb(244,188,23);
		color: #000000;
		height: 26px;
	}
	
	a { text-decoration: none; color: black; }
    a:visited { text-decoration: none; }
    a:hover { text-decoration: none; }
    a:focus { text-decoration: none; }
    a:hover, a:active { text-decoration: none; }
</style>
</head>
<body>

	<!-----------------------------
  Sample.jsp
  - 페이지 설명
------------------------------->
	<div>
		<!-- 메뉴영역 -->
		<div id="harootHeader">
			<div id="menu">

<jsp:include page="MainHeader.jsp"></jsp:include>

<div id="container" class="ab" style="background-color: rgb(244,188,23);">
<ul class="myMenu">
	<li class="menu1">
        <a href="DiarySelectPet.jsp">나의 반려견</a>  
    </li>
    <li class="menu2">
    	<a href="WalkSelectPet.jsp">산책메이트</a>	
    	<ul class="menu3_s submenu">
            <li style="margin-top: 5px;"><a href="WalkSelectPet.jsp">산책메이트</a></li>
            <li><a href="WalkHistoryMain.jsp">히스토리</a></li>
        </ul> 
    </li>
    <li class="menu3">
        <a href="ReportMain.jsp">자유게시판</a>
        <ul class="menu3_s submenu">
            <li style="margin-top: 5px;"><a href=".jsp">자유게시판</a></li>
            <li>HOT 게시판<li>
        </ul>   
    </li>
    <li class="menu4">
    	<a href="AllUserInfoList.jsp">고객 지원</a>
    </li>

</ul>
</div>

</div>
			
		</div>

		<!-- content 영역 -->
		<div id="harootContent">

			<div class="container-fluid">
				<div class="row">
					<div class="col-md-12">
						<button id="btnPrompt" class="btn btn-primary">Prompt</button>
					</div>
				</div>
			</div>

		</div>

		<!-- 하단 회사 설명 영역 -->
		<div id="harootFooter">
			<c:import url="MainFooter.jsp"></c:import>
		</div>
	</div>


</body>

</html>
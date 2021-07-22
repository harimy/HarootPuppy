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
<title>BoardComment.jsp</title>
<script type="text/javascript">
	var bno = '${view.board_code}'; //게시글 번호
	
	$('[name=commentInsertBtn]').click(function(){ //댓글 등록 버튼 클릭시 
	    var insertData = $('[name=commentInsertForm]').serialize(); //commentInsertForm의 내용을 가져옴
	    insertComm(insertData); //Insert 함수호출(아래)
	});
	 
	//댓글 목록 
	function listComm(){
	    $.ajax({
	        url : '/boardcommlist.action',
	        type : 'get',
	        data : {'board_code':board_code},
	        success : function(data){
	            var a =''; 
	            $.each(data, function(key, value){ 
	                a += '<div class="commentArea" style="border-bottom:1px solid darkgray; margin-bottom: 15px;">';
	                a += '<div class="commentInfo'+value.board_comm_code+'">'+'댓글번호 : '+value.board_comm_code+' / 작성자 : '+value.board_comm_writer;
	                a += '<a onclick="commentUpdate('+value.board_comm_code+',\''+value.board_comm_content+'\');"> 수정 </a>';
	                a += '<a onclick="commentDelete('+value.board_comm_code+');"> 삭제 </a> </div>';
	                a += '<div class="commentContent'+value.board_comm_code+'"> <p> 내용 : '+value.board_comm_content +'</p>';
	                a += '</div></div>';
	            });
	            
	            $(".listComm").html(a);
	        }
	    });
	}
	 
	//댓글 등록
	function insertComment(insertData){
	    $.ajax({
	        url : '/boardcomminsert.action',
	        type : 'post',
	        data : insertData,
	        success : function(data){
	            if(data == 1) {
	            	listComm(); //댓글 작성 후 댓글 목록 reload
	                $('[name=content]').val('');
	            }
	        }
	    });
	}
	 
	//댓글 수정 - 댓글 내용 출력을 input 폼으로 변경 
	function commentUpdate(cno, content){
	    var a ='';
	    
	    a += '<div class="input-group">';
	    a += '<input type="text" class="form-control" name="content_'+cno+'" value="'+content+'"/>';
	    a += '<span class="input-group-btn"><button class="btn btn-default" type="button" onclick="commentUpdateProc('+cno+');">수정</button> </span>';
	    a += '</div>';
	    
	    $('.commentContent'+cno).html(a);
	    
	}
	 
	//댓글 수정
	function commentUpdateProc(cno){
	    var updateContent = $('[name=content_'+cno+']').val();
	    
	    $.ajax({
	        url : '/comment/update',
	        type : 'post',
	        data : {'content' : updateContent, 'cno' : cno},
	        success : function(data){
	            if(data == 1) commentList(bno); //댓글 수정후 목록 출력 
	        }
	    });
	}
	 
	//댓글 삭제 
	function commentDelete(cno){
	    $.ajax({
	        url : '/comment/delete/'+cno,
	        type : 'post',
	        success : function(data){
	            if(data == 1) commentList(bno); //댓글 삭제후 목록 출력 
	        }
	    });
	}
	 
	 
	$(document).ready(function(){
	    commentList(); //페이지 로딩시 댓글 목록 출력 
	});


</script>
</head>
<body>


</body>
</html>
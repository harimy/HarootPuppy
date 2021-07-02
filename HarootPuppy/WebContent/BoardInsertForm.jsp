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
<title>BoardInsertForm.jsp</title>
<style type="text/css">
	 body
	 {
	 	margin: 30px;
	 }
</style>
</head>
<body>
<jsp:include page="Main.jsp" />
<div>
 <form>
      <table>
         <tr>
            <td>제목</td>
            <td>
               <input type="text" id="name">
            </td>
         </tr>
         <tr>
            <td>카테고리 선택</td>
            <td>
               <select id="selectcate">
                  <option value="1" selected="selected">행사/할인정보</option>
                  <option value="2">리뷰</option>
                  <option value="3">수다</option>
                  <option value="4">중고장터</option>
               </select>
            </td>
         </tr>
         <tr>
            <td>첨부파일</td>
            <td>
              <input type="file" name="upload" multiple>
            </td>
         </tr>
     </table>
     <br>
    <textarea style="width: 100%;" rows=20 placeholder="내용을 입력하세요"></textarea><br>
 </form>
 </div>
 
 <div style="width:100%; text-align: right;">
	  <button type="button" id="cancel" class="btn">취소</button>
	  <button type="submit" id="register" class="btn">글 등록</button>
 </div>

</body>
</html>
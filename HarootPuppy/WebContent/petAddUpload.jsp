<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="javax.servlet.jsp.tagext.TryCatchFinally"%>
<%@page import="java.io.File"%>
<%@page import="java.io.DataInputStream"%>
<%@page import="java.util.Enumeration"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%

   // Test4.jsp
   
   request.setCharacterEncoding("UTF-8");
   String cp = request.getContextPath();
   
   /* String root = request.getRealPath("/"); */ // 예전 방식
   String root = pageContext.getServletContext().getRealPath("/");
   
   // 실제 물리적 주소
   System.out.println(root);   // web 에서 실행하고 console 창에서 확인
   //--==> C:\SpringMVC\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\FileSystemApp03\
   //      워크스페이스\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\FileSystemApp03\
   
   // 저장되는 위치와 폴더
   String path = root  + "pds"+ File.separator  + "File.separator" + "saveData";
   // \pds\File.separatorsaveData
   
   
   // 확인
   //  System.out.println(path);
   //--==>> C:\SpringMVC\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\FileSystemApp03\pds\File.separatorsaveData
   
		   
   // 저장 대상(디렉터리 경로)이 존재하지 않으면 생성
   File dir = new File(path);
   if(!dir.exists())
      dir.mkdirs();
   
   String encType = "UTF-8";
   // enc = encoding 
   int maxFileSize = 5*1024*1024;   // 전송 최대 사이즈 5M
   
   try
   {
      MultipartRequest req = null;
      
      req = new MultipartRequest(request, path, maxFileSize, encType, new DefaultFileRenamePolicy());
      // 요청에대해서처리할요청객체, 실제저장경로, 최대크기, 인코딩방식, 파일이름이겹칠시의정책
      
      out.println("서버에 저장된 파일명 : " + req.getFilesystemName("petFile") + "<br>");
      out.println("파일 타입 : " + req.getContentType("petFile") + "<br>");
      
        File file = req.getFile("petFile");
         if(file != null)
            out.println("파일길이 : "+ file.length() + "<br>");

   } 
   catch(Exception e)
   {
      System.out.println("e.toString()");
   }
   
   
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NoticeRead.jsp</title>

<script type="text/javascript">
	
</script>

</head>
<body>
	<form action="diaryselectpet.action" >
	등록하시겠습니까?
		<button type="submit" >확인</button>
	</form>


</body>
</html>














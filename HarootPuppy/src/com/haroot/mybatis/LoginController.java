package com.haroot.mybatis;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;



@Controller
public class LoginController
{
	// SqlSession 을 활용하여 마이바티스 객체 의존성 (자동) 주입
	@Autowired
	public SqlSession sqlSession;
	
   
   
	@RequestMapping(value="login_check.action", method=RequestMethod.GET)
	public String login_check(HttpServletRequest request, HttpSession session) 
	{
		
		String result="";
		
		String id = request.getParameter("admin_id");
		String pw = request.getParameter("admin_pw");
		
		AdminDTO dto = new AdminDTO();
		dto.setAdmin_id(id);
		dto.setAdmin_pw(pw);
		
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
		String name = dao.loginCheck(dto);
		
		System.out.println(dto.toString());
		 if( name != null) { //로그인 성공 (그러니까 loginCheck()메소드 안에 이름이 저장되어있다는 뜻)
          
         result = "AdminMenu.jsp";
		 }
		 else {
          
         
          result = "LoginForm.jsp";
      }
      return result; 
	}
	
	
}

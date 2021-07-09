
/*=====================
 * LoginController.java
 * - 로그인 처리
======================*/

package com.haroot.mybatis;
import java.sql.SQLException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class LoginController
{
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value="loginMem.action", method=RequestMethod.POST)
	public String hello(HttpServletRequest request, Model model) throws SQLException
	{
		String result = null;
	
		String mem_id = request.getParameter("mem_id");
		String mem_pw = request.getParameter("mem_pw");

		IMemberDAO dao = sqlSession.getMapper(IMemberDAO.class);
		MemberDTO dto = dao.login(mem_id, mem_pw);
		//String sid_code = null;
		//sid_code = dto.getSid_code();
		
		if(dto.getSid_code() != null)
		{
			model.addAttribute("sid_code", dto.getSid_code());
			result = "/HarootPuppyMain.jsp";
			//System.out.println(sid_code);
		}
		else
		{
			result = "/LoginForm.jsp";
			//System.out.println(sid_code);
		}
	
		return result;
	}
   
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

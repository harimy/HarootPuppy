
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
	
	
	@RequestMapping(value="login.action", method=RequestMethod.GET)
	public String login(HttpServletRequest request, HttpSession session, Model model) throws SQLException
	{
		String result = "LoginForm.jsp";
		return result;
	}
	@RequestMapping(value="loginmem.action", method=RequestMethod.POST)
	public String loginM(HttpServletRequest request, HttpSession session, Model model) throws SQLException
	{
		String result = null;
	
		String mem_id = request.getParameter("mem_id");
		String mem_pw = request.getParameter("mem_pw");

		IMemberDAO dao = sqlSession.getMapper(IMemberDAO.class);
		MemberDTO dto = dao.loginMem(mem_id, mem_pw);
		//String sid_code = null;
		//sid_code = dto.getSid_code();
		
		if(dto != null)
		{
			model.addAttribute("sid_code", dto.getSid_code());
			session.setAttribute("sid_code", dto.getSid_code());
			result = "mainheader.action";
			//System.out.println(sid_code);
		}
		else
		{
			result = "/LoginForm.jsp";
			//System.out.println(sid_code);
		}
	
		return result;
	}
   
	@RequestMapping(value="loginadmin.action", method=RequestMethod.POST)
	public String loginA(HttpServletRequest request, HttpSession session, Model model) throws SQLException 
	{
		
		String result= null;
		
		String admin_id = request.getParameter("admin_id");
		String admin_pw = request.getParameter("admin_pw");
		
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
		AdminDTO dto = dao.loginAdmin(admin_id, admin_pw);
		
		 if( dto != null) 
		 { 
			model.addAttribute("admin_code", dto.getAdmin_code());
			session.setAttribute("admin_code", dto.getAdmin_code());
         result = "/adminheader.action";
		 }
		 else 
		 {
         
         result = "/LoginForm.jsp";
      }
      return result; 
	}
	
	@RequestMapping(value="logoutmem.action", method=RequestMethod.GET)
	public String logoutM(HttpServletRequest request, HttpSession session, Model model) throws SQLException 
	{
		
		String sibal = (String)session.getAttribute("sid_code");
		System.out.println(sibal);
      session.removeAttribute("sid_code");
      return "HarootPuppyMain.jsp";
	}
	
	@RequestMapping(value="logoutadmin.action", method=RequestMethod.GET)
	public String logoutA(HttpServletRequest request, HttpSession session, Model model) throws SQLException 
	{
		
      session.removeAttribute("amdin_code");
     
      return "HarootPuppyMain.jsp";
	}

}

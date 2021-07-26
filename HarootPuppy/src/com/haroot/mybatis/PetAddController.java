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
public class PetAddController
{
	// SqlSession 을 활용하여 마이바티스 객체 의존성 (자동) 주입
	@Autowired
	private SqlSession sqlSession;
	
	
	@RequestMapping(value = "/petinsertform.action", method = RequestMethod.POST)
	public String registerForm(Model model, HttpServletRequest request)
	{
		HttpSession session = request.getSession();
		String sid_code = (String)session.getAttribute("sid_code");
		String nickname = (String)session.getAttribute("nickname");
		return "/PetAdd.jsp";
	}
	
	
	@RequestMapping(value = "/addpet.action", method = RequestMethod.POST)
	public String add(PetDTO p, HttpServletRequest request) throws SQLException 
	{

		IPetDAO dao = sqlSession.getMapper(IPetDAO.class);
		HttpSession session = request.getSession();
		String sid_code = (String)session.getAttribute("sid_code");
		String nickname = (String)session.getAttribute("nickname");
		System.out.println("펫 포토" + request.getParameter("pet_photo"));
		dao.addPet(p);
		
		return "/HarootPuppyMain.jsp";
	}
	
}

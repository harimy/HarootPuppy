package com.haroot.mybatis;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainController
{
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value="mainheader.action", method=RequestMethod.POST)
	public String mainHeader(Model model, HttpServletRequest request, HttpServletResponse response)
	{
		HttpSession session = request.getSession();
		String sid_code = (String)session.getAttribute("sid_code");
		
		// System.out.println(sid_code);
		IMemberDAO dao = sqlSession.getMapper(IMemberDAO.class);
		model.addAttribute("nickname", dao.searchNickName(sid_code));
		session.setAttribute("sid_code", sid_code);
		
		return "main.action";

	}

	@RequestMapping(value="main.action", method=RequestMethod.POST)
	public String goToMain(Model model, HttpServletRequest request, HttpServletResponse response)
	{
		HttpSession session = request.getSession();
		String sid_code = (String)session.getAttribute("sid_code");
		
		// System.out.println(sid_code);
		IMemberDAO dao = sqlSession.getMapper(IMemberDAO.class);
		model.addAttribute("nickname", dao.searchNickName(sid_code));
		model.addAttribute("sid_code", sid_code);
		// sid_code 넘김

	@RequestMapping(value="beforemain.action", method=RequestMethod.GET)
	public String goToMainBefore(Model model)
	{
			return "HarootPuppyMain.jsp";
	}
	
	
}

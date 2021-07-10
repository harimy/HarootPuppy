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
	

	@RequestMapping(value="main.action", method=RequestMethod.POST)
	public String goToMain(Model model, HttpServletRequest request, HttpServletResponse response)
	{
		HttpSession session = request.getSession();
		String sid_code = (String)session.getAttribute("sid_code");
		
		// System.out.println(sid_code);
		IMemberDAO dao = sqlSession.getMapper(IMemberDAO.class);
		model.addAttribute("nickname", dao.searchNickName(sid_code));
		
		if(sid_code!=null)
		{
			return "HarootPuppyMain.jsp";
		}
		else
		{
			return "LoginForm.jsp";
		}

	}
}

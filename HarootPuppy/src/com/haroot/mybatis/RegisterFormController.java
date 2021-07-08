package com.haroot.mybatis;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class RegisterFormController 
{
	// SqlSession 을 활용하여 마이바티스 객체 의존성 (자동) 주입
	@Autowired
	private SqlSession sqlSession;

	
	// 테스트용 리스트 출력
	@RequestMapping(value = "/memberlist.action", method = RequestMethod.POST)
	public String list(Model model) 
	{
		String result = null;

		IMemberDAO dao = sqlSession.getMapper(IMemberDAO.class);
		model.addAttribute("list", dao.list());

		result = "/printTest.jsp";

		return result;
	}
	
	
	@RequestMapping(value = "/register.action", method = RequestMethod.POST)
	public String add(MemberDTO m) 
	{

		IMemberDAO dao = sqlSession.getMapper(IMemberDAO.class);
		
		dao.add(m);
		
		return "/HarootPuppyMain.jsp";
	}
}

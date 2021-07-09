package com.haroot.mybatis;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AskController
{
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value="/asklist.action", method=RequestMethod.GET)
	public String askList(Model model)
	{
		String result = null;
		
		IAskDAO dao = sqlSession.getMapper(IAskDAO.class);
		
		model.addAttribute("askList", dao.askList());
		
		result = "/WEB-INF/views/AskList.jsp";
		
		return result;
	}
}

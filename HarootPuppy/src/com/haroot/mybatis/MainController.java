package com.haroot.mybatis;

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
	
	@RequestMapping(value="main.action", method=RequestMethod.GET)
	public String goToMain(Model model)
	{
		return "/HarootPuppyMain.jsp";
	}
}

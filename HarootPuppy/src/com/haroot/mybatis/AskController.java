package com.haroot.mybatis;

import java.sql.SQLException;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
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
		model.addAttribute("count", dao.count());
		
		result = "/WEB-INF/views/AskList.jsp";
		
		return result;
	}
	
	@RequestMapping(value="/askread.action", method=RequestMethod.GET)
	public String askView(Model model, int ask_code)
	{
		String result = null;
		
		IAskDAO dao = sqlSession.getMapper(IAskDAO.class);
		
		model.addAttribute("read", dao.getReadData(ask_code));
		
		result = "/WEB-INF/views/AskRead.jsp";
		
		return result;
	}
	
	@RequestMapping(value = "askinsertform.action", method = RequestMethod.GET)
	public String askInsertForm(ModelMap model) throws SQLException
	{
		IAskDAO dao = sqlSession.getMapper(IAskDAO.class);
		
		int nextNum = dao.getMaxNum() + 1;
		
		model.addAttribute("nextNum", nextNum);
		
		return "/AskInsertForm.jsp";
	}
	
	@RequestMapping(value="/askinsert.action", method=RequestMethod.POST)
	public String askInsert(AskDTO ask)
	{
		IAskDAO dao = sqlSession.getMapper(IAskDAO.class);
		
		dao.add(ask);
		
		return "redirect:asklist.action";
		
	}
}

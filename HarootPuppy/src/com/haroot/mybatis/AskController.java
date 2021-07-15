package com.haroot.mybatis;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
	public String askList(HttpServletRequest request, Model model) throws SQLException
	{
		HttpSession session = request.getSession();
		String sid_code = (String)session.getAttribute("sid_code");
		String result = null;
		
		if(sid_code=="" || sid_code==null)
		{
			result = "redirect:LoginForm.jsp";
		}
		else
		{
			IAskDAO dao = sqlSession.getMapper(IAskDAO.class);
			
			model.addAttribute("askList", dao.askList());
			model.addAttribute("count", dao.count());
			
			result = "/WEB-INF/views/AskList.jsp";
		}
			return result;
	}
	
	@RequestMapping(value="/askread.action", method=RequestMethod.GET)
	public String askView(HttpServletRequest request, Model model, int ask_code) throws SQLException
	{
		HttpSession session = request.getSession();
		String sid_code = (String)session.getAttribute("sid_code");
		String result = null;
		
		if(sid_code=="" || sid_code==null)
		{
			result = "redirect:LoginForm.jsp";
		}
		else
		{
			IAskDAO dao = sqlSession.getMapper(IAskDAO.class);
			
			model.addAttribute("read", dao.getReadData(ask_code));
			
			result = "/WEB-INF/views/AskRead.jsp";
		}
			return result;
	}
	
	@RequestMapping(value = "askinsertform.action", method = RequestMethod.GET)
	public String askInsertForm(HttpServletRequest request, ModelMap model) throws SQLException
	{
		HttpSession session = request.getSession();
		String sid_code = (String)session.getAttribute("sid_code");
		String result = null;
		
		if(sid_code=="" || sid_code==null)
		{
			result = "redirect:LoginForm.jsp";
		}
		else
		{
			IAskDAO dao = sqlSession.getMapper(IAskDAO.class);
			
			int nextNum = dao.getMaxNum() + 1;
			
			model.addAttribute("nextNum", nextNum);
			//System.out.println("여기 사실 글등록페이지임");
		}
			return "/AskInsertForm.jsp";
	}
	
	@RequestMapping(value="/askinsert.action", method=RequestMethod.POST)
	public String askInsert(HttpServletRequest request, AskDTO ask) throws SQLException
	{
		HttpSession session = request.getSession();
		String sid_code = (String)session.getAttribute("sid_code");
		String result = null;
		
		if(sid_code=="" || sid_code==null)
		{
			result = "redirect:LoginForm.jsp";
		}
		else
		{
			IAskDAO dao = sqlSession.getMapper(IAskDAO.class);
			AskDTO dto = new AskDTO();
			
			int ask_code = dao.getMaxNum() + 1;
			dto.setAsk_code(ask_code);
			
			dao.add(ask);
			
			return "redirect:asklist.action";
		}
		return result;
	}
	
	// 게시글 수정 폼
	@RequestMapping(value="/askupdateform.action", method=RequestMethod.GET)
	public String askUpdateForm(HttpServletRequest request, ModelMap model, int ask_code) throws SQLException
	{
		HttpSession session = request.getSession();
		String sid_code = (String)session.getAttribute("sid_code");
		String result = null;
		
		if(sid_code=="" || sid_code==null)
		{
			result = "redirect:LoginForm.jsp";
		}
		else
		{
			IAskDAO dao = sqlSession.getMapper(IAskDAO.class);
			
			model.addAttribute("ask_code", ask_code);
			model.addAttribute("search", dao.getReadData(ask_code));
			  
			result = "AskUpdateForm.jsp";
		} 
		return result;
	}
	
	// 게시글 수정
	@RequestMapping(value="/askupdate.action", method=RequestMethod.POST)
	public String askUpdate(HttpServletRequest request, AskDTO ask) throws SQLException
	{	
		HttpSession session = request.getSession();
		String sid_code = (String)session.getAttribute("sid_code");
		String result = null;
		
		if(sid_code=="" || sid_code==null)
		{
			result = "redirect:LoginForm.jsp";
		}
		else
		{
			IAskDAO dao = sqlSession.getMapper(IAskDAO.class);
		
			int ask_code = Integer.parseInt(request.getParameter("ask_code"));
			dao.modify(ask);
			
			result =  "redirect:askread.action?ask_code=" + ask_code;
		} 
		return result;
		
	}
	
	@RequestMapping(value="/askdelete.action", method=RequestMethod.GET)
	public String askDelete(HttpServletRequest request, AskDTO ask) throws SQLException
	{
		HttpSession session = request.getSession();
		String sid_code = (String)session.getAttribute("sid_code");
		String result = null;
		
		if(sid_code=="" || sid_code==null)
		{
			result = "redirect:LoginForm.jsp";
		}
		else
		{
			int ask_code = Integer.parseInt(request.getParameter("ask_code"));
			
			IAskDAO dao = sqlSession.getMapper(IAskDAO.class);
			
			dao.remove(ask_code);
			
			result = "redirect:asklist.action";
		} 
		return result;
	}
	
	
	
}

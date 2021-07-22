package com.haroot.mybatis;

import java.io.IOException;
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
public class BoardController
{

	@Autowired
	private SqlSession sqlSession;
	
	// 게시글 목록 조회	
	@RequestMapping(value="/boardlist.action", method=RequestMethod.GET)

	public String boardList(HttpServletRequest request, Model model) throws SQLException
	{

		HttpSession session = request.getSession();
		String sid_code = (String)session.getAttribute("sid_code");
		String nickname = (String)session.getAttribute("nickname");
		
		String result = null;
		
		if(sid_code=="" || sid_code==null)
		{
			result = "redirect:LoginForm.jsp";
		}
		else
		{
			// System.out.println(sid_code);
			//IMemberDAO mem = sqlSession.getMapper(IMemberDAO.class);
			//model.addAttribute("nickname", mem.searchNickName(sid_code));
			//session.setAttribute("sid_code", sid_code);
		
			IBoardDAO dao = sqlSession.getMapper(IBoardDAO.class);
			
			model.addAttribute("list", dao.list());
			
			result = "/BoardList.jsp";
		}
		return result;
	}
	
	// 게시글 등록 폼
	@RequestMapping(value="/boardinsertform.action", method=RequestMethod.GET)
	public String boardInsertForm(HttpServletRequest request, Model model) throws SQLException
	{
		HttpSession session = request.getSession();
		String sid_code = (String)session.getAttribute("sid_code");
		String nickname = (String)session.getAttribute("nickname");
		
		String result = null;
		
		if(sid_code=="" || sid_code==null)
		{
			result = "redirect:LoginForm.jsp";
		}
		else
		{
			IBoardDAO dao = sqlSession.getMapper(IBoardDAO.class);
			
			int nextNum = dao.getMaxNum() + 1;
			
			model.addAttribute("nextNum", nextNum);
			
			//System.out.println(nextNum);
			
			result =  "/BoardInsertForm.jsp";
		}
		
		return result;
	}
	
	// 게시글 등록
	@RequestMapping(value="/boardinsert.action", method=RequestMethod.POST)
	public String boardInsert(HttpServletRequest request, BoardDTO board, Model model) throws IOException, SQLException
	{
		HttpSession session = request.getSession();
		String sid_code = (String)session.getAttribute("sid_code");
		String nickname = (String)session.getAttribute("nickname");
		
		String result = null;
		
		if(sid_code=="" || sid_code==null)
		{
			result = "redirect:LoginForm.jsp";
		}
		else
		{
			IBoardDAO dao = sqlSession.getMapper(IBoardDAO.class);
			
			//int board_code = dao.getMaxNum() + 1;
			
			System.out.println(board.getBoard_cate_code());
			
	//		dto.setBoard_code(board_code);
			
			dao.add(board);
			
			result =  "redirect:boardlist.action";
		}
		
		return result;
	}
	
	// 게시글 조회
	@RequestMapping(value="/boardview.action", method=RequestMethod.GET)
	public String boardView(HttpServletRequest request, Model model, int board_code, String board_writer) throws SQLException
	{
		HttpSession session = request.getSession();
		String sid_code = (String)session.getAttribute("sid_code");
		String nickname = (String)session.getAttribute("nickname");
		
		String result = null;
		
		if(sid_code=="" || sid_code==null)
		{
			result = "redirect:LoginForm.jsp";
		}
		else
		{
			IBoardDAO dao = sqlSession.getMapper(IBoardDAO.class);
			
			model.addAttribute("view", dao.view(board_code, board_writer));
			
			result = "/WEB-INF/views/BoardRead.jsp";
			
		}
		return result;
	}
	
	// 게시글 수정 폼
	@RequestMapping(value="/boardupdateform.action", method=RequestMethod.GET)
	public String boardUpdateForm(HttpServletRequest request, ModelMap model, int board_code, String board_writer) throws SQLException
	{
		HttpSession session = request.getSession();
		String sid_code = (String)session.getAttribute("sid_code");
		String nickname = (String)session.getAttribute("nickname");
		
		String result = null;
		
		if(sid_code=="" || sid_code==null)
		{
			result = "redirect:LoginForm.jsp";
		}
		else
		{
			IBoardDAO dao = sqlSession.getMapper(IBoardDAO.class);
			
			model.addAttribute("board_code", board_code);
			model.addAttribute("board_writer", board_writer);
			model.addAttribute("view", dao.view(board_code, board_writer));
			  
			result = "BoardUpdateForm.jsp";
		}
		return result;
	}
	
	// 게시글 수정
	@RequestMapping(value="/boardupdate.action", method=RequestMethod.POST)
	public String boardUpdate(HttpServletRequest request, BoardDTO board, Model model) throws SQLException
	{	
		HttpSession session = request.getSession();
		String sid_code = (String)session.getAttribute("sid_code");
		String nickname = (String)session.getAttribute("nickname");
		
		String result = null;
		
		if(sid_code=="" || sid_code==null)
		{
			result = "redirect:LoginForm.jsp";
		}
		else
		{
			IBoardDAO dao = sqlSession.getMapper(IBoardDAO.class);
			
			int board_code = Integer.parseInt(request.getParameter("board_code"));
			String board_writer = request.getParameter("board_writer");
			
			dao.modify(board);
			
			result = "redirect:boardview.action?board_code=" + board_code + "&board_writer=" + board_writer;
		}
		return result;
	}
	
}

package com.haroot.mybatis;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

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
	
	
	@RequestMapping(value="/boardlist.action", method=RequestMethod.GET)
	public String boardList(Model model) throws SQLException
	{
		String result = null;
		
		IBoardDAO dao = sqlSession.getMapper(IBoardDAO.class);
		
		model.addAttribute("list", dao.list());
		
		result = "/WEB-INF/views/BoardList.jsp";
		
		return result;
	}
	
	
	@RequestMapping(value="/boardinsertform.action", method=RequestMethod.GET)
	public String boardInsertForm(HttpServletRequest request, ModelMap model) throws SQLException
	{
		IBoardDAO dao = sqlSession.getMapper(IBoardDAO.class);
		
		int nextNum = dao.getMaxNum() + 1;
		
		model.addAttribute("nextNum", nextNum);
		
		System.out.println(nextNum);
		
		return "/BoardInsertForm.jsp";
	}
	
	@RequestMapping(value="/boardinsert.action", method=RequestMethod.POST)
	public String boardInsert(HttpServletRequest request, BoardDTO board) throws IOException, SQLException
	{
		IBoardDAO dao = sqlSession.getMapper(IBoardDAO.class);
		
		//int board_code = dao.getMaxNum() + 1;
		
		System.out.println(board.getBoard_cate_code());
		
//		dto.setBoard_code(board_code);
		
		dao.add(board);
		
		return "redirect:boardlist.action";
	}
	
	@RequestMapping(value="/boardview.action", method=RequestMethod.GET)
	public String boardView(Model model, int board_code, String board_writer) throws SQLException
	{
		String result = null;
		
		IBoardDAO dao = sqlSession.getMapper(IBoardDAO.class);
		
		model.addAttribute("view", dao.view(board_code, board_writer));
		
		result = "/WEB-INF/views/BoardRead.jsp";
		
		return result;
	}
	
	// 게시글 수정 폼
	@RequestMapping(value="/boardupdateform.action", method=RequestMethod.GET)
	public String boardUpdateForm(ModelMap model, int board_code, String board_writer) throws SQLException
	{
		IBoardDAO dao = sqlSession.getMapper(IBoardDAO.class);
		
		model.addAttribute("board_code", board_code);
		model.addAttribute("board_writer", board_writer);
		model.addAttribute("view", dao.view(board_code, board_writer));
		  
		return "BoardUpdateForm.jsp";
	}
	
	// 게시글 수정
	@RequestMapping(value="/boardupdate.action", method=RequestMethod.POST)
	public String boardUpdate(HttpServletRequest request, BoardDTO board) throws SQLException
	{	
		IBoardDAO dao = sqlSession.getMapper(IBoardDAO.class);
		
		int board_code = Integer.parseInt(request.getParameter("board_code"));
		String board_writer = request.getParameter("board_writer");
		
		dao.modify(board);
		
		return "redirect:boardview.action?board_code=" + board_code + "&board_writer=" + board_writer;
	}
	
}

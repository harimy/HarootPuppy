package com.haroot.mybatis;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
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
	public String boardList(Model model, HttpServletRequest request)
	{

		HttpSession session = request.getSession();
		String sid_code = (String)session.getAttribute("sid_code");
		String result = null;
		
		if(sid_code=="" || sid_code==null)
		{
			result = "HarootMain.jsp";
		}
		else
		{
			// System.out.println(sid_code);
			IMemberDAO mem = sqlSession.getMapper(IMemberDAO.class);
			model.addAttribute("nickname", mem.searchNickName(sid_code));
			session.setAttribute("sid_code", sid_code);
		
			IBoardDAO dao = sqlSession.getMapper(IBoardDAO.class);
			
			model.addAttribute("list", dao.list());
			
			result = "/WEB-INF/views/BoardList.jsp";
		}
		return result;
	}
	
	
	@RequestMapping(value="/boardinsertform.action", method=RequestMethod.GET)
	public String boardInsertForm(HttpServletRequest request, ModelMap model) throws SQLException
	{
		IBoardDAO dao = sqlSession.getMapper(IBoardDAO.class);
		
		int nextNum = dao.getMaxNum() + 1;
		
		model.addAttribute("nextNum", nextNum);
		
		System.out.println(request.getParameter("board_code"));
		
		return "/BoardInsertForm.jsp";
	}
	
	@RequestMapping(value="/boardinsert.action", method=RequestMethod.POST)
	public String boardInsert(BoardDTO board) throws IOException
	{
		IBoardDAO dao = sqlSession.getMapper(IBoardDAO.class);
		BoardDTO dto = new BoardDTO();
		
		int board_code = dao.getMaxNum() + 1;
		dto.setBoard_code(board_code);
		
		dao.add(board);
		
		return "redirect:boardlist.action";
	}
	
	@RequestMapping(value="/boardview.action", method=RequestMethod.GET)
	public String boardView(Model model, int board_code, String board_writer)
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
		model.addAttribute("search", dao.getReadData(board_code, board_writer));
		  
		return "BoardUpdateForm.jsp";
	}
	
	// 게시글 수정
	@RequestMapping(value="/boardupdate.action", method=RequestMethod.POST)
	public String boardUpdate(HttpServletRequest request, BoardDTO board)
	{	
		IBoardDAO dao = sqlSession.getMapper(IBoardDAO.class);
		
		System.out.println("언놈이냐 : " + request.getParameter("board_code"));
		System.out.println("언놈이냐 작성 : " + request.getParameter("board_writer"));
		System.out.println("언놈이냐 카테코드 : " + request.getParameter("board_cate_code"));
		System.out.println("언놈이냐 제목 : " + request.getParameter("board_title"));
		System.out.println("언놈이냐 내용 : " + request.getParameter("board_content"));
		
		int board_code = Integer.parseInt(request.getParameter("board_code"));

		String board_writer = request.getParameter("board_writer");
		
		board.setBoard_writer(request.getParameter("board_writer"));
		board.setBoard_code(Integer.parseInt(request.getParameter("board_code")));
		
		dao.modify(board);
		
		return "redirect:boardview.action?board_code=" + board_code + "&board_writer=" + board_writer;
	}
	
}

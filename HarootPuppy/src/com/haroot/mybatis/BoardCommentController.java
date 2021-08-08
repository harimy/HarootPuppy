package com.haroot.mybatis;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class BoardCommentController
{
	@Autowired
	private SqlSession sqlSession;
	
	// 댓글 목록 조회	
	@RequestMapping(value="/boardcommview.action", method=RequestMethod.GET)
	public String boardCommList(HttpServletRequest request, Model model) throws SQLException
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
			IBoardCommentDAO dao = sqlSession.getMapper(IBoardCommentDAO.class);
			
			model.addAttribute("list", dao.listComm());
			
			result = "/BoardRead.jsp";
		}
		return result;
	}
	
	// 댓글 등록
	@RequestMapping(value="/boardcomminsert.action", method=RequestMethod.POST)
	public String boardCommInsert(HttpServletRequest request, int board_code, String board_comm_content) throws IOException, SQLException
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
			IBoardCommentDAO dao = sqlSession.getMapper(IBoardCommentDAO.class);
			BoardCommentDTO boardComm = new BoardCommentDTO();
			
			boardComm.setBoard_comm_writer(sid_code);
			boardComm.setBoard_code(board_code);
			boardComm.setBoard_comm_content(board_comm_content);
			
			dao.insertComment(boardComm);
			
			result =  "redirect:boardcommlist.action";
		}
		
		return result;
	}
	
}
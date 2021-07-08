/*===============================
   SampleController.java
   - 사용자 정의 컨트롤러 클래스
================================*/

package com.haroot.mybatis;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;



@Controller
public class BoardController
{

	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value="/boardlist.action", method=RequestMethod.GET)
	public String boardList(Model model)
	{
		String result = null;
		
		IBoardDAO dao = sqlSession.getMapper(IBoardDAO.class);
		
		//model.addAttribute("count", dao.count());
		model.addAttribute("list", dao.list());
		
		result = "/WEB-INF/views/BoardList.jsp";
		
		return result;
	}
	
	@RequestMapping(value="boardinsertform.action", method=RequestMethod.GET)
	public String boardInsertForm(Model model)
	{
		String result = null;
		
		IBoardDAO dao = sqlSession.getMapper(IBoardDAO.class);
		
		result = "/WEB-INF/views/BoardInsertForm.jsp";
		
		return result;
	}
	
	@RequestMapping(value="/boardinsert.action", method=RequestMethod.POST)
	public String boardInsert(BoardDTO board)
	{
		IBoardDAO dao = sqlSession.getMapper(IBoardDAO.class);
		
		dao.add(board);
		
		return "redirect:boardlist.action";
		
	}
	
	@RequestMapping(value="/boardview.action", method=RequestMethod.GET)
	public String boardView(Model model, int num, String nickname)
	{
		String result = null;
		
		IBoardDAO dao = sqlSession.getMapper(IBoardDAO.class);
		
		model.addAttribute("view", dao.view(num, nickname));
		
		result = "/WEB-INF/views/BoardRead.jsp";
		
		return result;
	}
	
	
}

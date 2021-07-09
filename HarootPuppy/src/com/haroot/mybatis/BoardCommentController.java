package com.haroot.mybatis;

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
	
	@RequestMapping(value="/boardcommview.action", method=RequestMethod.GET)
	public String commView(Model model, int num, String nickname)
	{
		String result = null;
		
		IBoardCommentDAO dao = sqlSession.getMapper(IBoardCommentDAO.class);
		
		model.addAttribute("commView", dao.commView(num, nickname));

		result = "/WEB-INF/views/BoardRead.jsp";
		
		return result;
	}
}

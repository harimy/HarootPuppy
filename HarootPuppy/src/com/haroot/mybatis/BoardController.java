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

import jdk.nashorn.internal.objects.annotations.Getter;


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
		
		result = "/WEB-INF/views/BoardInsertForm.jsp";
		
		return result;
	}
}

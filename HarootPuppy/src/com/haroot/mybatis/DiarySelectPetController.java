package com.haroot.mybatis;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class DiarySelectPetController 
{
	// SqlSession 을 활용하여 마이바티스 객체 의존성 (자동) 주입
	@Autowired
	private SqlSession sqlSession;

	
	// 반려견다이어리 → 반려견 선택
	@RequestMapping(value="selectpet.action", method = RequestMethod.GET)
	public String searchPets(HttpServletRequest req, HttpServletResponse response, ModelMap model) 
	{
		IPetDAO petDao = sqlSession.getMapper(IPetDAO.class);
		
		HttpSession session = req.getSession();
		String sid_code = (String)session.getAttribute("sid_code");
		
		// System.out.println(sid_code);
		
		if (sid_code==null)		//-- 로그인이 되어있지 않은 상황
			return "redirect:loginmem.action";
		
		session.setAttribute("sid_code", sid_code);
		model.addAttribute("petList", petDao.searchPets(sid_code));	
		return "/DiarySelectPet.jsp";
	}
	
	
}

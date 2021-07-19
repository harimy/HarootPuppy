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
public class DiaryMainController 
{
	// SqlSession 을 활용하여 마이바티스 객체 의존성 (자동) 주입
	@Autowired
	private SqlSession sqlSession;
	
	// 반려견 선택 → 반려견의 다이어리 
	@RequestMapping(value="diarymain.action", method = RequestMethod.GET)
	public String startDiary(HttpServletRequest req, HttpServletResponse response, ModelMap model) throws SQLException 
	{
		IPetDAO petDao = sqlSession.getMapper(IPetDAO.class);
		
		HttpSession session = req.getSession();
		String sid_code = (String)session.getAttribute("sid_code");
		
		session.setAttribute("sid_code", sid_code);
		model.addAttribute("sid_code", sid_code);
		
		String pet_code = req.getParameter("pet_code");
		session.setAttribute("pet_code", pet_code);
		model.addAttribute("pet_code", pet_code);
		
		model.addAttribute("list", petDao.petInfo(pet_code));

		//System.out.println(pet_code);
		
		return "/DiaryMain.jsp";
	}
	

}

package com.haroot.mybatis;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class DiaryMealController
{
	@Autowired
	private SqlSession sqlSession;
	
	// 식사 입력 후 다시 DiaryMain으로 가기
	@RequestMapping(value="addtodiary.action" , method=RequestMethod.GET)
	public String addMeal(HttpServletRequest req, ModelMap model)
	{
		IDiaryMealDAO mealDao = sqlSession.getMapper(IDiaryMealDAO.class);
		
		String pet_code = req.getParameter("pet_code");
		model.addAttribute("pet_code", pet_code);
		
		return "redirect:diarymain.action";
	}
	
}

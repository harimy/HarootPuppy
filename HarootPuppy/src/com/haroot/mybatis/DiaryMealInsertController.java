package com.haroot.mybatis;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class DiaryMealInsertController
{

	@Autowired
	private SqlSession sqlSession;
	
	
	@RequestMapping(value="diaryinsertmeal.action", method = RequestMethod.POST)
	public String insertmeal(DiaryMealDTO mealDto, HttpServletRequest req, HttpServletResponse response, ModelMap model) throws SQLException 
	{
		IDiaryMealDAO mealDao = sqlSession.getMapper(IDiaryMealDAO.class);
		IPetDAO petDao = sqlSession.getMapper(IPetDAO.class);
		
		HttpSession session = req.getSession();
		String sid_code = (String)session.getAttribute("sid_code");
		String pet_code = req.getParameter("pet_code");
		
		session.setAttribute("sid_code", sid_code);
		session.setAttribute("pet_code", pet_code);
	
		// System.out.println(mealDto.getCommon_start());
		
		mealDao.addMeal2(mealDto);
		
		return "redirect:diarymain.action";
	}
}

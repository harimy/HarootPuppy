package com.haroot.mybatis;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.RequestAttributes;

@Controller
public class PetController
{
	@Autowired
	private SqlSession sqlSession;

	// 반려견 선택화면 이동 메소드
	@RequestMapping(value="/diaryselectpet.action", method=RequestMethod.GET)
	public String PetDiary(HttpServletRequest req, ModelMap model) throws SQLException
	{
		IPetDAO petDao = sqlSession.getMapper(IPetDAO.class);
		
		String sid_code = req.getParameter("sid_code");
		model.addAttribute("petList", petDao.searchPets(sid_code));
		
		return "/DiarySelectPet.jsp";
	}
	
	// 사용자의 반려견 다이어리로 이동 메소드
	@RequestMapping(value="/diarymain.action", method=RequestMethod.GET)
	public String StartPetDiary(HttpServletRequest req, ModelMap model)
	{
		IPetDAO petDao = sqlSession.getMapper(IPetDAO.class);
		
		String pet_code = req.getParameter("pet_code");
		model.addAttribute("list", petDao.petInfo(pet_code));
		
		return "/DiaryMain.jsp";
	}
	
	@RequestMapping(value="/diaryinfo.action", method=RequestMethod.GET)
	public String petInfo(HttpServletRequest req, ModelMap model)
	{
		IPetDAO petDao = sqlSession.getMapper(IPetDAO.class);
		
		String pet_code = req.getParameter("pet_code");
		model.addAttribute("list", petDao.petInfo2(pet_code));
		return "/DiaryInfo.jsp";
	}



}

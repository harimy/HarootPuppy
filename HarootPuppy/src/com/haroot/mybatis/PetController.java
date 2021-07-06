package com.haroot.mybatis;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class PetController
{
	@Autowired
	private SqlSession sqlSession;

	// 반려견 다이어리 이동 메소드
	@RequestMapping(value="/diaryselectpet.action", method=RequestMethod.GET)
	public String PetDiary(String sid_code, ModelMap model) throws SQLException
	{
		IPetDAO relationDao = sqlSession.getMapper(IPetDAO.class);
		
		sid_code = "sid001";
		model.addAttribute("petList", relationDao.searchPets(sid_code));
		
		return "/DiarySelectPet.jsp";
	}
	



}

package com.haroot.mybatis;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class DiaryPetSelectController
{
	@Autowired
	private SqlSession sqlSession;
	
	// gotoDiary 메소드 : 해당 반려견의 다이어리로 이동
	@RequestMapping(value="gotodiary.action", method=RequestMethod.POST)
	public ModelAndView petSelect()
	{
		
	}
	
	// petadd 메소드 : 반려견 추가
	@RequestMapping(value="")
	public String petAdd(ModelMap model)
	{
		return "";
	}
	
	
}

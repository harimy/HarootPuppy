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
		
		//---------- 세션처리 ---------------------------------------
		HttpSession session = req.getSession();
		// session.removeAttribute("pet_code");	// 펫 선택 페이지 로드시 펫 코드 초기화
		
		String sid_code = (String)session.getAttribute("sid_code");
		String nickname = (String)session.getAttribute("nickname");     
		// System.out.println(sid_code);
		
		String pet_code = (String)session.getAttribute("pet_code");
		session.setAttribute("pet_code", pet_code);
		// System.out.println("펫코드" + pet_code);
		
		//---------- 로그인이 되어있지 않으면 로그인창으로 -----------
		if (sid_code==null)		
			return "redirect:loginmem.action";
		
		
		//-------- petList 데이터 보내주기 ----------------------------
		model.addAttribute("petList", petDao.searchPets(sid_code));	
		return "/DiarySelectPet.jsp";
	}
	
	
}

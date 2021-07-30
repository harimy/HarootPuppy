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
		IMemberDAO mem = sqlSession.getMapper(IMemberDAO.class);
		PetDTO petDto = new PetDTO();
		
		//-- sid 세션에서 받아오고 다시 설정하기
		HttpSession session = req.getSession();
		String sid_code = (String)session.getAttribute("sid_code");
		
		session.setAttribute("sid_code", sid_code);
		model.addAttribute("sid_code", sid_code);
		
		//-- nickname 세션에서 받아오고 다시 설정하기
		model.addAttribute("nickname", mem.searchNickName(sid_code));
		
		//-- pet_code 세션에서 받아오고 다시 설정하기 
		String pet_code = req.getParameter("pet_code");
		session.setAttribute("pet_code", pet_code);
		
		//-- 출력 확인
		// System.out.println("세션" + pet_code);
		// System.out.println("파라미터" + req.getParameter("pet_code"));
		
		//-- 데이터 보내기
		model.addAttribute("pet_code", pet_code);
		model.addAttribute("list", petDao.petInfo(pet_code));
		
		//-- relation_code 세션에서 받아오고 다시 설정
		String relation_code = petDao.relationCode(pet_code, sid_code);
		session.setAttribute("relation_code", relation_code);
		model.addAttribute("relation_code", relation_code);
		
		//-- 출력확인
		// System.out.println(relation_code);
		
		return "/DiaryMain.jsp";
	}
	

}

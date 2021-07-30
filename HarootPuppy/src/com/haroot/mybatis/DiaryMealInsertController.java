package com.haroot.mybatis;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
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
		IDiaryDailyDAO dailyDao = sqlSession.getMapper(IDiaryDailyDAO.class);
		IDiaryCommonDAO commonDao = sqlSession.getMapper(IDiaryCommonDAO.class);
		
		DiaryDailyDTO dailyDTO = new DiaryDailyDTO();
		DiaryCommonDTO commonDTO = new DiaryCommonDTO();
		
		//-- 세션 관련
		HttpSession session = req.getSession();
		String sid_code = (String)session.getAttribute("sid_code");
		String pet_code = (String)session.getAttribute("pet_code");
		String relation_code = (String)session.getAttribute("relation_code");
		
		session.setAttribute("sid_code", sid_code);
		session.setAttribute("pet_code", pet_code);
		session.setAttribute("relation_code", relation_code);
		
		model.addAttribute("sid_code", sid_code);
		model.addAttribute("pet_code", pet_code);
		model.addAttribute("relation_code", relation_code);
		
		// System.out.println("양육관계코드" + relation_code);
		//-- 잘 출력된다
		
		
		// TBL_DAILY 데이터 입력 -------------------------------------------------
		// 1. DAILY_CODE 에 MAX 값 입력
		String daily_code = "DAILY" + (dailyDao.max()+1);
		dailyDTO.setDaily_code(daily_code);
		
		// 2. DAILY_DATE 에 현재날짜 00:00:00 입력
		SimpleDateFormat format1 = new SimpleDateFormat("yy/MM/dd");		
		String time2 = format1.format(Calendar.getInstance().getTime());
		String daily_date = time2;
		
		// SYSDATE 에 00:00:00 으로 넣기
		// System.out.println(time2);
		
		// 3. 관계코드 + SYSDATE 가 있는 데이터라면 입력 X
		int count = dailyDao.count(relation_code, daily_date);
		
		if (count <= 0)
		{
			dailyDao.addDaily(relation_code, daily_code, daily_date);
		}
		else
			return "redirect:diarymain.action";
		
		//-------------------------------------------------------------------
		
		
		// TBL_COMMON 입력---------------------------------------------------
		// 1. COMMON_CODE 생성 (MAX)
		String common_code = "COM" + (commonDao.max()+1);
		commonDTO.setCommon_code(common_code);
		
		// 2. COMMON_START , END , MEMO , PHOTO 값 받아오기
		String common_start = req.getParameter("common_start");
		String common_end = req.getParameter("common_end");
		String memo = req.getParameter("common_memo");
		String photo = req.getParameter("common_photo");
		
		// 3. DAILY_CODE 받아오기
		
		//-------------------------------------------------------------------
		
		
		
		
		// System.out.println(mealDto.getCommon_start());
		// mealDao.addMeal2(mealDto);
		
		return "redirect:diarymain.action";
	}
	
}

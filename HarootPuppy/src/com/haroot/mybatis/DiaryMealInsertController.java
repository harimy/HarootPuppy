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
		String daily_code="";
		
		// 2. DAILY_DATE 에 현재날짜 00:00:00 입력
		SimpleDateFormat format1 = new SimpleDateFormat("yy/MM/dd");		
		String time2 = format1.format(Calendar.getInstance().getTime());
		String daily_date = time2;
		
		// System.out.println(daily_date); // 21/08/07
		
		// SYSDATE 에 00:00:00 으로 넣기
		// System.out.println(time2);
		
		// 3. 관계코드 + SYSDATE 가 있는 데이터라면 입력 X
		int count = dailyDao.count(relation_code, daily_date);
		
		if (count <= 0)
		{
			// DAILY_CODE 에 MAX 값 입력
			daily_code = "DAILY" + (dailyDao.max()+1);
			dailyDTO.setDaily_code(daily_code);
			
			dailyDao.addDaily(relation_code, daily_code, daily_date);
		}
		
		//-------------------------------------------------------------------
		
		
		// TBL_COMMON 입력---------------------------------------------------
		// 1. COMMON_CODE 생성 (MAX)
		String common_code = "COM" + (commonDao.max()+1);
		commonDTO.setCommon_code(common_code);
		
		// 2. COMMON_START , END , MEMO , PHOTO 값 받아오기
		String common_start = daily_date + " " + req.getParameter("common_start") + ":00";
		String common_end = daily_date + " " + req.getParameter("common_end") + ":00";
		String common_memo = req.getParameter("common_memo");
		String common_photo = req.getParameter("common_photo");
		
		System.out.println(common_start); // 20:19 → 21/08/07 21:11:00
		System.out.println(common_end);
		
		
		// 3. DAILY_CODE 받아오기
		if(count <= 0)
		{
			// daily_code 가 여기서 생성되었으면 바로 common 추가
			commonDao.addCommon(common_code, common_start, common_end, common_memo, common_photo, daily_code);
		}
		else
		{
			// daily_code 이미 존재 시 찾아서 common 추가
			daily_code = dailyDao.search_dailycode(relation_code, daily_date);
			commonDao.addCommon(common_code, common_start, common_end, common_memo, common_photo, daily_code);
		}
		
		
		
		//-------------------------------------------------------------------
		
		
		
		
		// System.out.println(mealDto.getCommon_start());
		// mealDao.addMeal2(mealDto);
		
		return "redirect:diarymain.action";
	}
	
}

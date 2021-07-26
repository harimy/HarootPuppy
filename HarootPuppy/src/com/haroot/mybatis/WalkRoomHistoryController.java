package com.haroot.mybatis;

import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.request.RequestAttributes;

@Controller
public class WalkRoomHistoryController
{
	// mybatis 객체 의존성 (자동) 주입
	@Autowired
	private SqlSession sqlSession;
	
	// 신청 완료인 산책방 리스트
	@RequestMapping(value = "/walkroomapply.action", method = RequestMethod.GET)
	public String walkroomApply(HttpServletRequest request, ModelMap model) throws SQLException
	{
		String result = "";
		HttpSession session = request.getSession();
		String sid_code = (String)session.getAttribute("sid_code");
		String nickname = (String)session.getAttribute("nickname");
		
		if(sid_code == null)
		{
			result = "redirect:loginMem.action";
		}
		else
		{
			IWalkRoomHistoryDAO dao = sqlSession.getMapper(IWalkRoomHistoryDAO.class);
			ArrayList<WalkRoomViewDTO> applyList = dao.applyList(sid_code);
			
			model.addAttribute("applyList", applyList);
			result = "WalkApplyDone.jsp";
		}
		
		return result;
	}
	
	// 산책 예정인 산책방 리스트
	@RequestMapping(value = "/walkroomscheduled.action", method = RequestMethod.GET)
	public String walkroomScheduled(HttpServletRequest request, ModelMap model) throws SQLException
	{
		String result = "";
		HttpSession session = request.getSession();
		String sid_code = (String)session.getAttribute("sid_code");
		String nickname = (String)session.getAttribute("nickname");
		//System.out.println("walkroomscheduled sid_code : " + sid_code);
		
		if(sid_code == null)
		{
			result = "redirect:loginMem.action";
		}
		else
		{
			IWalkRoomHistoryDAO dao = sqlSession.getMapper(IWalkRoomHistoryDAO.class);
			ArrayList<WalkRoomViewDTO> scheduledList = dao.scheduledList(sid_code);
			
			model.addAttribute("scheduledList", scheduledList);
			result = "WalkScheduled.jsp";
		}
		
		return result;
	}
	
	// 산책 완료인 산책방 리스트
	@RequestMapping(value = "/walkroomfinished.action", method = RequestMethod.GET)
	public String walkroomFinished(HttpServletRequest request, ModelMap model) throws SQLException
	{
		String result = "";
		HttpSession session = request.getSession();
		String sid_code = (String)session.getAttribute("sid_code");
		String nickname = (String)session.getAttribute("nickname");
		System.out.println("walkroomfinished sid_code : " + sid_code);
		
		if(sid_code == null)
		{
			result = "redirect:loginMem.action";
		}
		else
		{
			IWalkRoomHistoryDAO dao = sqlSession.getMapper(IWalkRoomHistoryDAO.class);
			ArrayList<WalkRoomViewDTO> finishedList = dao.finishedList(sid_code);
			
			model.addAttribute("finishedList", finishedList);
			result = "WalkFinished.jsp";
		}
		
		return result;
	}
	
}

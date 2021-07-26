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
public class WalkRoomMatchController
{
	// mybatis 객체 의존성 (자동) 주입
	@Autowired
	private SqlSession sqlSession;
	
	// 방장이 매칭버튼 클릭 시
	@RequestMapping(value = "/walkroommatch.action", method = RequestMethod.GET)
	public String walkroomMatch(HttpServletRequest request, ModelMap model) throws SQLException
	{
		String result = "";
		HttpSession session = request.getSession();
		String sid_code = (String)session.getAttribute("sid_code");
		String pet_code = (String)session.getAttribute("pet_code");
		String nickname = (String)session.getAttribute("nickname");
		
		if(sid_code == null)
		{
			result = "redirect:loginMem.action";
		}
		else if(pet_code == null)
		{
			result = "/walkroomselect.action";
		}
		else
		{
			IMatchDAO dao = sqlSession.getMapper(IMatchDAO.class);
			int walkroom_code = Integer.parseInt(request.getParameter("num"));
			String message = "";
			
			// 1. 최소인원보다 현재 인원이 많은 지 체크
			if (dao.currentMem(walkroom_code) >= dao.minMem(walkroom_code))	// 최소인원 조건 만족
			{
				// 2. 참여자들 레디상태 체크
				if (dao.readyStateCheck(walkroom_code) == 0)	// 레디 조건 만족
				{
					// DTO 구성
					MatchDTO dto = new MatchDTO();
					dto.setMatch_code("MAT" + (dao.max() + 1));
					dto.setWalkroom_code(walkroom_code);
					dao.add(dto);
					
					message = "Matched";
					model.addAttribute("message", message);
					model.addAttribute("matchState", dao.matchStateCheck(walkroom_code));
					
					result = "redirect:walkroommaster.action";
				}
				else
				{
					message = "readyStateError";
					model.addAttribute("message", message);
					model.addAttribute("matchState", dao.matchStateCheck(walkroom_code));
					
					result = "redirect:walkroommaster.action";
				}
			}
			else
			{
				message = "minMemError";
				model.addAttribute("message", message);
				model.addAttribute("matchState", dao.matchStateCheck(walkroom_code));
				
				result = "redirect:walkroommaster.action";
			}	
		
		}
		
		return result;
	}
	
	// 방장이 매칭 취소 버튼 클릭 시
	@RequestMapping(value = "/walkroommatchcancel.action", method = RequestMethod.GET)
	public String walkroomMatchCancel(HttpServletRequest request, ModelMap model) throws SQLException
	{
		String result = "";
		HttpSession session = request.getSession();
		String sid_code = (String)session.getAttribute("sid_code");
		String pet_code = (String)session.getAttribute("pet_code");
		//int walkroom_code = (int)session.getAttribute("walkroom_code");
		String nickname = (String)session.getAttribute("nickname");
		
		if(sid_code == null)
		{
			result = "redirect:loginMem.action";
		}
		else if(pet_code == null)
		{
			result = "/walkroomselect.action";
		}
		else
		{
			IMatchDAO dao = sqlSession.getMapper(IMatchDAO.class);
			int walkroom_code = Integer.parseInt(request.getParameter("num"));
			
			dao.remove(walkroom_code);
		
			String message = "MatchCancel";
			model.addAttribute("message", message);
			model.addAttribute("matchState", dao.matchStateCheck(walkroom_code));
			result = "redirect:walkroommaster.action";
		}
		
		return result;
	}

	
}

package com.haroot.mybatis;

import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class WalkRoomViewController
{
	// mybatis 객체 의존성 (자동) 주입
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value="/walkroomenter.action", method=RequestMethod.GET)
	public String walkRoomOptionEnter(HttpServletRequest request, ModelMap model) throws SQLException
	{
		String result = null;
		
		// 세션
		HttpSession session = request.getSession();
		String sid_code = (String)session.getAttribute("sid_code");
		System.out.println("로그인 한 회원(세션) : " + sid_code);
		
		// 방 번호
		int walkroom_code = Integer.parseInt(request.getParameter("num"));
		//System.out.println(walkroom_code);
		
		// 방 번호로 방 정보 및 참여자 정보 조회하기
		IWalkRoomViewDAO dao = sqlSession.getMapper(IWalkRoomViewDAO.class);
		ArrayList<WalkRoomViewDTO> rooms = dao.list(walkroom_code);
		WalkRoomViewDTO room = rooms.get(0);
	    String walkroom_leader = rooms.get(0).getWalkroom_leader();
		//System.out.println(rooms.get(0).getWalkroom_leader());

	    
		if(sid_code == null) // 로그인 안한 상황
		{
			result = "redirect:loginMem.action";
		}
		else if(sid_code.equals(walkroom_leader))	// 방장으로 입장 시 
		{
			//System.out.println("같음");
			model.addAttribute("room", room);		// 방 정보 출력용 하나짜리 DTO
			model.addAttribute("rooms", rooms);
			model.addAttribute("walkroom_code", walkroom_code);
			result = "WalkRoomMasterEnter.jsp";
		}
		else	// 일반 사용자로 입장 시
		{
			//System.out.println("다름");
			model.addAttribute("room", room);
			model.addAttribute("rooms", rooms);
			model.addAttribute("walkroom_code", walkroom_code);
			result = "WalkRoomGuestFixOption.jsp";
		}
		
		return result;
	}
	
	
	// 일반 사용자가 FixOption 선택 후 요청하는 페이지
	@RequestMapping(value = "/walkroomguest.action", method = RequestMethod.GET)
	public String walkRoomView(HttpServletRequest request, ModelMap model) throws SQLException
	{
		// 이동할 페이지를 담을 문자열 변수
		String result = null;
		
		// 세션으로 로그인한 사용자의 sid_code 받아오기
		HttpSession session = request.getSession();
		String sid_code = (String)session.getAttribute("sid_code");
		
		// 방 번호 받아오기
		//System.out.println(request.getParameter("walkroom_code"));
		int walkroom_code = Integer.parseInt(request.getParameter("walkroom_code"));
		//System.out.println("방 번호 : " + walkroom_code);
		
		// 방 번호로 방 정보 및 참여자 정보 조회하기
		IWalkRoomViewDAO dao = sqlSession.getMapper(IWalkRoomViewDAO.class);
		ArrayList<WalkRoomViewDTO> rooms = dao.list(walkroom_code);
		WalkRoomViewDTO room = rooms.get(0);
	    
		
	    if(sid_code == null)	// 로그인 안했을 경우
	    {
	    	result = "redirect:loginMem.action";
	    }
	    else if(room == null) 	// 그 번호로 조회된 방이 없는 경우 산책메이트 메인으로 넘김
	    {
	    	result = "redirect:walkroommain.action";
	    }   
	    else 
	    {
	    	model.addAttribute("room", room);
	    	model.addAttribute("rooms", rooms);	 	// 참여자 정보 출력용 ArrayList<DTO>
	    	result = "WalkRoomGuestEnter.jsp";
	    }
	    
	    return result;
	}
	
	
	// 방장용 산책방에서 방 정보 변경 클릭 시
	@RequestMapping(value = "/walkroomupdateform.action", method = RequestMethod.GET)
	public String walkRoomUpdateForm(HttpServletRequest request, ModelMap model) throws SQLException
	{
		String result = "";
		HttpSession session = request.getSession();
		String sid_code = (String)session.getAttribute("sid_code");
		String pet_code = (String)session.getAttribute("pet_code");
		
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
			IWalkRoomViewDAO dao = sqlSession.getMapper(IWalkRoomViewDAO.class);
			WalkRoomViewDTO dto;
			
			// 수정할 방 코드 받아오기
			//System.out.println("변환 전 : " + request.getParameter("num"));
			int walkroom_code = Integer.parseInt(request.getParameter("num"));
			//System.out.println("변환 후 : " + walkroom_code);

			dto = dao.list(walkroom_code).get(0);
			
			model.addAttribute("walkroom", dto);
			
			result = "/WalkRoomInsertForm.jsp";
		}

		return result;
	}
	
	// 산책방 정보 수정 페이지에서 수정 버튼 클릭 시
	@RequestMapping(value = "/walkroomupdate.action", method = RequestMethod.POST)
	public String walkRoomUpdate(HttpServletRequest request, WalkRoomDTO dto) throws SQLException
	{
		String result = "";
		HttpSession session = request.getSession();
		String sid_code = (String)session.getAttribute("sid_code");
		String pet_code = (String)session.getAttribute("pet_code");
		
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
			IWalkRoomDAO dao = sqlSession.getMapper(IWalkRoomDAO.class);
			dao.modify(dto);
			int walkroom_code = Integer.parseInt(request.getParameter("num"));
			result = "redirect:walkroomenter.action?num=" + walkroom_code;
		}

		return result;
	}
	
	// 산책방 삭제 버튼 클릭 시
	@RequestMapping(value = "/walkroomdelete.action", method = RequestMethod.GET)
	public String walkroomDelete(HttpServletRequest request) throws SQLException
	{
		String result = "";
		HttpSession session = request.getSession();
		String sid_code = (String)session.getAttribute("sid_code");
		String pet_code = (String)session.getAttribute("pet_code");
		
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
			IWalkRoomDAO dao = sqlSession.getMapper(IWalkRoomDAO.class);
			int walkroom_code = Integer.parseInt(request.getParameter("num"));
			dao.remove(walkroom_code);
			result="redirect:walkroommain.action";
		}

		return result;
	}

	
}

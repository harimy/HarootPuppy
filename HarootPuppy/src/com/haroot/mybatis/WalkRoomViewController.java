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
		System.out.println(sid_code);
		
		// 방 번호
		int walkroom_code = Integer.parseInt(request.getParameter("num"));
		//System.out.println(walkroom_code);
		
		// 방 번호로 방 정보 및 참여자 정보 조회하기
		IWalkRoomViewDAO dao = sqlSession.getMapper(IWalkRoomViewDAO.class);
		ArrayList<WalkRoomViewDTO> rooms = dao.list(walkroom_code);
	    model.addAttribute("rooms", rooms);
	    String walkroom_leader = rooms.get(0).getWalkroom_leader();
		System.out.println(rooms.get(0).getWalkroom_leader());
	    
		if(sid_code == null) // 로그인 안한 상황
		{
			result = "redirect:loginMem.action";
		}
		else if(sid_code.equals(walkroom_leader))
		{
			//System.out.println("같음");
			model.addAttribute("rooms", rooms);
			model.addAttribute("walkroom_code", walkroom_code);
			result = "WalkRoomMasterEnter.jsp";
		}
		else
		{
			//System.out.println("다름");
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
		System.out.println(request.getParameter("walkroom_code"));
		int walkroom_code = Integer.parseInt(request.getParameter("walkroom_code"));
		System.out.println("방 번호 : " + walkroom_code);
		
		// 방 번호로 방 정보 및 참여자 정보 조회하기
		IWalkRoomViewDAO dao = sqlSession.getMapper(IWalkRoomViewDAO.class);
		ArrayList<WalkRoomViewDTO> rooms = dao.list(walkroom_code);
		WalkRoomViewDTO r = rooms.get(0);
	    
	    
	    // rooms 가 null 이면 그 번호로 조회된 방이 없으므로 산책메이트 메인으로 넘김
	    if(sid_code == null)
	    {
	    	result = "redirect:loginMem.action";
	    }
	    else if(rooms == null)
	    {
	    	result = "redirect:walkroommain.action";
	    }
	    else 
	    {
	    	model.addAttribute("r",r);				// 방 정보 출력용 하나짜리 DTO
	    	model.addAttribute("rooms", rooms);	 	// 참여자 정보 출력용 ArrayList<DTO>
	    	result = "WalkRoomGuestEnter.jsp";
	    }
	    
	    /*
	    if dto==null
	    	그런 방 없음-> walkroomlist.action
	    else if (방장일 때)
	    	방장용 입장 jsp
	    else if (방장 아닐 때)
	    	게스트용 입장 jsp
	   	*/
	      
	    return result;
	}

	
}

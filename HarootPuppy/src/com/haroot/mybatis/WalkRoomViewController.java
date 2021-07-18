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
import org.springframework.web.context.request.RequestAttributes;

@Controller
public class WalkRoomViewController
{
	// mybatis 객체 의존성 (자동) 주입
	@Autowired
	private SqlSession sqlSession;
	
	// 방 선택 후 입장하기 전 조건들 체크하여 분기처리
	@RequestMapping(value="/walkroomentercheck.action", method=RequestMethod.GET)
	public String walkRoomEnterCheck(HttpServletRequest request, ModelMap model) throws SQLException
	{
		String result = null;
		
		// 세션
		HttpSession session = request.getSession();
		String sid_code = (String)session.getAttribute("sid_code");
		String pet_code = (String)session.getAttribute("pet_code");
	    
		if(sid_code == null) // 로그인 안한 상황
		{
			result = "redirect:loginMem.action";
		}
		else if(pet_code == null) 	// 펫 선택 안한 상황
		{
			result = "redirect:walkroomselect.action";
		}
		else
		{
			IRelationDAO relation_dao = sqlSession.getMapper(IRelationDAO.class);
			RelationDTO relation_dto = relation_dao.list(sid_code, pet_code);
			String relation_code = relation_dto.getRelation_code();
			
			// 선택한 산책방에 로그인한 유저가 참여중인지 확인
			int walkroom_code = Integer.parseInt(request.getParameter("num"));
			IWalkRoomEnterCheckViewDAO check_dao = sqlSession.getMapper(IWalkRoomEnterCheckViewDAO.class);
			if (check_dao.search_room_sid(walkroom_code, sid_code) == 0)
			{
				// 산책방에 참여중이지 않은 경우
				// TBL_PARTICIPANTS 에 INSERT 하면서 산책방 입장
				IParticipantsDAO part_dao = sqlSession.getMapper(IParticipantsDAO.class);
				ParticipantsDTO part_dto = new ParticipantsDTO();
				String participants_code = "PAR" + (part_dao.max()+1);
				
				part_dto.setParticipants_code(participants_code);
				part_dto.setWalkroom_code(walkroom_code);
				part_dto.setRelation_code(relation_code);
				part_dto.setReadyoption_code("0");	// 입장시 레디고정옵션 기본값 : 고정안함
				part_dto.setReadystate_code("0");	// 입장시 레디상태 기본값 : 레디안함
				
				part_dao.addGuest(part_dto);
				
				// 방 번호 세션으로 넘기면서 페이지 이동
				session.setAttribute("walkroom_code", walkroom_code);	
				result = "WalkRoomGuestFixOption.jsp";	// 방장은 이 분기에 절대 걸리지 않으므로 이렇게 처리
			}
			else // 산책방 참여중인 경우
			{
				if(check_dao.search_room_sid_rel(walkroom_code, sid_code, relation_code) == 0)
				{
					// 해당 유저가 다른 반려견으로 참여중인 경우
					// 메소드 하나 더 만들어서 반려견 바꿔서 참여할건지 묻도록 코드 추가 필요
				}
				else if(check_dao.search_room_sid_rel(walkroom_code, sid_code, relation_code) == 1)
				{
					// 해당 유저가 해당 반려견으로 참여중인 경우
					// 바로 방 입장 할 수 있음
					session.setAttribute("walkroom_code", walkroom_code);
					result = "walkroomenter.action";
				}
				
			}
	
		}
		
		return result;
	}
	
	// 레디 고정 옵션 팝업창에서 호출 (팝업창은 닫히기 때문에 return 값 필요 없음)
	@RequestMapping(value="/readyoptionupdate.action", method=RequestMethod.GET)
	public String readyOptionUpdate(HttpServletRequest request) throws SQLException
	{
		String result = "";
		HttpSession session = request.getSession();
		String sid_code = (String)session.getAttribute("sid_code");
		String pet_code = (String)session.getAttribute("pet_code");
		int walkroom_code = (int)session.getAttribute("walkroom_code");
		
		if(sid_code == null) // 로그인 안한 상황
		{
			result = "redirect:loginMem.action";
		}
		else if(pet_code == null) 	// 펫 선택 안한 상황
		{
			result = "redirect:walkroomselect.action";
		}
		else
		{
			// 해당 방 해당 유저의 ReadyOption Update (TBL_PARTICIPANTS)
			String readyoption_code = request.getParameter("readyoption");
			//System.out.println("readyoptionupdate readyoption_code : " + readyoption_code);
			
			// 양육관계 코드 얻어냄
			IRelationDAO relation_dao = sqlSession.getMapper(IRelationDAO.class);
			RelationDTO relation_dto = relation_dao.list(sid_code, pet_code);
			String relation_code = relation_dto.getRelation_code();
			
			// 산책방 번호와 양육관계 코드로 참여자 코드 얻어냄
			IParticipantsDAO part_dao = sqlSession.getMapper(IParticipantsDAO.class);
			ParticipantsDTO part_dto = part_dao.search(walkroom_code, relation_code);
			String participants_code = part_dto.getParticipants_code();
			
			// 참여자 코드로 레디고정옵션 값 업데이트
			part_dao.modifyReadyOption(readyoption_code, participants_code);
			
			result = "redirect:walkroomguest.action";
		}
		
		return result;
	}
	
	// 산책방 입장 (주로 방장 입장용)
	@RequestMapping(value="/walkroomenter.action", method=RequestMethod.GET)
	public String walkRoomOptionEnter(HttpServletRequest request, ModelMap model) throws SQLException
	{
		String result = null;
		
		// 세션
		HttpSession session = request.getSession();
		String sid_code = (String)session.getAttribute("sid_code");
		//System.out.println("로그인 한 회원(세션) : " + sid_code);
		
		// 방 번호
		int walkroom_code = (int)session.getAttribute("walkroom_code");
		//System.out.println("waklroomenter walkroom_code ; " + walkroom_code);
		
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
			//model.addAttribute("room", room);
			//model.addAttribute("rooms", rooms);
			model.addAttribute("walkroom_code", walkroom_code);
			result = "WalkRoomGuestFixOption.jsp";
		}
		
		return result;
	}
	
	// 방장 입장시 요청하는 페이지
	@RequestMapping(value = "/walkroommaster.action", method = RequestMethod.GET)
	public String walkRoomMasterView(HttpServletRequest request, ModelMap model) throws SQLException
	{
		// 이동할 페이지를 담을 문자열 변수
		String result = null;
		
		// 세션으로 로그인한 사용자의 sid_code, walkroom_code 받아오기
		HttpSession session = request.getSession();
		String sid_code = (String)session.getAttribute("sid_code");
		String pet_code = (String)session.getAttribute("pet_code");
		int walkroom_code = (int)session.getAttribute("walkroom_code");
		
	    if(sid_code == null)	// 로그인 안했을 경우
	    {
	    	result = "redirect:loginMem.action";
	    }
	    else if(pet_code == null) 	// 펫 선택 안한 경우
	    {
	    	result = "redirect:walkroomselect.action";
	    }    
	    else 
	    {
	    	// 양육관계 코드 얻어냄
			IRelationDAO relation_dao = sqlSession.getMapper(IRelationDAO.class);
			RelationDTO relation_dto = relation_dao.list(sid_code, pet_code);
			String relation_code = relation_dto.getRelation_code();
			
			// 산책방 번호와 양육관계 코드로 참여자 코드 얻어냄
			IParticipantsDAO part_dao = sqlSession.getMapper(IParticipantsDAO.class);
			ParticipantsDTO part_dto = part_dao.search(walkroom_code, relation_code);
			String participants_code = part_dto.getParticipants_code();
			
	    	// 방 번호로 방 정보 및 참여자 정보 조회하기
			IWalkRoomViewDAO dao = sqlSession.getMapper(IWalkRoomViewDAO.class);
			ArrayList<WalkRoomViewDTO> rooms = dao.list(walkroom_code);
			WalkRoomViewDTO room = dao.search(walkroom_code, participants_code);
			
	    	model.addAttribute("room", room);
	    	model.addAttribute("rooms", rooms);	 	// 참여자 정보 출력용 ArrayList<DTO>
	    	result = "WalkRoomMasterEnter.jsp";
	    }
	    
	    return result;
	}
	
	// 일반 사용자가 FixOption 선택 후 요청하는 페이지
	@RequestMapping(value = "/walkroomguest.action", method = RequestMethod.GET)
	public String walkRoomGuestView(HttpServletRequest request, ModelMap model) throws SQLException
	{
		// 이동할 페이지를 담을 문자열 변수
		String result = null;
		
		// 세션으로 로그인한 사용자의 sid_code 받아오기
		HttpSession session = request.getSession();
		String sid_code = (String)session.getAttribute("sid_code");
		String pet_code = (String)session.getAttribute("pet_code");
		int walkroom_code = (int)session.getAttribute("walkroom_code");
		//System.out.println("walkroomguest walkroom_code : " + walkroom_code);
		
	    if(sid_code == null)	// 로그인 안했을 경우
	    {
	    	result = "redirect:loginMem.action";
	    }
	    else if(pet_code == null) 	// 펫 선택 안한 경우
	    {
	    	result = "redirect:walkroomselect.action";
	    }   
	    else 
	    {
	    	// 양육관계 코드 얻어냄
			IRelationDAO relation_dao = sqlSession.getMapper(IRelationDAO.class);
			RelationDTO relation_dto = relation_dao.list(sid_code, pet_code);
			String relation_code = relation_dto.getRelation_code();
			
			// 산책방 번호와 양육관계 코드로 참여자 코드 얻어냄
			IParticipantsDAO part_dao = sqlSession.getMapper(IParticipantsDAO.class);
			ParticipantsDTO part_dto = part_dao.search(walkroom_code, relation_code);
			String participants_code = part_dto.getParticipants_code();
	    	
			// 방 번호로 방 정보 및 참여자 정보 조회하기
			IWalkRoomViewDAO dao = sqlSession.getMapper(IWalkRoomViewDAO.class);
			ArrayList<WalkRoomViewDTO> rooms = dao.list(walkroom_code);
			WalkRoomViewDTO room = dao.search(walkroom_code, participants_code);
			
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
	
	// 방장 아닌 참여자 방 나가기 버튼 클릭 시
	@RequestMapping(value = "/walkroomexit.action", method = RequestMethod.GET)
	public String walkroomExit(HttpServletRequest request) throws SQLException
	{
		String result = "";
		HttpSession session = request.getSession();
		String sid_code = (String)session.getAttribute("sid_code");
		String pet_code = (String)session.getAttribute("pet_code");
		int walkroom_code = (int)session.getAttribute("walkroom_code");
		
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
			// 양육관계 코드 얻어냄
			IRelationDAO relation_dao = sqlSession.getMapper(IRelationDAO.class);
			RelationDTO relation_dto = relation_dao.list(sid_code, pet_code);
			String relation_code = relation_dto.getRelation_code();
			
			// 산책방 번호와 양육관계 코드로 참여자 코드 얻어냄
			IParticipantsDAO part_dao = sqlSession.getMapper(IParticipantsDAO.class);
			ParticipantsDTO part_dto = part_dao.search(walkroom_code, relation_code);
			String participants_code = part_dto.getParticipants_code();
			
			// 방 나가기 = 참여자 테이블에서 삭제 처리
			part_dao.exitWalkRoom(participants_code);
			
			// 산책방 코드 세션 삭제 구문 필요
			
			result="redirect:walkroommain.action";
		}

		return result;
	}
	
	// 레디 버튼 클릭 시 레디 상태 업데이트
	@RequestMapping(value = "/readystateupdate.action", method = RequestMethod.GET)
	public String readyStateUpdate(HttpServletRequest request) throws SQLException
	{
		String result = "";
		HttpSession session = request.getSession();
		String sid_code = (String)session.getAttribute("sid_code");
		String pet_code = (String)session.getAttribute("pet_code");
		int walkroom_code = (int)session.getAttribute("walkroom_code");
		
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
			// 레디 상태 코드 받아옴
			String readystate_code = request.getParameter("readystate");
			System.out.println("readystateupdate readystate_code : " + readystate_code);
			
			// 양육관계 코드 얻어냄
			IRelationDAO relation_dao = sqlSession.getMapper(IRelationDAO.class);
			RelationDTO relation_dto = relation_dao.list(sid_code, pet_code);
			String relation_code = relation_dto.getRelation_code();
			
			// 산책방 번호와 양육관계 코드로 참여자 코드 얻어냄
			IParticipantsDAO part_dao = sqlSession.getMapper(IParticipantsDAO.class);
			ParticipantsDTO part_dto = part_dao.search(walkroom_code, relation_code);
			String participants_code = part_dto.getParticipants_code();
			
			// 방 나가기 = 참여자 테이블에서 삭제 처리
			part_dao.modifyReadyState(readystate_code, participants_code);
			result="redirect:walkroomguest.action";
		}

		return result;
	}

	
}

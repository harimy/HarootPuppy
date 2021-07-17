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
public class WalkRoomListMain
{
	// mybatis 객체 의존성 (자동) 주입
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value = "/walkroomselect.action", method = RequestMethod.GET)
	public String walkRoomSelect(HttpServletRequest request, ModelMap model)
	{
		String result = null;
		
		// 세션 처리 --------------------------------------------------
		HttpSession session = request.getSession();
		String sid_code = (String)session.getAttribute("sid_code");
		IPetDAO dao = sqlSession.getMapper(IPetDAO.class);
		ArrayList<PetDTO> petlist = dao.searchPets(sid_code);
		
		if (sid_code == null)
		{
			result = "redirect:LoginForm.jsp";
		}
		else
		{
			result = "/WalkSelectPet.jsp";
			model.addAttribute("sid_code", sid_code);
			model.addAttribute("petlist", petlist);
		}
		
		return result;
	}
	
	// walkroommain.action 으로 요청이 들어오면 아래의 메소드가 일을 처리
	@RequestMapping(value = "/walkroommain.action", method = RequestMethod.GET)
	public String walkRoomMain(HttpServletRequest request, ModelMap model) throws SQLException	// Model, ModelMap 둘 다 사용 가능
	{
		String result = "";
		HttpSession session = request.getSession();
		String sid_code = (String)session.getAttribute("sid_code");
		String session_pet_code = (String)session.getAttribute("pet_code");
		
		if(sid_code==null)	// 로그인 안한 경우
		{
			result = "redirect:loginMem.action";
		}
		else if(session_pet_code == null)	// 처음 펫 선택후 산책메이트 접속 시
		{
			String pet_code = (String)request.getParameter("pet_code"); 	
			session.setAttribute("pet_code", pet_code);
			//System.out.println("walkroommain pet_code " + pet_code);
			
			IWalkRoomDAO dao = sqlSession.getMapper(IWalkRoomDAO.class);
		    IPetDAO petdao = sqlSession.getMapper(IPetDAO.class);
		    PetDTO petdto = petdao.petInfo(pet_code);
			
		    model.addAttribute("list", dao.list());
		    model.addAttribute("pet", petdto);
		    
		    result = "/WalkMain.jsp";
		}
		else if(session_pet_code != null)	// 산책방 생성 후 redirect 시
		{
			//System.out.println("redirect:walkroommain pet_code : " + session_pet_code);
			
			IWalkRoomDAO dao = sqlSession.getMapper(IWalkRoomDAO.class);
		    IPetDAO petdao = sqlSession.getMapper(IPetDAO.class);
			PetDTO petdto = petdao.petInfo(session_pet_code);
			
		    model.addAttribute("list", dao.list());
		    model.addAttribute("pet", petdto);
		    
		    result = "/WalkMain.jsp";
		}
		
	    
	    return result;
	}
	
	
	@RequestMapping(value = "/walkroomlist.action", method = RequestMethod.GET)
	public String walkRoomList(HttpServletRequest request, ModelMap model) throws SQLException	// Model, ModelMap 둘 다 사용 가능
	{
		String result = "";
		HttpSession session = request.getSession();
		String sid_code = (String)session.getAttribute("sid_code");
		String pet_code = (String)session.getAttribute("pet_code");
		//System.out.println("walkroomlist pet_code : " + pet_code);
		
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
		    IPetDAO petdao = sqlSession.getMapper(IPetDAO.class);
			
		    model.addAttribute("list", dao.list());
		    model.addAttribute("sid_code", sid_code);
		    model.addAttribute("pet", petdao.petInfo(pet_code));
		    
		    result = "/WalkRoomList.jsp";
		}
		
	    
	    return result;
	}
	
	
	@RequestMapping(value = "/walkroominsertform.action", method = RequestMethod.GET)
	public String walkRoomInsertForm(HttpServletRequest request, ModelMap model) throws SQLException
	{
		String result = "";
		HttpSession session = request.getSession();
		String sid_code = (String)session.getAttribute("sid_code");
		String pet_code = (String)session.getAttribute("pet_code");
		
		IWalkRoomDAO dao = sqlSession.getMapper(IWalkRoomDAO.class);
		
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
			int nextNum = dao.max() + 1;
			//System.out.println("nextNum : " + nextNum);
			model.addAttribute("nextNum", nextNum);
			result = "/WalkRoomInsertForm.jsp";
		}
		
		
		return result;
	}
	
	
	@RequestMapping(value = "/walkroominsert.action", method = RequestMethod.POST)
	public String walkRoomInsert(HttpServletRequest request, WalkRoomDTO w) throws SQLException
	{
		String result = "";
		HttpSession session = request.getSession();
		String sid_code = (String)session.getAttribute("sid_code");
		String pet_code = (String)session.getAttribute("pet_code");
		//System.out.println("walkroominsert pet_code : " + pet_code);
		
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
			IParticipantsDAO partDao = sqlSession.getMapper(IParticipantsDAO.class);
			ParticipantsDTO partDto = new ParticipantsDTO();
			
			// 참여자 코드 구성
			String participants_code = "PAR" + (partDao.max()+1);
			partDto.setParticipants_code(participants_code);
			
			// 산책방 코드 구성
			int walkroom_code = dao.max() + 1;
			partDto.setWalkroom_code(walkroom_code);
			
			// TBL_WALKROOM 테이블에 방장 코드(방생성자의 sid) 동적으로 넘겨주기
			w.setWalkroom_leader(sid_code);
			
			// TBL_PARTICIPANTS 테이블에 양육관계 코드 동적으로 넘겨주기 
			//System.out.println("walkroominsert2 pet_code : " + pet_code);
			IPetDAO petdao = sqlSession.getMapper(IPetDAO.class);
		    PetDTO petdto = petdao.petInfo(pet_code);
		    String rel_code = petdto.getRelation_code();
		    partDto.setRelation_code(rel_code);
			
		    // 메소드 실행
			dao.add(w);
			partDao.add(partDto);
			
			// 나중에 생성한 산책방으로 이동하게 변경하기
			result = "redirect:walkroommain.action";
				
		}
		
		return result;
	}
	
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
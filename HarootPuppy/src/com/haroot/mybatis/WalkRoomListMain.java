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
	public String WalkRoomMain(HttpServletRequest request, ModelMap model)
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
	public String walkRoomList(HttpServletRequest request, ModelMap model) throws SQLException	// Model, ModelMap 둘 다 사용 가능
	{
		HttpSession session = request.getSession();
		String pet_code = (String)session.getAttribute("pet_code");
		if(pet_code==null)
		{
			pet_code = request.getParameter("pet_code"); 
			session.setAttribute("pet_code", pet_code);
		}
		//System.out.println(pet_code);
		
		IWalkRoomDAO dao = sqlSession.getMapper(IWalkRoomDAO.class);
	    IPetDAO petdao = sqlSession.getMapper(IPetDAO.class);
		
	    model.addAttribute("list", dao.list());
	    model.addAttribute("pet", petdao.petInfo(pet_code));
	    
	    return "/WalkMain.jsp";
	}
	
	
	@RequestMapping(value = "/walkroomlist.action", method = RequestMethod.GET)
	public String l(HttpServletRequest request, ModelMap model) throws SQLException	// Model, ModelMap 둘 다 사용 가능
	{
		HttpSession session = request.getSession();
		String sid_code = (String)session.getAttribute("sid_code");
		String pet_code = request.getParameter("pet_code"); 
		//System.out.println(pet_code);
		
		IWalkRoomDAO dao = sqlSession.getMapper(IWalkRoomDAO.class);
	    IPetDAO petdao = sqlSession.getMapper(IPetDAO.class);
		
	    model.addAttribute("list", dao.list());
	    model.addAttribute("sid_code", sid_code);
	    model.addAttribute("pet", petdao.petInfo(pet_code));
	    
	    return "/WalkRoomList.jsp";
	}
	
	
	@RequestMapping(value = "/walkroominsertform.action", method = RequestMethod.GET)
	public String walkRoomInsertForm(ModelMap model) throws SQLException
	{
		IWalkRoomDAO dao = sqlSession.getMapper(IWalkRoomDAO.class);
		
		int nextNum = dao.max() + 1;
		
		model.addAttribute("nextNum", nextNum);
		
		return "/WalkRoomInsertForm.jsp";
	}
	
	
	@RequestMapping(value = "/walkroominsert.action", method = RequestMethod.POST)
	public String memberInsert(WalkRoomDTO w) throws SQLException
	{
		IWalkRoomDAO dao = sqlSession.getMapper(IWalkRoomDAO.class);
		IParticipantsDAO partDao = sqlSession.getMapper(IParticipantsDAO.class);
		ParticipantsDTO partDto = new ParticipantsDTO();
		
		// 참여자 코드 구성
		String participants_code = partDao.max_code();
		participants_code = "PAR" + (Integer.parseInt(participants_code.substring(3))+1);
		partDto.setParticipants_code(participants_code);
		//System.out.println(participants_code);
		
		// 산책방 코드 구성
		int walkroom_code = dao.max() + 1;
		partDto.setWalkroom_code(walkroom_code);
		
		// 양육관계 코드 구성 → sid 구성 후 값 가져오기
		dao.add(w);
		partDao.add(partDto);
		
		// 나중에 생성한 산책방으로 이동하게 변경하기
		return "redirect:walkroommain.action";
	}
	
	/*
	@RequestMapping(value = "walkroomupdateform.action", method = RequestMethod.POST)
	public String memberUpdate(MemberDTO m)
	{
		WalkRoomDAO dao = sqlSession.getMapper(IMemberDAO.class);
		
		//dao.modify(m);
		
		return "WalkRoomUpdateForm.jsp";
	}
	*/
	
}

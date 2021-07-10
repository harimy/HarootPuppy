package com.haroot.mybatis;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

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
	
	@RequestMapping(value = "walkroommain.action", method = RequestMethod.GET)
	public String WalkRoomMain(ModelMap model)
	{
		return "/WalkMain.jsp";
	}
	
	// /memberList.action 으로 요청이 들어오면 아래의 메소드가 일을 처리
	@RequestMapping(value = "/walkroomlist.action", method = RequestMethod.GET)
	public String walkRoomList(ModelMap model) throws SQLException	// Model, ModelMap 둘 다 사용 가능
	{
		// 기존의 방식
		// IMemberDAO dao = MemberDAO 객체 생성
		// 이걸 이제는 마이바티스가 수행해줌(아래 코드)
		IWalkRoomDAO dao = sqlSession.getMapper(IWalkRoomDAO.class);
	    
	    model.addAttribute("list", dao.list());
	      
	    return "/WalkRoomList.jsp";
	}
	
	
	@RequestMapping(value = "walkroominsertform.action", method = RequestMethod.GET)
	public String walkRoomInsertForm(ModelMap model) throws SQLException
	{
		IWalkRoomDAO dao = sqlSession.getMapper(IWalkRoomDAO.class);
		
		int nextNum = dao.max() + 1;
		
		model.addAttribute("nextNum", nextNum);
		
		return "/WalkRoomInsertForm.jsp";
	}
	
	
	@RequestMapping(value = "walkroominsert.action", method = RequestMethod.POST)
	public String memberInsert(WalkRoomDTO w) throws SQLException
	{
		IWalkRoomDAO dao = sqlSession.getMapper(IWalkRoomDAO.class);
		IParticipantsDAO partDao = sqlSession.getMapper(IParticipantsDAO.class);
		ParticipantsDTO partDto = new ParticipantsDTO();
		
		// 참여자 코드 구성
		String participants_code = partDao.max_code();
		participants_code = "PAR" + (Integer.parseInt(participants_code.substring(3))+1);
		partDto.setParticipants_code(participants_code);
		System.out.println(participants_code);
		
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
	@RequestMapping(value = "memberupdate.action", method = RequestMethod.POST)
	public String memberUpdate(MemberDTO m)
	{
		IMemberDAO dao = sqlSession.getMapper(IMemberDAO.class);
		
		dao.modify(m);
		
		return "redirect:memberlist.action";
	}
	*/
}

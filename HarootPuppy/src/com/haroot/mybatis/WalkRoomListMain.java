package com.haroot.mybatis;

import java.sql.SQLException;

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
	
	// /memberList.action 으로 요청이 들어오면 아래의 메소드가 일을 처리
	@RequestMapping(value = "/walkroomlist.action", method = RequestMethod.GET)
	public String walkRoomList(ModelMap model) throws SQLException	// Model, ModelMap 둘 다 사용 가능
	{
		// 기존의 방식
		// IMemberDAO dao = MemberDAO 객체 생성
		// 이걸 이제는 마이바티스가 수행해줌(아래 코드)
		IWalkRoomViewDAO dao = sqlSession.getMapper(IWalkRoomViewDAO.class);
	    
	    model.addAttribute("list", dao.list());
	      
	    return "/WalkRoomList.jsp";
	}
	
	/*
	@RequestMapping(value = "memberinsert.action", method = RequestMethod.POST)
	public String memberInsert(MemberDTO m)
	{
		IMemberDAO dao = sqlSession.getMapper(IMemberDAO.class);

		
		dao.add(m);
		
		return "redirect:memberlist.action";
	}
	
	@RequestMapping(value = "memberdelete.action", method = RequestMethod.GET)
	public String memberDelete(MemberDTO m)
	{
		IMemberDAO dao = sqlSession.getMapper(IMemberDAO.class);
		
		dao.remove(m);
		
		return "redirect:memberlist.action";
	}
	
	@RequestMapping(value = "memberupdate.action", method = RequestMethod.POST)
	public String memberUpdate(MemberDTO m)
	{
		IMemberDAO dao = sqlSession.getMapper(IMemberDAO.class);
		
		dao.modify(m);
		
		return "redirect:memberlist.action";
	}
	*/
}

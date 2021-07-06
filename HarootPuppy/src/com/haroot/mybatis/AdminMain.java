/*=====================
 * AdminMain.java
 * - 메인컨트롤러 객체
======================*/


package com.haroot.mybatis;

import java.sql.SQLException;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AdminMain
{
	// mybatis 객체 의존성 (자동) 주입~!!!
	@Autowired
	private SqlSession sqlSession;
	
	// 관리자 계정 로그인시 , 관리자용 메인 페이지 요청
	@RequestMapping(value="/adminmain.action", method=RequestMethod.GET)
	public String hello(ModelMap model) throws SQLException
	{
		IAdminReportDAO dao = sqlSession.getMapper(IAdminReportDAO.class);
		
		// 미처리된 게시판 신고게시물 건수 전달 
		model.addAttribute("boardNotHandled", dao.boardNotHandled());
		
		// 미처리된 게시판 신고댓글 건수 전달
		model.addAttribute("boardCommNotHandled", dao.boardCommNotHandled());
		
		// 미처리된 산책메이트 방 건수 전달
		model.addAttribute("walkNotHandled", dao.walkNotHandled());
		
		// 미처리된 산책메이트 방 댓글 건수 전달
		model.addAttribute("walkCommNotHandled", dao.walkCommNotHandled());
		
		// 미처리된 산책메이트 오프라인신고 의견 수 전달
		model.addAttribute("walkOffNotHandled", dao.walkOffNotHandled());
		
		// 답변 대기중인 고객문의 게시물 수 전달
		model.addAttribute("askNotHandled", dao.askNotHandled());
		
		// 게시판 신고 게시물 리스트 전달
		model.addAttribute("list1", dao.adBoardReportList());
		
		// 산책메이트 신고 방 리스트 전달
		model.addAttribute("list2", dao.adWalkroomReportList());
		
		
		return "/WEB-INF/views/AdminMain.jsp";
	}
	
	
	
	
}

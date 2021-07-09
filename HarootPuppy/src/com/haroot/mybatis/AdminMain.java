/*=====================
 * AdminMain.java
 * - 메인컨트롤러 객체
======================*/


package com.haroot.mybatis;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
	public String adminMain(ModelMap model, HttpServletRequest request, HttpServletResponse response) throws SQLException
	{
		HttpSession session = request.getSession();
		
		if(session.getAttribute("a")==null) //-- 로그인이 되어있지 않은 상황
		{
			return "LoginForm.jsp";
		}
		else
		{
			return "redirect:adminmain.action";
		}
		
		/*
		// 관리자용 신고 DAO 
		IAdminReportDAO dao = sqlSession.getMapper(IAdminReportDAO.class);
		
		// 고객지원 DAO 
		IAskDAO dao1 = sqlSession.getMapper(IAskDAO.class);
		
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
		
		// 읽지않은 게시판 > 게시물 수 전달
		model.addAttribute("boardNotRead", dao.boardNotRead());
		
		// 읽지않은 산책방 > 게시물 수 전달
		model.addAttribute("walkNotRead", dao.walkNotRead());
		
		// 읽지않은 고객문의 수 전달
		model.addAttribute("askNotRead", dao1.askNotRead());
		
		// 읽지않은 고객문의 리스트 전달
		model.addAttribute("list3", dao1.list());
		
		
		
		return "/WEB-INF/views/AdminMain.jsp";
		*/
	}
	
	@RequestMapping(value="/reportmain.action", method=RequestMethod.GET)
	public String reportMain(ModelMap model) throws SQLException
	{
			// 관리자용 신고
			IAdminReportDAO dao = sqlSession.getMapper(IAdminReportDAO.class);
			
			// 오프라인신고 dto
			IAdminOfflineDAO offdao = sqlSession.getMapper(IAdminOfflineDAO.class);
			
		
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
			
			// 읽지않은 게시판 > 게시물 수 전달
			model.addAttribute("boardNotRead", dao.boardNotRead());
			
			// 읽지않은 산책방 > 게시물 수 전달
			model.addAttribute("walkNotRead", dao.walkNotRead());
			
			// 읽지 않은 오프라인 의견 수 전달
			model.addAttribute("offNotRead", dao.offNotRead());
			
			// 오프라인 신고 게시물 전달
			model.addAttribute("list3", offdao.list());
		
		
		return "/WEB-INF/views/ReportMain.jsp";
	
	}
	
	
}

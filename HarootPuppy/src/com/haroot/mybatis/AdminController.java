/*================================
 * AdminController.java
 * - 관리자페이지 컨트롤러 객체
================================*/


package com.haroot.mybatis;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
<<<<<<< HEAD
=======
import javax.servlet.http.HttpServletResponse;
>>>>>>> e2a736788c9c7ffcb0955cb6c092612eb2e350fe

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AdminController
{
	// mybatis 객체 의존성 (자동) 주입~!!!
	@Autowired
	private SqlSession sqlSession;
	
	// 아별
	// 관리자 계정 로그인시 , 관리자용 메인 페이지 요청 (아별 : GET 방식)
	@RequestMapping(value="/adminmain.action", method=RequestMethod.GET)
	public String adminMain(ModelMap model, HttpServletRequest request, HttpServletResponse response) throws SQLException
	{

		// 관리자용 신고 DAO 
		IAdminReportDAO report = sqlSession.getMapper(IAdminReportDAO.class);
		
		// 고객지원 DAO 
		IAskDAO dao1 = sqlSession.getMapper(IAskDAO.class);
		
		// 미처리된 게시판 신고게시물 건수 전달 
		model.addAttribute("boardNotHandled", report.boardNotHandled());
		
		// 미처리된 게시판 신고댓글 건수 전달
		model.addAttribute("boardCommNotHandled", report.boardCommNotHandled());
		
		// 미처리된 산책메이트 방 건수 전달
		model.addAttribute("walkNotHandled", report.walkNotHandled());
		
		// 미처리된 산책메이트 방 댓글 건수 전달
		model.addAttribute("walkCommNotHandled", report.walkCommNotHandled());
		
		// 미처리된 산책메이트 오프라인신고 의견 수 전달
		model.addAttribute("walkOffNotHandled", report.walkOffNotHandled());
		
		// 답변 대기중인 고객문의 게시물 수 전달
		model.addAttribute("askNotHandled", report.askNotHandled());
		
		// 게시판 신고 게시물 리스트 전달
		model.addAttribute("list1", report.adBoardReportList());
		
		// 산책메이트 신고 방 리스트 전달
		model.addAttribute("list2", report.adWalkroomReportList());
		
		// 읽지않은 게시판 > 게시물 수 전달
		model.addAttribute("boardNotRead", report.boardNotRead());
		
		// 읽지않은 산책방 > 게시물 수 전달
		model.addAttribute("walkNotRead", report.walkNotRead());
		
		// 읽지않은 고객문의 수 전달
		model.addAttribute("askNotRead", dao1.askNotRead());
		
		// 읽지않은 고객문의 리스트 전달
		model.addAttribute("list3", dao1.notHandledList());
		
		return "/WEB-INF/views/AdminMain.jsp";
	
	}

	
	
}

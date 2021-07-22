/*================================
 * AdminMemberController.java
 * - 관리자>신고관리 컨트롤러 객체
================================*/

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
public class AdminReportController
{
	/*===================
   	신고 관리 
	===================*/
	
	// mybatis 객체 의존성 (자동) 주입~!!!
	@Autowired
	private SqlSession sqlSession;

	// 관리자 > 신고 관리 메인 페이지 
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
		
		
		return "ReportMain.jsp";
	
	}
	
	@RequestMapping(value="/adminreportboardlist.action", method=RequestMethod.GET)
	public String adminReportBoardList(ModelMap model, HttpServletRequest request) throws SQLException
	{
		// 관리자용 신고 DAO 
		IAdminReportDAO report = sqlSession.getMapper(IAdminReportDAO.class);
		
		//System.out.println("test :" + test);
		
		//String test = "test message~!!!";
		//--==>> ReportedBoardList.jsp에서 받아올 수 있다.
		
		// 전체
		model.addAttribute("adBoardReportList", report.adBoardReportList());
		
		// 미처리
		model.addAttribute("adBoardReportList1", report.adBoardReportList1());
		
		// 신고해제
		model.addAttribute("adBoardReportList2", report.adBoardReportList2());
		
		// 신고확정
		model.addAttribute("adBoardReportList3", report.adBoardReportList3());
		
		return "ReportedBoardTab.jsp";
	}
	
	
	// 관리자 > 신고관리 > 게시판 게시물 보기
	@RequestMapping(value="/adminreportboardview.action", method=RequestMethod.GET)
	public String adminReportBoardView(ModelMap model, HttpServletRequest request, AdminReportDTO dto) throws SQLException
	{
		// 이전 페이지에서 데이터 가져오기
		String rep_log_code = request.getParameter("rep_log_code");
		
		if (rep_log_code == null)
		{
			rep_log_code = dto.getRep_log_code();
			
			System.out.println(rep_log_code);
		}
		
		
		// 관리자용 신고 DAO 
		IAdminReportDAO report = sqlSession.getMapper(IAdminReportDAO.class);
		
		model.addAttribute("search", report.search(rep_log_code));
		
		return "ReportedBoardRead.jsp";
	}
	
	// 관리자 > 신고관리 > 게시물 신고처리 
	@RequestMapping(value="/adminreportboardhandle.action", method=RequestMethod.GET)
	public String adminReportBoardHandle(AdminReportDTO dto, HttpServletRequest request) throws SQLException
	{
		// 이전 페이지에서 데이터 가져오기
		/*
		String board_code = request.getParameter("board_code");
		String rep_state_code = request.getParameter("rep_state_code");
		
		System.out.println("board_code : " + board_code);
		System.out.println("rep_state_code : " + rep_state_code);
		*/
		//--==>>
		/*
		 board_code : 3
		 rep_state_code : 2
		*/
		
		// 관리자용 신고 DAO 
		IAdminReportDAO report = sqlSession.getMapper(IAdminReportDAO.class);
		
		report.handleReport(dto);
		
		return "redirect:adminreportboardlist.action";
	}
	

	
	
}

/*================================
 * AdminNoticeController.java
 * - 관리자>공지관리 컨트롤러 객체
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
public class AdminNoticeController
{
	// mybatis 객체 의존성 (자동) 주입~!!!
	@Autowired
	private SqlSession sqlSession;
	
	// 관리자 > 공지관리 전체공지 리스트 페이지
	@RequestMapping(value="/adminnoticelist.action", method=RequestMethod.GET)
	public String adminNoticeList(ModelMap model) throws SQLException
	{
		// 공지dao 
		IAdminNoticeDAO dao = sqlSession.getMapper(IAdminNoticeDAO.class);
		
		// 전체 공지 리스트 전달
		model.addAttribute("list", dao.list());
		
		return "NoticeList.jsp";
	}
	
	// 관리자 > 공지관리 > 글쓰기 페이지 
	@RequestMapping(value="/adminnoticeinsertform.action", method=RequestMethod.GET)
	public String adminNoticeInsertForm(ModelMap model) throws SQLException
	{
		// 공지dao 
		IAdminNoticeDAO dao = sqlSession.getMapper(IAdminNoticeDAO.class);
		
		// 전체 공지 리스트 전달
		int getMaxNum = dao.getMaxNum();
		
		model.addAttribute("getMaxNum", getMaxNum);
		
		return "NoticeInsertForm.jsp";
	}
	
	// 관리자 > 공지관리 > 공지 데이터 입력
	@RequestMapping(value="/adminnoticeinsert.action", method=RequestMethod.GET)
	public String adminNoticeInsert(ModelMap model, AdminNoticeDTO dto) throws SQLException
	{
		// 공지dao 
		IAdminNoticeDAO dao = sqlSession.getMapper(IAdminNoticeDAO.class);
		
		//System.out.println(dto.getNotice_code());
		//--==>> 6
		
		dao.add(dto);
		
		
		return "redirect:adminnoticelist.action";
	}
	
	// 관리자 > 공지관리 > 글 보기
	@RequestMapping(value="/adminnoticeview.action", method=RequestMethod.GET)
	public String adminNoticeView(ModelMap model, HttpServletRequest request) throws SQLException
	{
	
		String notice_code = request.getParameter("notice_code");
		//System.out.println(notice_code);
		
		// 공지dao 
		IAdminNoticeDAO dao = sqlSession.getMapper(IAdminNoticeDAO.class);
		
		// 공지 글 보기
		model.addAttribute("list", dao.view(notice_code));
		
		return "NoticeRead.jsp";
	}
	
	
	// 관리자 > 공지관리 > 글 삭제
	@RequestMapping(value="/adminnoticedelete.action", method=RequestMethod.GET)
	public String adminNoticeRemove(ModelMap model, HttpServletRequest request) throws SQLException
	{
	
		String notice_code = request.getParameter("notice_code");
		//System.out.println("공지코드 : " + notice_code);
		
		// 공지dao 
		IAdminNoticeDAO dao = sqlSession.getMapper(IAdminNoticeDAO.class);
		
		// 공지삭제
		dao.remove(notice_code);
		
		return "redirect:adminnoticelist.action";
	}
	
	// 관리자 > 공지관리 > 글 수정
	@RequestMapping(value="/adminnoticeupdateform.action", method=RequestMethod.GET)
	public String adminNoticeUpdateForm(ModelMap model, HttpServletRequest request) throws SQLException
	{
	
		String notice_code = request.getParameter("notice_code");
		//System.out.println("공지코드 : " + notice_code);
		
		// 공지dao 
		IAdminNoticeDAO dao = sqlSession.getMapper(IAdminNoticeDAO.class);
		
		// 공지글 수정 폼 페이지 이동
		model.addAttribute("list", dao.view(notice_code));
		
		return "NoticeUpdateForm.jsp";
	}
	
	
	// 관리자 > 공지관리 > 글 수정
	@RequestMapping(value="/adminnoticeupdate.action", method=RequestMethod.GET)
	public String adminNoticeUpdate(AdminNoticeDTO dto) throws SQLException
	{
		
		System.out.println("수정코드 : " + dto.getNotice_code());
		System.out.println("글제목 : " + dto.getNotice_title());
		System.out.println("글내용 : " + dto.getNotice_content());
		System.out.println("말머리코드 : " + dto.getNotice_head_code());
		/*
		 수정코드 : 11,
		글제목 : 210721 테스트
		글내용 : 						
								
		테스트입니다
								
		말머리코드 : 1
		 */
		
		// 공지dao 
		IAdminNoticeDAO dao = sqlSession.getMapper(IAdminNoticeDAO.class);
		
		// 공지글 수정 
		dao.modify(dto);
		
		return "redirect:adminnoticelist.action";
		
	}
	
	
	
	
	
}

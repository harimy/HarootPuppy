/*================================
 * AdminNoticeController.java
 * - 관리자>공지관리 컨트롤러 객체
================================*/

package com.haroot.mybatis;

import java.sql.SQLException;

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
		
		return "/WEB-INF/views/NoticeList.jsp";
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
		
		return "/WEB-INF/views/NoticeInsertForm.jsp";
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
	
	
}

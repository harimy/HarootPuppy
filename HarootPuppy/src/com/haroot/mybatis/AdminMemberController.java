/*================================
 * AdminMemberController.java
 * - 관리자>회원관리 컨트롤러 객체
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
public class AdminMemberController
{	
	/*===================
	 회원관리 메뉴
	===================*/

	// mybatis 객체 의존성 (자동) 주입~!!!
	@Autowired
	private SqlSession sqlSession;
	
	// 관리자 > 회원관리 전체회원정보리스트 페이지
	@RequestMapping(value="/adminmanagemember.action", method=RequestMethod.GET)
	public String adminManageMember(ModelMap model) throws SQLException
	{
		// 멤버dao 
		IMemberDAO dao = sqlSession.getMapper(IMemberDAO.class);
		
		// 전체 회원 정보 리스트 전달
		model.addAttribute("normalList", dao.normalList());
		
		return "/WEB-INF/views/AllUserInfoList.jsp";
	}
	
	// 관리자 > 회원관리 > 회원정보 세부보기
	@RequestMapping(value="/memberdetailinfo.action", method=RequestMethod.GET)
	public String adminMemberDetail(ModelMap model, String sid_code) throws SQLException
	{
		// 멤버dao 
		IMemberDAO dao = sqlSession.getMapper(IMemberDAO.class);
		
		// 반려견dao
		IPetDAO petdao = sqlSession.getMapper(IPetDAO.class);
		
		//System.out.println(sid_code);
		//--==>> 콘솔창에서 받아와짐을 확인!
		
		// 전체 회원 정보 리스트 전달
		model.addAttribute("search", dao.search(sid_code));
		
		// 반려견 아이디, 반려견 이름 전달
		model.addAttribute("petList", petdao.searchPets(sid_code));
		
		return "/WEB-INF/views/UserInfoRead.jsp";
	}
	
	// 관리자 > 회원관리 > 회원정보 수정 폼
	@RequestMapping(value="/adminmemberupdateform.action", method=RequestMethod.GET)
	public String adminMemberUpdateForm(ModelMap model, String sid_code) throws SQLException
	{
		// 멤버dao 
		IMemberDAO dao = sqlSession.getMapper(IMemberDAO.class);
		
		// 반려견dao
		IPetDAO petdao = sqlSession.getMapper(IPetDAO.class);
		
		//System.out.println(sid_code);
		
		
		// 전체 회원 정보 리스트 전달 
		model.addAttribute("search", dao.search(sid_code));
		  
		// 반려견 아이디, 반려견 이름 전달 
		model.addAttribute("petList", petdao.searchPets(sid_code));
		 
		return "/WEB-INF/views/UserInfoUpdateForm.jsp";
	}
	
	// 관리자 > 회원관리 > 회원 정보 수정
	@RequestMapping(value="/adminmemberupdate.action", method=RequestMethod.POST)
	public String adminMemberUpdate(MemberDTO m, HttpServletRequest request) throws SQLException
	{	
		/* String mem_code = request.getParameter("mem_code"); */
		
		//System.out.println(mem_code); */
		//--==>> MEM001
		
		//System.out.println(m.getMem_id());
		//--==>> joohee
		
		//System.out.println(m.getSid_code());
		//--==>> SID002
		
		//System.out.println(m.getMem_birth());
		//--==>> 1995-11-02
		
		//System.out.println(m.getMem_gender());
		//--==>> M
		
		
		IMemberDAO dao = sqlSession.getMapper(IMemberDAO.class);
		  
		dao.modify(m);
		
		
		return "redirect:adminmanagemember.action";
		
	}
	
	// 관리자 > 회원관리 > 회원 삭제
	@RequestMapping(value="/adminmemberdelete.action", method=RequestMethod.GET)
	public String adminMemberDelete(HttpServletRequest request) throws SQLException
	{
		String mem_code = request.getParameter("mem_code");
		
		System.out.println(mem_code);
		
		IMemberDAO dao = sqlSession.getMapper(IMemberDAO.class);
		
		dao.remove(mem_code);
		
		return "redirect:adminmanagemember.action";
	}
	
	
}

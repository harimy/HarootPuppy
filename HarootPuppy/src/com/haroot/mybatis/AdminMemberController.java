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
		
		// 전체 회원 정보 수 전달
		model.addAttribute("normalCount", dao.normalCount());
		
		
		return "AllUserInfoList.jsp";
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
		
		return "UserInfoRead.jsp";
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
		 
		return "UserInfoUpdateForm.jsp";
	}
	
	// 관리자 > 회원관리 > 회원 정보 수정
	@RequestMapping(value="/adminmemberupdate.action", method=RequestMethod.POST)
	public String adminMemberUpdate(MemberDTO m, HttpServletRequest request) throws SQLException
	{	
		
		IMemberDAO dao = sqlSession.getMapper(IMemberDAO.class);
		  
		dao.modify(m);
		
		
		return "redirect:adminmanagemember.action";
		
	}
	
	// 관리자 > 회원관리 > 회원 삭제
	@RequestMapping(value="/adminmemberdelete.action", method=RequestMethod.GET)
	public String adminMemberDelete(HttpServletRequest request) throws SQLException
	{
		String mem_code = request.getParameter("mem_code");
		
		//System.out.println(mem_code);
		
		
		try
		{
			IMemberDAO dao = sqlSession.getMapper(IMemberDAO.class);
			
			dao.remove(mem_code);
			
		
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
			return "redirect:adminmanagemember.action";
	}
	
	
	// 관리자 > 회원관리 관리자정보리스트 페이지
	@RequestMapping(value="/adminmanageadmin.action", method=RequestMethod.GET)
	public String adminManageadmin(ModelMap model) throws SQLException
	{
		
		IAdminDAO admin = sqlSession.getMapper(IAdminDAO.class);
		
		// 관리자 회원 정보 리스트 전달
		model.addAttribute("adminList", admin.list());
		
		return "AdminInfoList.jsp";
	}
	
	
	// 관리자 > 회원관리 관리자정보 삭제
	@RequestMapping(value="/admindelete.action", method=RequestMethod.GET)
	public String admindeleteadmin(ModelMap model, HttpServletRequest request) throws SQLException
	{
		String admin_code = request.getParameter("admin_code");
		
		System.out.println(admin_code);
		
		IAdminDAO admin = sqlSession.getMapper(IAdminDAO.class);
		
		// 관리자 회원 정보 리스트 전달
		model.addAttribute("adminList", admin.remove(admin_code));
		
		return "redirect:adminmanageadmin.action";
	}
	// 관리자 > 회원관리 관리자 추가 폼페이지 
	@RequestMapping(value="/admininsertform.action", method=RequestMethod.GET)
	public String admininsertform(ModelMap model) throws SQLException
	{
		
		return "AdminInsertForm.jsp";
	}
	
	// 관리자 > 회원관리 관리자 추가
	@RequestMapping(value="/admininsertadmin.action", method=RequestMethod.GET)
	public String admininsertadmin(ModelMap model, AdminDTO dto) throws SQLException
	{
		
		IAdminDAO admin = sqlSession.getMapper(IAdminDAO.class);
		
		admin.add(dto);
		
		return "redirect:adminmanageadmin.action";
	}
	
	
	
}

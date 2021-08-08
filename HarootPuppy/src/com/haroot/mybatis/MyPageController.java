package com.haroot.mybatis;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MyPageController
{
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value="memberupdateform.action", method = {RequestMethod.GET, RequestMethod.POST})
	public String updateForm(Model model, HttpServletRequest request, HttpServletResponse response) throws SQLException
	{
		HttpSession session = request.getSession();
		String sid_code = (String)session.getAttribute("sid_code");
		String nickname = (String)session.getAttribute("nickname");
		IMemberDAO dao = sqlSession.getMapper(IMemberDAO.class);
		MemberDTO dto = dao.search(sid_code);
		model.addAttribute("mem_id", dto.getMem_id());
		model.addAttribute("mem_name", dto.getMem_name()) ;
		model.addAttribute("mem_gender", dto.getMem_gender());
		model.addAttribute("mem_birth", dto.getMem_birth());

		return "MemberInformUpdate.jsp";
	}
	
	@RequestMapping(value="memberupdate.action", method=RequestMethod.POST)
	public String modify(Model model, HttpServletRequest request, HttpServletResponse response)
	{
		HttpSession session = request.getSession();
		String sid_code = (String)session.getAttribute("sid_code");
		String nickname = (String)session.getAttribute("nickname");

		return "UserMyPage.jsp";
	}
}

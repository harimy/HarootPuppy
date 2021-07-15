/*package com.haroot.mybatis;

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
public class AdminMainController
{
   @Autowired
   private SqlSession sqlSession;
   
   @RequestMapping(value="adminheader.action", method=RequestMethod.POST)
   public String adminHeader(Model model, HttpServletRequest request, HttpServletResponse response)
   {
      HttpSession session = request.getSession();
      String admin_code = (String)session.getAttribute("admin_code");
      
      // System.out.println(sid_code);
      IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
      model.addAttribute("name", dao.searchName(admin_code));
      session.setAttribute("admin_code", admin_code);
      
      return "adminmain.action";

   }
   

   @RequestMapping(value="adminmain.action", method=RequestMethod.POST)
   public String goToAdminMain(Model model, HttpServletRequest request, HttpServletResponse response) throws SQLException
   {
      HttpSession session = request.getSession();
      String admin_code = (String)session.getAttribute("admin_code");
      
      // System.out.println(sid_code);
      IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
      model.addAttribute("name", dao.searchName(admin_code));   // 테스트용
      


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
      
      
      if(admin_code!=null)
      {
         return "/WEB-INF/views/AdminMain.jsp";
      }
      else
      {
         return "LoginForm.jsp";
      }

   }

}


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
public class StartController
{
   @Autowired
   private SqlSession sqlSession;
   
   @RequestMapping(value="start.action", method=RequestMethod.GET)
   public String start(Model model)
   {
      return "HarootPuppyMain.jsp";
   }

}
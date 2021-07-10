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
public class WalkRoomViewController
{
	// mybatis 객체 의존성 (자동) 주입
	@Autowired
	private SqlSession sqlSession;
	
	// walkroomview.action 으로 요청이 들어오면 아래의 메소드가 일을 처리
	@RequestMapping(value = "/walkroomview.action", method = RequestMethod.GET)
	public String walkRoomView(ModelMap model) throws SQLException
	{
		String result = null;
		IWalkRoomViewDAO dao = sqlSession.getMapper(IWalkRoomViewDAO.class);
	    
	    model.addAttribute("list", dao.list());
	                                                                                                                                                            
	    
	    /*
	    if dto==null
	    	그런 방 없음-> walkroomlist.action
	    else if (방장일 때)
	    	방장용 입장 jsp
	    else if (방장 아닐 때)
	    	게스트용 입장 jsp
	   	*/
	      
	    return result;
	}


	
}

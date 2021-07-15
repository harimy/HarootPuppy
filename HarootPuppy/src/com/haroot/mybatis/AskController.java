package com.haroot.mybatis;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AskController
{
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value="/asklist.action", method=RequestMethod.GET)
	public String askList(Model model) throws SQLException
	{
		String result = null;
		
		IAskDAO dao = sqlSession.getMapper(IAskDAO.class);
		
		model.addAttribute("askList", dao.askList());
		model.addAttribute("count", dao.count());
		
		result = "/WEB-INF/views/AskList.jsp";
		
		return result;
	}
	
	@RequestMapping(value="/askread.action", method=RequestMethod.GET)
	public String askView(Model model, int ask_code) throws SQLException
	{
		String result = null;
		
		IAskDAO dao = sqlSession.getMapper(IAskDAO.class);
		
		model.addAttribute("read", dao.getReadData(ask_code));
		
		result = "/WEB-INF/views/AskRead.jsp";
		
		return result;
	}
	
	@RequestMapping(value = "askinsertform.action", method = RequestMethod.GET)
	public String askInsertForm(ModelMap model) throws SQLException
	{
		IAskDAO dao = sqlSession.getMapper(IAskDAO.class);
		
		int nextNum = dao.getMaxNum() + 1;
		
		model.addAttribute("nextNum", nextNum);
		//System.out.println("여기 사실 글등록페이지임");
		
		return "/AskInsertForm.jsp";
	}
	
	@RequestMapping(value="/askinsert.action", method=RequestMethod.POST)
	public String askInsert(AskDTO ask) throws SQLException
	{
		IAskDAO dao = sqlSession.getMapper(IAskDAO.class);
		AskDTO dto = new AskDTO();
		
		int ask_code = dao.getMaxNum() + 1;
		dto.setAsk_code(ask_code);
		
		dao.add(ask);
		
		return "redirect:asklist.action";
	}
	
	// 게시글 수정 폼
	@RequestMapping(value="/askupdateform.action", method=RequestMethod.GET)
	public String askUpdateForm(ModelMap model, int ask_code) throws SQLException
	{
		IAskDAO dao = sqlSession.getMapper(IAskDAO.class);
		
		model.addAttribute("ask_code", ask_code);
		model.addAttribute("search", dao.getReadData(ask_code));
		  
		return "AskUpdateForm.jsp";
	}
	
	// 게시글 수정
	@RequestMapping(value="/askupdate.action", method=RequestMethod.POST)
	public String askUpdate(HttpServletRequest request, AskDTO ask) throws SQLException
	{	
		IAskDAO dao = sqlSession.getMapper(IAskDAO.class);
	
		int ask_code = Integer.parseInt(request.getParameter("ask_code"));
		dao.modify(ask);
		
		return "redirect:askread.action?ask_code=" + ask_code;
	}
	
	@RequestMapping(value="/askdelete.action", method=RequestMethod.GET)
	public String askDelete(HttpServletRequest request, AskDTO ask) throws SQLException
	{
		int ask_code = Integer.parseInt(request.getParameter("ask_code"));
		
		IAskDAO dao = sqlSession.getMapper(IAskDAO.class);
		
		dao.remove(ask_code);
		
		return "redirect:asklist.action";
	}
	
	/*
	@RequestMapping
	public String page(HttpServletRequest request, AskDTO ask)
	{
		String pageNum = request.getParameter("pageNum");
		int currentPage = 1;
		
		if(pageNum != null)
			currentPage = Integer.parseInt(pageNum);
		
		String searchKey = request.getParameter("searchKey");
		String searchValue = request.getParameter("searchValue");
		
		MyUtil myUtil = new MyUtil();
		
		IAskDAO dao = new sqlSession.getMapper(IAskDAO.class);
		// 전체 데이터 개수 구하기 
		//int dataCount = dao.getDataCount();
		// 검색 기능 수정 후 매개변수 추가 
		int dataCount = dao.getDataCount(searchKey, searchValue);
		
		// 전체 페이지를 기준으로 총 페이지 수 계산
		int numPerPage = 10;		// 한 페이지에 표시할 데이터 개수 (한 게시판에 게시물 10개 보이도록)
		int totalPage = myUtil.getPageCount(numPerPage, dataCount);
		
		// 전체 페이지 수 보다 표시할 페이지가 큰 경우
		// 표시할 페이지를 전체 페이지로 처리
		// 한 마디로, 데이터를 삭제해서 페이지가 줄었을 경우 
		if (currentPage > totalPage)
			currentPage = totalPage;
		
		// 데이터베이스에서 가져올 시작과 끝 위치
		int start = (currentPage-1) * numPerPage + 1;
		int end = currentPage * numPerPage;
		
		// 실제 리스트 가져오기
		//List<BoardDTO> lists = dao.getLists(start, end);
		// 검색기능 수정 후 매개변수 추가 
		List<BoardDTO> lists = dao.getLists(start, end, searchKey, searchValue);
		
		// 검색 기능 추가 
		// 페이징 처리
		String param = "";
		
		// 검색 기능 추가 → param 구성 
		// 검색 값이 존재한다면 
		if (!searchValue.equals(""))		// 검색값이 존재한다면 
		{
			param += "?searchKey=" + searchKey;
			param += "&searchValue=" + searchValue;
		}
		
		String listUrl = "List.jsp" + param;		// 상대경로 방식 
		String pageIndexList = myUtil.pageIndexList(currentPage, totalPage, listUrl);
		
		// 글 내용 보기 주소 
		String articleUrl = cp + "/Article.jsp";	// 웹app20안에 있는 article.jsp에 접근하겠다.
		
		if(param.equals(""))	// 검색어 없이 전체 출력하는 상황
		{
			articleUrl = articleUrl + "?pageNum=" + currentPage;
		}
		else
		{
			/* param : 검색어 넣는 기능을 위해 사용 */	/*
			articleUrl = articleUrl + param + "&pageNum=" + currentPage;
		}
	}
	*/
	
	
}

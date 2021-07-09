package com.haroot.mybatis;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import org.apache.commons.io.FilenameUtils;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class BoardViewController
{

	@Autowired
	private SqlSession sqlSession;
	
	
	@RequestMapping(value="/boardlist.action", method=RequestMethod.GET)
	public String boardList(Model model)
	{
		String result = null;
		
		IBoardViewDAO dao = sqlSession.getMapper(IBoardViewDAO.class);
		
		//model.addAttribute("count", dao.count());
		model.addAttribute("list", dao.list());
		
		result = "/WEB-INF/views/BoardList.jsp";
		
		return result;
	}
	
	@RequestMapping(value="boardinsertform.action", method=RequestMethod.GET)
	public String boardInsertForm(Model model)
	{
		String result = null;
		
		IBoardViewDAO dao = sqlSession.getMapper(IBoardViewDAO.class);
		
		result = "/WEB-INF/views/BoardInsertForm.jsp";
		
		return result;
	}
	
	@RequestMapping(value="/boardinsert.action", method=RequestMethod.POST)
	public String boardInsert(BoardViewDTO board) throws IOException
	{
		IBoardViewDAO dao = sqlSession.getMapper(IBoardViewDAO.class);
			
		dao.add(board);
		
		//return "redirect:boardview.action";
		
		/*
		String photo = null;
		
		MultipartFile uploadFile = board.getUploadFile();
		
		if(!uploadFile.isEmpty())
		{
			String originalPhoto = uploadFile.getOriginalFilename();
			
			String ext = FilenameUtils.getExtension(originalPhoto);
			UUID uuid = UUID.randomUUID();
			photo=uuid+"."+ext;
			uploadFile.transferTo(new File("/Users/hyeyeonii/Downloads" + photo));
		}
		
		board.setPhoto(photo);
		
		dao.add(board);
		*/
		
		return "redirect:boardlist.action";
		
	}
	
	@RequestMapping(value="/boardview.action", method=RequestMethod.GET)
	public String boardView(Model model, int num, String nickname)
	{
		String result = null;
		
		IBoardViewDAO dao = sqlSession.getMapper(IBoardViewDAO.class);
		
		model.addAttribute("view", dao.view(num, nickname));
		model.addAttribute("commView", dao.commView(num, nickname));
		
		result = "/WEB-INF/views/BoardRead.jsp";
		
		return result;
	}
}

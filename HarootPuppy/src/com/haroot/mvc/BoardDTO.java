/*================
 - BoardDTO.java
=================*/

package com.haroot.mvc;

public class BoardDTO
{
	/*
		NUM WRITER HEAD_CODE TITLE
		CONTENT  PHOTO VIEWNUM LIKENUM CONTENT_DATE CATE_CONTENT BOARD_CODE
		BOARD_WRITER BOARD_CATE_CODE BOARD_TITLE BOARD_CONTENT BOARD_PHOTO 
		BOARD_VIEW BOARD_LIKE BOARD_DATE BOARD_CATE_CONTENT
	*/
	
	private int num, viewNum, likeNum;	// 공지 코드, 조회수, 좋아요 수 
	
	private String writer, head_code, title, content, photo, content_date, cate_content;	
	
	private String  board_writer, board_cate_code, board_title, board_content
				 , board_photo, board_date, board_cate_content;
	
	private int board_code, board_view, board_like;

	
	// getter / setter
	public int getNum()
	{
		return num;
	}

	public void setNum(int num)
	{
		this.num = num;
	}

	public int getViewNum()
	{
		return viewNum;
	}

	public void setViewNum(int viewNum)
	{
		this.viewNum = viewNum;
	}

	public int getLikeNum()
	{
		return likeNum;
	}

	public void setLikeNum(int likeNum)
	{
		this.likeNum = likeNum;
	}

	public String getWriter()
	{
		return writer;
	}

	public void setWriter(String writer)
	{
		this.writer = writer;
	}

	public String getHead_code()
	{
		return head_code;
	}

	public void setHead_code(String head_code)
	{
		this.head_code = head_code;
	}

	public String getTitle()
	{
		return title;
	}

	public void setTitle(String title)
	{
		this.title = title;
	}

	public String getContent()
	{
		return content;
	}

	public void setContent(String content)
	{
		this.content = content;
	}

	public String getPhoto()
	{
		return photo;
	}

	public void setPhoto(String photo)
	{
		this.photo = photo;
	}

	public String getContent_date()
	{
		return content_date;
	}

	public void setContent_date(String content_date)
	{
		this.content_date = content_date;
	}

	public String getCate_content()
	{
		return cate_content;
	}

	public void setCate_content(String cate_content)
	{
		this.cate_content = cate_content;
	}

	public String getBoard_writer()
	{
		return board_writer;
	}

	public void setBoard_writer(String board_writer)
	{
		this.board_writer = board_writer;
	}

	public String getBoard_cate_code()
	{
		return board_cate_code;
	}

	public void setBoard_cate_code(String board_cate_code)
	{
		this.board_cate_code = board_cate_code;
	}

	public String getBoard_title()
	{
		return board_title;
	}

	public void setBoard_title(String board_title)
	{
		this.board_title = board_title;
	}

	public String getBoard_content()
	{
		return board_content;
	}

	public void setBoard_content(String board_content)
	{
		this.board_content = board_content;
	}

	public String getBoard_photo()
	{
		return board_photo;
	}

	public void setBoard_photo(String board_photo)
	{
		this.board_photo = board_photo;
	}

	public String getBoard_date()
	{
		return board_date;
	}

	public void setBoard_date(String board_date)
	{
		this.board_date = board_date;
	}

	public String getBoard_cate_content()
	{
		return board_cate_content;
	}

	public void setBoard_cate_content(String board_cate_content)
	{
		this.board_cate_content = board_cate_content;
	}

	public int getBoard_code()
	{
		return board_code;
	}

	public void setBoard_code(int board_code)
	{
		this.board_code = board_code;
	}

	public int getBoard_view()
	{
		return board_view;
	}

	public void setBoard_view(int board_view)
	{
		this.board_view = board_view;
	}

	public int getBoard_like()
	{
		return board_like;
	}

	public void setBoard_like(int board_like)
	{
		this.board_like = board_like;
	}
	
	
}

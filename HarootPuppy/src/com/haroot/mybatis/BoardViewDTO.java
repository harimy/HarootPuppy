package com.haroot.mybatis;

public class BoardViewDTO
{
	//NUM, WRITER, NICKNAME, HEAD_CODE, TITLE, CONTENT, PHOTO, VIEWNUM, LIKENUM	
	//CONTENT_DATE, CATE_CONTENT, BOARD_COMM_CODE, COMM_WRITER, BOARD_COMM_CONTENT, BOARD_COMM_DATE
	
	private int num, head_code, viewNum, likeNum, board_comm_code;
	
	private String writer, nickname, title, content, photo, content_date
			, cate_content, comm_writer, board_comm_content, board_comm_date;

	public int getNum()
	{
		return num;
	}

	public void setNum(int num)
	{
		this.num = num;
	}

	public int getHead_code()
	{
		return head_code;
	}

	public void setHead_code(int head_code)
	{
		this.head_code = head_code;
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

	public int getBoard_comm_code()
	{
		return board_comm_code;
	}

	public void setBoard_comm_code(int board_comm_code)
	{
		this.board_comm_code = board_comm_code;
	}

	public String getWriter()
	{
		return writer;
	}

	public void setWriter(String writer)
	{
		this.writer = writer;
	}

	public String getNickname()
	{
		return nickname;
	}

	public void setNickname(String nickname)
	{
		this.nickname = nickname;
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

	public String getComm_writer()
	{
		return comm_writer;
	}

	public void setComm_writer(String comm_writer)
	{
		this.comm_writer = comm_writer;
	}

	public String getBoard_comm_content()
	{
		return board_comm_content;
	}

	public void setBoard_comm_content(String board_comm_content)
	{
		this.board_comm_content = board_comm_content;
	}

	public String getBoard_comm_date()
	{
		return board_comm_date;
	}

	public void setBoard_comm_date(String board_comm_date)
	{
		this.board_comm_date = board_comm_date;
	}
	
	
	
}

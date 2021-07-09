package com.haroot.mybatis;

public class BoardCommentDTO
{
//	BOARD_COMM_CODE	BOARD_CODE	BOARD_COMM_WRITER	BOARD_COMM_CONTENT	BOARD_COMM_DATE
	private int board_comm_code, num;
	private String board_code, board_comm_writer, board_comm_content, board_comm_date, nickname;
	
	public int getBoard_comm_code()
	{
		return board_comm_code;
	}
	public void setBoard_comm_code(int board_comm_code)
	{
		this.board_comm_code = board_comm_code;
	}
	public String getBoard_code()
	{
		return board_code;
	}
	public void setBoard_code(String board_code)
	{
		this.board_code = board_code;
	}
	public String getBoard_comm_writer()
	{
		return board_comm_writer;
	}
	public void setBoard_comm_writer(String board_comm_writer)
	{
		this.board_comm_writer = board_comm_writer;
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
	public int getNum()
	{
		return num;
	}
	public void setNum(int num)
	{
		this.num = num;
	}
	public String getNickname()
	{
		return nickname;
	}
	public void setNickname(String nickname)
	{
		this.nickname = nickname;
	}
	
	
}

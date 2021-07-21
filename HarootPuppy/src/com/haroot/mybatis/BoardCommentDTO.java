package com.haroot.mybatis;

public class BoardCommentDTO
{
	private int board_comm_code;		// 댓글 코드
	private int board_code;				// 게시글 코드
	private String board_comm_writer;	// 댓글 작성자
	private String board_comm_content;	// 댓글 내용 
	private String board_comm_date;		// 댓글 작성일
	
	
	
	// getter / setter
	public int getBoard_comm_code()
	{
		return board_comm_code;
	}
	public void setBoard_comm_code(int board_comm_code)
	{
		this.board_comm_code = board_comm_code;
	}
	public int getBoard_code()
	{
		return board_code;
	}
	public void setBoard_code(int board_code)
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
	
	
	
}

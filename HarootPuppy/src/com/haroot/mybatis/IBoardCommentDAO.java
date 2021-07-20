package com.haroot.mybatis;

import java.sql.SQLException;
import java.util.ArrayList;


public interface IBoardCommentDAO
{
	// 댓글 리스트 출력
	public ArrayList<BoardCommentDTO> listComm() throws SQLException;
	
	// 댓글 입력
	public int insertComment(BoardCommentDTO boardComm) throws SQLException;
	
	// 댓글 수정
	public int updateComment(BoardCommentDTO boardComm) throws SQLException;
	
	// 댓글 삭제
	public int deleteComment(int board_comm_code) throws SQLException;
	
	// 댓글 개수
	public int countComment() throws SQLException;
}

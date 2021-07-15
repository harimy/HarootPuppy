/*================
 - IBoardDAO.java
=================*/

package com.haroot.mybatis;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface IBoardDAO
{
	// 게시글 수 확인
	public int count();
	
	// 게시글 번호의 최대값
	public int getMaxNum() throws SQLException;
	
	// 게시글 리스트 확인
	public ArrayList<BoardDTO> list() throws SQLException;
	
	// 게시글 조회
	//	public BoardDTO view(HashMap<String, Object> map);
	public BoardDTO view(@Param("board_code") int board_code, @Param("board_writer") String board_writer) throws SQLException;

	// 게시글 추가
	public int add(BoardDTO board) throws SQLException;
	
	// 게시글 검색
	public BoardDTO search(String searchKey, String searchValue) throws SQLException;
	
	// 게시글 수정 
	public int modify(BoardDTO board) throws SQLException;
	
	// 게시글 삭제
	public int remove(BoardDTO board) throws SQLException;
	
	// 특정 영역(시작번호 ~ 끝번호)의 게시물의 목록을 읽어오는 메소드 정의 
	public ArrayList<BoardDTO> getLists(int start, int end, String searchKey, String searchValue) throws SQLException;

	// 검색된 게시물의 수
	public int getDataCount(String searchKey, String searchValue) throws SQLException;
	
	// 특정 게시물 조회에 따른 조회수 증가 
	public int updateView(int board_code) throws SQLException;
	
	// 특정 게시물의 내용을 읽어오는 메소드 정의
	public BoardDTO getReadData(@Param("board_code") int board_code, @Param("board_writer") String board_writer) throws SQLException;
	
	// 이전 게시물 번호
	public int getBeforeNum(int board_code) throws SQLException;
	
	// 다음 게시물 번호
	public int getNextNum(int board_code) throws SQLException;
	

	
}

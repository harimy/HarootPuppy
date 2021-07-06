/*================
 - IBoardDAO.java
=================*/

package com.haroot.mybatis;

import java.util.ArrayList;
import java.util.List;


public interface IBoardDAO
{
	// 게시글 수 확인
	public int count();
	
	// 게시글 번호의 최대값
	public int getMaxNum();
	
	// 게시글 리스트 확인
	public ArrayList<BoardDTO> list();
	
	// 게시글 추가
	public int add(BoardDTO board);
	
	// 게시글 검색
	public BoardDTO search(String searchKey, String searchValue);
	
	// 게시글 수정 
	public int modify(BoardDTO board);
	
	// 게시글 삭제
	public int remove(BoardDTO board);
	
	// 특정 영역(시작번호 ~ 끝번호)의 게시물의 목록을 읽어오는 메소드 정의 
	public ArrayList<BoardDTO> getLists(int start, int end, String searchKey, String searchValue);

	// 검색된 게시물의 수
	public int getDataCount(String searchKey, String searchValue);
	
	// 특정 게시물 조회에 따른 조회수 증가 
	public int updateView(int num);
	
	// 특정 게시물의 내용을 읽어오는 메소드 정의
	public BoardDTO getReadData(int num);
	
	// 이전 게시물 번호
	public int getBeforeNum(int num);
	
	// 다음 게시물 번호
	public int getNextNum(int num);
	
}

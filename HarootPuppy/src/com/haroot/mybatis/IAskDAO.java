/*================
 - IAskDAO.java
=================*/

package com.haroot.mybatis;

import java.sql.SQLException;
import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

public interface IAskDAO
{
	// 관리자용 안읽은 고객문의 수 확인
	public int askNotRead() throws SQLException;
	
	// 게시글 수 확인
	public int count();
	
	// 게시글 번호의 최대값
	public int getMaxNum();
	
	// 게시글 리스트 확인
	public ArrayList<AskDTO> askList();
	
	// 게시글 추가
	public int add(AskDTO ask);
	
	// 게시글 검색
	public AskDTO search(String searchKey, String searchValue);
	
	// 게시글 수정 
	public int modify(AskDTO ask);
	
	// 게시글 삭제
	public int remove(AskDTO ask);
	
	// 특정 영역(시작번호 ~ 끝번호)의 게시물의 목록을 읽어오는 메소드 정의 
	public ArrayList<AskDTO> getLists(int start, int end, String searchKey, String searchValue);

	// 검색된 게시물의 수
	public int getDataCount(String searchKey, String searchValue);
	
	// 특정 게시물 조회에 따른 조회수 증가 
	public int updateView(int ask_code);
	
	// 특정 게시물의 내용을 읽어오는 메소드 정의
	public AskDTO getReadData(int ask_code);
	
	// 이전 게시물 번호
	public int getBeforeNum(int ask_code);
	
	// 다음 게시물 번호
	public int getNextNum(int ask_code);

}

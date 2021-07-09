/*================
 - IMemberDAO.java
=================*/

package com.haroot.mybatis;

import java.sql.SQLException;
import java.util.ArrayList;

import java.util.List;

import org.apache.ibatis.annotations.Param;


public interface IMemberDAO
{
	// 회원 수 확인
	public int count();
	
	// 회원 번호의 최대값
	public int getMaxNum();
	
	// 회원 리스트 확인
	public ArrayList<MemberDTO> list();
	
	// 회원 데이터 추가
	public int add(MemberDTO member);
	
	
	// mem_code → sid_code 로 수정
	// 회원 검색 - 회원번호 
	public MemberDTO search(String sid_code);
	
	// 특정 영역(시작번호 ~ 끝번호)의 게시물의 목록을 읽어오는 메소드 정의 
	// public ArrayList<MemberDTO> getLists(int start, int end, String searchKey, String searchValue);
	
	// 회원 검색 - 회원번호, 이름, 아이디 로 검색 가능
	public MemberDTO search(String searchKey, String searchValue);

	
	// 회원 수정 
	public int modify(MemberDTO member);
	
	// 회원 삭제
	public int remove(MemberDTO member);
	
	
	// sid 테이블 추가
	public int addSid(String mem_code);
	
	// WALK_AGREE 테이블 추가
	public int agree(String mem_code);	

	// 로그인
	public MemberDTO login(@Param("mem_id") String mem_id, @Param("mem_pw") String mem_pw) throws SQLException;

	// 아별 추가
	// 계정상태가 정상인 회원 리스트 조회(강제탈퇴, 일시정지 제외)
	public ArrayList<MemberDTO> normalList();
		
}


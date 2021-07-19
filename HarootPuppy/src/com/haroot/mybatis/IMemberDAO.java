/*================
 - IMemberDAO.java
=================*/

package com.haroot.mybatis;

import java.sql.SQLException;
import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;


public interface IMemberDAO
{
	// 회원 수 확인
	public int count() throws SQLException;
	
	// 회원 번호의 최대값
	public int getMaxNum() throws SQLException;
	
	// 회원 리스트 확인
	public ArrayList<MemberDTO> list() throws SQLException;
	
	// 회원 데이터 추가
	public int add(MemberDTO member) throws SQLException;
	
	
	// mem_code → sid_code 로 수정
	// 회원 검색 - 회원번호 
	public MemberDTO search(String sid_code) throws SQLException;
	
	// 특정 영역(시작번호 ~ 끝번호)의 게시물의 목록을 읽어오는 메소드 정의 
	// public ArrayList<MemberDTO> getLists(int start, int end, String searchKey, String searchValue);
	
	// 회원 검색 - 회원번호, 이름, 아이디 로 검색 가능
	public MemberDTO search(String searchKey, String searchValue) throws SQLException;

	
	// 회원 수정 
	public int modify(MemberDTO member) throws SQLException;
	
	// 회원 삭제 (sid_code → mem_code)
	public int remove(String mem_code) throws SQLException;
	
	
	// sid 테이블 추가
	public int addSid(String mem_code) throws SQLException;
	
	// WALK_AGREE 테이블 추가
	public int agree(String mem_code) throws SQLException;	

	// 로그인
	public MemberDTO loginMem(@Param("mem_id") String mem_id, @Param("mem_pw") String mem_pw) throws SQLException;

	// 아별 추가
	// 계정상태가 정상인 회원 리스트 조회(강제탈퇴, 일시정지 제외)
	public ArrayList<MemberDTO> normalList() throws SQLException;
	
	// 나현  로그인 후 화면에서 닉네임 노출
	public String searchNickName(String sid_code);
	
	// 아별 추가(7.19)
	// 계정상태가 정상인 회원수 조회
	public int normalCount() throws SQLException;

		
}


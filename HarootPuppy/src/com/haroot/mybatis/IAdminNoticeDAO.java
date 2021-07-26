package com.haroot.mybatis;

import java.sql.SQLException;
import java.util.ArrayList;

public interface IAdminNoticeDAO
{
	// 공지코드 최대 숫자 구하기
	public int getMaxNum() throws SQLException;
	
	// 공지글 입력
	public int add(AdminNoticeDTO dto) throws SQLException;
	
	// 공지 리스트 출력
	public ArrayList<AdminNoticeDTO> list() throws SQLException;
	
	// 공지글 보기
	public AdminNoticeDTO view(String notice_code) throws SQLException;
	
	// 공지글 수정
	public int modify(AdminNoticeDTO dto) throws SQLException;
	
	// 공지글 삭제
	public int remove(String notice_code) throws SQLException;
	

}

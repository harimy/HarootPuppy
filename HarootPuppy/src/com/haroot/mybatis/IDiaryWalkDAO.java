package com.haroot.mvc;

import java.sql.SQLException;
import java.util.ArrayList;

public interface IDiaryWalkDAO
{
	// 산책 입력 (추가)
	public int addWalk(DiaryWalkDTO walkDto) throws SQLException;
	
	// 산책 수정
	public int modifyWalk(DiaryWalkDTO walkDto) throws SQLException;
	
	// 산책 삭제
	public int deleteWalk(DiaryWalkDTO walkDto) throws SQLException;
	
	// 산책 데이터 리스트 출력
	public ArrayList<DiaryWalkDTO> list() throws SQLException;
	   
	// 산책 데이터 확인(bath_code를 활용하여 배변 정보 검색)
	public DiaryWalkDTO searchSnack(String walkDto) throws SQLException;
}

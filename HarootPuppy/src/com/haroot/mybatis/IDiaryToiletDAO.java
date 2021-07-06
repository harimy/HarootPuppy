package com.haroot.mybatis;

import java.sql.SQLException;
import java.util.ArrayList;

public interface IDiaryToiletDAO
{
	// 배변 데이터 리스트 출력
	public ArrayList<DiaryToiletDTO> list() throws SQLException;
	// 출력 데이터 추가
	public int add(DiaryToiletDTO diaryToiletDTO) throws SQLException;
	
	// 배변 데이터 수정
	public int modify(DiaryToiletDTO diaryToiletDTO) throws SQLException;
	
	// 배변 데이터 확인(Toilet_code를 활용하여 배변 정보 검색)
	public DiaryToiletDTO search(String toilet_code);
	
	// 배변 데이터 삭제 
	public int remove(String toilet_code);
	
	
}

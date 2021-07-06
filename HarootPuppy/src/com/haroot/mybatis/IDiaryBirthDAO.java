package com.haroot.mybatis;

import java.sql.SQLException;
import java.util.ArrayList;

public interface IDiaryBirthDAO
{
	// 출산 데이터 리스트 출력
	public ArrayList<DiaryBirthDTO> list() throws SQLException;
	
	// 출력 데이터 추가
	public int add(DiaryBirthDTO diaryBirthDTO) throws SQLException;
	
	// 출산 데이터 수정
	public int modify(DiaryBirthDTO diaryBirthDTO) throws SQLException;
	
	// 출산 데이터 확인(birth_code를 활용하여 출산 정보 검색) → modify() 쓸 때 사용
	public DiaryBirthDTO search(String birth_code);
	
	// 출산 데이터 삭제 
	public int remove(String birth_code);
		
	
}

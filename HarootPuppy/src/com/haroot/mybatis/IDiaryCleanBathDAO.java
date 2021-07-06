package com.haroot.mybatis;

import java.sql.SQLException;
import java.util.ArrayList;

public interface IDiaryCleanBathDAO
{
	// 목욕 입력 (추가)
	public int addBath(DiaryCleanBathDTO bathDto) throws SQLException;
	
	// 목욕 수정
	public int modifyBath(DiaryCleanBathDTO bathDto) throws SQLException;
	
	// 목욕 삭제
	public int deleteBath(DiaryCleanBathDTO bathDto) throws SQLException;
	
	// 목욕 데이터 리스트 출력
	public ArrayList<DiaryCleanBathDTO> list() throws SQLException;
	   
	// 목욕 데이터 확인(bath_code를 활용하여 배변 정보 검색)
	public DiaryCleanBathDTO searchBath(String bath_code) throws SQLException;

	
}

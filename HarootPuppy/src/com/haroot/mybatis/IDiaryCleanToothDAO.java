package com.haroot.mvc;

import java.sql.SQLException;
import java.util.ArrayList;

public interface IDiaryCleanToothDAO
{
	// 양치 입력 (추가)
	public int addTooth(DiaryCleanToothDTO toothDto) throws SQLException;
	
	// 양치 수정
	public int modifyTooth(DiaryCleanToothDTO toothDto) throws SQLException;
	
	// 양치 삭제
	public int deleteTooth(DiaryCleanToothDTO toothDto) throws SQLException;
	
	// 양치 데이터 리스트 출력
	public ArrayList<DiaryCleanToothDTO> list() throws SQLException;
	   
	// 양치 데이터 확인(bath_code를 활용하여 배변 정보 검색)
	public DiaryCleanToothDTO searchTooth(String toothDto) throws SQLException;
}

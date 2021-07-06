package com.haroot.mybatis;

import java.sql.SQLException;
import java.util.ArrayList;

public interface IDiaryStateDAO
{
	// 상태 입력 (추가)
	public int addState(DiaryStateDTO stateDto) throws SQLException;
	
	// 상태 수정
	public int modifyState(DiaryStateDTO stateDto) throws SQLException;
	
	// 상태 삭제
	public int deleteState(DiaryStateDTO stateDto) throws SQLException;
	
	// 상태 데이터 리스트 출력
	public ArrayList<DiaryStateDTO> list() throws SQLException;
	   
	// 상태 데이터 확인(bath_code를 활용하여 배변 정보 검색)
	public DiaryStateDTO searchSnack(String stateDto) throws SQLException;
}

package com.haroot.mvc;

import java.sql.SQLException;
import java.util.ArrayList;

public interface IDiaryCleanEarDAO
{
	// 귀청소 입력 (추가)
	public int addEar(DiaryCleanEarDTO earDto) throws SQLException;
	
	// 귀청소 수정
	public int modifyEar(DiaryCleanEarDTO earDto) throws SQLException;
	
	// 귀청소 삭제
	public int deleteEar(DiaryCleanEarDTO earDto) throws SQLException;
	
	// 귀청소 데이터 리스트 출력
	public ArrayList<DiaryCleanEarDTO> list() throws SQLException;
	   
	// 귀청소 데이터 확인(bath_code를 활용하여 배변 정보 검색)
	public DiaryCleanEarDTO searchEar(String earDto) throws SQLException;

}

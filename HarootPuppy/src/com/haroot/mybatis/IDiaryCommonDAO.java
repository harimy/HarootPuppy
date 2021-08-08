package com.haroot.mybatis;

import java.sql.SQLException;
import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

public interface IDiaryCommonDAO
{
	// 공통 입력 (추가)
	public int addCommon(@Param("common_code") String common_code 
						, @Param("common_start") String common_start 
						, @Param("common_end") String common_end
						, @Param("common_memo") String common_memo
						, @Param("common_photo") String common_photo
						, @Param("daily_code") String daily_code) throws SQLException;
	
	// COMMON_CODE의 MAX 값 구하기
	public int max() throws SQLException;
	
	// 공통 수정
	public int modifyCommon(DiaryCommonDTO commonDto) throws SQLException;
	
	// 공통 삭제
	public int deleteCommon(DiaryCommonDTO commonDto) throws SQLException;
	
	// 공통 데이터 리스트 출력
	public ArrayList<DiaryCommonDTO> list() throws SQLException;
	   
	// 공통 데이터 확인(bath_code를 활용하여 배변 정보 검색)
	public DiaryCommonDTO searchCommon(String commonDto) throws SQLException;
}

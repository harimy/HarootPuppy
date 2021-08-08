package com.haroot.mybatis;

import java.sql.SQLException;
import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

public interface IDiaryDailyDAO
{
	// 일일 입력 (추가)
	public int addDaily(@Param("relation_code") String relation_code, @Param("daily_code") String daily_code
					, @Param("daily_date") String daily_date) throws SQLException;
	
	// DAILY_CODE의 MAX 값 구하기
	public int max() throws SQLException;
	
	// COUNT (입력 시의 조건 : REL_CODE , SYSDATE 존재 시 입력X)
	public int count(@Param("relation_code") String relation_code, @Param("daily_date") String daily_date) throws SQLException;

	
	// daily_code 검색 (relation_code & daily_date 존재 시)
	public String search_dailycode(@Param("relation_code") String relation_code, 
								@Param("daily_date") String daily_date) throws SQLException;
	
	// 일일 수정
	public int modifyDaily(DiaryDailyDTO dailyDto) throws SQLException;
	
	// 일일 삭제
	public int deleteDaily(DiaryDailyDTO dailyDto) throws SQLException;
	
	// 일일 데이터 리스트 출력
	public ArrayList<DiaryDailyDTO> list() throws SQLException;
	   
	// 일일 데이터 확인(bath_code를 활용하여 배변 정보 검색)
	public DiaryDailyDTO searchDaily(String dailyDto) throws SQLException;
}

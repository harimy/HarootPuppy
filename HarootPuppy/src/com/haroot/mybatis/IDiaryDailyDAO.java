package com.haroot.mybatis;

import java.sql.SQLException;
import java.util.ArrayList;

public interface IDiaryDailyDAO
{
	// 일일 입력 (추가)
	public int addDaily(String pet_code) throws SQLException;
	
	// daily_code 검색 (pet_code로)
	public String search_dailyCode(String pet_code) throws SQLException;
	
	// 일일 수정
	public int modifyDaily(DiaryDailyDTO dailyDto) throws SQLException;
	
	// 일일 삭제
	public int deleteDaily(DiaryDailyDTO dailyDto) throws SQLException;
	
	// 일일 데이터 리스트 출력
	public ArrayList<DiaryDailyDTO> list() throws SQLException;
	   
	// 일일 데이터 확인(bath_code를 활용하여 배변 정보 검색)
	public DiaryDailyDTO searchDaily(String dailyDto) throws SQLException;
}

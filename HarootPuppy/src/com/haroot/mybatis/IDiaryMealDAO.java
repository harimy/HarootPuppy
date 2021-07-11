package com.haroot.mybatis;

import java.sql.SQLException;
import java.util.ArrayList;

public interface IDiaryMealDAO
{
	// 식사 입력 (추가)
	public int addMeal(DiaryMealDTO mealDto) throws SQLException;
	
	// 식사 수정
	public int modifyMeal(DiaryMealDTO mealDto) throws SQLException;
	
	// 식사 삭제
	public int deleteMeal(DiaryMealDTO mealDto) throws SQLException;
	
	// 식사 데이터 리스트 출력
	public ArrayList<DiaryMealDTO> list() throws SQLException;
	  	
	// timeline에 출력하기 위한 정보들 정리
	public DiaryMealDTO timelineView() throws SQLException;
}

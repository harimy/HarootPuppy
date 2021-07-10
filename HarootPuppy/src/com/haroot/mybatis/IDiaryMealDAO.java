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
	   
	// 식사 데이터 확인(bath_code를 활용하여 배변 정보 검색)
	public DiaryMealDTO searchMeal(String mealDto) throws SQLException;
	
	// pet_code 찾기
	public String search_petCode (String pet_code) throws SQLException;
}

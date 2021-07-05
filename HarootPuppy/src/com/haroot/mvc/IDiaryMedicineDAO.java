package com.haroot.mvc;

import java.sql.SQLException;
import java.util.ArrayList;

public interface IDiaryMedicineDAO
{
	// 복약 데이터 리스트 출력
	public ArrayList<DiaryMedicineDTO> list() throws SQLException;
	
	// 복약 데이터 추가
	public int add(DiaryMedicineDTO diaryMedicineDTO) throws SQLException;
	
	// 복약 데이터 수정
	public int modify(DiaryMedicineDTO diaryMedicineDTO) throws SQLException;
	
	// 복약 데이터 확인(medicine_code를 활용하여 복약 정보 검색)
	public DiaryMedicineDTO search(String medicine_code);
	
	// 복약 데이터 삭제 
	public int remove(String medicine_code);
	
}

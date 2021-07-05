package com.haroot.mvc;

import java.sql.SQLException;
import java.util.ArrayList;

public interface IDiarySnackDAO
{
	// 간식 입력 (추가)
	public int addSnack(DiarySnackDTO snackDto) throws SQLException;
	
	// 간식 수정
	public int modifySnack(DiarySnackDTO snackDto) throws SQLException;
	
	// 간식 삭제
	public int deleteSnack(DiarySnackDTO snackDto) throws SQLException;
	
	// 간식 데이터 리스트 출력
	public ArrayList<DiarySnackDTO> list() throws SQLException;
	   
	// 간식 데이터 확인(bath_code를 활용하여 배변 정보 검색)
	public DiarySnackDTO searchSnack(String snackDto) throws SQLException;
}

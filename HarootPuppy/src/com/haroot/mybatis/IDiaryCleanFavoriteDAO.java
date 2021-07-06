package com.haroot.mybatis;

import java.sql.SQLException;
import java.util.ArrayList;

public interface IDiaryCleanFavoriteDAO
{
	// 청결 즐겨찾기 입력 (추가)
	public int addCleanFavorite(DiaryCleanFavoriteDTO cleanfavoriteDto);
	
	// 청결 즐겨찾기 수정
	public int modifyCleanFavorite(DiaryCleanFavoriteDTO cleanfavoriteDto);
	
	// 청결 즐겨찾기 삭제
	public int deleteCleanFavorite(DiaryCleanFavoriteDTO cleanfavoriteDto);
	
	// 청결 즐겨찾기 데이터 리스트 출력
	public ArrayList<DiaryCleanFavoriteDTO> list() throws SQLException;
	   
	// 청결 즐겨찾기 데이터 확인(bath_code를 활용하여 배변 정보 검색)
	public DiaryCleanFavoriteDTO searchCleanFavorite(String cleanfavoriteDto) throws SQLException;
}

package com.haroot.mvc;

import java.sql.SQLException;
import java.util.ArrayList;

public interface IDiaryFavoriteDAO
{
	// 즐겨찾기 입력 (추가)
	public int addFavorite(DiaryFavoriteDTO favoriteDto) throws SQLException;
	
	// 즐겨찾기 수정
	public int modifyFavorite(DiaryFavoriteDTO favoriteDto) throws SQLException;
	
	// 즐겨찾기 삭제
	public int deleteFavorite(DiaryFavoriteDTO favoriteDto) throws SQLException;
	
	// 즐겨찾기 데이터 리스트 출력
	public ArrayList<DiaryFavoriteDTO> list() throws SQLException;
	   
	// 즐겨찾기 데이터 확인(bath_code를 활용하여 배변 정보 검색)
	public DiaryFavoriteDTO searchFavorite(String favoriteDto) throws SQLException;
}

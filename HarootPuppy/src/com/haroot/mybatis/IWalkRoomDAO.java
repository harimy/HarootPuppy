package com.haroot.mybatis;

import java.sql.SQLException;
import java.util.ArrayList;

public interface IWalkRoomDAO
{
	// 산책방 전체 조회 메소드 
	public ArrayList<WalkRoomDTO> list() throws SQLException;
	
	// 산책방 개수 조회 메소드
	public int count() throws SQLException;
	
	// 산책방 추가 메소드
	public int add(WalkRoomDTO dto) throws SQLException;
	
	// 산책방 수정 메소드
	public int modify(WalkRoomDTO dto) throws SQLException;
	
	// 산책방 삭제 메소드 
	public int remove(int walkroom_code) throws SQLException;
	
	// 산책방 조건 검색 
	// 반경을 조건 검색 메소드 필요함 -> 지도 api 완성하고 구성할 예정
	// 산책 출발 시간 조건 검색 메소드 필요
	
	// 중성화 여부 조건 검색 메소드	
	// 입질 여부 조건 검색 메소드
	// 양육자 성별 조건 검색 메소드
	public WalkRoomDTO searchWalkRoom(String searchKey, String searchValue) throws SQLException;
	
	
}

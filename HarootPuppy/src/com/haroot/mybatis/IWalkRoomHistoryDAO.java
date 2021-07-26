package com.haroot.mybatis;

import java.sql.SQLException;
import java.util.ArrayList;

public interface IWalkRoomHistoryDAO
{
	// 신청 완료인 산책방 리스트 조회
	public ArrayList<WalkRoomViewDTO> applyList(String sid_code) throws SQLException;
	
	// 산책 예정인 산책방 리스트 조회
	public ArrayList<WalkRoomViewDTO> scheduledList(String sid_code) throws SQLException;
	
	// 산책 완료인 산책방 리스트 조회
	public ArrayList<WalkRoomViewDTO> finishedList(String sid_code) throws SQLException;
}

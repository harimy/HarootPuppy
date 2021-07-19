package com.haroot.mybatis;

import java.sql.SQLException;
import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

public interface IWalkRoomViewDAO {
	
	// 각 방 참여자들 정보 조회 메소드
	public ArrayList<WalkRoomViewDTO> list(int walkroom_code) throws SQLException;	

	// 해당 방, 해당 유저 정보 조회 메소드
	public WalkRoomViewDTO search(@Param("walkroom_code") int walkroom_code, @Param("participants_code") String participants_code) throws SQLException;
}

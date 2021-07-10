package com.haroot.mybatis;

import java.sql.SQLException;
import java.util.ArrayList;

public interface IWalkRoomViewDAO {
	
	// 각 방 참여자들 정보 조회 메소드
	public ArrayList<WalkRoomViewDTO> list() throws SQLException;	

}

package com.haroot.mybatis;

import java.sql.SQLException;
import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

public interface IWalkRoomEnterCheckViewDAO
{
	// 특정 산책방에 참여한 회원들 리스트 조회
	public ArrayList<WalkRoomEnterCheckViewDTO> participants_list(int walkroom_code) throws SQLException;
	
	// 특정 산책방에 특정 회원이 참여했는지 여부
	public int search_room_sid(@Param("walkroom_code") int walkroom_code, @Param("sid_code") String sid_code) throws SQLException;
	
	// 특정 산책방에 특정 회원이 특정 반려견과 참여했는지 여부
	public int search_room_sid_rel(@Param("walkroom_code") int walkroom_code, @Param("sid_code") String sid_code, @Param("relation_code") String relation_code) throws SQLException;
}

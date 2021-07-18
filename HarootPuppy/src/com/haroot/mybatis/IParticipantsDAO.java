package com.haroot.mybatis;

import java.sql.SQLException;

import org.apache.ibatis.annotations.Param;

public interface IParticipantsDAO
{
	// 산책 참여자 추가 → 방 생성시 방장, 방 참여시 참여자 insert
	public int add(ParticipantsDTO dto) throws SQLException;
	
	
	public int addGuest(ParticipantsDTO dto) throws SQLException;
	
	// participants_code 최대값 받아오기(숫자만)
	public int max() throws SQLException;
	
	// PARTICIPANTS_CODE 조회용 메소드
	public ParticipantsDTO search(@Param("walkroom_code") int walkroom_code, @Param("relation_code") String relation_code) throws SQLException;
	
	// 레디 고정 옵션 변경
	public int modifyReadyOption(@Param("readyoption_code") String readyoption_code, @Param("participants_code") String participants_code) throws SQLException;
	
	// 레디 상태 변경
	public int modifyReadyState(String readystate_code) throws SQLException;
	
}

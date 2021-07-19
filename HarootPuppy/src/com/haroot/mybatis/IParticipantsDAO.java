package com.haroot.mybatis;

import java.sql.SQLException;

import org.apache.ibatis.annotations.Param;

public interface IParticipantsDAO
{
	// 산책방 추가시 방장 추가
	public int add(ParticipantsDTO dto) throws SQLException;
	
	// 산책방 입장시 참여자 추가
	public int addGuest(ParticipantsDTO dto) throws SQLException;
	
	// 방장 아닌 참여자 방 나가기
	public int exitWalkRoom(String participants_code) throws SQLException;
	
	// participants_code 최대값 받아오기(숫자만)
	public int max() throws SQLException;
	
	// PARTICIPANTS_CODE 조회용 메소드
	public ParticipantsDTO search(@Param("walkroom_code") int walkroom_code, @Param("relation_code") String relation_code) throws SQLException;
	
	// 레디 고정 옵션 변경
	public int modifyReadyOption(@Param("readyoption_code") String readyoption_code, @Param("participants_code") String participants_code) throws SQLException;
	
	// 레디 상태 변경
	public int modifyReadyState(@Param("readystate_code") String readystate_code, @Param("participants_code") String participants_code) throws SQLException;
	
}

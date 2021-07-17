package com.haroot.mybatis;

import java.sql.SQLException;

public interface IParticipantsDAO
{
	// 산책 참여자 추가 → 방 생성시 방장, 방 참여시 참여자 insert
	public int add(ParticipantsDTO dto) throws SQLException;
	
	// participants_code 최대값 받아오기(숫자만)
	public int max() throws SQLException;
	
}

package com.haroot.mybatis;

import java.sql.SQLException;
import java.util.ArrayList;

public interface IMatchDAO
{
	// 매칭코드 최대값 구하는 메소드
	public int max() throws SQLException;
	
	// 매칭시 매칭테이블에 추가하는 메소드
	public int add(MatchDTO dto) throws SQLException;
	
	// 해당 산책방의 최소 인원 구하는 메소드
	public int minMem(int walkroom_code) throws SQLException;
	
	// 해당 산책방의 현재 인원 구하는 메소드
	public int currentMem(int walkroom_code) throws SQLException;
	
	// 참여자들의 레디 상태 조회하는 메소드
	public int readyStateCheck(int walkroom_code) throws SQLException;
	
	// 해당 산책방의 매칭상태 확인하는 메소드
	public int matchStateCheck(int walkroom_code) throws SQLException;
	
	// 매칭 취소 시 매칭테이블에서 삭제하는 메소드
	public int remove(int walkroom_code) throws SQLException;
	
}

package com.haroot.mybatis;

import java.sql.SQLException;

import org.apache.ibatis.annotations.Param;

public interface IRelationDAO
{	
	// 양육관계 조회(sid_code, pet_code로)
	public RelationDTO list(@Param("sid_code") String sid_code, @Param("pet_code") String pet_code) throws SQLException;
	
	// 양육관계 입력 (추가)
	public int addRelation(RelationDTO relationDto);
	
	// 양육관계 수정
	public int modifyRelation(RelationDTO relationDto);
	
	// 양육관계  삭제
	public int deleteRelation(RelationDTO relationDto);
}

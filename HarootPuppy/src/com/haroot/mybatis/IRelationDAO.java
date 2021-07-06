package com.haroot.mvc;

public interface IRelationDAO
{
	// 양육관계 입력 (추가)
	public int addRelation(RelationDTO relationDto);
	
	// 양육관계 수정
	public int modifyRelation(RelationDTO relationDto);
	
	// 양육관계  삭제
	public int deleteRelation(RelationDTO relationDto);
}

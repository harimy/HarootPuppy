package com.haroot.mybatis;

public class WalkRoomEnterCheckViewDTO
{
	// 속성값 구성
	private int walkroom_code;
	private String walkroom_leader, participants_code
		  , relation_code, sid_code, pet_code;
	
	// getter / setter 구성
	public int getWalkroom_code()
	{
		return walkroom_code;
	}
	public void setWalkroom_code(int walkroom_code)
	{
		this.walkroom_code = walkroom_code;
	}
	public String getWalkroom_leader()
	{
		return walkroom_leader;
	}
	public void setWalkroom_leader(String walkroom_leader)
	{
		this.walkroom_leader = walkroom_leader;
	}
	public String getParticipants_code()
	{
		return participants_code;
	}
	public void setParticipants_code(String participants_code)
	{
		this.participants_code = participants_code;
	}
	public String getRelation_code()
	{
		return relation_code;
	}
	public void setRelation_code(String relation_code)
	{
		this.relation_code = relation_code;
	}
	public String getSid_code()
	{
		return sid_code;
	}
	public void setSid_code(String sid_code)
	{
		this.sid_code = sid_code;
	}
	public String getPet_code()
	{
		return pet_code;
	}
	public void setPet_code(String pet_code)
	{
		this.pet_code = pet_code;
	}
	
}

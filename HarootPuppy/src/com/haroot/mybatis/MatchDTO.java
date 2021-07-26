package com.haroot.mybatis;

public class MatchDTO
{
	// 속성값 구성
	private String match_code, match_date;
	private int walkroom_code;
	
	// getter / setter 구성
	public String getMatch_code()
	{
		return match_code;
	}
	public void setMatch_code(String match_code)
	{
		this.match_code = match_code;
	}
	public String getMatch_date()
	{
		return match_date;
	}
	public void setMatch_date(String match_date)
	{
		this.match_date = match_date;
	}
	public int getWalkroom_code()
	{
		return walkroom_code;
	}
	public void setWalkroom_code(int walkroom_code)
	{
		this.walkroom_code = walkroom_code;
	}
	
}

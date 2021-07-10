package com.haroot.mybatis;

public class ParticipantsDTO
{
	// 속성값 구성
	private int walkroom_code;
	
	private String participants_code, relation_code
		, readyoption_code, readystate_code, readyoption_content, readystate_content
		, participants_start;

	// getter / setter 구성
	public String getParticipants_code()
	{
		return participants_code;
	}

	public void setParticipants_code(String participants_code)
	{
		this.participants_code = participants_code;
	}

	public int getWalkroom_code()
	{
		return walkroom_code;
	}

	public void setWalkroom_code(int walkroom_code)
	{
		this.walkroom_code = walkroom_code;
	}

	public String getRelation_code()
	{
		return relation_code;
	}

	public void setRelation_code(String relation_code)
	{
		this.relation_code = relation_code;
	}

	public String getReadyoption_code()
	{
		return readyoption_code;
	}

	public void setReadyoption_code(String readyoption_code)
	{
		this.readyoption_code = readyoption_code;
	}

	public String getReadystate_code()
	{
		return readystate_code;
	}

	public void setReadystate_code(String readystate_code)
	{
		this.readystate_code = readystate_code;
	}

	public String getReadyoption_content()
	{
		return readyoption_content;
	}

	public void setReadyoption_content(String readyoption_content)
	{
		this.readyoption_content = readyoption_content;
	}

	public String getReadystate_content()
	{
		return readystate_content;
	}

	public void setReadystate_content(String readystate_content)
	{
		this.readystate_content = readystate_content;
	}

	public String getParticipants_start()
	{
		return participants_start;
	}

	public void setParticipants_start(String participants_start)
	{
		this.participants_start = participants_start;
	}
	
	
}

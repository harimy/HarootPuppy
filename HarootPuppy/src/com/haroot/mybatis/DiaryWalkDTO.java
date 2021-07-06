package com.haroot.mybatis;

public class DiaryWalkDTO
{
	// 속성 
	private DiaryCommonDTO commonDto;	// 공통항목 속성
	private String walk_code		// 산책입력코드
			, walk_weather			// 날씨
			, walk_place;			// 산책장소

	// getter / setter 생성
	public String getWalk_code()
	{
		return walk_code;
	}

	public void setWalk_code(String walk_code)
	{
		this.walk_code = walk_code;
	}

	public String getWalk_weather()
	{
		return walk_weather;
	}

	public void setWalk_weather(String walk_weather)
	{
		this.walk_weather = walk_weather;
	}

	public String getWalk_place()
	{
		return walk_place;
	}

	public void setWalk_place(String walk_place)
	{
		this.walk_place = walk_place;
	}

	public DiaryCommonDTO getCommonDto()
	{
		return commonDto;
	}

	public void setCommonDto(DiaryCommonDTO commonDto)
	{
		this.commonDto = commonDto;
	}

	

}

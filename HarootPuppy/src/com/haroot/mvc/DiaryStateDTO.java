package com.haroot.mvc;

public class DiaryStateDTO
{
	// 속성
	private DiaryCommonDTO commonDto;	// 공통항목 속성
	private String state_code		// 상태입력코드
				, state_leg_code	// 상태범례코드
				, state_leg_name;	// 상태범례명
	
	// getter / setter 생성
	public String getState_code()
	{
		return state_code;
	}

	public void setState_code(String state_code)
	{
		this.state_code = state_code;
	}

	public String getState_leg_code()
	{
		return state_leg_code;
	}

	public void setState_leg_code(String state_leg_code)
	{
		this.state_leg_code = state_leg_code;
	}

	public String getState_leg_name()
	{
		return state_leg_name;
	}

	public void setState_leg_name(String state_leg_name)
	{
		this.state_leg_name = state_leg_name;
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

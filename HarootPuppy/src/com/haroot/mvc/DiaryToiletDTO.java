package com.haroot.mvc;

public class DiaryToiletDTO
{
	// 특별관리 > 배변 속성 구성
	
	private DiaryCommonDTO commonDto; // 공통항목 속성
	
	private String toilet_code, urin_code, feces_code 	// 배변 코드, 소변 코드, 대변 코드
			, peces_state, peces_etc 							// 대변상태, 대변직접입력
			, urin_state, urine_etc;							// 소변상태, 소변직접입력

	// getter / setter  구성
	
	public DiaryCommonDTO getCommonDto()
	{
		return commonDto;
	}
	public void setCommonDto(DiaryCommonDTO commonDto)
	{
		this.commonDto = commonDto;
	}

	public String getToilet_code()
	{
		return toilet_code;
	}

	public void setToilet_code(String toilet_code)
	{
		this.toilet_code = toilet_code;
	}

	public String getUrin_code()
	{
		return urin_code;
	}

	public void setUrin_code(String urin_code)
	{
		this.urin_code = urin_code;
	}

	public String getFeces_code()
	{
		return feces_code;
	}

	public void setFeces_code(String feces_code)
	{
		this.feces_code = feces_code;
	}

	public String getPeces_state()
	{
		return peces_state;
	}

	public void setPeces_state(String peces_state)
	{
		this.peces_state = peces_state;
	}

	public String getPeces_etc()
	{
		return peces_etc;
	}

	public void setPeces_etc(String peces_etc)
	{
		this.peces_etc = peces_etc;
	}

	public String getUrin_state()
	{
		return urin_state;
	}

	public void setUrin_state(String urin_state)
	{
		this.urin_state = urin_state;
	}

	public String getUrine_etc()
	{
		return urine_etc;
	}

	public void setUrine_etc(String urine_etc)
	{
		this.urine_etc = urine_etc;
	}
			

			
			
	
}

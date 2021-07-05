package com.haroot.mvc;

public class DiaryCleanToothDTO
{
	// 속성
	private DiaryCommonDTO commonDto;	// 공통항목 속성
	private String tooth_code			// 양치입력코드
			, clean_fav_code;			// 청결즐겨찾기코드
	
	// getter / setter  생성
	public String getTooth_code()
	{
		return tooth_code;
	}

	public void setTooth_code(String tooth_code)
	{
		this.tooth_code = tooth_code;
	}

	public String getClean_fav_code()
	{
		return clean_fav_code;
	}

	public void setClean_fav_code(String clean_fav_code)
	{
		this.clean_fav_code = clean_fav_code;
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

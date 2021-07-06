package com.haroot.mvc;

public class DiaryCleanEarDTO
{
	// 속성
	private DiaryCommonDTO commonDto;	// 공통항목 속성
	private String ear_code				// 귀청소입력코드
			, clean_fav_code;			// 청결즐겨찾기코드

	// getter / setter 생성
	public String getEar_code()
	{
		return ear_code;
	}

	public void setEar_code(String ear_code)
	{
		this.ear_code = ear_code;
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

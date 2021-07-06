package com.haroot.mybatis;

public class DiaryCleanBathDTO
{
	// 속성
	private DiaryCommonDTO commonDto;	// 공통항목 속성
	
	private String bath_code			// 목욕입력코드
				, clean_fav_code;		// 청결즐겨찾기코드


	// getter / setter 생성
	public String getBath_code()
	{
		return bath_code;
	}

	public void setBath_code(String bath_code)
	{
		this.bath_code = bath_code;
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

package com.haroot.mvc;

public class DiarySnackDTO
{
	// 속성
	private DiaryCommonDTO commonDto;	// 공통항목 속성
	private String snack_type_code			// 간식종류코드
				, snack_type_content		// 간식종류내용
				, snack_info_code			// 간식정보코드
				, favorite_code				// 즐겨찾기코드
				, snack_name				// 간식명
				, unit_code					// 급여단위코드
				, unit_content				// 급여단위내용
				, snack_code;				// 간식입력코드
				
	private int snack_amount;				// 간식양

	
	
	// getter / setter 생성
	public String getSnack_type_code()
	{
		return snack_type_code;
	}

	public void setSnack_type_code(String snack_type_code)
	{
		this.snack_type_code = snack_type_code;
	}

	public String getSnack_type_content()
	{
		return snack_type_content;
	}

	public void setSnack_type_content(String snack_type_content)
	{
		this.snack_type_content = snack_type_content;
	}

	public String getSnack_info_code()
	{
		return snack_info_code;
	}

	public void setSnack_info_code(String snack_info_code)
	{
		this.snack_info_code = snack_info_code;
	}

	public String getFavorite_code()
	{
		return favorite_code;
	}

	public void setFavorite_code(String favorite_code)
	{
		this.favorite_code = favorite_code;
	}

	public String getSnack_name()
	{
		return snack_name;
	}

	public void setSnack_name(String snack_name)
	{
		this.snack_name = snack_name;
	}

	public String getUnit_code()
	{
		return unit_code;
	}

	public void setUnit_code(String unit_code)
	{
		this.unit_code = unit_code;
	}

	public String getUnit_content()
	{
		return unit_content;
	}

	public void setUnit_content(String unit_content)
	{
		this.unit_content = unit_content;
	}

	public String getSnack_code()
	{
		return snack_code;
	}

	public void setSnack_code(String snack_code)
	{
		this.snack_code = snack_code;
	}

	public int getSnack_amount()
	{
		return snack_amount;
	}

	public void setSnack_amount(int snack_amount)
	{
		this.snack_amount = snack_amount;
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

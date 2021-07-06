/*=====================
  - DiaryNutrientsDTO.java
  : 미용 입력
=====================*/

package com.haroot.mvc;

public class DiaryNutrientsDTO
{
	// 영양제
	private String favorite_code		// 즐겨찾기 코드
				 , nut_name				// 영양제 이름
				 , nut_amout;			// 투여량
	
	// 약 종류 
	private String medicine_type_code	// 영양제 종류
				 , medicine_content;	
	
	// 급여단위
	private String unit_code			// 급여단위 코드
				 , unit_content;			
	
	// 영양제 입력
	private String nut_code				// 영양제 입력 코드
				 , nut_info_code;		// 영양제 코드

	private DiaryCommonDTO common;
	
	
	// getter / setter
	public String getNut_info_code()
	{
		return nut_info_code;
	}
	
	public void setNut_info_code(String nut_info_code)
	{
		this.nut_info_code = nut_info_code;
	}

	public String getFavorite_code()
	{
		return favorite_code;
	}

	public void setFavorite_code(String favorite_code)
	{
		this.favorite_code = favorite_code;
	}

	public String getNut_name()
	{
		return nut_name;
	}

	public void setNut_name(String nut_name)
	{
		this.nut_name = nut_name;
	}

	public String getNut_amout()
	{
		return nut_amout;
	}

	public void setNut_amout(String nut_amout)
	{
		this.nut_amout = nut_amout;
	}

	public String getMedicine_type_code()
	{
		return medicine_type_code;
	}

	public void setMedicine_type_code(String medicine_type_code)
	{
		this.medicine_type_code = medicine_type_code;
	}

	public String getMedicine_content()
	{
		return medicine_content;
	}

	public void setMedicine_content(String medicine_content)
	{
		this.medicine_content = medicine_content;
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

	public String getNut_code()
	{
		return nut_code;
	}

	public void setNut_code(String nut_code)
	{
		this.nut_code = nut_code;
	}

	public DiaryCommonDTO getCommon()
	{
		return common;
	}

	public void setCommon(DiaryCommonDTO common)
	{
		this.common = common;
	}
	
	
}

package com.haroot.mybatis;

public class DiaryMedicineDTO
{

	// 특별관리 > 복약 속성 구성
	
	private DiaryCommonDTO commonDto; // 공통항목 속성
	
	private String  medicine_code 				 				 	// 복약입력코드
			, medicine_type_code, medicine_info_code  		 	// 약종류코드, 복약코드
			, medicine_content										 	// 약종류명
			, favorite_code, medicine_name, medicine_effect; 	// 즐겨찾기코드, 약이름, 약효능
	
	private int medicine_amount;  					  		 		// 투여량
	
	private String unit_code, unit_content						 	// 급여단위코드, 급여단위내용
			, medicine_disease, hospital_code, hospital_name; 	// 질병명, 병원코드, 병원명
	
	// getter / setter 구성
	
	public DiaryCommonDTO getCommonDto()
	{
		return commonDto;
	}
	public void setCommonDto(DiaryCommonDTO commonDto)
	{
		this.commonDto = commonDto;
	}
	
	public String getMedicine_code()
	{
		return medicine_code;
	}
	public void setMedicine_code(String medicine_code)
	{
		this.medicine_code = medicine_code;
	}
	public String getMedicine_type_code()
	{
		return medicine_type_code;
	}
	public void setMedicine_type_code(String medicine_type_code)
	{
		this.medicine_type_code = medicine_type_code;
	}
	public String getMedicine_info_code()
	{
		return medicine_info_code;
	}
	public void setMedicine_info_code(String medicine_info_code)
	{
		this.medicine_info_code = medicine_info_code;
	}
	public String getMedicine_content()
	{
		return medicine_content;
	}
	public void setMedicine_content(String medicine_content)
	{
		this.medicine_content = medicine_content;
	}
	public String getFavorite_code()
	{
		return favorite_code;
	}
	public void setFavorite_code(String favorite_code)
	{
		this.favorite_code = favorite_code;
	}
	public String getMedicine_name()
	{
		return medicine_name;
	}
	public void setMedicine_name(String medicine_name)
	{
		this.medicine_name = medicine_name;
	}
	public String getMedicine_effect()
	{
		return medicine_effect;
	}
	public void setMedicine_effect(String medicine_effect)
	{
		this.medicine_effect = medicine_effect;
	}
	public int getMedicine_amount()
	{
		return medicine_amount;
	}
	public void setMedicine_amount(int medicine_amount)
	{
		this.medicine_amount = medicine_amount;
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
	public String getMedicine_disease()
	{
		return medicine_disease;
	}
	public void setMedicine_disease(String medicine_disease)
	{
		this.medicine_disease = medicine_disease;
	}
	public String getHospital_code()
	{
		return hospital_code;
	}
	public void setHospital_code(String hospital_code)
	{
		this.hospital_code = hospital_code;
	}
	public String getHospital_name()
	{
		return hospital_name;
	}
	public void setHospital_name(String hospital_name)
	{
		this.hospital_name = hospital_name;
	}
			
	
	
	
}

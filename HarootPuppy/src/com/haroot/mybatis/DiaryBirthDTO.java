package com.haroot.mvc;

public class DiaryBirthDTO
{
	// 특별관리 > 출산 속성 구성
	
	private DiaryCommonDTO commonDto; 				// 공통항목 속성
	
	private String birth_code, birth_male; 	 	// 출산 코드, 수컷종류코드(품종코드) -- 수컷품종명 추가??
	
	private String pet_type_name, pet_type_size; // 품종이름, 품종크기
	
	private double birth_temperature;				// 체온
	
	private int birth_account; 						// 새끼 수
	
	
	// getter / setter 구성
	

	public DiaryCommonDTO getCommonDto()
	{
		return commonDto;
	}

	public void setCommonDto(DiaryCommonDTO commonDto)
	{
		this.commonDto = commonDto;
	}

	public String getBirth_code()
	{
		return birth_code;
	}

	public void setBirth_code(String birth_code)
	{
		this.birth_code = birth_code;
	}

	public String getBirth_male()
	{
		return birth_male;
	}

	public void setBirth_male(String birth_male)
	{
		this.birth_male = birth_male;
	}

	public String getPet_type_name()
	{
		return pet_type_name;
	}

	public void setPet_type_name(String pet_type_name)
	{
		this.pet_type_name = pet_type_name;
	}

	public String getPet_type_size()
	{
		return pet_type_size;
	}

	public void setPet_type_size(String pet_type_size)
	{
		this.pet_type_size = pet_type_size;
	}

	public double getBirth_temperature()
	{
		return birth_temperature;
	}

	public void setBirth_temperature(double birth_temperature)
	{
		this.birth_temperature = birth_temperature;
	}

	public int getBirth_account()
	{
		return birth_account;
	}

	public void setBirth_account(int birth_account)
	{
		this.birth_account = birth_account;
	}
	
	
}

/*=====================
  - DiaryInjectDTO.java
  : 접종 입력
=====================*/

package com.haroot.mvc;

public class DiaryInjectDTO
{
	// 병원
	private String hospital_code		// 병원코드
				 , hospital_name		// 병원명
				 , hospital_doctor;		// 의사명
	
	// 접종 종류
	private String inject_type_code		// 접종종류 코드
				 , inject_type_name;	// 접종종류 명
	
	// 접종 
	private String inject_code			// 접종 코드
				 , inject_next;			// 다음 방문 일정
	
	private int inject_cost;			// 접종 비용

	private DiaryCommonDTO common;
	
	// getter / setter 
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

	public String getHospital_doctor()
	{
		return hospital_doctor;
	}

	public void setHospital_doctor(String hospital_doctor)
	{
		this.hospital_doctor = hospital_doctor;
	}

	public String getInject_type_code()
	{
		return inject_type_code;
	}

	public void setInject_type_code(String inject_type_code)
	{
		this.inject_type_code = inject_type_code;
	}

	public String getInject_type_name()
	{
		return inject_type_name;
	}

	public void setInject_type_name(String inject_type_name)
	{
		this.inject_type_name = inject_type_name;
	}

	public String getInject_code()
	{
		return inject_code;
	}

	public void setInject_code(String inject_code)
	{
		this.inject_code = inject_code;
	}

	public String getInject_next()
	{
		return inject_next;
	}

	public void setInject_next(String inject_next)
	{
		this.inject_next = inject_next;
	}

	public int getInject_cost()
	{
		return inject_cost;
	}

	public void setInject_cost(int inject_cost)
	{
		this.inject_cost = inject_cost;
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

/*=====================
  - DiarySurgeryDTO.java
  : 수술 / 입원 입력
=====================*/

package com.haroot.mvc;

public class DiarySurgeryDTO
{
	// 병원
	private String hospital_code		// 병원코드
				 , hospital_name		// 병원명
				 , hospital_doctor;		// 의사명
	
	// 접종 종류
	private String inject_type_code		// 접종종류 코드
				 , inject_type_name;	// 접종종류 명
	
	private DiaryCommonDTO common;
	
	// 수술 / 입원
	private String surgery_code			// 수술입원 코드
				 , surgery_name			// 수술명
				 , surgery_next;		// 다음 방문 일정
	
	private int surgery_cost;			// 의료 비용

	
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

	public String getSurgery_code()
	{
		return surgery_code;
	}

	public void setSurgery_code(String surgery_code)
	{
		this.surgery_code = surgery_code;
	}

	public String getSurgery_name()
	{
		return surgery_name;
	}

	public void setSurgery_name(String surgery_name)
	{
		this.surgery_name = surgery_name;
	}

	public String getSurgery_next()
	{
		return surgery_next;
	}

	public void setSurgery_next(String surgery_next)
	{
		this.surgery_next = surgery_next;
	}

	public int getSurgery_cost()
	{
		return surgery_cost;
	}

	public void setSurgery_cost(int surgery_cost)
	{
		this.surgery_cost = surgery_cost;
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

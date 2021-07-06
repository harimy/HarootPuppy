/*=====================
  - DiaryIllnessDTO.java
  : 질환 입력
=====================*/

package com.haroot.mybatis;

public class DiaryIllnessDTO
{
	// 병원
	private String hospital_code		// 병원코드
				 , hospital_name		// 병원명
				 , hospital_doctor;		// 의사명
	
	// 접종 종류
	private String inject_type_code		// 접종종류 코드
				 , inject_type_name;	// 접종종류 명
		
	// 질환
	private String illness_code			// 질환 코드
		 		 , illness_name			// 질환명 
		 		 , illness_next;		// 다음 방문 일정
	
	private int illness_cost;			// 의료비용

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

	public String getIllness_code()
	{
		return illness_code;
	}

	public void setIllness_code(String illness_code)
	{
		this.illness_code = illness_code;
	}

	public String getIllness_name()
	{
		return illness_name;
	}

	public void setIllness_name(String illness_name)
	{
		this.illness_name = illness_name;
	}

	public String getIllness_next()
	{
		return illness_next;
	}

	public void setIllness_next(String illness_next)
	{
		this.illness_next = illness_next;
	}

	public int getIllness_cost()
	{
		return illness_cost;
	}

	public void setIllness_cost(int illness_cost)
	{
		this.illness_cost = illness_cost;
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

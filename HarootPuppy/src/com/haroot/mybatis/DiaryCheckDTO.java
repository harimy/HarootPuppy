/*=====================
  - DiaryCheckDTO.java
  : 건강검진 입력
=====================*/

package com.haroot.mybatis;

public class DiaryCheckDTO
{
	// 병원
	private String hospital_code		// 병원코드
				 , hospital_name		// 병원명
				 , hospital_doctor;		// 의사명
	
	// 접종 종류
	private String inject_type_code		// 접종종류 코드
				 , inject_type_name;	// 접종종류 명
		
	// 건강검진
	private String check_code			// 건강검진입력코드
				 , check_next;			// 다음방문일정
				 
	private int check_cost;				// 의료비용

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

	public String getCheck_code()
	{
		return check_code;
	}

	public void setCheck_code(String check_code)
	{
		this.check_code = check_code;
	}

	public String getCheck_next()
	{
		return check_next;
	}

	public void setCheck_next(String check_next)
	{
		this.check_next = check_next;
	}

	public int getCheck_cost()
	{
		return check_cost;
	}

	public void setCheck_cost(int check_cost)
	{
		this.check_cost = check_cost;
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

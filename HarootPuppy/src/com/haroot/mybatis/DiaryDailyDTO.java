package com.haroot.mybatis;

public class DiaryDailyDTO
{
	// 속성
	private String daily_code			// 일일관리코드
				, relation_code			// 양육관게코드
				, pet_code
				, sid_code
				, daily_date;			// 관리일자

	// getter / setter 생성
	public String getDaily_code()
	{
		return daily_code;
	}

	public void setDaily_code(String daily_code)
	{
		this.daily_code = daily_code;
	}

	public String getRelation_code()
	{
		return relation_code;
	}

	public void setRelation_code(String relation_code)
	{
		this.relation_code = relation_code;
	}

	public String getDaily_date()
	{
		return daily_date;
	}

	public void setDaily_date(String daily_date)
	{
		this.daily_date = daily_date;
	}

	public String getPet_code()
	{
		return pet_code;
	}

	public void setPet_code(String pet_code)
	{
		this.pet_code = pet_code;
	}

	public String getSid_code()
	{
		return sid_code;
	}

	public void setSid_code(String sid_code)
	{
		this.sid_code = sid_code;
	}
	
	
				
		
}

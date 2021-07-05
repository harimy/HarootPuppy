package com.haroot.mvc;

public class DiaryCommonDTO
{
	// 속성
	private String common_code			// 공통항목코드
				, common_start			// 시작날짜
				, common_end			// 종료날짜
				, common_memo			// 특이사항
				, common_photo			// 사진
				, daily_code;			// 일일관리코드

	
	// getter / setter  생성
	public String getCommon_code()
	{
		return common_code;
	}

	public void setCommon_code(String common_code)
	{
		this.common_code = common_code;
	}

	public String getCommon_start()
	{
		return common_start;
	}

	public void setCommon_start(String common_start)
	{
		this.common_start = common_start;
	}

	public String getCommon_end()
	{
		return common_end;
	}

	public void setCommon_end(String common_end)
	{
		this.common_end = common_end;
	}

	public String getCommon_memo()
	{
		return common_memo;
	}

	public void setCommon_memo(String common_memo)
	{
		this.common_memo = common_memo;
	}

	public String getCommon_photo()
	{
		return common_photo;
	}

	public void setCommon_photo(String common_photo)
	{
		this.common_photo = common_photo;
	}

	public String getDaily_code()
	{
		return daily_code;
	}

	public void setDaily_code(String daily_code)
	{
		this.daily_code = daily_code;
	}

	
	



}

package com.haroot.mybatis;

public class DiaryMealDTO
{
	// 속성
	private DiaryCommonDTO commonDto;	// 공통항목 속성
	private String meal_type_code		// 사료타입코드
				, meal_type_content		// 사료타입내용
				, meal_info_code 		// 사료정보코드
				, favorite_code			// 즐겨찾기코드
				, meal_name				// 사료명
				, unit_code				// 급여단위코드
				, unit_content			// 급여단위내용
				, meal_code				// 사료입력코드
				
				, favorite_name			// 즐겨찾기 이름
				, favorite_date 		// 즐찾 생성 날짜
				, common_start			// 공통 시작시간
				, common_end			// 공통 끝 시간
				, meal_type				// 사료타입
				, common_memo			// 메모
				, common_photo			// 사진
				, sid_code				// 회원코드
				, pet_code;				// 반려견코드
	
				
	
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

	public String getSid_code()
	{
		return sid_code;
	}

	public void setSid_code(String sid_code)
	{
		this.sid_code = sid_code;
	}

	public String getPet_code()
	{
		return pet_code;
	}

	public void setPet_code(String pet_code)
	{
		this.pet_code = pet_code;
	}

	public String getMeal_type()
	{
		return meal_type;
	}

	public void setMeal_type(String meal_type)
	{
		this.meal_type = meal_type;
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

	private int meal_amount;			// 사료양
	
	
	// getter / setter 생성
	public String getMeal_type_code()
	{
		return meal_type_code;
	}

	public void setMeal_type_code(String meal_type_code)
	{
		this.meal_type_code = meal_type_code;
	}

	public String getMeal_type_content()
	{
		return meal_type_content;
	}

	public void setMeal_type_content(String meal_type_content)
	{
		this.meal_type_content = meal_type_content;
	}

	public String getMeal_info_code()
	{
		return meal_info_code;
	}

	public void setMeal_info_code(String meal_info_code)
	{
		this.meal_info_code = meal_info_code;
	}

	public String getFavorite_code()
	{
		return favorite_code;
	}

	public void setFavorite_code(String favorite_code)
	{
		this.favorite_code = favorite_code;
	}

	public String getMeal_name()
	{
		return meal_name;
	}

	public void setMeal_name(String meal_name)
	{
		this.meal_name = meal_name;
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

	public String getMeal_code()
	{
		return meal_code;
	}

	public void setMeal_code(String meal_code)
	{
		this.meal_code = meal_code;
	}

	public int getMeal_amount()
	{
		return meal_amount;
	}

	public void setMeal_amount(int meal_amount)
	{
		this.meal_amount = meal_amount;
	}

	public DiaryCommonDTO getCommonDto()
	{
		return commonDto;
	}

	public void setCommonDto(DiaryCommonDTO commonDto)
	{
		this.commonDto = commonDto;
	}

	public String getFavorite_name()
	{
		return favorite_name;
	}

	public void setFavorite_name(String favorite_name)
	{
		this.favorite_name = favorite_name;
	}

	public String getFavorite_date()
	{
		return favorite_date;
	}

	public void setFavorite_date(String favorite_date)
	{
		this.favorite_date = favorite_date;
	}
	
	
	
}

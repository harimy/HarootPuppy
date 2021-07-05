/*=====================
  - DiaryBeautyDTO.java
  : 미용 입력
=====================*/

package com.haroot.mvc;

public class DiaryBeautyDTO
{
	// 미용샵
	private String shop_code		// 미용샵 코드
				 , shop_name;		// 미용샵 이름
	
	private DiaryCommonDTO common;
	
	// 미용 종류
	private String beauty_type_code	// 미용 종류 코드
				 , beauty_type_name;// 미용 종류 이름
	
	// 미용 입력
	private String beauty_code		// 미용 입력 코드
				 , beauty_cost;		// 미용 비용

	// getter / setter
	public String getShop_code()
	{
		return shop_code;
	}

	public void setShop_code(String shop_code)
	{
		this.shop_code = shop_code;
	}

	public String getShop_name()
	{
		return shop_name;
	}

	public void setShop_name(String shop_name)
	{
		this.shop_name = shop_name;
	}

	public String getBeauty_type_code()
	{
		return beauty_type_code;
	}

	public void setBeauty_type_code(String beauty_type_code)
	{
		this.beauty_type_code = beauty_type_code;
	}

	public String getBeauty_type_name()
	{
		return beauty_type_name;
	}

	public void setBeauty_type_name(String beauty_type_name)
	{
		this.beauty_type_name = beauty_type_name;
	}

	public String getBeauty_code()
	{
		return beauty_code;
	}

	public void setBeauty_code(String beauty_code)
	{
		this.beauty_code = beauty_code;
	}

	public String getBeauty_cost()
	{
		return beauty_cost;
	}

	public void setBeauty_cost(String beauty_cost)
	{
		this.beauty_cost = beauty_cost;
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

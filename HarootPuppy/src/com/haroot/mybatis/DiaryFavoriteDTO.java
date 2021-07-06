package com.haroot.mybatis;

public class DiaryFavoriteDTO
{
	// 속성
	private String favorite_code		// 즐겨찾기코드
				, relation_code			// 양육관계코드
				, favorite_name			// 즐겨찾기명
				, favorite_date;		// 즐겨찾기생성일

	// getter / setter  생성
	public String getFavorite_code()
	{
		return favorite_code;
	}

	public void setFavorite_code(String favorite_code)
	{
		this.favorite_code = favorite_code;
	}

	public String getRelation_code()
	{
		return relation_code;
	}

	public void setRelation_code(String relation_code)
	{
		this.relation_code = relation_code;
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

package com.haroot.mybatis;

public class DiaryCleanFavoriteDTO
{
	private String clean_fav_code		// 청결즐겨찾기코드
				, relation_code			// 양육관계코드
				, clean_fav_name		// 청결즐겨찾기명
				, clean_fav_date;		// 청결즐겨찾기생성일

	public String getClean_fav_code()
	{
		return clean_fav_code;
	}

	public void setClean_fav_code(String clean_fav_code)
	{
		this.clean_fav_code = clean_fav_code;
	}

	public String getRelation_code()
	{
		return relation_code;
	}

	public void setRelation_code(String relation_code)
	{
		this.relation_code = relation_code;
	}

	public String getClean_fav_name()
	{
		return clean_fav_name;
	}

	public void setClean_fav_name(String clean_fav_name)
	{
		this.clean_fav_name = clean_fav_name;
	}

	public String getClean_fav_date()
	{
		return clean_fav_date;
	}

	public void setClean_fav_date(String clean_fav_date)
	{
		this.clean_fav_date = clean_fav_date;
	}



}

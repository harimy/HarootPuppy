/*================
 - DiaryTrainDTO.java
=================*/

package com.haroot.mybatis;

public class DiaryTrainDTO
{
	// 훈련 입력
	private String train_code
				 , favorite_code		// 즐겨찾기 코드
				 , train_name;			// 휸련 이름
	
	private DiaryCommonDTO common;
	
	private String train_type_code		// 훈련종류 코드
				 , train_type_content;	// 훈련종류

	// getter / setter
	public String getTrain_code()
	{
		return train_code;
	}

	public void setTrain_code(String train_code)
	{
		this.train_code = train_code;
	}

	public String getFavorite_code()
	{
		return favorite_code;
	}

	public void setFavorite_code(String favorite_code)
	{
		this.favorite_code = favorite_code;
	}

	public String getTrain_name()
	{
		return train_name;
	}

	public void setTrain_name(String train_name)
	{
		this.train_name = train_name;
	}

	public String getTrain_type_code()
	{
		return train_type_code;
	}

	public void setTrain_type_code(String train_type_code)
	{
		this.train_type_code = train_type_code;
	}

	public String getTrain_type_content()
	{
		return train_type_content;
	}

	public void setTrain_type_content(String train_type_content)
	{
		this.train_type_content = train_type_content;
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

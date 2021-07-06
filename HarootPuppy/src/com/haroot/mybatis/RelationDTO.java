package com.haroot.mybatis;

public class RelationDTO
{
	// 속성
	private String relation_code				// 양육관계코드
					, sid_code					// 회원코드
					, pet_code					// 반려견코드
					, relation_type_code		// 양육관계종류코드
					, relation_type_content; 	// 양육관계종류내용

	
	// getter / setter 생성
	public String getRelation_code()
	{
		return relation_code;
	}

	public void setRelation_code(String relation_code)
	{
		this.relation_code = relation_code;
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

	public String getRelation_type_code()
	{
		return relation_type_code;
	}

	public void setRelation_type_code(String relation_type_code)
	{
		this.relation_type_code = relation_type_code;
	}

	public String getRelation_type_content()
	{
		return relation_type_content;
	}

	public void setRelation_type_content(String relation_type_content)
	{
		this.relation_type_content = relation_type_content;
	}
	

}

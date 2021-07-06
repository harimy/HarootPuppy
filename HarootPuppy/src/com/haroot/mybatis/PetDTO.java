package com.haroot.mybatis;

public class PetDTO
{
	// 속성 구성
	private String pet_code, pet_type_code, pet_type_name		// 반려견코드, 품종코드, 품종명
				, bite_code, bite_content						// 반려견입질여부, 반려견입질내용
				, desex_code, desex_content						// 중성화여부코드, 중성화여부내용
				, pet_sex, pet_birth							// 반려견성별, 반려견생일
				, pet_fav_place									// 자주산책하는장소
				, pet_char1_code, pet_char1_content				// 반려견성격1코드, 반려견성격1내용
				, pet_char2_code, pet_char2_content				// 반려견성격2코드, 반려견성격2내용
				, pet_char3_code, pet_char3_content				// 반려견성격3코드, 반려견성격3내용
				, pet_chat4_code, pet_char4_content				// 반려견성격4코드, 반려견성격4내용
				, pet_size										// 품종크기
				, pet_info_code, pet_name						// 반려견정보코드, 반려견이름
				, pet_photo										// 반려견 사진
				, pet_addr										// 반려견 주소
				, pet_regnum									// 반려견등록번호
				, disease_code									// 기저질환코드
				, disease_content								// 기저질환내용
				, fav_food_code									// 관심사료코드
				, fav_food_content								// 관심사료내용
				, inject_type_code								// 접종종류코드
				, inject_type_name								// 접종종류내용
				
				, relation_code									// 양육관계코드
				, sid_code										// 회원코드
				, relation_type_code							// 양육관계종류코드
				, relation_type_content; 						// 양육관계종류내용
	
	private int pet_social;										// 반려견 사회성 정도

	
	// getter / setter 생성
	public String getPet_code()
	{
		return pet_code;
	}

	public void setPet_code(String pet_code)
	{
		this.pet_code = pet_code;
	}

	public String getPet_type_code()
	{
		return pet_type_code;
	}

	public void setPet_type_code(String pet_type_code)
	{
		this.pet_type_code = pet_type_code;
	}

	public String getPet_type_name()
	{
		return pet_type_name;
	}

	public void setPet_type_name(String pet_type_name)
	{
		this.pet_type_name = pet_type_name;
	}

	public String getBite_code()
	{
		return bite_code;
	}

	public void setBite_code(String bite_code)
	{
		this.bite_code = bite_code;
	}

	public String getBite_content()
	{
		return bite_content;
	}

	public void setBite_content(String bite_content)
	{
		this.bite_content = bite_content;
	}

	public String getDesex_code()
	{
		return desex_code;
	}

	public void setDesex_code(String desex_code)
	{
		this.desex_code = desex_code;
	}

	public String getDesex_content()
	{
		return desex_content;
	}

	public void setDesex_content(String desex_content)
	{
		this.desex_content = desex_content;
	}

	public String getPet_sex()
	{
		return pet_sex;
	}

	public void setPet_sex(String pet_sex)
	{
		this.pet_sex = pet_sex;
	}

	public String getPet_birth()
	{
		return pet_birth;
	}

	public void setPet_birth(String pet_birth)
	{
		this.pet_birth = pet_birth;
	}

	public String getPet_fav_place()
	{
		return pet_fav_place;
	}

	public void setPet_fav_place(String pet_fav_place)
	{
		this.pet_fav_place = pet_fav_place;
	}

	public String getPet_char1_code()
	{
		return pet_char1_code;
	}

	public void setPet_char1_code(String pet_char1_code)
	{
		this.pet_char1_code = pet_char1_code;
	}

	public String getPet_char1_content()
	{
		return pet_char1_content;
	}

	public void setPet_char1_content(String pet_char1_content)
	{
		this.pet_char1_content = pet_char1_content;
	}

	public String getPet_char2_code()
	{
		return pet_char2_code;
	}

	public void setPet_char2_code(String pet_char2_code)
	{
		this.pet_char2_code = pet_char2_code;
	}

	public String getPet_char2_content()
	{
		return pet_char2_content;
	}

	public void setPet_char2_content(String pet_char2_content)
	{
		this.pet_char2_content = pet_char2_content;
	}

	public String getPet_char3_code()
	{
		return pet_char3_code;
	}

	public void setPet_char3_code(String pet_char3_code)
	{
		this.pet_char3_code = pet_char3_code;
	}

	public String getPet_char3_content()
	{
		return pet_char3_content;
	}

	public void setPet_char3_content(String pet_char3_content)
	{
		this.pet_char3_content = pet_char3_content;
	}

	public String getPet_chat4_code()
	{
		return pet_chat4_code;
	}

	public void setPet_chat4_code(String pet_chat4_code)
	{
		this.pet_chat4_code = pet_chat4_code;
	}

	public String getPet_char4_content()
	{
		return pet_char4_content;
	}

	public void setPet_char4_content(String pet_char4_content)
	{
		this.pet_char4_content = pet_char4_content;
	}

	public String getPet_size()
	{
		return pet_size;
	}

	public void setPet_size(String pet_size)
	{
		this.pet_size = pet_size;
	}

	public String getPet_info_code()
	{
		return pet_info_code;
	}

	public void setPet_info_code(String pet_info_code)
	{
		this.pet_info_code = pet_info_code;
	}

	public String getPet_name()
	{
		return pet_name;
	}

	public void setPet_name(String pet_name)
	{
		this.pet_name = pet_name;
	}

	public String getPet_photo()
	{
		return pet_photo;
	}

	public void setPet_photo(String pet_photo)
	{
		this.pet_photo = pet_photo;
	}

	public String getPet_addr()
	{
		return pet_addr;
	}

	public void setPet_addr(String pet_addr)
	{
		this.pet_addr = pet_addr;
	}

	public String getPet_regnum()
	{
		return pet_regnum;
	}

	public void setPet_regnum(String pet_regnum)
	{
		this.pet_regnum = pet_regnum;
	}

	public int getPet_social()
	{
		return pet_social;
	}

	public void setPet_social(int pet_social)
	{
		this.pet_social = pet_social;
	}

	public String getDisease_code()
	{
		return disease_code;
	}

	public void setDisease_code(String disease_code)
	{
		this.disease_code = disease_code;
	}

	public String getDisease_content()
	{
		return disease_content;
	}

	public void setDisease_content(String disease_content)
	{
		this.disease_content = disease_content;
	}

	public String getFav_food_code()
	{
		return fav_food_code;
	}

	public void setFav_food_code(String fav_food_code)
	{
		this.fav_food_code = fav_food_code;
	}

	public String getFav_food_content()
	{
		return fav_food_content;
	}

	public void setFav_food_content(String fav_food_content)
	{
		this.fav_food_content = fav_food_content;
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

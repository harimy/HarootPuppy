package com.haroot.mybatis;

import java.util.ArrayList;

public interface IPetDAO
{
	// 나의 반려견 리스트 출력
	public ArrayList<PetDTO> petList();
	
	// 반려견 정보 리스트 출력
	public PetDTO petInfo();
	
	// 반려견 추가
	public int petAdd(PetDTO pet);
	
	// 반려견 정보 수정
	public int petModify(PetDTO pet);
	
	// 반려견 삭제
	public int petDelete(String pet_code);
	
	// 반려견 수 연산
	public int count();
	

}

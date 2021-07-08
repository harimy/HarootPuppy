package com.haroot.mybatis;

import java.util.ArrayList;

public interface IPetDAO
{
	// 나의 반려견 리스트 출력
	public ArrayList<PetDTO> petList();
	
	// 반려견 정보 리스트 출력 
	// (반려견 선택 시)
	public PetDTO petInfo(String pet_code);
	
	// 반려견 정보 리스트 출력2 
	// (다이어리내 반려견 정보 확인 시)
	public PetDTO petInfo2(String pet_code);
	
	// 반려견 추가
	public int petAdd(PetDTO pet);
	
	// 반려견 정보 수정
	public int petModify(PetDTO pet);
	
	// 반려견 삭제
	public int petDelete(String pet_code);
	
	// 반려견 수 연산
	public int count();
	
	// 반려견(들) 검색 (sid)로
	public ArrayList<PetDTO> searchPets(String sid_code);
	
}

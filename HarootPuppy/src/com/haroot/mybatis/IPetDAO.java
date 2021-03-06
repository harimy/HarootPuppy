package com.haroot.mybatis;

import java.sql.SQLException;
import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

public interface IPetDAO
{
	// 양육관계 코드 찾아내기 (REL_CODE)
	public String relationCode(@Param("pet_code") String pet_code, @Param("sid_code") String sid_code) throws SQLException;
	// @Param이 있어야 오류가 안남 ㅠ 
	
	// 나의 반려견 리스트 출력
	public ArrayList<PetDTO> petList();
	
	// 반려견 정보 리스트 출력 
	// (반려견 선택 시)
	public PetDTO petInfo(String pet_code) throws SQLException;
	
	// 반려견 정보 리스트 출력2 
	// (다이어리내 반려견 정보 확인 시)
	public PetDTO petInfo2(String pet_code) throws SQLException;
	// → 접종내역
	public ArrayList<PetDTO> petInfo3(String pet_code) throws SQLException;
	// → 기저질환
	public ArrayList<PetDTO> petInfo4(String pet_code) throws SQLException;
	
	
	// 반려견 추가
	public int addPet(PetDTO pet);
	
	// 반려견 정보 수정
	public int petModify(PetDTO pet);
	
	// 반려견 삭제
	public int petDelete(String pet_code);
	
	// 반려견 수 연산
	public int count();
	
	// 반려견(들) 검색 (sid)로
	public ArrayList<PetDTO> searchPets(String sid_code);
	
	
	// public String searchPetCode(String sid_code);
	
}

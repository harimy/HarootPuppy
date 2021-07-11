/*==================
  - IAdminDAO.java
===================*/

package com.haroot.mybatis;

import java.sql.SQLException;
import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;


public interface IAdminDAO
{
	public int count();
	
	public int getMaxNum();
	
	public ArrayList<AdminDTO> list();
	
	public int add(AdminDTO admin);
	
	public int modify(AdminDTO admin);
	
	public int remove(String admin_code);
	

	// 관리자 로그인용(아이디, 비밀번호로 검색)
	public AdminDTO loginAdmin(@Param("admin_id") String admin_id, @Param("admin_pw") String admin_pw) throws SQLException;

	
	public String searchName(String admin_code);
}



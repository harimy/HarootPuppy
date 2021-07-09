/*==================
  - IAdminDAO.java
===================*/

package com.haroot.mybatis;

import java.util.ArrayList;

public interface IAdminDAO
{
	public int count();
	
	public int getMaxNum();
	
	public ArrayList<AdminDTO> list();
	
	public int add(AdminDTO admin);
	
	public int modify(AdminDTO admin);
	
	public int remove(String admin_code);
	
	// 관리자 로그인용(아이디, 비밀번호로 검색)
	public String loginCheck(AdminDTO dto);
}



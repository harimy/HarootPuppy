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
}

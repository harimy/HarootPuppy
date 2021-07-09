/*================
 - AdminDTO.java
=================*/

package com.haroot.mybatis;

public class AdminDTO
{
	private String admin_code, admin_id, admin_pw, admin_name, admin_regdate;

	
	// getter / setter
	public String getAdmin_code()
	{
		return admin_code;
	}

	public void setAdmin_code(String admin_code)
	{
		this.admin_code = admin_code;
	}

	public String getAdmin_id()
	{
		return admin_id;
	}

	public void setAdmin_id(String admin_id)
	{
		this.admin_id = admin_id;
	}

	public String getAdmin_pw()
	{
		return admin_pw;
	}

	public void setAdmin_pw(String admin_pw)
	{
		this.admin_pw = admin_pw;
	}

	public String getAdmin_name()
	{
		return admin_name;
	}

	public void setAdmin_name(String admin_name)
	{
		this.admin_name = admin_name;
	}

	public String getAdmin_regdate()
	{
		return admin_regdate;
	}

	public void setAdmin_regdate(String admin_regdate)
	{
		this.admin_regdate = admin_regdate;
	}
	
	@Override
   public String toString() {
       return "AdminDTO [admin_code=" + admin_code + ", admin_id=" + admin_id + ", admin_pw=" + admin_pw 
      		 + ", admin_name=" + admin_name + ", admin_regdate=" + admin_regdate + "]";
   }
	
}

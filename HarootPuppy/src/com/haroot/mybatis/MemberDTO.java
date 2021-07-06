/*================
 - MemberDTO.java
=================*/

package com.haroot.mybatis;

public class MemberDTO
{
	/*
	 SID_CODE MEM_CODE MEM_ID MEM_PW MEM_NAME MEM_BIRTH MEM_GENDER
	 MEM_TEL MEM_ADDR MEM_REGDATE MEM_NICKNAME PAUSE_CODE PAUSE_START
	 OUT_CODE OUT_TYPE_CODE OUT_DATE WALK_AGREE_CODE WALK_AGREE_CHECK
	 WALK_AGREE_DATE OUT_TYPE_CONTENT
	*/ 
	
	private String sid_code, mem_code, mem_id, mem_pw, mem_name, mem_birth
	             , mem_gender, mem_tel, mem_addr, mem_regdate, mem_nickname;
	
	private String pause_code, pause_start;
	
	private String out_code, out_type_code, out_date;
	
	private String walk_agree_code, walk_agree_check, walk_agree_date;
	
	private String out_type_content;

	
	// getter / setter
	public String getSid_code()
	{
		return sid_code;
	}

	public void setSid_code(String sid_code)
	{
		this.sid_code = sid_code;
	}

	public String getMem_code()
	{
		return mem_code;
	}

	public void setMem_code(String mem_code)
	{
		this.mem_code = mem_code;
	}

	public String getMem_id()
	{
		return mem_id;
	}

	public void setMem_id(String mem_id)
	{
		this.mem_id = mem_id;
	}

	public String getMem_pw()
	{
		return mem_pw;
	}

	public void setMem_pw(String mem_pw)
	{
		this.mem_pw = mem_pw;
	}

	public String getMem_name()
	{
		return mem_name;
	}

	public void setMem_name(String mem_name)
	{
		this.mem_name = mem_name;
	}

	public String getMem_birth()
	{
		return mem_birth;
	}

	public void setMem_birth(String mem_birth)
	{
		this.mem_birth = mem_birth;
	}

	public String getMem_gender()
	{
		return mem_gender;
	}

	public void setMem_gender(String mem_gender)
	{
		this.mem_gender = mem_gender;
	}

	public String getMem_tel()
	{
		return mem_tel;
	}

	public void setMem_tel(String mem_tel)
	{
		this.mem_tel = mem_tel;
	}

	public String getMem_addr()
	{
		return mem_addr;
	}

	public void setMem_addr(String mem_addr)
	{
		this.mem_addr = mem_addr;
	}

	public String getMem_regdate()
	{
		return mem_regdate;
	}

	public void setMem_regdate(String mem_regdate)
	{
		this.mem_regdate = mem_regdate;
	}

	public String getMem_nickname()
	{
		return mem_nickname;
	}

	public void setMem_nickname(String mem_nickname)
	{
		this.mem_nickname = mem_nickname;
	}

	public String getPause_code()
	{
		return pause_code;
	}

	public void setPause_code(String pause_code)
	{
		this.pause_code = pause_code;
	}

	public String getPause_start()
	{
		return pause_start;
	}

	public void setPause_start(String pause_start)
	{
		this.pause_start = pause_start;
	}

	public String getOut_code()
	{
		return out_code;
	}

	public void setOut_code(String out_code)
	{
		this.out_code = out_code;
	}

	public String getOut_type_code()
	{
		return out_type_code;
	}

	public void setOut_type_code(String out_type_code)
	{
		this.out_type_code = out_type_code;
	}

	public String getOut_date()
	{
		return out_date;
	}

	public void setOut_date(String out_date)
	{
		this.out_date = out_date;
	}

	public String getWalk_agree_code()
	{
		return walk_agree_code;
	}

	public void setWalk_agree_code(String walk_agree_code)
	{
		this.walk_agree_code = walk_agree_code;
	}

	public String getWalk_agree_check()
	{
		return walk_agree_check;
	}

	public void setWalk_agree_check(String walk_agree_check)
	{
		this.walk_agree_check = walk_agree_check;
	}

	public String getWalk_agree_date()
	{
		return walk_agree_date;
	}

	public void setWalk_agree_date(String walk_agree_date)
	{
		this.walk_agree_date = walk_agree_date;
	}

	public String getOut_type_content()
	{
		return out_type_content;
	}

	public void setOut_type_content(String out_type_content)
	{
		this.out_type_content = out_type_content;
	}
	

}


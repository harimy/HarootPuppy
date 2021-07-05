/*================
 - AskDTO.java
=================*/

package com.haroot.mvc;

public class AskDTO
{
	/*
	 	ASK_CODE  ASK_CATE_CODE ASK_CATE_CONTENT SID_CODE ASK_DATE ASK_TITLE  ASK_CONTENT
 		ASK_PHOTO ASK_STATE_CODE ASK_STATE_CONTENT ASK_READ
	 */
	
	private int ask_code;
	
	private String ask_cate_code, ask_cate_content, sid_code, ask_date, ask_title
				 , ask_content, ask_photo, ask_state_code, ask_state_content, ask_read;
	
	
	// getter / setter
	public int getAsk_code()
	{
		return ask_code;
	}

	public void setAsk_code(int ask_code)
	{
		this.ask_code = ask_code;
	}

	public String getAsk_cate_code()
	{
		return ask_cate_code;
	}

	public void setAsk_cate_code(String ask_cate_code)
	{
		this.ask_cate_code = ask_cate_code;
	}

	public String getAsk_cate_content()
	{
		return ask_cate_content;
	}

	public void setAsk_cate_content(String ask_cate_content)
	{
		this.ask_cate_content = ask_cate_content;
	}

	public String getSid_code()
	{
		return sid_code;
	}

	public void setSid_code(String sid_code)
	{
		this.sid_code = sid_code;
	}

	public String getAsk_date()
	{
		return ask_date;
	}

	public void setAsk_date(String ask_date)
	{
		this.ask_date = ask_date;
	}

	public String getAsk_title()
	{
		return ask_title;
	}

	public void setAsk_title(String ask_title)
	{
		this.ask_title = ask_title;
	}

	public String getAsk_content()
	{
		return ask_content;
	}

	public void setAsk_content(String ask_content)
	{
		this.ask_content = ask_content;
	}

	public String getAsk_photo()
	{
		return ask_photo;
	}

	public void setAsk_photo(String ask_photo)
	{
		this.ask_photo = ask_photo;
	}

	public String getAsk_state_code()
	{
		return ask_state_code;
	}

	public void setAsk_state_code(String ask_state_code)
	{
		this.ask_state_code = ask_state_code;
	}

	public String getAsk_state_content()
	{
		return ask_state_content;
	}

	public void setAsk_state_content(String ask_state_content)
	{
		this.ask_state_content = ask_state_content;
	}

	public String getAsk_read()
	{
		return ask_read;
	}

	public void setAsk_read(String ask_read)
	{
		this.ask_read = ask_read;
	}
	
	
}

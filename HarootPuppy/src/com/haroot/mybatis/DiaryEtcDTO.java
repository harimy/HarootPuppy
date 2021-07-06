/*================
 - DiaryEtcDTO.java
=================*/

package com.haroot.mvc;

public class DiaryEtcDTO
{
	private String etc_code
				 , etc_title
				 , etc_content;

	private DiaryCommonDTO common;
	
	// getter / setter
	public String getEtc_code()
	{
		return etc_code;
	}

	public void setEtc_code(String etc_code)
	{
		this.etc_code = etc_code;
	}

	public String getEtc_title()
	{
		return etc_title;
	}

	public void setEtc_title(String etc_title)
	{
		this.etc_title = etc_title;
	}

	public String getEtc_content()
	{
		return etc_content;
	}

	public void setEtc_content(String etc_content)
	{
		this.etc_content = etc_content;
	}

	public DiaryCommonDTO getCommon()
	{
		return common;
	}

	public void setCommon(DiaryCommonDTO common)
	{
		this.common = common;
	}
	
}

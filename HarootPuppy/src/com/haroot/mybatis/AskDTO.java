/*================
 - AskDTO.java
=================*/

package com.haroot.mybatis;

public class AskDTO
{
	// 고객지원(고객문의) 
	// 닉네임 속성 추가
	/*
	 	ASK_CODE, ASK_CATE_CODE, ASK_CATE_CONTENT, SID_CODE, MEM_NICKNAME, ASK_DATE
	, ASK_TITLE, ASK_CONTENT, ASK_PHOTO, ASK_STATE_CODE, ASK_STATE_CONTENT, ASK_READ  
	 */
	
	private String ask_code // 고객문의코드
   , ask_cate_code         // 문의카테고리코드
   , ask_cate_content      // 문의카테고리내용
   , sid_code              // 작성자(회원코드)
   , mem_nickname          // 작성자닉네임
   , ask_date              // 문의날짜
   , ask_title             // 문의제목
   , ask_content           // 문의내용
   , ask_photo             // 문의사진
   , ask_state_code        // 문의처리상태코드
   , ask_state_content     // 문의처리상태내용 (미처리, 답변완료)
   , ask_read;              // 열람날짜

	public String getAsk_code()
	{
		return ask_code;
	}

	public void setAsk_code(String ask_code)
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

	public String getMem_nickname()
	{
		return mem_nickname;
	}

	public void setMem_nickname(String mem_nickname)
	{
		this.mem_nickname = mem_nickname;
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

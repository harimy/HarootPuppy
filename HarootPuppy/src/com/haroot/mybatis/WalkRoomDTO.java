package com.haroot.mybatis;

public class WalkRoomDTO
{

	/*
	WALKROOM_CODE, WALKROOM_LEADER, AUTO_CODE
     , STYLE_CONTENT, BITE_CONTENT, DESEX_CONTENT, SAMESEX_CONTENT
     , WALKROOM_MIN, WALKROOM_MAX, WALKROOM_START, WALKROOM_END
     , WALKROOM_TITLE, WALKROOM_WORDS, WALKROOM_PLACE, WALKROOM_LATITUDE, WALKROOM_LONGITUDE, WALKROOM_GENDATE
	*/
	
	// 속성값 구성
	private int walkroom_code, walkroom_min, walkroom_max;
	
	private String walkroom_leader, auto_code
	, style_content, bite_content, desex_content, samesex_content
    , walkroom_start, walkroom_end, start_time, end_time
    , walkroom_title, walkroom_words
    , walkroom_place, walkroom_latitude, walkroom_longitude
    , walkroom_gendate, mem_nickname, parti_count;

	// getter / setter 구성
	public int getWalkroom_code()
	{
		return walkroom_code;
	}

	public void setWalkroom_code(int walkroom_code)
	{
		this.walkroom_code = walkroom_code;
	}

	public int getWalkroom_min()
	{
		return walkroom_min;
	}

	public void setWalkroom_min(int walkroom_min)
	{
		this.walkroom_min = walkroom_min;
	}

	public int getWalkroom_max()
	{
		return walkroom_max;
	}

	public void setWalkroom_max(int walkroom_max)
	{
		this.walkroom_max = walkroom_max;
	}

	public String getWalkroom_leader()
	{
		return walkroom_leader;
	}

	public void setWalkroom_leader(String walkroom_leader)
	{
		this.walkroom_leader = walkroom_leader;
	}

	public String getAuto_code()
	{
		return auto_code;
	}

	public void setAuto_code(String auto_code)
	{
		this.auto_code = auto_code;
	}

	public String getStyle_content()
	{
		return style_content;
	}

	public void setStyle_content(String style_content)
	{
		this.style_content = style_content;
	}

	public String getBite_content()
	{
		return bite_content;
	}

	public void setBite_content(String bite_content)
	{
		this.bite_content = bite_content;
	}

	public String getDesex_content()
	{
		return desex_content;
	}

	public void setDesex_content(String desex_content)
	{
		this.desex_content = desex_content;
	}

	public String getSamesex_content()
	{
		return samesex_content;
	}

	public void setSamesex_content(String samesex_content)
	{
		this.samesex_content = samesex_content;
	}

	public String getWalkroom_start()
	{
		return walkroom_start;
	}

	public void setWalkroom_start(String walkroom_start)
	{
		this.walkroom_start = walkroom_start;
	}

	public String getWalkroom_end()
	{
		return walkroom_end;
	}

	public void setWalkroom_end(String walkroom_end)
	{
		this.walkroom_end = walkroom_end;
	}

	public String getStart_time()
	{
		return start_time;
	}

	public void setStart_time(String start_time)
	{
		this.start_time = start_time;
	}

	public String getEnd_time()
	{
		return end_time;
	}

	public void setEnd_time(String end_time)
	{
		this.end_time = end_time;
	}

	public String getWalkroom_title()
	{
		return walkroom_title;
	}

	public void setWalkroom_title(String walkroom_title)
	{
		this.walkroom_title = walkroom_title;
	}

	public String getWalkroom_words()
	{
		return walkroom_words;
	}

	public void setWalkroom_words(String walkroom_words)
	{
		this.walkroom_words = walkroom_words;
	}

	public String getWalkroom_place()
	{
		return walkroom_place;
	}

	public void setWalkroom_place(String walkroom_place)
	{
		this.walkroom_place = walkroom_place;
	}

	public String getWalkroom_latitude()
	{
		return walkroom_latitude;
	}

	public void setWalkroom_latitude(String walkroom_latitude)
	{
		this.walkroom_latitude = walkroom_latitude;
	}

	public String getWalkroom_longitude()
	{
		return walkroom_longitude;
	}

	public void setWalkroom_longitude(String walkroom_longitude)
	{
		this.walkroom_longitude = walkroom_longitude;
	}

	public String getWalkroom_gendate()
	{
		return walkroom_gendate;
	}

	public void setWalkroom_gendate(String walkroom_gendate)
	{
		this.walkroom_gendate = walkroom_gendate;
	}

	public String getMem_nickname()
	{
		return mem_nickname;
	}

	public void setMem_nickname(String mem_nickname)
	{
		this.mem_nickname = mem_nickname;
	}

	public String getParti_count()
	{
		return parti_count;
	}

	public void setParti_count(String parti_count)
	{
		this.parti_count = parti_count;
	}

	
	
}

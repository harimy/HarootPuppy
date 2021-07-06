package com.haroot.mybatis;

public class WalkRoomDTO
{

	/*
	WALKROOM_CODE, WALKROOM_LEADER, AUTO_CODE
     , STYLE_CODE, BITE_CODE, DESEX_CODE, SAMESEX_CODE
     , WALKROOM_MIN, WALKROOM_MAX, WALKROOM_START, WALKROOM_END
     , WALKROOM_TITLE, WALKROOM_WORDS, WALKROOM_PLACE, WALKROOM_LATITUDE, WALKROOM_LONGITUDE, WALKROOM_GENDATE
	*/
	
	// 속성값 구성
	private int walkroom_code, walkroom_min, walkroom_max;
	
	private String walkroom_leader, auto_code
    , style_code, bite_code, desex_code, samesex_code
    , walkroom_start, walkroom_end, walkroom_title, walkroom_words
    , walkroom_place, walkroom_latitude, walkroom_longitude, walkroom_gendate;

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

	public String getStyle_code()
	{
		return style_code;
	}

	public void setStyle_code(String style_code)
	{
		this.style_code = style_code;
	}

	public String getBite_code()
	{
		return bite_code;
	}

	public void setBite_code(String bite_code)
	{
		this.bite_code = bite_code;
	}

	public String getDesex_code()
	{
		return desex_code;
	}

	public void setDesex_code(String desex_code)
	{
		this.desex_code = desex_code;
	}

	public String getSamesex_code()
	{
		return samesex_code;
	}

	public void setSamesex_code(String samesex_code)
	{
		this.samesex_code = samesex_code;
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

	
}

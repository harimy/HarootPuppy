package com.haroot.mybatis;

public interface DiaryViewDAO
{
	public DiaryViewDTO searchTimeline(String relation_code, String daily_date);
}

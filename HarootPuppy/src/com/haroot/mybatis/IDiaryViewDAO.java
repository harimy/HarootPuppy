package com.haroot.mybatis;

public interface IDiaryViewDAO
{
	public DiaryViewDTO searchTimeline(String relation_code, String daily_date);
}

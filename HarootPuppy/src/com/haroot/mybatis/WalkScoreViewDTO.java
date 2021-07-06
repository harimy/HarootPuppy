package com.haroot.mybatis;

public class WalkScoreViewDTO {

	public String sid_code, eval_avg, rewards, walk_score;

	public String getSid_code()
	{
		return sid_code;
	}

	public void setSid_code(String sid_code)
	{
		this.sid_code = sid_code;
	}

	public String getEval_avg()
	{
		return eval_avg;
	}

	public void setEval_avg(String eval_avg)
	{
		this.eval_avg = eval_avg;
	}

	public String getRewards()
	{
		return rewards;
	}

	public void setRewards(String rewards)
	{
		this.rewards = rewards;
	}

	public String getWalk_score()
	{
		return walk_score;
	}

	public void setWalk_score(String walk_score)
	{
		this.walk_score = walk_score;
	}
}

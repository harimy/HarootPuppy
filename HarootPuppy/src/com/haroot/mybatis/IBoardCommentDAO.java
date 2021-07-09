package com.haroot.mybatis;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

public interface IBoardCommentDAO
{
	// 댓글 조회
	public ArrayList<BoardCommentDTO> commView(@Param("num") int num
							  , @Param("nickname") String nickname);
}

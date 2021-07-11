package com.haroot.mybatis;

public class AdminReportDTO
{
	// 새로 추가한 속성이 있어서 ab_0706.ver로 모두 덮어씌울것!
   // 속성 구성
   private String rep_log_code 			// 신고내역코드					
   , rep_type_code							// 신고유형코드
   , rep_type_content						// 신고유형내용 
   , sid_code									// 신고회원식별번호(신고자)
   , reporter_nickname						// 신고자 닉네임
   , rep_log_date								// 신고날짜
   , rep_state_code							// 신고처리상태코드
   , rep_state_content						// 신고처리상태내용
   , rep_log_read                      // 열람날짜

   // 아별 추가 
   , log_read_state                    // 게시물 열람유무 (○,Ⅹ)
   
   , walkcomm_rep_code                 // 산책방 댓글신고코드
   , walk_comm_writer                  // 산책방 댓글작성자 (피신고자)
   , boardcomm_rep_code                // 게시판 댓글신고코드
   , board_comm_writer                 // 게시판 댓글작성자 (피신고자)
   , board_comm_code                   // 게시판댓글코드
   , board_comm_content                // 게시판댓글내용
   
   , board_rep_code                    // 게시물 신고코드
   , board_code                        // 게시물 코드(숫자)
   , board_writer                      // 게시물 작성자 (피신고자)
   , board_title                       // 게시물 제목
   , board_content                     // 게시물 내용
   
   , walkroom_rep_code                 // 산책방 신고코드
   , walkroom_code                     // 산책방 코드
   , walkroom_title                    // 산책방 제목
   , walkroom_words                    // 산책방 내용
   , walkroom_leader                   // 산책방 방장 (피신고자)
   , off_rep_code                      // 오프라인신고코드
   , participants_code                 // 참여자코드(오프라인신고-피신고자)
   , walk_comm_content;						// 산책방 댓글

   
   // getter / setter 구성
	
	public String getRep_log_code()
	{
		return rep_log_code;
	}

	public void setRep_log_code(String rep_log_code)
	{
		this.rep_log_code = rep_log_code;
	}

	public String getRep_type_code()
	{
		return rep_type_code;
	}

	public void setRep_type_code(String rep_type_code)
	{
		this.rep_type_code = rep_type_code;
	}

	public String getRep_type_content()
	{
		return rep_type_content;
	}

	public void setRep_type_content(String rep_type_content)
	{
		this.rep_type_content = rep_type_content;
	}

	public String getSid_code()
	{
		return sid_code;
	}

	public void setSid_code(String sid_code)
	{
		this.sid_code = sid_code;
	}

	public String getReporter_nickname()
	{
		return reporter_nickname;
	}

	public void setReporter_nickname(String reporter_nickname)
	{
		this.reporter_nickname = reporter_nickname;
	}

	public String getRep_log_date()
	{
		return rep_log_date;
	}

	public void setRep_log_date(String rep_log_date)
	{
		this.rep_log_date = rep_log_date;
	}

	public String getRep_state_code()
	{
		return rep_state_code;
	}

	public void setRep_state_code(String rep_state_code)
	{
		this.rep_state_code = rep_state_code;
	}

	public String getRep_state_content()
	{
		return rep_state_content;
	}

	public void setRep_state_content(String rep_state_content)
	{
		this.rep_state_content = rep_state_content;
	}

	public String getRep_log_read()
	{
		return rep_log_read;
	}

	public void setRep_log_read(String rep_log_read)
	{
		this.rep_log_read = rep_log_read;
	}

	public String getWalkcomm_rep_code()
	{
		return walkcomm_rep_code;
	}

	public void setWalkcomm_rep_code(String walkcomm_rep_code)
	{
		this.walkcomm_rep_code = walkcomm_rep_code;
	}

	public String getWalk_comm_writer()
	{
		return walk_comm_writer;
	}

	public void setWalk_comm_writer(String walk_comm_writer)
	{
		this.walk_comm_writer = walk_comm_writer;
	}

	public String getBoardcomm_rep_code()
	{
		return boardcomm_rep_code;
	}

	public void setBoardcomm_rep_code(String boardcomm_rep_code)
	{
		this.boardcomm_rep_code = boardcomm_rep_code;
	}

	public String getBoard_comm_writer()
	{
		return board_comm_writer;
	}

	public void setBoard_comm_writer(String board_comm_writer)
	{
		this.board_comm_writer = board_comm_writer;
	}

	public String getBoard_comm_code()
	{
		return board_comm_code;
	}

	public void setBoard_comm_code(String board_comm_code)
	{
		this.board_comm_code = board_comm_code;
	}

	public String getBoard_comm_content()
	{
		return board_comm_content;
	}

	public void setBoard_comm_content(String board_comm_content)
	{
		this.board_comm_content = board_comm_content;
	}

	public String getBoard_rep_code()
	{
		return board_rep_code;
	}

	public void setBoard_rep_code(String board_rep_code)
	{
		this.board_rep_code = board_rep_code;
	}

	public String getBoard_code()
	{
		return board_code;
	}

	public void setBoard_code(String board_code)
	{
		this.board_code = board_code;
	}

	public String getBoard_writer()
	{
		return board_writer;
	}

	public void setBoard_writer(String board_writer)
	{
		this.board_writer = board_writer;
	}

	public String getBoard_title()
	{
		return board_title;
	}

	public void setBoard_title(String board_title)
	{
		this.board_title = board_title;
	}

	public String getBoard_content()
	{
		return board_content;
	}

	public void setBoard_content(String board_content)
	{
		this.board_content = board_content;
	}

	public String getWalkroom_rep_code()
	{
		return walkroom_rep_code;
	}

	public void setWalkroom_rep_code(String walkroom_rep_code)
	{
		this.walkroom_rep_code = walkroom_rep_code;
	}

	public String getWalkroom_code()
	{
		return walkroom_code;
	}

	public void setWalkroom_code(String walkroom_code)
	{
		this.walkroom_code = walkroom_code;
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

	public String getWalkroom_leader()
	{
		return walkroom_leader;
	}

	public void setWalkroom_leader(String walkroom_leader)
	{
		this.walkroom_leader = walkroom_leader;
	}

	public String getOff_rep_code()
	{
		return off_rep_code;
	}

	public void setOff_rep_code(String off_rep_code)
	{
		this.off_rep_code = off_rep_code;
	}

	public String getParticipants_code()
	{
		return participants_code;
	}

	public void setParticipants_code(String participants_code)
	{
		this.participants_code = participants_code;
	}

	public String getWalk_comm_content()
	{
		return walk_comm_content;
	}

	public void setWalk_comm_content(String walk_comm_content)
	{
		this.walk_comm_content = walk_comm_content;
	}

	public String getLog_read_state()
	{
		return log_read_state;
	}

	public void setLog_read_state(String log_read_state)
	{
		this.log_read_state = log_read_state;
	}
   
   
}


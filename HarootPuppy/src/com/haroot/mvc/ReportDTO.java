package com.haroot.mvc;

public class ReportDTO
{
   // 속성 구성
   private String rep_log_code                        // 신고내역코드
               , rep_type_code, rep_type_content      // 신고유형코드, 신고유형내용
               , rep_log_writer    , sid_code            // 신고자, 피신고자
               , rep_log_date                           // 신고날짜
               , rep_state_code, rep_state_content      // 처리상태코드, 처리상태내용
               , rep_log_read                           // 열람날짜
               , walkCommon_rep_code                  // 산책방댓글신고코드
               , boardComm_rep_code                     // 게시글댓글신고코드
               , board_rep_code                        // 게시글신고코드
               , walkRoom_rep_code                     // 산책방신고코드
               , off_rep_code                           // 오프라인신고코드
               , walk_comm_writer                     // 산책방 댓글 작성자코드
               , board_comm_writer                     // 게시판 댓글 작성자코드
               , board_writer                           // 게시글 작성자코드
               , walkroom_leader                        // 산책방 방장코드
               , participants_code;                     // 산책방참여자코드

   
   // getter / setter 생성
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

   public String getRep_log_writer()
   {
      return rep_log_writer;
   }

   public void setRep_log_writer(String rep_log_writer)
   {
      this.rep_log_writer = rep_log_writer;
   }

   public String getSid_code()
   {
      return sid_code;
   }

   public void setSid_code(String sid_code)
   {
      this.sid_code = sid_code;
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

   public String getWalkCommon_rep_code()
   {
      return walkCommon_rep_code;
   }

   public void setWalkCommon_rep_code(String walkCommon_rep_code)
   {
      this.walkCommon_rep_code = walkCommon_rep_code;
   }

   public String getBoardComm_rep_code()
   {
      return boardComm_rep_code;
   }

   public void setBoardComm_rep_code(String boardComm_rep_code)
   {
      this.boardComm_rep_code = boardComm_rep_code;
   }

   public String getBoard_rep_code()
   {
      return board_rep_code;
   }

   public void setBoard_rep_code(String board_rep_code)
   {
      this.board_rep_code = board_rep_code;
   }

   public String getWalkRoom_rep_code()
   {
      return walkRoom_rep_code;
   }

   public void setWalkRoom_rep_code(String walkRoom_rep_code)
   {
      this.walkRoom_rep_code = walkRoom_rep_code;
   }

   public String getOff_rep_code()
   {
      return off_rep_code;
   }

   public void setOff_rep_code(String off_rep_code)
   {
      this.off_rep_code = off_rep_code;
   }

   public String getWalk_comm_writer()
   {
      return walk_comm_writer;
   }

   public void setWalk_comm_writer(String walk_comm_writer)
   {
      this.walk_comm_writer = walk_comm_writer;
   }

   public String getBoard_comm_writer()
   {
      return board_comm_writer;
   }

   public void setBoard_comm_writer(String board_comm_writer)
   {
      this.board_comm_writer = board_comm_writer;
   }

   public String getBoard_writer()
   {
      return board_writer;
   }

   public void setBoard_writer(String board_writer)
   {
      this.board_writer = board_writer;
   }

   public String getWalkroom_leader()
   {
      return walkroom_leader;
   }

   public void setWalkroom_leader(String walkroom_leader)
   {
      this.walkroom_leader = walkroom_leader;
   }

   public String getParticipants_code()
   {
      return participants_code;
   }

   public void setParticipants_code(String participants_code)
   {
      this.participants_code = participants_code;
   }
   
   
}
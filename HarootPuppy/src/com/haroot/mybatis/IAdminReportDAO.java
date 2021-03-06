/*=======================
 - IAdminReportDAO.java
 - 인터페이스
=======================*/

package com.haroot.mybatis;

import java.sql.SQLException;
import java.util.ArrayList;

public interface IAdminReportDAO
{
	// 신고처리상태  
	// 미처리 : not handled : not
	// 신고해제 : cancel
	// 신고확정 : confirm
	
	// 미처리된 게시판 게시물 수 조회
	public int boardNotHandled() throws SQLException;
	
	// 미처리된 게시판 댓글 수 조회
	public int boardCommNotHandled() throws SQLException;
	
	// 미처리된 산책메이트 산책방 수 조회
	public int walkNotHandled() throws SQLException;
	
	// 미처리된 산책메이트 신고 산책방 댓글 수 조회
	public int walkCommNotHandled() throws SQLException;
	
	// 미처리된 산책메이트 오프라인신고(무단결석) 수 조회
	public int walkOffNotHandled() throws SQLException;
	
	// 답변 대기중인 고객지원(고객문의) 게시물 수 조회
	public int askNotHandled() throws SQLException;
	
	// 게시판 신고 리스트 (관리자입장) 조회 - 전체
	public ArrayList<AdminReportDTO> adBoardReportList() throws SQLException;
	// 게시판 신고 리스트 (관리자입장) 조회 - 미처리
	public ArrayList<AdminReportDTO> adBoardReportList1() throws SQLException;
	// 게시판 신고 리스트 (관리자입장) 조회 - 신고해제
	public ArrayList<AdminReportDTO> adBoardReportList2() throws SQLException;
	// 게시판 신고 리스트 (관리자입장) 조회 - 신고확정
	public ArrayList<AdminReportDTO> adBoardReportList3() throws SQLException;
	
	// 산책메이트 방신고(온라인) 리스트 (관리자입장) 조회
	public ArrayList<AdminReportDTO> adWalkroomReportList() throws SQLException;
	
	// 읽지않은 게시판 > 신고된 게시물 수 조회
	public int boardNotRead() throws SQLException;
	
	// 읽지 않은 산책방 > 신고된 산책방 수 조회
	public int walkNotRead() throws SQLException;
	
	// 읽지 않은 오프라인신고 의견 수 조회
	public int offNotRead() throws SQLException;
	
	// 특정 신고번호 데이터 조회
	public AdminReportDTO search(String rep_log_code) throws SQLException;
	
	//-- 신고 처리
	public int handleReport(AdminReportDTO dto) throws SQLException;
	
	

}

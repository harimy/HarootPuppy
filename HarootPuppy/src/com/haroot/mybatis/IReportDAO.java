package com.haroot.mvc;

import java.util.ArrayList;

public interface IReportDAO
{
	// 내가 받은 신고 리스트 (사용자입장)

	public ArrayList<ReportDTO> myReceiveReport() ;
	
	// 내가 접수한 신고 리스트 (사용자입장)
	public ArrayList<ReportDTO> mySendReport();
	
	// 게시판 신고 리스트 (관리자입장)
	public ArrayList<ReportDTO> adBoardReport();
	
	// 게시판댓글 신고 리스트 (관리자입장)
	public ArrayList<ReportDTO> adBoardCommReport();
	
	// 산책메이트 방신고(온라인) 리스트 (관리자입장)
	public ArrayList<ReportDTO> adWalkroomReport();
	
	// 산책메이트 오프라인신고 리스트 (관리자입장)
	public ArrayList<ReportDTO> adWalkOfflineReport();
	
	
}

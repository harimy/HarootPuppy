package com.haroot.mybatis;

import java.util.ArrayList;

public interface IAdminOfflineDAO
{
	
	// 무단결석 의견 리스트 확인
	public ArrayList<AdminOfflineDTO> list();

}

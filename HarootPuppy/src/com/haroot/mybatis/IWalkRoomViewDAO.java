package com.haroot.mvc;

import java.sql.SQLException;
import java.util.ArrayList;

public interface IWalkRoomViewDAO {
	
	public ArrayList<WalkRoomViewDTO> list() throws SQLException;

}
